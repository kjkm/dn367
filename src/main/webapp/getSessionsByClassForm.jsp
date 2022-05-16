<!DOCTYPE html>

<html>
  <%@ include file="meta.jsp" %>
  <body>
   <%
	 HashMap<String, String> user = (HashMap<String, String>) session.getAttribute("user");
	 if (user== null || user.get("studentID") == "") { %>
	    	<jsp:forward page="login.jsp"></jsp:forward>
	 <% } %>
    <%@ include file="nav.jsp" %>
    <h2>List Sessions By Class Subject and Number</h2>
    <h3>Please input the class subject and number</h3>
    <% ResultSet rs = myUtil.getClasses(); %>

    <form action="getSessionsByClassHandler.jsp" method="get">
      <div class="input">
        <label for="class">Classes</label>
        <select name="class" class="selector">
          <% while (rs.next()) {%>
          <%
            String val = rs.getString(1) + "-" + rs.getString(2);
          %>
          <option value=<%= val %>
            ><%= val %>
          </option>
          <% } %>
        </select>
      </div>
      <input class="submit-button" type="submit" value="Submit" />
    </form>
  </body>
</html>
