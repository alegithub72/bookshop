<%@page import="com.alek.mvcjquery.model.user.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<style type="text/css"> 
.menus {
    font-family: Verdana, sans-serif;
    font-size: 11px;
    opacity: 0.99;
    display: flex;
    flex-direction: row;
    justify-content: space-around;
    height: 30px;
    padding-inline-start: 0 !important;
    margin-top: -6px;
    width: 98%;

}
.mainm {
	background-color: rgb(0, 123, 247);
    border-bottom: 5px solid rgb(0, 64, 128);
    display: flex;
    flex-direction: column;
    width: 20%;
    height: 100%;
    margin: 2px;
    text-align: center;
    padding-inline-start: 0 !important;
}
.mainma {
	color: #ffff;
    display: flex;
    flex-direction: row;
    font-weight: bold;
    font-size: large;
    text-decoration: none;
    justify-content: center;
    /* margin-top: 30px; */
    text-align: center;
    margin-left: 10px;
    margin-right: 10px;
} 
ul#menu li.active, ul#menu li:hover {
    background-color: rgb(166, 210, 255);/*#54BAE2;*/
/*     border-bottom: 5px solid rgb(0, 64, 128); */
}
.smenus {
font-family: Verdana, sans-serif;
    font-size: 11px;
    display: none;
    /* opacity: 0.99; */
    width: 100%;
    padding-inline-start: 0!important;
    margin-top: 11px;
    margin-left: 0px;
    padding: 1px;
    /* width: 800px; */
    text-align: center;


}
.sottogs {
background-color: rgb(0, 123, 247);
    /* border-bottom: 5px solid rgb(0, 64, 128); */
    /* display: block; */
    /* width: 15%; */
    /* height: 80px; */
    margin: 1px;
    /* text-align: -webkit-center; */
    /* float: left; */
    list-style: none;
}

.mainmas {
color: #ffff;
    /* display: block; */
    font-weight: bold;
    /* line-height: 80px; */
    font-size: large;
    text-decoration: none;
    /* width: 18%; */
    /* height: 30px; */
    /* text-align: justify;
} 

    </style>
<script>
var opcl=false;
function closeAllMenu(){
	
	$("#sottog").css("display","none");
	$("#sottob").css("display","none");
	
}
$(document).ready(function(){
	
		
		$("#genere").click(function(){
	
		if(!opcl) {
			$("#sottog").css("display","inline");
			opcl=!opcl;
		}
		else {
			 closeAllMenu();
			opcl=!opcl;
		}
		
	});
	$("#best").click(function(){
		if(!opcl) {
			$("#sottob").css("display","inline");
			opcl=!opcl;
		}
		else {
			closeAllMenu();
			opcl=!opcl;
		}
		
	});	
});

</script>
<div style="display:flex;flex-direction:row;width:100%">

<ul id="menu" class="menus">
<%if(request.getSession().getAttribute("user")!=null){
	
	User usr=(User) request.getSession().getAttribute("user");
	if(usr.getProfile().getNome().equals("Administrator")){
		out.print("<li style='background-color:red' id=\"Administrator\" class=\"mainm\">"+
				"<a href=\"../admin/default.jsp\" class=\"mainma\">Administrator</a>"+
				"</li>");
		
	}
}
	
	
	%>
    <li id="home" class="mainm"><a href="./" class="mainma">Home</a></li>
    <li id="about" class="mainm"><a href="#" class="mainma">About&nbsp;Us</a></li>
    <li id="genere" class="mainm">
    <a href="#" class="mainma">Libri&nbsp;Genere</a>
    <ul id="sottog" class="smenus">
    <li class="sottogs"><a href="listalibri.jsp" class="mainmas" >Avvenutra</a></li>
    <li class="sottogs"><a href="#" class="mainmas">Thriller</a></li>
    <li class="sottogs"><a href="#" class="mainmas">Gialli</a></li>
     <li class="sottogs"><a href="#" class="mainmas">Classici</a></li>    
    </ul>
    </li>
    <li id="best" class="mainm">
    <a href="#" class="mainma">Best&nbsp;Seller</a>
    <ul id="sottob" class="smenus">
    <li class="sottogs"><a href="#" class="mainmas" >Piu Venduti</a></li>
    <li class="sottogs"><a href="#" class="mainmas">I piu recensiti</a></li>
    <li class="sottogs"><a href="#" class="mainmas">Economici</a></li>
         
    </ul>
    
    </li>
    <li id="contact" class="mainm"><a href="#" class="mainma">Contact</a></li>
</ul>

<img src="../img/omino2.jpg"  style="margin-right:2px;margin-top:-1px;" width="35px"  height="30px" />
<a href="#" style="text-align:center;margin-top:6px;height:24px;margin-right:2px;">Accedi</a>
<img src="../img/cart2.png" style="background-color:rgb(0, 123, 247);margin-top:-4px;margin-right:3px;" width="35px" height="35px"  />
</div>

