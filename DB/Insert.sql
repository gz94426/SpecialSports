
use SportsDB
go
--������ݱ�


select * from ShopManagement

----------��������Ա��Ϣ��tbl_manager��
insert into tbl_manager values('admin','123456')
insert into tbl_manager values('manager','456789')
insert into tbl_manager values('admin2','123123')

------------�û�������Ϣ��UserInfo��
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

----------�û�������ϸ��Ϣ��UserInfo_detail��
insert into UserInfo_detail values(1,'����','����','Ů','wangji@123.com','17745586535','530130199902032396','1473066298','6.jpg',1000,'adidasר����')
insert into UserInfo_detail values(2,'����','δ֪��','��','zhangsan@123.com','12345678910','433130199810242263','15212365487','1.jpg',500,'�˶�����')
insert into UserInfo_detail values(3,'��˼ά','δ֪��','��','lisiwei@123.com','13764215241','533130199810102223','1562356844','2.jpg',500,'Man��־')
insert into UserInfo_detail values(4,'��ɺɺ','��','Ů','wangshanshan@123.com','15736145358','53013019981011226x','8543655258','3.jpg',600,'������Ůװ')
insert into UserInfo_detail values(5,'����','��ʩ','Ů','puxi@123.com','15362635652','53013019891211226x','1962533687','4.jpg',700,'�˶��콢��')
insert into UserInfo_detail values(6,'δ֪��','����','��','zhaoxin@123.com','18912515213','430130200022225658','1205632489','5.jpg',800,'����')
insert into UserInfo_detail values(7,'δ֪��','����','��','lisi@123.com','15362635652','530130200206052365','1856957452','7.jpg',600,null)
insert into UserInfo_detail values(8,'������','����ң','��','lixiaoyao@123.com','18912515213','53013019971012632x','2865655238','8.jpg',700,'����')
insert into UserInfo_detail values(9,'δ֪��','槼�','Ů','daji@123.com','17745586535','530130199912034252','1896547521','9.jpg',700,null)
insert into UserInfo_detail values(10,'³�Ÿ�','��å��','Ů','lmy@123.com','17745986535','530130199902032396','1473066298','6.jpg',100,'adidasר����')


----------���̹�����Ϣ��StoreInfo��

insert StoreInfo values(1,'adidasר����',null)
insert StoreInfo values(2,'�˶�����',null)
insert StoreInfo values(3,'Man��־',null)
insert StoreInfo values(4,'������Ůװ',null)
insert StoreInfo values(5,'�˶��콢��',null)


----------��Ʒ���ͣ�GoodsType��

insert GoodsType values('�·�')
insert GoodsType values('����')
insert GoodsType values('��װ')	
insert GoodsType values('Ь��')
insert GoodsType values('�˶���Ʒ')
insert GoodsType values('ñ��')	 


----------���̺���Ʒ���͵Ĺ�����StoreInfo_X_GoodsType��
insert StoreInfo_X_GoodsType values(1,1)--adidasר����
insert StoreInfo_X_GoodsType values(1,2)
insert StoreInfo_X_GoodsType values(1,3)
insert StoreInfo_X_GoodsType values(1,4)
insert StoreInfo_X_GoodsType values(2,1)--�˶�����
insert StoreInfo_X_GoodsType values(2,2)
insert StoreInfo_X_GoodsType values(2,3)
insert StoreInfo_X_GoodsType values(2,4)
insert StoreInfo_X_GoodsType values(3,1)--Man��־
insert StoreInfo_X_GoodsType values(3,2)
insert StoreInfo_X_GoodsType values(3,3)
insert StoreInfo_X_GoodsType values(3,4)
insert StoreInfo_X_GoodsType values(3,5)
insert StoreInfo_X_GoodsType values(3,6)
insert StoreInfo_X_GoodsType values(4,1)--������Ůװ
insert StoreInfo_X_GoodsType values(4,2)
insert StoreInfo_X_GoodsType values(4,3)
insert StoreInfo_X_GoodsType values(4,4)
insert StoreInfo_X_GoodsType values(5,1)--�˶��콢��
insert StoreInfo_X_GoodsType values(5,2)
insert StoreInfo_X_GoodsType values(5,3)
insert StoreInfo_X_GoodsType values(5,4)
insert StoreInfo_X_GoodsType values(5,5)
insert StoreInfo_X_GoodsType values(5,6)


