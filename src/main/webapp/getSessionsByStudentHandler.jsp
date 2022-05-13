<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<jsp:useBean id="myUtil" class="dbUtil.Utilities" scope="session"></jsp:useBean>
<%@ page import="java.sql.*" %> <%@ page import="java.util.*" %>

<!DOCTYPE html>

<html>
  <%@ include file="nav.jsp" %>
  <body>
    <% String fname = request.getParameter("fname"); String lname =
    request.getParameter("lname"); myUtil.openDB(); ResultSet rs =
    myUtil.getSessionsByStudent(fname,lname);%>

    <table>
      <tr>
        <th>Session ID</th>
        <th>Tutor ID</th>
        <th>Session Day</th>
        <th>Session Time</th>
        <th>Duration</th>
        <th>Location</th>
      </tr>
      <%while (rs.next()){ %>
      <tr>
        <td><%=rs.getString(1) %></td>
        <td><%=rs.getString(2) %></td>
        <td><%=rs.getString(3) %></td>
        <td><%=rs.getString(4) %></td>
        <td><%=rs.getString(5) %></td>
        <td><%=rs.getString(6) %></td>
      </tr>
      <%}%>
    </table>
  </body>
</html>
