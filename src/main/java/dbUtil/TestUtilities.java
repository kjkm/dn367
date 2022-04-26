package dbUtil;

import java.sql.*;
import java.util.Scanner;

public class TestUtilities {
	static Utilities dbObj = new Utilities();
	static Scanner keyboard = new Scanner(System.in);
	
	public static void main(String[] args) throws SQLException {
		dbObj.openDB();
		
		//test for createStudySession (Cade)
		
		// Tutor ID is of type int(8)
		System.out.print("Please input tutor ID: ");
		String tutorIDInput = keyboard.nextLine();
		int tutorID = Integer.parseInt(tutorIDInput);
		
		// Can be 'MONDAY','TUESDAY','WEDNESDAY','THURSDAY','FRIDAY'
		System.out.print("Please input session day: ");
		String sessionDay = keyboard.nextLine();
		
		// Can be '900','930','1000','1030','1100','1130','1200','1230','1300','1330','1400','1430','1500','1530','1600','1630','1700','1730','1800','1830','1900','1930','2000'
		System.out.print("Please input session time: ");
		String sessionTime = keyboard.nextLine();
		
		// Duration is a float
		System.out.print("Please input duration: ");
		String durationInput = keyboard.nextLine();
		float duration = Float.parseFloat(durationInput);
		
		System.out.print("Please input location: ");
		String location = keyboard.nextLine();
		
		dbObj.createStudySession(tutorID, sessionDay, sessionTime, duration, location);
		
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
		System.out.print("Please input session ID: ");
		String input = keyboard.nextLine();
		int sessionID = Integer.parseInt(input);
		System.out.print("Please input class subject: ");
		String classSub = keyboard.nextLine();
		System.out.print("Please input class number: ");
		input = keyboard.nextLine();
		int classNum = Integer.parseInt(input);
						
		ResultSet sessionByClass = dbObj.getSessionsByClass(sessionID, classSub, classNum);
		while(sessionByClass.next()) {
			System.out.println(sessionByClass.getString(1) + " " + sessionByClass.getString(2) + " " + sessionByClass.getString(3));
		}
		
		//test for leaveStudySession
		
		
		dbObj.closeDB();
	}

}