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
.menu0 {
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
.menulink {
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

ul#menusid li:active,ul#menusid li:hover {
    background-color: rgb(166, 210, 255);/*#54BAE2;*/
/*     border-bottom: 5px solid rgb(0, 64, 128); */
}


ul#menusid li#gestione_menuid:hover{
	background-color: yellow;
}

li#gestione_menuid {
	background-color: red;
	border-color: rgb(174,0,0);
}

li#gestione_menuid li{
	background-color: red;
	border: 2px solid yellow;


}
li#gestione_menuid li:hover,li#gestione_menuid li:hover{
	background-color: yellow;

}
ul#gestione_menuid {
	background-color:none;

}
.sottomenu0 {
font-family: Verdana, sans-serif;
    font-size: 11px;
    display: inline;
    /* opacity: 0.99; */
    width: 100%;
    padding-inline-start: 0!important;
    margin-top: 11px;
    margin-left: 0px;
    padding: 1px;
    /* width: 800px; */
    text-align: center;



}
.sottomenu1 {
background-color: rgb(0, 123, 247);
    /* border-bottom: 5px solid rgb(0, 64, 128); */
    /* display: block; */
    /* width: 15%; */
    /* height: 80px; */
    margin: 3px;
    /* text-align: -webkit-center; */
    /* float: left; */
    list-style: none;
    border: 3px  solid  rgb(166, 210, 255);
}

/* .mainmas { */
/* color: #ffff; */
/*     /* display: block; */ */
/*     font-weight: bold; */
/*     /* line-height: 80px; */ */
/*     font-size: large; */
/*     text-decoration: none; */
/*     /* width: 18%; */ */
/*     /* height: 30px; */ */
/*     /* text-align: justify; */
/* }  */

    </style>
<script>
// let listageneri;
// $(document).ready(function(){
	
// 	$.getJSON("../service/ricercalistejson?webfunction=generi",function(data){

// 		listageneri=data;
// 		console.log("----------------->"+data);
// 		})
// 		.done(function(){
// 				if(listageneri.errore) {
// 					displayAllerta(listageneri.errore);
					
// 					return;
// 				}
// 			buildGenereMenu();

				
// 			})
// 		.fail(function(){
// 			displayAllerta(listageneri);
			
		
// 		});
	
	
// })






// var opcl=false;
// function closeAllMenu(){
	
// 	$("#sottomenu0_generiid").css("display","none");
// 	$("#sottomenu_bestid").css("display","none");
// 	$("#gestione_sottomenuid").css("display","none");
	
// }
// $(document).ready(function(){
	
		
// 		$("#genereid").click(function(){
	
// 		if(!opcl) {
// 			$("#sottomenu0_generiid").css("display","inline");

// 		}
// 		else {
// 			 closeAllMenu();

// 		}
// 		opcl=!opcl;
// 	});
// 	$("#bestid").click(function(){
// 		if(!opcl) {
// 			$("#sottomenu_bestid").css("display","inline");

// 		}
// 		else {
// 			closeAllMenu();

// 		}
// 		opcl=!opcl;
// 	});	
// });
// function buildGenereMenu(){
// 	let htmlLi="";
// 	for(let i=0;i<listageneri.length;i++)
// 		$("#sottomenu0_generiid").append(
// 				$("<li>")
// 				.attr("class","sottomenu1")
// 				.append(
// 						$("<a>").
// 						attr("href",
// 							"../page/listalibri?webfunction=ricercaPergenere&genere="+listageneri[i].id+"&generenome="+listageneri[i].tipologia+"&startRow=1&ricercaPage=4"
// 						).attr("class","menulink")
// 						.text(listageneri[i].tipologia)		
// 						)
		
// 		);

		
				
		
// //		htmlLi=htmlLi+"<li class=\"sottogs\"><a href=\ class=\"mainmas\" >"
// 	//			+listageneri[i].tipologia+"</a></li>";
	

	
	
	
// }
</script>
<div style="display:flex;flex-direction:row;width:100%">

