
<!DOCTYPE html>
<html>
  <%@ include file="meta.jsp" %>
  <body>
    <%@ include file="nav.jsp" %>
    <h2>Get Sessions By Student</h2>
    <h3>Please enter the first and last name of the required student</h3>

    <form action="getSessionsByStudentHandler.jsp" method="get">
      <div class="input">
        <label for="fname">First Name</label>
        <input
          type="text"
          id="fname"
          name="fname"
          value=""
          size="10"
          required
        />
      </div>
      
      <div class="input">
        <label for="lname">Last Name</label>
        <input
          type="text"
          id="lname"
          name="lname"
          value=""
          size="10"
          required
        />
      </div>
     
      <input class="submit-button" type="submit" value="Submit" />
    </form>
  </body>
</html>
