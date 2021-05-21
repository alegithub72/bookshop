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

function ricercaLibri(start,page){
	let erroreApp=false;
	$.getJSON("../ricercalibrijson?function=ricercaPergenere&genere=<%=request.getParameter("genere")%>&start="+start+"&page="+page,function(data){

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
				displayAllerta(listalibri1.errore);
				
				return;
			}
			dataTableRicercaLibri();

			
		})
	.fail(function(){
		displayAllerta(errore);
		
	
	});

}
var startRow=1,page=5;
function nextRicerca(){
	$("#listalilbri").html("");
	startRow=startRow+page;
	ricercaLibri(startRow,page);

}
function prevRicerca(){
	$("#listalibri").html("");
	startRow=startRow-page;
	if(startRow<0)startRow=0;
	ricercaLibri(startRow,page);
}
$(document).ready(function(){
	
	ricercaLibri(1,5);

	$("#categoria").text($("#categoria").text()+"<%=request.getParameter("generenome")%>");
	
}

);

	
function dataTableRicercaLibri(){

	let id=$("#titoli").val();
	console.log($("#titoli").val());
	let htmlEspositore="";
	let categoria;
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
		"<span style=\"display:flex;flex-direction:row;justify-content:flex-end;\">"+
		"<span class=\"nomi\">"+libro.prezzo+" &euro;   &nbsp;&nbsp;&nbsp;&nbsp;</span><span class=\"valori\"><button id=\"buttonCart"+libro.id+"\">Add</button></span>"+
		"</span>"+	
		"</span>"+
		"</span>";
		categoria=libro.genere.tipologia;

	});
	if(listalibri1.length==0) {
		htmlEspositore="<h2 style=\"margin: inherit;color:blue;\">Nessun risultato</h2>";
	
	}
	htmlEspositore=htmlEspositore+"<div style=\"width:100%;\"><div id=\"nextprev\">"+
	"<a id=\"idprev\" href=\"#\">prev</a>&nbsp;&nbsp;&nbsp;"+ 
	"<a id=\"idnext\"  href=\"#\" >next</a>"+
	"</div></div>"
	$("#listalibri").html(htmlEspositore);
	$("#idnext").click(nextRicerca);
	
	if(startRow>1) $("#idprev").click(prevRicerca);
	else $("#idprev").css("text-decoration","none");
	
	addCartSimulationBottoni(listalibri1);
}

let cart=1;
function addCartSimulationBottoni(lista){
	for(let  i =0;i<lista.length;i++)
	$("#buttonCart"+lista[i].id).click(function(){
		$("#cartItems").html(cart++);
	});

}
	
	
	

</script> 



<h1 id="categoria">Libri per Categorie:</h1>

   

<div id="listalibri"  class="espositore">











</div>

<p>Trova le email in un lampo
Con l'efficace strumento di Ricerca Google nella Posta in arrivo, 
puoi archiviare tutte le email e trovarle successivamente in un attimo.
 La tua casella di Posta in arrivo rimane ordinata e non ti dovrai più preoccupare
  di quali email tenere.</p>
