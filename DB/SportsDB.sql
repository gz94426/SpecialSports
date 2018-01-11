
/**********
 *      SpecialSports��վ���ݿ�ű�
 *
 *      author:����,����,³����,Z.H
 *      date: 10/16/2017
 **/
 
 
 
----------------------------�������ݿ⣨SportsDB��
if exists(select * from sys.databases where name='SportsDB')
begin
	drop database SportsDB
end
go
create database SportsDB
go
use SportsDB
go



----------��������Ա��Ϣ��tbl_manager��
if exists(select * from sys.objects where name='tbl_manager')
begin
	drop table tbl_manager
end
go
create table tbl_manager
(
	manager_id int PRIMARY KEY identity(1,1),		-- ����Ա��� 
	manager_name varchar(20),		-- ����Ա��¼�� 
	manager_pwd varchar(20)			-- ����Ա���� 
)

----------�û�������Ϣ��UserInfo��
if exists(select * from sys.objects where name='UserInfo')
begin
	drop table UserInfo
end
go
create table UserInfo
(
	userid int PRIMARY KEY identity(1,1),			-- ���
	name nvarchar(64),              -- ע���ʺ�
	user_password varchar(50),		-- ����
	user_status int,				-- ״̬(0��δ���ߣ�1��������)
	user_createTime datetime,		-- ע��ʱ��
	store_id int					-- ����id
)


----------�û�������ϸ��Ϣ��UserInfo_detail��
if exists(select * from sys.objects where name='UserInfo_detail')
begin
	drop table UserInfo_detail
end
go
create table UserInfo_detail
(
	detailId int primary key identity(1,1), --��ϸID
	userid int ,							--�û����
	username varchar(20),			-- ��ʵ����
	user_nickname varchar(20),		-- �ǳ�
	user_sex varchar(2),			-- �Ա�
	user_email varchar(30),			-- ����
	user_telphone varchar(11),		-- �绰
	user_idcard varchar(18),		-- ���֤����
	user_qq varchar(50),			-- QQ��
	user_photo varchar(200),		-- ͷ��
	user_money Decimal(8,2),		--���
	user_remark varchar(100)		-- ��ע
)





----------���̹�����Ϣ��StoreInfo��
if exists(select * from sys.objects where name='StoreInfo')
begin
	drop table StoreInfo
end
go
create table StoreInfo
(
	Id int primary key identity(1,1),	-- �̵���
	userid int not null,				-- �����û�Id
	StoreName  nvarchar(64) not null,	-- �̵�����
	StoreURL nvarchar(64)  null,		-- �̵���ַ��ҳ
	--GoodsType_ID int 					-- ��Ʒ���͹������
)


----------��Ʒ���ͣ�GoodsType��
if exists(select * from sys.objects where name='GoodsType')
begin
	drop table GoodsType
end
go
create table GoodsType
(
	Id int primary key identity(1,1),	-- ���ͱ��
	TypeName nvarchar(64) not null,		-- ��������
)



----------��Ʒ���������GoodsTypeInfo��
if exists(select * from sys.objects where name='GoodsTypeInfo')
begin
	drop table GoodsTypeInfo
end
go
create table GoodsTypeInfo
(
	Id int primary key identity(1,1),	-- ����������
	GoodsType_Id int,					-- ���ͱ��
	TypeName nvarchar(64)		,		-- ������������
	Typeremark varchar(100)				-- �������鱸ע
)
----------���̺���Ʒ���͵Ĺ�����StoreInfo_X_GoodsType��
if exists(select * from sys.objects where name='StoreInfo_X_GoodsType')
begin
	drop table StoreInfo_X_GoodsType
end
go
create table StoreInfo_X_GoodsType
(
	Id int primary key identity(1,1),	-- ���ͱ��
	StoreInfoId int not null,		-- ��������
	GoodsTypeId int	-- �̵���
)


----------��Ʒ��Ϣ��GoodsInfo��
if exists(select * from sys.objects where name='GoodsInfo')
begin
	drop table GoodsInfo
