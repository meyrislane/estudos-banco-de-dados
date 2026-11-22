-- Diagnóstico Semana 1 — 22/11/2026
-- Legenda: S = sozinha | C = precisei consultar | N = não consegui
USE AdventureWorks2025;

-- 1. Nome e sobrenome de 20 pessoas (Person.Person)  [c]
SELECT TOP 20 FirstName, LastName
FROM Person.Person

-- 2. Produtos com preço de tabela acima de 1000, do mais caro para o mais barato (Production.Product)  [s]
SELECT Name, ListPrice
FROM Production.Product 
Where ListPrice > 1000
ORDER BY ListPrice DESC


-- 3. Produtos sem cor cadastrada  [S]
SELECT Name
FROM Production.Product
Where Color is NULL

-- 4. Quantos produtos existem por cor  [s]
SELECT Count(Name), Color
From Production.Product
Group By Color

-- 5. Pedidos feitos em 2013 (Sales.SalesOrderHeader)  [c - refeita com ajuda]
SELECT SalesOrderID, OrderDate
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2025;

-- 6. Total vendido (TotalDue) em cada ano  [c - refeita com ajuda]
SELECT SUM(TotalDue) AS TotalVendido, YEAR(OrderDate) as Ano
FROM Sales.SalesOrderHeader
GROUP BY YEAR(OrderDate)


-- 7. Nome de cada produto ao lado do nome da sua subcategoria (Production.ProductSubcategory)  [s]
SELECT name, ProductSubcategoryID
FROM Production.ProductSubcategory

-- 8. Produtos que nunca foram vendidos (Sales.SalesOrderDetail)  [s]
SELECT ProductID, OrderQty
FROM Sales.SalesOrderDetail
WHERE OrderQty IS NULL


-- 9. Os 5 clientes que mais gastaram, com nome e sobrenome (Sales.Customer liga pedidos a Person.Person)  [ ]
SELECT TOP 5 PersonID
FROM Sales.Customer
WHERE PersonID = BusinessEntityID

-- 10. Para cada pedido, o valor e, ao lado, a média de todos os pedidos  [ ]
SELECT ProductID, Name, ListPrice
FROM Production.Product
GROUP BY AVG(name)