
<!DOCTYPE html>
<%@ include file="meta.jsp" %>
<html>
  <%@ include file="nav.jsp" %>
  <body>
    <h2>Get tutor information</h2>
    <h3>Select one of the tutors below to view their information</h3>

    <% ResultSet rs = myUtil.getTutors(); %>
    <form action="getTutorInformationHandler.jsp" method="get">
      <select class="selector tutor-info" name="studentID">
        <% while (rs.next()) { %>
        <option value=<%= rs.getString(3) %>
          > <%= rs.getString(1) + " " + rs.getString(2) %>
        </option>
        <% } %>
      </select>
      <input class="submit-button" type="submit" value="Submit" />
    </form>
  </body>
</html>
