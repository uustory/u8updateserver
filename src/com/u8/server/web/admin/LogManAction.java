package com.u8.server.web.admin;

import com.opensymphony.xwork2.ModelDriven;
import com.u8.server.common.Page;
import com.u8.server.common.UActionSupport;
import com.u8.server.data.UUpdateLog;
import com.u8.server.data.UUser;
import com.u8.server.log.Log;
import com.u8.server.service.UUpdateLogManager;
import com.u8.server.service.UUserManager;
import com.u8.server.utils.UGenerator;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.util.Date;

/**
 * 用户管理
 * Created by ant on 2015/8/28.
 */
@Controller
@Namespace("/admin/logs")
public class LogManAction extends UActionSupport implements ModelDriven<UUpdateLog>{


    private int page;           //当前请求的页码
    private int rows;           //当前每页显示的行数

    private UUpdateLog log;

    @Autowired
    private UUpdateLogManager updateLogManager;

    @Action(value = "showLogs",
            results = {@Result(name = "success", location = "/WEB-INF/admin/logs.jsp")})
    public String showUsers() {

        return "success";
    }

    @Action("getAllLogs")
    public void getAllLogs(){
        try{

            Page<UUpdateLog> currPage = this.updateLogManager.queryPage(page, rows);

            JSONObject json = new JSONObject();
            json.put("total", currPage.getTotalCount());
            JSONArray users = new JSONArray();
            for(UUpdateLog m : currPage.getResultList()){
                users.add(m.toJSON());
            }
            json.put("rows", users);

            renderJson(json.toString());

        }catch(Exception e){
            e.printStackTrace();
        }
    }



    private void renderState(boolean suc){
        JSONObject json = new JSONObject();
        json.put("state", suc? 1 : 0);
        json.put("msg", suc? "操作成功" : "操作失败");
        renderText(json.toString());
    }


    @Override
    public UUpdateLog getModel() {
        if(this.log == null){
            this.log = new UUpdateLog();
        }
        return this.log;
    }



    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    public UUpdateLog getLog() {
        return log;
    }

    public void setLog(UUpdateLog log) {
        this.log = log;
    }
}
