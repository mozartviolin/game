<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 그래프용 js -->
<script src="https://www.chartjs.org/dist/2.7.3/Chart.bundle.js"></script>
<script src="https://www.chartjs.org/samples/latest/utils.js"></script>

</head>
<body>

<h2>survey 결과창</h2>

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
					label: 'Dataset 2'
				}],
				labels: [
					'안하고싶다',
					'생각해봄',
					'다시하고싶다',					
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
	
<hr>

<div>
<button onclick="location.href='${pageContext.request.contextPath }/'">홈</button>
<button onclick="location.href='${pageContext.request.contextPath }/survey/result2'">결과보기</button>
</div>
<hr>

</body>
</html>