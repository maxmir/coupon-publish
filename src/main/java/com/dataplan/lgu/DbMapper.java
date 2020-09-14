package com.dataplan.lgu;

import java.util.HashMap;
import java.util.List;

public interface DbMapper {
    public List<HashMap<String, Object>> getManageDataPlanList() throws Exception;

    public int insertDataPlan(HashMap<String, Object> param) throws Exception;

    public int deleteDataPlan(HashMap<String, Object> param) throws Exception;
}
