import db.DBManager;
import model.Student;

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
        System.out.println(id);

        DBManager.connectToDb();
        Student editStudent = DBManager.getStudent(id);


        String studentName = editStudent.getName();
        System.out.println(studentName);
        String studentSurname = editStudent.getSurname();
        String studentBD = editStudent.getBirthdate();
        String city = editStudent.getCity();

        request.setAttribute("id", id.toString());
        request.setAttribute("name", studentName);
        request.setAttribute("surname", studentSurname);
        request.setAttribute("birthdate", studentBD);
        request.setAttribute("city", city);

        if (request.getParameter("do").equals("student-card-edit")) {
            System.out.println("update");
            request.getRequestDispatcher("/editStudent.jsp").forward(request, response);
        } else if (request.getParameter("do").equals("student-card-view")){
            request.getRequestDispatcher("/studentCard.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String studentName = request.getParameter("studentName");
        String studentSurname = request.getParameter("studentSurname");
        String studentBD = request.getParameter("studentBirthdate");
        String city = request.getParameter("city");

        DBManager.connectToDb();
        DBManager.updateStudent(id, studentName, studentSurname, studentBD,city);
        request.setAttribute("students", DBManager.getAllStudents());
        request. getRequestDispatcher("/studentList.jsp").forward(request, response);
    }
}
