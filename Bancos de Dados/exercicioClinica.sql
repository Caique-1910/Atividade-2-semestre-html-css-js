--DDL
-- APAGAR BASE DE DADOS CASO EXISTA
--DROP DATABASE CLINICAMEDICA


-- CRIAR BASE DE DADOS
CREATE DATABASE Clinica_Medica
GO

USE Clinica_Medica
GO

--TABELA PACIENTE
CREATE TABLE Paciente(
	CPF VARCHAR(14) PRIMARY KEY,
	Nome VARCHAR(40),
	Telefone VARCHAR(30),
	NumeroPlano INT,
	NomePlano VARCHAR(20),
	TipoPlano VARCHAR(10)
)
GO

--TABELA MEDICO
CREATE TABLE Medico (
 CRM INT PRIMARY KEY,
 NomeMedico VARCHAR(30),
 Especialidade VARCHAR(20)
)
GO

--TABELA CONSULTA
CREATE TABLE Consulta(
NumeroConsulta INT PRIMARY KEY IDENTITY(100,1) ,  --INCREMENTA O VALOR INICIAL
DataConsulta DATE ,
HorarioConsulta TIME,
CRM_Medico INT FOREIGN KEY REFERENCES Medico(CRM),
CPF_Paciente VARCHAR(14) FOREIGN KEY REFERENCES Paciente(CPF)
)
GO

SELECT * FROM Paciente
SELECT * FROM Medico
SELECT * FROM Consulta

--1
INSERT INTO Paciente(CPF, Nome, Telefone, NumeroPlano, NomePlano, TipoPlano)
VALUES
(67016690504, 'Danilo', '13979971768', '1', 'Bradesco Saude','Premium'),
(25931315195, 'Leide', '16995897237', '2', 'Prevent Senior','Premium'),
(57069649207, 'Camilo', '13979711011', '3', 'Porto Seguro Saude','Classico'),
(93797319304, 'Jamil', '17991308285', '4', 'Blue Saude','Empresa'),
(43910669808, 'Denner', '15969882887', '5', 'Unimed','Classico'),
(26099551972, 'Oruam', '14999014828', '6', 'Hapvida','Bucal')


--2
INSERT INTO Medico (CRM, NomeMedico, Especialidade)
VALUES
(123456, 'Roger', 'Cardiologia'),
(654321, 'Cleber', 'Dermatologia'),
(897632, 'Lundy', 'Radioterapia'),
(093243, 'Dexter', 'Oftamologia'),
(345678, 'Robert', 'Otorrinolaringologia')

--3
SET IDENTITY_INSERT Consulta ON

INSERT INTO Consulta(NumeroConsulta, DataConsulta, HorarioConsulta, CRM_Medico, CPF_Paciente)
VALUES
(1, '2025-09-27', '9:30:00',  123456, 67016690504),
(2, '2025-09-28', '10:00:00', 654321, 25931315195),
(3, '2025-09-29', '12:30:00', 897632, 57069649207),
(4, '2025-10-01', '7:30:00', 093243,  93797319304),
(5, '2025-10-09', '6:00:00', 345678, 43910669808),
(6, '2025-10-28', '9:15:00', 345678, 26099551972)

SET IDENTITY_INSERT Consulta OFF

--4
SELECT * FROM Paciente

--5
SELECT NomeMedico, Especialidade FROM Medico


--6
--INNER JOIN
SELECT c.NumeroConsulta, c.DataConsulta,
c.HorarioConsulta, p.Nome, m.NomeMedico
FROM Consulta c
INNER JOIN Paciente p ON c.CPF_Paciente = p.CPF
INNER JOIN Medico m ON c.CRM_Medico = m.CRM


--Left Join
SELECT p.Nome, c.DataConsulta, m.NomeMedico FROM Consulta c
LEFT JOIN Paciente p ON p.CPF = c.CPF_Paciente
LEFT JOIN Medico m ON c.CRM_Medico = m.CRM

--Right join
SELECT Medico.NomeMedico, Medico.Especialidade, Consulta.DataConsulta, Paciente.Nome FROM Consulta 
RIGHT JOIN Medico  ON Consulta.CRM_Medico = Medico.CRM
LEFT JOIN Paciente ON Consulta.CPF_Paciente = Paciente.CPF


--7
SELECT CPF FROM Paciente

--8
SELECT CRM_Medico FROM Consulta

--9
UPDATE Paciente
SET NumeroPlano = 7
WHERE CPF = 67016690504


UPDATE Paciente
SET NumeroPlano = 8
WHERE CPF = 25931315195


UPDATE Paciente
SET NumeroPlano = 9
WHERE CPF = 57069649207


--10
DELETE FROM Consulta
WHERE CPF_Paciente =  26099551972

DELETE FROM Consulta
WHERE CPF_Paciente =  93797319304

DELETE FROM Paciente
WHERE CPF = 26099551972

DELETE FROM Paciente
WHERE CPF = 93797319304






--11
INSERT INTO Medico(CRM, NomeMedico, Especialidade)
VALUES
(883355, 'Bane', 'Pediatria'),
(774433, 'Irineu', 'Psiquiatria'),
(996633, 'Eduardo', 'Ortopedia')


INSERT INTO Paciente(CPF, Nome, Telefone, NumeroPlano, NomePlano, TipoPlano)
VALUES
(29165059972, 'Jake', '1532127608', '10', 'Blue Saude','Empresa'),
(84948577626, 'Ribama', '1324992473', '11', 'Unimed','Classico'),
(08235211769, 'Mauro', '1626474697', '12', 'Hapvida','Bucal')


--12
UPDATE Medico
SET Especialidade = 'Ginecologia'
WHERE CRM = 123456


UPDATE Medico
SET Especialidade = 'Urologia'
WHERE CRM = 654321