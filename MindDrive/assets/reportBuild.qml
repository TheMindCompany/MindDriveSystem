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
			rightPadding: 150
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
             text: "Build a Report"
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
        topPadding: 25
        bottomPadding: 25
        Container {
	        Container {
	            Container {
	    	            
    	           visible: {
    	           if (checkTrip.checked == true){false;}else{true;}
    	           }
	                Container {
	                    leftPadding: 15
	                    rightPadding: 15
	                    bottomPadding: 25
	                    layout: DockLayout {}
	                    preferredWidth: maxWidth
                     Container {
                         horizontalAlignment: HorizontalAlignment.Left
                         Label {
                             text: "Time Interval"
                                    textStyle.fontStyle: FontStyle.Normal
                                    textStyle.fontWeight: FontWeight.Bold
                                    textStyle.fontSize: FontSize.XLarge
                                    textStyle.color: Color.White}
                     }
                     Container {
                         horizontalAlignment: HorizontalAlignment.Right
                         CheckBox {
                             id: checkInterval
                             checked: false}
                     }
                 }//End On & Off control
	            Container {		                
	                leftPadding: 60
	                rightPadding: 60
	                visible: {
	                    if (checkInterval.checked == true){
	                            true;		                        
	                        }else{
	                            false;
	                        }
	                    }
			        DateTimePicker {
		                topMargin: 25
		                bottomMargin: 25
			            title: "Starting Date"}
			        DateTimePicker {
		                topMargin: 25
		                bottomMargin: 25
			            title: "Ending Date"
			            value: dateFromTime()}
		        }//End Start & End Selection
		       }//EndTime Interval
		       
	            Container {
		           visible: {
		           if (checkInterval.checked == true){false;}else{true;}
		           }
	                Container {
	                    leftPadding: 15
	                    rightPadding: 15
	                    bottomPadding: 60
	                    topPadding: 60
	                    layout: DockLayout {}
	                    preferredWidth: maxWidth
	                     Container {
	                         horizontalAlignment: HorizontalAlignment.Left
	                         Label {
	                             text: "Specific Drive Trip"
	                                    textStyle.fontStyle: FontStyle.Normal
	                                    textStyle.fontWeight: FontWeight.Bold
	                                    textStyle.fontSize: FontSize.XLarge
	                                    textStyle.color: Color.White}
	                     }
	                     Container {
	                         horizontalAlignment: HorizontalAlignment.Right
	                         CheckBox {
	                             id: checkTrip
	                             checked: false}
                          }
                      }//End On ff Container
                      Container {
                          visible: {
                              if (checkTrip.checked == true) {
                                  true;
                              } else {
                                  false;
                              }
                          }
                          ListView {
                              preferredHeight: 600
                          }
                      }//End Trip List
                  }// End Specific Drive Trip

			      Container {
			            layout: DockLayout {}
			            horizontalAlignment: HorizontalAlignment.Center
			            visible: {
			                if (checkInterval.checked == true){true;} else if  (checkTrip.checked == true) {true;} else {false;}
			                }
			            topPadding: 90
			            bottomPadding: 25
				        Button {
				            horizontalAlignment: HorizontalAlignment.Center
				            text: "Generate"}
			       }//End Generate Button
         }
	       
        }
    }//End Elements
}//End Background Container
}//End Page