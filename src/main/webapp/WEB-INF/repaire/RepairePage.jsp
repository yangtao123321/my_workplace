<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yangtao
  Date: 2020-02-08
  Time: 下午 3:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>维修计划申请单</title>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery.ztree.core-3.5.js"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery.pagination.js"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/WdatePicker.js"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery.cookie.js" ></script>

    <script type="text/javascript" language="JavaScript">

        $(function() {

            $(".filtersave").click(function() {

                var uid=$(".userid").text();

                var flowid=$(".flowid").text();

                var repairetitle="维  修  计  划  表";

                var person=$(".apperson").val().trim();

                var abstract=$(".abstract").val().trim();

                var startime=$(".startime").val().trim();

                var shigongyaoqiu=$(".shigongyaoqiuval").val().trim();

                var supplier=$(".supplierval").val().trim();

                var context=$(".context").val().trim();

                var receive=$(".receiver option:checked").val();

                if(person=='') {

                    alert("提报人不能为空!");

                }else if(abstract=='') {

                    alert("摘要不能为空!");

                }else if(receive=='0') {

                    alert("请选择接收单位!");

                }else if(context=='') {

                    alert("请填写施工项目现状!");

                }


                if(person!=''&&abstract!=''&&receive!='0'&&context!='') {//校验通过了



                    //发送ajax请求后台服务器
                    $.ajax({
                        url:"${pageContext.request.contextPath}/applyrepaireplan.do",
                        type:"post",
                        async:false,
                        data:{"user.uid":uid,"repairetitle":repairetitle,"applyperson":person,"applyabstract":abstract,"receive":receive,"applytime":startime,"contex":context,"buyrequires":shigongyaoqiu,"supplier":supplier,"flowid":flowid},
                        dataType:"json",
                        success:function(data) {



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

            font-family: "仿宋";
        }

        .top{

            border: 1px solid #00acf0;
            height: 45px;
            text-align: center;
            line-height: 45px;

            background-color: #00acf0;
            color: white;
            font-size: 26px;
            font-weight: bold;


        }

        .mai{
            position: relative;
            border: 1px solid #e9e8e7;
            margin-top: 10px;
            height: auto;
            width: 80%;
            margin-left: 10%;
            background-color: #f4f3f2;
        }

        /*申请信息样式表*/
        .appinfo{

            position: relative;
            height: 30px;
            font-family: "宋体";
            line-height: 30px;
            margin-left: 5%;
            font-weight: bold;

        }

        .apptb,.shigongyaoqiu,.supplier{

            position:relative;
            margin-top: 1%;

            border-collapse: collapse;
            border: none;
            width: 100%;
            margin-bottom: 3%;


        }

        .apptb td,.appdetailtb td,.caigouyaoqiu td,.shigongyaoqiu td,.supplier td{

            font-family: "宋体";
            border: 1px solid #00223c;
            text-align: center;
            height: 45px;

        }

        .filterlist td{

            font-family: "宋体";
            border: 1px solid #00223c;
            text-align: center;
            height: 30px;
            font-size: 15px;

        }

        .apperson,.abstract,.shigongyaoqiuval,.supplierval{

            position: relative;
            height: 100%;
            width: 100%;
            outline-style: none;
            border: 1px solid white;
            text-align: center;
            font-size: 19px;

        }

        .context{

            position: relative;
            border: 1px solid #a6aca8;
            margin-top: 1%;
            text-align: center;
            font-size: 21px;
            padding:0px;
            overflow: hidden;
            height: 30%;
            width: 100%;
            padding-top: 5%;
            outline-style: none;

        }

        .startime{

            position: relative;
            height: 100%;
            width: 100%;
            outline-style: none;
            border: 1px solid #ffffff;
            text-align: center;
            font-size: 19px;
            color: #3a7daa;

        }

        .appdetail{

            position: relative;
            height: 30px;
            font-family: "宋体";
            line-height: 30px;
            margin-left: 5%;
            font-weight: bold;
            float: left;

        }

        .receive{

            position: relative;
            height: 30px;
            font-family: "宋体";
            line-height: 30px;
            margin-left: 65%;
            color: #0088dd;
            font-weight: bold;
            float: left;


        }

        .receiver{

            border: 1px solid #00223c;
            position: relative;
            height: 30px;
            font-family: "宋体";
            line-height: 30px;
            margin-left: 1%;
            font-weight: bold;
            outline-style: none;
            width: 10%;


        }

        .receiver option{

            font-family: "宋体";

        }

        .filterclose,.filtersave{

            position: relative;
            border: 1px solid #0cbef7;
            height: 35px;
            width: 10%;
            outline-style: none;
            background-color: #0cbef7;
            color: white;
            font-size: 15px;
            margin-left: 30%;
            cursor: pointer;



            margin-bottom: 5%;

        }

        .filtersave{

            margin-left: 20%;

        }

        .filterclose:hover,.filtersave:hover{

            background-color: #004575;
            border: 1px solid #004575;

        }

    </style>

</head>

<body>

<div class="top">维修计划申请页面</div>

<div class="mai">

    <div class="appinfo">申请信息</div>

    <div hidden="hidden" class="userid">${sessionScope.get("userinfo").uid}</div>

    <div hidden="hidden" class="flowid">2</div>

    <table class="apptb">

        <tr>
            <td width="15%">申请单位</td>
            <td width="30%">${sessionScope.get("userinfo").department.deptname}</td>
            <td width="15%">提报人<span style="color: red">*</span></td>
            <td width="30%"><input class="apperson" type="text" /></td>
        </tr>

        <tr>
            <td width="15%">摘要<span style="color: red">*</span></td>
            <td width="30%"><input class="abstract" type="text" /></td>
            <td width="15%">发起时间</td>
            <td width="30%"><input readonly="true" class="startime" type="text" value="${requestScope.get("starttime")}" /></td>
        </tr>

    </table>

    <div class="appdetail">施工项目现状<span style="color: red">*</span></div>

    <div class="receive">选择接收部门</div>

    <select class="receiver">

        <option value="0">请选择</option>

        <c:forEach items="${sections}" var="s">

            <option value="${s.sectionid}">${s.sectionname}</option>

        </c:forEach>

    </select>

    <textarea class="context"></textarea>

    <table class="shigongyaoqiu">

        <tr>
            <td width="10%" style="font-weight: bold">施工要求</td>
            <td><input class="shigongyaoqiuval" type="text"  /></td>
        </tr>

    </table>

    <table class="supplier">

        <tr>
            <td width="10%" style="font-weight: bold">施工单位</td>
            <td><input class="supplierval" type="text"  /></td>
        </tr>

    </table>

    <input class="filterclose" type="button" value="关闭" />

    <input class="filtersave" type="button" value="提交" />

</div>

</body>
</html>
