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
        request.getRequestDispatcher("/addStudent.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String studentName = request.getParameter("studentName");
        String studentSurname = request.getParameter("studentSurname");
        String studentBD = request.getParameter("studentBirthdate");
        String city = request.getParameter("city");

        Student newStudent = new Student(null, studentName, studentSurname, studentBD, city);
        DBManager.addStudent(newStudent);
        response.sendRedirect("/main");
    }
}
