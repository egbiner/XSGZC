using System;
using MyClass;

namespace WebUI.admin2
{
    public partial class news_list : System.Web.UI.Page
    {
        public Page news_page = null;
        public int page_num = 1;
        public int navId = 1;
        protected void Page_Load(object sender, EventArgs e)
        {
            object page_num_ob = Request["page_num"];
            if (page_num_ob != null)
            {
                page_num = int.Parse(page_num_ob.ToString());
            }
            object navId_ob = Request["navId"];
            if (navId_ob != null)
            {
                navId = int.Parse(navId_ob.ToString());
            }
            news_page = News.GetNewsPage(10, page_num, navId);
        }
    }
}