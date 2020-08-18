<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@teachablemachine/pose@0.8/dist/teachablemachine-pose.min.js"></script>
<script src="resources/js/upperbody.js"></script>

<link rel="stylesheet" href="resources/css/program_workout.css">




</head>
<body>
<h2>자꾸 민소매만 입고싶어지는 운동! 섹시하고 탄탄한 가슴,어깨,팔만들기! [덤벨 6분]</h2>
<div id="print-time"></div>
<pre></pre>
<div id="cam"><canvas id="canvas"></canvas></div>
<div id="video-container">
	<iframe height="100%" width="100%" src="resources/video/lowerbody.mp4"></iframe>
</div>

<div id="label-container"></div>

<script type="text/javascript">
	
async function start() {
 	var i = 0;
 	var tCount = document.getElementById("print-time");
	var countP = setInterval(function() {  		
  		i++;
  		tCount.innerHTML = i;
  		if(i == 14){
  			tCount.innerHTML = 1;
  			clearInterval(countP);  			
  		}
  	},1000);
	
	function time() {
		tCount.innerHTML = 0;
	}
	
	setTimeout(init, 11000);
	//tCount.innerHTML = i;
	
	setTimeout(time, 75000);
	//setTimeout(time, 65000);
	//setTimeout(time, 65000);
	//setTimeout(time, 65000);
}
	
window.onload = function() {
	start();
}
</script>

</body>
</html>