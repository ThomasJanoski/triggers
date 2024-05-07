DROP TABLE IF EXISTS Pedidos;
CREATE TABLE Pedidos(
	ID INT PRIMARY KEY AUTO_INCREMENT,
    dataPedido DATE,
    nomeCliente VARCHAR(100)
);

INSERT INTO Pedidos(dataPedido, nomeCliente) VALUES
(NOW(), '1º Cliente'),
(NOW(), '2º Cliente'),
(NOW(), '3º Cliente');

SELECT * FROM Pedidos;

DELIMITER $
CREATE TRIGGER criacaoPedido BEFORE INSERT 
ON Pedidos
FOR EACH ROW
BEGIN
	SET NEW.dataPedido = NOW();
END $
DELIMITER ;

INSERT INTO Pedidos(nomeCliente) VALUES
('4º Cliente'),
('5º Cliente'),
('6º Cliente');

SELECT * FROM Pedidos;