/*
** Creates the STG schema and the necessary tables for extraction
*/

USE NorthwindDW
GO

CREATE SCHEMA STG
GO

CREATE TABLE [STG]."Employees" (
	"EmployeeID" nvarchar(30) NOT NULL ,
	"LastName" nvarchar (20) NOT NULL ,
	"FirstName" nvarchar (10) NOT NULL ,
	"Title" nvarchar (30) NULL ,
	"TitleOfCourtesy" nvarchar (25) NULL ,
	"BirthDate" nvarchar(30) NULL ,
	"HireDate" nvarchar(30) NULL ,
	"Address" nvarchar (60) NULL ,
	"City" nvarchar (15) NULL ,
	"Region" nvarchar (15) NULL ,
	"PostalCode" nvarchar (10) NULL ,
	"Country" nvarchar (15) NULL ,
	"HomePhone" nvarchar (24) NULL ,
	"Extension" nvarchar (4) NULL ,
	"Photo" nvarchar(30) NULL ,
	"Notes" nvarchar(30) NULL ,
	"ReportsTo" nvarchar(30) NULL ,
	"PhotoPath" nvarchar (255) NULL ,
	CONSTRAINT "PK_Employees" PRIMARY KEY  CLUSTERED 
	(
		"EmployeeID"
	),
	CONSTRAINT "FK_Employees_Employees" FOREIGN KEY 
	(
		"ReportsTo"
	) REFERENCES [STG]."Employees" (
		"EmployeeID"
	),
)
GO

CREATE TABLE [STG]."Categories" (
	"CategoryID" nvarchar(30) NOT NULL ,
	"CategoryName" nvarchar (15) NOT NULL ,
	"Description" nvarchar(30) NULL ,
	"Picture" nvarchar(30) NULL ,
	CONSTRAINT "PK_Categories" PRIMARY KEY  CLUSTERED 
	(
		"CategoryID"
	)
)
GO

CREATE TABLE [STG]."Customers" (
	"CustomerID" nvarchar(5) NOT NULL ,
	"CompanyName" nvarchar (40) NOT NULL ,
	"ContactName" nvarchar (30) NULL ,
	"ContactTitle" nvarchar (30) NULL ,
	"Address" nvarchar (60) NULL ,
	"City" nvarchar (15) NULL ,
	"Region" nvarchar (15) NULL ,
	"PostalCode" nvarchar (10) NULL ,
	"Country" nvarchar (15) NULL ,
	"Phone" nvarchar (24) NULL ,
	"Fax" nvarchar (24) NULL ,
	CONSTRAINT "PK_Customers" PRIMARY KEY  CLUSTERED 
	(
		"CustomerID"
	)
)
GO

CREATE TABLE [STG]."Shippers" (
	"ShipperID" nvarchar(30) NOT NULL ,
	"CompanyName" nvarchar (40) NOT NULL ,
	"Phone" nvarchar (24) NULL ,
	CONSTRAINT "PK_Shippers" PRIMARY KEY  CLUSTERED 
	(
		"ShipperID"
	)
)
GO

CREATE TABLE [STG]."Suppliers" (
	"SupplierID" nvarchar(30) NOT NULL ,
	"CompanyName" nvarchar (40) NOT NULL ,
	"ContactName" nvarchar (30) NULL ,
	"ContactTitle" nvarchar (30) NULL ,
	"Address" nvarchar (60) NULL ,
	"City" nvarchar (15) NULL ,
	"Region" nvarchar (15) NULL ,
	"PostalCode" nvarchar (10) NULL ,
	"Country" nvarchar (15) NULL ,
	"Phone" nvarchar (24) NULL ,
	"Fax" nvarchar (24) NULL ,
	"HomePage" "ntext" NULL ,
	CONSTRAINT "PK_Suppliers" PRIMARY KEY  CLUSTERED 
	(
		"SupplierID"
	)
)
GO

