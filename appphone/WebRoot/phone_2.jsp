<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
				.phone{width:800px;
			margin:上 右 下 左;
			margin:垂直 水平;
			margin:全部;
			margin:50px auto;
			}
		.phone .p_box{width:320px;height:641px;position:relative;float:left;}
		.phone .p_box .p_top{width:322px;height:48px;background:url("images/phonetop2.png")}
		.phone .p_box .p_info{width:322px;height:20px;background:url("images/phonetime2.png")}
		.phone .p_box .p_title{width:320px;height:40px;background:#000;text-align:center;line-height:40px;font-size:20px;border-left:1px solid #FFF;border-right:1px solid #fff;}
		.phone .p_box .p_con{width:320px;height:486px;background:url("images/bj2.jpg");background-size:cover;border-left:1px solid #FFF;border-right:1px solid #fff;}
		.phone .p_box .p_foot{width:322px;height:45px;background:url("images/phonefoot2.png")}
		.phone .p_box .p_btn{width:60px;height:60px;position:absolute;display:block;top:140px;right:25px;background:url("images/normalmusic2.png");background-size:cover;}
		.phone .p_qrcode{float:right;margin:200px 10px 0 0;}
		/*end phone*/

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
			<div class="p_box">
				<div class="p_top"></div>
				<div class="p_info"></div>
				<div class="p_title">一路上有你</div>
				<div class="p_con"></div>
				<div class="p_foot"></div>
				<a href="#" class="p_btn"></a>
			</div>
				
			<div class="p_qrcode">
			<!----img标签4要素：src，alt，width，height--->
				<img src="images/qrcode.png" alt="二维码" width=140px height=140px >
			</div>
		</div>
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
				
					if(audioDom.paused()){
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