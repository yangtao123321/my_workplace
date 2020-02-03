<%--
  Created by IntelliJ IDEA.
  User: yangtao
  Date: 2020-02-03
  Time: 下午 4:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>流程图页面</title>

    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery.ztree.core-3.5.js"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery.pagination.js"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/WdatePicker.js"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery.cookie.js" ></script>

    <script type="text/javascript" language="JavaScript">

        $(function() {



        });

    </script>


    <style type="text/css">

        *{

            font-family: "宋体";
            font-size: 13px;

        }

        .tb{
            position:relative;
            margin-top: 10%;
            margin-left: 10%;
            border-collapse: collapse;
            border: none;

        }

        .tb td{

            border: 1px solid #d3d2d1;
            text-align: center;
            height: 50px;


        }


    </style>

</head>

<body>

<table class="tb">

    <tr>

        <td style="height: 10px;border:none;color: #68b7f5">305车间</td>
        <td style="height: 10px;border:none;color: #68b7f5"></td>
        <td style="height: 10px;border:none;color: #68b7f5">陈文东</td>
        <td style="height: 10px;border:none;color: #68b7f5"></td>
        <td style="height: 10px;border:none;color: #68b7f5">张娜</td>
        <td style="height: 10px;border:none;color: #68b7f5"></td>
        <td style="height: 10px;border:none;color: #68b7f5">张光明</td>
        <td style="height: 10px;border:none;color: #68b7f5"></td>
        <td style="height: 10px;border:none;color: #68b7f5">苗得足</td>
        <td style="height: 10px;border:none;color: #68b7f5"></td>
        <td style="height: 10px;border:none;color: #68b7f5">结束</td>


    </tr>

    <tr>

        <td width="50px" style="border: none"><img width=50px height="50px" src="${pageContext.request.contextPath}/picture/liupic/start.png" /></td>
        <td width="150px" style="border: none"><img width="150px" height="50px" src="${pageContext.request.contextPath}/picture/liupic/jiantou.png" /></td>
        <td width="50px" style="border: none"><img width="50px" height="50px" src="${pageContext.request.contextPath}/picture/liupic/person.png" /></td>
        <td width="150px" style="border: none"><img width="150px" height="50px" src="${pageContext.request.contextPath}/picture/liupic/jiantou.png" /></td>
        <td width="50px" style="border: none"><img width="50px" height="50px" src="${pageContext.request.contextPath}/picture/liupic/person.png" /></td>
        <td width="150px" style="border: none"><img width="150px" height="50px" src="${pageContext.request.contextPath}/picture/liupic/jiantou.png" /></td>
        <td width="50px" style="border: none"><img width="50px" height="50px" src="${pageContext.request.contextPath}/picture/liupic/person.png" /></td>
        <td width="150px" style="border: none"><img width="150px" height="50px" src="${pageContext.request.contextPath}/picture/liupic/jiantou.png" /></td>
        <td width="50px" style="border: none"><img width="50px" height="50px" src="${pageContext.request.contextPath}/picture/liupic/person.png" /></td>
        <td width="150px" style="border: none"><img width="150px" height="50px" src="${pageContext.request.contextPath}/picture/liupic/jiantou.png" /></td>
        <td width="200px" colspan="2" style="border: none"><img width="50px" height="50px" src="${pageContext.request.contextPath}/picture/liupic/end.png" /><img width="150px" height="50px" src="${pageContext.request.contextPath}/picture/liupic/jiantou.png" /></td>

    </tr>

    <tr>

        <td colspan="2" style="height: 30px;border:none;color: #008d00;text-align: left">已审核</td>
        <td style="height: 30px;border:none;color: #008d00">已审核</td>


    </tr>



</table>



</body>

</html>
