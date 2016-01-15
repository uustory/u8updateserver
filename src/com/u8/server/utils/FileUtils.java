package com.u8.server.utils;

import java.io.*;

/**
 * Created by ant on 2016/1/4.
 */
public class FileUtils {

    public static String readTxtFile(String path, String charset){
        BufferedReader reader = null;
        try{

            reader = new BufferedReader(new InputStreamReader(new FileInputStream(new File(path)), charset));
            String str = null;
            StringBuilder sb = new StringBuilder();
            while((str = reader.readLine()) != null){
                sb.append(str).append("\n");
            }

            return sb.toString();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            if(reader != null){
                try {
                    reader.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        return null;
    }
}
