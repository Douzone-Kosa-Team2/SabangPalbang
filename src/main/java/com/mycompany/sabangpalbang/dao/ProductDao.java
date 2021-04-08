package com.mycompany.sabangpalbang.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.sabangpalbang.dto.Product;
import com.mycompany.sabangpalbang.dto.Sabang;

@Mapper
public interface ProductDao {
	public int insertByProduct(Product product);
	public int selectByProduct(int product_id);
	public int updateByProduct(Product product);
	public String deleteByProduct(int product_id);
	public List<Product> selectAll(int sabang_id);
	public Product selectCartByProductId(int product_id);
	public int updateBuyCount(int product_id);
	
}
