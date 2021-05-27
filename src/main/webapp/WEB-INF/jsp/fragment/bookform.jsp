<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<script type="text/javascript">
/*rgb(128,0,0) dark red */
$(document).ready(
		function(){
		


			
		$("#centerPageid").css({"background-color":"red","color":"yellow"})
		.addClass("ui-widget")
		.addClass("ui-widget-content");	

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
.ui-button,
.ui-button:hover,
.ui-button:focus{
background:rgb(128,0,0) ;/*rgb(255,58,2);*/
border: 1px solid black;
color:yellow;
margin:8px;

}

.ui-button:hover {
    border: 1px solid black;/*1px solid orange;*/
    background: rgb(255 28 28);
    font-weight: normal;
/* 	color:white; */
}
 .ui-button:active {
    border: hidden;
    background: rgb(80,0,0);
    font-weight: normal;
	color:black;
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