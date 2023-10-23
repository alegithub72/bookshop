
<%@page import="com.alek.mvcjquery.model.user.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<%
User usrTmp=(User)request.getSession().getAttribute("user");
if(usrTmp.getProfile().getId()<300){
	System.out.println("user del admin page="+usrTmp);
	RequestDispatcher disp=  request.getRequestDispatcher("/WEB-INF/jsp/bookshop/default.jsp");
	disp.forward(request, response);
	return;
}

%>

<%@include file="/WEB-INF/jsp/fragment/header.jsp" %>
<body id="bodyid">
<%@include file="/WEB-INF/jsp/fragment/menu.jsp" %>



<div  id="centerPageid" class="centerPageRed"  >

<%@include file="/WEB-INF/jsp/fragment/homeadmin.jsp" %>

</div>
<%@include file="/WEB-INF/jsp/fragment/footer.jsp" %>

</body>
</html>