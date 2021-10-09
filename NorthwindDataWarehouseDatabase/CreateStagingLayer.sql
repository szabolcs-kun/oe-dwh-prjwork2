/*
** Creates the STG schema and the necessary tables for extraction
*/

USE NorthwindDW
GO

CREATE SCHEMA STG
GO

CREATE TABLE [STG]."Employees" (
	"EmployeeID" nvarchar(30) NULL ,
	"LastName" nvarchar (20) NULL ,
	"FirstName" nvarchar (10) NULL ,
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
	"ReportsTo" nvarchar(30) NULL ,
	"PhotoPath" nvarchar (255) NULL
)
GO

CREATE TABLE [STG]."Categories" (
	"CategoryID" nvarchar(30) NULL ,
	"CategoryName" nvarchar (15) NULL
)
GO

CREATE TABLE [STG]."Customers" (
	"CustomerID" nvarchar(5) NULL ,
	"CompanyName" nvarchar (40) NULL ,
	"ContactName" nvarchar (30) NULL ,
	"ContactTitle" nvarchar (30) NULL ,
	"Address" nvarchar (60) NULL ,
	"City" nvarchar (15) NULL ,
	"Region" nvarchar (15) NULL ,
	"PostalCode" nvarchar (10) NULL ,
	"Country" nvarchar (15) NULL ,
	"Phone" nvarchar (24) NULL ,
	"Fax" nvarchar (24) NULL
)
GO

CREATE TABLE [STG]."Shippers" (
	"ShipperID" nvarchar(30) NULL ,
	"CompanyName" nvarchar (40) NULL ,
	"Phone" nvarchar (24) NULL
)
GO

CREATE TABLE [STG]."Suppliers" (
	"SupplierID" nvarchar(30) NULL ,
	"CompanyName" nvarchar (40) NULL ,
	"ContactName" nvarchar (30) NULL ,
	"ContactTitle" nvarchar (30) NULL ,
	"Address" nvarchar (60) NULL ,
	"City" nvarchar (15) NULL ,
	"Region" nvarchar (15) NULL ,
	"PostalCode" nvarchar (10) NULL ,
	"Country" nvarchar (15) NULL ,
	"Phone" nvarchar (24) NULL ,
	"Fax" nvarchar (24) NULL
)
GO

CREATE TABLE [STG]."Orders" (
	"OrderID" nvarchar(30) NULL ,
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
	"ShipCountry" nvarchar (15) NULL 
)
GO

CREATE TABLE [STG]."Products" (
	"ProductID" nvarchar(30) NULL ,
	"ProductName" nvarchar (40) NULL ,
	"SupplierID" nvarchar(30) NULL ,
	"CategoryID" nvarchar(30) NULL ,
	"QuantityPerUnit" nvarchar (20) NULL ,
	"UnitPrice" nvarchar(30),
	"UnitsInStock" nvarchar(30),
	"UnitsOnOrder" nvarchar(30),
	"ReorderLevel" nvarchar(30),
	"Discontinued" nvarchar(30)
)
GO

CREATE TABLE [STG]."Order Details" (
	"OrderID" nvarchar(30) NULL ,
	"ProductID" nvarchar(30) NULL ,
	"UnitPrice" nvarchar(30) NULL,
	"Quantity" nvarchar(30) NULL,
	"Discount" nvarchar(30) NULL
)
GO
	
CREATE TABLE [STG].[Region] 
	( [RegionID] nvarchar(30) NULL ,
	[RegionDescription] nvarchar (50) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [STG].[Territories] 
	([TerritoryID] nvarchar (20) NULL ,
	[TerritoryDescription] nvarchar (50) NULL ,
        [RegionID] nvarchar(30) NULL
) ON [PRIMARY]
GO

CREATE TABLE [STG].[EmployeeTerritories] 
	([EmployeeID] nvarchar(30) NULL,
	[TerritoryID] nvarchar (20) NULL 
) ON [PRIMARY]
GO