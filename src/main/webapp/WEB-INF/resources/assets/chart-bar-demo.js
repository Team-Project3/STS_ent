function chart_bar_demo(){
// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

$.ajax({
	  type: "POST",
	  url: 'chart_bar_demo',
	  dataType: "text",
	  success: function(headssString){
	        var headsArray = headssString.split(",");  // Convert the string to an array

	        var x = headsArray.shift();  // Remove and store the first element as 'x'
	        var data1 = [x].concat(headsArray);  // Combine 'x' with the remaining elements
	        createVar(data1);
	  },
	  error: function(headssString) {
	    if (headssString.status == 401) {
	      alert('failed.');
	      return;
	    }
	  }
	});

function createVar(data1) {
	
// Bar Chart Example
var ctx = document.getElementById("myBarChart");
var myLineChart = new Chart(ctx, {
  type: 'bar',
  data: {
    labels: ["콘서트", "연극", "전시", "TOTAL"],
    datasets: [{
      label: "예매자 수",
      backgroundColor: "rgba(2,117,216,1)",
      borderColor: "rgba(2,117,216,1)",
      data: data1
    }],
  },
  options: {
    scales: {
      xAxes: [{
        time: {
          unit: 'month'
        },
        gridLines: {
          display: false
        },
        ticks: {
          maxTicksLimit: 4
        }
      }],
      yAxes: [{
        ticks: {
          min: 0,
          max: 200,
          maxTicksLimit: 5
        },
        gridLines: {
          display: true
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
