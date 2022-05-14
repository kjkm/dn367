<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<jsp:useBean id="myUtil" class="dbUtil.Utilities" scope="session"></jsp:useBean>
<%@ page import="java.sql.*" %> <%@ page import="java.util.*" %>

<!DOCTYPE html>

<html>
  <%@ include file="meta.jsp" %>
  <body>
    <%@ include file="nav.jsp" %>
    <h2>Leave study session</h2>
    <h3>Please input the information required to leave the study session</h3>

    <form action="leaveStudySessionHandler.jsp" method="get">
      <div class="input">
	      <label for="studentID">Student ID Number: </label>
	      <input
	        type="text"
	        id="studentID"
	        name="studentID"
	        value=""
	        size="10"
	        required
	      />
      </div>
      <div class="input">
	      <label for="sessionID">Session ID Number: </label>
	      <input
	        type="text"
	        id="sessionID"
	        name="sessionID"
	        value=""
	        size="10"
	        required
	      />
      </div>
      <input class="submit-button" type="submit" value="Submit" />
    </form>
  </body>
</html>