end
go
create table GoodsInfo
(
	Id int primary key identity(1,1),
	GoodsName  nvarchar(64) not null,	-- ��Ʒ����
	Goods_number varchar(20),			-- ��Ʒ����		Y:�·�  K:����  X:Ь��  Q:ñ��	T:��װ	QC:�˶���Ʒ
	GoodsURL nvarchar(64) not null,		-- ��Ʒ����		ͼƬ·��
	Goods_remark text,					-- ��Ʒ����  
	Goods_price decimal(8,2),			-- ���ۼ۸�  
	Goods_addtime datetime,				-- ���ʱ��  
	Goods_recommend int,				-- �Ƿ��Ƽ���0�����Ƽ���1���Ƽ��� 
	Goods_grounding int,				-- �Ƿ��ϼ� ��0�����ϼܣ�1���ϼܣ�
	Goods_filed varchar(100),			-- ��Ʒ����  
	Goods_season int,					-- ��Ʒ�ʺϼ��ڣ�0�����죬1�����죬2�����죬3�����죩
	Goods_isDel int DEFAULT 0,			-- �߼�ɾ��(0:δɾ����1����ɾ��)
	
	StoreInfo_ID int,					-- ���̹������
	GoodsType_ID int 					-- ��Ʒ���͹������
)
select * from GoodsInfo


----------��Ʒ�����GoodsE��
if exists(select * from sys.objects where name='GoodsE')
begin
	drop table GoodsE
end
go
create table GoodsE
(	
	GoodsE_Id int primary key identity(1,1),
	Goods_count int,					-- ��Ʒ���
	Goods_Color varchar(100),			--��Ʒ��ɫ����ʽ��
	Goods_CodeNumber  varchar(100),		--��Ʒ����
	GoodsInfo_Id int 					--��Ʒ���
	
)
select * from GoodsE

----------��ƷͼƬ��GoodsImg��
if exists(select * from sys.objects where name='GoodsImg')
begin
	drop table GoodsImg
end
go
create table GoodsImg
(
	GoodsImg_id int PRIMARY KEY identity(1,1),		-- ��ƷͼƬ���  
	GoodsImg_thumbone varchar(100),		-- ��Ʒ��ϸͼ1  
	GoodsImg_thumbone_big varchar(100),	-- ��Ʒ��ϸͼ1(��ͼ)  
	GoodsImg_thumbtwo varchar(100),		-- ��Ʒ��ϸͼ2
	GoodsImg_thumbtwo_big varchar(100),	-- ��Ʒ��ϸͼ2(��ͼ)    
	GoodsImg_thumbthree varchar(100),	-- ��Ʒ��ϸͼ3  
	GoodsImg_thumbthree_big varchar(100),-- ��Ʒ��ϸͼ3(��ͼ)   
	GoodsImg_detail text,				-- ��Ʒ����ͼ(�����ԵĴ�ͼ)  
	Goods_id int,						-- ��Ʒ����Id 
	Goods_color varchar(30)				-- ��Ʒ��ɫ 
)



----------�û��ղر�Collect��
if exists(select * from sys.objects where name='Collect')
begin
	drop table Collect
end
go
create table Collect
(
	Collect_id int PRIMARY KEY identity(1,1),			-- ��� 
	Collect_ctime datetime,			-- �ղ�ʱ��
	userid int,							-- �ղ��û�(�����û���Ϣ��)
	GoodsInfo_ID int,					-- �ղ���Ʒ(������Ʒ��)
)




----------�û��㼣��History���ݲ�ʹ��
if exists(select * from sys.objects where name='History')
begin
	drop table History
end
go
create table History
(
	footmark_id int PRIMARY KEY identity(1,1),		--  ���
	footmark_browsing_time datetime,	-- ���ʱ��
	userid int,							-- �û�id
	GoodsInfo_ID int,					-- ��Ʒid
)




----------��������ShopManagement��
if exists(select * from sys.objects where name='ShopManagement')
begin
	drop table ShopManagement
end
go
create table ShopManagement
(
	cart_id int PRIMARY KEY identity(1,1),			-- ���ﳵID
	cart_addtime datetime,				-- ���ʱ��
	cart_photo nvarchar(64),            -- ��ƷͼƬ
	cart_quantity int,					-- ��Ʒ����
	cart_color nvarchar(64),            -- ��Ʒ��ɫ
	cart_CodeNumber nvarchar(64),       -- ��Ʒ�ߴ�         
	GoodsInfo_ID int,					-- ��ƷID
	userid int,							-- �ͻ�ID
	StoreInfo_ID int,					-- ����id	
	cart_price decimal(8,2),			-- �ۺ��
	cart_remark nvarchar(200),          -- ��Ʒ����
)


