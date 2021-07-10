<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 09/07/2021
  Time: 8:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer</title>
    <jsp:include page="/link_css.jsp"></jsp:include>
</head>
<body>
<div class="container-fluid">
    <jsp:include page="/header.jsp"></jsp:include>
</div>
<div class="row">
    <div class="col-3 ">
        <jsp:include page="/leftbar.jsp"></jsp:include>
    </div>
    <div class="col-9 mt-5 ml-0">
        <%--body--%>
        <center>
            <h1>Customer Information</h1>
            <h2>
                <button type="button" class="btn btn-secondary">
                    <a class="text-light" href="/customer">Back To List</a>
                </button>

            </h2>
        </center>
        <div align="center">
            <table id="tableCustomer" class="table table-hover table-active">
                <thead>
                <tr>
                    <th scope="col">Id</th>
                    <th scope="col">Name</th>
                    <th scope="col">Birthday</th>
                    <th scope="col">Card</th>
                    <th scope="col">Phone</th>
                    <th scope="col">Email</th>
                    <th scope="col">Adress</th>
                    <th scope="col">Edit</th>
                    <th scope="col">Delete</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="customer" items="${list}">
                    <tr>
                        <td>${customer.getId()}</td>
                        <td>${customer.getNamePerson()}</td>
                        <td>${customer.getDateOfBirth()}</td>
                        <td>${customer.getIdentityNumber()}</td>
                        <td>${customer.getPhoneNumber()}</td>
                        <td>${customer.getEmail()}</td>
                        <td>${customer.getAdress()}</td>
                        <td>
                            <button type="button" class="btn btn-primary "><a class="text-light" href="/customer?action=edit&id=${customer.id}">
                                Edit
                            </a></button>
                        </td>
                            <%-- <<!-- Button trigger modal -->--%>
                        <td>
                            <button onclick="ondelete('${customer.getId()}','${customer.getNamePerson()}')" type="button" class="btn btn-danger "
                                    data-toggle="modal" data-target="#modelId">
                                Delete
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <!-- Modal -->
            <div class="modal fade" id="modelId" tabindex="-1" role="dialog" aria-labelledby="modelTitleId"
                 aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Delete</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <%-- chuyen huong--%>
                        <form action="/customer" method="post">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="id" value="" id="deleteid">
                            <div class="modal-body">
                                Do you want to delete <input style="border: none;outline: none;color: red " id="namecustomer" >
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">No
                                </button>
                                <button type="submit" class="btn btn-primary">Yes</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <script>
                function ondelete(id,name) {
                    document.getElementById("deleteid").value=id;
                    document.getElementById("namecustomer").value=name;
                }
            </script>
            <h4>
                <a href="/Products?action=findByName">Find By Name</a>
            </h4>
        </div>
    </div>
</div>
<jsp:include page="/footer.jsp"></jsp:include>
<jsp:include page="/link_js.jsp"></jsp:include>
<script>
    $(document).ready(function() {
        $('#tableCustomer').dataTable( {
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        } );
    } );
</script>
</body>
</html>
