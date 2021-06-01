package com.alek.mvcjquery.controller.servlet;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alek.mvcjquery.controller.servlet.service.generic.BookshopServletGeneric;
import com.alek.mvcjquery.model.service.db.excpetion.ErroreDataSourceException;
import com.alek.mvcjquery.model.service.db.excpetion.ErroreFunctionPermission;
import com.alek.mvcjquery.model.service.db.excpetion.ErroreLoginAccess;

/**
 * Servlet implementation class BookshopDispachServlet
 */
@WebServlet(name="dispatchservleterror",urlPatterns="/bookshop/error")
public class BookshopDispatchError extends  BookshopServletGeneric {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookshopDispatchError() {
        super();
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
		String urlString="/WEB-INF/jsp/bookshop/error.jsp";
		String back="";
		System.out.println("dispatch  to :"+back+urlString);
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
		doGet(request, response);
	}

}
