package com.pdsk.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Properties;


public class Propertiesdb {
	/**
	 * 修改db文件
	 * @param filePath
	 * @param key
	 * @param value
	 */
	public static void writeData(String filePath, String key, String value) {  
        //获取绝对路径  
        filePath = Propertiesdb.class.getResource("/" + "com/pdsk/config/"+filePath).toString();  
        //截掉路径的”file:/“前缀  
        filePath = filePath.substring(6);  
        Properties prop = new Properties();  
        try {  
            File file = new File(filePath);  
            if (!file.exists())  
                file.createNewFile();  
            InputStream fis = new FileInputStream(file);  
            prop.load(fis);  
            //一定要在修改值之前关闭fis  
            fis.close();  
            OutputStream fos = new FileOutputStream(filePath);  
            prop.setProperty(key, value);  
            
            //保存，并加入注释  
            prop.store(fos, "Update '" + key + "' value");  
            fos.close();  
        } catch (IOException e) {  
            System.err.println("Visit " + filePath + " for updating " + value + " value error");  
        }  
    } 
 /**
  * 读取db文件
  * @param filePath
  * @param key
  * @return
  */
 public static String readData(String filePath, String key) {  
        //获取绝对路径  
	 
        //filePath = Propertiesdb.class.getResource("/" +"com/pdsk/config"+ filePath).toString();  
        filePath = Propertiesdb.class.getResource("/" +"com/pdsk/config/"+ filePath).toString();  
       
      //  System.out.println();
        //截掉路径的”file:“前缀  
        filePath = filePath.substring(6);
        //System.out.println(filePath);
        Properties props = new Properties();  
        try {  
            InputStream in = new BufferedInputStream(new FileInputStream(filePath));  
            props.load(in);  
            in.close();  
            String value = props.getProperty(key);  
           
            return value;  
        } catch (Exception e) {  
            e.printStackTrace();  
            return null;  
        }  
    } 
 
 
 
 /*public static void main(String[] args) {
	    Propertiesdb.writeData("db.properties","jdbc.url", "jdbc:mysql://"+"1111111"+":"+"11111"+"/"+1111);
		Propertiesdb.writeData("db.properties","jdbc.username","11111" );
		Propertiesdb.writeData("db.properties","jdbc.password","22222" );
		System.out.println("=====================");
}*/

}
