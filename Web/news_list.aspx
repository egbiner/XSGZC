<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="news_list.aspx.cs" Inherits="Web.news_list" %>

<!DOCTYPE html>
<html>
<head>
    <!--#include file="include.aspx" -->
    <link rel="stylesheet" type="text/css" href="css/list.css" /></head>
<body>
    <div class="main">
        <!--#include file="top.aspx" -->
        <object width="1024" height="272" data="../img/flash/flash2.swf" type="application/x-shockwave-flash"></object>
        <div>
            <!--#include file="nav.aspx" -->
            <div>
                <h3 class="type_name" id="type_name"><%=type_name %></h3>
                <div class="left">
                    <div class="list">
                        <% int i = news_page.number_start; %>
                        <% foreach (var news in news_page.pages) { %>
                        <ul>
                            <li>
                                <a href="news_detail.aspx?id=<%=news.id %>"><%=news.title %></a>
                                <b class="time">[<%=news.create_time.ToString("yyyy-MM-dd") %>]</b>
                            </li>
                        </ul>
                        <% } %>
                    </div>
                </div>
                <div class="page_css page_line">
                    <span class="pagecss">
                        共<%=news_page.total_count %>条 <%=news_page.page_num %>/<%=news_page.total_page %>页
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
                    </span>
                </div>
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
                        else if(page_number > total_page){
                            page_num = total_page;
                            return;
                        }
                        location.href="news_list.aspx?tid=" + navid + "&page_num="+page_number+"#type_name";
                    }

                    function goToPage() {
                        page_num = document.getElementById("page_number").value;
                        ToPage(page_num);
                    }

                    function ChangeType(navidc) {
                        navid = navidc;
                        ToPage(page_num);
                    }

                    function DeleNews(id, title) {
                        DoAjax("确定要删除这篇新闻吗？\n\n" + title, "ashx/news_delete.ashx", id);
                    }
                </script>
            </div>
        </div>
        <div class="clear"></div>
        <!--#include file="foot.aspx" -->
    </div>
</body>
</html>
