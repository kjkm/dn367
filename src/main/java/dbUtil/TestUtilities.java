package dbUtil;

import java.sql.*;
import java.util.Scanner;

public class TestUtilities {
	static Utilities dbObj = new Utilities();
	static Scanner keyboard = new Scanner(System.in);
	
	public static void main(String[] args) throws SQLException {
		int choice;
		String choiceInp;
		boolean done = false;
		
		while(!done) {
			System.out.println();
			System.out.println("Choose a method to test: \n");
			System.out.println("1) Open the database");
			System.out.println("2) List all study sessions for a class");
			System.out.println("3) List all information for a tutor");
			System.out.println("4) Create a new study session");
			System.out.println("5) Leave a study session");
			System.out.println("6) Find all study sessions a student is a part of");
			System.out.println("7) Change study session location");
			System.out.println("8) Quit and close database");
			choiceInp = keyboard.nextLine();
			choice = Integer.parseInt(choiceInp);
			if(choice > 8 || choice < 1) {
				System.out.println("Please input a valid choice");
				continue;
			}
			switch(choice) {
			case 1: {
				dbObj.openDB();
				break;
			}
			case 2: {
				studySessionsByClass();
				break;
			}
			case 3: {
				tutorInfo();
				break;
			}
			case 4: {
				createNewStudySession();
				break;
			}
			case 5: {
				leaveStudySession();
				break;
			}
			case 6: {
				findSessionsByStudent();
				break;
			}
			case 7: {
				changeSessionLocation();
				break;
			}
			case 8: {
				dbObj.closeDB();
				done = true;
				break;
			}
			}
			
		}
	}
	static void studySessionsByClass() throws SQLException {
		System.out.print("Please input class subject: ");
		String classSub = keyboard.nextLine();
		System.out.print("Please input class number: ");
		String input = keyboard.nextLine();
		int classNum = Integer.parseInt(input);
						
		ResultSet sessionByClass = dbObj.getSessionsByClass(classSub, classNum);
		while(sessionByClass.next()) {
			System.out.println(sessionByClass.getString(1) + " " + sessionByClass.getString(2) + " " + sessionByClass.getString(3) + " " + sessionByClass.getString(4) + " " + sessionByClass.getString(5));
		}	
	}
	
	static void tutorInfo() throws SQLException {
		System.out.print("Please input the desired tutor ID: ");
		String tutorID = keyboard.nextLine();
		ResultSet rs = dbObj.getTutorInfo(tutorID);
		while (rs.next()) {
			System.out.println(rs.getString(1) + " " + rs.getString(2) + " " + rs.getString(3) + " " + rs.getString(4));
		}
	}
	
	static void createNewStudySession() throws SQLException {
		//test for createStudySession (Cade)
		// Tutor ID is of type int(8)
		System.out.print("Please input tutor ID: ");
		String tutorIDInput = keyboard.next();
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
	}
	static void leaveStudySession() throws SQLException {
		//test for leaveStudySession
		System.out.print("Please input student ID: ");
		String studentIDInput = keyboard.nextLine();
		int sID = Integer.parseInt(studentIDInput);
		
		System.out.print("Please input session ID: ");
		String sessionIDInput = keyboard.nextLine();
		int seshID = Integer.parseInt(sessionIDInput);
		
		dbObj.leaveStudySession(sID, seshID);
	}
	static void findSessionsByStudent() throws SQLException {
		//test for sessionsByStudent
		System.out.print("Please input the desired first name of the student: ");
		String fnameSessionsByStudent = keyboard.nextLine();
		System.out.print("Please input the desired last name of the student: ");
		String lnameSessionsByStudent = keyboard.nextLine();
		ResultSet sessionsbyStudent = dbObj.getSessionsByStudent(fnameSessionsByStudent, lnameSessionsByStudent);
		while(sessionsbyStudent.next()){
			System.out.println(sessionsbyStudent.getInt(1) + " " + sessionsbyStudent.getString(2) + " " + sessionsbyStudent.getString(3)  + " " + sessionsbyStudent.getString(4)  + " " + sessionsbyStudent.getString(5)  + " " + sessionsbyStudent.getString(6));
		}
	}
	
	static void changeSessionLocation() throws SQLException {
		//test for changeSessionLocation
		System.out.println("Please input session ID: ");
		int testID = keyboard.nextInt();
		keyboard.nextLine();
		System.out.println("Please input new session location: ");
		String locationInput = keyboard.nextLine();

		dbObj.changeSessionLocation(testID, locationInput);
	}
	
//	static void studySessionsByClass() throws SQLException {
//		System.out.print("Please input session ID: ");
//		int sessionID = keyboard.nextInt();
//		System.out.print("Please input class subject: ");
//		String classSub = keyboard.next();
//		System.out.print("Please input class number: ");
//		int classNum = keyboard.nextInt();
//		//int classNum = Integer.parseInt(input);
//						
//		ResultSet sessionByClass = dbObj.getSessionsByClass(sessionID, classSub, classNum);
//		while(sessionByClass.next()) {
//			System.out.println(sessionByClass.getString(1) + " " + sessionByClass.getString(2) + " " + sessionByClass.getString(3) + " " + sessionByClass.getString(4) + " " + sessionByClass.getString(5));
//		}	
//	}

}