package com.ccjt.ejy.web.controller;


import com.ccjt.ejy.web.commons.Global;
import com.ccjt.ejy.web.service.ImageUtils;
import com.ccjt.ejy.web.vo.ImageInfo;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGEncodeParam;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.nio.file.FileSystems;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.List;
import java.util.regex.Pattern;

@Controller
public class QRCodeController {
	private  List<Map<String,Object>> list=new ArrayList<Map<String, Object>>();
	private  final int picWidth=1063;//图片宽度
	private ImageUtils imageUtils=new ImageUtils();
	/**
	 * 生成二维码并下载
	 * @param request
	 * @param response
	 * @param content
	 * @param title
	 * @param infoid
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/DownloadQRCode",method = RequestMethod.POST)
	public Object DownloadQRCode(HttpServletRequest request, HttpServletResponse response,String content, String title, String infoid) {
		//背景图片路径
		String backGroundPicPath =request.getServletContext().getRealPath("/image/1.jpg");
		//二维码路径
		String QRCodePath="";

		String DownloadQRCodePath= Global.gonggao_file_dir  + File.separator+infoid;//生成的下载文件路径
		String DownloadQRCodeName= infoid+".jpg";//生成的下载文件名称
		String fileURI=DownloadQRCodePath+File.separator+DownloadQRCodeName;

		File DownloadFile=new File(fileURI);
		if (!DownloadFile.exists()) {//如果该文件不存在,就去生成
			try {
				QRCodePath=CreatEncode(content,infoid);
			} catch (WriterException | IOException e) {
				e.printStackTrace();
			}

			File filepath=new File(DownloadQRCodePath);
			if (!filepath.exists()){//生成上级文件夹
				filepath.mkdir();
			}
			// 增加图片水印
//			mark(backGroundPicPath, QRCodePath, fileURI, 110, 110, 115, 265);
//
//			//增加文字水印
//			Font font = new Font("微软雅黑", Font.PLAIN, 19);
//
//			changeline(font,picWidth,title);
//
//			int y = 85;//文字渲染初始高度
//			int x;
//			for (Map map:list) {
//				y+=30;
//				x= (int) map.get("start");
//				title= (String) map.get("text");
//				mark(fileURI, fileURI, title, font, Color.black, x, y);
//			}
//			list.clear();

			/*渲染图片start*/
			try{
				List<ImageInfo> imageInfoList = new ArrayList<>();

				ImageInfo ii = new ImageInfo();
				ii.setPath(QRCodePath);
				ii.setX(370);
				ii.setY(820);


				Font font = new Font("微软雅黑", Font.PLAIN, 55);

				changeline(font,picWidth,title);

				int y = 200;//文字渲染初始高度
				int x;
				int count=0;
				if (list.size()==1){
					y+=90;
				}
				if (list.size()==2){
					y+=50;
				}
				for (Map map : list) {
					count++;

					y += 100;
					x = (int) map.get("start");
					title = (String) map.get("text");
					if (count == 3 && title.length() >= 11) {
						title = title.substring(0, 10) + "...";
					}
					ImageInfo ii_t = new ImageInfo();
					ii_t.setFont(font);
					ii_t.setColor(Color.black);

					ii_t.setText(title);

					ii_t.setX(x);
					ii_t.setY(y);
					imageInfoList.add(ii_t);
					if (count == 3) {
						break;
					}
				}
				list.clear();



				imageInfoList.add(ii);


//				new ImageUtils().imageCopy("D:/1.jpg", "D:/3.jpg", list);
				new ImageUtils().imageCopy(backGroundPicPath, fileURI, imageInfoList);


			}catch (Exception e) {
				e.printStackTrace();
			}
			/*渲染图片end*/
		}
		if (DownloadFile.exists()) {
			BufferedInputStream bis = null;
			BufferedOutputStream bos = null;
			try{
				//获取输入流
				bis = new BufferedInputStream(new FileInputStream(DownloadFile));
				//获取输出流
				response.setCharacterEncoding("UTF-8");
				response.setContentType("application/octet-stream");
				response.setHeader("Content-disposition", "attachment; filename="+ new String((infoid+".jpg").getBytes("utf-8"), "ISO8859-1"));
				bos = new BufferedOutputStream(response.getOutputStream());

				//定义缓冲池大小，开始读写
				byte[] buff = new byte[2048];
				int bytesRead;
				while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
					bos.write(buff, 0, bytesRead);
				}

				//刷新缓冲，写出
				bos.flush();

			}catch(Exception e){
				System.out.println("文件下载失败"+e.getMessage());
			}finally{
				//关闭流
				if(bis != null){
					try {
						bis.close();
					} catch (IOException e) {
						System.out.println("关闭输入流失败,"+e.getMessage());
						e.printStackTrace();
					}
				}
				if(bis != null){
					try {
						bos.close();
					} catch (IOException e) {
						System.out.println("关闭输出流失败,"+e.getMessage());
						e.printStackTrace();
					}
				}
			}

		}

        return null;

	}

	/**
	 * 水印文字居中
	 * @param font
	 * @param imgWidth
	 * @param text
	 * @return
	 */
	public  int fontOnCenter(Font font,int imgWidth,String text){
		int start=0;
		int size= font.getSize()*text.length();
		if (size<imgWidth){
			start=(imgWidth-size)/2;
		}
		return start;

	}

	/**
	 * 文字换行
	 * @param font
	 * @param imgWidth
	 * @param text
	 */
	public  void changeline(Font font, int imgWidth, String text){
		int len = (imgWidth-200)/font.getSize();//图片最大容字数
		int size = text.length();//内容字数
//		char[] chars=text.toCharArray();

		if (size > len){
			Map<String, Object> map = new HashMap();
			map.put("start", fontOnCenter(font, imgWidth, text.substring(0,len)));
			map.put("text", text.substring(0,len));
			list.add(map);
			changeline(font,imgWidth,text.substring(len));
		}else {
			Map<String, Object> map = new HashMap();
			map.put("start", fontOnCenter(font, imgWidth, text));
			map.put("text", text);
			list.add(map);
		}
	}

	/**
	 * 判断是否为整数
	 * @param str 传入的字符串
 	 * @return 是整数返回true,否则返回false
	*/

	public  boolean isInteger(String str) {
		Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");
		return pattern.matcher(str).matches();
	}

