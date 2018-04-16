<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="news_list.aspx.cs" Inherits="Web.news_list" %>

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

<script type="text/javascript">
    var dq = 0;
    function wordChange(a) {
        if (!(dq == 0)) {
            dq.style.color = "#ff0000";
        }
        a.style.color = "#ff0000";
        dq = a;
    }
</script>

<!-- detail -->
<div id="detail2-box" class="clearfix">
	<div class="tit-80"><a href="index.aspx">首页</a> - <a href="news_list.aspx?tid=1#detail2-box">新闻中心</a> - <%=type_name %></div>
        
    <!--#include file="nav.aspx"-->

    <div class="content-box">
    	<h1><%=type_name %></h1>
         <ul>
             <% int i = news_page.number_start; %>
                <% foreach (var news in news_page.pages) { %>
                    <li class="text"><a href="news_detail.aspx?id=<%=news.id %>&tid=<%=news.type_id %>#detail2-box"><%=news.title %></a><span><%=news.create_time.ToString("yyyy-MM-dd") %></span></li>
                <% } %>  
        </ul>
        <div class="tcdPageCode">          
            <a href="javascript:ToPage(1)">首页</a>
            <a href="javascript:ToPage(--page_num)">上一页</a>
            <% for (i = 1; i < news_page.page_num; i++) { %>
            <a href="javascript:ToPage(<%=i %>)"><%=i %></a>
            <% } %>
            <b><a href="javascript:;"><%=news_page.page_num %></a></b>
            <% for (i = news_page.page_num + 1; i <= news_page.total_page; i++) { %>
            <a href="javascript:ToPage(<%=i %>)"><%=i %></a>
            <% } %>
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
    var total_page = <%=news_page.total_page %>;
    var page_num = <%=page_num %>;
    var navid = <%=tid %>;
    $("#navid").val(navid);

    function ToPage(page_number) {
        if (page_number < 1) {
            page_num = 1;
            return;
        }
        else if (page_number > total_page) {
            page_num = total_page;
            return;
        }
        location.href = "news_list.aspx?tid=" + navid + "&page_num=" + page_number + "#detail2-box";
    }

    function goToPage() {
        page_num = document.getElementById("page_number").value;
        ToPage(page_num);
    }

</script>

</body>
</html>
