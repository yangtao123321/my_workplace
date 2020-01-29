package com.reyoung.tools;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import org.apache.commons.codec.digest.DigestUtils;

import java.io.FileOutputStream;
import java.io.IOException;

/**
 * Created by yangtao on 2019-11-26.
 */
public class Test {

    @org.junit.Test
    public void show() {

        String s="1231221.txt";

        String s1 = s.substring(s.lastIndexOf(".")+1);

        System.out.println(s1);

    }

    /*@org.junit.Test
    public void shows() throws IOException, DocumentException {

        Rectangle rectangle=new Rectangle(PageSize.A4);//设置A4纸

        Document d=new Document(rectangle,50,30,10,10);

        PdfWriter pdfWriter = PdfWriter.getInstance(d, new FileOutputStream("D:/paynotice.pdf"));

        d.open();

        Paragraph elements = new Paragraph("瑞阳制药有限公司付款通知单", setChineseFont());

        elements.setAlignment(Element.ALIGN_CENTER);

        d.add(elements);

        Image img = Image.getInstance("D://123.jpg");

        Image cui=Image.getInstance("D://cuishifu.jpg");

        Image zhao=Image.getInstance("D://zhaoshifu.jpg");

        img.scaleToFit(65, 65);

        cui.scaleToFit(50,50);

        zhao.scaleToFit(50,50);

        //d.add(img);

        //d.newPage();

        //创建表格对象
        PdfPTable datatable = new PdfPTable(6);

        datatable.setSpacingBefore(10);

        //int[] cellsWidth = { 1, 1, 1, 1, 1, 1 };

        //datatable.setWidths(cellsWidth);
        datatable.setTotalWidth(new float[] { 100, 100, 90, 100,70,100 });

        datatable.setWidthPercentage(100);// 表格的宽度百分比

        //datatable.getDefaultCell().setPadding(2);// 单元格的间隔
        //datatable.getDefaultCell().setBorderWidth(0);// 边框宽度
        // 设置表格的底色
        datatable.getDefaultCell().setBackgroundColor(BaseColor.WHITE);
        datatable.getDefaultCell().setHorizontalAlignment(Element.BODY);
        //datatable.getDefaultCell().setMinimumHeight(30);

            //构建每个单元格
            *//*PdfPCell cell1 = new PdfPCell(new Paragraph("时间:",setbodyfont()));

            cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
            cell1.setBorderWidth(0);
            cell1.setMinimumHeight(25);*//*

        PdfPCell pCell = createpdfcell("时间:", 0);

        datatable.addCell(pCell);

        PdfPCell cell = createpdfcell("2019/12/26", 3);

        datatable.addCell(cell);

        datatable.addCell(createpdfcell("合同实例号:",0));

        datatable.addCell(createpdfcell("32725",0));

        PdfPCell cell1 = createpdfcell("申请单位代码:", 0);

        datatable.addCell(cell1);

        PdfPCell cell2 = createpdfcell("1E04-01-001：粉针事业部综合办公室", 3);

        datatable.addCell(cell2);

        datatable.addCell(createpdfcell("支付方式:",0));

        datatable.addCell(createpdfcell("电子承兑",0));

        datatable.addCell(createpdfcell("供应商代码:",0));

        datatable.addCell(createpdfcell("378520",3));

        datatable.addCell(createpdfcell("工程代码:",0));

        datatable.addCell(createpdfcell("————",0));

        datatable.addCell(createpdfcell("供应商名称:",0));

        datatable.addCell(createpdfcell("山东耀智信息科技有限公司",3));

        datatable.addCell(createpdfcell("工程描述:",0));

        datatable.addCell(createpdfcell("201709 305 车间新版GMP 改造",0));

        datatable.addCell(createpdfcell("开户银行:",0));

        datatable.addCell(createpdfcell("上海浦东发展银行股份有限公司济南开发区支行",5));

        datatable.addCell(createpdfcell("银行账号:",0));

        datatable.addCell(createpdfcell("74130154740007689",5));

        datatable.addCell(createpdfcell("用途：大类：",0));

        datatable.addCell(createpdfcell("车间费用",2));

        datatable.addCell(createpdfcell1("明细项目:",0));

        datatable.addCell(createpdfcell("305更换悬浮粒子计数器",2));

        datatable.addCell(createpdfcell("合计金额（小写）:",0));

        datatable.addCell(createpdfcell("￥21000",2));

        datatable.addCell(createpdfcell1("大写:",0));

        datatable.addCell(createpdfcell("叁万元整",2));

        datatable.addCell(createpdfcell("\r\n",6));

        datatable.addCell(createpdfcell("部门负责人:\r\n\r\n财务审核:",0));

        datatable.addCell(createpdfcell(img,0));

        datatable.addCell(createpdfcell("单位负责人:\r\n\r\n(单位盖章):",0));

        datatable.addCell(createpdfcell(cui,0));

        datatable.addCell(createpdfcell("经办人:\r\n\r\n付款编码:",0));

        datatable.addCell(createpdfcell(zhao,0));

        d.add(datatable);


        *//********************第二个付款单的页面*************************//*
        Paragraph elements1 = new Paragraph("瑞阳制药有限公司付款通知单", setChineseFont());

        elements1.setAlignment(Element.ALIGN_CENTER);

        d.add(new Paragraph("\r\n"));
        d.add(new Paragraph("\r\n"));
        d.add(new Paragraph("\r\n"));

        d.add(elements1);

        PdfPTable datatable1 = new PdfPTable(6);

        datatable1.setSpacingBefore(10);

        datatable1.setWidthPercentage(100);// 表格的宽度百分比

        //datatable.getDefaultCell().setPadding(2);// 单元格的间隔
        //datatable.getDefaultCell().setBorderWidth(0);// 边框宽度
        // 设置表格的底色
        datatable1.getDefaultCell().setBackgroundColor(BaseColor.WHITE);
        datatable1.getDefaultCell().setHorizontalAlignment(Element.BODY);


        datatable1.addCell(createpdfcell("时间:", 0));

        datatable1.addCell(createpdfcell("2019/12/26", 3));

        datatable1.addCell(createpdfcell("合同实例号:",0));

        datatable1.addCell(createpdfcell("32725",0));

        datatable1.addCell(createpdfcell("申请单位代码:", 0));

        datatable1.addCell(createpdfcell("1E04-01-001：粉针事业部综合办公室", 3));

        datatable1.addCell(createpdfcell("支付方式:",0));

        datatable1.addCell(createpdfcell("电子承兑",0));

        datatable1.addCell(createpdfcell("供应商代码:",0));

        datatable1.addCell(createpdfcell("378520",3));

        datatable1.addCell(createpdfcell("工程代码:",0));

        datatable1.addCell(createpdfcell("————",0));

        datatable1.addCell(createpdfcell("供应商名称:",0));

        datatable1.addCell(createpdfcell("山东耀智信息科技有限公司",3));

        datatable1.addCell(createpdfcell("工程描述:",0));

        datatable1.addCell(createpdfcell("非工程类",0));

        datatable1.addCell(createpdfcell("开户银行:",0));

        datatable1.addCell(createpdfcell("上海浦东发展银行股份有限公司济南开发区支行",5));

        datatable1.addCell(createpdfcell("银行账号:",0));

        datatable1.addCell(createpdfcell("74130154740007689",5));

        datatable1.addCell(createpdfcell("用途：大类：",0));

        datatable1.addCell(createpdfcell("车间费用",2));

        datatable1.addCell(createpdfcell("明细项目:",0));

        datatable1.addCell(createpdfcell("305更换悬浮粒子计数器",2));

        datatable1.addCell(createpdfcell("合计金额（小写）:",2));

        datatable1.addCell(createpdfcell("￥21000",0));

        datatable1.addCell(createpdfcell("大写:",0));

        datatable1.addCell(createpdfcell("叁万元整",2));

        datatable1.addCell(createpdfcell("\r\n",6));

        datatable1.addCell(createpdfcell("部门负责人:\r\n\r\n财务审核:",0));

        datatable1.addCell(createpdfcell(img,0));

        datatable1.addCell(createpdfcell("单位负责人:\r\n\r\n(单位盖章):",0));

        datatable1.addCell(createpdfcell(cui,0));

        datatable1.addCell(createpdfcell("经办人:\r\n\r\n付款编码:",0));

        datatable1.addCell(createpdfcell(zhao,0));

        d.add(datatable1);

        d.close();

    }

*/
    @org.junit.Test
    public void shows1() throws DocumentException, IOException {

        Rectangle rectangle=new Rectangle(PageSize.A4);//设置A4纸

        Document d=new Document(rectangle,35,30,10,10);

        PdfWriter pdfWriter = PdfWriter.getInstance(d, new FileOutputStream("D:/luxin.pdf"));

        d.open();

        Paragraph elements = new Paragraph("购  买  滤  芯  计  划  表", setChineseFont());

        elements.setAlignment(Element.ALIGN_CENTER);

        d.add(elements);

        /*Image img = Image.getInstance("D://zhangzong.jpg");

        Image cui=Image.getInstance("D://cuilingling.jpg");

        Image zhao=Image.getInstance("D://zhaowei.jpg");

        img.scaleToFit(65, 65);

        cui.scaleToFit(50,50);

        zhao.scaleToFit(50,50);

        img.setAbsolutePosition(90,360);
        //zhao.setAbsolutePosition(90,360);

        d.add(img);*/

        //d.add(zhao);

        //d.newPage();

        //创建表格对象
        PdfPTable datatable = new PdfPTable(8);

        datatable.setSpacingBefore(20);

        //int[] cellsWidth = { 1, 1, 1, 1, 1, 1 };

        //datatable.setWidths(cellsWidth);
        datatable.setTotalWidth(new float[] { 50, 100, 90, 100,70,60,100,100 });

        datatable.setWidthPercentage(100);// 表格的宽度百分比

        //datatable.getDefaultCell().setPadding(2);// 单元格的间隔
        datatable.getDefaultCell().setBorderWidth(0.1f);// 边框宽度
        // 设置表格的底色
        datatable.getDefaultCell().setBackgroundColor(BaseColor.WHITE);
        datatable.getDefaultCell().setHorizontalAlignment(Element.BODY);

        //datatable.getDefaultCell().setMinimumHeight(30);

        //构建每个单元格
            /*PdfPCell cell1 = new PdfPCell(new Paragraph("时间:",setbodyfont()));

            cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
            cell1.setBorderWidth(0);
            cell1.setMinimumHeight(25);*/

        PdfPCell pCell = createlvxintitlecell("提报单位", 1, 1);

        datatable.addCell(pCell);

        datatable.addCell(createlvxintitlecell("305车间", 7, 1));

        datatable.addCell(createlvxintitlecell("提报日期", 1, 1));

        datatable.addCell(createlvxintitlecell("2019年12月31日", 7, 1));

        datatable.addCell(createlvxintitlecell("提报人", 1, 1));

        datatable.addCell(createlvxintitlecell("石云勇", 7, 1));

        datatable.addCell(createlvxintitlecell("购买明细", 1, 2));

        datatable.addCell(createlvxincaizhicell("材质", 1, 1));
        datatable.addCell(createlvxincaizhicell("型号", 1, 1));
        datatable.addCell(createlvxincaizhicell("尺寸", 1, 1));
        datatable.addCell(createlvxincaizhicell("接口", 1, 1));
        datatable.addCell(createlvxincaizhicell("数量", 1, 1));
        datatable.addCell(createlvxincaizhicell("要求", 1, 1));
        datatable.addCell(createlvxincaizhicell("用途", 1, 1));

        datatable.addCell(createlvxincaizhicell("聚四氟乙烯PTFE", 1, 1));
        datatable.addCell(createlvxincaizhicell("疏水性", 1, 1));
        datatable.addCell(createlvxincaizhicell("10英寸*0.22um", 1, 1));
        datatable.addCell(createlvxincaizhicell("226接口带翅", 1, 1));
        datatable.addCell(createlvxincaizhicell("8根", 1, 1));
        datatable.addCell(createlvxincaizhicell("过水过气", 1, 1));
        datatable.addCell(createlvxincaizhicell("模拟分装验证", 1, 1));

        datatable.addCell(createlvxintitlecell("采购要求", 1, 1));

        datatable.addCell(createlvxintitlecell("厂家：杭州科百特过滤器材有限公司", 7, 1));

        datatable.addCell(createlvxintitlecell("签字批准", 8, 1));

        datatable.addCell(createlvxinsignaturenamecell("单位负责人:", 3, 1));

        datatable.addCell(createlvxinsignaturenamecell("文件小组负责人:", 2, 1));

        datatable.addCell(createlvxinsignaturenamecell("部门经理:", 3, 1));

        datatable.addCell(createlvxinsignaturecell("", 3, 1));

        datatable.addCell(createlvxinsignaturecell("", 2, 1));

        datatable.addCell(createlvxinsignaturecell("", 3, 1));



        /*PdfPCell cell = createpdfcell("2019/12/26", 3);

        datatable.addCell(cell);

        datatable.addCell(createpdfcell("合同实例号:",0));

        datatable.addCell(createpdfcell("32725",0));

        PdfPCell cell1 = createpdfcell("申请单位代码:", 0);

        datatable.addCell(cell1);

        PdfPCell cell2 = createpdfcell("1E04-01-001：粉针事业部综合办公室", 3);

        datatable.addCell(cell2);

        datatable.addCell(createpdfcell("支付方式:",0));

        datatable.addCell(createpdfcell("电子承兑",0));

        datatable.addCell(createpdfcell("供应商代码:",0));

        datatable.addCell(createpdfcell("378520",3));

        datatable.addCell(createpdfcell("工程代码:",0));

        datatable.addCell(createpdfcell("————",0));

        datatable.addCell(createpdfcell("供应商名称:",0));

        datatable.addCell(createpdfcell("山东耀智信息科技有限公司",3));

        datatable.addCell(createpdfcell("工程描述:",0));

        datatable.addCell(createpdfcell("201709 305 车间新版GMP 改造",0));

        datatable.addCell(createpdfcell("开户银行:",0));

        datatable.addCell(createpdfcell("上海浦东发展银行股份有限公司济南开发区支行",5));

        datatable.addCell(createpdfcell("银行账号:",0));

        datatable.addCell(createpdfcell("74130154740007689",5));

        datatable.addCell(createpdfcell("用途：大类：",0));

        datatable.addCell(createpdfcell("车间费用",2));

        datatable.addCell(createpdfcell1("明细项目:",0));

        datatable.addCell(createpdfcell("305更换悬浮粒子计数器",2));

        datatable.addCell(createpdfcell("合计金额（小写）:",0));

        datatable.addCell(createpdfcell("￥21000",2));

        datatable.addCell(createpdfcell1("大写:",0));

        datatable.addCell(createpdfcell("叁万元整",2));

        datatable.addCell(createpdfcell("\r\n",6));

        datatable.addCell(createpdfcell("部门负责人:\r\n\r\n财务审核:",0));

        datatable.addCell(createpdfcell(img,0));

        datatable.addCell(createpdfcell("单位负责人:\r\n\r\n(单位盖章):",0));

        datatable.addCell(createpdfcell(cui,0));

        datatable.addCell(createpdfcell("经办人:\r\n\r\n付款编码:",0));

        datatable.addCell(createpdfcell(zhao,0));*/

        d.add(datatable);

        d.close();

    }

