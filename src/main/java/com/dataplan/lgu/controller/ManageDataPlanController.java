package com.dataplan.lgu.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.dataplan.lgu.DbService;

@Controller
public class ManageDataPlanController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

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
        List<HashMap<String, Object>> retHmList = new ArrayList<>();
        retHmList = dbService.getManageDataPlanList();
        for (HashMap<String, Object> hashMap : retHmList) {
            logger.debug(hashMap.toString());
        }
        model.addAttribute("manageDataPlanList", retHmList);
        return "manageDataPlan";
    }
}
