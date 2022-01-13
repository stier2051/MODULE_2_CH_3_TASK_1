package kz.mun.decanat.servlets;

import kz.mun.decanat.db.DBManager;
import kz.mun.decanat.model.City;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddCity", value = "/add-city")
public class AddCity extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        City city = new City(
                null,
                request.getParameter("cityName"),
                request.getParameter("cityCode"),
                Long.parseLong(request.getParameter("countryId"))
        );
        DBManager.addCity(city);
        response.sendRedirect("/cities");
    }
}
