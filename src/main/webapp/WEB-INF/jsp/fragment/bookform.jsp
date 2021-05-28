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
		$("select").selectmenu();

		
		
		
 		});
</script>  
<style>
.formTitle{
text-align:end;
color:yellow;
vertical-align:baseline;
}
.formValue{
text-align:initial;
vertical-align: baseline;

}

input , textarea { 
 background-color: orange; 
	color:yellow;
 } 
.ui-button,
.ui-button:hover,
.ui-button:focus{
background:rgb(128,0,0) ;/*rgb(255,58,2);*/
border: 1px solid black;
color:yellow;
margin:8px;

}
.ui-widget-content{
color:yellow;
background:rgb(128,0,0) ;/*rgb(255,58,2);*/

}
.ui-widget.ui-widget-content{
border: 1px solid black;
}
.ui-widget-content .ui-state-active{
background: rgb(255 28 28);
border:1px solid yellow;
color:yellow;
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
<td class="formValue"><input type="date"  /></td>
</tr>
<tr>
<td class="formTitle" >Autore:</td>
<td class="formValue"><button>+</button></td>
</tr>
<tr>
<td class="formTitle">Editore:</td>
<td class="formValue"><button>+</button></td>
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