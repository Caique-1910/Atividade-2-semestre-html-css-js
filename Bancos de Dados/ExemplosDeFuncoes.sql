USE BIBLIOTECA2
SELECT * FROM Leitor

SELECT COUNT(*) AS Qtdleitores
FROM Leitor

SELECT * FROM Emprestimo

--COUNT + GROUP BY
--(Funcao agregada precisa do group by para mais atributos)
SELECT l.nome, COUNT(e.id_emprestimo) AS QtdEmprestimo
FROM Emprestimo e
JOIN Leitor l ON l.id_Leitor = e.id_Leitor
GROUP BY l.nome

--MIN / MAX
SELECT Ano FROM Livro

SELECT MIN(Ano) AS MenorAno FROM Livro
SELECT MAX(Ano) AS MaiorAno FROM Livro



--Funcoes de Texto

--LEN

--Retorna qtde de caracteres(incluindo o espaco)
SELECT LEN('Kessia') AS TamanhoString
SELECT nome, LEN(nome) FROM Autor



--UPPER / LOWER
SELECT UPPER(nome) FROM Leitor

SELECT LOWER(nome) FROM Leitor



--LEFT / RIGHT
--Pega as letras esquerda e/ou direita

SELECT * FROM Livro

SELECT LEFT(titulo, 5) AS Primeiros5 FROM Livro
SELECT RIGHT(titulo, 5) AS Ultimos5 FROM Livro


--Replace
--Trocar caracteres
SELECT * FROM Livro

--REPLACE (nome_atribu, 'nomeinicial', 'nomefinal')
SELECT REPLACE(titulo, 'Harry', 'Hermione')
FROM Livro


--CHARINDEX
--Localizar a posicao de alguma palavra

SELECT titulo, CHARINDEX('de', titulo) AS PosicaoTexto
FROM Livro


--CONCAT
--Concatenar textos
SELECT CONCAT ('Emprestimo ', e.id_Emprestimo ,'- Leitor ', le.nome, '- Livro ',li.titulo)
FROM Emprestimo e
JOIN Leitor le ON le.id_Leitor = e.id_Leitor
JOIN Livro li ON li.id_Livro = e.id_Livro


--SUBTRIING
--Mostra o texto conforme o tamanho passado

SELECT SUBSTRING (titulo, 1, 10)
FROM Livro


--RTRIM/ LTRIM / TRIM

SELECT Nome, RTRIM(nome), LTRIM(nome), TRIM(nome)
FROM Leitor


--Funcoes de data e hora

--GETDATE
--dia e horario atual

SELECT GETDATE()

 