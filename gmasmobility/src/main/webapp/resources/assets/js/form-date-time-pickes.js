$(function() {
	"use strict";

    $('.datepicker').pickadate({
		showOn: "button",
        selectMonths: true,
        selectYears: true
    }),
    $('.timepicker').pickatime()


   
        $('#date-time').bootstrapMaterialDatePicker({
            format: 'YYYY-MM-DD HH:mm'
        });
        $('#date').bootstrapMaterialDatePicker({
			format: 'YYYY-MM-DD',
            time: false
        });
        $('#time').bootstrapMaterialDatePicker({
            date: false,
            format: 'HH:mm'
        });

});