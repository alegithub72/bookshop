package com.alek.mvcjquery.model.service;

import javax.sql.DataSource;

public class GenericService {

	protected DataSource ds;

	public GenericService(DataSource ds) {
		super();
		this.ds=ds;
	}

}