<%@page import="com.alek.mvcjquery.model.user.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<ul id="menusid" class="menus"  >

<% if(request.getSession().getAttribute("user")!=null){
	
	User usr=(User) request.getSession().getAttribute("user");
	if(usr.getProfile().getId()>=300){%>
	

<li id="gestione_menuid" class="menu0" >
	<a href="#"  ng-click="$ctrl.showAdminMenu()" class="menulink">Gestione Bookshop</a>
		<ul id="gestione_sottomenuid" ng-show="$ctrl.adminMenuHide"   class="sottomenu0" >
			<admin-menu></admin-menu>
		</ul>
</li>

		

		
	<% }   
	}
	
	%>	

<li id="homeid" class="menu0"><a href="<%=request.getContextPath() %>/page/default" class="menulink">Home</a></li>
    
    <li id="aboutid" class="menu0"><a href="#" class="menulink">About&nbsp;Us</a></li>
	<li id="genereid" class="menu0" z ><a href="#" ng-click="$ctrl.menuShowGeneriFunction()" class="menulink">Libri&nbsp;Genere</a>
	<ul  ng-hide="$ctrl.generiMenuHide"  class="sottomenu0"><generi-menu></generi-menu></ul>
    </li>

   	<li id="bestid" 	class="menu0"><a href="#"  ng-click="$ctrl.menuShowBestSellerFunction()" class="menulink">Best&nbsp;Seller</a>
    <ul id="sottomenu_bestid"  ng-hide="$ctrl.bestSellMenuHide"  class="sottomenu0">
	<best-menu></best-menu>
    </ul>
    
    </li>
	<li id="contact" class="menu0"><a href="#" class="menulink">Contact</a></li>
</ul>