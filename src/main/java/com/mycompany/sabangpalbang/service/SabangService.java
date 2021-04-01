package com.mycompany.sabangpalbang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.sabangpalbang.dao.ProductDao;
import com.mycompany.sabangpalbang.dao.SabangDao;
import com.mycompany.sabangpalbang.dto.Pager;
import com.mycompany.sabangpalbang.dto.Product;
import com.mycompany.sabangpalbang.dto.Sabang;

@Service
public class SabangService {
	@Autowired
	private SabangDao sabangDao;
	
	@Autowired
	private ProductDao productDao;
	
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

	public List<Product> getSabangDetail(int sid) {
		List<Product> productlist = productDao.selectAll(sid);
		return productlist;
	}

	public Sabang getSabang(int sid) {
		Sabang sabang = sabangDao.selectById(sid);
		return sabang;
		
	}

	public void addViewCount(int sabang_id) {
		sabangDao.updateViewCount(sabang_id);
		
	}

	public List<Sabang> showSabang() {
		List<Sabang> slist = sabangDao.selectTop3();
		return slist;
	}

	public List<Sabang> getRecommendList(int sabang_saleprice) {
		List<Sabang> rslist = sabangDao.selectByPrice(sabang_saleprice);
		
		return rslist;
	}

}
