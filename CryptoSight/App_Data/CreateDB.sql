DROP TABLE IF EXISTS Transactions;
DROP TABLE IF EXISTS Users;

CREATE TABLE Users(
	ID INT NOT NULL PRIMARY KEY,
	Username NVARCHAR(100) NOT NULL,
	Pass NVARCHAR(100) NOT NULL
);

CREATE TABLE Transactions(
	ID NVARCHAR(5) NOT NULL PRIMARY KEY,
	UserID INT NOT NULL,
	Crypto NVARCHAR(100) NOT NULL,
	CryptoName NVARCHAR(100) NOT NULL,
	Holding FLOAT NOT NULL,
	FOREIGN KEY (UserID) REFERENCES Users(ID)
);

INSERT INTO Users(ID, Username, Pass) VALUES
	(0001, 'Lazaro', '123'),
	(0002, 'Cortez', '123'),
	(0003, 'Talampas', '123'),
	(0004, 'Kamachi', '123')
INSERT INTO Transactions(ID, UserID, Crypto, CryptoName, Holding) VALUES
	('T0001', 0001, 'DCC', 'Default Crypto Company', 0),
	('T0002', 0002, 'SHQ', 'SHAWALA', 0),
	('T0003', 0003, 'DCC2', 'Default Crypto Company2', 0),
	('T0004', 0004, 'DCC3', 'Default Crypto Company3', 0);