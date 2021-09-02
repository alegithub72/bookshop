<%@page import="com.alek.mvcjquery.model.user.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<style type="text/css"> 
.menus {
    font-family: Verdana, sans-serif;
    font-size: 11px;
    opacity: 0.99;
    display: flex;
    flex-direction: row;
    justify-content: space-around;
    height: 30px;
    padding-inline-start: 0 !important;
    margin-top: -6px;
    width: 98%;

}
.menu0 {
	background-color: rgb(0, 123, 247);
    border-bottom: 5px solid rgb(0, 64, 128);
    display: flex;
    flex-direction: column;
    width: 20%;
    height: 100%;
    margin: 2px;
    text-align: center;
    padding-inline-start: 0 !important;
}
.menulink {
	color: #ffff;
    display: flex;
    flex-direction: row;
    font-weight: bold;
    font-size: large;
    text-decoration: none;
    justify-content: center;
    /* margin-top: 30px; */
    text-align: center;
    margin-left: 10px;
    margin-right: 10px;
} 

ul#menusid li:active,ul#menusid li:hover {
    background-color: rgb(166, 210, 255);/*#54BAE2;*/
/*     border-bottom: 5px solid rgb(0, 64, 128); */
}


ul#menusid li#gestione_menuid:hover{
	background-color: yellow;
}

li#gestione_menuid {
	background-color: red;
	border-color: rgb(174,0,0);
}

li#gestione_menuid li{
	background-color: red;
	border: 2px solid yellow;


}
li#gestione_menuid li:hover,li#gestione_menuid li:hover{
	background-color: yellow;

}
ul#gestione_menuid {
	background-color:none;

}
.sottomenu0 {
font-family: Verdana, sans-serif;
    font-size: 11px;
    display: inline;
    /* opacity: 0.99; */
    width: 100%;
    padding-inline-start: 0!important;
    margin-top: 11px;
    margin-left: 0px;
    padding: 1px;
    /* width: 800px; */
    text-align: center;



}
.sottomenu1 {
background-color: rgb(0, 123, 247);
    /* border-bottom: 5px solid rgb(0, 64, 128); */
    /* display: block; */
    /* width: 15%; */
    /* height: 80px; */
    margin: 3px;
    /* text-align: -webkit-center; */
    /* float: left; */
    list-style: none;
    border: 3px  solid  rgb(166, 210, 255);
}

/* .mainmas { */
/* color: #ffff; */
/*     /* display: block; */ */
/*     font-weight: bold; */
/*     /* line-height: 80px; */ */
/*     font-size: large; */
/*     text-decoration: none; */
/*     /* width: 18%; */ */
/*     /* height: 30px; */ */
/*     /* text-align: justify; */
/* }  */

    </style>


<div style="display:flex;flex-direction:row;width:100%">

<general-menu class="menus"></general-menu>

<% if(request.getSession().getAttribute("user")!=null && ((User)request.getSession().getAttribute("user")).getId()!=0){
User usr=(User)request.getSession().getAttribute("user");
%>

<img id="omino" src="<%=request.getContextPath()%>/img/ominoin.jpg"  style="margin-right:2px;margin-top:-1px;" width="35px"  height="30px" />
<a id="accedi" href="#" style="text-align:center;margin-top:6px;height:24px;margin-right:2px;"><%=usr.getName()%></a>
<div style="position:relative;">
	
<% } else {%>
<img id="omino" src="<%=request.getContextPath()%>/img/outomino.png"  style="margin-right:2px;margin-top:-1px;" width="35px"  height="30px" />
<a id="accedi" href="#" ng-controller="openloginCtrl" ng-click="openLoginDialog()" style="text-align:center;margin-top:6px;height:24px;margin-right:2px;" >Accedi</a>
<div style="position:relative;">
<%} %>
    
<span id="cartItems" style="font-family: monospace;position:absolute;top:-4px;right: 14px;font-weight: bold;font-size: 17px;font-size: 17px;color:rgb(2,40,79);">0</span>
<img src="<%=request.getContextPath() %>/img/cart2.png" style="background-color:rgb(0, 123, 247);margin-top:-4px;margin-right:3px;" width="35px" height="35px"  />
</div>
</div>


 