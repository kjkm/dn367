<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<jsp:useBean id="myUtil" class="dbUtil.Utilities" scope="session"></jsp:useBean>
<%@ page import="java.sql.*" %> <%@ page import="java.util.*" %>

<!DOCTYPE html>
<%@ include file="meta.jsp" %>
<html>
  <%@ include file="nav.jsp" %>
  <body>
    <form action="loginHandler.jsp" method="get">
	    <div class="input">
	      <label for="studentID">Student ID</label>
	      <input type="text" required name="studentID"/>
	    </div>
	    
	    <div class="input">
	      <label for="password">Password</label>
	      <input type="password" required name="password"/>
	    </div>
	    
	    <input type="submit" class="submit-button" value="Submit"/>
    </form>
  </body>
</html>
