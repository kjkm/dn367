
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
	String sessionDay = request.getParameter("sessionDay");
	String sessionTime = request.getParameter("sessionTime");
	boolean error = false;
	float duration = 0;
	try{
		int sessionTimeTemp = Integer.parseInt(sessionTime);
		duration = Float.parseFloat(request.getParameter("duration"));
	}
	catch(Exception e){
		error = true;
	}
	if(!error){
	%>
	
	<h2>
		The study session has been created!
	</h2>
	<%} else{%>
	<h2>There was an error in your declarations. Please try again.</h2>
	<%}%>
	<form action="createStudySessionForm.jsp" method="get">
		<div class="input">
		</div>
		<input class="submit-button" type="submit" value="Return to Main Menu" />
	</form>

</body>
</html>