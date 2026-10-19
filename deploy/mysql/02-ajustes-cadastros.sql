-- Colunas e tabelas que o backend PHP do módulo Cadastros usa
-- e que ainda não existem no modelo artefatos/der/fenix.mwb.

ALTER TABLE `banco` ADD COLUMN `ispb` VARCHAR(30) NULL, ADD COLUMN `participa_compe` CHAR(3) NULL;
ALTER TABLE `pessoa` ADD COLUMN `numero` VARCHAR(10) NULL;
ALTER TABLE `pessoa_contato` ADD COLUMN `data_contato` DATE NULL;
ALTER TABLE `auditoria` ADD COLUMN `token_jwt` TEXT NULL;

CREATE TABLE IF NOT EXISTS `usuario_token` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(50),
  `token` TEXT,
  `data_criacao` DATE,
  `hora_criacao` VARCHAR(8),
  `data_expiracao` DATE,
  `hora_expiracao` VARCHAR(8),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
