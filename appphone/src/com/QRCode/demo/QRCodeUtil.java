package com.QRCode.demo;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;

import javax.imageio.ImageIO; 

import com.swetake.util.Qrcode; 

/** 
* 生成 二维码扫一扫移动WEBAPP
*/ 

public class QRCodeUtil { 

/** 
* 生成二维码的图片
* @param content 生成二维码的内容
* @param imgPath 需要保存二维码的图片路径
* @throws void 无返回值
*/ 

	public static void QrcodeImg(String content,String imgPath){
		int width =140,height=140;
		//实例化Qrcode
		Qrcode qrcode = new Qrcode();
		//设置二维码排错率L(7%)M(15%)Q(25%)H(30%)
		qrcode.setQrcodeErrorCorrect('M');
		qrcode.setQrcodeEncodeMode('B');
		//设置二维码尺寸取值范围（1-40）
		qrcode.setQrcodeVersion(7);
		//设置图片尺寸
		BufferedImage bufImg = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
		//绘制二维码图片
		Graphics2D gs = bufImg.createGraphics();
		//设置二维码背景颜色
		gs.setBackground(Color.WHITE);
		//创建一个矩形区域
		gs.clearRect(0, 0, width, height);
		//设置二维码图片颜色值为黑色
		gs.setColor(Color.BLACK);
		//获取内容的字节数组，设置编码集
		try {
			byte[] contentBytes =  content.getBytes("gbk");
			//输出二维码
			if (contentBytes.length > 0 && contentBytes.length < 120) { 
				boolean[][] codeOut = qrcode.calQrcode(contentBytes); 
				for (int i = 0; i < codeOut.length; i++) { 
					for (int j = 0; j < codeOut.length; j++) { 
						if (codeOut[j][i]) { 
							gs.fillRect(j * 3 + 2, i * 3 + 2, 3, 3); 
						} 
					} 
				} 
			} 
			Image img;
			try {
				img = ImageIO.read(new File("D:\\3.png"));
				gs.drawImage(img, 44, 45,49,30, null);
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			//生成二维码的图片
			File imgFile =  new File(imgPath);
			try {
				ImageIO.write(bufImg, "png", imgFile);
				System.out.println("二维码成功");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void main(String[] args)  { 
	
		String content = "http://p3.so.qhimg.com/t01bab850fb89a8716d.jpg";
		String imgPath = "F:\\21.png";
		QrcodeImg(content,imgPath);
	} 
} 