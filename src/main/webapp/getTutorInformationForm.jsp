<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<jsp:useBean id="myUtil" class="dbUtil.Utilities" scope="session"></jsp:useBean>
<%@ page import="java.sql.*" %> <%@ page import="java.util.*" %>

<!DOCTYPE html>

<html>
  <%@ include file="nav.jsp" %>
  <body>
    <h1>View tutor information</h1>
    <h2>Select one of the tutors below to view their information</h2>

    <% ResultSet rs = myUtil.getTutors(); %>
    <form action="getTutorInformationHandler.jsp" method="get">
      <select name="studentID">
        <% while (rs.next()) { %>
        <option value=<%= rs.getString(3) %>>
          <%= rs.getString(1) + " " + rs.getString(2) %>
        </option>
        <% } %>
      </select>
      <input type="submit" value="Submit" />
    </form>
  </body>
</html>
