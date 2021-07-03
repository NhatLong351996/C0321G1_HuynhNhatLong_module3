<%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 03/07/2021
  Time: 16:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Find</title>
</head>
<body>
<div align="center">
    <h2>
        <a href="/Products">List All Product</a>
    </h2>
    <h1>Find By Name</h1>
    <form action="/Products" method="post">
        <input type="hidden" name="action" value="findByName">
        <label>Name: <input type="text" name="name" placeholder="Name"></label>
        <input type="submit" value="Find">
    </form>
</div>

</body>
</html>
