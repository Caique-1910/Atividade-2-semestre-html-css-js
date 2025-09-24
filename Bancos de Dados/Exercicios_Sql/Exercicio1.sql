--Exercicio 1
CREATE DATABASE Cadastro
USE Cadastro

CREATE TABLE Aluno(
	Id INT PRIMARY KEY,
	Nome NVARCHAR(100), 
	Idade INT,
	Cidade NVARCHAR(100)
);

INSERT INTO Aluno (Id, Nome, Idade, Cidade)
VALUES
(1, 'Caique', 14, 'Sao Paulo'),
(2, 'Diego', 13, 'Sao Bernardo'),
(3, 'Ana', 15, 'Sao Caetano'),
(4, 'Heitor', 17, 'Sao Roque'),
(5, 'Ronaldo', 10, 'Santo Andre')


SELECT * FROM Aluno

