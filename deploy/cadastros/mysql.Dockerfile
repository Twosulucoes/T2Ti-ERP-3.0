# MySQL com os scripts de criação do banco dentro da imagem, para não depender de
# montar a pasta deploy/mysql (o Coolify não copia arquivos do repositório para volumes).
FROM mysql:8.4
COPY deploy/mysql/ /docker-entrypoint-initdb.d/
