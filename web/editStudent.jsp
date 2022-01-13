<%@ page import="kz.mun.decanat.model.Student" %><%--
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
    <div class="students">
        <div class="row">
            <div class="col">

                <%
                    Student student = (Student) request.getAttribute("student");
                %>

                <form action="student-card?do=student-card-update" method="post" class="newForm">
                    <h5 class="task-name">Edit student data</h5>
                    <p class="label">Name</p>
                    <input type="text" value="<%=student.getName()%>" name="studentName">
                    <p class="label">Surname</p>
                    <input type="text" value="<%=student.getSurname()%>" name="studentSurname">
                    <p class="label">Birthdate</p>
                    <input type="text" value="<%=student.getBirthdate()%>" name="studentBirthdate">
                    <select name="city">
                        <option value="<%=student.getCity()%>"><%=student.getCity()%></option>
                        <option value="Almaty">Alamty</option>
                        <option value="Karaganda">Karaganda</option>
                        <option value="Aktobe">Aktobe</option>
                        <option value="Taldykorgan">Taldykorgan</option>
                        <option value="Nur-Sultan">Nur-Sultan</option>
                        <option value="Semey">Semey</option>
                        <option value="Atyrau">Atyrau</option>
                        <option value="Shymkent">Shymkent</option>
                        <option value="Taraz">Taraz</option>
                        <option value="Oskemen">Oskemen</option>
                        <option value="Kokshetau">Kokshetau</option>
                        <option value="Mangistau">Mangistau</option>
                        <option value="Aktau">Aktau</option>
                    </select>
                    <button type="submit" class="btn btn-success edit-btn">Save student</button>
                    <a href="/student-card?id=<%=student.getId()%>&do=student-card-view" class="btn btn-secondary edit-btn">Back</a>
                    <a href="/delete-student?id=<%=student.getId()%>" class="btn btn-danger edit-btn">Delete student</a>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
