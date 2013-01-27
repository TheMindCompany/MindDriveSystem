/*!
 * main.js - Mind Drive Assist
 * http://www.themindspot.com/minddrive
 * 
 * Copyright (C) 2013 The Mind Company, http://www.themindspot.com
 * Author: Brandon Laurence Clark
 */

//Everything to be loaded on star-up
function init() {

	checkFile();
	//Widgets	
	var btnAddPhone = new gm.widgets.Button(
			{ label: "Add Phone", callBack: generatePhoneList, parentElement: document.getElementById('btnAddPhone') }
	);//End btnAddPhone
    btnAddPhone.render();	
    getBT();
	watchBT();  
	watchOdometer();
	startTimer();
	
	gm.system.setShutdown(function() {
		console.log('Closing: Creating Tracked Data File' );
		writeTrackedData();
	},
	function() {
		console.log('Close Failure: Creating File' );		
	});
}
