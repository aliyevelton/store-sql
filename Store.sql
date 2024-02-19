CREATE DATABASE Store
USE Store

CREATE TABLE Categories (
	Id int primary key identity,
	Name nvarchar(50) unique
)

CREATE TABLE Products (
	Id int primary key identity,
	ProductCode nvarchar(20) unique,
	CategoryId int,
	FOREIGN KEY (CategoryId) REFERENCES Categories(Id)
)

CREATE TABLE Stock (
	Id int primary key identity,
	ProductId int unique, --casib burada unique vermisem deye elave ede bilmedim birden cox product
	CreatedDate date default current_timestamp,
	[Count] int,
	FOREIGN KEY (ProductId) REFERENCES Products(Id)
)

CREATE TABLE Sizes (
	ID INT PRIMARY KEY IDENTITY,
	Letter varchar(10),
	[Min] varchar,
	[Max] varchar
)





INSERT INTO Products (Id, ProductCode, CategoryId)
VALUES (2, 123456, 1),
	(3, 142455, 2),
	(4, 186391, 3),
	(5, 193902, 4);

CREATE VIEW ProductStock AS
SELECT p.ProductCode AS [Product Code],
	c.Name AS [Category Name],
	s.CreatedDate AS [Created date],
	s.Count,
	s.Size
FROM Products p
JOIN Stock s on p.Id = s.ProductId
JOIN Categories c on p.CategoryId = c.Id

SELECT * FROM ProductStock

SELECT * FROM ProductStock
WHERE Size = 'M';

SELECT [Category Name],COUNT(*) AS Total
FROM ProductStock
Group by [Category Name]

SELECT * FROM Products
WHERE CategoryId = 2


SELECT * FROM ProductStock
WHERE [Count] > (SELECT AVG([Count]) FROM ProductStock)