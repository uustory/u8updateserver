package com.u8.server.cache;

import com.u8.server.log.Log;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 * 在Spring启动的时候，加载需要缓存的数据
 */
@Repository
@Transactional(readOnly = true)
public class UApplicationListener implements ApplicationListener<ApplicationEvent>{

    private boolean loaded = false;

    @Override
    public void onApplicationEvent(ApplicationEvent contextStartedEvent) {
        try{

            if(!loaded){

                Log.e("Spring now to load...");


                loaded = true;
            }

        }catch (Exception e){
            Log.e("Load Data on server inited error.", e);
        }
    }
}
