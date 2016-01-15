package com.u8.server.dao;

import com.u8.server.common.UHibernateTemplate;
import com.u8.server.data.UUpdateLog;
import org.springframework.stereotype.Repository;

/**
 * 渠道数据访问类
 */
@Repository("updateLogDao")
public class UUpdateLogDao extends UHibernateTemplate<UUpdateLog, Long>{

    public void saveChannel(UUpdateLog log){
        super.save(log);
    }

    public UUpdateLog queryChannel(long id){

        return super.get(id);
    }
}
