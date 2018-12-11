<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>survey 결과</title>

<!-- 그래프용 js -->
<script src="https://www.chartjs.org/dist/2.7.3/Chart.bundle.js"></script>
<script src="https://www.chartjs.org/samples/latest/utils.js"></script>

</head>
<body>

<h2>게임 만족도에 대한 설문조사 결과창</h2>

<div id="canvas-holder" style="width:40%">
		<canvas id="chart-area"></canvas>
	</div>
<!-- 	<button id="removeDataset">Remove Dataset</button> -->
	<script>	
		var randomScalingFactor = function() {
			return Math.round(Math.random() * 100);
		};
		var config = {
			type: 'pie',
			data: {
				datasets: [{
					data: [
						"${choise1}",
						"${choise2}",
						"${choise3}",
					],
					backgroundColor: [
						window.chartColors.red,
						window.chartColors.yellow,
						window.chartColors.green,
					],
					label: 'Dataset 1'
				}],
				labels: [
					'불만족',
					'보통',
					'만족',					
				]
			},
			options: {
				responsive: true
			}
		};

		window.onload = function() {
			var ctx = document.getElementById('chart-area').getContext('2d');
			window.myPie = new Chart(ctx, config);
		};

		var colorNames = Object.keys(window.chartColors);
		
		document.getElementById('removeDataset').addEventListener('click', function() {
			config.data.datasets.splice(0, 1);
			window.myPie.update();
		});
	</script>
	<div id="canvas-holder2" style="width:40%">
		<canvas id="chart-area"></canvas>
	</div>	
	
<hr>

<div>
<button onclick="location.href='${pageContext.request.contextPath }/'">홈</button>
<button onclick="history.back()">뒤로가기</button>
<button onclick="location.href='${pageContext.request.contextPath }/survey/result1'">결과보기</button>
</div>
<hr>

</body>
</html>