
/**********
 *      SpecialSports网站数据库脚本
 *
 *      author:张鑫,蒲莉,鲁梦媛,Z.H
 *      date: 10/16/2017
 **/
 
 
 
----------------------------创建数据库（SportsDB）
if exists(select * from sys.databases where name='SportsDB')
begin
	drop database SportsDB
end
go
create database SportsDB
go
use SportsDB
go



----------超级管理员信息表（tbl_manager）
if exists(select * from sys.objects where name='tbl_manager')
begin
	drop table tbl_manager
end
go
create table tbl_manager
(
	manager_id int PRIMARY KEY identity(1,1),		-- 管理员编号 
	manager_name varchar(20),		-- 管理员登录名 
	manager_pwd varchar(20)			-- 管理员密码 
)

----------用户个人信息（UserInfo）
if exists(select * from sys.objects where name='UserInfo')
begin
	drop table UserInfo
end
go
create table UserInfo
(
	userid int PRIMARY KEY identity(1,1),			-- 编号
	name nvarchar(64),              -- 注册帐号
	user_password varchar(50),		-- 密码
	user_status int,				-- 状态(0：未在线，1：已在线)
	user_createTime datetime,		-- 注册时间
	store_id int					-- 店铺id
)


----------用户个人详细信息（UserInfo_detail）
if exists(select * from sys.objects where name='UserInfo_detail')
begin
	drop table UserInfo_detail
end
go
create table UserInfo_detail
(
	detailId int primary key identity(1,1), --详细ID
	userid int ,							--用户编号
	username varchar(20),			-- 真实姓名
	user_nickname varchar(20),		-- 昵称
	user_sex varchar(2),			-- 性别
	user_email varchar(30),			-- 邮箱
	user_telphone varchar(11),		-- 电话
	user_idcard varchar(18),		-- 身份证号码
	user_qq varchar(50),			-- QQ号
	user_photo varchar(200),		-- 头像
	user_money Decimal(8,2),		--余额
	user_remark varchar(100)		-- 备注
)





----------店铺管理信息（StoreInfo）
if exists(select * from sys.objects where name='StoreInfo')
begin
	drop table StoreInfo
end
go
create table StoreInfo
(
	Id int primary key identity(1,1),	-- 商店编号
	userid int not null,				-- 卖家用户Id
	StoreName  nvarchar(64) not null,	-- 商店名称
	StoreURL nvarchar(64)  null,		-- 商店网址主页
	--GoodsType_ID int 					-- 商品类型关联编号
)


----------商品类型（GoodsType）
if exists(select * from sys.objects where name='GoodsType')
begin
	drop table GoodsType
end
go
create table GoodsType
(
	Id int primary key identity(1,1),	-- 类型编号
	TypeName nvarchar(64) not null,		-- 类型名称
)



----------商品类型详情表（GoodsTypeInfo）
if exists(select * from sys.objects where name='GoodsTypeInfo')
begin
	drop table GoodsTypeInfo
end
go
create table GoodsTypeInfo
(
	Id int primary key identity(1,1),	-- 类型详情编号
	GoodsType_Id int,					-- 类型编号
	TypeName nvarchar(64)		,		-- 类型详情名称
	Typeremark varchar(100)				-- 类型详情备注
)
----------店铺和商品类型的关联表（StoreInfo_X_GoodsType）
if exists(select * from sys.objects where name='StoreInfo_X_GoodsType')
begin
	drop table StoreInfo_X_GoodsType
end
go
create table StoreInfo_X_GoodsType
(
	Id int primary key identity(1,1),	-- 类型编号
	StoreInfoId int not null,		-- 类型名称
	GoodsTypeId int	-- 商店编号
)


----------商品信息（GoodsInfo）
if exists(select * from sys.objects where name='GoodsInfo')
begin
	drop table GoodsInfo
end
go
create table GoodsInfo
(
	Id int primary key identity(1,1),
	GoodsName  nvarchar(64) not null,	-- 商品名称
	Goods_number varchar(20),			-- 商品货号		Y:衣服  K:裤子  X:鞋子  Q:帽子	T:套装	QC:运动用品
	GoodsURL nvarchar(64) not null,		-- 商品链接		图片路径
	Goods_remark text,					-- 商品描述  
	Goods_price decimal(8,2),			-- 销售价格  
	Goods_addtime datetime,				-- 添加时间  
	Goods_recommend int,				-- 是否推荐（0：不推荐，1：推荐） 
	Goods_grounding int,				-- 是否上架 （0：不上架，1：上架）
	Goods_filed varchar(100),			-- 商品产地  
	Goods_season int,					-- 商品适合季节（0：春天，1：夏天，2：秋天，3：冬天）
	Goods_isDel int DEFAULT 0,			-- 逻辑删除(0:未删除，1：已删除)
	
	StoreInfo_ID int,					-- 店铺关联编号
	GoodsType_ID int 					-- 商品类型关联编号
)
select * from GoodsInfo


----------商品详情表（GoodsE）
if exists(select * from sys.objects where name='GoodsE')
begin
	drop table GoodsE
