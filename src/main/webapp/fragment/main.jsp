<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Shop Online</title>
<script src="../jslib/jquery-3.6.0.js"></script>
 <script src="../jslib/jquery-ui.js"></script>
 <link rel="stylesheet" href="../css/jquery-ui.css">
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
</head>
<body>

<div style="width:100%;background-color:white;">

<img src="../img/bannerBook2.jpg" width="100%">

<%@include file="./menu.jsp" %>
<%
Object obj=request.getSession().getAttribute("user");

if(obj!=null && ((User)obj).getId()!=0){%>

		
	
		<%@include file="./logout.jsp" %>
		
	<% } else { %>
	
		<%@include file="./login.jsp" %>

		
		
	<% } %>



	
	


<script type="text/javascript">
function displayAllerta(errore){
	$("#allertText").text("Errore Applicativo:"+errore.msg);
	$("#allerta").css("display","inherit");
	
}

</script>
<div id="allerta" class="ui-widget" style="display:none;">
	<div class="ui-state-error ui-corner-all" style="padding: 0 .7em;">
		<p><span class="ui-icon ui-icon-alert" style="float: none; margin-right: .3em;"></span>
		<strong>Alert:</strong> <span id="allertText" ></span></p>
	</div>
</div>
</div>