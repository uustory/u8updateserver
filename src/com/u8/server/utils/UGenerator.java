package com.u8.server.utils;

import com.u8.server.data.UUser;
import com.u8.server.log.Log;

import java.util.Calendar;
import java.util.Date;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicInteger;

public class UGenerator {

    private static AtomicInteger currOrderSequence = new AtomicInteger(1);

    public static long generateAppID(){

        Calendar can = Calendar.getInstance();
        int year = can.get(Calendar.YEAR) - 2013;
        int month = can.get(Calendar.MONTH) + 1;
        int day = can.get(Calendar.DAY_OF_MONTH);
        int hour = can.get(Calendar.HOUR_OF_DAY);
        int min = can.get(Calendar.MINUTE);
        int sec = can.get(Calendar.SECOND);

        long orderId = year;
        orderId = orderId << 4 | month;
        orderId = orderId << 5 | day;
        orderId = orderId << 5 | hour;
        orderId = orderId << 6 | min;
        orderId = orderId << 6 | sec;
        orderId = orderId << 32| currOrderSequence.getAndIncrement();

        return orderId;
    }

    /***
     * 生成appkey
     * @param appID
     * @param createTime
     * @return
     */
    public static String generateAppKey(int appID, long createTime){

        String txt = appID + "" + createTime;

        return EncryptUtils.md5(txt);
    }

    /***
     * 生成appsecret
     *
     * @return
     */
    public static String generateKey(){
        UUID uuid = UUID.randomUUID();
        return EncryptUtils.md5(uuid.toString());
    }


}