--------------��ѯ��Ϣ���ͷ�ͬ���䣩ServiceInfo




----------��Ʒ���۱�Evaluate��
if exists(select * from sys.objects where name='Evaluate')
begin
	drop table Evaluate
end
go
create table Evaluate
(
	eva_id int PRIMARY KEY identity(1,1),			-- ���۱�id
	eva_rcontent text,				-- �ظ�����
	userid int,						-- ������(�����û���)
	eva_rtime datetime,				-- �ظ�ʱ��
	manager_id int,					-- �ظ���(�̼�)
	eva_etime datetime,			-- ����ʱ��
	eva_content text,				-- ��������
	eva_rank int,					-- ���۵ȼ�(1-5)
	orderdetails_id int,			-- ������ϸid
)



----------�ֲ�ͼ��TurnsImg��:����Աά��ʱ�޸�
if exists(select * from sys.objects where name='TurnsImg')
begin
	drop table TurnsImg
end
go
create table TurnsImg
(
	alternatePlay_id int PRIMARY KEY identity(1,1),	-- �ֲ�ͼƬ���
	alternatePlay_img varchar(50),		-- �ֲ�ͼƬ
	alternatePlay_time datetime,		-- �ֲ�ͼƬ���ʱ��
	alternatePlay_isDel int DEFAULT 0,	-- �ֲ�ͼƬɾ��(0��δɾ����1��ɾ��)
	GoodsInfo_ID int,					-- ��Ʒ�������
)



----------������Ϣ��NoticeInfo���̼ҽ��д��ۻ���лʱ����
if exists(select * from sys.objects where name='NoticeInfo')
begin
	drop table NoticeInfo
end
go
create table NoticeInfo
(
	announcement_id int PRIMARY KEY,	-- ����ID
	announcement_title varchar(50),		-- ����
	announcement_content text,			-- ����
	manager_id int,						-- ������
	announcement_time datetime,		-- ����ʱ��
	announcement_isDel int default 0,	-- �߼�ɾ��(0��δɾ����1��ɾ��)
)



----------�û���ַ��tbl_AddressInfo�����ڽ��и���ǰѡ���ջ���ַ
if exists(select * from sys.objects where name='tbl_AddressInfo')
begin
	drop table tbl_AddressInfo
end
go
create table tbl_AddressInfo
(
	address_Id int PRIMARY KEY identity(1,1),			-- ��ַid
	address_isDefault int,				-- �Ƿ�Ĭ�ϵ�ַ 1Ϊ����Ĭ�ϵ�ַ 0Ϊ���� 
	address_shengfen varchar(100),		-- ʡ��
	address_city varchar(100),			-- ����
	address_qu varchar(100),			-- ����
	address_street varchar(100),		-- �ֵ�
	address_detail varchar(100),		-- ��ϸ��ַ
	address_telephone varchar(20),		-- �ֻ�����
	address_name varchar(20),			-- �ջ�������
	userid int,							-- �û�Id
	address_isDel int DEFAULT 0,		-- �߼�ɾ��(0��δɾ����1����ɾ��)
)

select * from tbl_AddressInfo


----------���������tbl_orderdetailsInfo����������ɺ�ĸõ�����ж���
if exists(select * from sys.objects where name='tbl_orderdetailsInfo')
begin
	drop table tbl_orderdetailsInfo
end
go
create table tbl_orderdetailsInfo
(
	orderdetails_id int PRIMARY KEY identity(1,1),		-- ����������
	orderdetails_totalprice decimal(8,2),	-- ��Ʒ�ܼ�
	orderdetails_quantity int,				-- ��Ʒ����
	cart_color nvarchar(64),				-- ��Ʒ��ɫ
	cart_CodeNumber nvarchar(64),			-- ��Ʒ�ߴ�  
	cart_photo nvarchar(64),				-- ��ƷͼƬ
	cart_remark nvarchar(200),				-- ��Ʒ��Ϣ 
	orderdetails_unitprice decimal(8,2),	-- ��Ʒ�ۺ��

	GoodsInfo_id int,						-- ��Ʒ���
	order_id int,							-- ����id,
	orderdetails_price decimal(8,2),		-- ��Ʒ����� 
	StoreInfo_ID int,						-- ����id
	UserInfo_id int							-- �û����
)