end
go
create table GoodsE
(	
	GoodsE_Id int primary key identity(1,1),
	Goods_count int,					-- 商品库存
	Goods_Color varchar(100),			--商品颜色（款式）
	Goods_CodeNumber  varchar(100),		--商品码数
	GoodsInfo_Id int 					--商品编号
	
)
select * from GoodsE

----------商品图片表（GoodsImg）
if exists(select * from sys.objects where name='GoodsImg')
begin
	drop table GoodsImg
end
go
create table GoodsImg
(
	GoodsImg_id int PRIMARY KEY identity(1,1),		-- 商品图片编号  
	GoodsImg_thumbone varchar(100),		-- 商品详细图1  
	GoodsImg_thumbone_big varchar(100),	-- 商品详细图1(大图)  
	GoodsImg_thumbtwo varchar(100),		-- 商品详细图2
	GoodsImg_thumbtwo_big varchar(100),	-- 商品详细图2(大图)    
	GoodsImg_thumbthree varchar(100),	-- 商品详细图3  
	GoodsImg_thumbthree_big varchar(100),-- 商品详细图3(大图)   
	GoodsImg_detail text,				-- 商品详情图(评价旁的大图)  
	Goods_id int,						-- 商品关联Id 
	Goods_color varchar(30)				-- 商品颜色 
)



----------用户收藏表（Collect）
if exists(select * from sys.objects where name='Collect')
begin
	drop table Collect
end
go
create table Collect
(
	Collect_id int PRIMARY KEY identity(1,1),			-- 编号 
	Collect_ctime datetime,			-- 收藏时间
	userid int,							-- 收藏用户(外联用户信息表)
	GoodsInfo_ID int,					-- 收藏商品(外联商品表)
)




----------用户足迹表（History）暂不使用
if exists(select * from sys.objects where name='History')
begin
	drop table History
end
go
create table History
(
	footmark_id int PRIMARY KEY identity(1,1),		--  编号
	footmark_browsing_time datetime,	-- 浏览时间
	userid int,							-- 用户id
	GoodsInfo_ID int,					-- 商品id
)




----------购物管理表（ShopManagement）
if exists(select * from sys.objects where name='ShopManagement')
begin
	drop table ShopManagement
end
go
create table ShopManagement
(
	cart_id int PRIMARY KEY identity(1,1),			-- 购物车ID
	cart_addtime datetime,				-- 添加时间
	cart_photo nvarchar(64),            -- 商品图片
	cart_quantity int,					-- 商品数量
	cart_color nvarchar(64),            -- 商品颜色
	cart_CodeNumber nvarchar(64),       -- 商品尺寸         
	GoodsInfo_ID int,					-- 商品ID
	userid int,							-- 客户ID
	StoreInfo_ID int,					-- 商铺id	
	cart_price decimal(8,2),			-- 折后价
	cart_remark nvarchar(200),          -- 商品介绍
)


--------------咨询信息表（客服同邮箱）ServiceInfo




----------商品评价表（Evaluate）
if exists(select * from sys.objects where name='Evaluate')
begin
	drop table Evaluate
end
go
create table Evaluate
(
	eva_id int PRIMARY KEY identity(1,1),			-- 评价表id
	eva_rcontent text,				-- 回复内容
	userid int,						-- 评价人(外联用户表)
	eva_rtime datetime,				-- 回复时间
	manager_id int,					-- 回复人(商家)
	eva_etime datetime,			-- 评价时间
	eva_content text,				-- 评价内容
	eva_rank int,					-- 评价等级(1-5)
	orderdetails_id int,			-- 订单详细id
)



----------轮播图表（TurnsImg）:管理员维护时修改
if exists(select * from sys.objects where name='TurnsImg')
begin
	drop table TurnsImg
end
go
create table TurnsImg
(
	alternatePlay_id int PRIMARY KEY identity(1,1),	-- 轮播图片编号
	alternatePlay_img varchar(50),		-- 轮播图片
	alternatePlay_time datetime,		-- 轮播图片添加时间
	alternatePlay_isDel int DEFAULT 0,	-- 轮播图片删除(0：未删除，1：删除)
	GoodsInfo_ID int,					-- 商品关联编号
)



----------公告信息表（NoticeInfo）商家进行打折或进行活动时发布
if exists(select * from sys.objects where name='NoticeInfo')
begin
	drop table NoticeInfo
end
go
create table NoticeInfo
(
	announcement_id int PRIMARY KEY,	-- 公告ID
	announcement_title varchar(50),		-- 标题
	announcement_content text,			-- 内容
	manager_id int,						-- 发布人
	announcement_time datetime,		-- 发布时间
	announcement_isDel int default 0,	-- 逻辑删除(0：未删除，1：删除)
)



----------用户地址表（tbl_AddressInfo）：在进行付款前选择收货地址
if exists(select * from sys.objects where name='tbl_AddressInfo')
begin
	drop table tbl_AddressInfo
