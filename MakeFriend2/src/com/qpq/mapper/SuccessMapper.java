package com.qpq.mapper;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.qpq.pojo.Success;
import com.qpq.pojo.User;

@Repository
public interface SuccessMapper {
	/** 按照Id查询 */
	Success  selectById(int sid) throws Exception;
	/** 按照Id查询 User*/
	User  selectByIdU(int sid) throws Exception;
	//插入新的留言
	int insertSuccess(Success suc)throws Exception;
		//根据编号删除
	int deleteSuccess(int id)throws Exception;
	//查询成功案例的数量
	int selectCount()throws Exception;
	//查询成功案例的记录集合
	List<Success> selectAllSuccess(HashMap<String,Object> map)  throws Exception;

}
