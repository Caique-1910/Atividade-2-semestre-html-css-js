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

--11
SELECT DataPedido, DATEADD(day, 30, DataPedido ) AS DataEntregaPrevista FROM Pedido

--12
SELECT DataPedido, DATENAME(WEEKDAY, DataPedido) AS DiaSemana FROM Pedido

--Funcoes de Agregacao

--13
SELECT SUM(QuantidadeEstoque) AS EstoqueTotal FROM Produto

--14
SELECT AVG(CAST(preco AS FLOAT)) AS PrecoMedio FROM Produto

--15
SELECT MAX(preco) AS PrecoMaximo, MIN(preco) AS PrecoMinimo FROM Produto

--16
SELECT COUNT(*) AS QuantidadePedido FROM Pedido

--Consultas com GROUP BY

--17
SELECT c.nome, COUNT(*) AS PedidosRealizados FROM Pedido p
JOIN Cliente c ON c.ClienteID = p.ClienteID
GROUP BY c.Nome

--18
SELECT c.Nome, COUNT(p.QuantidadeEstoque) AS Total FROM Produto p
JOIN Categoria c ON c.CategoriaId = p.CategoriaID
GROUP BY c.Nome

--19
SELECT Nome, COUNT(*) AS NumeroProduto FROM Categoria
GROUP BY Nome

--20
SELECT sp.Nome, SUM(p.ValorTotal) AS ValorTotal FROM StatusPedido sp
JOIN Pedido p ON p.StatusID = sp.StatusId
GROUP BY sp.Nome



