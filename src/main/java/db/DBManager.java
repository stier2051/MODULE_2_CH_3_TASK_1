package db;

import model.Student;

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
            System.out.println("CONNECTED SUCCESSFULLY");
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

    public static void addStudent(String name, String surname, String birthdate, String city) {
        try{
            PreparedStatement st = conn.prepareStatement("insert into students(name, surname, birthdate, city) value(?,?,?,?)");
            st.setString(1, name);
            st.setString(2, surname);
            st.setString(3, birthdate);
            st.setString(4, city);
            st.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
        System.out.println("Student successfully added");
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
                student = new Student(studentName, studentSurname, studentBD, city);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return student;
    }

    public static void updateStudent(Long id, String name, String surname, String birthdate, String city) {
        try{
            PreparedStatement st = conn.prepareStatement("update students set name = ?, surname = ?, birthdate = ?, city = ? where id = ?");
            st.setString(1, name);
            st.setString(2, surname);
            st.setString(3, birthdate);
            st.setString(4, city);
            st.setLong(5, id);
            st.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
        System.out.println("Student successfully updated");
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
}
