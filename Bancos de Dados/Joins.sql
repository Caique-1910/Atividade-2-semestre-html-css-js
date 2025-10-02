--Exercicio Oficina Mecanica


CREATE DATABASE Oficina_Mecanica
USE Oficina_Mecanica


CREATE TABLE Mecanico(
id_mec INT PRIMARY KEY,
Nome NVARCHAR(100)
)

CREATE TABLE Cliente(
id_cli INT PRIMARY KEY,
Nome NVARCHAR(100),
telefone VARCHAR(30)
)

CREATE TABLE Veiculo(
id_vei INT PRIMARY KEY,
placa VARCHAR(20),
id_Cliente INT FOREIGN KEY REFERENCES Cliente(id_cli)
)

CREATE TABLE OrdemServico(
id_os INT PRIMARY KEY,
id_Veiculo INT FOREIGN KEY REFERENCES Veiculo(id_vei),
id_Mecanico INT FOREIGN KEY REFERENCES Mecanico(id_mec),
data_Servico DATE
)


INSERT INTO Mecanico(id_mec, Nome)
VALUES
(1, 'Cleber'),
(2, 'Walter'),
(3, 'Wanderson')



INSERT INTO Cliente(id_cli, Nome, telefone)
VALUES
(1, 'Vanderlei', '1733699695'),
(2, 'Jacobino', '1138571361'),
(3, 'Fleber', '1138571361')


INSERT INTO Veiculo (id_vei, placa, id_Cliente)
VALUES
(1, 'MZX-9566', 1),
(2, 'IAK-7851', 2),
(3, 'IAI-0365', 3)


INSERT INTO OrdemServico (id_os, id_Veiculo, id_Mecanico, data_Servico)
VALUES
(1, 1, 1, '2025-09-30'),
(2, 2, 2, '2025-10-01'),
(3, 3, 3, '2025-10-07')



--INNER JOIN(Quando precisar combinar informacoes de duas ou mais tabelas (intersecao))
SELECT id_cli, id_os FROM Cliente
INNER JOIN OrdemServico ON Cliente.id_cli = id_os


--RIGHT JOIN(Quando precisar de todos os registros de uma tabela da direita)
SELECT c.Nome, o.id_os, o.data_Servico FROM Cliente c
RIGHT JOIN OrdemServico o ON c.id_cli = o.id_os

--LEFT JOIN(Quando precisar de todos os registros de uma tabela da esquerda)
SELECT c.Nome, m.Nome, m.id_mec FROM Cliente c
LEFT JOIN Mecanico m  ON c.id_cli = m.id_mec


--FULL JOIN(Combinar registros de duas tabelas)
SELECT v.id_vei, c.id_cli, c.Nome FROM Veiculo v
FULL JOIN Cliente c ON v.id_vei = c.id_cli


--CROSS JOIN(Para ver todas as possibilidades)
SELECT o.data_Servico, v.placa FROM OrdemServico o
CROSS JOIN Veiculo v


--OUTER JOIN OU FULL JOIN(Para retornar registros de ambas as tabelas)
SELECT c.id_cli, c.Nome, c.telefone, o.id_os, o.data_servico
FROM Cliente c
FULL OUTER JOIN OrdemServico o ON c.id_cli = o.id_os

--Recriacao das chaves
DELETE Mecanico
DELETE Cliente
DELETE Veiculo
DELETE Pedido




CREATE TABLE Mecanico(
id_mec INT,
Nome NVARCHAR(100),
CONSTRAINT Pk_Mecanico PRIMARY KEY (id_mec)
)

CREATE TABLE Cliente(
id_cli INT,
Nome NVARCHAR(100),
telefone VARCHAR(30),
CONSTRAINT Pk_Cliente PRIMARY KEY (id_cli)
)

CREATE TABLE Veiculo(
id_vei INT,
placa VARCHAR(20),
id_Cliente INT ,
CONSTRAINT Pk_Veiculo PRIMARY KEY (id_vei),
CONSTRAINT Fk_Do_Cliente FOREIGN KEY  (id_Cliente) REFERENCES  Cliente(id_cli)
)

CREATE TABLE OrdemServico(
id_os INT,
id_Veiculo INT FOREIGN KEY REFERENCES Veiculo(id_vei),
id_Mecanico INT FOREIGN KEY REFERENCES Mecanico(id_mec),
data_Servico DATE
CONSTRAINT Pk_os PRIMARY KEY (id_os),
CONSTRAINT Fk_Veiculo FOREIGN KEY (id_Veiculo) REFERENCES  Veiculo(id_vei),
CONSTRAINT Fk_Mecanico FOREIGN KEY (id_Mecanico) REFERENCES  Mecanico(id_mec)
)


INSERT INTO Mecanico
VALUES
(1, 'Cleber'),
(2, 'Walter'),
(3, 'Wanderson')



INSERT INTO Cliente
VALUES
(1, 'Vanderlei', '1733699695'),
(2, 'Jacobino', '1138571361'),
(3, 'Fleber', '1138571361')


INSERT INTO Veiculo 
VALUES
(1, 'MZX-9566', 1),
(2, 'IAK-7851', 2),
(3, 'IAI-0365', 3)


INSERT INTO OrdemServico 
VALUES
(1, 1, 1, '2025-09-30'),
(2, 2, 2, '2025-10-01'),
(3, 3, 3, '2025-10-07')


-- Update
SELECT * FROM Cliente

UPDATE Cliente SET telefone = '9301016698'
WHERE id_cli = 1


-- Alter
ALTER TABLE Cliente
ALTER COLUMN Nome NVARCHAR(150)


-- Add
ALTER TABLE Cliente
ADD Idade INT

UPDATE Cliente SET Idade = 30
WHERE  id_cli = 1

UPDATE Cliente SET Idade = 39
WHERE  id_cli = 2

UPDATE Cliente SET Idade = 19
WHERE  id_cli = 3


-- Renomeacao
EXEC sp_rename 'Mecanico.nome', 'IdentificaoNominal', 'COLUMN'



EXEC sp_rename 'OrdemServico', 'Pedido'
SELECT * FROM Pedido


-- Delete

DELETE Pedido
WHERE  id_Veiculo = 1


-- Drop e on delete cascade

ALTER TABLE Pedido
DROP CONSTRAINT Fk_Veiculo

ALTER TABLE Pedido
ADD CONSTRAINT Fk_Veiculo_Cliente
FOREIGN KEY (id_Veiculo) REFERENCES Veiculo(id_vei)
ON DELETE CASCADE

DELETE Veiculo
WHERE id_vei = 2


