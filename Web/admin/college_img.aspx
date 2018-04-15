<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="college_img.aspx.cs" Inherits="Web.admin.college_img" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="css/admin_index.css" rel="stylesheet" />
    <link href="css/admin_index2.css" rel="stylesheet" />
    <script src="js/jquery-3.0.0.min.js"></script>
    <script src="js/do_ajax.js"></script>
    <link href="js/kindeditor/themes/default/default.css" rel="stylesheet" />
    <script src="js/kindeditor/kindeditor-all.js"></script>
    <script src="js/kindeditor/lang/zh-CN.js"></script>
    		<script>
			KindEditor.ready(function(K) {
				var editor = K.editor({
                    allowFileManager: true,  
				    uploadJson: 'ashx/upload_json.ashx'
				});
				K('#image').click(function() {
					editor.loadPlugin('image', function() {
						editor.plugin.imageDialog({
                            showRemote: false,                           
							imageUrl : K('#url').val(),
                            clickFn: function (url, title, width, height, border, align) {
								K('#url').val(url);
								editor.hideDialog();
							}						 
						});
					});
				});
                });

                $(document).ready(function () {
                    $('.img_name').change(function () {
                        $.ajax({
                            type: "post",
                            url: "ashx/img_manage.ashx?status=name_change",
                            data: { id: $(this).attr("name"), newname: $(this).val() },
                            success: function (msg) {
                                if (msg == "OK") {
                                    
                                } else {
                                    alert("修改图片名字出错！");
                                }                
                            }
                        });
                    });
                });
		</script>
</head>
<body>
    <div class="rt_content">
        <div class="page_title">
            <h2 class="fl">首页学院风采图片设置</h2>
        </div>
            <table class="table">
        <tr>
            <th>序号</th>
            <th>图片预览</th>
            <th>图片URL</th>
            <th>图片底部名称</th>
            <th>是否显示</th>
            <th colspan="3">操作</th>
        </tr>

        <% int i =0; %>
        <% for (i = 0; i < t.Rows.Count; i++) { %>
        <tr>
            <td><%=i+1 %></td>
            <td><img style="width:60px;height:40px" src="../<%=t.Rows[i]["url"] %>"/></td>
            <td><%=t.Rows[i]["url"] %></td>
            <td><input class="img_name" name="<%=t.Rows[i]["id"] %>" type="text" value="<%=t.Rows[i]["name"] %>"/></td>
            <td><%=int.Parse(t.Rows[i]["show"].ToString())==1?"是":"否" %></td>            
            <td>
                <a href="../index.aspx?id=<%=t.Rows[i]["id"] %>" target="_blank">查看</a>
            </td>
            <td>
                <a href="javascript:manage('<%=int.Parse(t.Rows[i]["show"].ToString())==1?"hide":"show" %>', '<%=t.Rows[i]["id"] %>')"><%=int.Parse(t.Rows[i]["show"].ToString())==1?"隐藏":"显示" %></a>
            </td>
            <td>
                <a href="javascript:manage('del', '<%=t.Rows[i]["id"] %>')" class="del_but">删除</a>
            </td>
        </tr>
        <% } %>
    </table>
        	<div>
                <input type="text" id="url" value=""/>
                <input type="button" id="image" value="选择图片"/>（本地上传）
        	</div>
        <script>
            function manage(action,id) {
                switch (action) {
                    case "del":
                        DoAjax("你确定要删除改图片吗？", "ashx/img_manage.ashx",id,action);
                        break;
                    case "show":
                        DoAjax("你确定要在首页展示该图片吗？", "ashx/img_manage.ashx", id, action);
                        break;
                    case "hide":
                        DoAjax("你确定要从首页隐藏该图片吗？", "ashx/img_manage.ashx", id, action);
                        break;
                }
            }
        </script>
    </div>
</body>
</html>