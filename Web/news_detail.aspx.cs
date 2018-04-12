using MyClass;
using System;

namespace Web
{
    public partial class news_detail : System.Web.UI.Page
    {
        public News news = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = 1;
            object id_ob = Request["id"];
            if (id_ob != null)
            {
                id = int.Parse(id_ob.ToString());
            }
            news = new News(id);
            News.ReadNum(id);
        }
    }
}