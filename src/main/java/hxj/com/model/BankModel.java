/**
 * FileName: BankModel
 * Author:   韩旭杰
 * Date:     2018/10/26 15:58
 * Description:
 */
package hxj.com.model;

import java.io.Serializable;
import java.util.Date;

/**
 * 说明：〈〉
 *
 * @author 韩旭杰
 * @create 2018/10/26
 * @since 1.0.0
 */
public class BankModel implements Serializable {
    private static final long serialVersionUID = 1L;
    private String banktypeCode;
    private String banktypeName;
    private String status;
    private String remark;
    private String inputUser;
    private String inputTime;
    private String centerId;
    private Date inputDate;

    public String getBanktypeCode() {
        return banktypeCode;
    }

    public void setBanktypeCode(String banktypeCode) {
        this.banktypeCode = banktypeCode;
    }

    public String getBanktypeName() {
        return banktypeName;
    }

    public void setBanktypeName(String banktypeName) {
        this.banktypeName = banktypeName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getInputUser() {
        return inputUser;
    }

    public void setInputUser(String inputUser) {
        this.inputUser = inputUser;
    }

    public String getInputTime() {
        return inputTime;
    }

    public void setInputTime(String inputTime) {
        this.inputTime = inputTime;
    }

    public String getCenterId() {
        return centerId;
    }

    public void setCenterId(String centerId) {
        this.centerId = centerId;
    }

    public Date getInputDate() {
        return inputDate;
    }

    public void setInputDate(Date inputDate) {
        this.inputDate = inputDate;
    }

    @Override
    public String toString() {
        return "BankDao{" +
                "banktypeCode='" + banktypeCode + '\'' +
                ", banktypeName='" + banktypeName + '\'' +
                ", status='" + status + '\'' +
                ", remark='" + remark + '\'' +
                ", inputUser='" + inputUser + '\'' +
                ", inputTime='" + inputTime + '\'' +
                ", centerId='" + centerId + '\'' +
                ", inputDate=" + inputDate +
                '}';
    }

}
