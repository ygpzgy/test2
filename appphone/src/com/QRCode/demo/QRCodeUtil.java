package com.QRCode.demo;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;

import javax.imageio.ImageIO; 

import com.swetake.util.Qrcode; 

/** 
* ���� ��ά��ɨһɨ�ƶ�WEBAPP
*/ 

public class QRCodeUtil { 

/** 
* ���ɶ�ά���ͼƬ
* @param content ���ɶ�ά�������
* @param imgPath ��Ҫ�����ά���ͼƬ·��
* @throws void �޷���ֵ
*/ 

	public static void QrcodeImg(String content,String imgPath){
		int width =140,height=140;
		//ʵ����Qrcode
		Qrcode qrcode = new Qrcode();
		//���ö�ά���Ŵ���L(7%)M(15%)Q(25%)H(30%)
		qrcode.setQrcodeErrorCorrect('M');
		qrcode.setQrcodeEncodeMode('B');
		//���ö�ά��ߴ�ȡֵ��Χ��1-40��
		qrcode.setQrcodeVersion(7);
		//����ͼƬ�ߴ�
		BufferedImage bufImg = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
		//���ƶ�ά��ͼƬ
		Graphics2D gs = bufImg.createGraphics();
		//���ö�ά�뱳����ɫ
		gs.setBackground(Color.WHITE);
		//����һ����������
		gs.clearRect(0, 0, width, height);
		//���ö�ά��ͼƬ��ɫֵΪ��ɫ
		gs.setColor(Color.BLACK);
		//��ȡ���ݵ��ֽ����飬���ñ��뼯
		try {
			byte[] contentBytes =  content.getBytes("gbk");
			//�����ά��
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
			
			//���ɶ�ά���ͼƬ
			File imgFile =  new File(imgPath);
			try {
				ImageIO.write(bufImg, "png", imgFile);
				System.out.println("��ά��ɹ�");
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