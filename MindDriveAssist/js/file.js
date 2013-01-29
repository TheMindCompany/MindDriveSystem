/*!
 * file.js - Mind Drive Assist
 * http://www.themindspot.com/minddrive
 * 
 * Copyright (C) 2013 The Mind Company, http://www.themindspot.com
 * Author: Brandon Laurence Clark
 */

/* TODO make functions more dynamic. Current has focus  
 * of separation of data for debugging purposes.       */

//Phone list for saved and available Blue tooth profiles
var phoneList = {};
var phone, phoneLength;
	
function writeDefaultPhoneList () {
	gm.io.writeFile(
	    'store/phones.xml',
	    '<phone>' +
	    	'<uuid>1b2c3d4e5</uuid>' +
	    	'<number>99999</number>' +
	    	'<name>jjjjjjj</name>' +
	    	'<handle>IPhone</handle>' +
	    '</phone>'
	);
	console.log("Wrote Default List XML");
}//End writeDefaultPhoneList

var phoneData = new String();
function buildPhoneListXML () {
	for (var i = 0; i < phoneLength; i++){
		phoneData = phoneData +
					'<phone>' +
						'<uuid>' + phoneList[i].uuid + '</uuid>' +
						'<number>' + phoneList[i].number + '</number>' +
						'<name>' + phoneList[i].name + '</name>' +
						'<handle>' + phoneList[i].handle + '</handle>' +
					'</phone>';
	}
}

function writePhoneList (uuid,number,name,handle) {
	var phoneDataSave = new String();
	buildPhoneListXML();
	phoneDataSave = '<phone>' +
						'<uuid>' + uuid + '</uuid>' +
						'<number>' + number + '</number>' +
						'<name>' + name + '</name>' +
						'<handle>' + handle + '</handle>' +
					'</phone>';
	gm.io.writeFile(
	    'store/phones.xml',
	    '<model>' +
	    	phoneData + phoneDataSave +
	    '</model>'
	);
    phoneList[phoneLength] = {
			uuid: uuid,
			number: number,
			name: name,
			handle: handle
    };
	phoneLength = phoneLength + 1;
	phoneData = "";
	console.log("Selected Item Added to List XML");
}//End writePhoneList

function readPhoneList () {
	var xmlhttp = new XMLHttpRequest;
	xmlhttp.open("GET","data/share/store/phones.xml",false);
	xmlhttp.send();
	var xmlDoc = xmlhttp.responseXML;
	phone = xmlDoc.getElementsByTagName("phone");
	phoneLength = xmlDoc.getElementsByTagName("phone").length;
	for (var i=0; i < phoneLength; i++){
	    phoneList[i] = {
				uuid: phone[i].getElementsByTagName("uuid")[0].childNodes[0].nodeValue,
				number: phone[i].getElementsByTagName("number")[0].childNodes[0].nodeValue,
				name: phone[i].getElementsByTagName("name")[0].childNodes[0].nodeValue,
				handle: phone[i].getElementsByTagName("handle")[0].childNodes[0].nodeValue
	    };
	}	
}//End readPhoneList

function checkFile () {
	gm.io.getResource(
	    function(response){
	    	if (response == null) { 
	    		writeDefaultPhoneList();
			    readPhoneList();
	    	} else {
			    readPhoneList();
	    	}
	    },
	    function(){
	    	//something should go here.
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
	console.log("Wrote Tracked Data XML");
}



