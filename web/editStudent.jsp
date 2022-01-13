<%@ page import="kz.mun.decanat.model.Student" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="kz.mun.decanat.model.Country" %>
<%@ page import="kz.mun.decanat.model.City" %>
<%@ page import="kz.mun.decanat.db.DBManager" %><%--
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
                    <input type="date" value="<%=student.getBirthdate()%>" name="studentBirthdate">
                    <p class="label">Country</p>
                    <select name="country">
                        <option value="<%=student.getCountry_id()%>"><%=DBManager.getCountryByStudentId(student.getId())%></option>
                        <%
                            ArrayList<Country> countries = (ArrayList<Country>) request.getAttribute("countries");
                            for (Country country : countries) {
                        %>
                        <option value="<%=country.getId()%>"><%=country.getName()%></option>
                        <%
                            }
                        %>
                    </select>
                    <p class="label">City</p>
                    <select name="city">
                        <option value="<%=student.getCity_id()%>"><%=DBManager.getCityByStudentId(student.getId())%></option>
                        <%
                            ArrayList<City> cities = (ArrayList<City>) request.getAttribute("cities");
                            for (City city : cities) {
                        %>
                        <option value="<%=city.getId()%>"><%=city.getName()%></option>
                        <%
                            }
                        %>
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
