import bb.cascades 1.0

Container {
    property alias prefHeader: btnText.text
    property alias prefList: modelSource.source
    property alias prefVisible: xmlBody.visible
    onPrefVisibleChanged: {
        if (prefVisible) {//when true have minus show
            btnHeader.defaultImageSource = "img/minus.png";
            btnHeader.pressedImageSource = "img/plus.png";
        } else {
            btnHeader.pressedImageSource = "img/minus.png";
            btnHeader.defaultImageSource = "img/plus.png";
            
        }
    }
    Container {
        layout: DockLayout {}
        verticalAlignment: VerticalAlignment.Center
        overlapTouchPolicy: OverlapTouchPolicy.Allow
        ImageButton { 
                id: btnHeader       
	        defaultImageSource: {
	             if (prefVisible) {
	                     defaultImageSource: "img/minus.png"
	                 } else {
	                     defaultImageSource: "img/plus.png"}
	            }
	        
	        onClicked: {
	            if (prefVisible) {
	                xmlBody.visible = false;
	                btnHeader.pressedImageSource = "img/minus.png";
	                btnHeader.defaultImageSource = "img/plus.png";
	            } else {
	                xmlBody.visible = true;
	                btnHeader.defaultImageSource = "img/minus.png";
	                btnHeader.pressedImageSource = "img/plus.png";
	            }
	        }
        }//End Image Button
        
        Container {
            leftPadding: 110
            layout: DockLayout {
                        
                    }
                    horizontalAlignment: HorizontalAlignment.Left
            verticalAlignment: VerticalAlignment.Center
            bottomPadding: 8.0
            Label {
		        id: btnText
		        text: "default text"
	            textStyle.color: Color.White
	            textStyle.fontSize: FontSize.XLarge
	            textStyle.fontWeight: FontWeight.Bold
	            maxWidth: maxWidth
	        }
	    }
	}
	
    ListView {
        id: xmlBody 
        
                preferredHeight: 900
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
           },//End Component Three
           
           //Compontent Four
           ListItemComponent {
               type: "listItemDrop"
               Container {                                        
  	               preferredWidth: maxWidth
  	               leftPadding: 80
  	               rightPadding: 30
  	               bottomMargin: 25
	  	           topPadding: 25   
	  	           DropDown {
	  	               title: "Interval" 
	  	               enabled: true
	  	               
	  	            //temp option for test - will be dynamic   
                    Option {
	                          text: "1 Day"
	                          value: "1"                                   
                    }
                }
               }
           }//End Component Four
           
       ]//End List of Components
    }//End List View
}