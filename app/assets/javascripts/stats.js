//= require jsapi
//= require chartkick.js
//= require highcharts
//= require bootstrap-datepicker

Highcharts.createElement('link', {
   href: 'https://fonts.googleapis.com/css?family=Dosis:400,600',
   rel: 'stylesheet',
   type: 'text/css'
}, null, document.getElementsByTagName('head')[0]);

Highcharts.theme = {
   colors: ["#7BAF22", "#CFA830"],
   chart: {
      backgroundColor: null,
      style: {
         fontFamily: "Dosis, sans-serif"
      }
   },
   title: {
      style: {
         fontSize: '16px',
         fontWeight: 'bold',
         textTransform: 'uppercase'
      }
   },
   tooltip: {
      borderWidth: 0,
      backgroundColor: 'rgba(219,219,216,0.8)',
      shadow: false
   },
   legend: {
      itemStyle: {
         fontWeight: 'bold',
         fontSize: '13px'
      }
   },
   xAxis: {
      gridLineWidth: 1,
      labels: {
         style: {
            fontSize: '12px'
         }
      }
   },
   yAxis: {
      minorTickInterval: 'auto',
      title: {
         style: {
            textTransform: 'uppercase'
         }
      },
      labels: {
         style: {
            fontSize: '12px'
         }
      }
   },
   plotOptions: {
      candlestick: {
         lineColor: '#404048'
      }
   },
   // General
   background2: '#F0F0EA'
};

// Apply the theme
Highcharts.setOptions(Highcharts.theme);


$(document).ready(function(){

	function dp(id, id2, minmaxDate){
    $(id).datepicker({
			dateFormat: "yy-mm-dd",
			buttonImageOnly: true,
			buttonText: "Select date",
			showOn: "button",
			buttonImage: "/assets/stats/calendar.gif",
			changeMonth: true,
			changeYear: true,
			minDate: "-5Y",
			maxDate: +3,
			onClose: function( selectedDate ) {
				$(id2).datepicker( "option", minmaxDate, selectedDate);
			}
		});
	}
	$(function() {
		dp("#calendar_data_from", "#calendar_data_to", "minDate");
		dp("#calendar_data_to", "#calendar_data_from", "maxDate");
	});

	function calendar_data(df, dt){
		$("#date_exchange #build_chart_exchange").attr("href", "?data_from="+ df +"&data_to="+ dt +"")
	}

	var data_from;
	var data_to;

	$("#calendar_data_from").change(function(){
		data_from = $(this).val();
		calendar_data(data_from, data_to)
	}).change();

	$("#calendar_data_to").change(function(){
		data_to = $(this).val();
		calendar_data(data_from, data_to)
	}).change();


	// var img_count = $("#slider_main_images .main_image").length;
	$("#valexchange_calc #total").click(function(){
		var val1 = $("#valexchange_calc #select1").val();
		var val2 = $("#valexchange_calc #select2").val();
		var val3 = $("#valexchange_calc #exchange_param").val();
		var val_total = val3*(val1/val2);
		if(val3 == ""){
			alert("Не вказана сума!!!")
		}
		$("#valexchange_calc #exchange_total").attr("value", val_total);
	});

	$("#valexchange_calc #select1 option").eq(6).attr("selected","selected");

	$("#valexchange_calc select").click(function(){
		var select_id = $(this).attr("id");
		var select1_id = $("#valexchange_calc #select1 option:selected").attr("id");
		var select2_id = $("#valexchange_calc #select2 option:selected").attr("id");
		var aa = $("#valcurs_calc #"+ select_id +" option:selected").index();
		if(select1_id == select2_id){
			$("#valexchange_calc #"+ select_id +" option").eq(aa-1).attr("selected","selected");
		}
	});

});