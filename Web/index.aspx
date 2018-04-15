<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Web.index" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>学工处</title>
<link rel="stylesheet" href="css/style.css" type="text/css"  media="all"/>
<link rel="stylesheet" type="text/css" href="css/main.css" id="main-css">
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/rev-setting-1.js"></script>
<script type="text/javascript" src="rs-plugin/js/jquery.themepunch.revolution.min.js"></script>

<script type="text/javascript">
//图片滚动 调用方法 imgscroll({speed: 30,amount: 1,dir: "up"});
$.fn.imgscroll = function(o){
	var defaults = {
		speed: 40,
		amount: 0,
		width: 1,
		dir: "left"
	};
	o = $.extend(defaults, o);
	
	return this.each(function(){
		var _li = $("li", this);
		_li.parent().parent().css({overflow: "hidden", position: "relative"}); //div
		_li.parent().css({margin: "0", padding: "0", overflow: "hidden", position: "relative", "list-style": "none"}); //ul
		_li.css({position: "relative", overflow: "hidden"}); //li
		if(o.dir == "left") _li.css({float: "left"});
		
		//初始大小
		var _li_size = 0;
		for(var i=0; i<_li.size(); i++)
			_li_size += o.dir == "left" ? _li.eq(i).outerWidth(true) : _li.eq(i).outerHeight(true);
		
		//循环所需要的元素
		if(o.dir == "left") _li.parent().css({width: (_li_size*3)+"px"});
		_li.parent().empty().append(_li.clone()).append(_li.clone()).append(_li.clone());
		_li = $("li", this);

		//滚动
		var _li_scroll = 0;
		function goto(){
			_li_scroll += o.width;
			if(_li_scroll > _li_size)
			{
				_li_scroll = 0;
				_li.parent().css(o.dir == "left" ? { left : -_li_scroll } : { top : -_li_scroll });
				_li_scroll += o.width;
			}
				_li.parent().animate(o.dir == "left" ? { left : -_li_scroll } : { top : -_li_scroll }, o.amount);
		}
		
		//开始
		var move = setInterval(function(){ goto(); }, o.speed);
		_li.parent().hover(function(){
			clearInterval(move);
		},function(){
			clearInterval(move);
			move = setInterval(function(){ goto(); }, o.speed);
		});
	});
};
//友情链接下拉框跳转弹出新窗口
function frlink(selObj){
window.open(selObj.options[selObj.selectedIndex].value);}
</script>

</head>
<body>
<div class="all-web">

<!--#include file="top.aspx"-->

<div class="fullwidthbanner-container">
		<div id="revolution-slider">
			<ul>
              <%="" %>
              <%for (int i = dt_scroll_img.Rows.Count -1; i >=0 ; i--){ %>
                <li data-transition="fade" data-slotamount="10" data-masterspeed="300" data-thumb="images-slider/thumbs/thumb1.jpg">
					<img src="<%= dt_scroll_img.Rows[i]["url"] %>" alt="haha404" />
				</li>
               <%}%>
			</ul>
		</div>
</div>
<!-- index1-div1 -->
<div id="index1-div1" class="clearfix">
	<div class="index1-left675">
    	<div class="title-box">党建快讯<a href="news_detail.aspx?tid=11" class="title-more" title="查看更多"><img src="images/12.gif"></a></div>
        <p><img src="images/p-img.jpg" align="left">
            <%if (news_page7.pages[0].contents.Length <= 320){%>
                    <%=news_page7.pages[0].contents%>
            <%}else{%>
                <%=news_page7.pages[0].contents.Substring(0, 320)%>...
            <%} %>
        <a href="news_detail.aspx?id=<%=news_page7.pages[0].id %>">查看更多</a></p>
    </div>
    <div class="index1-right300">
    	<div class="title-box">通知公告<a href="news_list.aspx?tid=1#detail2-box" class="title-more" title="查看更多"><img src="images/12.gif"></a></div>
          <div id="demo" class="notice">
          <ul id="demo1">
               <% foreach (var news in news_page1.pages) { %>
                <li>
                    <a href="news_detail.aspx?id=<%=news.id %>" target="_blank" title=""><%=news.title %></a>&nbsp;<span>[<%=news.create_time.ToString("yyyy-MM-dd") %>]</span>
                </li>
                <% } %>

			<div id="demo2"></div>
          </ul>
          </div>
    </div>
