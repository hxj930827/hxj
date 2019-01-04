/**
 * FileName: Thread2
 * Author:   韩旭杰
 * Date:     2019/1/4 15:55
 * Description:
 */
package hxj.test.thread;

/**
 * 说明：〈〉
 *
 * @author 韩旭杰
 * @date 2019/1/4
 * @since 1.0.0
 */
public class Thread2 implements Runnable{
    private String name;
    private Object prev;
    private Object self;

    private Thread2(String name, Object prev, Object self) {
        this.name = name;
        this.prev = prev;
        this.self = self;
    }

    @Override
    public void run() {
        int count = 10;
        while (count > 0) {
            synchronized (prev) {
                synchronized (self) {
                    System.out.print(name);
                    count--;

                    self.notify();
                }
                try {
                    prev.wait();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }

        }
    }

    public static void main(String[] args) throws Exception {
        Object a = new Object();
        Object b = new Object();
        Object c = new Object();
        Thread2 pa = new Thread2("A", c, a);
        Thread2 pb = new Thread2("B", a, b);
        Thread2 pc = new Thread2("C", b, c);


        new Thread(pa).start();
        Thread.sleep(100);  //确保按顺序A、B、C执行
        new Thread(pb).start();
        Thread.sleep(100);
        new Thread(pc).start();
        Thread.sleep(100);
    }
}
