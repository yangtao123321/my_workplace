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

    <title>滤芯计划详情页面</title>

    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery1.8.3.js"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery.ztree.core-3.5.js"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery.pagination.js"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/WdatePicker.js"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery.cookie.js" ></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/xcConfirm.js"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery.xdomainrequest.min.js"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/json2.js"></script>

    <script type="text/javascript" language="JavaScript">

        $(function() {

            jQuery.support.cors = true;

            String.prototype.trim = function() {
                return this.replace(/(^\s*)|(\s*$)/g, ""); //正则匹配空格
            };

            $(document).on('click','.close',function() {

                var userAgent = navigator.userAgent;
                if (userAgent.indexOf("Firefox") != -1 || userAgent.indexOf("Chrome") != -1) {
                    location.href = "about:blank";
                } else {
                    window.opener = null;
                    window.open('', '_self');
                }

                window.close();

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
            width: 90%;
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

        .suggestval{

            position: relative;
            height: 35px;
            line-height: 35px;
            margin-left: 1%;
            width: 90%;
            text-align: center;


        }

        .load{

            position: relative;
            height: 10px;
            text-align: center;
            margin-top: 3%;

        }

        .close{

            position: relative;
            border: 1px solid #0081c8;
            margin-bottom: 6%;
            height: 30px;
            line-height: 30px;
            width: 10%;
            margin-left: 45%;
            text-align: center;
            background-color: #0081c8;
            color: white;
            cursor: pointer;

        }

        .close:hover{
            border: 1px solid #005c94;
            background-color: #005c94;
        }

        ::-ms-clear, ::-ms-reveal { display: none; }

        .pic{

            position: relative;
            border: 1px solid red;


        }

    </style>

</head>

<body>

<div class="top">滤芯计划申请详情页</div>

<div class="mai">

    <div style="display: none" class="flowinfoid">${flowinfos.flowinfoid}</div>

    <div style="font-weight: bold;margin-top: 1%;margin-left: 1%">申请信息</div>

    <table class="tb">

        <tr>
            <td width="15%" style="border-left: none">申请单位</td>
            <td width="20%" style="background-color: white">${filterpla.user.department.deptname}</td>
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
            <td width="15%" style="border-left: none">名称</td>
            <td width="15%">尺寸</td>
            <td width="15%">精度</td>
            <td width="15%">接口</td>
            <td width="15%">膜层数</td>
            <td width="15%">用途</td>
            <td width="10%" style="border-right: none">数量</td>
        </tr>

        <c:forEach items="${filterpla.filterDetails}" var="d">

            <tr style="background-color: white">

                <td style="border-left: none">${d.fdetailname}</td>
                <td>${d.fdetailsize}</td>
                <td>${d.fdgree}</td>
                <td>${d.fdetailinterface}</td>
                <td>${d.fherpin}</td>
                <td>${d.useing}</td>
                <td style="border-right: none">${d.fdetailnum}</td>

            </tr>

        </c:forEach>

    </table>

    <div style="clear: left;font-weight: bold;margin-top: 1%;margin-left: 1%">审批记录</div>

    <table class="tb2">

        <tr>
            <td width="10%" style="border-left: none;font-weight: bold">审批环节</td>
            <td width="10%" style="font-weight: bold">审批人</td>
            <td width="10%" style="font-weight: bold">审批结果</td>
            <td width="25%" style="font-weight: bold">审批时间</td>
            <td width="35%" style="font-weight: bold">审批意见</td>
            <td width="10%" style="border-right: none;font-weight: bold">审批签名</td>
        </tr>

    <c:forEach items="${appro}" var="approve">

        <c:choose>

            <c:when test="${approve.user.position.posid==1}">

                <tr style="font-size: 15px">

                    <td width="10%" style="border-left: none">发起步骤</td>
                    <td width="10%">${approve.user.truename}</td>
                    <td width="10%"></td>
                    <td width="25%">${approve.dealtime}</td>
                    <td width="35%" style="font-family: 仿宋;color: #e70000;font-weight: bold">${approve.suggest}</td>
                    <td width="10%" style="height: 50px;border-right: none"></td>

                </tr>


            </c:when>

            <c:when test="${approve.user.position.posid==2}">

                <tr style="font-size: 15px">

                    <td width="10%" style="border-left: none">单位负责人审核</td>
                    <td width="10%">${approve.user.truename}</td>
                    <c:choose>

                        <c:when test="${approve.approflag==1}">

                            <td width="10%" style="color: #009a00;font-family:仿宋;font-weight: bold">同意</td>

                        </c:when>

                        <c:when test="${approve.approflag==2}">

                            <td width="10%" style="color: #e70000;font-family:仿宋;font-weight: bold">退回</td>

                        </c:when>

                    </c:choose>
                    <td width="25%">${approve.dealtime}</td>
                    <td width="35%" style="font-family: 仿宋;color: #e70000;font-weight: bold">${approve.suggest}</td>
                    <td width="10%" style="height: 50px;border-right: none"><img style="width: 120px" height="100%" src="${pageContext.request.contextPath}${approve.signature}" /></td>

                </tr>

            </c:when>

            <c:when test="${approve.user.position.posid==3}">

                <tr style="font-size: 15px">

                <td width="10%" style="border-left: none">部门经理审核</td>
                <td width="10%">${approve.user.truename}</td>
                <c:choose>
                    <c:when test="${approve.approflag==1}">

                        <td width="10%" style="color: #009a00;font-family:仿宋;font-weight: bold">同意</td>

                    </c:when>

                    <c:when test="${approve.approflag==2}">

                        <td width="10%" style="color: #e70000;font-family:仿宋;font-weight: bold">退回</td>

                    </c:when>

                </c:choose>

                <td width="25%">${approve.dealtime}</td>
                <td width="35%" style="font-family: 仿宋;color: #e70000;font-weight: bold">${approve.suggest}</td>
                <td width="10%" style="height: 50px;border-right: none"><img style="width: 120px" height="100%" src="${pageContext.request.contextPath}${approve.signature}" /></td>

                </tr>

            </c:when>

            <c:when test="${approve.user.position.posid==4}">

                <tr style="font-size: 15px">

                    <td width="10%" style="border-left: none">总裁审核</td>
                    <td width="10%">${approve.user.department.deptname}</td>
                    <td width="10%">${approve.approflag}</td>
                    <td width="25%">${approve.dealtime}</td>
                    <td width="35%" font-family: 仿宋;color: #e074a2;background-color: white;font-weight: bold>${approve.suggest}</td>
                    <td width="10%" style="border-right: none;border-right: none">${approve.signature}</td>

                </tr>

            </c:when>

        </c:choose>


    </c:forEach>

    </table>

    <div class="close">关闭</div>

</div>

</body>

</html>
