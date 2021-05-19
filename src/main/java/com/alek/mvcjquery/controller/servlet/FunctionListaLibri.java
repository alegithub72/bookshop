package com.alek.mvcjquery.controller.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
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
import com.alek.mvcjquery.model.service.db.excpetion.ErrorService;
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
public class FunctionListaLibri extends GenericJSONServlet {
	private static final long serialVersionUID = 1L;



    /**
     * @see HttpServlet#HttpServlet()
     */ 
    public FunctionListaLibri() {
        super();
      
    }
	ConsultazioneLibreriaService consultazioneLibreriaService;
    
	@Override
	public void init() throws ServletException {
		super.init();
		try {
			consultazioneLibreriaService= getConsulatazioneServiceDB();
		} catch (ErroreDataSourceException e) {
			e.printStackTrace();
			throw new ServletException(e.getMessage());
		}
	}
	
	

 

	@Override
	void createjson(HttpServletRequest req, HttpServletResponse resp) throws ErrorService,IOException{
		
		List list=null;
		String strFunction=req.getParameter("function");
		if("generi".equals(strFunction)) list=listaGeneri();
		else if ("ricercaPergenere".equals(strFunction)) 
			list=listaLibriPerGenere(req);
		String json=gson.toJson(list);
		System.out.println("trasformazione json:"+json);
		resp.getWriter().append(json);
	}
	
	private List listaLibriPerGenere(HttpServletRequest req)throws ErrorService {
		String idgenere=req.getParameter("genere");
		List listaLibri=consultazioneLibreriaService.listaLibriPerGeneri(idgenere);
		System.out.println("Lista Libri 8");
		return listaLibri;
	}

	private List listaGeneri() throws ErrorService {
		
		return consultazioneLibreriaService.listaGeneri();
	}

}
