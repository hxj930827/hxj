/**
 * FileName: ReadToString
 * Author:   韩旭杰
 * Date:     2018/12/29 10:46
 * Description: 读取文件所有内容
 */
package hxj.test.readToString;

import hxj.test.stringToFile.StringToFile;

import java.io.*;

/**
 * 说明：〈读取文件所有内容〉
 *
 * @author 韩旭杰
 * @date 2018/12/29
 * @since 1.0.0
 */
public class ReadToString {
    public static String readToString(String fileName) {
        String encoding = "GB2312";
        File file = new File(fileName);
        Long filelength = file.length();
        byte[] filecontent = new byte[filelength.intValue()];
        try {
            FileInputStream in = new FileInputStream(file);
            in.read(filecontent);
            in.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        try {
            return new String(filecontent, encoding);
        } catch (UnsupportedEncodingException e) {
            System.err.println("The OS does not support " + encoding);
            e.printStackTrace();
            return null;
        }
    }

}
