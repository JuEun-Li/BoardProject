package com.edulab.test2.sample.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edulab.test2.sample.dao.SampleDao;

@Service("sampleService")
public class SampleServiceImple implements SampleService {
	@Autowired
	protected SampleDao sampleDao;

	@Override
	public String selectSampleData() throws Exception {
		return sampleDao.selectSampleData();
	}

}