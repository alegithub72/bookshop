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
	public boolean isFunctionAllowed(int profileid,String urlfunction) throws ErroreFunctionPermission {
		
		
		
		Profile profallowed;
		Connection conn =null;
		boolean allowfunc=false;
		try {
			System.out.println("url fiunction:"+urlfunction);
			System.out.println("profileid:"+profileid);
			 conn = ds.getConnection();
			String sql= "SELECT pf.id_profile as id_profile,p.nome as nome "
				+ "FROM BKS_FUNCTION as f ,   BKS_PROFILE_FUNCTION_MENU as pf ,"
				+ "BKS_USER_PROFILE AS p where p.id=pf.id_profile and "
				+ " f.id=pf.id_function and f.url_function = ? ";
			PreparedStatement prep=conn.prepareStatement(sql);
			prep.setString(1, urlfunction);
			ResultSet res=  prep.executeQuery();
			profallowed = null;
			System.out.println("--checkpermission--");
			System.out.println(sql);
			System.out.println("url fiunction:"+urlfunction);
			System.out.println("profileid:"+profileid);
			while(res.next()) {
				int idallowed=res.getInt("id_profile");
				String nome=res.getString("nome");
				profallowed=new Profile(idallowed, nome);
				System.out.println("profile:"+idallowed+", nome:"+nome);
			}
			System.out.println("--checkpermission--");
		} catch (SQLException e) {
			System.out.println("--SQLException--");
			e.printStackTrace(System.out);
			throw new ErroreFunctionPermission("Richiesta non permessa!!!");
		}finally {
			try {
				if(conn!=null)conn.close();
			} catch (SQLException e) {

			}
		}

		if(profallowed==null )  allowfunc=false;
		else if(profileid>=profallowed.getId())  allowfunc=true;
		
		return allowfunc;
	}

	@Override
	public User loginuser(String userid, String password) throws ErroreLoginAccess {
		User user=null;
		Connection conn=null;
	
		try {
			conn=ds.getConnection();
			PreparedStatement prep=conn.prepareStatement("SELECT * FROM BKS_USERS WHERE EMAIL=? AND PASSWORD=?",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			prep.setString(1, userid);
			prep.setString(2, password);
			ResultSet res=  prep.executeQuery();

			if(res.next() && res.isLast())
			{
				String username=res.getString("EMAIL");
				String pass=res.getString("password");
				String nome=res.getString("NOME");
				String cognome=res.getString("COGNOME");
				int profileid=res.getInt("profile");
				int id=res.getInt("id");
				user=new User(id,profileid,nome,cognome,pass,username);			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			try {
				conn.close();
			} catch (SQLException e) {

			}
		}
		
		
		
		
		return user;
	}


	
	
	
	
}
