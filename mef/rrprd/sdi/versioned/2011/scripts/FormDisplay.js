//=========================================================
// File Name:  FormDisplay.js
//=========================================================
// History:
//
// 7/18/2005 Edited by Charles Moore - updated IMAGEPATH and HTMLPATH for Release 3.2
//=========================================================

//=========================================================
//
// Global Variables
//
//=========================================================

var IMAGEPATH = "/mef/rrprd/common/images/";
var HTMLPATH = "/mef/rrprd/common/htmls/";


//=========================================================
// Script Name:  toggle()
//=========================================================
// Description:  This script allows the user to switch between viewing a table in contracted form (with scroll bars)
//  or expanded form (all rows displayed on the page)
//=========================================================
// Browsers Supported:  IE 5.x, IE 5.5, IE 6.x
// Browser Tested:  IE 5.5, IE 6.0
//=========================================================
// Pararmeters:
//     containerId - the ID of the div that wraps around the table
//     imageId -  the ID of the expand/contract button image - used to track status of table (ie track
//    whether table is expanded or contracted)
//     buttonId - ID of the expand/contract button
//=========================================================

// Preload table container toggle button images
var expandImg = new Image();
expandImg.src = IMAGEPATH + "expand.gif";
var collapseImg = new Image();
collapseImg.src = IMAGEPATH + "collapse.gif";

function toggle( containerId, imageId, buttonId )
  {
   // initialize variables.
   var container = document.getElementById( containerId );
   var image = document.getElementById( imageId );
   var button = document.getElementById( buttonId );
   // check the current image to determine action.
   var isExpandable;
   if( expandImg.src == image.src )
     isExpandable = true;
   else if ( collapseImg.src == image.src )
     isExpandable = false;
   // set action according to current state.     
   if( isExpandable )
   {
    // expand table.
    container.style.overflowY = "visible";
    // change the image to collapse
    image.src = collapseImg.src;
   // set the button title to "Click here to collapse table", for 508.
   button.title = "Click here to collapse table";
   image.alt = "Click here to collapse table";
   }
   else if ( !isExpandable )
   {
    // collapse table.
    container.style.overflowY = "auto";
    // change the image to expand
    image.src = expandImg.src;
    // set the button title to "Click here to expand table"
    button.title = "Click here to expand table";
    image.alt = "Click here to expand table";
   }
   // take the focus away.
   button.blur();
  }

//=========================================================
// Script Name:  dynamicHeightToggle()
//=========================================================
// Description:  This is an alternate script to toggle for tables that have rows that can vary in 
//  height. This script allows the user to switch between viewing a table in contracted form 
//  (with scroll bars) or expanded form (all rows displayed on the page). In contracted form,
//  the height of the table is determined by adding up all of the heights of the rows that are
//  being displayed.
//=========================================================
// Browsers Supported:  IE 5.x, IE 5.5, IE 6.x
// Browser Tested:  IE 6.0
//=========================================================
// Pararmeters:
//     containerId - the ID of the div that wraps around the table
//     imageId -  the ID of the expand/contract button image - used to track status of table (ie track
//    whether table is expanded or contracted)
//     buttonId - ID of the expand/contract button
//     headerRowCount - the number of rows in the header section of the table.
//     displayRowCount - the number of rows to be displayed in the table.
//=========================================================

function dynamicHeightToggle ( containerId, imageId, buttonId, headerRowCount, displayRowCount )
  {
   // initialize variables.
   var container = document.getElementById( containerId );
   var image = document.getElementById( imageId );
   var button = document.getElementById( buttonId );
   var table = container.firstChild;
   // check the current image to determine action.
   var isExpandable;
   if( expandImg.src == image.src )
     isExpandable = true;
   else if ( collapseImg.src == image.src )
     isExpandable = false;
   // set action according to current state.     
   if( isExpandable )
   {
    // expand table.
    container.style.overflowY = "visible";
    // change the image to collapse
    image.src = collapseImg.src;
   // set the button title to "Click here to collapse table", for 508.
   button.title = "Click here to collapse table";
   image.alt = "Click here to collapse table";
   }
   else if ( !isExpandable )
   {
    // collapse table.
    container.style.overflowY = "auto";
    
    var endRow = parseInt(headerRowCount) + parseInt(displayRowCount);
    var containerHeight = 0;

    for (var i = 0; i < endRow; i++) {
    containerHeight += table.rows[i].clientHeight; 
    }
    container.style.height = containerHeight;
    
    // change the image to expand
    image.src = expandImg.src;
    // set the button title to "Click here to expand table"
    button.title = "Click here to expand table";
    image.alt = "Click here to expand table";
   }
   // take the focus away.
   button.blur();
  }

//=========================================================
// Script Name:  setInitialDynamicTableHeight()
//=========================================================
// Description:  This script sets the initial height of a table using the dynamicHeightToggle function.
//=========================================================
// Browsers Supported:  IE 5.x, IE 5.5, IE 6.x
// Browser Tested:  IE 6.0
//=========================================================
// Pararmeters:
//     containerId - the ID of the div that wraps around the table
//     headerRowCount - the number of rows in the header section of the table.
//     displayRowCount - the number of rows to be displayed in the table.
//     setDynamicHeight - a parameter that determines whether or not to set the height to the sum total
//  heights of the first x rows, where x is the number of rows to be displayed in the table.
//=========================================================
  
