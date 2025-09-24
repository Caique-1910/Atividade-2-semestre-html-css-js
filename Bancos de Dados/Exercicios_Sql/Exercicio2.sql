--Exercicio 2
CREATE DATABASE Loja_Jogo
USE Loja_Jogo
CREATE TABLE Jogo(
	IdJogo INT PRIMARY KEY,
	Titulo NVARCHAR(100),
	Genero NVARCHAR(100),
	Preco FLOAT
)

INSERT INTO Jogo(IdJogo, Titulo, Genero, Preco)
VALUES
(1, 'God Of War', 'Acao', 400.0),
(2, 'Fnaf', 'Terror', 50.0),
(3, 'Elder Ring', 'Rpg', 500.0),
(4, 'Minecraft', 'Mundo Aberto', 100.0),
(5, 'Life is Stranger', 'Filme interativo', 100.0),
(6, 'Fifa', 'Esporte', 400.0)

SELECT * FROM Jogo
WHERE Genero LIKE 'A%'

SELECT * FROM Jogo
WHERE Preco > 200

SELECT Titulo, Preco FROM Jogo 