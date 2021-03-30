package com.mycompany.sabangpalbang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.sabangpalbang.dao.PalbangDao;
import com.mycompany.sabangpalbang.dto.Pager;
import com.mycompany.sabangpalbang.dto.Palbang;

@Service
public class PalbangService {
	@Autowired
	private PalbangDao palbangDao;
	
	public List<Palbang> getPalbangList_Like(Pager pager) { // default
		List<Palbang> list = palbangDao.selectByLike(pager);
		return list;
	}
	
	public List<Palbang> getPalbangList_View(Pager pager) { 
		List<Palbang> list = palbangDao.selectByView(pager);
		return list;
	}
	
	public List<Palbang> getPalbangList_New(Pager pager) { 
		List<Palbang> list = palbangDao.selectByNew(pager);
		return list;
	}
	
	public List<Palbang> getPalbangList_Old(Pager pager) { 
		List<Palbang> list = palbangDao.selectByOld(pager);
		return list;
	}
	
	public int getTotalRows() {
		int rows = palbangDao.count2();
		return rows;
	}
	
}
