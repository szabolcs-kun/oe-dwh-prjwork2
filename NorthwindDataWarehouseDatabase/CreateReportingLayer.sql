/*
** Creates the REP schema and its tables 
*/

USE NorthwindDW
GO

CREATE SCHEMA REP
GO

CREATE TABLE [REP].[DimShipMethod] (
	[DimShipMethodID] int IDENTITY (1, 1) NOT NULL,
	[SRC_ID_Shippers] int NOT NULL,
	[CompanyName] nvarchar (40) NOT NULL,
	CONSTRAINT "PK_REP_DimShipMethod" PRIMARY KEY  CLUSTERED 
	(
		[DimShipMethodID] ASC
	)
)
GO

CREATE TABLE [REP].[DimCustomer] (
	[DimCustomerID] int IDENTITY (1, 1) NOT NULL,
	[SRC_ID_Customers] nvarchar (5) NOT NULL,
	[CompanyName] nvarchar (40) NOT NULL,
	[ContactName] nvarchar (30) NULL,
	[ContactTitle] nvarchar (30) NULL,
	[City] nvarchar (15) NULL,
	[Region] nvarchar (15) NULL,
	[Country] nvarchar (15) NULL,
	CONSTRAINT "PK_REP_DimCustomer" PRIMARY KEY  CLUSTERED 
	(
		[DimCustomerID] ASC
	)
)
GO

CREATE TABLE [REP].[DimEmployee] (
	[DimEmployeeID] int IDENTITY (1, 1) NOT NULL,
	[SRC_ID_Employees] int NOT NULL,
	[LastName] nvarchar (20) NOT NULL,
	[FirstName] nvarchar (10) NOT NULL,
	[Title] nvarchar (30) NULL,
	[BirthDate] date NULL,
	[HireDate] date NULL,
	[City] nvarchar (15) NULL,
	[Region] nvarchar (15) NULL,
	[Country] nvarchar (15) NULL,
	[SRC_ID_Territories] nvarchar (20) NOT NULL,
	[TerritoryDescription] nvarchar (50) NOT NULL,
	[SRC_ID_Region] int NOT NULL,
	[RegionRegionDescription] nvarchar (50) NOT NULL,
	CONSTRAINT "PK_REP_DimEmployee" PRIMARY KEY  CLUSTERED 
	(
		[DimEmployeeID] ASC
	)
)
GO

CREATE TABLE [REP].[DimProduct] (
	[DimProductID] int IDENTITY (1, 1) NOT NULL,
	[SRC_ID_Products] int NOT NULL,
	[ProductName] nvarchar (40) NOT NULL,
	[QuantityPerUnit] nvarchar (20) NULL,
	[Discontinued] bit NOT NULL,
	[SRC_ID_Categories] int NOT NULL,
	[CategoriesCategoryName] nvarchar (15) NOT NULL,
	[SRC_ID_Suppliers] int NOT NULL,
	[SuppliersCompanyName] nvarchar (40) NOT NULL,
	[SuppliersContactName] nvarchar (30) NULL,
	[SuppliersContactTitle] nvarchar (30) NULL,
	[SuppliersCity] nvarchar (15) NULL,
	[SuppliersRegion] nvarchar (15) NULL,
	[SuppliersCountry] nvarchar (15) NULL,
	[ValidFrom] date null,
	[ValidTo] date null

	CONSTRAINT "PK_REP_DimProduct" PRIMARY KEY  CLUSTERED 
	(
		[DimProductID] ASC
	)
)
GO

CREATE TABLE [REP].[DimDate] (
	[DimDateID] int NOT NULL,
	[SRC_ID_Date] date NOT NULL,
	[Year] int NOT NULL,
	[Month] int NOT NULL,
	[Day] int NOT NULL,
	[Quarter] int NOT NULL,
	CONSTRAINT "PK_REP_DimDate" PRIMARY KEY  CLUSTERED 
	(
		[DimDateID]
	)
)
GO

CREATE TABLE [REP].[FactSalesOrder] (
	[FactSalesOrderID] int IDENTITY (1, 1) NOT NULL,
	[SRC_ID_Orders] int NOT NULL,
	[OrderDate] date NULL,
	[RequiredDate] date NULL,
	[ShippedDate] date NULL,
	[Freight] money NOT NULL,
	[OrderDetailsUnitPrice] money NOT NULL,
	[OrderDetailsQuantity] smallint NOT NULL,
	[OrderDetailsDiscount] real NOT NULL,
	[SRC_ID_Products] int NOT NULL,
	[ProductsUnitsInStock] smallint NULL,
	[ProductsUnitsOnOrder] smallint NULL,
	[ProductsReorderLevel] smallint NULL,
	[DimProductID] int NOT NULL,
	[DimEmployeeID] int NOT NULL,
	[DimCustomerID] int NOT NULL,
	[DimShipMethodID] int NOT NULL,
	[OrderDateID] int NOT NULL,
	[RequiredDateID] int NOT NULL,
	[ShippedDateID] int NOT NULL,
	[ValidFrom] date null,
	[ValidTo] date null,

	CONSTRAINT "PK_REP_FactSalesOrder" PRIMARY KEY  CLUSTERED 
	(
		[FactSalesOrderID] ASC
	),
	CONSTRAINT "FK_REP_FactSalesOrder_DimProduct" FOREIGN KEY 
	(
		"DimProductID"
	) REFERENCES [REP].[DimProduct] (
		"DimProductID"
	),
	CONSTRAINT "FK_REP_FactSalesOrder_DimEmployee" FOREIGN KEY 
	(
		"DimEmployeeID"
	) REFERENCES [REP].[DimEmployee] (
		"DimEmployeeID"
	),
	CONSTRAINT "FK_REP_FactSalesOrder_DimCustomer" FOREIGN KEY 
	(
		"DimCustomerID"
	) REFERENCES [REP].[DimCustomer] (
		"DimCustomerID"
	),
	CONSTRAINT "FK_REP_FactSalesOrder_DimShipMethod" FOREIGN KEY 
	(
		"DimShipMethodID"
	) REFERENCES [REP].[DimShipMethod] (
		"DimShipMethodID"
	),
	CONSTRAINT "FK_REP_FactSalesOrder_DimDate_OrderDate" FOREIGN KEY 
	(
		"OrderDateID"
	) REFERENCES [REP].[DimDate] (
		"DimDateID"
	),
	CONSTRAINT "FK_REP_FactSalesOrder_DimDate_RequiredDate" FOREIGN KEY 
	(
		"RequiredDateID"
	) REFERENCES [REP].[DimDate] (
		"DimDateID"
	),
		CONSTRAINT "FK_REP_FactSalesOrder_DimDate_ShippedDate" FOREIGN KEY 
	(
		"ShippedDateID"
	) REFERENCES [REP].[DimDate] (
		"DimDateID"
	),
)
GO
