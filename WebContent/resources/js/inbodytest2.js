google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
    	  var jsonData = $.ajax({
      		url : "InbodyController.do",
      		method : "post",
      		data : {"command":"test", "mb_no":"1"},
      		dataType : "json",
      		async: false  // 동기식
      	}).responseText;
        var data = google.visualization.arrayToDataTable($.parseJSON(jsonData));
        console.log(data);
        var options = {
          title: '인바디 그래프',
          //curveType: 'function',
          legend: { position: 'bottom' },
          hAxis : {gridlines:1},
          vAxis : {minValue: 100,viewWindow:{min:0},gridlines:{count:-1},textStyle:{fontSize:12}},
          animation : {startup: true, duration: 1000, easing: 'in' },
          height : 300,
          width : '50%'
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }
      