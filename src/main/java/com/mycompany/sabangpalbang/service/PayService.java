package com.mycompany.sabangpalbang.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.sabangpalbang.dao.OrderDetailDao;
import com.mycompany.sabangpalbang.dao.OrderMainDao;
import com.mycompany.sabangpalbang.dao.ProductDao;
import com.mycompany.sabangpalbang.dto.OrderMain;
import com.mycompany.sabangpalbang.dto.Product;

@Service
public class PayService {
	@Autowired
	private ProductDao productDao;
	@Autowired
	private OrderMainDao orderMainDao;
	@Autowired
	private OrderDetailDao orderDetailDao;

	public Product getProductById(int product_id) {
		Product product = productDao.selectCartByProductId(product_id);
		return product;
	}

	public String addOrder(OrderMain order) {
		orderMainDao.insertOrder(order);
		for(int i=0; i<order.getOrderLists().size(); i++) { 
			order.getOrderLists().get(i).setOrder_id(order.getOrder_id());
			orderDetailDao.insertOrderDetail(order.getOrderLists().get(i));
		}
		return "success";
	}
}
