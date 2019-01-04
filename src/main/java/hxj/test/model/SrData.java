/**
 * FileName:
 * Author:   韩旭杰
 * Date:     2018/12/29 9:27
 * Description: 一级节点
 */
package hxj.test.model;

import java.util.List;

/**
 * 说明：
 *
 * @author 韩旭杰
 * @date 2018/12/29
 * @since 1.0.0
 */
public class SrData {
    private String HPXX00;
    private String TJXX00;

    public String getHPXX00() {
        return HPXX00;
    }

    public void setHPXX00(String HPXX00) {
        this.HPXX00 = HPXX00;
    }

    public String getTJXX00() {
        return TJXX00;
    }

    public void setTJXX00(String TJXX00) {
        this.TJXX00 = TJXX00;
    }

    @Override
    public String toString() {
        return "SrData{" +
                "HPXX00='" + HPXX00 + '\'' +
                ", TJXX00='" + TJXX00 + '\'' +
                '}';
    }
}
