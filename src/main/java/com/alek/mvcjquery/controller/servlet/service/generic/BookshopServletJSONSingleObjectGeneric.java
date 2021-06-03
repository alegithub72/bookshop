package com.alek.mvcjquery.controller.servlet.service.generic;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alek.mvcjquery.model.service.db.excpetion.ErrorService;

/**
 * Servlet implementation class FunctionSingleObject
 */
public class BookshopServletJSONSingleObjectGeneric extends BookshopServletJSONGeneric {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see BookshopServletJSONGeneric#GenericJSONServlet()
     */
    public BookshopServletJSONSingleObjectGeneric() {
        super();

    }

	@Override
	protected void createjson(HttpServletRequest req, HttpServletResponse resp) throws ErrorService, IOException {
		// TODO Auto-generated method stub
		
	}




}
