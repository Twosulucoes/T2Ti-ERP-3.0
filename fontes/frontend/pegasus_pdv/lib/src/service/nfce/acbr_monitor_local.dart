/*
Title: T2Ti ERP 3.0
Description: Emissão da NFC-e pelo ACBrMonitor instalado no próprio computador do caixa

The MIT License

Copyright: Copyright (C) 2021 T2Ti.COM

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

       The author may be contacted at:
           t2ti.com@gmail.com

@author Albert Eije (alberteije@gmail.com)
@version 1.0.0
*******************************************************************************/
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:ini/ini.dart';
import 'package:pegasus_pdv/src/infra/infra.dart';
import 'package:pegasus_pdv/src/model/model.dart';

/// Faz no próprio caixa o mesmo que o servidor da retaguarda fazia (AcbrMonitorService.php):
/// conversa com o ACBrMonitor pelos arquivos ent.txt/sai.txt da pasta dele.
/// No ACBrMonitor, deixe marcada a opção de monitorar a pasta (TXT) com esses dois arquivos.
/// Os métodos devolvem o mesmo que o NfceService devolvia: Uint8List com o PDF do DANFE,
/// String com a mensagem de erro, ou o texto de retorno do monitor.
class AcbrMonitorLocal {
  static String get _pasta {
    final pasta = Constantes.caminhoAcbrMonitor;
    return pasta.endsWith('\\') ? pasta : '$pasta\\';
  }

  static File get _arquivoEntrada => File('${_pasta}ent.txt');
  static File get _arquivoSaida => File('${_pasta}sai.txt');

  static Future<dynamic> emitirNfce(String nfceBase64, String numero) async {
    try {
      final caminhoIni = await _salvarIni(nfceBase64, numero);
      final caminhoXml = await _executar('NFE.CriarNFe($caminhoIni)', 'ARQUIVO-XML');
      if (caminhoXml.contains('ERRO')) return caminhoXml;
      final retornoEnvio = await _executar('NFE.EnviarNFe($caminhoXml, 001, , , , 1, , )', 'Envio');
      if (retornoEnvio.contains('ERRO')) return retornoEnvio;
      return await _gerarPdf(caminhoXml);
    } catch (e) {
      return '[ERRO] - ${e.toString()}';
    }
  }

  static Future<dynamic> emitirNfceContingencia(String nfceBase64, String numero) async {
    try {
      final caminhoIni = await _salvarIni(nfceBase64, numero);
      await _executar('NFE.SetFormaEmissao(9)', '');
      try {
        final caminhoXml = await _executar('NFE.CriarNFe($caminhoIni)', 'ARQUIVO-XML');
        if (caminhoXml.contains('ERRO')) return caminhoXml;
        return await _gerarPdf(caminhoXml);
      } finally {
        await _executar('NFE.SetFormaEmissao(1)', '');
      }
    } catch (e) {
      return '[ERRO] - ${e.toString()}';
    }
  }

  static Future<dynamic> transmitirNfceContingenciada(String chave) async {
    try {
      final caminhoXml = await _localizarXml(chave);
      if (caminhoXml == null) return '[ERRO] - XML da nota $chave não encontrado na pasta do ACBrMonitor.';
      final retornoEnvio = await _executar('NFE.EnviarNFe($caminhoXml, 001, , , , 1, , )', 'Envio');
      if (retornoEnvio.contains('ERRO')) return retornoEnvio;
      return await _gerarPdf(caminhoXml);
    } catch (e) {
      return '[ERRO] - ${e.toString()}';
    }
  }

  static Future<dynamic> gerarPdfDanfe(String chave) async {
    try {
      final caminhoXml = await _localizarXml(chave);
      if (caminhoXml == null) return '[ERRO] - XML da nota $chave não encontrado na pasta do ACBrMonitor.';
      return await _gerarPdf(caminhoXml);
    } catch (e) {
      return '[ERRO] - ${e.toString()}';
    }
  }

  static Future<String> tratarNotaAnteriorContingencia(ObjetoNfe objetoNfe) async {
    try {
      final caminhoXml = await _localizarXml(objetoNfe.chaveAcesso ?? '');
      if (caminhoXml == null) return '[ERRO] - XML da nota ${objetoNfe.chaveAcesso} não encontrado na pasta do ACBrMonitor.';
      final retorno = await _executar('NFE.ConsultarNFe($caminhoXml)', 'Consulta');
      if (retorno.contains('ERRO')) return retorno;
      // se a nota anterior foi autorizada ela é cancelada, senão o número é inutilizado
      if (retorno.contains('Autorizado')) {
        return await cancelarNota(objetoNfe);
      }
      return await inutilizarNumeroNfce(objetoNfe);
    } catch (e) {
      return '[ERRO] - ${e.toString()}';
    }
  }

