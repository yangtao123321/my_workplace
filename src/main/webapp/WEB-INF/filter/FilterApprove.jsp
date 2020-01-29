<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yangtao
  Date: 2020-01-20
  Time: 下午 2:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>滤芯计划审批页面</title>

    <script language="JavaScript" type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery.ztree.core-3.5.js"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery.pagination.js"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/WdatePicker.js"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery.cookie.js" ></script>

    <script type="text/javascript" language="JavaScript">

        $(function() {

            //没
            $(document).on('click','.refuse',function() {

                alert("0");

            });


            //同意了
            $(document).on('click','.agree',function() {

                alert("1");

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

        .top{
            border: 1px solid #009ae3;
            height: 60px;
            line-height: 60px;
            text-align: center;
            background-color: #009ae3;
            color: white;
            font-size: 26px;


        }

        .mai{

            position: relative;
            border: 1px solid #c0bfbe;
            margin-top: 10px;
            height: auto;
            width: 80%;
            margin-left: 10%;
            background-color: #f4f3f2;

        }

        .tb,.tb1,.tb2{
            position:relative;
            margin-top: 1%;
            border-collapse: collapse;
            border: none;
            width: 100%;
            margin-bottom: 3%;
            font-size: 15px;
        }

        .tb td,.tb1 td,.tb2 td{

            font-family: "宋体";
            border: 1px solid #c0bfbe;
            text-align: center;
            height: 35px;



        }

        .suggest{

            position: relative;
            height: 35px;
            line-height: 35px;
            margin-left: 1%;
            text-align: center;
            float: left;
            font-weight: bold;


        }

        .suggestval{

            position: relative;
            height: 35px;
            line-height: 35px;
            margin-left: 1%;
            width: 90%;
            text-align: center;


        }

        .agree{


            position: relative;
            border: 1px solid #00a1f5;
            height: 35px;
            background-color: #00a1f5;
            color: white;
            outline-style: none;
            width: 10%;
            margin-top: 3%;
            margin-left: 10%;


            cursor: pointer;



        }

        .refuse{

            position: relative;
            border: 1px solid #00a1f5;
            height: 35px;
            background-color: #00a1f5;
            color: white;
            outline-style: none;
            width: 10%;
            margin-top: 3%;

            margin-left: 30%;


            cursor: pointer;


            margin-bottom: 5%;

        }

        .agree:hover,.refuse:hover{

            border: 1px solid #005796;
            background-color: #005796;

        }

    </style>

</head>

<body>

<div class="top">滤芯计划审核页面</div>

<div class="mai">

    <div hidden="hidden">${flowinfos.flowinfoid}</div>

    <div style="font-weight: bold;margin-top: 1%;margin-left: 1%">申请信息</div>

    <table class="tb">

        <tr>
            <td width="15%" style="border-left: none">申请单位</td>
            <td width="20%" style="background-color: white">${filterpla.user.truename}</td>
            <td width="10%">提报人</td>
            <td width="15%" style="background-color: white">${filterpla.applyperson}</td>
            <td width="10%">申请时间</td>
            <td width="25%" style="background-color:white;border-right: none">${filterpla.applytime}</td>
        </tr>

        <tr>

            <td style="border-left: none">流程内容摘要</td>
            <td colspan="2" style="background-color: white">${filterpla.applyabstract}</td>
            <td>申请原因</td>
            <td colspan="2" style="background-color: white;border-right: none">${filterpla.applyreason}</td>


        </tr>

        <tr>

            <td style="border-left: none">采购要求</td>
            <td colspan="2" style="background-color: white">${filterpla.buyrequires}</td>
            <td>采购单位</td>
            <td style="background-color: white;border-right: none" colspan="2">${sec.sectionname}</td>

        </tr>

    </table>

    <div style="font-weight: bold;margin-top: 1%;margin-left: 1%">采购详情</div>

    <table class="tb1">

        <tr>
            <td width="15%" style="border-left: none">材质</td>
            <td width="15%">型号</td>
            <td width="15%">尺寸</td>
            <td width="15%">接口</td>
            <td width="15%">要求</td>
            <td width="15%">用途</td>
            <td width="10%" style="border-right: none">数量</td>
        </tr>

        <c:forEach items="${filterpla.filterDetails}" var="d">

            <tr style="background-color: white">

            <td style="border-left: none">${d.fdetailname}</td>
            <td>${d.fdetailtype}</td>
            <td>${d.fdetailsize}</td>
            <td>${d.fdetailinterface}</td>
            <td>${d.rek}</td>
            <td>${d.useing}</td>
            <td style="border-right: none">${d.fdetailnum}</td>

            </tr>

        </c:forEach>

    </table>

    <div class="suggest">审批意见</div>

    <input class="suggestval" type="text" />

    <div style="clear: left"></div>

    <input class="refuse" type="button" value="拒绝" />

    <input class="agree" type="button" value="同意" />

    <table class="tb2">

        <tr>
            <td width="10%" style="border-left: none;font-weight: bold">审批环节</td>
            <td width="10%" style="font-weight: bold">审批人</td>
            <td width="10%" style="font-weight: bold">审批结果</td>
            <td width="25%" style="font-weight: bold">审批时间</td>
            <td width="35%" style="font-weight: bold">审批意见</td>
            <td width="10%" style="border-right: none;font-weight: bold">审批签名</td>
        </tr>

        <tr>
            <td style="border-left: none">发起步骤</td>
            <td>305车间</td>
            <td>同意</td>
            <td>2019/12/13 08:09:36</td>
            <td>同意采购了</td>
            <td style="border-right: none"></td>
        </tr>

    </table>

    ${filterpla}

</div>

</body>

</html>
