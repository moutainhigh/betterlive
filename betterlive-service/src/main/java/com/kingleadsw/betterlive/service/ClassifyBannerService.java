package com.kingleadsw.betterlive.service;

import java.util.List;

import com.kingleadsw.betterlive.core.page.PageData;
import com.kingleadsw.betterlive.core.service.BaseService;
import com.kingleadsw.betterlive.model.ClassifyBanner;



public interface ClassifyBannerService extends BaseService<ClassifyBanner>{

	
	List<ClassifyBanner> queryclassifybannerListPage(PageData pd);
	
	int addclassifybanner(ClassifyBanner record);
}
