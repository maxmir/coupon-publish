package com.dataplan.lgu.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.dataplan.lgu.DbService;

@Controller
public class ManageDataPlanController {

	@Autowired
    DbService dbService;

    @GetMapping(value = "/manageDataPlan")
    public String manageDataPlan(Model model, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
    	request.setCharacterEncoding("utf-8");
    	List<HashMap<String, Object>> retHmList = new ArrayList<>();
		retHmList = dbService.getManageDataPlanList();
		System.out.println("retHmList---> " + retHmList);
		response.setCharacterEncoding("utf-8");
		model.addAttribute("manageDataPlanList", retHmList);
    	return "manageDataPlan";
    }
}
