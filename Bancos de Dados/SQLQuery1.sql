--Apagar base de dados ja existente (Drop database {nome da  base de dados};

--Criar base de dados Empresa
CREATE DATABASE empresa

--Acessar a base de dados criada
USE empresa;

--Criar tabela funcional
CREATE TABLE Funcionario(
	Codigo INT PRIMARY KEY,
	Nome NVARCHAR(100)
);

--Inserindo valores em uma tabela
INSERT INTO Funcionario (Codigo, Nome)
VALUES
(1, 'Caique'),
(2, 'Cleber')
INSERT INTO Funcionario VALUES
(3, 'Robinho')

--Listar dados inseridos
SELECT * FROM Funcionario;

--Listar nomes de funcionarios
SELECT Nome, Codigo FROM Funcionario;

--Listar funcionarios com cod > 2
SELECT * FROM Funcionario
WHERE Codigo > 2;

--Listar funcionarios que comecem com a letra R
SELECT * FROM Funcionario
WHERE Nome LIKE 'R%';

SELECT * FROM Funcionario
WHERE Nome LIKE '%R';

SELECT * FROM Funcionario
WHERE Nome LIKE '%I%';

--Ordenar valores(decrescente)
SELECT * FROM Funcionario
ORDER BY Codigo DESC

--Ordenar por ordem alfabetica
SELECT * FROM Funcionario
ORDER BY Nome

--DESC - decrescente
--ASC - crescente

--Atualizacao de registros
UPDATE Funcionario SET Nome = 'Caique Lima'
WHERE Nome = 'Caique'

SELECT * FROM Funcionario

--Atualizacao sem where (nao fazer)
--muda todos os nomes
UPDATE Funcionario SET Nome = 'Thiago'

--Exclusao de dados
--Nao esquecer de usar o WHERE
DELETE FROM Funcionario
WHERE Codigo = 1

SELECT * FROM Funcionario

