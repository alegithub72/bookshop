package com.alek.mvcjquery.model.service.mock;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.alek.mvcjquery.model.libri.Autore;
import com.alek.mvcjquery.model.libri.Edizione;
import com.alek.mvcjquery.model.libri.Genere;
import com.alek.mvcjquery.model.libri.Libro;
import com.alek.mvcjquery.model.service.db.excpetion.ErrorService;
import com.alek.mvcjquery.model.service.interfaces.ListaLibriService;



public class ListaLibriSeviceMock implements ListaLibriService {
	
	private static ListaLibriService service;
	
	public static  ListaLibriService  getInstance(Connection conn) {
		if(service==null) service=new ListaLibriSeviceMock();
		return service;
	}
	
	@Override
	public List<Libro> listaLibri(Edizione edi) {
		
        List<Libro> listaLibri = new ArrayList<Libro>();
        Autore autore1=new Autore(2001,"Smith","Wilbur","Professore");
        Autore autore2=new Autore(2010,"Pablo","Allende","Attore");
        Autore autore3=new Autore(2020,"Yoshimoto","Banana","Attore");
        Edizione ed1=new Edizione(3030,"Feltrinelli");
        Edizione ed2=new Edizione(3040,"Bonpiani");
        Edizione ed3=new Edizione(3050,"Feltrinelli");
        Genere genere=new Genere(5000,"Avventura");
        Libro libro1=new Libro(4070,"Tre uomini in barca",new Date(1972,5,12  ), autore1,10.5f, ed1,genere );
        Libro libro2=new Libro(4070,"Tre uomini in barca",new Date(1972,5,12  ), autore2,10.5f, ed2,genere);
        Libro libro3=new Libro(4080,"Capitan Mick", new Date(2000,5,12  ),autore3,9.99f, ed3,genere);
        listaLibri.add(libro1);
        listaLibri.add(libro2);
        listaLibri.add(libro3);
		
		
		return listaLibri;
		
	}
	@Override
	public List listaGeneri() throws ErrorService{
        List<Libro> listaLibri = new ArrayList<Libro>();
        Autore autore1=new Autore(2001,"Smith","Wilbur","Professore");
        Autore autore2=new Autore(2010,"Pablo","Allende","Attore");
        Autore autore3=new Autore(2020,"Yoshimoto","Banana","Attore");
        Edizione ed1=new Edizione(3030,"Feltrinelli");
        Edizione ed2=new Edizione(3040,"Bonpiani");
        Edizione ed3=new Edizione(3050,"Feltrinelli");
        Genere genere=new Genere(5000,"Avventura");
        Libro libro1=new Libro(4060,"i viaggi di Gulliver", new Date(1942,5,12  ),autore1,25f, ed1,genere);
        Libro libro2=new Libro(4070,"Tre uomini in barca",new Date(1942,5,12  ) ,autore2,12.99f ,ed2,genere);
        Libro libro3=new Libro(4080,"Capitan Mick",new Date(1942,5,12  ) ,autore3, 3.5f,ed3,genere);
        listaLibri.add(libro1);
        listaLibri.add(libro2);
        listaLibri.add(libro3);
		
		
		return listaLibri;
	}


	
	
}
