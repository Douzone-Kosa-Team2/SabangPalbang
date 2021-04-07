package com.mycompany.sabangpalbang.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.sabangpalbang.dto.Palbang_detail;

@Mapper
public interface PalbangDetailDao {
	
	public int insert(Palbang_detail palbang_detail);
	public int deleteByPalbangDetailno(int palbangDetailid);
	public List<Palbang_detail> selectAll(int pid);
	public int insertPalbangDetail(Palbang_detail palbang_detail);
	public int updatePalbangDetail(Palbang_detail palbang_detail);
}
