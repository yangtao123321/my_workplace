<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yangtao
  Date: 2019-12-30
  Time: 上午 8:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>

    <title>用户注册页面</title>

    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>

    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery.ztree.core-3.5.js"></script>

    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/WdatePicker.js"></script>

    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery.pagination.js"></script>

    <script type="text/javascript" language="JavaScript">

        $(function() {

            $(".close").click(function() {



            });

            //校验用户是否存在
            $(".username").blur(function() {

                var usename=$(this).val().trim();

                if(usename=='') {//不做任何处理

                }else {

                    //发送ajax请求后台服务器   查询用户是否已经存在
                    $.ajax({
                        url:"${pageContext.request.contextPath}/checkusernamexit.do",
                        type:"post",
                        async:false,
                        data:{"username":usename},
                        dataType:"json",
                        success:function(data) {

                            if(data=='ok') {



                            }else if(data=='fails') {

                                alert("该用户已经存在,不能重复去注册!");

                                $(".username").val("");

                            }

                        }

                    });

                }





            });

            $(".save").click(function() {

                var usename=$(".username").val().trim();

                var pas=$(".password").val().trim();

                var truename=$(".truename").val().trim();

                var pos=$(".pos option:selected").val().trim();

                var dep=$(".dep option:checked").val().trim();

                var sec=$(".sec option:checked").val().trim();

                var email=$(".email").val().trim();

                //alert(usename+"***"+pas+"***"+truename+"***"+pos+"***"+dep+"***"+email);

                //进行一些必要的校验
                if(usename=='') {

                    alert("用户名不能为空!");

                }else if(pas=='') {

                    alert("密码不能为空!");

                }else if(truename=='') {

                    alert("请填写真实姓名!");

                }else if(sec=='0') {

                    alert("请选择部门!");

                }else if(pos=='0') {

                    alert("请选择职位!");

                }else if(dep=='0') {

                    alert("请选择单位名称!");

                }else if(email=='') {

                    alert("请填写邮箱地址!");

                }

                if(usename!=''&&pas!=''&&truename!=''&&pos!='0'&&dep!='0'&&email!=''&&sec!='0') {//校验通过了,可以申请注册该用户

                    //发送ajax请求后台服务器,添加用户
                    $.ajax({
                        url:"${pageContext.request.contextPath}/addaccount.do",
                        type:"post",
                        async:false,
                        data:{"username":usename,"password":pas,"truename":truename,"position.posid":pos,"department.deptid":dep,"email":email,"section.sectionid":sec},
                        dataType:"json",
                        success:function(data) {

                            alert(data);

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

        .registitle{

            position: relative;

            margin-top: 1px;

            text-align: center;

            height: 50px;

            line-height: 50px;
            background-color: #0081c2;
            color: white;

        }

        .tb{
            position:relative;
            margin-top: 3%;
            margin-left: 35%;
            border-collapse: collapse;
            border: none;
            width: 30%;
        }

        .tb td{
            border: 1px solid #c4c5bc;
            text-align: center;
            height: 45px;
        }

        .username{

            position: relative;
            height: 45px;
            border: 1px solid white;
            width: 100%;
            text-align: center;
            font-size: 19px;

            outline-style: none;

        }

        .password{
            position: relative;
            height: 45px;
            border: 1px solid white;
            width: 100%;
            text-align: center;
            font-size: 19px;

            outline-style: none;
        }

        .truename{

            position: relative;
            height: 45px;
            border: 1px solid white;
            width: 100%;
            text-align: center;
            font-size: 19px;

            outline-style: none;

        }

        .email{

            position: relative;
            height: 45px;
            border: 1px solid white;
            width: 100%;
            text-align: center;
            font-size: 19px;

            outline-style: none;

        }

        .close{

            position: relative;
            border: 1px solid #0081c2;
            height: 50px;
            width:90px;
            margin-left: 39%;
            margin-top: 5%;
            background-color: #0081c2;
            color: white;
            font-size: 19px;
            cursor: pointer;
            outline-style: none;

        }

        .close:hover{

            background-color: #005f98;

        }

        .save{

            position: relative;
            border: 1px solid #0081c2;
            height: 50px;
            width:90px;
            margin-left: 10%;
            margin-top: 5%;
            background-color: #0081c2;
            color: white;
            font-size: 19px;
            cursor: pointer;
            outline-style: none;

        }

        .save:hover{

            background-color: #005f98;

        }

        ::-ms-clear, ::-ms-reveal { display: none; }

    </style>

</head>

<body>

<h1 class="registitle">用户注册界面</h1>

<table class="tb">

    <tr>

        <td width="25%">用户名:</td>

        <td width="75%"><input class="username" type="text" /></td>

    </tr>

    <tr>

        <td width="25%">密码:</td>
        <td width="75%"><input class="password" type="password" /></td>
    </tr>

    <tr>

        <td width="25%">真实姓名:</td>
        <td width="75%"><input class="truename" type="text" /></td>

    </tr>

    <tr>

        <td width="25%">选择部门:</td>

        <td width="75%">

            <select class="sec" style="width: 100%;height: 45px;outline-style: none;font-size: 19px">

                <option value="0">
                    请选择
                </option>

                <c:forEach items="${sec}" var="s">

                    <option value="${s.sectionid}">${s.sectionname}</option>

                </c:forEach>

            </select>

        </td>



    </tr>

    <tr>

        <td width="25%">单位组织代码:</td>

        <td width="75%">

            <select class="dep" style="width: 100%;height: 45px;outline-style: none;font-size: 19px">

                <option value="0">
                    请选择
                </option>

                <c:forEach items="${dep}" var="d">

                    <option value="${d.deptid}">${d.deptname}</option>

                </c:forEach>

            </select>

        </td>

    </tr>

    <tr>

        <td width="25%">职位:</td>
        <td width="75%">

            <select class="pos" style="width: 100%;height: 45px;outline-style: none;font-size: 19px">

            <option value="0">
            请选择
            </option>

                <c:forEach items="${pos}" var="p">

                    <option value="${p.posid}">${p.posname}</option>

                </c:forEach>

        </select>

        </td>

    </tr>

    <tr>

        <td width="25%">电子邮箱:</td>
        <td width="75%"><input class="email" type="text" /></td>

    </tr>

</table>

        <input class="close" value="关闭" type="button" />

        <input type="button" class="save" value="注册" />

</body>

</html>
