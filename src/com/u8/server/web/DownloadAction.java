package com.u8.server.web;

import com.u8.server.common.UActionSupport;
import com.u8.server.constants.StateCode;
import com.u8.server.data.UUpdateLog;
import com.u8.server.data.UUser;
import com.u8.server.log.Log;
import com.u8.server.service.UUpdateLogManager;
import com.u8.server.service.UUserManager;
import com.u8.server.utils.EncryptUtils;
import com.u8.server.utils.FileUtils;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.Date;


/***
 * 用户登录
 */
@Controller
@Namespace("/user")
public class DownloadAction extends UActionSupport{

    private final String UPDATE_FOLDER = "updates/";

    private Integer userID;
    private String sdk;
    private String sdkType;
    private String sdkVersion;
    private String sdkFileName;


    private String sign;            //签名

    private InputStream inputStream;

    @Autowired
    private UUpdateLogManager updateLogManager;

    @Autowired
    private UUserManager userManager;


    @Action("getVersionInfo")
    public void getVersionInfo(){

        Log.d("getVersionInfo...");

        try{

            String updatePath = getUpdatePath() + "version.txt";
            Log.d("update path is "+updatePath);

            String content = FileUtils.readTxtFile(updatePath, "UTF-8");

            if(content != null){
                renderText(content);
                return;
            }


        }catch (Exception e){
            Log.e(e.getMessage());
        }

        renderText("");
    }

    @Action("downloadFail")
    public void downloadFail(){

        super.renderText("failed");
    }

    @Action(value = "download",results = {@Result(name="success", type="stream", params = {"contentType","application/octet-stream;charset=utf-8","inputName","inputStream","contentDisposition", "attachment;filename=\"${sdkFileName}\"", "bufferSize", "4096"}),
                                            @Result(name = "fail", type="redirectAction", params = {"actionName", "downloadFail"})})
    public String download(){

        UUser user = userManager.getUser(this.userID);

        if(user == null || !isDownloadValid(user.getUpdateKey()) || user.getUpdateValid() != 1){

            return "fail";
        }

        UUpdateLog log = new UUpdateLog();
        log.setName(sdk);
        log.setFileName(sdkFileName);
        log.setUserID(userID);
        log.setUserName(user.getName());
        log.setUpdateTime(new Date());
        log.setIpAddr(request.getRemoteAddr());

//        Log.d("ip:"+ ServletActionContext.getRequest().getRemoteAddr());

        updateLogManager.saveLog(log);

        return "success";
    }

    private boolean isDownloadValid(String key){

        String path = getUpdatePath() + this.sdkFileName;
        Log.d("the path is "+path);

        File file = new File(path);
        if(!file.exists()){
            return false;
        }

        StringBuilder sb = new StringBuilder();
        sb.append("sdk=").append(sdk).append("&sdkType=").append(sdkType)
                .append("&sdkVersion=").append(sdkVersion).append("&sdkFileName=").append(sdkFileName)
                .append("&userID=").append(userID).append(key);

        Log.d("the sign params:"+sb.toString());

        String signLocal = EncryptUtils.md5(sb.toString()).toLowerCase();

        Log.d("the sign local is "+signLocal);

        return signLocal.equals(this.sign);

    }

    public InputStream getInputStream() throws FileNotFoundException {
        String path = getUpdatePath() + this.sdkFileName;
        Log.d("the path is "+path);

        return new FileInputStream(new File(path));
    }

    private String getUpdatePath(){
        String updatePath = request.getSession().getServletContext().getRealPath("/");
        return updatePath + UPDATE_FOLDER;
    }

    public Integer getUserID() {
        return userID;
    }

    public void setUserID(Integer userID) {
        this.userID = userID;
    }

    public String getSdk() {
        return sdk;
    }

    public void setSdk(String sdk) {
        this.sdk = sdk;
    }

    public String getSdkType() {
        return sdkType;
    }

    public void setSdkType(String sdkType) {
        this.sdkType = sdkType;
    }

    public String getSdkVersion() {
        return sdkVersion;
    }

    public void setSdkVersion(String sdkVersion) {
        this.sdkVersion = sdkVersion;
    }

    public String getSdkFileName() {
        return sdkFileName;
    }

    public void setSdkFileName(String sdkFileName) {
        this.sdkFileName = sdkFileName;
    }

    public String getSign() {
        return sign;
    }

    public void setSign(String sign) {
        this.sign = sign;
    }
}
