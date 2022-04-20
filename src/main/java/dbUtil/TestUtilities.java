package dbUtil;

import java.sql.*;
import java.util.Scanner;

public class TestUtilities {
	static Utilities dbObj = new Utilities();
	static Scanner keyboard = new Scanner(System.in);
	
	public static void main(String[] args) throws SQLException {
		dbObj.openDB();
		dbObj.closeDB();
	}
}