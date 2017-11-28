<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta  charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
    <meta http-equiv="Pragma" content="no-cache">
    <title>书屋</title>
    <link href="<%=basePath%>resources/style/css/css.css" rel="stylesheet" type="text/css" charset="utf-8">
    <meta content="旧书" name="keywords">
    <meta content="——古旧书在线1元拍" name="description">

    <style type="text/css">
        .ad{ width:83px; height:83px; background:white; position:fixed; right:0; bottom:100px;}
    </style>
    <script language="javascript">
        function login(){
            if(loginform.userid.value==""){
                alert("请输入您的用户名！");
                return false;
            }
            if(loginform.password.value==""){
                alert("请输入您的密码！");
                return false;
            }

            loginform.submit();
            return true;
        }
        function gosearch() {
            var r = document.all('findtype').value;
            var s = document.all('findwhat').value;
            QuickSearch.action = "searchresult.jsp?" + r + "=" + s;
            QuickSearch.submit();
        }
        function getpassword(){
            window.open("forget.jsp","找回密码","width=347,height=175,toolbar=no,top=200,left=200,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no");
        }
        var flag = true;
        function show() {
            var o = document.getElementById("viewbyclass");
            if (flag) {
                o.style.display = "block";
                flag = false;
            } else {
                o.style.display = "none";
                flag = true;
            }
        }

        function sendMsg() {
            window.open("message-send.jsp", "sendmsg", "width=410,height=200,toolbar=no,top=200,left=200,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no");
        }

        function AutoResizeImage(maxWidth,maxHeight,objImg) {
            var img = new Image();
            img.src = objImg.src;
            var hRatio;
            var wRatio;
            var Ratio = 1;
            var w = img.width;
            var h = img.height;
            wRatio = maxWidth / w;
            hRatio = maxHeight / h;
            if (maxWidth ==0 && maxHeight==0){
                Ratio = 1;
            }else if (maxWidth==0){//
                if (hRatio<1) Ratio = hRatio;
            }else if (maxHeight==0){
                if (wRatio<1) Ratio = wRatio;
            }else if (wRatio<1 || hRatio<1){
                Ratio = (wRatio<=hRatio?wRatio:hRatio);
            }
            if (Ratio<1){
                w = w * Ratio;
                h = h * Ratio;
            }
            objImg.height = h;
            objImg.width = w;
        }
    </script>
</head>

