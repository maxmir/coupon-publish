package com.dataplan.lgu.controller;

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

    /**
     * 데이터 플랜 조회
     *
     * @param model
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @GetMapping(value = "/manageDataPlan")
    public String manageDataPlan(Model model, HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        request.setCharacterEncoding("utf-8");
        List<HashMap<String, Object>> retHmList = new ArrayList<>();
        retHmList = dbService.getManageDataPlanList();
        response.setCharacterEncoding("utf-8");
        model.addAttribute("manageDataPlanList", retHmList);
        return "manageDataPlan";
    }
}
