<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<style>
	.espositore {
	
	border:  1px solid black;  
	margin-left: auto; margin-right: auto;
	width:100%;
/* 	margin-top:5%; */
	flex-wrap: wrap;
    flex-direction: row;
    /* flex-flow: wrap; */
    display: flex;
	}
	.titolo   {
	
	color: black;
	font-weight: bold;
	font-size: 20px;
	text-align: left;
	margin-top:auto;
/* 	border:  1px solid black; */
	
	}
.altreinfo   {
	
	color: black;
	font-weight: bold;
	text-align: left;
	margin-top:auto;
	font-size: 15px;
    text-align: left;
    /* border: 1px solid black; */
    font-style: italic;
/* 	border:  1px solid black; */
	
	}
	.titolovalori   {
	
	color: blue;
	font-size: 20px;
	margin-top:auto;
/* 	border:  1px solid black; */
	
	}
.altreinfovalori   {
	
	color: blue;
	font-size: 15px;
/* 	border:  1px solid black; */
	font-style: italic;
	}
	.tavola2 {
	
    /* position: relative; */
    /* left: 0.4%; */
    width: 85%;
    /* right: 10%; */
    
	
	}
	tr:nth-child(even) {background-color: rgb(128,255,128);}
	tr:nth-child(odd) {background-color: rgb(128,255,128);}
	.dettaglio {
	
		text-align:left;
    background-color: yellow;
    margin: 4px;		
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
			stampaLibro();
			
		})
	.fail(function(){
		alert("Errore applicativo!!");
		
	
	});
	
	
	
});


	
function stampaLibro(){

	let id=$("#titoli").val();
	console.log($("#titoli").val());
	let htmlEspositore="";
	$.each(listalibri1,function(i,libro){
		console.log("id="+libro.id)
		 htmlEspositore=htmlEspositore+
		"<span class=\"dettaglio\">"+
		"<span  id=\"dettagli\" class=\"columnValori\" >"+
		"<span style=\"display:flex;flex-direction:row;\">"+
		"<img src=\"noimage.png\" width=\"60px\" height=\"60px\"/><span class=\"titolo\">Titolo:</span><span class=\"titolovalori\">"+libro.titolo+"</span>"+
		"</span>"+
		"<span style=\"display:flex;flex-direction:row;\">"+
		"<span class=\"altreinfo\">Autore:</span> <span class=\"altreinfovalori\">"+libro.autore.cognome+" "+libro.autore.nome+"</span>"+
		"</span>"+
		"<span style=\"display:flex;flex-direction:row;\">"+
		"<span class=\"nomi\">Edzione:</span> <span class=\"valori\">"+libro.dataPublicazione+", "+libro.edizione.editore+","+libro.genere.tipologia+"</span>"+
		"</span>"+
		"</span>"+
		"</span>";
		
	});
	$("#listalibri").append(htmlEspositore);
	
}

</script> 



<h1>Libri per Categorie</h1>

   

<div id="listalibri"  class="espositore">











</div>
<p>Trova le email in un lampo
Con l'efficace strumento di Ricerca Google nella Posta in arrivo, 
puoi archiviare tutte le email e trovarle successivamente in un attimo.
 La tua casella di Posta in arrivo rimane ordinata e non ti dovrai pi� preoccupare
  di quali email tenere.</p>
