
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
   <%
	 HashMap<String, String> user = (HashMap<String, String>) session.getAttribute("user");
	 if (user== null || user.get("studentID") == "") { %>
	    	<jsp:forward page="login.jsp"></jsp:forward>
	 <% } %>
  <body>
    <% String fname = request.getParameter("fname"); String lname =
    request.getParameter("lname"); myUtil.openDB(); 
    ResultSet rs = myUtil.getSessionsByStudent(fname,lname);
    ResultSet rs1 = myUtil.getSessionsByStudent(fname,lname); 
    %>
    
    <% if (rs1.next()) { %>
    <table>
      <thead>
         <tr>
           <th>Session ID</th>
           <th>Tutor ID</th>
            <th>Session Day</th>
        	<th>Session Time</th>
        	<th>Duration</th>
        	<th>Location</th>
        	<th>Join</th>
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
        <td>
          <form method="get" action="joinStudySessionHandler.jsp">
            <input type="text" class="invisible" name="sessionID" value=<%= rs.getString(1) %>/>
            <input type="text" class="invisible" name="studentID" value=<%= user.get("studentID") %>/>
            <input type="submit" class="submit-button" value="Join"/>
          </form>
        </td>
      </tr>
      <%}%>
    </table>
    <% } else { %>
      <h2>There are no sessions associated with this student.</h2>
    <% } %>
  </body>
</html>
