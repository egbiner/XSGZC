using System;
using MyClass;

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

        protected void Page_Load(object sender, EventArgs e)
        {
            news_page1 = News.GetNewsPage(9, 1, 1);
            news_page2 = News.GetNewsPage(9, 1, 2);
            news_page3 = News.GetNewsPage(9, 1, 3);
            news_page4 = News.GetNewsPage(4, 1, 4);
            news_page5 = News.GetNewsPage(6, 1, 9);
            news_page6 = News.GetNewsPage(6, 1, 8);
        }
    }
}