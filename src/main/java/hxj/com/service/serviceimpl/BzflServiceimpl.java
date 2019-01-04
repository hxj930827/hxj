package hxj.com.service.serviceimpl;

import java.util.Date;
import java.util.List;

import hxj.com.dao.BankDao;
import hxj.com.model.BankModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import hxj.com.dao.BzflDao;
import hxj.com.model.BzflModel;
import hxj.com.service.BzflService;
import hxj.util.pageHelper.PageBase;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class BzflServiceimpl implements BzflService {
	@Autowired
	private BzflDao bzflDao;
	@Autowired
	private BankDao bankDao;
	@Override
	public PageInfo<BzflModel> showList(PageBase pageBase) {
		// ��ҳ���
		Page<BzflModel> pager = PageHelper.startPage(pageBase.getPage(), pageBase.getLimit());
		List<BzflModel> bzflList = bzflDao.showList("0000009");
		// ��������Ϣ���浽pageInfo��
		PageInfo<BzflModel> pageInfo = new PageInfo<BzflModel>(bzflList);
		return pageInfo;
	}

	@Override
	public List<BzflModel> showList() {
		List<BzflModel> bzflList = bzflDao.showList("0000009");
		return bzflList;
	}

	/**
	 * 新增银行种类数据
	 */
	@Override
    // 添加这句话，当这个方法发生错误时，可以让事物发生回滚
    // @Transactional(propagation = Propagation.REQUIRED, rollbackFor={RuntimeException.class, Exception.class})
    //  注意@Transactional只能被应用到public方法上
	public int addBank() {
        BankModel bankModel=new BankModel();
        bankModel.setBanktypeCode("007");
        bankModel.setBanktypeName("韩旭杰");
        bankModel.setStatus("1");
        bankModel.setRemark("测试");
        bankModel.setInputUser("韩旭杰");
        bankModel.setInputTime("20181026");
        bankModel.setCenterId("0000009");
        bankModel.setInputDate(new Date());
		bankDao.addBank(bankModel);
		// 测试数据是否回滚
        int i=Integer.valueOf("1");
        return i;
    }

}
