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
	           type: "listItem"
	           Container {
	               layout: DockLayout {}
	               preferredWidth: maxWidth
	               leftPadding: 20
	               rightPadding: 20
	               topPadding: 25
	               bottomMargin: 25
		           Container {
		               layout: DockLayout {}
		               horizontalAlignment: HorizontalAlignment.Right
	                    CheckBox {
	                    checked: false}
	                }
	                Container {
	                    layout: DockLayout {}
                        horizontalAlignment: HorizontalAlignment.Left
	                    Label { text: ListItemData.title
	                        textStyle.color: Color.White
	                        textStyle.fontSize: FontSize.Large
	                        textStyle.fontWeight: FontWeight.Bold}
	                }
                }
	       },//End Component One
	       
	       //Component Two
	      ListItemComponent {
               type: "listItemSub"
               	           Container {
               	               layout: DockLayout {}
               	               preferredWidth: maxWidth
               	               leftPadding: 80
               	               rightPadding: 20
               	               bottomMargin: 25
               	               topPadding: 25
               		           Container {
               		               layout: DockLayout {}
               		               horizontalAlignment: HorizontalAlignment.Right
               	                    CheckBox {
               	                    checked: false}
               	                }
               	                Container {
               	                    layout: DockLayout {}
                                       horizontalAlignment: HorizontalAlignment.Left
               	                    Label { text: ListItemData.title
               	                        textStyle.color: Color.White
               	                        textStyle.fontSize: FontSize.Large
               	                        textStyle.fontWeight: FontWeight.Normal
                                    }
               	                }
               	            }
           },//End Component Two
           
           //Compontent Three
           ListItemComponent {
               type: "listItemDate"
               Container {                                        
  	               preferredWidth: maxWidth
  	               leftPadding: 30
  	               rightPadding: 30
  	               bottomMargin: 25
  	               topPadding: 25   
	               DateTimePicker {            
	                   title: "Starting Date"
	                   value: dateFromTime()
	               }
               }
           }
       ]//End List of Components
    }//End List View
}