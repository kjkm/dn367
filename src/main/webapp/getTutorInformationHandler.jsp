
<!DOCTYPE html>
<%@ include file="meta.jsp" %>
<html>
  <%@ include file="nav.jsp" %>
  <body>
    <% String studentID = request.getParameter("studentID"); ResultSet rs = myUtil.getTutorInfo(studentID); %>

    <h2>All information for student ID: <%=studentID%></h2>
    <table>
      <thead>
        <tr>
	      <th>Location</th>
	      <th>Class</th>
	      <th>Day</th>
	      <th>Time</th>
	    </tr>
      </thead>

      <tbody>
        <% while (rs.next()) { %>
        <tr>
          <td><%= rs.getString(1) %></td>
          <td><%= rs.getString(3) + " " + rs.getString(2) %></td>
          <td><%= rs.getString(4) %></td>
          <td><%= rs.getString(5) %></td>
        </tr>
        <% } %>
      </tbody>
    </table>
  </body>
</html>
