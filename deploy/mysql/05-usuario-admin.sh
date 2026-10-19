#!/bin/bash
# Cria o usuário administrador inicial a partir das variáveis ADMIN_LOGIN e ADMIN_SENHA.
# O backend compara a senha como MD5(login + senha).
set -euo pipefail

: "${ADMIN_LOGIN:?Defina ADMIN_LOGIN no arquivo .env}"
: "${ADMIN_SENHA:?Defina ADMIN_SENHA no arquivo .env}"

login_sql=${ADMIN_LOGIN//\'/\'\'}
senha_md5=$(printf '%s%s' "$ADMIN_LOGIN" "$ADMIN_SENHA" | md5sum | cut -d' ' -f1)

mysql --default-character-set=utf8mb4 -uroot -p"$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE" <<SQL
INSERT INTO PAPEL (NOME, DESCRICAO) VALUES ('ADMINISTRADOR', 'Acesso total ao sistema');
SET @papel = LAST_INSERT_ID();
INSERT INTO PAPEL_FUNCAO (ID_PAPEL, ID_FUNCAO, HABILITADO, PODE_INSERIR, PODE_ALTERAR, PODE_EXCLUIR)
  SELECT @papel, ID, 'S', 'S', 'S', 'S' FROM FUNCAO;
INSERT INTO PESSOA (NOME, TIPO, EH_COLABORADOR) VALUES ('ADMINISTRADOR', 'F', 'S');
INSERT INTO COLABORADOR (ID_PESSOA) VALUES (LAST_INSERT_ID());
INSERT INTO USUARIO (ID_COLABORADOR, ID_PAPEL, LOGIN, SENHA, ADMINISTRADOR, DATA_CADASTRO)
  VALUES (LAST_INSERT_ID(), @papel, '$login_sql', '$senha_md5', 'S', CURDATE());
SQL
