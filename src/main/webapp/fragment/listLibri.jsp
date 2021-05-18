<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<style>
	.tavola {
	
	border:  1px solid black;  
	margin-left: auto; margin-right: auto;
	width:100%;
/* 	margin-top:5%; */
	
	}
	.nomi   {
	
	color: black;
	font-weight: bold;
	font-size: 20px;
	text-align: left;
/* 	border:  1px solid black; */
	
	}
	.valori   {
	
	color: blue;
	font-size: 20px;
/* 	border:  1px solid black; */
	
	}
	.tavola2 {
	
    /* position: relative; */
    /* left: 0.4%; */
    width: 85%;
    /* right: 10%; */
    
	
	}
	tr:nth-child(even) {background-color: rgb(128,255,128);}
	tr:nth-child(odd) {background-color: rgb(128,255,128);}
	.columnTitle {
	
		text-align:left;
	}
	.columnValori {
	
	display:flex;
	flex-direction:column;
	
	}
</style>


<script>

var listalibri1;
var libroId;
$(document).ready(function(){
	let erroreApp=false;
	$.getJSON("../jsonlistalibri",function(data){

	//const json = cleanIt(data);  // {"name":"John Smith"}
	//console.log(json);
	//console.log("---------------------unquoted-------------------");
	//console.log(unquoted);  // {name:"John Smith"}
	listalibri1=data;

	console.log(data);
	})
	.done(function(){
		//alert("sucess :"+listalibri1.nome);
		//console.log(listalibri1[0].titolo); 
		//console.log(listalibri.length);
			if(listalibri1.errore) {
				alert(listalibri1.msg);
				return;
			}
		let opzioniHtml="<select id='titoli'>";
		for(let i=0;i<listalibri1.length;i++){
			opzioniHtml=opzioniHtml+"<option value='"+listalibri1[i].id+"'>"+listalibri1[i].titolo+"</option>";
			//$("#titoli").html("<option value='"+listalibri1[i].id+"'>"+listalibri1[i].titolo+"</option>");
			
			console.log(listalibri1[i].id+" id :"+listalibri1[i].titolo);
		}
		opzioniHtml=opzioniHtml+"</select>";

		$("#lista").html(opzioniHtml);
		$("select").change(stampaLibro);
			
		})
	.fail(function(){
		alert("Errore applicativo");
		
	
	});
	
	
	
});


	
function stampaLibro(){
	let libroSel;
	let id=$("#titoli").val();
	console.log($("#titoli").val());
	$.each(listalibri1,function(i,libro){
		console.log("id="+libro.id)
		if(libro.id==id)
		libroSel=libro;
	});
	$("#dettagli").html("<span style=\"display:flex;flex-direction:row;\">"+
	"<span class=\"nomi\">Titolo:</span><span class=\"valori\">"+libroSel.titolo+" </span>"+
	"</span>"+
	"<span style=\"display:flex;flex-direction:row;\">"+
	"<span class=\"nomi\">Autore:</span> <span class=\"valori\">"+libroSel.autore.nome+" "+libroSel.autore.cognome+ "</span>"+
	"</span>"+
	"<span style=\"display:flex;flex-direction:row;\">"+
	"<span class=\"nomi\">Edzione:</span> <span class=\"valori\">"+libroSel.dataPublicazione+" , "+libroSel.edizione.editore+"</span>"+
	"</span>"
	);
	
}

</script> 



<h1>Libri per Categorie</h1>

   

<table id="listaLibri"  class="tavola">

<tr>

<td class="columnTitle">Libri disponibili:
	</td>
<td class="valori" id="lista">

</td>
<td class="columnTitle">
Dettaglio libro:
</td>
<td  id="dettagli" class="columnValori" >
<span style="display:flex;flex-direction:row;">
<span class="nomi">Titolo:</span><span class="valori"> I  Miserabili </span>
</span>
<span style="display:flex;flex-direction:row;">
<span class="nomi">Autore:</span> <span class="valori">Alessandro Manzoni</span>
</span>
<span style="display:flex;flex-direction:row;">
<span class="nomi">Edzione:</span> <span class="valori">10/10/204 , Feltrinelli</span>
</span>
</td>
</tr>








</table>
<p>Trova le email in un lampo
Con l'efficace strumento di Ricerca Google nella Posta in arrivo, 
puoi archiviare tutte le email e trovarle successivamente in un attimo.
 La tua casella di Posta in arrivo rimane ordinata e non ti dovrai più preoccupare
  di quali email tenere.</p>
