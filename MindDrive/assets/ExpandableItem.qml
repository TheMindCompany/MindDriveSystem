import bb.cascades 1.0

Container {
    id: holdingContainer
    property alias prefHeader: btnText.text
    property alias prefList: modelSource.source
    property alias prefVisible: xmlBody.visible
    property alias prefSize: xmlBody.preferredHeight
    //property alias prefCheck: checkable.checkBox.checked
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
        Container {
            leftPadding: 110
            layout: DockLayout {}
            horizontalAlignment: HorizontalAlignment.Left
            verticalAlignment: VerticalAlignment.Center
            bottomPadding: 8
            Label {
		        id: btnText
		        text: "default text"
	            textStyle.color: Color.White
	            textStyle.fontSize: FontSize.XLarge
	            textStyle.fontWeight: FontWeight.Bold
	            maxWidth: maxWidth
	        }
	    }
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
	}
	
    ListView {
        id: xmlBody
        layout: StackListLayout {}
        preferredHeight: {"source size"}
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
	               leftPadding: 40
	               rightPadding: 40
	               topPadding: 25
	               bottomMargin: 25
		           Container {
		               id: checkable
		               layout: DockLayout {}
		               horizontalAlignment: HorizontalAlignment.Right
	                    CheckBox {
	                    checked: true}
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
               type: "listItemMultiField"               
               id: componentTwo 
   	           Container {
   	               layout: StackLayout {}
   	               preferredWidth: maxWidth
   	               leftPadding: 40
   	               rightPadding: 40
   	               bottomMargin: 25
   	               topPadding: 25   
   	               //Begining Check Control           
		           Container {		               
		               layout: DockLayout {}
		               preferredWidth: maxWidth		
	   	               bottomMargin: 25  
		                Container {
		                    layout: DockLayout {}
   	                        preferredWidth: maxWidth		
	                        horizontalAlignment: HorizontalAlignment.Left
		                    Label { 
		                        text: ListItemData.title
		                        textStyle.color: Color.White
		                        textStyle.fontSize: FontSize.Large
		                        textStyle.fontWeight: FontWeight.Bold}
		                }
    		           Container {
    			               layout: DockLayout {}
    			               horizontalAlignment: HorizontalAlignment.Right
    		                   CheckBox {
    			                    id: checkParent
    			                    checked:{ 
    			                        if (((checkChildOne.checked == false) && (checkChildTwo.checked == false)) == true){ 
    			                            return false; 
    			                        } else {
    			                            return true;
    			                        }
    			                    } 
    		                    }//End Checkbox
    		                }
	                }//End Begining Check Control
	                
	                //Check Control Delegates
	                Container {
	                   layout: StackLayout {}	                    
		               visible: {		                   
		                   if (checkParent.checked == true) {
		                       true; 
		                       checkChildOne.checked = true; 
		                       checkChildTwo.checked = true;
		                   } else {
		                       false;
		                   }
		               }
	               Container {  
	  	               preferredWidth: maxWidth
	  	               leftPadding: 40
	  	               //rightPadding: 50
	  	               bottomMargin: 25
		  	           topMargin: 25
		  	           layout: StackLayout {}  
		  	           visible: {
		  	             if (checkBox.checked == true) {
		  	                     true; 
		  	                 }else {
		  	                     false;
		  	                 }
		  	           }
		  	           TextField {
                           enabled: true
                           hintText: "your@email.com"}
	               }
	   		           Container {
			               layout: DockLayout {}
			               preferredWidth: maxWidth
		   	               leftPadding: 40
		   	               bottomMargin: 25
		   	               topPadding: 25   
	   		               Container {
		                       layout: DockLayout {}
		   		               horizontalAlignment: HorizontalAlignment.Right
		   	                    CheckBox {
		   	                        id: checkChildOne
		   	                        checked: true}
		   	                }
		   	                Container {
		   	                    layout: DockLayout {}
		                        horizontalAlignment: HorizontalAlignment.Left
		   	                    Label { text: ListItemData.titleTwo
		   	                        textStyle.color: Color.White
		   	                        textStyle.fontSize: FontSize.Large
		   	                        textStyle.fontWeight: FontWeight.Normal}
		   	                }
	   	                }//End Delegate One
	   		           Container {
			               layout: DockLayout {}
			               preferredWidth: maxWidth
		   	               leftPadding: 40
		   	               bottomMargin: 25
		   	               topPadding: 25   	         	
	   		               Container {
		                       layout: DockLayout {}
		   		               horizontalAlignment: HorizontalAlignment.Right
		   	                    CheckBox {
		   	                        id: checkChildTwo
		   	                        checked: true}
		   	                }
		   	                Container {
		   	                    layout: DockLayout {}
		                           horizontalAlignment: HorizontalAlignment.Left
		   	                    Label { text: ListItemData.titleThree
		   	                        textStyle.color: Color.White
		   	                        textStyle.fontSize: FontSize.Large
		   	                        textStyle.fontWeight: FontWeight.Normal}
		   	                }
	   	                }//End Delegate Two
	   	            }//End Delegates
	   	        }//End Holding Container
           },

	       ListItemComponent {
               type: "listItemMultiCheck"               
               id: componentTwo2 
   	           Container {
   	               layout: StackLayout {}
   	               preferredWidth: maxWidth
   	               leftPadding: 40
   	               rightPadding: 40
   	               bottomMargin: 25
   	               topPadding: 25   
   	               //Begining Check Control           
		           Container {		               
		               layout: DockLayout {}
		               preferredWidth: maxWidth		
	   	               bottomMargin: 25  
		                Container {
		                    layout: DockLayout {}
   	                        preferredWidth: maxWidth		
	                        horizontalAlignment: HorizontalAlignment.Left
		                    Label { 
		                        text: ListItemData.title
		                        textStyle.color: Color.White
		                        textStyle.fontSize: FontSize.Large
		                        textStyle.fontWeight: FontWeight.Bold}
		                }
    		           Container {
    			               layout: DockLayout {}
    			               horizontalAlignment: HorizontalAlignment.Right
    		                   CheckBox {
    			                    id: checkParent2
    			                    checked:{ 
    			                        if (((checkChildOne2.checked == false) && (checkChildTwo2.checked == false)) == true){ 
    			                            return false; 
    			                        } else {
    			                            return true;
    			                        }
    			                    } 
    		                    }//End Checkbox
    		                }
	                }//End Begining Check Control
	                
	                //Check Control Delegates
	                Container {
	                   layout: StackLayout {}	                    
		               visible: {		                   
		                   if (checkParent2.checked == true) {
		                       true; 
		                       checkChildOne2.checked = true; 
		                       checkChildTwo2.checked = true;
		                   } else {
		                       false;
		                   }
		               }
	   		           Container {
			               layout: DockLayout {}
			               preferredWidth: maxWidth
		   	               leftPadding: 40
		   	               bottomMargin: 25
		   	               topPadding: 25   
	   		               Container {
		                       layout: DockLayout {}
		   		               horizontalAlignment: HorizontalAlignment.Right
		   	                    CheckBox {
		   	                        id: checkChildOne2
		   	                        checked: true}
		   	                }
		   	                Container {
		   	                    layout: DockLayout {}
		                        horizontalAlignment: HorizontalAlignment.Left
		   	                    Label { text: ListItemData.titleTwo
		   	                        textStyle.color: Color.White
		   	                        textStyle.fontSize: FontSize.Large
		   	                        textStyle.fontWeight: FontWeight.Normal}
		   	                }
	   	                }//End Delegate One
	   		           Container {
			               layout: DockLayout {}
			               preferredWidth: maxWidth
		   	               leftPadding: 40
		   	               bottomMargin: 25
		   	               topPadding: 25   	         	
	   		               Container {
		                       layout: DockLayout {}
		   		               horizontalAlignment: HorizontalAlignment.Right
		   	                    CheckBox {
		   	                        id: checkChildTwo2
		   	                        checked: true}
		   	                }
		   	                Container {
		   	                    layout: DockLayout {}
		                           horizontalAlignment: HorizontalAlignment.Left
		   	                    Label { text: ListItemData.titleThree
		   	                        textStyle.color: Color.White
		   	                        textStyle.fontSize: FontSize.Large
		   	                        textStyle.fontWeight: FontWeight.Normal}
		   	                }
	   	                }//End Delegate Two
	   	            }//End Delegates
	   	        }//End Holding Container
           },//End Component Two           
           //Compontent Three
           ListItemComponent {               
               type: "listItemTimeInterval"
               Container {       
  	               preferredWidth: maxWidth
  	               leftPadding: 40
  	               rightPadding: 40
  	               bottomMargin: 25
  	               topMargin: 45   
      	           Container {
      	               layout: DockLayout {}                      
                       preferredWidth: maxWidth
      		           Container {
      		               layout: DockLayout {}
      		               horizontalAlignment: HorizontalAlignment.Right
      	                    CheckBox {
      	                        id: checkBoxCheck
      	                    checked: true}
      	                }
      	                Container {
      	                    layout: DockLayout {}
                              horizontalAlignment: HorizontalAlignment.Left
      	                    Label { text: ListItemData.title
      	                        textStyle.color: Color.White
      	                        textStyle.fontSize: FontSize.Large
      	                        textStyle.fontWeight: FontWeight.Bold
                            }
      	                }
      	            }
      	           //If the above is not checked the following is visible: false 
	               Container {  
	  	               preferredWidth: maxWidth
	  	               leftPadding: 50
	  	               rightPadding: 50
	  	               bottomMargin: 25
		  	           topMargin: 25
		  	           layout: StackLayout {}  
		  	           visible: {
		  	             if (checkBoxCheck.checked == true) {
		  	                     true; 
		  	                 } else {
		  	                     false;
		  	                 }
		  	           }
	   	               DateTimePicker {                              
	   	                   title: ListItemData.timePicker
	   	                   value: dateFromTime()
	   	               }
	   	               Container {
                           leftPadding: 80       
       	  	               bottomMargin: 25
       		  	           topMargin: 25
			  	           DropDown {
			  	               title: ListItemData.intervalPicker 
			  	               enabled: true		  	               
				  	            //temp option for test - will be dynamic   
			                    Option {
				                          text: "1 Day"
				                          value: "1"}
		                    }
	                    }
	               }
	           }
	       },//End Component Three           
	           
	       //Compontent Four
           ListItemComponent {               
               type: "listItemEmail"
               Container {       
  	               preferredWidth: maxWidth
  	               leftPadding: 40
  	               rightPadding: 40
  	               bottomMargin: 25
  	               topMargin: 45   
      	           Container {
      	               layout: DockLayout {}                      
                       preferredWidth: maxWidth
      		           Container {
      		               layout: DockLayout {}
      		               horizontalAlignment: HorizontalAlignment.Right
      	                    CheckBox {
      	                        id: checkBox
      	                    checked: true}
      	                }
      	                Container {
      	                    layout: DockLayout {}
                              horizontalAlignment: HorizontalAlignment.Left
      	                    Label { text: ListItemData.title
      	                        textStyle.color: Color.White
      	                        textStyle.fontSize: FontSize.Large
      	                        textStyle.fontWeight: FontWeight.Bold
                            }
      	                }
      	            }
      	           //If the above is not checked the following is visible: false 
	               Container {  
	  	               preferredWidth: maxWidth
	  	               leftPadding: 40
	  	               //rightPadding: 40
	  	               bottomMargin: 25
		  	           topMargin: 25
		  	           layout: StackLayout {}  
		  	           visible: {
		  	             if (checkBox.checked == true) {
		  	                     true; 
		  	                 }else {
		  	                     false;
		  	                 }
		  	           }
		  	           TextField {
                           enabled: true
                           hintText: "your@email.com"}
	               }
	           }
	       },//End Component Three           
	           	           
           //Compontent Four
           ListItemComponent {               
              type: "listItemPhone"
              Container {       
 	               preferredWidth: maxWidth
 	               leftPadding: 40
 	               rightPadding: 40
 	               bottomMargin: 25
 	               topMargin: 45   
     	           Container {
     	              layout: DockLayout {}                      
                      preferredWidth: maxWidth
     		           Container {
     		               layout: DockLayout {}
     		               horizontalAlignment: HorizontalAlignment.Right
     	                    CheckBox {
     	                        id: checkBoxTwo
     	                    checked: true}
     	                }
     	                Container {
     	                    layout: DockLayout {}
                             horizontalAlignment: HorizontalAlignment.Left
     	                    Label { text: ListItemData.title
     	                        textStyle.color: Color.White
     	                        textStyle.fontSize: FontSize.Large
     	                        textStyle.fontWeight: FontWeight.Bold
                           }
     	                }
     	            }
     	       //If the above is not checked the following is visible: false 
               Container {  
                   id:smsNumber
  	               preferredWidth: maxWidth
  	               leftPadding: 40
  	               //rightPadding: 50
  	               bottomMargin: 25
	  	           topMargin: 25
	  	           layout: StackLayout {
                            orientation: LayoutOrientation.LeftToRight
                        }  
	  	           visible: {
	  	             if (checkBoxTwo.checked == true) {
	  	                     true; 
	  	                 }else {
	  	                     false;
	  	                 }}
	  	           TextField {
	  	               id: areaCode
	  	               hintText: "   "
	  	                   maxWidth: 160
                          enabled: true    
                      }
	  	           TextField {
	  	               id: prefixCode
	  	           	      hintText: "   "
	  	           	  	  maxWidth: 160
                          enabled: true    
                      }
	  	           TextField {	 
	  	               id: locationCode      
	  	           	  	  hintText: "    "        
	  	                  maxWidth: 300
                          enabled: true    
                      }
               }
           }//End Component Four
	     }
           
       ]//End List of Components
    }//End List View
}