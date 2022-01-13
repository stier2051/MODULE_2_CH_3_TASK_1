<%@ page import="java.util.ArrayList" %>
<%@ page import="kz.mun.decanat.model.Country" %>
<%@ page import="kz.mun.decanat.model.City" %><%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 17.10.2021
  Time: 22:26
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
                <form action="/add-student" method="post" class="newForm">
                    <h5 class="add-student p-3 text-white">Add new student</h5>
                    <p class="label">Name</p>
                    <input type="text" name="studentName" class="studentName" placeholder="Insert name" class="new-student">
                    <p class="label">Surname</p>
                    <input type="text" name="studentSurname" class="studentName" placeholder="Insert surname" class="new-student">
                    <p class="label">Birthdate</p>
                    <input type="date" name="studentBirthdate" class="studentName" class="new-student">
                    <p class="label">Country</p>
                    <select name="country">
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
                        <%
                            ArrayList<City> cities = (ArrayList<City>) request.getAttribute("cities");
                            for (City city : cities) {
                        %>
                        <option value="<%=city.getId()%>"><%=city.getName()%></option>
                        <%
                            }
                        %>
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
