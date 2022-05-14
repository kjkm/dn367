<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<jsp:useBean id="myUtil" class="dbUtil.Utilities" scope="session"></jsp:useBean>
<%@ page import="java.sql.*" %> <%@ page import="java.util.*" %>

<!DOCTYPE html>
<%@ include file="meta.jsp" %>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Datanauts 2022</title>
    <link rel="stylesheet" href="style.css" />
  </head>
  <%@ include file="nav.jsp" %>
  <body>
    <% String fname = request.getParameter("fname"); String lname =
    request.getParameter("lname"); myUtil.openDB(); ResultSet rs =
    myUtil.getSessionsByStudent(fname,lname);%>

    <table>
      <thead>
         <tr>
           <th>Session ID</th>
           <th>Tutor ID</th>
            <th>Session Day</th>
        	<th>Session Time</th>
        	<th>Duration</th>
        	<th>Location</th>
         </tr>
      </thead>
     
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
