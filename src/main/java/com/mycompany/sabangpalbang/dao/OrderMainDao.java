package com.mycompany.sabangpalbang.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.sabangpalbang.dto.OrderMain;


@Mapper
public interface OrderMainDao {

	public int insert();
	public List<OrderMain> selectAll();
	public List<OrderMain> selectOrderByUid(HashMap<String, Object> map);
	public int deleteOrderByOrderId(int order_id);
	public int insertOrder(OrderMain order);
	public int count(int order_memberid);
	
}