</div>
<!-- index1-div2 -->
<div id="index1-div2" class="clearfix">
	<div class="index1-left675">
    	<div class="index1-li-box">
    	<div class="index1-left330">
        	<div class="title-box">学工动态<a href="news_list.aspx?tid=2#detail2-box" class="title-more" title="查看更多"><img src="images/12.gif"></a></div>
            <img src="images/学工动态.jpg" style="width:330px; height:140px; margin:5px 0;">
            <ul>
                <% foreach (var news in news_page2.pages) { %>
                    <li>
                        <a href="news_detail.aspx?id=<%=news.id %>" target="_blank" title=""><%=news.title %></a><span><%=news.create_time.ToString("yyyy-MM-dd") %></span>
                    </li>
                 <% } %>
            </ul>
            
 <script> 
 	//通知公告滚动代码
		var speed=40 
		var demo=document.getElementById("demo"); 
		var demo2=document.getElementById("demo2"); 
		var demo1=document.getElementById("demo1"); 
		demo2.innerHTML=demo1.innerHTML ;
		function Marquee(){ 
		if(demo2.offsetTop-demo.scrollTop<=0) 
		  demo.scrollTop-=demo1.offsetHeight; 
		else{ 
		  demo.scrollTop++ 
		} 
		} 
		var MyMar=setInterval(Marquee,speed) 
		demo.onmouseover=function() {clearInterval(MyMar)} 
		demo.onmouseout=function() {MyMar=setInterval(Marquee,speed)} 
