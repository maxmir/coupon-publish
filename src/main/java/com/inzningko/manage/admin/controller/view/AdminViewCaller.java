package com.inzningko.manage.admin.controller.view;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin")
public class AdminViewCaller {

    @GetMapping("login")
    public String adminLogin() {
        return "admin/adminLogin";
    }

    @GetMapping("menu")
    public String adminMenu() {
        return "admin/adminMenu";
    }

}

