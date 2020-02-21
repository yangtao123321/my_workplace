<%--
  Created by IntelliJ IDEA.
  User: yangtao
  Date: 2019-12-28
  Time: 下午 3:03
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>

<head>

    <title>登录</title>

    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery.ztree.core-3.5.js"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery.pagination.js"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/WdatePicker.js"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery.cookie.js" ></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery.xdomainrequest.min.js"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/selectivizr-min.js"></script>

    <!--[if IE 8]>

    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery1.8.3.js"></script>

    <![endif]-->

    <script type="text/javascript" language="JavaScript">

        String.prototype.trim = function() {
            return this.replace(/(^\s*)|(\s*$)/g, ""); //正则匹配空格
        };

        $(function() {

            getuserinfo();

            $(".usernameval").on("input propertychange", function() {

                alert($(this).val().trim());

                //checkuserinfobyusername($(this).val().trim());

            });


            $(".cancel").click(function() {

                $(".usernameval").val("");

                $(".passwordval").val("");

                $("input:checkbox").prop("checked",false);



            });

            $(".button").click(function() {

                var username=$(".usernameval").val().trim();

                var password=$(".passwordval").val().trim();

                var savefalg=$(".rem").val().trim();

                if(username=='') {

                    alert("用户名不能为空!");

                }else if(password=='') {

                    alert("密码不能为空!");

                }

                if(username!=''&&password!='') {

                    jQuery.support.cors = true;

                    //发送ajax请求后台服务器 进行用户登录信息合法性校验
                    $.ajax({
                        url:"${pageContext.request.contextPath}/login.do",
                        type:"post",
                        async:false,
                        data:{"username":username,"password":password,"savefalg":savefalg},
                        dataType:"json",
                        success:function(data) {

                            //alert(data);

                            if(data=='loginfail') {

                                alert("密码不正确!");

                            }else {

                                window.location="${pageContext.request.contextPath}/welcome.do";

                            }

                        }

                    });

                }

            });

            //回车登录的事件
            $('.passwordval').bind('keydown', function (event) {

                var event = window.event || arguments.callee.caller.arguments[0];

                if (event.keyCode == 13){

                    var username=$(".usernameval").val().trim();

                    var password=$(".passwordval").val().trim();

                    var savefalg=$(".rem").val().trim();

                    if(username=='') {

                        alert("用户名不能为空!");

                    }else if(password=='') {

                        alert("密码不能为空!");

                    }

                    if(username!=''&&password!='') {

                        //发送ajax请求后台服务器 进行用户登录信息合法性校验
                        $.ajax({
                            url:"${pageContext.request.contextPath}/login.do",
                            type:"post",
                            async:false,
                            data:{"username":username,"password":password,"savefalg":savefalg},
                            dataType:"json",
                            success:function(data) {

                                //alert(data);

                                if(data=='loginfail') {

                                    alert("密码不正确!");

                                }else {

                                    window.location="${pageContext.request.contextPath}/welcome.do";

                                }

                            }

                        });

                    }

                }
            });

        });

        function remember() {

            var remFlag = $("input:checkbox").is(':checked');

            if(remFlag){
                //cookie存用户名和密码,回显的是真实的用户名和密码,存在安全问题.
                var conFlag = confirm("记录密码功能不宜在公共场所使用,以防密码泄露.您确定要使用此功能吗?");
                if(conFlag){
                    //确认标志
                    $(".rem").val("1");
                }else{
                    $("input:checkbox").prop("checked",false);
                    $(".rem").val("0");
                }
            }else{
                //如果没选中设置remFlag为""
                $(".rem").val("0");
            }

        }

        //获取cookie的信息
        function getuserinfo() {

           // var userinfo=$.cookie("loginfo");

             var userinfo=getCookie("loginfo").trim();

            if(userinfo=='') {

                $("input:checkbox").prop("checked",false);
                $(".rem").val("0");

            }else {

                var username=userinfo.split(",")[0].substr(1);

                var password=userinfo.split(",")[1];

                var pas1=  password.substr(0,password.length-1) ;

                $(".usernameval").val(username);

                $(".passwordval").val(pas1);

                $("input:checkbox").prop("checked","checked");
                $(".rem").val("1");

            }

        }

        //根据username查看是否存在用户的登录dexinxi
        function checkuserinfobyusername(username1) {

            //var userinfo=$.cookie("loginfo");

            var userinfo=getCookie("loginfo").trim();

            if(userinfo=='') {

                $(".passwordval").val("");

                $("input:checkbox").prop("checked",false);
                $(".rem").val("0");

            }else{

                var username=userinfo.split(",")[0].substr(1);

                var password=userinfo.split(",")[1];

                var pas1=  password.substr(0,password.length-1) ;

                if(username==username1) {//存在输入的用户的信息

                    //$(".usernameval").val(username);

                    $(".passwordval").val(pas1);

                    $("input:checkbox").prop("checked","checked");
                    $(".rem").val("1");

                }else {

                    $(".passwordval").val("");

                    $("input:checkbox").prop("checked",false);
                    $(".rem").val("0");

                }

            }

        }

        //获取cookie
        function getCookie(cname) {

            var name = cname + "=";
            var ca = document.cookie.split(';');
            for(var i=0; i<ca.length; i++) {
                var c = ca[i];
                while (c.charAt(0)==' ') c = c.substring(1);
                if (c.indexOf(name) != -1) return c.substring(name.length, c.length);
            }
            return "";

        }

        //函数自运行 获取自己运行
        function getcookieinfo() {

            //cookie数据保存格式是key=value;key=value;形式，loginInfo为保存在cookie中的key值，具体看controller代码
            var str = getCookie("loginfo");
            str = str.substring(1,str.length-1);

            if(str=='') {//session失效,请重新填写用户信息

                alert("用户信息已失效,请重新登录!");

                $("input:checkbox").prop("checked",false);
                $(".rem").val("0");

            }else{

                var username = str.split(",")[0];
                var password = str.split(",")[1];

                $(".usernameval").val(username);

                $(".passwordval").val(password);

                $("input:checkbox").prop("checked","checked");
                $(".rem").val("1");

            }

        }

    </script>

    <style>

        *{
            margin-top: 0px;
            margin-left: 0px;
            margin-right: 0px;
            margin-bottom: 0px;
            font-family: "宋体";
        }

        body{
            background-image: url(${pageContext.request.contextPath}/picture/123.jpg);
            background-repeat: no-repeat;
            overflow-y: hidden;
        }

        .loginframe{

            position: relative;
            border: 1px solid #d1cdca;
            height: 48%;
            margin-top: 10%;
            width: 26%;
            margin-left: 60%;

        }

        .username{
            position: relative;
            float: left;
            height: 35px;
            line-height: 35px;
            margin-top: 15%;
            margin-left: 15%;
            border: 1px solid red;
        }

        .usernameval{
            position: relative;
            border: 1px solid #008dd1;
            float: left;
            height: 35px;
            line-height: 35px;
            margin-top: 15%;
            margin-left: 5%;
            outline-style: none;
            text-align: center;
            width: 50%;
        }

        .clear,.clear1{
            clear: left;
        }

        .password{
            position: relative;
            float: left;
            height: 35px;
            line-height: 35px;
            margin-top: 10%;
            margin-left: 15%;
        }

        .passwordval{

            position: relative;
            border: 1px solid #008dd1;
            float: left;
            height: 35px;
            line-height: 35px;
            margin-top: 10%;
            margin-left: 9%;
            outline-style: none;
            text-align: center;
            width: 50%;

        }

        .savepas{
            position: relative;
            height: 35px;
            line-height: 35px;
            margin-top: 10%;
            margin-left: 15%;
        }

        .cancel{
            margin-left: 25%;
            margin-top: 5%;
            background-color: #008dd1;
            color: white;
            border: 1px solid #008dd1;
            height: 35px;
            width: 70px;
            cursor: pointer;
            outline-style: none;
        }

        .cancel:hover{
            background-color: #005f98;
        }

        .button{
            margin-left: 10%;
            margin-top: 5%;
            background-color: #008dd1;
            color: white;
            border: 1px solid #008dd1;
            height: 35px;
            width: 70px;
            cursor: pointer;
        }

        .button:hover{
            background-color: #005f98;
        }

        ::-ms-clear, ::-ms-reveal { display: none; }

    </style>

</head>

<body>

<div class="loginframe">

    <div class="username">用户名:</div>

    <input class="usernameval" type="text" />

    <div class="clear"></div>

    <div class="password">密码:</div>

    <input class="passwordval" type="password" />

    <div class="clear1"></div>

    <div class="savepas"><input class="rem" type="checkbox" onclick="remember();" />记住密码</div>

    <input class="cancel" type="reset" value="取消" />

    <input class="button" type="button" value="登录" />

</div>

</body>

</html>
