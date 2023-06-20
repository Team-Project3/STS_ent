function createChartWithData() {
// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Area Chart Example
var ctx = document.getElementById("myAreaChart");

//현재 날짜와 년도를 가져오는 함수
function getCurrentYearMonth() {
  var currentDate = new Date();
  var year = String(currentDate.getFullYear()).slice(-2);
  var month = String(currentDate.getMonth() + 1).padStart(2, '0');
  return year + '-' + month;
}

// 레이블 생성
var labels = [];
var currentYearMonth = getCurrentYearMonth();
labels.push(currentYearMonth);
for (var i = 0; i < 12; i++) {
  var parts = currentYearMonth.split('-');
  var year = parseInt(parts[0]);
  var month = parseInt(parts[1]) + 1;
  if (month > 12) {
    month = 1;
    year += 1;
  }
  var nextYearMonth = String(year).padStart(2, '0') + '-' + String(month).padStart(2, '0');
  labels.push(nextYearMonth);
  currentYearMonth = nextYearMonth;
}
$.ajax({
	  type: "POST",
	  url: 'chart_area_demo',
	  dataType: "text",
	  success: function(pricesString){
	        var pricesArray = pricesString.split(",");  // Convert the string to an array

	        var x = pricesArray.shift();  // Remove and store the first element as 'x'
	        var data1 = [x].concat(pricesArray);  // Combine 'x' with the remaining elements
	        createChart(data1);
	  },
	  error: function(data) {
	    if (data.status == 401) {
	      alert('failed.');
	      return;
	    }
	  }
	});
	function createChart(data1) {
	  var myLineChart = new Chart(ctx, {
	    type: 'line',
	    data: {
	      labels: labels,
	      datasets: [{
	        label: "월 수익",
	        lineTension: 0.3,
	        backgroundColor: "rgba(2,117,216,0.2)",
	        borderColor: "rgba(2,117,216,1)",
	        pointRadius: 5,
	        pointBackgroundColor: "rgba(2,117,216,1)",
	        pointBorderColor: "rgba(255,255,255,0.8)",
	        pointHoverRadius: 5,
	        pointHoverBackgroundColor: "rgba(2,117,216,1)",
	        pointHitRadius: 50,
	        pointBorderWidth: 2,
	        data: data1
	      }],
	    },
	    options: {
	      scales: {
	        xAxes: [{
	          time: {
	            unit: 'date'
	          },
	          gridLines: {
	            display: false
	          },
	          ticks: {
	            maxTicksLimit: 7
	          }
	        }],
	        yAxes: [{
	          ticks: {
	            min: 0,
	            max: 1000000,
	            maxTicksLimit: 5
	          },
	          gridLines: {
	            color: "rgba(0, 0, 0, .125)",
	          }
	        }],
	      },
	      legend: {
	        display: false
	      }
	    }
	  });
	}
}
