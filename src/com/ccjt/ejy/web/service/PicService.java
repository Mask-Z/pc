package com.ccjt.ejy.web.service;

import static com.ccjt.ejy.web.commons.JDBC.jdbc;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.ccjt.ejy.web.vo.MediaInfo;
import com.ccjt.ejy.web.vo.Pic;

public class PicService {

	/**
	 * 获取公告全景展示内容,包括视频、地图、标题图片
	 * 
	 * @param
	 */
	private MediaInfo mediaInfo(MediaInfo mi) {

		try {
			if (mi != null) {

				List<Pic> pics = new ArrayList<>();

				List<Pic> ps = jdbc
						.beanList(
								"select path,bpath,type from [web2.0].dbo.web_gonggao_pic where guid=?",
								Pic.class, mi.getInfoid());

				/**
				 * JY01 标的图片 jpg;jpeg;gif;Bmp;png; JY03 视频 flv;MP4;wmv; JY04
				 * 360度全景展示图片 jpg;jpeg;gif;Bmp;png; JY02 视频标题图片
				 * jpg;jpeg;gif;Bmp;png; JY05 音频 MP3;
				 */
				if (ps != null) {
					for (Pic fi : ps) {
						if(StringUtils.isNotBlank(fi.getBpath())){
							fi.setBpath(fi.getBpath().replace("\\", "/"));
						}
						if(StringUtils.isNotBlank(fi.getPath())){
							fi.setPath(fi.getPath().replace("\\", "/"));
						}
						if ("JY01".equals(fi.getType())) {// 标的图片
							
							pics.add(fi);
						}

						else if ("JY03".equals(fi.getType())) {// 视频
																// flv;MP4;wmv;
							mi.setVide(fi.getPath());
						}

						else if ("JY05".equals(fi.getType())) {// 音频 MP3;
							mi.setAudio(fi.getPath());
						}
					}
					
					mi.setPics(pics);
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mi;

	}

	/**
	 * 实物普通,股权,增资扩股 附件另存处理
	 * 
	 * @param infoid
	 */
	public MediaInfo default_mediaHandle(String infoid) {

		MediaInfo mi = null;
		try {
			String sql = "select WholeAddress d3 ,Coordinates mappoint,RowGuid infoid from CQJY_JiaoYiGongGao where RowGuid=?";

			mi = jdbc.bean(sql, MediaInfo.class, infoid);
			
			mi.setInfoid(infoid);
			mediaInfo(mi);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mi;
	}

	/**
	 * 实物批量 附件另存处理
	 * 
	 * @param infoid
	 */
	public MediaInfo pllr_mediaHandle(String infoid) {
		MediaInfo mi = null;
		try {
			String sql = "select WholeAddress d3 ,Coordinates mappoint,RowGuid infoid from CQJY_ProjectGG  where RowGuid=?";

			mi = jdbc.bean(sql, MediaInfo.class, infoid);
			mediaInfo(mi);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mi;
	}


}
