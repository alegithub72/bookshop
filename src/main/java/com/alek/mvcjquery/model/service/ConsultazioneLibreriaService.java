package com.alek.mvcjquery.model.service;

import java.util.List;

import com.alek.mvcjquery.model.service.interfaces.ListaLibriService;

public class ConsultazioneLibreriaService {
	
	ListaLibriService listaService;
	public ConsultazioneLibreriaService(ListaLibriService listaService) {
		this.listaService=listaService;
	}
	
	
	public List listaLibri() {
		
		return listaService.listaGeneri();
		
	}
	
	

}
