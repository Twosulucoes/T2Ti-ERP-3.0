-- Views do MySQL (copiadas de artefatos/views-mysql)

-- VIEW_CONTROLE_ACESSO.txt
CREATE
VIEW VIEW_CONTROLE_ACESSO
AS

SELECT 
CAST( CONCAT(pa.id,fu.id,pafu.id) as UNSIGNED) as id, 
pe.id AS id_pessoa, pe.nome AS pessoa_nome, 
c.id AS id_colaborador,  
u.id AS id_usuario, u.administrador,
pa.id AS id_papel, pa.nome AS papel_nome, pa.descricao AS papel_descricao,
fu.id AS id_funcao, fu.nome AS funcao_nome, fu.descricao AS funcao_descricao,
pafu.id AS id_papel_funcao, pafu.habilitado, pafu.pode_inserir, pafu.pode_alterar, pafu.pode_excluir

FROM pessoa pe
INNER JOIN colaborador c ON (c.id_pessoa = pe.id)
INNER JOIN usuario u ON (u.id_colaborador = c.id)
INNER JOIN papel pa ON (u.id_papel = pa.id)
INNER JOIN papel_funcao pafu ON (pafu.id_papel = pa.id)
INNER JOIN funcao fu ON (pafu.id_funcao = fu.id);

-- VIEW_FIN_CHEQUE_NAO_COMPENSADO.txt
create view view_fin_cheque_nao_compensado (
    id,
    id_banco_conta_caixa,
    nome_conta_caixa,
    talao,
    numero_talao,
    numero_cheque,
    status_cheque,
    data_status,
    valor
) as

select
    cast(concat(t.id, c.id) as unsigned) as id,
    cc.id as id_banco_conta_caixa,
    cc.nome as nome_conta_caixa,
    t.talao,
    t.numero as numero_talao,
    c.numero as numero_cheque,
    c.status_cheque,
    c.data_status,
    valor

from
    cheque c
    inner join talonario_cheque t on c.id_talonario_cheque = t.id
    inner join banco_conta_caixa cc on t.id_banco_conta_caixa = cc.id
    inner join fin_cheque_emitido ce on ce.id_cheque = c.id

where
    c.status_cheque <> '3'
;

-- VIEW_FIN_FLUXO_CAIXA.txt
create view view_fin_fluxo_caixa (
    id,
    id_banco_conta_caixa,
    nome_conta_caixa,
    nome_pessoa,
    data_lancamento,
    data_vencimento,
    valor,
    codigo_situacao,
    descricao_situacao,
    operacao
) as

select
    cast(concat(lp.id, pp.id) as unsigned) as id,
    cc.id as id_banco_conta_caixa,
    cc.nome as nome_conta_caixa,
    p.nome as nome_pessoa,
    lp.data_lancamento,
    pp.data_vencimento,
    pp.valor,
    sp.situacao as codigo_situacao,
    sp.descricao as descricao_situacao,
    'S' as operacao

from
    fin_parcela_pagar pp
    inner join fin_lancamento_pagar lp on pp.id_fin_lancamento_pagar = lp.id
    inner join banco_conta_caixa cc on lp.id_banco_conta_caixa = cc.id
    inner join fornecedor f on lp.id_fornecedor = f.id
    inner join pessoa p on f.id_pessoa = p.id
    inner join fin_status_parcela sp on pp.id_fin_status_parcela = sp.id

where
    sp.situacao = '01' or sp.situacao = '04'

union

select
    cast(concat(lr.id, pr.id) as unsigned) as id,
    cc.id as id_banco_conta_caixa,
    cc.nome as nome_conta_caixa,
    p.nome as nome_pessoa,
    lr.data_lancamento,
    pr.data_vencimento,
    pr.valor,
    sp.situacao as codigo_situacao,
    sp.descricao as descricao_situacao,
    'E' as operacao

from
    fin_parcela_receber pr
    inner join fin_lancamento_receber lr on pr.id_fin_lancamento_receber = lr.id
    inner join banco_conta_caixa cc on lr.id_banco_conta_caixa = cc.id
    inner join cliente c on lr.id_cliente = c.id
    inner join pessoa p on c.id_pessoa = p.id
    inner join fin_status_parcela sp on pr.id_fin_status_parcela = sp.id

