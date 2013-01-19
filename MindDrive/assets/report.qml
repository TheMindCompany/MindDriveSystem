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
			rightPadding: 350
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
             text: "Reports"
                textStyle.color: Color.White
                textStyle.fontWeight: FontWeight.Bold
                textStyle.fontSize: FontSize.XXLarge}
            }//End Header Text
        }//End Page Header
    //Elements
    Container {
        layout: StackLayout {}
        leftPadding: 25
        rightPadding: 25
        topPadding: 300
        bottomPadding: 25
        preferredHeight: maxHeight
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
            Container {
                horizontalAlignment: HorizontalAlignment.Center
                Button {
                text: "Build Report"
                    horizontalAlignment: HorizontalAlignment.Center
                    verticalAlignment: VerticalAlignment.Center
                  onClicked: {
		                // show detail page when the button is clicked
		                var page = getReportPage();
		                console.debug("pushing detail " + page)
		                navigationPane.push(page);}                
		        property Page reportPage
		        function getReportPage() {
		            if (! reportPage) {
		                reportPage = reportPageDefinition.createObject();}
		                return reportPage;}
		                
		                attachedObjects: [
		                ComponentDefinition {
		                id: reportPageDefinition
		                source: "reportBuild.qml"}]
                }
	            Button {
	                text: "Browse Reports"
                    horizontalAlignment: HorizontalAlignment.Center
                    verticalAlignment: VerticalAlignment.Center
                  onClicked: {
		                // show detail page when the button is clicked
		                var page = getReportBrowsePage();
		                console.debug("pushing detail " + page)
		                navigationPane.push(page);}                
		        property Page reportBrowsePage
		        function getReportBrowsePage() {
		            if (! reportBrowsePage) {
		                reportBrowsePage = reportBrowsePageDefinition.createObject();}
		                return reportBrowsePage;}
		                
		                attachedObjects: [
		                ComponentDefinition {
		                id: reportBrowsePageDefinition
		                source: "reportBrowse.qml"}]
                }

         }
    }//End Elements
}//End Background Container
}//End Page