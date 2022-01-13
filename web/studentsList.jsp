<%@ page import="java.util.ArrayList" %>
<%@ page import="kz.mun.decanat.model.Student" %><%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 17.10.2021
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
                <a href="add-student" class="btn btn-primary add-student">+ New student</a>
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
                        <th scope="col" class="text-center">DETAIL</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        ArrayList<Student> students = (ArrayList<Student>) request.getAttribute("students");
                        for (Student student : students) {
                    %>
                    <tr>
                        <th scope="row"><%=student.getId()%></th>
                        <td><%=student.getName()%></td>
                        <td><%=student.getSurname()%></td>
                        <td><%=student.getBirthdate()%></td>
                        <td><%=student.getCity()%></td>
                        <td class="text-center"><a href="/student-card?id=<%=student.getId()%>&do=student-card-view" class="btn btn-primary details">Details</a></td>
                    </tr>
                    <%
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
