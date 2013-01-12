import bb.cascades 1.0

NavigationPane {
    id: navigationPane
Page {
    
        id: homeScreen
//Background container        
Container {
	objectName: "mind_template"
	topPadding: 200
	
	//Background 
	background: backgroundPaint.imagePaint            
	attachedObjects: [
	    ImagePaintDefinition {
	        id: backgroundPaint
	        imageSource: "asset:///img/mainBG.png"
	        repeatPattern: RepeatPattern.XY
	    }
	]//End Background
        
    //Elements
    Container {
        layout: StackLayout {}        
        horizontalAlignment:HorizontalAlignment.Center
        objectName: "mind_template_elements"
        topPadding: 200
	                    
        //Logo           
        ImageView {
            objectName: "mindDrive"                
            imageSource: "asset:///img/mindDrive.png"
        }//End Logo
	            
        //Navigation on Screen
        Container {
	        id: mainNavButtons
	        topMargin: 100
	        layout: StackLayout {
	            orientation: LayoutOrientation.LeftToRight}	
	        horizontalAlignment:HorizontalAlignment.Center
	            
	        //Reports
	        ImageButton {
	        objectName: "Report"
	        defaultImageSource: "asset:///img/buildReport.png" 
	        onClicked: {
	                // show detail page when the button is clicked
	                var page = getReportPage();
	                console.debug("pushing detail " + page)
	                navigationPane.push(page);}                
	        property Page reportPage
	        function getReportPage() {
	            if (! reportPage) {
	                reportPage = reportPageDefinition.createObject();}
	                return reportPage;}
	                
	                attachedObjects: [
	                ComponentDefinition {
	                id: reportPageDefinition
	                source: "report.qml"}]
	        }//End Reports  
	        
	        //Link Car    
	        ImageButton {
	            objectName: "Link"
	            defaultImageSource: "asset:///img/linkCar.png"
	            onClicked: {
	                // show detail page when the button is clicked
	                var page = getLinkCarPage();
	                console.debug("pushing detail " + page)
	                navigationPane.push(page);
	        }                
	        property Page linkCarPage
	        function getLinkCarPage() {
	            if (! linkCarPage) {
	                linkCarPage = linkCarPageDefinition.createObject();}
	                return linkCarPage;}
	                
	                attachedObjects: [
	                ComponentDefinition {
	                id: linkCarPageDefinition
	                source: "linkCar.qml"}]
	        }//End Link Car
	    }//End Navigation On Screen

        //Bottom Navigation Bar    
        Container {
	        layout: StackLayout {
	        orientation: LayoutOrientation.LeftToRight}	
	        horizontalAlignment:HorizontalAlignment.Right
	        verticalAlignment: VerticalAlignment.Bottom
	        topPadding: 200
	        
	        //Preferences
	        ImageButton {
	            objectName: "Preferences" 
	            defaultImageSource: "asset:///img/Preferences.png"
	            bottomMargin: 10
	            rightMargin: 30
	            onClicked: {
	            // show detail page when the button is clicked
	            var page = getPreferencePage();
	            console.debug("pushing detail " + page)
	            navigationPane.push(page);}                
		    property Page prefPage
		    function getPreferencePage() {
		        if (! prefPage) {
		            prefPage = prefPageDefinition.createObject();}
		            return prefPage;}
		            attachedObjects: [
		            ComponentDefinition {
		            id: prefPageDefinition
		            source: "prefs.qml"}]                    
		    }//End Preferences
        }//End Bottom Navigation Bar
        
        //Log     
        onCreationCompleted: {
            console.log("NavigationPane - onCreationCompleted()");
        }//End Log
    }//End Elements
}//End Background Container
}//End Page
}//End Navigation