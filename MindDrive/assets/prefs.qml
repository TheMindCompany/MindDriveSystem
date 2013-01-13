import bb.cascades 1.0

Page {    
    id: homeScreen
    
//Background container        
Container {
	objectName: "mind_template_preferences"
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

   Container {
       layout: StackLayout {}
       ExpandableItem {
           headerText: "Data To Track"
           bodyText: "asset:///models/trackData.xml"
           expandImage: "asset:///img/plus.png";
           collapseImage: "asset:///img/minus.png";
           bodyVisible: false
       }
       ExpandableItem {
           headerText: "Auto Reports"
           bodyText: "asset:///models/trackData.xml"
           expandImage: "asset:///img/plus.png";
           collapseImage: "asset:///img/minus.png";
           bodyVisible: true
       }
   }
}//End Background Container
}//End Page