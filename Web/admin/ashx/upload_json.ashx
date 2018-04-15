﻿<%@ webhandler Language="C#" class="Upload" %>

/**
 * KindEditor ASP.NET
 *
 * 本ASP.NET程序是演示程序，建议不要直接在实际项目中使用。
 * 如果您确定直接使用本程序，使用之前请仔细确认相关安全设置。
 *
 */

using System;
using System.Collections;
using System.Web;
using System.IO;
using System.Globalization;
using LitJson;
using System.Web.SessionState;
using MyClass;

public class Upload : IHttpHandler, IRequiresSessionState
{
    private HttpContext context;

    public void ProcessRequest(HttpContext context)
    {
        this.context = context;
        object username = context.Session["admin"];
        if(username == null)
        {
            showError("登录超时！");
        }

        String aspxUrl = context.Request.Path.Substring(0, context.Request.Path.LastIndexOf("/") + 1);

        //文件保存目录路径
        String savePath = "../../upload_files/";

        //文件保存目录URL
        String saveUrl = aspxUrl + "../../upload_files/";

        //定义允许上传的文件扩展名
        Hashtable extTable = new Hashtable();
        extTable.Add("image", "gif,jpg,jpeg,png,bmp");
        extTable.Add("flash", "swf,flv");
        extTable.Add("media", "mp4,swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb");
        extTable.Add("file", "doc,docx,xls,xlsx,ppt,pdf,txt,zip,rar,gz,bz2");

        //最大文件大小
        int maxSize = 104857600;  //单位 Byte 现在为 100M

        HttpPostedFile imgFile = context.Request.Files["imgFile"];
        if (imgFile == null)
        {
            showError("请选择文件。");
        }

        String dirPath = context.Server.MapPath(savePath);
        if (!Directory.Exists(dirPath))
        {
            showError("上传目录不存在。");
        }

        String dirName = context.Request.QueryString["dir"];
        if (String.IsNullOrEmpty(dirName)) {
            dirName = "image";
        }
        if (!extTable.ContainsKey(dirName)) {
            showError("目录名不正确。");
        }

        String fileName = imgFile.FileName;
        String fileExt = Path.GetExtension(fileName).ToLower();
        String time_now = DateTime.Now.ToString("yyyyMMddHHmmssffff", DateTimeFormatInfo.InvariantInfo);
        fileName = time_now + fileName;

        if (imgFile.InputStream == null || imgFile.InputStream.Length > maxSize)
        {
            showError("上传文件大小超过限制。100M");
        }

        if (String.IsNullOrEmpty(fileExt) || Array.IndexOf(((String)extTable[dirName]).Split(','), fileExt.Substring(1).ToLower()) == -1)
        {
            showError("上传文件扩展名是不允许的扩展名。\n只允许" + ((String)extTable[dirName]) + "格式。");
        }

        //创建文件夹 file/ 或 image/ 文件夹
        dirPath += dirName + "\\";
        saveUrl += dirName + "\\";
        if (!Directory.Exists(dirPath)) {
            Directory.CreateDirectory(dirPath);
        }
        /*
        //按日期创建文件夹
		String ymd = DateTime.Now.ToString("yyyyMMdd", DateTimeFormatInfo.InvariantInfo);
		dirPath += ymd + "\\";
		saveUrl += ymd + "\\";
		if (!Directory.Exists(dirPath)) {
			Directory.CreateDirectory(dirPath);
		}
        */

        string url = context.Request.UrlReferrer.ToString();
        if (url.IndexOf("scroll_img.aspx") > -1||url.IndexOf("college_img.aspx") > -1)
        {
            //fileName =time_now + Guid.NewGuid().ToString() + fileExt;
            fileName =time_now + fileExt;
            //Stream stream = imgFile.InputStream;
            //System.Drawing.Image image = System.Drawing.Image.FromStream(stream);

            //int iWidth = image.Width;
            //int iHeight = image.Height;
            //if (iWidth != 300 || iHeight != 300)
            //{
            //    context.Response.Write("图片大小不匹配！\n请上传大小为300*300的照片！");
            //    return;
            //}
            if(url.IndexOf("scroll_img.aspx") > -1)
            {
                SqlHelper.ExecuteNonQuery("insert into scroll_img(url,show,type) values(@url,1,1)",
                new System.Data.SqlClient.SqlParameter("@url", "upload_files/image/"+fileName));
            }
            else if (url.IndexOf("college_img.aspx") > -1)
            {
                SqlHelper.ExecuteNonQuery("insert into scroll_img(url,name,show,type) values(@url,'学工风采',1,2)",
                new System.Data.SqlClient.SqlParameter("@url", "upload_files/image/"+fileName));
            }
        }

        //String newFileName = DateTime.Now.ToString("yyyyMMddHHmmss_ffff", DateTimeFormatInfo.InvariantInfo) + fileExt;
        String filePath = dirPath + fileName;

        imgFile.SaveAs(filePath);

        String fileUrl = saveUrl + fileName;

        Hashtable hash = new Hashtable();
        hash["error"] = 0;
        hash["url"] = fileUrl;
        context.Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
        context.Response.Write(JsonMapper.ToJson(hash));
        context.Response.End();
    }

    private void showError(string message)
    {
        Hashtable hash = new Hashtable();
        hash["error"] = 1;
        hash["message"] = message;
        context.Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
        context.Response.Write(JsonMapper.ToJson(hash));
        context.Response.End();
    }

    public bool IsReusable
    {
        get
        {
            return true;
        }
    }
}
