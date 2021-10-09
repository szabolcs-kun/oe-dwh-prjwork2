/*
** Init the NorthwindDW database
*/


SET NOCOUNT ON
GO

USE master
GO
if exists (select * from sysdatabases where name='NorthwindDW')
		drop database NorthwindDW
go

DECLARE @device_directory NVARCHAR(520)
SELECT @device_directory = SUBSTRING(filename, 1, CHARINDEX(N'master.mdf', LOWER(filename)) - 1)
FROM master.dbo.sysaltfiles WHERE dbid = 1 AND fileid = 1

EXECUTE (N'CREATE DATABASE NorthwindDW
  ON PRIMARY (NAME = N''NorthwindDW'', FILENAME = N''' + @device_directory + N'northwinddw.mdf'')
  LOG ON (NAME = N''NorthwindDW_log'',  FILENAME = N''' + @device_directory + N'northwinddw.ldf'')')
go

if CAST(SERVERPROPERTY('ProductMajorVersion') AS INT)<12 
BEGIN
  exec sp_dboption 'NorthwindDW','trunc. log on chkpt.','true'
  exec sp_dboption 'NorthwindDW','select into/bulkcopy','true'
END
ELSE ALTER DATABASE [NorthwindDW] SET RECOVERY SIMPLE WITH NO_WAIT
GO