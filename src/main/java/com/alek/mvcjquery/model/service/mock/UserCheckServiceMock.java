package com.alek.mvcjquery.model.service.mock;

import javax.sql.DataSource;

import com.alek.mvcjquery.model.service.db.excpetion.ErroreFunctionPermission;
import com.alek.mvcjquery.model.service.db.excpetion.ErroreLoginAccess;
import com.alek.mvcjquery.model.service.interfaces.UserCheckService;
import com.alek.mvcjquery.model.user.User;

public class UserCheckServiceMock implements UserCheckService {

	public UserCheckServiceMock(DataSource ds) {
		// TODO Auto-generated constructor stub
	}

	@Override
	public User loginuser(String userid, String password) throws ErroreLoginAccess {
		User usr=new User(10, 400, userid, password, userid);
		return usr;
	}

	@Override
	public boolean isFunctionAllowed(int id, String fnction) throws ErroreFunctionPermission {

		return true;
	}

}
