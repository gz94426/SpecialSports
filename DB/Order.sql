use SportsDB
go
----------���ﳵ�����ShopManagement��
--insert ShopManagement values('2017-7-07 09:08:45.140','Shopimg/Shoes/Casual_woman_three_big_3.jpg',1,'ǳ��ɫ','37',29,9,369,'2017�¿�Ůʿ�˶�����͸����Ь')
--insert ShopManagement values('2017-8-09 09:08:45.140','Shopimg/Hat/Hat_four_big_5.jpg',1,'�ɫ','Ĭ��',48,6,120,'ë��ñ�Ӻ����ﶬŮ��ů��֯ñ')
--insert ShopManagement values('2017-8-09 09:08:45.140','Shopimg/Hat/Hat_two_big_2.jpg',1,'��ɫ','Ĭ��',48,6,119,'����˽�ñ��Ů���ų�')
--insert ShopManagement values('2017-8-09 09:08:45.140','Shopimg/Shoes/Casual_woman_three_big_3.jpg',1,'ǳ��ɫ','38',28,7,369,'2017�¿�Ůʿ�˶�ʱ��Ů��Ь')
--insert ShopManagement values('2017-9-19 09:07:45.140','Shopimg/Hat/Hat_two_big_2.jpg',1,'��ɫ','Ĭ��',47,7,119,'����˽�ñ��Ů���ų�')
--insert ShopManagement values('2017-10-09 09:08:45.140','Shopimg/Yoga/yuga_big_1_1.jpg',1,'����ɫ','Ĭ��',36,8,180,'���ܶȼӺ�ӳ���Ů�����')



----------������OrderBySeller��
insert OrderBySeller values('2017-7-07 15:04:45',2,1,120,9,28,'X20170707150445','2017-7-07 15:08:45','2017-7-09 7:50:45','2017-7-13 12:08:45')
insert OrderBySeller values('2017-9-23 11:08:45',1,1,369,6,48,'Q20170923110845','2017-9-23 11:13:25','2017-9-24 8:10:25','2017-10-01 21:00:45')
insert OrderBySeller values('2017-9-20 09:08:45',3,2,120,7,47,'Q20170920090845','2017-9-25 15:08:45','2017-9-26 9:50:45','2017-10-04 12:08:45')
insert OrderBySeller values('2017-9-19 09:08:45',3,0,120,7,28,'Q20170809231108','','','')--δ����
insert OrderBySeller values('2017-10-09 09:10:45',1,1,180,8,36,'QC20171009091045','2017-10-09 09:11:25','','')--������
select * from OrderBySeller

----------���������tbl_orderdetailsInfo����δ��Ǯ���׵����ж���
insert tbl_orderdetailsInfo values(389,1,'ǳ��ɫ','37','Shopimg/Shoes/Casual_woman_three_big_3.jpg','2017�¿�Ůʿ�˶�����͸����Ь',369,29,1,369,5,9)
insert tbl_orderdetailsInfo values(129,1,'�ɫ','Ĭ��','Shopimg/Hat/Hat_four_big_1.jpg','ë��ñ�Ӻ����ﶬŮ��ů��֯ñ���仧�������л�����ͷñ',120,48,2,120,4,9)
insert tbl_orderdetailsInfo values(389,1,'��ɫ','Ĭ��','Shopimg/Hat/Hat_two_big_2.jpg','����˽�ñ��Ů���ų�',119,47,3,119,3,8)
insert tbl_orderdetailsInfo values(389,1,'ǳ��ɫ','38','Shopimg/Shoes/Casual_woman_three_big_3.jpg','2017�¿�Ůʿ�˶�ʱ��Ů��Ь',369,28,4,119,4,7)
insert tbl_orderdetailsInfo values(198,1,'����ɫ','Ĭ��','Shopimg/Hat/Hat_four_big_1.jpg','���ܶȼӺ�ӳ���Ů�����',180,48,5,180,4,6)
select * from tbl_orderdetailsInfo

----------��Ʒ���۱�Evaluate��
insert Evaluate values('����,��������̫����',7,'2017-10-05 21:08:45',4,'2017-10-05 21:10:45','�ף�������˼����������������˾�������⣬���Ե��������ջ�ʱ�䣬�ǳ���Ǹ',4,3)
insert Evaluate values('һ����',8,'2017-10-13 07:08:45',null,null,null,4,5)
insert Evaluate values('����',9,'2017-7-14 15:08:45',null,null,null,5,6)
