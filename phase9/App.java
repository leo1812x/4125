package phase9;

import java.sql.*;

public class App {

    //*method to connect to Database */
    private static Connection connectToDatabase() throws SQLException, ClassNotFoundException {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        return DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:Oracle21c", "llopez4", "sql1812");
    }

    //*method to generate the reportcard */
    public static void generateReportCard(String p_emp_id) {
        String empName = "";
        double totalGpa = 0;
        int coursesCount = 0;

        try (Connection c = connectToDatabase()) {
            //* Get employee name
            PreparedStatement ps = c.prepareStatement("SELECT NAME_ FROM EMPLOYEE_ WHERE ID_ = ?");
            ps.setString(1, p_emp_id);
            ResultSet rs = ps.executeQuery();

            if (!rs.next()) {
                System.out.println("Employee with ID " + p_emp_id + " does not exist.");
                return;
            }
            empName = rs.getString("NAME_");

            //* Get courses and grades
            ps = c.prepareStatement("SELECT c.ID_, c.NAME_, ec.GRADE FROM COURSE_ c JOIN ENROLLMENT_ ec ON c.ID_ = ec.COURSEID WHERE ec.EMPLOYEEID = ?");
            ps.setString(1, p_emp_id);
            rs = ps.executeQuery();

            if (!rs.isBeforeFirst()) {
                System.out.println("No report card to generate for Employee ID: " + p_emp_id);
                return;
            }

            System.out.println("Report Card for Employee: " + p_emp_id + " - " + empName);
            System.out.println("Courses Taken:");

            //*For each class loop */
            while (rs.next()) {
                String course_id = rs.getString("ID_");
                String course_name = rs.getString("NAME_");
                String grade = rs.getString("GRADE");
                System.out.println("Course ID: " + course_id + ", Name: " + course_name + ", Grade: " + grade);

                //* deal with grades */
                switch (grade) {
                    case "A": totalGpa += 4; break;
                    case "B": totalGpa += 3; break;
                    case "C": totalGpa += 2; break;
                    case "D": totalGpa += 1; break;
                }
                coursesCount++;
            }

            if (coursesCount > 0) {
                double avgGpa = totalGpa / coursesCount;
                System.out.printf("Average GPA: %.2f%n", avgGpa);
            } else {
                System.out.println("No report card to generate!");
                return;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("A SQL error occurred: " + e.getMessage());
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("Could not find the Oracle JDBC driver.");
        }
    }

    public static void main(String[] args) {
        generateReportCard("E001"); 
    }
}

