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
       String sessionTime = request.getParameter("sessionTime");
       String sessionDay = request.getParameter("sessionDay");
       boolean error = false;
       try{
       	 int sessionID = Integer.parseInt(sessionIDTemp);
       	 myUtil.changeSessionTime(sessionID, sessionDay, sessionTime);
       }
       catch(Exception e){
       	 error = true;
       }%>
       
    <% if(!error) {%>
       <h2>Congratulations! The session day and time have been updated!</h2>
       <h3> The new time is <%= sessionTime %> and the new day is <%= sessionDay %></h3>
    <% } else { %>
       <h2>There was an error with your request. Put in a correct session ID, day and time</h2>
    <% } %>
    
  
  </body>
  
</html>