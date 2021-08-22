package com.inzningko.manage.admin.controller.view;

import com.inzningko.manage.admin.service.AdminService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("admin")
public class AdminViewCaller {
    private final AdminService adminService;

    @GetMapping("login")
    public String adminLogin() {
        return "admin/adminLogin";
    }

    @GetMapping("menu")
    public String adminMenu() {
        return "admin/adminMenu";
    }

    /**
     * 선택가능 쿠폰내역 조회
     *
     * @author kjh
     * @version 1.0.0
     * 작성일: 2021/08/22 7:19 오후
     *
     **/
    @GetMapping("couponList")
    public String couponList(Model model) throws Exception {
        List<HashMap<String, Object>> adminCoupons = adminService.couponList();
        model.addAttribute("adminCoupons", adminCoupons);
        return "admin/adminMenu";
    }

}

