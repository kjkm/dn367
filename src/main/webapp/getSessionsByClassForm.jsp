<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<jsp:useBean id="myUtil" class="dbUtil.Utilities" scope="session"></jsp:useBean>
<%@ page import="java.sql.*" %> <%@ page import="java.util.*" %>

<!DOCTYPE html>

<html>
  <%@ include file="meta.jsp" %>
  <body>
    <%@ include file="nav.jsp" %>
    <h2>List Sessions By Class Subject and Number</h2>
    <h3>Please input the class subject and number</h3>
    <% ResultSet rs = myUtil.getClasses(); %>

    <form action="getSessionsByClassHandler.jsp" method="get">
      <div class="input">
        <label for="class">Classes</label>
        <select name="class" class="selector">
          <% while (rs.next()) {%>
          <%
            String val = rs.getString(1) + "-" + rs.getString(2);
          %>
          <option value=<%= val %>
            ><%= val %>
          </option>
          <% } %>
        </select>
      </div>
      <input class="submit-button" type="submit" value="Submit" />
    </form>
  </body>
</html>
