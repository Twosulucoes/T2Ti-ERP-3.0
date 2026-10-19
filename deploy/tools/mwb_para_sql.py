"""Gera o script DDL (MySQL) a partir do modelo do MySQL Workbench (fenix.mwb).

Tabelas e colunas saem em minúsculas, como os backends esperam (os models leem
os atributos pelo nome exato da coluna devolvido pelo banco).

Uso: python3 mwb_para_sql.py ../../artefatos/der/fenix.mwb > ../mysql/01-schema.sql
"""
import sys
import zipfile
import xml.etree.ElementTree as ET

TIPOS = {
    'int': 'INT', 'varchar': 'VARCHAR', 'char': 'CHAR', 'text': 'TEXT',
    'decimal': 'DECIMAL', 'date': 'DATE', 'timestamp_f': 'TIMESTAMP',
}


def val(e, key):
    v = e.find(f"*[@key='{key}']")
    return None if v is None else (v.text or '')


def main(caminho):
    with zipfile.ZipFile(caminho) as z:
        raiz = ET.fromstring(z.read('document.mwb.xml'))

    tabelas = [e for e in raiz.iter('value') if e.get('struct-name') == 'db.mysql.Table']
    colunas = {}
    for t in tabelas:
        for c in t.find("*[@key='columns']"):
            colunas[c.get('id')] = (val(t, 'name').lower(), val(c, 'name').lower())
    nome_tabela = {t.get('id'): val(t, 'name').lower() for t in tabelas}

    saida = ['-- Gerado automaticamente a partir de artefatos/der/fenix.mwb', 'SET NAMES utf8mb4;',
             'SET FOREIGN_KEY_CHECKS = 0;', '']
    chaves = []
    for t in sorted(tabelas, key=lambda x: val(x, 'name')):
        linhas = []
        for c in t.find("*[@key='columns']"):
            tipo = val(c, 'simpleType').rsplit('.', 1)[-1]
            sql = TIPOS[tipo]
            tam, prec, esc = int(val(c, 'length')), int(val(c, 'precision')), int(val(c, 'scale'))
            if sql in ('VARCHAR', 'CHAR'):
                sql += f'({tam if tam > 0 else (1 if sql == "CHAR" else 255)})'
            elif sql == 'DECIMAL' and prec > 0:
                sql += f'({prec},{max(esc, 0)})'
            col = f'  `{val(c, "name").lower()}` {sql}'
            if val(c, 'isNotNull') == '1':
                col += ' NOT NULL'
            if val(c, 'autoIncrement') == '1':
                col += ' AUTO_INCREMENT'
            padrao = val(c, 'defaultValue')
            if padrao and val(c, 'defaultValueIsNull') != '1':
                col += f' DEFAULT {padrao}'
            linhas.append(col)
        for i in t.find("*[@key='indices']"):
            cols = ', '.join(f'`{colunas[ic.find("*[@key=\'referencedColumn\']").text][1]}`'
                             for ic in i.find("*[@key='columns']"))
            if val(i, 'isPrimary') == '1':
                linhas.append(f'  PRIMARY KEY ({cols})')
            elif val(i, 'unique') == '1' or val(i, 'indexType') == 'UNIQUE':
                linhas.append(f'  UNIQUE KEY `{val(i, "name")}` ({cols})')
            elif val(i, 'indexType') == 'INDEX':
                linhas.append(f'  KEY `{val(i, "name")}` ({cols})')
        saida.append(f'CREATE TABLE IF NOT EXISTS `{nome_tabela[t.get("id")]}` (\n' + ',\n'.join(linhas) +
                     '\n) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;\n')
        for fk in t.find("*[@key='foreignKeys']"):
            ref = fk.find("*[@key='referencedTable']").text
            if ref not in nome_tabela:
                continue
            origem = ', '.join(f'`{colunas[l.text][1]}`' for l in fk.find("*[@key='columns']"))
            destino = ', '.join(f'`{colunas[l.text][1]}`' for l in fk.find("*[@key='referencedColumns']"))
            chaves.append(f'ALTER TABLE `{nome_tabela[t.get("id")]}` ADD CONSTRAINT `{val(fk, "name")}` '
                          f'FOREIGN KEY ({origem}) REFERENCES `{nome_tabela[ref]}` ({destino});')
    saida += chaves + ['', 'SET FOREIGN_KEY_CHECKS = 1;', '']
    sys.stdout.write('\n'.join(saida))


if __name__ == '__main__':
    main(sys.argv[1])
