package com.u8.server.service;

import com.u8.server.common.OrderParameter;
import com.u8.server.common.OrderParameters;
import com.u8.server.common.Page;
import com.u8.server.common.PageParameter;
import com.u8.server.dao.UUpdateLogDao;
import com.u8.server.data.UUpdateLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 */
@Service("updateLogManager")
public class UUpdateLogManager {

    @Autowired
    private UUpdateLogDao updateLogDao;


    //分页查找
    public Page<UUpdateLog> queryPage(int currPage, int num){

        PageParameter page = new PageParameter(currPage, num, true);
        OrderParameters order = new OrderParameters();
        order.add("id", OrderParameter.OrderType.DESC);
        String hql = "from UUpdateLog";
        return updateLogDao.find(page, hql, null, order);
    }

    //添加或者修改channel
    public void saveLog(UUpdateLog log){

        updateLogDao.save(log);
    }



}
