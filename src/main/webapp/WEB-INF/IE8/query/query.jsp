<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yangtao
  Date: 2019-12-31
  Time: 下午 3:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>

<head>

    <title>主页面</title>

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

            $(document).on('click','.flowcenter,.flowcenter1',function() {

                $(this).css({"background-color": "#dd8770", "color": "white"});

                $($(this).siblings()).css({"background-color": "white", "color": "black"});

                $(this).attr("class", "flowcenter1");

                $(this).siblings().each(function () {

                    var tagname = $(this)[0].tagName.toLowerCase();
                    if (tagname =='div') {
                        $(this).attr("class", "flowcenter");
                    }

                });

                var v=$(this).text().trim();

                if(v=='查询流程') {



                }

            });

            $(document).on('click','.flowabstract',function() {

                var fid=$($($(this).parent()).children()).eq(0).text();

                var fid=$($($($(this).parent())).children()).eq(0).text();

                var form = $("<form method='post' target='_blank'></form>");
                form.attr({"action":"${pageContext.request.contextPath}/finddetailfilterbyapplyie8.do"});
                var input1 = $("<input type='hidden'>").attr("name", "flowinfoid").val(fid);

                form.append(input1);
                // 这步很重要，如果没有这步，则会报错无法建立连接
                $("body").append($(form));
                form.submit();

            });

            //查看流程图
            $(document).on('click','.flopic',function() {

                var fid=$($($($(this).parent())).children()).eq(0).text();

                var form = $("<form method='post' target='_blank'></form>");
                form.attr({"action":"${pageContext.request.contextPath}/climpflowpicbyfid.do?flowinfoid.do"});
                var input1 = $("<input type='hidden'>").attr("name", "flowinfoid").val(fid);

                form.append(input1);
                // 这步很重要，如果没有这步，则会报错无法建立连接
                $("body").append($(form));
                form.submit();

            });

            //修改密码功能
            $(document).on('click','.uppas',function() {


                window.location="${pageContext.request.contextPath}/climptouppas.do";


                /*$(".ceng").css({"z-index":"1"});
                $(".ceng").show();
                $('.uppasdiv').css({"z-index":"2"});
                $(".uppasdiv").fadeIn(300);*/

            });

            //注销密码功能
            $(document).on('click','.logout',function() {

                if(confirm("确认注销吗?   ${sessionScope.get("userinfo").truename}")) {

                    window.location="${pageContext.request.contextPath}/logoutie8.do";

                }

            });

            //取消修改密码的功能
            $(document).on('click','.cancel',function() {

                $(".uppasdiv").fadeOut(30);

                $(".ceng").hide(10);

            });

            //保存修改密码的功能
            $(document).on('click','.save',function() {

                var username=$(".username").text();

                var orgpas=$(".orgpasval").val().trim();

                var newpas=$(".newpasval").val().trim();

                var newpas1=$(".newpas1val").val().trim();

                if(orgpas=='') {

                    alert("原密码不能为空!");

                }else if(newpas==''||newpas1=='') {

                    alert("新密码不能为空!");

                }else if(newpas!=newpas1) {

                    alert("两次密码不一致!");

                }else {

                    //发送ajax请求后台服务器
                    $.ajax({
                        url:"${pageContext.request.contextPath}/updatepassword.do",
                        type:"post",
                        async:false,
                        data:{"username":username,"password":newpas},
                        dataType:"json",
                        success:function(data) {

                            if(data=='ok') {//修改密码成功了

                                alert("密码修改成功,请重新登录!");

                                window.location="${pageContext.request.contextPath}/logout.do";

                            }else {

                                alert("密码修改失败!");

                                $(".orgpasval").val("");

                                $(".newpasval").val("");

                                $(".newpas1val").val("");

                            }

                        }


                    });




                }



            });

            //校验原密码是否正确
            $(document).on('blur','.orgpasval',function() {

                var username=$(".username").text();

                var org=$(this).val().trim();

                if(org=='') {



                }else {

                    //发送ajax请求后台服务器
                    $.ajax({
                        url:"${pageContext.request.contextPath}/checkorgpas.do",
                        type:"post",
                        async:false,
                        data:{"username":username,"password":org},
                        dataType:"json",
                        success:function(data) {

                            if(data=='error') {

                                alert("原密码不正确!");

                                $(".orgpasval").val("");

                            }

                        }

                    });

                }



            });

            $(document).on('click','.query',function() {

                var fid=$(".incidentval").val().trim();

                if(fid!=''&&isNaN(fid)) {

                    alert("您输入的实例号不正确,请重新输入!");

                }else {

                    $(".tb").remove();

                    $(".M-box").remove();

                    $.ajax({
                        url:"${pageContext.request.contextPath}/findflowinfobyfid.do",
                        type:"post",
                        async:true,
                        beforeSend:function() {
                            $(".right").append("<div class='load'><img src='${pageContext.request.contextPath}/picture/load1.gif' /></div>");
                        },
                        data:{"flowinfoid":fid},
                        dataType:"json",
                        success:function(data) {

                            $(".load").remove();

                            var obj=JSON.parse(data);

                            var totalrecord=obj['totalRecord'];

                            var pagesize=obj['pageSize'];

                            for(k in obj) {

                                if(k=='list') {

                                    if(obj[k]==null) {

                                        $(".noexit").remove();

                                        var noexit=$("<div class='noexit'>没有查询到相关流程信息</div>");

                                        $(".right").append(noexit);

                                    }else{

                                        $(".noexit").remove();

                                        var obj1=obj[k];

                                        var tb=$("<table class='tb'></table>");

                                        var tr=$("<tr class='tr'></tr>");

                                        var td1=$("<td width='5%' style='border-left: none'>序号</td>");
                                        var td2=$("<td width='15%'>流程名称</td>");
                                        var td3=$("<td width='25%'>流程内容摘要</td>");
                                        var td4=$("<td width='15%'>申请时间</td>");
                                        var td5=$("<td width='15%'>申请单位</td>");
                                        var td6=$("<td width='10%'>提报人</td>");
                                        var td7=$("<td width='5%'>流程图</td>");
                                        var td8=$("<td width='10%' style='border-right: none'>状态</td>");

                                        tr.append(td1);
                                        tr.append(td2);
                                        tr.append(td3);
                                        tr.append(td4);
                                        tr.append(td5);
                                        tr.append(td6);
                                        tr.append(td7);
                                        tr.append(td8);

                                        tb.append(tr);

                                        for(var i=0;i<obj1.length;i++) {

                                            var obj2=obj1[i];

                                            var tr1=$("<tr class='tr1'></tr>");

                                            var tds1=$("<td style='border-left: none'></td>");
                                            var tds2=$("<td></td>");
                                            var tds3=$("<td class='flowabstract'></td>");
                                            var tds4=$("<td></td>");
                                            var tds5=$("<td></td>");
                                            var tds6=$("<td></td>");
                                            var tds7=$("<td class='flopic'></td>");

                                            var img=$("<img />");

                                            img.attr("src","${pageContext.request.contextPath}/picture/but9.png");

                                            tds7.append(img);

                                            var tds8=$("<td style='color:#00a400;border-right:none'></td>");

                                            for(j in obj2) {

                                                if(j=='flowinfoid') {

                                                    tds1.text(obj2[j]);

                                                }else if(j=='flows') {

                                                    var obj3=obj2[j];

                                                    for(l in obj3) {

                                                        if(l=='flowname') {

                                                            tds2.text(obj3[l]);

                                                        }

                                                    }

                                                }else if(j=='flowabstract') {

                                                    tds3.text(obj2[j]);

                                                }else if(j=='startime1') {

                                                    tds4.text(obj2[j]);

                                                }else if(j=='user') {

                                                    tds5.text(obj2[j]['department']['deptname']);

                                                }else if(j=='person') {

                                                    tds6.text(obj2[j]);

                                                }else if(j=='achieve') {

                                                    if(obj2[j]==0) {

                                                        tds8.css({"font-weight":"bold","color":"#e78d7a"});

                                                        tds8.text("审批中");

                                                    }else if(obj2[j]==1) {

                                                        tds8.css({"font-weight":"bold","color":"#00ba00"});

                                                        tds8.text("已同意");

                                                    }else if(obj2[j]>=2) {

                                                        tds8.css({"font-weight":"bold","color":"#f00000"});

                                                        tds8.text("已拒绝");

                                                    }

                                                }

                                            }

                                            tr1.append(tds1);
                                            tr1.append(tds2);
                                            tr1.append(tds3);
                                            tr1.append(tds4);
                                            tr1.append(tds5);
                                            tr1.append(tds6);
                                            tr1.append(tds7);
                                            tr1.append(tds8);

                                            tb.append(tr1);

                                        }

                                        $(".right").append(tb);

                                        var box=$("<div class='M-box'></div>");

                                        $(".right").append(box);

                                        $(".M-box").pagination({

                                            totalData:totalrecord,
                                            showData:pagesize,
                                            /*pageCount:10,*/
                                            jump:true,
                                            coping:true,
                                            homePage:'首页',
                                            endPage:'末页',
                                            prevContent:'上页',
                                            nextContent:'下页',
                                            callback:pageback

                                        });

                                    }

                                }

                            }


                        }


                    });

                }

            });

            //回车触发的事件
            $(".incidentval").bind("keydown",function(event) {

                var event = window.event || arguments.callee.caller.arguments[0];

                if(event.keyCode==13) {

                    var fid=$(this).val().trim();

                    if(fid!=''&&isNaN(fid)) {

                        alert("您输入的实例号不正确,请重新输入!");

                    }else {

                        $(".tb").remove();

                        $(".M-box").remove();

                        $.ajax({
                            url:"${pageContext.request.contextPath}/findflowinfobyfid.do",
                            type:"post",
                            async:true,
                            beforeSend:function() {
                                $(".right").append("<div class='load'><img src='${pageContext.request.contextPath}/picture/load1.gif' /></div>");
                            },
                            data:{"flowinfoid":fid},
                            dataType:"json",
                            success:function(data) {

                                $(".load").remove();

                                var obj=JSON.parse(data);

                                var totalrecord=obj['totalRecord'];

                                var pagesize=obj['pageSize'];

                                for(k in obj) {

                                    if(k=='list') {

                                        if(obj[k]==null) {

                                            $(".noexit").remove();

                                            var noexit=$("<div class='noexit'>没有查询到相关流程信息</div>");

                                            $(".right").append(noexit);

                                        }else{

                                            $(".noexit").remove();

                                            var obj1=obj[k];

                                            var tb=$("<table class='tb'></table>");

                                            var tr=$("<tr class='tr'></tr>");

                                            var td1=$("<td width='5%' style='border-left: none'>序号</td>");
                                            var td2=$("<td width='15%'>流程名称</td>");
                                            var td3=$("<td width='25%'>流程内容摘要</td>");
                                            var td4=$("<td width='15%'>申请时间</td>");
                                            var td5=$("<td width='15%'>申请单位</td>");
                                            var td6=$("<td width='10%'>提报人</td>");
                                            var td7=$("<td width='5%'>流程图</td>");
                                            var td8=$("<td width='10%' style='border-right: none'>状态</td>");

                                            tr.append(td1);
                                            tr.append(td2);
                                            tr.append(td3);
                                            tr.append(td4);
                                            tr.append(td5);
                                            tr.append(td6);
                                            tr.append(td7);
                                            tr.append(td8);

                                            tb.append(tr);

                                            for(var i=0;i<obj1.length;i++) {

                                                var obj2=obj1[i];

                                                var tr1=$("<tr class='tr1'></tr>");

                                                var tds1=$("<td style='border-left: none'></td>");
                                                var tds2=$("<td></td>");
                                                var tds3=$("<td class='flowabstract'></td>");
                                                var tds4=$("<td></td>");
                                                var tds5=$("<td></td>");
                                                var tds6=$("<td></td>");
                                                var tds7=$("<td class='flopic'></td>");

                                                var img=$("<img />");

                                                img.attr("src","${pageContext.request.contextPath}/picture/but9.png");

                                                tds7.append(img);

                                                var tds8=$("<td style='color:#00a400;border-right:none'></td>");

                                                for(j in obj2) {

                                                    if(j=='flowinfoid') {

                                                        tds1.text(obj2[j]);

                                                    }else if(j=='flows') {

                                                        var obj3=obj2[j];

                                                        for(l in obj3) {

                                                            if(l=='flowname') {

                                                                tds2.text(obj3[l]);

                                                            }

                                                        }

                                                    }else if(j=='flowabstract') {

                                                        tds3.text(obj2[j]);

                                                    }else if(j=='startime1') {

                                                        tds4.text(obj2[j]);

                                                    }else if(j=='user') {

                                                        tds5.text(obj2[j]['department']['deptname']);

                                                    }else if(j=='person') {

                                                        tds6.text(obj2[j]);

                                                    }else if(j=='achieve') {

                                                        if(obj2[j]==0) {

                                                            tds8.css({"font-weight":"bold","color":"#e78d7a"});

                                                            tds8.text("审批中");

                                                        }else if(obj2[j]==1) {

                                                            tds8.css({"font-weight":"bold","color":"#00ba00"});

                                                            tds8.text("已同意");

                                                        }else if(obj2[j]>=2) {

                                                            tds8.css({"font-weight":"bold","color":"#f00000"});

                                                            tds8.text("已拒绝");

                                                        }

                                                    }

                                                }

                                                tr1.append(tds1);
                                                tr1.append(tds2);
                                                tr1.append(tds3);
                                                tr1.append(tds4);
                                                tr1.append(tds5);
                                                tr1.append(tds6);
                                                tr1.append(tds7);
                                                tr1.append(tds8);

                                                tb.append(tr1);

                                            }

                                            $(".right").append(tb);

                                            var box=$("<div class='M-box'></div>");

                                            $(".right").append(box);

                                            $(".M-box").pagination({

                                                totalData:totalrecord,
                                                showData:pagesize,
                                                /*pageCount:10,*/
                                                jump:true,
                                                coping:true,
                                                homePage:'首页',
                                                endPage:'末页',
                                                prevContent:'上页',
                                                nextContent:'下页',
                                                callback:pageback

                                            });

                                        }

                                    }

                                }


                            }


                        });

                    }

                }

            });

            function pageback(cur) {

                var fid=$(".incidentval").val().trim();

                var currentPage=cur.getCurrent();

                $(".tb").remove();

                $(".M-box").remove();

                $(".noexit").remove();

                //发送ajax请求后台服务器
                $.ajax({
                    url:"${pageContext.request.contextPath}/findflowinfobyfid.do",
                    type:"post",
                    async:true,
                    beforeSend:function() {
                        $(".right").append("<div class='load'><img src='${pageContext.request.contextPath}/picture/load1.gif' /></div>");
                    },
                    data:{"flowinfoid":fid,"currentPage":currentPage},
                    dataType:"json",
                    success:function(data) {

                        $(".load").remove();

                        var obj=JSON.parse(data);

                        var totalrecord=obj['totalRecord'];

                        var pagesize=obj['pageSize'];

                        for(k in obj) {

                            if(k=='list') {

                                if(obj[k]==null) {

                                    var noexit=$("<div class='noexit'>暂时未查询到已申请任务!</div>");

                                    $(".right").append(noexit);

                                }else{

                                    var obj1=obj[k];

                                    var tb=$("<table class='tb'></table>");

                                    var tr=$("<tr class='tr'></tr>");

                                    var td1=$("<td width='5%' style='border-left: none'>序号</td>");
                                    var td2=$("<td width='15%'>流程名称</td>");
                                    var td3=$("<td width='25%'>流程内容摘要</td>");
                                    var td4=$("<td width='15%'>申请时间</td>");
                                    var td5=$("<td width='15%'>申请单位</td>");
                                    var td6=$("<td width='10%'>提报人</td>");
                                    var td7=$("<td width='5%'>流程图</td>");
                                    var td8=$("<td width='10%' style='border-right: none'>状态</td>");

                                    tr.append(td1);
                                    tr.append(td2);
                                    tr.append(td3);
                                    tr.append(td4);
                                    tr.append(td5);
                                    tr.append(td6);
                                    tr.append(td7);
                                    tr.append(td8);

                                    tb.append(tr);

                                    for(var i=0;i<obj1.length;i++) {

                                        var obj2=obj1[i];

                                        var tr1=$("<tr class='tr1'></tr>");

                                        var tds1=$("<td style='border-left: none'></td>");
                                        var tds2=$("<td></td>");
                                        var tds3=$("<td class='flowabstract'></td>");
                                        var tds4=$("<td></td>");
                                        var tds5=$("<td></td>");
                                        var tds6=$("<td></td>");
                                        var tds7=$("<td class='flopic'></td>");

                                        var img=$("<img />");

                                        img.attr("src","${pageContext.request.contextPath}/picture/but9.png");

                                        tds7.append(img);

                                        var tds8=$("<td style='color:#00a400;border-right: none'></td>");

                                        for(j in obj2) {

                                            if(j=='flowinfoid') {

                                                tds1.text(obj2[j]);

                                            }else if(j=='flows') {

                                                var obj3=obj2[j];

                                                for(l in obj3) {

                                                    if(l=='flowname') {

                                                        tds2.text(obj3[l]);

                                                    }

                                                }

                                            }else if(j=='flowabstract') {

                                                tds3.text(obj2[j]);

                                            }else if(j=='startime1') {

                                                tds4.text(obj2[j]);

                                            }else if(j=='user') {

                                                tds5.text(obj2[j]['department']['deptname']);

                                            }else if(j=='person') {

                                                tds6.text(obj2[j]);

                                            }else if(j=='achieve') {

                                                if(obj2[j]==0) {

                                                    tds8.css({"font-weight":"bold","color":"#e78d7a"});

                                                    tds8.text("审批中");

                                                }else if(obj2[j]==1) {

                                                    tds8.css({"font-weight":"bold","color":"#00ba00"});

                                                    tds8.text("已同意");

                                                }else if(obj2[j]>=2) {

                                                    tds8.css({"font-weight":"bold","color":"#f00000"});

                                                    tds8.text("已拒绝");

                                                }

                                            }

                                        }

                                        tr1.append(tds1);
                                        tr1.append(tds2);
                                        tr1.append(tds3);
                                        tr1.append(tds4);
                                        tr1.append(tds5);
                                        tr1.append(tds6);
                                        tr1.append(tds7);
                                        tr1.append(tds8);

                                        tb.append(tr1);

                                    }

                                    $(".right").append(tb);

                                }

                            }

                        }

                        var box=$("<div class='M-box'></div>");

                        $(".right").append(box);

                        $(".M-box").pagination({

                            totalData:totalrecord,
                            showData:pagesize,
                            /*pageCount:10,*/
                            jump:true,
                            current:currentPage,
                            coping:true,
                            homePage:'首页',
                            endPage:'末页',
                            prevContent:'上页',
                            nextContent:'下页',
                            callback:pageback

                        });


                    }


                });

            }

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

        .bannertop{

            position: relative;
            border: 1px solid #00a0da;
            height: 10%;
            background-color: #00a0da;


        }

        .c1{
            position: relative;
            clear: both;
            width: 10%;
        }

        .backimg{
            position: relative;
            margin-left: 1%;
            margin-top: 10px;
            margin-bottom: 10px;
            float: left;
            display: block;
        }

        .userbanner{

            position: relative;
            margin-left: 55%;
            height: 35px;
            margin-top: 3px;
            float: left;
            display: block;

        }

        .userinfo{

            position: relative;
            color: white;
            margin-top: 5px;
            font-size: 14px;
            margin-left: 1%;
            float: left;
            width: 6%;
            font-family: "Microsoft YaHei";

        }

        .uppas{

            position: relative;
            margin-left: 5%;
            height: 30px;
            width: 70px;
            margin-top: 9px;
            float: left;
            display: block;
            cursor: pointer;

        }

        .logout{

            position: relative;
            margin-left: 2%;
            height: 30px;
            width: 70px;
            margin-top: 9px;
            float: left;
            display: block;
            cursor: pointer;

        }

        .mai{

            position: relative;

            height: 90%;

        }

        .right{
            border: 1px solid #004575;
            position: relative;
            height: 100%;
            float: left;
            width: 99.8%;
            border-left:none;
            border-top: none;
            border-right: none;
        }

        ::-ms-clear, ::-ms-reveal { display: none; }

        .ceng{

            display: none;
            position: fixed;
            /*border: 1px solid #ff0000;*/
            height: 100%;
            background-color: rgba(76, 75, 74, 0.50);
            z-index:1;
            -moz-opacity:0.60; /*支持 FireFox 浏览器*/
            opacity:0.70;  /*支持 Chrome, Opera, Safari 等浏览器*/
            filter: alpha(opacity=80);
            width: 100%;

        }

        .uppasdiv{

            display: none;
            position: fixed;
            border: 1px solid #fdfff8;
            height: 60%;
            width: 45%;
            margin-top: 10%;

            margin-left: 30%;

            z-index: 3;
            background-color: #fdfff8;

        }

        .orgpas{
            position: relative;
            border: 1px solid #afaead;
            height: 30px;
            line-height: 30px;
            width: 15%;
            text-align: center;
            margin-left: 25%;
            margin-top: 10%;
            background-color: #afaead;
            float: left;


        }

        .orgpasval{

            position: relative;
            border: 1px solid #afaead;
            float: left;
            margin-left: 3%;
            margin-top: 10%;
            height: 30px;
            line-height: 30px;
            text-align: center;
            width: 30%;
            outline-style: none;


        }

        .newpas{

            position: relative;
            border: 1px solid #afaead;
            height: 30px;
            line-height: 30px;
            width: 15%;
            text-align: center;
            margin-left: 25%;
            margin-top: 5%;
            background-color: #afaead;
            float: left;

        }

        .newpasval{

            position: relative;
            border: 1px solid #afaead;
            float: left;
            margin-left: 3%;
            margin-top: 5%;
            height: 30px;
            line-height: 30px;
            text-align: center;
            width: 30%;
            outline-style: none;

        }

        .newpas1{

            position: relative;
            border: 1px solid #afaead;
            height: 30px;
            line-height: 30px;
            width: 15%;
            text-align: center;
            margin-left: 25%;
            margin-top: 5%;
            background-color: #afaead;
            float: left;

        }

        .newpas1val{

            position: relative;
            border: 1px solid #afaead;
            float: left;
            margin-left: 3%;
            margin-top: 5%;
            height: 30px;
            line-height: 30px;
            text-align: center;
            width: 30%;
            outline-style: none;

        }

        .cancel{

            position: relative;
            border: 1px solid #007dca;
            height: 35px;
            width: 10%;
            background-color: #007dca;
            color: white;
            cursor: pointer;
            margin-left: 30%;
            margin-top: 10%;


        }

        .save{

            position: relative;
            border: 1px solid #007dca;
            height: 35px;
            width: 10%;
            background-color: #007dca;
            color: white;
            cursor: pointer;
            margin-left: 15%;
            margin-top: 10%;


        }

        .cancel:hover,.save:hover{

            background-color: #006099;
            border: 1px solid #006099;

        }

        .tb,.tb1{

            position:relative;
            margin-top: 3%;
            border-collapse: collapse;
            border: none;
            width: 100.18%;

        }

        .tb td,.tb1 td{

            border: 1px solid #d3d2d1;
            text-align: center;
            height: 30px;


        }

        .tr,.tr2{

            background-color: #efeeed;
            font-family: "宋体";
            font-weight: bold;
            font-size: 13px;

        }

        .tr1,.tr3{

            font-family: "宋体";
            font-size: 15px;

        }

        .tr1:hover,.tr3:hover{
            background-color: rgba(177, 170, 120, 0.09);
        }

        .flopic{

            cursor: pointer;

        }

        .flowabstract{
            color: #3150f2;
            cursor: pointer;
            font-family: "楷体";
            font-size: 16px;
        }

        /*分页样式表*/
        .M-box{
            position: relative;
            text-align: center;
            zoom: 1;
            margin-top: 2%;
            left: 30%;
            width: 70%;
        }
        .M-box:before,.M-box:after{
            content:"";
            display:table;
        }
        .M-box:after{
            clear:both;
            overflow:hidden;
        }
        .M-box span{
            float: left;
            margin:0 5px;
            width: 30px;
            height: 30px;
            line-height: 30px;
            color: #bdbdbd;
            font-size: 13px;
        }
        .M-box .active{
            float: left;
            margin:0 5px;
            width: 30px;
            height: 30px;
            line-height: 30px;
            background: #009ae1;
            color: #fff;
            font-size: 13px;
            border: 1px solid #009ae1;
        }
        .M-box a{
            float: left;
            margin:0 5px;
            width: 30px;
            height: 30px;
            line-height: 30px;
            background: #fff;
            border: 1px solid #ebebeb;
            color: #bdbdbd;
            font-size: 13px;
            text-decoration: none;
        }
        .M-box a:hover{
            color:#fff;
            background: #0072af;
        }
        .M-box .next,.M-box .prev{
            /*font-family: "Simsun";*/
            font-size: 13px;
            font-family: "Courier New";
        }
        .now,.count{
            padding:0 5px;
            color: #009ae1;
        }
        .M-box input{
            float: left;
            margin:0 5px;
            width: 30px;
            height: 30px;
            line-height: 30px;
            text-align: center;
            background: #fff;
            border: 1px solid #ebebeb;
            outline: none;
            color: #2c73d8;
            font-size: 13px;
        }

        /*分页样式表1*/
        .M-box1{
            position: relative;
            text-align: center;
            zoom: 1;
            margin-top: 2%;
            left: 30%;
            width: 70%;
        }
        .M-box1:before,.M-box1:after{
            content:"";
            display:table;
        }
        .M-box1:after{
            clear:both;
            overflow:hidden;
        }
        .M-box1 span{
            float: left;
            margin:0 5px;
            width: 30px;
            height: 30px;
            line-height: 30px;
            color: #bdbdbd;
            font-size: 13px;
        }
        .M-box1 .active{
            float: left;
            margin:0 5px;
            width: 30px;
            height: 30px;
            line-height: 30px;
            background: #009ae1;
            color: #fff;
            font-size: 13px;
            border: 1px solid #009ae1;
        }
        .M-box1 a{
            float: left;
            margin:0 5px;
            width: 30px;
            height: 30px;
            line-height: 30px;
            background: #fff;
            border: 1px solid #ebebeb;
            color: #bdbdbd;
            font-size: 13px;
            text-decoration: none;
        }
        .M-box1 a:hover{
            color:#fff;
            background: #0072af;
        }
        .M-box1 .next,.M-box1 .prev{
            /*font-family: "Simsun";*/
            font-size: 13px;
            font-family: "Courier New";
        }
        .now,.count{
            padding:0 5px;
            color: #009ae1;
        }
        .M-box1 input{
            float: left;
            margin:0 5px;
            width: 30px;
            height: 30px;
            line-height: 30px;
            text-align: center;
            background: #fff;
            border: 1px solid #ebebeb;
            outline: none;
            color: #2c73d8;
            font-size: 13px;
        }

        /*待办任务不存在*/
        .noexit{

            position: relative;
            height: 30px;
            text-align: center;
            line-height: 30px;
            color: red;
            font-weight: bold;
            font-size: 21px;
            margin-top: 3%;
            font-family: "仿宋";



        }

        .load{

            position: absolute;
            text-align: center;
            top: 40%;
            left: 40%;

        }

        .del{
            background-color: #0081c8;
            color: white;
            cursor: pointer;
        }

        .del:hover{
            background-color: #005796;
        }

        .incident{

            position: relative;
            border: 1px solid #d7d9dd;
            height: 35px;
            line-height: 35px;
            width: 10%;
            text-align: center;
            margin-top: 1%;
            margin-left: 31%;
            float: left;
            background-color: #d7d9dd;

        }

        .incidentval{

            position: relative;
            border: 1px solid #d7d9dd;
            height: 36px;
            line-height: 35px;
            width: 20%;
            text-align: center;
            margin-top: 1%;
            margin-left: 1%;
            float: left;

        }

        .query{
            margin-top: 1%;
            height: 35px;
            margin-left: 3%;
            width: 100px;
            cursor: pointer;

        }

    </style>