----------��Ʒ��Ϣ��GoodsInfo��
----------��Ʒ�����GoodsE��
----------��ƷͼƬ��GoodsImg��


select * from Logistics

------------�û�������Ϣ��UserInfo��
select * from tbl_manager

----------�û�������ϸ��Ϣ��UserInfo_detail��
select * from UserInfo_detail

----------���̹�����Ϣ��StoreInfo��
select * from StoreInfo

select * from GoodsType

----------��Ʒ��Ϣ��GoodsInfo��
select * from GoodsInfo

----------��Ʒ�����GoodsE��
select * from GoodsE

----------��ƷͼƬ��GoodsImg��
select * from GoodsImg


----------�û��ղر�Collect��
select * from Collect


----------�û��㼣��History���ݲ�ʹ��
select * from History






----------��������ShopManagement��

--insert ShopManagement values('2017-8-09 09:08:45.140','Shopimg/Hat/Hat_four_big_5.jpg',2,'�װ�ɫ','Ĭ��',48,8,120,'ë��ñ�Ӻ����ﶬŮ��ů��֯ñ')
--insert ShopManagement values('2017-8-09 09:08:45.140','Shopimg/Hat/Hat_four_big_5.jpg',1,'�ɫ','Ĭ��',48,6,120,'ë��ñ�Ӻ����ﶬŮ��ů��֯ñ')
--insert ShopManagement values('2017-9-19 09:08:45.140','Shopimg/Hat/Hat_two_big_2.jpg',1,'��ɫ','Ĭ��',47,7,129,'����˽�ñ��Ů���ų�')
--insert ShopManagement values('2017-10-09 09:08:45.140','Shopimg/Yoga/yuga_big_1_1.jpg',1,'����ɫ','Ĭ��',36,6,190,'���ܶȼӺ�ӳ���Ů�����')
--insert ShopManagement values('2017-7-09 09:08:45.140','Shopimg/Shoes/Casual_woman_three_big_3.jpg',1,'ǳ��ɫ','37',29,7,369,'2017�¿�Ůʿ�˶�����͸����Ь')

--select * from ShopManagement

--select * from ServiceInfo

----------��Ʒ���۱�Evaluate��
select * from Evaluate

----------�ֲ�ͼ��TurnsImg��:����Աά��ʱ�޸�
select * from TurnsImg

----------������Ϣ��NoticeInfo���̼ҽ��д��ۻ���лʱ����
select * from NoticeInfo


----------�û���ַ��tbl_AddressInfo�����ڽ��и���ǰѡ���ջ���ַ
insert tbl_AddressInfo values(1,'����','�人','��ɽ','�۳����666��(���ϲƾ�������ѧ)','����ʡ�人�к�ɽ���۳����666��(���ϲƾ�������ѧ)','15871145629','����',6,0)
insert tbl_AddressInfo values(0,'����','��ɳ','����','���ƴ��111��','����ʡ��ɳ�н��������ƴ��111��','15778485752','����',6,0)
insert tbl_AddressInfo values(1,'����','ɳƺ��','��ѧ��','�����ѧ','��������ɳƺ������ѧ�������ѧ','15986457852','���',5,0)
insert tbl_AddressInfo values(0,'�Ĵ�','�ɶ�','˫��','ѧ�ϴ��666��','�Ĵ�ʡ�ɶ���˫����ѧ�ϴ��666��','15487652341','�ε�',7,0)
insert tbl_AddressInfo values(1,'�Ĵ�','�ɶ�','������','Ϭ��XX���100��','�Ĵ�ʡ�ɶ��ж�������Ϭ��XX���100��','15487654234','�ε�',7,0)
insert tbl_AddressInfo values(1,'����','ɳƺ��','������','���ƴ��','������ɳƺ�������������ƴ���������ѧԺ','15736145357','槼�',9,0)

select * from tbl_AddressInfo

----------���������tbl_orderdetailsInfo����������ɺ�ĸõ�����ж���
select * from tbl_orderdetailsInfo