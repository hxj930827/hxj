/**
 * FileName: Actual
 * Author:   韩旭杰
 * Date:     2018/12/29 14:43
 * Description: 实战操作
 */
package hxj.test.actual;

import com.thoughtworks.xstream.XStream;
import hxj.test.model.GzlData;
import hxj.test.model.Hyqs;
import hxj.test.model.SrData;
import hxj.test.readToString.ReadToString;
import hxj.test.stringToFile.StringToFile;
import hxj.util.tips.Tips;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 说明：〈实战操作〉
 * 完成董工要求的功能
 *
 * @author 韩旭杰
 * @date 2018/12/29
 * @since 1.0.0
 */
public class Actual extends Thread {
    /**
     * 定义Pattern常量
     */
    private static Pattern p = Pattern.compile(">(\\s*|\t|\n|\r)<");

    private String name;

    public Actual(String name) {
        this.name = name;
    }

    @Override
    public void run() {
        Date date=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
        String dateStr=sdf.format(date);
        if (this.name.equals("A")) {
            String srxx="d:" + File.separator + "srXml" + File.separator + "SRXX";
            readWrite(srxx,srxx,"srData",dateStr);
        } else {
            String tjxx="d:" + File.separator + "srXml" + File.separator + "TJXX";
            readWrite(tjxx,tjxx,"gzlData",dateStr);
        }
    }

    public static void main(String[] args) {
        Actual actual = new Actual("A");
        Date date=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
        String dateStr=sdf.format(date);
        String srxx="d:" + File.separator + "srXml" + File.separator + "SRXX";
        String tjxx="d:" + File.separator + "srXml" + File.separator + "TJXX";

        actual.readWrite(srxx,srxx,"srData",dateStr);
        actual.readWrite(tjxx,tjxx,"gzlData",dateStr);
        Date date1=new Date();
        long number = date1.getTime()-date.getTime();
        System.out.println(number);
    }

    /**
     * 获取xml文件处理后并生成新的xml文件
     *
     * @param xmlPath  xml文件路径
     * @param dataType 数据类型  gzlData和srData
     * @return
     */
    public Tips readWrite(String filePath, String xmlPath, String dataType, String dateStr) {
        // 定义信息提示类
        Tips tips = new Tips();
        // 创建File对象
        File dir = new File(filePath);
        // 判断给定的xml是否存在
        if (!dir.exists()) {
            tips.setFlag(false);
            tips.setMsg("指定的路径不存在");
            return tips;
        }
        // 获取根节点的名称(当前文件夹为根节点)
        String strRoot = xmlPath.substring(xmlPath.lastIndexOf(File.separator) + 1, xmlPath.length());
        // 创建新的根节点（根节点+时间）
        String newStrRoot = strRoot + dateStr;
        // 获取根节点的路径
        String rootPath = xmlPath.substring(0, xmlPath.lastIndexOf(File.separator) + 1);
        // 创建新的根节点路径
        String newRootPath = rootPath + newStrRoot;
        // 获取指定路径的所有xml文件
        //File[] files = dir.listFiles((File d, String name) -> name.endsWith("xml"));
        //判断是不是目录
        if (dir.isDirectory()) {
            //获取目录下文件列表
            File[] F1 = dir.listFiles();
            for (File f2 : F1) {
                if (f2.isDirectory()) {
                    // 递归调用
                    readWrite(f2.getAbsolutePath(), xmlPath, dataType, dateStr);
                } else {
                    // 处理文件内容（文件的格式不正确，需要在最外层再加入两层节点）
                    iteratorFile(f2, xmlPath, newRootPath, dataType);
                }
            }
        } else {
            tips.setFlag(false);
            tips.setMsg("指定的路径是文件，不是目录");
            return tips;
        }
        tips.setFlag(true);
        tips.setMsg("解析成功");
        return tips;
    }

    /**
     * 处理文件内容（文件的格式不正确，需要在最外层再加入两层节点）
     *
     * @param file        文件对象
     * @param xmlPath     解析xml的路径
     * @param newRootPath 新的根路径
     * @param dataType    数据类型  gzlData和srData
     */
    public void iteratorFile(File file, String xmlPath, String newRootPath, String dataType) {
        // 获取file的路径
        String filePath = file.getAbsolutePath();
        // 生成新的路径
        String newFilePath = filePath.replace(xmlPath, newRootPath);
        // 获取文件内容
        String info = ReadToString.readToString(file.getAbsolutePath());
        // 为文件内容添加前后缀   最后必须加一个空格，否则插入的内容没有 >  大于号
        info = "<hyqs>\n<hyqsOne>\n" + info + "</hyqsOne>\n</hyqs> ";
        String s = "";
        if ("srData".equals(dataType)) {
            // 解析srData
            s = uptSrData(info, newFilePath, file.getName());
        } else if ("gzlData".equals(dataType)) {
            // 解析gzlData
            s = uptGzlData(info, newFilePath, file.getName());
        }
        System.out.println(s);
    }

