<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yangtao
  Date: 2020-02-08
  Time: 下午 3:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>

    <title>维修计划申请单</title>

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

            $(".filtersave").click(function() {

                var uid=$(".userid").text();

                var flowid=$(".flowid").text();

                var repairetitle="维    修    计    划    表";

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

                            if(data=='success') {

                                alert("流程提交成功!");

                                var userAgent = navigator.userAgent;
                                if (userAgent.indexOf("Firefox") != -1 || userAgent.indexOf("Chrome") != -1) {
                                    location.href = "about:blank";
                                } else {
                                    window.opener = null;
                                    window.open('', '_self');
                                }

                                window.close();

                            }else{

                                alert("流程提交失败!");

                                window.location="${pageContext.request.contextPath}/climptorepaire.do";

                            }

                        }


                    });



                }








            });

            $(".lookpic").click(function() {

                var uid=$(".userid").text().trim();

                var flowid=$(".flowid").text().trim();

                var form = $("<form method='post' target='_blank'></form>");
                form.attr({"action":"${pageContext.request.contextPath}/climpflowpicpre.do"});
                var input1 = $("<input type='hidden'>").attr("name", "uid").val(uid);
                var input2=$("<input type='hidden'/>").attr("name","flowid").val(flowid);

                form.append(input1);
                form.append(input2);
                // 这步很重要，如果没有这步，则会报错无法建立连接
                $("body").append($(form));
                form.submit();

            });

            $(document).on('click','.filterclose',function() {

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

        body{

            width: 100%;

        }

        *{
            margin-top: 0px;
            margin-left: 0px;
            margin-right: 0px;

            font-family: "仿宋";
        }

        .top{

            border: 1px solid #00acf0;
            height: 60px;

            line-height: 60px;

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
            font-family: "仿宋";
            line-height: 30px;
            margin-left: 5%;
            font-weight: bold;
            font-size: 21px;

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

            font-family: "仿宋";
            border: 1px solid #2c87c0;
            text-align: center;
            height: 40px;

        }

        .filterlist td{

            font-family: "仿宋";
            border: 1px solid #00223c;
            text-align: center;
            height: 30px;
            font-size: 15px;

        }

        .apperson,.abstract,.shigongyaoqiuval,.supplierval{

            position: relative;
            height: 35px;
            line-height: 35px;
            width: 100%;
            outline-style: none;
            border: 1px solid white;
            text-align: center;
            font-size: 19px;

        }

        .context{

            position: relative;
            border: 1px dashed #fc34c9;
            text-align: center;
            margin-top: 1%;
            font-size: 21px;
            padding:0px;
            overflow: hidden;
            height: 200px;
            width: 100%;
            outline-style: none;
            line-height: 200px;

        }

        .startime{

            position: relative;
            height: 35px;
            line-height: 35px;
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
            font-family: "仿宋";
            line-height: 30px;
            margin-left: 5%;
            font-weight: bold;
            float: left;
            font-size: 21px;

        }

        .receive{

            position: relative;
            height: 30px;
            font-family: "仿宋";
            line-height: 30px;
            margin-left: 55%;
            color: #0088dd;
            font-weight: bold;
            float: left;


        }

        .receiver{

            border: 1px solid #00223c;
            position: relative;
            height: 35px;
            font-family: "仿宋";
            line-height: 30px;
            margin-left: 1%;
            font-weight: bold;
            outline-style: none;
            width: 10%;
            line-height: 35px;


        }

        .receiver option{

            font-family: "仿宋";

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

        .lookpic{

            border: 1px solid #dfe1e5;

            height: 30px;

            width: 90px;

            background-color: #dfe1e5;

            color: #000000;

            font-family: "仿宋";

            float: right;

            margin-top: 1%;

            margin-right: 5%;

            cursor: pointer;

        }

        .title{


            margin-left: 40%;

        }

    </style>

</head>

<body>

<div class="top">

     <span class="title">维修计划申请页面</span>
     <input class="lookpic" type="button" value="查看流程图" />

</div>

<div class="mai">

    <div class="appinfo">申请信息</div>

    <div style="display: none" class="userid">${sessionScope.get("userinfo").uid}</div>

    <div style="display: none" class="flowid">2</div>

    <table class="apptb">

        <tr>
            <td width="15%" style="border-left:1px solid #d7d9dd">申请单位</td>
            <td width="30%">${sessionScope.get("userinfo").department.deptname}</td>
            <td width="15%">提报人<span style="color: red">*</span></td>
            <td width="30%" style="border-right: 1px solid #d7d9dd"><input class="apperson" type="text" /></td>
        </tr>

        <tr>
            <td width="15%" style="border-left: 1px solid #d7d9dd">摘要<span style="color: red">*</span></td>
            <td width="30%"><input style="width: 99%" class="abstract" type="text" /></td>
            <td width="15%">发起时间</td>
            <td width="30%" style="border-right: 1px solid #d7d9dd"><input readonly="true" class="startime" type="text" value="${requestScope.get("starttime")}" /></td>
        </tr>

    </table>

    <div class="appdetail">设备或项目施工现状<span style="color: red">*</span></div>

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
            <td width="10%" style="font-weight: bold;border-left: 1px solid #d7d9dd">施工要求</td>
            <td style="border-right: 1px solid #dfe1e5"><input class="shigongyaoqiuval" type="text"  /></td>
        </tr>

    </table>

    <table class="supplier">

        <tr>
            <td width="10%" style="font-weight: bold;border-left: 1px solid #dfe1e5">施工单位</td>
            <td style="border-right: none"><input class="supplierval" type="text"  /></td>
        </tr>

    </table>

    <input class="filterclose" type="button" value="关闭" />

    <input class="filtersave" type="button" value="提交" />

</div>

</body>

</html>
