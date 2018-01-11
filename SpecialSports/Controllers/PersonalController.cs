using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SpecialSports.Controllers
{
    public class PersonalController : Controller
    {
        //
        // GET: /Personal/
        /// <summary>
        /// 个人中心
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// 个人信息
        /// </summary>
        /// <returns></returns>
        public ActionResult Information()
        {
            //实例化一个数据库对象
            SportsDBEntities se = new SportsDBEntities();

            //获取登陆账号的信息
            UserInfo user = Session["UserInfo"] as UserInfo;

            //存储登陆用户的id
            Session["userid"] = user.userid;

            //创建一个集合存放数据
            List<UserInfo_detail> udlist = se.UserInfo_detail.Where(a => a.userid == user.userid).ToList();

            return View(udlist);
        }


        /// <summary>
        /// 修改个人信息
        /// </summary>
        /// <param name="userdt"></param>
        /// <returns></returns>
        public ActionResult UpdataPersonal(string jsonstrt)
        {
            //获取登陆用户的id
            int id = Convert.ToInt32(Session["userid"]);

            //分割字符串
            string[] strarr = jsonstrt.Split(',');

            //创建数据库对象
            SportsDBEntities sde = new SportsDBEntities();

            //进行修改
            UserInfo_detail tblist = sde.UserInfo_detail.Where(a => a.userid == id).FirstOrDefault();
            tblist.username = strarr[0];
            tblist.user_nickname = strarr[1];
            tblist.user_sex = strarr[2];
            tblist.user_idcard = strarr[3];
            tblist.user_email = strarr[4];
            tblist.user_telphone = strarr[5];

            //保存修改数据
            //UserInfo_detail ud = sde.UserInfo_detail.Add(tblist);
            int count = sde.SaveChanges();

            Response.Write(count);
            Response.End();

            return RedirectToAction("Information");
        }

        /// <summary>
        /// 我的收货地址
        /// </summary>
        /// <returns></returns>
        public ActionResult Address()
        {
            //使用EF
            SportsDBEntities sde = new SportsDBEntities();

            //通过session取出用户id
            int userId = Convert.ToInt32(Session["userid"]);

            //通过id查询用户地址
            List<tbl_AddressInfo> talist = sde.tbl_AddressInfo.Where(a => a.userid == userId).ToList();

            //查询所有省份
            List<tbl_province> tplist = sde.tbl_province.ToList();
            ViewData["tplist"] = tplist;

            //根据省市的id查询所有城市
            List<tbl_city> cplist = sde.tbl_city.Where(a => a.pro_id == 4).ToList();
            ViewData["cplist"] = cplist;

            //根据城市的id查询所有城镇
            List<tbl_county> coplist = sde.tbl_county.Where(a => a.city_id == 2).ToList();
            ViewData["coplist"] = coplist;

            return View(talist);
        }

        /// <summary>
        /// 删除收货地址
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        public JsonResult DeleteAddress(int Id)
        {
            //使用EF
            SportsDBEntities sde = new SportsDBEntities();

            //删除收货地址
            int i = sde.Database.ExecuteSqlCommand("delete from tbl_AddressInfo where address_Id={0}", Id);

            return Json(i);
        }

        /// <summary>
        /// 添加收货地址
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        public ActionResult AddAddress(string jsonstr)
        {
            //将传过来的字符串转换为数组
            string[] msg = jsonstr.Split(',');

            //实例化一个新的购物车类
            tbl_AddressInfo tbadd = new tbl_AddressInfo();
            tbadd.address_name = msg[0];
            tbadd.address_telephone = msg[1];
            tbadd.address_detail = "重庆市重庆市沙坪坝区" + msg[2];
            tbadd.userid = Convert.ToInt32(Session["userid"]);
            tbadd.address_isDel = 0;
            tbadd.address_isDefault = 0;

            //使用EF
            SportsDBEntities sde = new SportsDBEntities();

            //添加
            sde.Entry(tbadd).State = System.Data.EntityState.Added;

            int count = sde.SaveChanges();
            Response.Write(count);
            Response.End();
            return View();
        }

        /// <summary>
        /// 订单信息
        /// </summary>
        /// <returns></returns>
        public ActionResult Order()
        {
            //获取登陆用户id
            int userid = Convert.ToInt32(Session["userid"]);

            //使用EF
            SportsDBEntities sde = new SportsDBEntities();

            //查询所有详细订单信息
            List<tbl_orderdetailsInfo> otlist = sde.tbl_orderdetailsInfo.Where(a => a.UserInfo_id == userid).ToList();
            ViewData["otlist"] = otlist;
            int? orderid = otlist[0].order_id;

            //根据id查询订单的订单号与时间
            OrderBySeller olist = sde.OrderBySeller.Where(a => a.order_id == orderid).FirstOrDefault();
            ViewData["olist"] = olist;

            return View(otlist);
        }


        /// <summary>
        /// 账户安全
        /// </summary>
        /// <returns></returns>
        public ActionResult SetUpSafety()
        {
            return View();
        }


        /// <summary>
        /// 退款售后
        /// </summary>
        /// <returns></returns>
        public ActionResult Change()
        {
            return View();
        }

        /// <summary>
        /// 账单明细
        /// </summary>
        /// <returns></returns>
        public ActionResult ElectronicBill()
        {
            return View();
        }

        /// <summary>
        /// 我的收藏
        /// </summary>
        /// <returns></returns>
        public ActionResult MyCollection()
        {
            return View();
        }

        /// <summary>
        /// 足迹
        /// </summary>
        /// <returns></returns>
        public ActionResult BrowserHistory()
        {
            return View();
        }

        /// <summary>
        /// 评价
        /// </summary>
        /// <returns></returns>
        public ActionResult Comment()
        {
            return View();
        }

        /// <summary>
        /// 消息
        /// </summary>
        /// <returns></returns>
        public ActionResult News()
        {
            return View();
        }

    }
}