    /**
     * 解析gzlData
     *
     * @param xmlInfo      xml内容
     * @param dataFilePath xml文件修改后放入的路径
     * @param fileName     文件名称
     * @return
     */
    public String uptGzlData(String xmlInfo, String dataFilePath, String fileName) {
        XStream xStream = new XStream();
        // 为Hyqs起一个别名，这个名称，文件中必须有这个节点
        xStream.alias("hyqs", Hyqs.class);
        xStream.alias("GZLDATA", GzlData.class);
        // 将文件内容转换成对象
        Hyqs hyqs = (Hyqs) xStream.fromXML(xmlInfo);
        // 创建一个集合，用于组成新的集合
        List<GzlData> newHyqsOne = new ArrayList<>();
        // 获取结合
        List<Object> hyqsOne = hyqs.getHyqsOne();
        // 从数据库中获取数据，判断该是否保留
        //List<Map<String, Object>> list = xmljxDao.getGzlInfo(fileName);
        GzlData gzlData = new GzlData();
        // 判断文件内容是否为空
        if (hyqsOne == null || hyqsOne.size() == 0) {
            return "文件内容为空";
        } else {
            for (int i = 0; i < hyqsOne.size(); i++) {
                gzlData = (GzlData) hyqsOne.get(i);
                newHyqsOne.add(gzlData);
            }
        }
        if(newHyqsOne.size()==0){
            return "文件中没有匹配的数据";
        }
        String strXml = "";
        // 遍历集合
        for (int h = 0; h < newHyqsOne.size(); h++) {
            xStream.alias("GZLDATA", GzlData.class);
            strXml += xStream.toXML(newHyqsOne.get(h)) + "\n";
        }
        // 获取除去文件名后的路径
        String path = dataFilePath.replace(fileName, "");
        // 去掉最后一个斜杠“\”
        String newPath = path.substring(0, path.length() - 1);
        Matcher m = p.matcher(strXml);
        strXml = m.replaceAll(">\n<");
        // 将字符串转换为对象
        StringToFile.strToFile(strXml, newPath, fileName);
        return "新生成了一个" + fileName + "文件，放入了" + dataFilePath;
    }


    /**
     * srData数据
     *
     * @param xmlInfo      xml内容
     * @param dataFilePath xml文件修改后放入的路径
     * @param fileName     文件名称
     * @return
     */
    public String uptSrData(String xmlInfo, String dataFilePath, String fileName) {
        XStream xStream = new XStream();
        // 为Hyqs起一个别名，这个名称，文件中必须有这个节点
        xStream.alias("hyqs", Hyqs.class);
        xStream.alias("SRDATA", SrData.class);
        // 将文件内容转换成对象
        Hyqs hyqs = (Hyqs) xStream.fromXML(xmlInfo);
        // 创建一个集合，用于组成新的集合
        List<SrData> newHyqsOne = new ArrayList<>();
        // 获取结合
        List<Object> hyqsOne = hyqs.getHyqsOne();
        // 从数据库中获取数据，判断该是否保留
        //List<Map<String, Object>> list = xmljxDao.getSrInfo(fileName);
        SrData srdata = new SrData();
        // 判断文件内容是否为空
        if (hyqsOne == null || hyqsOne.size() == 0) {
            return "文件内容为空";
        } else {
            for (int i = 0; i < hyqsOne.size(); i++) {
                srdata = (SrData) hyqsOne.get(i);
                newHyqsOne.add(srdata);
            }
        }
        if(newHyqsOne.size()==0){
            return "文件中没有匹配的数据";
        }
        String strXml = "";
        // 遍历集合
        for (int h = 0; h < newHyqsOne.size(); h++) {
            xStream.alias("SRDATA", SrData.class);
            strXml += xStream.toXML(newHyqsOne.get(h)) + "\n";
        }
        // 获取除去文件名后的路径
        String path = dataFilePath.replace(fileName, "");
        // 去掉最后一个斜杠“\”
        String newPath = path.substring(0, path.length() - 1);

        Matcher m = p.matcher(strXml);
        strXml = m.replaceAll(">\n<");
        // 将字符串转换为对象
        StringToFile.strToFile(strXml, newPath, fileName);
        return "新生成了一个" + fileName + "文件，放入了" + dataFilePath;
    }

    /**
     * 获取字符编码集
     *
     * @param str
     * @return
     */
    public static String getEncoding(String str) {
        String encode = "GB2312";
        try {
            if (str.equals(new String(str.getBytes(encode), encode))) {
                String s = encode;
                return s;
            }
        } catch (Exception exception) {
        }
        encode = "ISO-8859-1";
        try {
            if (str.equals(new String(str.getBytes(encode), encode))) {
                String s1 = encode;
                return s1;
            }
        } catch (Exception exception1) {
        }
        encode = "UTF-8";
        try {
            if (str.equals(new String(str.getBytes(encode), encode))) {
                String s2 = encode;
                return s2;
            }
        } catch (Exception exception2) {
        }
        encode = "GBK";
        try {
            if (str.equals(new String(str.getBytes(encode), encode))) {
                String s3 = encode;
                return s3;
            }
        } catch (Exception exception3) {
        }
        return "";
    }
}
