import bb.cascades 1.0

Page {    
    id: homeScreen
    
//Background container        
Container {
	objectName: "mind_template_reports"
	topPadding: 200
	
	//Background 
	background: backgroundPaint.imagePaint            
	attachedObjects: [
	    ImagePaintDefinition {
	        id: backgroundPaint
	        imageSource: "asset:///img/editingBG.png"
	        repeatPattern: RepeatPattern.XY
	    }
	]//End Background
        
    //Elements
    Container {

    }//End Elements
}//End Background Container
}//End Page