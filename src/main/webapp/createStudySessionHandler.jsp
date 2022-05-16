<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="myUtil" class="dbUtil.Utilities" scope="session"></jsp:useBean>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<%@ include file="meta.jsp" %> <%@ include file="nav.jsp" %>
<body>

<% 
	int tutorID = Integer.parseInt(request.getParameter("tutorID"));
	String sessionDay = request.getParameter("sessionDay");
	String sessionTime = request.getParameter("sessionTime");
	float duration = Float.parseFloat(request.getParameter("duration"));
	String location = request.getParameter("location");
	myUtil.createStudySession(tutorID, sessionDay, sessionTime, duration, location);
	%>
	
	<h2>
		The study session has been created!
	</h2>
	<form action="createStudySessionForm.jsp" method="get">
		<div class="input">
		</div>
		<input class="submit-button" type="submit" value="Return to Main Menu" />
	</form>

</body>
</html>