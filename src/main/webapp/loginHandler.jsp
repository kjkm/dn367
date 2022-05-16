
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
    <%
      HashMap<String, String> retrievedUser = (HashMap<String, String>) session.getAttribute("user");
      if (retrievedUser != null && retrievedUser.get("isTutor").equals("1")) { %>
        <h2>Welcome! You are a tutor, which means you can create and update study sessions!</h2>
      <% } else { %>
        <h2>Welcome! You aren't a tutor, but you can view and join study sessions!</h2>
      <% } %>
      
      <a href="getSessionsByClassForm.jsp"><input type="submit" class="submit-button get-started" value="Get started"/></a>
  </body>
</html>