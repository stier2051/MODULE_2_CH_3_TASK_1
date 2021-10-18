<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Student" %><%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 17.10.2021
  Time: 22:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- Bootstrap Reboot CSS -->
    <link rel="stylesheet" href="css/bootstrap-reboot.min.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Main CSS -->
    <link rel="stylesheet" href="css/main.css">
    <title>Student list</title>
</head>
<body>
<div class="container">
    <%@ include file="header.html"%>
    <div class="add">
        <div class="row">
            <div class="col">
                <a href="add-student" class="btn btn-primary add-task">+ New student</a>
            </div>
        </div>
    </div>

    <div class="student-list">
        <div class="row">
            <div class="col">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">NAME</th>
                        <th scope="col">SURNAME</th>
                        <th scope="col">BIRTHDATE</th>
                        <th scope="col">CITY</th>
                        <th scope="col">DETAIL</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        ArrayList<Student> students = (ArrayList<Student>)  request.getAttribute("students");
                        for (Student student : students) {
                            out.println("<tr>");
                            out.println("<th scope=\"row\">" + student.getId() + "</th>");
                            out.println("<td>" + student.getName() + "</td>");
                            out.println("<td>" + student.getSurname() + "</td>");
                            out.println("<td>" + student.getBirthdate() + "</td>");
                            out.println("<td>" + student.getCity() + "</td>");
                            out.println("<td><a href=\"student-card?id=" + student.getId() + "&do=student-card-view\" class=\"btn btn-primary details\">Detail</a></td>");
                            out.println("</td>");
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>
