<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: yangtao
  Date: 2020-02-11
  Time: 上午 9:10
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>

    <title>设备类计划</title>

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

            //取消购买设备明细的按钮
            $(document).on('click','.cancel',function() {

                $(".devicename").val("");
                $(".devicenamebank").val("");
                $(".devicenum").val("");

            });

            $(document).on('click','.add',function() {

                var devicename=$(".devicename").val().trim();

                var devicenamebank=$(".devicenamebank").val().trim();

                var devicenum=$(".devicenum").val().trim();

                if(devicename=='') {

                    alert("名称不能为空!");

                }else if(devicenamebank=='') {

                    alert("品牌不能为空!");

                }else if(devicenum=='') {

                    alert("数量不能为空!");

                }


                if(devicename!=''&&devicenamebank!=''&&devicenum!='') {//可以进行添加的操作

                   var tb=$(".devicelisttb");

                    var tr=$("<tr class='devicedetailtr' style='background-color: white'></tr>");

                    var td1=$("<td style='border-left: 1px solid #dfe1e5'>"+devicename+"</td>");

                    var td2=$("<td>"+devicenamebank+"</td>");

                    var td3=$("<td>"+devicenum+"</td>");

                    var td4=$("<td style='border-right: 1px solid #dfe1e5'><input class='deldeviceinfo' type='button' value='删除' /></td>");

                    tr.append(td1);
                    tr.append(td2);
                    tr.append(td3);
                    tr.append(td4);

                    tb.append(tr);

                }

            });

            //关闭流程提交的页面
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

            //提交设备采购流程的功能
            $(document).on('click','.filtersave',function() {

                var saveDataAry=[];

                var details={};//字面量创建对象

                $(".devicedetailtr").each(function() {

                    var d=$(this).children();

                    details.devicename= d.eq(0).text();
                    details.devicebank= d.eq(1).text();
                    details.devicenum= d.eq(2).text();

                    saveDataAry.push(details);

                    details={};

                });


                /*******************购买设备计划类的变量*********************/
                var uid=$(".userid").text();


                var devicetitle="购  买  设  备  计  划  表";

                var person=$(".apperson").val().trim();

                var abstract=$(".abstract").val().trim();

                var startime=$(".startime").val().trim();

                var reason=$(".context").val().trim();

                var receive=$(".receiver option:checked").val();

                var flowid=$(".flowid").text();

                if(person=='') {

                    alert("提报人不能为空!");

                }else if(abstract=='') {

                    alert("流程内容摘要不能为空!");

                }else if(reason=='') {

                    alert("购买原因不能为空!");

                }else if(receive=='0') {

                    alert("请选择采购的单位!");

                }


                if(person!=''&&abstract!=''&&reason!=''&&receive!='0') {//第一次校验通过了,开始进行第二次的校验

                    if(saveDataAry.length==0) {

                        alert("请填写采购的明细!");

                    }else {

                        //发送ajax请求后台服务器
                        $.ajax({
                            url:"${pageContext.request.contextPath}/applybuydeviceplan.do",
                            type:"post",
                            async:false,
                            data:{"details":JSON.stringify(saveDataAry),"user.uid":uid,"devicetitle":devicetitle,"applyperson":person,"applyabstract":abstract,"receive":receive,"applytime":startime,"buyreson":reason,"flowid":flowid},
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

                                }else {

                                    alert("流程提交失败!");
                                    window.location="${pageContext.request.contextPath}/climpdevicepage.do";

                                }

                            }


                        });



                    }

                }










            });

            $(document).on('click','.deldeviceinfo',function() {

                if(confirm("确认删除该条信息吗?")) {

                    $($($(this).parent()).parent()).remove();

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

        }

        .apptb,.bydetailtb,.devicelisttb{

            position:relative;
            margin-top: 1%;

            border-collapse: collapse;
            border: none;
            width: 100%;
            margin-bottom: 3%;


        }

        .apptb td,.appdetailtb td,.caigouyaoqiu td,.shigongyaoqiu td,.supplier td,.bydetailtb td,.devicelisttb td{

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

        .bydetailtb td{

            height: 35px;

        }

        .devicelisttb td{

            height: 35px;

        }

        .apperson,.abstract,.devicename,.devicenamebank,.devicenum{

            position: relative;
            height: 35px;
            line-height: 35px;
            width: 99%;
            outline-style: none;
            border: 1px solid white;
            text-align: center;
            font-size: 19px;

        }

        .context{

            position: relative;
            border: 1px dashed #fc34c9;
            margin-top: 1%;
            text-align: center;
            font-size: 21px;
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

        }

        .buydetail{

            position: relative;
            height: 30px;
            font-family: "仿宋";
            line-height: 30px;
            margin-left: 5%;
            font-weight: bold;
            float: left;
            margin-top: 1%;

        }

        .devicelist{

            position: relative;
            height: 30px;
            font-family: "仿宋";
            line-height: 30px;
            margin-left: 5%;
            font-weight: bold;

        }

        .receive{

            position: relative;
            height: 30px;
            font-family: "仿宋";
            line-height: 30px;
            margin-left: 65%;
            color: #0088dd;
            font-weight: bold;
            float: left;


        }

        .receiver{

            border: 1px solid #00223c;
            position: relative;
            height: 35px;
            font-family: "仿宋";
            line-height: 35px;
            margin-left: 1%;
            font-weight: bold;
            outline-style: none;
            width: 10%;


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

        .cancel{

            position: relative;

            border: 1px solid red;

            height: 80%;
            float: left;

            margin-left: 20%;


            background-color: #68b7f5;
            color: white;
            border: 1px solid #a6aca8;
            cursor: pointer;


        }

        .add{

            position: relative;

            border: 1px solid red;

            height: 80%;
            float: left;

            margin-left: 15%;


            background-color: #68b7f5;
            color: white;
            border: 1px solid #a6aca8;
            cursor: pointer;


        }

        .cancel:hover,.add:hover{

            background-color: #006caa;

        }

        .deldeviceinfo{

            background-color: #68b7f5;
            border: 1px solid #b4bab6;
            color: white;
            height: 100%;
            width: 100%;
            cursor: pointer;

        }

        .deldeviceinfo:hover{

            background-color: #0064a6;

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
            font-family: "仿宋";

        }

    </style>

</head>

<body>

<div class="top">

    <span class="title">购买设备申请页</span>
    <input class="lookpic" type="button" value="查看流程图" />

</div>

<div class="mai">

    <div class="appinfo">申请信息</div>

    <div style="display: none" class="userid">${sessionScope.get("userinfo").uid}</div>

    <div style="display: none" class="flowid">3</div>

    <table class="apptb">

        <tr>
            <td width="15%" style="border-left: 1px solid #dfe1e5">申请单位</td>
            <td width="30%">${sessionScope.get("userinfo").department.deptname}</td>
            <td width="15%">提报人<span style="color: red">*</span></td>
            <td width="30%" style="border-right: 1px solid #dfe1e5"><input class="apperson" type="text" /></td>
        </tr>

        <tr>
            <td width="15%" style="border-left: 1px solid #dfe1e5">摘要<span style="color: red">*</span></td>
            <td width="30%"><input style="width: 99%" class="abstract" type="text" /></td>
            <td width="15%">发起时间</td>
            <td width="30%" style="border-right: 1px solid #dfe1e5"><input readonly="true" class="startime" type="text" value="${requestScope.get("starttime")}" /></td>
        </tr>

    </table>

    <div class="appdetail">购买原因<span style="color: red">*</span></div>

    <div class="receive">选择采购部门</div>

    <select class="receiver">

        <option value="0">请选择</option>

        <c:forEach items="${sections}" var="s">

            <option value="${s.sectionid}">${s.sectionname}</option>

        </c:forEach>

    </select>

    <textarea class="context"></textarea>

    <div class="buydetail">填写采购明细<span style="color: red">*</span></div>

    <table class="bydetailtb" style="margin-top: 4%">

        <tr>

            <td width="5%" style="border-left: 1px solid #dfe1e5">名称<span style="color: red">*</span></td>
            <td width="30%"><input style="font-size: 15px" class="devicename" type="text" /></td>
            <td width="5%">品牌</td>
            <td width="30%"><input style="font-size: 15px" class="devicenamebank" type="text" /></td>
            <td width="5%">数量<span style="color: red">*</span></td>
            <td width="7%"><input style="font-size: 15px;width: 97%" class="devicenum" type="text" /></td>
            <td width="18%" style="border-right: 1px solid #dfe1e5"><input class="cancel" type="button" value="取消" /> <input class="add" type="button" value="添加" /></td>

        </tr>

    </table>

    <div class="devicelist">设备采购明细单</div>

    <table class="devicelisttb">

        <tr style="font-weight: bold">

            <td width="40%" style="border-left: 1px solid #dfe1e5">设备名称</td>
            <td width="40%">品牌</td>
            <td width="10%">数量</td>
            <td width="10%" style="border-right: 1px solid #dfe1e5">操作</td>

        </tr>

    </table>

    <input class="filterclose" type="button" value="关闭" />

    <input class="filtersave" type="button" value="提交" />

</div>

</body>

</html>