<ul id="menusid" class="menus">
<%if(request.getSession().getAttribute("user")!=null){
	
	User usr=(User) request.getSession().getAttribute("user");
	if(usr.getProfile().getId()>=300){%>
	

			
			<admin-menu class="menu0"></admin-menu>
<!-- 				<li class="sottomenu1"  ><a href="../admin/addbook" class="menulink">Aggiugi Libro</a></li> -->
<!-- 				<li class="sottomenu1"  ><a href="../admin/default" class="menulink">Aggiungi Editore</a></li> -->
<!-- 				<li class="sottomenu1"  ><a href="../admin/default" class="menulink">Aggiungi Autore</a></li> -->
<!-- 				<li class="sottomenu1"><a href="../admin/default" class="menulink">Aggiungi Genere</a> -->

		
	   <script>
/* 		$(document).ready(
		function(){
			$("#gestione_menuid").click(function(){
				if(!opcl) $("#gestione_sottomenuid").css("display","inline")
				else {
					$("#gestione_sottomenuid").css("display","none")
					closeAllMenu();
				}
				opcl=!opcl;
//				attr("style","display:flex;flex-direction:column;")
;
				
				
			})
			
			
			
		}		
		) */
		
		</script>
		
	<% }   
	}
	
	%>
	
	

    <li id="homeid" class="menu0"><a href="<%=request.getContextPath() %>/page/default" class="menulink">Home</a></li>
    
    <li id="aboutid" class="menu0"><a href="#" class="menulink">About&nbsp;Us</a></li>
    
    <li id="genereid" class="menu0" ng-controller="listGeneriCtrl" ><a href="#" ng-click="menuShowGeneriFunction()" class="menulink">Libri&nbsp;Genere</a>
    <ul  ng-hide="menuShowGeneri"  class="sottomenu0">
    	<li ng-repeat="genere in listaGeneri" class="sottomenu1">
    		<a  class="menulink" href='../page/listalibri?webfunction=ricercaPergenere&genere={{genere.id}}&generenome={{genere.tipologia}}&startRow=1&ricercaPage=4'>
    		{{genere.tipologia}}
    		</a>  
    	</li>
    </ul>
    </li>
   
   	<li id="bestid" ng-controller="listBestSellerCtrl" class="menu0"><a href="#"  ng-click="menuShowBestSellerFunction()" class="menulink">Best&nbsp;Seller</a>
  
    <ul id="sottomenu_bestid"    ng-hide="showBestSeller" class="sottomenu0">
    <li class="sottomenu1"><a href="#" class="menulink" >Piu Venduti</a></li>
    <li class="sottomenu1"><a href="#" class="menulink">Tascabili</a></li>
    <li class="sottomenu1"><a href="#" class="menulink">Economici</a></li>
    </ul>
    
    </li>
    <li id="contact" class="menu0"><a href="#" class="menulink">Contact</a></li>
</ul>
<% if(request.getSession().getAttribute("user")!=null && ((User)request.getSession().getAttribute("user")).getId()!=0){
User usr=(User)request.getSession().getAttribute("user");
%>

<img id="omino" src="<%=request.getContextPath()%>/img/ominoin.jpg"  style="margin-right:2px;margin-top:-1px;" width="35px"  height="30px" />
<a id="accedi" href="#" style="text-align:center;margin-top:6px;height:24px;margin-right:2px;"><%=usr.getName()%></a>
<div style="position:relative;">
	
<% } else {%>
<img id="omino" src="<%=request.getContextPath()%>/img/outomino.png"  style="margin-right:2px;margin-top:-1px;" width="35px"  height="30px" />
<a id="accedi" href="#" ng-controller="openloginCtrl" ng-click="openLoginDialog()" style="text-align:center;margin-top:6px;height:24px;margin-right:2px;" >Accedi</a>
<div style="position:relative;">
<%} %>
    
<span id="cartItems" style="font-family: monospace;position:absolute;top:-4px;right: 14px;font-weight: bold;font-size: 17px;font-size: 17px;color:rgb(2,40,79);">0</span>
<img src="<%=request.getContextPath() %>/img/cart2.png" style="background-color:rgb(0, 123, 247);margin-top:-4px;margin-right:3px;" width="35px" height="35px"  />
</div>
</div>
<script type="text/javascript">

function displayAllerta(errore){
	if(errore)
		$("#allertText").text("Errore Applicativo:"+errore.msg);
	else $("#allertText").text("Servizio non siponibile!!");
	$("#allerta").css("display","inherit");
	
}

</script>

 