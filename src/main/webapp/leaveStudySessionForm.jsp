<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<jsp:useBean id="myUtil" class="dbUtil.Utilities" scope="session"></jsp:useBean>
<%@ page import="java.sql.*" %> <%@ page import="java.util.*" %>

<!DOCTYPE html>

<html>
  <body>
    <%@ include file="nav.jsp" %>
    <h1>Leave study session</h1>

    <form action="leaveStudySessionHandler.jsp" method="get">
      Please input the information required to leave the study session: <br />

      <label for="studentID">Student ID Number: </label>
      <input
        type="text"
        id="studentID"
        name="studentID"
        value=""
        size="10"
        required
      /><br />
      <label for="sessionID">Session ID Number: </label>
      <input
        type="text"
        id="sessionID"
        name="sessionID"
        value=""
        size="10"
        required
      /><br />
      <input type="submit" value="Submit" />
    </form>
  </body>
</html>
