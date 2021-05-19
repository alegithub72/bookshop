package com.alek.mvcjquery.model.libri;

import java.sql.Date;
import java.text.SimpleDateFormat;

import com.google.gson.annotations.Expose;

public class Libro {
	@Expose
	private String titolo;
	@Expose
	private Autore autore;
	@Expose
	private Edizione edizione;
	@Expose
	private long id;
	@Expose
	private Genere genere;
	Date publicazione;
	@Expose
	String dataPublicazione;
	@Expose
	float prezzo;
	
	static private SimpleDateFormat dataformater=new SimpleDateFormat("dd/MM/yyyy");
	
	public Libro(long id,String titolo,Date publicazione ,Autore autore,float prezzo, Edizione edizione,Genere genere) {
		super();
		this.id=id;
		this.titolo = titolo;
		this.autore = autore;
		this.edizione = edizione;
		this.genere=genere;
		this.publicazione=publicazione;
		this.prezzo=prezzo;
		valorizeDate();
	}
	
	public float getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(float prezzo) {
		this.prezzo = prezzo;
	}

	public Genere getGenere() {
		return genere;
		
	}
	public void setGenere(Genere genere) {
		this.genere=genere;
		
	}
	
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getTitolo() {
		return titolo;
	}
	public void setTitolo(String titolo) {
		this.titolo = titolo;
	}
	public Autore getAutore() {
		return autore;
	}
	public void setAutore(Autore autore) {
		this.autore = autore;
	}
	public Edizione getEdizione() {
		return edizione;
	}
	public void setEdizione(Edizione edizione) {
		this.edizione = edizione;
	}
	private void valorizeDate() {
		try {
		this.dataPublicazione =  dataformater.format(publicazione.getTime());
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	
}
