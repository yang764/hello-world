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
#a, #b, #c {
	border: 7px solid #F0F0F0;
	border-top-width: 9px;
	border-bottom-width: 9px;
	font-size: 56px;
}

form {
	position: absolute;
	top: 300px;
	left: 250px;
}

#span1 {
	border: 7px solid #F0F0F0;
	border-top-width: 9px;
	border-bottom-width: 9px;
	font-size: 32px;
	color: red;
}

#img {
	margin-top: 25px;
	margin-left: 1300px;
	cursor: pointer;
}

#menu {
	font-size: 16px;
	color: black;
	margin-left: 1300px;
	margin-top: 0;
	margin-bottom: 0;
	width: 70px;
	border: 3px solid grey;
	display: none;
}

#mima {
	cursor: pointer;
}

#tui {
	cursor: pointer;
}

#exp {
	display: inline-block;
	position: absolute;
	top: 30px;
	left: 40px;
	font-size: 32px;
}

#va {
	position: absolute;
	top: 70px;
	left: 40px;
}

#god {
	font-size: 30px;
	position: absolute;
	top: 50px;
	left: 1270px;
}

#aa {
	position: absolute;
	top: 35px;
	left: 248px;
	border: 2px solid brown;
	border-top-width: 15px;
	border-bottom-width: 15px;
}

#bb {
	position: absolute;
	top: 35px;
	left: 248px;
	border: 1px solid brown;
	border-left-width: 123px;
	border-right-width: 123px;
}

#cc {
	position: absolute;
	top: 65px;
	left: 248px;
	border: 1px solid brown;
	border-left-width: 123px;
	border-right-width: 123px;
}

#dd {
	position: absolute;
	top: 35px;
	left: 490px;
	border: 2px solid brown;
	border-top-width: 15px;
	border-bottom-width: 15px;
}

#grade {
	font-size: 30px;
	width: 60px;
	height: 30px;
	position: absolute;
	top: 35px;
	left: 150px;
}

#one {
	background: rgb(0,195,0);
	width: 24px;
	height: 30px;
	position: absolute;
	top: 35px;
	left: 250px;
}

#two {
	background: rgb(0,187.5,0);
	width: 24px;
	height: 30px;
	position: absolute;
	top: 35px;
	left: 274px;
}

#three {
	background: rgb(0,180,0);
	width: 24px;
	height: 30px;
	position: absolute;
	top: 35px;
	left: 298px;
}

#four {
	background: rgb(0,172.5,0);
	width: 24px;
	height: 30px;
	position: absolute;
	top: 35px;
	left: 322px;
}

#five {
	background: rgb(0,165,0);
	width: 24px;
	height: 30px;
	position: absolute;
	top: 35px;
	left: 346px;
}

#six {
	background: rgb(0,157.5,0);
	width: 24px;
	height: 30px;
	position: absolute;
	top: 35px;
	left: 370px;
}

#seven {
	background: rgb(0,150,0);
	width: 24px;
	height: 30px;
	position: absolute;
	top: 35px;
	left: 394px;
}

#eight {
	background: rgb(0,142.5,0);
	width: 24px;
	height: 30px;
	position: absolute;
	top: 35px;
	left: 418px;
}

#nine {
	background: rgb(0,135,0);
	width: 24px;
	height: 30px;
	position: absolute;
	top: 35px;
	left: 442px;
}

#ten {
	background: rgb(0,127.5,0);
	width: 24px;
	height: 30px;
	position: absolute;
	top: 35px;
	left: 466px;
}

