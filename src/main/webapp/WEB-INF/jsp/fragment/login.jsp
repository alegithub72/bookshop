<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	
	<script>

// 	$(document).ready(function(){

// 		$( "#login" ).dialog({
// 			autoOpen: false,
// 			resizable:false,
// 			modal: true,
// 			width: 350,
// 			title: "Log in to bookshop",
// 			buttons: [
// 				{
// 					text: "Ok",
// 					click: function() {
// 						console.log("urlRicerca-->"+urlRicerca);	
// 						dataTmp=$("#loginform").serializeArray();
// 						dataTmp[2]={name:"startRow",value:startRow};
// 						dataTmp[3]={name:"ricercaPage",value:ricercaPage};
// 						//var dataTmp2=$.extend({},dataTmp,extraParam); sostiuisce il valore

// 						console.log("data--->"+dataTmp);						
		
// 						var request = $.ajax({
// 							  url: "../service/loginuser",
// 							  method: "POST",
// 							  data: dataTmp,
// 							  dataType: "json"
// 							});
							 
// 							request.done(function( data ) {
// 							  console.log( data );
// 							  if (data.errore) {
// 								  displayAllerta(data.msg);
// 								  return;
// 							  }
<%-- 							  $("#omino").attr("src","<%=request.getContextPath()%>/img/ominoin.jpg"); --%>
// 							  $("#accedi").text(data.name);

// //							  $("#dialogcont div").remove();
// 							  //$("#accedi").unbind("click");
// 							 // $("#accedi").click(function(){console.log("Non si attiva piu");})

// 							//var risultati=location.origin+location.pathname+"&startRow="+startRow+"&ricercaPage="+ricercaPage;
// 							//console.log("--->"+risultati);
// 							//location.replace(risultati);
// 							if(data.profile.id>200) location.reload(true);
// 							});
							 
// 							request.fail(function( jqXHR, textStatus ) {
// 							  console.log( "Request failed: " + textStatus );
// 							  displayAllerta(textStatus);
// 							});
						
// 						$( this ).dialog( "close" );
// 					}
// 				},
// 				{
// 					text: "Cancel",
// 					click: function() {
// 						$( this ).dialog( "close" );
// 					}
// 				}
// 			]
// 		});		
		
		
// 		$("#accedi").click(function(){
			
// 			$("#login").dialog("open");
			
// 		});
		
// 	})
	</script>

	<div id="login"> 
	<p>Enter your email and password!!</p>
	<form id="loginform" >
	<fieldset>
	<label for="name">User:</label><br>
	<input name="userid" type="text" class="text ui-widget-content ui-corner-all" /><br>
	<label for="password">Password:</label><br>
	<input  name="password" type="password"  class="text ui-widget-content ui-corner-all" />

	</fieldset>	
	</form> 
	</div> 


	
	