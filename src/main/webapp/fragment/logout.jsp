<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>



	<script>
$(document).ready(function(){
		
		$( "#logout" ).dialog({
			autoOpen: false,
			width: 300,
			title: "Logout from bookshop",
			buttons: [
				{
					text: "Logout",
					click: function() {
						
						console.log($("#loginform").serializeArray());
						var request = $.ajax({
							  url: "../logout",
							  method: "POST",
							  //data: $("#loginform").serializeArray(),
							  dataType: "json"
							});
							 
							request.done(function( user ) {
							  console.log( user );
							  if (user.errore) displayAllerta(msg);
							  $("#omino").attr("src","../img/outomino.jpg");
							  $("#accedi").text("Accedi");

//							  $("#dialogcont div").remove();
							  //$("#accedi").unbind("click");
							 // $("#accedi").click(function(){console.log("Non si attiva piu");})
//							 if(user.profile.id>200) location.reload(true);
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
			
			$("#logout").dialog("open");
			
		});
		
	})
	
	
	</script>
	<div id="logout" style="display:none;" class="ui-helper-hidden"> 

	</div> 