package com.alek.mvcjquery.model.service.mock;

import com.alek.mvcjquery.model.service.db.excpetion.ErroreFunctionPermission;
import com.alek.mvcjquery.model.service.interfaces.UserCheckService;

public class UserCheckServiceMock implements UserCheckService {

	public UserCheckServiceMock() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public boolean isFunctionAllowed(int id, String fnction) throws ErroreFunctionPermission {

		return true;
	}

}