  static Future<String> inutilizarNumeroNfce(ObjetoNfe objetoNfe) async {
    try {
      return await _executar('NFE.InutilizarNFe(${objetoNfe.cnpj}, ${objetoNfe.justificativa}, ${objetoNfe.ano}, '
          '${objetoNfe.modelo}, ${objetoNfe.serie}, ${objetoNfe.numeroInicial}, ${objetoNfe.numeroFinal})', 'Inutilizacao');
    } catch (e) {
      return '[ERRO] - ${e.toString()}';
    }
  }

  static Future<String> cancelarNota(ObjetoNfe objetoNfe) async {
    try {
      return await _executar('NFE.CancelarNFe(${objetoNfe.chaveAcesso}, ${objetoNfe.justificativa}, ${objetoNfe.cnpj})', 'Cancelamento');
    } catch (e) {
      return '[ERRO] - ${e.toString()}';
    }
  }

  static Future<bool> atualizarCertificadoDigital(String arquivoBase64, String senha) async {
    try {
      final arquivoCertificado = File('$_pasta${Sessao.empresa!.cnpj}.pfx');
      await arquivoCertificado.writeAsBytes(base64.decode(arquivoBase64), flush: true);
      final retorno = await _executar('NFE.SetCertificado(${arquivoCertificado.path},$senha)', '');
      return !retorno.contains('ERRO');
    } catch (e) {
      return false;
    }
  }

  static Future<Uint8List?> baixarArquivosXml(String periodo) async {
    final pastaPeriodo = Directory('${_pasta}DFes\\$periodo');
    if (!await pastaPeriodo.exists()) return null;
    final arquivoZip = File('${_pasta}NotasFiscaisNFCe_$periodo.zip');
    final resultado = await Process.run('powershell', [
      '-NoProfile', '-Command',
      'Compress-Archive -Path "${pastaPeriodo.path}\\*" -DestinationPath "${arquivoZip.path}" -Force'
    ]);
    if (resultado.exitCode != 0 || !await arquivoZip.exists()) return null;
    return await arquivoZip.readAsBytes();
  }

  /// grava no ACBrMonitor.ini as opções da tela de configuração da NFC-e,
  /// como o servidor fazia em NfeConfiguracaoService::configurarArquivoIniMonitor
  static Future<NfeConfiguracaoModel?> atualizarConfiguracoesMonitor(NfeConfiguracaoModel nfeConfiguracao) async {
    try {
      final arquivoIni = File('${_pasta}ACBrMonitor.ini');
      final config = await arquivoIni.exists() ? Config.fromString(await arquivoIni.readAsString(encoding: latin1)) : Config();
      void gravar(String secao, String chave, String? valor) {
        if (valor == null) return;
        if (!config.hasSection(secao)) config.addSection(secao);
        config.set(secao, chave, valor);
      }
      String simNao(String? valor) => valor == 'S' ? '1' : '0';
      String decimal(double? valor) => (valor ?? 0).toString().replaceAll('.', ',');

      nfeConfiguracao.caminhoSalvarPdf = '${_pasta}PDF';
      nfeConfiguracao.caminhoSalvarXml = '${_pasta}DFes';

      // tpAmb 1=produção 2=homologação; o monitor usa o índice do radiogroup (0 ou 1)
      gravar('WebService', 'Ambiente', ((nfeConfiguracao.webserviceAmbiente ?? 2) - 1).toString());
      gravar('WebService', 'UF', Sessao.empresa!.uf);
      if ((nfeConfiguracao.respTecHashCsrt ?? '0') != '0') gravar('RespTecnico', 'CSRT', nfeConfiguracao.respTecHashCsrt);
      if ((nfeConfiguracao.respTecIdCsrt ?? '0') != '0') gravar('RespTecnico', 'idCSRT', nfeConfiguracao.respTecIdCsrt);
      gravar('NFCe', 'IdToken', nfeConfiguracao.nfceIdCsc);
      gravar('NFCe', 'Token', nfeConfiguracao.nfceCsc);
      gravar('NFCe', 'ModoImpressaoEvento', nfeConfiguracao.nfceModeloImpressao == 'A4' ? '0' : '1');
      gravar('NFCe', 'ImprimirItem1Linha', simNao(nfeConfiguracao.nfceImprimirItensUmaLinha));
      gravar('NFCe', 'ImprimirDescAcresItem', simNao(nfeConfiguracao.nfceImprimirDescontoPorItem));
      gravar('NFCe', 'QRCodeLateral', simNao(nfeConfiguracao.nfceImprimirQrcodeLateral));
      gravar('NFCe', 'UsaCodigoEanImpressao', simNao(nfeConfiguracao.nfceImprimirGtin));
      gravar('NFCe', 'ImprimeNomeFantasia', simNao(nfeConfiguracao.nfceImprimirNomeFantasia));
      gravar('NFCe', 'ExibeTotalTributosItem', simNao(nfeConfiguracao.nfceImpressaoTributos));
      gravar('DANFCe', 'MargemInf', decimal(nfeConfiguracao.nfceMargemInferior));
      gravar('DANFCe', 'MargemSup', decimal(nfeConfiguracao.nfceMargemSuperior));
      gravar('DANFCe', 'MargemDir', decimal(nfeConfiguracao.nfceMargemDireita));
      gravar('DANFCe', 'MargemEsq', decimal(nfeConfiguracao.nfceMargemEsquerda));
      gravar('DANFCe', 'LarguraBobina', nfeConfiguracao.nfceResolucaoImpressao?.toString());
      gravar('FonteLinhaItem', 'Size', nfeConfiguracao.nfceTamanhoFonteItem?.toString());
      gravar('DANFE', 'PathPDF', nfeConfiguracao.caminhoSalvarPdf);
      gravar('DANFE', 'DecimaisQTD', Constantes.decimaisQuantidade.toString());
      gravar('DANFE', 'DecimaisValor', Constantes.decimaisValor.toString());
      gravar('Arquivos', 'PathNFe', nfeConfiguracao.caminhoSalvarXml);
      gravar('Arquivos', 'PathInu', '${_pasta}Inutilizacao');
      gravar('Arquivos', 'PathDPEC', '${_pasta}EPEC');

      await arquivoIni.writeAsString(config.toString(), encoding: latin1, flush: true);
      return nfeConfiguracao;
    } catch (e) {
      return null;
    }
  }

