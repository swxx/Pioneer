<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <title>后台管理</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">
    
    <link href='http://fonts.useso.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
    <link href="../css/font-awesome.min.css" rel="stylesheet">
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/templatemo-style.css" rel="stylesheet">
    
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you viSSew the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->


  </head>
  <body>  
    <!-- Left column -->
    <div class="templatemo-flex-row">
      <!--Left column-->
        <#include "adminleft.ftl">
      <script type="text/javascript">
        	document.getElementById("id2").className="active"; 
      </script>
      <!--end left-->
      <!-- Main content --> 
      <div class="templatemo-content col-1 light-gray-bg">
        <!--header-->
          <#include "head.ftl">
        <!--end header-->
        <div class="templatemo-content-container">         
          <div class="templatemo-content-widget white-bg">
            <h2 class="margin-bottom-10">Data Visualization</h2>
            <p>Credit goes to <a href="https://google-developers.appspot.com/chart/" target="_parent">Google Charts</a></p>
            <div class="panel panel-default no-border">
              <div class="panel-heading border-radius-10">
                <h2>Gauge</h2>
              </div>
              <div class="panel-body">
                <div class="templatemo-flex-row flex-content-row margin-bottom-30">
                  <div class="col-1">
                    <div id="gauge_div" class="templatemo-chart"></div>
                    <h3 class="text-center margin-bottom-5">Computer Resources</h3>
                    <p class="text-center">Curabitur</p>              
                  </div>              
                </div>     
              </div>
            </div>            
            <div class="panel panel-default no-border">
              <div class="panel-heading border-radius-10">
                <h2>Timeline</h2>
              </div>
              <div class="panel-body">
                <div class="templatemo-flex-row flex-content-row">
                  <div class="col-1">
                    <div id="timeline_div" class="templatemo-chart"></div>
                    <h3 class="text-center margin-bottom-5">Conference Schedule</h3>
                    <p class="text-center">Lorem Ipsum</p>                
                  </div>              
                </div>
              </div> 
            </div>
            <div class="panel panel-default no-border">
              <div class="panel-heading border-radius-10">
                <h2>Area Chart</h2>
              </div>
              <div class="panel-body">
                <div class="templatemo-flex-row flex-content-row">
                  <div class="col-1">
                    <div id="area_chart_div" class="templatemo-chart"></div>
                    <h3 class="text-center margin-bottom-5">Company Performance</h3>
                    <p class="text-center">Fusce mi lacus</p>                
                  </div>              
                </div>
              </div> 
            </div>
          </div>
          <!--footer-->
            <#include "footer.ftl">            
          <!--end-->        
        </div>
      </div>
    </div>
    
    <!-- JS -->
    <script type="text/javascript" src="../js/jquery-1.11.2.min.js"></script>      <!-- jQuery -->
    <script type="text/javascript" src="../js/jquery-migrate-1.2.1.min.js"></script> <!--  jQuery Migrate Plugin -->
    <script type="text/javascript" src="https://www.google.com/jsapi"></script> <!-- Google Chart -->
    <script>

      var gaugeChart;
      var gaugeData;
      var gaugeOptions;
      var timelineChart;
      var timelineDataTable;
      var timelineOptions;
      var areaData;
      var areaOptions;
      var areaChart;

      /* Gauage 
      --------------------------------------------------*/
      google.load("visualization", "1", {packages:["gauge"]});
      google.setOnLoadCallback(drawGauge);
      google.load("visualization", "1", {packages:["timeline"]});
      google.setOnLoadCallback(drawTimeline);
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);

      $(document).ready(function(){
        if($.browser.mozilla) {
          //refresh page on browser resize
          // http://www.sitepoint.com/jquery-refresh-page-browser-resize/
          $(window).bind('resize', function(e)
          {
            if (window.RT) clearTimeout(window.RT);
            window.RT = setTimeout(function()
            {
              this.location.reload(false); /* false to get page from cache */
            }, 200);
          });      
        } else {
          $(window).resize(function(){
            drawCharts();
          });  
        }   
      });

      function drawGauge() {

        gaugeData = google.visualization.arrayToDataTable([
          ['Label', 'Value'],
          ['Memory', 80],
          ['CPU', 55],
          ['Network', 68]
        ]);

        gaugeOptions = {
          redFrom: 90, redTo: 100,
          yellowFrom:75, yellowTo: 90,
          minorTicks: 5
        };

        gaugeChart = new google.visualization.Gauge(document.getElementById('gauge_div'));
        gaugeChart.draw(gaugeData, gaugeOptions);

        setInterval(function() {
          gaugeData.setValue(0, 1, 40 + Math.round(60 * Math.random()));
          gaugeChart.draw(gaugeData, gaugeOptions);
        }, 13000);
        setInterval(function() {
          gaugeData.setValue(1, 1, 40 + Math.round(60 * Math.random()));
          gaugeChart.draw(gaugeData, gaugeOptions);
        }, 5000);
        setInterval(function() {
          gaugeData.setValue(2, 1, 60 + Math.round(20 * Math.random()));
          gaugeChart.draw(gaugeData, gaugeOptions);
        }, 26000);        
      } // End function drawGauage

      /* Timeline
      --------------------------------------------------*/
      function drawTimeline() {
        var container = document.getElementById('timeline_div');
        timelineChart = new google.visualization.Timeline(container);
        timelineDataTable = new google.visualization.DataTable();
        timelineDataTable.addColumn({ type: 'string', id: 'Room' });
        timelineDataTable.addColumn({ type: 'string', id: 'Name' });
        timelineDataTable.addColumn({ type: 'date', id: 'Start' });
        timelineDataTable.addColumn({ type: 'date', id: 'End' });
        timelineDataTable.addRows([
          [ 'Magnolia Room',  'CSS Fundamentals',    new Date(0,0,0,12,0,0),  new Date(0,0,0,14,0,0) ],
          [ 'Magnolia Room',  'Intro JavaScript',    new Date(0,0,0,14,30,0), new Date(0,0,0,16,0,0) ],
          [ 'Magnolia Room',  'Advanced JavaScript', new Date(0,0,0,16,30,0), new Date(0,0,0,19,0,0) ],
          [ 'Gladiolus Room', 'Intermediate Perl',   new Date(0,0,0,12,30,0), new Date(0,0,0,14,0,0) ],
          [ 'Gladiolus Room', 'Advanced Perl',       new Date(0,0,0,14,30,0), new Date(0,0,0,16,0,0) ],
          [ 'Gladiolus Room', 'Applied Perl',        new Date(0,0,0,16,30,0), new Date(0,0,0,18,0,0) ],
          [ 'Petunia Room',   'Google Charts',       new Date(0,0,0,12,30,0), new Date(0,0,0,14,0,0) ],
          [ 'Petunia Room',   'Closure',             new Date(0,0,0,14,30,0), new Date(0,0,0,16,0,0) ],
          [ 'Petunia Room',   'App Engine',          new Date(0,0,0,16,30,0), new Date(0,0,0,18,30,0) ]]);

        timelineOptions = {
          timeline: { colorByRowLabel: true },
          backgroundColor: '#ffd'
        };

        timelineChart.draw(timelineDataTable, timelineOptions);
      } // End function drawTimeline

      /* Area Chart 
      --------------------------------------------------*/
      function drawChart() {
        areaData = google.visualization.arrayToDataTable([
          ['Year', 'Sales', 'Expenses'],
          ['2013',  1000,      400],
          ['2014',  1170,      460],
          ['2015',  660,       1120],
          ['2016',  1030,      540]
        ]);

        areaOptions = {
          title: 'Company Performance',
          hAxis: {title: 'Year',  titleTextStyle: {color: '#333'}},
          vAxis: {minValue: 0}
        };

        areaChart = new google.visualization.AreaChart(document.getElementById('area_chart_div'));
        areaChart.draw(areaData, areaOptions);
      } // End function drawChart

      function drawCharts () {
          gaugeChart.draw(gaugeData, gaugeOptions);
          timelineChart.draw(timelineDataTable, timelineOptions);
          areaChart.draw(areaData, areaOptions);
      }

    </script>
    <script type="text/javascript" src="../js/templatemo-script.js"></script>      <!-- Templatemo Script -->
  </body>
</html>