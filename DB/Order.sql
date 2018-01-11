use SportsDB
go
----------购物车管理表（ShopManagement）
--insert ShopManagement values('2017-7-07 09:08:45.140','Shopimg/Shoes/Casual_woman_three_big_3.jpg',1,'浅灰色','37',29,9,369,'2017新款女士运动休闲透气网鞋')
--insert ShopManagement values('2017-8-09 09:08:45.140','Shopimg/Hat/Hat_four_big_5.jpg',1,'深咖色','默认',48,6,120,'毛线帽子韩版秋冬女保暖针织帽')
--insert ShopManagement values('2017-8-09 09:08:45.140','Shopimg/Hat/Hat_two_big_2.jpg',1,'白色','默认',48,6,119,'韩版八角帽男女复古潮')
--insert ShopManagement values('2017-8-09 09:08:45.140','Shopimg/Shoes/Casual_woman_three_big_3.jpg',1,'浅灰色','38',28,7,369,'2017新款女士运动时尚女网鞋')
--insert ShopManagement values('2017-9-19 09:07:45.140','Shopimg/Hat/Hat_two_big_2.jpg',1,'白色','默认',47,7,119,'韩版八角帽男女复古潮')
--insert ShopManagement values('2017-10-09 09:08:45.140','Shopimg/Yoga/yuga_big_1_1.jpg',1,'深紫色','默认',36,8,180,'高密度加厚加长男女健身垫')



----------订单表（OrderBySeller）
insert OrderBySeller values('2017-7-07 15:04:45',2,1,120,9,28,'X20170707150445','2017-7-07 15:08:45','2017-7-09 7:50:45','2017-7-13 12:08:45')
insert OrderBySeller values('2017-9-23 11:08:45',1,1,369,6,48,'Q20170923110845','2017-9-23 11:13:25','2017-9-24 8:10:25','2017-10-01 21:00:45')
insert OrderBySeller values('2017-9-20 09:08:45',3,2,120,7,47,'Q20170920090845','2017-9-25 15:08:45','2017-9-26 9:50:45','2017-10-04 12:08:45')
insert OrderBySeller values('2017-9-19 09:08:45',3,0,120,7,28,'Q20170809231108','','','')--未付款
insert OrderBySeller values('2017-10-09 09:10:45',1,1,180,8,36,'QC20171009091045','2017-10-09 09:11:25','','')--待发货
select * from OrderBySeller

----------订单详情表（tbl_orderdetailsInfo）：未付钱交易的所有订单
insert tbl_orderdetailsInfo values(389,1,'浅灰色','37','Shopimg/Shoes/Casual_woman_three_big_3.jpg','2017新款女士运动休闲透气网鞋',369,29,1,369,5,9)
insert tbl_orderdetailsInfo values(129,1,'深咖色','默认','Shopimg/Hat/Hat_four_big_1.jpg','毛线帽子韩版秋冬女保暖针织帽经典户外情侣男护耳套头帽',120,48,2,120,4,9)
insert tbl_orderdetailsInfo values(389,1,'白色','默认','Shopimg/Hat/Hat_two_big_2.jpg','韩版八角帽男女复古潮',119,47,3,119,3,8)
insert tbl_orderdetailsInfo values(389,1,'浅灰色','38','Shopimg/Shoes/Casual_woman_three_big_3.jpg','2017新款女士运动时尚女网鞋',369,28,4,119,4,7)
insert tbl_orderdetailsInfo values(198,1,'深紫色','默认','Shopimg/Hat/Hat_four_big_1.jpg','高密度加厚加长男女健身垫',180,48,5,180,4,6)
select * from tbl_orderdetailsInfo

----------商品评价表（Evaluate）
insert Evaluate values('好评,但是物流太慢了',7,'2017-10-05 21:08:45',4,'2017-10-05 21:10:45','亲，不好意思，由于我们物流公司出了问题，所以耽误了你收货时间，非常抱歉',4,3)
insert Evaluate values('一般般吧',8,'2017-10-13 07:08:45',null,null,null,4,5)
insert Evaluate values('好评',9,'2017-7-14 15:08:45',null,null,null,5,6)
