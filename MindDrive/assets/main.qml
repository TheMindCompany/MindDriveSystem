// Default empty project template
import bb.cascades 1.0
NavigationPane {
    id: navigationPane
// creates one page with a label
Page {
    
        id: homeScreen
        
        Container {
            layout: StackLayout {}
            horizontalAlignment:HorizontalAlignment.Center
            objectName: "mind_template"
            topPadding: 200
            // A paper-style image is used to tile the background.
            background: backgroundPaint.imagePaint
            
            attachedObjects: [
                ImagePaintDefinition {
                    id: backgroundPaint
                    imageSource: "asset:///img/mainBG.png"
                    repeatPattern: RepeatPattern.Fill
                }
            ]
                       
            ImageView {
                objectName: "mindDrive"
                
                imageSource: "asset:///img/mindDrive.png"
            }
                
            Container {
                id: mainNavButtons
                topMargin: 100
            layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }	
	            horizontalAlignment:HorizontalAlignment.Center
                ImageButton {
                objectName: "Report"
                defaultImageSource: "asset:///img/buildReport.png" 
                onClicked: {
                        // show detail page when the button is clicked
                        var page = getReportPage();
                        console.debug("pushing detail " + page)
                        navigationPane.push(page);
                }                
                
                property Page reportPage
                function getReportPage() {
                    if (! reportPage) {
                        reportPage = reportPageDefinition.createObject();}
                        return reportPage;}
                        
                        attachedObjects: [
                        ComponentDefinition {
                        id: reportPageDefinition
                        source: "report.qml"}]
                }   
                
            
            ImageButton {
                objectName: "Link"
                defaultImageSource: "asset:///img/linkCar.png"
                onClicked: {
                    // show detail page when the button is clicked
                    var page = getLinkCarPage();
                    console.debug("pushing detail " + page)
                    navigationPane.push(page);
            }                
            
            property Page linkCarPage
            function getLinkCarPage() {
                if (! linkCarPage) {
                    linkCarPage = linkCarPageDefinition.createObject();}
                    return linkCarPage;}
                    
                    attachedObjects: [
                    ComponentDefinition {
                    id: linkCarPageDefinition
                    source: "linkCar.qml"}]
            }
    }
    
    Container {
                layout: StackLayout {
                        orientation: LayoutOrientation.LeftToRight
                    }	
                    
    	            horizontalAlignment:HorizontalAlignment.Right
    	            verticalAlignment: VerticalAlignment.Bottom
    	                        topPadding: 200
                ImageButton {
                    objectName: "Preferences" 
                    defaultImageSource: "asset:///img/Preferences.png"
                    bottomMargin: 10
                    rightMargin: 30
                    onClicked: {
                    // show detail page when the button is clicked
                    var page = getPreferencePage();
                    console.debug("pushing detail " + page)
                    navigationPane.push(page);}                
            
            property Page prefPage
            function getPreferencePage() {
                if (! prefPage) {
                    prefPage = prefPageDefinition.createObject();}
                    return prefPage;}
                    
                    attachedObjects: [
                    ComponentDefinition {
                    id: prefPageDefinition
                    source: "prefs.qml"}]                    
                }
            }
                
        onCreationCompleted: {
            // this slot is called when declarative scene is created
            // write post creation initialization here
            console.log("NavigationPane - onCreationCompleted()");
}
    }}}