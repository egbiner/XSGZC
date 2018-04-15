using MyClass;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace Web
{
    public partial class search_list : System.Web.UI.Page
    {
        public Page search_page = null;
        public string keywords;
        public int page_num = 1;
        protected void Page_Load(object sender, EventArgs e)
        {
            object page_num_ob = Request["page_num"];
            if (page_num_ob != null)
            {
                page_num = int.Parse(page_num_ob.ToString());
            }
            keywords = Request.Form["keywords"];
            if (keywords == null)
            {
                keywords = Request["keywords"];
            }
            search_page = News.GetSearchPage(20, page_num, keywords);
        }
    }
}