<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<jsp:useBean id="myUtil" class="dbUtil.Utilities" scope="session"></jsp:useBean>
<%@ page import="java.sql.*" %> <%@ page import="java.util.*" %>

<!DOCTYPE html>
<%@ include file="meta.jsp" %>
<html>
  <%@ include file="nav.jsp" %>
  <body>
  
  <% String sessionIDTemp = request.getParameter("sessionID");
     String sessionLocation = request.getParameter("sessionLocation");
     boolean error = false;
     try{
         int sessionID = Integer.parseInt(sessionIDTemp);
         myUtil.changeSessionLocation(sessionID, sessionLocation);
     }catch(Exception e){
     	error = true;
     }%>
     
     <% if(!error){ %>
     	<h2>Congratulations! The session location has been updated.</h2>
     	<h3>The new session location is <%=sessionLocation%></h3>
     
     <%} else {%>
     	<h2>There was an error with your request. Put in a correct session ID and location</h2>
     <% } %>
     
  
  
  
  </body>
</html>