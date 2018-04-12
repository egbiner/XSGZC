        <div class="header">
            <div class="logo">
                <img src="img/biaoti(1).png" />
            </div>
        </div>
        <div class="nav">
            <ul class="ul1">
                <li><a href="index.aspx?type=0" class="type on_link">首页</a></li>
                <li><a href="news_list.aspx?tid=6" class="type">部门概况</a>
                    <%--<ul class="ul2">
                        <li><a href="news_list.aspx?tid=1">新闻动态</a></li>
                        <li><a href="news_list.aspx?tid=2">通知公告</a></li>
                    </ul>--%>
                </li>
                <li><a href="news_list.aspx?tid=4" class="type">学生教育管理</a></li>
                <li><a href="http://www.yiban.cn/yforumprovince/indexorg/puid/6125719/" target="_blank">易班管理中心</a></li>
                <li><a href="news_list.aspx?tid=10">学生公寓管理</a></li>
                <li><a href="http://exp.gliet.edu.cn/xszzzx/" target="_blank">学生资助中心</a></li>
                <li><a href="http://exp.gliet.edu.cn/RGPsyWeb/Index.aspx" target="_blank">心理将康教育</a></li>
                <li><a href="http://job.myclub2.com/" target="_blank">学生就业服务</a></li>
                <li><a href="http://gra.guet.edu.cn/" target="_blank">研究生管理</a></li>
                <li><a href="news_list.aspx?tid=7" class="type">办事流程</a></li>
                <li><a href="news_list.aspx?tid=8" class="type">资料下载</a></li>
            </ul>
        </div>
        <script type="text/javascript">
            function getQueryString(name) {//获取参数
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }
            var type = getQueryString("type");
            if (type != "") {
                $(".on_link").removeClass("on_link");
                var all_type = document.getElementsByClassName("type");
                all_type[type].setAttribute("class", "type on_link");
            }
        </script>
