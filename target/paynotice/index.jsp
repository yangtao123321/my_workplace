<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/1/30
  Time: 15:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>hello word</title>

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js" language="JavaScript"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery.ztree.core-3.5.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.pagination.js" language="JavaScript"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/WdatePicker.js"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery.cookie.js" ></script>

    <script type="text/javascript" language="JavaScript">

        $(function() {

            var width=window.screen.width;

            var height=window.screen.height;

            //如果width小于1400 则认为是小屏幕电脑

            if(width<=1400) {

                window.location="${pageContext.request.contextPath}/login1.jsp";

            }else{//大屏幕电脑

                window.location="${pageContext.request.contextPath}/login.jsp";

            }

        });


    </script>


</head>
<body>

</body>
</html>
