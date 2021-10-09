USE NorthwindDW
GO

-- Drop constraints

ALTER TABLE [STG].[EmployeeTerritories]
DROP CONSTRAINT FK_EmployeeTerritories_Employees
GO

ALTER TABLE [STG].[EmployeeTerritories]
DROP CONSTRAINT FK_EmployeeTerritories_Territories
GO

ALTER TABLE [STG].[Territories]
DROP CONSTRAINT FK_Territories_Region
GO

ALTER TABLE [STG].[Order Details]
DROP CONSTRAINT FK_Order_Details_Orders
GO

ALTER TABLE [STG].[Order Details]
DROP CONSTRAINT FK_Order_Details_Products
GO

ALTER TABLE [STG].[Orders]
DROP CONSTRAINT FK_Orders_Shippers
GO

ALTER TABLE [STG].[Orders]
DROP CONSTRAINT FK_Orders_Employees
GO

ALTER TABLE [STG].[Orders]
DROP CONSTRAINT FK_Orders_Customers
GO

ALTER TABLE [STG].[Employees]
DROP CONSTRAINT FK_Employees_Employees
GO

ALTER TABLE [STG].[Products]
DROP CONSTRAINT FK_Products_Categories
GO

ALTER TABLE [STG].[Products]
DROP CONSTRAINT FK_Products_Suppliers
GO

-- Truncate tables

TRUNCATE TABLE [STG].[EmployeeTerritories]
GO

TRUNCATE TABLE [STG].[Territories]
GO

TRUNCATE TABLE [STG].[Region]
GO

TRUNCATE TABLE [STG].[Order Details]
GO

TRUNCATE TABLE [STG].[Orders]
GO

TRUNCATE TABLE [STG].[Customers]
GO

TRUNCATE TABLE [STG].[Shippers]
GO

TRUNCATE TABLE [STG].[Employees]
GO

TRUNCATE TABLE [STG].[Products]
GO

TRUNCATE TABLE [STG].[Categories]
GO

TRUNCATE TABLE [STG].[Suppliers];
GO

-- Recreate constraints

ALTER TABLE [STG].EmployeeTerritories
	ADD CONSTRAINT [FK_EmployeeTerritories_Employees] FOREIGN KEY 
	(
		[EmployeeID]
	) REFERENCES [STG].[Employees] (
		[EmployeeID]
	)
GO

ALTER TABLE [STG].EmployeeTerritories	
	ADD CONSTRAINT [FK_EmployeeTerritories_Territories] FOREIGN KEY 
	(
		[TerritoryID]
	) REFERENCES [STG].[Territories] (
		[TerritoryID]
	)
GO

ALTER TABLE [STG].Territories
	ADD CONSTRAINT [FK_Territories_Region] FOREIGN KEY 
	(
		[RegionID]
	) REFERENCES [STG].[Region] (
		[RegionID]
	)
GO

ALTER TABLE [STG].[Order Details]
	ADD CONSTRAINT "FK_Order_Details_Orders" FOREIGN KEY 
	(
		"OrderID"
	) REFERENCES [STG]."Orders" (
		"OrderID"
	)
GO

ALTER TABLE [STG].[Order Details]
	ADD CONSTRAINT "FK_Order_Details_Products" FOREIGN KEY 
	(
		"ProductID"
	) REFERENCES [STG]."Products" (
		"ProductID"
	)
GO

ALTER TABLE [STG].[Orders]
	ADD CONSTRAINT "FK_Orders_Customers" FOREIGN KEY 
	(
		"CustomerID"
	) REFERENCES [STG]."Customers" (
		"CustomerID"
	)
GO

ALTER TABLE [STG].[Orders]
	ADD CONSTRAINT "FK_Orders_Employees" FOREIGN KEY 
	(
		"EmployeeID"
	) REFERENCES [STG]."Employees" (
		"EmployeeID"
	)
GO

ALTER TABLE [STG].[Orders]
	ADD CONSTRAINT "FK_Orders_Shippers" FOREIGN KEY 
	(
		"ShipVia"
	) REFERENCES [STG]."Shippers" (
		"ShipperID"
	)
GO

ALTER TABLE [STG].[Employees]
	ADD CONSTRAINT "FK_Employees_Employees" FOREIGN KEY 
	(
		"ReportsTo"
	) REFERENCES [STG]."Employees" (
		"EmployeeID"
	)
GO

ALTER TABLE [STG].[Products]
	ADD CONSTRAINT "FK_Products_Categories" FOREIGN KEY 
	(
		"CategoryID"
	) REFERENCES [STG]."Categories" (
		"CategoryID"
	)
GO

ALTER TABLE [STG].[Products]
	ADD CONSTRAINT "FK_Products_Suppliers" FOREIGN KEY 
	(
		"SupplierID"
	) REFERENCES [STG]."Suppliers" (
		"SupplierID"
	);