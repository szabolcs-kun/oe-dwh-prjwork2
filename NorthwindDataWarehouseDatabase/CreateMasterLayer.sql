/*
** Creates the MSTR schema and its tables 
*/

USE NorthwindDW
GO

CREATE SCHEMA MSTR
GO

CREATE TABLE [MSTR].[Employees](

	[SRC_ID_Employees] int NOT NULL,
	[LastName] nvarchar (20) NOT NULL,
	[FirstName] nvarchar (10) NOT NULL,
	[Title] nvarchar (30) NULL,
	[TitleOfCourtesy] nvarchar (25) NULL,
	[BirthDate] date NULL,
	[HireDate] date NULL,
	[Address] nvarchar (60) NULL,
	[City] nvarchar (15) NULL,
	[Region] nvarchar (15) NULL,
	[PostalCode] nvarchar (10) NULL,
	[Country] nvarchar (15) NULL,
	[HomePhone] nvarchar (24) NULL,
	[Extension] nvarchar (4) NULL,
	[PhotoPath] nvarchar (255) NULL,

	[SRC_ID_Territory] nvarchar (20) NULL,
	[TerritoryTerritoryDescription] nvarchar (50) NULL,

	[SRC_ID_Region] int NULL,
	[RegionRegionDescription] nvarchar (50) NULL
)
GO

CREATE TABLE [MSTR].[Customers](

	[SRC_ID_Customers] nvarchar (5) NOT NULL,
	[CompanyName] nvarchar (40) NOT NULL,
	[ContactName] nvarchar (30) NULL,
	[ContactTitle] nvarchar (30) NULL,
	[Address] nvarchar (60) NULL,
	[City] nvarchar (15) NULL,
	[Region] nvarchar (15) NULL,
	[PostalCode] nvarchar (10) NULL,
	[Country] nvarchar (15) NULL,
	[Phone] nvarchar (24) NULL,
	[Fax] nvarchar (24) NULL
)
GO

CREATE TABLE [MSTR].[Shippers](

	[SRC_ID_Shippers] int NOT NULL,
	[CompanyName] nvarchar (40) NOT NULL,
	[Phone] nvarchar (24) NULL
)
GO

CREATE TABLE [MSTR].[Products](

	[SRC_ID_Products] int NOT NULL,
	[ProductName] nvarchar (40) NOT NULL,
	[QuantityPerUnit] nvarchar (20) NULL,
	[UnitPrice] money NULL,
	[UnitsInStock] smallint NULL,
	[UnitsOnOrder] smallint NULL,
	[ReorderLevel] smallint NULL,
	[Discontinued] [bit] NOT NULL,

	[SRC_ID_Category] [int] NULL,
	[CategoryCategoryName] nvarchar (15) NULL,

	[SRC_ID_Supplier] int NULL,
	[SupplierCompanyName] nvarchar (40) NULL,
	[SupplierContactName] nvarchar (30) NULL,
	[SupplierContactTitle] nvarchar (30) NULL,
	[SupplierAddress] nvarchar (60) NULL,
	[SupplierCity] nvarchar (15) NULL,
	[SupplierRegion] nvarchar (15) NULL,
	[SupplierPostalCode] nvarchar (10) NULL,
	[SupplierCountry] nvarchar (15) NULL,
	[SupplierPhone] nvarchar (24) NULL,
	[SupplierFax] nvarchar (24) NULL,
	[ValidFrom] date null,
	[ValidTo] date null
)
GO

CREATE TABLE [MSTR].[Orders](
	[SRC_ID_Orders] int NOT NULL,
	[SRC_ID_Customers] nvarchar (5) NULL,
	[SRC_ID_Employees] int NULL,
	[OrderDate] date NULL,
	[RequiredDate] date NULL,
	[ShippedDate] date NULL,
	[ShipVia] int NULL,
	[Freight] money NULL,
	[ShipName] nvarchar (40) NULL,
	[ShipAddress] nvarchar (60) NULL,
	[ShipCity] nvarchar (15) NULL,
	[ShipRegion] nvarchar (15) NULL,
	[ShipPostalCode] nvarchar (10) NULL,
	[ShipCountry] nvarchar (15) NULL,

	[SRC_ID_Products] int NULL,
	[UnitPrice] money NULL,
	[Quantity] smallint NULL,
	[Discount] real NULL,
	[ValidFrom] date null,
	[ValidTo] date null
)
GO