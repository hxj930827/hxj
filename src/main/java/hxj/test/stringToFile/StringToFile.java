/**
 * FileName: StringToFile
 * Author:   韩旭杰
 * Date:     2018/12/29 10:53
 * Description: 将字符串写到文件中
 */
package hxj.test.stringToFile;

import java.io.*;

/**
 * 说明：〈将字符串写到文件中〉
 *
 * @author 韩旭杰
 * @date 2018/12/29
 * @since 1.0.0
 */
public class StringToFile {
    public static void strToFile(String s,String path,String fileName){
        FileWriter fw = null;
        File f = new File(path);
        File file=new File(path+File.separator+fileName);
        try {
            if(!f.exists()){
                f.mkdirs();
            }
            if(!file.exists()){
                file.createNewFile();
            }
            fw = new FileWriter(file);

            BufferedWriter out = new BufferedWriter(fw);
            out.write(s, 0, s.length()-1);
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void strToFileGB2312(String s,String path){
        OutputStreamWriter fw = null;
        File f = new File(path);
        try {
            if(!f.exists()){
                f.createNewFile();
            }
            fw = new OutputStreamWriter(new FileOutputStream(f),"GB2312");
            BufferedWriter out = new BufferedWriter(fw);
            out.write(s, 0, s.length()-1);
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
