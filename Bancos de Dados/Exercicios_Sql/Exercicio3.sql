--Exercicio 3
CREATE DATABASE Biblioteca
USE Biblioteca

CREATE TABLE Livro(
 IdLivro INT PRIMARY KEY,
 Titulo NVARCHAR(100),
 Autor NVARCHAR(100),
 AnoPublicacao INT
)

INSERT INTO Livro(IdLivro, Titulo, Autor, AnoPublicacao)
VALUES
(1, 'Dom Quixote', 'Miguel de Cervantes',1612),
(2, 'Orgulho e Preconceito', 'Jane Austen', 1813),
(3, 'Memorias Postumas de Bras Cubas', 'Machado de Assis',1881),
(4, 'Cem Anos de Solidao', 'Gabriel Garcia Marquez',1967),
(5, 'A Casa dos Espiritos', 'Isabel Allende',1982)

SELECT * FROM Livro
WHERE AnoPublicacao > 2010

SELECT * FROM Livro
WHERE Autor LIKE 'Miguel de Cervantes';


SELECT Titulo FROM Livro