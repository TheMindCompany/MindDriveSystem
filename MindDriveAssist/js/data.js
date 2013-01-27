/*!
 * data.js - Mind Drive Assist
 * http://lab.hakim.se/scroll-effects
 * MIT licensed
 * 
 * Copyright (C) 2013 The Mind Company, http://www.themindspot.com
 * Author: Brandon Laurence Clark
 */

function twoDecimal(num) {
	return parseFloat(Math.round(num * 100) / 100).toFixed(2);
}

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
}

function getFuelUsed (fuelCurrent) {
	if (fuelStart === 'start') {
		fuelStart = fuelCurrent;
		return 0;
	} else {
		fuelLast = fuelCurrent;
		return fuelStart - fuelCurrent;
	}
}	

function fuelToScreen (){
	getFuel();
	var fuel = getFuelUsed(fuelLast);
	document.getElementById( 'fuel' ).innerHTML = "<p>" + fuel + "%" + "</p>";
}

/* TODO Currently watchFuel() will cause watchOdometer() to stop cycling. 
 * To fix temporarily fuelToScreen() has been placed in watchOdometer().  */
function watchFuel () {
	watchFuelLevel = setInterval(fuelToScreen, 1000);
}

function watchFuelStop () {
	clearInterval(watchFuleLevel);
}
	
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
}

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
}

function watchOdometer () {
	watchVehicleDataID = gm.info.watchVehicleData(
		    function(responseObj) {
		    	if (odometerLast < responseObj.odometer){
			        console.log('Success odometer: watchVehicleData -> ' + JSON.stringify(responseObj));
			        document.getElementById( 'distance' ).innerHTML = "<p>" + getMileTraveled(responseObj.odometer) + "</p>";
			        fuelToScreen();
		        }
		    },
		    function(responseObj) {
		        console.log('Failure odometer: watchVehicleData.');
		    },
		    [
		        "odometer"
		    ]
		);
}

//Time Traveled
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
}
 var time;
// Call this to start the timer
function startTimer() {
    // If time isn't an object, create new Date and set seconds/minutes to 0
    if (typeof(time) != "object") {
        time = new Date();
        time.setSeconds(0); // Sets seconds to 0
        time.setMinutes(0); // Sets minutes to 0
        time.setHours(0); // Sets hours to 0
        document.getElementById("time").innerHTML = "<p>" + buildTime(time) + "</p>"; // buildTime(time) returns 00:00
    }
    // Update seconds, to be executed every second or 1000 miliseconds
    function changeTimer() {
        time.setSeconds(time.getSeconds()+1);
        document.getElementById("time").innerHTML = "<p>" + buildTime(time) + "</p>";
    }
    // Set Interval to every second
    interval = setInterval(changeTimer, 1000);
}
 
// Pauses timer, seconds/minute count will be the same when started again
function pauseTimer() {
    clearInterval(interval);
}
 
// Reset timer to 00:00
function resetTimer() {
    time = ""; // Turn time into a string
    clearInterval(interval); // Clear interval
    document.getElementById("show_timer_div").innerHTML = "00:00"; // Put timer to 0's
}

function isVehicleStarted () {

	return true;
}

function displayData () {
	
	
}

var sendDisplay;
function feedData () {
	while (isVehicleStarted()) {
		sendDisplay = setInterval(displayData, 60);
	} 
	clearInterval(sendDisplay);	
}