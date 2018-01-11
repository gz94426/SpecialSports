using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace SpecialSports.Controllers
{
    public class LoginController : Controller
    {
        //
        // GET: /Login/

        public ActionResult Index()
        {

            Session["url"] = Request["Cart"];

            Session["shopid"] = Request["id"];


            return View();
        }



        /// <summary>
        /// 用户登录
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public ActionResult ShopUser_Login(string user)
        {
            object carts = Session["url"];
            string cart = "";
            if (carts != null)
            {
                cart = carts.ToString();
            }

            int shopid = Convert.ToInt32(Session["shopid"]);

            //将前台传来的字符串转化为数组
            string[] userpass = user.Split(',');

            //得到用户名
            string username = userpass[0];

            //得到密码
            string pasaword = userpass[1];

            SportsDBEntities sde = new SportsDBEntities();

            //查询
            UserInfo ulist = sde.UserInfo.Where(a => a.name == username && a.user_password == pasaword).FirstOrDefault();


            //判断
            if (ulist != null)
            {
                //用户基本信息
                Session["UserInfo"] = ulist;

                //获取用户的id
                int uid = ulist.userid;
                Session["uid"] = uid;

                //查询当前登录用户的购物车
                List<ShopManagement> shopcart = sde.ShopManagement.Where(a => a.userid == uid).ToList();

                //购物车件数
                Session["scart"] = shopcart.Count;

                //查询获取详细信息
                UserInfo_detail ud = sde.UserInfo_detail.Where(a => a.userid == uid).FirstOrDefault();
                //添加或查询详细信息
                select_detail(ud, ulist, uid);
              
                if (cart == "shopcart")
                {
                    return Json(new { type = 2 });

                }
                else if (shopid != 0)
                {
                    return Json(new { type = 1, data = shopid });


                }
                else
                {

                    Response.Write(2);
                    Response.End();
                }
            }
            else
            {
                Response.Write(1);
                Response.End();
            }


            return View();

        }

        /// <summary>
        /// 查询详细
        /// </summary>
        /// <param name="ud"></param>
        /// <param name="ulist"></param>
        /// <param name="uid"></param>
        public void select_detail(UserInfo_detail ud, UserInfo ulist,int uid)
        {
             SportsDBEntities sde = new SportsDBEntities();

            if (ud != null)
            {
                //获取用户的昵称
                string name = ud.user_nickname;

                //存储昵称
                Session["name"] = name;

                //存储用户余额
                Session["money"] = ud.user_money;

                //存储用户名
                Session["username"] = ud.username;

                //存储用户id
                Session["userid"] = ud.userid;

                //头像
                Session["photo"] = ud.user_photo;

                
            }
            else
            {
                //判断手机还是邮箱登陆
                if (ulist.name.Contains("@"))
                {
                    //存入数据
                    UserInfo_detail udd = new UserInfo_detail();
                    udd.userid = uid;
                    udd.user_email = ulist.name;
                    udd.user_nickname = ulist.name;

                    //执行添加操作
                    sde.Entry(udd).State = System.Data.EntityState.Added;

                    sde.SaveChanges();
                }
                else
                {
                    //存入数据
                    UserInfo_detail udd = new UserInfo_detail();
                    udd.userid = uid;
                    udd.user_photo = ulist.name;
                    udd.user_nickname = ulist.name;

                    //执行添加操作
                    sde.Entry(udd).State = System.Data.EntityState.Added;

                    sde.SaveChanges();
                }
                //获取用户的昵称
                string name = ulist.name;
                //存储昵称
                Session["name"] = name;

                //默认头像
                Session["photo"] = "1.jpg";
            }
        }



        /// <summary>
        /// 忘记密码
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public JsonResult update_Login(string user)
        {
            string[] u = user.Split(',');

            //获取用户帐号
            string username = u[0];
            //电话号码
            string phone = u[1];
            //验证码
            string yzm = u[2];
            //新密码
            string password = u[3];

            //判断输入的是否为空字符串
            if (string.IsNullOrEmpty(username) && string.IsNullOrEmpty(password))
            {
                Response.Write("用户名或密码不能为空或空的字符串");
                Response.End();
            }
            //验证码
            else if (yzm != Session["yzm"].ToString())
            {
                Response.Write("验证码错误！");
                Response.End();
            }
            else
            {
                SportsDBEntities sde = new SportsDBEntities();

                //查询该帐号是否存在
                UserInfo count = sde.UserInfo.Where(a => a.name == username).FirstOrDefault();

                //用户id
                int id = count.userid;

                //查询该帐号id的详细信息
                var udcount = sde.UserInfo_detail.Where(a => a.userid == id).ToList();

                if (string.IsNullOrEmpty(udcount[0].user_telphone))
                {
                    Response.Write("手机号与帐号个人信息不符，修改失败！");
                    Response.End();
                }
                else
                {

                    count.user_password = password;





                    if (sde.SaveChanges() > 0)
                    {
                        return Json(1);
                    }

                }
            }
            return Json(-1);
        }




        /// <summary>
        /// 获取验证码
        /// </summary>
        /// <returns></returns>
        public string sendMobileCode(string phone)
        {
            Random r = new Random();
            int str = r.Next(10000, 99999);
            Session["yzm"] = str;
            Sendout(phone, str);
            string client = "00000";
            return client;
        }
        public static string Sendout(string to, int smsContent)
        {
            //时间格式
            string datetime = DateTime.Now.ToString("yyyyMMddHHmmss");
            //MD5
            string mm = md(datetime).ToLower();

            HttpClient client = new HttpClient();

            //传参数
            List<KeyValuePair<string, string>> klist = new List<KeyValuePair<string, string>>();
            klist.Add(new KeyValuePair<string, string>("accountSid", "555156a94841451a8216523c5fb362fb"));
            klist.Add(new KeyValuePair<string, string>("templateid", "88881802"));
            klist.Add(new KeyValuePair<string, string>("param", smsContent.ToString()));
            klist.Add(new KeyValuePair<string, string>("to", to));
            klist.Add(new KeyValuePair<string, string>("timestamp", datetime));
            klist.Add(new KeyValuePair<string, string>("sig", mm));
            klist.Add(new KeyValuePair<string, string>("respDataType", "JSON"));

            HttpContent htc = new FormUrlEncodedContent(klist);


            HttpResponseMessage htm = client.PostAsync("https://api.miaodiyun.com/20150822/industrySMS/sendSMS", htc).Result;


            //获取状态
            string str = htm.Content.ReadAsStringAsync().Result;
            return str;
        }

        //MD5解密
        public static string md(string datetime)
        {

            string thok = "555156a94841451a8216523c5fb362fb" + "d3910ca2a161479486e0a8c2a801e188" + datetime;

            //实例化对象
            MD5 md5 = MD5.Create();

            byte[] s = md5.ComputeHash(Encoding.UTF8.GetBytes(thok));

            string mdt = "";
            for (int i = 0; i < s.Length; i++)
            {
                mdt = mdt + s[i].ToString("x2");
            }
            return mdt;
        }

        /// <summary>
        /// 退出的登录
        /// </summary>
        public void LogOff()
        {
            //存储昵称
            Session["name"] = null;

            //存储用户名
            Session["username"] = null;

            //存储用户id
            Session["userid"] = null;

            //头像
            Session["photo"] = null;

            //用户id
            Session["uid"] = null; 

            //存储用户余额
            Session["money"] = null;
        }

    }
}
