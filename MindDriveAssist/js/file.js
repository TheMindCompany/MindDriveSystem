/*!
 * file.js - Mind Drive Assist
 * http://lab.hakim.se/scroll-effects
 * MIT licensed
 * 
 * Copyright (C) 2013 The Mind Company, http://www.themindspot.com
 * Author: Brandon Laurence Clark
 */

/* TODO make functions more dynamic. Current has focus  
 * of separation of data for debugging purposes.       */

//Phone list for saved and available Blue tooth profiles
var phoneList = new Array();
var phone, list;
	
function writeDefaultPhoneList () {
	gm.io.writeFile(
	    'store/phones.xml',
	    '<phone>' +
	    	'<uuid>a1b2c3d4e5</uuid>' +
	    	'<number>99999</number>' +
	    	'<name>jjjjjjj</name>' +
	    	'<handle>IPhone</handle>' +
	    '</phone>'
	);
}//End writeDefaultPhoneList

function writePhoneList (uuid,number,name,handle) {
	gm.io.writeFile(
	    'store/phones.xml',
	    '<phone>' +
	    	'<uuid>' + uuid + '</uuid>' +
	    	'<number>' + number + '</number>' +
	    	'<name>' + name + '</name>' +
	    	'<handle>' + handle + '</handle>' +
	    '</phone>'
	);
	phoneList[phoneList.length + 1] = uuid;
}//End writePhoneList

function readPhoneList () {
	var xmlhttp = new XMLHttpRequest;
	xmlhttp.open("GET","data/share/store/phones.xml",false);
	xmlhttp.send();
	var xmlDoc = xmlhttp.responseXML;
	phone = xmlDoc.getElementsByTagName("phone");
	var xmlLength = phone.length;
	for (var i=0; i < xmlLength; i++){
		phoneList[i] = phone[i].getElementsByTagName("uuid")[0].childNodes[0].nodeValue;
	}	
}//End readPhoneList

function checkFile () {
	gm.io.getResource(
	    function(response){
	    	if (response == null) { 
	    		console.log('Failure: getResource. Path: Creating File' );
	    		writeDefaultPhoneList();
			    readPhoneList();
	    	} else {
	    		console.log('Success: getResource. Path: ' + response);
			    readPhoneList();
	    	}
	    },
	    function(){
	        console.log('Failure: getResource');
	    },
	    "phones.xml",
	    {
	        "number": 0,
	        "searchLocations": "Data"
	    }
	);
}//End checkFile

//Drive data to be tracked
function writeTrackedData () {
	var currentdate = new Date(); 
	var datetime = "" + (currentdate.getMonth()+1) + "" + currentdate.getFullYear() + currentdate.getHours() + currentdate.getMinutes();
	gm.io.writeFile(
		    'store/' + datetime + '.xml',
		    '<trip>' +
		    	'<startTime>0</startTime>' +
		    	'<endTimeHour>' + time.getHours() + '</endTimeHour>' +
		    	'<endTimeMin>' + time.getMinutes() + '</endTimeMin>' +
		    	'<endTimeSec>' + time.getSeconds() + '</endTimeSec>' +
		    	'<fuelStart>' + fuelStart + '</fuelStart>' +
		    	'<fuelEnd>' + fuelLast + '</fuelEnd>' +
		    	'<odometerStart>' + odometerStart + '</odometerStart>' +
		    	'<odometerEnd>' + odometerLast + '</odometerEnd>' +
		    '</trip>'
		);
}



