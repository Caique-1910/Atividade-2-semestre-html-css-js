CREATE DATABASE Pokedex
USE Pokedex

CREATE TABLE Usuario(
	UsuarioId INT IDENTITY PRIMARY KEY,
	Email VARCHAR(50) UNIQUE,
	Nome NVARCHAR(50)
)

INSERT Usuario 
VALUES
('Diego', 'diego8219@gmail.com'),
('Vladimir', 'vla@gmail.com')

CREATE TABLE Auditoria_Usuario(
	AuditoriaId INT IDENTITY PRIMARY KEY,
	UsuarioId INT FOREIGN KEY REFERENCES Usuario(UsuarioId),
	DataInsercao DATE
)

CREATE TRIGGER trg_AuditoriaUsuario
ON Usuario
AFTER INSERT
AS 
BEGIN
	SET NOCOUNT ON
	INSERT INTO Auditoria_Usuario ( UsuarioId, DataInsercao)
	SELECT UsuarioId, SYSUTCDATETIME()
	FROM inserted

END

INSERT INTO Usuario (Email, Nome)
VALUES
('spiderandersonsilva@gmail.com','Anderson')

SELECT * FROM Auditoria_Usuario



CREATE TABLE LogUsuario (
	LogId INT IDENTITY PRIMARY KEY,
	UsuarioId INT FOREIGN KEY REFERENCES Usuario(UsuarioId),
	Nome NVARCHAR(50),
	DataCastro DATETIME2(0)
)

CREATE TRIGGER trg_LogUsuario
ON Usuario
AFTER INSERT

AS
BEGIN
	SET NOCOUNT ON
	INSERT INTO LogUsuario(UsuarioId, Nome)
	SELECT UsuarioId, Nome FROM inserted
END

INSERT INTO Usuario(Email, Nome)
VALUES
('cleberson@gmail.com', 'Cleberson')

SELECT * FROM LogUsuario

CREATE TABLE Pokemon(
	PokemonId INT IDENTITY PRIMARY KEY,
	Nome VARCHAR(50),
	Tipo VARCHAR(50),
	Tipo2 VARCHAR(50)
)


INSERT INTO Pokemon
VALUES
('Pikachu', 'Eletrico', ''),
('Rayquaza', 'Voador', 'Dragao')



CREATE PROCEDURE sp_InserirPokemon
	@Nome VARCHAR(50),
	@Tipo VARCHAR(50),
	@Tipo2 VARCHAR(50)
	@UsuarioID INT


AS
BEGIN
	SET NOCOUNT ON
	INSERT INTO Pokemon(Nome, Tipo, Tipo2)
	VALUES (@Nome, @Tipo, @Tipo2)

END

EXEC sp_InserirPokemon 'Greninja', 'Water', 'Dark' , 2

SELECT * FROM Pokemon

ALTER TABLE Pokemon ADD
UsuarioID INT FOREIGN KEY REFERENCES Usuario(UsuarioId)

SELECT * FROM Pokemon










