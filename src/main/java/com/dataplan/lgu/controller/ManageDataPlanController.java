package com.dataplan.lgu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class ManageDataPlanController {
    @GetMapping(value = "/manageDataPlan")
    public String manageDataPlan() {
    	return "manageDataPlan";
    }
}
