<%--
  Created by IntelliJ IDEA.
  User: yangtao
  Date: 2020-02-20
  Time: 上午 9:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <title>修改密码页面</title>

    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery1.8.3.js"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery.xdomainrequest.min.js"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/json2.js"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery.ztree.core-3.5.js"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery.pagination.js"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/WdatePicker.js"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery.cookie.js" ></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/xcConfirm.js"></script>

    <script type="text/javascript" language="JavaScript">

        jQuery.support.cors = true;

        String.prototype.trim = function() {
            return this.replace(/(^\s*)|(\s*$)/g, ""); //正则匹配空格
        };

        $(function() {

            $(".orgpasval").blur(function() {

                var uid=$(".uid").text().trim();

                var org=$(this).val().trim();

                if(org=='') {

                }else{

                    //发送ajax请求后台服务器验证密码合法性
                    $.ajax({
                        url:"${pageContext.request.contextPath}/vailiedpsd.do",
                        type:"post",
                        async:false,
                        data:{"uid":uid,"password":org},
                        dataType:"json",
                        success:function(data) {

                            if(data=='fails') {

                                alert("原密码输入不正确!");

                                $(".orgpasval").val("");

                            }

                        }


                    });

                }



            });

            //修改密码
            $(".button").click(function() {

                var org=$(".orgpasval").val().trim();

                var newpas=$(".newpasval").val().trim();

                var newpas1=$(".newpas1val").val().trim();

                var uid=$(".uid").text().trim();

                if(org=='') {

                    alert("原密码不能为空")

                }else if(newpas==''||newpas1=='') {

                    alert("请输入两次新密码!");

                }else if(newpas!=newpas1) {

                    alert("两次密码输入不正确!");

                }

                if(org!=''&&newpas==newpas1&&newpas!='') {

                    //校验通过，发送ajax请求后台服务器
                    $.ajax({
                        url:"${pageContext.request.contextPath}/updatepsd.do",
                        type:"post",
                        async:false,
                        data:{"uid":uid,"password":newpas},
                        dataType:"json",
                        success:function(data) {

                            if(data=='1') {//修改成功了

                                window.location="${pageContext.request.contextPath}/ie8/login2.jsp";

                            }else{

                                alert("修改密码失败!");

                            }


                        }


                    });

                }


            });

            $(".cancel").click(function() {

                window.location="${pageContext.request.contextPath}/welcome1.do";

            });

        });


    </script>


    <style type="text/css">

        *{
            margin-top: 0px;
            margin-left: 0px;
            margin-right: 0px;
            font-family: "仿宋";
        }

        html,body,form{
            height:100%;
        }

        .uppas{

            position: absolute;
            border: 1px solid #d7d9dd;
            height: 65%;
            width: 40%;
            margin-left: 30%;

            margin-top: 5%;

        }

        .title{
            text-align: center;
            font-size: 21px;
            height: 30px;
            line-height: 30px;
            font-weight: bold;
        }

        .orgpas,.newpas,.newpas1{

            width: 15%;
            height: 30px;
            line-height: 30px;
            text-align: center;
            margin-top: 5%;
            margin-left: 20%;
            float: left;
            font-weight: bold;
            font-size: 20px;

        }

        .orgpasval,.newpasval,.newpas1val{


            margin-top: 5%;
            margin-left: 5%;
            height: 30px;
            line-height: 30px;
            width: 35%;
            text-align: center;


        }


        .cancel{

            margin-top: 15%;
            position: relative;
            height: 30px;
            width: 10%;
            margin-left: 25%;

        }

        .button{

            margin-top: 15%;
            position: relative;
            height: 30px;
            width: 10%;
            margin-left: 25%;

        }



    </style>

</head>

<body>

<div class="uid" style="display: none">${requestScope.get("users").uid}</div>

<div class="uppas">

<div class="title">修改密码</div>

    <div class="orgpas">原密码:</div>
    <input class="orgpasval" type="password"/>


    <div class="newpas">新密码:</div>
    <input class="newpasval" type="password"/>


    <div class="newpas1">确认密码:</div>
    <input class="newpas1val" type="password"/>

    <div></div>

    <input class="cancel" type="button" value="关闭" />

    <input class="button" type="button" value="修改"/>


</div>

</body>
</html>
