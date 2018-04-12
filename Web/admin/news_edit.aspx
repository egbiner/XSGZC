<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="news_edit.aspx.cs" Inherits="WebUI.admin2.news_edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <meta name="author" content="DeathGhost" />
    <link rel="stylesheet" type="text/css" href="css/admin_index.css" />
    <link rel="stylesheet" type="text/css" href="css/admin_index2.css" />

    <link rel="stylesheet" href="js/kindeditor/themes/default/default.css" />
    <link rel="stylesheet" href="js/kindeditor/plugins/code/prettify.css" />
    <script charset="utf-8" src="js/kindeditor/kindeditor-all.js"></script>
    <script charset="utf-8" src="js/kindeditor/lang/zh-CN.js"></script>
    <script charset="utf-8" src="js/kindeditor/plugins/code/prettify.js"></script>

    <script src="js/jquery-3.0.0.min.js"></script>
    <script src="js/jquery.form.js"></script>
    <script src="js/show_kind_editor.js"></script>
</head>
<body>
    <div class="rt_content">
        <div class="page_title">
            <h2 class="fl">
                <a href="javascript:history.go(-1)" class="back">< 返回</a>　
                修改新闻
            </h2>
        </div>

        <form action="ashx/news_edit.ashx" id="form1" method="post" onsubmit="return check()">
            <div class="title_div">
                <span>标　题：</span>
                <input name="title" id="title" type="text" value="<%=news.title %>">
                <input name="id" type="hidden" value="<%=news.id %>">
            </div>
            <div class="title_div">
                <span>类　型：</span>
                <!--#include file="select.aspx" -->
            </div>

            <textarea id="content" name="content" style="width: 700px; height: 500px;"><%=news.contents %></textarea>

            <br>
            <button type="submit" class="link_btn">确定修改</button>
            <br>
            <br>
            <br>
        </form>

        <script>
            $("#navid").val(<%=news.type_id %>);
            function check() {
                if (document.getElementById("title").value == "") {
                    alert("请填写文章标题！");
                    return false;
                }
                if (document.getElementById("navid").value == 0) {
                    alert("请选择文章类型！");
                    return false;
                }
                return true;
            }
            $(document).ready(function () {
                // ajaxForm
                var options = {
                    success: function (res_text) {
                        if (res_text == "OK") {
                            alert("修改成功！");
                            history.go(-1);
                        } else {
                            alert(res_text);
                        }
                    },
                    error: function (res_text) {
                        alert("服务器错误 " + res_text.status + "，修改失败！");
                    }
                };
                $("#form1").ajaxForm(options);
            });
        </script>

    </div>
</body>
</html>
