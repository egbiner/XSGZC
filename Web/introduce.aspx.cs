using MyClass;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web
{
    public partial class introduce : System.Web.UI.Page
    {
        public News news = null;
        //底部友情链接
        public DataTable url_dt1 = null;
        public DataTable url_dt2 = null;
        public DataTable url_dt3 = null;
        public int tid = 4;
        public string type_name = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = 1;
            object id_ob = Request["id"];
            if (id_ob != null)
            {
                id = int.Parse(id_ob.ToString());
            }
            object tid_ob = Request["tid"];
            if (tid_ob != null)
            {
                tid = int.Parse(tid_ob.ToString());
                type_name = News.GetTypeName(tid);
            }
            news = new News(id);
            News.ReadNum(id);

            url_dt1 = SqlHelper.ExecuteDataTable("select * from friend_url where type=1 and show=1");
            url_dt2 = SqlHelper.ExecuteDataTable("select * from friend_url where type=2 and show=1");
            url_dt3 = SqlHelper.ExecuteDataTable("select * from friend_url where type=3 and show=1");
        }
    }
}