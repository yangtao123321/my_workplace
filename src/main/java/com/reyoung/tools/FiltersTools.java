package com.reyoung.tools;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.reyoung.model.Approve;
import com.reyoung.model.FilterDetail;
import com.reyoung.model.FilterPlan;
import com.reyoung.model.Flowinfos;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 * Created by yangtao on 2020-01-08.
 */
//滤芯计划表格生成类
public class FiltersTools {

    // 产生滤芯计划表标题
    public static Font setChineseFont() {
        BaseFont bf = null;
        Font fontChinese = null;
        try {

            bf = BaseFont.createFont("C:/Windows/Fonts/STSONG.TTF",
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

    //滤芯计划的单元格样式表 标题
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

    //滤芯计划的单元格样式表 标题
    public static Font setlvxinfont() {

        BaseFont bf = null;
        Font fontChinese = null;
        try {

            //STXINWEI.TTF  STKAITI.TTF 华文楷体

            /*bf = BaseFont.createFont("C:/Windows/Fonts/STSONG.TTF",
                    BaseFont.IDENTITY_H, BaseFont.EMBEDDED);*/

            bf = BaseFont.createFont("C:/Windows/Fonts/STZHONGS.TTF",
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

    //滤芯材质的字体设置
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

    //滤芯审批签名的单元格样式表
    public static PdfPCell createlvxinsignaturenamecell(String str,int row,int col) {

        PdfPCell cell1 = new PdfPCell(new Paragraph(str,setlvxinfont()));

        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell1.setVerticalAlignment(Element.ALIGN_BOTTOM);
        cell1.setBorderWidth(0.5f);
        cell1.setMinimumHeight(30);
        cell1.setColspan(row);
        cell1.setRowspan(col);
        cell1.disableBorderSide(2);

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

    //负责产生天成图片的单元格对象
    public static PdfPCell createpdfcell(Image image,int row,int col) {

        PdfPCell cell1 = new PdfPCell(image);

        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell1.setBorderWidth(0.5f);
        cell1.setMinimumHeight(80);
        cell1.setColspan(row);
        cell1.setRowspan(col);
        cell1.disableBorderSide(1);

        return cell1;

    }

    public static void main(String[] args) throws IOException, DocumentException {

        FilterPlan f=new FilterPlan();
        f.setFiltertotle("购买滤芯计划表");
        //f.setAppdep("305车间");
        f.setApplyperson("左志泰");
        //f.setApplytime(new Date());
        f.setBuyrequires("杭州科百特空气滤芯有限公司");

        FilterDetail detail=new FilterDetail();

        detail.setFdetailname("聚四氟乙烯PTFE");

        detail.setFdetailsize("10英寸*0.36um");

        detail.setFdetailinterface("226接口带翅");

        detail.setFdetailnum("8根");

        detail.setUseing("模拟分装用");

        FilterDetail detail1=new FilterDetail();

        detail1.setFdetailname("聚四氟乙烯PTFE");

        detail1.setFdetailsize("10英寸*0.22um");

        detail1.setFdetailinterface("226接口带翅");

        detail1.setFdetailnum("8根");

        detail1.setUseing("模拟分装用");

        List<FilterDetail> details=new ArrayList<>();

        details.add(detail);

        details.add(detail1);

        f.setFilterDetails(details);

       // makereport(f,asd);

    }

    public static void makereport(FilterPlan f,Flowinfos flowinfos,List<Approve> approves,HttpServletRequest request) {

        String zhangzong=null;

        String zhangna=null;

        String dunit=null;

        for (Approve a:approves) {

            if (a.getUser().getPosition().getPosid()==3) {

                File[] files= new File(request.getSession().getServletContext().getRealPath(a.getSignature())).getParentFile().listFiles();

                Random random=new Random();

                File files1=files[random.nextInt(files.length)];

                zhangzong=files1.getAbsolutePath();

            }else if (a.getUser().getPosition().getPosid()==2&&a.getUser().getUsername().equals("zhangna")) {

                File[] files= new File(request.getSession().getServletContext().getRealPath(a.getSignature())).getParentFile().listFiles();

                Random random=new Random();

                File files1=files[random.nextInt(files.length)];

                zhangna=files1.getAbsolutePath();

            }else if (a.getUser().getPosition().getPosid()==2) {

                File[] files= new File(request.getSession().getServletContext().getRealPath(a.getSignature())).getParentFile().listFiles();

                Random random=new Random();

                File files1=files[random.nextInt(files.length)];

                dunit=files1.getAbsolutePath();

            }

        }

        try{

            Rectangle rectangle=new Rectangle(PageSize.A4);//设置A4纸

            Document d=new Document(rectangle,35,30,10,10);

            PdfWriter pdfWriter = PdfWriter.getInstance(d, new FileOutputStream("D:/"+flowinfos.getFlowabstract()+".pdf"));

            d.open();

            Paragraph elements = new Paragraph(f.getFiltertotle(), setChineseFont());

            elements.setAlignment(Element.ALIGN_CENTER);

            d.add(elements);

            Image chapter = Image.getInstance(request.getSession().getServletContext().getRealPath("/chapter/fenzhenzhang.png"));

            Image img = Image.getInstance(zhangzong);

            Image a=Image.getInstance(dunit);

            Image zhangna1=Image.getInstance(zhangna);

            img.scaleToFit(65, 65);

            a.scaleToFit(50,50);

            zhangna1.scaleToFit(50,50);

            chapter.scaleToFit(105,105);

            //设置绝对路径
            chapter.setAbsolutePosition(210,700);

            //创建表格对象
            PdfPTable datatable = new PdfPTable(8);

            datatable.setSpacingBefore(20);

            //50, 100, 90, 100,100,60,100,100
            datatable.setTotalWidth(new float[] { 50, 40, 50, 50,70,50,60,30 });

            datatable.setWidthPercentage(100);// 表格的宽度百分比

            //datatable.getDefaultCell().setPadding(2);// 单元格的间隔
            datatable.getDefaultCell().setBorderWidth(0.1f);// 边框宽度
            // 设置表格的底色
            datatable.getDefaultCell().setBackgroundColor(BaseColor.WHITE);
            datatable.getDefaultCell().setHorizontalAlignment(Element.BODY);

            PdfPCell pCell = createlvxintitlecell("提报单位", 1, 1);

            datatable.addCell(pCell);

            datatable.addCell(createlvxintitlecell(f.getUser().getTruename(), 7, 1));

            datatable.addCell(createlvxintitlecell("提报日期", 1, 1));

            datatable.addCell(createlvxintitlecell(GetYear.getformdate(f.getApplytime1()), 7, 1));

            datatable.addCell(createlvxintitlecell("提报人", 1, 1));

            datatable.addCell(createlvxintitlecell(f.getApplyperson(), 7, 1));

            Integer s=f.getFilterDetails().size()+1;

            datatable.addCell(createlvxintitlecell("购买明细", 1, s));

            datatable.addCell(createlvxincaizhicell("名称", 2, 1));
            datatable.addCell(createlvxincaizhicell("尺寸", 1, 1));
            datatable.addCell(createlvxincaizhicell("接口", 1, 1));
            datatable.addCell(createlvxincaizhicell("膜层数", 1, 1));
            datatable.addCell(createlvxincaizhicell("用途", 1, 1));
            datatable.addCell(createlvxincaizhicell("数量", 1, 1));

            for (FilterDetail filterDetail:f.getFilterDetails()) {

                datatable.addCell(createlvxincaizhicell(filterDetail.getFdetailname(), 2, 1));
                datatable.addCell(createlvxincaizhicell((filterDetail.getFdgree()==null||filterDetail.getFdgree().trim().equals(""))?filterDetail.getFdetailsize():filterDetail.getFdetailsize()+"*"+filterDetail.getFdgree(), 1, 1));
                datatable.addCell(createlvxincaizhicell(filterDetail.getFdetailinterface(), 1, 1));
                datatable.addCell(createlvxincaizhicell(filterDetail.getFherpin(), 1, 1));
                datatable.addCell(createlvxincaizhicell(filterDetail.getUseing(), 1, 1));
                datatable.addCell(createlvxincaizhicell(filterDetail.getFdetailnum(), 1, 1));

            }

            datatable.addCell(createlvxintitlecell("采购要求", 1, 1));

            datatable.addCell(createlvxintitlecell(f.getBuyrequires(), 7, 1));

            datatable.addCell(createlvxintitlecell("签 字 批 准", 8, 1));

            datatable.addCell(createlvxinsignaturenamecell("单位负责人:", 3, 1));

            datatable.addCell(createlvxinsignaturenamecell("文件小组负责人:", 2, 1));

            datatable.addCell(createlvxinsignaturenamecell("部门经理:", 3, 1));

            datatable.addCell(createpdfcell(a, 3, 1));

            datatable.addCell(createpdfcell(zhangna1, 2, 1));

            datatable.addCell(createpdfcell(img, 3, 1));

            d.add(datatable);

            d.add(chapter);

            d.close();

        }catch (Exception e) {



        }

    }

}