#mod {
	position: absolute;
	top: 100px;
	left: 370px;
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
		var five = document.getElementById("five");
		var six = document.getElementById("six");
		var seven = document.getElementById("seven");
		var eight = document.getElementById("eight");
		var nine = document.getElementById("nine");
		var ten = document.getElementById("ten");
				
		if(c == 0){			
			one.style.display = "none";
			two.style.display = "none";
			three.style.display = "none";
			four.style.display = "none";
			five.style.display = "none";
			six.style.display = "none";
			seven.style.display = "none";
			eight.style.display = "none";
			nine.style.display = "none";
			ten.style.display = "none";
		}
		else if(c > 0 && c <= 10){			
			one.style.display = "inline-block";
			two.style.display = "none";
			three.style.display = "none";
			four.style.display = "none";
			five.style.display = "none";
			six.style.display = "none";
			seven.style.display = "none";
			eight.style.display = "none";
			nine.style.display = "none";
			ten.style.display = "none";
		}
		else if(c > 10 && c <= 20){			
			one.style.display = "inline-block";
			two.style.display = "inline-block";
			three.style.display = "none";
			four.style.display = "none";
			five.style.display = "none";
			six.style.display = "none";
			seven.style.display = "none";
			eight.style.display = "none";
			nine.style.display = "none";
			ten.style.display = "none";
		}
		else if(c > 20 && c <= 30){			
			one.style.display = "inline-block";
			two.style.display = "inline-block";
			three.style.display = "inline-block";
			four.style.display = "none";
			five.style.display = "none";
			six.style.display = "none";
			seven.style.display = "none";
			eight.style.display = "none";
			nine.style.display = "none";
			ten.style.display = "none";
		}
		else if(c > 30 && c <= 40){			
			one.style.display = "inline-block";
			two.style.display = "inline-block";
			three.style.display = "inline-block";
			four.style.display = "inline-block";
			five.style.display = "none";
			six.style.display = "none";
			seven.style.display = "none";
			eight.style.display = "none";
			nine.style.display = "none";
			ten.style.display = "none";
		}	
		else if(c > 40 && c <= 50){			
			one.style.display = "inline-block";
			two.style.display = "inline-block";
			three.style.display = "inline-block";
			four.style.display = "inline-block";
			five.style.display = "inline-block";
			six.style.display = "none";
			seven.style.display = "none";
			eight.style.display = "none";
			nine.style.display = "none";
			ten.style.display = "none";
		}	
		else if(c > 50 && c <= 60){			
			one.style.display = "inline-block";
			two.style.display = "inline-block";
			three.style.display = "inline-block";
			four.style.display = "inline-block";
			five.style.display = "inline-block";
			six.style.display = "inline-block";
			seven.style.display = "none";
			eight.style.display = "none";
			nine.style.display = "none";
			ten.style.display = "none";
		}	
		else if(c > 60 && c <= 70){			
			one.style.display = "inline-block";
			two.style.display = "inline-block";
			three.style.display = "inline-block";
			four.style.display = "inline-block";
			five.style.display = "inline-block";
			six.style.display = "inline-block";
			seven.style.display = "inline-block";
			eight.style.display = "none";
			nine.style.display = "none";
			ten.style.display = "none";
		}	
		else if(c > 70 && c <= 80){			
			one.style.display = "inline-block";
			two.style.display = "inline-block";
			three.style.display = "inline-block";
			four.style.display = "inline-block";
			five.style.display = "inline-block";
			six.style.display = "inline-block";
			seven.style.display = "inline-block";
			eight.style.display = "inline-block";
			nine.style.display = "none";
			ten.style.display = "none";
		}	
		else if(c > 80 && c <= 90){			
			one.style.display = "inline-block";
			two.style.display = "inline-block";
			three.style.display = "inline-block";
			four.style.display = "inline-block";
			five.style.display = "inline-block";
			six.style.display = "inline-block";
			seven.style.display = "inline-block";
			eight.style.display = "inline-block";
			nine.style.display = "inline-block";
			ten.style.display = "none";
		}	
		else{
			one.style.display = "inline-block";
			two.style.display = "inline-block";
			three.style.display = "inline-block";
			four.style.display = "inline-block";
			five.style.display = "inline-block";
			six.style.display = "inline-block";
			seven.style.display = "inline-block";
			eight.style.display = "inline-block";
			nine.style.display = "inline-block";
			ten.style.display = "inline-block";
		}
				  		
	} 	 

	function openDiv(thisobj){
		var oDiv = thisobj.parentNode.getElementsByTagName("div")[0];		
			
		if(oDiv.style.display == "block"){				
			oDiv.style.display = "none";
		}else{		
			oDiv.style.display = "block";
		}
	}
		
	function tui(){			
		window.location.href="xiaobai.jsp";
	}

</script>

</head>
<body>

	<span id="exp">Grade:</span>
	<span id="grade"> ${COUNT} </span>
	<span id="one"> </span>
	<span id="two"> </span>
	<span id="three"> </span>
	<span id="four"> </span>
	<span id="five"> </span>
	<span id="six"> </span>
	<span id="seven"> </span>
	<span id="eight"> </span>
	<span id="nine"> </span>
	<span id="ten"> </span>
	
	<span id="god">回</br> 去
	</span>
	<span id="aa"></span>
	<span id="bb"></span>
	<span id="cc"></span>
	<span id="dd"></span>
	<image id="img" onclick="openDiv(this)" src="image/god.PNG"></image>
	<div id="menu">
		<span id="mima" onclick="mima()">修改密码</span></br> ----------</br> <span id="tui"
			onclick="tui()">退出</span>
	</div>

</body>
</html>