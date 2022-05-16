
<!DOCTYPE html>

<html>
  <%@ include file="meta.jsp" %> <%@ include file="nav.jsp" %>
  <body>
    <% String studentIDString = request.getParameter("studentID"); String
    sessionIDString = request.getParameter("sessionID"); myUtil.openDB(); int
    studentID = Integer.parseInt(studentIDString); int sessionID =
    Integer.parseInt(sessionIDString);
    myUtil.leaveStudySession(sessionID,sessionID); myUtil.closeDB();%>

    <h2>
      Congratulations! The specified student was removed from the study session!
    </h2>
    <h3>Please click the button below to return to the main menu</h3>
    <form action="leaveStudySessionForm.jsp" method="get">
      <input type="submit" value="Return to Main Menu" />
    </form>
  </body>
</html>
