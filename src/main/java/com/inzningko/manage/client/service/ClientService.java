package com.inzningko.manage.client.service;

import com.inzningko.manage.client.mapper.ClientMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
public class ClientService {
    private final ClientMapper clientMapper;

    /**
     * 회원 로그인 처리
     *
     * @author kjh
     * @version 1.0.0
     * 작성일: 2021/08/21 9:34 오후
     **/
    public HashMap<String, Object> clientLoginProcess(HashMap<String, Object> params) {
        HashMap<String, Object> retMap = new HashMap<>();
        String msg = "";
        try {
            int resultCnt = clientMapper.clientLoginProcess(params);
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
        return clientMapper.couponList();
    }

    /**
     * 쿠폰 발행 처리
     *
     * @author kjh
     * @version 1.0.0
     * 작성일: 2021/08/22 6:52 오후
     **/
    @Transactional
    public HashMap<String, Object> publishCoupon(HashMap<String, Object> params) {
        HashMap<String, Object> retMap = new HashMap<>();
        String msg = "";
        try {
            int resultCnt = clientMapper.publishCoupon(params);
            int reqPublishCnt = Integer.valueOf(String.valueOf(params.get("reqPublishCnt")));
            for (int i = 0; i < reqPublishCnt; i++) {
                resultCnt = clientMapper.insertMyCoupon(params);
            }
            if (resultCnt == 1) {
                msg = "publish success";
                retMap.put("resultList", clientMapper.myCoupons());
                retMap.put("result", true);
            }
            else {
                msg = "publish fail";
                retMap.put("result", false);
            }
        } catch (Exception e) {
            e.printStackTrace();
            msg = "publish fail";
            retMap.put("result", false);
        }
        retMap.put("msg", msg);
        return retMap;
    }

    /**
     * 나의 발행 쿠폰내역 조회
     *
     * @author kjh
     * @version 1.0.0
     * 작성일: 2021/08/22 7:23 오후
     **/
    public List<HashMap<String, Object>> myCoupons() throws Exception {
        return clientMapper.myCoupons();
    }
}

