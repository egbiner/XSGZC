  
  
// 党建快讯轮播图js
var lun_bo_imgs = new Array();  
lun_bo_imgs[0] = {img: "images/2.jpg", a: "banner_lun_bo_a_1"};  
lun_bo_imgs[1] = {img: "images/1.jpg", a: "banner_lun_bo_a_2"};  
lun_bo_imgs[2] = {img: "images/1.jpg", a: "banner_lun_bo_a_3"};  
  
var lun_bo_img_index = 0;  
function lunBoImgage(){  
   if(lun_bo_img_index >= lun_bo_imgs.length) lun_bo_img_index = 0;  
   setLunBoImage(lun_bo_img_index);  
   lun_bo_img_index += 1;  
}  
  
  
function setLunBoImage(index)  
{  
   if(index < 0 || index >= lun_bo_imgs.length) index = 0;  
   var tagImg = document.getElementById("banner_lun_bo_img");  
   tagImg.src = lun_bo_imgs[index].img;  
   tagImg.title = lun_bo_imgs[index].desc;  
   tagImg.alt = lun_bo_imgs[index].desc;  
   document.getElementById(lun_bo_imgs[index].a).style.backgroundColor = "#006DCC";  
   document.getElementById(lun_bo_imgs[index].a).style.color = "white";  
   for(var i = 0; i < lun_bo_imgs.length; i++)  
   {  
        if(index != i)  
        {  
            document.getElementById(lun_bo_imgs[i].a).style.backgroundColor = "white";  
            document.getElementById(lun_bo_imgs[i].a).style.color = "black";  
        }  
   }  
}  
  
 var timerLunBo = setInterval(lunBoImgage, 2000);   
 var banner_lun_bo_img_box = document.getElementById("banner_lun_bo_img_box");  
 banner_lun_bo_img_box.onmouseover = function () { clearInterval(timerLunBo) };       
 banner_lun_bo_img_box.onmouseout = function ()  { timerLunBo = setInterval(lunBoImgage, 2000) };  
   
// 图片轮播代码 end //////////////////////////////////////////////////////////////  
  
  
  
