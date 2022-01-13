<%@ page import="kz.mun.decanat.model.Student" %>
<%@ page import="kz.mun.decanat.model.Country" %>
<%@ page import="kz.mun.decanat.model.City" %>
<%@ page import="java.util.ArrayList" %>
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
    <div class="row">
        <div class="col-lg-5 m-auto mt-5">

            <%
                City city = (City) request.getAttribute("city");
            %>

            <form action="/edit-city?id=<%=city.getId()%>" method="post" class="newForm">
                <h5 class="task-name">Edit city</h5>
                <p class="label">Name</p>
                <input type="text" value="<%=city.getName()%>" name="cityName">
                <p class="label">Code</p>
                <input type="text" value="<%=city.getCode()%>" name="cityCode">
                <div class="mb-3">
                    <label for="countryId" class="form-label">Country</label>
                    <select name="countryId" id="countryId">
                        <option value="<%=city.getCountryId()%>"><%=DBManager.getCountryByCityId(city.getId())%></option>
                        <%
                            ArrayList<Country> countries = (ArrayList<Country>) request.getAttribute("countries");
                            for (Country country : countries) {
                        %>
                        <option value="<%=country.getId()%>"><%=country.getName()%></option>
                        <%
                            }
                        %>
                    </select>
                </div>
                <a href="/cities" class="btn btn-secondary edit-btn">Back</a>
                <button type="submit" class="btn btn-success edit-btn">Save city</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
