using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SpecialSports.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/
        /// <summary>
        /// 首页
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            SportsDBEntities sport = new SportsDBEntities();
            //List<GoodsInfo> Glist = sport.GoodsInfo.ToList();
            

            List<GoodsInfo> Glist = sport.GoodsInfo.Where(a => a.GoodsType_ID == 1).Take(8).ToList();

            List<GoodsInfo> Klist = sport.GoodsInfo.Where(a => a.GoodsType_ID == 2).OrderBy(a => a.Id).Take(16).ToList();
            ViewData["Klist"] = Klist;

            List<GoodsInfo> Tlist = sport.GoodsInfo.Where(a => a.GoodsType_ID == 3).OrderBy(a=>a.Id).Take(23).ToList();
            ViewData["Tlist"] = Tlist;

            List<GoodsInfo> Xlist = sport.GoodsInfo.Where(a => a.GoodsType_ID == 4).OrderBy(a => a.Id).Take(32).ToList();
            ViewData["Xlist"] = Xlist;

            List<GoodsInfo> QClist = sport.GoodsInfo.Where(a => a.GoodsType_ID == 5 ).OrderBy(a => a.Id).Take(40).ToList();
            ViewData["QClist"] = QClist;

            List<GoodsInfo> Qlist = sport.GoodsInfo.Where(a => a.GoodsType_ID == 6).OrderBy(a => a.Id).Take(48).ToList();
            ViewData["Qlist"] = Qlist;

            if (Session["UserInfo"]!=null)
            {
                SportsDBEntities sde = new SportsDBEntities();

                //获得登陆的账号信息
                UserInfo ulist = Session["UserInfo"] as UserInfo;

                int uid = Convert.ToInt32(Session["uid"]);//用户id

            }


            return View(Glist);
        }

        /// <summary>
        /// 初始化获取购物车的物品
        /// </summary>
        /// <returns></returns>
        public ActionResult ShopCart()
        {

            if (Session["name"] == null)
            {

                Response.Redirect("../Login/Index?Cart=shopcart");
            }
            //使用ef
            SportsDBEntities sde = new SportsDBEntities();

            //获取用户信息
            UserInfo user=Session["UserInfo"] as UserInfo;

            //查询当前登录用户的购物车
            List<ShopManagement> shopcart = sde.ShopManagement.Where(a => a.userid == user.userid).ToList();  

            //存储购物车
            Session["shopcart"] = shopcart;
           

            return View();
        }
        /// <summary>
        /// 移除购物车单个商品
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public JsonResult DeleteCart(int id)
        {
            //使用EF
            SportsDBEntities sde = new SportsDBEntities();

            //删除购物车
         int i = sde.Database.ExecuteSqlCommand("delete from ShopManagement where cart_id={0}",id);

         return Json(i);
        }
        /// <summary>
        /// 删除多个商品
        /// </summary>
        /// <returns></returns>
        public JsonResult DeleteCartAll(string id)
        {
            string[] aid = id.Split(',');
            SportsDBEntities sde = new SportsDBEntities();

            for (int i = 0; i < aid.Length-1; i++)
            {
                int cartid=Convert.ToInt32(aid[i]);
                ShopManagement sm = new ShopManagement();
                sm.cart_id = cartid;

                sde.Entry(sm).State = System.Data.EntityState.Deleted;
            }
            int count = sde.SaveChanges();
            return Json(count);
        }

        /// <summary>
        /// 商品详细信息
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult GoodsDetail(int id)
        {
            SportsDBEntities sport = new SportsDBEntities();

           

            //获取商品基本信息
            List<GoodsInfo> glist = sport.GoodsInfo.Where(a => a.Id == id).ToList();
            ViewData["glist"] = glist;

            //获取商品的详情信息
            List<GoodsE> GEList = sport.GoodsE.Where(a => a.GoodsInfo_Id == id).ToList();
            ViewData["GElsit"] = GEList;

            //获取图片
            List<GoodsImg> gimglist = sport.GoodsImg.Where(a => a.Goods_id == id).ToList();
            ViewData["gimglist"] = gimglist;

            return View();
        }

        public ActionResult Pay()
        {
           
            return View();
        }

        /// <summary>
        /// 购物车结算跳转到确认订单页面
        /// </summary>
        /// <param name="id"></param>
        /// <param name="num"></param>
        /// <returns></returns>
        public JsonResult ShoPay(string id, string num)
        {
           
            //将传送过来的只转换为数组
            string[] shopid = id.Split(',');
            string[] shopnum = num.Split(',');

            SportsDBEntities sde = new SportsDBEntities();

            //保存对象的内容
            List<ShopManagement> slist = new List<ShopManagement>();
            //进行每一个的修改
            for (int i = 0; i < shopid.Length - 1; i++)
            {
                int cartId = Convert.ToInt32(shopid[i]);
                ShopManagement s = sde.ShopManagement.Where(a => a.cart_id == cartId).FirstOrDefault();

                //添加数据到订单
                add_deil(s, cartId);

                s.cart_quantity = Convert.ToInt32(shopnum[i]);//修改
                
                sde.SaveChanges();//执行数据库修改
                slist.Add(s);
            }
            //用户编号
            int uid=Convert.ToInt32(Session["uid"]);
            //查询用户的默认地址
           List<tbl_AddressInfo> tbladdrss = sde.tbl_AddressInfo.Where(a => a.userid == uid).ToList();

           Session["Address"] = tbladdrss;//收货地址
            Session["slist"] = slist;//物品信息

            return Json(1);
        }

        /// <summary>
        /// 购物车结算加入待付款
        /// </summary>
        /// <param name="s"></param>
        /// <param name="num"></param>
        public void add_deil(ShopManagement s,int num)
        {
            SportsDBEntities sde = new SportsDBEntities();
            //生成不重复的订单编号
            string str = Guid.NewGuid().ToString().Replace("-", "");
            //总价
            decimal? money=num*s.cart_price;
           //用户编号
            int uid=Convert.ToInt32(Session["uid"]);

            //添加订单表
            OrderBySeller obs = new OrderBySeller();
            obs.order_createTime = DateTime.Now;
            obs.order_status = 1;
            obs.orderdetails_status = -1;
            obs.order_cost =money;
            obs.userid = uid;
            obs.GoodsInfo_ID =s.GoodsInfo_ID;
            obs.order_no = str;
            obs.order_paytime = DateTime.Now;

            sde.Entry(obs).State = System.Data.EntityState.Added;//执行添加操作
            sde.SaveChanges();

            //查询当前的订单编号
            OrderBySeller os = sde.OrderBySeller.Where(a => a.order_no == str).FirstOrDefault();

            //当前订单编号
            int orderId = Convert.ToInt32(os.order_id);

            //添加订单详情表
            tbl_orderdetailsInfo tod = new tbl_orderdetailsInfo();
            tod.orderdetails_totalprice = money;
            tod.orderdetails_quantity = num;
            tod.cart_color = s.cart_color;
            tod.cart_CodeNumber = s.cart_CodeNumber;
            tod.cart_photo =s.cart_photo;
            tod.cart_remark = s.cart_remark;
            tod.orderdetails_unitprice =s.cart_price ;
            tod.GoodsInfo_id = s.GoodsInfo_ID;
            tod.order_id = orderId;
            tod.orderdetails_price = money;
            tod.StoreInfo_ID = s.StoreInfo_ID;
            tod.UserInfo_id = uid;

            //添加操作
            sde.Entry(tod).State = System.Data.EntityState.Added;

            //数据库执行操作返回状态
            sde.SaveChanges();  
        }



        /// <summary>
        /// 将物品添加到购物车中
        /// </summary>
        /// <param name="GoodsMsg"></param>
        /// <returns></returns>
        public ActionResult GoodsShop(string GoodsMsg)
        {
            //将传过来的字符串转换为数组
            string[] msg = GoodsMsg.Split(',');
            if (Session["name"] == null)
            {    
                Response.Write(99);
                Response.End();
                return View();
            }
               
            SportsDBEntities sde = new SportsDBEntities();  //使用EF
            int uid = Convert.ToInt32(Session["uid"]);//用户编号
            int gid=Convert.ToInt32(msg[0]);//商品编号
            string CodeNumber = msg[4];//尺寸
            string color = msg[3];//颜色
            int sid = Convert.ToInt32(msg[7]);//商店id

            ShopManagement smm = sde.ShopManagement.Where(a => a.userid == uid && a.GoodsInfo_ID == gid && a.StoreInfo_ID == sid && a.cart_color == color && a.cart_CodeNumber == CodeNumber).FirstOrDefault();

            if (smm != null)
            {
                int num = Convert.ToInt32(msg[6]);//数量
                smm.cart_quantity = num + smm.cart_quantity;//修改数量

                int count = sde.SaveChanges();//执行数据库的修改
                Response.Write(count);
                Response.End();
                return View();
            }
            else
            {
                //实例化一个新的购物车类
                ShopManagement sm = new ShopManagement();
                sm.cart_addtime = DateTime.Now;
                sm.GoodsInfo_ID = Convert.ToInt32(msg[0]);
                sm.cart_remark = msg[1];
                sm.cart_photo = msg[2];
                sm.cart_color = msg[3];
                sm.cart_CodeNumber = msg[4];
                sm.userid = Convert.ToInt32(Session["uid"]);
                sm.StoreInfo_ID = Convert.ToInt32(msg[7]);
                sm.cart_price = Convert.ToDecimal(msg[5]);
                sm.cart_quantity = Convert.ToInt32(msg[6]);

                //添加
                sde.Entry(sm).State = System.Data.EntityState.Added;

                int count = sde.SaveChanges();
                Response.Write(count);
                Response.End();
                return View();
            }
          
        }

        /// <summary>
        /// 查询用户详情
        /// </summary>
        /// <returns></returns>
        public JsonResult Log()
        {
            if (Session["name"] == null)
            {
                
                return Json(0);
            }
            else
            {
                //获取用户id
                int uid = Convert.ToInt32(Session["uid"]);

                SportsDBEntities sde = new SportsDBEntities();

                //查询详细
             UserInfo_detail ud= sde.UserInfo_detail.Where(a => a.detailId == uid).FirstOrDefault();

                //存储详细信息
             Session["detail"] = ud;

             if (ud != null)
             {
                 return Json(1);

             }
             else
             {
                 return Json(123456789);
             }
            }
           
        }
        /// <summary>
        /// 立即购买付款
        /// </summary>
        /// <param name="shopId"></param>
        /// <param name="num"></param>
        /// <param name="GoodsMsg"></param>
        /// <param name="pwd"></param>
        /// <returns></returns>
     public JsonResult ShopYes(int shopId, int num, string GoodsMsg,string pwd)
       {
           string[] msg = GoodsMsg.Split(',');

           SportsDBEntities sde = new SportsDBEntities();

            //查询商品的信息
           GoodsInfo gd=sde.GoodsInfo.Where(a => a.Id == shopId).FirstOrDefault();

            //获取商品的价格
           decimal? money = gd.Goods_price * num;

          decimal? user_money=Convert.ToDecimal(Session["money"]);

          if (money > user_money)
          {
              return Json(0);
          }
          else
          {
                 //用户id
             int uid=Convert.ToInt32(Session["uid"]);

              //添加订单的信息
             Add_dd(msg, uid, money,num);
             
              //余额
             decimal? price = user_money - money; 

              //修改
             UserInfo_detail detail= sde.UserInfo_detail.Where(a => a.userid == uid).FirstOrDefault();
             detail.user_money = price;

              //获取返回的受影响的个数
             int count= sde.SaveChanges();

            return Json(count);
          }
        }

        /// <summary>
        /// 添加订单与订单详情(立即付款)
        /// </summary>
        /// <param name="msg"></param>
        /// <param name="uid"></param>
        /// <param name="money"></param>
        /// <param name="num"></param>
        public void Add_dd(string[] msg, int uid,Decimal? money,int num)
        {
            SportsDBEntities sde = new SportsDBEntities();

            string str=Guid.NewGuid().ToString().Replace("-", "");
            //添加订单表
            OrderBySeller obs = new OrderBySeller();
            obs.order_createTime = DateTime.Now;
            obs.order_status = 1;
            obs.orderdetails_status = 0;
            obs.order_cost = money;
            obs.userid = uid;
            obs.GoodsInfo_ID = Convert.ToInt32(msg[0]);
            obs.order_no =str ;
            obs.order_paytime = DateTime.Now;
          
            sde.Entry(obs).State = System.Data.EntityState.Added;//执行添加操作
            sde.SaveChanges();

            //查询当前的订单编号
            OrderBySeller os = sde.OrderBySeller.Where(a => a.order_no == str).FirstOrDefault();

            //当前订单编号
            int orderId = Convert.ToInt32(os.order_id);

            //添加订单详情表
            tbl_orderdetailsInfo tod = new tbl_orderdetailsInfo();
            tod.orderdetails_totalprice = money;
            tod.orderdetails_quantity = num;
            tod.cart_color=msg[3];
            tod.cart_CodeNumber=msg[4];
            tod.cart_photo=msg[2];
            tod.cart_remark=msg[1];
            tod.orderdetails_unitprice=Convert.ToDecimal(msg[5]);
            tod.GoodsInfo_id = Convert.ToInt32(msg[0]);
            tod.order_id = orderId;
            tod.orderdetails_price = money;
            tod.StoreInfo_ID = Convert.ToInt32(msg[7]);
            tod.UserInfo_id = Convert.ToInt32(Session["uid"]);
            
            //添加操作
            sde.Entry(tod).State = System.Data.EntityState.Added;

            //数据库执行操作返回状态
            sde.SaveChanges();  
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="monet"></param>
        /// <returns></returns>
        public JsonResult getMoney(string monet)
        {
            SportsDBEntities sde = new SportsDBEntities();
            //得到登录的用户编号
            int uid = Convert.ToInt32(Session["uid"]);

            Decimal money = Convert.ToDecimal(monet);

            UserInfo_detail ud = sde.UserInfo_detail.Where(a => a.userid == uid).FirstOrDefault();

            Decimal? gg =Convert.ToDecimal(ud.user_money) - money;
            if (gg < 0)
            {
                return Json(2);
            }
            else
            {
                ud.user_money =gg;
                int count = sde.SaveChanges();
                return Json(count);
            }
        }
    }
}
