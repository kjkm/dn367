<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<jsp:useBean id="myUtil" class="dbUtil.Utilities" scope="session"></jsp:useBean>
<%@ page import="java.sql.*" %> <%@ page import="java.util.*" %>

<!DOCTYPE html>

<html>
  <%@ include file="nav.jsp" %>
  <body>
    <% String studentID = request.getParameter("studentID"); ResultSet rs =
    myUtil.getTutorInfo(studentID); %>

    <h2>All information for student ID: <%=studentID%></h2>
    <table>
      <tr>
        <th>Name</th>
        <th>StudentID</th>
        <th>Class</th>
        <th>Day</th>
        <th>Time</th>
      </tr>

      <tbody>
        <% while (rs.next()) { %>
        <tr>
          <td><%= rs.getString(1) %></td>
          <td><%= rs.getString(2) %></td>
          <td><%= rs.getString(3) + " " + rs.getString(4) %></td>
          <td><%= rs.getString(5) %></td>
          <td><%= rs.getString(6) %></td>
        </tr>
        <% } %>
      </tbody>
    </table>
  </body>
</html>
