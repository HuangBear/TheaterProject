// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';
Chart.defaults.global.defaultFontSize=22;
// Area Chart Example
//var ctx = document.getElementById("myAreaChart");
//var Today=new Date();
//var myLineChart = new Chart(ctx, {
//  type: 'line',
//  data: {
//    labels: [(Today.getMonth()+1) + " 月 " + (Today.getDate()-5) + " 日",
//    	(Today.getMonth()+1) + " 月 " + (Today.getDate()-4) + " 日",
//    	(Today.getMonth()+1) + " 月 " + (Today.getDate()-3) + " 日",
//    	(Today.getMonth()+1) + " 月 " + (Today.getDate()-2) + " 日",
//    	(Today.getMonth()+1) + " 月 " + (Today.getDate()-1) + " 日",
//    	(Today.getMonth()+1) + " 月 " + Today.getDate() + " 日(本日)"],
//    datasets: [{
//      label: "Sessions",
//      lineTension: 0.3,
//      backgroundColor: "rgba(2,117,216,0.2)",
//      borderColor: "rgba(2,117,216,1)",
//      pointRadius: 5,
//      pointBackgroundColor: "rgba(2,117,216,1)",
//      pointBorderColor: "rgba(255,255,255,0.8)",
//      pointHoverRadius: 5,
//      pointHoverBackgroundColor: "rgba(2,117,216,1)",
//      pointHitRadius: 50,
//      pointBorderWidth: 2,
//      data: [0, 3, 2, 1, 7, 2],
//    }],
//  },
//  options: {
//    scales: {
//      xAxes: [{
//        time: {
//          unit: 'date'
//        },
//        gridLines: {
//          display: false
//        },
//        ticks: {
//          maxTicksLimit: 7
//        }
//      }],
//      yAxes: [{
//        ticks: {
//          min: 0,
//          max: 10,
//          maxTicksLimit: 5
//        },
//        gridLines: {
//          color: "rgba(0, 0, 0, .125)",
//        }
//      }],
//    },
//    legend: {
//      display: false
//    }
//  }
//});
