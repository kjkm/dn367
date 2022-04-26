package dbUtil;

import java.sql.*;
import java.util.Scanner;

public class TestUtilities {
	static Utilities dbObj = new Utilities();
	static Scanner keyboard = new Scanner(System.in);
	
	public static void main(String[] args) throws SQLException {
		dbObj.openDB();
		
		ResultSet rs = dbObj.getTutorInfo("12345678");
		while (rs.next()) {
			System.out.println(rs.getString(1) + " " + rs.getString(2) + " " + rs.getString(3) + " " + rs.getString(4));
		}
		
		//test for sessionsByStudent
		System.out.print("Please input the desired first name of the student: ");
		String fnameSessionsByStudent = keyboard.nextLine();
		System.out.print("Please input the desired last name of the student: ");
		String lnameSessionsByStudent = keyboard.nextLine();
		ResultSet sessionsbyStudent = dbObj.getSessionsByStudent(fnameSessionsByStudent, lnameSessionsByStudent);
		while(sessionsbyStudent.next()){
			System.out.println(sessionsbyStudent.getInt(1) + " " + sessionsbyStudent.getString(2) + " " + sessionsbyStudent.getString(3)  + " " + sessionsbyStudent.getString(4)  + " " + sessionsbyStudent.getString(5)  + " " + sessionsbyStudent.getString(6));
		}
		
		//test for studySessionsOfClass
		ResultSet rs2 = dbObj.getSessionsByClass(1, "CSCI", 144);
		while(rs2.next()) {
			System.out.println(rs2.getString(1) + " " + rs2.getString(2) + " " + rs2.getString(3));
		}
		
		dbObj.closeDB();
	}

}