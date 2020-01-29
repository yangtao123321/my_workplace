<%--
  Created by IntelliJ IDEA.
  User: yangtao
  Date: 2019-12-31
  Time: 下午 3:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>

<head>

    <title>主页面</title>

    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery.ztree.core-3.5.js"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery.pagination.js"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/WdatePicker.js"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery.cookie.js" ></script>

    <script type="text/javascript" language="JavaScript">

        $(function() {

            $(document).on('click','.m1',function() {

                var v=$(this).text().trim();

                $(this).css({"background-color":"white"});

                $($(this).siblings()).css({"background-color":"ebe7e4"});

                if(v=='流程中心') {

                    $(".mai").children().remove();

                    var left=$("<div class='left'><div class='flowcenter'>发起申请</div><div class='flowcenter'>已申请</div><div class='flowcenter'>已处理</div></div>");

                    var right=$("<div class='right'></div>");

                    $(".mai").append(left);
                    $(".mai").append(right);

                }else if(v=='个人中心') {

                    $(".mai").children().remove();

                    var left=$("<div class='left'><div class='flowcenter'>个人信息</div></div>");

                    var right=$("<div class='right'></div>");

                    $(".mai").append(left);
                    $(".mai").append(right);

                }

            });

            $(document).on('click','.flowcenter,.flowcenter1',function() {

                $(this).css({"background-color": "#008ece", "color": "white"});

                $($(this).siblings()).css({"background-color": "white", "color": "black"});

                $(this).attr("class", "flowcenter1");

                $(this).siblings().each(function () {

                    var tagname = $(this)[0].tagName.toLowerCase();
                    if (tagname =='div') {
                        $(this).attr("class", "flowcenter");
                    }

                });

                var v=$(this).text().trim();

                alert(v);

            });

            $(document).on('click','.flows',function() {

                var v=$(this).text().trim();

                if(v=='付款单审批流程') {

                    window.open("${pageContext.request.contextPath}/climppaynoticeflow.do","_blank");

                }else if(v=='滤芯采购流程') {

                    window.open("${pageContext.request.contextPath}/climpfilterpage.do","_blank");

                }else if(v=='维修保养流程') {

                    alert("维修保养流程");

                }else if(v=='其他采购流程') {

                    alert("其他采购流程");

                }

            });

            //修改密码功能
            $(document).on('click','.uppas',function() {

                $(".ceng").css({"z-index":"1"});
                $(".ceng").show();
                $('.uppasdiv').css({"z-index":"2"});
                $(".uppasdiv").fadeIn(300);

            });

            //注销密码功能
            $(document).on('click','.logout',function() {

                if(confirm("确认注销吗?   ${sessionScope.get("userinfo").truename}")) {

                    window.location="${pageContext.request.contextPath}/logout.do";

                }

            });

            //取消修改密码的功能
            $(document).on('click','.cancel',function() {

                $(".uppasdiv").fadeOut(30);

                $(".ceng").hide(10);

            });

            //保存修改密码的功能
            $(document).on('click','.save',function() {

                var username=$(".username").text();

                var orgpas=$(".orgpasval").val().trim();

                var newpas=$(".newpasval").val().trim();

                var newpas1=$(".newpas1val").val().trim();

                if(orgpas=='') {

                    alert("原密码不能为空!");

                }else if(newpas==''||newpas1=='') {

                    alert("新密码不能为空!");

                }else if(newpas!=newpas1) {

                    alert("两次密码不一致!");

                }else {

                    //发送ajax请求后台服务器
                    $.ajax({
                        url:"${pageContext.request.contextPath}/updatepassword.do",
                        type:"post",
                        async:false,
                        data:{"username":username,"password":newpas},
                        dataType:"json",
                        success:function(data) {

                            if(data=='ok') {//修改密码成功了

                                alert("密码修改成功,请重新登录!");

                                window.location="${pageContext.request.contextPath}/logout.do";

                            }else {

                                alert("密码修改失败!");

                                $(".orgpasval").val("");

                                $(".newpasval").val("");

                                $(".newpas1val").val("");

                            }

                        }


                    });




                }



            });


            //校验原密码是否正确
            $(document).on('blur','.orgpasval',function() {

                var username=$(".username").text();

                var org=$(this).val().trim();

                if(org=='') {



                }else {

                    //发送ajax请求后台服务器
                    $.ajax({
                        url:"${pageContext.request.contextPath}/checkorgpas.do",
                        type:"post",
                        async:false,
                        data:{"username":username,"password":org},
                        dataType:"json",
                        success:function(data) {

                            if(data=='error') {

                                alert("原密码不正确!");

                                $(".orgpasval").val("");

                            }

                        }

                    });

                }



            });




        });

    </script>

    <style type="text/css">

        *{
            margin-top: 0px;
            margin-left: 0px;
            margin-right: 0px;
            font-family: "宋体";

        }

        .bannertop{

            position: relative;
            border: 1px solid #00a0da;
            height: 10%;
            background-color: #00a0da;


        }

        .c1{
            position: relative;
            clear: both;
            width: 10%;
        }

        .backimg{
            position: relative;
            margin-left: 1%;
            margin-top: 10px;
            margin-bottom: 10px;
            float: left;
            display: block;
        }

        .userbanner{

            position: relative;
            margin-left: 55%;
            height: 35px;
            margin-top: 3px;
            float: left;
            display: block;

        }

        .userinfo{

            position: relative;
            color: white;
            margin-top: 5px;
            font-size: 14px;
            margin-left: 1%;
            float: left;
            width: 6%;
            font-family: "Microsoft YaHei";

        }

        .uppas{

            position: relative;
            margin-left: 3%;
            height: 35px;
            margin-top: 3px;
            float: left;
            display: block;
            cursor: pointer;

        }

        .logout{

            position: relative;
            margin-left: 2%;
            height: 35px;
            margin-top: 3px;
            float: left;
            display: block;
            cursor: pointer;

        }

        .menu{
            position: relative;
            border: 1px solid #ebe7e4;
            height: 35px;
            border-bottom: 1px solid #008cd0;

            background-color: #ebe7e4;
            font-size: 15px;
        }

        .m1{
            text-align:center;
            position: relative;
            list-style-type: none;
            float: left;
            border-right: 1px solid #979797;
            height: 35px;
            line-height: 35px;
            color: #008dd1;
            width: 10%;
            cursor: pointer;

        }

        .mai{

            position: relative;

            height: 83%;

        }

        .bottom{

        }

        .left{
            position: relative;
            border: 1px solid #004575;
            float: left;
            width: 13%;
            height: 100%;
            border-left:none;
            border-top: none;
            background-color: #fffefd;

        }

        .right{
            border: 1px solid #004575;
            position: relative;
            height: 100%;
            float: left;
            width: 86.6%;
            border-left:none;
            border-top: none;
        }

        .flowcenter,.flowcenter1{

            position: relative;
            border: 1px solid #004575;
            height: 35px;
            text-align: center;
            line-height: 35px;
            border-top: none;
            border-right: none;
            color: #00223c;
            cursor: pointer;
            font-size: 15px;

        }

        .flowcenter:hover{

            background-color: #0cbef7 !important;
            color: white !important;;

        }

        .flows{

            position: relative;
            border: 1px solid #007dca;
            height: 30px;
            line-height: 30px;
            width: 10%;
            text-align: center;
            margin-left: 5%;
            margin-top: 3%;
            background-color: #007dca;
            color: white;
            font-size: 15px;
            cursor: pointer;

        }

        .flows:hover{

            background-color: #005f98;

        }

        ::-ms-clear, ::-ms-reveal { display: none; }

        .ceng{

            display: none;
            position: fixed;
            /*border: 1px solid #ff0000;*/
            height: 100%;
            background-color: rgba(76, 75, 74, 0.50);
            z-index:1;
            -moz-opacity:0.60; /*支持 FireFox 浏览器*/
            opacity:0.70;  /*支持 Chrome, Opera, Safari 等浏览器*/
            filter: alpha(opacity=80);
            width: 100%;

        }

        .uppasdiv{

            display: none;
            position: fixed;
            border: 1px solid #fdfff8;
            height: 60%;
            width: 45%;
            margin-top: 10%;

            margin-left: 30%;

            z-index: 3;
            background-color: #fdfff8;

        }

        .orgpas{
            position: relative;
            border: 1px solid #afaead;
            height: 30px;
            line-height: 30px;
            width: 15%;
            text-align: center;
            margin-left: 25%;
            margin-top: 10%;
            background-color: #afaead;
            float: left;


        }

        .orgpasval{

            position: relative;
            border: 1px solid #afaead;
            float: left;
            margin-left: 3%;
            margin-top: 10%;
            height: 30px;
            line-height: 30px;
            text-align: center;
            width: 30%;
            outline-style: none;


        }

        .newpas{

            position: relative;
            border: 1px solid #afaead;
            height: 30px;
            line-height: 30px;
            width: 15%;
            text-align: center;
            margin-left: 25%;
            margin-top: 5%;
            background-color: #afaead;
            float: left;

        }

        .newpasval{

            position: relative;
            border: 1px solid #afaead;
            float: left;
            margin-left: 3%;
            margin-top: 5%;
            height: 30px;
            line-height: 30px;
            text-align: center;
            width: 30%;
            outline-style: none;

        }

        .newpas1{

            position: relative;
            border: 1px solid #afaead;
            height: 30px;
            line-height: 30px;
            width: 15%;
            text-align: center;
            margin-left: 25%;
            margin-top: 5%;
            background-color: #afaead;
            float: left;

        }

        .newpas1val{

            position: relative;
            border: 1px solid #afaead;
            float: left;
            margin-left: 3%;
            margin-top: 5%;
            height: 30px;
            line-height: 30px;
            text-align: center;
            width: 30%;
            outline-style: none;

        }

        .cancel{

            position: relative;
            border: 1px solid #007dca;
            height: 35px;
            width: 10%;
            background-color: #007dca;
            color: white;
            cursor: pointer;
            margin-left: 30%;
            margin-top: 10%;


        }
        .save{

            position: relative;
            border: 1px solid #007dca;
            height: 35px;
            width: 10%;
            background-color: #007dca;
            color: white;
            cursor: pointer;
            margin-left: 15%;
            margin-top: 10%;


        }

        .cancel:hover,.save:hover{

            background-color: #006099;
            border: 1px solid #006099;

        }




    </style>

