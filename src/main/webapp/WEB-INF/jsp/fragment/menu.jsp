<%@page import="com.alek.mvcjquery.model.user.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<style type="text/css"> 

    </style>





<script>
let listageneri;
$(document).ready(function(){
	
	$.getJSON("../service/ricercalistejson?webfunction=generi",function(data){

		listageneri=data;
		console.log("----------------->"+data);
		})
		.done(function(){
				if(listageneri.errore) {
					displayAllerta(listageneri.errore);
					
					return;
				}
			//buildGenereMenu();

				
			})
		.fail(function(){
			displayAllerta(listageneri);
			
		
		});
	
	
})

function displayAllerta(errore){
	if(errore)
		$("#allertText").text("Errore Applicativo:"+errore.msg);
	else $("#allertText").text("Servizio non siponibile!!");
	$("#allerta").css("display","inherit");
	
}

</script>
<div id="menuBar" style="width:100%">



<%-- <%if(request.getSession().getAttribute("user")!=null){ --%>
	
// 	User usr=(User) request.getSession().getAttribute("user");
<%-- 	if(usr.getProfile().getId()>=300){%> --%>
		
<!-- 		menu admin -->
<%-- 	<% } --%>
<%-- 	}%> --%>
	



<% if(request.getSession().getAttribute("user")!=null && ((User)request.getSession().getAttribute("user")).getId()!=0){
User usr=(User)request.getSession().getAttribute("user");
%>

	
<% } else {%>

<%} %>
    

</div>

<script type="text/babel">
function Menu() {
	const menusStyle= { 
	marginBlockEnd: "0",
	marginBlockStart: "0",	
	backgroundColor : "#cce6ff",
	color:"blue",
	justifyContent:"space-evenly",
	flexWrap:"nowrap",
	display: "flex",
	flexDirection:"row",
	listStyleType:"none",
	width:"90%"
	};
	const menusItemStyle= {
		fontSize:"30px"
	};
	const bannerStyle={height:'175px'};
	const menusIconStyle ={
		display:"flex",
		flexWrap:"nowrap",
		justifyContent:"space-beteween",
		backgroundColor : "#cce6ff"
	};
	const avatarStyle ={
		display:"flex",
		flexWrap:"nowrap"
	};
	const cartStyle ={
		position:"absolute",
		left:"0px",
		top:"10px",
		color:"darkblue"
	};
	const accediStyle ={
		position:"absolute",
		left:"0px",
		top:"20px"
	};
    return <>
			
			<div id="menuId" >
			<div id="banner"  style={bannerStyle} >
			<img src="<%=request.getContextPath() %>/img/banner.png" width="100%"  style={{height:'175px', margin:'0 0 0 0'}} />
			</div>
			<div style={menusIconStyle}>
			<ul style={menusStyle}>
			<li style={menusItemStyle}>Home</li>
			<li style={menusItemStyle}>About us</li>
			<li style={menusItemStyle}>Book List</li>
			<li style={menusItemStyle}>Contact</li>
			</ul>
			<div style={avatarStyle}>
			<div style={{float:"left",position:"relative"}} >
			<img src="<%=request.getContextPath() %>/img/cart2.png"  width="35px" height="35px"  />
			<span id="cartItems" style={cartStyle} >0</span>
			</div>
			<div style={{float:"left",position:"relative",marginLeft:"10px"}} >
			<img id="omino" src="<%=request.getContextPath()%>/img/outomino.png"  style={{marginRight:"2px",marginTop:"-1px"}} width="35px"  height="30px" />
			<a id="accedi" href="#" style={accediStyle} >Accedi</a>
			</div>

			</div>
			</div>
			</div>
</>;
  }
const navDomNode = document.getElementById('menuBar');
const navRoot = ReactDOM.createRoot(navDomNode); 
navRoot.render(<Menu />);


</script>



<%
Object obj=request.getSession().getAttribute("user");

if(obj!=null && ((User)obj).getId()!=0){%>

		
	
		<%@include file="/WEB-INF/jsp/fragment/logout.jsp" %>
		
	<% } else { %>
	
		<%@include file="/WEB-INF/jsp/fragment/login.jsp" %>

		
		
	<% } %>



	
	



<div id="allerta" class="ui-widget" style="display:none;">
	<div class="ui-state-error ui-corner-all" style="padding: 0 .7em;">
		<p><span class="ui-icon ui-icon-alert" style="float: none; margin-right: .3em;"></span>
		<strong>Alert:</strong> <span id="allertText" ></span></p>
	</div>
</div>
</div>