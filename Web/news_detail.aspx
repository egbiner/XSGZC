﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="news_detail.aspx.cs" Inherits="Web.news_detail" %>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>三级网页</title>
<link rel="stylesheet" href="css/style1.css" type="text/css" media="all"/>
</head>

<body>	
<div class="all-web">

<!--#include file="top.aspx"-->

<div id="slider-box" style=" center center;">
  <object width="100%" height="270px"  data="images/flash3.swf" type="application/x-shockwave-flash"></object>
</div>



<!-- detail -->
<div id="detail2-box" class="clearfix">
	<div class="tit-80"><a href="news_list.aspx?tid=1#detail2-box">新闻中心</a> - <a href="news_list.aspx?tid=<%=news.type_id %>#detail2-box"><%=type_name %></a> - 新闻详情</div>

    <!--#include file="nav.aspx"-->

    <div class="content-box">
    	<h1><%=news.title %></h1>
		 <div class="content">
        	    <p style="text-align:center">
                作者：<%=news.author %>　
                来源：学生工作处　
                发布时间：<%=news.create_time.ToString("yyyy-MM-dd HH:mm") %>　
                点击数：<%=news.click %>　
              </p><br />
             <%=news.contents %>
        </div>

		<div class="n-p-box clearfix">
<%--        	<div class="prv"><a href="三级页面.html">上一篇：11新闻标题新闻标题新闻标题新闻标题新闻标题新闻标题新闻</a></div>
            <div class="next"><a href="三级页面.html">下一篇：22新闻标题新闻标题新闻标题新闻标题新闻标题新闻标题新闻</a></div>--%>
        </div>    
    </div>
</div>
<!-- div5 -->
<!--#include file="foot.aspx"-->
</div>
<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/jquery.page.js"></script>
<script>
    $(".tcdPageCode").createPage({
        pageCount: 100,
        current: 1,
        backFn: function (p) {
            //console.log(p);
        }
    });
</script>

</body>
</html>