<body>
<div class="ad"><a href="http://weibo.com/booyeebooks" target="_blank"><img src="<%=basePath%>resources/style/images/weibo.gif" border="0"></a></div>
<div id="container"><!--页面层容器-->
    <div id="Header"><!--页面头部-->

        <div id="logo"><img src="<%=basePath%>resources/style/images/logo.png"></div>
        <div id="User">
            <ul>
                <li><a href="http://www.booyee.com.cn/myorder.jsp" class="userfct">布衣订单(0)</a> <a href="http://youdi.booyee.com.cn/gotoVIP.jsp?token=&amp;order=1&amp;p=" class="userfct">有底订单(<iframe src="./布衣书局_files/need_pay_iframe.html" marginwidth="0" marginheight="0" frameborder="0" scrolling="no" width="10" height="10"></iframe>)</a> <a href="http://dabaicai.booyee.com.cn/gotoDBC.jsp?token=&amp;order=1&amp;p=" class="userfct">白菜订单(<iframe src="./布衣书局_files/need_pay_iframe(1).html" marginwidth="0" marginheight="0" frameborder="0" scrolling="no" width="10" height="10"></iframe>)</a>|<a href="http://www.booyee.com.cn/buy01.jsp" class="userfct">购物车</a>|<a href="http://www.booyee.com.cn/myorder.jsp" class="userfct">布衣账户</a>|<a href="javascript:sendMsg();" class="userfct">留言</a>|<a href="http://www.booyee.com.cn/message.jsp" class="userfct">消息</a>|<a href="http://www.booyee.com.cn/n-topay.jsp" class="userfct" target="_blank">付款</a></li>
            </ul>
        </div>
    </div>
    <div id="menu">
        <ul>
            <li><a href="http://www.booyee.com.cn/" class="menunav22">首页</a></li>
            <li class="menuDiv"></li>
            <li><a href="http://www.booyee.com.cn/user-own-bid-picList.jsp" class="menunav1"><img src=".<%=basePath%>resources/style/images/hammer.gif" alt="hammer" width="32" height="32" class="menuIcon">布衣一元拍</a></li>
            <li class="menuDiv"></li>
            <li><a href="http://youdi.booyee.com.cn/gotoVIP.jsp?token=&amp;p=" class="menunav1" target="_blank"><img src="<%=basePath%>resources/style/images/hammer.gif" alt="hammer" width="32" height="32" class="menuIcon">有底拍</a></li>
            <li class="menuDiv"></li>
            <li><a href="http://dabaicai.booyee.com.cn/gotoDBC.jsp?token=&amp;p=" class="menunav1" target="_blank"><img src="<%=basePath%>resources/style/images/hammer.gif" alt="hammer" width="32" height="32" class="menuIcon">白菜一元拍</a></li>
            <li class="menuDiv"></li>
            <li><a href="http://www.booyee.com.cn/list-old.jsp" class="menunav22">古籍</a></li>
            <li class="menuDiv"></li>
            <li><a href="http://www.booyee.com.cn/list-used.jsp" class="menunav22">旧书</a></li>
            <li class="menuDiv"></li>
            <li><a href="http://www.booyee.com.cn/list-new.jsp" class="menunav22">新书</a></li>
            <li class="menuDiv"></li>
            <li><a href="http://www.booyee.com.cn/list-minguo.jsp" class="menunav22">民国</a></li>
            <li class="menuDiv"></li>
            <li><a href="http://www.booyee.com.cn/list-baokan.jsp" class="menunav22">文创</a></li>
            <li class="menuDiv"></li>
            <li><a href="http://www.booyee.com.cn/list-shouji.jsp" class="menunav22">手迹</a></li>
            <li class="menuDiv"></li>
            <li><a href="http://www.booyee.com.cn/list-other.jsp" class="menunav22">资料</a></li>
            <li class="menuDiv"></li>
            <li><a href="http://www.booyee.com.cn/list-en.jsp" class="menunav22">外文</a></li>
            <li class="menuDiv"></li>
            <li><a href="http://dabaicai.booyee.com.cn/gotoDBC.jsp?shudian=1&amp;token=&amp;p=" class="menunav33" target="_blank">白菜书店</a></li>
            <li class="menuDiv"></li>
            <li><a href="http://www.booyee.com.cn/bbs" class="menunav33" target="_blank">布衣论坛</a></li>
        </ul>
        　　
    </div>

    <div id="pagebody2"><!--页面主体-->
        <div id="sidebar"><!--侧边栏-->
            <div class="sidebox" id="search">
                <div class="sidetitle"><span>登录书屋</span></div>
                <div class="sidecontent login">
                    <form method="post" action="<%=path%>/user/login.do" method="get"  name="loginform">
                        <input type="hidden" name="clickflag" value="1">
                        <input type="hidden" name="seacher['aa']" value="1">
                        用户名<input name="userid" type="text" class="password" id="userid" value="">
                        密　码<input name="password" type="password" class="password" id="password" value="">
                        <a href="javascript:return login();"><input type="image" src="<%=basePath%>resources/style/images/loginbutton.gif" alt="登录" width="168" height="28" class="menuIcon loginbtn"></a>
                    </form>
                    <span><a href="javascript:void(0);" onclick="javascript:getpassword();" class="sidemessage">忘记密码？</a></span><a href="#" class="more" target="_blank">注册</a></div>
            </div>


            <div class="sidebox" id="search">
                <div class="sidetitle"><span>手机版链接</span></div>
                <div class="sidecontent diary" style="min-height:80px;">
                    <ul>
                        <li><a href="http://youdi.booyee.com.cn/index_m.jsp?token=&amp;p=" class="sidemessage" target="_blank"><span style="color:red; font-weight: bold;">有底拍手机版</span></a></li>
                        <li><a href="http://www.booyee.com.cn/index_m.jsp?token=&amp;p=" class="sidemessage" target="_blank">布衣一元拍手机版</a></li>
                        <li><a href="http://dabaicai.booyee.com.cn/index_m.jsp?token=&amp;p=" class="sidemessage" target="_blank">白菜一元拍手机版</a></li>
                    </ul>
                </div>
            </div>

            <div class="sidebox">
                <div class="sidetitle"><span>书籍搜索</span><a class="more" href="http://www.booyee.com.cn/search.jsp" target="_blank">高级搜索&gt;</a></div>
                <div class="sidecontent search">
                    <form method="post" action="http://www.booyee.com.cn/searchresult.jsp" name="QuickSearch" target="_blank">
                        <input type="hidden" name="startflag" value="1">
                        <input name="findwhat" type="text" class="inp_srh" id="findwhat" value="请输入您想查找的书名……" onfocus="if(this.value==&#39;请输入您想查找的书名……&#39;) {this.value=&#39;&#39;;}" onblur="if(this.value==&#39;&#39;){this.value=&#39;请输入您想查找的书名……&#39;}">

                        <select name="findtype" id="findtype" class="leibie">
                            <option value="bookname">书名</option>
                            <option value="author">著作人</option>
                            <option value="publisher">出版人</option>
                        </select>
                        <a href="javascript:void(0)" onclick="gosearch()"><input type="image" src="<%=basePath%>resources/style/images/searchbotton.gif" alt="搜索" width="73" height="27" class="menuIcon searchbtn"></a>
                    </form>
                </div>
            </div>

            <div class="sidebox" id="search">
                <div class="sidetitle"><span>一周新书</span><a class="more" href="http://www.booyee.com.cn/list-sevenday.jsp" target="_blank">更多&gt;</a></div>
                <div class="sidecontent diary" style="min-height:170px;">
                    <ul>

                        <li><a href="http://www.booyee.com.cn/bookdetail-new.jsp?bookid=448441" class="sidemessage" target="_blank">眉睫签名钤印毛边本《梅光迪年谱初稿》（海豚社2017年版·定价128元）（赠签名钤印本《丰子恺札记》）（包邮）</a></li>

                        <li><a href="http://www.booyee.com.cn/bookdetail-new.jsp?bookid=439810" class="sidemessage" target="_blank">邱小石签名毛边本：建筑你的模式语言（中央编译出版社2017年版·定价58元·限量编号200册）</a></li>

                        <li><a href="http://www.booyee.com.cn/bookdetail-new.jsp?bookid=441880" class="sidemessage" target="_blank">精装毛边本《字看我一生》（流沙河著·中华书局2017年版·16开·定价78元）（包邮）</a></li>

                    </ul>
                </div>
            </div>
            <div class="sidebox" id="search">
                <div class="sidetitle"><span>书屋专题</span><a class="more" href="http://www.booyee.com.cn/list-zhuanti.jsp" target="_blank">更多&gt;</a></div>
                <div class="sidecontent" style="min-height:170px;">
                    <ul>

                        <li><a href="http://www.booyee.com.cn/zhuanti_detail.jsp?zt_id=28" class="sidemessage" target="_blank">国家图书馆出版社</a></li>

                        <li><a href="http://www.booyee.com.cn/zhuanti_detail.jsp?zt_id=29" class="sidemessage" target="_blank">包邮拍卖图录</a></li>

                        <li><a href="http://www.booyee.com.cn/zhuanti_detail.jsp?zt_id=30" class="sidemessage" target="_blank">故宫出版社</a></li>

                        <li><a href="http://www.booyee.com.cn/zhuanti_detail.jsp?zt_id=31" class="sidemessage" target="_blank">布衣独家包销</a></li>

                        <li><a href="http://www.booyee.com.cn/zhuanti_detail.jsp?zt_id=32" class="sidemessage" target="_blank">中华书局</a></li>

                        <li><a href="http://www.booyee.com.cn/zhuanti_detail.jsp?zt_id=33" class="sidemessage" target="_blank">毛边本</a></li>

                        <li><a href="http://www.booyee.com.cn/zhuanti_detail.jsp?zt_id=34" class="sidemessage" target="_blank">特价库存书</a></li>

                        <li><a href="http://www.booyee.com.cn/zhuanti_detail.jsp?zt_id=35" class="sidemessage" target="_blank">三联书店</a></li>

                        <li><a href="http://www.booyee.com.cn/zhuanti_detail.jsp?zt_id=36" class="sidemessage" target="_blank">艺术画册</a></li>

                        <li><a href="http://www.booyee.com.cn/zhuanti_detail.jsp?zt_id=37" class="sidemessage" target="_blank">文物出版社</a></li>

                    </ul>
                </div>
            </div>

            <div class="sidebox" id="search">
                <div class="sidetitle"><span>书屋公告</span><a class="more" href="http://www.booyee.com.cn/list-announce.jsp" target="_blank">更多&gt;</a></div>
                <div class="sidecontent message" style="min-height:170px;">
                    <ul>

                        <li><a href="http://www.booyee.com.cn/news-detail.jsp?announceid=90" class="sidemessage" target="_blank">布衣书局一元拍规则调整说明</a></li>

                        <li><a href="http://www.booyee.com.cn/news-detail.jsp?announceid=87" class="sidemessage" target="_blank">布衣书局关于规范订单结算周期的说明</a></li>

                        <li><a href="http://www.booyee.com.cn/news-detail.jsp?announceid=85" class="sidemessage" target="_blank">欢迎大家使用微信支付进行结算</a></li>

                        <li><a href="http://www.booyee.com.cn/news-detail.jsp?announceid=83" class="sidemessage" target="_blank">布衣书局“一元拍”规则（试行）</a></li>

                    </ul>
                </div>
            </div>

            <div class="sidebox" id="search">
                <div class="sidetitle"><span>众说书屋</span><a class="more" href="http://www.booyee.com.cn/bbs/zxlist.jsp" target="_blank">更多&gt;</a></div>
                <div class="sidecontent diary">

                    <li><a href="http://www.booyee.com.cn/bbs/updateHitnum.jsp?threadid=153&amp;zx=1" class="sidemessage" target="_blank">胡同：布衣书局这十年（吴菲/文）（《北京青年报》2014年4月23日C2版）</a></li>

                    <li><a href="http://www.booyee.com.cn/bbs/updateHitnum.jsp?threadid=172&amp;zx=1" class="sidemessage" target="_blank">十年，胡同与我（陈晓维/文）</a></li>

                </div>
            </div>

            <div class="weixin">
                <img src="./布衣书局_files/weixin.jpg" width="190" height="182" class="weixinpic" alt="布衣书局官方微信">
                <img src="./布衣书局_files/weibo_2.jpg" width="190" class="weixinpic" alt="布衣书局官方微博">
                <a href="http://weibo.com/booyeebooks" target="_blank" class="weixinpic"><img src="<%=basePath%>resources/style/images/weibo.jpg" width="190" height="87" class="weixinpic" alt="布衣书局官方微博"></a>
                <img src="./布衣书局_files/weixin_pay.jpg" width="190" class="weixinpic">
                <img src="./布衣书局_files/alipay_pay.jpg" width="190" class="weixinpic">
            </div>


        </div>
        <!--侧边栏结束-->


        <div id="mainbody2"><!--主体内容-->
            <!--布衣一元拍开始-->
            <div style="margin-top:15px;"></div>
            <div id="Banner2">
                <img src="<%=basePath%>resources/style/images/banner2.jpg" width="741" height="86" alt="banner"><img src="<%=basePath%>resources/style/images/scanbooyee.jpg" height="86">
            </div>
            <div id="line2"></div>
            <div id="titlebox"> <!--布衣推荐开始-->
                <img src="<%=basePath%>resources/style/images/recommend.jpg" class="menuIcon" width="74" height="18" alt="布衣推荐"><a class="more2" href="http://www.booyee.com.cn/list-new2.jsp" target="_blank">更多推荐&gt;</a>
            </div>

            <div class="item_container">

                <div class="item">
                    <div class="bookback">

                        <a href="http://www.booyee.com.cn/bookdetail-new.jsp?bookid=448441" target="_blank" class="bookcover" rel="眉睫签名钤印毛边本《梅光迪年谱初稿》（海豚社2017年版·定价128元）（赠签名钤印本《丰子恺札记》）（包邮）"><img src="./布衣书局_files/07468539403.JPG" height="125" border="0" class="bookcover" alt="眉睫签名钤印毛边本《梅光迪年谱初稿》（海豚社2017年版·定价128元）（赠签名钤印本《丰子恺札记》）（包邮）" onload="AutoResizeImage(170,170,this)" width="170"></a>

                    </div>
                    <div class="bookbox">
                        <a href="http://www.booyee.com.cn/bookdetail-new.jsp?bookid=448441" class="bookname">眉睫签名钤印毛边本《梅光迪年谱初稿》（海豚社2017年版·定价128元）（赠签名...</a>
                    </div>
                    <div class="bookbox price">
                        <a href="http://www.booyee.com.cn/#" class="bookname red">价格：￥128.00</a><a href="http://www.booyee.com.cn/buysession.jsp?bookid=448441&amp;url=index.jsp"><img src="./布衣书局_files/buyit.gif" width="49" height="24" alt="购买" class="bookbuy"></a>
                    </div>
                </div>

                <div class="item">
                    <div class="bookback">

                        <a href="http://www.booyee.com.cn/bookdetail-new.jsp?bookid=439810" target="_blank" class="bookcover" rel="邱小石签名毛边本：建筑你的模式语言（中央编译出版社2017年版·定价58元·限量编号200册）"><img src="./布衣书局_files/13097268231.jpg" height="170" border="0" class="bookcover" alt="邱小石签名毛边本：建筑你的模式语言（中央编译出版社2017年版·定价58元·限量编号200册）" onload="AutoResizeImage(170,170,this)" width="119"></a>

                    </div>
                    <div class="bookbox">
                        <a href="http://www.booyee.com.cn/bookdetail-new.jsp?bookid=439810" class="bookname">邱小石签名毛边本：建筑你的模式语言（中央编译出版社2017年版·定价58元·限量...</a>
                    </div>
                    <div class="bookbox price">
                        <a href="http://www.booyee.com.cn/#" class="bookname red">价格：￥58.00</a><a href="http://www.booyee.com.cn/buysession.jsp?bookid=439810&amp;url=index.jsp"><img src="./布衣书局_files/buyit.gif" width="49" height="24" alt="购买" class="bookbuy"></a>
                    </div>
                </div>

                <div class="item">
                    <div class="bookback">

                        <a href="http://www.booyee.com.cn/bookdetail-new.jsp?bookid=439968" target="_blank" class="bookcover" rel="再遇芥子园：《芥子园画传》与当代名家对话展图录（国家图书馆编·国图社2017年版·16开·定价128元）（8折包邮）"><img src="./布衣书局_files/99038665860.jpg" height="170" border="0" class="bookcover" alt="再遇芥子园：《芥子园画传》与当代名家对话展图录（国家图书馆编·国图社2017年版·16开·定价128元）（8折包邮）" onload="AutoResizeImage(170,170,this)" width="121"></a>

                    </div>
                    <div class="bookbox">
                        <a href="http://www.booyee.com.cn/bookdetail-new.jsp?bookid=439968" class="bookname">再遇芥子园：《芥子园画传》与当代名家对话展图录（国家图书馆编·国图社2017年版...</a>
                    </div>
                    <div class="bookbox price">
                        <a href="http://www.booyee.com.cn/#" class="bookname red">价格：￥102.00</a><a href="http://www.booyee.com.cn/buysession.jsp?bookid=439968&amp;url=index.jsp"><img src="./布衣书局_files/buyit.gif" width="49" height="24" alt="购买" class="bookbuy"></a>
                    </div>
                </div>

                <div class="item">
                    <div class="bookback">

                        <a href="http://www.booyee.com.cn/bookdetail-new.jsp?bookid=444921" target="_blank" class="bookcover" rel="布衣定制·限量500部布面精装本《觅诗记》（钤“韦力”名章·上海文艺社新版·一函三册全·定价330元）（包邮）"><img src="./布衣书局_files/01586842992.JPG" height="140" border="0" class="bookcover" alt="布衣定制·限量500部布面精装本《觅诗记》（钤“韦力”名章·上海文艺社新版·一函三册全·定价330元）（包邮）" onload="AutoResizeImage(170,170,this)" width="170"></a>

                    </div>
                    <div class="bookbox">
                        <a href="http://www.booyee.com.cn/bookdetail-new.jsp?bookid=444921" class="bookname">布衣定制·限量500部布面精装本《觅诗记》（钤“韦力”名章·上海文艺社新版·一函...</a>
                    </div>
                    <div class="bookbox price">
                        <a href="http://www.booyee.com.cn/#" class="bookname red">价格：￥330.00</a><a href="http://www.booyee.com.cn/buysession.jsp?bookid=444921&amp;url=index.jsp"><img src="./布衣书局_files/buyit.gif" width="49" height="24" alt="购买" class="bookbuy"></a>
                    </div>
                </div>

                <div class="item">
                    <div class="bookback">

                        <a href="http://www.booyee.com.cn/bookdetail-new.jsp?bookid=447433" target="_blank" class="bookcover" rel="布面精装毛边本：绿遍池塘草园咏+梅景书屋画事（王叔重等编·浙江人美社2017年版·16开2册·定价300元）（包邮）"><img src="./布衣书局_files/34413124704.jpg" height="147" border="0" class="bookcover" alt="布面精装毛边本：绿遍池塘草园咏+梅景书屋画事（王叔重等编·浙江人美社2017年版·16开2册·定价300元）（包邮）" onload="AutoResizeImage(170,170,this)" width="170"></a>

                    </div>
                    <div class="bookbox">
                        <a href="http://www.booyee.com.cn/bookdetail-new.jsp?bookid=447433" class="bookname">布面精装毛边本：绿遍池塘草园咏+梅景书屋画事（王叔重等编·浙江人美社2017年版...</a>
                    </div>
                    <div class="bookbox price">
                        <a href="http://www.booyee.com.cn/#" class="bookname red">价格：￥300.00</a><a href="http://www.booyee.com.cn/buysession.jsp?bookid=447433&amp;url=index.jsp"><img src="./布衣书局_files/buyit.gif" width="49" height="24" alt="购买" class="bookbuy"></a>
                    </div>
                </div>

                <div class="item">
                    <div class="bookback">

                        <a href="http://www.booyee.com.cn/bookdetail-new.jsp?bookid=447432" target="_blank" class="bookcover" rel="蠹鱼春秋：古籍拍卖杂谈（韦力著·上海人民社2017年版·定价78元）(85折包邮）"><img src="./布衣书局_files/99240942898.jpg" height="170" border="0" class="bookcover" alt="蠹鱼春秋：古籍拍卖杂谈（韦力著·上海人民社2017年版·定价78元）(85折包邮）" onload="AutoResizeImage(170,170,this)" width="118"></a>

                    </div>
                    <div class="bookbox">
                        <a href="http://www.booyee.com.cn/bookdetail-new.jsp?bookid=447432" class="bookname">蠹鱼春秋：古籍拍卖杂谈（韦力著·上海人民社2017年版·定价78元）(85折包邮...</a>
                    </div>
                    <div class="bookbox price">
                        <a href="http://www.booyee.com.cn/#" class="bookname red">价格：￥66.00</a><a href="http://www.booyee.com.cn/buysession.jsp?bookid=447432&amp;url=index.jsp"><img src="./布衣书局_files/buyit.gif" width="49" height="24" alt="购买" class="bookbuy"></a>
                    </div>
                </div>

                <div class="item">
                    <div class="bookback">

                        <a href="http://www.booyee.com.cn/bookdetail-new.jsp?bookid=444925" target="_blank" class="bookcover" rel="李滨声签名本：燕京画旧全编（中华书局2017年版·16开·定价98元）（148元包邮）"><img src="./布衣书局_files/59801354004.jpg" height="170" border="0" class="bookcover" alt="李滨声签名本：燕京画旧全编（中华书局2017年版·16开·定价98元）（148元包邮）" onload="AutoResizeImage(170,170,this)" width="120"></a>

                    </div>
                    <div class="bookbox">
                        <a href="http://www.booyee.com.cn/bookdetail-new.jsp?bookid=444925" class="bookname">李滨声签名本：燕京画旧全编（中华书局2017年版·16开·定价98元）（148元...</a>
                    </div>
                    <div class="bookbox price">
                        <a href="http://www.booyee.com.cn/#" class="bookname red">价格：￥148.00</a><a href="http://www.booyee.com.cn/buysession.jsp?bookid=444925&amp;url=index.jsp"><img src="./布衣书局_files/buyit.gif" width="49" height="24" alt="购买" class="bookbuy"></a>
                    </div>
                </div>

                <div class="item">
                    <div class="bookback">

                        <a href="http://www.booyee.com.cn/bookdetail-new.jsp?bookid=444922" target="_blank" class="bookcover" rel="魂系红楼——女性研红的先行者王佩璋（张胜利著·万卷2017年版·定价35元）（8折包邮）"><img src="./布衣书局_files/54205245309.jpg" height="170" border="0" class="bookcover" alt="魂系红楼——女性研红的先行者王佩璋（张胜利著·万卷2017年版·定价35元）（8折包邮）" onload="AutoResizeImage(170,170,this)" width="120"></a>

                    </div>
                    <div class="bookbox">
                        <a href="http://www.booyee.com.cn/bookdetail-new.jsp?bookid=444922" class="bookname">魂系红楼——女性研红的先行者王佩璋（张胜利著·万卷2017年版·定价35元）（8...</a>
                    </div>
                    <div class="bookbox price">
                        <a href="http://www.booyee.com.cn/#" class="bookname red">价格：￥28.00</a><a href="http://www.booyee.com.cn/buysession.jsp?bookid=444922&amp;url=index.jsp"><img src="./布衣书局_files/buyit.gif" width="49" height="24" alt="购买" class="bookbuy"></a>
                    </div>
                </div>

                <div class="item">
                    <div class="bookback">

                        <a href="http://www.booyee.com.cn/bookdetail-new.jsp?bookid=444929" target="_blank" class="bookcover" rel="书话三部曲（钟芳玲著·中央编译出版社2017年版·16开纸面精装·全3册·定价417元）（85折包邮+赠明信片6枚）"><img src="./布衣书局_files/07634316098.jpg" height="124" border="0" class="bookcover" alt="书话三部曲（钟芳玲著·中央编译出版社2017年版·16开纸面精装·全3册·定价417元）（85折包邮+赠明信片6枚）" onload="AutoResizeImage(170,170,this)" width="170"></a>

                    </div>
                    <div class="bookbox">
                        <a href="http://www.booyee.com.cn/bookdetail-new.jsp?bookid=444929" class="bookname">书话三部曲（钟芳玲著·中央编译出版社2017年版·16开纸面精装·全3册·定价4...</a>
                    </div>
                    <div class="bookbox price">
                        <a href="http://www.booyee.com.cn/#" class="bookname red">价格：￥354.00</a><a href="http://www.booyee.com.cn/buysession.jsp?bookid=444929&amp;url=index.jsp"><img src="./布衣书局_files/buyit.gif" width="49" height="24" alt="购买" class="bookbuy"></a>
                    </div>
                </div>

                <div class="item">
                    <div class="bookback">

                        <a href="http://www.booyee.com.cn/bookdetail-new.jsp?bookid=447735" target="_blank" class="bookcover" rel="木版水印五色彩宣版《最相思笺》（半生熟安徽净皮宣纸·手工刻印·一盒40张）（包邮）"><img src="./布衣书局_files/30260326262.jpg" height="151" border="0" class="bookcover" alt="木版水印五色彩宣版《最相思笺》（半生熟安徽净皮宣纸·手工刻印·一盒40张）（包邮）" onload="AutoResizeImage(170,170,this)" width="170"></a>

                    </div>
                    <div class="bookbox">
                        <a href="http://www.booyee.com.cn/bookdetail-new.jsp?bookid=447735" class="bookname">木版水印五色彩宣版《最相思笺》（半生熟安徽净皮宣纸·手工刻印·一盒40张）（包邮...</a>
                    </div>
                    <div class="bookbox price">
                        <a href="http://www.booyee.com.cn/#" class="bookname red">价格：￥168.00</a><a href="http://www.booyee.com.cn/buysession.jsp?bookid=447735&amp;url=index.jsp"><img src="./布衣书局_files/buyit.gif" width="49" height="24" alt="购买" class="bookbuy"></a>
                    </div>
                </div>

                <div class="item">
                    <div class="bookback">

                        <a href="http://www.booyee.com.cn/bookdetail-new.jsp?bookid=439816" target="_blank" class="bookcover" rel="漆永祥签名本《汉学商兑·汉学商兑赘言》（方东树等纂·北京联合2017年版·精装·定价48元）（包邮）"><img src="./布衣书局_files/70165161249.jpg" height="141" border="0" class="bookcover" alt="漆永祥签名本《汉学商兑·汉学商兑赘言》（方东树等纂·北京联合2017年版·精装·定价48元）（包邮）" onload="AutoResizeImage(170,170,this)" width="170"></a>

                    </div>
                    <div class="bookbox">
                        <a href="http://www.booyee.com.cn/bookdetail-new.jsp?bookid=439816" class="bookname">漆永祥签名本《汉学商兑·汉学商兑赘言》（方东树等纂·北京联合2017年版·精装·...</a>
                    </div>
                    <div class="bookbox price">
                        <a href="http://www.booyee.com.cn/#" class="bookname red">价格：￥48.00</a><a href="http://www.booyee.com.cn/buysession.jsp?bookid=439816&amp;url=index.jsp"><img src="./布衣书局_files/buyit.gif" width="49" height="24" alt="购买" class="bookbuy"></a>
                    </div>
                </div>

                <div class="item">
                    <div class="bookback">

                        <a href="http://www.booyee.com.cn/bookdetail-new.jsp?bookid=439971" target="_blank" class="bookcover" rel="咏春八题（澄远堂编印·限量编号200部·大16开布面精装）（包邮）"><img src="./布衣书局_files/49998305447.jpg" height="152" border="0" class="bookcover" alt="咏春八题（澄远堂编印·限量编号200部·大16开布面精装）（包邮）" onload="AutoResizeImage(170,170,this)" width="170"></a>

                    </div>
                    <div class="bookbox">
                        <a href="http://www.booyee.com.cn/bookdetail-new.jsp?bookid=439971" class="bookname">咏春八题（澄远堂编印·限量编号200部·大16开布面精装）（包邮）</a>
                    </div>
                    <div class="bookbox price">
                        <a href="http://www.booyee.com.cn/#" class="bookname red">价格：￥238.00</a><a href="http://www.booyee.com.cn/buysession.jsp?bookid=439971&amp;url=index.jsp"><img src="./布衣书局_files/buyit.gif" width="49" height="24" alt="购买" class="bookbuy"></a>
                    </div>
                </div>


            </div>
            <!--布衣推荐结束-->
            <div id="line2"></div>
            <div id="titlebox">
                <img src="./布衣书局_files/booyee.jpg" class="menuIcon" alt="布衣一元拍"><a class="more2" href="http://www.booyee.com.cn/user-own-bid-picList.jsp" target="_blank">更多一元拍&gt;</a>
            </div>
            <div class="item_container">

                <div class="item">
                    <div class="bookback">
                        <a href="http://www.booyee.com.cn/user-bid.jsp?id=173275" class="bookcover" target="_blank"><img src="./布衣书局_files/80384991706.jpg" alt="王培夫妇藏书专场：篆书入门（以下均为王培夫妇旧藏）" height="170" class="bookcover" onload="AutoResizeImage(170,170,this)" width="122"></a>
                    </div>
                    <div class="bookbox">
                        <a href="http://www.booyee.com.cn/user-bid.jsp?id=173275" class="bookname" target="_blank">王培夫妇藏书专场：篆书入门（以下均为王培夫妇旧藏）</a>
                    </div>
                    <div class="bookbox price2">
                        <a href="http://www.booyee.com.cn/#" class="bookname red">最高拍价：￥7</a><br>
                        <span class="bookname red">剩余时间：6天21小时6分52秒</span><br>
                        <a href="http://www.booyee.com.cn/user-bid.jsp?id=173275" target="_blank"><img src="./布衣书局_files/price.gif" width="82" height="24" alt="出价" class="bookbuy paimai"></a>
                    </div>
                </div>

                <div class="item">
                    <div class="bookback">
                        <a href="http://www.booyee.com.cn/user-bid.jsp?id=173372" class="bookcover" target="_blank"><img src="./布衣书局_files/37387264149.jpg" alt="牛棚杂忆" height="170" class="bookcover" onload="AutoResizeImage(170,170,this)" width="114"></a>
                    </div>
                    <div class="bookbox">
                        <a href="http://www.booyee.com.cn/user-bid.jsp?id=173372" class="bookname" target="_blank">牛棚杂忆</a>
                    </div>
                    <div class="bookbox price2">
                        <a href="http://www.booyee.com.cn/#" class="bookname red">最高拍价：￥10</a><br>
                        <span class="bookname red">剩余时间：6天22小时43分52秒</span><br>
                        <a href="http://www.booyee.com.cn/user-bid.jsp?id=173372" target="_blank"><img src="./布衣书局_files/price.gif" width="82" height="24" alt="出价" class="bookbuy paimai"></a>
                    </div>
                </div>

                <div class="item">
                    <div class="bookback">
                        <a href="http://www.booyee.com.cn/user-bid.jsp?id=173373" class="bookcover" target="_blank"><img src="./布衣书局_files/76793773918.jpg" alt="酱油米醋和酱菜（1960年版·土纸本·印1000册）（以上均为王培夫妇旧藏）" height="170" class="bookcover" onload="AutoResizeImage(170,170,this)" width="121"></a>
                    </div>
                    <div class="bookbox">
                        <a href="http://www.booyee.com.cn/user-bid.jsp?id=173373" class="bookname" target="_blank">酱油米醋和酱菜（1960年版·土纸本·印1000册）（以上均为王培夫妇旧藏）</a>
                    </div>
                    <div class="bookbox price2">
                        <a href="http://www.booyee.com.cn/#" class="bookname red">最高拍价：￥4</a><br>
                        <span class="bookname red">剩余时间：6天22小时45分52秒</span><br>
                        <a href="http://www.booyee.com.cn/user-bid.jsp?id=173373" target="_blank"><img src="./布衣书局_files/price.gif" width="82" height="24" alt="出价" class="bookbuy paimai"></a>
                    </div>
                </div>

                <div class="item">
                    <div class="bookback">
                        <a href="http://www.booyee.com.cn/user-bid.jsp?id=173368" class="bookcover" target="_blank"><img src="./布衣书局_files/47464524685.jpg" alt="红楼梦研究参考资料（1954年版）" height="170" class="bookcover" onload="AutoResizeImage(170,170,this)" width="119"></a>
                    </div>
                    <div class="bookbox">
                        <a href="http://www.booyee.com.cn/user-bid.jsp?id=173368" class="bookname" target="_blank">红楼梦研究参考资料（1954年版）</a>
                    </div>
                    <div class="bookbox price2">
                        <a href="http://www.booyee.com.cn/#" class="bookname red">最高拍价：￥4</a><br>
                        <span class="bookname red">剩余时间：6天22小时39分52秒</span><br>
                        <a href="http://www.booyee.com.cn/user-bid.jsp?id=173368" target="_blank"><img src="./布衣书局_files/price.gif" width="82" height="24" alt="出价" class="bookbuy paimai"></a>
                    </div>
                </div>

                <div class="item">
                    <div class="bookback">
                        <a href="http://www.booyee.com.cn/user-bid.jsp?id=173278" class="bookcover" target="_blank"><img src="./布衣书局_files/42271552326.jpg" alt="楷书入门" height="170" class="bookcover" onload="AutoResizeImage(170,170,this)" width="120"></a>
                    </div>
                    <div class="bookbox">
                        <a href="http://www.booyee.com.cn/user-bid.jsp?id=173278" class="bookname" target="_blank">楷书入门</a>
                    </div>
                    <div class="bookbox price2">
                        <a href="http://www.booyee.com.cn/#" class="bookname red">最高拍价：￥4</a><br>
                        <span class="bookname red">剩余时间：6天21小时9分52秒</span><br>
                        <a href="http://www.booyee.com.cn/user-bid.jsp?id=173278" target="_blank"><img src="./布衣书局_files/price.gif" width="82" height="24" alt="出价" class="bookbuy paimai"></a>
                    </div>
                </div>

                <div class="item">
                    <div class="bookback">
                        <a href="http://www.booyee.com.cn/user-bid.jsp?id=173354" class="bookcover" target="_blank"><img src="./布衣书局_files/34801869499.jpg" alt="傅雷家书" height="169" class="bookcover" onload="AutoResizeImage(170,170,this)" width="122"></a>
                    </div>
                    <div class="bookbox">
                        <a href="http://www.booyee.com.cn/user-bid.jsp?id=173354" class="bookname" target="_blank">傅雷家书</a>
                    </div>
                    <div class="bookbox price2">
                        <a href="http://www.booyee.com.cn/#" class="bookname red">最高拍价：￥4</a><br>
                        <span class="bookname red">剩余时间：6天22小时25分52秒</span><br>
                        <a href="http://www.booyee.com.cn/user-bid.jsp?id=173354" target="_blank"><img src="./布衣书局_files/price.gif" width="82" height="24" alt="出价" class="bookbuy paimai"></a>
                    </div>
                </div>

            </div>
            <!--布衣一元拍结束-->
            <div id="line2"></div>
            <!--vip一元拍开始-->
            <iframe src="./布衣书局_files/bid_for_iframe.html" marginwidth="0" marginheight="0" frameborder="0" scrolling="no" width="1100" height="360"></iframe>

            <div id="line2"></div>
            <!--白菜一元拍开始-->
            <iframe src="./布衣书局_files/bid_for_iframe(1).html" marginwidth="0" marginheight="0" frameborder="0" scrolling="no" width="1150" height="360"></iframe>
            <!--白菜一元拍结束-->
            <div id="line2"></div>
            <!--白菜推荐开始-->
            <iframe src="./布衣书局_files/tj_for_iframe.html" marginwidth="0" marginheight="0" frameborder="0" scrolling="no" width="1150" height="340"></iframe>
            <!--白菜推荐结束-->
            <!--vip一元拍结束-->

            <!--vip推荐开始-->

            <!--vip推荐结束-->

            <!--布衣论坛开始-->
            <div id="titlebox">
                <img src="<%=basePath%>resources/style/images//fourm.jpg" class="menuIcon" width="74" height="18" alt="布衣论坛"><a class="more2" href="http://www.booyee.com.cn/bbs" target="_blank">进入论坛&gt;</a>
            </div>

            <div class="forum">

                <li><a href="http://www.booyee.com.cn/bbs/updateHitnum.jsp?threadid=1271470" class="forumtitle" target="_blank" rel="&lt;font color=red&gt;戏剧家王培，崔秀英夫妇介绍&lt;/font&gt;"><font color="red">戏剧家王培，崔秀英夫妇介绍</font></a><span class="more2">回复(55)</span></li>

                <li><a href="http://www.booyee.com.cn/bbs/updateHitnum.jsp?threadid=1271196" class="forumtitle" target="_blank" rel="贩书日记（2017年9月）">贩书日记（2017年9月）</a><span class="more2">回复(51)</span></li>

                <li><a href="http://www.booyee.com.cn/bbs/updateHitnum.jsp?threadid=1271442" class="forumtitle" target="_blank" rel="&lt;font color=red&gt;白菜1元拍——10月8日（周日）晚结束&lt;/font&gt;"><font color="red">白菜1元拍——10月8日（周日）晚结束</font></a><span class="more2">回复(0)</span></li>

                <li><a href="http://www.booyee.com.cn/bbs/updateHitnum.jsp?threadid=1201102" class="forumtitle" target="_blank" rel="&lt;font color=red&gt;求助：各位大大，谁给帮忙网搜一下有关“沈皞日”的诗文资料。谢谢&lt;/font&gt;"><font color="red">求助：各位大大，谁给帮忙网搜一下有关“沈皞日”的诗文资料。谢谢</font></a><span class="more2">回复(107)</span></li>

                <li><a href="http://www.booyee.com.cn/bbs/updateHitnum.jsp?threadid=1268286" class="forumtitle" target="_blank" rel="此生爱书不渝">此生爱书不渝</a><span class="more2">回复(104)</span></li>

                <li><a href="http://www.booyee.com.cn/bbs/updateHitnum.jsp?threadid=1267181" class="forumtitle" target="_blank" rel="&lt;font color=red&gt;银羽逐书记（2017年）&lt;/font&gt;"><font color="red">银羽逐书记（2017年）</font></a><span class="more2">回复(37)</span></li>

                <li><a href="http://www.booyee.com.cn/bbs/updateHitnum.jsp?threadid=1255327" class="forumtitle" target="_blank" rel="&lt;font color=red&gt;《淡吟楼诗》&lt;/font&gt;"><font color="red">《淡吟楼诗》</font></a><span class="more2">回复(23)</span></li>

                <li><a href="http://www.booyee.com.cn/bbs/updateHitnum.jsp?threadid=1271031" class="forumtitle" target="_blank" rel="&lt;font color=red&gt;[玉庐藏书散记]镇日陶情诗酒花 ——聋诗媛胡俊芳小记&lt;/font&gt;"><font color="red">[玉庐藏书散记]镇日陶情诗酒花 ——聋诗媛胡俊芳小记</font></a><span class="more2">回复(5)</span></li>


            </div>


        </div>
        <!--mainbody结束-->


    </div>
    <!--pagebody结束-->


    <div id="footer"><!--页面底部-->
        <div id="line"></div>
        <div id="footer_left">
            <ul>

                <li><a href="http://www.booyee.com.cn/zz.jsp" class="foot1" target="_blank">营业执照</a></li>
                <li class="footDiv"></li>
                <li><a href="http://www.booyee.com.cn/xkz.jsp" class="foot1" target="_blank">图书经营许可证</a></li>
                <li class="footDiv"></li>
                <li><a href="http://www.booyee.com.cn/n-privacy.jsp" class="foot1" target="_blank">隐私协议</a></li>
                <li class="footDiv"></li>
                <li><a href="http://www.booyee.com.cn/n-howtobuy.jsp" class="foot1" target="_blank">联系我们</a></li>
                <li class="footDiv"></li>
                <li><a href="http://www.cnzz.com/stat/website.php?web_id=1248454" class="foot1" target="_blank">站长统计</a></li>
            </ul>
        </div>
        <div class="foot2" id="footer_right">
            版权所有@hujie  <img src="<%=basePath%>resources/style/images/icp1.gif" width="34" height="42" alt="icp" class="footerpic"><a class="foot2" href="http://www.miibeian.gov.cn/" target="_blank">2014210800</a></div>
        　
    </div>

</div>



</body></html>