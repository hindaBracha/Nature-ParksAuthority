alter table [menuim]
add
datee date 

DECLARE @date date
DECLARE crs  CURSOR
FOR SELECT [datee] from[menuim]
where (year([datee])+[long]<year(getdate()))
open crs
fetch next from crs into @date
while @@FETCH_STATUS=0
begin 
delete from [menuim] 
Fetch next from crs
End
Close crs
Deallocate crs
