package com.mycompany.sabangpalbang.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.sabangpalbang.dto.Palbang_like;

@Mapper
public interface PalbangLikeDao {
	
	public int insert();
	public List<Palbang_like> selectAll();
	public int deleteByPalbangLikeId(int palbang_likeid);
}
