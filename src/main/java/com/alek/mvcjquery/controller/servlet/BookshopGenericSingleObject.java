package com.alek.mvcjquery.controller.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alek.mvcjquery.model.service.db.excpetion.ErrorService;

/**
 * Servlet implementation class FunctionSingleObject
 */
@WebServlet("/ricercaSingola")
public class BookshopGenericSingleObject extends BookshopGenericJSONServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see BookshopGenericJSONServlet#GenericJSONServlet()
     */
    public BookshopGenericSingleObject() {
        super();

    }

	@Override
	void createjson(HttpServletRequest req, HttpServletResponse resp) throws ErrorService, IOException {
		
		
	}


}
