/*!
 * main.js - Mind Drive Assist
 * http://www.themindspot.com/minddrive
 * 
 * Copyright (C) 2013 The Mind Company, http://www.themindspot.com
 * Author: Brandon Laurence Clark
 */
var isFocused = 0;

function shutDownMindDrive() {
	gm.system.setShutdown(function() {
		console.log('Closing: Creating Tracked Data File' );
		writeTrackedData();
	},
	function() {
		console.log('Close Failure: Creating File' );		
	});
}//End shutDownMindDrive

//Everything to be loaded on star-up.  Should have only background events.
function init() {
	//Make sure files needed exist or create default ones.
	checkFile();
	//Widgets by GM	
	createButtons();
	//Bluetooth Profile Get & Watch: Shows correct screen for connected phone situations.
    getBT();
    //watchBT();
	//Starts Data Events
	startDataTracking();
	//Shut Down Procedures
	shutDownMindDrive();
}
