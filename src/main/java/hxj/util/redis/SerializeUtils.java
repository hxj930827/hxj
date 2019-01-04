package hxj.util.redis;

/**
 * 序列化和反序列化工具类
 *
 * @author张振亭
 * @create 2018-03-07 17:07
 **/
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
public class SerializeUtils {
    public static byte[] serialize(Object obj){
        byte[] bytes = null;
        try {
            ByteArrayOutputStream baos=new ByteArrayOutputStream();;
            ObjectOutputStream oos=new ObjectOutputStream(baos);
            oos.writeObject(obj);
            bytes=baos.toByteArray();
            baos.close();
            oos.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return bytes;
    }
    public static Object deSerialize(byte[] bytes){
        Object obj=null;
        try {
            ByteArrayInputStream bais=new ByteArrayInputStream(bytes);
            ObjectInputStream ois=new ObjectInputStream(bais);
            obj=ois.readObject();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return obj;
    }
}