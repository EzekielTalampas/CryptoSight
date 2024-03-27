DROP TABLE IF EXISTS Transactions;
DROP TABLE IF EXISTS Users;

CREATE TABLE Users(
	Username NVARCHAR(100) NOT NULL PRIMARY KEY,
	Pass NVARCHAR(100) NOT NULL
);

CREATE TABLE Transactions(
	Username NVARCHAR(100) NOT NULL PRIMARY KEY,
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