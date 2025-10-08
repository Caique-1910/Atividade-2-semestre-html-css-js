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

SELECT SYSDATETIMEOFFSET()
AT TIME ZONE 'E. South America Standard Time'


--DATEADD
--Adiciona um tempo a mais dentro de uma data
--YEAR: ano, MONTH: mes, DAY: dia, WEEK: semana

SELECT id_Emprestimo, data_emprestimo,
DATEADD(YEAR, 7, data_emprestimo) AS PrevisaoDevolucao
FROM Emprestimo

--Diminuir o tempo
SELECT id_Emprestimo, data_emprestimo,
DATEADD(YEAR, -1, data_emprestimo) AS PrevisaoDevolucao
FROM Emprestimo


--DATEDIFF: diferenca de datas
SELECT id_emprestimo, data_emprestimo, data_devolucao,
DATEDIFF(DAY, data_emprestimo, ISNULL(data_devolucao, GETDATE()))
AS DiasComLivro
FROM Emprestimo

--se data_devolucao estiver vazia, ele acrescenta o GETDATE para inserir a data anual e comparar com a data emprestimo.

--FORMAT: formatar datas

SELECT
FORMAT(data_emprestimo, 'dd/MM/yyyy') AS Emprestimo,
FORMAT(data_devolucao, 'dd/MM/yyyy') AS Devolucao
FROM Emprestimo
 
 --Extrair ano, mes e dia de uma data
 SELECT data_emprestimo,
 YEAR(data_emprestimo) AS Ano,
 MONTH(data_emprestimo) AS Mes,
 DAY(data_emprestimo) AS Dia
 FROM Emprestimo

SET LANGUAGE Portuguese
 --DATEPART / DATENAME
SELECT  DATEPART(YEAR, data_emprestimo) AS Ano,
		DATEPART(WEEKDAY, data_emprestimo) AS DiaSemana,
		DATENAME(WEEKDAY, data_emprestimo) AS NomeDiaSemana,
		DATENAME(MONTH, data_emprestimo) AS NomeMes
FROM Emprestimo


--Operadores de comparacao 

--(igualdade) =

SELECT titulo, ano
FROM Livro
WHERE ano = 2000


--(diferente) NOT LIKE e quando e matematico pode utilizar != ou <>

SELECT nome, email
FROM Leitor
WHERE email NOT LIKE 'kes%'

SELECT titulo, ano
FROM Livro
WHERE ano != 2000

SELECT titulo, ano
FROM Livro
WHERE ano <> 2000


--(maior que) >

SELECT titulo, ano
FROM Livro
WHERE ano > 1900

--(menor que) <

SELECT titulo, ano
FROM Livro
WHERE ano < 1900


-- (maior ou igual) >=

SELECT id_emprestimo, data_emprestimo
FROM Emprestimo
WHERE data_emprestimo >= '2025-09-01'


--(menor ou igual) <=

SELECT id_emprestimo, data_emprestimo
FROM Emprestimo
WHERE data_emprestimo <= '2025-08-31'

--Operadores logicos

--AND(e)
SELECT emprestimo.id_emprestimo, leitor.nome,
emprestimo.data_emprestimo, emprestimo.data_devolucao
FROM Emprestimo
JOIN Leitor ON leitor.id_Leitor = Emprestimo.id_Leitor
WHERE MONTH(emprestimo.data_emprestimo) = 9
AND YEAR(emprestimo.data_emprestimo) = 2025

--duas condicoes precisam ser verdadeiras


--OR(ou)

SELECT l.titulo, l.ano, a.nome
FROM Livro l
JOIN Autor a ON a.id_Autor = l.id_Autor
WHERE a.nome = 'Machado de Assis' 
OR
a.nome = 'Clarice Lispector'

--uma condicao sendo verdadeira retorna

--NOT(negacao)

SELECT l.titulo, l.ano, a.nome
FROM Livro l
JOIN Autor a ON a.id_Autor = l.id_Autor
WHERE NOT a.nome = 'Shakespeare'


--Operadores especiais

--BETWEEN (entre)

SELECT titulo, ano 
FROM Livro
WHERE ano BETWEEN 1800 AND 2000

--IN (verifica uma lista de valores)

SELECT * FROM Autor
WHERE nome IN ('Machado de Assis', 'Shakespeare')


--LIKE

SELECT titulo
FROM Livro
WHERE titulo LIKE '%o'

--porcentagem antes da letra - existe letra antes daquela letra
--porcentagem depois da letra - existe letras depois daquela letra
--porcentagem no meio - ambas


--IS NULL

--Registros vazios

SELECT id_Emprestimo, id_livro, data_emprestimo
FROM Emprestimo
WHERE data_devolucao IS NULL

-- IS NOT NULL

SELECT id_Emprestimo, id_livro, data_emprestimo
FROM Emprestimo
WHERE data_devolucao IS NOT NULL



