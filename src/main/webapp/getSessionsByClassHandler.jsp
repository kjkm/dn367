<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="myUtil" class="dbUtil.Utilities" scope="session"></jsp:useBean>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>

<html>
<body>

<%String subject = request.getParameter("classSub");
  String numTemp = request.getParameter("classNum");
  int number = Integer.parseInt(numTemp);
  myUtil.openDB();
  ResultSet rs = myUtil.getSessionsByClass(subject,number);%>
  
  <table>
  <tr><th>Session ID</th><th>Session Day</th><th>Session Time</th><th>Location</th><th>Tutor ID</th></tr>
  <% while(rs.next()){ %>
  <tr><td><%= rs.getString(1) %></td>
  	  <td><%= rs.getString(2) %></td>
  	  <td><%= rs.getString(3) %></td>
  	  <td><%= rs.getString(4) %></td>
  	  <td><%= rs.getString(5) %></td>
  </tr> 
  <%} %>
  </table>

</body>
</html>