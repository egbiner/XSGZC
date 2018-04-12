using MyClass;
using System;
using System.Web;
using System.Web.SessionState;

namespace Web.admin.ashx
{
    /// <summary>
    /// pwd_modify 的摘要说明
    /// </summary>
    public class pwd_modify : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/html";

            object username = context.Session["admin"];
            if (username == null)
            {
                context.Response.Write("未登录！");
                return;
            }
            Admin admin = new Admin(username.ToString());

            string pwd_old = context.Request["pwd_old"];
            string pwd_new = context.Request["pwd_new"];

            context.Response.Write(admin.PwdModify(pwd_old, pwd_new));
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}