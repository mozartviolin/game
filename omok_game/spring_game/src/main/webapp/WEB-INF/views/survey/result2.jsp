<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>survey 결과</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- 그래프용 js -->
<script src="https://www.chartjs.org/dist/2.7.3/Chart.bundle.js"></script>
<script src="https://www.chartjs.org/samples/latest/utils.js"></script>

</head>
<body>
<br>
<br>

<div style="width:80%; text-align: center; margin: 0 auto;">
<h2 style="font-style: oblique;"> 게임을 다시 플레이할 의향이 있는지에 대한 설문조사 결과창</h2>
<br>

<div id="canvas-holder" style="margin: 0 auto; text-align:center; width:60%">
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
					'다시 안하고싶다',
					'생각해 보겠다',
					'다시 해보고 싶다',					
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
<button onclick="history.back()">뒤로가기</button>

</div>
<hr>

</div>
<br><br>
</body>
</html>