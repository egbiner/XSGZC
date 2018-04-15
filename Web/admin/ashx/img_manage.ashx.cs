using MyClass;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace Web.admin.ashx
{
    /// <summary>
    /// img_manage 的摘要说明
    /// </summary>
    public class img_manage : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/html";

            object username = context.Session["admin"];
            if (username == null)
            {
                context.Response.Write("未登录");
                return;
            }
            string action = context.Request["status"];
            string img_id = context.Request["id"];

            int i;
            switch (action)
            {
                case "del":
                    DataTable t = SqlHelper.ExecuteDataTable("select url from scroll_img where id=@id",
                        new SqlParameter("@id", img_id));
                    string path = "../../" + t.Rows[0]["url"].ToString();
                    path = System.Web.HttpContext.Current.Server.MapPath(path);
                    File.Delete(path);
                    i = SqlHelper.ExecuteNonQuery("delete from scroll_img where id=@id",
                        new SqlParameter("@id", img_id));
                    if (i == 1)
                        context.Response.Write("OK");
                    else
                        context.Response.Write("操作失败！");
                    break;
                case "show":
                    i = SqlHelper.ExecuteNonQuery("update scroll_img set show=1 where id=@id",
                        new SqlParameter("@id", img_id));
                    if (i == 1)
                        context.Response.Write("OK");
                    else
                        context.Response.Write("操作失败！");
                    break;
                case "hide":
                    i = SqlHelper.ExecuteNonQuery("update scroll_img set show=0 where id=@id",
                        new SqlParameter("@id", img_id));
                    if (i == 1)
                        context.Response.Write("OK");
                    else
                        context.Response.Write("操作失败！");
                    break;
                case "name_change":
                    string new_name = context.Request["newname"];
                    i = SqlHelper.ExecuteNonQuery("update scroll_img set name = @name where id = @id",
                        new SqlParameter("@name", new_name),
                        new SqlParameter("@id", img_id));
                    if (1 == i)
                        context.Response.Write("OK");
                    else
                        context.Response.Write("error");
                    ; break;
                default:
                    context.Response.Write("未知的操作！");
                    break;
            }
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