/*!
 * bluetooth.js - Mind Drive Assist
 * http://www.themindspot.com/minddrive
 * 
 * Copyright (C) 2013 The Mind Company, http://www.themindspot.com
 * Author: Brandon Laurence Clark
 */

//Bluetooth functions
var connectedPhones = new Array();
var phoneItemNumber;

function getBT () {
	gm.communication.getBTServices(
		function(response) {		
			if (response == "") {
				phoneToggle("noPhone");
			} else {		
				for ( var i = 0; i < phoneLength; i++) {
					for ( var f = 0; f < response.length; f++) {
						if (phoneList[i].uuid == response[f].UUID){
							phoneToggle("mainDisplay");
						} else {
							connectedPhones = response;
							if (f == i)
								phoneToggle("pickPhoneMsg");
						}
					}
				}
			}				
		}
	);
	watchBT();  	
}//End getBT


function watchBT () { 
	gm.communication.watchBTServices(
		function(response) {		
			if (response == "") {
				phoneToggle("noPhone");
			} else {
				for ( var i = 0; i < phoneLength; i++) {
					for ( var f = 0; f < response.length; f++) {
						if (phoneList[i].uuid == response[f].UUID){
							phoneToggle("mainDisplay"); 
						} else {
							connectedPhones = response;
							if (f == i)
								phoneToggle("pickPhoneMsg");
						}
					}
				}
			}	
		}
	);
}//End watchBT
