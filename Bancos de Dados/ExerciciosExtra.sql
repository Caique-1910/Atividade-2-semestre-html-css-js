--Exercicios extra
USE VendasOnline

--Funcoes de Texto

--1
SELECT CONCAT(nome, sobrenome) AS NomeCompleto
FROM Cliente

--2
SELECT UPPER(NomeProduto) AS NomeMaiusculo FROM Produto

--3
SELECT LEFT(nome, 3) FROM Cliente

--4
SELECT nome, CHARINDEX('@', email) AS PosicaoArroba FROM Cliente

--Funcoes numericas

--5
SELECT preco, preco * (1-0.15) AS PrecoComDesconto FROM Produto

--6
SELECT preco, ROUND(preco, 2) AS PrecoArredondado FROM Produto 

--7
SELECT Preco, ABS(Preco - pf.PrecoFornecimento) AS ValorAbsoluto  FROM Produto
JOIN ProdutoFornecedor pf ON pf.ProdutoID = Produto.ProdutoID

--8
SELECT Preco, Preco*Preco AS PrecoAoQuadrado FROM Produto

--Funcoes de Data e Hora

--9
SELECT YEAR(DataPedido) AS Ano, MONTH(DataPedido) AS Mes FROM Pedido

--10
SELECT nome, DataCadastro, DATEDIFF(YY, DataCadastro  , GETDATE()) AS AnosCadastrados FROM Cliente
