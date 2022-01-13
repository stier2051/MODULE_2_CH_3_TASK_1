package kz.mun.decanat.servlets;

import kz.mun.decanat.db.DBManager;
import kz.mun.decanat.model.Student;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "student-card", value = "/student-card")
public class StudentCard extends HttpServlet {

    Long id;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        id = Long.parseLong(request.getParameter("id"));
        request.setAttribute("student", DBManager.getStudent(id));
        request.setAttribute("countries", DBManager.getAllCountries());
        request.setAttribute("cities", DBManager.getAllCities());
        if (request.getParameter("do").equals("student-card-edit")) {
            request.getRequestDispatcher("/editStudent.jsp").forward(request, response);
        } else if (request.getParameter("do").equals("student-card-view")){
            request.getRequestDispatcher("/studentCard.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        Student student = new Student(
                id,
                request.getParameter("studentName"),
                request.getParameter("studentSurname"),
                request.getParameter("studentBirthdate"),
                Long.parseLong(request.getParameter("country")),
                Long.parseLong(request.getParameter("city")));
        DBManager.updateStudent(student);
        response.sendRedirect("/main");
    }
}