    // 产生付款通知单标题的字体
    public static Font setChineseFont() {
        BaseFont bf = null;
        Font fontChinese = null;
        try {

            bf = BaseFont.createFont("C:/Windows/Fonts/simhei.TTF",
                    BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
            fontChinese = new Font(bf, 17);

            fontChinese.setStyle(Font.BOLD | Font.UNDERLINE);

        } catch (DocumentException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return fontChinese;
    }

    //主题内容的字体
    public static Font setbodyfont() {

        BaseFont bf = null;
        Font fontChinese = null;
        try {

            //STXINWEI.TTF  STKAITI.TTF 华文楷体

            /*bf = BaseFont.createFont("C:/Windows/Fonts/STSONG.TTF",
                    BaseFont.IDENTITY_H, BaseFont.EMBEDDED);*/

            bf = BaseFont.createFont("C:/Windows/Fonts/simhei.ttf",
                    BaseFont.IDENTITY_H, BaseFont.EMBEDDED);

            fontChinese = new Font(bf, 13f);

        } catch (DocumentException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return fontChinese;

    }

    //滤芯的字体设置
    public static Font setlvxincaizhifont() {

        BaseFont bf = null;
        Font fontChinese = null;
        try {

            //STXINWEI.TTF  STKAITI.TTF 华文楷体

            /*bf = BaseFont.createFont("C:/Windows/Fonts/STSONG.TTF",
                    BaseFont.IDENTITY_H, BaseFont.EMBEDDED);*/

            bf = BaseFont.createFont("C:/Windows/Fonts/simfang.ttf",//仿宋
                    BaseFont.IDENTITY_H, BaseFont.EMBEDDED);

            fontChinese = new Font(bf, 12f);

            //fontChinese.setStyle(Font.BOLD);

        } catch (DocumentException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return fontChinese;

    }

    //滤芯的材质等字体设置
    public static Font setlvxinfont() {

        BaseFont bf = null;
        Font fontChinese = null;
        try {

            //STXINWEI.TTF  STKAITI.TTF 华文楷体

            /*bf = BaseFont.createFont("C:/Windows/Fonts/STSONG.TTF",
                    BaseFont.IDENTITY_H, BaseFont.EMBEDDED);*/

            bf = BaseFont.createFont("C:/Windows/Fonts/simhei.TTF",
                    BaseFont.IDENTITY_H, BaseFont.EMBEDDED);

            fontChinese = new Font(bf, 13f);

            //fontChinese.setStyle(Font.BOLD);

        } catch (DocumentException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return fontChinese;

    }



    @org.junit.Test
    public void s() {

        System.out.println(MoneyFormatUtils.change(21000));

    }

    //负责产生单元格对象的一个类型 参数为合并单元格的数量
    public static PdfPCell createpdfcell(String str,int row,int col) {

        PdfPCell cell1 = new PdfPCell(new Paragraph(str,setlvxinfont()));

        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell1.setBorderWidth(0.5f);
        cell1.setMinimumHeight(50);
        cell1.setColspan(row);
        cell1.setRowspan(col);

        return cell1;

    }

    public static PdfPCell createpdfcell1(String str,int row) {

        PdfPCell cell1 = new PdfPCell(new Paragraph(str,setbodyfont()));

        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell1.setBorderWidth(0);
        cell1.setMinimumHeight(25);
        cell1.setColspan(row);

        return cell1;

    }

    //负责产生天成图片的单元格对象
    public static PdfPCell createpdfcell(Image image,int row) {

        PdfPCell cell1 = new PdfPCell(image);

        cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell1.setBorderWidth(0);
        cell1.setMinimumHeight(25);
        cell1.setColspan(row);

        return cell1;

    }

    /****************************************************/

    //滤芯计划的单元格样式表
    public static PdfPCell createlvxintitlecell(String str,int row,int col) {

        PdfPCell cell1 = new PdfPCell(new Paragraph(str,setlvxinfont()));

        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell1.setBorderWidth(0.5f);
        cell1.setMinimumHeight(50);
        cell1.setColspan(row);
        cell1.setRowspan(col);

        return cell1;

    }

    //滤芯材质的单元格样式表
    public static PdfPCell createlvxinsignaturenamecell(String str,int row,int col) {

        PdfPCell cell1 = new PdfPCell(new Paragraph(str,setlvxinfont()));

        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell1.setBorderWidth(0.5f);
        cell1.setMinimumHeight(50);
        cell1.setColspan(row);
        cell1.setRowspan(col);
        cell1.disableBorderSide(2);

        return cell1;

    }

    //滤芯的材质单元格样式表
    public static PdfPCell createlvxincaizhicell(String str,int row,int col) {

        PdfPCell cell1 = new PdfPCell(new Paragraph(str,setlvxincaizhifont()));

        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell1.setBorderWidth(0.5f);
        cell1.setMinimumHeight(35);
        cell1.setColspan(row);
        cell1.setRowspan(col);

        return cell1;

    }

    //滤芯签字表的单元格设置
    public static PdfPCell createlvxinsignaturecell(String str,int row,int col) {

        PdfPCell cell1 = new PdfPCell(new Paragraph(str,setlvxincaizhifont()));

        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell1.setBorderWidth(0.5f);
        /*cell1.disableBorderSide(2);*/

        cell1.setMinimumHeight(90);
        cell1.setColspan(row);
        cell1.setRowspan(col);
        cell1.disableBorderSide(1);

        return cell1;

    }




    @org.junit.Test
    public void md5pas() {

        System.out.println(DigestUtils.md5Hex("yangtao"+"yangtao"));

    }

}
