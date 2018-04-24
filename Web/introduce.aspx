<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="introduce.aspx.cs" Inherits="Web.introduce" %>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>学生工作处</title>
<link rel="stylesheet" href="css/style1.css" type="text/css" media="all"/>
</head>

<body>	
<div class="all-web">

<!--#include file="top.aspx"-->

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
	<div class="tit-80"><a href="index.aspx">首页</a> - 部门概况</div>
     <div class="tabula-box">
    	<div class="max-tit">部门概况</div>
        <ul>
            <li><a id="525" href="introduce.aspx?id=525#detail2-box">单位介绍</a></li>
            <li><a id="524" href="introduce.aspx?id=524#detail2-box">领导组成</a></li>
            <li><a id="513" href="introduce.aspx?id=513#detail2-box">机构设置</a></li>
            <li><a id="2637" href="introduce.aspx?id=2637#detail2-box">工作职责</a></li>
            <li><a id="2317" href="introduce.aspx?id=2317#detail2-box">领导信箱</a></li>
            <li><a href="introduce.aspx?id=2317#detail2-box">电子邮件</a></li>
            <li><a id="2638" href="introduce.aspx?id=2638#detail2-box">通信地址</a></li>
            <li><a id="2639" href="introduce.aspx?id=2639#detail2-box">联系电话</a></li>
        </ul>
    </div>
    

    <div class="content-box">
    	<h1><%=news.title %></h1>
		 <div class="content">
        	    <p style="text-align:center">
                作者：<%=news.author %>　
                来源：学生工作处　
                发布时间：<%=news.create_time.ToString("yyyy-MM-dd") %>　
                点击数：<%=news.click %>　
              </p><br />
             <%=news.contents %>
        </div>

		<div class="n-p-box clearfix">
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
    $(document).ready(function () {
        $("#<%=news.id %>").addClass("select");
     });
</script>

</body>
</html>
