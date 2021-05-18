package com.alek.mvcjquery.controller.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.alek.mvcjquery.model.libri.ErrorResponse;
import com.alek.mvcjquery.model.libri.Libro;
import com.alek.mvcjquery.model.service.ConsultazioneLibreriaService;
import com.alek.mvcjquery.model.service.db.excpetion.ErroreDBException;
import com.alek.mvcjquery.model.service.db.excpetion.ErroreDataSourceException;
import com.alek.mvcjquery.model.service.db.excpetion.ErroreFunctionPermission;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.google.gson.reflect.TypeToken;


/**
 * Servlet implementation class ListaLibri
 */
@WebServlet(name = "listalibri", urlPatterns = { "/jsonlistalibri" })
public class FunctionListaLibri extends GenericServlet {
	private static final long serialVersionUID = 1L;



    /**
     * @see HttpServlet#HttpServlet()
     */ 
    public FunctionListaLibri() {
        super();
      
    }
    
    
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();

	}
	
	

 

	@Override
	void createjson(HttpServletResponse resp) throws ServletException,IOException{
		try {
			ConsultazioneLibreriaService consultazioneLibreriaService= getConsulatazioneServiceDB();
			List listaLibri=consultazioneLibreriaService.listaLibri();
			System.out.println("Lista Libri 8");
			resp.getWriter().append(gson.toJson(listaLibri));
		} catch (ErroreDataSourceException e) {
			e.printStackTrace();
			throw new ServletException("DataSource Problem");
		}
		
	}
	
	


}