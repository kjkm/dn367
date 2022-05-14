<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<jsp:useBean id="myUtil" class="dbUtil.Utilities" scope="session"></jsp:useBean>
<%@ page import="java.sql.*" %> <%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
  <%@ include file="meta.jsp" %>
  <body>
    <%@ include file="nav.jsp" %>
    <h1>Get Sessions By Student</h1>

    <form action="getSessionsByStudentHandler.jsp" method="get">
      Please enter the first and last name of the required student: <br />
      <label for="fname">First Name</label>
      <input
        type="text"
        id="fname"
        name="fname"
        value=""
        size="10"
        required
      /><br />
      <label for="lname">Last Name</label>
      <input
        type="text"
        id="lname"
        name="lname"
        value=""
        size="10"
        required
      /><br />
      <input type="submit" value="Submit" />
    </form>
  </body>
</html>
