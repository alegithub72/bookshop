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
@WebServlet(name="dispatchadminservlet",urlPatterns="/admin/*")
public class BookshopDispatchAdmin extends  BookshopGenericServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookshopDispatchAdmin() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("-------------------------dispatch---admin-----------------------");
		this.printURLInfo(request);
	    String uri = request.getRequestURI();
		try {
			checkProfile(request, response);
		} catch (ErroreDataSourceException | ErroreFunctionPermission | ErroreLoginAccess e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			return;
		}

	    String paths[]=uri.split("/");
		int deep=(int) request.getAttribute("deep");
		if(deep>=4 || deep<3) {
			System.out.println("dispatch error to :send error");
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			return;
		}
		String urlString=
				"/WEB-INF/jsp/admin/"+paths[3]+".jsp";
		System.out.println("dispatch  to :"+urlString);
		RequestDispatcher requestDispatcher=  request.getRequestDispatcher(urlString);
		request.setAttribute(uri, requestDispatcher);
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
