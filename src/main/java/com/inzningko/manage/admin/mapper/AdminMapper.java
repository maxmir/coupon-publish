package com.inzningko.manage.admin.mapper;

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
public interface AdminMapper {
    int adminLoginProcess(HashMap<String, Object> params) throws Exception;

    List<HashMap<String, Object>> couponList() throws Exception;

//    int insertPublishCoupon(HashMap<String, Object> params) throws Exception;
}
