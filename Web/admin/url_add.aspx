<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="url_add.aspx.cs" Inherits="Web.admin.url_add" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <meta name="author" content="DeathGhost" />
     <link rel="stylesheet" type="text/css" href="css/admin_index.css" />
    <link rel="stylesheet" type="text/css" href="css/admin_index2.css" />
     <script src="js/jquery-3.0.0.min.js"></script>
    <script src="js/jquery.form.js"></script>
     <script src="js/do_ajax.js"></script>
</head>
<body>
    <div class="rt_content">
    <div class="page_title">
        <h2 class="fl">友情链接管理</h2>
    </div>
    <table class="table">
        <tr>
            <th>序号</th>
            <th>URL</th>
            <th>名称</th>
            <th>类型</th>
            <th>是否显示</th>
            <th colspan="2">操作</th>
        </tr>

        <% int i;%>
        <% for (i=0;i < url_table.Rows.Count; i++) { %>
        <tr>
            <td><%=i+1 %></td>
            <td><%=url_table.Rows[i]["url"] %></td>
            <td><%=url_table.Rows[i]["name"] %></td>
            <td><%switch (url_table.Rows[i]["type"].ToString()){
                        case "1":%><%="教育类" %><%break;
                        case "2":%><%="校园类" %><%break;
                        case "3":%><%="其他类" %><%break;
                        default:%><%="未知" %><%break;
             }%></td>
            <td><%=int.Parse(url_table.Rows[i]["show"].ToString())==1?"是":"否" %></td>
            <td>
                <a href="javascript:manage('<%=int.Parse(url_table.Rows[i]["show"].ToString())==1?"hide":"show" %>', '<%=url_table.Rows[i]["id"] %>')"><%=int.Parse(url_table.Rows[i]["show"].ToString())==1?"隐藏":"显示" %></a>
            </td>
            <td>
                <a href="javascript:manage('del', '<%=url_table.Rows[i]["id"] %>')" class="del_but">删除</a>
            </td>
        </tr>
        <% } %>
            <tr>
            <td></td>
            <td><input type="text" name="url" id="add_url" /></td>
            <td><input type="text" name="url_name" id="add_url_name" /></td>
            <td><select id="url_type"><option value="1">教育类</option><option value="2">校园类</option><option value="3">其他类</option></select></td>
            <td></td>
            <td></td>
            <td><a href="javascript:manage('add','')" class="del_but">添加</a></td>
        </tr>
    </table>
    <script>
            function manage(action,id) {
                switch (action) {
                    case "del":
                        DoAjax("你确定要删除该链接吗？", "ashx/url_manager.ashx",id,action);
                        break;
                    case "show":
                        DoAjax("你确定要在首页展示该链接吗？", "ashx/url_manager.ashx", id, action);
                        break;
                    case "hide":
                        DoAjax("你确定要从首页隐藏该链接吗？", "ashx/url_manager.ashx", id, action);
                        break;
                    case "add":
                        var url = document.getElementById("add_url").value;
                        var url_name = document.getElementById("add_url_name").value;
                        var url_type = document.getElementById("url_type").value;
                        if (url == "" || url_name == "") {
                            alert("输入框不能留空！");
                            return;
                        }
                        DoAjax("你确定要添加" + url_name + "友情链接吗？", "ashx/url_manager.ashx", url + "|" + url_name + "|" + url_type,"add");
                        break;
                }
            }
        </script>
</div>
</body>
</html>