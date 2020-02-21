<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yangtao
  Date: 2020-02-17
  Time: 上午 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>流程图</title>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery.ztree.core-3.5.js"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery.pagination.js"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/WdatePicker.js"></script>
    <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/js/jquery.cookie.js" ></script>

    <script type="text/javascript" language="JavaScript">

        $(function() {



        });

    </script>

    <style type="text/css">

        *{

            font-family: "宋体";
            font-size: 13px;

        }

        .tb{
            position:relative;
            margin-top: 10%;
            margin-left: 20%;
            border-collapse: collapse;
            border: none;

        }

        .tb td{

            border: 1px solid #d3d2d1;
            text-align: center;
            height: 50px;

        }

    </style>

</head>

<body>

<c:choose>

    <c:when test="${flowp=='fails'}">

        <script type="text/javascript" language="JavaScript">

            (function close(){

                var userAgent = navigator.userAgent;
                if (userAgent.indexOf("Firefox") != -1 || userAgent.indexOf("Chrome") != -1) {
                    location.href = "about:blank";
                } else {
                    window.opener = null;
                    window.open('', '_self');
                }

                window.close();

            })();

        </script>

    </c:when>

    <c:otherwise>

        <table class="tb">

            <tr>

                <c:forEach items="${flowp}" var="f" varStatus="status">

                    <c:choose>

                        <c:when test="${status.first}">

                            <td style="border: none;height: 90px;width: 200px">

                                <div style="text-align: left;color: #68b7f5">${f.name}</div>

                                <img  width="50px" height="50px" src="${pageContext.request.contextPath}/picture/liupic/start.png" />
                                <img  width="140px" height="50px" src="${pageContext.request.contextPath}/picture/liupic/jiantou.png" />

                                <c:if test="${f.appfag==0}">

                                    <div style="text-align: left;font-weight:bold;color: #ff7c6e;margin-top: 3%">未审批</div>

                                </c:if>

                                <c:if test="${f.appfag==1}">

                                    <div style="text-align: left;font-weight:bold;color: green;margin-top: 3%">流程提交</div>

                                </c:if>

                                <c:if test="${f.appfag==2}">

                                    <div style="text-align: left;font-weight:bold;color: #ff0c07;margin-top: 3%">已拒绝</div>

                                </c:if>

                            </td>

                        </c:when>

                        <c:when test="${status.last}">

                            <td style="border: none;height: 90px;width: 50px">

                                <div style="text-align: left;color: #68b7f5">${f.name}</div>

                                <img  width="50px" height="50px" src="${pageContext.request.contextPath}/picture/liupic/end.png" />

                                <c:if test="${f.appfag==0}">

                                    <div style="text-align: left;font-weight:bold;color: #ff7c6e;margin-top: 3%">未审批</div>

                                </c:if>

                                <c:if test="${f.appfag==1}">

                                    <div style="text-align: left;font-weight:bold;color: green;margin-top: 3%">已同意</div>

                                </c:if>

                                <c:if test="${f.appfag==2}">

                                    <div style="text-align: left;font-weight:bold;color: #ff0c07;margin-top: 3%">已拒绝</div>

                                </c:if>

                            </td>

                        </c:when>

                        <c:otherwise>

                            <td style="border: none;height: 90px;width: 200px">

                                <div style="text-align: left;color: #68b7f5">${f.name}</div>

                                <img  width="50px" height="50px" src="${pageContext.request.contextPath}/picture/liupic/person.png" />
                                <img  width="140px" height="50px" src="${pageContext.request.contextPath}/picture/liupic/jiantou.png" />

                                <c:if test="${f.appfag==0}">

                                    <div style="text-align: left;font-weight:bold;color: #ff7c6e;margin-top: 3%">未审批</div>

                                </c:if>

                                <c:if test="${f.appfag==1}">

                                    <div style="text-align: left;font-weight:bold;color: green;margin-top: 3%">已同意</div>

                                </c:if>

                                <c:if test="${f.appfag==2}">

                                    <div style="text-align: left;font-weight:bold;color: #ff0c07;margin-top: 3%">已拒绝</div>

                                </c:if>

                            </td>

                        </c:otherwise>

                    </c:choose>

                </c:forEach>

            </tr>

        </table>

    </c:otherwise>

</c:choose>

</body>

</html>
