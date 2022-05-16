
<!DOCTYPE html>
<%@ include file="meta.jsp" %>
<html>
  <%@ include file="nav.jsp" %>
  <body>
    <form action="loginHandler.jsp" method="get">
	    <div class="input">
	      <label for="studentID">Student ID</label>
	      <input type="text" required name="studentID"/>
	    </div>
	    
	    <div class="input">
	      <label for="password">Password</label>
	      <input type="password" required name="password"/>
	    </div>
	    
	    <input type="submit" class="submit-button" value="Submit"/>
    </form>
  </body>
</html>
