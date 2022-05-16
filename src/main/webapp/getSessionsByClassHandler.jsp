
<!DOCTYPE html>
<%@ include file="meta.jsp" %>
<html>
  <%@ include file="nav.jsp" %>
  <body>
   <%
	 HashMap<String, String> user = (HashMap<String, String>) session.getAttribute("user");
	 if (user== null || user.get("studentID") == "") { %>
	    	<jsp:forward page="login.jsp"></jsp:forward>
	 <% } %>
    <%
    String chosenClass = request.getParameter("class");
    System.out.println(chosenClass);
    String[] splitClass = chosenClass.split("-");
    ResultSet rs = myUtil.getSessionsByClass(splitClass[0], Integer.parseInt(splitClass[1]));%>

    <table>
      <tr>
        <th>Session ID</th>
        <th>Session Day</th>
        <th>Session Time</th>
        <th>Location</th>
        <th>Tutor ID</th>
        <th>Join</th>
      </tr>
      <% while(rs.next()) { %>
      <tr>
        <td><%= rs.getString(1) %></td>
        <td><%= rs.getString(2) %></td>
        <td><%= rs.getString(3) %></td>
        <td><%= rs.getString(4) %></td>
        <td><%= rs.getString(5) %></td>
        <td>
          <form method="get" action="joinStudySessionHandler.jsp">
            <input type="text" class="invisible" name="sessionID" value=<%= rs.getString(1) %>/>
            <input type="text" class="invisible" name="studentID" value=<%= user.get("studentID") %>/>
            <input type="submit" class="submit-button" value="Join"/>
          </form>
        </td>
      </tr>
      <% } %>
    </table>
  </body>
</html>
