package com.alek.mvcjquery.controller.servlet;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alek.mvcjquery.model.service.db.excpetion.ErrorService;
import com.alek.mvcjquery.model.service.db.excpetion.ErroreDataSourceException;
import com.alek.mvcjquery.model.service.db.excpetion.ErroreFunctionPermission;
import com.alek.mvcjquery.model.service.db.excpetion.ErroreLoginAccess;
import com.alek.mvcjquery.model.service.interfaces.UserCheckService;
import com.alek.mvcjquery.model.user.User;

/**
 * Servlet implementation class LoginUser
 */
@WebServlet("/loginuser")
public class LoginUser extends GenericJSONServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see GenericJSONServlet#GenericJSONServlet()
     */
    public LoginUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	@Override
	void createjson(HttpServletRequest req, HttpServletResponse resp) throws ErrorService, IOException {
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
		System.out.println("------------------------------------------------------------");
		System.out.println("user="+userid);
		System.out.println("pass="+pass);
		System.out.println("------------------------------------------------------------");
		UserCheckService service=getUserCheckService();
		User usr=service.loginuser(userid, pass);
		if(usr!=null) {
			request.getSession().setAttribute("user", usr);
			
		} else throw new ErroreLoginAccess("Acessso non permesso!!!");
		
	}



}