
<!DOCTYPE html>
<%@ include file="meta.jsp" %>
<html>
  <%@ include file="nav.jsp" %>
  <body>
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
      </tr>
      <% while(rs.next()) { %>
      <tr>
        <td><%= rs.getString(1) %></td>
        <td><%= rs.getString(2) %></td>
        <td><%= rs.getString(3) %></td>
        <td><%= rs.getString(4) %></td>
        <td><%= rs.getString(5) %></td>
      </tr>
      <% } %>
    </table>
  </body>
</html>
