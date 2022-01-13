package kz.mun.decanat.servlets;

import kz.mun.decanat.db.DBManager;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Cities", value = "/cities")
public class Cities extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("cities", DBManager.getAllCities());
        request.setAttribute("countries", DBManager.getAllCountries());
        request.getRequestDispatcher("/citiesList.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
