package com.alek.mvcjquery.model.service;

import java.util.List;

import com.alek.mvcjquery.model.service.db.excpetion.ErrorService;
import com.alek.mvcjquery.model.service.interfaces.ListaLibriService;

public class ConsultazioneLibreriaService {
	
	ListaLibriService listaService;
	public ConsultazioneLibreriaService(ListaLibriService listaService) {
		this.listaService=listaService;
	}
	
	
	public List listaLibriPerGeneri(String idgenere,int start,int page) throws ErrorService  {
		
		return listaService.listaLibriPerGeneri(idgenere,start,page);
		
	}
	public int listaLibriCount() throws ErrorService {
		
		return 16;
		
	}
	public List listaGeneri() throws ErrorService{
		return listaService.listaGeneri();
		
	}



	
	

}
