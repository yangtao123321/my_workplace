<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yangtao
  Date: 2020-02-09
  Time: 下午 3:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>

    <title>维修计划审批页面</title>

    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery1.8.3.js"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery.ztree.core-3.5.js"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery.pagination.js"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/WdatePicker.js"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery.cookie.js" ></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/xcConfirm.js"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery.xdomainrequest.min.js"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/json2.js"></script>

    <script type="text/javascript" language="JavaScript">

        jQuery.support.cors = true;

        String.prototype.trim = function() {
            return this.replace(/(^\s*)|(\s*$)/g, ""); //正则匹配空格
        };

        $(function() {

            //没
            $(document).on('click','.refuse',function() {

                var flowinfosid=$(".flowinfoid").text();

                var suggest=$(".suggestval").val().trim();

                //发送ajax请求后台服务器

                $.ajax({
                    url:"${pageContext.request.contextPath}/approbackflowinfobyuser.do",
                    type:"post",
                    async:false,
                    data:{"flowinfos.flowinfoid":flowinfosid,"suggest":suggest,"approflag":"2"},
                    dataType:"json",
                    success:function(data) {



                    }


                });


            });

            //同意了
            $(document).on('click','.agree',function() {

                var flowinfosid=$(".flowinfoid").text();

                var suggest=$(".suggestval").val().trim();

                //发送ajax请求后台服务器
                $.ajax({
                    url:"${pageContext.request.contextPath}/agreeflowinfobyuser.do",
                    type:"post",
                    beforeSend: function (){

                        $(".suggestval").after("<div class='load'><img src='${pageContext.request.contextPath}/picture/load.gif' /></div>");

                    },
                    async:true,
                    data:{"flowinfos.flowinfoid":flowinfosid,"suggest":suggest,"approflag":"1"},
                    dataType:"json",
                    success:function(data) {

                        $(".load").remove();

                        if(data=='1') {

                            var userAgent = navigator.userAgent;
                            if (userAgent.indexOf("Firefox") != -1 || userAgent.indexOf("Chrome") != -1) {
                                location.href = "about:blank";
                            } else {
                                window.opener = null;
                                window.open('', '_self');
                            }

                            window.close();

                        }

                    },
                    error:function () { //请求数据失败
                        alert("服务器繁忙!");
                    }

                });

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

        .context{

            position: relative;
            border: 1px solid #a6aca8;
            margin-top: 1%;
            text-align: center;
            font-size: 19px;
            padding:0px;
            overflow: hidden;
            height: 200px;
            width: 100%;
            outline-style: none;
            color: #000000;
            font-family: "仿宋";
            font-weight: bold;
            line-height: 200px;

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

        .suggest{

            position: relative;
            height: 35px;
            line-height: 35px;
            margin-left: 1%;
            text-align: center;
            float: left;
            font-weight: bold;
            margin-top: 5%;


        }

        .suggestval{

            position: relative;
            height: 35px;
            line-height: 35px;
            margin-left: 1%;
            width: 90%;
            text-align: center;
            margin-top: 5%;


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


            margin-bottom: 3%;

        }

        .agree:hover,.refuse:hover{

            border: 1px solid #005796;
            background-color: #005796;

        }

    </style>

</head>

<body>

<div class="top">维修计划审批页面</div>

<div class="mai">

    <div style="display: none;" class="flowinfoid">${flowinfos.flowinfoid}</div>

    <div style="font-weight: bold;margin-top: 1%;margin-left: 1%">申请信息</div>

    <table class="tb">

        <tr>
            <td width="15%" style="border-left: none">申请单位</td>
            <td width="20%" style="background-color: white">${repaire.user.truename}</td>
            <td width="10%">提报人</td>
            <td width="15%" style="background-color: white">${repaire.applyperson}</td>
            <td width="10%">申请时间</td>
            <td width="25%" style="background-color:white;border-right: none">${repaire.applytime}</td>
        </tr>

        <tr>

            <td style="border-left: none">流程内容摘要</td>
            <td colspan="5" style="background-color: white;border-right: none">${repaire.applyabstract}</td>


        </tr>

        <tr>

            <td style="border-left: none">施工要求</td>
            <td colspan="2" style="background-color: white">${repaire.buyrequires}</td>
            <td>负责单位</td>
            <td style="background-color: white;border-right: none" colspan="2">${sec.sectionname}</td>

        </tr>

    </table>

    <div style="font-weight: bold;margin-top: 1%;margin-left: 1%">施工项目现状</div>

    <textarea class="context">${repaire.contex}</textarea>

    <div class="suggest">审批意见</div>

    <input class="suggestval" type="text" />

    <div style="clear: left"></div>

    <input class="refuse" type="button" value="拒绝" />

    <input class="agree" type="button" value="同意" />

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

                        <td style="border-left: none">发起步骤</td>
                        <td>${approve.user.truename}</td>
                        <td></td>
                        <td>${approve.dealtime}</td>
                        <td style="font-family: 仿宋;color: #e074a2;background-color: white;font-weight: bold">${approve.suggest}</td>
                        <td style="border-right: none"></td>

                    </tr>


                </c:when>

                <c:otherwise>

                    <tr style="font-size: 15px">

                        <c:choose>

                            <c:when test="${approve.user.position.posid==2}">

                                <td style="border-left: none">单位负责人审核</td>
                                <td>${approve.user.truename}</td>
                                <c:choose>

                                    <c:when test="${approve.approflag==1}">

                                        <td style="color: #009a00;font-family:仿宋;font-weight: bold">同意</td>

                                    </c:when>


                                    <c:when test="${approve.approflag==2}">

                                        <td style="color: #e70000;font-family:仿宋;font-weight: bold">退回</td>

                                    </c:when>

                                </c:choose>
                                <td>${approve.dealtime}</td>
                                <td style="font-family: 仿宋;color: #e074a2;background-color: white;font-weight: bold">${approve.suggest}</td>
                                <td style="border-right: none"><img style="width: 120px" height="100%" src="${pageContext.request.contextPath}${approve.signature}" /></td>

                            </c:when>


                            <c:when test="${approve.user.position.posid==3}">

                                <td style="border-left: none">部门经理审核</td>
                                <td>${approve.user.truename}</td>
                                <c:choose>
                                    <c:when test="${approve.approflag==1}">

                                        <td style="color: #009a00;font-family:仿宋;font-weight: bold">同意</td>

                                    </c:when>

                                    <c:when test="${approve.approflag==2}">

                                        <td style="color: #e70000;font-family:仿宋;font-weight: bold">退回</td>

                                    </c:when>

                                </c:choose>

                                <td>${approve.dealtime}</td>
                                <td style="font-family: 仿宋;color: #e074a2;background-color: white;font-weight: bold">${approve.suggest}</td>
                                <td style="border-right: none"><img style="width: 120px" height="100%" src="${pageContext.request.contextPath}${approve.signature}" /></td>

                            </c:when>


                            <c:when test="${approve.user.position.posid==4}">

                                <td style="border-left: none">总裁审核</td>
                                <td>${approve.user.department.deptname}</td>
                                <td>${approve.approflag}</td>
                                <td>${approve.dealtime}</td>
                                <td font-family: 仿宋;color: #e074a2;background-color: white;font-weight: bold>${approve.suggest}</td>
                                <td style="border-right: none">${approve.signature}</td>

                            </c:when>


                        </c:choose>

                    </tr>

                </c:otherwise>

            </c:choose>

        </c:forEach>

    </table>

</div>

</body>

</html>
