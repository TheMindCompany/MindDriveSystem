/*!
 * navigation.js - Mind Drive Assist
 * http://www.themindspot.com/minddrive
 * 
 * Copyright (C) 2013 The Mind Company, http://www.themindspot.com
 * Author: Brandon Laurence Clark
 */

//Display functions
function allDisplaysOff (){
	var noPhone = document.getElementById( 'noPhone' );
	var pickPhone = document.getElementById( 'pickPhone' );
	var pickPhoneMsg = document.getElementById( 'pickPhoneMsg' );
	var mainDisplay = document.getElementById( 'mainDisplay' );	
	
	noPhone.style.display = 'none';
	pickPhone.style.display = 'none';
	pickPhoneMsg.style.display = 'none';
	mainDisplay.style.display = 'none';
}//End allDisplaysOff

function phoneToggle (display) {	
	allDisplaysOff();
	
	if (display == "noPhone")
		noPhone.style.display = 'block';
	else if (display == "pickPhone")
		pickPhone.style.display = 'block';
	else if (display == "pickPhoneMsg")
		pickPhoneMsg.style.display = 'block';
	else if (display == "mainDisplay")
		mainDisplay.style.display = 'block';			
}//End phoneToggle

function displayPhoneList () {
	var display = document.getElementById("pickPhoneList");
	for(var i = 0; i < phoneList.length; i++){
		list = list == "" ? list + "<li>" + phoneList[i] + "</li>" : "<li>" + phoneList[i] + "</li>" ;
	}
	//for testing purpose
	if (phoneList.length == 1) {
		list = list + "<li>empty test</li><li>empty test</li><li>empty test</li>";
	}
	display.innerHTML = list;
}//End displayPhoneList

var generatePhoneList = function(){
	phoneToggle("pickPhone");
	displayPhoneList();
};//End generatePhoneList


