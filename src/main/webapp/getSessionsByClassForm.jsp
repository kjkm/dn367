<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="myUtil" class="dbUtil.Utilities" scope="session"></jsp:useBean>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>

<html>
<body>

<h1>List Sessions By Class Subject and Number</h1>

<form action="getSessionsByClassHandler.jsp" method="get">
Please input the class subject and number: <br>
<label for="classSub">Class Subject</label>
<input type = "text" id="classSub" name="classSub" value="" required><br>
<label for="classNum">Class Number</label>
<input type="text" id="classNum" name="classNum" value="" required><br>
<input type="submit" value="Submit">
</form>
</body>
</html>