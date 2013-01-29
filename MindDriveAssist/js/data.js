/*!
 * data.js - Mind Drive Assist
 * http://www.themindspot.com/minddrive
 * 
 * Copyright (C) 2013 The Mind Company, http://www.themindspot.com
 * Author: Brandon Laurence Clark
 */

function twoDecimal(num) {
	return parseFloat(Math.round(num * 100) / 100).toFixed(2);
}//End twoDecimal

//fuel data
var fuelStart = 'start', fuelLast;
function getFuel(){
	infoID = gm.info.getVehicleData( 
			function (obj) { 
				fuelLast = obj.fuel_level;
			}, 
			function (obj) { 
				/*handle failure case*/ 
			}, 
			["fuel_level"] 
		);
}//End getFuel

function getFuelUsed (fuelCurrent) {
	if (fuelStart === 'start') {
		fuelStart = fuelCurrent;
		return 0;
	} else {
		fuelLast = fuelCurrent;
		return fuelStart - fuelCurrent;
	}
}//End getFuelUsed	

function fuelToScreen (){
	getFuel();
	var fuel = getFuelUsed(fuelLast);
	document.getElementById( 'fuel' ).innerHTML = "<p>" + fuel + "%" + "</p>";
}//End fuelToScreen

/* TODO Currently watchFuel() will cause watchOdometer() to stop cycling. 
 * To fix temporarily fuelToScreen() has been placed in watchOdometer().  */
function watchFuel () {
	watchFuelLevel = setInterval(fuelToScreen, 1000);
}//End watchFuel

function watchFuelStop () {
	clearInterval(watchFuleLevel);
}//End watchFuelStop
	
//miles traveled data
var odometerStart = 'start', odometerLast = 0;
function getOdometer () {
	infoID = gm.info.getVehicleData( 
			function(obj) { 
			console.log("odometer Level is " + obj.odometer);
			return obj.odometer;
			}, 
			function(obj) { 
				/*handle failure case*/ 
			}, 
			["odometer"] 
		);
}//End getOdometer

function getMileTraveled (odometerCurrent) {
	if ((odometerStart == 'start') && (odometerCurrent == 0.1)) {
		odometerStart = 0;
		return twoDecimal(odometerStart);
	} else if ((odometerStart == 'start') && (odometerCurrent > 0)){
		odometerStart = odometerCurrent;
		return twoDecimal(odometerStart);
	} else {
		odometerLast = odometerCurrent;
		return twoDecimal(odometerCurrent - odometerStart);
	}
}//End getMilesTraveled

function odometerToScreen (odometerValue) {
    document.getElementById( 'distance' ).innerHTML = "<p>" + getMileTraveled(odometerValue) + "</p>";
}//End odometerToScreen

function watchOdometer () {
	watchVehicleDataID = gm.info.watchVehicleData(
		    function(responseObj) {
		    	if (odometerLast < responseObj.odometer){
		    		odometerToScreen(responseObj.odometer);
		    		fuelToScreen();//Here till a option to fix setInterval issue with above code or watchVehicleData covers fuel_level 
		        }
		    },
		    function(responseObj) {
		    },
		    [
		        "odometer"
		    ]
		);
}//End watchOdometer

//Time Traveled
var time;

function buildTime(t) {
    minutes = t.getMinutes();
    seconds = t.getSeconds();
    hours = t.getHours();
    if (minutes < 10) {
        minutes = "0"+minutes;
    }
    if (seconds < 10) {
        seconds = "0"+seconds;
    }
    if (hours > 0) {
        return hours+":"+minutes+":"+seconds;
    } else {
        return minutes+":"+seconds;
    }
}//End buildTime

function startTimer() {
    if (typeof(time) != "object") {
        time = new Date();
        time.setSeconds(0); 
        time.setMinutes(0);
        time.setHours(0); 
        document.getElementById("time").innerHTML = "<p>" + buildTime(time) + "</p>";
    }
    function changeTimer() {
        time.setSeconds(time.getSeconds()+1);
        document.getElementById("time").innerHTML = "<p>" + buildTime(time) + "</p>";
    }
    interval = setInterval(changeTimer, 1000);
}//End startTimer
 
function pauseTimer() {
    clearInterval(interval);
}//End pauseTimer
 
function resetTimer() {
    time = ""; 
    clearInterval(interval); 
    document.getElementById("show_timer_div").innerHTML = "00:00"; 
}//End resetTimer

//All Three Data Variables
function startDataTracking () {	
	document.getElementById( 'distance' ).innerHTML = "<p>0</p>";
	document.getElementById( 'fuel' ).innerHTML = "<p>0%</p>";
	watchOdometer();
	startTimer();
	console.log("Data Tracking Started");
}//End startDataTracking