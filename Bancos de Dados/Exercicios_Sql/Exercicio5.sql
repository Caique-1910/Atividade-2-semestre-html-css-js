--Exercicio 5
CREATE DATABASE Restaurante
USE Restaurante

CREATE TABLE Pedido(
IdPedido INT PRIMARY KEY,
Cliente NVARCHAR(100),
Produto NVARCHAR(100),
Quantidade INT
)

INSERT INTO Pedido(IdPedido, Cliente, Produto, Quantidade)
VALUES
(1, 'Diego', 'Camisa', 3),
(2,'Luigi', 'Celular', 1),
(3, 'Cleber', 'Computador', 5),
(4, 'Henrique', 'Cueca', 7),
(5,'Liberty', 'Meia', 2),
(6, 'Julius', 'Caixa de Energetico', 4)

SELECT * FROM Pedido
WHERE Cliente LIKE 'Diego'

SELECT * FROM Pedido
WHERE Produto LIKE 'Cueca'

SELECT Cliente, Quantidade FROM Pedido