</script>           
        </div>
        <div class="index1-right330">
        	<div class="title-box">学院风采<a href="news_list.aspx?tid=3#detail2-box" class="title-more" title="查看更多"><img src="images/12.gif"></a></div>
            <img src="images/c2.jpg" style="width:330px; height:140px; margin:5px 0;">
            <ul>
                 <% foreach (var news in news_page3.pages) { %>                             
                    <li><a href="news_detail.aspx?id=<%=news.id %>" target="_blank" title=""><%=news.title %></a><span><%=news.create_time.ToString("yyyy-MM-dd") %></span></li>                                  
                 <% } %>
            </ul>
        </div>
        </div>
        <!-- slider -->
        <div class="index1-pic-gun">
        	<div class="title-box">学工风采<a href="#" class="title-more" title="查看更多"><img src="images/12.gif"></a></div>
            <div class="index1-scrollleft clearfix">
                <ul>
                    <%for (int i = dt_college_img.Rows.Count-1; i >=0; i--){ %>
                    <li>
                    <a href="#"><img alt="<%=dt_college_img.Rows[i]["name"] %>" src="<%=dt_college_img.Rows[i]["url"] %>"/></a>
                        <span><%=dt_college_img.Rows[i]["name"] %></span>
				    </li>
                    <%}%>
                </ul>
            </div>
            <script type="text/javascript">
            $(document).ready(function(){
            
                $(".index1-scrollleft").imgscroll({
                    speed: 40,    //图片滚动速度
                    amount: 0,    //图片滚动过渡时间
                    width: 1,     //图片滚动步数
                    dir: "left"   // "left" 或 "up" 向左或向上滚动
                });
                
            });
            </script>
        </div>
        <!-- slider end -->
    </div>
    <div class="index1-right300">
		<div class="index1-login-box">
			<div class="wrap" id="wrap">
				<ul class="tabClick title-box">
					<li class="active">晚点名提纲</li>
		
					<li>校学文件</li>
					<li>资料下载</li>
				</ul>
				<div class="lineBorder">
					<div class="lineDiv">
						<!--移动的div-->
					</div>
				</div>
				<div class="tabCon">
					<div class="tabBox">
						<div class="tabList">
							
						<ul>
			                 <% foreach (var news in news_page4.pages) { %>
                                    <li><a href="news_detail.aspx?id=<%=news.id %>#detail2-box" target="_blank" title=""><%=news.title %></a></li>
                            <% } %>
			           		
						</ul>			
						</div>
						<div class="tabList">
							<ul>
			                 <% foreach (var news in news_page5.pages) { %>                                    
                                <li><a href="news_detail.aspx?id=<%=news.id %>" target="_blank" title=""><%=news.title %></a></li>
                           <% } %>
						</ul>	
						</div>
						<div class="tabList">
							<ul>
			                <% foreach (var news in news_page6.pages) { %>
                                <li><a href="news_detail.aspx?id=<%=news.id %>" target="_blank" title=""><%=news.title %></a></li>
                            <% } %>	      
						</ul>	
						</div>
		
					</div>
				</div>
			</div>
		</div>
		<!--			
		<div class="index1-list-menu">
        	<div class="title-box">学生工作服务平台</div>
            <ul>
            	<li><a href="detail1.html">到课率</a></li>
                <li><a href="detail1.html">教务系统</a></li>
                <li><a href="detail1.html">迎新系统</a></li>
                <li><a href="detail1.html">处长信箱</a></li>
                <li><a href="detail1.html">辅导员测评</a></li>
            </ul>
    	</div>
    		-->
    	<div class="index1-list-menu">
        	<div class="title-box">学生工作服务平台</div>
            <table border="0" width="100%" height="300px" style="margin-left: 27px;">
            
            	<tr>
            		<td><a href="#"><img src="images/jpkc.jpg"></a></td>
            		<td><a href="#"><img src="images/jwgl.jpg"></a></td>
            	</tr>
            	<tr>
            		<td><a href="http://utsc.guet.edu.cn/"><img src="images/jwxt.jpg"></a></td>
            		<td><a href="http://exp.gliet.edu.cn/dkl3/web/login.aspx"><img src="images/jxzy.jpg"></a></td>
            	</tr>
            	<tr>
            		<td><a href="http://exp.gliet.edu.cn/guetcomment/manager/login.aspx"><img src="images/sfjs.jpg"></a></td>
            		<td><a href="http://szhxy.guet.edu.cn/qxgl/public/Login.aspx?ReturnUrl=%2fqxgl%2fdefault.aspx"><img src="images/szhxy.jpg"></a></td>
            	</tr>
            </table>
    	</div>	
    </div>
</div>
<!-- div5 -->
<!--#include file="foot.aspx"-->

