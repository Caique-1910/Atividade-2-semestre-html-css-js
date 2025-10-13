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