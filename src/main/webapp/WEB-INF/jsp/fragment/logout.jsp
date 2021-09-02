<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>



	<script>
	/* 		
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
	
	 */
	</script>
	<div id="logout" ng-controller="loginCtrl" ng-hide="loginModalHide" class="ui-dialog ui-corner-all ui-widget ui-widget-content ui-front ui-dialog-buttons ui-draggable ui-resizable" aria-describedby="dialog-form" aria-labelledby="ui-id-1" style="position: absolute; height: 100px; width: 350px; top: 20%; left: 30%; display: block; z-index: 101;">
  	<div class="ui-dialog-titlebar ui-corner-all ui-widget-header ui-helper-clearfix ui-draggable-handle">
  	<span id="ui-id-1" class="ui-dialog-title">	Do you  want to logout ?</span>
  	<button type="button" ng-click="closeLoginDialog()" class="ui-button ui-corner-all ui-widget ui-button-icon-only ui-dialog-titlebar-close" title="Close">
  	<span class="ui-button-icon ui-icon ui-icon-closethick"></span>
  	<span class="ui-button-icon-space"  > </span>Close</button></div>
	<div class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix">
		<div class="ui-dialog-buttonset">	
			<button type="button" ng-click="logout()" class="ui-button ui-corner-all ui-widget">Logout</button>
			<button type="button" ng-click="closeLoginDialog()"    class="ui-button ui-corner-all ui-widget">Cancel</button>
		</div>
	</div>
	</div> 