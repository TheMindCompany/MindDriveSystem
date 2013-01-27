/*!
 * bluetooth.js - Mind Drive Assist
 * http://www.themindspot.com/minddrive
 * 
 * Copyright (C) 2013 The Mind Company, http://www.themindspot.com
 * Author: Brandon Laurence Clark
 */

//Bluetooth functions
function getBT () {
	gm.communication.getBTServices(
		function(response) {
			var i = response.length;
			var phoneIcon = document.getElementById( 'phoneIcon' );			
			if (response == "") {
				console.log('onLoad: no bluetooth profiles');	
				phoneIcon.src = "img/phoneNone.png";
				phoneToggle("noPhone");
			} else {
				for (var f = 0; f < i; f++) {
					if (phoneList[f] == response[f].UUID){
						console.log('onLoad: BLUETOOTH YOU WANT IS FOUND!!!');
						phoneIcon.src = "img/phoneOn.png";
						phoneToggle("mainDisplay");
						break;
					} else {
						console.log('onLoad: BLUETOOTH OBJECT #' + f + '   ////////////////////////');
						console.log('bluetooth object uuid:           ' + response[f].UUID			);
						console.log('bluetooth object service number: ' + response[f].serviceNumber	);
						console.log('bluetooth object service name:   ' + response[f].serviceName	);
						console.log('bluetooth object device handle:  ' + response[f].deviceHandle	);
						phoneIcon.src = "img/phoneActive.png";   
					    phoneToggle("pickPhoneMsg");
					}
				}
			}				
		}
	);
}//End getBT

function watchBT () { 
	gm.communication.watchBTServices(
		function(response) {
			var i = response.length;
			var phoneIcon = document.getElementById( 'phoneIcon' );			
			if (response == "") {
				console.log('no bluetooth profiles');	
				phoneIcon.src = "img/phoneNone.png";
				phoneToggle("noPhone");
			} else {
			    readPhoneList();
				for (var f = 0; f < i; f++) {
					if (phoneList[f] == response[f].UUID){
						console.log('BLUETOOTH YOU WANT IS FOUND!!!');
						phoneIcon.src = "img/phoneOn.png";
						phoneToggle("mainDisplay");
						break;
					} else {
						console.log('BLUETOOTH OBJECT #' + f + '   ////////////////////////');
						console.log('bluetooth object uuid:           ' + response[f].UUID			);
						console.log('bluetooth object service number: ' + response[f].serviceNumber	);
						console.log('bluetooth object service name:   ' + response[f].serviceName	);
						console.log('bluetooth object device handle:  ' + response[f].deviceHandle	);
						phoneIcon.src = "img/phoneActive.png";   
					    phoneToggle("pickPhoneMsg");
					}
				}
			}	
		}
	);
}//End watchBT