  static Future<String> _salvarIni(String nfceBase64, String numero) async {
    final pastaIni = Directory('${_pasta}ini\\nfce');
    await pastaIni.create(recursive: true);
    final arquivoIni = File('${pastaIni.path}\\$numero.ini');
    await arquivoIni.writeAsBytes(base64.decode(nfceBase64), flush: true);
    return arquivoIni.path;
  }

  static Future<dynamic> _gerarPdf(String caminhoXml) async {
    final caminhoPdf = await _executar('NFE.ImprimirDANFEPDF($caminhoXml, , , 1,)', 'ARQUIVO-PDF');
    if (caminhoPdf.contains('ERRO')) return caminhoPdf;
    final arquivoPdf = File(caminhoPdf);
    if (!await arquivoPdf.exists()) return '[ERRO] - PDF do DANFE não encontrado em $caminhoPdf';
    return await arquivoPdf.readAsBytes();
  }

  /// procura o XML da nota pela chave em qualquer subpasta do ACBrMonitor
  static Future<String?> _localizarXml(String chave) async {
    final pasta = Directory(_pasta);
    if (chave.isEmpty || !await pasta.exists()) return null;
    await for (final entidade in pasta.list(recursive: true, followLinks: false)) {
      if (entidade is File && entidade.path.endsWith('$chave-nfe.xml')) return entidade.path;
    }
    return null;
  }

  /// escreve o comando no ent.txt, espera o sai.txt e interpreta o retorno como o servidor fazia
  static Future<String> _executar(String comando, String operacao) async {
    if (await _arquivoSaida.exists()) await _arquivoSaida.delete();
    await _arquivoEntrada.writeAsString(comando, encoding: latin1, flush: true);

    var tempoEspera = 0;
    while (!await _arquivoSaida.exists()) {
      await Future.delayed(const Duration(seconds: 1));
      tempoEspera++;
      if (tempoEspera > Constantes.tempoEsperaAcbrMonitor) {
        return '[ERRO] - [12002] O ACBrMonitor não respondeu. Verifique se ele está aberto e monitorando a pasta $_pasta';
      }
    }
    // o monitor pode ainda estar gravando o arquivo
    await Future.delayed(const Duration(milliseconds: 300));
    final conteudo = (await _arquivoSaida.readAsString(encoding: latin1)).trim();

    if (operacao == 'ARQUIVO-XML') {
      if (!conteudo.startsWith('OK')) return '[ERRO] - $conteudo';
      return conteudo.replaceFirst('OK:', '').trim();
    }
    if (operacao == 'ARQUIVO-PDF') {
      if (!conteudo.startsWith('OK')) return '[ERRO] - $conteudo';
      return conteudo.replaceFirst('OK:', '').replaceFirst('Arquivo criado em:', '').trim();
    }
    if (operacao == 'Inutilizacao' || operacao.isEmpty) {
      return conteudo.startsWith('ERRO') ? '[ERRO] - $conteudo' : conteudo;
    }

    // Envio, Cancelamento e Consulta: lê CStat e XMotivo da seção correspondente
    String? codigoStatus;
    String? motivo;
    try {
      final secoes = Config.fromString(conteudo.substring(conteudo.indexOf('[')));
      codigoStatus = secoes.get(operacao, 'CStat');
      motivo = secoes.get(operacao, 'XMotivo');
    } catch (_) {
      // sem seção: o monitor devolveu só uma linha de erro
    }
    if (conteudo.startsWith('ERRO') && codigoStatus == null) return '[ERRO] - $conteudo';
    const listaStatus = ['', '100', '102', '135'];
    if (!listaStatus.contains(codigoStatus ?? '')) {
      return '[ERRO] - [$codigoStatus] $motivo';
    }
    return motivo ?? conteudo;
  }
}
