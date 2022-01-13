<%@ page import="java.util.ArrayList" %>
<%@ page import="kz.mun.decanat.model.Country" %><%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 13.01.2022
  Time: 22:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@include file="head.jsp" %>
<body>
<div class="container">
    <%@ include file="header.html" %>
    <div class="add">
        <div class="row">
            <div class="col">
                <a href="add-student" class="btn btn-primary add-student" data-bs-toggle="modal" data-bs-target="#addNewCountry">+ New country</a>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-6">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">NAME</th>
                    <th scope="col">CODE</th>
                    <th scope="col"></th>
                </tr>
                </thead>
                <tbody>
                <%
                    ArrayList<Country> countries = (ArrayList<Country>) request.getAttribute("countries");
                    for (Country country : countries) {
                %>
                <tr>
                    <th scope="row"><%=country.getId()%></th>
                    <td><%=country.getName()%></td>
                    <td><%=country.getCode()%></td>
                    <td class="text-center"><a href="/edit-country?id=<%=country.getId()%>" class="btn btn-primary details">Edit</a></td>
                    <td class="text-center"><a href="/delete-country?id=<%=country.getId()%>" class="btn btn-primary details">Delete</a></td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="addNewCountry">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add new country</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="/add-country" method="post">
                        <div class="mb-3">
                            <label for="countryName" class="form-label">Name</label>
                            <input type="text" name="countryName" class="form-control" id="countryName">
                        </div>
                        <div class="mb-3">
                            <label for="countryCode" class="form-label">Code</label>
                            <input type="text" name="countryCode" class="form-control" id="countryCode">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Add country</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
