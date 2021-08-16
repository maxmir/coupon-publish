package com.inzningko.manage.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.inzningko.manage.DbService;

@RestController
public class ManageDataPlanRestController {

    @Autowired
    DbService dbService;

    /**
     * 데이터 플랜 입력(신규추가)
     *
     * @param param
     * @return
     * @throws Exception
     */
    @PostMapping(value = "insertDataPlan")
    public HashMap<String, Object> insertDataPlan(@RequestParam HashMap<String, Object> param) throws Exception {
        HashMap<String, Object> retHm = new HashMap<>();
        try {
            int resCnt = dbService.insertDataPlan(param);
            if (resCnt > 0) {
                retHm.put("resMsg", "추가 데이터 플랜을 저장하였습니다.");
            } else if (resCnt <= 0) {
                retHm.put("resMsg", "저장된 데이터 플랜이 없습니다.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            retHm.put("resMsg", "저장을 실패했습니다.");
        }
        return retHm;
    }

    /**
     * 데이터 플랜 수정
     *
     * @param param
     * @return
     * @throws Exception
     */
    @PutMapping(value = "modifyDataPlan")
    public HashMap<String, Object> modifyDataPlan(@RequestParam HashMap<String, Object> param) throws Exception {
        HashMap<String, Object> retHm = new HashMap<>();
        try {
            int resCnt = dbService.modifyDataPlan(param);
            retHm.put("modifyCount", resCnt);

            if (resCnt > 0) {
                retHm.put("resMsg", "데이터 플랜을 수정하였습니다.");
            } else if (resCnt <= 0) {
                retHm.put("resMsg", "수정된 데이터 플랜이 없습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            retHm.put("resMsg", "수정을 실패했습니다.");
        }
        return retHm;
    }

    /**
     * 데이터 플랜 삭제
     *
     * @param param
     * @return
     * @throws Exception
     */
    @DeleteMapping(value = "deleteDataPlan")
    public HashMap<String, Object> deleteDataPlan(@RequestParam HashMap<String, Object> param) throws Exception {
        HashMap<String, Object> retHm = new HashMap<>();
        try {
            int resCnt = dbService.deleteDataPlan(param);
            retHm.put("deleteCount", resCnt);
            retHm.put("resMsg", "데이터 플랜을 삭제하였습니다.");
        } catch (Exception e) {
            e.printStackTrace();
            retHm.put("resMsg", "삭제에 실패했습니다.");
        }
        return retHm;
    }
}
