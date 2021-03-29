package com.mycompany.sabangpalbang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.sabangpalbang.dao.SabangDao;
import com.mycompany.sabangpalbang.dto.Pager;
import com.mycompany.sabangpalbang.dto.Sabang;

@Service
public class SabangService {
	@Autowired
	private SabangDao sabangDao;
	
	public List<Sabang> getSabangList(Pager pager) {
		
		List<Sabang> list = sabangDao.selectByPage(pager);
		
		return list;
		
	}
	
	public int getTotalRows() {
		int rows = sabangDao.count();
		return rows;
	}
}
