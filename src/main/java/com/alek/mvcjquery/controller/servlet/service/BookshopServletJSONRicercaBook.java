package com.alek.mvcjquery.controller.servlet.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alek.mvcjquery.controller.servlet.service.generic.BookshopServletJSONGeneric;
import com.alek.mvcjquery.model.service.ConsultazioneLibreriaService;
import com.alek.mvcjquery.model.service.db.ListaLibriServiceDB;
import com.alek.mvcjquery.model.service.db.excpetion.ErrorService;
import com.alek.mvcjquery.model.service.db.excpetion.ErroreDataSourceException;
import com.alek.mvcjquery.model.service.interfaces.ListaLibriService;
import com.alek.mvcjquery.model.service.mock.ListaLibriSeviceMock;


/**
 * Servlet implementation class ListaLibri
 */
@WebServlet(name = "servicericercabooksjson", urlPatterns = { "/service/ricercalistejson" })
public class BookshopServletJSONRicercaBook extends BookshopServletJSONGeneric {
	private static final long serialVersionUID = 1L;

public static int  PAGE=4; 

    /**
     * @see HttpServlet#HttpServlet()
     */ 
    public BookshopServletJSONRicercaBook() {
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
	protected void createjson(HttpServletRequest req, HttpServletResponse resp) throws ErrorService,IOException{
		
		List list=null;
		String strFunction=req.getParameter("webfunction");
		
		if("generi".equals(strFunction)) list=listaGeneri();
		else if ("ricercaPergenere".equals(strFunction)) 
			list=listaLibriPerGenere(req);
		else throw new ErrorService("Funzione non prevista!!!");
		String json=gson.toJson(list);
		System.out.println("trasformazione json:"+json);
		resp.getWriter().append(json);
	}
	
	private List listaLibriPerGenere(HttpServletRequest req)throws ErrorService {
		String idgenere=req.getParameter("genere");

		int start=convertParameterToInt(req.getParameter("startRow"),1);
		int page=convertParameterToInt(req.getParameter("ricercaPage"),5);
		if(page!=BookshopServletJSONRicercaBook.PAGE) throw new ErrorService("Paging fault");
		List listaLibri=consultazioneLibreriaService.listaLibriPerGeneri(idgenere,start,page);
		System.out.println("Lista Libri 8");
		return listaLibri;
	}

	private List listaGeneri() throws ErrorService {
		
		return consultazioneLibreriaService.listaGeneri();
	}

	private int convertParameterToInt(String p,int valueDefault) {
		int n=valueDefault;
		try {
			n=Integer.parseInt(p);			
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}finally{
			System.out.println("p="+p+",n"+n);
			
		}
		return n;
		
	}
	
	protected ConsultazioneLibreriaService getConsulatazioneServiceMock() throws ErroreDataSourceException {
		ListaLibriService  listaLibriService=new ListaLibriSeviceMock(null);
		ConsultazioneLibreriaService consultazioneLibreriaService=new ConsultazioneLibreriaService(listaLibriService);
	return 	consultazioneLibreriaService;
		
	}

	protected ConsultazioneLibreriaService getConsulatazioneServiceDB() throws ErroreDataSourceException {
		initDataSource();
		ListaLibriService  listaLibriService=new ListaLibriServiceDB(ds);
		ConsultazioneLibreriaService consultazioneLibreriaService=new ConsultazioneLibreriaService(listaLibriService);
	return 	consultazioneLibreriaService;		
		
	}	
	
}
