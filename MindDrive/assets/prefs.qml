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
		        imageSource: "img/editingBG.png"
		        repeatPattern: RepeatPattern.XY
		    }
		]//End Background
	        
	    //Elements
	    Container {
	        ExpandableItem {
	            prefHeader: "Data To Track"
	            prefList: "models/trackData.xml"
	            expandImage: "img/plus.png";
	            collapseImage: "img/minus.png";
	            prefVisible: false
	        }
	        ExpandableItem {
	            prefHeader: "Auto Reports"
	            prefList: "models/trackData.xml"
	            expandImage: "img/plus.png";
	            collapseImage: "img/minus.png";
	            prefVisible: true
	        }
	    }//End Elements
	}//End Background Container
}//End Page
