<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<%@include file="/WEB-INF/jsp/fragment/header.jsp" %>

<body id="bodyid">

<%@include file="/WEB-INF/jsp/fragment/menu.jsp" %>


<%@ page isErrorPage = "true" %>

<div class="centerPage"  >
<script type="text/javascript">
$(document).ready(
		function(){
			$("#accedi").off();
			
			
		}
		
		
		);

</script>
<%@include file="/WEB-INF/jsp/fragment/error.jsp" %>
<%= exception.getMessage()%>
<% exception.printStackTrace(System.out); %>
</div>

</div>
<%@include file="/WEB-INF/jsp/fragment/footer.jsp" %>


</body>
</html>