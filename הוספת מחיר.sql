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
create trigger PrintingNote on [dbo].[sites]
for update
as
declare @site varchar(9)
declare @pric int
--set @site =cast([codeSite] as varchar(9))
select @site=[codeSite]  from [dbo].[visits]
print 'The site-'+ @site+' has a different price'--כרגע זה הדפסה אך בהמשך כמובן זה יהיה הודעה או מייל
--זה הכרחי מכוון שעלינו לדעת באלו אתרים התרחש שינוי  

exec RaisePrice--הרצת התוכנית
-------------------------------------------------------------------------------------

