<%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 29/06/2021
  Time: 5:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
  </head>
  <body>
  <form action="/calculate" method="post">
    <h5>Calculator</h5>
    <label>First operand: <input type="text" name="first-Operand" value="0"></label></br>
    <label for="Operator">Operator :</label>
    <select name="Operator" id="Operator">
      <option value="+">addition</option>
      <option value="-">subtraction</option>
      <option value="*">multiplication</option>
      <option value="/">division</option>
    </select></br>
    <label>Second operand: <input type="text" name="second-Operand" value="0"></label>
    <input type="submit" value="Calculate">
  </form>
  </body>
</html>
