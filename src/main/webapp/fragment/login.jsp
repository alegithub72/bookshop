<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	
	<script>

	$(document).ready(function(){

		$( "#login" ).dialog({
			autoOpen: false,
			width: 300,
			title: "Sign in to bookshop",
			buttons: [
				{
					text: "Ok",
					click: function() {
						console.log("urlRicerca-->"+urlRicerca);	
						dataTmp=$("#loginform").serializeArray();
						dataTmp[2]={name:"startRow",value:startRow};
						dataTmp[3]={name:"ricercaPage",value:ricercaPage};
						//var dataTmp2=$.extend({},dataTmp,extraParam); sostiuisce il valore

						console.log("data--->"+dataTmp);						
		
						var request = $.ajax({
							  url: "../loginuser",
							  method: "POST",
							  data: dataTmp,
							  dataType: "json"
							});
							 
							request.done(function( user ) {
							  console.log( user );
							  if (user.errore) displayAllerta(msg);
							  $("#omino").attr("src","../img/ominoin.jpg");
							  $("#accedi").text(user.name);

//							  $("#dialogcont div").remove();
							  //$("#accedi").unbind("click");
							 // $("#accedi").click(function(){console.log("Non si attiva piu");})

							//var risultati=location.origin+location.pathname+"&startRow="+startRow+"&ricercaPage="+ricercaPage;
							//console.log("--->"+risultati);
							//location.replace(risultati);
							if(user.profile.id>200) location.reload(true);
							});
							 
							request.fail(function( jqXHR, textStatus ) {
							  console.log( "Request failed: " + textStatus );
							  displayAllerta(textStatus);
							});
						
						$( this ).dialog( "close" );
					}
				},
				{
					text: "Cancel",
					click: function() {
						$( this ).dialog( "close" );
					}
				}
			]
		});		
		
		
		$("#accedi").click(function(){
			
			$("#login").dialog("open");
			
		});
		
	})
	</script>

	<div id="login" style="display:none;" class="ui-helper-hidden"> 
	
	<form id="loginform" style="display:flex;" >
	<span style="width:100%;">
	User:
	<input name="userid" type="text" size="10" />	
	</span>
	<span style="width:100%;">
	Password:
	<input  name="password" type="password" size="10" />	
	</span>
	</form> 
	</div> 


	
	