where
    sp.situacao = '01' or sp.situacao = '04'

order by 1
;

-- VIEW_FIN_LANCAMENTO_PAGAR.txt
create view view_fin_lancamento_pagar (
    id,
    id_fin_lancamento_pagar,
    quantidade_parcela,
    valor_lancamento,
    data_lancamento,
    numero_documento,
    id_fin_parcela_pagar,
    numero_parcela,
    data_vencimento,
    data_pagamento,
    valor_parcela,
    taxa_juro,
    valor_juro,
    taxa_multa,
    valor_multa,
    taxa_desconto,
    valor_desconto,
    sigla_documento,
    nome_fornecedor,
    id_fin_status_parcela,
    situacao_parcela,
    descricao_situacao_parcela,
    id_banco_conta_caixa,
    nome_conta_caixa
) as

select
    cast(concat(lp.id, pp.id) as unsigned) as id,
    lp.id as id_fin_lancamento_pagar,
    lp.quantidade_parcela,
    lp.valor_a_pagar as valor_lancamento,
    lp.data_lancamento,
    lp.numero_documento,
    pp.id as id_fin_parcela_pagar,
    pp.numero_parcela,
    pp.data_vencimento,
    pp.data_pagamento,
    pp.valor as valor_parcela,
    pp.taxa_juro,
    pp.valor_juro,
    pp.taxa_multa,
    pp.valor_multa,
    pp.taxa_desconto,
    pp.valor_desconto,
    doc.sigla as sigla_documento,
    p.nome as nome_fornecedor,
    s.id as id_fin_status_parcela,
    s.situacao as situacao_parcela,
    s.descricao as descricao_situacao_parcela,
    cc.id as id_banco_conta_caixa,
    cc.nome as nome_conta_caixa

from
    fin_lancamento_pagar lp,
    fin_parcela_pagar pp,
    fin_documento_origem doc,
    pessoa p,
    fornecedor f,
    fin_status_parcela s,
    banco_conta_caixa cc

where
    pp.id_fin_lancamento_pagar = lp.id
    and pp.id_fin_status_parcela = s.id
    and lp.id_fin_documento_origem = doc.id
    and lp.id_fornecedor = f.id
    and f.id_pessoa = p.id
    and lp.id_banco_conta_caixa = cc.id
;

-- VIEW_FIN_LANCAMENTO_RECEBER.txt
create view view_fin_lancamento_receber (
    id,
    id_fin_lancamento_receber,
    quantidade_parcela,
    valor_lancamento,
    data_lancamento,
    numero_documento,
    id_fin_parcela_receber,
    numero_parcela,
    data_vencimento,
    data_recebimento,
    valor_parcela,
    taxa_juro,
    valor_juro,
    taxa_multa,
    valor_multa,
    taxa_desconto,
    valor_desconto,
    sigla_documento,
		id_cliente,
		id_pessoa,
    nome_cliente,
    id_fin_status_parcela,
    situacao_parcela,
    descricao_situacao_parcela,
    id_banco_conta_caixa,
    nome_conta_caixa
) as

select
    cast(concat(lr.id, pr.id) as unsigned) as id,
    lr.id as id_fin_lancamento_receber,
    lr.quantidade_parcela,
    lr.valor_a_receber as valor_lancamento,
    lr.data_lancamento,
    lr.numero_documento,
    pr.id as id_fin_parcela_receber,
    pr.numero_parcela,
    pr.data_vencimento,
    pr.data_recebimento,
    pr.valor as valor_parcela,
    pr.taxa_juro,
    pr.valor_juro,
    pr.taxa_multa,
    pr.valor_multa,
    pr.taxa_desconto,
    pr.valor_desconto,
    doc.sigla as sigla_documento,
		c.id as id_cliente,
		p.id as id_pessoa,
    p.nome as nome_cliente,
    s.id as id_fin_status_parcela,
    s.situacao as situacao_parcela,
    s.descricao as descricao_situacao_parcela,
    cc.id as id_banco_conta_caixa,
    cc.nome as nome_conta_caixa

from
    fin_lancamento_receber lr,
    fin_parcela_receber pr,
    fin_documento_origem doc,
    pessoa p,
    cliente c,
    fin_status_parcela s,
    banco_conta_caixa cc