CREATE TABLE [STG]."Orders" (
	"OrderID" nvarchar(30) NOT NULL ,
	"CustomerID" nvarchar (5) NULL ,
	"EmployeeID" nvarchar(30) NULL ,
	"OrderDate" nvarchar(30) NULL ,
	"RequiredDate" nvarchar(30) NULL ,
	"ShippedDate" nvarchar(30) NULL ,
	"ShipVia" nvarchar(30) NULL ,
	"Freight" nvarchar(30) NULL,
	"ShipName" nvarchar (40) NULL ,
	"ShipAddress" nvarchar (60) NULL ,
	"ShipCity" nvarchar (15) NULL ,
	"ShipRegion" nvarchar (15) NULL ,
	"ShipPostalCode" nvarchar (10) NULL ,
	"ShipCountry" nvarchar (15) NULL ,
	CONSTRAINT "PK_Orders" PRIMARY KEY  CLUSTERED 
	(
		"OrderID"
	),
	CONSTRAINT "FK_Orders_Customers" FOREIGN KEY 
	(
		"CustomerID"
	) REFERENCES [STG]."Customers" (
		"CustomerID"
	),
	CONSTRAINT "FK_Orders_Employees" FOREIGN KEY 
	(
		"EmployeeID"
	) REFERENCES [STG]."Employees" (
		"EmployeeID"
	),
	CONSTRAINT "FK_Orders_Shippers" FOREIGN KEY 
	(
		"ShipVia"
	) REFERENCES [STG]."Shippers" (
		"ShipperID"
	)
)
GO

CREATE TABLE [STG]."Products" (
	"ProductID" nvarchar(30) NOT NULL ,
	"ProductName" nvarchar (40) NOT NULL ,
	"SupplierID" nvarchar(30) NULL ,
	"CategoryID" nvarchar(30) NULL ,
	"QuantityPerUnit" nvarchar (20) NULL ,
	"UnitPrice" nvarchar(30),
	"UnitsInStock" nvarchar(30),
	"UnitsOnOrder" nvarchar(30),
	"ReorderLevel" nvarchar(30),
	"Discontinued" nvarchar(30),
	CONSTRAINT "PK_Products" PRIMARY KEY  CLUSTERED 
	(
		"ProductID"
	),
	CONSTRAINT "FK_Products_Categories" FOREIGN KEY 
	(
		"CategoryID"
	) REFERENCES [STG]."Categories" (
		"CategoryID"
	),
	CONSTRAINT "FK_Products_Suppliers" FOREIGN KEY 
	(
		"SupplierID"
	) REFERENCES [STG]."Suppliers" (
		"SupplierID"
	)
)
GO

CREATE TABLE [STG]."Order Details" (
	"OrderID" nvarchar(30) NOT NULL ,
	"ProductID" nvarchar(30) NOT NULL ,
	"UnitPrice" nvarchar(30) NOT NULL,
	"Quantity" nvarchar(30) NOT NULL,
	"Discount" nvarchar(30) NOT NULL,
	CONSTRAINT "PK_Order_Details" PRIMARY KEY  CLUSTERED 
	(
		"OrderID",
		"ProductID"
	),
	CONSTRAINT "FK_Order_Details_Orders" FOREIGN KEY 
	(
		"OrderID"
	) REFERENCES [STG]."Orders" (
		"OrderID"
	),
	CONSTRAINT "FK_Order_Details_Products" FOREIGN KEY 
	(
		"ProductID"
	) REFERENCES [STG]."Products" (
		"ProductID"
	)
)
GO
	
CREATE TABLE [STG].[Region] 
	( [RegionID] nvarchar(30) NOT NULL ,
	[RegionDescription] nvarchar (50) NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [STG].[Territories] 
	([TerritoryID] nvarchar (20) NOT NULL ,
	[TerritoryDescription] nvarchar (50) NOT NULL ,
        [RegionID] nvarchar(30) NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [STG].[EmployeeTerritories] 
	([EmployeeID] nvarchar(30) NOT NULL,
	[TerritoryID] nvarchar (20) NOT NULL 
) ON [PRIMARY]
GO

ALTER TABLE [STG].Region
	ADD CONSTRAINT [PK_Region] PRIMARY KEY  NONCLUSTERED 
	(
		[RegionID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [STG].Territories
	ADD CONSTRAINT [PK_Territories] PRIMARY KEY  NONCLUSTERED 
	(
		[TerritoryID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [STG].Territories
	ADD CONSTRAINT [FK_Territories_Region] FOREIGN KEY 
	(
		[RegionID]
	) REFERENCES [STG].[Region] (
		[RegionID]
	)
GO

ALTER TABLE [STG].EmployeeTerritories
	ADD CONSTRAINT [PK_EmployeeTerritories] PRIMARY KEY  NONCLUSTERED 
	(
		[EmployeeID],
		[TerritoryID]
	) ON [PRIMARY]
GO

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