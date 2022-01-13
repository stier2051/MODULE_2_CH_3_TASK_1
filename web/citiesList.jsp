<%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 20.10.2021
  Time: 20:09
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
    <title>Document</title>
</head>
<body>
<div class="container">
   <%@ include file="header.html"%>
    <div class="add">
        <div class="row">
            <div class="col">
                <a href="new-task" class="btn btn-primary add-task">+ New city</a>
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
                        <th scope="col">CODE</th>
                        <th scope="col" class="text-end">DETAILS</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th scope="row">1</th>
                        <td>Almaty</td>
                        <td>ALA</td>
                        <td class="text-end"><a href="#" class="btn btn-primary detail">Detail</a></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>