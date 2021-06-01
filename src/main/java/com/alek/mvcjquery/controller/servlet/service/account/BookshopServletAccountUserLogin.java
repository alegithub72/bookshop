package com.alek.mvcjquery.controller.servlet.service.account;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alek.mvcjquery.controller.servlet.service.generic.BookshopServletJSONGeneric;
import com.alek.mvcjquery.model.service.db.excpetion.ErrorService;
import com.alek.mvcjquery.model.service.db.excpetion.ErroreDataSourceException;
import com.alek.mvcjquery.model.service.db.excpetion.ErroreFunctionPermission;
import com.alek.mvcjquery.model.service.db.excpetion.ErroreLoginAccess;
import com.alek.mvcjquery.model.service.interfaces.UserCheckService;
import com.alek.mvcjquery.model.user.User;

/**
 * Servlet implementation class LoginUser
 */
@WebServlet("/service/loginuser")
public class BookshopServletAccountUserLogin extends BookshopServletJSONGeneric {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see BookshopServletJSONGeneric#GenericJSONServlet()
     */
    public BookshopServletAccountUserLogin() {
        super();

    }

	@Override
	protected void createjson(HttpServletRequest req, HttpServletResponse resp) throws ErrorService, IOException {
		Object obj=req.getSession().getAttribute("user");
		User usr=null;
		if(obj!=null) usr=(User)obj;
		String json=gson.toJson(usr);
		System.out.println(json);
		resp.getWriter().append(json);
	}

	@Override
	protected void checkProfile(HttpServletRequest request, HttpServletResponse response)
			throws ErroreDataSourceException, ErroreFunctionPermission,ErroreLoginAccess {
		String userid=request.getParameter("userid");
		String pass=request.getParameter("password");
		String ricercaUSR=request.getParameter("ricercaUSR");
		String startRow=request.getParameter("startRow");
		String ricercaPage=request.getParameter("ricercaPage");
		System.out.println("--");
		System.out.println("user="+userid);
		System.out.println("pass="+pass);
		System.out.println("ricercaUSR="+ricercaUSR);
		System.out.println("startRow="+startRow);
		System.out.println("ricercaPage="+ricercaPage);
		System.out.println("--");
		UserCheckService service=getUserCheckService();
		User usr=service.loginuser(userid, pass);
		if(usr!=null ) {
			usr.setRicercaURL(ricercaUSR);
			usr.setStartRow(startRow);
			usr.setRicercaPage(ricercaPage);
			request.getSession().setAttribute("user", usr);
			
		} else throw new ErroreLoginAccess("Acessso non permesso!!!");
		
	}



}
