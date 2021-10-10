/*
** Stored procedure that populates the date dimension of the master schema
*/

USE NorthwindDW
GO 

/*
Parameters:
@start_date = 'YYYY-MM-DD'
@end_date = 'YYYY-MM-DD'
*/
CREATE or ALTER PROCEDURE sp_populate_rep_datedim(@start_date date, @end_date date)
AS

BEGIN
	INSERT INTO [REP].[DimDate]
	SELECT cast(convert(varchar, cast( d as date ) , 112) as int ) [DimDateID], 
		   cast( d as date )    [SRC_ID_Date], 
		   year( d )            [Year],
		   month( d )           [Month],
		   day( d )             [Day],
		   datename(qq, d)      [Quarter]
	FROM   ( SELECT d = DATEADD(DAY, rn - 1, @start_date)
			 FROM   ( SELECT TOP (DATEDIFF(DAY, @start_date, @end_date))
							 rn = ROW_NUMBER() OVER (ORDER BY s1.[object_id])
					  FROM   sys.all_objects AS s1
					  CROSS  JOIN sys.all_objects AS s2
					  ORDER  BY s1.[object_id]
					) AS x
		   ) AS y;

	IF NOT EXISTS(SELECT * FROM [REP].[DimDate] WHERE [DimDateID] = 99991231)
	BEGIN
		INSERT INTO [REP].[DimDate]
			   ([DimDateID]
			   ,[SRC_ID_Date]
			   ,[Year]
			   ,[Month]
			   ,[Day]
			   ,[Quarter])
		 VALUES
			   (99991231
			   ,'9999-12-31'
			   ,9999
			   ,12
			   ,31
			   ,4);
	END;
END;
