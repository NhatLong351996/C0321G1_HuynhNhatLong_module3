<%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 25/06/2021
  Time: 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<form method="post" action="/display-discount">
    <h1>Product Discount Calculator</h1>
    <label>Product Description <input type="text" name="Product-Description"
              placeholder="Product-Description"></label>
  <label>List Price <input type="text" name="List-Price" placeholder="List-Price"></label>
  <label>Discount Percent <input type="text" name="Discount-Percent" placeholder="%"></label>
  <input type="submit" value="Discount">
</form>

</body>
</html>
