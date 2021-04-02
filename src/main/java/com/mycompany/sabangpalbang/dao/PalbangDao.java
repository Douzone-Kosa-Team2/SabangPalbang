package com.mycompany.sabangpalbang.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.sabangpalbang.dto.Pager;
import com.mycompany.sabangpalbang.dto.Palbang;
import com.mycompany.sabangpalbang.dto.Palbang_detail;


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
	public int updateLikeCountUp(int palbang_id);
	public int updateLikeCountDown(int palbang_id);
	/* palbang create - 두개의 테이블에 삽입 */
	public int insertPalbang(Palbang palbang);
	public int insertPalbangDetail(Palbang_detail palbang_detail);
}
