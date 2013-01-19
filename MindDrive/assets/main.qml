
import bb.cascades 1.0

NavigationPane {
    id: navigationPane
Page {    
   id: homeScreen
   
	//Background container        
	Container {
		objectName: "mind_template"
		
		//Background 
		background: backgroundPaint.imagePaint            
		attachedObjects: [
		    ImagePaintDefinition {
		        id: backgroundPaint
		        imageSource: "img/mainBG.png"
		        repeatPattern: RepeatPattern.XY
		    }
		]//End Background
	        
	    //Elements
	    Container {
	        layout: StackLayout {}        
	        horizontalAlignment:HorizontalAlignment.Center
	        objectName: "mind_template_elements"
	        topPadding: 200
		    Container {   
		        layout: StackLayout {
                      
                  }          
                  horizontalAlignment: HorizontalAlignment.Center
	        //Logo           
	        ImageView {
	            objectName: "mindDrive"                
	            imageSource: "img/mindDrive.png"
	        }//End Logo
		   }
	        //Navigation on Screen
	        Container {
		        id: mainNavButtons
		        topMargin: 200
		        layout: DockLayout {
                  }
		        horizontalAlignment:HorizontalAlignment.Center
		        preferredWidth: maxWidth
		        leftPadding: 100
		        rightPadding: 100
              Container {
                  layout: DockLayout {
                          }
                  horizontalAlignment: HorizontalAlignment.Left
		        //Reports
		        ImageButton {
		        objectName: "Report"
		        pressedImageSource: "img/reportsDown.png"
		        defaultImageSource: "img/reports.png" 
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
		    }
		    Container {
		        layout: DockLayout {                
                  }
                  horizontalAlignment: HorizontalAlignment.Right
		        //Link Car    
		        ImageButton {
		            objectName: "Link"
		            pressedImageSource: "img/linkedDown.png"
		            defaultImageSource: "img/linked.png"
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
		    }
		    }//End Navigation On Screen
	
	        //Bottom Navigation Bar     
	        Container {
	            
		        layout: StackLayout {
		        orientation: LayoutOrientation.LeftToRight}	
		        horizontalAlignment:HorizontalAlignment.Right
		        verticalAlignment: VerticalAlignment.Bottom
		        topPadding: 150
		        rightPadding: 50
		        
		        //Preferences
		        ImageButton {
		            objectName: "Preferences" 
		            defaultImageSource: "img/Preferences.png"
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