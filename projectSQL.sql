--------a--------a---------------a-----------
-----------(����� ���� ������ ���������� ������� ����������(����,����,������--------------------------
create view maxMembars--���� ���� ������� ��� ��� �� ���� ������� ������� 6-8 ���� ���� �������� 
as
select [codeSite],sum([numMembars]) as sumM from[dbo].[visits]
where month([date]) between 6 and 8
and datediff(year,[date],getdate())<=5
group by [codeSite]

--�������� ����� �� ����� ���� �� ���� �� ���� ������ ������ ����� ������ ����
create PROCEDURE RaisePrice
as
begin
update [dbo].[sites]
set [Price]=case --���� ������ �� ���� ����� �����
when [Price]*0.1>0and [Price]*0.1<=4then floor([Price]*1.1)
when [Price]*0.1>4and [Price]*0.1<=7then [Price]+4
else [Price]+7
end
where [codeSite] in(
select top 1 codeSite from maxMembars 
order by sumM desc)
end
--����� ���� ������ ���� ����� ���� ����� ����� �����
alter trigger PrintingNote on [dbo].[sites]
for update
as
declare @site varchar(9)
declare @d varchar(9)
select @site=[codeSite]  from [dbo].[visits]
select @d=price from deleted
select @d=@d-price from [dbo].[sites]
where [codeSite]=@site
print '���� -'+ @site+' ��� ����� �-'+@d+'�"�'--���� �� ����� �� ����� ����� �� ���� ����� �� ����
----�� ����� ����� ������ ���� ���� ����� ����� �����  
exec RaisePrice--���� �������
--------------------b---------------b--------------b----------------------b--------------
------ ������ ������� ���-���� ������ ���� ������ ���������
---����� ����� ��� ��� ����� ��� ���� �������
create function randPerson(@rand int) Returns table--������� ������� ���� ������ 
--��� ����, ���� ������� �����,��� ���� �� ��� ���� �������,���� �������� ���� ��
as
Return(select q1.[groupCode],[numMembars],[phone],year,counte from 
(select top 1[groupCode],year([date])as year,count(*)as counte
from[dbo].[visits]
where [groupCode]=@rand
group by [groupCode],year([date])
order by counte desc, year([date])desc)q1 join[dbo].[menuim]
on q1.[groupCode]=[menuim].[groupCode]
)
alter procedure randNum as--�������� ������� ����-���� ������ ���� ��������
--������� ������ �"��� ����" ���� ������ ����� ��� �"� ��� ���� ����� ������
begin
declare @rand int;--����� ������
set @rand= convert(int, rand()*(select count(*)
from [dbo].[menuim])+1)--�����
 declare @rVisitor varchar(9)--����� �����
 select @rVisitor=[groupCode] from
(select row_number() over (order by groupName) as rowNum , * 
from [dbo].[menuim])q
where rowNum=@rand
select * from randPerson(@rVisitor)--����� ��������
end
exec randNum--���� �������
------------c----------------------c-------------------------------
--�������� ��� ��� ����� �� ������� ��� ����� ����� ����
--���������������������������������� �� ����������������������
----���� ������
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
