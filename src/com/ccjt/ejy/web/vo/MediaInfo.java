package com.ccjt.ejy.web.vo;

import java.util.List;

/**
 * 全景展示
 * @author xxf
 *
 */
public class MediaInfo {

	private String infoid;
	
	/**
	 * 标题图片
	 */
	private List<Pic> pics;
	
	/**
	 * 坐标
	 */
	private String mappoint;
	
	/**
	 * 地图标题图片
	 */
	private String map_pic;
	
	/**
	 * 视频
	 */
	private String vide;
	
	/**
	 * 视频标题图片
	 */
	private String video_pic;
	
	
	/**
	 * 音频
	 */
	private String audio;
	
	/**
	 * 360度全景地址	
	 */
	private String d3;
	
	/**
	 * 360度全景标题图片
	 */
	private String d3_pic;

	public List<Pic> getPics() {
		return pics;
	}

	public void setPics(List<Pic> pics) {
		this.pics = pics;
	}


	public String getMappoint() {
		return mappoint;
	}

	public void setMappoint(String mappoint) {
		this.mappoint = mappoint;
	}

	public String getVide() {
		return vide;
	}

	public void setVide(String vide) {
		this.vide = vide;
	}

	public String getAudio() {
		return audio;
	}

	public void setAudio(String audio) {
		this.audio = audio;
	}

	public String getD3() {
		return d3;
	}

	public void setD3(String d3) {
		this.d3 = d3;
	}

	public String getMap_pic() {
		return map_pic;
	}

	public void setMap_pic(String map_pic) {
		this.map_pic = map_pic;
	}

	public String getVideo_pic() {
		return video_pic;
	}

	public void setVideo_pic(String video_pic) {
		this.video_pic = video_pic;
	}

	public String getD3_pic() {
		return d3_pic;
	}

	public void setD3_pic(String d3_pic) {
		this.d3_pic = d3_pic;
	}

	public String getInfoid() {
		return infoid;
	}

	public void setInfoid(String infoid) {
		this.infoid = infoid;
	}

	@Override
	public String toString() {
		return "MediaInfo [infoid=" + infoid + ", pics=" + pics + ", mappoint="
				+ mappoint + ", map_pic=" + map_pic + ", vide=" + vide
				+ ", video_pic=" + video_pic + ", audio=" + audio + ", d3="
				+ d3 + ", d3_pic=" + d3_pic + "]";
	}
	
	
	
	
}
