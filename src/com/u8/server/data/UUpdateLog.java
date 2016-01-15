package com.u8.server.data;

import com.u8.server.utils.TimeFormater;
import net.sf.json.JSONObject;

import javax.persistence.*;
import java.util.Date;

/**
 * 更新日志
 * Created by ant on 2016/1/4.
 */
@Entity
@Table(name="uupdatelog")
public class UUpdateLog {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Integer userID;     //更新者

    private String userName;    //更新者姓名

    private String name;         //更新的组件名称

    private String fileName;     //文件名称

    private Date updateTime;     //更新时间

    private String ipAddr;       //IP地址

    public JSONObject toJSON(){

        JSONObject json = new JSONObject();
        json.put("id", id);
        json.put("userID", userID);
        json.put("userName", userName);
        json.put("name", name);
        json.put("fileName", fileName);
        json.put("updateTime", TimeFormater.format_default(updateTime));
        json.put("ipAddr", ipAddr);

        return json;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getUserID() {
        return userID;
    }

    public void setUserID(Integer userID) {
        this.userID = userID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getIpAddr() {
        return ipAddr;
    }

    public void setIpAddr(String ipAddr) {
        this.ipAddr = ipAddr;
    }
}
