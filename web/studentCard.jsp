<%@ page import="kz.mun.decanat.model.Student" %>
<%@ page import="kz.mun.decanat.db.DBManager" %><%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 18.10.2021
  Time: 8:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@include file="head.jsp"%>
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
                        Student student = (Student) request.getAttribute("student");
                    %>
                    <tr>
                        <th>1</th>
                        <td class="table-active table-primary">ID</td>
                        <td>#<%=student.getId()%></td>
                    </tr>
                    <tr>
                        <th>2</th>
                        <td class="table-active table-primary">Name:</td>
                        <td><%=student.getName()%></td>
                    </tr>
                    <tr>
                        <th>3</th>
                        <td class="table-active table-primary">Surname:</td>
                        <td><%=student.getSurname()%></td>
                    </tr>
                    <tr>
                        <th>4</th>
                        <td class="table-active table-primary">Birthdate:</td>
                        <td><%=student.getBirthdate()%></td>
                    </tr>
                    <tr>
                        <th>5</th>
                        <td class="table-active table-primary">Country:</td>
                        <td><%=DBManager.getCountryByStudentId(student.getId())%></td>
                    </tr>
                    <tr>
                        <th>6</th>
                        <td class="table-active table-primary">City:</td>
                        <td><%=DBManager.getCityByStudentId(student.getId())%></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="edit">
        <div class="row">
            <div class="col">
                <a href="student-card?id=<%=student.getId()%>&do=student-card-edit" class="btn btn-primary edit-btn">Edit student</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
