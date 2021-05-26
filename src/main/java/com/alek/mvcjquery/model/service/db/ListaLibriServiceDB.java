package com.alek.mvcjquery.model.service.db;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.alek.mvcjquery.model.libri.Autore;
import com.alek.mvcjquery.model.libri.Edizione;
import com.alek.mvcjquery.model.libri.Genere;
import com.alek.mvcjquery.model.libri.Libro;
import com.alek.mvcjquery.model.service.GenericService;
import com.alek.mvcjquery.model.service.db.excpetion.ErrorService;
import com.alek.mvcjquery.model.service.interfaces.ListaLibriService;

public class ListaLibriServiceDB extends GenericService implements ListaLibriService{



	public ListaLibriServiceDB(DataSource ds) {
		super(ds);

	}

	/**
	 * id int primary key,
	titolo varchar(1000),
	descrizione varchar(200),
	data_publicazione date,
	copertina blob,
	genere_id int,
	editore_id int,
	autore_id int
	 */
	@Override
	public List listaLibri(Edizione edi) {
		//TODO da implementare sul database listalisbri...
		return null;
	}

	@Override
	public List listaLibriPerGeneri(String idgenere,int start,int page) throws ErrorService{
		List list=new ArrayList();
		Connection conn=null;
		ResultSet res=null;
		try {
			conn=ds.getConnection();
			list = new ArrayList<Libro>();
			PreparedStatement prep=  conn.prepareStatement("SELECT * FROM LIBRO_BKS where  genere_id=? ",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			prep.setString(1, idgenere);
			
			res=  prep.executeQuery();
			int max=0;
			res.absolute(start);
			while(res.next()) {
				if (max>=page) break;
				
				int id=res.getInt("id");
				String titolo=res.getString("titolo");
				String desc=res.getString("descrizione");
				Date dataPublicazione=res.getDate("data_publicazione");
				int genereId=res.getInt("genere_id");
				int editoreId=res.getInt("editore_id");
				int autoreId=res.getInt("autore_id");
				float prezzo=res.getFloat("prezzo");
				
				Autore autore=getAutore(autoreId);
				Edizione edizione=getEdizione(editoreId);
				Genere genere=getGenere(genereId);
				Libro libro=new Libro(id, titolo,dataPublicazione,autore,prezzo, edizione,genere); 
				list.add(libro);
	
				max++;
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
			throw new ErrorService("Errore applicativo!!!");
		}finally {
			try {
				res.close();
				conn.close();
			} catch (Exception e) {

			}
		}
		return list;
	}
	
	private Genere getGenere(int id){
		Genere genere=new Genere(id);
		Connection conn=null;
		try {
			conn=ds.getConnection();
			genere = null;
			PreparedStatement prep=  conn.prepareStatement("SELECT * FROM GENERE_BKS WHERE id=?");
			prep.setInt(1, id);
			ResultSet res=prep.executeQuery();
			while(res.next()) {
				String tipologia=res.getString("tipologia");
				genere=new Genere(id,tipologia);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (Exception e) {

			}
		}
		
		return genere;
	}

	private Edizione getEdizione(int id) {
		Edizione edizione=new Edizione(id);
		Connection conn=null;
				
		try {
			conn=ds.getConnection();
			PreparedStatement prep=  conn.prepareStatement("SELECT * FROM EDITORE_BKS WHERE id=?");
			prep.setInt(1, id);
			ResultSet res=prep.executeQuery();
			while(res.next()) {
				String nome=res.getString("nome");
				edizione=new Edizione(id,nome);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();

		}finally {
			try {
				conn.close();
			} catch (Exception e) {
			}
		}
		return edizione;
	}

	Autore getAutore(int id) {
		Connection conn=null;
		Autore autore=new Autore(id);
		
		try {
			conn=ds.getConnection();
			PreparedStatement prep=  conn.prepareStatement("SELECT * FROM AUTORE_BKS WHERE id=?");
			prep.setInt(1, id);
			ResultSet res=prep.executeQuery();
			while(res.next()) {
				String nome=res.getString("nome");
				String cognome=res.getString("cognome");
				String qualifica=res.getString("descrizione");
				autore=new Autore(id,nome,cognome,qualifica);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (Exception e) {

			}
		}
		return autore;
		
	}

	@Override
	public List listaGeneri() throws ErrorService {
		Connection conn=null;
		List list=new ArrayList();
		
		try {
			conn=ds.getConnection();
			PreparedStatement prep=conn.prepareStatement("SELECT * FROM GENERE_BKS");
			ResultSet res=prep.executeQuery();
			while(res.next()) {
				int id=res.getInt("id");
				String tipologia=res.getString("tipologia");
				Genere gen=new Genere(id, tipologia);
				list.add(gen);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new ErrorService(e.getMessage());
		}finally {
			try {
				conn.close();
				
			}catch(Exception e) {	}
		}
		
		
		return list;
	}

}
