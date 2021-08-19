package com.inzningko.manage.client.controller.view;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("client")
public class ClientViewCaller {
    @GetMapping("login")
    public String clientLogin() {
        return "client/clientLogin";
    }

    @GetMapping("menu")
    public String clientMenu() {
        return "client/clientMenu";
    }

}