where
    pr.id_fin_lancamento_receber = lr.id
    and pr.id_fin_status_parcela = s.id
    and lr.id_fin_documento_origem = doc.id
    and lr.id_cliente = c.id
    and c.id_pessoa = p.id
    and lr.id_banco_conta_caixa = cc.id
;

-- VIEW_FIN_MOVIMENTO_CAIXA_BANCO.txt
create view view_fin_movimento_caixa_banco (
    id,
    id_banco_conta_caixa,
    nome_conta_caixa,
    nome_pessoa,
    data_lancamento,
    data_pago_recebido,
    mes_ano,
    historico,
    valor,
    descricao_documento_origem,
    operacao
) as

select
    cast(concat(cc.id, lp.id, pp.id) as unsigned) as id,
    cc.id as id_banco_conta_caixa,
    cc.nome as nome_conta_caixa,
    p.nome as nome_pessoa,
    lp.data_lancamento,
    pp.data_pagamento as data_pago_recebido,
    date_format(pp.data_pagamento, '%m/%Y') as mes_ano,
    pp.historico,
    pp.valor_pago as valor,
    doc.descricao as descricao_documento_origem,
    'S' as operacao

from 
    fin_parcela_pagar pp
    inner join fin_lancamento_pagar lp on (pp.id_fin_lancamento_pagar = lp.id)
    inner join banco_conta_caixa cc on (lp.id_banco_conta_caixa = cc.id)
    inner join fornecedor f on (lp.id_fornecedor = f.id)
    inner join pessoa p on (f.id_pessoa = p.id)
    inner join fin_documento_origem doc on (lp.id_fin_documento_origem = doc.id)

union

select
    cast(concat(cc.id, lr.id, pr.id) as unsigned) as id,
    cc.id as id_banco_conta_caixa,
    cc.nome as nome_conta_caixa,
    p.nome as nome_pessoa,
    lr.data_lancamento,
    pr.data_recebimento as data_pago_recebido,
    date_format(pr.data_recebimento, '%m/%Y') as mes_ano,
    pr.historico,
    pr.valor_recebido as valor,
    doc.descricao as descricao_documento_origem,
    'E' as operacao

from 
    fin_parcela_receber pr
    inner join fin_lancamento_receber lr on (pr.id_fin_lancamento_receber = lr.id)
    inner join banco_conta_caixa cc on (lr.id_banco_conta_caixa = cc.id)
    inner join cliente c on (lr.id_cliente = c.id)
    inner join pessoa p on (c.id_pessoa = p.id)
    inner join fin_documento_origem doc on (lr.id_fin_documento_origem = doc.id)

order by id_banco_conta_caixa, data_lancamento
;

-- VIEW_PESSOA_CLIENTE.txt
create view view_pessoa_cliente as

select 
    c.id,
    p.nome, p.tipo, p.email, p.site, 
    pf.cpf as cpf_cnpj, 
    pf.rg as rg_ie,
    c.desde,
    c.taxa_desconto,
    c.limite_credito,
    c.data_cadastro,
    c.observacao,
    e.logradouro, e.numero, e.complemento, e.bairro, e.cidade, e.cep, e.municipio_ibge, e.uf,
    p.id as id_pessoa
from
    pessoa p 
    inner join pessoa_fisica pf on (pf.id_pessoa = p.id)
    inner join cliente c on (c.id_pessoa = p.id)
    left join pessoa_endereco e on (e.id_pessoa = p.id)
where 
    p.eh_cliente = 'S'

union

select 
    c.id,
    p.nome, p.tipo, p.email, p.site, 
    pj.cnpj as cpf_cnpj, 
    pj.inscricao_estadual as rg_ie,
    c.desde,
    c.taxa_desconto,
    c.limite_credito,
    c.data_cadastro,
    c.observacao,
    e.logradouro, e.numero, e.complemento, e.bairro, e.cidade, e.cep, e.municipio_ibge, e.uf,
    p.id as id_pessoa
from
    pessoa p 
    inner join pessoa_juridica pj on (pj.id_pessoa = p.id)
    inner join cliente c on (c.id_pessoa = p.id)
    left join pessoa_endereco e on (e.id_pessoa = p.id)
where 
    p.eh_cliente = 'S'
;

-- VIEW_PESSOA_COLABORADOR.txt
create view view_pessoa_colaborador as

