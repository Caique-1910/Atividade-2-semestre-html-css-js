--Exercicio 4
CREATE DATABASE Cadastro_Funcionario
USE Cadastro_Funcionario

CREATE TABLE Funcionario(
 IdFunc INT PRIMARY KEY,
 Nome NVARCHAR(100),
 Cargo NVARCHAR(100),
 Salario Float
)

INSERT INTO Funcionario(IdFunc, Nome, Cargo, Salario)
VALUES
(1,'Jussa', 'Coodernador', 5000.00),
(2,'Ordilei', 'Professor', 4000.00),
(3,'Diego', 'Junior', 1000.00),
(4,'Andre', 'Pleno', 2000.00),
(5,'Claudio', 'Estagiario', 400.00)

SELECT * FROM Funcionario
WHERE Salario > 3000

SELECT * FROM Funcionario
WHERE Cargo LIKE 'Coodernador'

SELECT Nome, Cargo FROM Funcionario