import bb.cascades 1.0

Container {
    property alias prefHeader: btnHeader.text
    property alias prefList: modelSource.source
    property alias prefVisible: xmlBody.visible
    property string collapseImage
    property string expandImage
    onPrefVisibleChanged: {
        if (prefVisible) {
            btnHeader.imageSource = collapseImage;
        } else {
            btnHeader.imageSource = expandImage;
        }
    }
    
    Button {
        id: btnHeader
        text: "default header"
        preferredWidth: maxWidth
        imageSource: collapseImage
        onClicked: {
            if (prefVisible) {
                xmlBody.visible = false;
                btnHeader.imageSource = expandImage;
            } else {
                xmlBody.visible = true;
                btnHeader.imageSource = collapseImage;
            }
        }
    }
    
    ListView {
        id: xmlBody
        dataModel: XmlDataModel {
            id: modelSource
                       source: "model default"}
       //List of Components
       listItemComponents: [  
                               
	       //Component One    
	       ListItemComponent {
	           type: listItem
	           Container {
               Label { text: ListItemData.title
	                   textStyle.color: Color.create("#ff0173ff")}
	           CheckBox {
                checked: false}       
	           }
	       }//End Component One
	       
       ]//End List of Components
    }//End List View
}