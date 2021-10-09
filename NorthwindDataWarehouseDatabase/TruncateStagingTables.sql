/*
** Truncate staging tables
*/

USE NorthwindDW
GO

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