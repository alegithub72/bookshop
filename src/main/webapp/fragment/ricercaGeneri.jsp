<%@page import="com.alek.mvcjquery.controller.servlet.FunctionRicercaJSON"%>
<%@page import="com.alek.mvcjquery.model.user.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
User usr;
String startRow=""+1;
String ricercaPage=""+FunctionRicercaJSON.PAGE;
Object obj2=request.getSession().getAttribute("user");

if(obj2!=null && ((User)obj2).getId()!=0){
	startRow=((User)obj2).getStartRow();
	ricercaPage=((User)obj2).getRicercaPage();
}
%>
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
var startRow=1,ricercaPage=4,pageNum=1;
function ricercaLibri(start,page){
	let erroreApp=false;
	urlRicerca="../ricercalistejson?webfunction=ricercaPergenere&genere=<%=request.getParameter("genere")%>&startRow="+startRow+"&ricercaPage="+ricercaPage;
	$.getJSON(urlRicerca,function(data){

	listaricerca=data;
	console.log("JSON return:")
	console.log(data);
	
	})
	.done(function(){

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

function nextRicerca(){
	$("#listalilbri").html("");
	startRow=startRow+ricercaPage;
	pageNum++;
	ricercaLibri(startRow,ricercaPage);

}
function prevRicerca(){
	$("#listalibri").html("");
	startRow=startRow-ricercaPage;
	pageNum--;
	if(startRow<0)startRow=0;
	ricercaLibri(startRow,ricercaPage);
}
$(document).ready(function(){
	startRow=<%=startRow%>;
	ricercaPage=<%=ricercaPage%>;
	pageNum=Math.round(startRow/ricercaPage)+1;
	ricercaLibri(startRow,ricercaPage);

	$("#categoria").text($("#categoria").text()+"<%=request.getParameter("generenome")%>");
	
}

);

let cart=1;
function dataTableRicercaLibri(){

	let htmlEspositore="";
	let categoria;
	$("#risultatiricerca").html("");
	$("#idprevnext").remove();
	$.each(listaricerca,function(i,libro){
		
		
		console.log("id="+libro.id)
		
		var divdettaglio=$("<div>")
		.css({"display":"flex",
			"flex-direction":"column",
			"margin": "10px",
	    	"align-items": "center"	,
	    	"background-color":" rgb(166,210,255)",
	    	"width":"15%",
	    //	"height":"400px"
		})
		.attr("id","iddettaglio"+libro.id);
		
		var copertina =$("<img>")
		.attr("src","../img/book"+(i+1)+".jpg")
		.attr("width","100px")
		.attr("height","150px");
		
		var titolo=$("<span>")
		.text(libro.titolo)
		.css({
			"font-size": "larger",
	    	"font-weight": "bold"
	    	});
		
		
		var autore=$("<span>")
		.text("Autore:"+libro.autore.cognome+" "+libro.autore.nome);
		
		var tipo=$("<span>")
		.text("Tipo:"+libro.genere.tipologia);
		
		var editore=$("<span>")
		.text("Editore:"+libro.edizione.editore);
		var prezzo=$("<span>").html("Prezzo:")
		.append($("<span>")		
				.text(libro.prezzo)
				.css({"margin-block-start":"auto","color":"blue"}));

		
		var  addCart=$("<button>")
		.attr("id","buttonCart"+libro.id)
		.button({"label":"Add to cart","classes":{"width":"100%"}})
		.css({"margin-top":"auto",
		"margin-top": "10px",
	    "margin-bottom": "10px"	
		
		});
		addCart.click(function(){$("#cartItems").html(cart++);});
		
		divdettaglio
		.append(copertina)
		.append(addCart)
		.append(titolo)
		.append(tipo)
		.append(autore)
		.append(editore)
		.append(prezzo)


		
		
		$("#risultatiricerca")
		.append(divdettaglio)
		.css({"display":"flex","flex-direction":"row"});		

		categoria=libro.genere.tipologia;

	});

	
	var buttonprev=$( "<button>" ).button({
		icon: "ui-icon-circle-arrow-w",
		showLabel: false
	})
	.attr("id","idprev");
	
	
	var buttonnext=$( "<button>" ).button({
		icon: "ui-icon-circle-arrow-e",
		showLabel: false
	})
	.attr("id","idnext"); 
	
	var nextprev=$("<div>")
	.css({"display":"flex","flex-direction":"row"})
	.append(buttonprev)
	.append($("<span>").text(pageNum))
	.append(buttonnext)
	.attr("id","idprevnext");
	
	$("#risultatiricerca")
	.after(nextprev);
	
	if(startRow>1) $("#idprev").click(prevRicerca);
	else $("#idprev").remove()//css("text-decoration","none");
	if(listaricerca.length<ricercaPage) $("#idnext").remove()//css("text-decoration","none");
	else $("#idnext").click(nextRicerca); 
	
	if(listaricerca.length==0) { 
		var zeroRisultati=$("<h2>")
		.css({"margin": "inherit","color":"blue"})
		.html("Nessun Risultato");
		$("#risultatiricerca").html(zeroRisultati);
		$("#idprevnext").remove();
	}	
	

}


</script> 



<h1 id="categoria">Libri per Categorie:</h1>

   

<div id="risultatiricerca"  class="espositore">











</div>

<p>Trova le email in un lampo
Con l'efficace strumento di Ricerca Google nella Posta in arrivo, 
puoi archiviare tutte le email e trovarle successivamente in un attimo.
 La tua casella di Posta in arrivo rimane ordinata e non ti dovrai più preoccupare
  di quali email tenere.</p>
