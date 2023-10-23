<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<head>
<meta charset="ISO-8859-1">
<title>Book Shop Online</title>
<script src="<%=request.getContextPath()%>/jslib/jquery-3.6.0.js"></script>
<script src="<%=request.getContextPath()%>/jslib/jquery-ui.js"></script>

<meta charset="utf-8" />
   <script src="https://unpkg.com/react@18/umd/react.development.js" crossorigin></script>
    <script src="https://unpkg.com/react-dom@18/umd/react-dom.development.js" crossorigin></script>
    <script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>

<link  rel="stylesheet"
	href="<%=request.getContextPath()%>/css/8.0.1_normalize.css">

<style type="text/css">
.centerPage {
	background-color: white;
	/* float: left; */
	display: flex;
	flex-direction: column;
	text-align: center;
	align-items: center;
}

.centerPageRed {
	background-color: red;
	color: yellow;
	/* float: left; */
	display: flex;
	flex-direction: column;
	text-align: center;
	align-items: center;
}
</style>

<script type="text/javascript">
	var urlRicerca;
	var startRow = 1, ricercaPage = 4, pageNum = 1;
</script>
</head>