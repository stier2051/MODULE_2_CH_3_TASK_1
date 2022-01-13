<%@ page import="java.util.ArrayList" %>
<%@ page import="kz.mun.decanat.model.Country" %>
<%@ page import="kz.mun.decanat.model.City" %>
<%@ page import="kz.mun.decanat.db.DBManager" %><%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 13.01.2022
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
                <a href="add-student" class="btn btn-primary add-student" data-bs-toggle="modal" data-bs-target="#addNewCity">+ New city</a>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-6">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">NAME</th>
                    <th scope="col">CODE</th>
                    <th scope="col">COUNTRY</th>
                    <th scope="col"></th>
                </tr>
                </thead>
                <tbody>
                <%
                    ArrayList<City> cities = (ArrayList<City>) request.getAttribute("cities");
                    for (City city : cities) {
                %>
                <tr>
                    <th scope="row"><%=city.getId()%></th>
                    <td><%=city.getName()%></td>
                    <td><%=city.getCode()%></td>
                    <td><%=DBManager.getCountryByCityId(city.getId())%></td>
                    <td class="text-center"><a href="/edit-city?id=<%=city.getId()%>" class="btn btn-primary details">Edit</a></td>
                    <td class="text-center"><a href="/delete-city?id=<%=city.getId()%>" class="btn btn-primary details">Delete</a></td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="addNewCity">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add new city</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="/add-city" method="post">
                        <div class="mb-3">
                            <label for="cityName" class="form-label">Name</label>
                            <input type="text" name="cityName" class="form-control" id="cityName">
                        </div>
                        <div class="mb-3">
                            <label for="cityCode" class="form-label">Code</label>
                            <input type="text" name="cityCode" class="form-control" id="cityCode">
                        </div>
                        <div class="mb-3">
                            <label for="countryId" class="form-label">Country</label>
                            <select name="countryId" id="countryId">
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
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Add city</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
