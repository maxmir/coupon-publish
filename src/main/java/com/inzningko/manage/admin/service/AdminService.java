package com.inzningko.manage.admin.service;

import com.inzningko.manage.admin.mapper.AdminMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

/**
 * ClientService
 *
 * @author kjh
 * @version 1.0.0
 * 작성일: 2021/08/21 9:31 오후
 **/

@Service
@RequiredArgsConstructor
@Slf4j
public class AdminService {
    private final AdminMapper adminMapper;

    /**
     * 회원 로그인 처리
     *
     * @author kjh
     * @version 1.0.0
     * 작성일: 2021/08/21 9:34 오후
     **/
    public HashMap<String, Object> adminLoginProcess(HashMap<String, Object> params) {
        HashMap<String, Object> retMap = new HashMap<>();
        String msg = "";
        try {
            int resultCnt = adminMapper.adminLoginProcess(params);
            if (resultCnt == 1) {
                msg = "login success";
                retMap.put("result", true);
            }
            else {
                msg = "login fail";
                retMap.put("result", false);
            }
        } catch (Exception e) {
            e.printStackTrace();
            msg = "login fail";
            retMap.put("result", false);
        }
        retMap.put("msg", msg);
        return retMap;
    }

    /**
     * 쿠폰 목록 조회
     *
     * @author kjh
     * @version 1.0.0
     * 작성일: 2021/08/22 5:41 오후
     **/
    public List<HashMap<String, Object>> couponList() throws Exception {
        return adminMapper.couponList();
    }

}

