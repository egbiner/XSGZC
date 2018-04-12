<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Web.index" %>

<!DOCTYPE html>
<html>
<head>
    <!--#include file="include.aspx" -->
    <link rel="stylesheet" type="text/css" href="css/index.css" />
    <script type="text/javascript" src="js/jquery.Slider.js"></script>
    <script type="text/javascript" src="js/index.js"></script>
    <script src="js/main.js"></script>
</head>
<body>
    <div class="main">
        <!--#include file="top.aspx" -->
        <object width="1024" height="272" data="../img/flash/flash1.swf" type="application/x-shockwave-flash"></object>
        <table class="index_tb">
            <tr>
                <td class="w270">
                    <div class="left">
                        <div class="right_title"><span>通知公告 | NOTICE</span> <a href="news_list.aspx?tid=1">更多…</a></div>
                        <div class="right_content" style="position: relative;">
                            <div id="demo">
                                <div id="demo1" style="top: -408px;">
                                    <ul id="zhaobiao">
                                        <% foreach (var news in news_page1.pages) { %>
                                        <li>
                                            <span>
                                                <img src="img/jiantou.png">
                                            </span>
                                            <a href="news_detail.aspx?id=<%=news.id %>"><%=news.title %>&nbsp;[<%=news.create_time.ToString("yyyy-MM-dd") %>]</a>
                                        </li>
                                        <% } %>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="friend_link">
                        <div class="right_content">
                            <div class="top_div">
                                <img width="182" height="43" src="../img/zxzz.png" />
                            </div>
                            <a target="_blank" href="http://erp.myclub2.com/User/SignIn">
                                <img src="../img/jpkc.jpg" class="link_img">
                            </a>
                            <%--<a target="_blank" href="http://172.16.64.40:8081/">
                                <img src="../img/jwgl.jpg" class="link_img">
                            </a>--%>
                            <a target="_blank" href="http://exp.gliet.edu.cn/dkl3/web/login.aspx">
                                <img src="../img/jxzy.jpg" class="link_img">
                            </a>
                            <a target="_blank" href="http://exp.gliet.edu.cn/guetcomment/manager/login.aspx">
                                <img src="../img/sfjs.jpg" class="link_img">
                            </a>
                            <a target="_blank" href="http://utsc.guet.edu.cn/">
                                <img src="../img/jwxt.jpg" class="link_img">
                            </a>
                            <a target="_blank" href="http://gxyb1.bilian.xin/dangke/a">
                                <img src="../img/qmy.jpg" class="link_img">
                            </a>
                            <a target="_blank" href="http://172.16.13.32:8099/">
                                <img src="../img/yxxt.jpg" class="link_img">
                            </a>
                            <a target="_blank" href="http://xlpc.bilian.xin/a">
                                <img src="../img/zx1.jpg" class="link_img">
                            </a>
                            <a target="_blank" href="http://gxyb1.bilian.xin/zizhu/a">
                                <img src="../img/ze.jpg" class="link_img">
                            </a>
                            <a target="_blank" href="http://172.16.13.32:8099/">
                                <img src="../img/zx2.jpg" class="link_img">
                            </a>
                        </div>
                    </div>
                </td>
                <td>
                    <div>
                        <div class="xgdt_title">
                            <span>学工动态</span>
                            <a href="news_list.aspx?tid=2">更多…</a>
                        </div>
                        <div class="left_content">
                            <ul id="pro_ul">
                                <% foreach (var news in news_page2.pages) { %>
                                <li>
                                    <p class="tl_p">
                                        <span>
                                            <img src="img/li.png">
                                        </span>
                                        <a href="news_detail.aspx?id=<%=news.id %>"><%=news.title %></a>
                                    </p>
                                    <b class="time"><%=news.create_time.ToString("yyyy-MM-dd") %></b>
                                </li>
                                <% } %>
                            </ul>
                        </div>
                    </div>
                    <div class="xyfc">
                        <div class="xyfc_title">
                            <span>学院风采</span>
                            <a href="nenews_list.aspx?tid=3">更多…</a>
                        </div>
                        <div class="left_content">
                            <ul id="news_ul">
                                <% foreach (var news in news_page3.pages) { %>
                                <li>
                                    <p class="tl_p">
                                        <span>
                                            <img src="img/jiantou.png">
                                        </span>
                                        <a href="news_detail.aspx?id=<%=news.id %>"><%=news.title %></a>
                                    </p>
                                    <b class="time"><%=news.create_time.ToString("yyyy-MM-dd") %></b>
                                </li>
                                <% } %>
                            </ul>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="wdmtg">
                        <div class="wdmtg_title">
                            <span>晚点名提纲</span>
                            <a target="_blank" title="更多" href="news_list.aspx?tid=4">
                                <img alt="更多" src="../img/more.gif">
                            </a>
                        </div>
                        <div class="wdmtg_content">
                            <ul class="download_ul">
                                <% foreach (var news in news_page4.pages) { %>
                                <li>
                                    <p class="tl_p tl_p2">
                                        <span>
                                            <img src="img/style/icon2.gif">
                                        </span>
                                        <a href="news_detail.aspx?id=<%=news.id %>"><%=news.title %></a>
                                    </p>
                                </li>
                                <% } %>
                            </ul>
                        </div>
                    </div>
                    <div class="wdmtg xxwj">
                        <div class="wdmtg_title">
                            <span>校学文件</span>
                            <a target="_blank" title="更多" href="news_list.aspx?tid=4">
                                <img alt="更多" src="../img/more.gif">
                            </a>
                        </div>
                        <div class="wdmtg_content">
                            <ul class="download_ul">
                                <% foreach (var news in news_page5.pages) { %>
                                <li>
                                    <p class="tl_p tl_p2">
                                        <span>
                                            <img src="img/style/icon2.gif">
                                        </span>
                                        <a href="news_detail.aspx?id=<%=news.id %>"><%=news.title %></a>
                                    </p>
                                </li>
                                <% } %>
                            </ul>
                        </div>
                    </div>
                    <div class="wdmtg xxwj">
                        <div class="wdmtg_title">
                            <span>资料下载</span>
                            <a target="_blank" title="更多" href="news_list.aspx?tid=8">
                                <img alt="更多" src="../img/more.gif">
                            </a>
                        </div>
                        <div class="wdmtg_content">
                            <ul class="download_ul">
                                <% foreach (var news in news_page6.pages) { %>
                                <li>
                                    <p class="tl_p tl_p2">
                                        <span>
                                            <img src="img/style/icon2.gif">
                                        </span>
                                        <a href="news_detail.aspx?id=<%=news.id %>"><%=news.title %></a>
                                    </p>
                                </li>
                                <% } %>
                            </ul>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
        <!--#include file="foot.aspx" -->
    </div>
</body>
</html>
