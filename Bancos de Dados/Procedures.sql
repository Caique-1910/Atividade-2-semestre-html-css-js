--Procedures
USE VendasOnline
--Procedure 1: InserirCliente

CREATE PROCEDURE InserirCliente
@Nome VARCHAR(50),
@Sobrenome VARCHAR(50),
@Email VARCHAR(100),
@Telefone VARCHAR(20),
@DataCadastro DATE

AS 
BEGIN
    SET NOCOUNT ON; -- nao mostra informacao de linhas afeatadas
    INSERT INTO Cliente(Nome, Sobrenome, Email, Telefone, DataCadastro)
    VALUEs(@Nome, @Sobrenome, @Email, @Telefone, @DataCadastro)
END

--TESTANDO
EXEC InserirCliente 
'Ana', 'Carolina', 'anaCarol@email.com','1199999999', '2025-10-13'





--Procedure 2: Inserir Pedido
CREATE PROCEDURE InserirPedido
 @ClienteId INT ,
 @DataPedido DATE,
 @ValorTotal DECIMAL(10, 2),
 @StatusId INT

 AS
 BEGIN
    SET NOCOUNT ON
    INSERT INTO Pedido (ClienteId, DataPedido, ValorTotal, StatusId)
    VALUES (@ClienteID, @DataPedido, @ValorTotal, @StatusId)
 END

 EXEC InserirPedido 
 2, '2025-10-13', 250.00, 1;

 SELECT * FROM Pedido


 --Procedure 3:
 CREATE Procedure AtualizarPrecoProduto
 @ProdutoId INT,
 @PercentualAumento DECIMAL(10, 2)


 AS
 BEGIN
    SET NOCOUNT ON
    UPDATE Produto
        SET Preco = Preco * (1 + @PercentualAumento / 100.00)
        WHERE ProdutoId = @ProdutoId
END

--TESTANDo
SELECT * FROM Produto 
EXEC AtualizarPrecoProduto 2, 10
SELECT * FROM Produto


--Procedure 4: Total de vendas por cliente (saida)

CREATE PROCEDURE ObterTotalVendas
    @ClienteId INT,
    @TotalVendas DECIMAL(10,2) OUTPUT

AS
BEGIN
    SET NOCOUNT ON
    SELECT @TotalVendas = COALESCE(SUM(ValorTotal),0)
    --substitui valores nulos por 0
    FROM Pedido
    WHERE ClienteId = @ClienteId
END

DROP PROCEDURE ObterTotalVendas

--Testando Procedures
DECLARE @Total DECIMAL (10,2)
EXEC ObterTotalVendas 1, @Total OUTPUT
SELECT @Total AS TotalDeVendas

SELECT * FROM Pedido
WHERE ClienteId = 1


--Procedure 5:Relatorio de vendas por cliente

CREATE PROCEDURE VendasPorCliente

@DataLimite DATE
AS
BEGIN
    SET NOCOUNT ON
    SELECT c.ClienteId, c.nome,
    SUM(d.Quantidade * d.PrecoUnitario) AS totalGasto
    FROM Cliente c
    JOIN Pedido p ON p.ClienteID = c.ClienteID
    JOIN DetalhesPedido d ON d.PedidoID = p.PedidoID
    WHERE p.DataPedido < @DataLimite
    GROUP BY c.ClienteID, c.Nome
END

--Testando Proedure
INSERT INTO DetalhesPedido (PedidoID, ProdutoID, Quantidade, PrecoUnitario)
VALUES
(2, 1, 1, 4500.00)

SELECT * FROM Pedido

EXEC VendasPorCliente '2025-10-14'



--Procedure 6: Historico de preco de tabela propria

CREATE TABLE HistoricoPrecos(
    HistoricoId INT IDENTITY PRIMARY KEY,
    ProdutoId INT FOREIGN KEY REFERENCES Produto(ProdutoId),
    PrecoAntigo DECIMAL(10,2),
    PrecoNovo DECIMAL(10,2),
    DataModificacao DATE
)

CREATE PROCEDURE AtualizarPrecoProdutoComHistorico
@ProdutoId INT,
@NovoPreco DECIMAL(10,2)

AS
BEGIN
    SET NOCOUNT ON
    DECLARE @PrecoAntigo DECIMAL (10,2)

    SELECT @PrecoAntigo = Preco
    FROM Produto
    WHERE ProdutoId = @ProdutoId
    
    UPDATE Produto SET Preco = @NovoPreco
    WHERE ProdutoId = @ProdutoId

    INSERT INTO HistoricoPrecos(ProdutoId, PrecoAntigo, PrecoNovo, DataModificacao)
    VALUES(@ProdutoId, @PrecoAntigo, @NovoPreco, DATEADD(HOUR, -3, SYSUTCDATETIME()))
END


--Testando a Procedure

EXEC AtualizarPrecoProdutoComHistorico 2, 75.00

SELECT * FROM Produto

SELECT * FROM HistoricoPrecos






