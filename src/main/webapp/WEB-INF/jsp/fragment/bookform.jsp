<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<script type="text/javascript">
$(document).ready(
		function(){
		$("#centerPageid").css("background-color","rgb(128,0,0)");	
		$("#bodyid")
		.addClass("ui-widget")
		.addClass("ui-widget-content")
		.css({"background-color":"rgb(128,0,0)","color":"yellow"})
		;
		$()
		$("#idbutton")
		.append($("<button>").button({label:"ADD"}))
		.append($("<button>").button({label:"CANCEL"}));
		
		
		
		});
</script>  
<style>
input , textarea  {
background-color: orange;

}
.ui-widget button {
background: orange;
border: yellow;
color:red;
active:yellow;
}
.ui-button button:hover {
color:yellow;
}
</style>  
<fieldset>
<legend>Aggiungi un libro</legend>


<form id="addbookformid">
<table  id="formdivid">
<tr>
<td style="text-align:end;">

Titolo:
</td>
<td style="text-align:initial;">
<input type="text"   size="20" class="ui-input" />
</td>
</tr>
<tr>
<td style="text-align:end;vertical-align:baseline;">
Descrizione:
</td>
<td>
<textarea rows="5" cols="100">Inserire un breve descrizione!!</textarea>
</td>
</tr>
<tr>
<td style="text-align:end;">
Prezzo:
</td>
<td style="text-align:initial;">
<input type="number"  />
</td>
</tr>
<tr>
<td style="text-align:end;">
Data publicazione:
</td>
<td style="text-align:initial;">
<input type="date"  />
</td>
</tr>
</table>
<br><br>

<div id="idbutton" style="text-align:center;">

</div>

</form>

</fieldset>