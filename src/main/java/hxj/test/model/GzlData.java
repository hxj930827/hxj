/**
 * FileName: TwoCode
 * Author:   韩旭杰
 * Date:     2018/12/29 9:27
 * Description:
 */
package hxj.test.model;

/**
 * 说明：
 *
 * @author 韩旭杰
 * @date 2018/12/29
 * @since 1.0.0
 */
public class GzlData {
    private String HPXX0000;
    private String JFJLJCQY;
    private String JFJLXLSY;
    private String JFJLCLSY;
    private String SJJLJCQY;
    private String SJJLXLSY;
    private String SJJLCLSY;
    private String SJJLCJLSY;

    public String getHPXX0000() {
        return HPXX0000;
    }

    public void setHPXX0000(String HPXX0000) {
        this.HPXX0000 = HPXX0000;
    }

    public String getJFJLJCQY() {
        return JFJLJCQY;
    }

    public void setJFJLJCQY(String JFJLJCQY) {
        this.JFJLJCQY = JFJLJCQY;
    }

    public String getJFJLXLSY() {
        return JFJLXLSY;
    }

    public void setJFJLXLSY(String JFJLXLSY) {
        this.JFJLXLSY = JFJLXLSY;
    }

    public String getJFJLCLSY() {
        return JFJLCLSY;
    }

    public void setJFJLCLSY(String JFJLCLSY) {
        this.JFJLCLSY = JFJLCLSY;
    }

    public String getSJJLJCQY() {
        return SJJLJCQY;
    }

    public void setSJJLJCQY(String SJJLJCQY) {
        this.SJJLJCQY = SJJLJCQY;
    }

    public String getSJJLXLSY() {
        return SJJLXLSY;
    }

    public void setSJJLXLSY(String SJJLXLSY) {
        this.SJJLXLSY = SJJLXLSY;
    }

    public String getSJJLCLSY() {
        return SJJLCLSY;
    }

    public void setSJJLCLSY(String SJJLCLSY) {
        this.SJJLCLSY = SJJLCLSY;
    }

    public String getSJJLCJLSY() {
        return SJJLCJLSY;
    }

    public void setSJJLCJLSY(String SJJLCJLSY) {
        this.SJJLCJLSY = SJJLCJLSY;
    }

    @Override
    public String toString() {
        return "GzlData{" +
                "HPXX0000='" + HPXX0000 + '\'' +
                ", JFJLJCQY='" + JFJLJCQY + '\'' +
                ", JFJLXLSY='" + JFJLXLSY + '\'' +
                ", JFJLCLSY='" + JFJLCLSY + '\'' +
                ", SJJLJCQY='" + SJJLJCQY + '\'' +
                ", SJJLXLSY='" + SJJLXLSY + '\'' +
                ", SJJLCLSY='" + SJJLCLSY + '\'' +
                ", SJJLCJLSY='" + SJJLCJLSY + '\'' +
                '}';
    }
}
