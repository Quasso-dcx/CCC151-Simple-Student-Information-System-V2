package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.swing.table.DefaultTableModel;

public class Data_Manager {
     private static Connection connect;
     private static DefaultTableModel courses_table_model;
     private static DefaultTableModel students_table_model;
     private static String[] course_column_names;
     private static String[] student_column_names;

     public Data_Manager() {
          createConnection("root", "rootPassword");
          getCoursesData(connect);
          getStudentsData(connect);
     }

     public static Connection getConnection() {
          return Data_Manager.connect;
     }

     /*
      * Create a connection to the database.
      */
     private void createConnection(String username, String password) {
          try {
               connect = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/ssis_database", username, password);
          } catch (SQLException e) {
               Logger.getLogger(Data_Manager.class.getName()).log(Level.SEVERE, null, e);
          }
     }

     private void getStudentsData(Connection connect) {
          try {
               PreparedStatement get_students_statement = connect.prepareStatement(
                         "SELECT * FROM students ORDER BY last_name ASC, first_name ASC, middle_name ASC;");
               ResultSet rs = get_students_statement.executeQuery();

               // get the column names
               student_column_names = new String[] { "Last Name", "First Name", "Middle Name", "ID Number",
                         "Year Level", "Gender", "Course Code" };

               // setup the table model
               students_table_model = new DefaultTableModel(0, 0) {
                    // prevent editing directly in the cell table
                    @Override
                    public boolean isCellEditable(int row, int column) {
                         return false;
                    }
               };
               students_table_model.setColumnIdentifiers(student_column_names);
               while (rs.next()) {
                    String last_name = rs.getString("last_name");
                    String first_name = rs.getString("first_name");
                    String middle_name = rs.getString("middle_name");
                    String id_number = rs.getString("id_number");
                    String year_level = rs.getString("year_level");
                    String gender = rs.getString("gender");
                    String course_code;

                    if (rs.getString("course_code") == null)
                         course_code = "N/A";
                    else
                         course_code = rs.getString("course_code");

                    students_table_model.addRow(new Object[] { last_name, first_name, middle_name, id_number,
                              year_level, gender, course_code });
               }
          } catch (SQLException e) {
               Logger.getLogger(Data_Manager.class.getName()).log(Level.SEVERE, null, e);
          }
     }

     public static DefaultTableModel getStudentsModel() {
          return students_table_model;
     }

     private void getCoursesData(Connection connect) {
          try {
               PreparedStatement get_students_statement = connect.prepareStatement("SELECT * FROM courses;");
               ResultSet rs = get_students_statement.executeQuery();

               // get the column names
               course_column_names = new String[] { "Course Code", "Course Name" };

               // setup the table and its model
               courses_table_model = new DefaultTableModel(0, 0) {
                    // prevent editing directly in the cell table
                    @Override
                    public boolean isCellEditable(int row, int column) {
                         return false;
                    }
               };
               courses_table_model.setColumnIdentifiers(course_column_names);

               while (rs.next()) {
                    String course_code = rs.getString("course_code");
                    String course_name = rs.getString("course_name");

                    courses_table_model.addRow(new Object[] { course_code, course_name });
               }
          } catch (SQLException e) {
               Logger.getLogger(Data_Manager.class.getName()).log(Level.SEVERE, null, e);
          }
     }

     public static DefaultTableModel getCoursesModel() {
          return courses_table_model;
     }
}
