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
@WebServlet(name="dispatchservleterror",urlPatterns="/bookshop/error")
public class BookshopDispatchError extends  BookshopGenericServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookshopDispatchError() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("-------------------------dispatch---errror----------------------");
		this.printURLInfo(request);
	    String uri = request.getRequestURI();
		try {
			checkProfile(request, response);
		} catch (ErroreDataSourceException | ErroreFunctionPermission | ErroreLoginAccess e) {
			e.printStackTrace();
			return;
		}
		String urlString="bookshop/error.jsp";
		String back="../";
		int deep=(int)request.getAttribute("deep");
		if(deep>=4) {
			for(int i=3;i<deep;i++) back=back+"../";
			response.sendRedirect(back+urlString);			
			return;
			
		}
		if(deep<3) {
			urlString="error.jsp";
			System.out.println("dispatch  to :"+urlString);
			response.sendRedirect(urlString);			
			return;
			
		}
		System.out.println("dispatch  to :"+urlString);
		RequestDispatcher requestDispatcher=  request.getRequestDispatcher(back+urlString);
		request.setAttribute(uri, requestDispatcher);
		//response.sendRedirect(urlString);
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
