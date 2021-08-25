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
  <style>
    label, input { display:block; }
    input.text { margin-bottom:12px; width:95%; padding: .4em; }
    fieldset { padding:0; border:0; margin-top:25px; }
    h1 { font-size: 1.2em; margin: .6em 0; }
    div#users-contain { width: 350px; margin: 20px 0; }
    div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }
    div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left; }
    .ui-dialog .ui-state-error { padding: .3em; }
    .validateTips { border: 1px solid transparent; padding: 0.3em; }
  </style>

  
  <div tabindex="-1" ng-controller="loginCtrl" ng-hide="loginModalHide" novalidate role="dialog" class="ui-dialog ui-corner-all ui-widget ui-widget-content ui-front ui-dialog-buttons ui-draggable ui-resizable" aria-describedby="dialog-form" aria-labelledby="ui-id-1" style="position: absolute; height: 300px; width: 350px; top: 20%; left: 30%; display: block; z-index: 101;">
  <div class="ui-dialog-titlebar ui-corner-all ui-widget-header ui-helper-clearfix ui-draggable-handle">
  <span id="ui-id-1" class="ui-dialog-title">Enter your email and password!!</span>
  <button type="button" ng-click="closeLoginDialog()" class="ui-button ui-corner-all ui-widget ui-button-icon-only ui-dialog-titlebar-close" title="Close">
  <span class="ui-button-icon ui-icon ui-icon-closethick"></span>
  <span class="ui-button-icon-space"  > </span>Close</button></div>
  <div id="dialog-form" class="ui-dialog-content ui-widget-content" >
	<form>
		<fieldset>
			<label for="email">Email</label>
			<input type="text"  ng-model="userid"   class="text ui-widget-content ui-corner-all" required>
			<label for="password">Password</label>
			<input type="password"  ng-model="pswd"   class="text ui-widget-content ui-corner-all" required>
		</fieldset>
	</form>
</div>
<div class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix">
<div class="ui-dialog-buttonset">
<button type="button" ng-click="login()" class="ui-button ui-corner-all ui-widget">Login</button>
<button type="button" ng-click="closeLoginDialog()"    class="ui-button ui-corner-all ui-widget">Cancel</button>
</div>
</div>

</div>
  
  
  
  
<!-- 	<div class="ui-dialog ui-corner-all ui-widget ui-widget-content ui-front ui-dialog-buttons ui-draggable ui-resizable" > -->
	 
<!-- 	<span class="ui-dialog-title" style="position: absolute; height: auto; width: 350px; top: 8px; left: 148.5px; display: block; z-index: 101;" >Enter your email and password!!</span> -->

<!-- 	<label for="name">User:</label><br> -->
<!-- 	<input name="userid" type="text" ng-model="userid" class="text ui-widget-content ui-corner-all" /><br> -->
<!-- 	<label for="password">Password:</label><br> -->
<!-- 	<input  name="password" type="password"  ng-model="pswd" class="text ui-widget-content ui-corner-all" /> -->
<!-- 	<div class="ui-dialog-buttonset"> -->
<!-- 	<button class="ui-button ui-corner-all ui-widget" ng-click="login()">login</button><button class="ui-button ui-corner-all ui-widget"  >cancel</button> -->
<!-- 	</div> -->
<!-- 	</div>  -->


	
	