function setInitialDynamicTableHeight( containerId, headerRowCount, displayRowCount, setDynamicHeight ) 
  {
    // initialize variables.
    var container = document.getElementById( containerId );
    var table = container.firstChild;   
    if (setDynamicHeight == 'false') {
      container.style.overflowY = "visible";
    }
    else
    {

      var endRow = parseInt(headerRowCount) + parseInt(displayRowCount);
      var containerHeight = 0;

      for (var i = 0; i < endRow; i++) {
      containerHeight += table.rows[i].clientHeight; 
      }
      container.style.height = containerHeight;
          }
   }


  /* 
  // Set the bookmark to return to
  function SetReturnBookmark( returnToElemId, titleString ) {
    top.Toolbar.returnToDocId = "1120";
    top.Toolbar.returnToElementId = returnToElemId;
    top.Toolbar.document.getElementById( "ReturnTo" ).title = "Return to " + titleString;
  }
  */
  
  /*
  function init() {
    MakeFieldsReadOnly( true );
    CreateImgObjects();
    GetTableAndContainerHeights();
    SetToggleBtnsVisibility();
    ZoomDisplay();
  }
  */

//=========================================================
// Script Name:  showAttachedDocs()
//=========================================================
function showAttachedDocs( elemId, colorSchema, docList ){
	// elemId is the id of the element that evokes this function
	// check to see if the tree is ready.
	// uncomment during integration
	 if( top.ReturnTree.document.body.readyState != "complete" )
	 {
	   alert("The attached documents are not ready for review yet. Please try again later.");
	   return;
	 }
	 
	// feature list
	var height = "dialogHeight:120px;";
    var width = "dialogWidth:300px;";
    var scroll = "scroll:auto;";
    var status = "status:no;";
    var help = "help:no;";
    var resizable = "resizable:yes;";
	 
	var docIdList = docList.split(" ");
	var clrSchema = colorSchema.split(",");
	if( docIdList.length == 1 )	{
	  top.ReturnTree.displayFormByDocId( docIdList[0] );
	  return;
	}
	var features = height + width + scroll + status + help + resizable;
	 var docNameList = top.ReturnTree.getDisplayNameByDocId(docIdList);
       if(docNameList == null){
       		top.ReturnTree.refreshDocumentList(elemId, colorSchema, docList);
       		return;
       }
     var displayIdList = top.ReturnTree.getDisplayIdByDocId(docIdList);		       
	 var docAttrObj = new Object();
	  docAttrObj.IdList = docIdList;
	  docAttrObj.NameList = docNameList;
	  docAttrObj.DisplayIdList = displayIdList;			  
	  docAttrObj.Color = clrSchema;
	  docAttrObj.Opener = self;
	  
	// Get the x and y coordinates of the calling element, relative to document body
	xElem = 0;
	yElem = 0;
	elemObj = document.getElementById( elemId );

    while ( elemObj != document.body ) {
	xElem += elemObj.offsetLeft;
	yElem += elemObj.offsetTop;
	elemObj = elemObj.offsetParent;
    }

	// Get the x and y coordinates of the browser's document display area, relative to the screen
	xWindow = window.screenLeft;
	yWindow = window.screenTop;

	// Set the x and y coordinates of the calendar popup, relative to the screen, and substract off pixels scrolled by the document body.
	xPopup = xElem + xWindow - document.body.scrollLeft;
	yPopup = yElem + yWindow - document.body.scrollTop;

	//==================================================================
	// Note: IE aligns the right edge of the popup with the right edge of the screen if there is not enough
	//          horizontal space between the calling element and the right edge of the screen. It works in the
	//          same manner for the bottom edge except when the Windows Taskbar is set to be "Always on top"
	//          and "Auto hide" is NOT checked. In this case, the bottom portion of the popup could be covered
	//          by the Taskbar. Therefore, we need to account for the Taskbar being permanently visible.
	//==================================================================
	if ( screen.availHeight - yPopup < height ) 	yPopup = screen.availHeight - height;

	// popup window left position in pixels
	features  += ";dialogLeft:" + xPopup + "px";
	// popup window top position in pixels
	features  += ";dialogTop:" + yPopup + "px";
	 
	 window.showModalDialog( HTMLPATH + "formlist.html",docAttrObj,features);
	 return;
}
// javascript dealing with left over data
var writeInId = 'PageHeader';   // this is defined in AddHeader.xsl.  It is assumed that it will be there.
function goToLeftoverDataTable( selectedWIId ) {
  writeInId = selectedWIId;
  document.getElementById( "LeftoverData" ).scrollIntoView();
  return;
}

function returnToWriteInImage() {
  document.getElementById( writeInId ).scrollIntoView();
  return;
}
function SendRef(site){
   location.href='xfer.html?RefDocID='+escape(site);
}

