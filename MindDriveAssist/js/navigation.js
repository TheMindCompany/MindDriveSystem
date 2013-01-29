/*!
 * navigation.js - Mind Drive Assist
 * http://www.themindspot.com/minddrive
 * 
 * Copyright (C) 2013 The Mind Company, http://www.themindspot.com
 * Author: Brandon Laurence Clark
 */

//Display functions
var list = new String();

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
	var phoneIcon = document.getElementById( 'phoneIcon' );		
	allDisplaysOff();
	
	if (display == "noPhone"){
		noPhone.style.display = 'block';
		phoneIcon.src = "img/phoneNone.png";
	} else if (display == "pickPhone") {
		pickPhone.style.display = 'block';
		phoneIcon.src = "img/phoneActive.png";
	} else if (display == "pickPhoneMsg") {
		pickPhoneMsg.style.display = 'block';
		phoneIcon.src = "img/phoneActive.png";
	} else if (display == "mainDisplay") {
		mainDisplay.style.display = 'block';
		phoneIcon.src = "img/phoneOn.png";
	}	
	
	console.log("Switched Display to " + display);		
}//End phoneToggle

function listItemSelected (i) {
	document.getElementById('listItem' + i + '').style.background = '#c1ffb0';
	document.getElementById('listItem' + i + '').style.color = '#000000';
	document.getElementById('listItemIcon' + i + '').src = "img/plus_lg.png";	
	writePhoneList(getListItem(i, 'uuid'), getListItem(i, 'number'), getListItem(i, 'name'), getListItem(i, 'handle'));
	phoneToggle("mainDisplay");
	console.log("Selected a Phone Profile");
}

function listItemHover (i) {
	//This was my attempt to have a hover event with the rotary knobs, hasn't worked.
	document.getElementById('listItem' + i + '').style.background = '#969696';
	document.getElementById('listItem' + i + '').style.color = '#000000';
	document.getElementById('listItemIcon' + i + '').src = "img/plus_lg.png";	
	console.log("Hover over a Phone Profile");
}//End listItemHover

function displayPhoneList () {
	var display = document.getElementById("pickPhoneList");
	list = "";
	
	for(var i = 0; i < connectedPhones.length; i++){
		list = list + "<li onClick=\"listItemSelected(" + i + ");\" id=\"listItem" + i + "\">" + connectedPhones[i].serviceName + "<img onMouseDown=\"listItemHover(" + i + ");\" onClick=\"listItemSelected(" + i + ");\" src=\"img/plus_sm.png\" class=\"btnPlusIcon\" id=\"listItemIcon" + i + "\">" + "</li>";
	}
	
	if (connectedPhones.length == 1) {
		list = list + "<li></li><li></li><li></li>";
	}else if (connectedPhones.length == 2) {
		list = list + "<li></li>";
	}
	display.innerHTML = list;

	console.log("Generated phone profile list to display");
}//End displayPhoneList

function getListItem (i, value) {
	var aListItem  = new String();
	switch (value) {
	case "uuid":
		aListItem = connectedPhones[i].UUID;
		break;
	case "name":
		aListItem = connectedPhones[i].serviceName;
		break;
	case "number":
		aListItem = connectedPhones[i].serviceNumber;
		break;
	case "handle":
		aListItem = connectedPhones[i].deviceHandle;
		break;

	default:
		break;
	}
	
	return aListItem;
}

var generatePhoneList = function(){
	phoneToggle("pickPhone");
	displayPhoneList();	
};//End generatePhoneList

function createButtons () {
	var btnAddPhone = new gm.widgets.Button(
			{ label: "Add Phone", callBack: generatePhoneList, parentElement: document.getElementById('btnAddPhone') }
	);//End btnAddPhone
    btnAddPhone.render();	
}
