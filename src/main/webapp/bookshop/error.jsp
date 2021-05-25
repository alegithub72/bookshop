<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Error Page</title>
</head>
<body>
<div class="centerPage"  >


<%@include file="../fragment/main.jsp" %>




<div class="centerPage"  >
<script type="text/javascript">
$(document).ready(
		function(){
			$("#accedi").off();
			
			
		}
		
		
		);

</script>
<%@include file="../fragment/error.jsp" %>

</div>

</div>
</body>
</html>