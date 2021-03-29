package com.mycompany.sabangpalbang.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.sabangpalbang.dto.Pager;
import com.mycompany.sabangpalbang.dto.Sabang;

@Mapper
public interface SabangDao {
	public int insertBySabang(Sabang sabang);
	public int selectBySabang(int sabang_id);
	public int updateBySabang(Sabang sabang);
	public String deleteBySabang(int sabang_id);
	public List<Sabang> selectByPage(Pager pager);
	public int count();
}
