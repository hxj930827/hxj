package hxj.util.tips;

public class Tips {
	private boolean flag;// 标识符
	private String msg;// 提示信息
	private int sign;// 标志符

	public boolean isFlag() {
		return flag;
	}

	public void setFlag(boolean flag) {
		this.flag = flag;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public int getSign() {
		return sign;
	}

	public void setSign(int sign) {
		this.sign = sign;
	}

	@Override
	public String toString() {
		return "Tips [flag=" + flag + ", msg=" + msg + ", sign=" + sign + "]";
	}
}
