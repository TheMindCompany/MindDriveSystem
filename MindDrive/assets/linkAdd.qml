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
        Container {
	        bottomPadding: 30
	        Label {
	            text: "Vehicle Name"
                textStyle.fontWeight: FontWeight.Bold
                textStyle.fontSize: FontSize.XLarge
                textStyle.color: Color.White
	            } 
	        Container { 
	            leftPadding: 50
	            rightPadding: 50
				TextField {
				    hintText: ""
				}
			}
        }  
        Container {
            bottomPadding: 30
	        Label {
	            text: "Vehicle Type"
                textStyle.fontWeight: FontWeight.Bold
                textStyle.fontSize: FontSize.XLarge
                textStyle.color: Color.White
	            }  
	        Container {
	            leftPadding: 50
	            rightPadding: 50   
	            bottomPadding: 30
		        DropDown {
	                 title: "Make"
	                 Option {
	                     text: "GMC"
	                     value: "GMC"
	                 }
	                  Option {
	                      text: "Chevorlet"
	                      value: "CHEVY"
	                  }
	             }
	             DropDown {
	                 title: "Model"
	                  Option {
	                      text: "Sierra"
	                      value: "Sierra"
	                  }
	             }
             }
             Container {
                 Label {
                     text: "Connected Vehicle"
                        textStyle.fontWeight: FontWeight.Bold
                        textStyle.fontSize: FontSize.XLarge
                        textStyle.color: Color.White
                    }
                 Container {
                     preferredWidth: maxWidth
                     leftPadding: 50
                     rightPadding: 50
	                 Button {
	                     text: "Connect"
	                     preferredWidth: maxWidth
	                 }
                 }
             }
             Container {
                 layout: DockLayout {}
                horizontalAlignment: HorizontalAlignment.Center
                topPadding: 100
                bottomPadding: 100
                Button {
                     text: "Add"
                 }
             }
        } 
    }//End Elements
}//End Background Container
}//End Page