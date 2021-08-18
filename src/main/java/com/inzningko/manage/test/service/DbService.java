package com.inzningko.manage.test.service;

import com.inzningko.manage.test.mapper.DbMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class DbService {
    @Autowired
    private DbMapper dbMapper;

    public List<HashMap<String, Object>> getManageDataPlanList() throws Exception {
        return dbMapper.getManageDataPlanList();
    }

    public int insertDataPlan(HashMap<String, Object> param) throws Exception {
        return dbMapper.insertDataPlan(param);
    }

    public int modifyDataPlan(HashMap<String, Object> param) throws Exception {
        return dbMapper.modifyDataPlan(param);
    }

    public int deleteDataPlan(HashMap<String, Object> param) throws Exception {
        return dbMapper.deleteDataPlan(param);
    }

}
