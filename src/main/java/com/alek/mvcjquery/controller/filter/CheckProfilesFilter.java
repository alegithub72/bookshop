package com.alek.mvcjquery.controller.filter;

import java.io.IOException;

import javax.naming.Context;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

/**
 * Servlet Filter implementation class CheckProfilesFilter
 */
@WebFilter("/*")
public class CheckProfilesFilter implements Filter {
	Context initContext ;
	Context envContext  ;	
    /**
     * Default constructor. 
     */
    public CheckProfilesFilter() {
        // TODO Alessio Prova
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Alessio2
	}
	protected void printURLInfo(HttpServletRequest cont) {
	   String url = cont.getRequestURL().toString();
	
	    // Getting servlet request query string.
	  //  String queryString = cont.getQueryString();
	
	    // Getting request information without the hostname.
	    String uri = cont.getRequestURI();
	
	    // Below we extract information about the request object path
	    // information.
	    String scheme = cont.getScheme();
	    String serverName = cont.getServerName();
	    int portNumber = cont.getServerPort();
	    String contextPath = cont.getContextPath();
	    String servletPath = cont.getServletPath();
	    String pathInfo = cont.getPathInfo();
	    String query = cont.getQueryString();
	    String localadress=cont.getLocalAddr();
	
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
	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		//if(!checkProfile(request, response)) request.setAttribute("autorization", "not permitted");
		// pass the request along the filter chain
		System.out.println("-------------------------filter--------------------------");
		HttpServletRequest req=(HttpServletRequest)request;
	//	HttpServletResponse resp=(HttpServletResponse)response;
		printURLInfo(req);
		String uri =req.getRequestURI();
		String[] path= uri.split("/");
		System.out.println("path deep="+(path.length-1));
		req.setAttribute("deep", (path.length-1));

		System.out.println("---------------------------------------------------------");
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {

	}
	


		
}
