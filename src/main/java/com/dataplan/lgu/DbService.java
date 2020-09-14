package com.dataplan.lgu;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DbService {
    @Autowired
    DbMapper dbMapper;

    public List<HashMap<String, Object>> getManageDataPlanList() throws Exception {
        return dbMapper.getManageDataPlanList();
    }

    public int insertDataPlan(HashMap<String, Object> param) throws Exception {
        return dbMapper.insertDataPlan(param);
    }

    public int deleteDataPlan(HashMap<String, Object> param) throws Exception {
        return dbMapper.deleteDataPlan(param);
    }

}
