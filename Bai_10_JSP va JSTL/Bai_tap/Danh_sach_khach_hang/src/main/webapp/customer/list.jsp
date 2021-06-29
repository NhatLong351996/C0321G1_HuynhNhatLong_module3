<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 28/06/2021
  Time: 21:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer</title>
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.css">
</head>
<body>
<h1>Customer List</h1>

<table class="table">
    <thead>
    <tr>
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Dịa chỉ</th>
        <th>Hình ảnh</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${customerList}" var="customer">
    <tr>
        <td>${customer.name}</td>
        <td>${customer.dayOfBirth}</td>
        <td>${customer.adress}</td>
        <td>
            <img src="/image/${customer.image}" width="50" height="50">
        </td>
    </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
