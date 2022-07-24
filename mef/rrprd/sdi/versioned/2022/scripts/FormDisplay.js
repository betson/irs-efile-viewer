---
---
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

var IMAGEPATH = "{{ site.github.url }}/mef/rrprd/common/images/";
var HTMLPATH = "{{ site.github.url }}/mef/rrprd/common/htmls/";


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
    // store height
	container.setAttribute("origHeight",container.style.height);
	// expand table.
    container.style.overflowY = "visible";
	container.style.height = "auto";
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
	container.style.height = container.getAttribute("origHeight");
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
   var table = container.children[0];
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
    container.style.height = "auto";
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
    container.style.height = containerHeight + "px";
    
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
    var table = container.children[0];   
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
      container.style.height = containerHeight + "px";
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

	//helper function to get an element's exact position
	function getPosition(el) {
	  var xPosition = 0;
	  var yPosition = 0;
	 
	  while (el) {
		if (el.tagName == "BODY") {
		  // deal with browser quirks with body/window/document and page scroll
		  var xScrollPos = el.scrollLeft || document.documentElement.scrollLeft;
		  var yScrollPos = el.scrollTop || document.documentElement.scrollTop;
	 
		  xPosition += (el.offsetLeft - xScrollPos + el.clientLeft);
		  yPosition += (el.offsetTop - yScrollPos + el.clientTop);
		} else {
		  xPosition += (el.offsetLeft - el.scrollLeft + el.clientLeft);
		  yPosition += (el.offsetTop - el.scrollTop + el.clientTop);
		}
	 
		el = el.offsetParent;
	  }
	  return {
		x: xPosition,
		y: yPosition
	  };
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
