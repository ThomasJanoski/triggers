DROP TABLE IF EXISTS Filmes;
CREATE TABLE Filmes (
	ID INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(60),
    minutos INT
);

DELIMITER $
CREATE TRIGGER checarMinutos
	BEFORE INSERT ON Filmes
	FOR EACH ROW
	BEGIN
		IF NEW.minutos <= 0 THEN
			SET NEW.minutos = NULL;
		END IF;
	END $
DELIMITER ;

INSERT INTO Filmes (titulo, minutos) VALUES
('The terrible trigger', 120),
('O alto da compadecida', 135),
('Faroeste Caboclo', 240),
('The matrix', 90),
('Blade Runner', -88),
('O labirinto do fauno', 110),
('Metrópole', 0),
('A lista', 120);

SELECT * FROM Filmes;

DROP TABLE IF EXISTS LogDeletions;
CREATE TABLE LogDeletions (
	ID INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(60),
    deleteData DATETIME,
    deleteUser VARCHAR(40)
);

DELIMITER $
CREATE TRIGGER criarLogDeletions AFTER DELETE 
ON Filmes
FOR EACH ROW
BEGIN
	INSERT INTO LogDeletions (titulo, deleteData, deleteUser) VALUES (OLD.titulo, SYSDATE(), USER());
END $
DELIMITER ;

DELETE FROM Filmes WHERE ID = 2;
DELETE FROM Filmes WHERE ID = 4;

SELECT * FROM LogDeletions;

SELECT * FROM Filmes;