package com.alek.mvcjquery.controller.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alek.mvcjquery.model.libri.ErrorResponse;
import com.alek.mvcjquery.model.service.ConsultazioneLibreriaService;
import com.alek.mvcjquery.model.service.db.ListaLibriServiceDB;
import com.alek.mvcjquery.model.service.db.excpetion.ErrorService;
import com.alek.mvcjquery.model.service.db.excpetion.ErroreDataSourceException;
import com.alek.mvcjquery.model.service.db.excpetion.ErroreFunctionPermission;
import com.alek.mvcjquery.model.service.db.excpetion.ErroreLoginAccess;
import com.alek.mvcjquery.model.service.interfaces.ListaLibriService;
import com.alek.mvcjquery.model.service.mock.ListaLibriSeviceMock;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public abstract class BookshopGenericJSONServlet extends BookshopGenericServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3901434231348304332L;

	public BookshopGenericJSONServlet() {
		super();
	}

	Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();



	abstract void createjson(HttpServletRequest req,  HttpServletResponse resp) throws ErrorService,IOException;
	
	
	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		genericRequest(req, resp);
	}

	
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		genericRequest(req, resp);
	}

	protected void genericRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/jason");
		resp.setHeader("Access-Control-Allow-Origin", "*");
		try {
			System.out.println("-------------------------GENERIC REQUEST------------------------------------");
			checkProfile(req, resp);
			printURLInfo(req);
			createjson(req,resp);
			System.out.println("----------------------------------------------------------------------------");
		} catch (ErroreDataSourceException e) {
			e.printStackTrace();
			throw new ServletException("DataSource Problem");
		}catch(ErroreFunctionPermission e) {
			e.printStackTrace();
			ErrorResponse error=new ErrorResponse(e.getMessage(),"1000");
			String json=gson.toJson(error);
			resp.getWriter().append(json);
			System.out.println(json);
		} catch (ErrorService e) {
			e.printStackTrace();
			ErrorResponse error=new ErrorResponse(e.getMessage(),"1010");
			String json=gson.toJson(error);
			resp.getWriter().append(json);
			System.out.println(json);			
		} catch (ErroreLoginAccess e) {
			e.printStackTrace();
			ErrorResponse error=new ErrorResponse("Accesso negato", "1030");
			String json=gson.toJson(error);
			resp.getWriter().append(json);
			System.out.println(json);
		
		}

	}



	




		

		
	
	protected ConsultazioneLibreriaService getConsulatazioneServiceMock() throws ErroreDataSourceException {
		ListaLibriService  listaLibriService=new ListaLibriSeviceMock(ds);
		ConsultazioneLibreriaService consultazioneLibreriaService=new ConsultazioneLibreriaService(listaLibriService);
	return 	consultazioneLibreriaService;
		
	}

	protected ConsultazioneLibreriaService getConsulatazioneServiceDB() throws ErroreDataSourceException {
		ListaLibriService  listaLibriService=new ListaLibriServiceDB(ds);
		ConsultazioneLibreriaService consultazioneLibreriaService=new ConsultazioneLibreriaService(listaLibriService);
	return 	consultazioneLibreriaService;		
		
	}




}