end
go
create table tbl_AddressInfo
(
	address_Id int PRIMARY KEY identity(1,1),			-- 地址id
	address_isDefault int,				-- 是否默认地址 1为设置默认地址 0为其他 
	address_shengfen varchar(100),		-- 省份
	address_city varchar(100),			-- 城市
	address_qu varchar(100),			-- 区名
	address_street varchar(100),		-- 街道
	address_detail varchar(100),		-- 详细地址
	address_telephone varchar(20),		-- 手机号码
	address_name varchar(20),			-- 收货人姓名
	userid int,							-- 用户Id
	address_isDel int DEFAULT 0,		-- 逻辑删除(0：未删除，1：已删除)
)

select * from tbl_AddressInfo


----------订单详情表（tbl_orderdetailsInfo）：交易完成后的该店的所有订单
if exists(select * from sys.objects where name='tbl_orderdetailsInfo')
begin
	drop table tbl_orderdetailsInfo
end
go
create table tbl_orderdetailsInfo
(
	orderdetails_id int PRIMARY KEY identity(1,1),		-- 订单详情编号
	orderdetails_totalprice decimal(8,2),	-- 商品总价
	orderdetails_quantity int,				-- 商品数量
	cart_color nvarchar(64),				-- 商品颜色
	cart_CodeNumber nvarchar(64),			-- 商品尺寸  
	cart_photo nvarchar(64),				-- 商品图片
	cart_remark nvarchar(200),				-- 商品信息 
	orderdetails_unitprice decimal(8,2),	-- 商品折后价

	GoodsInfo_id int,						-- 商品编号
	order_id int,							-- 订单id,
	orderdetails_price decimal(8,2),		-- 商品购买价 
	StoreInfo_ID int,						-- 商铺id
	UserInfo_id int							-- 用户编号
)

----------订单表（OrderBySeller）
if exists(select * from sys.objects where name='OrderBySeller')
begin
	drop table OrderBySeller
end
go
create table OrderBySeller
(
	order_id int primary key identity(1,1),			-- 订单Id
	order_createTime datetime,			-- 	创建时间
	order_status int,					-- 订单状态 【待付款:0、待发货：1、待收货：2、交易完成：3、失效：4】
	orderdetails_status int,			-- 订单详情状态(是否评价，未付款 -1 ,0：未评价，1：已评价)
	order_cost decimal(8,2),			-- 结算价格
	userid int,							-- 客户ID
	GoodsInfo_ID int,					-- 商品ID
	order_no nvarchar(64),				-- 订单号
	order_paytime datetime,				--付款时间
	order_shiptime datetime,			--发货时间
	order_makedtime datetime,			--收货时间
)
select * from OrderBySeller


----------订单管理（买家）（OrderByCostomers）：可以与卖家的订单合成一个表
--if exists(select * from sys.objects where name='OrderByCostomers')
--begin
--	drop table OrderByCostomers
--end
--go
--create table OrderByCostomers
--(
--	order_Costomers_id int primary key,	-- 订单Id
--	order_createTime datetime,			-- 创建时间
--	order_status int,					-- 订单状态 【待付款:0、待发货：1、待收货：2、交易完成：3、失效：4】
--	order_cost decimal(8,2),			-- 结算价格
--	order_no varchar(30),				-- 订单号
--	order_paytime time,					--付款时间
--	order_shiptime datetime,			--发货时间
--	order_makedtime datetime,			--收货时间
--)



----------物流信息表（Logistics）
if exists(select * from sys.objects where name='Logistics')
begin
	drop table Logistics
end
go
create table Logistics
(
	Log_ID int primary key identity(1,1),	--物流编号
	Log_name nvarchar(64),					--快递公司名
	username nvarchar(64),					--收货人姓名
	Log_adrees nvarchar(128),				--收货人地址
	Log_tel varchar(20) ,					--快递公司电话
	order_no varchar(30),					--订单号
)

------------卖家个人信息（SellerUser）
--if exists(select * from sys.objects where name='SellerUser')
--begin
--	drop table SellerUser
--end
--go
--create table SellerUser
--(
--	seller_id int PRIMARY KEY identity(1,1),		-- 编号
--	seller_name varchar(20),			-- 姓名
--	seller_email varchar(30),			-- 邮箱
--	seller_password varchar(50),		-- 密码
--	seller_telphone varchar(11),		-- 电话
--	seller_idcard varchar(18),		-- 身份证号码
--	seller_photo varchar(200),		-- 头像
--	seller_status int DEFAULT 0,				-- 状态(0：未在线，1：已在线)
--	seller_remark varchar(100),		-- 备注
--	seller_createTime datetime		-- 注册时间

--)


------------买家个人信息（CostomersUser）
--if exists(select * from sys.objects where name='CostomersUser')
--begin
--	drop table CostomersUser
--end
--go
--create table CostomersUser
--(
--	userid int PRIMARY KEY identity(1,1),			-- 编号
--	username varchar(20),			-- 昵称
--	user_email varchar(30),			-- 邮箱
--	user_password varchar(50),		-- 密码
--	user_telphone varchar(11),		-- 电话
--	user_photo varchar(200),		-- 头像
--	--user_qq_id varchar(50),			-- QQid
--	user_status int,				-- 状态(0：未在线，1：已在线)
--	user_remark varchar(100),		-- 备注
--	user_createTime datetime		-- 注册时间

--)

