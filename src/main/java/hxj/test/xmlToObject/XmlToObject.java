/**
 * FileName: XmlToObject
 * Author:   韩旭杰
 * Date:     2018/12/29 10:04
 * Description: xml转换成对象
 */
package hxj.test.xmlToObject;

import com.thoughtworks.xstream.XStream;
import hxj.test.model.Hyqs;

import java.io.*;

/**
 * 说明：〈xml转换成对象〉
 *
 * @author 韩旭杰
 * @date 2018/12/29
 * @since 1.0.0
 */
public class XmlToObject {
    public static void main(String[] args) {
        File file=new File("d:"+ File.separator+"newXml"+File.separator+"hxj");
        InputStream input = null;
        try {
            input=new FileInputStream(file);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        XStream xStream=new XStream();
        xStream.alias("hyqs",Hyqs.class);
        //xStream.alias("GZLDATA11", TwoCode.class);
        Hyqs hyqs=(Hyqs)xStream.fromXML(input);
        System.out.println(hyqs);
        // 创建一个集合，用于组成新的集合
//        List<TwoCode> newHyqsOne=new ArrayList<>();
//        // 获取结合
//        List<TwoCode> hyqsOne=hyqs.getHyqsOne();
//        for(int i=0;i<hyqsOne.size();i++){
//            if(hyqsOne.get(i).getHPXX0000().equals("123456")){
//                newHyqsOne.add(hyqsOne.get(i));
//            }
//        }
//        System.out.println(newHyqsOne);
//        // 生成新的xml
//        //File fileOne=new File("d:"+File.separator+"hxjOne");
//        try {
//            //OutputStream outputStream= new FileOutputStream(fileOne,true);
//            //Hyqs hyqs1=new Hyqs();
//            //hyqs1.setHyqsOne(newHyqsOne);
//            //调用toXML 将对象转成字符串
//            //xStream.toXML(hyqs1,outputStream);
//
//            String strXml="";
//            // 遍历集合
//            for(int j=0;j<newHyqsOne.size();j++){
//                xStream.alias("GZLDATA11",TwoCode.class);
//                strXml+=xStream.toXML(newHyqsOne.get(j));
//            }
//            System.out.println(strXml);
//            // 将字符串转换为对象
//            StringToFile.strToFile(strXml,"d:"+ File.separator+"hxj");
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        File dir=new File("d:"+File.separator);
//        File[] files = dir.listFiles((File d, String name) -> name.endsWith("xml"));
//        System.out.println(files[0].getName());
    }
}
