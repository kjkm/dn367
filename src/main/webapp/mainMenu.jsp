<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Datanatus - Main Menu</title>
  </head>
  <body>
    <%@ include file="nav.jsp" %>
    <ul>
      <li>
        <a href="getSessionsByStudentForm.jsp">View Sessions By Student</a>
      </li>
      <li><a href="leaveStudySessionForm.jsp">Leave Study Session</a></li>
      <li><a href="getTutorInformationForm.jsp">View Tutor Information</a></li>
    </ul>
  </body>
</html>
