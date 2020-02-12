package com.reyoung.tools;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.reyoung.model.DeviceDetail;
import com.reyoung.model.DevicePlan;
import com.reyoung.model.Flowinfos;

import java.io.FileOutputStream;
import java.io.IOException;

/**
 * Created by yangtao on 2020-02-12.
 */
public class DeviceTools {

    // 产生维修计划表标题
    public static Font setChineseFont() {
        BaseFont bf = null;
        Font fontChinese = null;
        try {

            //C:/Windows/Fonts/STSONG.TTF

            bf = BaseFont.createFont("C:/Windows/Fonts/STFANGSO.TTF",
                    BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
            fontChinese = new Font(bf, 20);

            fontChinese.setStyle( Font.BOLD|Font.UNDERLINE);

        } catch (DocumentException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return fontChinese;
    }

    //维修计划主题的字体
    public static Font setlvxinfont() {

        BaseFont bf = null;

        Font fontChinese = null;

        try {

            //STXINWEI.TTF  STKAITI.TTF 华文楷体   STZHONGS.TTF

            /*bf = BaseFont.createFont("C:/Windows/Fonts/STSONG.TTF",
                    BaseFont.IDENTITY_H, BaseFont.EMBEDDED);*/


            bf = BaseFont.createFont("C:/Windows/Fonts/STFANGSO.TTF",
                    BaseFont.IDENTITY_H, BaseFont.EMBEDDED);

            fontChinese = new Font(bf, 14f);

            //fontChinese.setStyle(Font.BOLD);

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

        cell1.setUseAscender(true);
        cell1.setUseDescender(true);
        /*cell1.setVerticalAlignment(cell1.ALIGN_MIDDLE);*/
        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell1.setBorderWidth(0.3f);
        cell1.setMinimumHeight(30);
        cell1.setColspan(row);
        cell1.setRowspan(col);

        return cell1;

    }

    //签字批准的栏
    public static PdfPCell createrepairesignaturetitle(String str,int row,int col) {

        PdfPCell cell1 = new PdfPCell(new Paragraph(str,setrepairesignaturetitle()));

        cell1.setUseAscender(true);
        cell1.setUseDescender(true);
        /*cell1.setVerticalAlignment(cell1.ALIGN_MIDDLE);*/
        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell1.setBorderWidth(0.3f);
        cell1.setMinimumHeight(25);
        cell1.setColspan(row);
        cell1.setRowspan(col);

        return cell1;

    }

    //维修计划负责人签字栏
    public static PdfPCell createrepairesignaturecell(String str,int row,int col) {

        PdfPCell cell1 = new PdfPCell(new Paragraph(str,setlvxinfont()));

        cell1.setUseAscender(true);
        cell1.setUseDescender(true);
        /*cell1.setVerticalAlignment(cell1.ALIGN_MIDDLE);*/
        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell1.setBorderWidth(0.3f);
        cell1.setMinimumHeight(25);
        cell1.setColspan(row);
        cell1.setRowspan(col);
        cell1.disableBorderSide(2);


        return cell1;


    }

    public static PdfPCell createrepairecontextitle(String str,int row,int col) {

        PdfPCell cell1 = new PdfPCell(new Paragraph(str,setlvxinfont()));

        //PdfPCell cell1 = new PdfPCell(paragraph);

        cell1.setLeading(6,1);

        cell1.setUseAscender(true);
        cell1.setUseDescender(true);
        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell1.setBorderWidth(0.3f);
        cell1.setMinimumHeight(230);
        cell1.setColspan(row);
        cell1.setRowspan(col);

        return cell1;

    }

    //维修计划施工项目现状内容栏
    public static PdfPCell createrepairecontext(String str,int row,int col) {

        PdfPCell cell1 = new PdfPCell(new Paragraph(str,setlvxinfont()));

        //PdfPCell cell1 = new PdfPCell(paragraph);

        cell1.setLeading(6,1);

        cell1.setUseAscender(true);
        cell1.setUseDescender(true);
        cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell1.setBorderWidth(0.3f);
        cell1.setMinimumHeight(230);
        cell1.setColspan(row);
        cell1.setRowspan(col);

        return cell1;

    }

    //采购设备要求栏
    public static PdfPCell createrepairerequires(String str,int row,int col) {

        PdfPCell cell1 = new PdfPCell(new Paragraph(str,setlvxinfont()));

        cell1.setLeading(6,1);

        cell1.setUseAscender(true);
        cell1.setUseDescender(true);
        /*cell1.setVerticalAlignment(cell1.ALIGN_MIDDLE);*/
        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell1.setBorderWidth(0.3f);
        cell1.setMinimumHeight(160);
        cell1.setColspan(row);
        cell1.setRowspan(col);

        return cell1;

    }

    //采购设备详情栏目
    public static PdfPCell createrepairerequiresdetail(String str,int row,int col) {

        PdfPCell cell1 = new PdfPCell(new Paragraph(str,setlvxinfont()));

        cell1.setUseAscender(true);
        cell1.setUseDescender(true);
        /*cell1.setVerticalAlignment(cell1.ALIGN_MIDDLE);*/
        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell1.setBorderWidth(0.3f);
        cell1.setMinimumHeight(30);
        cell1.setColspan(row);
        cell1.setRowspan(col);

        return cell1;

    }

    //设置维修计划签字批准的
    public static Font setrepairesignaturetitle() {

        BaseFont bf = null;
        Font fontChinese = null;
        try {

            //STXINWEI.TTF  STKAITI.TTF 华文楷体   STZHONGS.TTF

            /*bf = BaseFont.createFont("C:/Windows/Fonts/STSONG.TTF",
                    BaseFont.IDENTITY_H, BaseFont.EMBEDDED);*/

            bf = BaseFont.createFont("C:/Windows/Fonts/STZHONGS.TTF",
                    BaseFont.IDENTITY_H, BaseFont.EMBEDDED);

            fontChinese = new Font(bf, 14f);

            //fontChinese.setStyle(Font.BOLD);

        } catch (DocumentException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return fontChinese;


    }

    //负责产生天成图片的单元格对象
    public static PdfPCell createpdfcell(Image image,int row,int col) {

        PdfPCell cell1 = new PdfPCell(image);

        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell1.setBorderWidth(0.5f);
        cell1.setMinimumHeight(85);
        cell1.setColspan(row);
        cell1.setRowspan(col);
        cell1.disableBorderSide(1);

        return cell1;

    }

    public static void main(String[] args) throws IOException, DocumentException {

        /*FilterPlan f=new FilterPlan();
        f.setFiltertotle("购买滤芯计划表");
        //f.setAppdep("305车间");
        f.setApplyperson("左志泰");
        //f.setApplytime(new Date());
        f.setBuyrequires("杭州科百特空气滤芯有限公司");

        FilterDetail detail=new FilterDetail();

        detail.setFdetailname("聚四氟乙烯PTFE");

        detail.setFdetailtype("疏水性");

        detail.setFdetailsize("10英寸*0.36um");

        detail.setFdetailinterface("226接口带翅");

        detail.setFdetailnum("8根");

        detail.setRek("过水过汽");

        detail.setUseing("模拟分装用");

        FilterDetail detail1=new FilterDetail();

        detail1.setFdetailname("聚四氟乙烯PTFE");

        detail1.setFdetailtype("疏水性");

        detail1.setFdetailsize("10英寸*0.22um");

        detail1.setFdetailinterface("226接口带翅");

        detail1.setFdetailnum("8根");

        detail1.setRek("过水过汽");

        detail1.setUseing("模拟分装用");

        java.util.List<FilterDetail> details=new ArrayList<>();

        details.add(detail);

        details.add(detail1);

        f.setFilterDetails(details);*/

        // makereport(f,asd);

        //makereport1();

        //makereport();

    }

    //负责部门为本部门的签字审批
    public static void makereport(DevicePlan devicePlan,Flowinfos flowinfos) {

        try{

            Rectangle rectangle=new Rectangle(PageSize.A4);//设置A4纸

            Document d=new Document(rectangle,35,30,10,10);

            PdfWriter pdfWriter = PdfWriter.getInstance(d, new FileOutputStream("D:/"+flowinfos.getFlowinfoid()+flowinfos.getFlowabstract()+".pdf"));

            d.open();

            Paragraph elements = new Paragraph(devicePlan.getDevicetitle(), setChineseFont());

            elements.setAlignment(Element.ALIGN_CENTER);

            d.add(elements);

            Image img = Image.getInstance("D://zhangzong.jpg");

            Image cui=Image.getInstance("D://cuilingling.jpg");

            Image zhao=Image.getInstance("D://zhaowei.jpg");

            img.scaleToFit(65, 65);

            cui.scaleToFit(50,50);

            zhao.scaleToFit(50,50);

            //设置绝对路径
            img.setAbsolutePosition(90,360);

            //创建表格对象
            PdfPTable datatable = new PdfPTable(6);

            datatable.setSpacingBefore(30);

            datatable.setTotalWidth(new float[] {50,50,50,50,50,50});

            datatable.setWidthPercentage(100);// 表格的宽度百分比

            //datatable.getDefaultCell().setPadding(2);// 单元格的间隔
            datatable.getDefaultCell().setBorderWidth(0.1f);// 边框宽度

            // 设置表格的底色
            datatable.getDefaultCell().setBackgroundColor(BaseColor.WHITE);
            datatable.getDefaultCell().setHorizontalAlignment(Element.BODY);

            PdfPCell pCell = createlvxintitlecell("提报单位", 1, 1);

            datatable.addCell(pCell);

            datatable.addCell(createlvxintitlecell(flowinfos.getUser().getDepartment().getDeptname(),5,1));

            datatable.addCell(createlvxintitlecell("提报日期",1,1));

            datatable.addCell(createlvxintitlecell(GetYear.getformdate(flowinfos.getStartime()),2,1));

            datatable.addCell(createlvxintitlecell("提报人", 1, 1));

            datatable.addCell(createlvxintitlecell(flowinfos.getPerson(), 7, 1));

            datatable.addCell(createrepairecontextitle("购   买\r\n\r\n原   因", 1, 1));

            datatable.addCell(createrepairecontext("            "+devicePlan.getBuyreson(), 5, 1));//将前后空格去掉后在前面加3个tab

            //循环的列数

            int res = devicePlan.getDeviceDetails().size();


            if (res==0) {//没有购买的详情的信息



            }else {

                res=res+2;


                //循环遍历购买的详情后写入pdf文档中
                //需要循环遍历需要采购的设备的详情列
                datatable.addCell(createrepairerequires("采   购\r\n设   备\r\n要   求", 1, res));


                datatable.addCell(createrepairerequiresdetail("名称", 2, 1));
                datatable.addCell(createrepairerequiresdetail("品牌", 2, 1));
                datatable.addCell(createrepairerequiresdetail("数量", 1, 1));

                for (DeviceDetail detail:devicePlan.getDeviceDetails()) {

                    datatable.addCell(createrepairerequiresdetail(detail.getDevicename(),2,1));
                    datatable.addCell(createrepairerequiresdetail(detail.getDevicebank(),2,1));
                    datatable.addCell(createrepairerequiresdetail(detail.getDevicenum(),21,1));

                }

                datatable.addCell(createrepairerequiresdetail("",6,1));

            }


            /*//需要循环遍历需要采购的设备的详情列
            datatable.addCell(createrepairerequires("采   购\r\n设   备\r\n要   求", 1, 4));

            datatable.addCell(createrepairerequiresdetail("名称", 2, 1));
            datatable.addCell(createrepairerequiresdetail("品牌", 2, 1));
            datatable.addCell(createrepairerequiresdetail("数量", 1, 1));

            datatable.addCell(createrepairerequiresdetail("投影仪", 2, 1));
            datatable.addCell(createrepairerequiresdetail("爱普生", 2, 1));
            datatable.addCell(createrepairerequiresdetail("1台", 1, 1));

            datatable.addCell(createrepairerequiresdetail("投影仪", 2, 1));
            datatable.addCell(createrepairerequiresdetail("爱普生", 2, 1));
            datatable.addCell(createrepairerequiresdetail("1台",1,1));

            datatable.addCell(createrepairerequiresdetail("", 6, 1));*/


            datatable.addCell(createrepairesignaturetitle("签  字  批  准", 6, 1));

            datatable.addCell(createrepairesignaturecell("单位负责人:", 3, 1));

            datatable.addCell(createrepairesignaturecell("部门经理:",3,1));

            datatable.addCell(createpdfcell(cui,3,1));

            datatable.addCell(createpdfcell(img,3,1));

            d.add(datatable);

            d.close();

        }catch (Exception e) {

            System.out.println("出现异常了。。。");

        }

    }

    //负责部门是其他单位的签字审批
    public static void makereport1(DevicePlan devicePlan,Flowinfos flowinfos) {


        try{

            Rectangle rectangle=new Rectangle(PageSize.A4);//设置A4纸

            Document d=new Document(rectangle,35,30,10,10);

            PdfWriter pdfWriter = PdfWriter.getInstance(d, new FileOutputStream("D:/"+flowinfos.getFlowinfoid()+flowinfos.getFlowabstract()+".pdf"));

            d.open();

            Paragraph elements = new Paragraph(devicePlan.getDevicetitle(), setChineseFont());

            elements.setAlignment(Element.ALIGN_CENTER);

            d.add(elements);

            Image img = Image.getInstance("D://zhangzong.jpg");

            Image cui=Image.getInstance("D://cuilingling.jpg");

            Image zhao=Image.getInstance("D://zhaowei.jpg");

            img.scaleToFit(65, 65);

            cui.scaleToFit(50,50);

            zhao.scaleToFit(50,50);

            //设置绝对路径
            img.setAbsolutePosition(90,360);

            //创建表格对象
            PdfPTable datatable = new PdfPTable(6);

            datatable.setSpacingBefore(30);

            datatable.setTotalWidth(new float[] {50,50,50,50,50,50});

            datatable.setWidthPercentage(100);// 表格的宽度百分比

            //datatable.getDefaultCell().setPadding(2);// 单元格的间隔
            datatable.getDefaultCell().setBorderWidth(0.1f);// 边框宽度

            // 设置表格的底色
            datatable.getDefaultCell().setBackgroundColor(BaseColor.WHITE);
            datatable.getDefaultCell().setHorizontalAlignment(Element.BODY);

            PdfPCell pCell = createlvxintitlecell("提报单位", 1, 1);

            datatable.addCell(pCell);

            datatable.addCell(createlvxintitlecell(flowinfos.getUser().getDepartment().getDeptname(),5,1));

            datatable.addCell(createlvxintitlecell("提报日期",1,1));

            datatable.addCell(createlvxintitlecell(GetYear.getformdate(flowinfos.getStartime()),2,1));

            datatable.addCell(createlvxintitlecell("提报人", 1, 1));

            datatable.addCell(createlvxintitlecell(flowinfos.getPerson(), 7, 1));

            datatable.addCell(createrepairecontextitle("购   买\r\n\r\n原   因", 1, 1));

            datatable.addCell(createrepairecontext("            "+devicePlan.getBuyreson(), 5, 1));//将前后空格去掉后在前面加3个tab

            //循环的列数

            int res = devicePlan.getDeviceDetails().size();

            if (res==0) {//没有购买的详情的信息



            }else {

                res=res+2;

                //循环遍历购买的详情后写入pdf文档中
                //需要循环遍历需要采购的设备的详情列
                datatable.addCell(createrepairerequires("采   购\r\n设   备\r\n要   求", 1, res));


                datatable.addCell(createrepairerequiresdetail("名称", 2, 1));
                datatable.addCell(createrepairerequiresdetail("品牌", 2, 1));
                datatable.addCell(createrepairerequiresdetail("数量", 1, 1));

                for (DeviceDetail detail:devicePlan.getDeviceDetails()) {

                    datatable.addCell(createrepairerequiresdetail(detail.getDevicename(),2,1));
                    datatable.addCell(createrepairerequiresdetail(detail.getDevicebank(),2,1));
                    datatable.addCell(createrepairerequiresdetail(detail.getDevicenum(),21,1));

                }

                datatable.addCell(createrepairerequiresdetail("",6,1));

            }

            datatable.addCell(createrepairesignaturetitle("签  字  批  准", 6, 1));

            datatable.addCell(createrepairesignaturecell("单位负责人:", 2, 1));

            datatable.addCell(createrepairesignaturecell("部门经理:",2,1));

            datatable.addCell(createrepairesignaturecell("总裁",2,1));

            datatable.addCell(createpdfcell(cui,2,1));

            datatable.addCell(createpdfcell(img,2,1));

            datatable.addCell(createpdfcell(img,2,1));

            d.add(datatable);

            d.close();

        }catch (Exception e) {



        }


    }

}
