/**
 * FileName: ThreadOne
 * Author:   韩旭杰
 * Date:     2019/1/4 15:14
 * Description:
 */
package hxj.test.thread;

import hxj.test.actual.Actual;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 说明：〈〉
 *
 * @author 韩旭杰
 * @date 2019/1/4
 * @since 1.0.0
 */
public class ThreadOne {
    public static void main(String[] args) {
        Actual actual = new Actual("A");
        Actual actualOne = new Actual("B");
        Date date=new Date();
        actual.start();
        actualOne.start();
        try {
            actual.join();
            actualOne.join();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        Date date1=new Date();
        long number = date1.getTime()-date.getTime();
        System.out.println(number);
    }
}
