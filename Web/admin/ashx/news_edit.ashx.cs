using MyClass;
using System;
using System.Web;
using System.Web.SessionState;

namespace startup_hatch.ashx
{
    /// <summary>
    /// edit_news 的摘要说明
    /// </summary>
    public class edit_news : IHttpHandler, IRequiresSessionState
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

            object ido = context.Request["id"];
            if (ido == null)
            {
                context.Response.Write("id 参数错误！");
                return;
            }
            int id = int.Parse(ido.ToString());

            News news = new News(id);
            news.type_id = int.Parse(context.Request["type_id"]);
            news.title = context.Request["title"];
            news.contents = context.Request["content"];
            news.author_id = admin.id;
            news.create_time = DateTime.Now;

            context.Response.Write(admin.EditNews(news));
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