package kz.mun.decanat.servlets;

import kz.mun.decanat.db.DBManager;
import kz.mun.decanat.model.Country;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddCountry", value = "/add-country")
public class AddCountry extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Country country = new Country(
                null,
                request.getParameter("countryName"),
                request.getParameter("countryCode")
        );
        DBManager.addCountry(country);
        response.sendRedirect("/countries");
    }
}
