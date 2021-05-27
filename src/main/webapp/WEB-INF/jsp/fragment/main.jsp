<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Shop Online</title>
<script src="<%=request.getContextPath()%>/jslib/jquery-3.6.0.js"></script>
 <script src="<%=request.getContextPath() %>/jslib/jquery-ui.js"></script>
 <link rel="stylesheet" href="<%=request.getContextPath() %>/css/jquery-local-ui.css">
<style type="text/css">
    .centerPage {
    background-color: white;
    /* float: left; */
    display: flex;
    flex-direction:column;
    text-align: center;
    align-items:center;
    
    }
    
</style>
<script type="text/javascript">
var urlRicerca;
var startRow=1,ricercaPage=4,pageNum=1;
</script>
</head>
<body id="bodyid">

<div style="width:100%;background-color:white;">

<img src="<%=request.getContextPath() %>/img/bannerBook2.jpg" width="100%">

<%@include file="/WEB-INF/jsp/fragment/menu.jsp" %>


<%
Object obj=request.getSession().getAttribute("user");

if(obj!=null && ((User)obj).getId()!=0){%>

		
	
		<%@include file="/WEB-INF/jsp/fragment/logout.jsp" %>
		
	<% } else { %>
	
		<%@include file="/WEB-INF/jsp/fragment/login.jsp" %>

		
		
	<% } %>



	
	



<div id="allerta" class="ui-widget" style="display:none;">
	<div class="ui-state-error ui-corner-all" style="padding: 0 .7em;">
		<p><span class="ui-icon ui-icon-alert" style="float: none; margin-right: .3em;"></span>
		<strong>Alert:</strong> <span id="allertText" ></span></p>
	</div>
</div>
</div>