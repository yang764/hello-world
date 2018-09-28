<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta  http-equiv="Content-Type" content="text/html"  charset = "utf-8">
<title>欢迎注册</title>

<style type="text/css">
body {
	font-family: 微软雅黑;
	font-size: 12px;
}

body, table, tr, td {
	margin: 0;
	padding: 0;
}
/* ** header css start ** */
#header {
	/*background-color:pink;*/
	width: 1200px;
	height: 114px;
	margin: 41px auto 0;
}

#header #line1 {
	height: 72px;
}

#header #line1 .logo {
	margin-left: 50px;
	margin-right: 33px;
	vertical-align: middle;
}

#header #line1 .line {
	display: inline-block;
	width: 2px;
	height: 72px;
	background-color: #CBCBCB;
	margin-right: 23px;
	vertical-align: middle;
}

#header #line1 .wel_reg {
	margin-right: 16px;
	font-size: 65px;
	color: #676767;
	display: block;
	text-align: center;
}

#header #line2 {
	height: 42px;
}

#header #line2 span {
	float: right;
	font-size: 24px;
}

#header #line2 a span {
	color: #333333;
}

#header #line2>span {
	color: #999999;
}
/* ** header css end ** */

/* ** middle css start ** */
#middle {
	
	background: url("image/p_ico.jpg") 440px 304px no-repeat;
	width: 1200px;
	height: 545px;
	margin: 0px auto;
	border: 7px solid #F0F0F0;
	border-top-width: 9px;
	border-bottom-width: 9px;
	padding-top: 75px;
	padding-right: 0px; 
}

#middle form {
	/*background-color:#eee;*/
	background: url("image/p_ico.jpg") 315px 140px no-repeat;
	display: block;
	width: 950px;
	margin-left: auto;
	margin-right: auto;
}

#unique {
	color: rgb(206, 65, 226);
	margin-left: 325px;
	font-size: 22px;
}

#unique2 {
	color: red;
	margin-left: 100px;
	font-size: 22px;
	width: 1050px;
	display: none;
}

/*.v{
	size: 2px;
}*/
#form_tab tr td input {
	width: 381px;
	height: 50px;
	border: 1px solid #DBDBDB;
	font-size: 16px;
	color: #999999;
	text-indent: 45px;
}

#form_tab tr td input.username {
	background: url("image/u_ico.jpg") 15px 15px no-repeat;
	margin-left: 300px;
}

#form_tab tr td input.password {
	background: url("image/p_ico.jpg") 315px 140px no-repeat;
	margin-left: 300px;
}

#form_tab tr td #img1 {
	z-index: 1;
	position: absolute;
	left: 900px;
	top: 375px;
}

#form_tab tr td #img2 {
	z-index: 1;
	position: absolute;
	left: 900px;
	top: 465px;
}

#form_tab tr td input.phone {
	background: url("../image/phone_ico.jpg") 15px 15px no-repeat;
	margin-left: 300px;
}

#form_tab tr td.err_msg {
	height: 32px;
	text-indent: 45px;
	/* background:url("../image/alert_1.jpg") 17px 7px no-repeat; */
	color: #c3c3c3;
	margin-left: 300px;
	font-size: 12px;
}

#form_tab tr td.alter {
	color: #e64346;
	/* background:url("../image/alert_2.jpg") 17px 7px no-repeat; */
	margin-left: 300px;
	display: none;
}

#form_tab tr td .ck_email {
	font-size: 16px;
	margin-left: 300px;
}

#form_tab tr td .ck_email a {
	color: #005ea7;
	margin-left: 300px;
}

#form_tab tr td.protocol {
	font-size: 16px;
	margin-left: 300px;
	line-height: 52px;
	text-indent: 60px;
	height: 83px;
}

#form_tab tr td .protocol a {
	color: #005ea7;
	text-decoration: none;
	margin-left: 300px;
}

#form_tab tr td input[type='submit'] {
	font-size: 20px;
	color: #ffffff;
	background-color: #e64346;
	text-indent: 0px;
	margin-left: 300px;
}

#form_tab tr td #span {
	color: #ffffff;
	background-color: #e64346;
	margin-left: 300px;
}

#middle div {
	background-color: #eee;
	display: inline-block;
	float: right;
	margin-right: 59px;
	width: 211px;
	height: 211px;
}

/* ** middle css end ** */

