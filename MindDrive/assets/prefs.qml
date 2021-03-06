import bb.cascades 1.0

Page {    
    id: homeScreen
    
	//Background container        
	Container {
		objectName: "mind_template_preferences"	
			
		//Background 
		background: backgroundPainta.imagePaint            
		attachedObjects: [
		    ImagePaintDefinition {
		        id: backgroundPainta
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
			bottomMargin: 20
			preferredWidth: maxWidth			
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
        preferredHeight: 1000
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
			                prefSize: ListItemData.size
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
