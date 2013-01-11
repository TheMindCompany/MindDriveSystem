/*
 * Code-samples JavaScript
 */

var ttsInput, txtPhone, textMsgNum, textMsg, txtFilename,txtBinFilename, txtContents,txtBinContents, txtRead, txtDelete;

function init() {

	// Create Expandable regions
	x$(".group").addClass("closed");
	x$(".group .title").on("click", function() {
		var el = x$(this.parentNode);
		if (el.hasClass("closed"))
			el.removeClass("closed");
		else
			el.addClass("closed");
	});
	
	// BUTTON AND INPUT WIDGETS
	
	// Profile Buttons
	var profileOneBtn = new gm.widgets.Button({
		label:"Personal",
        parentElement: document.getElementById('profile-one')
	});
	
	profileOneBtn.render(); // associated html element id=phone-button
	var profileTwoBtn = new gm.widgets.Button({
		label:"Personal",
		parentElement: document.getElementById('profile-two')
	});
	profileTwoBtn.render(); // associated html element id=phone-button
};


