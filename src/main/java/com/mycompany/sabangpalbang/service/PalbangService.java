package com.mycompany.sabangpalbang.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mycompany.sabangpalbang.dao.PalbangDao;
import com.mycompany.sabangpalbang.dao.PalbangDetailDao;
import com.mycompany.sabangpalbang.dao.PalbangLikeDao;
import com.mycompany.sabangpalbang.dto.Pager;
import com.mycompany.sabangpalbang.dto.Palbang;
import com.mycompany.sabangpalbang.dto.Palbang_detail;

@Service
public class PalbangService {
	private static final Logger logger = LoggerFactory.getLogger(PalbangService.class);

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

	/* 팔방 create */
	public void savePalbang(Palbang palbang) {
		palbangDao.insertPalbang(palbang);
		for(int i=0; i<palbang.getReviews().size(); i++) { 
			palbang.getReviews().get(i).setPalbang_id(palbang.getPalbang_id());
			palbangDetailDao.insertPalbangDetail(palbang.getReviews().get(i));
		}
	}
	/* 팔방 delete */
	public void removePalbangById(int pid) {
		int row = palbangDao.deleteByPalbangId(pid);
		logger.info("row: " + row);
	}

	/* 팔방 update */
	public void updatePalbang(Palbang palbang) {
		palbangDao.updatePalbang(palbang);
		for(int i=0; i<palbang.getReviews().size(); i++) { 
			palbangDetailDao.updatePalbangDetail(palbang.getReviews().get(i));
		}
	}
}