select 
    c.id as id,
    p.nome as nome, 
    p.tipo as tipo, 
    p.email as email, 
    p.site as site, 
    pf.cpf as cpf_cnpj, 
    pf.rg as rg_ie,
    c.matricula as matricula,
    c.data_cadastro as data_cadastro,
    c.data_admissao as data_admissao,
    c.data_demissao as data_demissao,
    c.ctps_numero as ctps_numero,
    c.ctps_serie as ctps_serie,
    c.ctps_data_expedicao as ctps_data_expedicao,
    c.ctps_uf as ctps_uf,
    c.observacao as observacao,
    e.logradouro as logradouro, 
    e.numero as numero, 
    e.complemento as complemento, 
    e.bairro as bairro, 
    e.cidade as cidade, 
    e.cep as cep, 
    e.municipio_ibge as municipio_ibge, 
    e.uf as uf,
    p.id as id_pessoa,
    c.id_cargo as id_cargo,
    c.id_setor as id_setor
from
    pessoa p 
    inner join pessoa_fisica pf on (pf.id_pessoa = p.id)
    inner join colaborador c on (c.id_pessoa = p.id)
    left join pessoa_endereco e on (e.id_pessoa = p.id)
where 
    p.eh_colaborador = 'S'

union

select 
    c.id as id,
    p.nome as nome, 
    p.tipo as tipo, 
    p.email as email, 
    p.site as site, 
    pj.cnpj as cpf_cnpj, 
    pj.inscricao_estadual as rg_ie,
    c.matricula as matricula,
    c.data_cadastro as data_cadastro,
    c.data_admissao as data_admissao,
    c.data_demissao as data_demissao,
    c.ctps_numero as ctps_numero,
    c.ctps_serie as ctps_serie,
    c.ctps_data_expedicao as ctps_data_expedicao,
    c.ctps_uf as ctps_uf,
    c.observacao as observacao,
    e.logradouro as logradouro, 
    e.numero as numero, 
    e.complemento as complemento, 
    e.bairro as bairro, 
    e.cidade as cidade, 
    e.cep as cep, 
    e.municipio_ibge as municipio_ibge, 
    e.uf as uf,
    p.id as id_pessoa,
    c.id_cargo as id_cargo,
    c.id_setor as id_setor
from
    pessoa p 
    inner join pessoa_juridica pj on (pj.id_pessoa = p.id)
    inner join colaborador c on (c.id_pessoa = p.id)
    left join pessoa_endereco e on (e.id_pessoa = p.id)
where 
    p.eh_colaborador = 'S'
;

-- VIEW_PESSOA_FORNECEDOR.txt
create
view view_pessoa_fornecedor
as

select 
	f.id,
	p.nome, p.tipo, p.email, p.site, 
	pf.cpf as "cpf_cnpj", 
	pf.rg as "rg_ie",
	f.desde,
	f.data_cadastro,
	f.observacao,
	e.logradouro, e.numero, e.complemento, e.bairro, e.cidade, e.cep, e.municipio_ibge, e.uf,
	p.id as "id_pessoa"
from
	pessoa p 
	inner join pessoa_fisica pf on (pf.id_pessoa = p.id)
	inner join fornecedor f on (f.id_pessoa = p.id)
	left join pessoa_endereco e on (e.id_pessoa = p.id)
where 
	p.eh_fornecedor = "S"

union

select 
	f.id,
	p.nome, p.tipo, p.email, p.site, 
	pj.cnpj as "cpf_cnpj", 
	pj.inscricao_estadual as "rg_ie",
	f.desde,
	f.data_cadastro,
	f.observacao,
	e.logradouro, e.numero, e.complemento, e.bairro, e.cidade, e.cep, e.municipio_ibge, e.uf,
	p.id as "id_pessoa"
from
	pessoa p 
	inner join pessoa_juridica pj on (pj.id_pessoa = p.id)
	inner join fornecedor f on (f.id_pessoa = p.id)
	left join pessoa_endereco e on (e.id_pessoa = p.id)
where 
	p.eh_fornecedor = "S"
;

-- VIEW_PESSOA_TRANSPORTADORA.txt
create view view_pessoa_transportadora as

select 
    t.id,
    p.nome, p.tipo, p.email, p.site, 
    pf.cpf as cpf_cnpj, 
    pf.rg as rg_ie,
    t.data_cadastro,
    t.observacao,
    p.id as id_pessoa
