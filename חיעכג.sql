--одоннннннннннн????????????5????????
create function randi(@rand int) Returns table
as
Return(select q1.[groupCode],[numMembars],[phone],year,counte from 
(select top 1 [groupCode],year([date])as year,count(year([date]))as counte
from[dbo].[visits]
where [groupCode]=1
group by [groupCode],year([date])
order by year([date])desc)q1 join[dbo].[menuim]
on q1.[groupCode]=[menuim].[groupCode]
)
declare @rand int;
set @rand= convert(int, rand()*(select top 1 row_number() over(order by[groupName] )
from [dbo].[menuim]
order by row_number() over(order by [groupName] ) desc
 ))+1
SELECT * from  randi (@rand)

