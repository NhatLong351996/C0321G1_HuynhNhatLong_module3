<%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 06/07/2021
  Time: 10:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>
    <jsp:include page="link_css.jsp"></jsp:include>
</head>
<body>
<div class="container-fluid">
    <jsp:include page="header.jsp"></jsp:include>
</div>
<div class="row">
    <div class="col-3 ">
        <jsp:include page="leftbar.jsp"></jsp:include>
    </div>
    <div class="col-9 mt-5 ml-0">
<%--body--%>
        <jsp:include page="body/bodyhome.jsp"></jsp:include>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<jsp:include page="link_js.jsp"></jsp:include>
</body>
</html>
