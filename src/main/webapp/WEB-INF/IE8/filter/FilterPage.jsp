<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
  Created by IntelliJ IDEA.
  User: yangtao
  Date: 2020-01-09
  Time: 下午 6:22
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>

    <title>滤芯计划申请页面</title>
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

            //删除滤芯详情
            $(document).on('click','.del',function() {

                    if(confirm("确定要删除该条记录吗?")) {

                    $($($(this).parent()).parent()).remove();

                }

            });

            //关闭滤芯页面
            $(".filterclose").click(function() {

                var userAgent = navigator.userAgent;
                if (userAgent.indexOf("Firefox") != -1 || userAgent.indexOf("Chrome") != -1) {
                    location.href = "about:blank";
                } else {
                    window.opener = null;
                    window.open('', '_self');
                }

                window.close();

            });

            //提交滤芯计划
            $(".filtersave").click(function() {

                var saveDataAry=[];

                var details={};//字面量创建对象

                $(".tr1").each(function() {

                    var d=$(this).children();

                    details.fdetailname= d.eq(0).text();
                    details.fdetailsize= d.eq(1).text();
                    details.fdgree= d.eq(2).text();
                    details.fdetailinterface= d.eq(3).text();
                    details.fherpin= d.eq(4).text();
                    details.fdetailnum= d.eq(5).text();
                    details.useing= d.eq(6).text();

                    saveDataAry.push(details);

                    details={};

                });

                /*******************滤芯计划类变量赋值***********************/
                var uid=$(".userid").text();

                var filtertotle="购  买  滤  芯  计  划  表";

                var person=$(".apperson").val().trim();

                var reason=$(".appreason").val().trim();

                var abstract=$(".abstract").val().trim();

                var startime=$(".startime").val().trim();

                var caigouyaoqiuval=$(".fsupplier option:checked").text().trim();

                var flowid=$(".flowid").text();

                var receive='1';//粉针事业部采购

                if(person=='') {

                    alert("提报人不能为空!");

                }else if(abstract=='') {

                    alert("摘要不能为空!");

                }else if(receive=='0') {

                    alert("请选择接收单位!");

                }else if(reason=='') {

                    alert("申请原因不能为空!")

                }

                if(person!=''&&abstract!=''&&receive!='0'&&reason!='') {//第一次校验


                    if(saveDataAry.length==0) {//第二次校验 没有添加滤芯的详情

                        alert("请添加采购滤芯的详情!");

                    }else {

                        if(caigouyaoqiuval=='请选择') {

                            caigouyaoqiuval='';

                        }

                        $.ajax({
                            type:"POST",
                            url:"${pageContext.request.contextPath}/receivefilter.do",
                            dataType:"json",
                            data:{users:JSON.stringify(saveDataAry),"user.uid":uid,"filtertotle":filtertotle,"applyperson":person,"applyreason":reason,"applyabstract":abstract,"receive":receive,"applytime":startime,"buyrequires":caigouyaoqiuval,"flowid":flowid},
                            // 可以传递多个参数，但此时的users内容与另外一个参数：aa 的内容一起传递，所以后台解析为字符串
                            // 后台接收的users内容：[{"name":"test","password":"gz"},{"name":"ququ","password":"gr"}]
                            // 后台接收的 aa 内容："ddd"
                            success:function(data){

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

                                    window.location="${pageContext.request.contextPath}/climpfilterpage.do";

                                }

                            }
                        });

                    }


                }

            });

            //取消申请内容
            $(".cancel").click(function() {

                $(".fname option[value='0']").prop("selected","selected");

                var fsize=$(".fsize option[value='0']").prop("selected","selected");

                var fdgree=$(".fdgree option[value='0']").prop("selected","selected");

                var finterface=$(".finterface option[value='0']").prop("selected","selected");

                var fherpin=$(".fherpin option[value='0']").prop("selected","selected");



            });

            //添加申请内容
            $(".add").click(function() {

                var detailtb=$(".filterlist");

                var fname=$(".fname option:checked").text().trim();

                var fsize=$(".fsize option:checked").text().trim();

                var fdgree=$(".fdgree option:checked").text().trim();

                var finterface=$(".finterface option:checked").text().trim();

                var fherpin=$(".fherpin option:checked").text().trim();

                var yongtu=$(".yongtu").val().trim();

                var num=$(".num").val().trim();

                if(fname=='请选择') {

                    alert("滤芯名称不能为空!");

                }else if(fsize=='请选择') {

                    alert("滤芯尺寸不能为空!");

                }else if(fdgree=='请选择') {

                    alert("滤芯精度不能为空!");

                }else if(finterface=='请选择') {

                    alert("滤芯接口不能为空!");

                }else if(fherpin=='请选择') {

                    alert("滤芯膜层数不能为空!");

                }else if(num=='') {

                    alert("滤芯数量不能为空!");

                }

                if(fname!='请选择'&&fsize!='请选择'&&fdgree!='请选择'&&finterface!='请选择'&&fherpin!='请选择'&&num!='') {

                    var tr=$("<tr class='tr1'></tr>");

                    var td1=$("<td style='border-left:1px solid #cad0cc'>"+fname+"</td>");
                    var td2=$("<td>"+fsize+"</td>");
                    var td3=$("<td>"+fdgree+"</td>");
                    var td4=$("<td>"+finterface+"</td>");
                    var td5=$("<td>"+fherpin+"</td>");
                    var td6=$("<td>"+num+"</td>");
                    var td8=$("<td style='display: none'>"+yongtu+"</td>");
                    var td7=$("<td style='border-right:1px solid #cad0cc'><input class='del' type='button' value='删除' /></td>");

                    tr.append(td1);
                    tr.append(td2);
                    tr.append(td3);
                    tr.append(td4);
                    tr.append(td5);
                    tr.append(td6);
                    tr.append(td8);
                    tr.append(td7);

                    detailtb.append(tr);

                }

            });

            //校验是否为数字
            $(document).on('blur','.num',function() {

                var v=$(this).val().trim();

                var isnum=!isNaN(v);

                if(isnum) {//说明输入的是数字

                    //编写正整数校验值

                    var g = /^[1-9]*[1-9][0-9]*$/;

                    if(!g.test(v)) {//判断不是正整数

                        alert("您输入的不是正整数!");

                    }else {

                        alert("请输入单位!");

                    }

                    $(this).val("");

                }

            });

            //查看流程图
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
            height: 100%;
        }

        *{
            margin-top: 0px;
            margin-left: 0px;
            margin-right: 0px;

            font-family: "仿宋";
        }

        .top{

            border: 1px solid #00acf0;
            height: 80px;

            line-height: 80px;

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
            font-size: 19px;

        }

        .apptb,.appdetailtb,.filterlist,.caigouyaoqiu{

            position:relative;
            margin-top: 1%;

            border-collapse: collapse;
            width: 100%;
            margin-bottom: 3%;

        }

        .apptb td,.appdetailtb td,.caigouyaoqiu td{

            font-family: "仿宋";
            text-align: center;
            height: 40px;
            border: 1px solid #0062a4;

        }

        .filterlist td{

            font-family: "仿宋";
            border: 1px solid #0064a6;
            text-align: center;
            height: 30px;
            font-size: 15px;

        }

        .apperson,.appreason,.abstract,.xinghao,.chicun,.inter,.yaoqiu,.yongtu,.num,.caigouyaoqiuval{

            position: relative;
            height: 35px;
            line-height: 35px;
            width: 100%;
            outline-style: none;
            border: 1px solid white;
            text-align: center;
            font-size: 16px;
            font-family:"仿宋";

        }

        .fname,.fsize,.fdgree,.finterface,.fherpin,.fsupplier{

            position: relative;
            height: 40px;
            line-height: 40px;
            width: 100%;
            outline-style: none;
            text-align: center;
            font-size: 16px;
            font-family: "仿宋";
            vertical-align: middle;

        }

        .startime{

            position: relative;
            height: 35px;
            width: 100%;
            outline-style: none;
            border: 1px solid #ffffff;
            text-align: center;
            font-size: 16px;
            color: #3a7daa;
            line-height: 35px;

        }

        .appdetail{

            position: relative;
            height: 30px;
            font-family: "仿宋";
            line-height: 30px;
            margin-left: 5%;
            font-weight: bold;
            float: left;
            font-size: 19px;

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

        .cancel{

            position: relative;
            height: 80%;
            width: 20%;
            float: left;
            margin-left: 20%;
            background-color: #00acf0;
            color: white;
            outline-style: none;
            border: 1px solid #bebdbc;
            font-size: 16px;
            cursor: pointer;

        }

        .add{

            position: relative;
            height: 80%;
            width: 20%;
            float: right;
            margin-right: 20%;
            background-color: #00acf0;
            color: white;
            outline-style: none;
            border: 1px solid #bebdbc;
            font-size: 16px;
            cursor: pointer;

        }

        .cancel:hover,.add:hover{

            background-color: #005d96;

        }

        .del{

            position: relative;
            height: 100%;
            font-size: 15px;
            width: 100%;
            border: 1px solid #0cbef7;
            outline-style: none;
            background-color: #0cbef7;
            color: white;
            cursor: pointer;

        }

        .del:hover{

            background-color: #005d96;
            border: 1px solid #005d96;

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

        ::-ms-clear, ::-ms-reveal { display: none; }

        .lookpic{

            border: 1px solid #dfe1e5;

            height: 30px;

            width: 90px;

            background-color: #dfe1e5;

            color: #000000;

            font-family: "宋体";

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

    <span class="title">滤芯计划申请页面</span>

    <input class="lookpic" type="button" value="查看流程图" />

</div>

<div class="mai">

    <div class="appinfo">申请信息</div>

    <div style="display: none" class="userid">${sessionScope.get("userinfo").uid}</div>

    <div style="display: none" hidden="hidden" class="flowid">1</div>

    <table class="apptb">

        <tr>
            <td width="15%" style="border-left:1px solid #cad0cc">申请单位</td>
            <td width="30%">${sessionScope.get("userinfo").department.deptname}</td>
            <td width="15%">提报人<span style="color: red">*</span></td>
            <td width="30%" style="border-right:1px solid #cad0cc"><input class="apperson" type="text" /></td>
        </tr>

        <tr>

            <td width="15%" style="border-left:1px solid #cad0cc">申请原因<span style="color: red">*</span></td>
            <td colspan="3" style="border-right:1px solid #cad0cc"><input class="appreason" type="text" /></td>

        </tr>

        <tr>
            <td width="15%" style="border-left:1px solid #cad0cc">计划名称<span style="color: red">*</span></td>
            <td width="30%"><input class="abstract" style="height: 35px;width:99%;line-height: 35px;text-align: center;border: 1px solid white;" type="text" /></td>
            <td width="15%">发起时间</td>
            <td width="30%" style="border-right:1px solid #cad0cc"><input readonly="true" class="startime" type="text" value="${requestScope.get("starttime")}" /></td>
        </tr>

    </table>

    <div class="appdetail" style="margin-bottom: 1%">申请详情</div>

    <table class="appdetailtb">

        <tr>
            <td width="5%" style="border-left:1px solid #cad0cc">名称<span style="color: red">*</span></td>
            <td width="15%">
                <select class="fname">
                    <option value="0">请选择</option>
                    <c:forEach items="${fnames}" var="f">

                        <option value="${f.filterid}">${f.filtername}</option>

                    </c:forEach>
                </select>
            </td><%--<input class="caizhi" type="text" />--%>
            <td width="5%">尺寸<span style="color: red">*</span></td>
            <td width="15%">
                <select class="fsize">

                    <option value="0">请选择</option>

                    <c:forEach items="${fsizes}" var="f">

                        <option value="${f.fsizeid}">${f.fsizename}</option>

                    </c:forEach>

               </select>
            </td>
            <td width="5%">精度<span style="color: red">*</span></td>
            <td width="15%">
                <select class="fdgree">

                <option value="0">请选择</option>

                    <c:forEach items="${fdgrees}" var="f">

                        <option value="${f.fdgreeid}">${f.fdgreename}</option>

                    </c:forEach>

                </select>
            </td>
            <td width="5%">接口<span style="color: red">*</span></td>
            <td width="15%" style="border-right:1px solid #cad0cc">
                <select class="finterface">

                <option value="0">请选择</option>

                    <c:forEach items="${finterfaces}" var="f">

                        <option value="${f.finterfaceid}">${f.finterfacename}</option>

                    </c:forEach>

               </select>
            </td>
        </tr>

        <tr>
            <td width="5%" style="border-left:1px solid #cad0cc">膜层数<span style="color: red">*</span></td>
            <td width="15%">
                <select class="fherpin">

                    <option value="0">请选择</option>

                    <c:forEach items="${fherpins}" var="f">

                        <option value="${f.fherpinid}">${f.fherpinname}</option>

                    </c:forEach>

                </select>
            </td>
            <td width="5%">用途</td>
            <td width="15%"><input class="yongtu" style="width: 98%" type="text" /></td>
            <td width="5%">数量<span style="color: red">*</span></td>
            <td width="15%"><input class="num" style="width: 98%" type="text" /></td>
            <td colspan="2" style="border-right:1px solid #cad0cc"><input class="cancel" type="button" value="取消" /><input class="add" type="button" value="添加" /></td>

        </tr>

    </table>

    <table class="caigouyaoqiu">

        <tr>
            <td width="10%" style="font-weight: bold;font-family: 仿宋;border-left:1px solid #cad0cc">生产厂家</td>
            <td>
                <select class="fsupplier">
                <option value="0">请选择</option>
                <c:forEach items="${fsuppliers}" var="f">

                    <option value="${f.fsupplierid}">${f.fsuppliername}</option>

                </c:forEach>
                </select>
            </td>
        </tr>

    </table>

    <table class="filterlist">

        <tr style="font-weight: bold;color: #ad1a26">
            <td width="15%" style="border-left:1px solid #cad0cc">名称</td>
            <td width="15%">尺寸</td>
            <td width="15%">精度</td>
            <td width="15%">接口</td>
            <td width="25%">膜层数</td>
            <td width="10%">数量</td>
            <td width="5%" style="border-right:1px solid #cad0cc">操作</td>

        </tr>

    </table>

    <input class="filterclose" type="button" value="关闭" />

    <input class="filtersave" type="button" value="提交" />

</div>

</body>

</html>
