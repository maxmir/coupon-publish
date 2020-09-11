package com.dataplan.lgu;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ManageDataPlanController {
    @GetMapping
    public String test() {
        return "Hello DataPlan";
    }
}
