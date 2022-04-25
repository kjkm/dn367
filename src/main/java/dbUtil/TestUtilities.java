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
		
		//test for studySessionsOfClass
		ResultSet rs2 = dbObj.studySessionsOfClass(1, "CSCI", 144);
		while(rs2.next()) {
			System.out.println(rs2.getString(1) + " " + rs2.getString(2) + " " + rs2.getString(3));
		}
		
		dbObj.closeDB();
	}
}