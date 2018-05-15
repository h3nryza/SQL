--SQL Round to nearest Minute
select dateadd(mi, datediff(mi, 0, @dt), 0)

--Sql Round to Nearest Hour
select dateadd(hour, datediff(hour, 0, @dt), 0)

--Sql Last day of week
first day - last day

--Sql First Day of Week
select dateadd(week, datediff(week, 0, getdate()), 0);

--Sql Get DAte Name
SELECT DATENAME(dw,GETDATE()) -- Friday

--Sql Get Date Number
SELECT DATEPART(dw,GETDATE()) -- 6

--Sql Last day of month
DECLARE @date DATETIME = GETDATE();  
SELECT EOMONTH ( @date ) AS 'This Month';  
SELECT EOMONTH ( @date, 1 ) AS 'Next Month';  
SELECT EOMONTH ( @date, -1 ) AS 'Last Month';  

--Sql first day of the month
select dateadd( s, -1, dateadd( mm, datediff( m, 0, getdate() ) + 1, 0 ) );
/*
Explantion:
			To understand how it works we have to look at the dateadd() and datediff() functions.
			DATEADD(datepart, number, date)  
			DATEDIFF(datepart, startdate, enddate)
			If you run just the most inner call to datediff(), you get the current month number since timestamp 0.
			select datediff(m, 0, getdate() );  
			1327
			The next part adds that number of months plus 1 to the 0 timestamp, giving you the starting point of the next calendar month.
			select dateadd( s, -1, dateadd( mm, datediff( m, 0, getdate() ) + 1, 0 ) );
			2010-08-31 23:59:59.000	
			select dateadd( mm, datediff( m, 0, getdate() ) + 1, 0 );
			2010-09-01 00:00:00.000
/*

			
select datepart(day,getdate())
select datepart(dayofyear,getdate())
select datepart(WEEKDAY,getdate())
select datepart(DAYOFYEAR,getdate())
select datepart(YEAR,getdate())
select datepart(MONTH,getdate())
select datepart(WEEK,getdate())
select datepart(HOUR,getdate())
select datepart(MINUTE,getdate())
select datepart(SECOND,getdate())
select datepart(MILLISECOND,getdate())
select datepart(MICROSECOND,getdate())
select datepart(NANOSECOND,getdate())
select datepart(YEAR,getdate())
select datepart(QUARTER,getdate())



/*
datepart	Abbreviation
year		yy, yyyy
quarter		qq, q
month		mm, m
dayofyear	dy, y
day			dd, d
week		wk, ww
weekday		dw, w
hour		hh
minute		mi, n
second		ss, s
millisecond	ms
microsecond	mcs
nanosecond	ns
*/



--Other Ways
----Last Day of Previous Month
SELECT DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,GETDATE()),0))
LastDay_PreviousMonth
----Last Day of Current Month
SELECT DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,GETDATE())+1,0))
LastDay_CurrentMonth
----Last Day of Next Month
SELECT DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,GETDATE())+2,0))
LastDay_NextMonth

--First Day of Last Year
SELECT DATEADD(YEAR, DATEDIFF(YEAR, '19000101', GETDATE()) - 1 , '19000101')
&nbsp;AS [FIRST DAY OF LAST YEAR];
GO

--First Day of This Year
SELECT DATEADD(YEAR, DATEDIFF(YEAR, '19000101', GETDATE()), '19000101')
&nbsp;AS [FIRST DAY OF This YEAR];
GO

--First Day of Next Year
SELECT DATEADD(YEAR, DATEDIFF(YEAR, '19000101', GETDATE()) + 1 , '19000101')
&nbsp;AS [FIRST DAY OF NEXT YEAR];
GO

--Last Day of Last Year
SELECT DATEADD(d, -1, DATEADD(YEAR, DATEDIFF(YEAR, '19000101', GETDATE()), '19000101'))
 AS [LAST DAY OF This YEAR];
GO

--Last Day of This Year
SELECT DATEADD(d, -1, DATEADD(YEAR, DATEDIFF(YEAR, '19000101', GETDATE()) + 1 , '19000101'))
 AS [LAST DAY OF This YEAR];
GO

--Last Day of Next Year
SELECT DATEADD(d, -1, DATEADD(YEAR, DATEDIFF(YEAR, '19000101', GETDATE()) + 2 , '19000101'))
 AS [LAST DAY OF NEXT YEAR];
GO

-- To Get First Day of Previous Month
SELECT DATEADD(MONTH, DATEDIFF(MONTH, '19000101', GETDATE()) - 1, '19000101')
 AS [FIRST DAY Previous MONTH];
GO 

-- To Get First Day of Current Month
SELECT DATEADD(MONTH, DATEDIFF(MONTH, '19000101', GETDATE()), '19000101')
 AS [FIRST DAY CURRENT MONTH];
GO

-- To Get First Day of Next Month
SELECT DATEADD(MONTH, DATEDIFF(MONTH, '19000101', GETDATE()) + 1, '19000101')
 AS [FIRST DAY NEXT MONTH];
GO

-- To Get Last Day of Previous Month
SELECT DATEADD(D, -1, DATEADD(MONTH, DATEDIFF(MONTH, '19000101', GETDATE()), '19000101'))
AS [LAST DAY Previous MONTH];
GO 

-- To Get Last Day of This Month
SELECT DATEADD(D, -1, DATEADD(MONTH, DATEDIFF(MONTH, '19000101', GETDATE()) + 1, '19000101'))
AS [LAST DAY This MONTH];
GO

-- To Get Last Day of Next Month
SELECT DATEADD(D, -1, DATEADD(MONTH, DATEDIFF(MONTH, '19000101', GETDATE()) + 2, '19000101'))
AS [LAST DAY NEXT MONTH];
GO

-- To Get Midnight Yesterday
SELECT DATEADD(d, -1, DATEDIFF(d, 0, GETDATE()))
 AS [Midnight Yesterday];

-- To Get Midnight Today
SELECT DATEADD(d, -0, DATEDIFF(d, 0, GETDATE()))
 AS [Midnight Today];

-- To Get Midnight Tomorrow
SELECT DATEADD(d, 1, DATEDIFF(d, 0, GETDATE()))
 AS [Midnight Tomorrow];


 --To Get 11:59:59 Yesterday
SELECT DATEADD(ss, (60*60*24)-1, DATEADD(d, -1, DATEDIFF(d, 0, GETDATE())))
 AS [11:59:59 Yesterday];


--To Get Noon Yesterday
SELECT DATEADD(hh, 12, DATEADD(d, -1, DATEDIFF(d, 0, GETDATE())))
 AS [Noon Yesterday];


--To Get 11:59:59:997 Yesterday
SELECT DATEADD(ms, (1000*60*60*24)-2, DATEADD(d, -1, DATEDIFF(d, 0, GETDATE())))
 AS [11:59:59.997 Yesterday];