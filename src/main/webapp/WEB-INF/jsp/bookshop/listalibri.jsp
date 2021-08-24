
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@include file="/WEB-INF/jsp/fragment/main.jsp" %>

<div class="centerPage"  >

<%@include file="/WEB-INF/jsp/fragment/ricercaGeneri.jsp" %>

</div>
	<lu ng-controller="listBooksCtrl">
		<li ng-model=" x in listaLibri">
			{{x.name}}
		</li>
	</lu>
</body>
</html>