package com.inzningko.manage.client.mapper;

import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

/**
 * ClientMapper
 *
 * @author kjh
 * @version 1.0.0
 * 작성일: 2021/08/21 9:32 오후
 **/
@Mapper
public interface ClientMapper {
    int clientLoginProcess(HashMap<String, Object> params) throws Exception;

    List<HashMap<String, Object>> couponList() throws Exception;

    int publishCoupon(HashMap<String, Object> params) throws Exception;

    List<HashMap<String, Object>> myCoupons() throws Exception;

    int insertMyCoupon(HashMap<String, Object> params) throws Exception;
}
