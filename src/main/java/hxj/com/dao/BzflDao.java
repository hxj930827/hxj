package hxj.com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import hxj.com.model.BzflModel;

public interface BzflDao {
	List<BzflModel> showList(@Param("centerId")String centerId);

}
