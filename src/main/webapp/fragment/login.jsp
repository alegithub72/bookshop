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
						
						console.log($("#loginform").serializeArray());
						var request = $.ajax({
							  url: "../loginuser",
							  method: "POST",
							  data: $("#loginform").serializeArray(),
							  dataType: "json"
							});
							 
							request.done(function( user ) {
							  console.log( user );
							  if (user.errore) displayAllerta(msg);
							  $("#omino").attr("src","../img/ominoin.jpg");
							  $("#accedi").text(user.name);
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
	
	<div id="login" style="display:none;"> 
	
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
	
	
	
	