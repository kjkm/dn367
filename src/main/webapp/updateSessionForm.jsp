<!DOCTYPE html>
<%@ include file="meta.jsp" %>
<html>
  <%@ include file="nav.jsp" %>
   <%
	 HashMap<String, String> user = (HashMap<String, String>) session.getAttribute("user");
	 if (user== null || user.get("studentID") == "") { %>
	    	<jsp:forward page="login.jsp"></jsp:forward>
	 <% } %>
  <body>
    <h2>Update Study Session</h2>
    <h3>Update Session Location</h3>
    <form action="updateSessionLocationHandler.jsp" method="get">
       <div class="input">
         <label for="sessionID">Study Session ID</label>
         <input type="text" name="sessionID" id="sessionID" value="" size="10">
       </div>
       
       <div class="input">
         <label for="sessionLocation">New Location</label>
         <input type="text" name="sessionLocation" id="sessionLocation" value="" size="10"><br>
       </div>
       <input class="submit-button" type="submit" value="Submit">
    </form>
    
    <h3>Update Session Time</h3>
    <form action="updateSessionTimeHandler.jsp" method="get">
       <div class="input">
         <label for="sessionID">Study Session ID</label>
         <input type="text" name="sessionID" id="sessionID" value="" size="10">
       </div>
       
       <div class="input">
         <label for="sessionTime">New Time</label>
         <input type="text" name="sessionTime" id="sessionTime" value="" size="10">
       </div>
 
       <div class="input">
         <label for="sessionDay">New Day</label>
         <input type="text" name="sessionDay" id="sessionDay" value="" size="10">
       </div>
       
       <input class="submit-button" type="submit" value="Submit">
    </form>
    
  
  
  
    </body>
  </html>