----------������OrderBySeller��
if exists(select * from sys.objects where name='OrderBySeller')
begin
	drop table OrderBySeller
end
go
create table OrderBySeller
(
	order_id int primary key identity(1,1),			-- ����Id
	order_createTime datetime,			-- 	����ʱ��
	order_status int,					-- ����״̬ ��������:0����������1�����ջ���2��������ɣ�3��ʧЧ��4��
	orderdetails_status int,			-- ��������״̬(�Ƿ����ۣ�δ���� -1 ,0��δ���ۣ�1��������)
	order_cost decimal(8,2),			-- ����۸�
	userid int,							-- �ͻ�ID
	GoodsInfo_ID int,					-- ��ƷID
	order_no nvarchar(64),				-- ������
	order_paytime datetime,				--����ʱ��
	order_shiptime datetime,			--����ʱ��
	order_makedtime datetime,			--�ջ�ʱ��
)
select * from OrderBySeller


----------����������ң���OrderByCostomers�������������ҵĶ����ϳ�һ����
--if exists(select * from sys.objects where name='OrderByCostomers')
--begin
--	drop table OrderByCostomers
--end
--go
--create table OrderByCostomers
--(
--	order_Costomers_id int primary key,	-- ����Id
--	order_createTime datetime,			-- ����ʱ��
--	order_status int,					-- ����״̬ ��������:0����������1�����ջ���2��������ɣ�3��ʧЧ��4��
--	order_cost decimal(8,2),			-- ����۸�
--	order_no varchar(30),				-- ������
--	order_paytime time,					--����ʱ��
--	order_shiptime datetime,			--����ʱ��
--	order_makedtime datetime,			--�ջ�ʱ��
--)



----------������Ϣ��Logistics��
if exists(select * from sys.objects where name='Logistics')
begin
	drop table Logistics
end
go
create table Logistics
(
	Log_ID int primary key identity(1,1),	--�������
	Log_name nvarchar(64),					--��ݹ�˾��
	username nvarchar(64),					--�ջ�������
	Log_adrees nvarchar(128),				--�ջ��˵�ַ
	Log_tel varchar(20) ,					--��ݹ�˾�绰
	order_no varchar(30),					--������
)

------------���Ҹ�����Ϣ��SellerUser��
--if exists(select * from sys.objects where name='SellerUser')
--begin
--	drop table SellerUser
--end
--go
--create table SellerUser
--(
--	seller_id int PRIMARY KEY identity(1,1),		-- ���
--	seller_name varchar(20),			-- ����
--	seller_email varchar(30),			-- ����
--	seller_password varchar(50),		-- ����
--	seller_telphone varchar(11),		-- �绰
--	seller_idcard varchar(18),		-- ���֤����
--	seller_photo varchar(200),		-- ͷ��
--	seller_status int DEFAULT 0,				-- ״̬(0��δ���ߣ�1��������)
--	seller_remark varchar(100),		-- ��ע
--	seller_createTime datetime		-- ע��ʱ��

--)


------------��Ҹ�����Ϣ��CostomersUser��
--if exists(select * from sys.objects where name='CostomersUser')
--begin
--	drop table CostomersUser
--end
--go
--create table CostomersUser
--(
--	userid int PRIMARY KEY identity(1,1),			-- ���
--	username varchar(20),			-- �ǳ�
--	user_email varchar(30),			-- ����
--	user_password varchar(50),		-- ����
--	user_telphone varchar(11),		-- �绰
--	user_photo varchar(200),		-- ͷ��
--	--user_qq_id varchar(50),			-- QQid
--	user_status int,				-- ״̬(0��δ���ߣ�1��������)
--	user_remark varchar(100),		-- ��ע
--	user_createTime datetime		-- ע��ʱ��

--)

