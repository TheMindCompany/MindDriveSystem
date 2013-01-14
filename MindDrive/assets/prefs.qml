import bb.cascades 1.0

Page {    
    id: homeScreen
    
	//Background container        
	Container {
		objectName: "mind_template_preferences"	
			
		//Background 
		background: backgroundPaint.imagePaint            
		attachedObjects: [
		    ImagePaintDefinition {
		        id: backgroundPaint
		        imageSource: "img/editingBG.png"
		        repeatPattern: RepeatPattern.XY
		    }
		]//End Background
		
		//Page Header
		Container {
			layout: DockLayout {}
			preferredWidth: maxWidth
			leftPadding: 25
			rightPadding: 25
			topPadding: 25
			bottomMargin: 40
			
			//Header Icon 
            Container { 
                layout: DockLayout {}
                horizontalAlignment: HorizontalAlignment.Right          
    	        ImageView {
    	            objectName: "mindDrive"                
    	            imageSource: "img/Preferences.png"}
            }//End Header Icon
            
            //Header Text            
	        Container {  
	        layout: DockLayout {}
            horizontalAlignment: HorizontalAlignment.Left        
            Label {
             text: "Preferences"
                textStyle.color: Color.White
                textStyle.fontWeight: FontWeight.Bold
                textStyle.fontSize: FontSize.XXLarge}
            }//End Header Text
        }//End Page Header
        
	    //Elements
	    Container {
	        layout: StackLayout {}
	        rightPadding: 35
	        leftPadding: 35
	        ExpandableItem {
                bottomMargin: 25
	            prefHeader: "Data To Track"
	            prefList: "models/trackData.xml"
	            expandImage: "img/plus.png";
	            collapseImage: "img/minus.png";
	            prefVisible: true
	        }
	        ExpandableItem {
                bottomMargin: 25
	            prefHeader: "Auto Reports"
	            prefList: "models/autoSummary.xml"
	            expandImage: "img/plus.png";
	            collapseImage: "img/minus.png";
	            prefVisible: false
	        }
	        ExpandableItem {
                bottomMargin: 25
	            prefHeader: "Destinations"
	            prefList: "models/destination.xml"
	            expandImage: "img/plus.png";
	            collapseImage: "img/minus.png";
	            prefVisible: false
	        }
	    }//End Elements
	}//End Background Container
}//End Page
