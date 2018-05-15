Declare @StartDate datetime =  getdate()

Declare @TrendCurrentMonthStart  datetime = DATEADD(month, DATEDIFF(month,1 , @StartDate), 0)
Declare @TrendCurrentMonthEnd datetime = EOMONTH(@StartDate)
Declare @TrendTMinus1Start datetime = DATEADD(month, DATEDIFF(month,40 , @StartDate), 0)
Declare @TrendTMinus1End datetime = EOMONTH(dateadd(month,datediff(month,40,@StartDate),0))
Declare @TrendTMinus2Start datetime = DATEADD(month, DATEDIFF(month,80 , @StartDate), 0)
Declare @TrendTMinus2End datetime = EOMONTH(dateadd(month,datediff(month,80,@StartDate),0))
Declare @TrendTMinus3Start datetime = DATEADD(month, DATEDIFF(month,100 , @StartDate), 0)
Declare @TrendTMinus3End datetime =  EOMONTH(dateadd(month,datediff(month,100,@StartDate),0))


select  @TrendCurrentMonthStart
select  @TrendCurrentMonthEnd  
select  @TrendTMinus1Start 
select  @TrendTMinus1End 
select  @TrendTMinus2Start
select  @TrendTMinus2End 
select  @TrendTMinus3Start 
select  @TrendTMinus3End 
