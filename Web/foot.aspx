<div id="div5" class="clearfix">
    <div class="link-box">
    	<span>友情链接：</span>
        <select onChange="frlink(this)"  name="select" class="select-link">
            <option selected>--- 教育类网站 ---</option>
            <% for (int i = 0; i<=url_dt1.Rows.Count-1; i++){%>
            <option value="<%=url_dt1.Rows[i]["url"] %>""><%=url_dt1.Rows[i]["name"] %></option>
            <%} %>
            
        </select><!-- 
        <select onChange="frlink(this)" name="select" class="select-link">
            <option selected>--- 政府类网站 ---</option>
            <option value="http://www.china.com"></option>
            <option value="http://www.sina.com.cn">新浪网</option>
            <option value="http://www.163.com">网易</option>
        </select> -->
        <select onChange="frlink(this)" name="select" class="select-link">
            <option selected>--- 校园类网站 ---</option>
            <% for (int i = 0; i <= url_dt2.Rows.Count - 1; i++)
            {%>
                <option value="<%=url_dt2.Rows[i]["url"] %>""><%=url_dt2.Rows[i]["name"] %></option>
            <%}%>
        </select>
        <select onChange="frlink(this)" name="select" class="select-link">
            <option selected>--- 其它类网站 ---</option>
             <% for (int i = 0; i <= url_dt3.Rows.Count - 1; i++)
            {%>
                <option value="<%=url_dt3.Rows[i]["url"] %>""><%=url_dt3.Rows[i]["name"] %></option>
            <%}%>       
        </select>
    </div>
</div>
<div id="div6">版权声明: 桂林电子科技大学 学生工作处　　技术支持与维护: 求索工作室　桂ICP备05013339号　 <a target="_blank" href="admin/login.aspx">管理入口</a></div>