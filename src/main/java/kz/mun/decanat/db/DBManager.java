package kz.mun.decanat.db;

import kz.mun.decanat.model.City;
import kz.mun.decanat.model.Country;
import kz.mun.decanat.model.Student;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DBManager {
    public static Connection conn;

    public static void connectToDb() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/decanat?useUnicode=true&serverTimezone=UTC", "root", "");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static ArrayList<Student> getAllStudents() {
        ArrayList<Student> students = new ArrayList<>();
        try {
            PreparedStatement st = conn.prepareStatement("select * from students");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Long id = rs.getLong("id");
                String studentName = rs.getString("name");
                String studentSurname = rs.getString("surname");
                String studentBD = rs.getString("birthdate");
                Long countryId = rs.getLong("country_id");
                Long cityId = rs.getLong("city_id");
                students.add(new Student(id, studentName, studentSurname, studentBD, countryId, cityId));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return students;
    }

    public static void addStudent(Student student) {
        try {
            PreparedStatement st = conn.prepareStatement("insert into students values(null,?,?,?,?,?)");
            st.setString(1, student.getName());
            st.setString(2, student.getSurname());
            st.setString(3, student.getBirthdate());
            st.setLong(4, student.getCountry_id());
            st.setLong(5, student.getCity_id());
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Student getStudent(Long id) {
        Student student = new Student();
        try {
            PreparedStatement st = conn.prepareStatement("select * from students where id = ?");
            st.setLong(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String studentName = rs.getString("name");
                String studentSurname = rs.getString("surname");
                String studentBD = rs.getString("birthdate");
                Long countryId = rs.getLong("country_id");
                Long cityId = rs.getLong("city_id");
                student = new Student(id, studentName, studentSurname, studentBD, countryId, cityId);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return student;
    }

    public static void updateStudent(Student student) {
        try {
            PreparedStatement st = conn.prepareStatement(
                    "update students set name = ?, surname = ?, birthdate = ?, country_id = ?, city_id = ? where id = ?");
            st.setString(1, student.getName());
            st.setString(2, student.getSurname());
            st.setString(3, student.getBirthdate());
            st.setLong(4, student.getCountry_id());
            st.setLong(5, student.getCity_id());
            st.setLong(6, student.getId());
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void deleteStudent(Long id) {
        try {
            PreparedStatement st = conn.prepareStatement("delete from students where id = ?");
            st.setLong(1, id);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static List<Country> getAllCountries() {
        List<Country> countries = new ArrayList<>();
        try {
            PreparedStatement statement = conn.prepareStatement("select * from countries");
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                countries.add(new Country(
                        result.getLong("id"),
                        result.getString("name"),
                        result.getString("code"))
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return countries;
    }

    public static void addCountry(Country country) {
        try {
            PreparedStatement statement = conn.prepareStatement("insert into countries values (null, ?, ?)");
            statement.setString(1, country.getName());
            statement.setString(2, country.getCode());
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Country getCountryById(Long id) {
        Country country = new Country();
        try {
            PreparedStatement statement = conn.prepareStatement("select * from countries where id = ?");
            statement.setLong(1, id);
            ResultSet result = statement.executeQuery();
            if (result.next()) {
                country = new Country(
                        result.getLong("id"),
                        result.getString("name"),
                        result.getString("code")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return country;
    }

    public static void updateCountry(Country country) {
        try {
            PreparedStatement statement = conn.prepareStatement("update countries set name = ?, code = ? where id = ?");
            statement.setString(1, country.getName());
            statement.setString(2, country.getCode());
            statement.setLong(3, country.getId());
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void deleteCountry(Long id) {
        try {
            PreparedStatement statement = conn.prepareStatement("delete from countries where id = ?");
            statement.setLong(1, id);
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static List<City> getAllCities() {
        List<City> cities = new ArrayList<>();
        try {
            PreparedStatement st = conn.prepareStatement("select * from cities");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                cities.add(new City(
                        rs.getLong("id"),
                        rs.getString("name"),
                        rs.getString("code"),
                        rs.getLong("country_id")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cities;
    }

    public static void addCity(City city) {
        try {
            PreparedStatement st = conn.prepareStatement("insert into cities values(null, ?, ?, ?)");
            st.setString(1, city.getName());
            st.setString(2, city.getCode());
            st.setLong(3, city.getCountryId());
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static City getCity(Long id) {
        City city = new City();
        try {
            PreparedStatement st = conn.prepareStatement("select * from cities where id = ?");
            st.setLong(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                city = new City(
                        id,
                        rs.getString("name"),
                        rs.getString("code"),
                        rs.getLong("country_id")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return city;
    }

    public static void updateCity(City city) {
        try {
            PreparedStatement st = conn.prepareStatement("update cities set name = ?, code = ?, country_id = ? where id = ?");
            st.setString(1, city.getName());
            st.setString(2, city.getCode());
            st.setLong(3, city.getCountryId());
            st.setLong(4, city.getId());
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void deleteCity(long id) {
        try {
            PreparedStatement st = conn.prepareStatement("delete from cities where id = ?");
            st.setLong(1, id);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static String getCountryByCityId(Long id) {
        String countryName = null;
        try {
            PreparedStatement statement = conn.prepareStatement(
                    "select countries.name from cities join countries on (cities.country_id = countries.id) where cities.id = ?"
            );
            statement.setLong(1, id);
            ResultSet result = statement.executeQuery();
            if (result.next()) {
                countryName = result.getString("name");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return countryName;
    }

    public static String getCountryByStudentId(Long id) {
        String country = null;
        try {
            PreparedStatement statement = conn.prepareStatement(
                    "select c.name from students s join countries c on (s.country_id = c.id) where s.id = ?"
            );
            statement.setLong(1, id);
            ResultSet result = statement.executeQuery();
            if (result.next()) {
                country = result.getString("name");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return country;
    }

    public static String getCityByStudentId(Long id) {
        String city = null;
        try {
            PreparedStatement statement = conn.prepareStatement(
                    "select c.name from students s join cities c on (s.city_id = c.id) where s.id = ?"
            );
            statement.setLong(1, id);
            ResultSet result = statement.executeQuery();
            if (result.next()) {
                city = result.getString("name");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return city;
    }

    public static List<City> getCitiesByCountryId(Long id) {
        List<City> cities = new ArrayList<>();
        try {
            PreparedStatement statement = conn.prepareStatement("select * from cities where country_id = ?");
            statement.setLong(1, id);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                cities.add(new City(
                        result.getLong("id"),
                        result.getString("name"),
                        result.getString("code"),
                        id
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cities;
    }
}
