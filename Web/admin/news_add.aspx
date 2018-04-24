﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="news_add.aspx.cs" Inherits="WebUI.admin2.news_add" %>

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
    <link href="css/mobiscroll.custom-2.5.0.min.css" rel="stylesheet" />
    <script src="js/mobiscroll.custom-2.5.0.min.js"></script>
</head>
<body>
    <div class="rt_content">
        <div class="page_title">
            <h2 class="fl">发布新闻</h2>
        </div>

        <form action="ashx/news_add.ashx" id="form1" method="post" onsubmit="return check()">
            <div class="title_div">
                <span>标　题：</span>
                <input name="title" id="title" type="text">
            </div>
            <div class="title_div">
                <span>类　型：</span>
                <!--#include file="select.aspx" -->
            </div>
                <div class="title_div">
                <span>发表日期：</span>
                <input id="scroller" name="create_time" />
            </div>
            <script type="text/javascript">
                $(function () {
                    $("#scroller").mobiscroll().date();

                    var currYear = (new Date()).getFullYear();

                    //初始化日期控件
                    var opt = {
                        preset: 'date', //日期，可选：date\datetime\time\tree_list\image_text\select
                        theme: 'android-ics light', //皮肤样式，可选：default\android\android-ics light\android-ics\ios\jqm\sense-ui\wp light\wp
                        display: 'bubble', //显示方式 ，可选：modal\inline\bubble\top\bottom
                        mode: 'scroller', //日期选择模式，可选：scroller\clickpick\mixed
                        lang: 'zh',
                        dateFormat: 'yyyy-mm-dd', // 日期格式
                        setText: '确定', //确认按钮名称
                        cancelText: '取消',//取消按钮名籍我
                        dateOrder: 'yyyymmdd', //面板中日期排列格式
                        dayText: '日', monthText: '月', yearText: '年', //面板中年月日文字
                        showNow: true,
                        nowText: "今",
                        startYear: currYear - 5, //开始年份  
                        endYear: currYear + 5 //结束年份  
                        //endYear:2099 //结束年份
                    };

                    $("#scroller").mobiscroll(opt);
                });
            </script>
            <textarea id="content" name="content" style="width: 700px; height: 500px;"></textarea>

            <br>
            <button type="submit" class="link_btn">确定添加</button>
            <br>
            <br>
            <br>
        </form>

        <script>
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
                            alert("发表成功！");
                            var tid = document.getElementById("navid").value;
                            location.href = "news_list.aspx?navId=" + tid;
                        } else {
                            alert(res_text);
                        }
                    },
                    error: function (res_text) {
                        alert("服务器错误 " + res_text.status + "，发布失败！");
                    }
                };
                $("#form1").ajaxForm(options);
            });
        </script>

    </div>
</body>
</html>