</head>

<body>

<div class="ceng"></div>

<div class="uppasdiv">

    <div class="orgpas">原密码:</div>

    <input class="orgpasval" type="password" />

    <div style="clear: both"></div>

    <div class="newpas">新密码:</div>

    <input class="newpasval" type="password" />

    <div style="clear: both"></div>

    <div class="newpas1">确认新密码:</div>

    <input class="newpas1val" type="password"/>

    <div style="clear: left"></div>

    <input class="cancel" type="button" value="取消" />

    <input class="save" type="button" value="保存" />

</div>

<div class="bannertop">

    <img class="backimg" src="${pageContext.request.contextPath}/picture/fenzhen1.png" />

    <img class="userbanner" src="${pageContext.request.contextPath}/picture/user.png" />

    <div class="userinfo">${sessionScope.get("userinfo").truename},您好!<br />${requestScope.get("dates")}</div>

    <div class="username" style="display:none">${sessionScope.get("userinfo").username}</div>

    <img class="uppas" src="${pageContext.request.contextPath}/picture/pwd.png" />

    <img class="logout" src="${pageContext.request.contextPath}/picture/logout.png" />

</div>

<div class="c1"></div>

<div class="mai">

    <div class="right">

        <div class="incident">实例号:</div>

        <input class="incidentval" type="text" />

        <input class="query" type="button" value="查询" />

    </div>

</div>

</body>

</html>
