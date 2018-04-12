using MyClass;
using System;

namespace WebUI.admin2
{
    public partial class news_edit : System.Web.UI.Page
    {
        public News news = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            object ido = Request["id"];
            if (ido == null)
            {
                Response.End();
            }
            int id = int.Parse(ido.ToString());
            news = new News(id);
        }
    }
}