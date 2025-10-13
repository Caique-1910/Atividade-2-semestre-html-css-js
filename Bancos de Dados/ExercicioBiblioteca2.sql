USE BIBLIOTECA2
--EXERCICIOS

--FUNCOES AGREGADAS
--1
SELECT COUNT(*) AS QuantidadeLivros FROM Livro

--2
SELECT AVG(CAST(ano AS FLOAT)) AS AnoMedio FROM Livro


--3
SELECT l.nome, COUNT (e.data_emprestimo) AS TotalEmprestimos
FROM Leitor l
JOIN Emprestimo e ON l.id_Leitor = e.id_Leitor
GROUP BY l.nome
ORDER BY TotalEmprestimos DESC


--Funcoes de texto

--1
SELECT LEFT(nome, 3) AS Primeiros3 FROM Autor


--2
SELECT LOWER(titulo)AS TituloMinusculo FROM Livro

--3
SELECT email FROM  Leitor
WHERE email LIKE '%.com'

--4
SELECT REPLACE (titulo, 'estrela', 'sol')  FROM Livro

--Funcoes de Data e hora

--1
SELECT * FROM Emprestimo
WHERE MONTH(data_emprestimo) = 8
AND YEAR(data_emprestimo) = 2025

--2
SELECT DATEDIFF(DAY, data_emprestimo, GETDATE())
AS DiasDesdeOPrimeiroEmprestimo
FROM Emprestimo

--3
SET LANGUAGE Portuguese
SELECT data_emprestimo , DATENAME(WEEKDAY,data_emprestimo) AS DiaDaSemana
FROM Emprestimo

--Operadores de comparacao e logicos

--1
SELECT l.titulo, l.id_Autor FROM Livro l
JOIN Autor a ON a.id_Autor = l.id_Autor
WHERE ano BETWEEN 1950 AND 2005
AND NOT a.nome = 'J. K. Rowling'



--2
SELECT nome FROM Leitor
WHERE nome LIKE 'C%'

--3
SELECT data_devolucao FROM Emprestimo
WHERE data_devolucao > GETDATE()

--4
SELECT a.nome FROM Autor a
LEFT JOIN Livro l ON a.id_Autor = l.id_Autor
WHERE l.id_Autor IS NULL