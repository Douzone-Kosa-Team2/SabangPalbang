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
	
	public List<Sabang> getSabangList_Buy(Pager pager) {
		List<Sabang> list = sabangDao.selectByBuy(pager);
		return list;	
	}
	
	public List<Sabang> getSabangList_Low(Pager pager) {
		List<Sabang> list = sabangDao.selectByLow(pager);
		return list;	
	}
	
	public List<Sabang> getSabangList_High(Pager pager) {
		List<Sabang> list = sabangDao.selectByHigh(pager);
		return list;	
	}
	
	public List<Sabang> getSabangList_View(Pager pager) {
		List<Sabang> list = sabangDao.selectByView(pager);
		return list;	
	}
	
	public int getTotalRows() {
		int rows = sabangDao.count();
		return rows;
	}
}
