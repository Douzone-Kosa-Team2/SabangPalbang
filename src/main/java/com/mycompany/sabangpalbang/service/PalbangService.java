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
	
	public List<Palbang> getPalbangList(Pager pager) {
		
		List<Palbang> list = palbangDao.selectByPage2(pager);
		
		return list;
		
	}
	
	public int getTotalRows() {
		int rows = palbangDao.count2();
		return rows;
	}
	
}
