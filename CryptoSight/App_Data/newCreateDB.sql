DROP TABLE IF EXISTS Transactions;
DROP TABLE IF EXISTS Users;

CREATE TABLE Users(
	Username NVARCHAR(100) NOT NULL PRIMARY KEY,
	Pass NVARCHAR(100) NOT NULL
);

CREATE TABLE Transactions(
	ID NVARCHAR(5) NOT NULL PRIMARY KEY,
	Username NVARCHAR(100) NOT NULL,
	Crypto NVARCHAR(100) NOT NULL,
	CryptoName NVARCHAR(100) NOT NULL,
	Holding FLOAT NOT NULL,
	FOREIGN KEY (Username) REFERENCES Users(Username)
);

INSERT INTO Users(Username, Pass) VALUES
	('Lazaro', '123'),
	('Cortez', '123'),
	('Talampas', '123'),
	('Kamachi', '123')
INSERT INTO Transactions(ID, Username, Crypto, CryptoName, Holding) VALUES
	('T0001', 'Lazaro', 'DCC', 'Default Crypto Company', 0),
	('T0002', 'Cortez', 'SHQ', 'SHAWALA', 0),
	('T0003', 'Talampas', 'DCC2', 'Default Crypto Company2', 0),
	('T0004', 'Kamachi', 'DCC3', 'Default Crypto Company3', 0);