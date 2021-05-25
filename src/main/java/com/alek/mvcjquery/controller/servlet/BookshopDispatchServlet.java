package com.alek.mvcjquery.controller.servlet;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alek.mvcjquery.model.service.db.excpetion.ErroreDataSourceException;
import com.alek.mvcjquery.model.service.db.excpetion.ErroreFunctionPermission;
import com.alek.mvcjquery.model.service.db.excpetion.ErroreLoginAccess;

/**
 * Servlet implementation class BookshopDispachServlet
 */
@WebServlet(name="dispatchservlet",urlPatterns="/page/*")
public class BookshopDispatchServlet extends  BookshopGenericServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookshopDispatchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("-------------------------dispatch-------------------------------");
		this.printURLInfo(request);
	    String uri = request.getRequestURI();
		try {
			checkProfile(request, response);
		} catch (ErroreDataSourceException | ErroreFunctionPermission | ErroreLoginAccess e) {
			e.printStackTrace();
			response.sendRedirect("./page/error");
			return;
		}
	    String paths[]=uri.split("/");
		if(paths==null || ((paths!=null)&& paths.length<=3) ) {
			response.sendRedirect("./page/error");
			return;
		}
 
		RequestDispatcher requestDispatcher=  request.getRequestDispatcher("../bookshop/"+paths[3]+".jsp");
		request.setAttribute(uri, requestDispatcher);
		//if("error".equals(paths[3]))
		//	response.sendRedirect("../bookshop/error.jsp");
		//else	
			requestDispatcher.forward(request, response);

		System.out.println("----------------------------------------------------------------");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
