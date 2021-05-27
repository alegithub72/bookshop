<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<script type="text/javascript">
$(document).ready(
		function(){
		


			
		$("#centerPageid").css({"background-color":"rgb(128,0,0)","color":"yellow"})
		.addClass("ui-widget")
		.addClass("ui-widget-content");	
		$("#bodyid")
		.css({"background-color":"rgb(128,0,0)"})
		;
		$("button").button();
		$("button").click(function(){
			 event.preventDefault();
		});

		
		
		
 		});
</script>  
<style>
input , textarea  {
background-color: orange;

}
.ui-widget button {
background: red;/*rgb(255,58,2);*/
border: none;
color:white;
margin:8px;

}

.ui-state-hover, .ui-widget-content .ui-state-hover, .ui-widget-header .ui-state-hover, .ui-state-focus, .ui-widget-content .ui-state-focus, .ui-widget-header .ui-state-focus, .ui-button:hover, .ui-button:focus {
    border: hidden;/*1px solid orange;*/
    background: rgb(255 28 28);
    font-weight: normal;
	color:white;
}
.ui-state-active, .ui-widget-content .ui-state-active, .ui-widget-header .ui-state-active, a.ui-button:active, .ui-button:active, .ui-button.ui-state-active:hover {
    border: 2px solid orange;
    background: yellow;
    font-weight: normal;

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
<input type="text"   size="98" class="ui-input" />
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
<button>ADD</button>
<button>CANCEL</button>
</div>

</form>

</fieldset>