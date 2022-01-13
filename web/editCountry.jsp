<%@ page import="kz.mun.decanat.model.Student" %>
<%@ page import="kz.mun.decanat.model.Country" %><%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 17.10.2021
  Time: 22:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@include file="head.jsp"%>
<body>
<div class="container">
    <%@ include file="header.html"%>
    <div class="row">
        <div class="col-lg-5 m-auto mt-5">

            <%
                Country country = (Country) request.getAttribute("country");
            %>

            <form action="/edit-country?id=<%=country.getId()%>" method="post" class="newForm">
                <h5 class="task-name">Edit country</h5>
                <p class="label">Name</p>
                <input type="text" value="<%=country.getName()%>" name="countryName">
                <p class="label">Code</p>
                <input type="text" value="<%=country.getCode()%>" name="countryCode">
                <a href="/countries" class="btn btn-secondary edit-btn">Back</a>
                <button type="submit" class="btn btn-success edit-btn">Save country</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
