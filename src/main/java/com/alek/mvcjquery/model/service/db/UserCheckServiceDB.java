package com.alek.mvcjquery.model.service.db;

import javax.sql.DataSource;

import com.alek.mvcjquery.model.service.GenericService;
import com.alek.mvcjquery.model.service.interfaces.UserCheckService;

public class UserCheckServiceDB extends GenericService implements UserCheckService{

	public UserCheckServiceDB(DataSource ds) {
		super(ds);

	}

	@Override
	public boolean isFunctionAllowed(int id,String fnction) {
		
		return true;
	}
	
}
