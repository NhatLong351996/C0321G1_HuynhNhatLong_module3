<%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 03/07/2021
  Time: 5:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Show User</title>
</head>
<body>
<div align="center">
    <h2>
        <a href="/users">List All Users</a>
    </h2>
    <table>
        <caption>Infomation Of User</caption>
        <tr>
            <th>Id:</th>
            <td>${user.id}</td>
        </tr>
        <tr>
            <th>Name:</th>
            <td>${user.name}</td>
        </tr>
        <tr>
            <th>Email:</th>
            <td>${user.email}</td>
        </tr>
        <tr>
            <th>Country:</th>
            <td>${user.country}</td>
        </tr>
    </table>
</div>
</body>
</html>
