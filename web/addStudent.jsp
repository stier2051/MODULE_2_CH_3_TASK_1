<%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 17.10.2021
  Time: 22:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@include file="head.jsp"%>>
<body>
<div class="container">
    <%@ include file="header.html"%>
    <div class="students">
        <div class="row">
            <div class="col">
                <form action="/add-student" method="post" class="newForm">
                    <h5 class="add-student p-3 text-white">Add new student</h5>
                    <p class="label">Name</p>
                    <input type="text" name="studentName" class="studentName" placeholder="Insert name" class="new-student">
                    <p class="label">Surname</p>
                    <input type="text" name="studentSurname" class="studentName" placeholder="Insert surname" class="new-student">
                    <p class="label">Birthdate</p>
                    <input type="date" name="studentBirthdate" class="studentName" class="new-student">
                    <select name="city">
                        <option value="Almaty">Almaty</option>
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
                    <button type="submit" class="btn btn-primary submit-btn">Add student</button>
                    <a href="main" class="btn btn-primary submit-btn">Cancel</a>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
