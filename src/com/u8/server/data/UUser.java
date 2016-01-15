package com.u8.server.data;

import com.u8.server.utils.TimeFormater;
import net.sf.json.JSONObject;

import javax.persistence.*;
import java.util.Date;

/**
 * 更新者信息
 * Created by ant on 2016/1/4.
 */
@Entity
@Table(name="uuser")
public class UUser {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String name;          //更新者组织姓名
    private String updateDesc;    //备注
    private String updateKey;     //更新key
    private Date keyCreateTime;   //key创建时间
    private Integer keyValidDay;  //key有效时间，单位天
    private Integer updateValid;  //是否可以更新，1可以，0不可以
    private Date createdTime;     //创建时间
    private Date lastTime;        //最后更新时间

    public JSONObject toJSON(){

        JSONObject json = new JSONObject();
        json.put("id", id);
        json.put("name", name);
        json.put("updateDesc", updateDesc);
        json.put("updateKey", updateKey);
        json.put("updateValid", updateValid == null ? 0 : updateValid);
        json.put("keyCreateTime", TimeFormater.format_default(keyCreateTime));
        json.put("keyValidDay", keyValidDay);
        json.put("createdTime", TimeFormater.format_default(createdTime));
        json.put("lastTime", lastTime == null ? "" : TimeFormater.format_default(lastTime));

        return json;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUpdateDesc() {
        return updateDesc;
    }

    public void setUpdateDesc(String updateDesc) {
        this.updateDesc = updateDesc;
    }

    public String getUpdateKey() {
        return updateKey;
    }

    public void setUpdateKey(String updateKey) {
        this.updateKey = updateKey;
    }

    public Date getKeyCreateTime() {
        return keyCreateTime;
    }

    public void setKeyCreateTime(Date keyCreateTime) {
        this.keyCreateTime = keyCreateTime;
    }

    public Integer getKeyValidDay() {
        return keyValidDay;
    }

    public void setKeyValidDay(Integer keyValidDay) {
        this.keyValidDay = keyValidDay;
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public Date getLastTime() {
        return lastTime;
    }

    public void setLastTime(Date lastTime) {
        this.lastTime = lastTime;
    }

    public Integer getUpdateValid() {
        return updateValid;
    }

    public void setUpdateValid(Integer updateValid) {
        this.updateValid = updateValid;
    }
}
