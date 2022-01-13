package kz.mun.decanat.db;

import kz.mun.decanat.model.City;
import kz.mun.decanat.model.Student;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DBManager {
    public static Connection conn;

    public static void connectToDb() {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/decanat?useUnicode=true&serverTimezone=UTC", "root", "");
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static ArrayList<Student> getAllStudents() {
        ArrayList<Student> students = new ArrayList<>();
        try{
            PreparedStatement st = conn.prepareStatement("select * from students");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Long id = rs.getLong("id");
                String studentName = rs.getString("name");
                String studentSurname = rs.getString("surname");
                String studentBD = rs.getString("birthdate");
                String city = rs.getString("city");
                students.add(new Student(id, studentName, studentSurname, studentBD, city));
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return students;
    }

    public static void addStudent(Student student) {
        try{
            PreparedStatement st = conn.prepareStatement("insert into students(name, surname, birthdate, city) value(?,?,?,?)");
            st.setString(1, student.getName());
            st.setString(2, student.getSurname());
            st.setString(3, student.getBirthdate());
            st.setString(4, student.getCity());
            st.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static Student getStudent(Long id) {
        Student student = new Student();
        try{
            PreparedStatement st = conn.prepareStatement("select * from students where id = ?");
            st.setLong(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String studentName = rs.getString("name");
                String studentSurname = rs.getString("surname");
                String studentBD = rs.getString("birthdate");
                String city = rs.getString("city");
                student = new Student(id, studentName, studentSurname, studentBD, city);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return student;
    }

    public static void updateStudent(Student student) {
        try{
            PreparedStatement st = conn.prepareStatement("update students set name = ?, surname = ?, birthdate = ?, city = ? where id = ?");
            st.setString(1, student.getName());
            st.setString(2, student.getSurname());
            st.setString(3, student.getBirthdate());
            st.setString(4, student.getCity());
            st.setLong(5, student.getId());
            st.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void deleteStudent(Long id) {
        try{
            PreparedStatement st = conn.prepareStatement("delete from students where id = ?");
            st.setLong(1, id);
            st.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static ArrayList<City> getAllCities() {
        ArrayList<City> cities = new ArrayList<>();
        try{
            PreparedStatement st = conn.prepareStatement("select * from cities");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                long id = rs.getLong("id");
                String cityName = rs.getString("name");
                String cityCode = rs.getString("code");
                cities.add(new City(id, cityName, cityCode));
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return cities;
    }

    public static void addCity(City city) {
        try{
            PreparedStatement st = conn.prepareStatement("insert into cities(name, code) value(?,?)");
            st.setString(1, city.getName());
            st.setString(2, city.getCode());
            st.executeUpdate();
            System.out.println("City successfully added");
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static City getCity(long id) {
        City city = new City();
        try{
            PreparedStatement st = conn.prepareStatement("select * from cities where id = ?");
            st.setLong(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String cityName = rs.getString("name");
                String cityCode = rs.getString("code");
                city = new City(cityName, cityCode);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return city;
    }

    public static void updateCity(City city) {
        try{
            PreparedStatement st = conn.prepareStatement("update cities set name = ?, code = ? where id = ?");
            st.setString(1, city.getName());
            st.setString(2, city.getCode());
            st.setLong(3, city.getId());
            st.executeUpdate();
            System.out.println("City successfully updated");
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void deleteCity(long id) {
        try{
            PreparedStatement st = conn.prepareStatement("delete from cities where id = ?");
            st.setLong(1, id);
            st.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
