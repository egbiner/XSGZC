using System;
using MyClass;

namespace Web
{
    public partial class news_list : System.Web.UI.Page
    {
        public Page news_page = null;
        public string type_name = "";
        public int page_num = 1;
        public int tid = 4;
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
        }
    }
}