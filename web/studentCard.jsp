<%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 18.10.2021
  Time: 8:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900&amp;subset=cyrillic" rel="stylesheet">
    <!-- Bootstrap Reboot CSS -->
    <link rel="stylesheet" href="css/bootstrap-reboot.min.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Main CSS -->
    <link rel="stylesheet" href="css/main.css">
    <title>Student card</title>
</head>
<body>
<div class="container">

    <%@ include file="header.html"%>

    <div class="student-list">
        <div class="row">
            <div class="col-lg-4">
                <h2 class="student-card">STUDENT CARD</h2>
                <table class="table table-bordered border-dark">
                    <tbody>
                    <%
                        String id = (String) request.getAttribute("id");
                        String name = (String) request.getAttribute("name");
                        String surname = (String) request.getAttribute("surname");
                        String birthdate = (String) request.getAttribute("birthdate");
                        String city = (String) request.getAttribute("city");
                    %>
                    <tr>
                        <th>1</th>
                        <td class="table-active table-primary">ID</td>
                        <%out.println("<td># " + id + "</td>");%>
                    </tr>
                    <tr>
                        <th>2</th>
                        <td class="table-active table-primary">Name:</td>
                        <%out.println("<td>" + name + "</td>");%>
                    </tr>
                    <tr>
                        <th>3</th>
                        <td class="table-active table-primary">Surname:</td>
                        <%out.println("<td>" + surname + "</td>");%>
                    </tr>
                    <tr>
                        <th>4</th>
                        <td class="table-active table-primary">Birthdate:</td>
                        <%out.println("<td>" + birthdate + "</td>");%>
                    </tr>
                    <tr>
                        <th>5</th>
                        <td class="table-active table-primary">City:</td>
                        <%out.println("<td>" + city + "</td>");%>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="edit">
        <div class="row">
            <div class="col">
                <a href="student-card?id=<%out.println(id);%>&do=student-card-edit" class="btn btn-primary">Edit student</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
