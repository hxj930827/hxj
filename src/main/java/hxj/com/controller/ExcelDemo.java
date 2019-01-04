/**
 * FileName: ExcelDemo
 * Author:   韩旭杰
 * Date:     2018/11/4 21:12
 * Description: 下载和导入excel
 */
package hxj.com.controller;

import hxj.util.session.UserSession;
import hxj.util.tips.Tips;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 说明：〈下载和导入excel〉
 *
 * @author 韩旭杰
 * @create 2018/11/4
 * @since 1.0.0
 */
@Controller
@RequestMapping(value = "/excel")
public class ExcelDemo {
    public int totalRows; //sheet中总行数
    public static int totalCells; //每一行总单元格数
    public static final String OFFICE_EXCEL_2003_POSTFIX = "xls";
    public static final String OFFICE_EXCEL_2010_POSTFIX = "xlsx";
    public static final String EMPTY = "";
    public static final String POINT = ".";
    public static SimpleDateFormat sdf =   new SimpleDateFormat("yyyy/MM/dd");


    @RequestMapping(value = "/index")
    public ModelAndView index(HttpServletRequest request, HttpServletResponse response){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("/importExcel/Excel");
        return mv;
    }
    @RequestMapping(value = "/getExcel")
    public void getExcel(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        //保存流对象
        FileInputStream input = null;
        OutputStream out = null;
        try {
            //获取前台参数
            String adressurl = "F:"+File.separator+"中欧班列收支利统计表_201808至201809_全部.xlsx";
            String filename="中欧班列收支利统计表_201808至201809_全部";
            resp.setContentType("application/msexcel");
            //设置返回对象
            resp.setContentType(req.getServletContext().getMimeType(filename));
            resp.setHeader("content-disposition", "attachment; filename=" + new String(filename.getBytes("GBK"), "ISO-8859-1")+".xlsx");
            //读文件写入前台
            out = resp.getOutputStream();
            int c = 0;
            File f = new File(adressurl);
            input = new FileInputStream(f);
            byte[] buffer = new byte[1024];
            while (-1 != (c = input.read(buffer))) {
                out.write(buffer, 0, c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            input.close();
            out.flush();
            out.close();
        }

    }
    @RequestMapping(value = "/exportExcel")
    public Tips exportExcel(HttpServletRequest request,HttpServletResponse response,@RequestParam(value = "file") MultipartFile excelFile) {
        //设置返回结果
        Tips tip = new Tips();
        //判断文件是否为空
        if(excelFile == null){
            tip.setFlag(false);
            tip.setMsg("文件为空，导入数据失败");
            return tip;
        }
        String name = excelFile.getOriginalFilename();
        long size = excelFile.getSize();
        //判断文件是否为空
        if(name == null || "".equals(name) && size==0){
            tip.setFlag(false);
            tip.setMsg("文件为空，导入数据失败");
            return tip;
        }
        //设置起始行数，用于提示不符合的行数
        int count = 1;
        //读取Excel数据到List中
        try {
            //获取Excel表格数据
            List<ArrayList<String>> listExcel = readExcel(excelFile);
            //设置日期格式
            //DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy/MM/dd");
            //将数据导入数据库
           // tip = inputExcel(listExcel,session.getDwid(),session.getCenterId(),session.getUserId());
        } catch (IOException e) {
            tip.setFlag(false);
            tip.setMsg("解析文件失败！请检查文件后缀是否为xls或xlsx");
        } catch (DateTimeParseException e) {
            tip.setFlag(false);
            tip.setMsg("第"+count+"行日期格式不正确导入失败");
        }
        return tip;
    }
    public List<ArrayList<String>> readExcel(MultipartFile file) throws IOException {
        if(file==null||"".equals(file.getOriginalFilename().trim())){
            return null;
        }else{
            String postfix = getPostfix(file.getOriginalFilename());
            if(!"".equals(postfix)){
                if(OFFICE_EXCEL_2003_POSTFIX.equals(postfix)){
                    //return readXls(file);
                }else if(OFFICE_EXCEL_2010_POSTFIX.equals(postfix)){
                    return readXlsx(file);
                }else{
                    return null;
                }
            }
        }
        return null;
    }
    public static String getPostfix(String path){
        if(path==null || EMPTY.equals(path.trim())){
            return EMPTY;
        }
        if(path.contains(POINT)){
            return path.substring(path.lastIndexOf(POINT)+1,path.length());
        }
        return EMPTY;
    }

    public List<ArrayList<String>> readXlsx(MultipartFile file){
        List<ArrayList<String>> list = new ArrayList<ArrayList<String>>();
        // IO流读取文件
        InputStream input = null;
        XSSFWorkbook wb = null;
        ArrayList<String> rowList = null;
        try {
            input = file.getInputStream();
            // 创建文档
            wb = new XSSFWorkbook(input);
            //读取sheet(页)
            for(int numSheet=0;numSheet<wb.getNumberOfSheets();numSheet++){
                XSSFSheet xssfSheet = wb.getSheetAt(numSheet);
                if(xssfSheet == null){
                    continue;
                }
                totalRows = xssfSheet.getLastRowNum();
                //读取Row,从第二行开始
                for(int rowNum = 1;rowNum <= totalRows;rowNum++){
                    XSSFRow xssfRow = xssfSheet.getRow(rowNum);
                    if(xssfRow!=null){
                        rowList = new ArrayList<String>();
                        totalCells = xssfRow.getLastCellNum();
                        //读取列，从第一列开始
                        for(int c=0;c<=totalCells+1;c++){
                            XSSFCell cell = xssfRow.getCell(c);
                            if(cell==null){
                                rowList.add(EMPTY);
                                continue;
                            }
                            rowList.add(getXValue(cell).trim());
                        }
                        list.add(rowList);
                    }
                }
            }
            return list;
        } catch (IOException e) {
            e.printStackTrace();
        } finally{
            try {
                input.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    public static String getXValue(XSSFCell xssfCell){
        if (xssfCell.getCellType() == Cell.CELL_TYPE_BOOLEAN) {
            return String.valueOf(xssfCell.getBooleanCellValue());
        } else if (xssfCell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
            String cellValue = "";
            if(DateUtil.isCellDateFormatted(xssfCell)){
                Date date = DateUtil.getJavaDate(xssfCell.getNumericCellValue());
                cellValue = sdf.format(date);
            }else{
                DecimalFormat df = new DecimalFormat("#.##");
                cellValue = df.format(xssfCell.getNumericCellValue());
                String strArr = cellValue.substring(cellValue.lastIndexOf(POINT)+1,cellValue.length());
                if(strArr.equals("00")){
                    cellValue = cellValue.substring(0, cellValue.lastIndexOf(POINT));
                }
            }
            return cellValue;
        } else {
            return String.valueOf(xssfCell.getStringCellValue());
        }
    }
}
