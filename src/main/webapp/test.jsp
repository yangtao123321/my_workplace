<%--
  Created by IntelliJ IDEA.
  User: yangtao
  Date: 2020-02-19
  Time: 上午 8:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>123</title>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery1.8.3.js"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/selectivizr-min.js"></script>

    <script type="text/javascript" language="JavaScript">

        String.prototype.trim = function() {
            return this.replace(/(^\s*)|(\s*$)/g, ""); //正则匹配空格
        };

        $(function() {

            $(".sub").click(function() {

                jQuery.support.cors = true;

                $.ajax({
                    url:"${pageContext.request.contextPath}/test123.do",
                    type:"post",
                    async:false,
                    data:{"s":"321"},
                    dataType:"json",
                    success:function(data) {

                        alert(data);

                    }


                });

            });


        });

    </script>

    <style type="text/css">

        .n{

            border: 1px solid red;

        }

        .sub{

            background-color: #2c87c0;
            color: white;
            border: 1px solid #2c87c0;
            height: 35px;
            width: 90px;
            cursor: pointer;


        }

        .sub:hover{
            background-color: #0062a4;
        }

    </style>

</head>

<body>

<input class="sub" type="button" value="查询" />

<input class="n" type="text" value="123" />

</body>

</html>
