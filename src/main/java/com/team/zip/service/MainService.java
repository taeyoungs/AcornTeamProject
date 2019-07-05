package com.team.zip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.zip.model.dao.MainCommunityDAO;
import com.team.zip.model.vo.MainCommunityVO;

@Service
public class MainService {
	
	@Autowired
	private MainCommunityDAO mainCommunityDAO;
	
	public List<MainCommunityVO> selectPhotoList() {
		return mainCommunityDAO.selectPhotoList();
	}

}
