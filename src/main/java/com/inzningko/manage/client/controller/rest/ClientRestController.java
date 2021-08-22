package com.inzningko.manage.client.controller.rest;

import com.inzningko.manage.client.service.ClientService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;

/**
 * ClientRestController
 * 회원 관련 처리
 *
 * @author kjh
 * @version 1.0.0
 * 작성일: 2021/08/21 9:31 오후
 **/
@RestController
@RequiredArgsConstructor
@RequestMapping("client")
public class ClientRestController {
    private final ClientService clientService;

    /**
     * 회원 로그인 처리
     *
     * @author kjh
     * @version 1.0.0
     * 작성일: 2021/08/21 9:34 오후
     **/
    @GetMapping("login-process")
    public HashMap<String, Object> clientLoginProcess(@RequestParam HashMap<String, Object> params) {
        return clientService.clientLoginProcess(params);
    }
    
    
    /**
     * 쿠폰 발행 처리
     *
     * @author kjh
     * @version 1.0.0
     * 작성일: 2021/08/22 6:51 오후
     *
     **/
    @PostMapping("publish-coupon")
    public HashMap<String, Object> publishCoupon(@RequestParam HashMap<String, Object> params) {
        return clientService.publishCoupon(params);
    }
}
