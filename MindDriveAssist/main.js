	var phoneList = new Array();
	var xmlhttp = new XMLHttpRequest;

	xmlhttp.open("GET","data/share/store/phones.xml",false);
	xmlhttp.send();
	var xmlDoc = xmlhttp.responseXML;
	var phone = xmlDoc.getElementsByTagName("phone");
	var xmlLength = phone.length;
	for (var i=0; i < xmlLength; i++){
		phoneList[i] = phone.getElementsByTagName("uuid")[i].childNodes[0].nodeValue;
	}
	
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

function createPhoneList () {
	
}

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

//Different file functions
function writePhoneList () {
	gm.io.writeFile(
	    'store/phones.xml',
	    '<phone>' +
	    	'<uuid>a1b2c3d4e5</uuid>' +
	    	'<number>99999</number>' +
	    	'<name>jjjjjjj</name>' +
	    	'<handle>IPhone</handle>' +
	    '</phone>'
	);
}//End writePhoneList

function readPhoneList () {
	
	//document.getElementById("time").innerHTML=	phone.getElementsByTagName("uuid")[0].childNodes[0].nodeValue;
	
}//End readPhoneList

function checkFile () {
	gm.io.getResource(
	    function(response){
	    	if (response == null) { 
	    		console.log('Failure: getResource. Path: Creating File' );
	    		writePhoneList();
	    	} else {
	    		console.log('Success: getResource. Path: ' + response);
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
				watchBT();  
			} else {
			    readPhoneList();
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
						watchBT();  
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

//Everything to be loaded on star-up
function init() {
	checkFile();
	//Widgets	
	readFile = new gm.io.readFile('data/share/store/approvedPhones.xml');//To be removed
	var btnAddPhone = new gm.widgets.Button(
			{ label: "Add Phone", callBack: readFile, parentElement: document.getElementById('btnAddPhone') }
	);//End btnAddPhone
    btnAddPhone.render();	
    getBT();

}
