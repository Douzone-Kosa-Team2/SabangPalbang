package com.mycompany.sabangpalbang.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.sabangpalbang.dto.Pager;
import com.mycompany.sabangpalbang.dto.Palbang;


@Mapper
public interface PalbangDao {
	
	public int insert(Palbang palbang);
	public List<Palbang> selectAll();
	public int update(Palbang palbang);
	public int deleteByPalbangId(int palbangid);
	public int count2();
	public List<Palbang> selectByLike(Pager pager);
	public List<Palbang> selectByView(Pager pager);
	public List<Palbang> selectByNew(Pager pager);
	public List<Palbang> selectByOld(Pager pager);
	public Palbang selectById(int pid);
	public int updateViewCount(int palbang_id);
	public List<Palbang> selectTop3();
	
}
