package com.edulab.test2.sample.controller;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.edulab.test2.sample.service.SampleService;

@Controller
public class SampleController {
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Resource(name="sampleService")
	private SampleService sampleService;

	@RequestMapping(value = "/sample", method = RequestMethod.GET)
	public String sampleControl() {
		logger.info("sample 기동 완료");
		try {
			logger.info(sampleService.selectSampleData());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "sample";
	}
}