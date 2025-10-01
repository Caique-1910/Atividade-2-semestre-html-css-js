USE Clinica_Medica

-- DICIONARIO DE DADOS

-- VISUALIZAR TABELAS DA BASE DE DADOS
SELECT * FROM sys.tables

SELECT name, create_date, modify_date
FROM sys.tables

-- VISUALIZAR INFORMACOES COLUNAS DA TABELA
SELECT * FROM sys.columns
WHERE object_id = OBJECT_ID('Paciente')



-- VISUALIZAR OS TIPOS DE DADOS DO SISTEMA
SELECT * FROM sys.types

--CONSULTA DE TODOS JUNTOS COM JOIN

SELECT tabelas.name AS Tabela, colunas.name AS Coluna, tipo.name AS Tipo, colunas.max_length AS Tamanho,
colunas.is_nullable AS PermiteNulo
FROM sys.tables tabelas
JOIN sys.columns colunas ON tabelas.object_id = colunas.object_id
JOIN sys.types tipo ON colunas.user_type_id = tipo.user_type_id
ORDER BY tabelas.name, colunas.column_id

SELECT * FROM INFORMATION_SCHEMA.COLUMNS



