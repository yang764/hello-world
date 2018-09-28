
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset = "UTF-8">
<title>实力选择</title>
<style type="text/css">
div {
	color: #FF6600;
	font-size: 120px;
	font-family: Arial, "MS Trebuchet", sans-serif;
	text-align: center;
	margin: 100px auto;
}

#v1{
	position: absolute;
	top: 550px;
	left: 200px;
	font-size: 30px;
}

#v2{
	position: absolute;
	top: 550px;
	left: 750px;
	font-size: 30px;
}

#v3{
	position: absolute;
	top: 550px;
	left: 1180px;
	font-size: 30px;
}

table {
	margin: 100px auto;
}

input {
	border: 7px solid #F0F0F0;
	border-top-width: 9px;
	border-bottom-width: 9px;
	font-size: 160px;
	cursor: pointer;
}
</style>

<script type="text/javascript">
window.onload = function(){	
	var button1 = document.getElementById("button1");
	var button2 = document.getElementById("button2");
	var button3 = document.getElementById("button3");
	button1.onclick = function(){
		alert("新手上路~");
		
	}
	button2.onclick = function(){
		alert("有点东西嘛~");
		
	}
	button3.onclick = function(){
		alert("老司机开车请慢点~");
		
	}
}
</script>

</head>
<body>

	<div>请选择你的学习水平程度</div> 
	
	<form method="post" action="Entrance"
		onkeydown="if(event.keyCode==13)return false;">
		<table>
			<tr>

				<td><input id="button1" type="submit" name="level" value="rookie" /> 
					<span id="span1"></span></td>
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
				<td><input id="button2" type="submit" name="level" value="normal" />
					<span id="span2"></span></td>
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
				<td><input id="button3" type="submit" name="level" value="god" />
					<span id="span3"></span></td>
				
			</tr>
		</table>
	</form>
	<span id = "v1">（可升级三次）</span>
	<span id = "v2">（可升级两次）</span>
	<span id = "v3">（可升级至满级）</span>
</body>
</html>