<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="UTF-8">
<title>学习模块选择</title>
<style type="text/css">

#a,#b,#c{
	border: 7px solid #F0F0F0;
	border-top-width: 9px;
	border-bottom-width: 9px;
	font-size: 56px;
}

form{
	position: absolute;
	top: 300px;
	left: 200px;
}

#span1{
	border: 7px solid #F0F0F0;
	border-top-width: 9px;
	border-bottom-width: 9px;
	font-size: 32px;
}

#img{
	margin-top: 25px;
	margin-left: 1400px;
	cursor: pointer;
}

#menu{
	font-size: 16px;
	color: black;
	margin-left: 1400px;
	margin-top: 0;
	margin-bottom: 0;
	width: 70px;
	border: 3px solid grey;
	display: none;
}

#mima{
	cursor: pointer;
}

#tui{
	cursor: pointer;
}

#exp{
	display: inline-block;
	position: absolute;
	top: 30px;
	left: 20px;
	font-size: 32px;
}

#va{
	position: absolute;
	top: 70px;
	left: 20px;
}

#bai{
	font-size: 30px;
	position: absolute;
	top: 50px;
	left: 1370px;
}

#aa{
	position: absolute;
	top: 35px;
	left: 128px;
	border: 2px solid brown;
	border-top-width: 15px;
	border-bottom-width: 15px;
}

#bb{
	position: absolute;
	top: 35px;
	left: 128px;
	border: 1px solid brown;
	border-left-width: 123px;
	border-right-width: 123px;
}

#cc{
	position: absolute;
	top: 65px;
	left: 128px;
	border: 1px solid brown;
	border-left-width: 123px;
	border-right-width: 123px;
}

#dd{
	position: absolute;
	top: 35px;
	left: 370px;
	border: 2px solid brown;
	border-top-width: 15px;
	border-bottom-width: 15px;
}

#one{	
	background: green;
	width: 60px;
	height: 30px;
	position: absolute;
	top: 35px;
	left: 130px;		
}

#two{
	
	background: green;
	width: 120px;
	height: 30px;
	position: absolute;
	top: 35px;
	left: 130px;
	
}

#three{
	
	background: green;
	width: 180px;
	height: 30px;
	position: absolute;
	top: 35px;
	left: 130px;
	
}

#four{
	
	background: green;
	width: 240px;
	height: 30px;
	position: absolute;
	top: 35px;
	left: 130px;
	
}

#mod{
	position: absolute;
	top: 100px;
	left: 425px;
}

div {
	color: #FF6600;
	font-size: 120px;
	font-family: Arial, "MS Trebuchet", sans-serif;
	text-align: center;
	margin: 100px auto;
}

table {
	margin: 100px auto;
}

input {
	border: 7px solid #F0F0F0;
	border-top-width: 9px;
	border-bottom-width: 9px;
	font-size: 60px;
	cursor: pointer;
}
</style>

<script type="text/javascript">
	
	  window.onload = function(){
		
		var c = "${COUNT}";	
		
		var one = document.getElementById("one");
		var two = document.getElementById("two");
		var three = document.getElementById("three");
		var four = document.getElementById("four");
		var aa = document.getElementById("aa");
		var bb = document.getElementById("bb");
		var cc = document.getElementById("cc");
		var dd = document.getElementById("dd");
		var va = document.getElementById("va");
		var ul = document.getElementById("exp");
				
		if(c == 1){			
			one.style.display = "inline-block";
			two.style.display = "none";
			three.style.display = "none";
			four.style.display = "none";
		}
		if(c == 2){			
			one.style.display = "none";
			two.style.display = "inline-block";
			three.style.display = "none";
			four.style.display = "none";
		}
		if(c == 3){			
			one.style.display = "none";
			two.style.display = "none";
			three.style.display = "inline-block";
			four.style.display = "none";
		}
		if(c == 4){			
			one.style.display = "none";
			two.style.display = "none";
			three.style.display = "none";
			four.style.display = "inline-block";
			window.location.href = "cong1.html";
		}	
		if(c == ""){
				ul.style.display = "none";
				one.style.display = "none";
				two.style.display = "none";
				three.style.display = "none";
				four.style.display = "none";
				aa.style.display = "none";
				bb.style.display = "none";
				cc.style.display = "none";
				dd.style.display = "none";
				va.style.display = "none";
		}
				  		
	} 	 
</script>
<script type="text/javascript">
		  
		function openDiv(thisobj){
			var oDiv = thisobj.parentNode.getElementsByTagName("div")[0];		
			
			if(oDiv.style.display == "block"){				
				oDiv.style.display = "none";
			}else{		
				oDiv.style.display = "block";
			}
		}
		
		function mima(){
			window.location.href="quiz.html";
		}
		
		function tui(){		
			window.location.href="tui.html";
		}

</script>

</head>
<body>
	
	<span id="exp" >经验值:</span>
	<span id="one">
		
	</span>
	<span id="two">
		
	</span>
	<span id="three">
		
	</span>
	<span id="four">
		
	</span>
	<span id="va">（登录四次可升级）</span>
	<span id="bai">小</br>
		      白	</span>
	<span id="aa"></span>
	<span id="bb"></span>
	<span id="cc"></span>
	<span id="dd"></span>
	<image id="img" onclick="openDiv(this)" src="image/bai.PNG"></image>
	<div id="menu"> 				
				<span id="mima" onclick="mima()">单元测试</span></br>	
				----------</br>	
				<span id="tui" onclick="tui()">退出</span>			
	</div>
	
	
	
	<div id="mod">请选择学习模块</div> 
	
	<form method="get" action="/613/Xiaobai"
		onkeydown="if(event.keyCode==13)return false;">
		<table>
			<tr>

				<td> 
					  <input id="button" type="submit" name="module" value="节点的CRUD" /> 
					<span id="span1"></span>
				</td>
				<td />
				<td />
				<td />
				<td />
				<td />
				<td />
				<td />
				<td />
				<td />
				<td />
				<td> 
					 <input id="button" type="submit" name="module" value="开关灯" /> 
					<span id="span1"></span>
				</td>
				<td />
				<td />
				<td />
				<td />
				<td />
				<td />
				<td />
				<td />
				<td />
				<td />
				<td> 
					  <input id="button" type="submit" name="module" value="二级联动下拉框" /> 
					<span id="span1"></span>
				</td>

			</tr>
		</table>
	</form>
</body>
</html>