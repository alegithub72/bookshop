package com.alek.mvcjquery.controller.servlet;

import java.io.IOException;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.alek.mvcjquery.model.libri.ErrorResponse;
import com.alek.mvcjquery.model.service.ConsultazioneLibreriaService;
import com.alek.mvcjquery.model.service.db.ListaLibriServiceDB;
import com.alek.mvcjquery.model.service.db.UserCheckServiceDB;
import com.alek.mvcjquery.model.service.db.excpetion.ErroreDataSourceException;
import com.alek.mvcjquery.model.service.db.excpetion.ErroreFunctionPermission;
import com.alek.mvcjquery.model.service.interfaces.ListaLibriService;
import com.alek.mvcjquery.model.service.interfaces.UserCheckService;
import com.alek.mvcjquery.model.service.mock.ListaLibriSeviceMock;
import com.alek.mvcjquery.model.user.Profile;
import com.alek.mvcjquery.model.user.User;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public abstract class GenericServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3901434231348304332L;

	public GenericServlet() {
		super();
	}
	Context initContext ;
	Context envContext  ;	
	
	Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
	
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
    	Context initContext;
		try {
			
			initContext = new InitialContext();
			envContext  = (Context)initContext.lookup("java:/comp/env");
			
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();			
		}			
	}

	abstract void createjson(HttpServletResponse resp) throws ServletException,IOException;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/jason");
		resp.setHeader("Access-Control-Allow-Origin", "*");
		try {
			checkProfile(req, resp);
			printURLInfo(req);
			createjson(resp);
		} catch (ErroreDataSourceException e) {
			e.printStackTrace();
			throw new ServletException("DataSource Problem");
		}catch(ErroreFunctionPermission e) {
			e.printStackTrace();
			ErrorResponse error=new ErrorResponse(e.getMessage(),"1000");
			String json=gson.toJson(error);
			resp.getWriter().append(json);
			System.out.println(json);
		
					
		}

	}


	protected void checkProfile(HttpServletRequest request, HttpServletResponse response) throws ErroreDataSourceException,ErroreFunctionPermission {
		
		String functionStr;
		Profile prf;
		User usr= (User)request.getSession().getAttribute("user");
		functionStr = request.getServletPath().substring(1);
		prf = null;
		if(usr==null)
			 usr=new User(0, 0, "utente", null, null);
		 prf= usr.getProfile();	
		 
//		 prf.setNome("Administrator");
//		 request.getSession().setAttribute("user", usr);
		 
		 UserCheckService userCheckService = getUserCheckService();
		 if (!userCheckService.isFunctionAllowed(prf.getId(),functionStr))
				 throw new ErroreFunctionPermission("Funtion Not Allowed with this user");				 
}	
	



	DataSource getDataSource() throws ErroreDataSourceException{
		DataSource ds=null ;
		String msg="";
		try {

			ds = (DataSource)envContext.lookup("jdbc/bookshop");
			System.out.println("Conessione riuscita");
			
		}catch (NamingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				msg=e.getMessage();
						
		}
		
		if (ds==null) throw new ErroreDataSourceException(msg); 
		return ds;
		
	}
	private ConsultazioneLibreriaService getConsulatazioneServiceMock() throws ErroreDataSourceException {
		ListaLibriService  listaLibriService=ListaLibriSeviceMock.getInstance(null);
		ConsultazioneLibreriaService consultazioneLibreriaService=new ConsultazioneLibreriaService(listaLibriService);
	return 	consultazioneLibreriaService;
		
	}

	protected ConsultazioneLibreriaService getConsulatazioneServiceDB() throws ErroreDataSourceException {
		ListaLibriService  listaLibriService=new ListaLibriServiceDB(getDataSource());
		ConsultazioneLibreriaService consultazioneLibreriaService=new ConsultazioneLibreriaService(listaLibriService);
	return 	consultazioneLibreriaService;		
		
	}
	private UserCheckService getUserCheckService() throws ErroreDataSourceException {
		
		UserCheckService userCheckService=new UserCheckServiceDB(getDataSource());
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
	
	
	    System.out.println("Url: " + url + " ");
	    System.out.println("Uri: " + uri + " ");
	    System.out.println("Scheme: " + scheme + " ");
	    System.out.println("Server Name: " + serverName + " ");
	    System.out.println("Port: " + portNumber + " ");
	    System.out.println("Context Path: " + contextPath + " ");
	    System.out.println("Servlet Path: " + servletPath.substring(1) + " ");
	    System.out.println("Path Info: " + pathInfo + " ");
	    System.out.println("Query: " + query);
		
		
	}


}