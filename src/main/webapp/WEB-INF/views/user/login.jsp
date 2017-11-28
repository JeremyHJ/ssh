<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>用户登录 - Powered by BookHouse</title>

    <meta name="generator" content=" bookhouse 1.0" />
    <meta name="author" content="www.bookhouse.com">
    <meta name="copyright" content="bookhouse Inc. All Rights Reserved">
    <link href="<%=basePath%>resources/style/css/public.css" type="text/css" rel="stylesheet" />
    <link href="<%=basePath%>resources/style/css/goods.css" type="text/css" rel="stylesheet" />
    <script src="<%=basePath%>resources/style/js/jquery-2.1.4.min.js"></script>
    <script src="<%=basePath%>resources/style/js/jquery.validate.min.js"></script>
    <script>
        jQuery(document).ready(function(){
            jQuery("#theForm").validate({
                errorPlacement:function(error,element) {
                    error.appendTo(element.parent().find(".login_error_sp"));
                    element.parent().find(".login_error_sp").show('normal');
                },
                success:function(label){
                    label.parent().hide();
                },
                rules: {
                    username: "required",
                    password: "required"},
            messages: {
                username: "用户名不能为空",
                        password: "密码不能为空"
            }
        });
        });
    </script>
</head>
<body>
<div class="main">
    <div class="head_login">
        <div class="login_logo" style="margin-top:30px; padding-left:80px;">

        </div>
    </div>
    <div class="index">
        <div class="index2">
            <div class="login_usertb">
                <div class="login_usetbox">
                    <div class="login_usrin">
                        <ul>
                            <form action="" method="post" name="theForm" id="theForm">
                                <li class="login_usertxt"><b>登录名：</b>
                                    <input name="username" type="text" id="username" class="login_utxt" autocomplete="off" placeholder="请输入您的登录名或手机号"/>
                                    <span class="login_error_sp" style="display:none"></span></li>
                                <li class="login_usertxt"><b>密&nbsp;&nbsp;&nbsp;码：</b>
                                    <input name="password" type="password" id="password"  autocomplete="off" class="login_utxt" placeholder="请输入您的密码"/>
                                    <span class="login_error_sp" style="display:none"></span></li>
                                <script>
                                    function refreshCode(){
                                        $.ajax({
                                            url:"<%=path%>/verify.do",
                                            async:false,
                                            success:function(result){
                                                jQuery("#code_img").attr("src","<%=path%>/verify.do");
                                            }
                                        })
                                    }
                                </script>

                                <li class="login_usercode"><b>验证码：</b>
                                    <input name="code" type="text" id="code"  autocomplete="off" style="text-transform:uppercase;" class="usecode" />
                                <span class="login_codeimg">
                  <img style="cursor:pointer;" src="<%=path%>/verify.do" id="code_img" onclick="refreshCode();" width="59" height="27" /></span>
                                    <a  href="javascript:void(0);" onclick="refreshCode();" class="usenosee">看不清换一张</a>
                                   <span class="login_error_sp" style="display:none"></span>
                                </li>

                                <li class="login_usercheck"><a href="$!webPath/forget.do" class="forgetpsw">忘记登录密码?</a><a href="$!webPath/register.do" class="user_regist">免费注册</a></li>
                                <li>
                                    <input name="" type="submit" class="login_userbtn" value="登录"/>
                                </li>
                            </form>
                            <!--#if($!{config.sina_login}||$!{config.qq_login})
                            <li class="login_b"><b>合作伙伴账号登录:</b> <span class="login_bsp"> #if($!{config.qq_login}) <a href="$!webPath/qq_login_api.do" target="_blank"><img src="$!webPath/resources/style/system/front/default/images/login_qq.jpg" width="64" height="21" /></a> #end
                              #if($!{config.sina_login}) <a href="$!webPath/sina_login_api.do" target="_blank"><img src="$!webPath/resources/style/system/front/default/images/login_wb.jpg" width="76" height="21" /></a> #end </span> </li>
                            #end-->
                        </ul>
                    </div>
                </div>
                <div class="login_usertb_bgimg"><span class="imgcenter_span">

          <p><img src="<%=basePath%>resources/style/images/img.jpg" width="490" height="400" /></p>
          </span></div>
            </div>
        </div>
    </div>
</div>


</body>
</html>