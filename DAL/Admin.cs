using System.Data;
using System.Data.SqlClient;

namespace MyClass
{
    public class Admin
    {
        public int id { get; set; }
        public string username { get; set; }
        public string password { get; set; }
        public int role_id { get; set; }
        public string type_name { get; set; }

        public Admin(string username) //构造函数
        {
            DataTable all_info = SqlHelper.ExecuteDataTable(
                "select * from admin where name=@username",
                new SqlParameter("@username", username)
                );
            if (all_info.Rows.Count == 0)
            {
                return;
            }
            this.id = int.Parse(all_info.Rows[0]["id"].ToString());
            this.role_id = int.Parse(all_info.Rows[0]["role_id"].ToString());
            this.username = all_info.Rows[0]["name"].ToString();
            this.password = all_info.Rows[0]["pwd"].ToString();
        }

        public int Login(string paw) //登陆
        {
            if (this == null)
            {
                return 1;
            }
            if (paw == this.password)
            {
                SqlHelper.ExecuteNonQuery(
                    "update admin set last_login=getdate() where id=@id",
                        new SqlParameter("@id", this.id)
                    );
                return 0;
            }
            return 2;
        }

        public string PwdModify(string pwd_old, string pwd_new)
        {
            if (pwd_old != this.password)
            {
                return "原密码错误！";
            }
            if (string.IsNullOrEmpty(pwd_new))
            {
                return "新密码不能为空！";
            }
            int re = SqlHelper.ExecuteNonQuery(
                        "update admin set pwd=@pwd where id=@id",
                            new SqlParameter("@pwd", pwd_new),
                            new SqlParameter("@id", this.id)
                    );
            if (re == 1)
            {
                return "OK";
            }
            return "修改失败！";
        }

        public string AddNews(News news)
        {
            if (this.role_id != 0 && this.role_id != news.type_id)
            {
                return "没有权限！";
            }
            int re = News.AddNews(news);
            if (re == 1)
            {
                return "OK";
            }
            return "添加失败！";
        }

        public string EditNews(News news)
        {
            if (this.role_id != 0 && this.role_id != news.type_id)
            {
                return "没有权限！";
            }
            int re = News.EditNews(news);
            if (re == 1)
            {
                return "OK";
            }
            return "修改失败！";
        }

        public string DeleteNews(int id)
        {
            News news = new News(id);
            if (this.role_id != 0 && this.role_id != news.type_id)
            {
                return "没有权限！";
            }
            int re = News.DeleteNews(id);
            if (re == 1)
            {
                return "OK";
            }
            return "删除失败！";
        }
    }
}
