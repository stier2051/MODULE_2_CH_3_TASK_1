package kz.mun.decanat.servlets;

import kz.mun.decanat.db.DBManager;
import kz.mun.decanat.model.Student;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "add-student", value = "/add-student")
public class AddStudent extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("countries", DBManager.getAllCountries());
        request.setAttribute("cities", DBManager.getAllCities());
        request.getRequestDispatcher("/addStudent.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        Student newStudent = new Student(
                null,
                request.getParameter("studentName"),
                request.getParameter("studentSurname"),
                request.getParameter("studentBirthdate"),
                Long.parseLong(request.getParameter("country")),
                Long.parseLong(request.getParameter("city"))
        );
        DBManager.addStudent(newStudent);
        response.sendRedirect("/main");
    }
}
