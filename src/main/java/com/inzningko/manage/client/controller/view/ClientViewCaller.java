package com.inzningko.manage.client.controller.view;

import com.inzningko.manage.client.service.ClientService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.List;


/**
 * ClientViewCaller
 *
 * @author kjh
 * @version 1.0.0
 * 작성일: 2021/08/22 7:19 오후
 *
 **/
@Controller
@RequiredArgsConstructor
@RequestMapping("client")
public class ClientViewCaller {
    private final ClientService clientService;

    @GetMapping("login")
    public String clientLogin() {
        return "client/clientLogin";
    }

    @GetMapping("menu")
    public String clientMenu() {
        return "client/clientMenu";
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
        List<HashMap<String, Object>> coupons = clientService.couponList();
        model.addAttribute("coupons", coupons);
        return "client/clientMenu";
    }

    /**
     * 나의 발행 쿠폰내역 조회
     *
     * @author kjh
     * @version 1.0.0
     * 작성일: 2021/08/22 7:22 오후
     *
     **/
    @GetMapping("myCoupons")
    public String myCoupons(Model model) throws Exception {
        List<HashMap<String, Object>> myCoupons = clientService.myCoupons();
        model.addAttribute("myCoupons", myCoupons);
        return "client/clientMenu";
    }

}

