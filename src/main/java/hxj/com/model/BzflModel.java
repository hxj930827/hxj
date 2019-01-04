package hxj.com.model;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class BzflModel implements Serializable{

	private static final long serialVersionUID = 1L;
	/**
	 * 主键id
	 */
	private String id;
	/**
	 * 生效日期
	 */
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date effectiveDate;
	/**
	 * 失效日期
	 */
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date invalidDate;
	/**
	 * 科目号
	 */
	private String courseId;
	/**
	 * 存期
	 */
	private Integer fixPeriod;
	/**
	 *  年费率
	 */
	private Double yearRate;
	/**
	 * 备注
	 */
	private String remark;
	/**
	 *  状态
	 */
	private Integer status;
	/**
	 * 录入人
	 */
	private String inputUser;
	/**
	 * 录入日期
	 */
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date inputDate;
	/**
	 * 录入时间
	 */
	private String inputTime;
	/**
	 * 中心id
	 */
	private String centerId;
	/**
	 * 审核人
	 */
	private String checkUser;
	/**
	 * 审核日期
	 */
	private Date checkDate;
	/**
	 * 审核时间
	 */
	private String checkTime;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getEffectiveDate() {
		return effectiveDate;
	}
	public void setEffectiveDate(Date effectiveDate) {
		this.effectiveDate = effectiveDate;
	}
	public Date getInvalidDate() {
		return invalidDate;
	}
	public void setInvalidDate(Date invalidDate) {
		this.invalidDate = invalidDate;
	}
	public String getCourseId() {
		return courseId;
	}
	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
	public Integer getFixPeriod() {
		return fixPeriod;
	}
	public void setFixPeriod(Integer fixPeriod) {
		this.fixPeriod = fixPeriod;
	}
	public Double getYearRate() {
		return yearRate;
	}
	public void setYearRate(Double yearRate) {
		this.yearRate = yearRate;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getInputUser() {
		return inputUser;
	}
	public void setInputUser(String inputUser) {
		this.inputUser = inputUser;
	}
	public Date getInputDate() {
		return inputDate;
	}
	public void setInputDate(Date inputDate) {
		this.inputDate = inputDate;
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
	public String getCheckUser() {
		return checkUser;
	}
	public void setCheckUser(String checkUser) {
		this.checkUser = checkUser;
	}
	public Date getCheckDate() {
		return checkDate;
	}
	public void setCheckDate(Date checkDate) {
		this.checkDate = checkDate;
	}
	public String getCheckTime() {
		return checkTime;
	}
	public void setCheckTime(String checkTime) {
		this.checkTime = checkTime;
	}
	@Override
	public String toString() {
		return "bzflModel [id=" + id + ", effectiveDate=" + effectiveDate + ", invalidDate=" + invalidDate
				+ ", courseId=" + courseId + ", fixPeriod=" + fixPeriod + ", yearRate=" + yearRate + ", remark="
				+ remark + ", status=" + status + ", inputUser=" + inputUser + ", inputDate=" + inputDate
				+ ", inputTime=" + inputTime + ", centerId=" + centerId + ", checkUser=" + checkUser + ", checkDate="
				+ checkDate + ", checkTime=" + checkTime + "]";
	}
	
}
