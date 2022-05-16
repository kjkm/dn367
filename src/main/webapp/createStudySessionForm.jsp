<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<jsp:useBean id="myUtil" class="dbUtil.Utilities" scope="session"></jsp:useBean>
<%@ page import="java.sql.*" %> <%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
	<%@ include file="meta.jsp" %>
<body>
	<%@ include file="nav.jsp" %>
	<h1>Create Study Session</h1>
	<form action="createStudySessionHandler.jsp" method="get">   
   		<div class="input">
	      <label for="tutorID">Tutor ID Number: </label>
	      <input
	        type="text"
	        id="tutorID"
	        name="tutorID"
	        value=""
	        size="10"
	        required
	      />
      	</div>
   		<div class="input">
	      <label for="sessionDay">Session Day: </label>
	      <input
	        type="text"
	        id="sessionDay"
	        name="sessionDay"
	        value=""
	        size="10"
	        required
	      />
      	</div>
   		<div class="input">
	      <label for="sessionTime">Session Time: </label>
	      <input
	        type="text"
	        id="sessionTime"
	        name="sessionTime"
	        value=""
	        size="10"
	        required
	      />
      	</div>
   		<div class="input">
	      <label for="duration">Duration: </label>
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
	      <label for="location">Location: </label>
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