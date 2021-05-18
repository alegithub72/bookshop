<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Shop Online</title>
<script src="../jslib/jquery-3.6.0.js"></script>
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

</div>