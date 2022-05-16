<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<jsp:useBean id="myUtil" class="dbUtil.Utilities" scope="session"></jsp:useBean>
<%@ page import="java.sql.*" %> <%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="en">
  <%@ include file="meta.jsp" %>
  <body id="header-content">
    <h1 id="title">Datanauts</h1>
    <%
      HashMap<String, String> foundUser = (HashMap<String, String>) session.getAttribute("user");
      if (foundUser != null && foundUser.get("studentID") != "") {
    %>
    <nav id="#nav">
      <div class="nav-row">
        <a href="getSessionsByClassForm.jsp">Get Study Sessions</a>
        <span>-</span>
        <a href="getTutorInformationForm.jsp">Get Tutor Info</a>
        <span>-</span>
        <a href="createStudySessionForm.jsp">Create Study Session</a>
      </div>
      <div class="nav-row">
        <a href="leaveStudySessionForm.jsp">Leave Study Session</a>
        <span>-</span>
        <a href="getSessionsByStudentForm.jsp">Find Student Sessions</a>
        <span>-</span>
        <a href="updateSessionForm.jsp">Update Session</a>
      </div>
    </nav>
    <% } %>
  </body>
</html>
