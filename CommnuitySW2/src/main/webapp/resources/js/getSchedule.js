function getScheduleInfo(doc,start,end){
		var frmPop = document.frmPopup;
  		var option = "width=600, height=600, left=100, top=50, location=no";
  		var url = "./schedulePopup";
  	    window.open('','popupView',option);   
  	     
  	    frmPop.action = url; 
  	    frmPop.target = 'popupView'; //window,open()의 두번째 인수와 같아야 하며 필수다.   
  	    frmPop.arg1.value = JSON.stringify(doc);
  	    frmPop.arg2.value = start;
  	  	frmPop.arg3.value = end;
  	  
  	    frmPop.submit();
	};
	
function getSchedule(doc,start,end){
		var frmPop = document.frmPopup;
  		var option = "width=400, height=200, left=500, top=200, location=no";
  		var url = "./scheduleShare";
  	    window.open('','popupView',option);   
  	     
  	    frmPop.action = url; 
  	    frmPop.target = 'popupView'; //window,open()의 두번째 인수와 같아야 하며 필수다.   
  	    frmPop.arg3.value = JSON.stringify(doc);
  	    frmPop.arg4.value = start;
  	  	frmPop.arg5.value = end;
  	  
  	    frmPop.submit();
	};
