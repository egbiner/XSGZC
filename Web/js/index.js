// JavaScript Document
$(function () {
    function on() {
        BBB = document.getElementById("demo1");
        document.getElementById("on").style.display = "none";
        document.getElementById("off").style.display = "block";
    }
    function off() {
        BBB = "";
        document.getElementById("off").style.display = "none";
        document.getElementById("on").style.display = "block";
    }
    var BBB = document.getElementById("demo1");
    var AAA = document.getElementById("demo");
    var num = BBB.offsetTop;
    BBB.innerHTML += BBB.innerHTML;
    var ygd = setInterval(gundong, 50);
    function gundong() {
        if (num > -(BBB.offsetHeight - AAA.offsetHeight)) {
            BBB.style.top = num + 'px';
            num--;
        }
        else {
            num = -(BBB.offsetHeight / 2 - AAA.offsetHeight);
        }
    }
    BBB.onmouseover = function () { clearInterval(ygd) };
    BBB.onmouseout = function () { ygd = setInterval(gundong, 50) };//滚动速度
})