package com.ccjt.ejy.web.vo;

import java.io.File;

public class DBPics {

	private String dbname;
	private String filename;
	/**
	 * 	JY01	标的图片	jpg;jpeg;gif;Bmp;png;
		JY03	视频	flv;MP4;wmv;
		JY04	360度全景展示图片	jpg;jpeg;gif;Bmp;png;
		JY02	视频标题图片	jpg;jpeg;gif;Bmp;png;
		JY05	音频	MP3;
	 */
	private String type;
	private String infoid;
	private String fileid;
	private String relativePath;
	private File file;

	public String getRelativePath() {
		return relativePath;
	}

	public void setRelativePath(String relativePath) {
		this.relativePath = relativePath;
	}

	public String getDbname() {
		return dbname;
	}
	public void setDbname(String dbname) {
		this.dbname = dbname;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getFileid() {
		return fileid;
	}
	public void setFileid(String fileid) {
		this.fileid = fileid;
	}
	public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}

	public String getInfoid() {
		return infoid;
	}

	public void setInfoid(String infoid) {
		this.infoid = infoid;
	}

	@Override
	public String toString() {
		return "DBPics [dbname=" + dbname + ", filename=" + filename
				+ ", type=" + type + ", infoid=" + infoid + ", fileid="
				+ fileid + ", relativePath=" + relativePath + ", file=" + file
				+ "]";
	}
	
	
}
