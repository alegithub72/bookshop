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
    justify-content: center;
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
    background-color: rgb(166,210,255);
    margin: 4px;		
	}
	.columnValori {
	
	display:flex;
	flex-direction:column;
	
	}
</style>


<script>

var listaricerca;
var libroId;

function ricercaLibri(start,page){
	let erroreApp=false;
	$.getJSON("../ricercalibrijson?function=ricercaPergenere&genere=<%=request.getParameter("genere")%>&start="+start+"&page="+page,function(data){

	//const json = cleanIt(data);  // {"name":"John Smith"}
	//console.log(json);
	//console.log("---------------------unquoted-------------------");
	//console.log(unquoted);  // {name:"John Smith"}
	listaricerca=data;

	console.log(data);
	})
	.done(function(){
		//alert("sucess :"+listalibri1.nome);
		//console.log(listalibri1[0].titolo); 
		//console.log(listalibri.length);
			if(listaricerca.errore) {
				displayAllerta(listaricerca.errore);
				
				return;
			}
			dataTableRicercaLibri();

			
		})
	.fail(function(){
		displayAllerta(errore);
		
	
	});

}
var startRow=1,page=5,pageNum=1;
function nextRicerca(){
	$("#listalilbri").html("");
	startRow=startRow+page;
	pageNum++;
	ricercaLibri(startRow,page);

}
function prevRicerca(){
	$("#listalibri").html("");
	startRow=startRow-page;
	pageNum--;
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
	$.each(listaricerca,function(i,libro){
		console.log("id="+libro.id)
		 htmlEspositore=htmlEspositore+
		"<span class=\"dettaglio\">"+
		"<span  id=\"dettagli\" class=\"columnValori\" >"+
		"<span style=\"display:flex;flex-direction:row;\">"+
		"<img src=\"../img/book"+(i+1)+".jpg\" width=\"60px\" height=\"60px\"/>"+
		//"<span class=\"titolo\">Titolo:</span>"+
		"<span class=\"titolovalori\">"+libro.titolo+"</span>"+
		"</span>"+
		"<span style=\"display:flex;flex-direction:row;\">"+
		"<span class=\"altreinfo\">Autore:</span> <span class=\"altreinfovalori\">"+libro.autore.cognome+" "+libro.autore.nome+"</span>"+
		"</span>"+
		"<span style=\"display:flex;flex-direction:row;\">"+
		"<span class=\"nomi\">Edzione:</span> <span class=\"valori\">"+libro.dataPublicazione+", "+libro.edizione.editore+","+libro.genere.tipologia+"</span>"+
		"</span>"+
		"<span style=\"display:flex;flex-direction:row;flex-direction: column;justify-content:center;\">"+		
		"</span>"+		
		"<span class=\"nomi\" style=\"text-align:center;\">"+libro.prezzo+" &euro;   &nbsp;&nbsp;&nbsp;&nbsp;</span>"+
		"<span class=\"valori\"  style=\"text-align:center;\"  ><button id=\"buttonCart"+libro.id+"\">Add</button></span>"+
		"</span>"+
		"</span>";
		categoria=libro.genere.tipologia;

	});
	if(listaricerca.length==0) { 
		htmlEspositore="<h2 style=\"margin: inherit;color:blue;\">Nessun risultato</h2>";
	
	}
	htmlEspositore=htmlEspositore+"<div style=\"width:100%;\"><div id=\"nextprev\">"+
	"<button id=\"idprev\" href=\"#\">prev</button>"+ 
	"&nbsp;&nbsp;&nbsp;<span>"+pageNum+"</span>&nbsp;&nbsp;&nbsp;"+
	"<button id=\"idnext\"  href=\"#\" >next</button>"+
	"</div></div>"
	$("#listalibri").html(htmlEspositore);
	
	$( "#idprev" ).button({
		icon: "ui-icon-circle-arrow-w",
		showLabel: false
	});
	$( "#idnext" ).button({
		icon: "ui-icon-circle-arrow-e",
		showLabel: false
	}); 
	if(startRow>1) $("#idprev").click(prevRicerca);
	else $("#idprev").remove()//css("text-decoration","none");
	if(listaricerca.length<page) $("#idnext").remove()//css("text-decoration","none");
	else $("#idnext").click(nextRicerca); 
	
	addCartSimulationBottoni(listaricerca);
}

let cart=1;
function addCartSimulationBottoni(lista){
	for(let  i =0;i<lista.length;i++){
		$("#buttonCart"+lista[i].id).button({label:"Add to cart"});
		$("#buttonCart"+lista[i].id).click(function(){
			$("#cartItems").html(cart++);
		});
	}



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
