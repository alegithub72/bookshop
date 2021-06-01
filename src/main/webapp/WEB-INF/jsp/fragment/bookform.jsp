<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<script type="text/javascript">
/*rgb(128,0,0) dark red */
$(document).ready(
		function(){
		
		$("#idcss").attr("href","<%=request.getContextPath() %>/css/jquery-red-ui.css");

		$("centerPageid");

		$("button").button();
		$("#idbuttonautore").click(function(){
			createAutoreDialog();	
			$( "#iddialogautore" ).dialog("open");
			 event.preventDefault();
		}); 
		
		$("#idbuttoneditore").click(function(){
			createEditoreDialog();	
			$( "#iddialogeditore" ).dialog("open");
			 event.preventDefault();
		});		
		
		$("select").selectmenu();
		
		var data=$("#iddatapubblicazione").datepicker({dateFormat:"dd/MM/yy"});
		

		
		});
		
function createEditoreDialog() {

	
		$( "#iddialogeditore" ).dialog({
			autoOpen: false,
			resizable:false,
			modal: true,
			width: 350,
			title: "Scegli l'editore?",
			buttons: [
				{
					text: "add",
					click: function() {
						console.log("add editore....");		
						$("#idlabeleditore").val($("#ideditoreauto").val());
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
		$( "#ideditoreauto" ).autocomplete({
					  source: [ "Feltrinnelli", "Mondadori", "Utet", "EditoreA", "EditoreB", "EditoreC", "EditoreD" ]
					});
			
}

function createAutoreDialog() {

	
	$( "#iddialogautore" ).dialog({
		autoOpen: false,
		resizable:false,
		modal: true,
		width: 350,
		title: "Scegli l'autore?",
		buttons: [
			{
				text: "add",
				click: function() {
					console.log("add editore....");		
					$("#idlabelautore").val($("#idautoreauto").val());
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
	$( "#idautoreauto" ).autocomplete({
				  source: [ "W.Smith", "A. Manzoni", "A.Dante", "F.Petrarca", "A.Barricco", "B.Yoshimoto" ]
				});
		
}
</script>  
<style>
.formTitle{
text-align:end;
color:;
vertical-align:baseline;
}

.formValue{
text-align:initial;
vertical-align: baseline;

}


.custom-red{
color:yellow;
background-color:red; 
}
.centerPageRed input,select,textarea{
background-color:red;
color:yellow;
}



</style>  
<fieldset>
<legend>Aggiungi un libro</legend>


<form id="addbookformid">
<table  id="formdivid">
<tr>
<td class="formTitle">Titolo:</td>
<td class="formValue"><input type="text"   size="98" class="ui-input" /></td>
</tr>
<tr>
<td class="formTitle">Descrizione:</td>
<td class="formValue"><textarea rows="5" cols="100">Inserire un breve descrizione!!</textarea></td>
</tr>
<tr>
<td class="formTitle">Prezzo:</td>
<td class="formValue"><input type="number"  /></td>
</tr>
<tr>
<td class="formTitle">Data publicazione:</td>
<td class="formValue"><input id="iddatapubblicazione" type="text"  >

</td>
</tr>
<tr>
<td class="formTitle" >Autore:</td>
<td class="formValue"><input type="text" id="idlabelautore" disabled="disabled"><button id="idbuttonautore">+</button></td>
</tr>
<tr>
<td class="formTitle">Editore:</td>
<td class="formValue"><input type="text" id="idlabeleditore" disabled="disabled"><button id="idbuttoneditore">+</button></td>
</tr>
<tr>
<td class="formTitle">Genere:</td>
<td class="formValue"><select><option>Avventura</option><option>Romanzo</option><option>Giallo</option><option>Fantascienza</option></select></td>

</tr>
</table>
<br><br>

<div id="idbutton" style="text-align:center;">
<button>ADD</button>
<button>CANCEL</button>
</div>

</form>

</fieldset>
<div id="iddialogeditore" >

<fieldset>
<form>
<input id="ideditoreauto" >
</form>


</fieldset>
</div>

<div id="iddialogautore" >

<fieldset>
<form>
<input id="idautoreauto" >
</form>


</fieldset>
</div>

