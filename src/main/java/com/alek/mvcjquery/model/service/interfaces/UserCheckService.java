package com.alek.mvcjquery.model.service.interfaces;

import com.alek.mvcjquery.model.service.db.excpetion.ErroreFunctionPermission;
import com.alek.mvcjquery.model.service.db.excpetion.ErroreLoginAccess;
import com.alek.mvcjquery.model.user.User;

public interface UserCheckService {

	boolean isFunctionAllowed(int id, String fnction) throws ErroreFunctionPermission;
	User loginuser(String userid,String password) throws ErroreLoginAccess ;

}