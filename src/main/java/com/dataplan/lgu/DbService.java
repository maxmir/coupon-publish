package com.dataplan.lgu;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DbService {
	@Autowired
    DbMapper dbMapper;

    public String getDual() throws Exception{
        return dbMapper.getDual();
    }

}
