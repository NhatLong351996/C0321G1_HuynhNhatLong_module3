<%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 08/07/2021
  Time: 7:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Customer</title>
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
            <form action="/customer" method="post" >
                <input type="hidden" name="action" value="create">
                <div class="form-group">
                    <label >Id Loai Khach</label>
                    <input name="idloaikhach" type="number" class="form-control"  aria-describedby="emailHelp" >
                    <small class="form-text text-muted">We'll never share your email with anyone else.</small>
                </div>
                <div class="form-group">
                    <label >Name</label>
                    <input name="name" type="text" class="form-control"  aria-describedby="emailHelp" >
                    <small class="form-text text-muted">We'll never share your email with anyone else.</small>
                </div><div class="form-group">
                    <label >Email</label>
                    <input name="email" type="email" class="form-control"  aria-describedby="emailHelp" >
                    <small class="form-text text-muted">We'll never share your email with anyone else.</small>
                </div>
                <div class="form-group">
                    <label >Date Of Birth</label>
                    <input name="date" type="date" class="form-control"  aria-describedby="emailHelp" >
                    <small class="form-text text-muted">We'll never share your email with anyone else.</small>
                </div>
                <div class="form-group">
                    <label >Card</label>
                    <input name="card" type="text" class="form-control"  aria-describedby="emailHelp" >
                    <small class="form-text text-muted">We'll never share your email with anyone else.</small>
                </div>

                <div class="form-group">
                    <label >Phone Number</label>
                    <input name="phone" type="text" class="form-control"  aria-describedby="emailHelp" >
                    <small class="form-text text-muted">We'll never share your email with anyone else.</small>
                </div>
                <div class="form-group">
                    <label >Adress</label>
                    <input name="address" type="text" class="form-control"  aria-describedby="emailHelp" >
                    <small class="form-text text-muted">We'll never share your email with anyone else.</small>
                </div>

                <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="exampleCheck1">
                    <label class="form-check-label" for="exampleCheck1">Check me out</label>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
    </div>
</div>
<jsp:include page="/footer.jsp"></jsp:include>
<jsp:include page="/link_js.jsp"></jsp:include>
</body>
</html>
