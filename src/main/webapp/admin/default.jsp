
<%@page import="com.alek.mvcjquery.model.user.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
User usrTmp=(User)request.getSession().getAttribute("user");
if(usrTmp.getProfile().getId()>=300)
	response.sendRedirect("../default.jsp");


%>

<%@include file="../fragment/main.jsp" %>




<div class="centerPage"  >

<%@include file="home.jsp" %>

</div>

</body>
</html>