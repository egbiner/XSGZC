using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace MyClass
{
    public class News
    {
        public int id { get; set; }
        public int type_id { get; set; }
        public string type_name { get; set; }
        public string title { get; set; }
        public int author_id { get; set; }
        public string author { get; set; }
        public string contents { get; set; }
        public DateTime create_time { get; set; }
        public int click { get; set; }

        public News() { }

        public News(int id)
        {
            DataTable dt = SqlHelper.ExecuteDataTable(@"select * from v_news where id=@id",
                new SqlParameter("@id", id)
                );
            this.id = int.Parse(dt.Rows[0]["id"].ToString());
            this.type_id = int.Parse(dt.Rows[0]["type_id"].ToString());
            this.click = int.Parse(dt.Rows[0]["click"].ToString());
            this.type_name = dt.Rows[0]["type_name"].ToString();
            this.title = dt.Rows[0]["title"].ToString();
            this.author_id = int.Parse(dt.Rows[0]["author_id"].ToString());
            this.author = dt.Rows[0]["author"].ToString();
            this.contents = dt.Rows[0]["contents"].ToString();
            this.create_time = DateTime.Parse(dt.Rows[0]["create_time"].ToString());
        }

        public static Page GetNewsPage(int page_size, int page_number, int type_id)
        {
            DataTable dt = SqlHelper.ExecuteDataTable(page_size, page_number,
                "select id from v_news where type_id=@type_id order by create_time desc",
                new SqlParameter("@type_id", type_id)
                );
            List<News> news_lst = new List<News>();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                int id = int.Parse(dt.Rows[i]["id"].ToString());
                News news = new News(id);
                news_lst.Add(news);
            }
            int total = GetNewsCountOfType(type_id);
            int total_page = total / page_size + 1;
            return new Page(news_lst, total, page_size, page_number);
        }

        public static int GetNewsCountOfType(int type_id)
        {
            string count = SqlHelper.ExecuteScalar("select count(1) from news where type_id=@type_id",
                new SqlParameter("@type_id", type_id)).ToString();
            return int.Parse(count);
        }

        public static int AddNews(News news)
        {
            return SqlHelper.ExecuteNonQuery(
                @"insert into news (type_id, title, author_id, contents, create_time, click)
                    values(@type_id, @title, @author_id, @contents, getdate(), 0)",
                new SqlParameter("@type_id", news.type_id),
                new SqlParameter("@title", news.title),
                new SqlParameter("@author_id", news.author_id),
                new SqlParameter("@contents", news.contents)
                );
        }

        public static int EditNews(News news)
        {
            return SqlHelper.ExecuteNonQuery(
                @"update news set type_id=@type_id,title=@title,author_id=@author_id,contents=@contents where id=@id",
                new SqlParameter("@type_id", news.type_id),
                new SqlParameter("@title", news.title),
                new SqlParameter("@author_id", news.author_id),
                new SqlParameter("@contents", news.contents),
                new SqlParameter("@id", news.id)
                );
        }

        public static int DeleteNews(int id)
        {
            return SqlHelper.ExecuteNonQuery(
                "delete from news where id=@id",
                new SqlParameter("@id", id)
                );
        }

        public static DataTable GetNewssByType(int type_id)
        {
            return SqlHelper.ExecuteDataTable(
                @"select id, title, username as publisher, publish_time, last_editItime 
                from v_news where type_id=@type_id where id <> 1",
                new SqlParameter("@type_id", type_id)
                );
        }

        public static string GetTypeName(int type_id)
        {
            return SqlHelper.ExecuteScalar(
                @"select name from news_type where id=@type_id",
                new SqlParameter("@type_id", type_id)
                ).ToString();
        }

        public static DataTable GetNewsByID(int id)
        {
            return SqlHelper.ExecuteDataTable(
                "select * from v_news where id=@id",
                new SqlParameter("@id", id)
                );
        }

        public static int ReadNum(int id)
        {
            return SqlHelper.ExecuteNonQuery(
                "update news set click=click+1 where id=@id",
                new SqlParameter("@id", id)
                );
        }
    }
}
