
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
	<h2>Create Study Session</h2>
	<h3>Enter study session fields</h3>
	<form action="createStudySessionHandler.jsp" method="get"> 
		<% String[] sessionDays = myUtil.getSessionDays(); %>
   		<div class="input">
	      <label for="sessionDay">Session Day: </label>
	      <select name="sessionDay" class="selector">
	      	<% for (int i = 0; i < sessionDays.length; i++) { %>
	      	<%
	      		String val = sessionDays[i];
	      	%>
	      	<option value=<%= val %>
            ><%= val %>
          </option>
	      	<% } %>
	      </select>
      	</div>
      	
      	<% Integer[] sessionTimes = myUtil.getSessionTimes();  %>
   		<div class="input">
	      <label for="sessionTime">Session Time: </label>
	      <select name="sessionTime" class="selector">
	      	<% for (int i = 0; i < sessionTimes.length; i++) { %>
	      	<%
	      		int val = sessionTimes[i];
	      	%>
	      	<option value=<%= val %>
            ><%= val %>
          </option>
	      	<% } %>
	      </select>
      	</div>
      	
   		<div class="input">
	      <label for="duration">Duration (Hours): </label>
	      <input
	        type="text"
	        id="duration"
	        name="duration"
	        value=""
	        size="10"
	        required
	      />
      	</div>
      	
   		<div class="input">
	      <label for="location">Location </label>
	      <input
	        type="text"
	        id="location"
	        name="location"
	        value=""
	        size="10"
	        required
	      />
      	</div>
   
   		<input class="submit-button" type="submit" value="Submit" />
	</form>

</body>
</html>