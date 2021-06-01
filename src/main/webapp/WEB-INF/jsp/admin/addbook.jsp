
<%@page import="com.alek.mvcjquery.model.user.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
User usrTmp=(User)request.getSession().getAttribute("user");
if(usrTmp.getProfile().getId()<300){
	System.out.println("user del admin page="+usrTmp.getId()+","+usrTmp.getName());
	RequestDispatcher disp=  request.getRequestDispatcher("/WEB-INF/jsp/bookshop/default.jsp");
	disp.forward(request, response);
	return;  
}

%>

<%@include file="/WEB-INF/jsp/fragment/main.jsp" %>


<div  id="centerPageid" class="centerPageRed"  >

<%@include file="/WEB-INF/jsp/fragment/bookform.jsp" %>

</div>



</body>
</html>