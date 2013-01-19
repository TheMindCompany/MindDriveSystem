import bb.cascades 1.0

Page {    
    id: homeScreen
    
//Background container        
Container {
	objectName: "mind_template_linkCar"
	
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
		rightPadding: 180
		topPadding: 25
		bottomMargin: 40
		
		//Header Icon 
        Container { 
            layout: DockLayout {}
            horizontalAlignment: HorizontalAlignment.Right          
	        ImageView {
	            objectName: "mindDriveCarLink"                
	            imageSource: "img/linkedHeader.png"}
        }//End Header Icon
        
        //Header Text            
        Container {  
        layout: DockLayout {}
        horizontalAlignment: HorizontalAlignment.Left        
        Label {
         text: "Link Vehicles"
            textStyle.color: Color.White
            textStyle.fontWeight: FontWeight.Bold
            textStyle.fontSize: FontSize.XXLarge}
        }//End Header Text
    }//End Page Header
    //Elements
    Container {
        leftPadding: 35
        rightPadding: 35
        preferredWidth: maxWidth
        Label {
            text: "Linked Vehicles"
                textStyle.fontWeight: FontWeight.Bold
                textStyle.fontSize: FontSize.XLarge
                textStyle.color: Color.White
            }
            //Currently Connected List
            ListView {
                id: xmlBody
                preferredHeight: maxHeight
                preferredWidth: maxWidth
                dataModel: XmlDataModel {
                    id: modelSource
                               source: "models/testConnected.xml"}
                   
        	       //List of Components
        	       listItemComponents: [  
        	                               
        		       //Component One    
        		       ListItemComponent {
        		           type: "listItem"
        		           
        		           Container {
        		               preferredWidth: maxWidth
                	            leftPadding: 25
                	            rightPadding: 25
                	            Container {
                	                layout: DockLayout {
                                             
                                         }
	                	        //Maker Icon           
	                	        ImageView {
	                	            id: makerIcon
	                	            
	                	            function chooseIcon (makeID){
	                	                if (ListItemData.make == "GMC") {
	                	                    return "img/gmc.png";
	                	                } else if (ListItemData.make == "CHEVY") {                	                
	                	                    return "img/chevy.png";
	                	                }
	                	            }              
	                	            imageSource: chooseIcon(ListItemData.make)
                                    verticalAlignment: VerticalAlignment.Center
                                }//End Maker Icon
	                	        Container {
	                	            preferredWidth: maxWidth
		            	            leftPadding: 180
		            	            rightPadding: 25
                                    verticalAlignment: VerticalAlignment.Center
                                    Container {  
			                            Label {
			                                 text: ListItemData.title
		                                    textStyle.color: Color.White
		                                    textStyle.fontWeight: FontWeight.Bold
		                                    textStyle.fontSize: FontSize.Large
	                                    }
	                                }
	                    	        Container {
			                             Label {			                                 
			                                 text: ListItemData.model
		                                    textStyle.color: Color.White
		                                    textStyle.fontSize: FontSize.XXSmall
	                                    }
	                                }
	                            }
	                            Container {
	                                verticalAlignment: VerticalAlignment.Center
	                                horizontalAlignment: HorizontalAlignment.Right
	                                CheckBox {
	                                    checked: ListItemData.active
		                            }
	                            }
                             }
                         }
        		       }
        		   ]
        	}//End Currently Connected List
        	Container {
        	    layout: DockLayout {}
        	    horizontalAlignment: HorizontalAlignment.Center
        	    bottomPadding: 100
	             Button {
	                 text: "Add Vehicle"
			        onClicked: {
		                var page = getLinkAddPage();
		                console.debug("pushing detail " + page)
		                navigationPane.push(page);}                
			        property Page linkAddPage
			        function getLinkAddPage() {
			            if (! linkAddPage) {
			                linkAddPage = linkAddPageDefinition.createObject();}
			                return linkAddPage;}
			                
			                attachedObjects: [
			                ComponentDefinition {
			                id: linkAddPageDefinition
			                source: "linkAdd.qml"}]	 
	             }
         }
        
    }//End Elements
}//End Background Container
}//End Page