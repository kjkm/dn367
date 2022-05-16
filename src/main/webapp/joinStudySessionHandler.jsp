
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
      String studentID = request.getParameter("studentID");
      String sessionID = request.getParameter("sessionID");
      myUtil.joinStudySession(Integer.parseInt(studentID.substring(0, studentID.length() - 1)), Integer.parseInt(sessionID.substring(0, sessionID.length() - 1)));
    %>

    <h2>Successfully joined study session with session ID: <%= sessionID.substring(0, sessionID.length() - 1) %></h2>
  </body>
</html>
