
<!DOCTYPE html>

<html>
  <%@ include file="meta.jsp" %> <%@ include file="nav.jsp" %>
   <%
	 HashMap<String, String> user = (HashMap<String, String>) session.getAttribute("user");
	 if (user== null || user.get("studentID") == "") { %>
	    	<jsp:forward page="login.jsp"></jsp:forward>
	 <% } %>
  <body>
    <% 
    String sessionIDString = request.getParameter("sessionID");  
    int studentID = Integer.parseInt(user.get("studentID")); 
    int sessionID = Integer.parseInt(sessionIDString);
    myUtil.leaveStudySession(sessionID,sessionID); 
    %>

    <h2>
      Congratulations! The specified student was removed from the study session!
    </h2>
    <h3>Please click the button below to return to the main menu</h3>
    <form action="leaveStudySessionForm.jsp" method="get">
      <input type="submit" value="Return to Main Menu" />
    </form>
  </body>
</html>
