
use SportsDB
go
--添加数据表


select * from ShopManagement

----------超级管理员信息表（tbl_manager）
insert into tbl_manager values('admin','123456')
insert into tbl_manager values('manager','456789')
insert into tbl_manager values('admin2','123123')

------------用户个人信息（UserInfo）
insert into UserInfo values('17745586535','111111',0,'2017-8-09 09:08:45.140',1)
insert into UserInfo values('zhangsan@123.com','123456',0,'2017-6-01 09:08:45.140',2)
insert into UserInfo values('533130199810102223','789465',0,'2017-10-23 09:08:45.140',3)
insert into UserInfo values('8543655258','987654',0,'2017-3-02 09:08:45.140',4)
insert into UserInfo values('15362635652','666666',0,'2017-4-23 09:08:45.140',5)
insert into UserInfo values('1205632489','123132',0,'2017-10-05 09:08:45.140',null)
insert into UserInfo values('530130200206052365','456456',0,'2017-10-02 09:08:45.140',null)
insert into UserInfo values('18912515213','789789',0,'2017-10-03 09:08:45.140',null)
insert into UserInfo values('daji@123.com','123123',0,GETDATE(),null)
insert into UserInfo values('lmy@123.com','123456',0,GETDATE(),null)

----------用户个人详细信息（UserInfo_detail）
insert into UserInfo_detail values(1,'王姬','福利','女','wangji@123.com','17745586535','530130199902032396','1473066298','6.jpg',1000,'adidas专卖店')
insert into UserInfo_detail values(2,'张三','未知名','男','zhangsan@123.com','12345678910','433130199810242263','15212365487','1.jpg',500,'运动服饰')
insert into UserInfo_detail values(3,'李思维','未知名','男','lisiwei@123.com','13764215241','533130199810102223','1562356844','2.jpg',500,'Man日志')
insert into UserInfo_detail values(4,'王珊珊','姗姗','女','wangshanshan@123.com','15736145358','53013019981011226x','8543655258','3.jpg',600,'爱尚美女装')
insert into UserInfo_detail values(5,'浦西','西施','女','puxi@123.com','15362635652','53013019891211226x','1962533687','4.jpg',700,'运动旗舰店')
insert into UserInfo_detail values(6,'未知名','赵信','男','zhaoxin@123.com','18912515213','430130200022225658','1205632489','5.jpg',800,'篮球')
insert into UserInfo_detail values(7,'未知名','李四','男','lisi@123.com','15362635652','530130200206052365','1856957452','7.jpg',600,null)
insert into UserInfo_detail values(8,'李云龙','李逍遥','男','lixiaoyao@123.com','18912515213','53013019971012632x','2865655238','8.jpg',700,'篮球')
insert into UserInfo_detail values(9,'未知名','妲己','女','daji@123.com','17745586535','530130199912034252','1896547521','9.jpg',700,null)
insert into UserInfo_detail values(10,'鲁门该','流氓燕','女','lmy@123.com','17745986535','530130199902032396','1473066298','6.jpg',100,'adidas专卖店')


----------店铺管理信息（StoreInfo）

insert StoreInfo values(1,'adidas专卖店',null)
insert StoreInfo values(2,'运动服饰',null)
insert StoreInfo values(3,'Man日志',null)
insert StoreInfo values(4,'爱尚美女装',null)
insert StoreInfo values(5,'运动旗舰店',null)


----------商品类型（GoodsType）

insert GoodsType values('衣服')
insert GoodsType values('裤子')
insert GoodsType values('套装')	
insert GoodsType values('鞋子')
insert GoodsType values('运动用品')
insert GoodsType values('帽子')	 


