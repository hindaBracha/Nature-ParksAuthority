--одоннннннннннн5
create function randPerson(@rand int) Returns table
as
Return(select q1.[groupCode],[numMembars],[phone],year,counte from 
(select top 1 [groupCode],year([date])as year,count(year([date]))as counte
from[dbo].[visits]
where [groupCode]=@rand
group by [groupCode],year([date])
order by year([date])desc)q1 join[dbo].[menuim]
on q1.[groupCode]=[menuim].[groupCode]
)
alter procedure randNum as
begin
declare @rand int;
set @rand= convert(int, rand()*(select top 1 row_number() over(order by[groupName] )
from [dbo].[menuim]
order by row_number() over(order by [groupName] ) desc))+1
 --print @rand
 declare @rVisitor varchar(9)
 select @rVisitor=[groupCode] from
(select row_number() over (order by groupName) as rowNum , * 
from [dbo].[menuim])q
where rowNum=@rand
select * from randPerson(@rVisitor)
end
exec randNum
