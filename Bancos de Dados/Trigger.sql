--Triggers

--Trigger 1: Auditoria clientes inseridos

CREATE TABLE Auditoria_Cliente(
	AuditoriaId INT IDENTITY PRIMARY KEY,
	ClienteId INT FOREIGN KEY REFERENCES Cliente(ClienteId),
	DataInsercao DATE
)
	
CREATE TRIGGER trg_AuditoriaCliente
ON Cliente --tabela que vai disparar a trigger
AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON
	INSERT INTO Auditoria_Cliente (ClienteId, DataInsercao)
	SELECT ClienteId, DATEADD(HOUR, -3, SYSUTCDATETIME())
	FROM inserted
	--armazena insert e uodate de forma temporaria
END

--Testando a trigger:

INSERT INTO Cliente(Nome, Sobrenome, Email, Telefone, DataCadastro)
VALUES 
('Carlos', 'Pereira', 'carlos@email.com', '1199999999', '2025-10-14')

SELECT * FROM Auditoria_Cliente
SELECT * FROM Cliente

--Trigger 2:Atualizar o estoque ao inserir um pedido


CREATE TRIGGER trg_AtualizarEstoque
ON DetalhesPedido
AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON
	UPDATE Produto
		SET QuantidadeEstoque = QuantidadeEstoque - i.Quantidade
		FROM Produto p
		JOIN inserted i ON p.ProdutoID = i.ProdutoID
END

--Testando Trigger
SELECT * FROM Produto
SELECT * FROM Pedido
SELECT * FROM DetalhesPedido

INSERT INTO DetalhesPedido (PedidoID, ProdutoID, Quantidade, PrecoUnitario)
VALUES
(1, 2, 3, 75.00)







--Trigger 3: Prevenir exclusao de produto com pedido

CREATE TRIGGER trg_PrevenirExclusaoProdutos
ON Produto
INSTEAD OF DELETE--ao inves de deletar
AS
BEGIN
	SET NOCOUNT ON
	IF EXISTS(
		SELECT 1
			FROM DetalhesPedido dp
			JOIN deleted d ON dp.ProdutoID = d.ProdutoID
	)
	BEGIN 
		RAISERROR('Nao e possivel excluir produto com pedidos associados', 16,1)
		--cod. de erro do usuario
	END

	DELETE FROM Produto
	WHERE ProdutoID IN (SELECT ProdutoID FROM deleted)
END

--Testando trigger
DELETE FROM Produto WHERE ProdutoId = 2 --Tem que dar erro e aparecer a mensagem


--Trigger 4: Criar log de funcionarios
CREATE TABLE Funcionarios(
	FuncionarioId INT IDENTITY PRIMARY KEY,
	Nome VARCHAR(100),
	CPF VARCHAR(14) UNIQUE
)

CREATE TABLE LogFuncionario (
	LogId INT IDENTITY PRIMARY KEY,
	FuncionarioId INT FOREIGN KEY REFERENCES Funcionarios(FuncionarioId),
	Nome VARCHAR(100),
	DataCadastro DATETIME2(0) DEFAULT DATEADD(HOUR, -3, SYSUTCDATETIME())
)


CREATE TRIGGER trg_LogFuncionario
ON Funcionarios
AFTER INSERT

AS
BEGIN
	SET NOCOUNT ON
	INSERT INTO LogFuncionario(FuncionarioId,Nome)
	SELECT FuncionarioId, Nome FROM inserted
END

SELECT * FROM Funcionarios	
SELECT * FROM LogFuncionario

INSERT INTO Funcionarios (Nome, CPF)
VALUES 
('Cleber', '12314124412')









