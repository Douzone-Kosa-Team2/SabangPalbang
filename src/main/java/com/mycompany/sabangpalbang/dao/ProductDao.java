package com.mycompany.sabangpalbang.dao;

import org.apache.ibatis.annotations.Mapper;
import com.mycompany.sabangpalbang.dto.Product;

@Mapper
public interface ProductDao {
	public int insertByProduct(Product product);
	public int selectByProduct(int product_id);
	public int updateByProduct(Product product);
	public String deleteByProduct(int product_id);
}
