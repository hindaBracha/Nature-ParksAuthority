--------a--------a---------------a-----------
-----------(הוספת מחיר לאתרים הפופולארים בחודשים הפופולארים(יוני,יולי,אוגוסט--------------------------
create view maxMembars--יוצר טבלה שמציינת לכל אתר את כמות המבקרים בחודשים 6-8 בחמש שנים האחרונות 
as
select [codeSite],sum([numMembars]) as sumM from[dbo].[visits]
where month([date]) between 6 and 8
and datediff(year,[date],getdate())<=5
group by [codeSite]

--פרוצדורה שמעלה את המחיר לאתר או יותר עם כמות מבקרים הגדולה ביותר בחודשי הקיץ
create PROCEDURE RaisePrice
as
begin
update [dbo].[sites]
set [Price]=case --נועד להגביל את גודל העלאת המחיר
when [Price]*0.1>0and [Price]*0.1<=4then floor([Price]*1.1)
when [Price]*0.1>4and [Price]*0.1<=7then [Price]+4
else [Price]+7
end
where [codeSite] in(
select top 1 codeSite from maxMembars 
order by sumM desc)
end
--טריגר שבעת עידכון מחיר ידפיס באלו אתרים התרחש עדכון
alter trigger PrintingNote on [dbo].[sites]
for update
as
declare @site varchar(9)
declare @d varchar(9)
select @site=[codeSite]  from [dbo].[visits]
select @d=price from deleted
select @d=@d-price from [dbo].[sites]
where [codeSite]=@site
print 'לאתר -'+ @site+' עלה המחיר ב-'+@d+'ש"ח'--כרגע זה הדפסה אך בהמשך כמובן זה יהיה הודעה או מייל
----זה הכרחי מכוון שעלינו לדעת באלו אתרים התרחש שינוי  
exec RaisePrice--הרצת התוכנית
--------------------b---------------b--------------b----------------------b--------------
------ תוכנית המגרילה אדם-מנוי ובודקת עליו נתונים סטטיסטיים
---בודקת באיזו שנה היו למבקר הכי הרבה ביקורים
create function randPerson(@rand int) Returns table--פונקציה המחזירה טבלה המכילה 
--קוד מבקר, מספר משתתפים במנוי,שנה שהיו בה הכי הרבה ביקורים,מספר הביקורים לשנה זו
as
Return(select q1.[groupCode],[numMembars],[phone],year,counte from 
(select top 1[groupCode],year([date])as year,count(*)as counte
from[dbo].[visits]
where [groupCode]=@rand
group by [groupCode],year([date])
order by counte desc, year([date])desc)q1 join[dbo].[menuim]
on q1.[groupCode]=[menuim].[groupCode]
)
alter procedure randNum as--פרוצדורה שמגרילה מספר-מבקר ושולחת אותו לפונקציה
--הוצרכנו להשתמש ב"רוו נמבר" כוון שהמפתח הראשי הוא ת"ז ולא מספר הניתן להגרלה
begin
declare @rand int;--המספר שיוגרל
set @rand= convert(int, rand()*(select count(*)
from [dbo].[menuim])+1)--הגרלה
 declare @rVisitor varchar(9)--הבמקר שנבחר
 select @rVisitor=[groupCode] from
(select row_number() over (order by groupName) as rowNum , * 
from [dbo].[menuim])q
where rowNum=@rand
select * from randPerson(@rVisitor)--שליחה לפונקציה
end
exec randNum--הרצת התוכנית
------------c----------------------c-------------------------------
--פרוצדורה ובה סמן העובר על המנויים שפג תוקפם ומוחק אותם
--בבבבבבבבבבבבבבבבבבבבבבבבבבבבבבבקשה לא להריץץץץץץץץץץץץץץץץץץ
----מוחק נתונים
create PROCEDURE delete_col
as
begin
DECLARE @code int
DECLARE crs  CURSOR
FOR SELECT groupCode from[menuim]
where (year([datee])+[long]<year(getdate()))
open crs
fetch next from crs into @code
while @@FETCH_STATUS=0
begin 
delete from [menuim] 
where groupCode=@code
Fetch next from crs into @code
End
Close crs
Deallocate crs
End
exec delete_col
select*from [menuim]
