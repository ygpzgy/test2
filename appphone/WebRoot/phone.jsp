<%@ page language="java" import="java.util.*,com.QRCode.demo.*" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk">
		<title>WebAPP</title>
		<META NAME="Keywords" CONTENT="">
		<META NAME="Description" CONTENT="">
		<!--JS/CSS--->
		<!---CSS:层叠样式表，外衣--->
		<style type = "text/css">
		*{margin:0;padding:0;}
		body{background:url("images/bj.jpg");background-size:cover;font-size:12px;font-family:"微软雅黑";color:#666;}
		/*以“.”开头的css的类样式*/
		/*--start phone---*/
			.p_qrcode{margin:0px 0px 0px 0px;}
		 .phone{width:322px;height:641px;margin:50px auto;position:relative;float:left;}
		.phone .p_top{height:48px;background:url("images/phonetop.svg")}
		.phone .p_info{height:20px;background:url("images/phonetime.svg")}
		.phone .p_title{height:40px;background:#000;text-align:center;line-height:40px;font-size:20px;border-left:1px solid #FFF;border-right:1px solid #fff;color:#fff;}
		.phone .p_con{height:486px;background:url("images/bj2.jpg");background-size:cover;border-left:1px solid #FFF;border-right:1px solid #fff;}
		.phone .p_foot{height:45px;background:url("images/phonefoot.svg")}
		 .phone .p_btn{width:60px;height:60px;position:absolute;display:block;top:140px;right:25px;background:url("images/normalmusic.svg");background-size:cover;}
		 .p_qrcode{margin:200px 0px 0px 50px;float:left;}
		.clear{clear:both}
		/*end phone*/
		@media screen and (max-width:350px){
		.phone{margin:0;}
			.phone{width:100%;margin:0;}
			.phone .p_top,.phone .p_info,.phone .p_foot{display:none;}
			.phone .p_con{height:100%;}
		}
		/*自定义图像旋转关键帧*/
		@-webkit-keyframes bolo{
				from{
				-webkit-transform:rotate(0deg);
				}to{
				-webkit-transform:rotate(360deg);
				}
			}
			/*调用关键帧*/
			.rotate{
				-webkit-animation:bolo 1.5s linear infinite;
			}

		</style>
	</head>
	<body>
		<!----div:层，盒子，容器>
		<!---以class=“自定义”的类样式---->
		<!---phone start--->
			
			<div class="phone">
				<div class="p_top"></div>
				<div class="p_info"></div>
				<div class="p_title">一路上有你</div>
				<div class="p_con"></div>
				<div class="p_foot"></div>
				<a href="#" class="p_btn"></a>
				
			</div>
			<div class="p_qrcode">
			<!----img标签4要素：src，alt，width，height--->
			<%
				request.setCharacterEncoding("gbk");
				//String content = "http://localhost:8080/appphone/phone.jsp";
				String content = "http://localhost/appphone/phone.jsp";
				String imgPath = request.getRealPath("/"+"images/2.png");
				//String imgPath = request.getRealPath("/")+"/2.png";
				QRCodeUtil.QrcodeImg(content,imgPath);
				out.print("<img src='images/2.png' alt='二维码' width='140' height='140'/>");
			 %>
			</div>
			

			
			<div class="clear"></div>
		
		<!---end phone---->
		<!---引入jquery包--->
		<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
		<script type="text/javascript">
		$(function(){
		//创建一个MP3播放器
			var audioDom = document.createElement("audio");
			//创建MP3播放地址
				audioDom.src="mp3/1.mp3";
			//创建自动播放
				//audioDom.autoplay="autoplay";
				$(".p_btn").click(function(){
					//alert(1);
					if(audioDom.paused){
						audioDom.play();
					}else{
						audioDom.pause();
					}
					$(this).toggleClass("rotate");
				});
		
		});
		</script>
	</body>
</html>