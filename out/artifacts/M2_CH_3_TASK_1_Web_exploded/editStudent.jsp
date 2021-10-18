<%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 17.10.2021
  Time: 22:30
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
    <title>Edit student</title>
</head>
<body>
<div class="container">
    <%@ include file="header.html"%>
    <div class="students">
        <div class="row">
            <div class="col">

                <%
                    String id = (String) request.getAttribute("id");
                    String name = (String) request.getAttribute("name");
                    String surname = (String) request.getAttribute("surname");
                    String birthdate = (String) request.getAttribute("birthdate");
                    String city = (String) request.getAttribute("city");
                %>

                <form action="student-card?do=student-card-update" method="post" class="newForm">
                    <h5 class="task-name">Edit student data</h5>
                    <p class="label">Name</p>
                    <%
                        out.println("<input value=\"" + name + "\" type=\"text\" name=\"studentName\" class=\"studentName\" placeholder=\"Insert name\" class=\"new-student\">");
                    %>
                    <p class="label">Surname</p>
                    <%
                        out.println("<input value=\"" + surname + "\" type=\"text\" name=\"studentSurname\" class=\"studentName\" placeholder=\"Insert surname\" class=\"new-student\">");
                    %>
                    <p class="label">Birthdate</p>
                    <%
                        out.println("<input value=\"" + birthdate + "\" type=\"date\" name=\"studentBirthdate\" class=\"studentName\" class=\"new-student\">");
                    %>

                    <select name="city">
                        <%
                            out.println("<option value=\"" + city + "\">" + city + "</option>");
                        %>
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
                    <a href="delete-student?id=<%out.println(id);%>&do=student-card-delete" class="btn btn-danger edit-btn">Delete student</a>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