<!--tab切换的js-->
<script charset="utf-8">
	window.onload = function (){
        var windowWidth = document.getElementById("wrap").offsetWidth; // 宽度;
		var wrap = document.getElementById('wrap');
        var tabClick = wrap.querySelectorAll('.tabClick')[0];
        var tabLi = tabClick.getElementsByTagName('li');
        
        var tabBox =  wrap.querySelectorAll('.tabBox')[0];
        var tabList = tabBox.querySelectorAll('.tabList');
        
        var lineBorder = wrap.querySelectorAll('.lineBorder')[0];
        var lineDiv = lineBorder.querySelectorAll('.lineDiv')[0];
        
        var tar = 0;
        var endX = 0;
        var dist = 0;
        
        tabBox.style.overflow='hidden';
        tabBox.style.position='relative';
        tabBox.style.width=windowWidth*tabList.length+"px";
        
        for(var i = 0 ;i<tabLi.length; i++ ){
              tabList[i].style.width=windowWidth+"px";
              tabList[i].style.float='left';
              tabList[i].style.float='left';
              tabList[i].style.padding='0';
              tabList[i].style.margin='0';
              tabList[i].style.verticalAlign='top';
              tabList[i].style.display='table-cell';
        }
        
        for(var i = 0 ;i<tabLi.length; i++ ){
            tabLi[i].start = i;
            tabLi[i].onclick = function(){
                var star = this.start;
                for(var i = 0 ;i<tabLi.length; i++ ){
                    tabLi[i].className='';
                };
                tabLi[star].className='active';
                init.lineAnme(lineDiv,windowWidth/tabLi.length*star)
                init.translate(tabBox,windowWidth,star);
                endX= -star*windowWidth;
            }
        }
        
        function OnTab(star){
            if(star<0){
                star=0;
            }else if(star>=tabLi.length){
                star=tabLi.length-1
            }
            for(var i = 0 ;i<tabLi.length; i++ ){
                tabLi[i].className='';
            };
            
             tabLi[star].className='active';
            init.translate(tabBox,windowWidth,star);
            endX= -star*windowWidth;
        };
        
        tabBox.addEventListener('touchstart',chstart,false);
        tabBox.addEventListener('touchmove',chmove,false);
        tabBox.addEventListener('touchend',chend,false);
        //按下
        function chstart(ev){
            ev.preventDefault;
            var touch = ev.touches[0];
            tar=touch.pageX;
            tabBox.style.webkitTransition='all 0s ease-in-out';
            tabBox.style.transition='all 0s ease-in-out';
        };
        //滑动
        function chmove(ev){
            var stars = wrap.querySelector('.active').start;
            ev.preventDefault;
            var touch = ev.touches[0];
            var distance = touch.pageX-tar;
            dist = distance;
            init.touchs(tabBox,windowWidth,tar,distance,endX);
            init.lineAnme(lineDiv,-dist/tabLi.length-endX/4);
        };
        //离开
        function chend(ev){
            var str= tabBox.style.transform;
            var strs = JSON.stringify(str.split(",",1));  
            endX = Number(strs.substr(14,strs.length-18)); 
            
            if(endX>0){
                init.back(tabBox,windowWidth,tar,0,0,0.3);
                endX=0
            }else if(endX<-windowWidth*tabList.length+windowWidth){
                endX=-windowWidth*tabList.length+windowWidth
                init.back(tabBox,windowWidth,tar,0,endX,0.3);
            }else if(dist<-windowWidth/3){
                 OnTab(tabClick.querySelector('.active').start+1);
                 init.back(tabBox,windowWidth,tar,0,endX,0.3);
            }else if(dist>windowWidth/3){
                 OnTab(tabClick.querySelector('.active').start-1);
            }else{
                 OnTab(tabClick.querySelector('.active').start);
            }
            var stars = wrap.querySelector('.active').start;
            init.lineAnme(lineDiv,stars*windowWidth/4);
            
        };
	};
	
    var init={
        translate:function(obj,windowWidth,star){
            obj.style.webkitTransform='translate3d('+-star*windowWidth+'px,0,0)';
            obj.style.transform='translate3d('+-star*windowWidth+',0,0)px';
            obj.style.webkitTransition='all 0.3s ease-in-out';
            obj.style.transition='all 0.3s ease-in-out';
        },
        touchs:function(obj,windowWidth,tar,distance,endX){
            obj.style.webkitTransform='translate3d('+(distance+endX)+'px,0,0)';
            obj.style.transform='translate3d('+(distance+endX)+',0,0)px';
        },
        lineAnme:function(obj,stance){
            obj.style.webkitTransform='translate3d('+stance+'px,0,0)';
            obj.style.transform='translate3d('+stance+'px,0,0)';
            obj.style.webkitTransition='all 0.1s ease-in-out';
            obj.style.transition='all 0.1s ease-in-out';
        },
        back:function(obj,windowWidth,tar,distance,endX,time){
            obj.style.webkitTransform='translate3d('+(distance+endX)+'px,0,0)';
            obj.style.transform='translate3d('+(distance+endX)+',0,0)px';
            obj.style.webkitTransition='all '+time+'s ease-in-out';
            obj.style.transition='all '+time+'s ease-in-out';
        },
    }
</script>
</div>	
</body>
</html>