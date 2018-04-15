using MyClass;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace Web
{
    public partial class news_list : System.Web.UI.Page
    {
        public Page news_page = null;
        public string type_name = "";
        public int page_num = 1;
        public int tid = 4;
        //底部友情链接
        public DataTable url_dt1 = null;
        public DataTable url_dt2 = null;
        public DataTable url_dt3 = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            object page_num_ob = Request["page_num"];
            if (page_num_ob != null)
            {
                page_num = int.Parse(page_num_ob.ToString());
            }
            object tid_ob = Request["tid"];
            if (tid_ob != null)
            {
                tid = int.Parse(tid_ob.ToString());
                type_name = News.GetTypeName(tid);
            }
            news_page = News.GetNewsPage(20, page_num, tid);

            url_dt1 = SqlHelper.ExecuteDataTable("select * from friend_url where type=1 and show=1");
            url_dt2 = SqlHelper.ExecuteDataTable("select * from friend_url where type=2 and show=1");
            url_dt3 = SqlHelper.ExecuteDataTable("select * from friend_url where type=3 and show=1");
        }
    }
}