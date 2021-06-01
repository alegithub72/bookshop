<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>



	<script>
$(document).ready(function(){
		
		$( "#logout" ).dialog({
			autoOpen: false,
			resizable:false,
			modal: true,
			width: 300,
			title: "Logout from bookshop",
			buttons: [
				{
					text: "Yes",
					click: function() {
						
						console.log($("#loginform").serializeArray());
						var request = $.ajax({
							  url: "../service/logoutuser",
							  method: "POST",
							  //data: $("#loginform").serializeArray(),
							  dataType: "json"
							});
							 
							request.done(function( user ) {
							  console.log( user );
							  if (user.errore) displayAllerta(msg);
							  $("#omino").attr("src","../img/outomino.png");
							  $("#accedi").text("Accedi");

//							  $("#dialogcont div").remove();
							  //$("#accedi").unbind("click");
							 // $("#accedi").click(function(){console.log("Non si attiva piu");})
							 if(user.profile.id<=200) location.reload(true);
							});
							 
							request.fail(function( jqXHR, textStatus ) {
							  console.log( "Request failed: " + textStatus );
							  displayAllerta(textStatus);
							});
						
						$( this ).dialog( "close" );
					}
				},
				{
					text: "No",
					click: function() {
						$( this ).dialog( "close" );
					}
				}
			]
		})
		;		
		
		
		$("#accedi").click(function(){
			
			$("#logout").dialog("open");
		});
		
	})
	
	
	</script>
	<div id="logout"  class="ui-helper-hidden"> 
	<p>
	<span class="ui-icon ui-icon-alert"></span>
	Do you  want to logout ?
	</p>
	</div> 