package com.mycompany.sabangpalbang.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.sabangpalbang.dto.Palbang;

@Mapper
public interface PalbangDao {
	
	public int insert(Palbang palbang);
	public List<Palbang> selectAll();
	public int update(Palbang palbang);
	public int deleteByPalbangId(int palbangid);
}
