package com.dataplan.lgu.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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

	@GetMapping(value = "manageDataPlanList")
	public List<HashMap<String, Object>> manageDataPlanList() {
		List<HashMap<String, Object>> retHmList = new ArrayList<>();
		retHmList = dbService.getManageDataPlanList();
		return retHmList;
	}
}