//	public  List<String> getString(String str){
//		List<String> list = new ArrayList();
//		int i = 0;
//		for (i = 0; i < str.length() - 1; i ++) {
//			list.add(str.substring(i, i + 1));
//		}
//		list.add(str.substring(i));
//	}
	/**
	 * 生成二维码
	 * @param content
	 * @param infoid
	 * @return
	 * @throws WriterException
	 * @throws IOException
	 */
	public String CreatEncode(String content,String infoid) throws WriterException, IOException {

		String QRCodePath = Global.gonggao_file_dir  + File.separator+"QRCode";
		File qrpath=new File(QRCodePath);
		if (!qrpath.exists()){
			qrpath.mkdir();
		}

		String fileName = infoid+".jpg";
		File file = new File(QRCodePath + File.separator +fileName);
		if (!file.exists()) {//如果图片存在就不再重复生成
			file.createNewFile();
			int width = 420; // 图像宽度
			int height = 420; // 图像高度
			String format = "jpg";// 图像类型
			Map<EncodeHintType, Object> hints = new HashMap<EncodeHintType, Object>();
			hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");
			BitMatrix bitMatrix = new MultiFormatWriter().encode(content,
					BarcodeFormat.QR_CODE, width, height, hints);// 生成矩阵
			Path path = FileSystems.getDefault().getPath(QRCodePath+File.separator, fileName);
			
			bitMatrix = deleteWhite(bitMatrix);
			
			MatrixToImageWriter.writeToPath(bitMatrix, format, path);// 输出图像
		}
		return QRCodePath+File.separator+fileName;
	}
	
	
    private static BitMatrix deleteWhite(BitMatrix matrix) {
        int[] rec = matrix.getEnclosingRectangle();
        int resWidth = rec[2] + 0;
        int resHeight = rec[3] + 0;

        BitMatrix resMatrix = new BitMatrix(resWidth, resHeight);
        resMatrix.clear();
        for (int i = 0; i < resWidth; i++) {
            for (int j = 0; j < resHeight; j++) {
                if (matrix.get(i + rec[0], j + rec[1]))
                    resMatrix.set(i, j);
            }
        }
        return resMatrix;
    }

	// 加文字水印
	public void mark(BufferedImage bufImg, Image img, String text, Font font, Color color, int x, int y) {
		Graphics2D g = bufImg.createGraphics();
		
		g.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP,1));
        RenderingHints renderingHints=new RenderingHints(RenderingHints.KEY_ANTIALIASING,RenderingHints.VALUE_ANTIALIAS_ON);
        //使用高质量压缩
        renderingHints.put(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
		g.setRenderingHints(renderingHints);
        
		g.drawImage(img, 0, 0, bufImg.getWidth(), bufImg.getHeight(), null);
		
		g.setColor(color);
		g.setFont(font);
		g.drawString(text, x, y);
		g.dispose();
	}

	// 加图片水印
	public void mark(BufferedImage bufImg, Image img, Image markImg, int width, int height, int x, int y) {
		Graphics2D g = bufImg.createGraphics();
		
		g.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP,1));
        RenderingHints renderingHints=new RenderingHints(RenderingHints.KEY_ANTIALIASING,RenderingHints.VALUE_ANTIALIAS_ON);
        //使用高质量压缩
        renderingHints.put(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
        g.setRenderingHints(renderingHints);
        
		g.drawImage(img, 0, 0, bufImg.getWidth(), bufImg.getHeight(), null);
		g.drawImage(markImg, x, y, width, height, null);
		g.dispose();
	}

	/**
	 * 给图片增加文字水印
	 *
	 * @param imgPath
	 *            -要添加水印的图片路径
	 * @param outImgPath
	 *            -输出路径
	 * @param text-文字
	 * @param font
	 *            -字体
	 * @param color
	 *            -颜色
	 * @param x
	 *            -文字位于当前图片的横坐标
	 * @param y
	 *            -文字位于当前图片的竖坐标
	 */
	public void mark(String imgPath, String outImgPath, String text, Font font, Color color, int x, int y) {
		FileOutputStream outImgStream = null;
		try {
			// 读取原图片信息
			File imgFile = null;
			Image img = null;
			if (imgPath != null) {
				imgFile = new File(imgPath);
			}
			if (imgFile != null && imgFile.exists() && imgFile.isFile() && imgFile.canRead()) {
				img = ImageIO.read(imgFile);
			}
			int imgWidth = img.getWidth(null);
			int imgHeight = img.getHeight(null);
			// 加水印
			BufferedImage bufImg = new BufferedImage(imgWidth, imgHeight, BufferedImage.TYPE_USHORT_555_RGB);
			mark(bufImg, img, text, font, color, x, y);
			// 输出图片
//			JPEGEncodeParam jep =   JPEGCodec.getDefaultJPEGEncodeParam(bufImg);
//			jep.setQuality(1, true);
			outImgStream = new FileOutputStream(outImgPath);
//			JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(outImgStream);
//            encoder.encode(bufImg);
			
			
			
            ImageIO.write(bufImg, "jpg", outImgStream);// 输出到文件流
			
            
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			if(outImgStream!=null){
				try {
					outImgStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	/**
	 * 给图片增加图片水印
	 *
	 * @param inputImg
	 *            -源图片，要添加水印的图片
	 * @param markImg
	 *            - 水印图片
	 * @param outputImg
	 *            -输出图片(可以是源图片)
	 * @param width
	 *            - 水印图片宽度
	 * @param height
	 *            -水印图片高度
	 * @param x
	 *            -横坐标，相对于源图片
	 * @param y
	 *            -纵坐标，同上
	 */
	public void mark(String inputImg, String markImg, String outputImg, int width, int height, int x, int y) {
		// 读取原图片信息
		File inputImgFile = null;
		File markImgFile = null;
		Image img = null;
		Image mark = null;
		FileOutputStream outImgStream = null;
		try {
			if (inputImg != null && markImg != null) {
				inputImgFile = new File(inputImg);
				markImgFile = new File(markImg);
			}
			if (inputImgFile != null && inputImgFile.exists() && inputImgFile.isFile() && inputImgFile.canRead()) {

				img = ImageIO.read(inputImgFile);

			}
			if (markImgFile != null && markImgFile.exists() && markImgFile.isFile() && markImgFile.canRead()) {

				mark = ImageIO.read(markImgFile);

			}
			int imgWidth = img.getWidth(null);
			int imgHeight = img.getHeight(null);
			BufferedImage bufImg = new BufferedImage(imgWidth, imgHeight, BufferedImage.TYPE_USHORT_555_RGB);
			mark(bufImg, img, mark, width, height, x, y);
			
			JPEGEncodeParam jep =   JPEGCodec.getDefaultJPEGEncodeParam(bufImg);
			jep.setQuality(1, true);
			
			outImgStream = new FileOutputStream(outputImg);
			
			JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(outImgStream);
            encoder.encode(bufImg);
			
//			ImageIO.write(bufImg, "jpg", outImgStream);
//			outImgStream.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			if(outImgStream!=null)
				try {
					outImgStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
		}
	}
}
