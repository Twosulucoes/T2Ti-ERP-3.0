# Deploy em produção (VPS com Docker) — módulo Cadastros

Este diretório sobe o módulo **Cadastros** do T2Ti ERP 3.0 em um servidor com Docker:

| Serviço   | O que é                                                        |
|-----------|----------------------------------------------------------------|
| `mysql`   | MySQL 8.4 com o banco `fenix` criado a partir de `artefatos/der/fenix.mwb` |
| `backend` | Backend PHP do Vycanis (`fontes/backend/php/vycanis/cadastros.zip`)        |
| `web`     | Front React Admin (`fontes/frontend/react/cadastros-React Admin.zip`) servido pelo Caddy, com HTTPS automático |

Só as portas 80 e 443 ficam abertas. O backend e o banco não são expostos para a internet.

## 1. O que você precisa

- Uma VPS Linux (Ubuntu 22.04/24.04) com pelo menos **2 GB de RAM** e 20 GB de disco.
- Um domínio (ou subdomínio) com um registro **A** apontando para o IP da VPS, por exemplo `erp.suaempresa.com.br`.

## 2. Instalar o Docker na VPS

```sh
curl -fsSL https://get.docker.com | sh
```

## 3. Baixar o projeto e configurar

```sh
git clone https://github.com/Twosulucoes/T2Ti-ERP-3.0.git
cd T2Ti-ERP-3.0/deploy
cp .env.exemplo .env
```

Edite o `.env` e troque **todos** os valores:

- `DOMINIO`: o domínio do passo 1.
- `MYSQL_ROOT_PASSWORD`, `MYSQL_PASSWORD`, `ADMIN_SENHA`: senhas fortes.
- `CHAVE_CRIPTOGRAFIA` (32 caracteres) e `VETOR_CRIPTOGRAFIA` (16 caracteres). Gere com:

```sh
openssl rand -hex 16   # chave
openssl rand -hex 8    # vetor
```

## 4. Subir

```sh
docker compose up -d --build
```

A primeira subida cria o banco (tabelas, views, bancos do BACEN, CFOP, funções e o usuário administrador). Acompanhe com `docker compose logs -f`. Depois acesse `https://SEU_DOMINIO` e entre com `ADMIN_LOGIN` / `ADMIN_SENHA`.

> O usuário administrador só é criado quando o volume do banco está vazio. Trocar `ADMIN_SENHA` depois não altera a senha já gravada.

### Dados de exemplo (opcional)

Para ter pessoas, produtos e colaboradores de teste:

```sh
docker compose exec -T mysql sh -c 'mysql -uroot -p"$MYSQL_ROOT_PASSWORD" fenix' < mysql/exemplo/dados-exemplo.sql
```

## 5. Backup

Cópia diária do banco às 2h, guardando 14 dias (rode `crontab -e` na VPS e adicione a linha, ajustando o caminho):

```
0 2 * * * cd /root/T2Ti-ERP-3.0/deploy && docker compose exec -T mysql sh -c 'mysqldump -uroot -p"$MYSQL_ROOT_PASSWORD" --single-transaction fenix' | gzip > /root/backup-fenix-$(date +\%F).sql.gz && find /root -name 'backup-fenix-*.sql.gz' -mtime +14 -delete
```

Guarde também uma cópia fora da VPS.

## 6. Atualizar

```sh
git pull
docker compose up -d --build
```

## O que foi ajustado para produção

- **Banco**: `mysql/01-schema.sql` é gerado de `artefatos/der/fenix.mwb` por `tools/mwb_para_sql.py`. `mysql/02-ajustes-cadastros.sql` acrescenta colunas que o backend usa e o modelo ainda não tem.
- **Backend PHP** (dentro de `cadastros.zip`):
  - Senha do banco, chave e vetor vêm de variáveis de ambiente.
  - O banco não pode mais ser escolhido pelo cabeçalho `CNPJ` da requisição.
  - Todas as rotas exigem o token JWT (`EXIGIR_TOKEN=false` desliga, só para desenvolvimento).
  - Filtros e login usam parâmetros (sem SQL injection).
  - Os erros não mostram detalhes internos.
- **Front React**: faz o login real no backend e manda o token em todas as requisições. O login falso de teste foi removido.

## Limitações

- Só o módulo Cadastros está empacotado. Os outros módulos seguem o mesmo molde: o zip do backend PHP com os mesmos ajustes, o zip do React com o mesmo `authProvider`, e mais um `handle /api/<modulo>/*` no `Caddyfile`.
- Os apps Flutter e o PDV (Pegasus) não fazem parte deste deploy.
