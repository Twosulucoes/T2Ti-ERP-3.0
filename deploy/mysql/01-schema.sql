-- Gerado automaticamente a partir de artefatos/der/fenix.mwb
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

CREATE TABLE IF NOT EXISTS `adm_modulo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` CHAR(3),
  `nome` VARCHAR(100),
  `descricao` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `adm_parametro` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fin_parcela_aberto` INT,
  `fin_parcela_quitado` INT,
  `fin_parcela_quitado_parcial` INT,
  `fin_tipo_recebimento_edi` INT,
  `compra_fin_doc_origem` INT,
  `compra_conta_caixa` INT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `agenda_categoria_compromisso` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100),
  `cor` VARCHAR(50),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `agenda_compromisso` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_agenda_categoria_compromisso` INT NOT NULL,
  `id_colaborador` INT NOT NULL,
  `data_compromisso` DATE,
  `hora` VARCHAR(8),
  `duracao` INT,
  `onde` VARCHAR(100),
  `descricao` VARCHAR(100),
  `tipo` CHAR(1),
  PRIMARY KEY (`id`),
  KEY `FK_CATEGORIA_COMPROMISSO` (`id_agenda_categoria_compromisso`),
  KEY `fk_AGENDA_COMPROMISSO_COLABORADOR1_idx` (`id_colaborador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `agenda_compromisso_convidado` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_agenda_compromisso` INT NOT NULL,
  `id_colaborador` INT NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_COMPROMISSO_CONVIDADO` (`id_agenda_compromisso`),
  KEY `fk_AGENDA_COMPROMISSO_CONVIDADO_COLABORADOR1_idx` (`id_colaborador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `agenda_notificacao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_agenda_compromisso` INT NOT NULL,
  `data_notificacao` DATE,
  `hora` VARCHAR(8),
  `tipo` INT,
  PRIMARY KEY (`id`),
  KEY `FK_COMPROMISSO_NOTIFICACAO` (`id_agenda_compromisso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `aidf_aimdf` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `numero` INT,
  `data_validade` DATE,
  `data_autorizacao` DATE,
  `numero_autorizacao` VARCHAR(20),
  `formulario_disponivel` CHAR(1),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `almoxarifado` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `auditoria` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data_registro` DATE,
  `hora_registro` VARCHAR(8),
  `janela_controller` VARCHAR(50),
  `acao` VARCHAR(50),
  `conteudo` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `banco` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(10),
  `nome` VARCHAR(100),
  `url` VARCHAR(250),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `banco_agencia` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_banco` INT NOT NULL,
  `numero` VARCHAR(20),
  `digito` CHAR(1),
  `nome` VARCHAR(100),
  `telefone` VARCHAR(15),
  `contato` VARCHAR(100),
  `observacao` VARCHAR(250),
  `gerente` VARCHAR(100),
  PRIMARY KEY (`id`),
  KEY `fk_BANCO_AGENCIA_BANCO1_idx` (`id_banco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `banco_conta_caixa` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_banco_agencia` INT,
  `numero` VARCHAR(20),
  `digito` CHAR(1),
  `nome` VARCHAR(100),
  `tipo` CHAR(1),
  `descricao` VARCHAR(250),
  PRIMARY KEY (`id`),
  KEY `fk_BANCO_CONTA_CAIXA_BANCO_AGENCIA1_idx` (`id_banco_agencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `bpe_agencia` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_bpe_cabecalho` INT NOT NULL,
  `cnpj` VARCHAR(14),
  `nome` VARCHAR(60),
  `telefone` VARCHAR(14),
  `logradouro` VARCHAR(250),
  `numero` VARCHAR(60),
  `complemento` VARCHAR(60),
  `bairro` VARCHAR(60),
  `codigo_municipio` INT,
  `nome_municipio` VARCHAR(60),
  `uf` CHAR(2),
  `cep` VARCHAR(8),
  `codigo_pais` INT,
  `nome_pais` VARCHAR(60),
  `email` VARCHAR(60),
  PRIMARY KEY (`id`),
  KEY `FK_CTE_CAB_DESTINATARIO` (`id_bpe_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `bpe_cabecalho` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `uf_emitente` INT,
  `ambiente` CHAR(1),
  `modelo` CHAR(2),
  `serie` CHAR(3),
  `numero` VARCHAR(9),
  `codigo_numerico` VARCHAR(8),
  `chave_acesso` VARCHAR(44),
  `digito_chave_acesso` CHAR(1),
  `modal` CHAR(2),
  `data_hora_emissao` TIMESTAMP,
  `tipo_emissao` CHAR(1),
  `versao_processo_emissao` VARCHAR(20),
  `tipo_bpe` CHAR(1),
  `consumidor_presenca` CHAR(1),
  `uf_inicio_viagem` CHAR(2),
  `codigo_municipio_inicio_viagem` INT,
  `uf_fim_viagem` CHAR(2),
  `codigo_municipio_fim_viagem` INT,
  `valor_bilhete` DECIMAL(18,6),
  `valor_desconto` DECIMAL(18,6),
  `valor_pago` DECIMAL(18,6),
  `valor_troco` DECIMAL(18,6),
  `tipo_desconto` CHAR(2),
  `desconto_descricao` VARCHAR(100),
  `desconto_concedido_outros` VARCHAR(20),
  `forma_pagamento` CHAR(2),
  `forma_pagamento_outros` VARCHAR(100),
  `forma_pagamento_documento` VARCHAR(20),
  `cst` CHAR(2),
  `base_calculo_icms` DECIMAL(18,6),
  `aliquota_icms` DECIMAL(18,6),
  `valor_icms` DECIMAL(18,6),
  `percentual_reducao_bc_icms` DECIMAL(18,6),
  `informacoes_add_fisco` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `bpe_comprador` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_bpe_cabecalho` INT NOT NULL,
  `cnpj` VARCHAR(14),
  `cpf` VARCHAR(11),
  `ie` VARCHAR(20),
  `nome` VARCHAR(60),
  `fantasia` VARCHAR(60),
  `telefone` VARCHAR(14),
  `logradouro` VARCHAR(250),
  `numero` VARCHAR(60),
  `complemento` VARCHAR(60),
  `bairro` VARCHAR(60),
  `codigo_municipio` INT,
  `nome_municipio` VARCHAR(60),
  `uf` CHAR(2),
  `cep` VARCHAR(8),
  `codigo_pais` INT,
  `nome_pais` VARCHAR(60),
  `email` VARCHAR(60),
  PRIMARY KEY (`id`),
  KEY `FK_CTE_CAB_REMETENTE` (`id_bpe_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `bpe_emitente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_bpe_cabecalho` INT NOT NULL,
  `cnpj` VARCHAR(14),
  `ie` VARCHAR(14),
  `iest` VARCHAR(14),
  `im` VARCHAR(15),
  `cnae` VARCHAR(7),
  `crt` INT,
  `nome` VARCHAR(60),
  `fantasia` VARCHAR(60),
  `logradouro` VARCHAR(60),
  `numero` VARCHAR(60),
  `complemento` VARCHAR(60),
  `bairro` VARCHAR(60),
  `codigo_municipio` INT,
  `nome_municipio` VARCHAR(60),
  `uf` CHAR(2),
  `cep` VARCHAR(8),
  `telefone` VARCHAR(14),
  PRIMARY KEY (`id`),
  KEY `FK_CTE_CAB_EMITENTE` (`id_bpe_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `bpe_passageiro` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_bpe_cabecalho` INT NOT NULL,
  `nome` VARCHAR(60),
  `cpf` VARCHAR(11),
  `tipo_documento_identificacao` CHAR(1),
  `numero_documento` VARCHAR(20),
  `documento_outros_descricao` VARCHAR(100),
  `data_nascimento` DATE,
  `telefone` VARCHAR(12),
  `email` VARCHAR(60),
  PRIMARY KEY (`id`),
  KEY `FK_CTE_CAB_TOMADOR` (`id_bpe_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `bpe_passagem` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_bpe_cabecalho` INT NOT NULL,
  `codigo_localidade_origem` VARCHAR(7),
  `descricao_localidade_origem` VARCHAR(60),
  `codigo_localidade_destino` VARCHAR(7),
  `descricao_localidade_destino` VARCHAR(60),
  `data_hora_embarque` TIMESTAMP,
  `data_hora_validade` TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_CTE_CAB_CARGA` (`id_bpe_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `bpe_viagem` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_bpe_cabecalho` INT NOT NULL,
  `codigo_percurso` VARCHAR(20),
  `descricao_percurso` VARCHAR(100),
  `tipo_viagem` CHAR(2),
  `tipo_servico` CHAR(1),
  `tipo_acomodacao` CHAR(1),
  `tipo_trecho` CHAR(1),
  `data_hora_viagem` TIMESTAMP,
  `data_hora_conexao` TIMESTAMP,
  `prefixo_linha` VARCHAR(20),
  `poltrona` CHAR(3),
  `plataforma` VARCHAR(10),
  PRIMARY KEY (`id`),
  KEY `FK_CTE_CAB_EXPEDIDOR` (`id_bpe_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `cargo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100),
  `descricao` VARCHAR(250),
  `salario` DECIMAL(18,6),
  `cbo_1994` VARCHAR(10),
  `cbo_2002` VARCHAR(10),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `cbo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(10),
  `codigo_1994` VARCHAR(10),
  `nome` VARCHAR(250),
  `observacao` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `centro_resultado` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_plano_centro_resultado` INT NOT NULL,
  `classificacao` VARCHAR(30),
  `descricao` VARCHAR(100),
  `sofre_rateiro` CHAR(1),
  PRIMARY KEY (`id`),
  KEY `FK_PLANO_CENTRO` (`id_plano_centro_resultado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `cep` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `numero` VARCHAR(8),
  `logradouro` VARCHAR(100),
  `complemento` VARCHAR(100),
  `bairro` VARCHAR(100),
  `municipio` VARCHAR(100),
  `uf` CHAR(2),
  `codigo_ibge_municipio` INT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `cfop` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` INT,
  `descricao` VARCHAR(1000),
  `aplicacao` VARCHAR(1000),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `cheque` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_talonario_cheque` INT NOT NULL,
  `numero` INT,
  `status_cheque` CHAR(1),
  `data_status` DATE,
  PRIMARY KEY (`id`),
  KEY `FK_TALONARIO_CHEQUE` (`id_talonario_cheque`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `cliente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_pessoa` INT NOT NULL,
  `id_tabela_preco` INT,
  `desde` DATE,
  `data_cadastro` DATE,
  `taxa_desconto` DECIMAL(18,6),
  `limite_credito` DECIMAL(18,6),
  `observacao` VARCHAR(250),
  PRIMARY KEY (`id`),
  KEY `fk_CLIENTE_PESSOA_idx` (`id_pessoa`),
  KEY `fk_CLIENTE_TABELA_PRECO1_idx` (`id_tabela_preco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `cnae` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(7),
  `denominacao` VARCHAR(1000),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `codigo_gps` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` INT,
  `descricao` VARCHAR(250),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `cod_apuracao_receita_dacon` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_codigo_apuracao_efd` INT NOT NULL,
  `id_tipo_receita_dacon` INT NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_TIPO_REC_DACON` (`id_tipo_receita_dacon`),
  KEY `FK_COD_APURA_DACON` (`id_codigo_apuracao_efd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `colaborador` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_pessoa` INT NOT NULL,
  `id_cargo` INT,
  `id_setor` INT,
  `id_colaborador_situacao` INT,
  `id_tipo_admissao` INT,
  `id_colaborador_tipo` INT,
  `id_sindicato` INT,
  `matricula` VARCHAR(10),
  `data_cadastro` DATE,
  `data_admissao` DATE,
  `data_demissao` DATE,
  `ctps_numero` VARCHAR(10),
  `ctps_serie` VARCHAR(10),
  `ctps_data_expedicao` DATE,
  `ctps_uf` CHAR(2),
  `observacao` VARCHAR(250),
  PRIMARY KEY (`id`),
  KEY `fk_COLABORADOR_PESSOA1_idx` (`id_pessoa`),
  KEY `fk_COLABORADOR_CARGO1_idx` (`id_cargo`),
  KEY `fk_COLABORADOR_SETOR1_idx` (`id_setor`),
  KEY `fk_COLABORADOR_COLABORADOR_SITUACAO1_idx` (`id_colaborador_situacao`),
  KEY `fk_COLABORADOR_TIPO_ADMISSAO1_idx` (`id_tipo_admissao`),
  KEY `fk_COLABORADOR_COLABORADOR_TIPO1_idx` (`id_colaborador_tipo`),
  KEY `fk_COLABORADOR_SINDICATO1_idx` (`id_sindicato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `colaborador_relacionamento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_tipo_relacionamento` INT NOT NULL,
  `id_colaborador` INT NOT NULL,
  `nome` VARCHAR(100),
  `data_nascimento` DATE,
  `cpf` VARCHAR(11),
  `registro_matricula` VARCHAR(50),
  `registro_cartorio` VARCHAR(50),
  `registro_cartorio_numero` VARCHAR(50),
  `registro_numero_livro` VARCHAR(10),
  `registro_numero_folha` VARCHAR(10),
  `data_entrega_documento` DATE,
  `salario_familia` CHAR(1),
  `salario_familia_idade_limite` INT,
  `salario_familia_data_fim` DATE,
  `imposto_renda_idade_limite` INT,
  `imposto_renda_data_fim` INT,
  PRIMARY KEY (`id`),
  KEY `FK_TIPO_REL_COLABORADOR` (`id_tipo_relacionamento`),
  KEY `fk_COLABORADOR_RELACIONAMENTO_COLABORADOR1_idx` (`id_colaborador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `colaborador_situacao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` CHAR(3),
  `nome` VARCHAR(100),
  `descricao` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `colaborador_tipo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(20),
  `descricao` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `comissao_objetivo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_comissao_perfil` INT NOT NULL,
  `id_produto` INT NOT NULL,
  `codigo` CHAR(3),
  `nome` VARCHAR(100),
  `descricao` TEXT,
  `forma_pagamento` CHAR(1),
  `taxa_pagamento` DECIMAL(18,6),
  `valor_pagamento` DECIMAL(18,6),
  `valor_meta` DECIMAL(18,6),
  `quantidade` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_COMISSAO_PERFIL_OBJETIVO` (`id_comissao_perfil`),
  KEY `fk_COMISSAO_OBJETIVO_PRODUTO1_idx` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `comissao_perfil` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` CHAR(3),
  `nome` VARCHAR(100),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `compra_cotacao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_compra_requisicao` INT NOT NULL,
  `data_cotacao` DATE,
  `descricao` VARCHAR(100),
  PRIMARY KEY (`id`),
  KEY `fk_COMPRA_COTACAO_COMPRA_REQUISICAO1_idx` (`id_compra_requisicao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `compra_cotacao_detalhe` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_compra_fornecedor_cotacao` INT NOT NULL,
  `id_produto` INT NOT NULL,
  `quantidade` DECIMAL(18,6),
  `valor_unitario` DECIMAL(18,6),
  `valor_subtotal` DECIMAL(18,6),
  `taxa_desconto` DECIMAL(18,6),
  `valor_desconto` DECIMAL(18,6),
  `valor_total` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_FORNECEDOR_COTACAO_DETALHE` (`id_compra_fornecedor_cotacao`),
  KEY `fk_COMPRA_COTACAO_DETALHE_PRODUTO1_idx` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `compra_fornecedor_cotacao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_compra_cotacao` INT NOT NULL,
  `id_fornecedor` INT NOT NULL,
  `codigo` VARCHAR(32),
  `prazo_entrega` VARCHAR(50),
  `venda_condicoes_pagamento` VARCHAR(50),
  `valor_subtotal` DECIMAL(18,6),
  `taxa_desconto` DECIMAL(18,6),
  `valor_desconto` DECIMAL(18,6),
  `valor_total` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_COTACAO_FORNECEDOR` (`id_compra_cotacao`),
  KEY `fk_COMPRA_FORNECEDOR_COTACAO_FORNECEDOR1_idx` (`id_fornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `compra_pedido` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_compra_tipo_pedido` INT NOT NULL,
  `id_fornecedor` INT NOT NULL,
  `id_colaborador` INT NOT NULL,
  `data_pedido` DATE,
  `data_prevista_entrega` DATE,
  `data_previsao_pagamento` DATE,
  `local_entrega` VARCHAR(100),
  `local_cobranca` VARCHAR(100),
  `contato` VARCHAR(50),
  `valor_subtotal` DECIMAL(18,6),
  `taxa_desconto` DECIMAL(18,6),
  `valor_desconto` DECIMAL(18,6),
  `valor_total` DECIMAL(18,6),
  `tipo_frete` CHAR(1),
  `forma_pagamento` CHAR(1),
  `base_calculo_icms` DECIMAL(18,6),
  `valor_icms` DECIMAL(18,6),
  `base_calculo_icms_st` DECIMAL(18,6),
  `valor_icms_st` DECIMAL(18,6),
  `valor_total_produtos` DECIMAL(18,6),
  `valor_frete` DECIMAL(18,6),
  `valor_seguro` DECIMAL(18,6),
  `valor_outras_despesas` DECIMAL(18,6),
  `valor_ipi` DECIMAL(18,6),
  `valor_total_nf` DECIMAL(18,6),
  `quantidade_parcelas` INT,
  `dia_primeiro_vencimento` CHAR(2),
  `intervalo_entre_parcelas` INT,
  `dia_fixo_parcela` CHAR(2),
  `codigo_cotacao` VARCHAR(32),
  PRIMARY KEY (`id`),
  KEY `FK_TIPO_PEDIDO_COMPRA` (`id_compra_tipo_pedido`),
  KEY `fk_COMPRA_PEDIDO_FORNECEDOR1_idx` (`id_fornecedor`),
  KEY `fk_COMPRA_PEDIDO_COLABORADOR1_idx` (`id_colaborador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `compra_pedido_detalhe` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_compra_pedido` INT NOT NULL,
  `id_produto` INT NOT NULL,
  `quantidade` DECIMAL(18,6),
  `valor_unitario` DECIMAL(18,6),
  `valor_subtotal` DECIMAL(18,6),
  `taxa_desconto` DECIMAL(18,6),
  `valor_desconto` DECIMAL(18,6),
  `valor_total` DECIMAL(18,6),
  `cst` CHAR(2),
  `csosn` CHAR(3),
  `cfop` INT,
  `base_calculo_icms` DECIMAL(18,6),
  `valor_icms` DECIMAL(18,6),
  `valor_ipi` DECIMAL(18,6),
  `aliquota_icms` DECIMAL(18,6),
  `aliquota_ipi` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_PEDIDO_COMPRA_DETALHE` (`id_compra_pedido`),
  KEY `fk_COMPRA_PEDIDO_DETALHE_PRODUTO1_idx` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `compra_requisicao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_compra_tipo_requisicao` INT NOT NULL,
  `id_colaborador` INT NOT NULL,
  `descricao` VARCHAR(100),
  `data_requisicao` DATE,
  `observacao` TEXT,
  PRIMARY KEY (`id`),
  KEY `FK_TIPO_REQ_COMPRA` (`id_compra_tipo_requisicao`),
  KEY `fk_COMPRA_REQUISICAO_COLABORADOR1_idx` (`id_colaborador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `compra_requisicao_detalhe` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_compra_requisicao` INT NOT NULL,
  `id_produto` INT NOT NULL,
  `quantidade` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_REQUISICAO_COMPRA_DETALHE` (`id_compra_requisicao`),
  KEY `fk_COMPRA_REQUISICAO_DETALHE_PRODUTO1_idx` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `compra_tipo_pedido` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` CHAR(2),
  `nome` VARCHAR(30),
  `descricao` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `compra_tipo_requisicao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` CHAR(2),
  `nome` VARCHAR(30),
  `descricao` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `contabil_conta` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_plano_conta` INT NOT NULL,
  `id_contabil_conta` INT,
  `id_plano_conta_ref_sped` INT NOT NULL,
  `classificacao` VARCHAR(30),
  `tipo` CHAR(1),
  `descricao` VARCHAR(100),
  `data_inclusao` DATE,
  `situacao` CHAR(1),
  `natureza` CHAR(1),
  `patrimonio_resultado` CHAR(1),
  `livro_caixa` CHAR(1),
  `dfc` CHAR(1),
  `ordem` VARCHAR(20),
  `codigo_reduzido` VARCHAR(10),
  `codigo_efd` CHAR(2),
  PRIMARY KEY (`id`),
  KEY `FK_CONTA_SPED_CONTA` (`id_plano_conta_ref_sped`),
  KEY `FK_CONTABIL_CONTA_CONTA` (`id_contabil_conta`),
  KEY `FK_PLANO_CONTA_CONTA` (`id_plano_conta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `contabil_conta_rateio` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_centro_resultado` INT NOT NULL,
  `id_contabil_conta` INT NOT NULL,
  `porcento_rateio` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_CONTABIL_CONTA_RATEIO` (`id_contabil_conta`),
  KEY `FK_CENTRO_RESULTADO_RATEIO` (`id_centro_resultado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `contabil_dre_cabecalho` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(100),
  `padrao` CHAR(1),
  `periodo_inicial` VARCHAR(7),
  `periodo_final` VARCHAR(7),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `contabil_dre_detalhe` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_contabil_dre_cabecalho` INT NOT NULL,
  `classificacao` VARCHAR(30),
  `descricao` VARCHAR(100),
  `forma_calculo` CHAR(1),
  `sinal` CHAR(1),
  `natureza` CHAR(1),
  `valor` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_DRE_CAB_DET` (`id_contabil_dre_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `contabil_encerramento_exe_cab` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data_inicio` DATE,
  `data_fim` DATE,
  `data_inclusao` DATE,
  `motivo` VARCHAR(100),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `contabil_encerramento_exe_det` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_contabil_conta` INT NOT NULL,
  `id_contabil_encerramento_exe` INT NOT NULL,
  `saldo_anterior` DECIMAL(18,6),
  `valor_debito` DECIMAL(18,6),
  `valor_credito` DECIMAL(18,6),
  `saldo` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_ENC_EXE_CAB_DET` (`id_contabil_encerramento_exe`),
  KEY `FK_CONTABIL_CONTA_ENC_DET` (`id_contabil_conta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `contabil_fechamento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data_inicio` DATE,
  `data_fim` DATE,
  `criterio_lancamento` CHAR(1),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `contabil_historico` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(100),
  `historico` VARCHAR(250),
  `pede_complemento` CHAR(1),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `contabil_indice` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `indice` VARCHAR(50),
  `periodicidade` CHAR(1) NOT NULL,
  `diario_a_partir_de` DATE,
  `mensal_mes_ano` VARCHAR(7),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `contabil_indice_valor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_contabil_indice` INT NOT NULL,
  `data_indice` DATE,
  `valor` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_CONTABIL_INDICE_VALOR` (`id_contabil_indice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `contabil_lancamento_cabecalho` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_contabil_lote` INT,
  `data_lancamento` DATE,
  `data_inclusao` DATE,
  `tipo` CHAR(4),
  `liberado` CHAR(1),
  `valor` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_LOTE_LANC_CAB` (`id_contabil_lote`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `contabil_lancamento_detalhe` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_contabil_conta` INT NOT NULL,
  `id_contabil_historico` INT,
  `id_contabil_lancamento_cab` INT NOT NULL,
  `historico` VARCHAR(250),
  `valor` DECIMAL(18,6),
  `tipo` CHAR(1),
  PRIMARY KEY (`id`),
  KEY `FK_CONTABIL_LANCAMENTO` (`id_contabil_lancamento_cab`),
  KEY `FK_HIST_LANCAMENTO` (`id_contabil_historico`),
  KEY `FK_CONTA_LANCAMENTO` (`id_contabil_conta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `contabil_lancamento_orcado` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_contabil_conta` INT NOT NULL,
  `ano` CHAR(4),
  `janeiro` DECIMAL(18,6),
  `fevereiro` DECIMAL(18,6),
  `marco` DECIMAL(18,6),
  `abril` DECIMAL(18,6),
  `maio` DECIMAL(18,6),
  `junho` DECIMAL(18,6),
  `julho` DECIMAL(18,6),
  `agosto` DECIMAL(18,6),
  `setembro` DECIMAL(18,6),
  `outubro` DECIMAL(18,6),
  `novembro` DECIMAL(18,6),
  `dezembro` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_CONTA_LANC_ORCADO` (`id_contabil_conta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `contabil_lancamento_padrao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(100),
  `historico` VARCHAR(250),
  `id_conta_debito` INT,
  `id_conta_credito` INT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `contabil_livro` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(50),
  `competencia` VARCHAR(7),
  `forma_escrituracao` CHAR(1),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `contabil_lote` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(100),
  `liberado` CHAR(1),
  `data_inclusao` DATE,
  `data_liberacao` DATE,
  `programado` CHAR(1),
  `valor` DECIMAL(18,6),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `contabil_parametro` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `mascara` VARCHAR(30),
  `niveis` INT,
  `informar_conta_por` CHAR(1),
  `compartilha_plano_conta` CHAR(1),
  `compartilha_historicos` CHAR(1),
  `altera_lancamento_outro` CHAR(1),
  `historico_obrigatorio` CHAR(1),
  `permite_lancamento_zerado` CHAR(1),
  `gera_informativo_sped` CHAR(1),
  `sped_forma_escrit_diario` CHAR(3),
  `sped_nome_livro_diario` VARCHAR(100),
  `assinatura_direita` TEXT,
  `assinatura_esquerda` TEXT,
  `conta_ativo` VARCHAR(30),
  `conta_passivo` VARCHAR(30),
  `conta_patrimonio_liquido` VARCHAR(30),
  `conta_depreciacao_acumulada` VARCHAR(30),
  `conta_capital_social` VARCHAR(30),
  `conta_resultado_exercicio` VARCHAR(30),
  `conta_prejuizo_acumulado` VARCHAR(30),
  `conta_lucro_acumulado` VARCHAR(30),
  `conta_titulo_pagar` VARCHAR(30),
  `conta_titulo_receber` VARCHAR(30),
  `conta_juros_passivo` VARCHAR(30),
  `conta_juros_ativo` VARCHAR(30),
  `conta_desconto_obtido` VARCHAR(30),
  `conta_desconto_concedido` VARCHAR(30),
  `conta_cmv` VARCHAR(30),
  `conta_venda` VARCHAR(30),
  `conta_venda_servico` VARCHAR(30),
  `conta_estoque` VARCHAR(30),
  `conta_apura_resultado` VARCHAR(30),
  `conta_juros_apropriar` VARCHAR(30),
  `id_hist_padrao_resultado` INT,
  `id_hist_padrao_lucro` INT,
  `id_hist_padrao_prejuizo` INT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `contabil_termo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_contabil_livro` INT NOT NULL,
  `abertura_encerramento` CHAR(1),
  `numero` INT,
  `pagina_inicial` INT,
  `pagina_final` INT,
  `registrado` VARCHAR(100),
  `numero_registro` VARCHAR(50),
  `data_despacho` DATE,
  `data_abertura` DATE,
  `data_encerramento` DATE,
  `escrituracao_inicio` DATE,
  `escrituracao_fim` DATE,
  `texto` TEXT,
  PRIMARY KEY (`id`),
  KEY `FK_CONTABIL_LIVRO_TERMO` (`id_contabil_livro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `contador` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_pessoa` INT NOT NULL,
  `crc_inscricao` VARCHAR(15),
  `crc_uf` CHAR(2),
  PRIMARY KEY (`id`),
  KEY `fk_CONTADOR_PESSOA1_idx` (`id_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `contrato` (
  `id` INT NOT NULL,
  `id_solicitacao_servico` INT NOT NULL,
  `id_tipo_contrato` INT NOT NULL,
  `numero` VARCHAR(50),
  `nome` VARCHAR(100),
  `descricao` TEXT,
  `data_cadastro` DATE,
  `data_inicio_vigencia` DATE,
  `data_fim_vigencia` DATE,
  `dia_faturamento` CHAR(2),
  `valor` DECIMAL(18,6),
  `quantidade_parcelas` INT,
  `intervalo_entre_parcelas` INT,
  `observacao` TEXT,
  `classificacao_contabil_conta` VARCHAR(30),
  PRIMARY KEY (`id`),
  KEY `FK_TIPO_CONTRATO_CONTRATO` (`id_tipo_contrato`),
  KEY `FK_SOL_SERVICO_CONTRATO` (`id_solicitacao_servico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `contrato_historico_reajuste` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_contrato` INT NOT NULL,
  `indice` DECIMAL(18,6),
  `valor_anterior` DECIMAL(18,6),
  `valor_atual` DECIMAL(18,6),
  `data_reajuste` DATE,
  `observacao` TEXT,
  PRIMARY KEY (`id`),
  KEY `FK_CONTRATO_HISTORICO_REAJUSTE` (`id_contrato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `contrato_hist_faturamento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_contrato` INT NOT NULL,
  `data_fatura` DATE,
  `valor` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_CONTRATO_HIST_FATURAMENTO` (`id_contrato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `contrato_prev_faturamento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_contrato` INT NOT NULL,
  `data_prevista` DATE,
  `valor` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_CONTRATO_PREV_FATURAMENTO` (`id_contrato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `contrato_solicitacao_servico` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_contrato_tipo_servico` INT NOT NULL,
  `id_setor` INT NOT NULL,
  `id_colaborador` INT NOT NULL,
  `id_cliente` INT,
  `id_fornecedor` INT,
  `data_solicitacao` DATE,
  `data_desejada_inicio` DATE,
  `urgente` CHAR(1),
  `status_solicitacao` CHAR(1),
  `descricao` VARCHAR(100),
  PRIMARY KEY (`id`),
  KEY `FK_CONTRATO_TIPO_SERVICO_SOL` (`id_contrato_tipo_servico`),
  KEY `fk_CONTRATO_SOLICITACAO_SERVICO_SETOR1_idx` (`id_setor`),
  KEY `fk_CONTRATO_SOLICITACAO_SERVICO_COLABORADOR1_idx` (`id_colaborador`),
  KEY `fk_CONTRATO_SOLICITACAO_SERVICO_CLIENTE1_idx` (`id_cliente`),
  KEY `fk_CONTRATO_SOLICITACAO_SERVICO_FORNECEDOR1_idx` (`id_fornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `contrato_template` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100),
  `descricao` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `contrato_tipo_servico` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50),
  `descricao` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `contrib_sind_patronal_cab` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_sindicato` INT NOT NULL,
  `vigencia_ano` CHAR(4),
  PRIMARY KEY (`id`),
  KEY `FK_SIND_PATRO_CONTR` (`id_sindicato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `contrib_sind_patronal_det` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_contrib_sind_patronal_cab` INT NOT NULL,
  `de` DECIMAL(18,6),
  `ate` DECIMAL(18,6),
  `percentual` DECIMAL(18,6),
  `valor_adicionar` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_CONTR_SIND_PATRONAL` (`id_contrib_sind_patronal_cab`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `crm_buscas_cliente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data_busca` DATE,
  `hora_busca` VARCHAR(8),
  `detalhes` TEXT,
  `id_cliente` INT NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_CRM_BUSCAS_CLIENTE_CLIENTE1_idx` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `crm_carteira_cliente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_crm_carteira_cliente_perfil` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_CRM_CARTEIRA_CLIENTE_CRM_CARTEIRA_CLIENTE_PERFIL1_idx` (`id_crm_carteira_cliente_perfil`),
  KEY `fk_CRM_CARTEIRA_CLIENTE_CLIENTE1_idx` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `crm_carteira_cliente_perfil` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` CHAR(2),
  `nome` VARCHAR(100),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `crm_sac_cabecalho` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data_abertura` DATE,
  `hora_abertura` VARCHAR(8),
  `numero_protocolo` VARCHAR(100),
  `nivel_reclamacao` CHAR(1),
  `id_cliente` INT NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_CRM_SAC_CABECALHO_CLIENTE1_idx` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `crm_sac_detalhe` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_crm_sac_cabecalho` INT NOT NULL,
  `data_registro` DATE,
  `hora_registro` VARCHAR(8),
  `historico` TEXT,
  PRIMARY KEY (`id`),
  KEY `fk_CRM_SAC_DETALHE_CRM_SAC_CABECALHO1_idx` (`id_crm_sac_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `csosn` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` CHAR(3),
  `descricao` VARCHAR(250),
  `observacao` VARCHAR(1000),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `cst_cofins` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` CHAR(2),
  `descricao` VARCHAR(250),
  `observacao` VARCHAR(250),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `cst_icms` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` CHAR(2),
  `descricao` VARCHAR(250),
  `observacao` VARCHAR(250),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `cst_ipi` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` CHAR(2),
  `descricao` VARCHAR(250),
  `observacao` VARCHAR(250),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `cst_pis` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` CHAR(2),
  `descricao` VARCHAR(250),
  `observacao` VARCHAR(250),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `cte_aereo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_cte_cabecalho` INT NOT NULL,
  `numero_minuta` INT,
  `numero_conhecimento` INT,
  `data_prevista_entrega` DATE,
  `id_emissor` VARCHAR(20),
  `id_interna_tomador` VARCHAR(14),
  `tarifa_classe` CHAR(1),
  `tarifa_codigo` VARCHAR(4),
  `tarifa_valor` DECIMAL(18,6),
  `carga_dimensao` VARCHAR(14),
  `carga_informacao_manuseio` CHAR(1),
  `carga_especial` CHAR(3),
  PRIMARY KEY (`id`),
  KEY `FK_CTE_CAB_AEREO` (`id_cte_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `cte_aquaviario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_cte_cabecalho` INT NOT NULL,
  `valor_prestacao` DECIMAL(18,6),
  `afrmm` DECIMAL(18,6),
  `numero_booking` VARCHAR(10),
  `numero_controle` VARCHAR(10),
  `id_navio` VARCHAR(60),
  PRIMARY KEY (`id`),
  KEY `FK_CTE_CAB_AQUAVIARIO` (`id_cte_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `cte_aquaviario_balsa` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_cte_aquaviario` INT NOT NULL,
  `id_balsa` VARCHAR(60),
  `numero_viagem` INT,
  `direcao` CHAR(1),
  `porto_embarque` VARCHAR(60),
  `porto_transbordo` VARCHAR(60),
  `porto_destino` VARCHAR(60),
  `tipo_navegacao` CHAR(1),
  `irin` VARCHAR(10),
  PRIMARY KEY (`id`),
  KEY `FK_CTE_AQUA_BALSA` (`id_cte_aquaviario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `cte_cabecalho` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `uf_emitente` INT,
  `codigo_numerico` VARCHAR(8),
  `cfop` INT,
  `natureza_operacao` VARCHAR(60),
  `forma_pagamento` CHAR(1),
  `modelo` CHAR(2),
  `serie` CHAR(3),
  `numero` VARCHAR(9),
  `data_hora_emissao` TIMESTAMP,
  `formato_impressao_dacte` CHAR(1),
  `tipo_emissao` CHAR(1),
  `chave_acesso` VARCHAR(44),
  `digito_chave_acesso` CHAR(1),
  `ambiente` CHAR(1),
  `tipo_cte` CHAR(1),
  `processo_emissao` CHAR(1),
  `versao_processo_emissao` VARCHAR(20),
  `chave_referenciado` VARCHAR(44),
  `codigo_municipio_envio` INT,
  `nome_municipio_envio` VARCHAR(60),
  `uf_envio` CHAR(2),
  `modal` CHAR(2),
  `tipo_servico` CHAR(1),
  `codigo_municipio_ini_prestacao` INT,
  `nome_municipio_ini_prestacao` VARCHAR(60),
  `uf_ini_prestacao` CHAR(2),
  `codigo_municipio_fim_prestacao` INT,
  `nome_municipio_fim_prestacao` VARCHAR(60),
  `uf_fim_prestacao` CHAR(2),
  `retira` CHAR(1),
  `retira_detalhe` VARCHAR(160),
  `tomador` CHAR(1),
  `data_entrada_contingencia` TIMESTAMP,
  `justificativa_contingencia` VARCHAR(255),
  `carac_adicional_transporte` VARCHAR(15),
  `carac_adicional_servico` VARCHAR(30),
  `funcionario_emissor` VARCHAR(20),
  `fluxo_origem` VARCHAR(15),
  `entrega_tipo_periodo` CHAR(1),
  `entrega_data_programada` DATE,
  `entrega_data_inicial` DATE,
  `entrega_data_final` DATE,
  `entrega_tipo_hora` CHAR(1),
  `entrega_hora_programada` VARCHAR(8),
  `entrega_hora_inicial` VARCHAR(8),
  `entrega_hora_final` VARCHAR(8),
  `municipio_origem_calculo` VARCHAR(40),
  `municipio_destino_calculo` VARCHAR(40),
  `observacoes_gerais` TEXT,
  `valor_total_servico` DECIMAL(18,6),
  `valor_receber` DECIMAL(18,6),
  `cst` CHAR(2),
  `base_calculo_icms` DECIMAL(18,6),
  `aliquota_icms` DECIMAL(18,6),
  `valor_icms` DECIMAL(18,6),
  `percentual_reducao_bc_icms` DECIMAL(18,6),
  `valor_bc_icms_st_retido` DECIMAL(18,6),
  `valor_icms_st_retido` DECIMAL(18,6),
  `aliquota_icms_st_retido` DECIMAL(18,6),
  `valor_credito_presumido_icms` DECIMAL(18,6),
  `percentual_bc_icms_outra_uf` DECIMAL(18,6),
  `valor_bc_icms_outra_uf` DECIMAL(18,6),
  `aliquota_icms_outra_uf` DECIMAL(18,6),
  `valor_icms_outra_uf` DECIMAL(18,6),
  `simples_nacional_indicador` CHAR(1),
  `simples_nacional_total` DECIMAL(18,6),
  `informacoes_add_fisco` TEXT,
  `valor_total_carga` DECIMAL(18,6),
  `produto_predominante` VARCHAR(60),
  `carga_outras_caracteristicas` VARCHAR(30),
  `modal_versao_layout` INT,
  `chave_cte_substituido` VARCHAR(44),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `cte_carga` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_cte_cabecalho` INT NOT NULL,
  `codigo_unidade_medida` CHAR(2),
  `tipo_medida` VARCHAR(20),
  `quantidade` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_CTE_CAB_CARGA` (`id_cte_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `cte_componente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_cte_cabecalho` INT NOT NULL,
  `nome` VARCHAR(15),
  `valor` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_CTE_CAB_COMPONENTE` (`id_cte_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `cte_destinatario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_cte_cabecalho` INT NOT NULL,
  `cnpj` VARCHAR(14),
  `cpf` VARCHAR(11),
  `ie` VARCHAR(20),
  `nome` VARCHAR(60),
  `fantasia` VARCHAR(60),
  `telefone` VARCHAR(14),
  `logradouro` VARCHAR(250),
  `numero` VARCHAR(60),
  `complemento` VARCHAR(60),
  `bairro` VARCHAR(60),
  `codigo_municipio` INT,
  `nome_municipio` VARCHAR(60),
  `uf` CHAR(2),
  `cep` VARCHAR(8),
  `codigo_pais` INT,
  `nome_pais` VARCHAR(60),
  `email` VARCHAR(60),
  PRIMARY KEY (`id`),
  KEY `FK_CTE_CAB_DESTINATARIO` (`id_cte_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `cte_documento_anterior` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_cte_cabecalho` INT NOT NULL,
  `cnpj` VARCHAR(14),
  `cpf` VARCHAR(11),
  `ie` VARCHAR(20),
  `uf` CHAR(2),
  `nome` VARCHAR(60),
  PRIMARY KEY (`id`),
  KEY `FK_CTE_CAB_DOC_ANTERIOR` (`id_cte_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `cte_documento_anterior_id` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_cte_documento_anterior` INT NOT NULL,
  `tipo` CHAR(2),
  `serie` CHAR(3),
  `subserie` CHAR(2),
  `numero` VARCHAR(20),
  `data_emissao` DATE,
  `chave_cte` VARCHAR(44),
  PRIMARY KEY (`id`),
  KEY `FK_CTE_DOC_ANTERIOR_ID` (`id_cte_documento_anterior`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `cte_duplicata` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_cte_cabecalho` INT NOT NULL,
  `numero` VARCHAR(60),
  `data_vencimento` DATE,
  `valor` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_CTE_CAB_DUPLICATA` (`id_cte_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `cte_dutoviario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_cte_cabecalho` INT NOT NULL,
  `valor_tarifa` DECIMAL(18,6),
  `data_inicio` DATE,
  `data_fim` DATE,
  PRIMARY KEY (`id`),
  KEY `FK_CTE_CAB_DUTO` (`id_cte_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `cte_emitente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_cte_cabecalho` INT NOT NULL,
  `cnpj` VARCHAR(14),
  `ie` VARCHAR(14),
  `nome` VARCHAR(60),
  `fantasia` VARCHAR(60),
  `logradouro` VARCHAR(60),
  `numero` VARCHAR(60),
  `complemento` VARCHAR(60),
  `bairro` VARCHAR(60),
  `codigo_municipio` INT,
  `nome_municipio` VARCHAR(60),
  `uf` CHAR(2),
  `cep` VARCHAR(8),
  `telefone` VARCHAR(14),
  PRIMARY KEY (`id`),
  KEY `FK_CTE_CAB_EMITENTE` (`id_cte_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `cte_expedidor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_cte_cabecalho` INT NOT NULL,
  `cnpj` VARCHAR(14),
  `cpf` VARCHAR(11),
  `ie` VARCHAR(20),
  `nome` VARCHAR(60),
  `fantasia` VARCHAR(60),
  `telefone` VARCHAR(14),
  `logradouro` VARCHAR(250),
  `numero` VARCHAR(60),
  `complemento` VARCHAR(60),
  `bairro` VARCHAR(60),
  `codigo_municipio` INT,
  `nome_municipio` VARCHAR(60),
  `uf` CHAR(2),
  `cep` VARCHAR(8),
  `codigo_pais` INT,
  `nome_pais` VARCHAR(60),
  `email` VARCHAR(60),
  PRIMARY KEY (`id`),
  KEY `FK_CTE_CAB_EXPEDIDOR` (`id_cte_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `cte_fatura` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_cte_cabecalho` INT NOT NULL,
  `numero` VARCHAR(60),
  `valor_original` DECIMAL(18,6),
  `valor_desconto` DECIMAL(18,6),
  `valor_liquido` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_CTE_CAB_FATURA` (`id_cte_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `cte_ferroviario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_cte_cabecalho` INT NOT NULL,
  `tipo_trafego` CHAR(1),
  `responsavel_faturamento` CHAR(1),
  `ferrovia_emitente_cte` CHAR(1),
  `fluxo` VARCHAR(10),
  `id_trem` VARCHAR(7),
  `valor_frete` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_CTE_CAB_FERROVIARIO` (`id_cte_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `cte_ferroviario_ferrovia` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_cte_ferroviario` INT NOT NULL,
  `cnpj` VARCHAR(14),
  `codigo_interno` VARCHAR(10),
  `ie` VARCHAR(20),
  `nome` VARCHAR(60),
  `logradouro` VARCHAR(250),
  `numero` VARCHAR(60),
  `complemento` VARCHAR(60),
  `bairro` VARCHAR(60),
  `codigo_municipio` INT,
  `nome_municipio` VARCHAR(60),
  `uf` CHAR(2),
  `cep` VARCHAR(8),
  PRIMARY KEY (`id`),
  KEY `FK_CTE_FERRO_VIA` (`id_cte_ferroviario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `cte_ferroviario_vagao` (
  `id` INT NOT NULL,
  `id_cte_ferroviario` INT NOT NULL,
  `numero_vagao` INT,
  `capacidade` DECIMAL(18,6),
  `tipo_vagao` CHAR(3),
  `peso_real` DECIMAL(18,6),
  `peso_bc` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_CTE_FERRO_VAGAO` (`id_cte_ferroviario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `cte_informacao_nf_carga` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_cte_informacao_nf` INT NOT NULL,
  `tipo_unidade_carga` CHAR(1),
  `id_unidade_carga` VARCHAR(20),
  PRIMARY KEY (`id`),
  KEY `FK_CTE_INF_NF_CARGA` (`id_cte_informacao_nf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `cte_informacao_nf_outros` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_cte_cabecalho` INT NOT NULL,
  `numero_romaneio` VARCHAR(20),
  `numero_pedido` VARCHAR(20),
  `chave_acesso_nfe` VARCHAR(44),
  `codigo_modelo` CHAR(2),
  `serie` CHAR(3),
  `numero` VARCHAR(20),
  `data_emissao` DATE,
  `uf_emitente` INT,
  `base_calculo_icms` DECIMAL(18,6),
  `valor_icms` DECIMAL(18,6),
  `base_calculo_icms_st` DECIMAL(18,6),
  `valor_icms_st` DECIMAL(18,6),
  `valor_total_produtos` DECIMAL(18,6),
  `valor_total` DECIMAL(18,6),
  `cfop_predominante` INT,
  `peso_total_kg` DECIMAL(18,6),
  `pin_suframa` INT,
  `data_prevista_entrega` DATE,
  `outro_tipo_doc_orig` CHAR(2),
  `outro_descricao` VARCHAR(100),
  `outro_valor_documento` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_CTE_CAB_INFORMACAO_NF` (`id_cte_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `cte_informacao_nf_transporte` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_cte_informacao_nf` INT NOT NULL,
  `tipo_unidade_transporte` CHAR(1),
  `id_unidade_transporte` VARCHAR(20),
  PRIMARY KEY (`id`),
  KEY `FK_CTE_INF_NF_TRANSP` (`id_cte_informacao_nf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `cte_inf_nf_carga_lacre` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_cte_informacao_nf_carga` INT NOT NULL,
  `numero` VARCHAR(20),
  `quantidade_rateada` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_CTE_INF_CARGA_LACRE` (`id_cte_informacao_nf_carga`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `cte_inf_nf_transporte_lacre` (
  `id` INT NOT NULL,
  `id_cte_informacao_nf_transporte` INT NOT NULL,
  `numero` VARCHAR(20),
  PRIMARY KEY (`id`),
  KEY `FK_CTE_INF_NF_TRANS_LACRE` (`id_cte_informacao_nf_transporte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `cte_local_coleta` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_cte_cabecalho` INT NOT NULL,
  `cnpj` VARCHAR(14),
  `cpf` VARCHAR(11),
  `nome` VARCHAR(60),
  `logradouro` VARCHAR(250),
  `numero` VARCHAR(60),
  `complemento` VARCHAR(60),
  `bairro` VARCHAR(60),
  `codigo_municipio` INT,
  `nome_municipio` VARCHAR(60),
  `uf` CHAR(2),
  PRIMARY KEY (`id`),
  KEY `FK_CTE_CAB_COLETA` (`id_cte_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `cte_local_entrega` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_cte_cabecalho` INT NOT NULL,
  `cnpj` VARCHAR(14),
  `cpf` VARCHAR(11),
  `nome` VARCHAR(60),
  `logradouro` VARCHAR(250),
  `numero` VARCHAR(60),
  `complemento` VARCHAR(60),
  `bairro` VARCHAR(60),
  `codigo_municipio` INT,
  `nome_municipio` VARCHAR(60),
  `uf` CHAR(2),
  PRIMARY KEY (`id`),
  KEY `FK_CTE_CAB_ENTREGA` (`id_cte_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `cte_multimodal` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_cte_cabecalho` INT NOT NULL,
  `cotm` VARCHAR(20),
  `indicador_negociavel` CHAR(1),
  PRIMARY KEY (`id`),
  KEY `FK_CTE_CAB_MULTI` (`id_cte_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `cte_passagem` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_cte_cabecalho` INT NOT NULL,
  `sigla_passagem` VARCHAR(15),
  `sigla_destino` VARCHAR(15),
  `rota` VARCHAR(10),
  PRIMARY KEY (`id`),
  KEY `FK_CTE_CAB_PASSAGEM` (`id_cte_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `cte_perigoso` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_cte_cabecalho` INT NOT NULL,
  `numero_onu` VARCHAR(4),
  `nome_apropriado` VARCHAR(150),
  `classe_risco` VARCHAR(40),
  `grupo_embalagem` VARCHAR(6),
  `quantidade_total_produto` VARCHAR(20),
  `quantidade_tipo_volume` VARCHAR(60),
  `ponto_fulgor` VARCHAR(6),
  PRIMARY KEY (`id`),
  KEY `FK_CTE_CAB_PERIGO` (`id_cte_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `cte_recebedor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_cte_cabecalho` INT NOT NULL,
  `cnpj` VARCHAR(14),
  `cpf` VARCHAR(11),
  `ie` VARCHAR(20),
  `nome` VARCHAR(60),
  `fantasia` VARCHAR(60),
  `telefone` VARCHAR(14),
  `logradouro` VARCHAR(250),
  `numero` VARCHAR(60),
  `complemento` VARCHAR(60),
  `bairro` VARCHAR(60),
  `codigo_municipio` INT,
  `nome_municipio` VARCHAR(60),
  `uf` CHAR(2),
  `cep` VARCHAR(8),
  `codigo_pais` INT,
  `nome_pais` VARCHAR(60),
  `email` VARCHAR(60),
  PRIMARY KEY (`id`),
  KEY `FK_CTE_CAB_RECEBEDOR` (`id_cte_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `cte_remetente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_cte_cabecalho` INT NOT NULL,
  `cnpj` VARCHAR(14),
  `cpf` VARCHAR(11),
  `ie` VARCHAR(20),
  `nome` VARCHAR(60),
  `fantasia` VARCHAR(60),
  `telefone` VARCHAR(14),
  `logradouro` VARCHAR(250),
  `numero` VARCHAR(60),
  `complemento` VARCHAR(60),
  `bairro` VARCHAR(60),
  `codigo_municipio` INT,
  `nome_municipio` VARCHAR(60),
  `uf` CHAR(2),
  `cep` VARCHAR(8),
  `codigo_pais` INT,
  `nome_pais` VARCHAR(60),
  `email` VARCHAR(60),
  PRIMARY KEY (`id`),
  KEY `FK_CTE_CAB_REMETENTE` (`id_cte_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `cte_rodoviario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_cte_cabecalho` INT NOT NULL,
  `rntrc` VARCHAR(8),
  `data_prevista_entrega` DATE,
  `indicador_lotacao` CHAR(1),
  `ciot` INT,
  PRIMARY KEY (`id`),
  KEY `FK_CTE_CAB_RODOVIARIO` (`id_cte_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `cte_rodoviario_lacre` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_cte_rodoviario` INT NOT NULL,
  `numero` VARCHAR(20),
  PRIMARY KEY (`id`),
  KEY `FK_CTE_ROD_LACRE` (`id_cte_rodoviario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `cte_rodoviario_motorista` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_cte_rodoviario` INT NOT NULL,
  `nome` VARCHAR(60),
  `cpf` VARCHAR(11),
  PRIMARY KEY (`id`),
  KEY `FK_CTE_ROD_MOTORISTA` (`id_cte_rodoviario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `cte_rodoviario_occ` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_cte_rodoviario` INT NOT NULL,
  `serie` CHAR(3),
  `numero` INT,
  `data_emissao` DATE,
  `cnpj` VARCHAR(14),
  `codigo_interno` VARCHAR(10),
  `ie` VARCHAR(14),
  `uf` CHAR(2),
  `telefone` VARCHAR(14),
  PRIMARY KEY (`id`),
  KEY `FK_CTE_ROD_OCC` (`id_cte_rodoviario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `cte_rodoviario_pedagio` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_cte_rodoviario` INT NOT NULL,
  `cnpj_fornecedor` VARCHAR(14),
  `comprovante_compra` VARCHAR(20),
  `cnpj_responsavel` VARCHAR(14),
  `valor` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_CTE_ROD_PEDAGIO` (`id_cte_rodoviario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `cte_rodoviario_veiculo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_cte_rodoviario` INT NOT NULL,
  `codigo_interno` VARCHAR(10),
  `renavam` VARCHAR(11),
  `placa` VARCHAR(7),
  `tara` INT,
  `capacidade_kg` INT,
  `capacidade_m3` INT,
  `tipo_propriedade` CHAR(1),
  `tipo_veiculo` CHAR(1),
  `tipo_rodado` CHAR(2),
  `tipo_carroceria` CHAR(2),
  `uf` CHAR(2),
  `proprietario_cpf` VARCHAR(11),
  `proprietario_cnpj` VARCHAR(14),
  `proprietario_rntrc` VARCHAR(8),
  `proprietario_nome` VARCHAR(60),
  `proprietario_ie` VARCHAR(14),
  `proprietario_uf` CHAR(2),
  `proprietario_tipo` CHAR(1),
  PRIMARY KEY (`id`),
  KEY `FK_CTE_ROD_VEICULO` (`id_cte_rodoviario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `cte_seguro` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_cte_cabecalho` INT NOT NULL,
  `responsavel` CHAR(1),
  `seguradora` VARCHAR(30),
  `apolice` VARCHAR(20),
  `averbacao` VARCHAR(20),
  `valor_carga` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_CTE_CAB_SEGURO` (`id_cte_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `cte_tomador` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_cte_cabecalho` INT NOT NULL,
  `cnpj` VARCHAR(14),
  `cpf` VARCHAR(11),
  `ie` VARCHAR(14),
  `nome` VARCHAR(60),
  `fantasia` VARCHAR(60),
  `telefone` VARCHAR(14),
  `logradouro` VARCHAR(255),
  `numero` VARCHAR(60),
  `complemento` VARCHAR(60),
  `bairro` VARCHAR(60),
  `codigo_municipio` INT,
  `nome_municipio` VARCHAR(60),
  `uf` CHAR(2),
  `cep` VARCHAR(8),
  `codigo_pais` INT,
  `nome_pais` VARCHAR(60),
  `email` VARCHAR(60),
  PRIMARY KEY (`id`),
  KEY `FK_CTE_CAB_TOMADOR` (`id_cte_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `cte_veiculo_novo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_cte_cabecalho` INT NOT NULL,
  `chassi` VARCHAR(17),
  `cor` VARCHAR(4),
  `descricao_cor` VARCHAR(40),
  `codigo_marca_modelo` VARCHAR(6),
  `valor_unitario` DECIMAL(18,6),
  `valor_frete` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_CTE_CAB_VEICULO_NOVO` (`id_cte_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `ct_resultado_nt_financeira` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_centro_resultado` INT NOT NULL,
  `id_fin_natureza_financeira` INT NOT NULL,
  `percentual_rateio` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_CR_NF` (`id_centro_resultado`),
  KEY `fk_CT_RESULTADO_NT_FINANCEIRA_FIN_NATUREZA_FINANCEIRA1_idx` (`id_fin_natureza_financeira`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `dav_cabecalho` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_pessoa` INT NOT NULL,
  `numero_dav` VARCHAR(10),
  `numero_ecf` VARCHAR(4),
  `ccf` INT,
  `coo` INT,
  `nome_destinatario` VARCHAR(100),
  `cpf_cnpj_destinatario` VARCHAR(14),
  `data_emissao` DATE,
  `hora_emissao` VARCHAR(8),
  `situacao` CHAR(1),
  `taxa_acrescimo` DECIMAL(18,6),
  `acrescimo` DECIMAL(18,6),
  `taxa_desconto` DECIMAL(18,6),
  `desconto` DECIMAL(18,6),
  `subtotal` DECIMAL(18,6),
  `valor` DECIMAL(18,6),
  `impresso` CHAR(1),
  `hash_registro` VARCHAR(32),
  PRIMARY KEY (`id`),
  KEY `fk_DAV_CABECALHO_PESSOA1_idx` (`id_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `dav_detalhe` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_dav_cabecalho` INT NOT NULL,
  `id_produto` INT NOT NULL,
  `numero_dav` VARCHAR(10),
  `data_emissao` DATE,
  `item` INT,
  `quantidade` DECIMAL(18,6),
  `valor_unitario` DECIMAL(18,6),
  `valor_total` DECIMAL(18,6),
  `cancelado` CHAR(1),
  `mescla_produto` CHAR(1),
  `gtin_produto` VARCHAR(14),
  `nome_produto` VARCHAR(100),
  `unidade_produto` VARCHAR(10),
  `totalizador_parcial` VARCHAR(10),
  `servico_formula` TEXT,
  `hash_registro` VARCHAR(32),
  PRIMARY KEY (`id`),
  KEY `FK_DAV_CAB_DET` (`id_dav_cabecalho`),
  KEY `fk_DAV_DETALHE_PRODUTO1_idx` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `dav_detalhe_alteracao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_dav_detalhe` INT NOT NULL,
  `data_alteracao` DATE,
  `hora_alteracao` VARCHAR(8),
  `tipo_alteracao` CHAR(1),
  `objeto` TEXT,
  PRIMARY KEY (`id`),
  KEY `DAV_DETALHE_ALTERACAO_FKIndex1` (`id_dav_detalhe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `dia_parcela` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `dia` CHAR(2),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `ecf_aliquotas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `totalizador_parcial` VARCHAR(10),
  `ecf_icms_st` VARCHAR(4),
  `paf_p_st` CHAR(1),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `ecf_documentos_emitidos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome_caixa` VARCHAR(30),
  `id_gerado_caixa` INT,
  `id_empresa` INT,
  `id_pdv_movimento` INT,
  `data_emissao` DATE,
  `hora_emissao` VARCHAR(8),
  `tipo` CHAR(2),
  `coo` INT,
  `data_sincronizacao` DATE,
  `hora_sincronizacao` VARCHAR(8),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `ecf_e3` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `serie_ecf` VARCHAR(20),
  `mf_adicional` CHAR(1),
  `tipo_ecf` VARCHAR(7),
  `marca_ecf` VARCHAR(20),
  `modelo_ecf` VARCHAR(20),
  `data_estoque` DATE,
  `hora_estoque` VARCHAR(8),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `ecf_impressora` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `numero` INT,
  `codigo` VARCHAR(10),
  `serie` VARCHAR(25),
  `identificacao` VARCHAR(250),
  `mc` CHAR(2),
  `md` CHAR(2),
  `vr` CHAR(2),
  `tipo` VARCHAR(7),
  `marca` VARCHAR(30),
  `modelo` VARCHAR(30),
  `modelo_acbr` VARCHAR(30),
  `modelo_documento_fiscal` CHAR(2),
  `versao` VARCHAR(30),
  `le` CHAR(1),
  `lef` CHAR(1),
  `mfd` CHAR(1),
  `lacre_na_mfd` CHAR(1),
  `data_instalacao_sb` DATE,
  `hora_instalacao_sb` VARCHAR(8),
  `docto` VARCHAR(60),
  `ecf_impressora` VARCHAR(3),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `ecf_r02` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome_caixa` VARCHAR(30),
  `id_gerado_caixa` INT,
  `id_empresa` INT,
  `id_pdv_operador` INT NOT NULL,
  `id_ecf_impressora` INT NOT NULL,
  `id_pdv_caixa` INT,
  `serie_ecf` VARCHAR(20),
  `crz` INT,
  `coo` INT,
  `cro` INT,
  `data_movimento` DATE,
  `data_emissao` DATE,
  `hora_emissao` VARCHAR(8),
  `venda_bruta` DECIMAL(18,6),
  `grande_total` DECIMAL(18,6),
  `hash_registro` VARCHAR(32),
  `data_sincronizacao` DATE,
  `hora_sincronizacao` VARCHAR(8),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `ecf_r03` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome_caixa` VARCHAR(30),
  `id_gerado_caixa` INT,
  `id_empresa` INT,
  `id_ecf_r02` INT,
  `serie_ecf` VARCHAR(20),
  `totalizador_parcial` VARCHAR(10),
  `valor_acumulado` DECIMAL(18,6),
  `crz` INT,
  `hash_registro` VARCHAR(32),
  `data_sincronizacao` DATE,
  `hora_sincronizacao` VARCHAR(8),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `ecf_r06` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome_caixa` VARCHAR(30),
  `id_gerado_caixa` INT,
  `id_empresa` INT,
  `id_pdv_operador` INT NOT NULL,
  `id_ecf_impressora` INT NOT NULL,
  `id_pdv_caixa` INT,
  `serie_ecf` VARCHAR(20),
  `coo` INT,
  `gnf` INT,
  `grg` INT,
  `cdc` INT,
  `denominacao` CHAR(2),
  `data_emissao` DATE,
  `hora_emissao` VARCHAR(8),
  `hash_registro` VARCHAR(32),
  `data_sincronizacao` DATE,
  `hora_sincronizacao` VARCHAR(8),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `ecf_r07` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome_caixa` VARCHAR(8),
  `id_gerado_caixa` INT,
  `id_empresa` INT,
  `id_ecf_r06` INT,
  `ccf` INT,
  `meio_pagamento` VARCHAR(20),
  `valor_pagamento` DECIMAL(18,6),
  `estorno` CHAR(1),
  `valor_estorno` DECIMAL(18,6),
  `hash_registro` VARCHAR(32),
  `data_sincronizacao` DATE,
  `hora_sincronizacao` VARCHAR(8),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `ecf_recebimento_nao_fiscal` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome_caixa` VARCHAR(30),
  `id_gerado_caixa` INT,
  `id_empresa` INT,
  `id_pdv_movimento` INT,
  `data_recebimento` DATE,
  `descricao` VARCHAR(50),
  `valor` DECIMAL(18,6),
  `data_sincronizacao` DATE,
  `hora_sincronizacao` VARCHAR(8),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `ecf_sintegra_60a` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome_caixa` VARCHAR(8),
  `id_gerado_caixa` INT,
  `id_empresa` INT,
  `id_ecf_sintegra_60m` INT,
  `situacao_tributaria` VARCHAR(4),
  `valor` DECIMAL(18,6),
  `data_sincronizacao` DATE,
  `hora_sincronizacao` VARCHAR(32),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `ecf_sintegra_60m` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome_caixa` VARCHAR(8),
  `id_gerado_caixa` INT,
  `id_empresa` INT,
  `data_emissao` DATE,
  `numero_serie_ecf` VARCHAR(20),
  `numero_equipamento` INT,
  `modelo_documento_fiscal` CHAR(2),
  `coo_inicial` INT,
  `coo_final` INT,
  `crz` INT,
  `cro` INT,
  `valor_venda_bruta` DECIMAL(18,6),
  `valor_grande_total` DECIMAL(18,6),
  `data_sincronizacao` DATE,
  `hora_sincronizacao` VARCHAR(8),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `efd_tabela_4310` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` INT,
  `descricao` TEXT,
  `observacao` TEXT,
  `inicio_vigencia` DATE,
  `fim_vigencia` DATE,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `efd_tabela_4313` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` INT,
  `descricao` TEXT,
  `observacao` TEXT,
  `inicio_vigencia` DATE,
  `fim_vigencia` DATE,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `efd_tabela_4314` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` INT,
  `descricao` TEXT,
  `observacao` TEXT,
  `inicio_vigencia` DATE,
  `fim_vigencia` DATE,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `efd_tabela_4315` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` INT,
  `descricao` TEXT,
  `observacao` TEXT,
  `inicio_vigencia` DATE,
  `fim_vigencia` DATE,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `efd_tabela_4316` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` INT,
  `descricao` TEXT,
  `observacao` TEXT,
  `inicio_vigencia` DATE,
  `fim_vigencia` DATE,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `efd_tabela_435` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` CHAR(2),
  `descricao` VARCHAR(100),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `efd_tabela_436` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` INT,
  `descricao` VARCHAR(250),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `efd_tabela_437` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` CHAR(2),
  `descricao` VARCHAR(250),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `efd_tabela_439` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` INT,
  `descricao` TEXT,
  `observacao` TEXT,
  `inicio_vigencia` DATE,
  `fim_vigencia` DATE,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `empresa` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `razao_social` VARCHAR(150),
  `nome_fantasia` VARCHAR(150),
  `cnpj` VARCHAR(14),
  `inscricao_estadual` VARCHAR(45),
  `inscricao_municipal` VARCHAR(45),
  `tipo_regime` CHAR(1),
  `crt` CHAR(1),
  `email` VARCHAR(250),
  `site` VARCHAR(250),
  `contato` VARCHAR(100),
  `data_constituicao` DATE,
  `tipo` CHAR(1),
  `inscricao_junta_comercial` VARCHAR(30),
  `data_insc_junta_comercial` DATE,
  `codigo_ibge_cidade` INT,
  `codigo_ibge_uf` INT,
  `cei` VARCHAR(12),
  `codigo_cnae_principal` VARCHAR(7),
  `imagem_logotipo` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `empresa_cnae` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_empresa` INT NOT NULL,
  `id_cnae` INT NOT NULL,
  `principal` CHAR(1),
  `ramo_atividade` VARCHAR(50),
  `objeto_social` TEXT,
  PRIMARY KEY (`id`),
  KEY `fk_EMPRESA_CNAE_EMPRESA1_idx` (`id_empresa`),
  KEY `fk_EMPRESA_CNAE_CNAE1_idx` (`id_cnae`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `empresa_contato` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_empresa` INT NOT NULL,
  `nome` VARCHAR(150),
  `email` VARCHAR(250),
  `observacao` VARCHAR(250),
  PRIMARY KEY (`id`),
  KEY `fk_EMPRESA_CONTATO_EMPRESA1_idx` (`id_empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `empresa_endereco` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_empresa` INT NOT NULL,
  `logradouro` VARCHAR(100),
  `numero` VARCHAR(10),
  `bairro` VARCHAR(100),
  `cidade` VARCHAR(100),
  `uf` CHAR(2),
  `cep` VARCHAR(8),
  `municipio_ibge` INT,
  `complemento` VARCHAR(100),
  `principal` CHAR(1),
  `entrega` CHAR(1),
  `cobranca` CHAR(1),
  `correspondencia` CHAR(1),
  PRIMARY KEY (`id`),
  KEY `fk_EMPRESA_ENDERECO_EMPRESA1_idx` (`id_empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `empresa_telefone` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_empresa` INT NOT NULL,
  `tipo` CHAR(1),
  `numero` VARCHAR(15),
  PRIMARY KEY (`id`),
  KEY `fk_EMPRESA_TELEFONE_EMPRESA1_idx` (`id_empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `empresa_transporte` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `uf` CHAR(2),
  `nome` VARCHAR(100),
  `classificacao_contabil_conta` VARCHAR(30),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `empresa_transporte_itinerario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_empresa_transporte` INT NOT NULL,
  `nome` VARCHAR(100),
  `tarifa` DECIMAL(18,6),
  `trajeto` TEXT,
  PRIMARY KEY (`id`),
  KEY `FK_EMP_TRANS_ITINER` (`id_empresa_transporte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `encerra_centro_resultado` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_centro_resultado` INT NOT NULL,
  `competencia` VARCHAR(7),
  `valor_total` DECIMAL(18,6),
  `valor_sub_rateio` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_CENTRO_ENCERRA` (`id_centro_resultado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `esocial_classificacao_tribut` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` CHAR(2),
  `descricao` VARCHAR(100),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `esocial_motivo_desligamento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` CHAR(2),
  `descricao` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `esocial_natureza_juridica` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `grupo` INT,
  `codigo` VARCHAR(5),
  `descricao` VARCHAR(100),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `esocial_rubrica` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` CHAR(4),
  `nome` VARCHAR(100),
  `descricao` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `esocial_tipo_afastamento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` CHAR(2),
  `descricao` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `estado_civil` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50),
  `descricao` VARCHAR(250),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `estoque_cor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` CHAR(4),
  `nome` VARCHAR(50),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `estoque_grade` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_estoque_marca` INT,
  `id_estoque_sabor` INT,
  `id_estoque_tamanho` INT,
  `id_estoque_cor` INT,
  `id_produto` INT NOT NULL,
  `codigo` VARCHAR(50),
  `quantidade` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_ESTOQUE_COR_GRADE` (`id_estoque_cor`),
  KEY `FK_ESTOQUE_TAMANHO_GRADE` (`id_estoque_tamanho`),
  KEY `FK_ESTOQUE_SABOR` (`id_estoque_sabor`),
  KEY `FK_ESTOQUE_MARCA` (`id_estoque_marca`),
  KEY `fk_ESTOQUE_GRADE_PRODUTO1_idx` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `estoque_marca` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` CHAR(4),
  `nome` VARCHAR(50),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `estoque_reajuste_cabecalho` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_colaborador` INT NOT NULL,
  `data_reajuste` DATE,
  `taxa` DECIMAL(18,6),
  `tipo_reajuste` CHAR(1),
  `justificativa` VARCHAR(100),
  PRIMARY KEY (`id`),
  KEY `fk_ESTOQUE_REAJUSTE_CABECALHO_COLABORADOR1_idx` (`id_colaborador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `estoque_reajuste_detalhe` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_estoque_reajuste_cabecalho` INT NOT NULL,
  `id_produto` INT NOT NULL,
  `valor_original` DECIMAL(18,6),
  `valor_reajuste` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_ESTOQUE_REAJUSTE_CAB_DET` (`id_estoque_reajuste_cabecalho`),
  KEY `fk_ESTOQUE_REAJUSTE_DETALHE_PRODUTO1_idx` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `estoque_sabor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` CHAR(4),
  `nome` VARCHAR(50),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `estoque_tamanho` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` CHAR(4),
  `nome` VARCHAR(50),
  `altura` DECIMAL(18,6),
  `comprimento` DECIMAL(18,6),
  `largura` DECIMAL(18,6),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `etiqueta_formato_papel` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50),
  `altura` INT,
  `largura` INT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `etiqueta_layout` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_formato_papel` INT NOT NULL,
  `codigo_fabricante` VARCHAR(50),
  `quantidade` INT,
  `quantidade_horizontal` INT,
  `quantidade_vertical` INT,
  `margem_superior` INT,
  `margem_inferior` INT,
  `margem_esquerda` INT,
  `margem_direita` INT,
  `espacamento_horizontal` INT,
  `espacamento_vertical` INT,
  PRIMARY KEY (`id`),
  KEY `FK_PAPEL_ETIQUETA` (`id_formato_papel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `etiqueta_template` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_etiqueta_layout` INT NOT NULL,
  `tabela` VARCHAR(50),
  `campo` VARCHAR(50),
  `formato` INT,
  `quantidade_repeticoes` INT,
  `filtro` VARCHAR(100),
  PRIMARY KEY (`id`),
  KEY `FK_ETIQUETA_TEMPLATE` (`id_etiqueta_layout`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `fap` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fap` DECIMAL(18,6),
  `data_inicial` DATE,
  `data_final` DATE,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `feriados` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ano` CHAR(4),
  `nome` VARCHAR(50),
  `abrangencia` CHAR(1),
  `uf` CHAR(2),
  `municipio_ibge` INT,
  `tipo` CHAR(1),
  `data_feriado` DATE,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `ferias_periodo_aquisitivo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_colaborador` INT NOT NULL,
  `data_inicio` DATE,
  `data_fim` DATE,
  `situacao` CHAR(1),
  `limite_para_gozo` DATE,
  `descontar_faltas` CHAR(1),
  `desconsiderar_afastamento` CHAR(1),
  `afastamento_previdencia` INT,
  `afastamento_sem_remun` INT,
  `afastamento_com_remun` INT,
  `dias_direito` INT,
  `dias_gozados` INT,
  `dias_faltas` INT,
  `dias_restantes` INT,
  PRIMARY KEY (`id`),
  KEY `fk_FERIAS_PERIODO_AQUISITIVO_COLABORADOR1_idx` (`id_colaborador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `fin_cheque_emitido` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_cheque` INT NOT NULL,
  `data_emissao` DATE,
  `bom_para` DATE,
  `data_compensacao` DATE,
  `valor` DECIMAL(18,6),
  `nominal_a` VARCHAR(100),
  PRIMARY KEY (`id`),
  KEY `FK_CHEQUE_EMITIDO` (`id_cheque`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `fin_cheque_recebido` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_pessoa` INT,
  `cpf` VARCHAR(11),
  `cnpj` VARCHAR(14),
  `nome` VARCHAR(100),
  `codigo_banco` VARCHAR(10),
  `codigo_agencia` VARCHAR(10),
  `conta` VARCHAR(20),
  `numero` INT,
  `data_emissao` DATE,
  `bom_para` DATE,
  `data_compensacao` DATE,
  `valor` DECIMAL(18,6),
  `custodia_data` DATE,
  `custodia_tarifa` DECIMAL(18,6),
  `custodia_comissao` DECIMAL(18,6),
  `desconto_data` DATE,
  `desconto_tarifa` DECIMAL(18,6),
  `desconto_comissao` DECIMAL(18,6),
  `valor_recebido` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `fk_FIN_CHEQUE_RECEBIDO_PESSOA1_idx` (`id_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `fin_configuracao_boleto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_banco_conta_caixa` INT NOT NULL,
  `instrucao01` VARCHAR(100),
  `instrucao02` VARCHAR(100),
  `caminho_arquivo_remessa` VARCHAR(250),
  `caminho_arquivo_retorno` VARCHAR(250),
  `caminho_arquivo_logotipo` VARCHAR(250),
  `caminho_arquivo_pdf` VARCHAR(250),
  `mensagem` VARCHAR(250),
  `local_pagamento` VARCHAR(100),
  `layout_remessa` CHAR(3),
  `aceite` CHAR(1),
  `especie` CHAR(1),
  `carteira` CHAR(3),
  `codigo_convenio` VARCHAR(20),
  `codigo_cedente` VARCHAR(20),
  `taxa_multa` DECIMAL(18,6),
  `taxa_juro` DECIMAL(18,6),
  `dias_protesto` INT,
  `nosso_numero_anterior` VARCHAR(50),
  PRIMARY KEY (`id`),
  KEY `fk_FIN_CONFIGURACAO_BOLETO_BANCO_CONTA_CAIXA1_idx` (`id_banco_conta_caixa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `fin_documento_origem` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` CHAR(3),
  `sigla` CHAR(10),
  `descricao` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `fin_extrato_conta_banco` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_banco_conta_caixa` INT NOT NULL,
  `mes_ano` VARCHAR(7),
  `mes` CHAR(2),
  `ano` CHAR(4),
  `data_movimento` DATE,
  `data_balancete` DATE,
  `historico` VARCHAR(250),
  `documento` VARCHAR(50),
  `valor` DECIMAL(18,6),
  `conciliado` CHAR(1),
  `observacao` TEXT,
  PRIMARY KEY (`id`),
  KEY `fk_FIN_EXTRATO_CONTA_BANCO_BANCO_CONTA_CAIXA1_idx` (`id_banco_conta_caixa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `fin_fechamento_caixa_banco` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_banco_conta_caixa` INT NOT NULL,
  `data_fechamento` DATE,
  `mes_ano` VARCHAR(7),
  `mes` CHAR(2),
  `ano` CHAR(4),
  `saldo_anterior` DECIMAL(18,6),
  `recebimentos` DECIMAL(18,6),
  `pagamentos` DECIMAL(18,6),
  `saldo_conta` DECIMAL(18,6),
  `cheque_nao_compensado` DECIMAL(18,6),
  `saldo_disponivel` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `fk_FIN_FECHAMENTO_CAIXA_BANCO_BANCO_CONTA_CAIXA1_idx` (`id_banco_conta_caixa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `fin_lancamento_pagar` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_fin_documento_origem` INT NOT NULL,
  `id_fin_natureza_financeira` INT NOT NULL,
  `id_fornecedor` INT NOT NULL,
  `id_banco_conta_caixa` INT NOT NULL,
  `quantidade_parcela` INT,
  `valor_a_pagar` DECIMAL(18,6),
  `data_lancamento` DATE,
  `numero_documento` VARCHAR(50),
  `imagem_documento` TEXT,
  `primeiro_vencimento` DATE,
  `intervalo_entre_parcelas` INT,
  `dia_fixo` CHAR(2),
  PRIMARY KEY (`id`),
  KEY `FK_DOC_ORIG_LCTO_PAGAR` (`id_fin_documento_origem`),
  KEY `fk_FIN_LANCAMENTO_PAGAR_FIN_NATUREZA_FINANCEIRA1_idx` (`id_fin_natureza_financeira`),
  KEY `fk_FIN_LANCAMENTO_PAGAR_FORNECEDOR1_idx` (`id_fornecedor`),
  KEY `fk_FIN_LANCAMENTO_PAGAR_BANCO_CONTA_CAIXA1_idx` (`id_banco_conta_caixa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `fin_lancamento_receber` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_fin_documento_origem` INT NOT NULL,
  `id_fin_natureza_financeira` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  `id_banco_conta_caixa` INT NOT NULL,
  `quantidade_parcela` INT,
  `valor_a_receber` DECIMAL(18,6),
  `data_lancamento` DATE,
  `numero_documento` VARCHAR(50),
  `primeiro_vencimento` DATE,
  `taxa_comissao` DECIMAL(18,6),
  `valor_comissao` DECIMAL(18,6),
  `intervalo_entre_parcelas` INT,
  `dia_fixo` CHAR(2),
  PRIMARY KEY (`id`),
  KEY `FK_DOC_ORI_LANC_RECEBER` (`id_fin_documento_origem`),
  KEY `fk_FIN_LANCAMENTO_RECEBER_FIN_NATUREZA_FINANCEIRA1_idx` (`id_fin_natureza_financeira`),
  KEY `fk_FIN_LANCAMENTO_RECEBER_CLIENTE1_idx` (`id_cliente`),
  KEY `fk_FIN_LANCAMENTO_RECEBER_BANCO_CONTA_CAIXA1_idx` (`id_banco_conta_caixa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `fin_natureza_financeira` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` CHAR(4),
  `descricao` VARCHAR(100),
  `tipo` CHAR(1),
  `aplicacao` VARCHAR(250),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `fin_parcela_pagar` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_fin_lancamento_pagar` INT NOT NULL,
  `id_fin_status_parcela` INT NOT NULL,
  `id_fin_tipo_pagamento` INT,
  `id_fin_cheque_emitido` INT,
  `numero_parcela` INT,
  `data_emissao` DATE,
  `data_vencimento` DATE,
  `data_pagamento` DATE,
  `desconto_ate` DATE,
  `valor` DECIMAL(18,6),
  `taxa_juro` DECIMAL(18,6),
  `taxa_multa` DECIMAL(18,6),
  `taxa_desconto` DECIMAL(18,6),
  `valor_juro` DECIMAL(18,6),
  `valor_multa` DECIMAL(18,6),
  `valor_desconto` DECIMAL(18,6),
  `valor_pago` DECIMAL(18,6),
  `historico` TEXT,
  PRIMARY KEY (`id`),
  KEY `FK_STATUS_PARCELA_PAGAR` (`id_fin_status_parcela`),
  KEY `FK_LANCAMENTO_PARCELA` (`id_fin_lancamento_pagar`),
  KEY `fk_FIN_PARCELA_PAGAR_FIN_TIPO_PAGAMENTO1_idx` (`id_fin_tipo_pagamento`),
  KEY `fk_FIN_PARCELA_PAGAR_FIN_CHEQUE_EMITIDO1_idx` (`id_fin_cheque_emitido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `fin_parcela_receber` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_fin_lancamento_receber` INT NOT NULL,
  `id_fin_status_parcela` INT NOT NULL,
  `id_fin_tipo_recebimento` INT,
  `id_fin_cheque_recebido` INT,
  `numero_parcela` INT,
  `data_emissao` DATE,
  `data_vencimento` DATE,
  `data_recebimento` DATE,
  `desconto_ate` DATE,
  `valor` DECIMAL(18,6),
  `taxa_juro` DECIMAL(18,6),
  `taxa_multa` DECIMAL(18,6),
  `taxa_desconto` DECIMAL(18,6),
  `valor_juro` DECIMAL(18,6),
  `valor_multa` DECIMAL(18,6),
  `valor_desconto` DECIMAL(18,6),
  `emitiu_boleto` CHAR(1),
  `boleto_nosso_numero` VARCHAR(50),
  `valor_recebido` DECIMAL(18,6),
  `historico` TEXT,
  PRIMARY KEY (`id`),
  KEY `FK_LANCAMENTO_PARCELA_RECEBER` (`id_fin_lancamento_receber`),
  KEY `FK_STATUS_PARCELA_RECEBER` (`id_fin_status_parcela`),
  KEY `fk_FIN_PARCELA_RECEBER_FIN_TIPO_RECEBIMENTO1_idx` (`id_fin_tipo_recebimento`),
  KEY `fk_FIN_PARCELA_RECEBER_FIN_CHEQUE_RECEBIDO1_idx` (`id_fin_cheque_recebido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `fin_status_parcela` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `situacao` CHAR(2) NOT NULL,
  `descricao` VARCHAR(30),
  `procedimento` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `fin_tipo_pagamento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` CHAR(2),
  `descricao` VARCHAR(30),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `fin_tipo_recebimento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` CHAR(2),
  `descricao` VARCHAR(100),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `fiscal_apuracao_icms` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `competencia` VARCHAR(7),
  `valor_total_debito` DECIMAL(18,6),
  `valor_ajuste_debito` DECIMAL(18,6),
  `valor_total_ajuste_debito` DECIMAL(18,6),
  `valor_estorno_credito` DECIMAL(18,6),
  `valor_total_credito` DECIMAL(18,6),
  `valor_ajuste_credito` DECIMAL(18,6),
  `valor_total_ajuste_credito` DECIMAL(18,6),
  `valor_estorno_debito` DECIMAL(18,6),
  `valor_saldo_credor_anterior` DECIMAL(18,6),
  `valor_saldo_apurado` DECIMAL(18,6),
  `valor_total_deducao` DECIMAL(18,6),
  `valor_icms_recolher` DECIMAL(18,6),
  `valor_saldo_credor_transp` DECIMAL(18,6),
  `valor_debito_especial` DECIMAL(18,6),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `fiscal_estadual_porte` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `uf` CHAR(2),
  `codigo` VARCHAR(20),
  `nome` VARCHAR(50),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `fiscal_estadual_regime` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `uf` CHAR(2),
  `codigo` VARCHAR(20),
  `nome` VARCHAR(50),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `fiscal_inscricoes_substitutas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_fiscal_parametros` INT NOT NULL,
  `uf` CHAR(2),
  `inscricao_estadual` VARCHAR(30),
  `pmpf` CHAR(1),
  PRIMARY KEY (`id`),
  KEY `FK_PAR_INSC_SUBSTITUTA` (`id_fiscal_parametros`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `fiscal_livro` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(50),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `fiscal_municipal_regime` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `uf` CHAR(2),
  `codigo` VARCHAR(20),
  `nome` VARCHAR(50),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `fiscal_nota_fiscal_entrada` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_nfe_cabecalho` INT NOT NULL,
  `competencia` VARCHAR(7),
  `cfop_entrada` INT,
  `valor_rateio_frete` DECIMAL(18,6),
  `valor_custo_medio` DECIMAL(18,6),
  `valor_icms_antecipado` DECIMAL(18,6),
  `valor_bc_icms_antecipado` DECIMAL(18,6),
  `valor_bc_icms_creditado` DECIMAL(18,6),
  `valor_bc_pis_creditado` DECIMAL(18,6),
  `valor_bc_cofins_creditado` DECIMAL(18,6),
  `valor_bc_ipi_creditado` DECIMAL(18,6),
  `cst_credito_icms` CHAR(3),
  `cst_credito_pis` CHAR(2),
  `cst_credito_cofins` CHAR(2),
  `cst_credito_ipi` CHAR(2),
  `valor_icms_creditado` DECIMAL(18,6),
  `valor_pis_creditado` DECIMAL(18,6),
  `valor_cofins_creditado` DECIMAL(18,6),
  `valor_ipi_creditado` DECIMAL(18,6),
  `qtde_parcela_credito_pis` INT,
  `qtde_parcela_credito_cofins` INT,
  `qtde_parcela_credito_icms` INT,
  `qtde_parcela_credito_ipi` INT,
  `aliquota_credito_icms` DECIMAL(18,6),
  `aliquota_credito_pis` DECIMAL(18,6),
  `aliquota_credito_cofins` DECIMAL(18,6),
  `aliquota_credito_ipi` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `fk_FISCAL_NOTA_FISCAL_ENTRADA_NFE_CABECALHO1_idx` (`id_nfe_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `fiscal_nota_fiscal_saida` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_nfe_cabecalho` INT NOT NULL,
  `competencia` VARCHAR(7),
  PRIMARY KEY (`id`),
  KEY `fk_FISCAL_NOTA_FISCAL_SAIDA_NFE_CABECALHO1_idx` (`id_nfe_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `fiscal_parametro` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_fiscal_estadual_porte` INT,
  `id_fiscal_estadual_regime` INT,
  `id_fiscal_municipal_regime` INT,
  `vigencia` VARCHAR(7),
  `descricao_vigencia` VARCHAR(100),
  `criterio_lancamento` CHAR(1),
  `apuracao` CHAR(1),
  `microempree_individual` CHAR(1),
  `calc_pis_cofins_efd` CHAR(2),
  `simples_codigo_acesso` VARCHAR(50),
  `simples_tabela` CHAR(1),
  `simples_atividade` CHAR(2),
  `perfil_sped` CHAR(1),
  `apuracao_consolidada` CHAR(1),
  `substituicao_tributaria` CHAR(1),
  `forma_calculo_iss` CHAR(2),
  PRIMARY KEY (`id`),
  KEY `FK_REGIME_MUN_PAR` (`id_fiscal_municipal_regime`),
  KEY `FK_REGIME_EST_PAR` (`id_fiscal_estadual_regime`),
  KEY `FK_PORTE_EST_PAR` (`id_fiscal_estadual_porte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `fiscal_termo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_fiscal_livro` INT NOT NULL,
  `abertura_encerramento` CHAR(1),
  `numero` INT,
  `pagina_inicial` INT,
  `pagina_final` INT,
  `registrado` VARCHAR(100),
  `numero_registro` VARCHAR(50),
  `data_despacho` DATE,
  `data_abertura` DATE,
  `data_encerramento` DATE,
  `escrituracao_inicio` DATE,
  `escrituracao_fim` DATE,
  `texto` TEXT,
  PRIMARY KEY (`id`),
  KEY `FK_FISCAL_LIVRO_TERMO` (`id_fiscal_livro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `folha_afastamento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_folha_tipo_afastamento` INT NOT NULL,
  `id_colaborador` INT NOT NULL,
  `data_inicio` DATE,
  `data_fim` DATE,
  `dias_afastado` INT,
  PRIMARY KEY (`id`),
  KEY `FK_FOLHA_TIPO_AFASTAMENTO` (`id_folha_tipo_afastamento`),
  KEY `fk_FOLHA_AFASTAMENTO_COLABORADOR1_idx` (`id_colaborador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `folha_evento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` CHAR(3),
  `nome` VARCHAR(100),
  `descricao` TEXT,
  `tipo` CHAR(1),
  `unidade` CHAR(1),
  `base_calculo` CHAR(2),
  `taxa` DECIMAL(18,6),
  `rubrica_esocial` CHAR(4),
  `cod_incidencia_previdencia` CHAR(2),
  `cod_incidencia_irrf` CHAR(2),
  `cod_incidencia_fgts` CHAR(2),
  `cod_incidencia_sindicato` CHAR(2),
  `repercute_dsr` CHAR(1),
  `repercute_13` CHAR(1),
  `repercute_ferias` CHAR(1),
  `repercute_aviso` CHAR(1),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `folha_fechamento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fechamento_atual` VARCHAR(7),
  `proximo_fechamento` VARCHAR(7),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `folha_ferias_coletivas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data_inicio` DATE,
  `data_fim` DATE,
  `dias_gozo` INT,
  `abono_pecuniario_inicio` DATE,
  `abono_pecuniario_fim` DATE,
  `dias_abono` INT,
  `data_pagamento` DATE,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `folha_historico_salarial` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_colaborador` INT NOT NULL,
  `competencia` VARCHAR(7),
  `salario_atual` DECIMAL(18,6),
  `percentual_aumento` DECIMAL(18,6),
  `salario_novo` DECIMAL(18,6),
  `valido_a_partir` VARCHAR(7),
  `motivo` VARCHAR(100),
  PRIMARY KEY (`id`),
  KEY `fk_FOLHA_HISTORICO_SALARIAL_COLABORADOR1_idx` (`id_colaborador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `folha_inss` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `competencia` VARCHAR(7),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `folha_inss_retencao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_folha_inss` INT NOT NULL,
  `id_folha_inss_servico` INT NOT NULL,
  `valor_mensal` DECIMAL(18,6),
  `valor_13` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_FOLHA_INSS_SERV_RETENCAO` (`id_folha_inss_servico`),
  KEY `FK_FOLHA_INSS_RETENCAO` (`id_folha_inss`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `folha_inss_servico` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` CHAR(3),
  `nome` VARCHAR(100),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `folha_lancamento_cabecalho` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_colaborador` INT NOT NULL,
  `competencia` VARCHAR(7),
  `tipo` CHAR(1),
  PRIMARY KEY (`id`),
  KEY `fk_FOLHA_LANCAMENTO_CABECALHO_COLABORADOR1_idx` (`id_colaborador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `folha_lancamento_comissao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_vendedor` INT NOT NULL,
  `competencia` VARCHAR(7),
  `vencimento` DATE,
  `base_calculo` DECIMAL(18,6),
  `valor_comissao` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `fk_FOLHA_LANCAMENTO_COMISSAO_VENDEDOR1_idx` (`id_vendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `folha_lancamento_detalhe` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_folha_evento` INT NOT NULL,
  `id_folha_lancamento_cabecalho` INT NOT NULL,
  `origem` DECIMAL(18,6),
  `provento` DECIMAL(18,6),
  `desconto` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_FOLHA_LANCAMENTO_CAB_DET` (`id_folha_lancamento_cabecalho`),
  KEY `FK_FOLHA_EVENTO_LANCAMENTO` (`id_folha_evento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `folha_parametro` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `competencia` VARCHAR(7),
  `contribui_pis` CHAR(1),
  `aliquota_pis` DECIMAL(18,6),
  `discriminar_dsr` CHAR(1),
  `dia_pagamento` CHAR(2),
  `calculo_proporcionalidade` CHAR(1),
  `descontar_faltas_13` CHAR(1),
  `pagar_adicionais_13` CHAR(1),
  `pagar_estagiarios_13` CHAR(1),
  `mes_adiantamento_13` CHAR(2),
  `percentual_adiantam_13` DECIMAL(18,6),
  `ferias_descontar_faltas` CHAR(1),
  `ferias_pagar_adicionais` CHAR(1),
  `ferias_adiantar_13` CHAR(1),
  `ferias_pagar_estagiarios` CHAR(1),
  `ferias_calc_justa_causa` CHAR(1),
  `ferias_movimento_mensal` CHAR(1),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `folha_plano_saude` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_colaborador` INT NOT NULL,
  `id_operadora_plano_saude` INT NOT NULL,
  `data_inicio` DATE,
  `beneficiario` CHAR(1),
  PRIMARY KEY (`id`),
  KEY `fk_FOLHA_PLANO_SAUDE_COLABORADOR1_idx` (`id_colaborador`),
  KEY `fk_FOLHA_PLANO_SAUDE_OPERADORA_PLANO_SAUDE1_idx` (`id_operadora_plano_saude`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `folha_ppp` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_colaborador` INT NOT NULL,
  `observacao` TEXT,
  PRIMARY KEY (`id`),
  KEY `fk_FOLHA_PPP_COLABORADOR1_idx` (`id_colaborador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `folha_ppp_atividade` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_folha_ppp` INT NOT NULL,
  `data_inicio` DATE,
  `data_fim` DATE,
  `descricao` TEXT,
  PRIMARY KEY (`id`),
  KEY `FK_FOLHA_PPP_ATIVIDADE` (`id_folha_ppp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `folha_ppp_cat` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_folha_ppp` INT NOT NULL,
  `numero_cat` INT,
  `data_afastamento` DATE,
  `data_registro` DATE,
  PRIMARY KEY (`id`),
  KEY `FK_FOLHA_PPP_CAT` (`id_folha_ppp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `folha_ppp_exame_medico` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_folha_ppp` INT NOT NULL,
  `data_ultimo` DATE,
  `tipo` CHAR(1),
  `natureza` VARCHAR(50),
  `exame` CHAR(1),
  `indicacao_resultados` VARCHAR(50),
  PRIMARY KEY (`id`),
  KEY `FK_FOLHA_PPP_EXAME_MEDIDO` (`id_folha_ppp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `folha_ppp_fator_risco` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_folha_ppp` INT NOT NULL,
  `data_inicio` DATE,
  `data_fim` DATE,
  `tipo` CHAR(1),
  `fator_risco` VARCHAR(40),
  `intensidade` VARCHAR(15),
  `tecnica_utilizada` VARCHAR(40),
  `epc_eficaz` CHAR(1),
  `epi_eficaz` CHAR(1),
  `ca_epi` INT,
  `atendimento_nr06_1` CHAR(1),
  `atendimento_nr06_2` CHAR(1),
  `atendimento_nr06_3` CHAR(1),
  `atendimento_nr06_4` CHAR(1),
  `atendimento_nr06_5` CHAR(1),
  PRIMARY KEY (`id`),
  KEY `FK_FOLHA_PPP_FATOR_RISCO` (`id_folha_ppp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `folha_rescisao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_colaborador` INT NOT NULL,
  `data_demissao` DATE,
  `data_pagamento` DATE,
  `motivo` VARCHAR(100),
  `motivo_esocial` CHAR(2),
  `data_aviso_previo` DATE,
  `dias_aviso_previo` INT,
  `comprovou_novo_emprego` CHAR(1),
  `dispensou_empregado` CHAR(1),
  `pensao_alimenticia` DECIMAL(18,6),
  `pensao_alimenticia_fgts` DECIMAL(18,6),
  `fgts_valor_rescisao` DECIMAL(18,6),
  `fgts_saldo_banco` DECIMAL(18,6),
  `fgts_complemento_saldo` DECIMAL(18,6),
  `fgts_codigo_afastamento` VARCHAR(10),
  `fgts_codigo_saque` VARCHAR(10),
  PRIMARY KEY (`id`),
  KEY `fk_FOLHA_RESCISAO_COLABORADOR1_idx` (`id_colaborador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `folha_tipo_afastamento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` CHAR(3),
  `nome` VARCHAR(100),
  `descricao` TEXT,
  `codigo_esocial` CHAR(2),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `folha_vale_transporte` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_empresa_transp_itin` INT NOT NULL,
  `id_colaborador` INT NOT NULL,
  `quantidade` INT,
  PRIMARY KEY (`id`),
  KEY `FK_EMP_TRA_ITIN_VAL_TRA` (`id_empresa_transp_itin`),
  KEY `fk_FOLHA_VALE_TRANSPORTE_COLABORADOR1_idx` (`id_colaborador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `fornecedor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_pessoa` INT NOT NULL,
  `desde` DATE,
  `data_cadastro` DATE,
  `observacao` VARCHAR(250),
  PRIMARY KEY (`id`),
  KEY `fk_FORNECEDOR_PESSOA1_idx` (`id_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `fornecedor_produto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_produto` INT NOT NULL,
  `id_fornecedor` INT NOT NULL,
  `codigo_fornecedor_produto` VARCHAR(20),
  `data_ultima_compra` DATE,
  `preco_ultima_compra` DECIMAL(18,6),
  `lote_minimo_compra` DECIMAL(18,6),
  `menor_embalagem_compra` DECIMAL(18,6),
  `custo_ultima_compra` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `fk_FORNECEDOR_PRODUTO_PRODUTO1_idx` (`id_produto`),
  KEY `fk_FORNECEDOR_PRODUTO_FORNECEDOR1_idx` (`id_fornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `fpas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` INT,
  `cnae` VARCHAR(14),
  `aliquota_sat` DECIMAL,
  `descricao` VARCHAR(250),
  `percentual_inss_patronal` DECIMAL(18,6),
  `codigo_terceiro` CHAR(4),
  `percentual_terceiros` DECIMAL(18,6),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `frota_combustivel_controle` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_frota_veiculo` INT NOT NULL,
  `data_abastecimento` DATE,
  `hora_abastecimento` VARCHAR(8),
  `valor_abastecimento` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `fk_FROTA_COMBUSTIVEL_CONTROLE_FROTA_VEICULO1_idx` (`id_frota_veiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `frota_combustivel_tipo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` CHAR(2),
  `nome` VARCHAR(100),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `frota_dpvat_controle` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_frota_veiculo` INT NOT NULL,
  `parcela` CHAR(2),
  `data_vencimento` DATE,
  `data_pagamento` DATE,
  `valor` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `fk_FROTA_IPVA_CONTROLE_FROTA_VEICULO1_idx` (`id_frota_veiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `frota_ipva_controle` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_frota_veiculo` INT NOT NULL,
  `parcela` CHAR(2),
  `data_vencimento` DATE,
  `data_pagamento` DATE,
  `valor` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `fk_FROTA_IPVA_CONTROLE_FROTA_VEICULO1_idx` (`id_frota_veiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `frota_motorista` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_pessoa_fisica` INT NOT NULL,
  `numero_cnh` VARCHAR(11),
  `cnh_categoria` CHAR(2),
  PRIMARY KEY (`id`),
  KEY `fk_FROTA_MOTORISTA_PESSOA_FISICA1_idx` (`id_pessoa_fisica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `frota_multa_controle` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_frota_veiculo` INT NOT NULL,
  `data_multa` DATE,
  `pontos` INT,
  `valor` DECIMAL(18,6),
  `observacao` TEXT,
  PRIMARY KEY (`id`),
  KEY `fk_FROTA_MULTA_CONTROLE_FROTA_VEICULO1_idx` (`id_frota_veiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `frota_veiculo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_frota_veiculo_tipo` INT NOT NULL,
  `id_frota_combustivel_tipo` INT NOT NULL,
  `renavam` VARCHAR(11),
  `ipva_mes_vencimento` CHAR(2),
  `dpvat_mes_vencimento` CHAR(2),
  `placa` VARCHAR(7),
  `marca` VARCHAR(100),
  `modelo` VARCHAR(100),
  `modelo_ano` CHAR(4),
  `codigo_fipe` VARCHAR(7),
  PRIMARY KEY (`id`),
  KEY `fk_FROTA_VEICULO_FROTA_VEICULO_TIPO1_idx` (`id_frota_veiculo_tipo`),
  KEY `fk_FROTA_VEICULO_FROTA_COMBUSTIVEL_TIPO1_idx` (`id_frota_combustivel_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `frota_veiculo_manutencao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_frota_veiculo` INT NOT NULL,
  `tipo` CHAR(1),
  `data_manutencao` DATE,
  `valor_manutencao` DECIMAL(18,6),
  `observacao` TEXT,
  PRIMARY KEY (`id`),
  KEY `fk_FROTA_VEICULO_MANUTENCAO_FROTA_VEICULO1_idx` (`id_frota_veiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `frota_veiculo_movimentacao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_frota_motorista` INT NOT NULL,
  `id_frota_veiculo` INT NOT NULL,
  `data_saida` DATE,
  `hora_saida` VARCHAR(8),
  `data_entrada` DATE,
  `hora_entrada` VARCHAR(8),
  `observacao` TEXT,
  PRIMARY KEY (`id`),
  KEY `fk_FROTA_VEICULO_MOVIMENTACAO_FROTA_MOTORISTA1_idx` (`id_frota_motorista`),
  KEY `fk_FROTA_VEICULO_MOVIMENTACAO_FROTA_VEICULO1_idx` (`id_frota_veiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `frota_veiculo_pneu` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data_troca` DATE,
  `valor_troca` DECIMAL(18,6),
  `posicao_pneu` VARCHAR(100),
  `marca_pneu` VARCHAR(100),
  `id_frota_veiculo` INT NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_FROTA_VEICULO_PNEU_FROTA_VEICULO1_idx` (`id_frota_veiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `frota_veiculo_sinistro` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_frota_veiculo` INT NOT NULL,
  `data_sinistro` DATE,
  `observacao` TEXT,
  PRIMARY KEY (`id`),
  KEY `fk_FROTA_SINISTRO_FROTA_VEICULO1_idx` (`id_frota_veiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `frota_veiculo_tipo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` CHAR(2),
  `nome` VARCHAR(100),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `funcao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100),
  `descricao` VARCHAR(250),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `ged_documento_cabecalho` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100),
  `descricao` TEXT,
  `data_inclusao` DATE,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `ged_documento_detalhe` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_ged_documento_cabecalho` INT NOT NULL,
  `id_ged_tipo_documento` INT NOT NULL,
  `nome` VARCHAR(100),
  `descricao` TEXT,
  `palavras_chave` VARCHAR(250),
  `pode_excluir` CHAR(1),
  `pode_alterar` CHAR(1),
  `assinado` CHAR(1),
  `data_fim_vigencia` DATE,
  `data_exclusao` DATE,
  PRIMARY KEY (`id`),
  KEY `FK_GED_TIPO_DOCUMENTO` (`id_ged_tipo_documento`),
  KEY `FK_GED_DOCUMENTO_CAB_DET` (`id_ged_documento_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `ged_tipo_documento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100),
  `tamanho_maximo` DECIMAL(18,6),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `ged_versao_documento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_ged_documento_detalhe` INT NOT NULL,
  `id_colaborador` INT NOT NULL,
  `versao` INT,
  `data_versao` DATE,
  `hora_versao` VARCHAR(8),
  `hash_arquivo` VARCHAR(250),
  `caminho` VARCHAR(250),
  `acao` CHAR(1),
  PRIMARY KEY (`id`),
  KEY `FK_GED_DOC_VERSAO_DOC` (`id_ged_documento_detalhe`),
  KEY `fk_GED_VERSAO_DOCUMENTO_COLABORADOR1_idx` (`id_colaborador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `gondola_armazenamento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_gondola_caixa` INT NOT NULL,
  `id_produto` INT NOT NULL,
  `quantidade` INT,
  PRIMARY KEY (`id`),
  KEY `FK_CAIXA_ARMAZENA` (`id_gondola_caixa`),
  KEY `fk_GONDOLA_ARMAZENAMENTO_PRODUTO1_idx` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `gondola_caixa` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_gondola_estante` INT NOT NULL,
  `codigo` VARCHAR(10),
  `altura` INT,
  `largura` INT,
  `profundidade` INT,
  PRIMARY KEY (`id`),
  KEY `FK_WMS_ESTANTE_CAIXA` (`id_gondola_estante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `gondola_estante` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_gondola_rua` INT NOT NULL,
  `codigo` VARCHAR(10),
  `quantidade_caixa` INT,
  PRIMARY KEY (`id`),
  KEY `FK_WMS_RUA_ESTANTE` (`id_gondola_rua`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `gondola_rua` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(10),
  `nome` VARCHAR(100),
  `quantidade_estante` INT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `guias_acumuladas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `gps_tipo` CHAR(1),
  `gps_competencia` VARCHAR(7),
  `gps_valor_inss` DECIMAL(18,6),
  `gps_valor_outras_ent` DECIMAL(18,6),
  `gps_data_pagamento` DATE,
  `irrf_competencia` VARCHAR(7),
  `irrf_codigo_recolhimento` INT,
  `irrf_valor_acumulado` DECIMAL(18,6),
  `irrf_data_pagamento` DATE,
  `pis_competencia` VARCHAR(7),
  `pis_valor_acumulado` DECIMAL(18,6),
  `pis_data_pagamento` DATE,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `ibpt` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ncm` VARCHAR(8),
  `ex` CHAR(2),
  `tipo` CHAR(1),
  `descricao` TEXT,
  `nacional_federal` DECIMAL(18,6),
  `importados_federal` DECIMAL(18,6),
  `estadual` DECIMAL(18,6),
  `municipal` DECIMAL(18,6),
  `vigencia_inicio` DATE,
  `vigencia_fim` DATE,
  `chave` VARCHAR(6),
  `versao` VARCHAR(6),
  `fonte` VARCHAR(34),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `inss` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `competencia` VARCHAR(7),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `inss_detalhe` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_inss` INT NOT NULL,
  `faixa` INT,
  `de` DECIMAL(18,6),
  `ate` DECIMAL(18,6),
  `taxa` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_INSS_DETALHE` (`id_inss`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `integracao_pdv` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `identifica` VARCHAR(50),
  `data_integracao` DATE,
  `hora_integracao` VARCHAR(8),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `inventario_contagem_cab` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data_contagem` DATE,
  `estoque_atualizado` CHAR(1),
  `tipo` CHAR(1),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `inventario_contagem_det` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_inventario_contagem_cab` INT NOT NULL,
  `id_produto` INT NOT NULL,
  `contagem01` DECIMAL(18,6),
  `contagem02` DECIMAL(18,6),
  `contagem03` DECIMAL(18,6),
  `fechado_contagem` CHAR(2),
  `quantidade_sistema` DECIMAL(18,6),
  `acuracidade` DECIMAL(18,6),
  `divergencia` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_CONTAGEM_CAB_DET` (`id_inventario_contagem_cab`),
  KEY `fk_INVENTARIO_CONTAGEM_DET_PRODUTO1_idx` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `irrf` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `competencia` VARCHAR(7),
  `desconto_por_dependente` DECIMAL(18,6),
  `minimo_para_retencao` DECIMAL(18,6),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `irrf_detalhe` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_irrf` INT NOT NULL,
  `faixa` INT,
  `de` DECIMAL(18,6),
  `ate` DECIMAL(18,6),
  `taxa` DECIMAL(18,6),
  `desconto` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_IRRF_DETALHE` (`id_irrf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `lanca_centro_resultado` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_centro_resultado` INT NOT NULL,
  `valor` DECIMAL(18,6),
  `historico` VARCHAR(250),
  `data_lancamento` DATE,
  `data_inclusao` DATE,
  `origem_de_rateio` CHAR(1),
  PRIMARY KEY (`id`),
  KEY `FK_CENTRO_LANCA` (`id_centro_resultado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `log_exportacao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data_exportacao` DATE,
  `hora_exportacao` VARCHAR(8),
  `erro` TEXT,
  `registro` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `log_importacao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data_importacao` DATE,
  `hora_importacao` VARCHAR(8),
  `erro` TEXT,
  `registro` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `malote_digital_acesso` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_malote_digital_destinatario` INT NOT NULL,
  `data_acesso` DATE,
  `hora_acesso` VARCHAR(8),
  PRIMARY KEY (`id`),
  KEY `FK_MALOTE_DIG_DEST_ACESSO` (`id_malote_digital_destinatario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `malote_digital_destinatario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_malote_digital_documento` INT NOT NULL,
  `id_colaborador` INT NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_MALOTE_DIGITAL_DEST` (`id_malote_digital_documento`),
  KEY `fk_MALOTE_DIGITAL_DESTINATARIO_COLABORADOR1_idx` (`id_colaborador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `malote_digital_documento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_colaborador` INT NOT NULL,
  `nome` VARCHAR(100),
  `nome_arquivo` INT,
  `formato` CHAR(3),
  `tamanho` INT,
  `assinado` CHAR(1),
  `data_envio` DATE,
  `assunto` VARCHAR(100),
  PRIMARY KEY (`id`),
  KEY `fk_MALOTE_DIGITAL_DOCUMENTO_COLABORADOR1_idx` (`id_colaborador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `mdfe_cabecalho` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `uf` INT,
  `tipo_ambiente` INT,
  `tipo_emitente` INT,
  `tipo_transportadora` INT,
  `modelo` CHAR(2),
  `serie` VARCHAR(3),
  `numero_mdfe` VARCHAR(9),
  `codigo_numerico` VARCHAR(8),
  `chave_acesso` VARCHAR(44),
  `digito_verificador` INT,
  `modal` INT,
  `data_hora_emissao` TIMESTAMP,
  `tipo_emissao` INT,
  `processo_emissao` INT,
  `versao_processo_emissao` VARCHAR(20),
  `uf_inicio` CHAR(2),
  `uf_fim` CHAR(2),
  `data_hora_previsao_viagem` TIMESTAMP,
  `quantidade_total_cte` INT,
  `quantidade_total_nfe` INT,
  `quantidade_total_mdfe` INT,
  `codigo_unidade_medida` CHAR(2),
  `peso_bruto_carga` DECIMAL(18,6),
  `valor_carga` DECIMAL(18,6),
  `numero_protocolo` VARCHAR(15),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `mdfe_emitente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_mdfe_cabecalho` INT NOT NULL,
  `nome` VARCHAR(60),
  `fantasia` VARCHAR(60),
  `cnpj` VARCHAR(14),
  `ie` INT,
  `logradouro` VARCHAR(60),
  `numero` VARCHAR(60),
  `complemento` VARCHAR(60),
  `bairro` VARCHAR(60),
  `codigo_municipio` VARCHAR(7),
  `nome_municipio` VARCHAR(60),
  `cep` VARCHAR(8),
  `uf` CHAR(2),
  `telefone` VARCHAR(12),
  `email` VARCHAR(60),
  PRIMARY KEY (`id`),
  KEY `FK_MDFE_CAB_EMIT` (`id_mdfe_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `mdfe_informacao_cte` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_mdfe_municipio_descarrega` INT NOT NULL,
  `chave_cte` VARCHAR(44),
  `segundo_codigo_barra` VARCHAR(36),
  `indicador_reentrega` INT,
  PRIMARY KEY (`id`),
  KEY `FK_MDFE_INFORMACAO_CTE` (`id_mdfe_municipio_descarrega`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `mdfe_informacao_nfe` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_mdfe_municipio_descarrega` INT NOT NULL,
  `chave_nfe` VARCHAR(44),
  `segundo_codigo_barra` VARCHAR(36),
  `indicador_reentrega` INT,
  PRIMARY KEY (`id`),
  KEY `FK_MDFE_INFORMACAO_NFE` (`id_mdfe_municipio_descarrega`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `mdfe_informacao_seguro` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_mdfe_cabecalho` INT NOT NULL,
  `responsavel` INT,
  `cnpj_cpf` VARCHAR(14),
  `seguradora` VARCHAR(11),
  `cnpj_seguradora` VARCHAR(14),
  `apolice` VARCHAR(20),
  `averbacao` VARCHAR(40),
  PRIMARY KEY (`id`),
  KEY `FK_MDFE_INFORMACAO_SEGURO` (`id_mdfe_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `mdfe_lacre` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_mdfe_cabecalho` INT NOT NULL,
  `numero_lacre` VARCHAR(20),
  PRIMARY KEY (`id`),
  KEY `FK_MDFE_LACRE` (`id_mdfe_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `mdfe_municipio_carregamento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_mdfe_cabecalho` INT NOT NULL,
  `nome_municipio` VARCHAR(60),
  `codigo_municipio` VARCHAR(7),
  PRIMARY KEY (`id`),
  KEY `FK_MDFE_MUNICIPIO_CARREGAMENTO` (`id_mdfe_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `mdfe_municipio_descarrega` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_mdfe_cabecalho` INT NOT NULL,
  `nome_municipio` VARCHAR(60),
  `codigo_municipio` VARCHAR(7),
  PRIMARY KEY (`id`),
  KEY `FK_MDFE_MUNICIPIO_DESCARREGAMENTO` (`id_mdfe_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `mdfe_percurso` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_mdfe_cabecalho` INT NOT NULL,
  `uf_percurso` CHAR(2),
  `data_inicio_viagem` DATE,
  PRIMARY KEY (`id`),
  KEY `FK_MDFE_PERCURSO` (`id_mdfe_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `mdfe_rodoviario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_mdfe_cabecalho` INT NOT NULL,
  `rntrc` VARCHAR(8),
  `codigo_agendamento` VARCHAR(16),
  PRIMARY KEY (`id`),
  KEY `FK_MDFE_CAB_RODO` (`id_mdfe_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `mdfe_rodoviario_ciot` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_mdfe_rodoviario` INT NOT NULL,
  `ciot` VARCHAR(12),
  `cpf` VARCHAR(11),
  `cnpj` VARCHAR(14),
  PRIMARY KEY (`id`),
  KEY `FK_MDFE_ROD_CIOT` (`id_mdfe_rodoviario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `mdfe_rodoviario_motorista` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_mdfe_rodoviario` INT NOT NULL,
  `nome` VARCHAR(60),
  `cpf` VARCHAR(11),
  PRIMARY KEY (`id`),
  KEY `FK_MDFE_RODOVIARIO_MOTORISTA` (`id_mdfe_rodoviario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `mdfe_rodoviario_pedagio` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_mdfe_rodoviario` INT NOT NULL,
  `cnpj_fornecedor` VARCHAR(14),
  `cnpj_responsavel` VARCHAR(14),
  `cpf_responsavel` VARCHAR(11),
  `numero_comprovante` VARCHAR(20),
  `valor` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_MDFE_RODOVIARIO_PEDAGIO` (`id_mdfe_rodoviario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `mdfe_rodoviario_veiculo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_mdfe_rodoviario` INT NOT NULL,
  `codigo_interno` VARCHAR(10),
  `placa` VARCHAR(7),
  `renavam` VARCHAR(11),
  `tara` INT,
  `capacidade_kg` INT,
  `capacidade_m3` INT,
  `tipo_rodado` CHAR(2),
  `tipo_carroceria` CHAR(2),
  `uf_licenciamento` CHAR(2),
  `proprietario_cpf` VARCHAR(11),
  `proprietario_cnpj` VARCHAR(14),
  `proprietario_rntrc` VARCHAR(8),
  `proprietario_nome` VARCHAR(60),
  `proprietario_ie` VARCHAR(2),
  `proprietario_tipo` INT,
  PRIMARY KEY (`id`),
  KEY `FK_MDFE_RODOVIARIO_VEICULO` (`id_mdfe_rodoviario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `municipio` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_uf` INT NOT NULL,
  `nome` VARCHAR(100),
  `codigo_ibge` INT,
  `codigo_receita_federal` INT,
  `codigo_estadual` INT,
  PRIMARY KEY (`id`),
  KEY `fk_MUNICIPIO_UF1_idx` (`id_uf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `ncm` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(8),
  `descricao` VARCHAR(1000),
  `observacao` VARCHAR(1000),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfce_caixa` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50),
  `data_cadastro` DATE,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfce_fechamento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_nfce_movimento` INT NOT NULL,
  `id_nfce_tipo_pagamento` INT NOT NULL,
  `valor` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_NFCE_MOV_FECHA` (`id_nfce_movimento`),
  KEY `fk_NFCE_FECHAMENTO_NFCE_TIPO_PAGAMENTO1_idx` (`id_nfce_tipo_pagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfce_movimento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_nfce_caixa` INT NOT NULL,
  `id_nfce_operador` INT,
  `id_gerente_supervisor` INT,
  `data_abertura` DATE,
  `hora_abertura` VARCHAR(8),
  `data_fechamento` DATE,
  `hora_fechamento` VARCHAR(8),
  `total_suprimento` DECIMAL(18,6),
  `total_sangria` DECIMAL(18,6),
  `total_nao_fiscal` DECIMAL(18,6),
  `total_venda` DECIMAL(18,6),
  `total_desconto` DECIMAL(18,6),
  `total_acrescimo` DECIMAL(18,6),
  `total_final` DECIMAL(18,6),
  `total_recebido` DECIMAL(18,6),
  `total_troco` DECIMAL(18,6),
  `total_cancelado` DECIMAL(18,6),
  `status_movimento` CHAR(1),
  PRIMARY KEY (`id`),
  KEY `FK_NFCE_OPERADOR_MOV` (`id_nfce_operador`),
  KEY `FK_NFCE_CAIXA_MOV` (`id_nfce_caixa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfce_operador` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_colaborador` INT NOT NULL,
  `login` VARCHAR(20),
  `senha` VARCHAR(20),
  `nivel_autorizacao` CHAR(1),
  PRIMARY KEY (`id`),
  KEY `fk_NFCE_OPERADOR_COLABORADOR1_idx` (`id_colaborador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfce_sangria` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_nfce_movimento` INT NOT NULL,
  `data_sangria` DATE,
  `valor` DECIMAL(18,6),
  `observacao` TEXT,
  PRIMARY KEY (`id`),
  KEY `FK_NFCE_MOV_SANGRIA` (`id_nfce_movimento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfce_suprimento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_nfce_movimento` INT NOT NULL,
  `data_suprimento` DATE,
  `valor` DECIMAL(18,6),
  `observacao` TEXT,
  PRIMARY KEY (`id`),
  KEY `FK_NFCE_MOV_SUPRIMENTO` (`id_nfce_movimento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfce_tipo_pagamento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` CHAR(2),
  `descricao` VARCHAR(20),
  `permite_troco` CHAR(1),
  `gera_parcelas` CHAR(1),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfe_acesso_xml` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_nfe_cabecalho` INT NOT NULL,
  `cnpj` VARCHAR(14),
  `cpf` VARCHAR(11),
  PRIMARY KEY (`id`),
  KEY `FK_ACESSO_XML` (`id_nfe_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfe_cabecalho` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_vendedor` INT,
  `uf_emitente` INT,
  `codigo_numerico` VARCHAR(8),
  `natureza_operacao` VARCHAR(60),
  `codigo_modelo` CHAR(2),
  `serie` CHAR(3),
  `numero` VARCHAR(9),
  `data_hora_emissao` TIMESTAMP,
  `data_hora_entrada_saida` TIMESTAMP,
  `tipo_operacao` CHAR(1),
  `local_destino` CHAR(1),
  `codigo_municipio` INT,
  `formato_impressao_danfe` CHAR(1),
  `tipo_emissao` CHAR(1),
  `chave_acesso` VARCHAR(44),
  `digito_chave_acesso` CHAR(1),
  `ambiente` CHAR(1),
  `finalidade_emissao` CHAR(1),
  `consumidor_operacao` CHAR(1),
  `consumidor_presenca` CHAR(1),
  `processo_emissao` CHAR(1),
  `versao_processo_emissao` VARCHAR(20),
  `data_entrada_contingencia` TIMESTAMP,
  `justificativa_contingencia` VARCHAR(255),
  `base_calculo_icms` DECIMAL(18,6),
  `valor_icms` DECIMAL(18,6),
  `valor_icms_desonerado` DECIMAL(18,6),
  `total_icms_fcp_uf_destino` DECIMAL(18,6),
  `total_icms_interestadual_uf_destino` DECIMAL(18,6),
  `total_icms_interestadual_uf_remetente` DECIMAL(18,6),
  `valor_total_fcp` DECIMAL(18,6),
  `base_calculo_icms_st` DECIMAL(18,6),
  `valor_icms_st` DECIMAL(18,6),
  `valor_total_fcp_st` DECIMAL(18,6),
  `valor_total_fcp_st_retido` DECIMAL(18,6),
  `valor_total_produtos` DECIMAL(18,6),
  `valor_frete` DECIMAL(18,6),
  `valor_seguro` DECIMAL(18,6),
  `valor_desconto` DECIMAL(18,6),
  `valor_imposto_importacao` DECIMAL(18,6),
  `valor_ipi` DECIMAL(18,6),
  `valor_ipi_devolvido` DECIMAL(18,6),
  `valor_pis` DECIMAL(18,6),
  `valor_cofins` DECIMAL(18,6),
  `valor_despesas_acessorias` DECIMAL(18,6),
  `valor_total` DECIMAL(18,6),
  `valor_total_tributos` DECIMAL(18,6),
  `valor_servicos` DECIMAL(18,6),
  `base_calculo_issqn` DECIMAL(18,6),
  `valor_issqn` DECIMAL(18,6),
  `valor_pis_issqn` DECIMAL(18,6),
  `valor_cofins_issqn` DECIMAL(18,6),
  `data_prestacao_servico` DATE,
  `valor_deducao_issqn` DECIMAL(18,6),
  `outras_retencoes_issqn` DECIMAL(18,6),
  `desconto_incondicionado_issqn` DECIMAL(18,6),
  `desconto_condicionado_issqn` DECIMAL(18,6),
  `total_retencao_issqn` DECIMAL(18,6),
  `regime_especial_tributacao` CHAR(1),
  `valor_retido_pis` DECIMAL(18,6),
  `valor_retido_cofins` DECIMAL(18,6),
  `valor_retido_csll` DECIMAL(18,6),
  `base_calculo_irrf` DECIMAL(18,6),
  `valor_retido_irrf` DECIMAL(18,6),
  `base_calculo_previdencia` DECIMAL(18,6),
  `valor_retido_previdencia` DECIMAL(18,6),
  `informacoes_add_fisco` TEXT,
  `informacoes_add_contribuinte` TEXT,
  `comex_uf_embarque` CHAR(2),
  `comex_local_embarque` VARCHAR(60),
  `comex_local_despacho` VARCHAR(60),
  `compra_nota_empenho` VARCHAR(22),
  `compra_pedido` VARCHAR(60),
  `compra_contrato` VARCHAR(60),
  `qrcode` TEXT,
  `url_chave` VARCHAR(85),
  `status_nota` CHAR(1),
  `id_fornecedor` INT,
  `id_nfce_movimento` INT,
  `id_venda_cabecalho` INT,
  `id_tribut_operacao_fiscal` INT,
  `id_cliente` INT,
  PRIMARY KEY (`id`),
  KEY `fk_NFE_CABECALHO_VENDEDOR1_idx` (`id_vendedor`),
  KEY `fk_NFE_CABECALHO_FORNECEDOR1_idx` (`id_fornecedor`),
  KEY `fk_NFE_CABECALHO_NFCE_MOVIMENTO1_idx` (`id_nfce_movimento`),
  KEY `fk_NFE_CABECALHO_VENDA_CABECALHO1_idx` (`id_venda_cabecalho`),
  KEY `fk_NFE_CABECALHO_TRIBUT_OPERACAO_FISCAL1_idx` (`id_tribut_operacao_fiscal`),
  KEY `fk_NFE_CABECALHO_CLIENTE1_idx` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfe_cana` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_nfe_cabecalho` INT NOT NULL,
  `safra` VARCHAR(9),
  `mes_ano_referencia` VARCHAR(7),
  PRIMARY KEY (`id`),
  KEY `FK_NFE_CAB_CANA` (`id_nfe_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfe_cana_deducoes_safra` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_nfe_cana` INT NOT NULL,
  `decricao` VARCHAR(60),
  `valor_deducao` DECIMAL(18,6),
  `valor_fornecimento` DECIMAL(18,6),
  `valor_total_deducao` DECIMAL(18,6),
  `valor_liquido_fornecimento` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_NFE_CANA_DEDUCOES` (`id_nfe_cana`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfe_cana_fornecimento_diario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_nfe_cana` INT NOT NULL,
  `dia` CHAR(2),
  `quantidade` DECIMAL(18,6),
  `quantidade_total_mes` DECIMAL(18,6),
  `quantidade_total_anterior` DECIMAL(18,6),
  `quantidade_total_geral` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_NFE_CANA_FORNECIMENTO` (`id_nfe_cana`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfe_configuracao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `certificado_digital_serie` VARCHAR(100),
  `certificado_digital_caminho` TEXT,
  `certificado_digital_senha` VARCHAR(100),
  `tipo_emissao` INT,
  `formato_impressao_danfe` INT,
  `processo_emissao` INT,
  `versao_processo_emissao` VARCHAR(20),
  `caminho_logomarca` TEXT,
  `salvar_xml` CHAR(1),
  `caminho_salvar_xml` TEXT,
  `caminho_schemas` TEXT,
  `caminho_arquivo_danfe` TEXT,
  `caminho_salvar_pdf` TEXT,
  `webservice_uf` CHAR(2),
  `webservice_ambiente` INT,
  `webservice_proxy_host` VARCHAR(100),
  `webservice_proxy_porta` INT,
  `webservice_proxy_usuario` VARCHAR(100),
  `webservice_proxy_senha` VARCHAR(100),
  `webservice_visualizar` CHAR(1),
  `email_servidor_smtp` VARCHAR(100),
  `email_porta` INT,
  `email_usuario` VARCHAR(100),
  `email_senha` VARCHAR(100),
  `email_assunto` VARCHAR(100),
  `email_autentica_ssl` CHAR(1),
  `email_texto` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfe_cte_referenciado` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_nfe_cabecalho` INT NOT NULL,
  `chave_acesso` VARCHAR(44),
  PRIMARY KEY (`id`),
  KEY `FK_NFE_CTE_REFERENCIADO` (`id_nfe_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfe_cupom_fiscal_referenciado` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_nfe_cabecalho` INT NOT NULL,
  `modelo_documento_fiscal` CHAR(2),
  `numero_ordem_ecf` INT,
  `coo` INT,
  `data_emissao_cupom` DATE,
  `numero_caixa` INT,
  `numero_serie_ecf` VARCHAR(21),
  PRIMARY KEY (`id`),
  KEY `FK_NFE_CF_REFERENCIADO` (`id_nfe_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfe_declaracao_importacao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_nfe_detalhe` INT NOT NULL,
  `numero_documento` VARCHAR(12),
  `data_registro` DATE,
  `local_desembaraco` VARCHAR(60),
  `uf_desembaraco` CHAR(2),
  `data_desembaraco` DATE,
  `via_transporte` CHAR(1),
  `valor_afrmm` DECIMAL(18,6),
  `forma_intermediacao` CHAR(1),
  `cnpj` VARCHAR(14),
  `uf_terceiro` CHAR(2),
  `codigo_exportador` VARCHAR(60),
  PRIMARY KEY (`id`),
  KEY `FK_NFE_DET_DEC_IMPORTACAO` (`id_nfe_detalhe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfe_destinatario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_nfe_cabecalho` INT NOT NULL,
  `cnpj` VARCHAR(14),
  `cpf` VARCHAR(11),
  `estrangeiro_identificacao` VARCHAR(20),
  `nome` VARCHAR(60),
  `logradouro` VARCHAR(60),
  `numero` VARCHAR(60),
  `complemento` VARCHAR(60),
  `bairro` VARCHAR(60),
  `codigo_municipio` INT,
  `nome_municipio` VARCHAR(60),
  `uf` CHAR(2),
  `cep` VARCHAR(8),
  `codigo_pais` INT,
  `nome_pais` VARCHAR(60),
  `telefone` VARCHAR(14),
  `indicador_ie` CHAR(1),
  `inscricao_estadual` VARCHAR(14),
  `suframa` INT,
  `inscricao_municipal` VARCHAR(15),
  `email` VARCHAR(60),
  PRIMARY KEY (`id`),
  KEY `FK_NFE_DESTINATARIO` (`id_nfe_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfe_detalhe` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_nfe_cabecalho` INT NOT NULL,
  `id_produto` INT,
  `numero_item` INT,
  `codigo_produto` VARCHAR(60),
  `gtin` VARCHAR(14),
  `nome_produto` VARCHAR(120),
  `ncm` VARCHAR(8),
  `nve` VARCHAR(6),
  `cest` VARCHAR(7),
  `indicador_escala_relevante` CHAR(1),
  `cnpj_fabricante` VARCHAR(14),
  `codigo_beneficio_fiscal` VARCHAR(10),
  `ex_tipi` INT,
  `cfop` INT,
  `unidade_comercial` VARCHAR(6),
  `quantidade_comercial` DECIMAL(18,6),
  `numero_pedido_compra` VARCHAR(15),
  `item_pedido_compra` INT,
  `numero_fci` VARCHAR(36),
  `numero_recopi` VARCHAR(20),
  `valor_unitario_comercial` DECIMAL(18,6),
  `valor_bruto_produto` DECIMAL(18,6),
  `gtin_unidade_tributavel` VARCHAR(14),
  `unidade_tributavel` VARCHAR(6),
  `quantidade_tributavel` DECIMAL(18,6),
  `valor_unitario_tributavel` DECIMAL(18,6),
  `valor_frete` DECIMAL(18,6),
  `valor_seguro` DECIMAL(18,6),
  `valor_desconto` DECIMAL(18,6),
  `valor_outras_despesas` DECIMAL(18,6),
  `entra_total` CHAR(1),
  `valor_total_tributos` DECIMAL(18,6),
  `percentual_devolvido` DECIMAL(18,6),
  `valor_ipi_devolvido` DECIMAL(18,6),
  `informacoes_adicionais` TEXT,
  `valor_subtotal` DECIMAL(18,6),
  `valor_total` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_NFE_CAB_DET` (`id_nfe_cabecalho`),
  KEY `fk_NFE_DETALHE_PRODUTO1_idx` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfe_detalhe_imposto_cofins` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_nfe_detalhe` INT NOT NULL,
  `cst_cofins` CHAR(2),
  `base_calculo_cofins` DECIMAL(18,6),
  `aliquota_cofins_percentual` DECIMAL(18,6),
  `quantidade_vendida` DECIMAL(18,6),
  `aliquota_cofins_reais` DECIMAL(18,6),
  `valor_cofins` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_NFE_DET_COFINS` (`id_nfe_detalhe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfe_detalhe_imposto_cofins_st` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_nfe_detalhe` INT NOT NULL,
  `base_calculo_cofins_st` DECIMAL(18,6),
  `aliquota_cofins_st_percentual` DECIMAL(18,6),
  `quantidade_vendida_cofins_st` DECIMAL(18,6),
  `aliquota_cofins_st_reais` DECIMAL(18,6),
  `valor_cofins_st` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_NFE_DET_COFINS` (`id_nfe_detalhe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfe_detalhe_imposto_icms` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_nfe_detalhe` INT NOT NULL,
  `origem_mercadoria` CHAR(1),
  `cst_icms` CHAR(2),
  `csosn` CHAR(3),
  `modalidade_bc_icms` CHAR(1),
  `percentual_reducao_bc_icms` DECIMAL(18,6),
  `valor_bc_icms` DECIMAL(18,6),
  `aliquota_icms` DECIMAL(18,6),
  `valor_icms_operacao` DECIMAL(18,6),
  `percentual_diferimento` DECIMAL(18,6),
  `valor_icms_diferido` DECIMAL(18,6),
  `valor_icms` DECIMAL(18,6),
  `base_calculo_fcp` DECIMAL(18,6),
  `percentual_fcp` DECIMAL(18,6),
  `valor_fcp` DECIMAL(18,6),
  `modalidade_bc_icms_st` CHAR(1),
  `percentual_mva_icms_st` DECIMAL(18,6),
  `percentual_reducao_bc_icms_st` DECIMAL(18,6),
  `valor_base_calculo_icms_st` DECIMAL(18,6),
  `aliquota_icms_st` DECIMAL(18,6),
  `valor_icms_st` DECIMAL(18,6),
  `base_calculo_fcp_st` DECIMAL(18,6),
  `percentual_fcp_st` DECIMAL(18,6),
  `valor_fcp_st` DECIMAL(18,6),
  `uf_st` CHAR(2),
  `percentual_bc_operacao_propria` DECIMAL(18,6),
  `valor_bc_icms_st_retido` DECIMAL(18,6),
  `aliquota_suportada_consumidor` DECIMAL(18,6),
  `valor_icms_substituto` DECIMAL(18,6),
  `valor_icms_st_retido` DECIMAL(18,6),
  `base_calculo_fcp_st_retido` DECIMAL(18,6),
  `percentual_fcp_st_retido` DECIMAL(18,6),
  `valor_fcp_st_retido` DECIMAL(18,6),
  `motivo_desoneracao_icms` CHAR(2),
  `valor_icms_desonerado` DECIMAL(18,6),
  `aliquota_credito_icms_sn` DECIMAL(18,6),
  `valor_credito_icms_sn` DECIMAL(18,6),
  `valor_bc_icms_st_destino` DECIMAL(18,6),
  `valor_icms_st_destino` DECIMAL(18,6),
  `percentual_reducao_bc_efetivo` DECIMAL(18,6),
  `valor_bc_efetivo` DECIMAL(18,6),
  `aliquota_icms_efetivo` DECIMAL(18,6),
  `valor_icms_efetivo` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_NFE_DET_ICMS` (`id_nfe_detalhe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfe_detalhe_imposto_icms_ufdest` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_nfe_detalhe` INT NOT NULL,
  `valor_bc_icms_uf_destino` DECIMAL(18,6),
  `valor_bc_fcp_uf_destino` DECIMAL(18,6),
  `percentual_fcp_uf_destino` DECIMAL(18,6),
  `aliquota_interna_uf_destino` DECIMAL(18,6),
  `aliquota_interesdatual_uf_envolvidas` DECIMAL(18,6),
  `percentual_provisorio_partilha_icms` DECIMAL(18,6),
  `valor_icms_fcp_uf_destino` DECIMAL(18,6),
  `valor_interestadual_uf_destino` DECIMAL(18,6),
  `valor_interestadual_uf_remetente` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_NFE_DET_ICMS` (`id_nfe_detalhe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfe_detalhe_imposto_ii` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_nfe_detalhe` INT NOT NULL,
  `valor_bc_ii` DECIMAL(18,6),
  `valor_despesas_aduaneiras` DECIMAL(18,6),
  `valor_imposto_importacao` DECIMAL(18,6),
  `valor_iof` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_NFE_DET_II` (`id_nfe_detalhe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfe_detalhe_imposto_ipi` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_nfe_detalhe` INT NOT NULL,
  `cnpj_produtor` VARCHAR(14),
  `codigo_selo_ipi` VARCHAR(60),
  `quantidade_selo_ipi` INT,
  `enquadramento_legal_ipi` CHAR(3),
  `cst_ipi` CHAR(2),
  `valor_base_calculo_ipi` DECIMAL(18,6),
  `quantidade_unidade_tributavel` DECIMAL(18,6),
  `valor_unidade_tributavel` DECIMAL(18,6),
  `aliquota_ipi` DECIMAL(18,6),
  `valor_ipi` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_NFE_DET_IPI` (`id_nfe_detalhe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfe_detalhe_imposto_issqn` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_nfe_detalhe` INT NOT NULL,
  `base_calculo_issqn` DECIMAL(18,6),
  `aliquota_issqn` DECIMAL(18,6),
  `valor_issqn` DECIMAL(18,6),
  `municipio_issqn` INT,
  `item_lista_servicos` INT,
  `valor_deducao` DECIMAL(18,6),
  `valor_outras_retencoes` DECIMAL(18,6),
  `valor_desconto_incondicionado` DECIMAL(18,6),
  `valor_desconto_condicionado` DECIMAL(18,6),
  `valor_retencao_iss` DECIMAL(18,6),
  `indicador_exigibilidade_iss` CHAR(1),
  `codigo_servico` VARCHAR(20),
  `municipio_incidencia` INT,
  `pais_sevico_prestado` INT,
  `numero_processo` VARCHAR(30),
  `indicador_incentivo_fiscal` CHAR(1),
  PRIMARY KEY (`id`),
  KEY `FK_NFE_DET_ISSQN` (`id_nfe_detalhe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfe_detalhe_imposto_pis` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_nfe_detalhe` INT NOT NULL,
  `cst_pis` CHAR(2),
  `valor_base_calculo_pis` DECIMAL(18,6),
  `aliquota_pis_percentual` DECIMAL(18,6),
  `valor_pis` DECIMAL(18,6),
  `quantidade_vendida` DECIMAL(18,6),
  `aliquota_pis_reais` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_NFE_DET_PIS` (`id_nfe_detalhe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfe_detalhe_imposto_pis_st` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_nfe_detalhe` INT NOT NULL,
  `valor_base_calculo_pis_st` DECIMAL(18,6),
  `aliquota_pis_st_percentual` DECIMAL(18,6),
  `quantidade_vendida_pis_st` DECIMAL(18,6),
  `aliquota_pis_st_reais` DECIMAL(18,6),
  `valor_pis_st` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_NFE_DET_PIS` (`id_nfe_detalhe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfe_det_especifico_armamento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_nfe_detalhe` INT NOT NULL,
  `tipo_arma` CHAR(1),
  `numero_serie_arma` VARCHAR(15),
  `numero_serie_cano` VARCHAR(15),
  `descricao` VARCHAR(250),
  PRIMARY KEY (`id`),
  KEY `FK_NFE_DET_ESP_ARMAMENTO` (`id_nfe_detalhe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfe_det_especifico_combustivel` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_nfe_detalhe` INT NOT NULL,
  `codigo_anp` INT,
  `descricao_anp` VARCHAR(95),
  `percentual_glp` DECIMAL(18,6),
  `percentual_gas_nacional` DECIMAL(18,6),
  `percentual_gas_importado` DECIMAL(18,6),
  `valor_partida` DECIMAL(18,6),
  `codif` VARCHAR(21),
  `quantidade_temp_ambiente` DECIMAL(18,6),
  `uf_consumo` CHAR(2),
  `cide_base_calculo` DECIMAL(18,6),
  `cide_aliquota` DECIMAL(18,6),
  `cide_valor` DECIMAL(18,6),
  `encerrante_bico` INT,
  `encerrante_bomba` INT,
  `encerrante_tanque` INT,
  `encerrante_valor_inicio` DECIMAL(18,6),
  `encerrante_valor_fim` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_NFE_DET_ESP_COMBUSTIVEL` (`id_nfe_detalhe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfe_det_especifico_medicamento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_nfe_detalhe` INT NOT NULL,
  `codigo_anvisa` VARCHAR(13),
  `motivo_isencao` VARCHAR(250),
  `preco_maximo_consumidor` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_NFE_DET_ESP_MEDICAMENTO` (`id_nfe_detalhe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfe_det_especifico_veiculo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_nfe_detalhe` INT NOT NULL,
  `tipo_operacao` CHAR(1),
  `chassi` VARCHAR(17),
  `cor` VARCHAR(4),
  `descricao_cor` VARCHAR(40),
  `potencia_motor` VARCHAR(4),
  `cilindradas` VARCHAR(4),
  `peso_liquido` VARCHAR(9),
  `peso_bruto` VARCHAR(9),
  `numero_serie` VARCHAR(9),
  `tipo_combustivel` CHAR(2),
  `numero_motor` VARCHAR(21),
  `capacidade_maxima_tracao` VARCHAR(9),
  `distancia_eixos` VARCHAR(4),
  `ano_modelo` CHAR(4),
  `ano_fabricacao` CHAR(4),
  `tipo_pintura` CHAR(1),
  `tipo_veiculo` CHAR(2),
  `especie_veiculo` CHAR(1),
  `condicao_vin` CHAR(1),
  `condicao_veiculo` CHAR(1),
  `codigo_marca_modelo` VARCHAR(6),
  `codigo_cor_denatran` CHAR(2),
  `lotacao_maxima` INT,
  `restricao` CHAR(1),
  PRIMARY KEY (`id`),
  KEY `FK_NFE_DET_ESPECIFICO_VEICULO` (`id_nfe_detalhe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfe_duplicata` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_nfe_fatura` INT NOT NULL,
  `numero` VARCHAR(60),
  `data_vencimento` DATE,
  `valor` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `fk_NFE_DUPLICATA_NFE_FATURA1_idx` (`id_nfe_fatura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfe_emitente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_nfe_cabecalho` INT NOT NULL,
  `cnpj` VARCHAR(14),
  `cpf` VARCHAR(11),
  `nome` VARCHAR(60),
  `fantasia` VARCHAR(60),
  `logradouro` VARCHAR(60),
  `numero` VARCHAR(60),
  `complemento` VARCHAR(60),
  `bairro` VARCHAR(60),
  `codigo_municipio` INT,
  `nome_municipio` VARCHAR(60),
  `uf` CHAR(2),
  `cep` VARCHAR(8),
  `codigo_pais` INT DEFAULT 1058,
  `nome_pais` VARCHAR(60) DEFAULT 'BRASIL',
  `telefone` VARCHAR(14),
  `inscricao_estadual` VARCHAR(14),
  `inscricao_estadual_st` VARCHAR(14),
  `inscricao_municipal` VARCHAR(15),
  `cnae` VARCHAR(7),
  `crt` CHAR(1),
  PRIMARY KEY (`id`),
  KEY `FK_NFE_EMITENTE` (`id_nfe_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfe_exportacao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_nfe_detalhe` INT NOT NULL,
  `drawback` INT,
  `numero_registro` INT,
  `chave_acesso` VARCHAR(44),
  `quantidade` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_NFE_EXPORTACAO` (`id_nfe_detalhe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfe_fatura` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_nfe_cabecalho` INT NOT NULL,
  `numero` VARCHAR(60),
  `valor_original` DECIMAL(18,6),
  `valor_desconto` DECIMAL(18,6),
  `valor_liquido` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_NFE_CAB_FATURA` (`id_nfe_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfe_importacao_detalhe` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_nfe_declaracao_importacao` INT NOT NULL,
  `numero_adicao` INT,
  `numero_sequencial` INT,
  `codigo_fabricante_estrangeiro` VARCHAR(60),
  `valor_desconto` DECIMAL(18,6),
  `drawback` INT,
  PRIMARY KEY (`id`),
  KEY `FK_NFE_IMPORTACAO_DETALHE` (`id_nfe_declaracao_importacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfe_informacao_pagamento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_nfe_cabecalho` INT NOT NULL,
  `indicador_pagamento` CHAR(1),
  `meio_pagamento` CHAR(2),
  `valor` DECIMAL(18,6),
  `tipo_integracao` CHAR(1),
  `cnpj_operadora_cartao` VARCHAR(14),
  `bandeira` CHAR(2),
  `numero_autorizacao` VARCHAR(20),
  `troco` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_NFE_FORMA_PAGAMENTO` (`id_nfe_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfe_item_rastreado` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_nfe_detalhe` INT NOT NULL,
  `numero_lote` VARCHAR(20),
  `quantidade_itens` DECIMAL(18,6),
  `data_fabricacao` DATE,
  `data_validade` DATE,
  `codigo_agregacao` VARCHAR(20),
  PRIMARY KEY (`id`),
  KEY `fk_NFE_ITEM_RASTREADO_NFE_DETALHE1_idx` (`id_nfe_detalhe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfe_local_entrega` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_nfe_cabecalho` INT NOT NULL,
  `cnpj` VARCHAR(14),
  `cpf` VARCHAR(11),
  `nome_recebedor` VARCHAR(60),
  `logradouro` VARCHAR(60),
  `numero` VARCHAR(60),
  `complemento` VARCHAR(60),
  `bairro` VARCHAR(60),
  `codigo_municipio` INT,
  `nome_municipio` VARCHAR(60),
  `uf` CHAR(2),
  `cep` VARCHAR(8),
  `codigo_pais` INT,
  `nome_pais` VARCHAR(60),
  `telefone` VARCHAR(14),
  `email` VARCHAR(60),
  `inscricao_estadual` VARCHAR(14),
  PRIMARY KEY (`id`),
  KEY `FK_NFE_LOCAL_ENTREGA` (`id_nfe_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfe_local_retirada` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_nfe_cabecalho` INT NOT NULL,
  `cnpj` VARCHAR(14),
  `cpf` VARCHAR(11),
  `nome_expedidor` VARCHAR(60),
  `logradouro` VARCHAR(60),
  `numero` VARCHAR(60),
  `complemento` VARCHAR(60),
  `bairro` VARCHAR(60),
  `codigo_municipio` INT,
  `nome_municipio` VARCHAR(60),
  `uf` CHAR(2),
  `cep` VARCHAR(8),
  `codigo_pais` INT,
  `nome_pais` VARCHAR(60),
  `telefone` VARCHAR(14),
  `email` VARCHAR(60),
  `inscricao_estadual` VARCHAR(14),
  PRIMARY KEY (`id`),
  KEY `FK_NFE_LOCAL_RETIRADA` (`id_nfe_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfe_nf_referenciada` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_nfe_cabecalho` INT NOT NULL,
  `codigo_uf` INT,
  `ano_mes` VARCHAR(4),
  `cnpj` VARCHAR(14),
  `modelo` CHAR(2) DEFAULT '01',
  `serie` CHAR(3),
  `numero_nf` INT,
  PRIMARY KEY (`id`),
  KEY `FK_NFE_NF_REFERENCIADA` (`id_nfe_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfe_numero` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `serie` CHAR(3),
  `numero` INT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfe_numero_inutilizado` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `serie` CHAR(3),
  `numero` INT,
  `data_inutilizacao` DATE,
  `observacao` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfe_processo_referenciado` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_nfe_cabecalho` INT NOT NULL,
  `identificador` VARCHAR(60),
  `origem` CHAR(1),
  PRIMARY KEY (`id`),
  KEY `NFE_CAB_PROC_REF` (`id_nfe_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfe_prod_rural_referenciada` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_nfe_cabecalho` INT NOT NULL,
  `codigo_uf` INT,
  `ano_mes` VARCHAR(4),
  `cnpj` VARCHAR(14),
  `cpf` VARCHAR(11),
  `inscricao_estadual` VARCHAR(14),
  `modelo` CHAR(2),
  `serie` CHAR(3),
  `numero_nf` INT,
  PRIMARY KEY (`id`),
  KEY `FK_NFE_RURAL_REFERENCIADO` (`id_nfe_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfe_referenciada` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_nfe_cabecalho` INT NOT NULL,
  `chave_acesso` VARCHAR(44),
  PRIMARY KEY (`id`),
  KEY `FK_NFE_REFERENCIADA` (`id_nfe_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfe_responsavel_tecnico` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_nfe_cabecalho` INT NOT NULL,
  `cnpj` VARCHAR(14),
  `contato` VARCHAR(60),
  `email` VARCHAR(60),
  `telefone` VARCHAR(14),
  `identificador_csrt` CHAR(2),
  `hash_csrt` VARCHAR(28),
  PRIMARY KEY (`id`),
  KEY `fk_NFE_RESPONSAVEL_TECNICO_NFE_CABECALHO1_idx` (`id_nfe_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfe_transporte` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_nfe_cabecalho` INT NOT NULL,
  `id_transportadora` INT,
  `modalidade_frete` CHAR(1),
  `cnpj` VARCHAR(14),
  `cpf` VARCHAR(11),
  `nome` VARCHAR(60),
  `inscricao_estadual` VARCHAR(14),
  `endereco` VARCHAR(60),
  `nome_municipio` VARCHAR(60),
  `uf` CHAR(2),
  `valor_servico` DECIMAL(18,6),
  `valor_bc_retencao_icms` DECIMAL(18,6),
  `aliquota_retencao_icms` DECIMAL(18,6),
  `valor_icms_retido` DECIMAL(18,6),
  `cfop` INT,
  `municipio` INT,
  `placa_veiculo` VARCHAR(7),
  `uf_veiculo` CHAR(2),
  `rntc_veiculo` VARCHAR(20),
  PRIMARY KEY (`id`),
  KEY `FK_NFE_TRANSPORTE` (`id_nfe_cabecalho`),
  KEY `fk_NFE_TRANSPORTE_TRANSPORTADORA1_idx` (`id_transportadora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfe_transporte_reboque` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_nfe_transporte` INT NOT NULL,
  `placa` VARCHAR(8),
  `uf` CHAR(2),
  `rntc` VARCHAR(20),
  `vagao` VARCHAR(20),
  `balsa` VARCHAR(20),
  PRIMARY KEY (`id`),
  KEY `FK_NFE_TRANSP_REBOQUE` (`id_nfe_transporte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfe_transporte_volume` (
  `id` INT NOT NULL,
  `id_nfe_transporte` INT NOT NULL,
  `quantidade` INT,
  `especie` VARCHAR(60),
  `marca` VARCHAR(60),
  `numeracao` VARCHAR(60),
  `peso_liquido` DECIMAL(18,6),
  `peso_bruto` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_TRANSP_VOLUME` (`id_nfe_transporte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfe_transporte_volume_lacre` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_nfe_transporte_volume` INT NOT NULL,
  `numero` VARCHAR(60),
  PRIMARY KEY (`id`),
  KEY `FK_NFE_TRANSP_VOL_LACRE` (`id_nfe_transporte_volume`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfse_cabecalho` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_cliente` INT NOT NULL,
  `id_os_abertura` INT,
  `numero` VARCHAR(15),
  `codigo_verificacao` VARCHAR(9),
  `data_hora_emissao` TIMESTAMP,
  `competencia` VARCHAR(6),
  `numero_substituida` VARCHAR(15),
  `natureza_operacao` CHAR(1),
  `regime_especial_tributacao` CHAR(1),
  `optante_simples_nacional` CHAR(1),
  `incentivador_cultural` CHAR(1),
  `numero_rps` VARCHAR(15),
  `serie_rps` VARCHAR(5),
  `tipo_rps` CHAR(1),
  `data_emissao_rps` DATE,
  `outras_informacoes` TEXT,
  PRIMARY KEY (`id`),
  KEY `fk_NFSE_CABECALHO_OS_ABERTURA1_idx` (`id_os_abertura`),
  KEY `fk_NFSE_CABECALHO_CLIENTE1_idx` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfse_detalhe` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_nfse_lista_servico` INT NOT NULL,
  `id_nfse_cabecalho` INT NOT NULL,
  `valor_servicos` DECIMAL(18,6),
  `valor_deducoes` DECIMAL(18,6),
  `valor_pis` DECIMAL(18,6),
  `valor_cofins` DECIMAL(18,6),
  `valor_inss` DECIMAL(18,6),
  `valor_ir` DECIMAL(18,6),
  `valor_csll` DECIMAL(18,6),
  `codigo_cnae` VARCHAR(7),
  `codigo_tributacao_municipio` VARCHAR(20),
  `valor_base_calculo` DECIMAL(18,6),
  `aliquota` DECIMAL(18,6),
  `valor_iss` DECIMAL(18,6),
  `valor_liquido` DECIMAL(18,6),
  `outras_retencoes` DECIMAL(18,6),
  `valor_credito` DECIMAL(18,6),
  `iss_retido` CHAR(1),
  `valor_iss_retido` DECIMAL(18,6),
  `valor_desconto_condicionado` DECIMAL(18,6),
  `valor_desconto_incondicionado` DECIMAL(18,6),
  `discriminacao` TEXT,
  `municipio_prestacao` INT,
  PRIMARY KEY (`id`),
  KEY `FK_NFSE_CAB_DET` (`id_nfse_cabecalho`),
  KEY `FK_LISTA_SER_DET` (`id_nfse_lista_servico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfse_intermediario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_nfse_cabecalho` INT NOT NULL,
  `cnpj` VARCHAR(14),
  `razao` VARCHAR(150),
  `inscricao_municipal` VARCHAR(15),
  PRIMARY KEY (`id`),
  KEY `FK_NFSE_INTERMEDIARIO` (`id_nfse_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nfse_lista_servico` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` CHAR(5),
  `descricao` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nivel_formacao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100),
  `descricao` VARCHAR(250),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nota_fiscal_modelo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` CHAR(2),
  `descricao` VARCHAR(100),
  `modelo` VARCHAR(10),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nota_fiscal_tipo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_nota_fiscal_modelo` INT NOT NULL,
  `nome` VARCHAR(50),
  `descricao` TEXT,
  `serie` CHAR(3),
  `serie_scan` CHAR(3),
  `ultimo_numero` INT,
  PRIMARY KEY (`id`),
  KEY `FK_NF_TIPO_MODELO` (`id_nota_fiscal_modelo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `operadora_cartao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_banco_conta_caixa` INT NOT NULL,
  `bandeira` VARCHAR(30),
  `nome` VARCHAR(50),
  `taxa_adm` DECIMAL(18,6),
  `taxa_adm_debito` DECIMAL(18,6),
  `valor_aluguel_pos_pin` DECIMAL(18,6),
  `vencimento_aluguel` INT,
  `fone1` VARCHAR(14),
  `fone2` VARCHAR(14),
  `classificacao_contabil_conta` VARCHAR(30),
  PRIMARY KEY (`id`),
  KEY `fk_OPERADORA_CARTAO_BANCO_CONTA_CAIXA1_idx` (`id_banco_conta_caixa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `operadora_plano_saude` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `registro_ans` VARCHAR(20),
  `nome` VARCHAR(100),
  `classificacao_contabil_conta` VARCHAR(30),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `orcamento_detalhe` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_orcamento_empresarial` INT NOT NULL,
  `id_fin_natureza_financeira` INT NOT NULL,
  `periodo` VARCHAR(10),
  `valor_orcado` DECIMAL(18,6),
  `valor_realizado` DECIMAL(18,6),
  `taxa_variacao` DECIMAL(18,6),
  `valor_variacao` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_ORC_EMPRESARIAL_CAB_DET` (`id_orcamento_empresarial`),
  KEY `fk_ORCAMENTO_DETALHE_FIN_NATUREZA_FINANCEIRA1_idx` (`id_fin_natureza_financeira`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `orcamento_empresarial` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_orcamento_periodo` INT NOT NULL,
  `nome` VARCHAR(30),
  `descricao` TEXT,
  `data_inicial` DATE,
  `numero_periodos` INT,
  `data_base` DATE,
  PRIMARY KEY (`id`),
  KEY `FK_ORCAMENTO_PERIODO_ORC` (`id_orcamento_periodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `orcamento_fluxo_caixa` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_orc_fluxo_caixa_periodo` INT NOT NULL,
  `nome` VARCHAR(30),
  `descricao` TEXT,
  `data_inicial` DATE,
  `numero_periodos` INT,
  `data_base` DATE,
  PRIMARY KEY (`id`),
  KEY `FK_FLUXO_CX_PERIODO` (`id_orc_fluxo_caixa_periodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `orcamento_fluxo_caixa_detalhe` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_orcamento_fluxo_caixa` INT NOT NULL,
  `id_fin_natureza_financeira` INT NOT NULL,
  `periodo` VARCHAR(10),
  `valor_orcado` DECIMAL(18,6),
  `valor_realizado` DECIMAL(18,6),
  `taxa_variacao` DECIMAL(18,6),
  `valor_variacao` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_FLUXO_CAIXA_DETALHE` (`id_orcamento_fluxo_caixa`),
  KEY `fk_ORCAMENTO_FLUXO_CAIXA_DETALHE_FIN_NATUREZA_FINANCEIRA1_idx` (`id_fin_natureza_financeira`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `orcamento_fluxo_caixa_periodo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_banco_conta_caixa` INT NOT NULL,
  `periodo` CHAR(2),
  `nome` VARCHAR(30),
  PRIMARY KEY (`id`),
  KEY `fk_ORCAMENTO_FLUXO_CAIXA_PERIODO_BANCO_CONTA_CAIXA1_idx` (`id_banco_conta_caixa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `orcamento_periodo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `periodo` CHAR(2),
  `nome` VARCHAR(30),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `os_abertura` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_os_status` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  `id_colaborador` INT NOT NULL,
  `numero` VARCHAR(20),
  `data_inicio` DATE,
  `hora_inicio` VARCHAR(8),
  `data_previsao` DATE,
  `hora_previsao` VARCHAR(8),
  `data_fim` DATE,
  `hora_fim` VARCHAR(8),
  `nome_contato` VARCHAR(50),
  `fone_contato` VARCHAR(15),
  `observacao_cliente` TEXT,
  `observacao_abertura` TEXT,
  PRIMARY KEY (`id`),
  KEY `FK_OS_STATUS_ABERTURA` (`id_os_status`),
  KEY `fk_OS_ABERTURA_CLIENTE1_idx` (`id_cliente`),
  KEY `fk_OS_ABERTURA_COLABORADOR1_idx` (`id_colaborador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `os_abertura_equipamento` (
  `id` INT NOT NULL,
  `id_os_equipamento` INT NOT NULL,
  `id_os_abertura` INT NOT NULL,
  `numero_serie` VARCHAR(50),
  `tipo_cobertura` CHAR(1),
  PRIMARY KEY (`id`),
  KEY `FK_OS_ABERT_EQUIP` (`id_os_abertura`),
  KEY `FK_OS_EQUIP_ABERT` (`id_os_equipamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `os_equipamento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100),
  `descricao` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `os_evolucao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_os_abertura` INT NOT NULL,
  `data_registro` DATE,
  `hora_registro` VARCHAR(8),
  `observacao` TEXT,
  `enviar_email` CHAR(1),
  PRIMARY KEY (`id`),
  KEY `OS_EVOLUCAO_FKIndex1` (`id_os_abertura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `os_produto_servico` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_os_abertura` INT NOT NULL,
  `id_produto` INT,
  `tipo` CHAR(1),
  `complemento` TEXT,
  `quantidade` DECIMAL(18,6),
  `valor_unitario` DECIMAL(18,6),
  `valor_subtotal` DECIMAL(18,6),
  `taxa_desconto` DECIMAL(18,6),
  `valor_desconto` DECIMAL(18,6),
  `valor_total` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_OS_ABERT_PROD_SERV` (`id_os_abertura`),
  KEY `fk_OS_PRODUTO_SERVICO_PRODUTO1_idx` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `os_status` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` CHAR(2),
  `nome` VARCHAR(100),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `pais` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` INT,
  `nome_en` VARCHAR(100),
  `nome_ptbr` VARCHAR(100),
  `sigla2` CHAR(2),
  `sigla3` CHAR(3),
  `codigo_bacen` INT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `papel` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100),
  `descricao` VARCHAR(250),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `papel_funcao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_papel` INT NOT NULL,
  `id_funcao` INT NOT NULL,
  `habilitado` CHAR(1),
  `pode_inserir` CHAR(1),
  `pode_alterar` CHAR(1),
  `pode_excluir` CHAR(1),
  PRIMARY KEY (`id`),
  KEY `fk_PAPEL_FUNCAO_PAPEL1_idx` (`id_papel`),
  KEY `fk_PAPEL_FUNCAO_FUNCAO1_idx` (`id_funcao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `patrim_apolice_seguro` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_patrim_bem` INT NOT NULL,
  `id_seguradora` INT NOT NULL,
  `numero` VARCHAR(20),
  `data_contratacao` DATE,
  `data_vencimento` DATE,
  `valor_premio` DECIMAL(18,6),
  `valor_segurado` DECIMAL(18,6),
  `observacao` TEXT,
  `imagem` TEXT,
  PRIMARY KEY (`id`),
  KEY `FK_SEGURADA_APOLICE` (`id_seguradora`),
  KEY `FK_PATRIM_APOLICE_BEM` (`id_patrim_bem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `patrim_bem` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_centro_resultado` INT NOT NULL,
  `id_patrim_tipo_aquisicao_bem` INT NOT NULL,
  `id_patrim_estado_conservacao` INT NOT NULL,
  `id_patrim_grupo_bem` INT NOT NULL,
  `id_fornecedor` INT NOT NULL,
  `id_colaborador` INT NOT NULL,
  `id_setor` INT NOT NULL,
  `numero_nb` VARCHAR(20),
  `nome` VARCHAR(100),
  `descricao` TEXT,
  `numero_serie` VARCHAR(50),
  `data_aquisicao` DATE,
  `data_aceite` DATE,
  `data_cadastro` DATE,
  `data_contabilizado` DATE,
  `data_vistoria` DATE,
  `data_marcacao` DATE,
  `data_baixa` DATE,
  `vencimento_garantia` DATE,
  `numero_nota_fiscal` VARCHAR(50),
  `chave_nfe` VARCHAR(44),
  `valor_original` DECIMAL(18,6),
  `valor_compra` DECIMAL(18,6),
  `valor_atualizado` DECIMAL(18,6),
  `valor_baixa` DECIMAL(18,6),
  `deprecia` CHAR(1),
  `metodo_depreciacao` CHAR(1),
  `inicio_depreciacao` DATE,
  `ultima_depreciacao` DATE,
  `tipo_depreciacao` CHAR(1),
  `taxa_anual_depreciacao` DECIMAL(18,6),
  `taxa_mensal_depreciacao` DECIMAL(18,6),
  `taxa_depreciacao_acelerada` DECIMAL(18,6),
  `taxa_depreciacao_incentivada` DECIMAL(18,6),
  `funcao` TEXT,
  PRIMARY KEY (`id`),
  KEY `FK_PATRIM_GRUPO_BEM` (`id_patrim_grupo_bem`),
  KEY `FK_TIPO_AQUISICAO_BEM` (`id_patrim_tipo_aquisicao_bem`),
  KEY `FK_ESTADO_CONSERVACAO_BEM` (`id_patrim_estado_conservacao`),
  KEY `FK_CENTRO_RES_BEM` (`id_centro_resultado`),
  KEY `fk_PATRIM_BEM_FORNECEDOR1_idx` (`id_fornecedor`),
  KEY `fk_PATRIM_BEM_COLABORADOR1_idx` (`id_colaborador`),
  KEY `fk_PATRIM_BEM_SETOR1_idx` (`id_setor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `patrim_depreciacao_bem` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_patrim_bem` INT NOT NULL,
  `data_depreciacao` DATE,
  `dias` INT,
  `taxa` DECIMAL(18,6),
  `indice` DECIMAL(18,6),
  `valor` DECIMAL(18,6),
  `depreciacao_acumulada` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_PATRIM_BEM_DEPRECIACAO` (`id_patrim_bem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `patrim_documento_bem` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_patrim_bem` INT NOT NULL,
  `nome` VARCHAR(50),
  `descricao` TEXT,
  `imagem` TEXT,
  PRIMARY KEY (`id`),
  KEY `FK_PATRIM_DOCUMENTO_BEM` (`id_patrim_bem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `patrim_estado_conservacao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` CHAR(2),
  `nome` VARCHAR(50),
  `descricao` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `patrim_grupo_bem` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` CHAR(3),
  `nome` VARCHAR(50),
  `descricao` TEXT,
  `conta_ativo_imobilizado` VARCHAR(30),
  `conta_depreciacao_acumulada` VARCHAR(30),
  `conta_despesa_depreciacao` VARCHAR(30),
  `codigo_historico` INT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `patrim_indice_atualizacao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data_indice` DATE,
  `nome` VARCHAR(10),
  `valor` DECIMAL(18,6),
  `valor_alternativo` DECIMAL(18,6),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `patrim_movimentacao_bem` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_patrim_bem` INT NOT NULL,
  `id_patrim_tipo_movimentacao` INT NOT NULL,
  `data_movimentacao` DATE,
  `responsavel` VARCHAR(50),
  PRIMARY KEY (`id`),
  KEY `FK_TIPO_MOV_BEM_MOV_BEM` (`id_patrim_tipo_movimentacao`),
  KEY `FK_PATRIM_BEM_MOVIMENTACAO` (`id_patrim_bem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `patrim_taxa_depreciacao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ncm` VARCHAR(8),
  `bem` VARCHAR(250),
  `vida` DECIMAL(18,6),
  `taxa` DECIMAL(18,6),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `patrim_tipo_aquisicao_bem` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo` CHAR(2),
  `nome` VARCHAR(50),
  `descricao` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `patrim_tipo_movimentacao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo` CHAR(2),
  `nome` VARCHAR(50),
  `descricao` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `pcp_instrucao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` CHAR(3),
  `descricao` VARCHAR(100),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `pcp_instrucao_op` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_pcp_instrucao` INT NOT NULL,
  `id_pcp_op_cabecalho` INT NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_PCP_OP_INSTRUCAO` (`id_pcp_op_cabecalho`),
  KEY `FK_PCP_INSTRUCAO_OP` (`id_pcp_instrucao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `pcp_op_cabecalho` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `inicio` DATE,
  `previsao_entrega` DATE,
  `termino` DATE,
  `custo_total_previsto` DECIMAL(18,6),
  `custo_total_realizado` DECIMAL(18,6),
  `porcento_venda` DECIMAL(18,6),
  `porcento_estoque` DECIMAL(18,6),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `pcp_op_detalhe` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_pcp_op_cabecalho` INT NOT NULL,
  `id_produto` INT NOT NULL,
  `quantidade_produzir` DECIMAL(18,6),
  `quantidade_produzida` DECIMAL(18,6),
  `quantidade_entregue` DECIMAL(18,6),
  `custo_previsto` DECIMAL(18,6),
  `custo_realizado` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_PCP_OP_CAB_DET` (`id_pcp_op_cabecalho`),
  KEY `fk_PCP_OP_DETALHE_PRODUTO1_idx` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `pcp_servico` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_pcp_op_detalhe` INT NOT NULL,
  `inicio_realizado` DATE,
  `termino_realizado` DATE,
  `horas_realizado` INT,
  `minutos_realizado` INT,
  `segundos_realizado` INT,
  `custo_realizado` DECIMAL(18,6),
  `inicio_previsto` DATE,
  `termino_previsto` DATE,
  `horas_previsto` INT,
  `minutos_previsto` INT,
  `segundos_previsto` INT,
  `custo_previsto` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_PCP_SERVICO_REALIZADO` (`id_pcp_op_detalhe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `pcp_servico_colaborador` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_pcp_servico` INT NOT NULL,
  `id_colaborador` INT NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_PCP_SERVICO_COLABORADOR` (`id_pcp_servico`),
  KEY `fk_PCP_SERVICO_COLABORADOR_COLABORADOR1_idx` (`id_colaborador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `pcp_servico_equipamento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_patrim_bem` INT NOT NULL,
  `id_pcp_servico` INT NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_PCP_SERV_EQUIP` (`id_pcp_servico`),
  KEY `FK_PCP_EQUIP_SERV` (`id_patrim_bem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `pdv_caixa` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(30),
  `data_cadastro` DATE,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `pdv_configuracao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome_caixa` VARCHAR(30),
  `id_gerado_caixa` INT,
  `id_empresa` INT,
  `id_ecf_impressora` INT,
  `id_pdv_caixa` INT,
  `mensagem_cupom` VARCHAR(250),
  `porta_ecf` CHAR(10),
  `ip_servidor` VARCHAR(15),
  `ip_sitef` VARCHAR(15),
  `tipo_tef` CHAR(2),
  `titulo_tela_caixa` VARCHAR(100),
  `caminho_imagens_produtos` VARCHAR(250),
  `caminho_imagens_marketing` VARCHAR(250),
  `cor_janelas_internas` VARCHAR(20),
  `marketing_ativo` CHAR(1),
  `cfop_ecf` INT,
  `timeout_ecf` INT,
  `intervalo_ecf` INT,
  `descricao_suprimento` VARCHAR(20),
  `descricao_sangria` VARCHAR(20),
  `tef_tipo_gp` INT,
  `tef_tempo_espera` INT,
  `tef_espera_sts` INT,
  `tef_numero_vias` INT,
  `decimais_quantidade` INT,
  `decimais_valor` INT,
  `bits_por_segundo` INT,
  `qtde_maxima_cartoes` INT,
  `pesquisa_parte` CHAR(1),
  `configuracao_balanca` VARCHAR(100),
  `parametros_diversos` VARCHAR(250),
  `ultima_exclusao` INT,
  `laudo` VARCHAR(10),
  `indice_gerencial` VARCHAR(100),
  `data_atualizacao_estoque` DATE,
  `data_sincronizacao` DATE,
  `hora_sincronizacao` VARCHAR(8),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `pdv_fechamento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome_caixa` VARCHAR(30),
  `id_gerado_caixa` INT,
  `id_empresa` INT,
  `id_pdv_movimento` INT,
  `tipo_pagamento` VARCHAR(20),
  `valor` DECIMAL(18,6),
  `data_sincronizacao` DATE,
  `hora_sincronizacao` VARCHAR(8),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `pdv_movimento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome_caixa` VARCHAR(30),
  `id_gerado_caixa` INT,
  `id_empresa` INT,
  `id_ecf_impressora` INT,
  `id_pdv_operador` INT,
  `id_pdv_caixa` INT,
  `id_gerente_supervisor` INT NOT NULL,
  `data_abertura` DATE,
  `hora_abertura` VARCHAR(8),
  `data_fechamento` DATE,
  `hora_fechamento` VARCHAR(8),
  `total_suprimento` DECIMAL(18,6),
  `total_sangria` DECIMAL(18,6),
  `total_nao_fiscal` DECIMAL(18,6),
  `total_venda` DECIMAL(18,6),
  `total_desconto` DECIMAL(18,6),
  `total_acrescimo` DECIMAL(18,6),
  `total_final` DECIMAL(18,6),
  `total_recebido` DECIMAL(18,6),
  `total_troco` DECIMAL(18,6),
  `total_cancelado` DECIMAL(18,6),
  `status_movimento` CHAR(1) NOT NULL,
  `data_sincronizacao` DATE,
  `hora_sincronizacao` VARCHAR(8),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `pdv_sangria` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome_caixa` VARCHAR(30),
  `id_gerado_caixa` INT,
  `id_empresa` INT,
  `id_pdv_movimento` INT,
  `data_sangria` DATE,
  `valor` DECIMAL(18,6),
  `data_sincronizacao` DATE,
  `hora_sincronizacao` VARCHAR(8),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `pdv_suprimento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome_caixa` VARCHAR(30),
  `id_gerado_caixa` INT,
  `id_empresa` INT,
  `id_pdv_movimento` INT,
  `data_suprimento` DATE,
  `valor` DECIMAL(18,6),
  `data_sincronizacao` DATE,
  `hora_sincronizacao` VARCHAR(8),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `pdv_tipo_pagamento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` CHAR(3),
  `descricao` VARCHAR(20),
  `tef` CHAR(1),
  `imprime_vinculado` CHAR(1),
  `permite_troco` CHAR(1),
  `tef_tipo_gp` CHAR(1),
  `gera_parcelas` CHAR(1),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `pdv_total_tipo_pagamento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome_caixa` VARCHAR(30),
  `id_gerado_caixa` INT,
  `id_empresa` INT,
  `id_pdv_venda_cabecalho` INT,
  `id_pdv_tipo_pagamento` INT,
  `serie_ecf` VARCHAR(20),
  `coo` INT,
  `ccf` INT,
  `gnf` INT,
  `valor` DECIMAL(18,6),
  `nsu` VARCHAR(30),
  `estorno` CHAR(1),
  `rede` VARCHAR(10),
  `cartao_dc` CHAR(1),
  `data_venda` DATE,
  `hash_registro` VARCHAR(32),
  `data_sincronizacao` DATE,
  `hora_sincronizacao` VARCHAR(8),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `pdv_venda_cabecalho` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome_caixa` VARCHAR(30),
  `id_gerado_caixa` INT,
  `id_empresa` INT,
  `id_cliente` INT,
  `id_pdv_funcionario` INT,
  `id_pdv_movimento` INT,
  `id_ecf_dav` INT,
  `id_ecf_pre_venda_cabecalho` INT,
  `serie_ecf` VARCHAR(20),
  `cfop` INT,
  `coo` INT,
  `ccf` INT,
  `data_venda` DATE,
  `hora_venda` VARCHAR(8),
  `valor_venda` DECIMAL(18,6),
  `taxa_desconto` DECIMAL(18,6),
  `desconto` DECIMAL(18,6),
  `taxa_acrescimo` DECIMAL(18,6),
  `acrescimo` DECIMAL(18,6),
  `valor_final` DECIMAL(18,6),
  `valor_recebido` DECIMAL(18,6),
  `troco` DECIMAL(18,6),
  `valor_cancelado` DECIMAL(18,6),
  `total_produtos` DECIMAL(18,6),
  `total_documento` DECIMAL(18,6),
  `base_icms` DECIMAL(18,6),
  `icms` DECIMAL(18,6),
  `icms_outras` DECIMAL(18,6),
  `issqn` DECIMAL(18,6),
  `pis` DECIMAL(18,6),
  `cofins` DECIMAL(18,6),
  `acrescimo_itens` DECIMAL(18,6),
  `desconto_itens` DECIMAL(18,6),
  `status_venda` CHAR(1),
  `nome_cliente` VARCHAR(100),
  `cpf_cnpj_cliente` VARCHAR(14),
  `cupom_cancelado` CHAR(1),
  `hash_registro` VARCHAR(32),
  `data_sincronizacao` DATE,
  `hora_sincronizacao` VARCHAR(8),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `pdv_venda_detalhe` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome_caixa` VARCHAR(30),
  `id_gerado_caixa` INT,
  `id_empresa` INT,
  `id_produto` INT,
  `id_pdv_venda_cabecalho` INT,
  `cfop` INT,
  `gtin` VARCHAR(14),
  `ccf` INT,
  `coo` INT,
  `serie_ecf` VARCHAR(20),
  `item` INT,
  `quantidade` DECIMAL(18,6),
  `valor_unitario` DECIMAL(18,6),
  `valor_total` DECIMAL(18,6),
  `total_item` DECIMAL(18,6),
  `base_icms` DECIMAL(18,6),
  `taxa_icms` DECIMAL(18,6),
  `icms` DECIMAL(18,6),
  `taxa_desconto` DECIMAL(18,6),
  `desconto` DECIMAL(18,6),
  `taxa_issqn` DECIMAL(18,6),
  `issqn` DECIMAL(18,6),
  `taxa_pis` DECIMAL(18,6),
  `pis` DECIMAL(18,6),
  `taxa_cofins` DECIMAL(18,6),
  `cofins` DECIMAL(18,6),
  `taxa_acrescimo` DECIMAL(18,6),
  `acrescimo` DECIMAL(18,6),
  `acrescimo_rateio` DECIMAL(18,6),
  `desconto_rateio` DECIMAL(18,6),
  `totalizador_parcial` VARCHAR(10),
  `cst` CHAR(3),
  `cancelado` CHAR(1),
  `movimenta_estoque` CHAR(1),
  `ecf_icms_st` VARCHAR(4),
  `hash_registro` VARCHAR(32),
  `data_sincronizacao` DATE,
  `hora_sincronizacao` VARCHAR(8),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `pessoa` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(150),
  `tipo` CHAR(1),
  `site` VARCHAR(250),
  `email` VARCHAR(250),
  `eh_cliente` CHAR(1),
  `eh_fornecedor` CHAR(1),
  `eh_transportadora` CHAR(1),
  `eh_colaborador` CHAR(1),
  `eh_contador` CHAR(1),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `pessoa_alteracao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_pessoa` INT NOT NULL,
  `data_alteracao` DATE,
  `objeto_antigo` TEXT,
  `objeto_novo` TEXT,
  PRIMARY KEY (`id`),
  KEY `fk_PESSOA_ALTERACAO_PESSOA1_idx` (`id_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `pessoa_contato` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_pessoa` INT NOT NULL,
  `nome` VARCHAR(150),
  `email` VARCHAR(250),
  `observacao` VARCHAR(250),
  PRIMARY KEY (`id`),
  KEY `fk_PESSOA_CONTATO_PESSOA1_idx` (`id_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `pessoa_endereco` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_pessoa` INT NOT NULL,
  `logradouro` VARCHAR(100),
  `numero` VARCHAR(10),
  `bairro` VARCHAR(100),
  `municipio_ibge` INT,
  `uf` CHAR(2),
  `cep` VARCHAR(8),
  `cidade` VARCHAR(100),
  `complemento` VARCHAR(100),
  `principal` CHAR(1),
  `entrega` CHAR(1),
  `cobranca` CHAR(1),
  `correspondencia` CHAR(1),
  PRIMARY KEY (`id`),
  KEY `fk_PESSOA_ENDERECO_PESSOA1_idx` (`id_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `pessoa_fisica` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_pessoa` INT NOT NULL,
  `id_nivel_formacao` INT NOT NULL,
  `id_estado_civil` INT NOT NULL,
  `cpf` VARCHAR(11),
  `rg` VARCHAR(20),
  `orgao_rg` VARCHAR(20),
  `data_emissao_rg` DATE,
  `data_nascimento` DATE,
  `sexo` CHAR(1),
  `raca` CHAR(1),
  `nacionalidade` VARCHAR(100),
  `naturalidade` VARCHAR(100),
  `nome_pai` VARCHAR(200),
  `nome_mae` VARCHAR(200),
  PRIMARY KEY (`id`),
  KEY `fk_PESSOA_FISICA_PESSOA1_idx` (`id_pessoa`),
  KEY `fk_PESSOA_FISICA_NIVEL_FORMACAO1_idx` (`id_nivel_formacao`),
  KEY `fk_PESSOA_FISICA_ESTADO_CIVIL1_idx` (`id_estado_civil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `pessoa_juridica` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_pessoa` INT NOT NULL,
  `cnpj` VARCHAR(14),
  `nome_fantasia` VARCHAR(100),
  `inscricao_estadual` VARCHAR(45),
  `inscricao_municipal` VARCHAR(45),
  `data_constituicao` DATE,
  `tipo_regime` CHAR(1),
  `crt` CHAR(1),
  PRIMARY KEY (`id`),
  KEY `fk_PESSOA_JURIDICA_PESSOA1_idx` (`id_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `pessoa_telefone` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_pessoa` INT NOT NULL,
  `tipo` CHAR(1),
  `numero` VARCHAR(15),
  PRIMARY KEY (`id`),
  KEY `fk_PESSOA_TELEFONE_PESSOA1_idx` (`id_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `plano_centro_resultado` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100),
  `mascara` VARCHAR(50),
  `niveis` INT,
  `data_inclusao` DATE,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `plano_conta` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100),
  `data_inclusao` DATE,
  `mascara` VARCHAR(50),
  `niveis` INT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `plano_conta_ref_sped` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cod_cta_ref` VARCHAR(30),
  `descricao` TEXT,
  `orientacoes` TEXT,
  `inicio_validade` DATE,
  `fim_validade` DATE,
  `tipo` CHAR(1),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `ponto_abono` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_colaborador` INT NOT NULL,
  `quantidade` INT,
  `utilizado` INT,
  `saldo` INT,
  `data_cadastro` DATE,
  `inicio_utilizacao` DATE,
  `observacao` TEXT,
  PRIMARY KEY (`id`),
  KEY `fk_PONTO_ABONO_COLABORADOR1_idx` (`id_colaborador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `ponto_abono_utilizacao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_ponto_abono` INT NOT NULL,
  `data_utilizacao` DATE,
  `observacao` TEXT,
  PRIMARY KEY (`id`),
  KEY `FK_PONTO_ABONO_UTILIZACAO` (`id_ponto_abono`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `ponto_banco_horas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_colaborador` INT NOT NULL,
  `data_trabalho` DATE,
  `quantidade` VARCHAR(8),
  `situacao` CHAR(1),
  PRIMARY KEY (`id`),
  KEY `fk_PONTO_BANCO_HORAS_COLABORADOR1_idx` (`id_colaborador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `ponto_banco_horas_utilizacao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_ponto_banco_horas` INT NOT NULL,
  `data_utilizacao` DATE,
  `quantidade_utilizada` VARCHAR(8),
  `observacao` TEXT,
  PRIMARY KEY (`id`),
  KEY `FK_BANCO_HORA_UTILIZACAO` (`id_ponto_banco_horas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `ponto_classificacao_jornada` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` CHAR(3),
  `nome` VARCHAR(50),
  `descricao` TEXT,
  `padrao` CHAR(1),
  `descontar_horas` CHAR(1),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `ponto_escala` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50),
  `desconto_hora_dia` VARCHAR(8),
  `desconto_dsr` VARCHAR(8),
  `codigo_horario_domingo` CHAR(4),
  `codigo_horario_segunda` CHAR(4),
  `codigo_horario_terca` CHAR(4),
  `codigo_horario_quarta` CHAR(4),
  `codigo_horario_quinta` CHAR(4),
  `codigo_horario_sexta` CHAR(4),
  `codigo_horario_sabado` CHAR(4),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `ponto_fechamento_jornada` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_ponto_classificacao_jornada` INT NOT NULL,
  `id_colaborador` INT NOT NULL,
  `data_fechamento` DATE,
  `dia_semana` VARCHAR(7),
  `codigo_horario` CHAR(4),
  `carga_horaria_esperada` VARCHAR(8),
  `carga_horaria_diurna` VARCHAR(8),
  `carga_horaria_noturna` VARCHAR(8),
  `carga_horaria_total` VARCHAR(8),
  `entrada01` VARCHAR(8),
  `saida01` VARCHAR(8),
  `entrada02` VARCHAR(8),
  `saida02` VARCHAR(8),
  `entrada03` VARCHAR(8),
  `saida03` VARCHAR(8),
  `entrada04` VARCHAR(8),
  `saida04` VARCHAR(8),
  `entrada05` VARCHAR(8),
  `saida05` VARCHAR(8),
  `hora_inicio_jornada` VARCHAR(8),
  `hora_fim_jornada` VARCHAR(8),
  `hora_extra01` VARCHAR(8),
  `percentual_hora_extra01` DECIMAL(18,6),
  `modalidade_hora_extra01` CHAR(1),
  `hora_extra02` VARCHAR(8),
  `percentual_hora_extra02` DECIMAL(18,6),
  `modalidade_hora_extra02` CHAR(1),
  `hora_extra03` VARCHAR(8),
  `percentual_hora_extra03` DECIMAL(18,6),
  `modalidade_hora_extra03` CHAR(1),
  `hora_extra04` VARCHAR(8),
  `percentual_hora_extra04` DECIMAL(18,6),
  `modalidade_hora_extra04` CHAR(1),
  `falta_atraso` VARCHAR(8),
  `compensar` CHAR(1),
  `banco_horas` VARCHAR(8),
  `observacao` VARCHAR(250),
  PRIMARY KEY (`id`),
  KEY `FK_PONTO_CLASSIFICACAO_JORNADA` (`id_ponto_classificacao_jornada`),
  KEY `fk_PONTO_FECHAMENTO_JORNADA_COLABORADOR1_idx` (`id_colaborador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `ponto_horario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo` CHAR(1),
  `codigo` CHAR(4),
  `nome` VARCHAR(50),
  `tipo_trabalho` CHAR(1),
  `carga_horaria` VARCHAR(8),
  `entrada01` VARCHAR(8),
  `saida01` VARCHAR(8),
  `entrada02` VARCHAR(8),
  `saida02` VARCHAR(8),
  `entrada03` VARCHAR(8),
  `saida03` VARCHAR(8),
  `entrada04` VARCHAR(8),
  `saida04` VARCHAR(8),
  `entrada05` VARCHAR(8),
  `saida05` VARCHAR(8),
  `hora_inicio_jornada` VARCHAR(8),
  `hora_fim_jornada` VARCHAR(8),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `ponto_horario_autorizado` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_colaborador` INT NOT NULL,
  `data_horario` DATE,
  `tipo` CHAR(1),
  `carga_horaria` VARCHAR(8),
  `entrada01` VARCHAR(8),
  `saida01` VARCHAR(8),
  `entrada02` VARCHAR(8),
  `saida02` VARCHAR(8),
  `entrada03` VARCHAR(8),
  `saida03` VARCHAR(8),
  `entrada04` VARCHAR(8),
  `saida04` VARCHAR(8),
  `entrada05` VARCHAR(8),
  `saida05` VARCHAR(8),
  `hora_fechamento_dia` VARCHAR(8),
  PRIMARY KEY (`id`),
  KEY `fk_PONTO_HORARIO_AUTORIZADO_COLABORADOR1_idx` (`id_colaborador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `ponto_marcacao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_ponto_relogio` INT,
  `id_colaborador` INT NOT NULL,
  `nsr` INT,
  `data_marcacao` DATE,
  `hora_marcacao` VARCHAR(8),
  `tipo_marcacao` CHAR(1),
  `tipo_registro` CHAR(1),
  `par_entrada_saida` CHAR(2),
  `justificativa` VARCHAR(100),
  PRIMARY KEY (`id`),
  KEY `FK_PONTO_RELOGIO_MARCACAO` (`id_ponto_relogio`),
  KEY `fk_PONTO_MARCACAO_COLABORADOR1_idx` (`id_colaborador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `ponto_parametro` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `mes_ano` VARCHAR(7),
  `dia_inicial_apuracao` INT,
  `hora_noturna_inicio` VARCHAR(8),
  `hora_noturna_fim` VARCHAR(8),
  `periodo_minimo_interjornada` VARCHAR(8),
  `percentual_he_diurna` DECIMAL(18,6),
  `percentual_he_noturna` DECIMAL(18,6),
  `duracao_hora_noturna` VARCHAR(8),
  `tratamento_hora_mais` CHAR(1),
  `tratamento_hora_menos` CHAR(1),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `ponto_relogio` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `localizacao` VARCHAR(50),
  `marca` VARCHAR(30),
  `fabricante` VARCHAR(30),
  `numero_serie` VARCHAR(50),
  `utilizacao` CHAR(1),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `ponto_turma` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_ponto_escala` INT NOT NULL,
  `codigo` CHAR(5),
  `nome` VARCHAR(50),
  PRIMARY KEY (`id`),
  KEY `FK_PONTO_ESCALA_TURMA` (`id_ponto_escala`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `pre_venda_cabecalho` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_pessoa` INT NOT NULL,
  `data_emissao` DATE,
  `hora_emissao` VARCHAR(8),
  `situacao` CHAR(1),
  `ccf` INT,
  `valor` DECIMAL(18,6),
  `nome_destinatario` VARCHAR(100),
  `cpf_cnpj_destinatario` VARCHAR(14),
  `subtotal` DECIMAL(18,6),
  `desconto` DECIMAL(18,6),
  `acrescimo` DECIMAL(18,6),
  `taxa_acrescimo` DECIMAL(18,6),
  `taxa_desconto` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `fk_PRE_VENDA_CABECALHO_PESSOA1_idx` (`id_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `pre_venda_detalhe` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_pre_venda_cabecalho` INT NOT NULL,
  `id_produto` INT NOT NULL,
  `item` INT,
  `quantidade` DECIMAL(18,6),
  `valor_unitario` DECIMAL(18,6),
  `valor_total` DECIMAL(18,6),
  `cancelado` CHAR(1),
  `gtin_produto` VARCHAR(14),
  `nome_produto` VARCHAR(100),
  `unidade_produto` VARCHAR(10),
  `ecf_icms_st` VARCHAR(4),
  PRIMARY KEY (`id`),
  KEY `FK_PRE_VENDA_CAB_DET` (`id_pre_venda_cabecalho`),
  KEY `fk_PRE_VENDA_DETALHE_PRODUTO1_idx` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `produto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_produto_subgrupo` INT NOT NULL,
  `id_produto_marca` INT NOT NULL,
  `id_produto_unidade` INT NOT NULL,
  `id_tribut_icms_custom_cab` INT,
  `id_tribut_grupo_tributario` INT,
  `nome` VARCHAR(100),
  `descricao` VARCHAR(250),
  `gtin` VARCHAR(14),
  `codigo_interno` VARCHAR(50),
  `valor_compra` DECIMAL(18,6),
  `valor_venda` DECIMAL(18,6),
  `codigo_ncm` VARCHAR(8),
  `estoque_minimo` DECIMAL(18,6),
  `estoque_maximo` DECIMAL(18,6),
  `quantidade_estoque` DECIMAL(18,6),
  `data_cadastro` DATE,
  PRIMARY KEY (`id`),
  KEY `fk_PRODUTO_PRODUTO_SUBGRUPO1_idx` (`id_produto_subgrupo`),
  KEY `fk_PRODUTO_PRODUTO_MARCA1_idx` (`id_produto_marca`),
  KEY `fk_PRODUTO_PRODUTO_UNIDADE1_idx` (`id_produto_unidade`),
  KEY `fk_PRODUTO_TRIBUT_ICMS_CUSTOM_CAB1_idx` (`id_tribut_icms_custom_cab`),
  KEY `fk_PRODUTO_TRIBUT_GRUPO_TRIBUTARIO1_idx` (`id_tribut_grupo_tributario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `produto_alteracao_item` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_produto` INT NOT NULL,
  `codigo` VARCHAR(14),
  `nome` VARCHAR(100),
  `data_inicial` DATE,
  `data_final` DATE,
  PRIMARY KEY (`id`),
  KEY `fk_PRODUTO_ALTERACAO_ITEM_PRODUTO1_idx` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `produto_codigo_adicional` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_produto` INT NOT NULL,
  `codigo` VARCHAR(14),
  PRIMARY KEY (`id`),
  KEY `fk_PRODUTO_CODIGO_ADICIONAL_PRODUTO1_idx` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `produto_ficha_tecnica` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_produto` INT NOT NULL,
  `descricao` VARCHAR(100),
  `id_produto_filho` INT,
  `quantidade` DECIMAL(18,6),
  `sequencia_producao` INT,
  PRIMARY KEY (`id`),
  KEY `fk_PRODUTO_FICHA_TECNICA_PRODUTO1_idx` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `produto_grupo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100),
  `descricao` VARCHAR(250),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `produto_marca` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100),
  `descricao` VARCHAR(250),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `produto_promocao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_produto` INT NOT NULL,
  `data_inicio` DATE,
  `data_fim` DATE,
  `quantidade_em_promocao` DECIMAL(18,6),
  `quantidade_maxima_cliente` DECIMAL(18,6),
  `valor` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `fk_PRODUTO_PROMOCAO_PRODUTO1_idx` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `produto_subgrupo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_produto_grupo` INT NOT NULL,
  `nome` VARCHAR(100),
  `descricao` VARCHAR(250),
  PRIMARY KEY (`id`),
  KEY `fk_PRODUTO_SUBGRUPO_PRODUTO_GRUPO1_idx` (`id_produto_grupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `produto_unidade` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `sigla` VARCHAR(10),
  `descricao` VARCHAR(250),
  `pode_fracionar` CHAR(1),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `projeto_cronograma` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_projeto_principal` INT NOT NULL,
  `tarefa` VARCHAR(100),
  `data_tarefa` DATE,
  `descricao` TEXT,
  PRIMARY KEY (`id`),
  KEY `fk_PROJETO_CRONOGRAMA_PROJETO_DADOS1_idx` (`id_projeto_principal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `projeto_custo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_projeto_principal` INT NOT NULL,
  `id_fin_natureza_financeira` INT NOT NULL,
  `nome` VARCHAR(100),
  `justificativa` TEXT,
  `valor_mensal` DECIMAL(18,6),
  `valor_total` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `fk_PROJETO_CUSTO_PROJETO_PRINCIPAL1_idx` (`id_projeto_principal`),
  KEY `fk_PROJETO_CUSTO_FIN_NATUREZA_FINANCEIRA1_idx` (`id_fin_natureza_financeira`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `projeto_principal` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100),
  `data_inicio` DATE,
  `data_previsao_fim` DATE,
  `data_fim` DATE,
  `link_quadro_trello` VARCHAR(100),
  `valor_orcamento` DECIMAL(18,6),
  `observacao` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `projeto_risco` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_projeto_principal` INT NOT NULL,
  `nome` VARCHAR(100),
  `descricao` TEXT,
  `probabilidade` INT,
  `impacto` INT,
  PRIMARY KEY (`id`),
  KEY `fk_PROJETO_RISCO_PROJETO_PRINCIPAL1_idx` (`id_projeto_principal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `projeto_stakeholders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_projeto_dados` INT NOT NULL,
  `id_colaborador` INT NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_PROJETO_STAKEHOLDERS_PROJETO_DADOS1_idx` (`id_projeto_dados`),
  KEY `fk_PROJETO_STAKEHOLDERS_COLABORADOR1_idx` (`id_colaborador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `quadro_societario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data_registro` DATE,
  `capital_social` DECIMAL(18,6),
  `valor_quota` DECIMAL(18,6),
  `quantidade_cotas` INT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rateio_centro_resultado_cab` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_centro_resultado` INT NOT NULL,
  `descricao` VARCHAR(100),
  PRIMARY KEY (`id`),
  KEY `FK_CENTRO_RATEIO_CAB` (`id_centro_resultado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rateio_centro_resultado_det` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_centro_resultado_destino` INT NOT NULL,
  `id_rateio_centro_resul_cab` INT NOT NULL,
  `porcento_rateio` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_RATEIO_CAB_DET` (`id_rateio_centro_resul_cab`),
  KEY `FK_CENTRO_RATEIO` (`id_centro_resultado_destino`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `recado_destinatario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_recado_remetente` INT NOT NULL,
  `id_colaborador` INT NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_RECADO_REM_DEST` (`id_recado_remetente`),
  KEY `fk_RECADO_DESTINATARIO_COLABORADOR1_idx` (`id_colaborador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `recado_remetente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_colaborador` INT NOT NULL,
  `data_envio` DATE,
  `hora_envio` VARCHAR(8),
  `assunto` VARCHAR(100),
  `texto` TEXT,
  PRIMARY KEY (`id`),
  KEY `fk_RECADO_REMETENTE_COLABORADOR1_idx` (`id_colaborador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `registro_cartorio` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome_cartorio` VARCHAR(100),
  `data_registro` DATE,
  `numero` INT,
  `folha` INT,
  `livro` INT,
  `nire` VARCHAR(11),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `requisicao_interna_cabecalho` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_colaborador` INT NOT NULL,
  `data_requisicao` DATE,
  `situacao` CHAR(1),
  PRIMARY KEY (`id`),
  KEY `fk_REQUISICAO_INTERNA_CABECALHO_COLABORADOR1_idx` (`id_colaborador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `requisicao_interna_detalhe` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_requisicao_interna_cabecalho` INT NOT NULL,
  `id_produto` INT NOT NULL,
  `quantidade` DECIMAL(18,6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_REQ_INTERNA_CAB_DET` (`id_requisicao_interna_cabecalho`),
  KEY `fk_REQUISICAO_INTERNA_DETALHE_PRODUTO1_idx` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `reuniao_sala` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `predio` VARCHAR(100),
  `andar` VARCHAR(10),
  `numero` VARCHAR(10),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `reuniao_sala_evento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_agenda_compromisso` INT NOT NULL,
  `id_reuniao_sala` INT NOT NULL,
  `data_reserva` DATE,
  PRIMARY KEY (`id`),
  KEY `FK_SALA_EVENTO` (`id_reuniao_sala`),
  KEY `FK_COMPROMISSO_SALA` (`id_agenda_compromisso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `salario_familia` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_inss` INT NOT NULL,
  `faixa` INT,
  `de` DECIMAL(18,6),
  `ate` DECIMAL(18,6),
  `valor` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_INSS_SALARIO_FAMILIA` (`id_inss`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `salario_minimo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `vigencia` DATE,
  `valor_mensal` DECIMAL(18,6),
  `valor_diario` DECIMAL(18,6),
  `valor_hora` DECIMAL(18,6),
  `norma_legal` VARCHAR(100),
  `dou` DATE,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `sefip_categoria_trabalho` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` INT,
  `nome` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `sefip_codigo_movimentacao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` CHAR(2),
  `descricao` TEXT,
  `aplicacao` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `sefip_codigo_recolhimento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` INT,
  `descricao` TEXT,
  `aplicacao` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `seguradora` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50),
  `contato` VARCHAR(50),
  `telefone` VARCHAR(14),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `setor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100),
  `descricao` VARCHAR(250),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `simples_nacional_cabecalho` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `vigencia_inicial` DATE,
  `vigencia_final` DATE,
  `anexo` VARCHAR(10),
  `tabela` VARCHAR(10),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `simples_nacional_detalhe` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_simples_nacional_cabecalho` INT NOT NULL,
  `faixa` INT,
  `valor_inicial` DECIMAL(18,6),
  `valor_final` DECIMAL(18,6),
  `aliquota` DECIMAL(18,6),
  `irpj` DECIMAL(18,6),
  `csll` DECIMAL(18,6),
  `cofins` DECIMAL(18,6),
  `pis_pasep` DECIMAL(18,6),
  `cpp` DECIMAL(18,6),
  `icms` DECIMAL(18,6),
  `ipi` DECIMAL(18,6),
  `iss` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_SIMPLES_NACIONAL_CAB_DET` (`id_simples_nacional_cabecalho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `sindicato` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100),
  `codigo_banco` INT,
  `codigo_agencia` INT,
  `conta_banco` VARCHAR(20),
  `codigo_cedente` VARCHAR(30),
  `logradouro` VARCHAR(100),
  `numero` VARCHAR(10),
  `bairro` VARCHAR(100),
  `municipio_ibge` INT,
  `uf` CHAR(2),
  `fone1` VARCHAR(14),
  `fone2` VARCHAR(14),
  `email` VARCHAR(100),
  `tipo_sindicato` CHAR(1),
  `data_base` DATE,
  `piso_salarial` DECIMAL(18,6),
  `cnpj` VARCHAR(14),
  `classificacao_contabil_conta` VARCHAR(30),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `tabela_preco` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100),
  `principal` CHAR(1),
  `coeficiente` DECIMAL(18,6),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `tabela_preco_produto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_tabela_preco` INT NOT NULL,
  `id_produto` INT NOT NULL,
  `preco` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_TABELA_PRECO` (`id_tabela_preco`),
  KEY `fk_TABELA_PRECO_PRODUTO_PRODUTO1_idx` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `talonario_cheque` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_banco_conta_caixa` INT NOT NULL,
  `talao` VARCHAR(10),
  `numero` INT,
  `status_talao` CHAR(1),
  PRIMARY KEY (`id`),
  KEY `fk_TALONARIO_CHEQUE_BANCO_CONTA_CAIXA1_idx` (`id_banco_conta_caixa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `tipo_admissao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` CHAR(3),
  `nome` VARCHAR(100),
  `descricao` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `tipo_contrato` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50),
  `descricao` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `tipo_item_sped` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` CHAR(2),
  `descricao` VARCHAR(50),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `tipo_receita_dacon` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` INT,
  `descricao` VARCHAR(50),
  `observacao` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `tipo_receita_dipi` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(100),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `tipo_relacionamento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` CHAR(3),
  `nome` VARCHAR(100),
  `descricao` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `transportadora` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_pessoa` INT NOT NULL,
  `data_cadastro` DATE,
  `observacao` VARCHAR(250),
  PRIMARY KEY (`id`),
  KEY `fk_TRANSPORTADORA_PESSOA1_idx` (`id_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `tribut_cofins` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_tribut_configura_of_gt` INT NOT NULL,
  `cst_cofins` CHAR(2),
  `efd_tabela_435` CHAR(2),
  `modalidade_base_calculo` CHAR(1),
  `porcento_base_calculo` DECIMAL(18,6),
  `aliquota_porcento` DECIMAL(18,6),
  `aliquota_unidade` DECIMAL(18,6),
  `valor_preco_maximo` DECIMAL(18,6),
  `valor_pauta_fiscal` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_CONFIG_OF_GT_COFINS` (`id_tribut_configura_of_gt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `tribut_configura_of_gt` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_tribut_grupo_tributario` INT NOT NULL,
  `id_tribut_operacao_fiscal` INT NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_OP_FISCAL_CONFIGURA` (`id_tribut_operacao_fiscal`),
  KEY `FK_GRUPO_TRIB_CONFIGURA` (`id_tribut_grupo_tributario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `tribut_grupo_tributario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(100),
  `origem_mercadoria` CHAR(1),
  `observacao` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `tribut_icms_custom_cab` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(100),
  `origem_mercadoria` CHAR(1),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `tribut_icms_custom_det` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_tribut_icms_custom_cab` INT NOT NULL,
  `uf_destino` CHAR(2),
  `cfop` INT,
  `csosn` CHAR(3),
  `cst` CHAR(2),
  `modalidade_bc` CHAR(1),
  `aliquota` DECIMAL(18,6),
  `valor_pauta` DECIMAL(18,6),
  `valor_preco_maximo` DECIMAL(18,6),
  `mva` DECIMAL(18,6),
  `porcento_bc` DECIMAL(18,6),
  `modalidade_bc_st` CHAR(1),
  `aliquota_interna_st` DECIMAL(18,6),
  `aliquota_interestadual_st` DECIMAL(18,6),
  `porcento_bc_st` DECIMAL(18,6),
  `aliquota_icms_st` DECIMAL(18,6),
  `valor_pauta_st` DECIMAL(18,6),
  `valor_preco_maximo_st` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_ICMS_CUSTOM_CAB_DET` (`id_tribut_icms_custom_cab`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `tribut_icms_uf` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_tribut_configura_of_gt` INT NOT NULL,
  `uf_destino` CHAR(2),
  `cfop` INT,
  `csosn` CHAR(3),
  `cst` CHAR(2),
  `modalidade_bc` CHAR(1),
  `aliquota` DECIMAL(18,6),
  `valor_pauta` DECIMAL(18,6),
  `valor_preco_maximo` DECIMAL(18,6),
  `mva` DECIMAL(18,6),
  `porcento_bc` DECIMAL(18,6),
  `modalidade_bc_st` CHAR(1),
  `aliquota_interna_st` DECIMAL(18,6),
  `aliquota_interestadual_st` DECIMAL(18,6),
  `porcento_bc_st` DECIMAL(18,6),
  `aliquota_icms_st` DECIMAL(18,6),
  `valor_pauta_st` DECIMAL(18,6),
  `valor_preco_maximo_st` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_CONFIG_OF_GT_ICMS` (`id_tribut_configura_of_gt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `tribut_ipi` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_tribut_configura_of_gt` INT NOT NULL,
  `cst_ipi` CHAR(2),
  `modalidade_base_calculo` CHAR(1),
  `porcento_base_calculo` DECIMAL(18,6),
  `aliquota_porcento` DECIMAL(18,6),
  `aliquota_unidade` DECIMAL(18,6),
  `valor_preco_maximo` DECIMAL(18,6),
  `valor_pauta_fiscal` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_CONFIG_OF_GT_IPI` (`id_tribut_configura_of_gt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `tribut_iss` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_tribut_operacao_fiscal` INT NOT NULL,
  `modalidade_base_calculo` CHAR(1),
  `porcento_base_calculo` DECIMAL(18,6),
  `aliquota_porcento` DECIMAL(18,6),
  `aliquota_unidade` DECIMAL(18,6),
  `valor_preco_maximo` DECIMAL(18,6),
  `valor_pauta_fiscal` DECIMAL(18,6),
  `item_lista_servico` INT,
  `codigo_tributacao` CHAR(1),
  PRIMARY KEY (`id`),
  KEY `FK_TRIBUT_OP_FISCAL_ISS` (`id_tribut_operacao_fiscal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `tribut_operacao_fiscal` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(100),
  `descricao_na_nf` VARCHAR(100),
  `cfop` INT,
  `observacao` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `tribut_pis` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_tribut_configura_of_gt` INT NOT NULL,
  `cst_pis` CHAR(2),
  `efd_tabela_435` CHAR(2),
  `modalidade_base_calculo` CHAR(1),
  `porcento_base_calculo` DECIMAL(18,6),
  `aliquota_porcento` DECIMAL(18,6),
  `aliquota_unidade` DECIMAL(18,6),
  `valor_preco_maximo` DECIMAL(18,6),
  `valor_pauta_fiscal` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_CONFIG_OF_GT_PIS` (`id_tribut_configura_of_gt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `uf` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `sigla` CHAR(2),
  `nome` VARCHAR(100),
  `codigo_ibge` INT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_colaborador` INT NOT NULL,
  `id_papel` INT NOT NULL,
  `login` VARCHAR(50),
  `senha` VARCHAR(50),
  `administrador` CHAR(1),
  `data_cadastro` DATE,
  PRIMARY KEY (`id`),
  KEY `fk_USUARIO_COLABORADOR1_idx` (`id_colaborador`),
  KEY `fk_USUARIO_PAPEL1_idx` (`id_papel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `venda_cabecalho` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_venda_orcamento_cabecalho` INT,
  `id_venda_condicoes_pagamento` INT NOT NULL,
  `id_nota_fiscal_tipo` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  `id_transportadora` INT,
  `id_vendedor` INT NOT NULL,
  `data_venda` DATE,
  `data_saida` DATE,
  `hora_saida` VARCHAR(8),
  `numero_fatura` INT,
  `local_entrega` VARCHAR(100),
  `local_cobranca` VARCHAR(100),
  `valor_subtotal` DECIMAL(18,6),
  `taxa_comissao` DECIMAL(18,6),
  `valor_comissao` DECIMAL(18,6),
  `taxa_desconto` DECIMAL(18,6),
  `valor_desconto` DECIMAL(18,6),
  `valor_total` DECIMAL(18,6),
  `tipo_frete` CHAR(1),
  `forma_pagamento` CHAR(1),
  `valor_frete` DECIMAL(18,6),
  `valor_seguro` DECIMAL(18,6),
  `observacao` TEXT,
  `situacao` CHAR(1),
  `dia_fixo_parcela` CHAR(2),
  PRIMARY KEY (`id`),
  KEY `FK_ORCAMENTO_VENDA` (`id_venda_orcamento_cabecalho`),
  KEY `FK_VENDA_CAB_CONDICOES` (`id_venda_condicoes_pagamento`),
  KEY `FK_TIPO_NF_VENDA_CAB` (`id_nota_fiscal_tipo`),
  KEY `fk_VENDA_CABECALHO_CLIENTE1_idx` (`id_cliente`),
  KEY `fk_VENDA_CABECALHO_TRANSPORTADORA1_idx` (`id_transportadora`),
  KEY `fk_VENDA_CABECALHO_VENDEDOR1_idx` (`id_vendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `venda_comissao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_venda_cabecalho` INT NOT NULL,
  `id_vendedor` INT NOT NULL,
  `valor_venda` DECIMAL(18,6),
  `tipo_contabil` CHAR(1),
  `valor_comissao` DECIMAL(18,6),
  `situacao` CHAR(1),
  `data_lancamento` DATE,
  PRIMARY KEY (`id`),
  KEY `FK_VENDA_COMISSAO` (`id_venda_cabecalho`),
  KEY `fk_VENDA_COMISSAO_VENDEDOR1_idx` (`id_vendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `venda_condicoes_pagamento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50),
  `descricao` TEXT,
  `faturamento_minimo` DECIMAL(18,6),
  `faturamento_maximo` DECIMAL(18,6),
  `indice_correcao` DECIMAL(18,6),
  `dias_tolerancia` INT,
  `valor_tolerancia` DECIMAL(18,6),
  `prazo_medio` INT,
  `vista_prazo` CHAR(1),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `venda_condicoes_parcelas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_venda_condicoes_pagamento` INT NOT NULL,
  `parcela` INT,
  `dias` INT,
  `taxa` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_CONDICOES_PARCELAS` (`id_venda_condicoes_pagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `venda_detalhe` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_venda_cabecalho` INT NOT NULL,
  `id_produto` INT NOT NULL,
  `quantidade` DECIMAL(18,6),
  `valor_unitario` DECIMAL(18,6),
  `valor_subtotal` DECIMAL(18,6),
  `taxa_desconto` DECIMAL(18,6),
  `valor_desconto` DECIMAL(18,6),
  `valor_total` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_VENDA_CAB_DET` (`id_venda_cabecalho`),
  KEY `fk_VENDA_DETALHE_PRODUTO1_idx` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `venda_frete` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_venda_cabecalho` INT NOT NULL,
  `id_transportadora` INT NOT NULL,
  `conhecimento` INT,
  `responsavel` CHAR(1),
  `placa` VARCHAR(7),
  `uf_placa` CHAR(2),
  `selo_fiscal` INT,
  `quantidade_volume` DECIMAL(18,6),
  `marca_volume` VARCHAR(50),
  `especie_volume` VARCHAR(20),
  `peso_bruto` DECIMAL(18,6),
  `peso_liquido` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_VENDA_CABECALHO_FRETE` (`id_venda_cabecalho`),
  KEY `fk_VENDA_FRETE_TRANSPORTADORA1_idx` (`id_transportadora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `venda_orcamento_cabecalho` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_venda_condicoes_pagamento` INT NOT NULL,
  `id_vendedor` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  `id_transportadora` INT,
  `codigo` VARCHAR(20),
  `data_cadastro` DATE,
  `data_entrega` DATE,
  `validade` DATE,
  `tipo_frete` CHAR(1),
  `valor_subtotal` DECIMAL(18,6),
  `valor_frete` DECIMAL(18,6),
  `taxa_comissao` DECIMAL(18,6),
  `valor_comissao` DECIMAL(18,6),
  `taxa_desconto` DECIMAL(18,6),
  `valor_desconto` DECIMAL(18,6),
  `valor_total` DECIMAL(18,6),
  `observacao` TEXT,
  PRIMARY KEY (`id`),
  KEY `FK_COND_PGTO_ORC_PED_VENDA` (`id_venda_condicoes_pagamento`),
  KEY `fk_VENDA_ORCAMENTO_CABECALHO_VENDEDOR1_idx` (`id_vendedor`),
  KEY `fk_VENDA_ORCAMENTO_CABECALHO_CLIENTE1_idx` (`id_cliente`),
  KEY `fk_VENDA_ORCAMENTO_CABECALHO_TRANSPORTADORA1_idx` (`id_transportadora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `venda_orcamento_detalhe` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_venda_orcamento_cabecalho` INT NOT NULL,
  `id_produto` INT NOT NULL,
  `quantidade` DECIMAL(18,6),
  `valor_unitario` DECIMAL(18,6),
  `valor_subtotal` DECIMAL(18,6),
  `taxa_desconto` DECIMAL(18,6),
  `valor_desconto` DECIMAL(18,6),
  `valor_total` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `FK_VENDA_ORCAMENTO_CAB_DET` (`id_venda_orcamento_cabecalho`),
  KEY `fk_VENDA_ORCAMENTO_DETALHE_PRODUTO1_idx` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `vendedor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_colaborador` INT NOT NULL,
  `id_comissao_perfil` INT,
  `comissao` DECIMAL(18,6),
  `meta_venda` DECIMAL(18,6),
  PRIMARY KEY (`id`),
  KEY `fk_VENDEDOR_COLABORADOR1_idx` (`id_colaborador`),
  KEY `fk_VENDEDOR_COMISSAO_PERFIL1_idx` (`id_comissao_perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `vendedor_meta` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_vendedor` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  `periodo_meta` CHAR(1),
  `meta_orcada` DECIMAL(18,6),
  `meta_realizada` DECIMAL(18,6),
  `data_inicio` DATE,
  `data_fim` DATE,
  PRIMARY KEY (`id`),
  KEY `fk_VENDEDOR_META_VENDEDOR1_idx` (`id_vendedor`),
  KEY `fk_VENDEDOR_META_CLIENTE1_idx` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `vendedor_rota` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_vendedor` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  `posicao` INT,
  PRIMARY KEY (`id`),
  KEY `fk_VENDEDOR_ROTA_VENDEDOR1_idx` (`id_vendedor`),
  KEY `fk_VENDEDOR_ROTA_CLIENTE1_idx` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `wms_agendamento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data_operacao` DATE,
  `hora_operacao` VARCHAR(8),
  `local_operacao` VARCHAR(100),
  `quantidade_volume` INT,
  `peso_total_volume` DECIMAL(18,6),
  `quantidade_pessoa` INT,
  `quantidade_hora` INT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `wms_armazenamento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_wms_caixa` INT NOT NULL,
  `id_wms_recebimento_detalhe` INT NOT NULL,
  `quantidade` INT,
  PRIMARY KEY (`id`),
  KEY `FK_CAIXA_ARMAZENA` (`id_wms_caixa`),
  KEY `FK_RECE_ARMAZENA` (`id_wms_recebimento_detalhe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `wms_caixa` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_wms_estante` INT NOT NULL,
  `codigo` VARCHAR(10),
  `altura` INT,
  `largura` INT,
  `profundidade` INT,
  PRIMARY KEY (`id`),
  KEY `FK_WMS_ESTANTE_CAIXA` (`id_wms_estante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `wms_estante` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_wms_rua` INT NOT NULL,
  `codigo` VARCHAR(10),
  `quantidade_caixa` INT,
  PRIMARY KEY (`id`),
  KEY `FK_WMS_RUA_ESTANTE` (`id_wms_rua`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `wms_expedicao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_wms_ordem_separacao_det` INT NOT NULL,
  `id_wms_armazenamento` INT NOT NULL,
  `quantidade` INT,
  `data_saida` DATE,
  PRIMARY KEY (`id`),
  KEY `FK_WMS_ARMAZ_EXPED` (`id_wms_armazenamento`),
  KEY `FK_WMS_OS_DET_EXPED` (`id_wms_ordem_separacao_det`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `wms_ordem_separacao_cab` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `origem` CHAR(1),
  `data_solicitacao` DATE,
  `data_limite` DATE,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `wms_ordem_separacao_det` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_wms_ordem_separacao_cab` INT NOT NULL,
  `id_produto` INT NOT NULL,
  `quantidade` INT,
  PRIMARY KEY (`id`),
  KEY `FK_WMS_OS_CAB_DET` (`id_wms_ordem_separacao_cab`),
  KEY `fk_WMS_ORDEM_SEPARACAO_DET_PRODUTO1_idx` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `wms_parametro` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `hora_por_volume` INT,
  `pessoa_por_volume` INT,
  `hora_por_peso` INT,
  `pessoa_por_peso` INT,
  `item_diferente_caixa` CHAR(1),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `wms_recebimento_cabecalho` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_wms_agendamento` INT NOT NULL,
  `data_recebimento` DATE,
  `hora_inicio` VARCHAR(8),
  `hora_fim` VARCHAR(8),
  `volume_recebido` INT,
  `peso_recebido` DECIMAL(18,6),
  `inconsistencia` CHAR(1),
  `observacao` TEXT,
  PRIMARY KEY (`id`),
  KEY `FK_WMS_AGENDA_RECEBE` (`id_wms_agendamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `wms_recebimento_detalhe` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_wms_recebimento_cabecalho` INT NOT NULL,
  `id_produto` INT NOT NULL,
  `quantidade_volume` INT,
  `quantidade_item_por_volume` INT,
  `quantidade_recebida` INT,
  `destino` CHAR(1),
  PRIMARY KEY (`id`),
  KEY `FK_WMS_REC_CAB_DET` (`id_wms_recebimento_cabecalho`),
  KEY `fk_WMS_RECEBIMENTO_DETALHE_PRODUTO1_idx` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `wms_rua` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(10),
  `nome` VARCHAR(100),
  `quantidade_estante` INT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `agenda_compromisso` ADD CONSTRAINT `fk_{FC824681-33D0-4247-BFDF-526A153CD722}` FOREIGN KEY (`id_agenda_categoria_compromisso`) REFERENCES `agenda_categoria_compromisso` (`id`);
ALTER TABLE `agenda_compromisso` ADD CONSTRAINT `fk_AGENDA_COMPROMISSO_COLABORADOR1` FOREIGN KEY (`id_colaborador`) REFERENCES `colaborador` (`id`);
ALTER TABLE `agenda_compromisso_convidado` ADD CONSTRAINT `fk_{4E85396E-52A3-46E0-86BA-E662BE304E59}` FOREIGN KEY (`id_agenda_compromisso`) REFERENCES `agenda_compromisso` (`id`);
ALTER TABLE `agenda_compromisso_convidado` ADD CONSTRAINT `fk_AGENDA_COMPROMISSO_CONVIDADO_COLABORADOR1` FOREIGN KEY (`id_colaborador`) REFERENCES `colaborador` (`id`);
ALTER TABLE `agenda_notificacao` ADD CONSTRAINT `fk_{399131FD-404B-48BF-AF89-C823DD44767F}` FOREIGN KEY (`id_agenda_compromisso`) REFERENCES `agenda_compromisso` (`id`);
ALTER TABLE `banco_agencia` ADD CONSTRAINT `fk_BANCO_AGENCIA_BANCO1` FOREIGN KEY (`id_banco`) REFERENCES `banco` (`id`);
ALTER TABLE `banco_conta_caixa` ADD CONSTRAINT `fk_BANCO_CONTA_CAIXA_BANCO_AGENCIA1` FOREIGN KEY (`id_banco_agencia`) REFERENCES `banco_agencia` (`id`);
ALTER TABLE `bpe_agencia` ADD CONSTRAINT `fk_{BE7E7FC1-4115-40C2-AB9E-A9B2B1B52D98}0` FOREIGN KEY (`id_bpe_cabecalho`) REFERENCES `bpe_cabecalho` (`id`);
ALTER TABLE `bpe_comprador` ADD CONSTRAINT `fk_{44C5AE01-875B-414A-B141-210DE88D5716}0` FOREIGN KEY (`id_bpe_cabecalho`) REFERENCES `bpe_cabecalho` (`id`);
ALTER TABLE `bpe_emitente` ADD CONSTRAINT `fk_{8E0EA66C-EA89-4C1F-8CF4-778365C7AE3B}0` FOREIGN KEY (`id_bpe_cabecalho`) REFERENCES `bpe_cabecalho` (`id`);
ALTER TABLE `bpe_passageiro` ADD CONSTRAINT `fk_{FB54EDC5-F918-4617-A828-70539984BB46}0` FOREIGN KEY (`id_bpe_cabecalho`) REFERENCES `bpe_cabecalho` (`id`);
ALTER TABLE `bpe_passagem` ADD CONSTRAINT `fk_{9B8A42CB-E13A-475F-81FE-5E7C48ED6E2F}0` FOREIGN KEY (`id_bpe_cabecalho`) REFERENCES `bpe_cabecalho` (`id`);
ALTER TABLE `bpe_viagem` ADD CONSTRAINT `fk_{B49F680D-20F5-4D89-945B-ED7A99C5EBFF}0` FOREIGN KEY (`id_bpe_cabecalho`) REFERENCES `bpe_cabecalho` (`id`);
ALTER TABLE `centro_resultado` ADD CONSTRAINT `fk_{A188D698-8145-4182-9A82-AFD03C7BCD15}` FOREIGN KEY (`id_plano_centro_resultado`) REFERENCES `plano_centro_resultado` (`id`);
ALTER TABLE `cheque` ADD CONSTRAINT `fk_{E7B18D4F-5CF4-4A5D-AC05-B57A05559CA6}` FOREIGN KEY (`id_talonario_cheque`) REFERENCES `talonario_cheque` (`id`);
ALTER TABLE `cliente` ADD CONSTRAINT `fk_CLIENTE_PESSOA` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id`);
ALTER TABLE `cliente` ADD CONSTRAINT `fk_CLIENTE_TABELA_PRECO1` FOREIGN KEY (`id_tabela_preco`) REFERENCES `tabela_preco` (`id`);
ALTER TABLE `cod_apuracao_receita_dacon` ADD CONSTRAINT `fk_{871BBBAD-37B7-4523-9FF5-7DDC7049997C}` FOREIGN KEY (`id_tipo_receita_dacon`) REFERENCES `tipo_receita_dacon` (`id`);
ALTER TABLE `cod_apuracao_receita_dacon` ADD CONSTRAINT `fk_{A797B44B-92E2-4EDF-A831-52EE511664F6}` FOREIGN KEY (`id_codigo_apuracao_efd`) REFERENCES `efd_tabela_435` (`id`);
ALTER TABLE `colaborador` ADD CONSTRAINT `fk_COLABORADOR_PESSOA1` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id`);
ALTER TABLE `colaborador` ADD CONSTRAINT `fk_COLABORADOR_CARGO1` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id`);
ALTER TABLE `colaborador` ADD CONSTRAINT `fk_COLABORADOR_SETOR1` FOREIGN KEY (`id_setor`) REFERENCES `setor` (`id`);
ALTER TABLE `colaborador` ADD CONSTRAINT `fk_COLABORADOR_COLABORADOR_SITUACAO1` FOREIGN KEY (`id_colaborador_situacao`) REFERENCES `colaborador_situacao` (`id`);
ALTER TABLE `colaborador` ADD CONSTRAINT `fk_COLABORADOR_TIPO_ADMISSAO1` FOREIGN KEY (`id_tipo_admissao`) REFERENCES `tipo_admissao` (`id`);
ALTER TABLE `colaborador` ADD CONSTRAINT `fk_COLABORADOR_COLABORADOR_TIPO1` FOREIGN KEY (`id_colaborador_tipo`) REFERENCES `colaborador_tipo` (`id`);
ALTER TABLE `colaborador` ADD CONSTRAINT `fk_COLABORADOR_SINDICATO1` FOREIGN KEY (`id_sindicato`) REFERENCES `sindicato` (`id`);
ALTER TABLE `colaborador_relacionamento` ADD CONSTRAINT `fk_{195AEAA0-25CF-41CB-B13F-5AAA18580AC8}` FOREIGN KEY (`id_tipo_relacionamento`) REFERENCES `tipo_relacionamento` (`id`);
ALTER TABLE `colaborador_relacionamento` ADD CONSTRAINT `fk_COLABORADOR_RELACIONAMENTO_COLABORADOR1` FOREIGN KEY (`id_colaborador`) REFERENCES `colaborador` (`id`);
ALTER TABLE `comissao_objetivo` ADD CONSTRAINT `fk_{351EF9CB-7F6D-4EDE-A2C3-E35B9EF1F796}` FOREIGN KEY (`id_comissao_perfil`) REFERENCES `comissao_perfil` (`id`);
ALTER TABLE `comissao_objetivo` ADD CONSTRAINT `fk_COMISSAO_OBJETIVO_PRODUTO1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`);
ALTER TABLE `compra_cotacao` ADD CONSTRAINT `fk_COMPRA_COTACAO_COMPRA_REQUISICAO1` FOREIGN KEY (`id_compra_requisicao`) REFERENCES `compra_requisicao` (`id`);
ALTER TABLE `compra_cotacao_detalhe` ADD CONSTRAINT `fk_{2DE08AA3-A7B9-41A3-A33E-5F3FBEF89674}` FOREIGN KEY (`id_compra_fornecedor_cotacao`) REFERENCES `compra_fornecedor_cotacao` (`id`);
ALTER TABLE `compra_cotacao_detalhe` ADD CONSTRAINT `fk_COMPRA_COTACAO_DETALHE_PRODUTO1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`);
ALTER TABLE `compra_fornecedor_cotacao` ADD CONSTRAINT `fk_{F28D90D4-59C0-49A3-8AF2-94BA6F6B55CE}` FOREIGN KEY (`id_compra_cotacao`) REFERENCES `compra_cotacao` (`id`);
ALTER TABLE `compra_fornecedor_cotacao` ADD CONSTRAINT `fk_COMPRA_FORNECEDOR_COTACAO_FORNECEDOR1` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`id`);
ALTER TABLE `compra_pedido` ADD CONSTRAINT `fk_{E9033C3C-AFA4-444D-8A06-165419B51DD3}` FOREIGN KEY (`id_compra_tipo_pedido`) REFERENCES `compra_tipo_pedido` (`id`);
ALTER TABLE `compra_pedido` ADD CONSTRAINT `fk_COMPRA_PEDIDO_FORNECEDOR1` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`id`);
ALTER TABLE `compra_pedido` ADD CONSTRAINT `fk_COMPRA_PEDIDO_COLABORADOR1` FOREIGN KEY (`id_colaborador`) REFERENCES `colaborador` (`id`);
ALTER TABLE `compra_pedido_detalhe` ADD CONSTRAINT `fk_{F87F64FC-8F40-43C6-9A94-7E84A1551C3A}` FOREIGN KEY (`id_compra_pedido`) REFERENCES `compra_pedido` (`id`);
ALTER TABLE `compra_pedido_detalhe` ADD CONSTRAINT `fk_COMPRA_PEDIDO_DETALHE_PRODUTO1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`);
ALTER TABLE `compra_requisicao` ADD CONSTRAINT `fk_{38C90B1B-4612-4019-8BC4-DB19CB8591F3}` FOREIGN KEY (`id_compra_tipo_requisicao`) REFERENCES `compra_tipo_requisicao` (`id`);
ALTER TABLE `compra_requisicao` ADD CONSTRAINT `fk_COMPRA_REQUISICAO_COLABORADOR1` FOREIGN KEY (`id_colaborador`) REFERENCES `colaborador` (`id`);
ALTER TABLE `compra_requisicao_detalhe` ADD CONSTRAINT `fk_{ECA5555D-212D-4D7B-A79C-D5560C161C8F}` FOREIGN KEY (`id_compra_requisicao`) REFERENCES `compra_requisicao` (`id`);
ALTER TABLE `compra_requisicao_detalhe` ADD CONSTRAINT `fk_COMPRA_REQUISICAO_DETALHE_PRODUTO1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`);
ALTER TABLE `contabil_conta` ADD CONSTRAINT `fk_{B91BDB7E-3C89-47F2-B87F-EF076C65C6F9}` FOREIGN KEY (`id_plano_conta_ref_sped`) REFERENCES `plano_conta_ref_sped` (`id`);
ALTER TABLE `contabil_conta` ADD CONSTRAINT `fk_{1A1B29A3-97FA-4561-BCC1-98667B3C27B1}` FOREIGN KEY (`id_contabil_conta`) REFERENCES `contabil_conta` (`id`);
ALTER TABLE `contabil_conta` ADD CONSTRAINT `fk_{115D906C-AFF4-472A-B675-4F4FF01593D7}` FOREIGN KEY (`id_plano_conta`) REFERENCES `plano_conta` (`id`);
ALTER TABLE `contabil_conta_rateio` ADD CONSTRAINT `fk_{846C5684-4DCA-4EF2-8210-D5E1A11E71FE}` FOREIGN KEY (`id_contabil_conta`) REFERENCES `contabil_conta` (`id`);
ALTER TABLE `contabil_conta_rateio` ADD CONSTRAINT `fk_{21B68C00-3BFB-469C-AAA0-AD350248A949}` FOREIGN KEY (`id_centro_resultado`) REFERENCES `centro_resultado` (`id`);
ALTER TABLE `contabil_dre_detalhe` ADD CONSTRAINT `fk_{6DDCBE08-695E-44C5-8412-EBA846C11BDB}` FOREIGN KEY (`id_contabil_dre_cabecalho`) REFERENCES `contabil_dre_cabecalho` (`id`);
ALTER TABLE `contabil_encerramento_exe_det` ADD CONSTRAINT `fk_{E3F23D1A-CCDC-467F-A8F2-9E0A03FD6C63}` FOREIGN KEY (`id_contabil_encerramento_exe`) REFERENCES `contabil_encerramento_exe_cab` (`id`);
ALTER TABLE `contabil_encerramento_exe_det` ADD CONSTRAINT `fk_{74FD9080-F3C3-4C60-A10D-D7A2F34EBE60}` FOREIGN KEY (`id_contabil_conta`) REFERENCES `contabil_conta` (`id`);
ALTER TABLE `contabil_indice_valor` ADD CONSTRAINT `fk_{7B3E8135-BFC8-4495-AD53-62286EAAC690}` FOREIGN KEY (`id_contabil_indice`) REFERENCES `contabil_indice` (`id`);
ALTER TABLE `contabil_lancamento_cabecalho` ADD CONSTRAINT `fk_{792712E2-E225-495D-A777-E44DE2565BE7}` FOREIGN KEY (`id_contabil_lote`) REFERENCES `contabil_lote` (`id`);
ALTER TABLE `contabil_lancamento_detalhe` ADD CONSTRAINT `fk_{91277FE7-0BBC-47D5-AF99-7477DA2CDE13}` FOREIGN KEY (`id_contabil_lancamento_cab`) REFERENCES `contabil_lancamento_cabecalho` (`id`);
ALTER TABLE `contabil_lancamento_detalhe` ADD CONSTRAINT `fk_{105193A2-FC4D-4B16-A6AD-6C6C337D8FF7}` FOREIGN KEY (`id_contabil_historico`) REFERENCES `contabil_historico` (`id`);
ALTER TABLE `contabil_lancamento_detalhe` ADD CONSTRAINT `fk_{E1CB8197-3D7D-44A6-82F6-C882BA9FAA40}` FOREIGN KEY (`id_contabil_conta`) REFERENCES `contabil_conta` (`id`);
ALTER TABLE `contabil_lancamento_orcado` ADD CONSTRAINT `fk_{9821838A-9514-48E9-8385-17A587D1A2C1}` FOREIGN KEY (`id_contabil_conta`) REFERENCES `contabil_conta` (`id`);
ALTER TABLE `contabil_termo` ADD CONSTRAINT `fk_{90B322A0-2DA8-4EF0-9D6A-4D8467F07F59}` FOREIGN KEY (`id_contabil_livro`) REFERENCES `contabil_livro` (`id`);
ALTER TABLE `contador` ADD CONSTRAINT `fk_CONTADOR_PESSOA1` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id`);
ALTER TABLE `contrato` ADD CONSTRAINT `fk_{361E6865-AACA-4AAE-835D-69951506B97C}` FOREIGN KEY (`id_tipo_contrato`) REFERENCES `tipo_contrato` (`id`);
ALTER TABLE `contrato` ADD CONSTRAINT `fk_{26AD0339-9A7F-44D5-A937-974AF985C5C6}` FOREIGN KEY (`id_solicitacao_servico`) REFERENCES `contrato_solicitacao_servico` (`id`);
ALTER TABLE `contrato_historico_reajuste` ADD CONSTRAINT `fk_{5930B5F3-8D84-48F3-ADE0-546A1D58EF8A}` FOREIGN KEY (`id_contrato`) REFERENCES `contrato` (`id`);
ALTER TABLE `contrato_hist_faturamento` ADD CONSTRAINT `fk_{04A46B13-CDC1-42A8-A029-987FD4C07CC3}` FOREIGN KEY (`id_contrato`) REFERENCES `contrato` (`id`);
ALTER TABLE `contrato_prev_faturamento` ADD CONSTRAINT `fk_{08124560-2F8F-419E-911B-8193C17AC936}` FOREIGN KEY (`id_contrato`) REFERENCES `contrato` (`id`);
ALTER TABLE `contrato_solicitacao_servico` ADD CONSTRAINT `fk_{11550058-0569-4D22-9D52-79ECED1CB6F4}` FOREIGN KEY (`id_contrato_tipo_servico`) REFERENCES `contrato_tipo_servico` (`id`);
ALTER TABLE `contrato_solicitacao_servico` ADD CONSTRAINT `fk_CONTRATO_SOLICITACAO_SERVICO_SETOR1` FOREIGN KEY (`id_setor`) REFERENCES `setor` (`id`);
ALTER TABLE `contrato_solicitacao_servico` ADD CONSTRAINT `fk_CONTRATO_SOLICITACAO_SERVICO_COLABORADOR1` FOREIGN KEY (`id_colaborador`) REFERENCES `colaborador` (`id`);
ALTER TABLE `contrato_solicitacao_servico` ADD CONSTRAINT `fk_CONTRATO_SOLICITACAO_SERVICO_CLIENTE1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`);
ALTER TABLE `contrato_solicitacao_servico` ADD CONSTRAINT `fk_CONTRATO_SOLICITACAO_SERVICO_FORNECEDOR1` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`id`);
ALTER TABLE `contrib_sind_patronal_cab` ADD CONSTRAINT `fk_{3B251EB4-F260-4A83-8C67-BFCF190AEC38}` FOREIGN KEY (`id_sindicato`) REFERENCES `sindicato` (`id`);
ALTER TABLE `contrib_sind_patronal_det` ADD CONSTRAINT `fk_{107BD546-819B-41B2-B009-646739BD5837}` FOREIGN KEY (`id_contrib_sind_patronal_cab`) REFERENCES `contrib_sind_patronal_cab` (`id`);
ALTER TABLE `crm_buscas_cliente` ADD CONSTRAINT `fk_CRM_BUSCAS_CLIENTE_CLIENTE1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`);
ALTER TABLE `crm_carteira_cliente` ADD CONSTRAINT `fk_CRM_CARTEIRA_CLIENTE_CRM_CARTEIRA_CLIENTE_PERFIL1` FOREIGN KEY (`id_crm_carteira_cliente_perfil`) REFERENCES `crm_carteira_cliente_perfil` (`id`);
ALTER TABLE `crm_carteira_cliente` ADD CONSTRAINT `fk_CRM_CARTEIRA_CLIENTE_CLIENTE1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`);
ALTER TABLE `crm_sac_cabecalho` ADD CONSTRAINT `fk_CRM_SAC_CABECALHO_CLIENTE1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`);
ALTER TABLE `crm_sac_detalhe` ADD CONSTRAINT `fk_CRM_SAC_DETALHE_CRM_SAC_CABECALHO1` FOREIGN KEY (`id_crm_sac_cabecalho`) REFERENCES `crm_sac_cabecalho` (`id`);
ALTER TABLE `cte_aereo` ADD CONSTRAINT `fk_{582ED563-2B8F-4348-9777-94FA1657E73D}` FOREIGN KEY (`id_cte_cabecalho`) REFERENCES `cte_cabecalho` (`id`);
ALTER TABLE `cte_aquaviario` ADD CONSTRAINT `fk_{EDB7A037-01B1-41C0-935C-32998709A4CA}` FOREIGN KEY (`id_cte_cabecalho`) REFERENCES `cte_cabecalho` (`id`);
ALTER TABLE `cte_aquaviario_balsa` ADD CONSTRAINT `fk_{C55A2FC7-979F-4114-A228-699EFFDFF750}` FOREIGN KEY (`id_cte_aquaviario`) REFERENCES `cte_aquaviario` (`id`);
ALTER TABLE `cte_carga` ADD CONSTRAINT `fk_{9B8A42CB-E13A-475F-81FE-5E7C48ED6E2F}` FOREIGN KEY (`id_cte_cabecalho`) REFERENCES `cte_cabecalho` (`id`);
ALTER TABLE `cte_componente` ADD CONSTRAINT `fk_{6A4B28DA-0868-47B1-B135-35B9AB1D1598}` FOREIGN KEY (`id_cte_cabecalho`) REFERENCES `cte_cabecalho` (`id`);
ALTER TABLE `cte_destinatario` ADD CONSTRAINT `fk_{BE7E7FC1-4115-40C2-AB9E-A9B2B1B52D98}` FOREIGN KEY (`id_cte_cabecalho`) REFERENCES `cte_cabecalho` (`id`);
ALTER TABLE `cte_documento_anterior` ADD CONSTRAINT `fk_{A53759A7-D844-4D7F-A5EF-B72EACB5ED21}` FOREIGN KEY (`id_cte_cabecalho`) REFERENCES `cte_cabecalho` (`id`);
ALTER TABLE `cte_documento_anterior_id` ADD CONSTRAINT `fk_{9A75406F-0C01-483F-8130-100DDC289E23}` FOREIGN KEY (`id_cte_documento_anterior`) REFERENCES `cte_documento_anterior` (`id`);
ALTER TABLE `cte_duplicata` ADD CONSTRAINT `fk_{59427324-F43F-494C-B707-2C3544786351}` FOREIGN KEY (`id_cte_cabecalho`) REFERENCES `cte_cabecalho` (`id`);
ALTER TABLE `cte_dutoviario` ADD CONSTRAINT `fk_{9FEE0E93-DDB5-4B3F-ADA6-8301E12F3CD9}` FOREIGN KEY (`id_cte_cabecalho`) REFERENCES `cte_cabecalho` (`id`);
ALTER TABLE `cte_emitente` ADD CONSTRAINT `fk_{8E0EA66C-EA89-4C1F-8CF4-778365C7AE3B}` FOREIGN KEY (`id_cte_cabecalho`) REFERENCES `cte_cabecalho` (`id`);
ALTER TABLE `cte_expedidor` ADD CONSTRAINT `fk_{B49F680D-20F5-4D89-945B-ED7A99C5EBFF}` FOREIGN KEY (`id_cte_cabecalho`) REFERENCES `cte_cabecalho` (`id`);
ALTER TABLE `cte_fatura` ADD CONSTRAINT `fk_{6438723E-81DB-4412-ABEC-40020AAE5DF6}` FOREIGN KEY (`id_cte_cabecalho`) REFERENCES `cte_cabecalho` (`id`);
ALTER TABLE `cte_ferroviario` ADD CONSTRAINT `fk_{9633509A-D7F9-476B-B37E-8210A6404789}` FOREIGN KEY (`id_cte_cabecalho`) REFERENCES `cte_cabecalho` (`id`);
ALTER TABLE `cte_ferroviario_ferrovia` ADD CONSTRAINT `fk_{AB21B268-A4C7-48C0-AB57-87A4561FC4F2}` FOREIGN KEY (`id_cte_ferroviario`) REFERENCES `cte_ferroviario` (`id`);
ALTER TABLE `cte_ferroviario_vagao` ADD CONSTRAINT `fk_{3913F060-202C-40F7-8696-5C45BD7ED67A}` FOREIGN KEY (`id_cte_ferroviario`) REFERENCES `cte_ferroviario` (`id`);
ALTER TABLE `cte_informacao_nf_carga` ADD CONSTRAINT `fk_{5DB05F41-B797-49A1-B003-D7B4DF8BF69C}` FOREIGN KEY (`id_cte_informacao_nf`) REFERENCES `cte_informacao_nf_outros` (`id`);
ALTER TABLE `cte_informacao_nf_outros` ADD CONSTRAINT `fk_{9E6856B9-7569-4D16-BE24-71BF8F64DC1E}` FOREIGN KEY (`id_cte_cabecalho`) REFERENCES `cte_cabecalho` (`id`);
ALTER TABLE `cte_informacao_nf_transporte` ADD CONSTRAINT `fk_{A8CC2C9B-5112-4914-AA89-D8E0D2B6E646}` FOREIGN KEY (`id_cte_informacao_nf`) REFERENCES `cte_informacao_nf_outros` (`id`);
ALTER TABLE `cte_inf_nf_carga_lacre` ADD CONSTRAINT `fk_{54ED8F7F-282E-4133-B2EF-771071F016AC}` FOREIGN KEY (`id_cte_informacao_nf_carga`) REFERENCES `cte_informacao_nf_carga` (`id`);
ALTER TABLE `cte_inf_nf_transporte_lacre` ADD CONSTRAINT `fk_{95A36096-9355-464E-A5DB-22B8F81E9908}` FOREIGN KEY (`id_cte_informacao_nf_transporte`) REFERENCES `cte_informacao_nf_transporte` (`id`);
ALTER TABLE `cte_local_coleta` ADD CONSTRAINT `fk_{BB10E3A1-3572-4882-ADE2-B20451A6C58A}` FOREIGN KEY (`id_cte_cabecalho`) REFERENCES `cte_cabecalho` (`id`);
ALTER TABLE `cte_local_entrega` ADD CONSTRAINT `fk_{754026B8-770A-45E5-B53C-385E92689A57}` FOREIGN KEY (`id_cte_cabecalho`) REFERENCES `cte_cabecalho` (`id`);
ALTER TABLE `cte_multimodal` ADD CONSTRAINT `fk_{D4D31624-133A-4E99-9505-EFF8AA9EE66C}` FOREIGN KEY (`id_cte_cabecalho`) REFERENCES `cte_cabecalho` (`id`);
ALTER TABLE `cte_passagem` ADD CONSTRAINT `fk_{08191DFB-E061-4102-A065-34C8E0503CDA}` FOREIGN KEY (`id_cte_cabecalho`) REFERENCES `cte_cabecalho` (`id`);
ALTER TABLE `cte_perigoso` ADD CONSTRAINT `fk_{B945A292-6A0E-4DF9-83F2-A595019696D1}` FOREIGN KEY (`id_cte_cabecalho`) REFERENCES `cte_cabecalho` (`id`);
ALTER TABLE `cte_recebedor` ADD CONSTRAINT `fk_{73407675-AEAC-4EF4-80E5-3EF4401CF4D3}` FOREIGN KEY (`id_cte_cabecalho`) REFERENCES `cte_cabecalho` (`id`);
ALTER TABLE `cte_remetente` ADD CONSTRAINT `fk_{44C5AE01-875B-414A-B141-210DE88D5716}` FOREIGN KEY (`id_cte_cabecalho`) REFERENCES `cte_cabecalho` (`id`);
ALTER TABLE `cte_rodoviario` ADD CONSTRAINT `fk_{F5250044-0CC7-4629-AFFF-D28B8FDA5EA1}` FOREIGN KEY (`id_cte_cabecalho`) REFERENCES `cte_cabecalho` (`id`);
ALTER TABLE `cte_rodoviario_lacre` ADD CONSTRAINT `fk_{004EE9FA-6941-4146-834D-227A24BAD2A6}` FOREIGN KEY (`id_cte_rodoviario`) REFERENCES `cte_rodoviario` (`id`);
ALTER TABLE `cte_rodoviario_motorista` ADD CONSTRAINT `fk_{C8EBA555-FAA4-4B1E-BBD6-6544E2BC65B6}` FOREIGN KEY (`id_cte_rodoviario`) REFERENCES `cte_rodoviario` (`id`);
ALTER TABLE `cte_rodoviario_occ` ADD CONSTRAINT `fk_{DD4F9E16-BFDD-4934-A6A0-AFAD56955E2A}` FOREIGN KEY (`id_cte_rodoviario`) REFERENCES `cte_rodoviario` (`id`);
ALTER TABLE `cte_rodoviario_pedagio` ADD CONSTRAINT `fk_{1DD17407-7E79-4DC1-B8EC-40D707A49A50}` FOREIGN KEY (`id_cte_rodoviario`) REFERENCES `cte_rodoviario` (`id`);
ALTER TABLE `cte_rodoviario_veiculo` ADD CONSTRAINT `fk_{8F53C9C0-2DBD-4833-9A6F-65464DB09C72}` FOREIGN KEY (`id_cte_rodoviario`) REFERENCES `cte_rodoviario` (`id`);
ALTER TABLE `cte_seguro` ADD CONSTRAINT `fk_{C775F390-C782-4417-A741-5F64688574C5}` FOREIGN KEY (`id_cte_cabecalho`) REFERENCES `cte_cabecalho` (`id`);
ALTER TABLE `cte_tomador` ADD CONSTRAINT `fk_{FB54EDC5-F918-4617-A828-70539984BB46}` FOREIGN KEY (`id_cte_cabecalho`) REFERENCES `cte_cabecalho` (`id`);
ALTER TABLE `cte_veiculo_novo` ADD CONSTRAINT `fk_{7276AE5B-E77E-49F1-B481-FA55D8680C6D}` FOREIGN KEY (`id_cte_cabecalho`) REFERENCES `cte_cabecalho` (`id`);
ALTER TABLE `ct_resultado_nt_financeira` ADD CONSTRAINT `fk_{858FCE59-EBDE-45C6-BA90-BE4EE82F5897}` FOREIGN KEY (`id_centro_resultado`) REFERENCES `centro_resultado` (`id`);
ALTER TABLE `ct_resultado_nt_financeira` ADD CONSTRAINT `fk_CT_RESULTADO_NT_FINANCEIRA_FIN_NATUREZA_FINANCEIRA1` FOREIGN KEY (`id_fin_natureza_financeira`) REFERENCES `fin_natureza_financeira` (`id`);
ALTER TABLE `dav_cabecalho` ADD CONSTRAINT `fk_DAV_CABECALHO_PESSOA1` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id`);
ALTER TABLE `dav_detalhe` ADD CONSTRAINT `fk_{01AF191E-A00C-44B1-95BE-FCA329907DA1}` FOREIGN KEY (`id_dav_cabecalho`) REFERENCES `dav_cabecalho` (`id`);
ALTER TABLE `dav_detalhe` ADD CONSTRAINT `fk_DAV_DETALHE_PRODUTO1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`);
ALTER TABLE `dav_detalhe_alteracao` ADD CONSTRAINT `fk_{38EB7611-F536-4209-BEFD-EE739D12E364}` FOREIGN KEY (`id_dav_detalhe`) REFERENCES `dav_detalhe` (`id`);
ALTER TABLE `empresa_cnae` ADD CONSTRAINT `fk_EMPRESA_CNAE_EMPRESA1` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`);
ALTER TABLE `empresa_cnae` ADD CONSTRAINT `fk_EMPRESA_CNAE_CNAE1` FOREIGN KEY (`id_cnae`) REFERENCES `cnae` (`id`);
ALTER TABLE `empresa_contato` ADD CONSTRAINT `fk_EMPRESA_CONTATO_EMPRESA1` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`);
ALTER TABLE `empresa_endereco` ADD CONSTRAINT `fk_EMPRESA_ENDERECO_EMPRESA1` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`);
ALTER TABLE `empresa_telefone` ADD CONSTRAINT `fk_EMPRESA_TELEFONE_EMPRESA1` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`);
ALTER TABLE `empresa_transporte_itinerario` ADD CONSTRAINT `fk_{8FE3D483-E7D9-4361-B2E8-464F7D802A73}` FOREIGN KEY (`id_empresa_transporte`) REFERENCES `empresa_transporte` (`id`);
ALTER TABLE `encerra_centro_resultado` ADD CONSTRAINT `fk_{CA4C3C76-2109-472E-A979-8CA8A104070C}` FOREIGN KEY (`id_centro_resultado`) REFERENCES `centro_resultado` (`id`);
ALTER TABLE `estoque_grade` ADD CONSTRAINT `fk_{B599518C-2BAD-4EE0-A146-E41754BEE49D}` FOREIGN KEY (`id_estoque_cor`) REFERENCES `estoque_cor` (`id`);
ALTER TABLE `estoque_grade` ADD CONSTRAINT `fk_{08CB887D-2458-4189-957A-2B8DC12F08C4}` FOREIGN KEY (`id_estoque_tamanho`) REFERENCES `estoque_tamanho` (`id`);
ALTER TABLE `estoque_grade` ADD CONSTRAINT `fk_{F4C36775-73AD-4D90-AB42-1DB3E5EDF85D}` FOREIGN KEY (`id_estoque_sabor`) REFERENCES `estoque_sabor` (`id`);
ALTER TABLE `estoque_grade` ADD CONSTRAINT `fk_{5E639E1C-5C60-46BE-A862-D3802D631C3C}` FOREIGN KEY (`id_estoque_marca`) REFERENCES `estoque_marca` (`id`);
ALTER TABLE `estoque_grade` ADD CONSTRAINT `fk_ESTOQUE_GRADE_PRODUTO1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`);
ALTER TABLE `estoque_reajuste_cabecalho` ADD CONSTRAINT `fk_ESTOQUE_REAJUSTE_CABECALHO_COLABORADOR1` FOREIGN KEY (`id_colaborador`) REFERENCES `colaborador` (`id`);
ALTER TABLE `estoque_reajuste_detalhe` ADD CONSTRAINT `fk_{4CC49A7E-B388-4C3C-8F2A-E307C07CE241}` FOREIGN KEY (`id_estoque_reajuste_cabecalho`) REFERENCES `estoque_reajuste_cabecalho` (`id`);
ALTER TABLE `estoque_reajuste_detalhe` ADD CONSTRAINT `fk_ESTOQUE_REAJUSTE_DETALHE_PRODUTO1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`);
ALTER TABLE `etiqueta_layout` ADD CONSTRAINT `fk_{870DB90A-1372-4E58-B205-C25BB2C7365F}` FOREIGN KEY (`id_formato_papel`) REFERENCES `etiqueta_formato_papel` (`id`);
ALTER TABLE `etiqueta_template` ADD CONSTRAINT `fk_{433B10D1-3F6E-494B-AD5E-DBF791DFA501}` FOREIGN KEY (`id_etiqueta_layout`) REFERENCES `etiqueta_layout` (`id`);
ALTER TABLE `ferias_periodo_aquisitivo` ADD CONSTRAINT `fk_FERIAS_PERIODO_AQUISITIVO_COLABORADOR1` FOREIGN KEY (`id_colaborador`) REFERENCES `colaborador` (`id`);
ALTER TABLE `fin_cheque_emitido` ADD CONSTRAINT `fk_{75F21313-9E6B-4319-9C96-B460CCA89916}` FOREIGN KEY (`id_cheque`) REFERENCES `cheque` (`id`);
ALTER TABLE `fin_cheque_recebido` ADD CONSTRAINT `fk_FIN_CHEQUE_RECEBIDO_PESSOA1` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id`);
ALTER TABLE `fin_configuracao_boleto` ADD CONSTRAINT `fk_FIN_CONFIGURACAO_BOLETO_BANCO_CONTA_CAIXA1` FOREIGN KEY (`id_banco_conta_caixa`) REFERENCES `banco_conta_caixa` (`id`);
ALTER TABLE `fin_extrato_conta_banco` ADD CONSTRAINT `fk_FIN_EXTRATO_CONTA_BANCO_BANCO_CONTA_CAIXA1` FOREIGN KEY (`id_banco_conta_caixa`) REFERENCES `banco_conta_caixa` (`id`);
ALTER TABLE `fin_fechamento_caixa_banco` ADD CONSTRAINT `fk_FIN_FECHAMENTO_CAIXA_BANCO_BANCO_CONTA_CAIXA1` FOREIGN KEY (`id_banco_conta_caixa`) REFERENCES `banco_conta_caixa` (`id`);
ALTER TABLE `fin_lancamento_pagar` ADD CONSTRAINT `fk_{78F2F6A7-9A1B-4960-9786-757E3E77873A}` FOREIGN KEY (`id_fin_documento_origem`) REFERENCES `fin_documento_origem` (`id`);
ALTER TABLE `fin_lancamento_pagar` ADD CONSTRAINT `fk_FIN_LANCAMENTO_PAGAR_FIN_NATUREZA_FINANCEIRA1` FOREIGN KEY (`id_fin_natureza_financeira`) REFERENCES `fin_natureza_financeira` (`id`);
ALTER TABLE `fin_lancamento_pagar` ADD CONSTRAINT `fk_FIN_LANCAMENTO_PAGAR_FORNECEDOR1` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`id`);
ALTER TABLE `fin_lancamento_pagar` ADD CONSTRAINT `fk_FIN_LANCAMENTO_PAGAR_BANCO_CONTA_CAIXA1` FOREIGN KEY (`id_banco_conta_caixa`) REFERENCES `banco_conta_caixa` (`id`);
ALTER TABLE `fin_lancamento_receber` ADD CONSTRAINT `fk_{B290D08D-4B6D-4B5C-8C08-29AE67AB180C}` FOREIGN KEY (`id_fin_documento_origem`) REFERENCES `fin_documento_origem` (`id`);
ALTER TABLE `fin_lancamento_receber` ADD CONSTRAINT `fk_FIN_LANCAMENTO_RECEBER_FIN_NATUREZA_FINANCEIRA1` FOREIGN KEY (`id_fin_natureza_financeira`) REFERENCES `fin_natureza_financeira` (`id`);
ALTER TABLE `fin_lancamento_receber` ADD CONSTRAINT `fk_FIN_LANCAMENTO_RECEBER_CLIENTE1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`);
ALTER TABLE `fin_lancamento_receber` ADD CONSTRAINT `fk_FIN_LANCAMENTO_RECEBER_BANCO_CONTA_CAIXA1` FOREIGN KEY (`id_banco_conta_caixa`) REFERENCES `banco_conta_caixa` (`id`);
ALTER TABLE `fin_parcela_pagar` ADD CONSTRAINT `fk_{56615208-C2D0-4DD9-802B-2B99BFF4EF53}` FOREIGN KEY (`id_fin_status_parcela`) REFERENCES `fin_status_parcela` (`id`);
ALTER TABLE `fin_parcela_pagar` ADD CONSTRAINT `fk_{06A2AAB2-9856-4010-AEDB-BB0F0EC86ABF}` FOREIGN KEY (`id_fin_lancamento_pagar`) REFERENCES `fin_lancamento_pagar` (`id`);
ALTER TABLE `fin_parcela_pagar` ADD CONSTRAINT `fk_FIN_PARCELA_PAGAR_FIN_TIPO_PAGAMENTO1` FOREIGN KEY (`id_fin_tipo_pagamento`) REFERENCES `fin_tipo_pagamento` (`id`);
ALTER TABLE `fin_parcela_pagar` ADD CONSTRAINT `fk_FIN_PARCELA_PAGAR_FIN_CHEQUE_EMITIDO1` FOREIGN KEY (`id_fin_cheque_emitido`) REFERENCES `fin_cheque_emitido` (`id`);
ALTER TABLE `fin_parcela_receber` ADD CONSTRAINT `fk_{8779D373-1258-4798-A769-5765822422BB}` FOREIGN KEY (`id_fin_lancamento_receber`) REFERENCES `fin_lancamento_receber` (`id`);
ALTER TABLE `fin_parcela_receber` ADD CONSTRAINT `fk_{DCA2496F-0D8C-484B-95D4-A7DCDE607642}` FOREIGN KEY (`id_fin_status_parcela`) REFERENCES `fin_status_parcela` (`id`);
ALTER TABLE `fin_parcela_receber` ADD CONSTRAINT `fk_FIN_PARCELA_RECEBER_FIN_TIPO_RECEBIMENTO1` FOREIGN KEY (`id_fin_tipo_recebimento`) REFERENCES `fin_tipo_recebimento` (`id`);
ALTER TABLE `fin_parcela_receber` ADD CONSTRAINT `fk_FIN_PARCELA_RECEBER_FIN_CHEQUE_RECEBIDO1` FOREIGN KEY (`id_fin_cheque_recebido`) REFERENCES `fin_cheque_recebido` (`id`);
ALTER TABLE `fiscal_inscricoes_substitutas` ADD CONSTRAINT `fk_{8B1F8BD0-2A38-4B9B-91EF-E8D9FBA98567}` FOREIGN KEY (`id_fiscal_parametros`) REFERENCES `fiscal_parametro` (`id`);
ALTER TABLE `fiscal_nota_fiscal_entrada` ADD CONSTRAINT `fk_FISCAL_NOTA_FISCAL_ENTRADA_NFE_CABECALHO1` FOREIGN KEY (`id_nfe_cabecalho`) REFERENCES `nfe_cabecalho` (`id`);
ALTER TABLE `fiscal_nota_fiscal_saida` ADD CONSTRAINT `fk_FISCAL_NOTA_FISCAL_SAIDA_NFE_CABECALHO1` FOREIGN KEY (`id_nfe_cabecalho`) REFERENCES `nfe_cabecalho` (`id`);
ALTER TABLE `fiscal_parametro` ADD CONSTRAINT `fk_{98296489-0EE6-403B-9EAF-D990246B28D1}` FOREIGN KEY (`id_fiscal_municipal_regime`) REFERENCES `fiscal_municipal_regime` (`id`);
ALTER TABLE `fiscal_parametro` ADD CONSTRAINT `fk_{3A841007-27D6-43C3-A356-56427E03924F}` FOREIGN KEY (`id_fiscal_estadual_regime`) REFERENCES `fiscal_estadual_regime` (`id`);
ALTER TABLE `fiscal_parametro` ADD CONSTRAINT `fk_{D9548E2C-5E6B-4C6C-88C1-2CD968DA496C}` FOREIGN KEY (`id_fiscal_estadual_porte`) REFERENCES `fiscal_estadual_porte` (`id`);
ALTER TABLE `fiscal_termo` ADD CONSTRAINT `fk_{A4F4C576-8F6F-4FF9-9BD1-DE2E881A7252}` FOREIGN KEY (`id_fiscal_livro`) REFERENCES `fiscal_livro` (`id`);
ALTER TABLE `folha_afastamento` ADD CONSTRAINT `fk_{26D6C2DC-E017-4773-81D1-87F4CA4DB521}` FOREIGN KEY (`id_folha_tipo_afastamento`) REFERENCES `folha_tipo_afastamento` (`id`);
ALTER TABLE `folha_afastamento` ADD CONSTRAINT `fk_FOLHA_AFASTAMENTO_COLABORADOR1` FOREIGN KEY (`id_colaborador`) REFERENCES `colaborador` (`id`);
ALTER TABLE `folha_historico_salarial` ADD CONSTRAINT `fk_FOLHA_HISTORICO_SALARIAL_COLABORADOR1` FOREIGN KEY (`id_colaborador`) REFERENCES `colaborador` (`id`);
ALTER TABLE `folha_inss_retencao` ADD CONSTRAINT `fk_{2D85FCF0-30DF-40F9-8182-DCA007E88A1D}` FOREIGN KEY (`id_folha_inss_servico`) REFERENCES `folha_inss_servico` (`id`);
ALTER TABLE `folha_inss_retencao` ADD CONSTRAINT `fk_{5265F7ED-9310-4991-A56C-C0541E246DCE}` FOREIGN KEY (`id_folha_inss`) REFERENCES `folha_inss` (`id`);
ALTER TABLE `folha_lancamento_cabecalho` ADD CONSTRAINT `fk_FOLHA_LANCAMENTO_CABECALHO_COLABORADOR1` FOREIGN KEY (`id_colaborador`) REFERENCES `colaborador` (`id`);
ALTER TABLE `folha_lancamento_comissao` ADD CONSTRAINT `fk_FOLHA_LANCAMENTO_COMISSAO_VENDEDOR1` FOREIGN KEY (`id_vendedor`) REFERENCES `vendedor` (`id`);
ALTER TABLE `folha_lancamento_detalhe` ADD CONSTRAINT `fk_{69A27780-AD58-4027-A361-69821375B7E3}` FOREIGN KEY (`id_folha_lancamento_cabecalho`) REFERENCES `folha_lancamento_cabecalho` (`id`);
ALTER TABLE `folha_lancamento_detalhe` ADD CONSTRAINT `fk_{A20D00A9-82D2-4C0A-8319-25FB9531AA16}` FOREIGN KEY (`id_folha_evento`) REFERENCES `folha_evento` (`id`);
ALTER TABLE `folha_plano_saude` ADD CONSTRAINT `fk_FOLHA_PLANO_SAUDE_COLABORADOR1` FOREIGN KEY (`id_colaborador`) REFERENCES `colaborador` (`id`);
ALTER TABLE `folha_plano_saude` ADD CONSTRAINT `fk_FOLHA_PLANO_SAUDE_OPERADORA_PLANO_SAUDE1` FOREIGN KEY (`id_operadora_plano_saude`) REFERENCES `operadora_plano_saude` (`id`);
ALTER TABLE `folha_ppp` ADD CONSTRAINT `fk_FOLHA_PPP_COLABORADOR1` FOREIGN KEY (`id_colaborador`) REFERENCES `colaborador` (`id`);
ALTER TABLE `folha_ppp_atividade` ADD CONSTRAINT `fk_{F750F228-A23B-4262-A967-E271B442CAF0}` FOREIGN KEY (`id_folha_ppp`) REFERENCES `folha_ppp` (`id`);
ALTER TABLE `folha_ppp_cat` ADD CONSTRAINT `fk_{8C91D200-46D5-4C33-A1EB-74F1C11AC8B5}` FOREIGN KEY (`id_folha_ppp`) REFERENCES `folha_ppp` (`id`);
ALTER TABLE `folha_ppp_exame_medico` ADD CONSTRAINT `fk_{1521EFA1-7447-4A6C-AC0C-853B15624864}` FOREIGN KEY (`id_folha_ppp`) REFERENCES `folha_ppp` (`id`);
ALTER TABLE `folha_ppp_fator_risco` ADD CONSTRAINT `fk_{0FFE40C7-1419-4FFD-9298-1D1468DAA9F2}` FOREIGN KEY (`id_folha_ppp`) REFERENCES `folha_ppp` (`id`);
ALTER TABLE `folha_rescisao` ADD CONSTRAINT `fk_FOLHA_RESCISAO_COLABORADOR1` FOREIGN KEY (`id_colaborador`) REFERENCES `colaborador` (`id`);
ALTER TABLE `folha_vale_transporte` ADD CONSTRAINT `fk_{DFEFE399-D353-4963-A41E-26A38DB31853}` FOREIGN KEY (`id_empresa_transp_itin`) REFERENCES `empresa_transporte_itinerario` (`id`);
ALTER TABLE `folha_vale_transporte` ADD CONSTRAINT `fk_FOLHA_VALE_TRANSPORTE_COLABORADOR1` FOREIGN KEY (`id_colaborador`) REFERENCES `colaborador` (`id`);
ALTER TABLE `fornecedor` ADD CONSTRAINT `fk_FORNECEDOR_PESSOA1` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id`);
ALTER TABLE `fornecedor_produto` ADD CONSTRAINT `fk_FORNECEDOR_PRODUTO_PRODUTO1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`);
ALTER TABLE `fornecedor_produto` ADD CONSTRAINT `fk_FORNECEDOR_PRODUTO_FORNECEDOR1` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`id`);
ALTER TABLE `frota_combustivel_controle` ADD CONSTRAINT `fk_FROTA_COMBUSTIVEL_CONTROLE_FROTA_VEICULO1` FOREIGN KEY (`id_frota_veiculo`) REFERENCES `frota_veiculo` (`id`);
ALTER TABLE `frota_dpvat_controle` ADD CONSTRAINT `fk_FROTA_IPVA_CONTROLE_FROTA_VEICULO10` FOREIGN KEY (`id_frota_veiculo`) REFERENCES `frota_veiculo` (`id`);
ALTER TABLE `frota_ipva_controle` ADD CONSTRAINT `fk_FROTA_IPVA_CONTROLE_FROTA_VEICULO1` FOREIGN KEY (`id_frota_veiculo`) REFERENCES `frota_veiculo` (`id`);
ALTER TABLE `frota_motorista` ADD CONSTRAINT `fk_FROTA_MOTORISTA_PESSOA_FISICA1` FOREIGN KEY (`id_pessoa_fisica`) REFERENCES `pessoa_fisica` (`id`);
ALTER TABLE `frota_multa_controle` ADD CONSTRAINT `fk_FROTA_MULTA_CONTROLE_FROTA_VEICULO1` FOREIGN KEY (`id_frota_veiculo`) REFERENCES `frota_veiculo` (`id`);
ALTER TABLE `frota_veiculo` ADD CONSTRAINT `fk_FROTA_VEICULO_FROTA_VEICULO_TIPO1` FOREIGN KEY (`id_frota_veiculo_tipo`) REFERENCES `frota_veiculo_tipo` (`id`);
ALTER TABLE `frota_veiculo` ADD CONSTRAINT `fk_FROTA_VEICULO_FROTA_COMBUSTIVEL_TIPO1` FOREIGN KEY (`id_frota_combustivel_tipo`) REFERENCES `frota_combustivel_tipo` (`id`);
ALTER TABLE `frota_veiculo_manutencao` ADD CONSTRAINT `fk_FROTA_VEICULO_MANUTENCAO_FROTA_VEICULO1` FOREIGN KEY (`id_frota_veiculo`) REFERENCES `frota_veiculo` (`id`);
ALTER TABLE `frota_veiculo_movimentacao` ADD CONSTRAINT `fk_FROTA_VEICULO_MOVIMENTACAO_FROTA_MOTORISTA1` FOREIGN KEY (`id_frota_motorista`) REFERENCES `frota_motorista` (`id`);
ALTER TABLE `frota_veiculo_movimentacao` ADD CONSTRAINT `fk_FROTA_VEICULO_MOVIMENTACAO_FROTA_VEICULO1` FOREIGN KEY (`id_frota_veiculo`) REFERENCES `frota_veiculo` (`id`);
ALTER TABLE `frota_veiculo_pneu` ADD CONSTRAINT `fk_FROTA_VEICULO_PNEU_FROTA_VEICULO1` FOREIGN KEY (`id_frota_veiculo`) REFERENCES `frota_veiculo` (`id`);
ALTER TABLE `frota_veiculo_sinistro` ADD CONSTRAINT `fk_FROTA_SINISTRO_FROTA_VEICULO1` FOREIGN KEY (`id_frota_veiculo`) REFERENCES `frota_veiculo` (`id`);
ALTER TABLE `ged_documento_detalhe` ADD CONSTRAINT `fk_{57544F31-81AC-4880-AB10-168655128E85}` FOREIGN KEY (`id_ged_tipo_documento`) REFERENCES `ged_tipo_documento` (`id`);
ALTER TABLE `ged_documento_detalhe` ADD CONSTRAINT `fk_{CF2C5E46-A149-422F-B16C-A9731C76F40B}` FOREIGN KEY (`id_ged_documento_cabecalho`) REFERENCES `ged_documento_cabecalho` (`id`);
ALTER TABLE `ged_versao_documento` ADD CONSTRAINT `fk_{B1B3E93F-737D-4043-9164-AD1418B05011}` FOREIGN KEY (`id_ged_documento_detalhe`) REFERENCES `ged_documento_detalhe` (`id`);
ALTER TABLE `ged_versao_documento` ADD CONSTRAINT `fk_GED_VERSAO_DOCUMENTO_COLABORADOR1` FOREIGN KEY (`id_colaborador`) REFERENCES `colaborador` (`id`);
ALTER TABLE `gondola_armazenamento` ADD CONSTRAINT `fk_{734FF4E6-A808-433A-AB15-84F96C5547EA}0` FOREIGN KEY (`id_gondola_caixa`) REFERENCES `gondola_caixa` (`id`);
ALTER TABLE `gondola_armazenamento` ADD CONSTRAINT `fk_GONDOLA_ARMAZENAMENTO_PRODUTO1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`);
ALTER TABLE `gondola_caixa` ADD CONSTRAINT `fk_{1716794B-B0D8-4C32-B29A-8322E86A49F3}0` FOREIGN KEY (`id_gondola_estante`) REFERENCES `gondola_estante` (`id`);
ALTER TABLE `gondola_estante` ADD CONSTRAINT `fk_{54ED3A4A-0685-4EAD-A483-FB2085C30584}0` FOREIGN KEY (`id_gondola_rua`) REFERENCES `gondola_rua` (`id`);
ALTER TABLE `inss_detalhe` ADD CONSTRAINT `fk_{460758BF-536F-4B1D-B83C-D7D676CCA7FD}` FOREIGN KEY (`id_inss`) REFERENCES `inss` (`id`);
ALTER TABLE `inventario_contagem_det` ADD CONSTRAINT `fk_{0FF2B94B-9A4B-47D1-A536-25332FAF4CFA}` FOREIGN KEY (`id_inventario_contagem_cab`) REFERENCES `inventario_contagem_cab` (`id`);
ALTER TABLE `inventario_contagem_det` ADD CONSTRAINT `fk_INVENTARIO_CONTAGEM_DET_PRODUTO1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`);
ALTER TABLE `irrf_detalhe` ADD CONSTRAINT `fk_{5C43C789-8DD4-40E6-BEDC-2EF8F4646E21}` FOREIGN KEY (`id_irrf`) REFERENCES `irrf` (`id`);
ALTER TABLE `lanca_centro_resultado` ADD CONSTRAINT `fk_{F9581400-B548-4933-B0AE-9DA6EE5FB941}` FOREIGN KEY (`id_centro_resultado`) REFERENCES `centro_resultado` (`id`);
ALTER TABLE `malote_digital_acesso` ADD CONSTRAINT `fk_{040820C8-9AB6-47E2-8A77-B292404C61D4}` FOREIGN KEY (`id_malote_digital_destinatario`) REFERENCES `malote_digital_destinatario` (`id`);
ALTER TABLE `malote_digital_destinatario` ADD CONSTRAINT `fk_{F02D780C-73D7-42A1-B054-410048C997D8}` FOREIGN KEY (`id_malote_digital_documento`) REFERENCES `malote_digital_documento` (`id`);
ALTER TABLE `malote_digital_destinatario` ADD CONSTRAINT `fk_MALOTE_DIGITAL_DESTINATARIO_COLABORADOR1` FOREIGN KEY (`id_colaborador`) REFERENCES `colaborador` (`id`);
ALTER TABLE `malote_digital_documento` ADD CONSTRAINT `fk_MALOTE_DIGITAL_DOCUMENTO_COLABORADOR1` FOREIGN KEY (`id_colaborador`) REFERENCES `colaborador` (`id`);
ALTER TABLE `mdfe_emitente` ADD CONSTRAINT `fk_{BC2F7392-73CF-4AEF-A351-4C51F4407448}` FOREIGN KEY (`id_mdfe_cabecalho`) REFERENCES `mdfe_cabecalho` (`id`);
ALTER TABLE `mdfe_informacao_cte` ADD CONSTRAINT `fk_{433CD8D0-D22E-4E1C-BD4A-4B4EC39A50E3}` FOREIGN KEY (`id_mdfe_municipio_descarrega`) REFERENCES `mdfe_municipio_descarrega` (`id`);
ALTER TABLE `mdfe_informacao_nfe` ADD CONSTRAINT `fk_{D3B14FCD-37DE-4878-8493-00FCD857A050}` FOREIGN KEY (`id_mdfe_municipio_descarrega`) REFERENCES `mdfe_municipio_descarrega` (`id`);
ALTER TABLE `mdfe_informacao_seguro` ADD CONSTRAINT `fk_{A88CA6D6-C161-4CD1-B1DE-A51628EC6CBA}` FOREIGN KEY (`id_mdfe_cabecalho`) REFERENCES `mdfe_cabecalho` (`id`);
ALTER TABLE `mdfe_lacre` ADD CONSTRAINT `fk_{11DFA71D-CDD9-4355-B607-9EF9FB3034F1}` FOREIGN KEY (`id_mdfe_cabecalho`) REFERENCES `mdfe_cabecalho` (`id`);
ALTER TABLE `mdfe_municipio_carregamento` ADD CONSTRAINT `fk_{33283B7A-BB2C-46E3-9C46-58CDE9D5A014}` FOREIGN KEY (`id_mdfe_cabecalho`) REFERENCES `mdfe_cabecalho` (`id`);
ALTER TABLE `mdfe_municipio_descarrega` ADD CONSTRAINT `fk_{CC00C956-3DE9-44E1-AA51-17D2000EE6C1}` FOREIGN KEY (`id_mdfe_cabecalho`) REFERENCES `mdfe_cabecalho` (`id`);
ALTER TABLE `mdfe_percurso` ADD CONSTRAINT `fk_{453DD9E0-0984-40C3-8B61-45D63EC9ED04}` FOREIGN KEY (`id_mdfe_cabecalho`) REFERENCES `mdfe_cabecalho` (`id`);
ALTER TABLE `mdfe_rodoviario` ADD CONSTRAINT `fk_{D84E9FF2-A5EA-4C9D-B212-0ECE0AA9E7E5}` FOREIGN KEY (`id_mdfe_cabecalho`) REFERENCES `mdfe_cabecalho` (`id`);
ALTER TABLE `mdfe_rodoviario_ciot` ADD CONSTRAINT `fk_{072B68BD-2B5C-4B82-BCFE-5E424C22D7BA}` FOREIGN KEY (`id_mdfe_rodoviario`) REFERENCES `mdfe_rodoviario` (`id`);
ALTER TABLE `mdfe_rodoviario_motorista` ADD CONSTRAINT `fk_{935170E7-7829-4199-9F73-10BAC5597794}` FOREIGN KEY (`id_mdfe_rodoviario`) REFERENCES `mdfe_rodoviario` (`id`);
ALTER TABLE `mdfe_rodoviario_pedagio` ADD CONSTRAINT `fk_{DFFAAED9-7A4C-4738-A240-CEE1D14B9113}` FOREIGN KEY (`id_mdfe_rodoviario`) REFERENCES `mdfe_rodoviario` (`id`);
ALTER TABLE `mdfe_rodoviario_veiculo` ADD CONSTRAINT `fk_{B32E660B-84F3-4833-9495-4A51C0513400}` FOREIGN KEY (`id_mdfe_rodoviario`) REFERENCES `mdfe_rodoviario` (`id`);
ALTER TABLE `municipio` ADD CONSTRAINT `fk_MUNICIPIO_UF1` FOREIGN KEY (`id_uf`) REFERENCES `uf` (`id`);
ALTER TABLE `nfce_fechamento` ADD CONSTRAINT `fk_{7EE389FF-4DBB-42FE-8EC6-50DA93B8778E}` FOREIGN KEY (`id_nfce_movimento`) REFERENCES `nfce_movimento` (`id`);
ALTER TABLE `nfce_fechamento` ADD CONSTRAINT `fk_NFCE_FECHAMENTO_NFCE_TIPO_PAGAMENTO1` FOREIGN KEY (`id_nfce_tipo_pagamento`) REFERENCES `nfce_tipo_pagamento` (`id`);
ALTER TABLE `nfce_movimento` ADD CONSTRAINT `fk_{B756D09A-C3D6-4012-A7D6-79F83A8EFBE7}` FOREIGN KEY (`id_nfce_operador`) REFERENCES `nfce_operador` (`id`);
ALTER TABLE `nfce_movimento` ADD CONSTRAINT `fk_{C40AD05D-651F-4DE6-A93A-F0B3CF973D36}` FOREIGN KEY (`id_nfce_caixa`) REFERENCES `nfce_caixa` (`id`);
ALTER TABLE `nfce_operador` ADD CONSTRAINT `fk_NFCE_OPERADOR_COLABORADOR1` FOREIGN KEY (`id_colaborador`) REFERENCES `colaborador` (`id`);
ALTER TABLE `nfce_sangria` ADD CONSTRAINT `fk_{2777AC82-DFA3-4F0E-9EE3-1F4AE5C53CF3}` FOREIGN KEY (`id_nfce_movimento`) REFERENCES `nfce_movimento` (`id`);
ALTER TABLE `nfce_suprimento` ADD CONSTRAINT `fk_{2B61D0B4-58A2-49F5-A893-B0C551865C45}` FOREIGN KEY (`id_nfce_movimento`) REFERENCES `nfce_movimento` (`id`);
ALTER TABLE `nfe_acesso_xml` ADD CONSTRAINT `fk_{B466EFD3-8C2D-4EFD-B9AA-9DCEAAF57FA8}` FOREIGN KEY (`id_nfe_cabecalho`) REFERENCES `nfe_cabecalho` (`id`);
ALTER TABLE `nfe_cabecalho` ADD CONSTRAINT `fk_NFE_CABECALHO_VENDEDOR1` FOREIGN KEY (`id_vendedor`) REFERENCES `vendedor` (`id`);
ALTER TABLE `nfe_cabecalho` ADD CONSTRAINT `fk_NFE_CABECALHO_FORNECEDOR1` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`id`);
ALTER TABLE `nfe_cabecalho` ADD CONSTRAINT `fk_NFE_CABECALHO_NFCE_MOVIMENTO1` FOREIGN KEY (`id_nfce_movimento`) REFERENCES `nfce_movimento` (`id`);
ALTER TABLE `nfe_cabecalho` ADD CONSTRAINT `fk_NFE_CABECALHO_VENDA_CABECALHO1` FOREIGN KEY (`id_venda_cabecalho`) REFERENCES `venda_cabecalho` (`id`);
ALTER TABLE `nfe_cabecalho` ADD CONSTRAINT `fk_NFE_CABECALHO_TRIBUT_OPERACAO_FISCAL1` FOREIGN KEY (`id_tribut_operacao_fiscal`) REFERENCES `tribut_operacao_fiscal` (`id`);
ALTER TABLE `nfe_cabecalho` ADD CONSTRAINT `fk_NFE_CABECALHO_CLIENTE1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`);
ALTER TABLE `nfe_cana` ADD CONSTRAINT `fk_{D05C4271-B5E5-47EB-BD5B-3885FEA3E899}` FOREIGN KEY (`id_nfe_cabecalho`) REFERENCES `nfe_cabecalho` (`id`);
ALTER TABLE `nfe_cana_deducoes_safra` ADD CONSTRAINT `fk_{3C5FF51C-922A-47C7-B352-E32615CA2327}` FOREIGN KEY (`id_nfe_cana`) REFERENCES `nfe_cana` (`id`);
ALTER TABLE `nfe_cana_fornecimento_diario` ADD CONSTRAINT `fk_{71A66239-C538-4B83-AD23-EFC8F3FA0AB4}` FOREIGN KEY (`id_nfe_cana`) REFERENCES `nfe_cana` (`id`);
ALTER TABLE `nfe_cte_referenciado` ADD CONSTRAINT `fk_{43CDCD03-AB6A-4120-BB27-CBDB6C26B4A7}` FOREIGN KEY (`id_nfe_cabecalho`) REFERENCES `nfe_cabecalho` (`id`);
ALTER TABLE `nfe_cupom_fiscal_referenciado` ADD CONSTRAINT `fk_{0B096A6D-C97B-4DE5-B93D-254B25C37CC5}` FOREIGN KEY (`id_nfe_cabecalho`) REFERENCES `nfe_cabecalho` (`id`);
ALTER TABLE `nfe_declaracao_importacao` ADD CONSTRAINT `fk_{1771AE4C-E276-4F94-99EB-BDA61D415790}` FOREIGN KEY (`id_nfe_detalhe`) REFERENCES `nfe_detalhe` (`id`);
ALTER TABLE `nfe_destinatario` ADD CONSTRAINT `fk_{11F2D433-04D6-44FD-BAA8-D5B266160973}` FOREIGN KEY (`id_nfe_cabecalho`) REFERENCES `nfe_cabecalho` (`id`);
ALTER TABLE `nfe_detalhe` ADD CONSTRAINT `fk_{C0606BAB-4C4A-4C16-AC2D-F3605E698BF0}` FOREIGN KEY (`id_nfe_cabecalho`) REFERENCES `nfe_cabecalho` (`id`);
ALTER TABLE `nfe_detalhe` ADD CONSTRAINT `fk_NFE_DETALHE_PRODUTO1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`);
ALTER TABLE `nfe_detalhe_imposto_cofins` ADD CONSTRAINT `fk_{45F41988-B667-4183-8517-DD1800D74792}` FOREIGN KEY (`id_nfe_detalhe`) REFERENCES `nfe_detalhe` (`id`);
ALTER TABLE `nfe_detalhe_imposto_cofins_st` ADD CONSTRAINT `fk_{45F41988-B667-4183-8517-DD1800D74792}0` FOREIGN KEY (`id_nfe_detalhe`) REFERENCES `nfe_detalhe` (`id`);
ALTER TABLE `nfe_detalhe_imposto_icms` ADD CONSTRAINT `fk_{2ECA610C-69B9-43E7-B65D-F30EDC701A59}` FOREIGN KEY (`id_nfe_detalhe`) REFERENCES `nfe_detalhe` (`id`);
ALTER TABLE `nfe_detalhe_imposto_icms_ufdest` ADD CONSTRAINT `fk_{2ECA610C-69B9-43E7-B65D-F30EDC701A59}0` FOREIGN KEY (`id_nfe_detalhe`) REFERENCES `nfe_detalhe` (`id`);
ALTER TABLE `nfe_detalhe_imposto_ii` ADD CONSTRAINT `fk_{DD990476-FEE7-4709-BD8D-A6D372781AE1}` FOREIGN KEY (`id_nfe_detalhe`) REFERENCES `nfe_detalhe` (`id`);
ALTER TABLE `nfe_detalhe_imposto_ipi` ADD CONSTRAINT `fk_{848512E8-6818-4FF8-85B2-FD9773A5AAA8}` FOREIGN KEY (`id_nfe_detalhe`) REFERENCES `nfe_detalhe` (`id`);
ALTER TABLE `nfe_detalhe_imposto_issqn` ADD CONSTRAINT `fk_{D3EADE39-4BA1-402D-9AE5-F55A6327DA3B}` FOREIGN KEY (`id_nfe_detalhe`) REFERENCES `nfe_detalhe` (`id`);
ALTER TABLE `nfe_detalhe_imposto_pis` ADD CONSTRAINT `fk_{A901B4CB-EECC-4E0D-8163-E9C48092FBB3}` FOREIGN KEY (`id_nfe_detalhe`) REFERENCES `nfe_detalhe` (`id`);
ALTER TABLE `nfe_detalhe_imposto_pis_st` ADD CONSTRAINT `fk_{A901B4CB-EECC-4E0D-8163-E9C48092FBB3}0` FOREIGN KEY (`id_nfe_detalhe`) REFERENCES `nfe_detalhe` (`id`);
ALTER TABLE `nfe_det_especifico_armamento` ADD CONSTRAINT `fk_{AA2001E7-A2C4-4E15-89D2-693E8939F1BD}` FOREIGN KEY (`id_nfe_detalhe`) REFERENCES `nfe_detalhe` (`id`);
ALTER TABLE `nfe_det_especifico_combustivel` ADD CONSTRAINT `fk_{723B7CE2-E4EB-44C4-B2EA-C44402D5DCB4}` FOREIGN KEY (`id_nfe_detalhe`) REFERENCES `nfe_detalhe` (`id`);
ALTER TABLE `nfe_det_especifico_medicamento` ADD CONSTRAINT `fk_{EE95E781-991D-48B7-815A-4BC87F24190B}` FOREIGN KEY (`id_nfe_detalhe`) REFERENCES `nfe_detalhe` (`id`);
ALTER TABLE `nfe_det_especifico_veiculo` ADD CONSTRAINT `fk_{02840D51-CFB3-4D99-AC7B-F82104B522C2}` FOREIGN KEY (`id_nfe_detalhe`) REFERENCES `nfe_detalhe` (`id`);
ALTER TABLE `nfe_duplicata` ADD CONSTRAINT `fk_NFE_DUPLICATA_NFE_FATURA1` FOREIGN KEY (`id_nfe_fatura`) REFERENCES `nfe_fatura` (`id`);
ALTER TABLE `nfe_emitente` ADD CONSTRAINT `fk_{49365C97-491E-489C-9F44-C5B537E8913D}` FOREIGN KEY (`id_nfe_cabecalho`) REFERENCES `nfe_cabecalho` (`id`);
ALTER TABLE `nfe_exportacao` ADD CONSTRAINT `fk_{29DDD06F-DDD4-4255-94EE-1E32334EB138}` FOREIGN KEY (`id_nfe_detalhe`) REFERENCES `nfe_detalhe` (`id`);
ALTER TABLE `nfe_fatura` ADD CONSTRAINT `fk_{FB825C01-BAC2-48B6-8B14-6D37BE3DAFF8}` FOREIGN KEY (`id_nfe_cabecalho`) REFERENCES `nfe_cabecalho` (`id`);
ALTER TABLE `nfe_importacao_detalhe` ADD CONSTRAINT `fk_{788F333A-DCB0-4371-AECF-18A42ABF93B6}` FOREIGN KEY (`id_nfe_declaracao_importacao`) REFERENCES `nfe_declaracao_importacao` (`id`);
ALTER TABLE `nfe_informacao_pagamento` ADD CONSTRAINT `fk_{BFB74DEB-FAC6-4F44-8FDA-F52BFEC321ED}` FOREIGN KEY (`id_nfe_cabecalho`) REFERENCES `nfe_cabecalho` (`id`);
ALTER TABLE `nfe_item_rastreado` ADD CONSTRAINT `fk_NFE_ITEM_RASTREADO_NFE_DETALHE1` FOREIGN KEY (`id_nfe_detalhe`) REFERENCES `nfe_detalhe` (`id`);
ALTER TABLE `nfe_local_entrega` ADD CONSTRAINT `fk_{BABA4BA0-DE05-4541-A1B6-03B53B66C5B1}` FOREIGN KEY (`id_nfe_cabecalho`) REFERENCES `nfe_cabecalho` (`id`);
ALTER TABLE `nfe_local_retirada` ADD CONSTRAINT `fk_{8CDD5E8C-6254-41DE-A520-F318A3809796}` FOREIGN KEY (`id_nfe_cabecalho`) REFERENCES `nfe_cabecalho` (`id`);
ALTER TABLE `nfe_nf_referenciada` ADD CONSTRAINT `fk_{172BA844-7467-4E30-BB11-F98E00D75E8F}` FOREIGN KEY (`id_nfe_cabecalho`) REFERENCES `nfe_cabecalho` (`id`);
ALTER TABLE `nfe_processo_referenciado` ADD CONSTRAINT `fk_{9C752FAA-B71F-425A-ACB6-A3E8972E6FF4}` FOREIGN KEY (`id_nfe_cabecalho`) REFERENCES `nfe_cabecalho` (`id`);
ALTER TABLE `nfe_prod_rural_referenciada` ADD CONSTRAINT `fk_{7C9760BE-F8ED-418D-AED9-1F65ACB76F67}` FOREIGN KEY (`id_nfe_cabecalho`) REFERENCES `nfe_cabecalho` (`id`);
ALTER TABLE `nfe_referenciada` ADD CONSTRAINT `fk_{AFFD7A57-423B-4616-90AA-D7C269FF9C5E}` FOREIGN KEY (`id_nfe_cabecalho`) REFERENCES `nfe_cabecalho` (`id`);
ALTER TABLE `nfe_responsavel_tecnico` ADD CONSTRAINT `fk_NFE_RESPONSAVEL_TECNICO_NFE_CABECALHO1` FOREIGN KEY (`id_nfe_cabecalho`) REFERENCES `nfe_cabecalho` (`id`);
ALTER TABLE `nfe_transporte` ADD CONSTRAINT `fk_{BDFB69FA-15C2-4D43-ABDF-E39AB5044709}` FOREIGN KEY (`id_nfe_cabecalho`) REFERENCES `nfe_cabecalho` (`id`);
ALTER TABLE `nfe_transporte` ADD CONSTRAINT `fk_NFE_TRANSPORTE_TRANSPORTADORA1` FOREIGN KEY (`id_transportadora`) REFERENCES `transportadora` (`id`);
ALTER TABLE `nfe_transporte_reboque` ADD CONSTRAINT `fk_{33120FEA-84FA-45B1-9F95-183D64AC0F6F}` FOREIGN KEY (`id_nfe_transporte`) REFERENCES `nfe_transporte` (`id`);
ALTER TABLE `nfe_transporte_volume` ADD CONSTRAINT `fk_{683237C6-9879-4C55-BBD3-8CD3F1AF00EF}` FOREIGN KEY (`id_nfe_transporte`) REFERENCES `nfe_transporte` (`id`);
ALTER TABLE `nfe_transporte_volume_lacre` ADD CONSTRAINT `fk_{C379B512-7C71-41D4-8D32-7A543923DC1E}` FOREIGN KEY (`id_nfe_transporte_volume`) REFERENCES `nfe_transporte_volume` (`id`);
ALTER TABLE `nfse_cabecalho` ADD CONSTRAINT `fk_NFSE_CABECALHO_OS_ABERTURA1` FOREIGN KEY (`id_os_abertura`) REFERENCES `os_abertura` (`id`);
ALTER TABLE `nfse_cabecalho` ADD CONSTRAINT `fk_NFSE_CABECALHO_CLIENTE1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`);
ALTER TABLE `nfse_detalhe` ADD CONSTRAINT `fk_{A4D96B77-6862-43DE-9D90-6CE7C219395A}` FOREIGN KEY (`id_nfse_cabecalho`) REFERENCES `nfse_cabecalho` (`id`);
ALTER TABLE `nfse_detalhe` ADD CONSTRAINT `fk_{250949FC-A04F-43DA-B79F-E473F538AA92}` FOREIGN KEY (`id_nfse_lista_servico`) REFERENCES `nfse_lista_servico` (`id`);
ALTER TABLE `nfse_intermediario` ADD CONSTRAINT `fk_{239E588F-852E-4B34-8B15-85253428F291}` FOREIGN KEY (`id_nfse_cabecalho`) REFERENCES `nfse_cabecalho` (`id`);
ALTER TABLE `nota_fiscal_tipo` ADD CONSTRAINT `fk_{5365C99B-97BA-432A-A1B4-5139D0F192AA}` FOREIGN KEY (`id_nota_fiscal_modelo`) REFERENCES `nota_fiscal_modelo` (`id`);
ALTER TABLE `operadora_cartao` ADD CONSTRAINT `fk_OPERADORA_CARTAO_BANCO_CONTA_CAIXA1` FOREIGN KEY (`id_banco_conta_caixa`) REFERENCES `banco_conta_caixa` (`id`);
ALTER TABLE `orcamento_detalhe` ADD CONSTRAINT `fk_{579ED741-CDCD-4302-923C-704283061EFB}` FOREIGN KEY (`id_orcamento_empresarial`) REFERENCES `orcamento_empresarial` (`id`);
ALTER TABLE `orcamento_detalhe` ADD CONSTRAINT `fk_ORCAMENTO_DETALHE_FIN_NATUREZA_FINANCEIRA1` FOREIGN KEY (`id_fin_natureza_financeira`) REFERENCES `fin_natureza_financeira` (`id`);
ALTER TABLE `orcamento_empresarial` ADD CONSTRAINT `fk_{34B87EE9-0908-4947-9A62-962274B9E2E6}` FOREIGN KEY (`id_orcamento_periodo`) REFERENCES `orcamento_periodo` (`id`);
ALTER TABLE `orcamento_fluxo_caixa` ADD CONSTRAINT `fk_{DAE02892-954D-49C1-95AD-159E01E5B882}` FOREIGN KEY (`id_orc_fluxo_caixa_periodo`) REFERENCES `orcamento_fluxo_caixa_periodo` (`id`);
ALTER TABLE `orcamento_fluxo_caixa_detalhe` ADD CONSTRAINT `fk_{7DA41A8E-71FF-4158-A2F6-284EFD0C66C0}` FOREIGN KEY (`id_orcamento_fluxo_caixa`) REFERENCES `orcamento_fluxo_caixa` (`id`);
ALTER TABLE `orcamento_fluxo_caixa_detalhe` ADD CONSTRAINT `fk_ORCAMENTO_FLUXO_CAIXA_DETALHE_FIN_NATUREZA_FINANCEIRA1` FOREIGN KEY (`id_fin_natureza_financeira`) REFERENCES `fin_natureza_financeira` (`id`);
ALTER TABLE `orcamento_fluxo_caixa_periodo` ADD CONSTRAINT `fk_ORCAMENTO_FLUXO_CAIXA_PERIODO_BANCO_CONTA_CAIXA1` FOREIGN KEY (`id_banco_conta_caixa`) REFERENCES `banco_conta_caixa` (`id`);
ALTER TABLE `os_abertura` ADD CONSTRAINT `fk_{6BCAE8D3-8EF5-45FD-8A45-38B20DFF9FB0}` FOREIGN KEY (`id_os_status`) REFERENCES `os_status` (`id`);
ALTER TABLE `os_abertura` ADD CONSTRAINT `fk_OS_ABERTURA_CLIENTE1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`);
ALTER TABLE `os_abertura` ADD CONSTRAINT `fk_OS_ABERTURA_COLABORADOR1` FOREIGN KEY (`id_colaborador`) REFERENCES `colaborador` (`id`);
ALTER TABLE `os_abertura_equipamento` ADD CONSTRAINT `fk_{810B527C-FC00-4178-9F83-0DCE34F553A7}` FOREIGN KEY (`id_os_abertura`) REFERENCES `os_abertura` (`id`);
ALTER TABLE `os_abertura_equipamento` ADD CONSTRAINT `fk_{22CA1568-F45B-42E9-B840-4C2FDA5D9D90}` FOREIGN KEY (`id_os_equipamento`) REFERENCES `os_equipamento` (`id`);
ALTER TABLE `os_evolucao` ADD CONSTRAINT `fk_{6EFF3578-C97B-4E12-8768-F5D4247D08A9}` FOREIGN KEY (`id_os_abertura`) REFERENCES `os_abertura` (`id`);
ALTER TABLE `os_produto_servico` ADD CONSTRAINT `fk_{1076F74A-D810-46A7-BC95-BC173A02F8E1}` FOREIGN KEY (`id_os_abertura`) REFERENCES `os_abertura` (`id`);
ALTER TABLE `os_produto_servico` ADD CONSTRAINT `fk_OS_PRODUTO_SERVICO_PRODUTO1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`);
ALTER TABLE `papel_funcao` ADD CONSTRAINT `fk_PAPEL_FUNCAO_PAPEL1` FOREIGN KEY (`id_papel`) REFERENCES `papel` (`id`);
ALTER TABLE `papel_funcao` ADD CONSTRAINT `fk_PAPEL_FUNCAO_FUNCAO1` FOREIGN KEY (`id_funcao`) REFERENCES `funcao` (`id`);
ALTER TABLE `patrim_apolice_seguro` ADD CONSTRAINT `fk_{51FF0562-515B-417C-894C-C79DDBFCDFE3}` FOREIGN KEY (`id_seguradora`) REFERENCES `seguradora` (`id`);
ALTER TABLE `patrim_apolice_seguro` ADD CONSTRAINT `fk_{1072F0B3-8A3C-4836-9F4D-77CCAEDC3279}` FOREIGN KEY (`id_patrim_bem`) REFERENCES `patrim_bem` (`id`);
ALTER TABLE `patrim_bem` ADD CONSTRAINT `fk_{6763D73F-CAD3-45F5-B326-F15F787593C8}` FOREIGN KEY (`id_patrim_grupo_bem`) REFERENCES `patrim_grupo_bem` (`id`);
ALTER TABLE `patrim_bem` ADD CONSTRAINT `fk_{308BF881-15EC-4EDB-A8D9-031C5760DD18}` FOREIGN KEY (`id_patrim_tipo_aquisicao_bem`) REFERENCES `patrim_tipo_aquisicao_bem` (`id`);
ALTER TABLE `patrim_bem` ADD CONSTRAINT `fk_{5E078F04-ADF7-48EE-A482-6E2B657F63C7}` FOREIGN KEY (`id_patrim_estado_conservacao`) REFERENCES `patrim_estado_conservacao` (`id`);
ALTER TABLE `patrim_bem` ADD CONSTRAINT `fk_{791E6013-2F02-480A-B5B6-5DD83DBE5125}` FOREIGN KEY (`id_centro_resultado`) REFERENCES `centro_resultado` (`id`);
ALTER TABLE `patrim_bem` ADD CONSTRAINT `fk_PATRIM_BEM_FORNECEDOR1` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`id`);
ALTER TABLE `patrim_bem` ADD CONSTRAINT `fk_PATRIM_BEM_COLABORADOR1` FOREIGN KEY (`id_colaborador`) REFERENCES `colaborador` (`id`);
ALTER TABLE `patrim_bem` ADD CONSTRAINT `fk_PATRIM_BEM_SETOR1` FOREIGN KEY (`id_setor`) REFERENCES `setor` (`id`);
ALTER TABLE `patrim_depreciacao_bem` ADD CONSTRAINT `fk_{3702F0F7-CF21-41C8-AAAB-A7D9A723936E}` FOREIGN KEY (`id_patrim_bem`) REFERENCES `patrim_bem` (`id`);
ALTER TABLE `patrim_documento_bem` ADD CONSTRAINT `fk_{7A0C1480-E244-4328-B2CB-2AB8A169B89F}` FOREIGN KEY (`id_patrim_bem`) REFERENCES `patrim_bem` (`id`);
ALTER TABLE `patrim_movimentacao_bem` ADD CONSTRAINT `fk_{59673D06-99DA-4BF3-95DC-3A4AB382D4D1}` FOREIGN KEY (`id_patrim_tipo_movimentacao`) REFERENCES `patrim_tipo_movimentacao` (`id`);
ALTER TABLE `patrim_movimentacao_bem` ADD CONSTRAINT `fk_{AD129E44-F68B-4EA3-9952-207A4E51D786}` FOREIGN KEY (`id_patrim_bem`) REFERENCES `patrim_bem` (`id`);
ALTER TABLE `pcp_instrucao_op` ADD CONSTRAINT `fk_{7C1E7E45-BEB5-4DE3-AD45-217B1C481440}` FOREIGN KEY (`id_pcp_op_cabecalho`) REFERENCES `pcp_op_cabecalho` (`id`);
ALTER TABLE `pcp_instrucao_op` ADD CONSTRAINT `fk_{1711BD28-6B33-449F-8C2F-E6CDBFCEF130}` FOREIGN KEY (`id_pcp_instrucao`) REFERENCES `pcp_instrucao` (`id`);
ALTER TABLE `pcp_op_detalhe` ADD CONSTRAINT `fk_{38BB45EA-9D0E-47DD-A72F-3FA45738D406}` FOREIGN KEY (`id_pcp_op_cabecalho`) REFERENCES `pcp_op_cabecalho` (`id`);
ALTER TABLE `pcp_op_detalhe` ADD CONSTRAINT `fk_PCP_OP_DETALHE_PRODUTO1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`);
ALTER TABLE `pcp_servico` ADD CONSTRAINT `fk_{8826F024-B03D-4D57-8619-410C8743C47B}` FOREIGN KEY (`id_pcp_op_detalhe`) REFERENCES `pcp_op_detalhe` (`id`);
ALTER TABLE `pcp_servico_colaborador` ADD CONSTRAINT `fk_{664764E5-3488-4030-BFB1-15E4D34A5446}` FOREIGN KEY (`id_pcp_servico`) REFERENCES `pcp_servico` (`id`);
ALTER TABLE `pcp_servico_colaborador` ADD CONSTRAINT `fk_PCP_SERVICO_COLABORADOR_COLABORADOR1` FOREIGN KEY (`id_colaborador`) REFERENCES `colaborador` (`id`);
ALTER TABLE `pcp_servico_equipamento` ADD CONSTRAINT `fk_{6D48A2C9-2A21-4A7A-B1A5-4882369D9E49}` FOREIGN KEY (`id_pcp_servico`) REFERENCES `pcp_servico` (`id`);
ALTER TABLE `pcp_servico_equipamento` ADD CONSTRAINT `fk_{34E8FAB1-88F5-4369-A7E0-0EDFD616F5EB}` FOREIGN KEY (`id_patrim_bem`) REFERENCES `patrim_bem` (`id`);
ALTER TABLE `pessoa_alteracao` ADD CONSTRAINT `fk_PESSOA_ALTERACAO_PESSOA1` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id`);
ALTER TABLE `pessoa_contato` ADD CONSTRAINT `fk_PESSOA_CONTATO_PESSOA1` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id`);
ALTER TABLE `pessoa_endereco` ADD CONSTRAINT `fk_PESSOA_ENDERECO_PESSOA1` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id`);
ALTER TABLE `pessoa_fisica` ADD CONSTRAINT `fk_PESSOA_FISICA_PESSOA1` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id`);
ALTER TABLE `pessoa_fisica` ADD CONSTRAINT `fk_PESSOA_FISICA_NIVEL_FORMACAO1` FOREIGN KEY (`id_nivel_formacao`) REFERENCES `nivel_formacao` (`id`);
ALTER TABLE `pessoa_fisica` ADD CONSTRAINT `fk_PESSOA_FISICA_ESTADO_CIVIL1` FOREIGN KEY (`id_estado_civil`) REFERENCES `estado_civil` (`id`);
ALTER TABLE `pessoa_juridica` ADD CONSTRAINT `fk_PESSOA_JURIDICA_PESSOA1` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id`);
ALTER TABLE `pessoa_telefone` ADD CONSTRAINT `fk_PESSOA_TELEFONE_PESSOA1` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id`);
ALTER TABLE `ponto_abono` ADD CONSTRAINT `fk_PONTO_ABONO_COLABORADOR1` FOREIGN KEY (`id_colaborador`) REFERENCES `colaborador` (`id`);
ALTER TABLE `ponto_abono_utilizacao` ADD CONSTRAINT `fk_{5E373E19-7D30-4782-BBBC-5C35C10CB2D9}` FOREIGN KEY (`id_ponto_abono`) REFERENCES `ponto_abono` (`id`);
ALTER TABLE `ponto_banco_horas` ADD CONSTRAINT `fk_PONTO_BANCO_HORAS_COLABORADOR1` FOREIGN KEY (`id_colaborador`) REFERENCES `colaborador` (`id`);
ALTER TABLE `ponto_banco_horas_utilizacao` ADD CONSTRAINT `fk_{95E38BE7-8889-4039-A9EF-9B3F06C021C1}` FOREIGN KEY (`id_ponto_banco_horas`) REFERENCES `ponto_banco_horas` (`id`);
ALTER TABLE `ponto_fechamento_jornada` ADD CONSTRAINT `fk_{46D94076-83BD-47CF-81A8-CFB7358E7852}` FOREIGN KEY (`id_ponto_classificacao_jornada`) REFERENCES `ponto_classificacao_jornada` (`id`);
ALTER TABLE `ponto_fechamento_jornada` ADD CONSTRAINT `fk_PONTO_FECHAMENTO_JORNADA_COLABORADOR1` FOREIGN KEY (`id_colaborador`) REFERENCES `colaborador` (`id`);
ALTER TABLE `ponto_horario_autorizado` ADD CONSTRAINT `fk_PONTO_HORARIO_AUTORIZADO_COLABORADOR1` FOREIGN KEY (`id_colaborador`) REFERENCES `colaborador` (`id`);
ALTER TABLE `ponto_marcacao` ADD CONSTRAINT `fk_{41E0724D-FD60-49CE-B95C-119CDB59790C}` FOREIGN KEY (`id_ponto_relogio`) REFERENCES `ponto_relogio` (`id`);
ALTER TABLE `ponto_marcacao` ADD CONSTRAINT `fk_PONTO_MARCACAO_COLABORADOR1` FOREIGN KEY (`id_colaborador`) REFERENCES `colaborador` (`id`);
ALTER TABLE `ponto_turma` ADD CONSTRAINT `fk_{24DAD7DC-0965-4EDF-8059-E958A0821AA1}` FOREIGN KEY (`id_ponto_escala`) REFERENCES `ponto_escala` (`id`);
ALTER TABLE `pre_venda_cabecalho` ADD CONSTRAINT `fk_PRE_VENDA_CABECALHO_PESSOA1` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id`);
ALTER TABLE `pre_venda_detalhe` ADD CONSTRAINT `fk_{B35253D2-3EE9-435C-8911-6FAA488C3BAF}` FOREIGN KEY (`id_pre_venda_cabecalho`) REFERENCES `pre_venda_cabecalho` (`id`);
ALTER TABLE `pre_venda_detalhe` ADD CONSTRAINT `fk_PRE_VENDA_DETALHE_PRODUTO1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`);
ALTER TABLE `produto` ADD CONSTRAINT `fk_PRODUTO_PRODUTO_SUBGRUPO1` FOREIGN KEY (`id_produto_subgrupo`) REFERENCES `produto_subgrupo` (`id`);
ALTER TABLE `produto` ADD CONSTRAINT `fk_PRODUTO_PRODUTO_MARCA1` FOREIGN KEY (`id_produto_marca`) REFERENCES `produto_marca` (`id`);
ALTER TABLE `produto` ADD CONSTRAINT `fk_PRODUTO_PRODUTO_UNIDADE1` FOREIGN KEY (`id_produto_unidade`) REFERENCES `produto_unidade` (`id`);
ALTER TABLE `produto` ADD CONSTRAINT `fk_PRODUTO_TRIBUT_ICMS_CUSTOM_CAB1` FOREIGN KEY (`id_tribut_icms_custom_cab`) REFERENCES `tribut_icms_custom_cab` (`id`);
ALTER TABLE `produto` ADD CONSTRAINT `fk_PRODUTO_TRIBUT_GRUPO_TRIBUTARIO1` FOREIGN KEY (`id_tribut_grupo_tributario`) REFERENCES `tribut_grupo_tributario` (`id`);
ALTER TABLE `produto_alteracao_item` ADD CONSTRAINT `fk_PRODUTO_ALTERACAO_ITEM_PRODUTO1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`);
ALTER TABLE `produto_codigo_adicional` ADD CONSTRAINT `fk_PRODUTO_CODIGO_ADICIONAL_PRODUTO1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`);
ALTER TABLE `produto_ficha_tecnica` ADD CONSTRAINT `fk_PRODUTO_FICHA_TECNICA_PRODUTO1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`);
ALTER TABLE `produto_promocao` ADD CONSTRAINT `fk_PRODUTO_PROMOCAO_PRODUTO1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`);
ALTER TABLE `produto_subgrupo` ADD CONSTRAINT `fk_PRODUTO_SUBGRUPO_PRODUTO_GRUPO1` FOREIGN KEY (`id_produto_grupo`) REFERENCES `produto_grupo` (`id`);
ALTER TABLE `projeto_cronograma` ADD CONSTRAINT `fk_PROJETO_CRONOGRAMA_PROJETO_DADOS1` FOREIGN KEY (`id_projeto_principal`) REFERENCES `projeto_principal` (`id`);
ALTER TABLE `projeto_custo` ADD CONSTRAINT `fk_PROJETO_CUSTO_PROJETO_PRINCIPAL1` FOREIGN KEY (`id_projeto_principal`) REFERENCES `projeto_principal` (`id`);
ALTER TABLE `projeto_custo` ADD CONSTRAINT `fk_PROJETO_CUSTO_FIN_NATUREZA_FINANCEIRA1` FOREIGN KEY (`id_fin_natureza_financeira`) REFERENCES `fin_natureza_financeira` (`id`);
ALTER TABLE `projeto_risco` ADD CONSTRAINT `fk_PROJETO_RISCO_PROJETO_PRINCIPAL1` FOREIGN KEY (`id_projeto_principal`) REFERENCES `projeto_principal` (`id`);
ALTER TABLE `projeto_stakeholders` ADD CONSTRAINT `fk_PROJETO_STAKEHOLDERS_PROJETO_DADOS1` FOREIGN KEY (`id_projeto_dados`) REFERENCES `projeto_principal` (`id`);
ALTER TABLE `projeto_stakeholders` ADD CONSTRAINT `fk_PROJETO_STAKEHOLDERS_COLABORADOR1` FOREIGN KEY (`id_colaborador`) REFERENCES `colaborador` (`id`);
ALTER TABLE `rateio_centro_resultado_cab` ADD CONSTRAINT `fk_{5030A2EA-FFE1-4F33-8380-AE8B4D236121}` FOREIGN KEY (`id_centro_resultado`) REFERENCES `centro_resultado` (`id`);
ALTER TABLE `rateio_centro_resultado_det` ADD CONSTRAINT `fk_{B3EC49D9-B1D3-47BB-B51B-FF23F144819C}` FOREIGN KEY (`id_rateio_centro_resul_cab`) REFERENCES `rateio_centro_resultado_cab` (`id`);
ALTER TABLE `rateio_centro_resultado_det` ADD CONSTRAINT `fk_{9AC87DD8-9BFC-4D4C-B4B9-6B39B2A16C49}` FOREIGN KEY (`id_centro_resultado_destino`) REFERENCES `centro_resultado` (`id`);
ALTER TABLE `recado_destinatario` ADD CONSTRAINT `fk_{0E54BF34-67CE-451E-B4A0-778D89F84D5F}` FOREIGN KEY (`id_recado_remetente`) REFERENCES `recado_remetente` (`id`);
ALTER TABLE `recado_destinatario` ADD CONSTRAINT `fk_RECADO_DESTINATARIO_COLABORADOR1` FOREIGN KEY (`id_colaborador`) REFERENCES `colaborador` (`id`);
ALTER TABLE `recado_remetente` ADD CONSTRAINT `fk_RECADO_REMETENTE_COLABORADOR1` FOREIGN KEY (`id_colaborador`) REFERENCES `colaborador` (`id`);
ALTER TABLE `requisicao_interna_cabecalho` ADD CONSTRAINT `fk_REQUISICAO_INTERNA_CABECALHO_COLABORADOR1` FOREIGN KEY (`id_colaborador`) REFERENCES `colaborador` (`id`);
ALTER TABLE `requisicao_interna_detalhe` ADD CONSTRAINT `fk_{34AD1B31-03E7-4FE2-80FC-9EB2E4AF025E}` FOREIGN KEY (`id_requisicao_interna_cabecalho`) REFERENCES `requisicao_interna_cabecalho` (`id`);
ALTER TABLE `requisicao_interna_detalhe` ADD CONSTRAINT `fk_REQUISICAO_INTERNA_DETALHE_PRODUTO1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`);
ALTER TABLE `reuniao_sala_evento` ADD CONSTRAINT `fk_{166E3AAB-2DB5-44FC-BCDE-62D0E052AD18}` FOREIGN KEY (`id_reuniao_sala`) REFERENCES `reuniao_sala` (`id`);
ALTER TABLE `reuniao_sala_evento` ADD CONSTRAINT `fk_{C71E2EDC-9C69-4A00-ABBD-5127B0E9FBA0}` FOREIGN KEY (`id_agenda_compromisso`) REFERENCES `agenda_compromisso` (`id`);
ALTER TABLE `salario_familia` ADD CONSTRAINT `fk_{460A3E57-743B-45D3-BC2F-89C6779EB22A}` FOREIGN KEY (`id_inss`) REFERENCES `inss` (`id`);
ALTER TABLE `simples_nacional_detalhe` ADD CONSTRAINT `fk_{6638A7A1-0BA3-4D46-A720-BE1BBC8966A0}` FOREIGN KEY (`id_simples_nacional_cabecalho`) REFERENCES `simples_nacional_cabecalho` (`id`);
ALTER TABLE `tabela_preco_produto` ADD CONSTRAINT `fk_{1C28A567-0398-406B-9243-4403C0E93099}` FOREIGN KEY (`id_tabela_preco`) REFERENCES `tabela_preco` (`id`);
ALTER TABLE `tabela_preco_produto` ADD CONSTRAINT `fk_TABELA_PRECO_PRODUTO_PRODUTO1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`);
ALTER TABLE `talonario_cheque` ADD CONSTRAINT `fk_TALONARIO_CHEQUE_BANCO_CONTA_CAIXA1` FOREIGN KEY (`id_banco_conta_caixa`) REFERENCES `banco_conta_caixa` (`id`);
ALTER TABLE `transportadora` ADD CONSTRAINT `fk_TRANSPORTADORA_PESSOA1` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id`);
ALTER TABLE `tribut_cofins` ADD CONSTRAINT `fk_{F13F47B6-BC52-4363-9CE2-39CED083A615}` FOREIGN KEY (`id_tribut_configura_of_gt`) REFERENCES `tribut_configura_of_gt` (`id`);
ALTER TABLE `tribut_configura_of_gt` ADD CONSTRAINT `fk_{6AF0FD4D-0B2B-495D-951B-03F72360D2F8}` FOREIGN KEY (`id_tribut_operacao_fiscal`) REFERENCES `tribut_operacao_fiscal` (`id`);
ALTER TABLE `tribut_configura_of_gt` ADD CONSTRAINT `fk_{7992BFAD-59FB-4EF4-9024-FFD46F78BC5E}` FOREIGN KEY (`id_tribut_grupo_tributario`) REFERENCES `tribut_grupo_tributario` (`id`);
ALTER TABLE `tribut_icms_custom_det` ADD CONSTRAINT `fk_{BD28B261-3A95-45B9-9E5F-59D51A1B2B0A}` FOREIGN KEY (`id_tribut_icms_custom_cab`) REFERENCES `tribut_icms_custom_cab` (`id`);
ALTER TABLE `tribut_icms_uf` ADD CONSTRAINT `fk_{19D06CF5-5DC7-480E-A49D-BECF75F651EE}` FOREIGN KEY (`id_tribut_configura_of_gt`) REFERENCES `tribut_configura_of_gt` (`id`);
ALTER TABLE `tribut_ipi` ADD CONSTRAINT `fk_{C143DDE4-2A66-4AD3-9C39-E7151907C43F}` FOREIGN KEY (`id_tribut_configura_of_gt`) REFERENCES `tribut_configura_of_gt` (`id`);
ALTER TABLE `tribut_iss` ADD CONSTRAINT `fk_{63899E57-57EC-423C-9D38-DD9E673F4159}` FOREIGN KEY (`id_tribut_operacao_fiscal`) REFERENCES `tribut_operacao_fiscal` (`id`);
ALTER TABLE `tribut_pis` ADD CONSTRAINT `fk_{6400E21E-AE1E-47EB-9DD4-FD8D4F5F00B9}` FOREIGN KEY (`id_tribut_configura_of_gt`) REFERENCES `tribut_configura_of_gt` (`id`);
ALTER TABLE `usuario` ADD CONSTRAINT `fk_USUARIO_COLABORADOR1` FOREIGN KEY (`id_colaborador`) REFERENCES `colaborador` (`id`);
ALTER TABLE `usuario` ADD CONSTRAINT `fk_USUARIO_PAPEL1` FOREIGN KEY (`id_papel`) REFERENCES `papel` (`id`);
ALTER TABLE `venda_cabecalho` ADD CONSTRAINT `fk_{0B6B64FC-0B7F-439D-9BC9-FE77D46D7A07}` FOREIGN KEY (`id_venda_orcamento_cabecalho`) REFERENCES `venda_orcamento_cabecalho` (`id`);
ALTER TABLE `venda_cabecalho` ADD CONSTRAINT `fk_{67810BBB-E8C9-4BC1-AA83-E96DC12A98E1}` FOREIGN KEY (`id_venda_condicoes_pagamento`) REFERENCES `venda_condicoes_pagamento` (`id`);
ALTER TABLE `venda_cabecalho` ADD CONSTRAINT `fk_{91559D47-8B0E-4A62-ACEB-4953401CE72A}` FOREIGN KEY (`id_nota_fiscal_tipo`) REFERENCES `nota_fiscal_tipo` (`id`);
ALTER TABLE `venda_cabecalho` ADD CONSTRAINT `fk_VENDA_CABECALHO_CLIENTE1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`);
ALTER TABLE `venda_cabecalho` ADD CONSTRAINT `fk_VENDA_CABECALHO_TRANSPORTADORA1` FOREIGN KEY (`id_transportadora`) REFERENCES `transportadora` (`id`);
ALTER TABLE `venda_cabecalho` ADD CONSTRAINT `fk_VENDA_CABECALHO_VENDEDOR1` FOREIGN KEY (`id_vendedor`) REFERENCES `vendedor` (`id`);
ALTER TABLE `venda_comissao` ADD CONSTRAINT `fk_{E8EEED49-135C-4572-A661-9D85DFB65356}` FOREIGN KEY (`id_venda_cabecalho`) REFERENCES `venda_cabecalho` (`id`);
ALTER TABLE `venda_comissao` ADD CONSTRAINT `fk_VENDA_COMISSAO_VENDEDOR1` FOREIGN KEY (`id_vendedor`) REFERENCES `vendedor` (`id`);
ALTER TABLE `venda_condicoes_parcelas` ADD CONSTRAINT `fk_{BED0D350-FF66-4FF7-8CE2-3CEE91CB7EBC}` FOREIGN KEY (`id_venda_condicoes_pagamento`) REFERENCES `venda_condicoes_pagamento` (`id`);
ALTER TABLE `venda_detalhe` ADD CONSTRAINT `fk_{69C29C33-DFCD-49FA-8F5F-105E19884FEE}` FOREIGN KEY (`id_venda_cabecalho`) REFERENCES `venda_cabecalho` (`id`);
ALTER TABLE `venda_detalhe` ADD CONSTRAINT `fk_VENDA_DETALHE_PRODUTO1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`);
ALTER TABLE `venda_frete` ADD CONSTRAINT `fk_{1ABD2167-8D93-47C8-B224-4799D3AC3986}` FOREIGN KEY (`id_venda_cabecalho`) REFERENCES `venda_cabecalho` (`id`);
ALTER TABLE `venda_frete` ADD CONSTRAINT `fk_VENDA_FRETE_TRANSPORTADORA1` FOREIGN KEY (`id_transportadora`) REFERENCES `transportadora` (`id`);
ALTER TABLE `venda_orcamento_cabecalho` ADD CONSTRAINT `fk_{013A2B4A-7CC7-4170-AE92-55132D36367E}` FOREIGN KEY (`id_venda_condicoes_pagamento`) REFERENCES `venda_condicoes_pagamento` (`id`);
ALTER TABLE `venda_orcamento_cabecalho` ADD CONSTRAINT `fk_VENDA_ORCAMENTO_CABECALHO_VENDEDOR1` FOREIGN KEY (`id_vendedor`) REFERENCES `vendedor` (`id`);
ALTER TABLE `venda_orcamento_cabecalho` ADD CONSTRAINT `fk_VENDA_ORCAMENTO_CABECALHO_CLIENTE1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`);
ALTER TABLE `venda_orcamento_cabecalho` ADD CONSTRAINT `fk_VENDA_ORCAMENTO_CABECALHO_TRANSPORTADORA1` FOREIGN KEY (`id_transportadora`) REFERENCES `transportadora` (`id`);
ALTER TABLE `venda_orcamento_detalhe` ADD CONSTRAINT `fk_{E312F633-27BF-4104-95C5-4A093136448D}` FOREIGN KEY (`id_venda_orcamento_cabecalho`) REFERENCES `venda_orcamento_cabecalho` (`id`);
ALTER TABLE `venda_orcamento_detalhe` ADD CONSTRAINT `fk_VENDA_ORCAMENTO_DETALHE_PRODUTO1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`);
ALTER TABLE `vendedor` ADD CONSTRAINT `fk_VENDEDOR_COLABORADOR1` FOREIGN KEY (`id_colaborador`) REFERENCES `colaborador` (`id`);
ALTER TABLE `vendedor` ADD CONSTRAINT `fk_VENDEDOR_COMISSAO_PERFIL1` FOREIGN KEY (`id_comissao_perfil`) REFERENCES `comissao_perfil` (`id`);
ALTER TABLE `vendedor_meta` ADD CONSTRAINT `fk_VENDEDOR_META_VENDEDOR1` FOREIGN KEY (`id_vendedor`) REFERENCES `vendedor` (`id`);
ALTER TABLE `vendedor_meta` ADD CONSTRAINT `fk_VENDEDOR_META_CLIENTE1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`);
ALTER TABLE `vendedor_rota` ADD CONSTRAINT `fk_VENDEDOR_ROTA_VENDEDOR1` FOREIGN KEY (`id_vendedor`) REFERENCES `vendedor` (`id`);
ALTER TABLE `vendedor_rota` ADD CONSTRAINT `fk_VENDEDOR_ROTA_CLIENTE1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`);
ALTER TABLE `wms_armazenamento` ADD CONSTRAINT `fk_{734FF4E6-A808-433A-AB15-84F96C5547EA}` FOREIGN KEY (`id_wms_caixa`) REFERENCES `wms_caixa` (`id`);
ALTER TABLE `wms_armazenamento` ADD CONSTRAINT `fk_{7BE115CD-47DC-43BC-B71A-9767FBCC9E9D}` FOREIGN KEY (`id_wms_recebimento_detalhe`) REFERENCES `wms_recebimento_detalhe` (`id`);
ALTER TABLE `wms_caixa` ADD CONSTRAINT `fk_{1716794B-B0D8-4C32-B29A-8322E86A49F3}` FOREIGN KEY (`id_wms_estante`) REFERENCES `wms_estante` (`id`);
ALTER TABLE `wms_estante` ADD CONSTRAINT `fk_{54ED3A4A-0685-4EAD-A483-FB2085C30584}` FOREIGN KEY (`id_wms_rua`) REFERENCES `wms_rua` (`id`);
ALTER TABLE `wms_expedicao` ADD CONSTRAINT `fk_{2ADE2A79-7150-4915-83A1-9D60624AE78A}` FOREIGN KEY (`id_wms_armazenamento`) REFERENCES `wms_armazenamento` (`id`);
ALTER TABLE `wms_expedicao` ADD CONSTRAINT `fk_{46626029-1FD9-41A4-99BC-3883E02C29A1}` FOREIGN KEY (`id_wms_ordem_separacao_det`) REFERENCES `wms_ordem_separacao_det` (`id`);
ALTER TABLE `wms_ordem_separacao_det` ADD CONSTRAINT `fk_{9A2509D6-849E-4636-8BD3-A38F16B050B0}` FOREIGN KEY (`id_wms_ordem_separacao_cab`) REFERENCES `wms_ordem_separacao_cab` (`id`);
ALTER TABLE `wms_ordem_separacao_det` ADD CONSTRAINT `fk_WMS_ORDEM_SEPARACAO_DET_PRODUTO1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`);
ALTER TABLE `wms_recebimento_cabecalho` ADD CONSTRAINT `fk_{8B28EFA0-D32C-4AAC-B55C-219A5F910E4B}` FOREIGN KEY (`id_wms_agendamento`) REFERENCES `wms_agendamento` (`id`);
ALTER TABLE `wms_recebimento_detalhe` ADD CONSTRAINT `fk_{25A6AC1D-7A1E-4F97-AAC7-246CC689D258}` FOREIGN KEY (`id_wms_recebimento_cabecalho`) REFERENCES `wms_recebimento_cabecalho` (`id`);
ALTER TABLE `wms_recebimento_detalhe` ADD CONSTRAINT `fk_WMS_RECEBIMENTO_DETALHE_PRODUTO1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`);

SET FOREIGN_KEY_CHECKS = 1;
