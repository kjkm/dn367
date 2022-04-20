package dbUtil;

import java.sql.*;

public class Utilities {
	
	// Connection object
		private Connection conn = null; 
		 
		/**
		 * @return the conn
		 */
		public Connection getConn() {
			return conn;
		}

		/**
		 * Open a MariaDB DB connection where user name and password are predefined
		 * (hardwired).
		 */
		public void openDB() {

			// Connect to the database using your team user name and team password	
			String url = "jdbc:mariadb://localhost:2000/dn367_2022";
//			String url = "jdbc:mariadb://mal.cs.plu.edu:3306/company367_2022";
			String user = "dn367";
			String password = "dn367";
			try {
				conn = DriverManager.getConnection(url, user, password);
				System.out.println("Succesfully connected!");
			} catch (SQLException e) {
				System.out.println("using url:"+url + " user:"+user + " password:*****");
				System.out.println("problem connecting to MariaDB: "+ e.getMessage());
				e.printStackTrace();
			}

		}// openDB

		/**
		 * Close the connection to the DB
		 */
		public void closeDB() {
			try {
				conn.close();
				conn = null;
				System.out.println("Database has been closed.");
			} catch (SQLException e) {
				System.err.println("Failed to close database connection: " + e);
			}
		}// closeDB
		
		/**
		 * Adrian Ronquillo - Takes in a studentId, and returns the information 
		 * for a tutor (Student ID, first name, lsat name, classes, subjects)
		 * @param studentId The student ID to query the database
		 */
		public ResultSet getTutorInfo(String studentID) {
			ResultSet rset = null;
			String sql = null;

			try {
				// create a Statement and an SQL string for the statement
				sql = "SELECT CONCAT(firstName, ' ', lastName) name, studentID, classNumber, "
						+ "classSubject FROM STUDENT, TUTORS_CLASS WHERE isTutor = 1 AND "
						+ "tutorID = studentID AND studentID = ?;";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.clearParameters();
				pstmt.setString(1, studentID); // set the 1 parameter
				rset = pstmt.executeQuery();
			} catch (SQLException e) {
				System.out.println("sql:" + sql);
				System.out.println("e.getMessage:" + e.getMessage());
			}

			return rset;
		}
	
}