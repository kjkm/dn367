
<!DOCTYPE html>
<%@ include file="meta.jsp" %>
<html>
  <%@ include file="nav.jsp" %>
  
  <%
    String studentID = request.getParameter("studentID");
    String password = request.getParameter("password");
    HashMap<String, String> user = myUtil.login(studentID, password);
    if (user.get("studentID") != "") { 
    	session.setAttribute("user", user);
     } else { %>
    	<jsp:forward page="login.jsp"></jsp:forward>
    <% } %>
  
  <body>
    <form action="loginHandler.jsp" method="get">
	    <div class="input">
	      <label for="studentID">Student ID</label>
	      <input type="text" required name="studentID"/>
	    </div>
	    <div class="input">
	      <label for="username">Password</label>
	      <input type="password" required name="password"/>
	    </div>
	    
	    <input type="submit" class="submit-button" value="Submit"/>
    </form>
  </body>
</html>