----------店铺和商品类型的关联表（StoreInfo_X_GoodsType）
insert StoreInfo_X_GoodsType values(1,1)--adidas专卖店
insert StoreInfo_X_GoodsType values(1,2)
insert StoreInfo_X_GoodsType values(1,3)
insert StoreInfo_X_GoodsType values(1,4)
insert StoreInfo_X_GoodsType values(2,1)--运动服饰
insert StoreInfo_X_GoodsType values(2,2)
insert StoreInfo_X_GoodsType values(2,3)
insert StoreInfo_X_GoodsType values(2,4)
insert StoreInfo_X_GoodsType values(3,1)--Man日志
insert StoreInfo_X_GoodsType values(3,2)
insert StoreInfo_X_GoodsType values(3,3)
insert StoreInfo_X_GoodsType values(3,4)
insert StoreInfo_X_GoodsType values(3,5)
insert StoreInfo_X_GoodsType values(3,6)
insert StoreInfo_X_GoodsType values(4,1)--爱尚美女装
insert StoreInfo_X_GoodsType values(4,2)
insert StoreInfo_X_GoodsType values(4,3)
insert StoreInfo_X_GoodsType values(4,4)
insert StoreInfo_X_GoodsType values(5,1)--运动旗舰店
insert StoreInfo_X_GoodsType values(5,2)
insert StoreInfo_X_GoodsType values(5,3)
insert StoreInfo_X_GoodsType values(5,4)
insert StoreInfo_X_GoodsType values(5,5)
insert StoreInfo_X_GoodsType values(5,6)


----------商品信息（GoodsInfo）
----------商品详情表（GoodsE）
----------商品图片表（GoodsImg）


select * from Logistics

------------用户个人信息（UserInfo）
select * from tbl_manager

----------用户个人详细信息（UserInfo_detail）
select * from UserInfo_detail

----------店铺管理信息（StoreInfo）
select * from StoreInfo

select * from GoodsType

----------商品信息（GoodsInfo）
select * from GoodsInfo

----------商品详情表（GoodsE）
select * from GoodsE

----------商品图片表（GoodsImg）
select * from GoodsImg


----------用户收藏表（Collect）
select * from Collect


----------用户足迹表（History）暂不使用
select * from History






----------购物管理表（ShopManagement）

--insert ShopManagement values('2017-8-09 09:08:45.140','Shopimg/Hat/Hat_four_big_5.jpg',2,'米白色','默认',48,8,120,'毛线帽子韩版秋冬女保暖针织帽')
--insert ShopManagement values('2017-8-09 09:08:45.140','Shopimg/Hat/Hat_four_big_5.jpg',1,'深咖色','默认',48,6,120,'毛线帽子韩版秋冬女保暖针织帽')
--insert ShopManagement values('2017-9-19 09:08:45.140','Shopimg/Hat/Hat_two_big_2.jpg',1,'白色','默认',47,7,129,'韩版八角帽男女复古潮')
--insert ShopManagement values('2017-10-09 09:08:45.140','Shopimg/Yoga/yuga_big_1_1.jpg',1,'深紫色','默认',36,6,190,'高密度加厚加长男女健身垫')
--insert ShopManagement values('2017-7-09 09:08:45.140','Shopimg/Shoes/Casual_woman_three_big_3.jpg',1,'浅灰色','37',29,7,369,'2017新款女士运动休闲透气网鞋')

--select * from ShopManagement

--select * from ServiceInfo

----------商品评价表（Evaluate）
select * from Evaluate

----------轮播图表（TurnsImg）:管理员维护时修改
select * from TurnsImg

----------公告信息表（NoticeInfo）商家进行打折或进行活动时发布
select * from NoticeInfo


----------用户地址表（tbl_AddressInfo）：在进行付款前选择收货地址
insert tbl_AddressInfo values(1,'湖北','武汉','洪山','雄楚大道666号(中南财经政法大学)','湖北省武汉市洪山区雄楚大道666号(中南财经政法大学)','15871145629','艾迪',6,0)
insert tbl_AddressInfo values(0,'湖南','长沙','江北','凌云大道111号','湖南省长沙市江北区凌云大道111号','15778485752','艾迪',6,0)
insert tbl_AddressInfo values(1,'重庆','沙坪坝','大学城','重庆大学','重庆市市沙坪坝区大学城重庆大学','15986457852','缇娜',5,0)
insert tbl_AddressInfo values(0,'四川','成都','双流','学诚大道666号','四川省成都市双流区学诚大道666号','15487652341','滴滴',7,0)
insert tbl_AddressInfo values(1,'四川','成都','都江堰','犀浦XX大道100号','四川省成都市都江堰区犀浦XX大道100号','15487654234','滴滴',7,0)
insert tbl_AddressInfo values(1,'重庆','沙坪坝','西永镇','西科大道','重庆市沙坪坝区西永镇西科大道足下软件学院','15736145357','妲己',9,0)

select * from tbl_AddressInfo

----------订单详情表（tbl_orderdetailsInfo）：交易完成后的该店的所有订单
select * from tbl_orderdetailsInfo