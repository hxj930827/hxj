package hxj.util.session;

import java.io.Serializable;

public class UserSession implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// �ʺ�
	private String accountNo;
	// ����
	private String name;
	// ����
	private String password;
	public String getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "UserSession [accountNo=" + accountNo + ", name=" + name + ", password=" + password + "]";
	}
	
}