</head>

<body>

<div class="ceng"></div>

<div class="uppasdiv">

    <div class="orgpas">原密码:</div>

    <input class="orgpasval" type="password" />

    <div style="clear: both"></div>

    <div class="newpas">新密码:</div>

    <input class="newpasval" type="password" />

    <div style="clear: both"></div>

    <div class="newpas1">确认新密码:</div>

    <input class="newpas1val" type="password"/>

    <div style="clear: left"></div>

    <input class="cancel" type="button" value="取消" />

    <input class="save" type="button" value="保存" />

</div>

<div class="bannertop">

    <img class="backimg" src="${pageContext.request.contextPath}/picture/fenzhen.png" />

    <img class="userbanner" src="${pageContext.request.contextPath}/picture/user.png" />

    <div class="userinfo">${sessionScope.get("userinfo").truename},您好!<br />${requestScope.get("dates")}</div>

    <div class="username" hidden="hidden">${sessionScope.get("userinfo").username}</div>

    <img class="uppas" src="${pageContext.request.contextPath}/picture/pwd.png" />

    <img class="logout" src="${pageContext.request.contextPath}/picture/logout.png" />

</div>

<div class="c1"></div>

<div class="menu">

<li class="m1 flowtop" style="margin-left: 3px">流程中心</li>

<li class="m1">个人中心</li>

</div>

<div class="mai">

    <div class='left'>
        <div class='flowcenter'>个人信息</div>
    </div>

    <div class="right">

        <%--<div class="flows">付款单审批流程</div>--%>

        <div class="flows">滤芯采购流程</div>

        <div class="flows">维修保养流程</div>

        <div class="flows">其他采购流程</div>

    </div>

</div>



</body>

</html>

<script type="text/javascript" language="JavaScript">

   /* (function showmai() {

        $(".flowtop").css({"background-color":"white"});

        $(".mai").children().remove();

        var left=$("<div class='left'><div class='flowcenter'>发起申请</div><div class='flowcenter'>已申请</div><div class='flowcenter'>已处理</div></div>");

        var right=$("<div class='right'></div>");

        $(".mai").append(left);
        $(".mai").append(right);

    })();
    */

</script>
