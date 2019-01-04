/**
 * FileName: BankDao
 * Author:   韩旭杰
 * Date:     2018/10/26 15:53
 * Description: 银行管理Dao
 */
package hxj.com.dao;

import hxj.com.model.BankModel;

import java.util.Date;

/**
 * 说明：〈银行管理Dao〉
 *
 * @author 韩旭杰
 * @create 2018/10/26
 * @since 1.0.0
 */
public interface BankDao {
   int addBank(BankModel bankModel);
}
