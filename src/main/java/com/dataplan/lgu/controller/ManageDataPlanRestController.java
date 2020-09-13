package com.dataplan.lgu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dataplan.lgu.DbService;

@RestController
public class ManageDataPlanRestController {

	@Autowired
    DbService dbService;

	@GetMapping(value = "/now")
	public String getNow() throws Exception {
		return dbService.getDual();
	}
}