/* ** footer css start ** */
#footer {
	/*background-color:pink;*/
	width: 1200px;
	margin: 0 auto;
	margin-top: 109px;
}

#footer p {
	text-align: center;
	line-height: 34px;
	font-size: 14px;
	color: #999999;
}
/* ** footer css end ** */
</style>

<script type="text/javascript">

		window.onload = function(){	
						
			var un = document.getElementById("password1");
			var ul = document.getElementById("password2");
			var uu = document.getElementsByName("username")[0];
			var button = document.getElementById("button");
			var re = /_[\u4e00-\u9fa5]{0,}\w*/;
			var re2 = /[^\u4e00-\u9fa5]+/;
			var ty = document.getElementsByClassName("err_msg alter")[0];
			var flag4 = false;
			var w = 2;
			
			button.disabled = false;

			button.onclick = function(){
				
				if( (uu.value == "用户名") || (un.value == "设置密码") || (ul.value == "确认密码") ){
				
					button.disabled = true;

				}else{

					if( (ul.value != un.value) && (0 == w) && re.exec(uu.value) ){					
						ty.style.display = "block";
						button.disabled = true;
					}

					else if( (un.value != "") && (ul.value != "") ){
						ty.style.display = "none"; 

						if( re.exec(uu.value) ){
							alert("注册成功！走，登录去。");						        
						}
					 }					
				}
				
			}

			uu.onclick = function(){

				button.disabled = false;

				if(uu.value == ""){
					uu.value = "用户名";
				}

				if(uu.value == "用户名"){
					uu.value = "";
				}

			}

			var flag3 = false;
			var ie = document.getElementById("unique");
			var ei = document.getElementById("unique2");

			uu.onblur = function(){
				w = 0;
				<c:forEach var="o" items="${USER}">
				
					var  c = "${o.userName}";
					if(uu.value == c){
						alert("用户名已存在！");
						flag4 = true;
						w++;
					}
		
				</c:forEach>
										
				if(uu.value == ""){
					uu.value = "用户名";
					flag3 = true;
				}
				
				if(uu.value == "用户名"){   /* flag3 false 输入的不是"用户名" */
					ie.style.display = "none";    /* 隐藏             请随意 */
					ei.style.display = "block";	  /* 显示             名字这东西*/		
				}				
								
				if( uu.value != "用户名" ){

					if( !re.exec(uu.value) || (0 != w) ){
						
						ie.style.display = "none";
						ei.style.display = "block";
						un.readOnly = true;
						ul.readOnly = true;
						button.disabled = true;					
						
					}else{
						
						ie.style.display = "block";
						ei.style.display = "none";						
						un.readOnly = false;
						ul.readOnly = false;
						
						if( (ul.value != "确认密码") && (ul.value != "") && (0 == w) && (un.value != "") && (un.value != "设置密码")){
							button.disabled = false;
						}
					}
				}
			}
			
			var flag1 = false; 
			var flag2 = false; 
			var fflag = true;

			un.onclick = function(){
				
				if(uu.value == "用户名"){
					un.readOnly = true;
					ul.readOnly = true;
				}
				
				if(un.value == "设置密码"){
					un.type = "password";
					un.value = "";					
				}
				
				if(fflag == true){
					un.type="password";
					fflag = false;
				}

				flag1 = true;

				if(un.value == ""){
					un.type="text";
					un.value = "设置密码";
				}

			}

			un.onfocus = function(){
				
				if((uu.value == "用户名")){
					un.readOnly = true;
					ul.readOnly = true;
				}
				
				if(fflag == true){
					un.type="password";
					fflag = false;
				}

				flag1 = true;

				if(un.value == ""){
					un.type="text";
					un.value = "设置密码";
				}

				if(un.value == "设置密码"){
					un.type = "password";
					un.value = "";					
				}
				
				if( (ul.value == un.value) ){					
					ty.style.display = "none";
				}
			}
			
			un.onblur = function(){
				
				if(ul.value == un.value){					
					ty.style.display = "none";
				}
				
				if(un.value == ""){
					un.value = "设置密码";
					un.type="text";					
				}	
				
				if( (ul.value != "确认密码") && (ul.value != "") && (0 == w) && (un.value != "") && (un.value != "设置密码")){
					button.disabled = false;
				}
			}
			
			var ffflag = true;

			ul.onclick = function(){
				
				if(ul.value == "确认密码"){
					ul.type = "password";
					ul.value = "";
				}
				
				flag2 = true;

			}

			ul.onfocus = function(){
				
				if(uu.value == "用户名"){
					un.readOnly = true;
					ul.readOnly = true;
				}
				
				if(ffflag == true){
					ffflag = false;
				}

				flag2 = true;

				if(ul.value == "确认密码"){	
					ul.value = "";
				} 
				
				if(ul.value == un.value){					
					ty.style.display = "none";
				}

			}
			
			ul.onblur = function(){				
				
				if( (ul.value == un.value) ){					
					ty.style.display = "none";
				}
				
				if(ul.value == ""){
					ul.value = "确认密码";
					ul.type="text";
				} 

				if(flag1 && flag2 && (uu.value!="用户名") && (ul.value!="确认密码") && (un.value!="设置密码")){

					if((ul.value != un.value) && (0 == w) && re.exec(uu.value)){
						ty.style.display = "block";
					}else{
						ty.style.display = "none";
					}
				}
				
				if( (ul.value != "确认密码") && (ul.value != "") && (0 == w) && (un.value != "") && (un.value != "设置密码")){
					button.disabled = false;
				}
			}

			var im = document.getElementById("img1");
			var odd = 0;
			im.onclick = function(){					 				
				if( (re.exec(uu.value)) && (0 == w) ){									
					var p1 = document.getElementById("password1");				
					if(odd % 2==0){
						p1.type="text";
					}else{
						if(ul.value != "确认密码" && un.value != "设置密码")
						{
							p1.type="password";
						}
					}
					odd++;
				}
			}
			
			var im2 = document.getElementById("img2");
			var odd2 = 0;
			im2.onclick = function(){
				if( (re.exec(uu.value)) && (0 == w) ){
					var p2 = document.getElementById("password2");
					if(odd2 % 2==0){
						p2.type="text";
					}else{
						if(ul.value != "确认密码" && un.value != "设置密码")
					    {
							p2.type="password";
						}
					}
					odd2++;
				}
			}				
		
		}		

