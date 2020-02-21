<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yangtao
  Date: 2019-12-31
  Time: 下午 3:16
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>

<head>

    <title>单位负责人</title>

    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery.ztree.core-3.5.js"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery.pagination.js"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/WdatePicker.js"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery.cookie.js" ></script>

    <script type="text/javascript" language="JavaScript">

        $(function() {

            $(document).on('click','.m1',function() {

                var v=$(this).text().trim();

                $(this).css({"background-color":"white"});

                $($(this).siblings()).css({"background-color":"ebe7e4"});

                if(v=='流程中心') {

                    $(".mai").children().remove();

                    var left=$("<div class='left'><div class='flowcenter' id='daiban'>待办事项</div><div class='flowcenter'>已处理事项</div></div>");

                    var right=$("<div class='right'></div>");

                    $(".mai").append(left);
                    $(".mai").append(right);

                }else if(v=='个人中心') {

                    $(".mai").children().remove();

                    var left=$("<div class='left'><div class='flowcenter'>个人信息</div></div>");

                    var right=$("<div class='right'></div>");

                    $(".mai").append(left);
                    $(".mai").append(right);

                }

            });

            $(document).on('click','.flowcenter,.flowcenter1',function() {

                $(this).css({"background-color": "#008ece", "color": "white"});

                $($(this).siblings()).css({"background-color": "white", "color": "black"});

                $(this).attr("class", "flowcenter1");

                $(this).siblings().each(function () {

                    var tagname = $(this)[0].tagName.toLowerCase();
                    if (tagname =='div') {
                        $(this).attr("class", "flowcenter");
                    }

                });

                var v=$(this).text().trim();

                if(v=='待办事项') {

                    $(".right").children().remove();

                    //发送ajax请求后台服务器

                    $.ajax({
                        url:"${pageContext.request.contextPath}/findoingtask.do",
                        type:"post",
                        async:true,
                        beforeSend: function (){

                            $(".right").append("<div class='load'><img src='${pageContext.request.contextPath}/picture/load1.gif' /></div>");

                        },
                        data:{},
                        dataType:"json",
                        success:function(data) {

                            $(".load").remove();

                            var obj=JSON.parse(data);

                            //获取总条数和每页显示的数量
                            var totalrecord=obj['totalRecord'];

                            var pagesize=obj['pageSize'];

                            for(k in obj) {

                                if(k=='list') {

                                    if(obj[k]==null) {//不存在待办任务

                                        var noexit=$("<div class='noexit'>暂时未查询到待办任务!</div>");

                                        $(".right").append(noexit);


                                    }else{//存在待办任务

                                        $(".noexit").remove();

                                        var obj1=obj[k];

                                        var tb1=$("<table class='tb'></table>");

                                        var tr=$("<tr class='tr'></tr>");

                                        var td1=$("<td width='10%' style='border-left: none'>序号</td>");

                                        var td2=$("<td width='15%'>流程名称</td>");

                                        var td3=$("<td width='30%'>流程内容摘要</td>");

                                        var td4=$("<td width='15%'>申请单位</td>");

                                        var td5=$("<td width='10%'>提报人</td>");

                                        var td6=$("<td width='20%' style='border-right: none'>到达时间</td>");

                                        tr.append(td1);
                                        tr.append(td2);
                                        tr.append(td3);
                                        tr.append(td4);
                                        tr.append(td5);
                                        tr.append(td6);

                                        tb1.append(tr);

                                        for(var i=0;i<obj1.length;i++) {

                                            var tr1=$("<tr class='tr1'></tr>");

                                            var tds1=$("<td style='border-left: none'></td>");
                                            var tds2=$("<td></td>");
                                            var tds3=$("<td class='flowabstract'></td>");
                                            var tds4=$("<td></td>");
                                            var tds5=$("<td></td>");
                                            var tds6=$("<td style='border-right: none'></td>");

                                            var obj2=obj1[i];

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

                                                }else if(j=='user') {

                                                    tds4.text(obj2[j]['department']['deptname']);

                                                }else if(j=='person') {

                                                    tds5.text(obj2[j]);

                                                }else if(j=='approve') {

                                                    tds6.text(obj2[j]['arrivetime']);

                                                }

                                            }

                                            tr1.append(tds1);
                                            tr1.append(tds2);
                                            tr1.append(tds3);
                                            tr1.append(tds4);
                                            tr1.append(tds5);
                                            tr1.append(tds6);

                                            tb1.append(tr1);



                                        }

                                        $(".right").append(tb1);

                                        var box= $("<div class='M-box'></div>");

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

                }else if(v=='已处理事项') {

                    $($(".right").children()).remove();

                    //发送ajax请求后台服务器
                    $.ajax({
                        url:"${pageContext.request.contextPath}/findealtask.do",
                        type:"post",
                        async:true,
                        beforeSend: function (){

                            $(".right").append("<div class='load'><img src='${pageContext.request.contextPath}/picture/load1.gif' /></div>");

                        },
                        data:{},
                        dataType:"json",
                        success:function(data) {

                            $(".load").remove();

                            var obj=JSON.parse(data);

                            //获取总条数和每页显示的数量
                            var totalrecord=obj['totalRecord'];

                            var pagesize=obj['pageSize'];

                            for(k in obj) {

                                if(k=='list') {

                                    if(obj[k]==null) {

                                        var noexit=$("<div class='noexit'>暂未查询到已处理事项!</div>");

                                        $(".right").append(noexit);

                                    }else{

                                        var obj1=obj[k];

                                        var tb=$("<table class='tb1'></table>");

                                        var tr=$("<tr class='tr2'></tr>");

                                        var td1=$("<td width='5%' style='border-left: none'>序号</td>");

                                        var td2=$("<td width='15%'>流程名称</td>");

                                        var td3=$("<td width='25%'>流程内容摘要</td>");

                                        var td4=$("<td width='14%'>申请单位</td>");

                                        var td5=$("<td width='10%'>提报人</td>");

                                        var td6=$("<td width='20%'>处理时间</td>");

                                        var td7=$("<td width='5%'>流程图</td>");

                                        var td8=$("<td width='6%' style='border-right: none'>流程状态</td>");

                                        tr.append(td1);
                                        tr.append(td2);
                                        tr.append(td3);
                                        tr.append(td4);
                                        tr.append(td5);
                                        tr.append(td6);
                                        tr.append(td7);
                                        tr.append(td8);

                                        tb.append(tr);

                                        $(".right").append(tb);

                                        for(var i=0;i<obj1.length;i++) {

                                            var tr1=$("<tr class='tr3'></tr>");

                                            var tds1=$("<td style='border-left: none'></td>");

                                            var tds2=$("<td></td>");

                                            var tds3=$("<td class='flowabstract1'></td>");

                                            var tds4=$("<td style='font-family: 楷体;'></td>");

                                            var tds5=$("<td></td>");

                                            var tds6=$("<td></td>");

                                            var tds7=$("<td class='flopic'></td>");

                                            var tds8=$("<td style='color:#00a300;border-right: none;font-family: 仿宋'></td>");

                                            var img=$("<img />");

                                            img.attr("src","${pageContext.request.contextPath}/picture/but9.png");

                                            tds7.append(img);

                                            var obj2=obj1[i];

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

                                                }else if(j=='user') {

                                                    tds4.text(obj2[j]['department']['deptname']);

                                                }else if(j=='person') {

                                                    tds5.text(obj2[j]);

                                                }else if(j=='approve') {

                                                    tds6.text(obj2[j]['dealtime']);

                                                }else if(j=='achieve') {

                                                    if(obj2[j]==0) {

                                                        tds8.text("处理中");

                                                    }else if(obj2[j]==1) {

                                                        tds8.text("已同意");

                                                    }else {

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

                                        var box=$("<div class='M-box1'></div>");

                                        $(".right").append(box);

                                        $(".M-box1").pagination({

                                            totalData:totalrecord,
                                            showData:pagesize,
                                            /*pageCount:10,*/
                                            jump:true,
                                            coping:true,
                                            homePage:'首页',
                                            endPage:'末页',
                                            prevContent:'上页',
                                            nextContent:'下页',
                                            callback:pageback1

                                        });

                                    }

                                }


                            }

                        }

                    });

                }

            });

            $(document).on('click','.flows',function() {

                var v=$(this).text().trim();

                if(v=='付款单审批流程') {

                    window.open("${pageContext.request.contextPath}/climppaynoticeflow.do","_blank");

                }else if(v=='滤芯采购流程') {

                    window.open("${pageContext.request.contextPath}/climpfilterpage.do","_blank");

                }else if(v=='维修保养流程') {

                    alert("维修保养流程");

                }else if(v=='其他采购流程') {

                    alert("其他采购流程");

                }

            });

            //修改密码功能
            $(document).on('click','.uppas',function() {

                $(".ceng").css({"z-index":"1"});
                $(".ceng").show();
                $('.uppasdiv').css({"z-index":"2"});
                $(".uppasdiv").fadeIn(300);

            });

            //注销密码功能
            $(document).on('click','.logout',function() {

                if(confirm("确认注销吗?   ${sessionScope.get("userinfo").truename}")) {

                    window.location="${pageContext.request.contextPath}/logout.do";

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

            //查看流程详情的事件   批流程
            $(document).on('click','.flowabstract',function() {

                var fid=$($($($(this).parent())).children()).eq(0).text();

                $(this).parent().remove();

                var form = $("<form method='post' target='_blank'></form>");
                form.attr({"action":"${pageContext.request.contextPath}/findflowinfinfodetailbyfid.do"});
                var input1 = $("<input type='hidden'>").attr("name", "flowinfoid").val(fid);

                form.append(input1);
                // 这步很重要，如果没有这步，则会报错无法建立连接
                $("body").append($(form));
                form.submit();

            });

            //查看流程详情的页面   没有审批的选项
            $(document).on('click','.flowabstract1',function() {

                var fid=$($($($(this).parent())).children()).eq(0).text();

                var form = $("<form method='post' target='_blank'></form>");
                form.attr({"action":"${pageContext.request.contextPath}/finddetailfilterbyapply.do"});
                var input1 = $("<input type='hidden'>").attr("name", "flowinfoid").val(fid);

                form.append(input1);
                // 这步很重要，如果没有这步，则会报错无法建立连接
                $("body").append($(form));
                form.submit();

            });

            $(".M-box").pagination({
                totalData:${page.totalRecord},
                showData:${page.pageSize},
                /*pageCount:10,*/
                jump:true,
                coping:true,
                homePage:'首页',
                endPage:'末页',
                prevContent:'上页',
                nextContent:'下页',
                callback:pageback

            });

            function pageback(cur) {

                var currentPage=cur.getCurrent();

                $(".right").children().remove();

                $.ajax({
                    url:"${pageContext.request.contextPath}/findoingtask.do",
                    type:"post",
                    async:true,
                    beforeSend:function() {
                        $(".right").append("<div class='load'><img src='${pageContext.request.contextPath}/picture/load1.gif' /></div>");
                    },
                    data:{"currentPage":currentPage},
                    dataType:"json",
                    success:function(data) {

                        $(".load").remove();

                        var obj=JSON.parse(data);

                        //获取总条数和每页显示的数量
                        var totalrecord=obj['totalRecord'];

                        var pagesize=obj['pageSize'];

                        for(k in obj) {

                            if(k=='list') {

                                if(obj[k]==null) {//不存在待办任务

                                    var noexit=$("<div class='noexit'>暂时未查询到待办任务!</div>");

                                    $(".right").append(noexit);


                                }else{//存在待办任务

                                    $(".noexit").remove();

                                    var obj1=obj[k];

                                    var tb1=$("<table class='tb'></table>");

                                    var tr=$("<tr class='tr'></tr>");

                                    var td1=$("<td width='10%' style='border-left: none'>序号</td>");

                                    var td2=$("<td width='15%'>流程名称</td>");

                                    var td3=$("<td width='30%'>流程内容摘要</td>");

                                    var td4=$("<td width='15%'>申请单位</td>");

                                    var td5=$("<td width='10%'>提报人</td>");

                                    var td6=$("<td width='20%' style='border-right: none'>到达时间</td>");

                                    tr.append(td1);
                                    tr.append(td2);
                                    tr.append(td3);
                                    tr.append(td4);
                                    tr.append(td5);
                                    tr.append(td6);

                                    tb1.append(tr);

                                    for(var i=0;i<obj1.length;i++) {

                                        var tr1=$("<tr class='tr1'></tr>");

                                        var tds1=$("<td style='border-left: none'></td>");
                                        var tds2=$("<td></td>");
                                        var tds3=$("<td class='flowabstract'></td>");
                                        var tds4=$("<td></td>");
                                        var tds5=$("<td></td>");
                                        var tds6=$("<td style='border-right: none'></td>");

                                        var obj2=obj1[i];

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

                                            }else if(j=='user') {

                                                tds4.text(obj2[j]['department']['deptname']);

                                            }else if(j=='person') {

                                                tds5.text(obj2[j]);

                                            }else if(j=='approve') {

                                                tds6.text(obj2[j]['arrivetime']);

                                            }

                                        }

                                        tr1.append(tds1);
                                        tr1.append(tds2);
                                        tr1.append(tds3);
                                        tr1.append(tds4);
                                        tr1.append(tds5);
                                        tr1.append(tds6);

                                        tb1.append(tr1);



                                    }

                                    $(".right").append(tb1);

                                    var box= $("<div class='M-box'></div>");

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

                            }

                        }

                    }


                });

            }

            //分页样式表
            $(".M-box1").pagination({
                totalData:30,
                showData:10,
                /*pageCount:10,*/
                jump:true,
                coping:true,
                homePage:'首页',
                endPage:'末页',
                prevContent:'上页',
                nextContent:'下页',
                callback:pageback1
            });

            function pageback1(cur) {

                var currentPage=cur.getCurrent();

                $(".right").children().remove();

                //发送ajax请求后台服务器
                $.ajax({
                    url:"${pageContext.request.contextPath}/findealtask.do",
                    type:"post",
                    sync:true,
                    beforeSend: function (){

                        $(".right").append("<div class='load'><img src='${pageContext.request.contextPath}/picture/load1.gif' /></div>");

                    },
                    data:{"currentPage":currentPage},
                    dataType:"json",
                    success:function(data) {

                        $(".load").remove();

                        var obj=JSON.parse(data);

                        //获取总条数和每页显示的数量
                        var totalrecord=obj['totalRecord'];

                        var pagesize=obj['pageSize'];

                        for(k in obj) {

                            if(k=='list') {

                                if(obj[k]==null) {

                                    var noexit=$("<div class='noexit'>暂未查询到已处理事项!</div>");

                                    $(".right").append(noexit);

                                }else{

                                    var obj1=obj[k];

                                    var tb=$("<table class='tb1'></table>");

                                    var tr=$("<tr class='tr2'></tr>");

                                    var td1=$("<td width='5%' style='border-left: none'>序号</td>");

                                    var td2=$("<td width='15%'>流程名称</td>");

                                    var td3=$("<td width='25%'>流程内容摘要</td>");

                                    var td4=$("<td width='14%'>申请单位</td>");

                                    var td5=$("<td width='10%'>提报人</td>");

                                    var td6=$("<td width='20%'>处理时间</td>");

                                    var td7=$("<td width='5%'>流程图</td>");

                                    var td8=$("<td width='6%' style='border-right: none'>流程状态</td>");

                                    tr.append(td1);
                                    tr.append(td2);
                                    tr.append(td3);
                                    tr.append(td4);
                                    tr.append(td5);
                                    tr.append(td6);
                                    tr.append(td7);
                                    tr.append(td8);

                                    tb.append(tr);

                                    $(".right").append(tb);

                                    for(var i=0;i<obj1.length;i++) {

                                        var tr1=$("<tr class='tr3'></tr>");

                                        var tds1=$("<td style='border-left: none'></td>");

                                        var tds2=$("<td></td>");

                                        var tds3=$("<td class='flowabstract1'></td>");

                                        var tds4=$("<td style='font-family: 楷体;'></td>");

                                        var tds5=$("<td></td>");

                                        var tds6=$("<td></td>");

                                        var tds7=$("<td class='flopic'></td>");

                                        var tds8=$("<td style='color:#00a300;border-right: none;font-family: 仿宋'></td>");

                                        var img=$("<img />");

                                        img.attr("src","${pageContext.request.contextPath}/picture/but9.png");

                                        tds7.append(img);

                                        var obj2=obj1[i];

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

                                            }else if(j=='user') {

                                                tds4.text(obj2[j]['department']['deptname']);

                                            }else if(j=='person') {

                                                tds5.text(obj2[j]);

                                            }else if(j=='approve') {

                                                tds6.text(obj2[j]['dealtime']);

                                            }else if(j=='achieve') {

                                                if(obj2[j]==0) {

                                                    tds8.text("处理中");

                                                }else if(obj2[j]==1) {

                                                    tds8.text("已同意");

                                                }else {

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

                                    var box=$("<div class='M-box1'></div>");

                                    $(".right").append(box);

                                    $(".M-box1").pagination({

                                        totalData:totalrecord,
                                        showData:pagesize,
                                        /*pageCount:10,*/
                                        current:currentPage,
                                        jump:true,
                                        coping:true,
                                        homePage:'首页',
                                        endPage:'末页',
                                        prevContent:'上页',
                                        nextContent:'下页',
                                        callback:pageback1

                                    });

                                }

                            }


                        }


                    }


                });

            }

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

        });

    </script>

    <style type="text/css">

        *{
            margin-top: 0px;
            margin-left: 0px;
            margin-right: 0px;
            font-family: "宋体";

        }

        body{

            overflow-y: hidden;

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

        .menu{
            position: relative;
            border: 1px solid #ebe7e4;
            height: 35px;
            border-bottom: 1px solid #008cd0;

            background-color: #ebe7e4;
            font-size: 15px;
        }

        .m1{
            text-align:center;
            position: relative;
            list-style-type: none;
            float: left;
            border-right: 1px solid #979797;
            height: 35px;
            line-height: 35px;
            color: #008dd1;
            width: 10%;
            cursor: pointer;

        }

        .mai{

            position: relative;

            height: 83%;

        }

        .bottom{

        }

        .left{
            position: relative;
            border: 1px solid #004575;
            float: left;
            width: 13%;
            height: 100%;
            border-left:none;
            border-top: none;
            background-color: #fffefd;

        }

        .right{

            border: 1px solid #004575;
            position: relative;
            height: 100%;
            float: left;
            width: 86.8%;
            border-left:none;
            border-top: none;
            border-right: none;

        }

        .flowcenter,.flowcenter1{

            position: relative;
            border: 1px solid #004575;
            height: 35px;
            text-align: center;
            line-height: 35px;
            border-top: none;
            border-right: none;
            color: #00223c;
            cursor: pointer;
            font-size: 15px;

        }

        .flowcenter:hover{

            background-color: #0cbef7 !important;
            color: white !important;;

        }

        .flows{

            position: relative;
            border: 1px solid #007dca;
            height: 30px;
            line-height: 30px;
            width: 10%;
            text-align: center;
            margin-left: 5%;
            margin-top: 3%;
            background-color: #007dca;
            color: white;
            font-size: 15px;
            cursor: pointer;

        }

        .flows:hover{

            background-color: #005f98;

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
            margin-top: 1%;
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

        .flowabstract,.flowabstract1{

            color: #3150f2;
            cursor: pointer;
            font-weight: 300;
            font-family: "Courier New";

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


        /*分页样式表2*/
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
            margin-top: 1%;
            font-family: "仿宋";

        }

        .load{

            position: absolute;
            text-align: center;
            top: 40%;
            left: 40%;

        }

        .flopic{

            cursor: pointer;

        }

        ::-ms-clear, ::-ms-reveal { display: none; }

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

    <img class="backimg" src="${pageContext.request.contextPath}/picture/fenzhen.png" />

    <img class="userbanner" src="${pageContext.request.contextPath}/picture/user.png" />

    <div class="userinfo">${sessionScope.get("userinfo").truename},您好!<br />${requestScope.get("dates")}</div>

    <div class="username" hidden="hidden">${sessionScope.get("userinfo").username}</div>

    <img class="uppas" src="${pageContext.request.contextPath}/picture/pwd.png" />

    <img class="logout" src="${pageContext.request.contextPath}/picture/logout.png" />

</div>

<div class="c1"></div>

<div class="menu">

    <li class="m1 flowtop" style="margin-left: 3px">流程中心</li>

    <li class="m1">个人中心</li>

</div>

<div class="mai">

    <div class='left'>
        <div class='flowcenter'>个人信息</div>
    </div>

    <div class="right">

        <table class="tb1">

            <tr class="tr2">
                <td width="5%">序号</td>
                <td width="15%">流程名称</td>
                <td width="25%">流程内容摘要</td>
                <td width="10%">申请单位</td>
                <td width="10%">提报人</td>
                <td width="20%">处理时间</td>
                <td width="5%">流程图</td>
                <td width="10%">流程状态</td>
            </tr>

            <tr class="tr3">

                <td>1</td>
                <td>滤芯计划采购流程</td>
                <td>306车间采购滤芯计划</td>
                <td>306车间</td>
                <td>岳洪波</td>
                <td>2020-12-13 09:26:51</td>
                <td><img src="${pageContext.request.contextPath}/picture/but9.png" /></td>
                <td style="color: #008d00">处理中</td>

            </tr>

        </table>

        <div class="M-box1"></div>

    </div>

</div>

</body>

</html>

<script type="text/javascript" language="JavaScript">

    //刷新执行该段代码
    (function() {

        $(".flowtop").css({"background-color":"white"});

        $($(".flowtop").siblings()).css({"background-color":"ebe7e4"});

        $(".mai").children().remove();

        var left=$("<div class='left'><div class='flowcenter' id='daiban'>待办事项</div><div class='flowcenter'>已处理事项</div></div>");

        var right=$("<div class='right'></div>");

        $(".mai").append(left);
        $(".mai").append(right);

        $("#daiban").css({"background-color": "#008ece", "color": "white"});

        $(".right").children().remove();

        //发送ajax请求后台服务器

        $.ajax({
            url:"${pageContext.request.contextPath}/findoingtask.do",
            type:"post",
            async:true,
            beforeSend: function (){

                $(".right").append("<div class='load'><img src='${pageContext.request.contextPath}/picture/load1.gif' /></div>");

            },
            data:{},
            dataType:"json",
            success:function(data) {

                $(".load").remove();

                var obj=JSON.parse(data);

                //获取总条数和每页显示的数量
                var totalrecord=obj['totalRecord'];

                var pagesize=obj['pageSize'];

                for(k in obj) {

                    if(k=='list') {

                        if(obj[k]==null) {//不存在待办任务

                            var noexit=$("<div class='noexit'>暂时未查询到待办任务!</div>");

                            $(".right").append(noexit);


                        }else{//存在待办任务

                            $(".noexit").remove();

                            var obj1=obj[k];

                            var tb1=$("<table class='tb'></table>");

                            var tr=$("<tr class='tr'></tr>");

                            var td1=$("<td width='10%' style='border-left: none'>序号</td>");

                            var td2=$("<td width='15%'>流程名称</td>");

                            var td3=$("<td width='30%'>流程内容摘要</td>");

                            var td4=$("<td width='15%'>申请单位</td>");

                            var td5=$("<td width='10%'>提报人</td>");

                            var td6=$("<td width='20%' style='border-right: none'>到达时间</td>");

                            tr.append(td1);
                            tr.append(td2);
                            tr.append(td3);
                            tr.append(td4);
                            tr.append(td5);
                            tr.append(td6);

                            tb1.append(tr);

                            for(var i=0;i<obj1.length;i++) {

                                var tr1=$("<tr class='tr1'></tr>");

                                var tds1=$("<td style='border-left: none'></td>");
                                var tds2=$("<td></td>");
                                var tds3=$("<td class='flowabstract'></td>");
                                var tds4=$("<td></td>");
                                var tds5=$("<td></td>");
                                var tds6=$("<td style='border-right: none'></td>");

                                var obj2=obj1[i];

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

                                    }else if(j=='user') {

                                        tds4.text(obj2[j]['department']['deptname']);

                                    }else if(j=='person') {

                                        tds5.text(obj2[j]);

                                    }else if(j=='approve') {

                                        tds6.text(obj2[j]['arrivetime']);

                                    }

                                }

                                tr1.append(tds1);
                                tr1.append(tds2);
                                tr1.append(tds3);
                                tr1.append(tds4);
                                tr1.append(tds5);
                                tr1.append(tds6);

                                tb1.append(tr1);



                            }

                            $(".right").append(tb1);

                            var box= $("<div class='M-box'></div>");

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
                                callback:pageback3

                            });

                        }

                    }

                }

            }

        });




    })();

    function pageback3(cur) {

        var currentPage=cur.getCurrent();

        $(".right").children().remove();

        $.ajax({
            url:"${pageContext.request.contextPath}/findoingtask.do",
            type:"post",
            async:false,
            beforeSend:function() {
                $(".right").append("<div class='load'><img src='${pageContext.request.contextPath}/picture/load1.gif' /></div>");
            },
            data:{"currentPage":currentPage},
            dataType:"json",
            success:function(data) {

                $(".load").remove();

                var obj=JSON.parse(data);

                //获取总条数和每页显示的数量
                var totalrecord=obj['totalRecord'];

                var pagesize=obj['pageSize'];

                for(k in obj) {

                    if(k=='list') {

                        if(obj[k]==null) {//不存在待办任务

                            var noexit=$("<div class='noexit'>暂时未查询到待办任务!</div>");

                            $(".right").append(noexit);


                        }else{//存在待办任务

                            $(".noexit").remove();

                            var obj1=obj[k];

                            var tb1=$("<table class='tb'></table>");

                            var tr=$("<tr class='tr'></tr>");

                            var td1=$("<td width='10%'>序号</td>");

                            var td2=$("<td width='15%'>流程名称</td>");

                            var td3=$("<td width='30%'>流程内容摘要</td>");

                            var td4=$("<td width='15%'>申请单位</td>");

                            var td5=$("<td width='10%'>提报人</td>");

                            var td6=$("<td width='20%'>到达时间</td>");

                            tr.append(td1);
                            tr.append(td2);
                            tr.append(td3);
                            tr.append(td4);
                            tr.append(td5);
                            tr.append(td6);

                            tb1.append(tr);

                            for(var i=0;i<obj1.length;i++) {

                                var tr1=$("<tr class='tr1'></tr>");

                                var tds1=$("<td></td>");
                                var tds2=$("<td></td>");
                                var tds3=$("<td class='flowabstract'></td>");
                                var tds4=$("<td></td>");
                                var tds5=$("<td></td>");
                                var tds6=$("<td></td>");

                                var obj2=obj1[i];

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

                                    }else if(j=='user') {

                                        tds4.text(obj2[j]['department']['deptname']);

                                    }else if(j=='person') {

                                        tds5.text(obj2[j]);

                                    }else if(j=='approve') {

                                        tds6.text(obj2[j]['arrivetime']);

                                    }

                                }

                                tr1.append(tds1);
                                tr1.append(tds2);
                                tr1.append(tds3);
                                tr1.append(tds4);
                                tr1.append(tds5);
                                tr1.append(tds6);

                                tb1.append(tr1);



                            }

                            $(".right").append(tb1);

                            var box= $("<div class='M-box'></div>");

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

                    }

                }

            }


        });



    }



</script>
