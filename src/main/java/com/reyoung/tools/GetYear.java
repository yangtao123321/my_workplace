package com.reyoung.tools;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by yangtao on 2018-12-22.
 */
public class GetYear {

    public static String getDates() {

        Date date=new Date();

        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");

        return sdf.format(date);

    }

    public static String gettimes() {

        Date date=new Date();

        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        return sdf.format(date);

    }

    //根据str转成date类型的数据
    public static Date formtim(String str) {

        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        Date date = null;

        try {

            date = sdf.parse(str);

        } catch (ParseException e) {

            //出现异常之后的情况

            date=new Date();

        }finally {//最终都要执行的步骤

            return date;

        }

    }


    public static String getstrtim(Date date) {

        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        return sdf.format(date);

    }


    public static String getformdate(Date date) {

        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");



        return sdf.format(date);

    }









}
