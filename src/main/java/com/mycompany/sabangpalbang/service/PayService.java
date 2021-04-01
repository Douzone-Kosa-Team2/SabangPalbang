package com.mycompany.sabangpalbang.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.sabangpalbang.dao.OrderDetailDao;
import com.mycompany.sabangpalbang.dao.OrderMainDao;
import com.mycompany.sabangpalbang.dao.ProductDao;
import com.mycompany.sabangpalbang.dto.Product;
import com.mycompany.sabangpalbang.dto.Sabang;

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

	
}
