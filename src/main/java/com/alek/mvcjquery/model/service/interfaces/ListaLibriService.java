package com.alek.mvcjquery.model.service.interfaces;

import java.util.List;

import com.alek.mvcjquery.model.libri.Edizione;
import com.alek.mvcjquery.model.service.db.excpetion.ErrorService;

public interface ListaLibriService {

	public List listaLibri(Edizione edi);
	public List listaLibriPerGeneri(String idgenere,int start,int page) throws ErrorService;
	public List listaGeneri() throws ErrorService;

 
}