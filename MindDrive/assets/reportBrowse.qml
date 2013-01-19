import bb.cascades 1.0

Page {    
    id: homeScreen
    
//Background container        
Container {
	objectName: "mind_template_reports"
	
	//Background 
	background: backgroundPaint.imagePaint            
	attachedObjects: [
	    ImagePaintDefinition {
	        id: backgroundPaint
	        imageSource: "asset:///img/editingBG.png"
	        repeatPattern: RepeatPattern.XY
	    }
	]//End Background		
	
	//Page Header
		Container {
			layout: DockLayout {}
			preferredWidth: maxWidth
			leftPadding: 25
			rightPadding: 90
			topPadding: 25
			bottomMargin: 40			
			//Header Icon 
            Container { 
                layout: DockLayout {}
                horizontalAlignment: HorizontalAlignment.Right          
    	        ImageView {
    	            objectName: "mindDriveReport"                
    	            imageSource: "img/reportsHeader.png"}
            }//End Header Icon
            
            //Header Text            
	        Container {  
	        layout: DockLayout {}
            horizontalAlignment: HorizontalAlignment.Left        
            Label {
             text: "Browse Reports"
                textStyle.color: Color.White
                textStyle.fontWeight: FontWeight.Bold
                textStyle.fontSize: FontSize.XXLarge}
            }//End Header Text
        }//End Page Header
    //Elements
    Container {
            //Currently Connected List
            ListView {
                id: xmlBody
                preferredHeight: 800
                dataModel: XmlDataModel {
                    id: modelSource
                               source: "models/testReports.xml"}
        	       //List of Components
        	       listItemComponents: [  
        	                               
        		       //Component One    
        		       ListItemComponent {
        		           type: "listItem"
        		           Container {
        		               }
        		       }
        		   ]
        	}//End Currently Connected List
        	Container {
        	    layout: DockLayout {}
        	    horizontalAlignment: HorizontalAlignment.Center
             Button {
                 text: "Open"
             }
         }
    }//End Elements
}//End Background Container
}//End Page