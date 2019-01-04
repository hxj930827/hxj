package hxj.critc.timer;

import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * 定时器
 */
@Lazy(false) 
@Component("autoFinishWork")
public class AutoFinishWork {

    public static void main(String[] args) {
        int i=Integer.valueOf("adf");
        System.out.println(i);
    }
    //每5秒触发一次
    //@Scheduled(cron = "*/5 * * * * ?")
    public void autoWork(){
		System.out.println("1");
	}
}
