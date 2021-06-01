package com.alek.mvcjquery.controller.servlet.service.account;

import com.alek.mvcjquery.controller.servlet.service.generic.BookshopServletGeneric;
import com.alek.mvcjquery.controller.servlet.service.generic.BookshopServletJSONGeneric;
import com.alek.mvcjquery.model.service.db.excpetion.ErrorService;
import com.alek.mvcjquery.model.service.db.excpetion.ErroreDataSourceException;
import com.alek.mvcjquery.model.service.db.excpetion.ErroreFunctionPermission;
import com.alek.mvcjquery.model.service.db.excpetion.ErroreLoginAccess;
import com.alek.mvcjquery.model.user.User;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BookshopServletAccountLogout
 */
@WebServlet(name = "servletlogout", urlPatterns = { "/service/logoutuser" })
public class BookshopServletAccountLogout extends BookshopServletJSONGeneric {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see BookshopServletGeneric#BookshopServletGeneric()
     */
    public BookshopServletAccountLogout() {
        super();
    }

	@Override
	protected void createjson(HttpServletRequest req, HttpServletResponse resp) throws ErrorService, IOException {
		User usr=new User(0, 100, "webuser",null,null);
		String json=gson.toJson(usr);
		System.out.println(json);
 	    resp.getWriter().append(json);
		
	}

	@Override
	protected void checkProfile(HttpServletRequest request, HttpServletResponse response)
			throws ErroreDataSourceException, ErroreFunctionPermission, ErroreLoginAccess {
		request.getSession().invalidate();
	}
	



}
