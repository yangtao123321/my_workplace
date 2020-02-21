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

    <!--[if IE 8]>

    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery1.8.3.js"></script>

    <![endif]-->

    <script type="text/javascript" language="JavaScript">

        String.prototype.trim = function() {
            return this.replace(/(^\s*)|(\s*$)/g, ""); //正则匹配空格
        };

        var width=window.screen.width;

        var height=window.screen.height;

        $(function() {

            if(IEVersion()==8||IEVersion()==9) {

                if(width<=1400) {

                    window.location="${pageContext.request.contextPath}/login1.jsp";

                }else{//大屏幕电脑

                    window.location="${pageContext.request.contextPath}/ie8/login2.jsp";

                }

            }else if(IEVersion()<=7&&IEVersion()!=-1) {//建议更换高版本的浏览器



            }else{//高版本的浏览器

                if(width<=1400) {

                    window.location="${pageContext.request.contextPath}/login1.jsp";

                }else{//大屏幕电脑

                    window.location="${pageContext.request.contextPath}/login.jsp";

                }

            }



            //如果width小于1400 则认为是小屏幕电脑



        });

        function IEVersion() {
            var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串
            var isIE = userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1; //判断是否IE<11浏览器
            var isEdge = userAgent.indexOf("Edge") > -1 && !isIE; //判断是否IE的Edge浏览器
            var isIE11 = userAgent.indexOf('Trident') > -1 && userAgent.indexOf("rv:11.0") > -1;
            if(isIE) {
                var reIE = new RegExp("MSIE (\\d+\\.\\d+);");
                reIE.test(userAgent);
                var fIEVersion = parseFloat(RegExp["$1"]);
                if(fIEVersion == 7) {
                    return 7;
                } else if(fIEVersion == 8) {
                    return 8;
                } else if(fIEVersion == 9) {
                    return 9;
                } else if(fIEVersion == 10) {
                    return 10;
                } else {
                    return 6;//IE版本<=7
                }
            } else if(isEdge) {
                return 'edge';//edge
            } else if(isIE11) {
                return 11; //IE11
            }else{
                return -1;//不是ie浏览器
            }
        }

    </script>


</head>
<body>

</body>
</html>
