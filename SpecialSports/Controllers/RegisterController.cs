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
    public class RegisterController : Controller
    {
        //
        // GET: /Register/

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            return View();
        }
        /// <summary>
        /// 邮箱注册
        /// </summary>
        /// <returns></returns>
        public JsonResult CostomersUserEmail_Register(string user)
        {
            string[] us = user.Split(',');//将获取到的string 转换为数组
            string Email = us[0];//帐号
            string password = us[1];//密码
            if (!string.IsNullOrEmpty(user))
            {
                SportsDBEntities sde = new SportsDBEntities();
                                                
                if (!Email.Contains("@") && Email.LastIndexOf('@') < 3 )
                {
                    Response.Write("格式不正确!必须存在@");
                    Response.End();
                }
                else if (Email.Length < 7 && Email.Length > 17)
                {
                    Response.Write("格式不正确!帐号位数7-17位之间");
                    Response.End();
                }
                else
                {


                    //查询是否已经存在当前帐号
                    var count = sde.UserInfo.Where(a => a.name == Email).ToList();

                    if (count.Count > 0)
                    {
                        Response.Write("用户名已注册!");
                        Response.End();
                    }
                    else
                    {
                        UserInfo u = new UserInfo();
                        u.name = Email;
                        u.user_password = password;
                        u.user_createTime = DateTime.Now;
                        u.user_status = 0;
                        u.store_id = 0;

                        //执行添加操作
                        sde.Entry(u).State = System.Data.EntityState.Added;

                        //确认添加操作
                        if (sde.SaveChanges() > 0)
                        {
                            return Json(1);
                        }
                    }
                }
            } 
            return Json(-1);
        }


        /// <summary>
        /// 手机登录注册
        /// </summary>
        /// <param name="phone"></param>
        /// <param name="password"></param>
        /// <param name="code"></param>
        /// <returns></returns>
        public JsonResult CostomersUserPhone_Register(string user)
        {
            string[] us = user.Split(',');
            string phone = us[0];//帐号
            string password = us[1];//密码
            string code = us[2];//用户输入的验证码
            if (!string.IsNullOrEmpty(user))
            {
                SportsDBEntities sde = new SportsDBEntities();

                //获取发送的验证码
               string s=Session["yzm"].ToString();

                //查询是否已经存在当前帐号
               var count = sde.UserInfo.Where(a => a.name == phone).ToList();

                if (count.Count > 0)
                {
                    Response.Write("用户名已注册!");
                    Response.End();
                }
                else if (s != code)
                {
                    Response.Write("验证码错误!");
                    Response.End();
                }
                else
                {

                    UserInfo u = new UserInfo();
                    u.name = phone;
                    u.user_password = password;
                    u.user_createTime = DateTime.Now;
                    u.user_status = 0;
                    u.store_id = 0;

                    //执行添加操作
                    sde.Entry(u).State = System.Data.EntityState.Added;

                    if (sde.SaveChanges() > 0)
                    {
                        //return RedirectToAction("Index", "Login");
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
          Random r=new Random();
          int str= r.Next(10000,99999);
          Session["yzm"] = str;
          // Sendout(phone, str);
          string client="00000";
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

    }
}
