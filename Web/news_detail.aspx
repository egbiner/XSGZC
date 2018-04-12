<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="news_detail.aspx.cs" Inherits="Web.news_detail" %>

<!DOCTYPE html>
<html>
<head>
    <!--#include file="include.aspx" -->
    <link rel="stylesheet" type="text/css" href="css/list.css" /></head>
</head>
<body>
    <div class="main">
        <!--#include file="top.aspx" -->
        <object width="1024" height="272" data="../img/flash/flash3.swf" type="application/x-shockwave-flash"></object>
        <div>
            <!--#include file="nav.aspx" -->
            <div>
                <h3 class="type_name"><%=news.type_name %></h3>
                <div class="left">
                    <div class="detail_div">
                        <h1 class="detail_h"><%=news.title %></h1>
                        <div class="article_info">
                            作者：<%=news.author %>　
                            来源：学生工作处　
                            发布时间：<%=news.create_time.ToString("yyyy-MM-dd HH:mm") %>　
                            点击数：<%=news.click %>　
                        </div>
                        <div class="detail">
                            <%=news.contents %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="clear"></div>
        <!--#include file="foot.aspx" -->
    </div>
</body>
</html>
