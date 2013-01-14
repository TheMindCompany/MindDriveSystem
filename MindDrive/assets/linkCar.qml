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
		rightPadding: 25
		topPadding: 25
		bottomMargin: 40
		
		//Header Icon 
        Container { 
            layout: DockLayout {}
            horizontalAlignment: HorizontalAlignment.Right          
	        ImageView {
	            objectName: "mindDriveCarLink"                
	            imageSource: "img/linkCar.png"}
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
        
    }//End Elements
}//End Background Container
}//End Page