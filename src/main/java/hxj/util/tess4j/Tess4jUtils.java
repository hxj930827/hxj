/**
 * FileName: Tess4jUtils
 * Author:   韩旭杰
 * Date:     2018/11/28 10:35
 * Description: 图片文字识别工具类
 */
package hxj.util.tess4j;

import net.sourceforge.tess4j.ITesseract;
import net.sourceforge.tess4j.Tesseract;
import net.sourceforge.tess4j.TesseractException;
import net.sourceforge.tess4j.util.ImageHelper;
import net.sourceforge.tess4j.util.LoadLibs;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;

/**
 * 说明：〈图片文字识别工具类〉
 *
 * @author 韩旭杰
 * @date 2018/11/28
 * @since 1.0.0
 */
public class Tess4jUtils {

    /**
     * 从图片中提取文字,默认设置英文字库,使用classpath目录下的训练库
     * @param path
     * @return
     */
    public static String readChar(String path){
        // JNA Interface Mapping
        ITesseract instance = new Tesseract();
        // JNA Direct Mapping
        // ITesseract instance = new Tesseract1();
        File imageFile = new File(path);
        //In case you don't have your own tessdata, let it also be extracted for you
        //这样就能使用classpath目录下的训练库了
        File tessDataFolder = LoadLibs.extractTessResources("tessdata");
        //Set the tessdata path
        instance.setDatapath(tessDataFolder.getAbsolutePath());
        //英文库识别数字比较准确
        instance.setLanguage("eng");
        return getOCRText(instance, imageFile);
    }

    /**
     * 从图片中提取文字
     * @param path 图片路径
     * @param dataPath 训练库路径
     * @param language 语言字库
     * @return
     */
    public static String readChar(String path, String dataPath, String language){
        File imageFile = new File(path);
        ITesseract instance = new Tesseract();
        instance.setDatapath(dataPath);
        //英文库识别数字比较准确
        instance.setLanguage(language);
        return getOCRText(instance, imageFile);
    }

    /**
     * 识别图片文件中的文字
     * @param instance
     * @param imageFile
     * @return
     */
    private static String getOCRText(ITesseract instance, File imageFile){
        String result = null;
        try {
            result = instance.doOCR(imageFile);
        } catch (TesseractException e) {
            e.printStackTrace();
        }
        return result;
    }

    public static String readChar1(String path){
        // JNA Interface Mapping
        ITesseract instance = new Tesseract();
        // JNA Direct Mapping
        // ITesseract instance = new Tesseract1();
        File imageFile = new File(path);
        //In case you don't have your own tessdata, let it also be extracted for you
        //这样就能使用classpath目录下的训练库了
        File tessDataFolder = LoadLibs.extractTessResources("tessdata");
        //Set the tessdata path
        instance.setDatapath(tessDataFolder.getAbsolutePath());
        String a="";
        BufferedImage textImage = null;
        try{
            //Rectangle rectangle = new Rectangle(10, 10, 100, 100);
            BufferedImage grayImage =ImageIO.read(imageFile);
            textImage = ImageHelper.convertImageToGrayscale(ImageHelper.getSubImage(grayImage, 0, 0, grayImage.getWidth(), grayImage.getHeight()));  //对图片进行处理
            textImage = ImageHelper.getScaledInstance(grayImage, grayImage.getWidth() * 5, grayImage.getHeight() * 5);  //将图片扩大5倍
            //英文库识别数字比较准确
            instance.setLanguage("chi_sim");
            a=instance.doOCR(textImage);
            //ImageIO.write(grayImage, "jpg", new File("data/", "test2.jpg"));
        }catch (Exception e){

        }
        return a;
        //return getOCRText(instance, imageFile);
    }

    public static void main(String[] args) {
        String path="G:/3.png";
        String path1="G:/2.jpg";
        System.out.println(readChar1(path));
    }
}
