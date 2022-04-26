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
		
		/**
		 * Cody Uehara - Takes in session ID, class subject, and class number and 
		 * returns the tutor's ID, session day, and session time
		 * @param sessionID The unique ID of a study session
		 * @param classSub 4 letters denoting the department of the class - ex: CSCI
		 * for computer science
		 * @param classNum unique number identifying the specific class of a department
		 * @return ResultSet filled with tutorID, sessionDay, and sessionTime
		 */
		public ResultSet getSessionsByClass(int sessionID, String classSub, int classNum){
		    ResultSet rset = null;
		    String sql = null;
		    
		    try {
		        //prepared statement with given parameters String classSub and int classNum
		        sql = "SELECT tutorID, sessionDay, sessionTime FROM STUDY_SESSION, CLASS_FOR "
		               + "WHERE CLASS_FOR.sessionID = STUDY_SESSION.sessionID and "
		               + "CLASS_FOR.sessionID = ? and classSub = ? and classNum = ?";
		        PreparedStatement pstmt = conn.prepareStatement(sql);
		        pstmt.clearParameters();
		        pstmt.setInt(1, sessionID);
		        pstmt.setString(2, classSub);
		        pstmt.setInt(3, classNum);
		        rset = pstmt.executeQuery();
		    } catch (SQLException e) {
		        System.out.println("sql: " + sql);
		        System.out.println("e.getMessage:" + e.getMessage());
		    }
		    return rset;
		}
		    
		 /** Cade Lilley - Takes in tutorID, sessionDay, sessionTime, duration, and
		 * location of a study session that is to be created.
		 * @param tutorID
		 * @param sessionDay
		 * @param sessionTime
		 * @param duration
		 * @param location
		 */
		public void createStudySession(int tutorID, String sessionDay, String sessionTime, float duration, String location) {
			String sql = null;
			
			try {
				sql = "INSERT INTO STUDY_SESSION (tutorID, sessionDay, sessionTime, duration, location) VALUES (?, ?, ?, ?, ?)";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.clearParameters();
				pstmt.setInt(1, tutorID);
				pstmt.setString(2, sessionDay);
				pstmt.setString(3, sessionTime);
				pstmt.setFloat(4, duration);
				pstmt.setString(5, location);
				pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("sql:" + sql);
				System.out.println("e.getMessage:" + e.getMessage());
			}
		}
		
		/**
		 * Cade Lilley - Takes in studentID and sessionID and removes the respective ATTENDS table instance
		 * @param studentID
		 * @param sessionID
		 */
		public void leaveStudySession(int studentID, int sessionID) {
			String sql = null;
			
			try {
				sql = "DELETE FROM ATTENDS WHERE studentID = ? and sessionID = ?";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.clearParameters();
				pstmt.setInt(1, studentID);
				pstmt.setInt(2, sessionID);
				pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("sql:" + sql);
				System.out.println("e.getMessage:" + e.getMessage());
			}
		}

		/**
		 * Charlie LeWarne - Takes in first and last name of student and gets all of the study sessions that student is a part of
		 * @param fname the first name of the requested student
		 * @param lname the last name of the requested student
		 * @return ResultSet that contains all the necessary information about the study session
		 */
		public ResultSet getSessionsByStudent(String fname, String lname){
			ResultSet output = null;
			String sql = "";
			try{
				sql = "SELECT STUDY_SESSION.sessionID, STUDY_SESSION.tutorID, STUDY_SESSION.sessionDay, STUDY_SESSION.sessionTime, STUDY_SESSION.duration, STUDY_SESSION.location FROM ATTENDS, STUDENT, STUDY_SESSION WHERE STUDENT.studentID=ATTENDS.studentID AND ATTENDS.sessionID=STUDY_SESSION.sessionID AND firstName=? and lastName=?";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.clearParameters();
				ps.setString(1, fname);
				ps.setString(2, lname);
				output = ps.executeQuery();
			}
			catch(SQLException e){
				System.out.println("Query failed");
				System.out.println("SQL: " + sql);
				System.out.println("Error message: " + e.getMessage());
			}
			return output;
		}
}