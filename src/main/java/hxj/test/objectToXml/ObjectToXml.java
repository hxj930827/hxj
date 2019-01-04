/**
 * FileName: ObjectToXml
 * Author:   韩旭杰
 * Date:     2018/12/29 9:16
 * Description: 对象转xml文件
 */
package hxj.test.objectToXml;

import com.thoughtworks.xstream.XStream;
import hxj.test.model.*;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * 说明：〈对象转xml文件〉
 *
 * @author 韩旭杰
 * @date 2018/12/29
 * @since 1.0.0
 */
public class ObjectToXml {
//    public static void main(String[] args) {
//        Hyqs hyqs=new Hyqs();
//        TwoCode two=new TwoCode();
//        two.setHPXX0000("20171231,HGBLA0000241,20171231HGBLA0000241,零,,20180101,A000241,鹤岗,HGB,哈,鹤岗,HGB,哈,沭阳,FMH,新长公司,25000,0,27,大米,1,2682,0.8475,22,0.0,00,0,0");
//        two.setJFJLJCQY("哈,电力,4762.992;哈,内燃,24702.184;沈,电力,42166.488;京,电力,25682.8;济,电力,18678.4;新长公司,内燃,2428.192;上,电力,6817.616;");
//        two.setJFJLXLSY("B00000,哈,534.772,0,0,534.772;T00000,沈,765.292,0,0,765.292;P00000,京,466.125,209.332,0,256.793;K00000,济,339,339,0,0;H00000,新长公司,44.07,0,44.07,0;H00000,上,123.735,27.12,0,96.615;");
//        two.setJFJLCLSY("哈,535;沈,765;京,466;济,339;新长公司,44;上,124;");
//        two.setSJJLJCQY("哈,哈,内燃,25729.496;沈,沈,电力,41746.224;沈,哈,电力,3081.936;京,京,内燃,11440.52;京,京,电力,13822.016;济,济,电力,18678.4;济,上,电力,1494.272;上,上,电力,5323.344;上,新长公司,内燃,2428.192;");
//        two.setSJJLXLSY("B00000,哈,522.909,0,0,522.909;T00000,沈,757.663,0,0,757.663;P00000,京,458.501,209.334,0,249.167;K00000,济,339.001,339.001,0,0;H00000,上,123.736,27.12,0,96.616;H00000,新长公司,44.07,0,44.07,0;");
//        two.setSJJLCLSY("哈,522.908;沈,757.665;京,458.498;济,339;上,123.735;新长公司,44.07;");
//        two.setSJJLCJLSY(",,,;");
//        List<TwoCode> list=new ArrayList<>();
//        list.add(two);
//        hyqs.setHyqsOne(list);
//        // 创建XStream对象
//        XStream xStream = new XStream();
//        // 给指定类起别名
//        xStream.alias("hyqs",Hyqs.class);
//        // 将类的某一个数据指定一个别名
//       // xStream.aliasAttribute(Hyqs.class,"twocode","hyqsOne");
//        xStream.alias("GZLDATA11", TwoCode.class);
//        File file=new File("d:"+File.separator+"hxj.xml");
//        try {
//            OutputStream outputStream= new FileOutputStream(file);
//            //调用toXML 将对象转成字符串
//            xStream.toXML(hyqs,outputStream);
//        } catch (FileNotFoundException e) {
//            e.printStackTrace();
//        }
//        //调用toXML 将对象转成字符串
//        String s=xStream.toXML(hyqs);
//        System.out.println(s);
//    }

}
