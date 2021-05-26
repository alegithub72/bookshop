package com.alek.mvcjquery.model.service.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.alek.mvcjquery.model.service.GenericService;
import com.alek.mvcjquery.model.service.db.excpetion.ErroreFunctionPermission;
import com.alek.mvcjquery.model.service.db.excpetion.ErroreLoginAccess;
import com.alek.mvcjquery.model.service.interfaces.UserCheckService;
import com.alek.mvcjquery.model.user.Profile;
import com.alek.mvcjquery.model.user.User;

public class UserCheckServiceDB extends GenericService implements UserCheckService{

	public UserCheckServiceDB(DataSource ds) {
		super(ds);

	}

	@Override
	public boolean isFunctionAllowed(int id,String urlfunction) throws ErroreFunctionPermission {
		
		
		
		Profile profallowed;
		Connection conn =null;
		boolean allowfunc=false;
		try {
			 conn = ds.getConnection();
			PreparedStatement prep=conn.prepareStatement("SELECT pf.id_profile as id_profile,p.nome as nome "
					+ "FROM FUNCTION_BKS as f ,   PROFILE_FUNCTION_MENU_BKS as pf ,"
					+ "USER_PROFILE_BKS AS p where p.id=pf.id_profile and "
					+ " f.id=pf.id_function and f.url_function = ? ");
			prep.setString(1, urlfunction);
			ResultSet res=  prep.executeQuery();
			profallowed = null;
			System.out.println("--checkpermission--");
			System.out.println("url fiunction:"+urlfunction);
			System.out.println("id:"+id);
			while(res.next()) {
				int idallowed=res.getInt("id_profile");
				String nome=res.getString("nome");
				profallowed=new Profile(idallowed, nome);
				System.out.println("profile:"+idallowed+", nome:"+nome);
			}
			System.out.println("--checkpermission--");
		} catch (SQLException e) {
			e.printStackTrace();
			throw new ErroreFunctionPermission("Richiesta non permessa!!!");
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {

			}
		}

		if(profallowed==null )  allowfunc=false;
		else if(id>=profallowed.getId())  allowfunc=true;
		
		return allowfunc;
	}

	@Override
	public User loginuser(String userid, String password) throws ErroreLoginAccess {
		// TODO Implementare la ricerca dell'utente sul DB
		return null;
	}


	
	
	
	
}
