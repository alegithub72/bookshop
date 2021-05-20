package com.alek.mvcjquery.model.service.interfaces;

import com.alek.mvcjquery.model.service.db.excpetion.ErroreFunctionPermission;

public interface UserCheckService {

	boolean isFunctionAllowed(int id, String fnction) throws ErroreFunctionPermission;

}