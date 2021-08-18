package com.inzningko.manage.test.mapper;

import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface DbMapper {
    List<HashMap<String, Object>> getManageDataPlanList() throws Exception;

    int insertDataPlan(HashMap<String, Object> param) throws Exception;

    int modifyDataPlan(HashMap<String, Object> param) throws Exception;

    int deleteDataPlan(HashMap<String, Object> param) throws Exception;
}
