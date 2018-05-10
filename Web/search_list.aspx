<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="search_list.aspx.cs" Inherits="Web.search_list" %>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>学生工作处</title>
<link rel="stylesheet" href="css/style1.css" type="text/css" media="all"/>
</head>

<body>	
<div class="all-web">

<!--#include file="top.aspx" -->

<div id="slider-box" style=" center center;">
  <object width="100%" height="270px"  data="images/flash3.swf" type="application/x-shockwave-flash"></object>
</div>



<!-- detail -->
<div id="detail2-box" class="clearfix">
	<div class="tit-80"><a href="news_list.aspx">新闻中心</a> - 新闻搜索</div>
        
    <!--#include file="nav.aspx"-->

    <div class="content-box">
    	<h1>搜索结果</h1>
         <ul>
            <%int i = search_page.number_start; %>
                         <% foreach (var news in search_page.pages) { %>
                        <ul>
                            <li class="text"><a href="news_detail.aspx?id=<%=news.id %>&tid=<%=news.type_id %>"><%=news.title %></a><span><%=news.create_time.ToString("yyyy-MM-dd") %></span></li>
                        </ul>
                        <% } %>  
        </ul>
        <div class="tcdPageCode">           
            <a href="javascript:ToPage(1)">首页</a>
            <a href="javascript:ToPage(--page_num)">上一页</a>
            <b>当前页：<a href="javascript:;"><%=search_page.page_num %>/<%=search_page.total_page %></a></b>
            <a href="javascript:ToPage(++page_num)">下一页</a>
            <a href="javascript:ToPage(total_page)">尾页</a>   
        </div>
    </div>
</div>
<!-- div5 -->
<!--#inlcude file="foot.aspx" -->

</div>
<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/jquery.page.js"></script>
<script>
    //$(".tcdPageCode").createPage({
    //    pageCount:10,
    //    current:1,
    //    backFn:function(p){
    //        //console.log(p);
    //    }
    //});
    var total_page = <%=search_page.total_page %>;
    var page_num = <%=page_num %>;

    function ToPage(page_number) {
        if (page_number < 1) {
            page_num = 1;
            return;
        }
        else if (page_number > total_page) {
            page_num = total_page;
            return;
        }
            location.href = "search_list.aspx?page_num=" + page_number + "&keywords=<%=keywords%>";
        }
</script>

</body>
</html>
