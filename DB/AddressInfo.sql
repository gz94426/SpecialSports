---------------------------------�ջ���ַ������������--------------------------------------

use SportsDB
go
---------------------------------ʡ��-----------------------
create  table tbl_province
(
	pro_id int identity primary key,		--ʡ�ݱ��
	pro_name  nvarchar(20),					--ʡ������
)
go

if exists(select 1 from sys.tables where name='tbl_city')
begin
	drop table tbl_city
end
go
---------------------------------�м�-----------------------
create  table tbl_city
(
	city_id int identity primary key,		--�м����
	city_name  nvarchar(20),				--�м�����
	pro_id int								--ʡ�����
)
go

if exists(select 1 from sys.tables where name='tbl_county')
begin
	drop table tbl_county
end
go
---------------------------------�ؼ�-----------------------
create  table tbl_county
(
	county_id int identity primary key,		--�ؼ����
	county_name  nvarchar(20),				--�ؼ�����
	city_id int								--�м����
)
go




---------------------------------ʡ��-----------------------
insert tbl_province values('������')
insert tbl_province values('�����')
insert tbl_province values('�Ϻ���')
insert tbl_province values('������')
insert tbl_province values('�ӱ�ʡ')
insert tbl_province values('ɽ��ʡ')
insert tbl_province values('����ʡ')
insert tbl_province values('����ʡ')
insert tbl_province values('������ʡ')
insert tbl_province values('����ʡ')
insert tbl_province values('�㽭ʡ')
insert tbl_province values('����ʡ')
insert tbl_province values('����ʡ')
insert tbl_province values('����ʡ')
insert tbl_province values('ɽ��ʡ')
insert tbl_province values('����ʡ')
insert tbl_province values('����ʡ')
insert tbl_province values('����ʡ')
insert tbl_province values('�㶫ʡ')
insert tbl_province values('����ʡ')
insert tbl_province values('�Ĵ�ʡ')
insert tbl_province values('����ʡ')
insert tbl_province values('����ʡ')
insert tbl_province values('����ʡ')
insert tbl_province values('����ʡ')
insert tbl_province values('�ຣʡ')
insert tbl_province values('̨��ʡ')
insert tbl_province values('���ɹ�������')
insert tbl_province values('����׳��������')
insert tbl_province values('����������')
insert tbl_province values('���Ļ���������')
insert tbl_province values('�½�ά���������')
insert tbl_province values('����ر�������')
insert tbl_province values('�����ر�������')
select * from tbl_province

---------------------------------�м�-----------------------
insert tbl_city values('������',4)
insert tbl_city values('������',22)
insert tbl_city values('�ɶ���',21)
insert tbl_city values('�����',2)
insert tbl_city values('������',10)
insert tbl_city values('������',22)
select * from tbl_city

------------------------------------�ؼ�-------------------------------
insert tbl_county values('������',2)
insert tbl_county values('ɳƺ����',1)
insert tbl_county values('�ɽ��',1)
insert tbl_county values('������',1)

select * from tbl_province
select * from tbl_city
select * from tbl_county