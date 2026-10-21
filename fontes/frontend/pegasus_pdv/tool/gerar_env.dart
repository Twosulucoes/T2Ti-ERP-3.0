// Gera o arquivo .env cifrado que o PDV lê em modo release.
// Uso: dart run tool/gerar_env.dart ENDERECO_SERVIDOR=https://... PORTA_SERVIDOR=443 ...
// Usa a mesma chave e o mesmo vetor de Constantes.
import 'dart:io';
import 'package:encrypt/encrypt.dart';

void main(List<String> argumentos) {
  final encrypter = Encrypter(AES(Key.fromUtf8('#Sua-Chave-de-32-caracteres-aqui'), mode: AESMode.ctr, padding: null));
  final iv = IV.fromUtf8('#Seu-Vetor-aqui#');
  final linhas = <String>[];
  for (final argumento in argumentos) {
    final posicao = argumento.indexOf('=');
    final nome = argumento.substring(0, posicao);
    final valor = argumento.substring(posicao + 1);
    linhas.add('$nome=${encrypter.encrypt(valor, iv: iv).base64}');
  }
  File('.env').writeAsStringSync(linhas.join('\n'));
}
