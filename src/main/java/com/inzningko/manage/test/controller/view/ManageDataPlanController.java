package com.inzningko.manage.test.controller.view;

import com.inzningko.manage.test.service.DbService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
public class ManageDataPlanController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private DbService dbService;

    @GetMapping(value = "/")
    public String index() throws Exception {
        return "redirect:/client/login";
    }

    /**
     * 데이터 플랜 조회
     *
     * @param model
     * @return
     * @throws Exception
     */
    @GetMapping(value = "/testView")
    public String manageDataPlan(Model model) throws Exception {
        List<HashMap<String, Object>> retHmList = new ArrayList<>();
        retHmList = dbService.getManageDataPlanList();
        for (HashMap<String, Object> hashMap : retHmList) {
            logger.debug(hashMap.toString());
        }
        model.addAttribute("manageDataPlanList", retHmList);
        return "manageDataPlan";
    }
}
