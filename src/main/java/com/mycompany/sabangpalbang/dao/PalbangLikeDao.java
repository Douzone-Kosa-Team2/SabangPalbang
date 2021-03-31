package com.mycompany.sabangpalbang.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.sabangpalbang.dto.Palbang_like;

@Mapper
public interface PalbangLikeDao {
	
	public int insert();
	public List<Palbang_like> selectAll();
	public int deleteByPalbangLikeId(int palbang_likeid);
	public int insertLike(@Param("palbang_likepalbangid") int palbang_likepalbangid, @Param("palbang_likememberid") int palbang_likememberid);
	public int deleteLike(@Param("palbang_likepalbangid")int palbang_likepalbangid, @Param("palbang_likememberid")int palbang_likememberid);
}
