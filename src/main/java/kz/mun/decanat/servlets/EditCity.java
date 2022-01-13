package kz.mun.decanat.servlets;

import kz.mun.decanat.db.DBManager;
import kz.mun.decanat.model.City;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "EditCity", value = "/edit-city")
public class EditCity extends HttpServlet {
    Long id;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        id = Long.parseLong(request.getParameter("id"));
        request.setAttribute("city", DBManager.getCity(id));
        request.setAttribute("countries", DBManager.getAllCountries());
        request.getRequestDispatcher("/editCity.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        id = Long.parseLong(request.getParameter("id"));
        DBManager.updateCity(new City(
                id,
                request.getParameter("cityName"),
                request.getParameter("cityCode"),
                Long.parseLong(request.getParameter("countryId"))
        ));
        response.sendRedirect("/cities");
    }
}
