---------------------------------收货地址（三级联动）--------------------------------------

use SportsDB
go
---------------------------------省份-----------------------
create  table tbl_province
(
	pro_id int identity primary key,		--省份编号
	pro_name  nvarchar(20),					--省份名称
)
go

if exists(select 1 from sys.tables where name='tbl_city')
begin
	drop table tbl_city
end
go
---------------------------------市级-----------------------
create  table tbl_city
(
	city_id int identity primary key,		--市级编号
	city_name  nvarchar(20),				--市级名称
	pro_id int								--省级编号
)
go

if exists(select 1 from sys.tables where name='tbl_county')
begin
	drop table tbl_county
end
go
---------------------------------县级-----------------------
create  table tbl_county
(
	county_id int identity primary key,		--县级编号
	county_name  nvarchar(20),				--县级名称
	city_id int								--市级编号
)
go




---------------------------------省份-----------------------
insert tbl_province values('北京市')
insert tbl_province values('天津市')
insert tbl_province values('上海市')
insert tbl_province values('重庆市')
insert tbl_province values('河北省')
insert tbl_province values('山西省')
insert tbl_province values('辽宁省')
insert tbl_province values('吉林省')
insert tbl_province values('黑龙江省')
insert tbl_province values('江苏省')
insert tbl_province values('浙江省')
insert tbl_province values('安徽省')
insert tbl_province values('福建省')
insert tbl_province values('江西省')
insert tbl_province values('山东省')
insert tbl_province values('河南省')
insert tbl_province values('湖北省')
insert tbl_province values('湖南省')
insert tbl_province values('广东省')
insert tbl_province values('海南省')
insert tbl_province values('四川省')
insert tbl_province values('贵州省')
insert tbl_province values('云南省')
insert tbl_province values('陕西省')
insert tbl_province values('甘肃省')
insert tbl_province values('青海省')
insert tbl_province values('台湾省')
insert tbl_province values('内蒙古自治区')
insert tbl_province values('广西壮族自治区')
insert tbl_province values('西藏自治区')
insert tbl_province values('宁夏回族自治区')
insert tbl_province values('新疆维吾尔自治区')
insert tbl_province values('香港特别行政区')
insert tbl_province values('澳门特别行政区')
select * from tbl_province

---------------------------------市级-----------------------
insert tbl_city values('重庆市',4)
insert tbl_city values('遵义市',22)
insert tbl_city values('成都市',21)
insert tbl_city values('天津市',2)
insert tbl_city values('江阴市',10)
insert tbl_city values('凯里市',22)
select * from tbl_city

------------------------------------县级-------------------------------
insert tbl_county values('正安县',2)
insert tbl_county values('沙坪坝区',1)
insert tbl_county values('璧山区',1)
insert tbl_county values('涪陵区',1)

select * from tbl_province
select * from tbl_city
select * from tbl_county