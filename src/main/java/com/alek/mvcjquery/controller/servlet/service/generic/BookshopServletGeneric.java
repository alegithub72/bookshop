package com.alek.mvcjquery.controller.servlet.service.generic;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.alek.mvcjquery.model.service.db.excpetion.ErroreDataSourceException;
import com.alek.mvcjquery.model.service.db.excpetion.ErroreFunctionPermission;
import com.alek.mvcjquery.model.service.db.excpetion.ErroreLoginAccess;
import com.alek.mvcjquery.model.service.interfaces.UserCheckService;
import com.alek.mvcjquery.model.service.mock.UserCheckServiceMock;
import com.alek.mvcjquery.model.user.Profile;
import com.alek.mvcjquery.model.user.User;

public abstract class BookshopServletGeneric extends HttpServlet {

	public BookshopServletGeneric() {
		super();
	}
	Context initContext ;
	Context envContext  ;	
	DataSource ds;
	protected void getDataSource() throws ErroreDataSourceException{
		 ;
		String msg="";
		try {
			if(ds==null)
			ds = (DataSource)envContext.lookup("jdbc/bookshop");
			
			System.out.println("dasource trovato");
			
		}catch (NamingException e) {
				e.printStackTrace();
				msg=e.getMessage();
				throw new ErroreDataSourceException(msg);
						
		}
	}
	protected void checkProfile(HttpServletRequest request, HttpServletResponse response) throws ErroreDataSourceException,ErroreFunctionPermission,ErroreLoginAccess {
		
		String functionStr;
		Profile prf;
		User usr = (User)request.getSession().getAttribute("user");
		functionStr = request.getServletPath().substring(1);
		prf = null;
		if(usr==null) {
			// prf.setNome("Administrator");
			 usr=new User(0, 100, "webuser", null, null);
			 request.getSession().setAttribute("user", usr);

		}
		 	 prf= usr.getProfile();	
		 
//		 prf.setNome("Administrator");
//		 request.getSession().setAttribute("user", usr);
		 
		 UserCheckService userCheckService = getUserCheckService();
		 if (!userCheckService.isFunctionAllowed(prf.getId(),functionStr))
				 throw new ErroreFunctionPermission("Funtion Not Allowed with this user");				 
}	
	
	protected UserCheckService getUserCheckService() throws ErroreDataSourceException {
		
		UserCheckService userCheckService=new UserCheckServiceMock(ds);
		return userCheckService;
	}

	protected void printURLInfo(HttpServletRequest request) {
	    String url = request.getRequestURL().toString();
	
	    // Getting servlet request query string.
	    String queryString = request.getQueryString();
	
	    // Getting request information without the hostname.
	    String uri = request.getRequestURI();
	
	    // Below we extract information about the request object path
	    // information.
	    String scheme = request.getScheme();
	    String serverName = request.getServerName();
	    int portNumber = request.getServerPort();
	    String contextPath = request.getContextPath();
	    String servletPath = request.getServletPath();
	    String pathInfo = request.getPathInfo();
	    String query = request.getQueryString();
	    String localadress=request.getLocalAddr();
	
	    System.out.println("Url: " + url + " ");
	    System.out.println("Uri: " + uri + " ");
	    System.out.println("Scheme: " + scheme + " ");
	    System.out.println("Server Name: " + serverName + " ");
	    System.out.println("Port: " + portNumber + " ");
	    System.out.println("Context Path: " + contextPath + " ");
	  //  System.out.println("Servlet Path: " + servletPath.substring(1) + " ");
	    System.out.println("Path Info: " + pathInfo + " ");
	    System.out.println("Query: " + query);
	    System.out.println("Query: " + localadress);
	    
		
		
	}
	@Override
	public void init() throws ServletException {
		super.init();
		try {		
			initContext = new InitialContext();
			envContext  = (Context)initContext.lookup("java:/comp/env");
	
			
		} catch (NamingException e) {
			e.printStackTrace();			
		}			
	}	

}