</script>

</head>

<body>

	<div id="header">
		<div id="line1">
			<span class="wel_reg">&nbsp;&nbsp;欢迎注册</span>
		</div>
		<div id="line2">
			<a href="login.html"> <span>请登录</span>
			</a> <span>已有账号？</span>
		</div>
	</div>

	<div id="middle">
		<!-- 提交方式为post/POST,后端调用RegisUser1的doPost方法。这里用post为的是在网页地址栏上不让用户名和密码显示在跳转地址的后面，保证用户信息的私密性 -->
		<form method="post" action="RegistUser1" onkeydown="if(event.keyCode==13)return false;">
		<table id="form_tab">
			<tr>
				<td><span id="unique">请你随意起一个有个性的名字吧~</span>
					<span id="unique2"><img class="v" src="image/capture.jpg">
					名字这东西是能随便起的吗？麻烦你认真一点！！（示例：_Jack、_ab9$^.!G） </span></td>
			</tr>
			<tr>
				<td><input class="username" type="text" name="username"
					value="用户名" /></td>
			</tr>

			<tr>
				<td class="err_msg">
					
				</td>
			</tr>
			<tr>
				<td><input id="password1" maxlength="10" class="password"
					type="text" name="password" value="设置密码" /> <image
						id="img1" src="image/apture.jpg"></image> <image id="img2"
						src="image/apture.jpg"></image></td>
			</tr>

			<tr>
				<td class="err_msg">
					
				</td>
			</tr>
			<tr>
				<td><input id="password2" maxlength="10" class="password"
					type="text" name="repassword" value="确认密码" /></td>
			</tr>
			<tr>
				<td class="err_msg alter">两次密码输入不一致</td>
			</tr>

			<tr>
				<td class="protocol">
					 <a href="#"> 
				</a>
				</td>
			</tr>
			<tr>
				<td><input id="button" type="submit"
					value="立即注册" /> <span id="span"></span></td>
			</tr>
		</table>
		
		</form>

	</div>

	<div id="footer">
		<p>
			关于我们 |
			联系我们 |
			人才招聘 |
			商家入驻 |
			营销中心 |			
			友情链接 |
			销售联盟 |						
			English Site<br>
			Copyright © 2018 - 2020 复习fuxi.com 版权所有
		</p>
	</div>


</body>
</html>

