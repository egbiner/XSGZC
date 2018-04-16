using MyClass;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace Web
{
    public partial class index : System.Web.UI.Page
    {
        public Page news_page1 = null;
        public Page news_page2 = null;
        public Page news_page3 = null;
        public Page news_page4 = null;
        public Page news_page5 = null;
        public Page news_page6 = null;
        public Page news_page7 = null;
        public Page news_page8 = null;
        public DataTable url_dt1 = null;
        public DataTable url_dt2 = null;
        public DataTable url_dt3 = null;
        public DataTable dt_scroll_img = null;
        public DataTable dt_college_img = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            news_page1 = News.GetNewsPage(9, 1, 1);
            news_page2 = News.GetNewsPage(9, 1, 2);
            news_page3 = News.GetNewsPage(9, 1, 3);
            news_page4 = News.GetNewsPage(5, 1, 4);
            news_page5 = News.GetNewsPage(5, 1, 9);
            news_page6 = News.GetNewsPage(5, 1, 8);
            news_page7 = News.GetNewsPage(1, 1, 11);
            news_page8 = News.GetNewsPage(5, 1, 12);
            url_dt1 = SqlHelper.ExecuteDataTable("select * from friend_url where type=1 and show=1");
            url_dt2 = SqlHelper.ExecuteDataTable("select * from friend_url where type=2 and show=1");
            url_dt3 = SqlHelper.ExecuteDataTable("select * from friend_url where type=3 and show=1");
            dt_scroll_img = SqlHelper.ExecuteDataTable("select * from scroll_img where show=1 and type=1");
            dt_college_img = SqlHelper.ExecuteDataTable("select * from scroll_img where show=1 and type=2");
        }
    }
}