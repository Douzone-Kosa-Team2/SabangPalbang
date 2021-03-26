package com.mycompany.sabangpalbang.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.mycompany.sabangpalbang.dto.OrderMain;


@Mapper
public interface OrderMainDao {

	public int insert();
	public List<OrderMain> selectAll();
	public OrderMain selectOrderByUid(String order_email);
	public int deleteOrderByOrderId(int order_id);
	
}
