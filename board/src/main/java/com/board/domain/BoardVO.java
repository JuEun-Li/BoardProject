package com.board.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class BoardVO {
	private int bno;
	private int rowno;
	public int getRowno() {
		return rowno;
	}
	public void setRowno(int rowno) {
		this.rowno = rowno;
	}
	private String title;
	private String content;
	private String writer;
	private Date regDate;
	private int viewCnt;

	private String fileName;
	private MultipartFile uploadFile;

	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	/*
	 * // 파일 업로드
	 *
	 * @Override public String toString() { return "BoardVO [=bno" + bno +
	 * ", title=" + title + ", writer=" + writer + ", content=" + content +
	 * ", regDate=" + regDate + ", viewCnt=" + viewCnt + ", file_name=" + fileName +
	 * "]"; }
	 */
}
