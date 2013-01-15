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
			leftPadding: 25
			rightPadding: 25
			topPadding: 25
			bottomMargin: 40
			preferredWidth: 700			
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
    ListView {
        id: xmlBody
        dataModel: XmlDataModel {
            id: modelSource
                       source: "models/prefList.xml"}
	       //List of Components
	       listItemComponents: [  
	                               
		       //Component One    
		       ListItemComponent {
		           type: "listItem"
		           Container {
		               layout: DockLayout {}
		               leftPadding: 20
		               rightPadding: 20
		               topPadding: 25
		               bottomMargin: 25
				        ExpandableItem {
			                bottomMargin: 25
				            prefHeader: ListItemData.title
				            prefList: ListItemData.location
				            prefVisible: ListItemData.visable
				        }
				    }
				}
	      ]
	    }//End Elements
	}//End Background Container
}//End Page
