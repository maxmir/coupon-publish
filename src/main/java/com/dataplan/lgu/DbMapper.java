package com.dataplan.lgu;

import java.util.HashMap;
import java.util.List;

public interface DbMapper {
    public String getDual() throws Exception;

	public List<HashMap<String, Object>> getManageDataPlanList();
}
