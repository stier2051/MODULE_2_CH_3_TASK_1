package kz.mun.decanat.servlets;

import kz.mun.decanat.db.DBManager;
import kz.mun.decanat.model.Country;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "EditCountry", value = "/edit-country")
public class EditCountry extends HttpServlet {
    Long id;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        id = Long.parseLong(request.getParameter("id"));
        request.setAttribute("country", DBManager.getCountryById(id));
        request.getRequestDispatcher("/editCountry.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        id = Long.parseLong(request.getParameter("id"));
        Country country = new Country(
                id,
                request.getParameter("countryName"),
                request.getParameter("countryCode")
        );
        DBManager.updateCountry(country);
        response.sendRedirect("/countries");
    }
}
