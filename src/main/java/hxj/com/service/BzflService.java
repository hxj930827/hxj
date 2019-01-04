package hxj.com.service;

import com.github.pagehelper.PageInfo;
import hxj.com.model.BzflModel;
import hxj.util.pageHelper.PageBase;

import java.util.List;

public interface BzflService {
	// 展示标准费率数据
	public PageInfo<BzflModel> showList(PageBase pageBase);

	public List<BzflModel> showList();

	/**
	 * 新增银行种类数据
	 */
	public int addBank();
}
