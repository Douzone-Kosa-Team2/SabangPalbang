package com.mycompany.sabangpalbang.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.sabangpalbang.dto.Order_detail;

@Mapper
public interface OrderDetailDao {
	
	public int insert();
	public List<Order_detail> selectAll();
	public int deleteByOrderDetailno(int order_detailno);
}
