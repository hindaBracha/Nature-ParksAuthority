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
create trigger PrintingNote on [dbo].[sites]
for update
as
declare @site varchar(9)
declare @pric int
--set @site =cast([codeSite] as varchar(9))
select @site=[codeSite]  from [dbo].[visits]
print 'The site-'+ @site+' has a different price'--���� �� ����� �� ����� ����� �� ���� ����� �� ����
--�� ����� ����� ������ ���� ���� ����� ����� �����  

exec RaisePrice--���� �������
-------------------------------------------------------------------------------------

