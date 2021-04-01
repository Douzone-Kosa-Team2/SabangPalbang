package com.mycompany.sabangpalbang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.sabangpalbang.dao.PalbangDao;
import com.mycompany.sabangpalbang.dao.PalbangDetailDao;
import com.mycompany.sabangpalbang.dao.PalbangLikeDao;
import com.mycompany.sabangpalbang.dto.Pager;
import com.mycompany.sabangpalbang.dto.Palbang;
import com.mycompany.sabangpalbang.dto.Palbang_detail;
import com.mycompany.sabangpalbang.dto.Sabang;

@Service
public class PalbangService {
	@Autowired
	private PalbangDao palbangDao;
	
	@Autowired
	private PalbangDetailDao palbangDetailDao;
	
	@Autowired
	private PalbangLikeDao palbangLikeDao;
	
	
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

	public Palbang getPalbang(int pid) {
		Palbang palbang = palbangDao.selectById(pid);
		return palbang;
	}

	public List<Palbang_detail> getPalbangDetail(int pid) {
		List<Palbang_detail> palbangdetail = palbangDetailDao.selectAll(pid);
		return palbangdetail;
	}

	public void insertLike(int palbang_id,int member_id) {
		palbangLikeDao.insertLike(palbang_id, member_id);
	}

	public void addViewCount(int palbang_id) {
		palbangDao.updateViewCount(palbang_id);
		
	}

	public List<Palbang> showPalbang() {
			List<Palbang> plist = palbangDao.selectTop3();
			return plist;
		
	}

	public void deleteLike(int palbang_likepalbangid, int palbang_likememberid) {
		palbangLikeDao.deleteLike(palbang_likepalbangid, palbang_likememberid);
		
	}

	public int isLikeByUser(int pid, int member_id) {
		int likeResult = palbangLikeDao.selectCountLike(pid, member_id);
		return likeResult;
	}
	
	public void updateLikeCountUp(int palbang_id) {
		palbangDao.updateLikeCountUp(palbang_id);
	}
	
	public void updateLikeCountDown(int palbang_id) {
		palbangDao.updateLikeCountDown(palbang_id);
	}
}
