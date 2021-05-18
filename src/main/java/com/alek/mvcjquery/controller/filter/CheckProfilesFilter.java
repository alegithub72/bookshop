package com.alek.mvcjquery.controller.filter;

import java.io.IOException;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.alek.mvcjquery.model.service.db.UserCheckServiceDB;
import com.alek.mvcjquery.model.service.db.excpetion.ErroreDataSourceException;
import com.alek.mvcjquery.model.service.db.excpetion.ErroreFunctionPermission;
import com.alek.mvcjquery.model.service.interfaces.UserCheckService;
import com.alek.mvcjquery.model.user.Profile;
import com.alek.mvcjquery.model.user.User;

/**
 * Servlet Filter implementation class CheckProfilesFilter
 */
@WebFilter("/jsonservice/*")
public class CheckProfilesFilter implements Filter {
	Context initContext ;
	Context envContext  ;	
    /**
     * Default constructor. 
     */
    public CheckProfilesFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		//if(!checkProfile(request, response)) request.setAttribute("autorization", "not permitted");
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {

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
	private UserCheckService getUserCheckService() throws ErroreDataSourceException {
		
		UserCheckService userCheckService=new UserCheckServiceDB(getDataSource());
		return userCheckService;
	}
}