from
    pessoa p 
    inner join pessoa_fisica pf on (pf.id_pessoa = p.id)
    inner join transportadora t on (t.id_pessoa = p.id)
where 
    p.eh_transportadora = 'S'

union

select 
    t.id,
    p.nome, p.tipo, p.email, p.site, 
    pj.cnpj as cpf_cnpj, 
    pj.inscricao_estadual as rg_ie,
    t.data_cadastro,
    t.observacao,
    p.id as id_pessoa
from
    pessoa p 
    inner join pessoa_juridica pj on (pj.id_pessoa = p.id)
    inner join transportadora t on (t.id_pessoa = p.id)
where 
    p.eh_transportadora = 'S'
;

-- VIEW_PESSOA_USUARIO.txt
CREATE
VIEW VIEW_PESSOA_USUARIO
AS

SELECT 
CAST( CONCAT(pe.id,c.id,u.id) AS UNSIGNED) AS id, 
pe.id AS id_pessoa, pe.nome AS pessoa_nome, pe.tipo, pe.email,
c.id AS id_colaborador,  
u.id AS id_usuario, u.login, u.senha, u.data_cadastro, u.administrador

FROM pessoa pe
INNER JOIN colaborador c ON (c.id_pessoa = pe.id)
INNER JOIN usuario u ON (u.id_colaborador = c.id);

-- VIEW_PESSOA_VENDEDOR.txt
create view view_pessoa_vendedor as

select 
    c.id,
    p.nome, p.tipo, p.email, p.site, 
    pf.cpf as cpf_cnpj, 
    pf.rg as rg_ie,
    c.matricula,
    c.data_cadastro,
    c.data_admissao,
    c.data_demissao,
    c.ctps_numero,
    c.ctps_serie,
    c.ctps_data_expedicao,
    c.ctps_uf,
    c.observacao,
    e.logradouro, e.numero, e.complemento, e.bairro, e.cidade, e.cep, e.municipio_ibge, e.uf,
    p.id as id_pessoa,
    c.id_cargo,
    c.id_setor,
    v.comissao,
    v.meta_venda
from
    pessoa p 
    inner join pessoa_fisica pf on (pf.id_pessoa = p.id)
    inner join colaborador c on (c.id_pessoa = p.id)
    left join pessoa_endereco e on (e.id_pessoa = p.id)
    inner join vendedor v on (v.id_colaborador = c.id)
where 
    p.eh_colaborador = 'S'

union

select 
    c.id,
    p.nome, p.tipo, p.email, p.site, 
    pj.cnpj as cpf_cnpj, 
    pj.inscricao_estadual as rg_ie,
    c.matricula,
    c.data_cadastro,
    c.data_admissao,
    c.data_demissao,
    c.ctps_numero,
    c.ctps_serie,
    c.ctps_data_expedicao,
    c.ctps_uf,
    c.observacao,
    e.logradouro, e.numero, e.complemento, e.bairro, e.cidade, e.cep, e.municipio_ibge, e.uf,
    p.id as id_pessoa,
    c.id_cargo,
    c.id_setor,
    v.comissao,
    v.meta_venda
from
    pessoa p 
    inner join pessoa_juridica pj on (pj.id_pessoa = p.id)
    inner join colaborador c on (c.id_pessoa = p.id)
    left join pessoa_endereco e on (e.id_pessoa = p.id)
    inner join vendedor v on (v.id_colaborador = c.id)
where 
    p.eh_colaborador = 'S'
;

-- View_CONTABIL_Balanco.txt
CREATE VIEW VIEW_BALANCO_PATRIMONIAL
AS
select 
	CAST( CONCAT(cccab.ID,ccdet.ID) as UNSIGNED) as id, 
	DATE_FORMAT(cccab.data_lancamento,'%Y') as ano,
	cc.classificacao as classificacao,
	cc.descricao as descricao, 
	sum(ccdet.valor) as valor
from
	contabil_conta cc 
	inner join contabil_lancamento_detalhe ccdet on (ccdet.id_contabil_conta = cc.id)
	inner join contabil_lancamento_cabecalho cccab on (ccdet.id_contabil_lancamento_cab = cccab.id)
group by 
	ANO, classificacao, descricao;
