<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:include href="CommonPathRef.xsl"/>

  <xsl:output method="html" indent="yes"/>
    
  <!-- Parameters passed to the PrintDocList XSL file. -->
  <!--<xsl:variable name="Stage"  select="/AppData/Parameters/Stage"/>-->
  <xsl:variable name="DLN" select="/AppData/Parameters/DLN"/>
  <xsl:variable name="DLNChanged" select="/AppData/Parameters/DLNChanged"/>
  <xsl:variable name="DLNLatest" select="/AppData/Parameters/DLNLatest"/>
  <xsl:variable name="TIN" select="/AppData/Parameters/TIN"/>
  <xsl:variable name="TINChanged" select="/AppData/Parameters/TINChanged"/>
  <xsl:variable name="TINLatest" select="/AppData/Parameters/TINLatest"/>
  <xsl:variable name="SubmissionKey" select="/AppData/Parameters/SubmissionKey" />
  <xsl:variable name="SubmissionVersion" select="/AppData/Parameters/SubmissionVersion" />
  <xsl:variable name="SubmissionType" select="/AppData/Parameters/SubmissionType" />
  <xsl:variable name="ContentAndSummaryKey" select="/AppData/Parameters/ContentAndSummaryKey" />
  
  <xsl:variable name="landscapeDocumentElements" select="document('PrintMode.xml')/PrintMode/Landscape/Document" />

  <xsl:variable name="docForm"  select="'printSub'"/>    <!-- Action to which the form containing values for the 'checkbox' input type will be submitted -->

  <xsl:variable name="consolidatedPortraitDocs" select="AppData/SubmissionReferenceAndSummary/ReturnTableOfContents/Document[ 
           not(@documentName = $landscapeDocumentElements/@documentName) and (@documentType != 'PDF')]" />


  
  <xsl:variable name="consolidatedLandscapeDocs" select="AppData/SubmissionReferenceAndSummary/ReturnTableOfContents/Document[
           (@documentName = $landscapeDocumentElements/@documentName)]" />

  <xsl:variable name="parentDocs" select="AppData/SubmissionReferenceAndSummary/ReturnTableOfContents/Parent/Document" />


  <xsl:variable name="parentPortraitDocs" select="AppData/SubmissionReferenceAndSummary/ReturnTableOfContents/Parent/Document[
           not(@documentName = $landscapeDocumentElements/@documentName) and (@documentType != 'PDF')]" />

  
  <xsl:variable name="parentLandscapeDocs" select="AppData/SubmissionReferenceAndSummary/ReturnTableOfContents/Parent/Document[(@documentName = $landscapeDocumentElements/@documentName)]" />
  
  <xsl:variable name="EliminationsPortraitDocs" select="AppData/SubmissionReferenceAndSummary/ReturnTableOfContents/Eliminations/Document[
           not(@documentName = $landscapeDocumentElements/@documentName) and (@documentType != 'PDF')]" />

  
  <xsl:variable name="EliminationsLandscapeDocs" select="AppData/SubmissionReferenceAndSummary/ReturnTableOfContents/Eliminations/Document[(@documentName = $landscapeDocumentElements/@documentName)]" />
  
  <xsl:variable name="AdjustmentsPortraitDocs" select="AppData/SubmissionReferenceAndSummary/ReturnTableOfContents/Adjustments/Document[
           not(@documentName = $landscapeDocumentElements/@documentName) and (@documentType != 'PDF')]" />

  
  <xsl:variable name="AdjustmentsLandscapeDocs" select="AppData/SubmissionReferenceAndSummary/ReturnTableOfContents/Adjustments/Document[(@documentName = $landscapeDocumentElements/@documentName)]" />
  <!-- Collect all the Subsidiary Elements -->
  <xsl:variable name="subsidiaryElements" select="/AppData/SubmissionReferenceAndSummary/ReturnTableOfContents/Subsidiary" />
           
  <!-- Determine the return section for which the document list needs to be displayed (passed in as an xml data parameter) -->
  <xsl:variable name="returnSectionSelected" select="/AppData/Parameters/SubmissionSection" />

  <!-- Determine the EIN for the subsidiary for which we have to display the list of documents if the return 
      section selected is consolidated. This corresponds to the display id for the top level subsidiary doucment. -->  
  <xsl:variable name="subsidiaryEIN" select="/AppData/Parameters/SubsidiaryEIN" />
  
  <xsl:variable name="titleStringWidth"    select="'width:71mm;'" />
  <xsl:variable name="checkAllBtnWidth"    select="'width:46mm;'" />
  <xsl:variable name="uncheckAllBtnWidth"    select="'width:28mm;'" />

  <xsl:variable name="portraitTitleString"    select="'Portrait Documents (8.5&quot;W x 11&quot;H)'" />
  
  <xsl:variable name="landscapeTitleString"    select="'Landscape Documents (11&quot;W x 8.5&quot;H)'" />
  
  <xsl:variable name="dependencyTitleString"    select="'Dependencies (8.5&quot;W x 11&quot;H)'" />
  
  <xsl:variable name="additionalInfoTitleString"    select="'Additional Information'" />
  
  <xsl:variable name="trueString" select="'true'" />
  <xsl:variable name="falseString" select="'false'" />
  
  <xsl:variable name="portraitStr" select="'portrait'" />
  
  <xsl:variable name="landscapeStr" select="'landscape'" />

  <xsl:variable name="ackPresent" >
    <xsl:choose >
      <xsl:when test="(/AppData/SubmissionReferenceAndSummary/Acknowledgement = $trueString) or (/AppData/SubmissionReferenceAndSummary/Acknowledgement = 1)"><xsl:value-of select="$trueString" /></xsl:when>
<xsl:otherwise ><xsl:value-of select="$falseString" /></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
    
  <xsl:variable name="codeEditPresent" >
    <xsl:choose >
      <xsl:when test="(/AppData/SubmissionReferenceAndSummary/CodeAndEdit = $trueString) or (/AppData/SubmissionReferenceAndSummary/CodeAndEdit = 1)"><xsl:value-of select="$trueString" /></xsl:when>
<xsl:otherwise ><xsl:value-of select="$falseString" /></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>    
  
  <xsl:variable name="procStatusPresent" >
    <xsl:choose >
      <xsl:when test="(/AppData/SubmissionReferenceAndSummary/ProcessingStatus = $trueString) or (/AppData/SubmissionReferenceAndSummary/ProcessingStatus = 1)"><xsl:value-of select="$trueString" /></xsl:when>
<xsl:otherwise ><xsl:value-of select="$falseString" /></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>    

  <xsl:variable name="changeHistoryPresent" >
    <xsl:choose >
      <xsl:when test="(/AppData/SubmissionReferenceAndSummary/ChangeHistory = $trueString) or (/AppData/SubmissionReferenceAndSummary/ChangeHistory = 1)"><xsl:value-of select="$trueString" /></xsl:when>
<xsl:otherwise ><xsl:value-of select="$falseString" /></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>  
  
    <xsl:variable name="napDataPresent" >
    <xsl:choose >
      <xsl:when test="(/AppData/SubmissionReferenceAndSummary/NAPData = $trueString) or (/AppData/SubmissionReferenceAndSummary/NAPData = 1)"><xsl:value-of select="$trueString" /></xsl:when>
<xsl:otherwise ><xsl:value-of select="$falseString" /></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>  
  
  <xsl:variable name="indexPresent" >
    <xsl:choose >
      <xsl:when test="(/AppData/SubmissionReferenceAndSummary/Index = $trueString) or (/AppData/SubmissionReferenceAndSummary/Index = 1)"><xsl:value-of select="$trueString" /></xsl:when>
<xsl:otherwise ><xsl:value-of select="$falseString" /></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  
  <xsl:variable name="resizePrintWindow" select="/AppData/ApplicationProperties/PrintoutWindowResizable" />    
  

  <xsl:template name="insertCSSStyles" >
  
    <style>
      body {   /* body style for all stylesheets */
        width: auto; height: auto;
        margin-top: 6px; margin-right: 0px; margin-bottom: 0px; margin-left: 6px;
        color: black; background-color: white;
        background-repeat: no-repeat;  /*  repeat || repeat-x || repeat-y || no-repeat  */
        background-attachment: scroll;  /*  IE Only: scroll || fixed  */
        background-position: center center;  /*  IE Only: {x}% {y}% || {x}px|pt|in|cm|mm {y}px|pt|in|cm|mm || top|center|bottom left|center|right  */
        font-family: verdana, arial, sans-serif; font-style: normal;
        font-size: 7pt; font-weight: normal;
        line-height: normal;
        text-align: left; vertical-align: middle;
        text-indent: 0px; text-decoration: none; white-space: normal;
        padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
        border-style: none; border-color: gray;
        border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
        float: none; clear: none;
        display: block;
        cursor: auto;
        zoom: <xsl:value-of select="$ZoomLevel" />;
      }
      .styFormTypeTitleLine {   /* Form Type Document Title Line */
        width: 145mm;
        border-style: solid; border-color: gold;
        border-top-width: 0px; border-bottom-width: 2px; border-left-width: 0px; border-right-width: 0px;
      }
      .styFormTypeTitle {   /* Form Type Document Title */
        font-size:8pt;
        font-family: verdana, arial, sans-serif;
        font-weight: bold;
        float:left;
        height:6mm;
        background-color: gold;
        text-align: left;
        padding-left: 8px; padding-right: 0px; padding-top:6px; padding-bottom:0px;
      }
      .styCheckAllButtonContainer { /* Style for Container of Check All Button */
        float:left;
        text-align:right;
      }
      .styCheckAllBtn { /* Check All Button Style */
        height:5mm;
        width: 27mm;
        font-family: verdana, arial, sans-serif; font-size: 8pt;
        font-weight: bold; font-style: normal;
      }
      .styFormTableContainer { /* Style for Div containing the Form Table */
        width:145mm;
        overflow-y:auto;
        margin-top:1mm;margin-bottom:3mm;

      }
      .styFormTable { /* Style for a table of rows containing the form checkbox and description */
        width:145mm;
        border-style: solid; border-color: black;
        border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
        margin-bottom:1mm;
      }
      .styFormCheckboxContainer { /* Style for form checkbox container  */
        padding-left: 5mm;
        margin-top: 6px; margin-bottom:5px;
        text-align: right:
        float:left;clear:none;
      }
      .styFormDescription { /* Description of form style */
        width:140mm;
        font-size: 8pt;
        text-align:left;
        margin-top: 5px; margin-bottom:5px;
        float:left;clear:none;
      }
      .styCkbox {   /* Checkbox style */
        height: 3mm; width: 3mm;
      }
      .styGenericDiv { /* definition of a generic placeholder div */
        float:left; clear:none;
      }      
      .styGenericBtn { /* Generic Button Style */
        height:5.8mm;
        width: 21mm;
        font-family: verdana, arial, sans-serif; font-size: 8pt;
        font-weight: bold; font-style: normal;
      }
      .stySectionSeperator {   /* Style for section seperator */
        width:145mm;
        border-style: solid; border-color: black;
        border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
        float: left; clear: left;
      }      
    </style>
    
  </xsl:template>
  
  
  <xsl:template name="insertScriptElement" >
  

    <script type="text/javascript" language="javascript">
      // globals
      var originalStageValue = "<xsl:value-of select="$Stage" />";
      var portraitFormList = new Array();
      var landscapeFormList = new Array();
      var dependencyFormList = new Array();
      var additionalInfoFormList = new Array();
      var maxCheckedFormList = new Array(); //Array used for determining whether maximum number of forms are checked
      var MAXCHECKED = 15; // maximun forms allowed to check ( apply only to portrait forms );
      var temp;
      
      var overMAXCHECKEDmsg = "No more than " + MAXCHECKED + " return documents can be selected in one print job.";
      
            var checkAllBtnOverMAXCHECKEDMsg = " documents have been selected. The application does not support printing more than " + MAXCHECKED + "  return documents at a time. Please comply before clicking the Print button";

      var exclusiveDocsMsg = "All return documents selected for printing must be either portrait or landscape, but not both.";
      
      var noDocsSelectedMsg = "Please select the documents you wish to print.";
      
      var setPrintModeMsg = "When you are prompted with the Print dialog, please set the page orientation the same as the orientation of the documents you have selected to print.";

      var categoryType;
      
      //Begin Additional Information Form List Creation --  
      
      temp =   "<xsl:if test="($ackPresent = $trueString)">Acknowledgement<xsl:if test="($codeEditPresent = $trueString) or  ($procStatusPresent = $trueString) or ($changeHistoryPresent = $trueString) or ($napDataPresent = $trueString) or ($indexPresent = $trueString)">,</xsl:if>
        </xsl:if>
        <xsl:if test="($codeEditPresent = $trueString)">CodeAndEdit<xsl:if test="($procStatusPresent = $trueString) or
($changeHistoryPresent = $trueString) or ($napDataPresent = $trueString) or ($indexPresent = $trueString)">,</xsl:if>
        </xsl:if>
        <xsl:if test="($procStatusPresent = $trueString)">ProcessingStatus<xsl:if test="($changeHistoryPresent = $trueString) or ($napDataPresent = $trueString) or ($indexPresent = $trueString)">,</xsl:if>
        </xsl:if>
        <xsl:if test="($changeHistoryPresent = $trueString)">ChangeHistory<xsl:if test="($napDataPresent = $trueString) or ($indexPresent = $trueString)">,</xsl:if>
        </xsl:if>
        <xsl:if test="($napDataPresent = $trueString)">NAPData<xsl:if test="($indexPresent = $trueString)">,</xsl:if>
        </xsl:if>
        <xsl:if test="($indexPresent = $trueString)">Index</xsl:if>"        
      additionalInfoFormList = temp.split(",");
      
      //End Additional Information Form List Creation

      function isUnderLimit()
      {
        var j = 0;
        for( i = 0; i &lt; maxCheckedFormList.length; i++ )
        {
          checkbox = document.getElementById( maxCheckedFormList[ i ] );
          if( checkbox.checked )
          {
            j++;
          }
        }
        if( j &gt; MAXCHECKED )
          return false;
        else
          return true;
      }
          
      
      function checked( checkboxIdList )
      {
        // return true if any checkboxed are checked
        var checkedKount = 0;
                
        for( i = 0; i &lt; checkboxIdList.length; i++ )
        {
          checkbox = document.getElementById( checkboxIdList[ i ] );
          if( checkbox.checked )
          {
            return true;
          }
        }
        return false;
      }
      
      function noneChecked()
      {
        if (  !(checked( landscapeFormList )) &amp;&amp; 
          !(checked( portraitFormList )) &amp;&amp; 
          !(checked(additionalInfoFormList))
           )
          return true;
        else
          return false;
      }
      
          
      function handleCheckBoxClick( caller, categoryType )
      {
        // always allow uncheck.
        if( !caller.checked )  // note that onclick javascript events happens AFTER checkbox update, checked will return false if unchecking.
        {
          return;
        }
        
        <!-- Verify if both landscape and portrait documents have already been selected. If yes,
            display alert msg to the effect that both cannot be selected  -->
        if (
          ( (categoryType == '<xsl:value-of select="$portraitStr" />') &amp;&amp; (checked(landscapeFormList))) ||
          ( (categoryType == '<xsl:value-of select="$landscapeStr" />') &amp;&amp; (checked(portraitFormList )))
           )
        {
          alert(exclusiveDocsMsg);
        }
        
        if( !isUnderLimit( ) ) 
        {
          alert( overMAXCHECKEDmsg );
          caller.checked = false;
        }
                
        caller.checked = true;
        return;
      }
        
      
      function verifyCheckAll( group )
      {
        switch( group )
        {
        case "portrait":        
          if( checked( landscapeFormList ) )
          {
            alert(exclusiveDocsMsg);
          }
          checkAll( "portrait" );
          break;
                    
        case "landscape":
          if( checked( portraitFormList ) )
          {
            alert(exclusiveDocsMsg);
          }
          checkAll( "landscape" );
          break;  
            
                
        default:
          checkAll( group );
        }
                
        <!-- Display alert msg if more than MAXCHECKED documents have been selected -->
        if (!isUnderLimit())
        {
          <!-- Call function to count the number of documents selected -->
          var numDocsSelected = countCheckedDocs();
          alert( numDocsSelected + checkAllBtnOverMAXCHECKEDMsg);
        }
        return;
      }
      
      
      <!--  Returns the number of documents selected by the user -->
      function countCheckedDocs()
      {
        var numChecked = 0;
        
        for( i = 0; i &lt; maxCheckedFormList.length; i ++ )
        {
          checkbox = document.getElementById( maxCheckedFormList[ i ] );
          if (checkbox.checked)
          {
            numChecked = numChecked + 1;
          }
        }
        
        return (numChecked)
          
      }
      
        
      
      function checkAll( group )
      {
        switch( group )
        {
        case "portrait":
          for( i = 0; i &lt; portraitFormList.length; i ++ )
          {
            checkbox = document.getElementById( portraitFormList[ i ] );
            checkbox.checked = true;
            //portraitFormChecked = true;
          }
          break;
        
        case "landscape":
          for( i = 0; i &lt; landscapeFormList.length; i ++ )
          {
            checkbox = document.getElementById( landscapeFormList[ i ] );
            checkbox.checked = true;
            //landscapeFormChecked = true;
          }
          break;
          
        case "dependency":
          for( i = 0; i &lt; dependencyFormList.length; i ++ )
          {
            checkbox = document.getElementById( dependencyFormList[ i ] );
            checkbox.checked = true;
          }
          break;
          
        case "additionalInfo" :
        
          <!-- Check to see if the checkbox Control  is checked or unchecked -->              
          <xsl:if test="$ReturnStatus = 'A'" >
          if (!(document.PrintParamForm.printCheckBox.checked))
          {
          </xsl:if>
            for( i = 0; i &lt; additionalInfoFormList.length; i ++ )
            {
              checkbox = document.getElementById( additionalInfoFormList[ i ] );
              checkbox.checked = true;
            }
          <xsl:if test="$ReturnStatus = 'A'" >
          }
          </xsl:if>
          break;
        
        default:
          alert( "Javascript Error:unspecified group.");
        }
        return;
      }
      
      function uncheckAll( group )
      {
        switch( group )
        {
        case  "portrait" :
          for( i = 0; i &lt; portraitFormList.length; i ++ )
          {
            checkbox = document.getElementById( portraitFormList[ i ] );
            checkbox.checked = false;
            //portraitFormChecked = false;
          }
          break;
          
        case "landscape" :
          for( i = 0; i &lt; landscapeFormList.length; i ++ )
          {
            checkbox = document.getElementById( landscapeFormList[ i ] );
            checkbox.checked = false;
            //landscapeFormChecked = false;
          }
          break;
          
        case "dependency" :
          for( i = 0; i &lt; dependencyFormList.length; i ++ )
          {
            checkbox = document.getElementById( dependencyFormList[ i ] );
            checkbox.checked = false;
          }
          break;
        case "additionalInfo" :
          for( i = 0; i &lt; additionalInfoFormList.length; i ++ )
          {
            checkbox = document.getElementById( additionalInfoFormList[ i ] );
            checkbox.checked = false;
          }
          break;
          
        default :
          alert( "Javascript Error:unspecified group.");
        }
        return;
      }
      
      var printWindow;
      
      function printDocs(  ){
      
        <!--  If no documents have been selected for printing, alert user to this fact and return  -->
        if (noneChecked())
        {
          alert(noDocsSelectedMsg);
          return;
        }
        
        <!-- Verify if both landscape and portrait documents have already been selected. If yes,
            display alert msg to the effect that both cannot be selected  -->
        if ( checked(portraitFormList ) &amp;&amp; checked(landscapeFormList) ) 
        {
          alert(exclusiveDocsMsg);
          return false;
        }        
        
        if( !isUnderLimit( ) ) 
        {
          alert(overMAXCHECKEDmsg );
          return false;
        }
        
        alert( setPrintModeMsg );
        
        var featureList  = "Toolbar=no";
            featureList += ",Location=no";
            featureList += ",Directories=no";
            featureList += ",Status=no";
            featureList += ",Menubar=no";

            // Set Copyhistory=yes to copy the history list to new window
              featureList += ",Copyhistory=no";

            featureList += ",Scrollbars=no";
            
            if ('<xsl:value-of select="$resizePrintWindow" />' == 'true')
          {
              featureList += ",Resizable=yes";
            }
            else
            {
              featureList += ",Resizable=no";
            }
           featureList += ",dependent=yes";
           featureList += ",width=320";
           featureList += ",height=80";
           //featureList += ",left=360";
           //featureList += ",right=360";

        xPos = ( screen.width - 320 ) / 2;
        //move the dialog upward enough so that when the browser's Print dialog is poped up, 
        //it is entirely visible with no part of it going off the screen.
        //yPos = ( screen.height - 80 ) / 2;
        yPos = ( screen.height - 320 ) / 2;
        featureList += ",top=" + yPos;
        featureList += ",left=" + xPos;
               
        <!--  Open new window to display print documents -->
        printWindow = window.open("/mef/rrprd/sdi/pages/templates/print_msg_content", "PrintMsgContentWindow", featureList);
        
        <!-- Wait for new window to become 'available' before setting target for form and submitting -->
        setTimeout(printDocsHelper, 100);
      }



function printDocsHelper()
{
   if ( ( printWindow == null ) || ( printWindow.frames == null ) || ( printWindow.frames['PrintContent'] == null ) )
   {
     setTimeout(printDocsHelper, 100);
     return;
   }
  
  <!-- Set the target of the form to be the hidden frame in the Window from which this current window was launched -->
  document.forms['<xsl:value-of select="$docForm"/>'].target = printWindow.frames['PrintContent'].name;
  
  <!-- Set the value for the noresize property of the hidden frame depending 
    upon the value read from the AppProperties.xml file -->
  if ('<xsl:value-of select="$resizePrintWindow" />' == 'true')
  {
    printWindow.frames['PrintContent'].noResize = false;
  }
  else
  {
    printWindow.frames['PrintContent'].noResize = true;
  }
  
  <!-- Submit the form to the appropriate action -->
  document.forms['<xsl:value-of select="$docForm"/>'].submit();
        
  top.close();
}


      function cancel(  ){
        top.close();
      }
      
      function init()
      {
      }
      
      function setTaxpayerPrintParameter()
      {
        <!-- Check to see if the checkbox Control  is checked or unchecked-->
        if (document.PrintParamForm.printCheckBox.checked)
        {
          document.forms['<xsl:value-of select="$docForm" />'].taxpayerPrint.value = "true";
          document.forms['<xsl:value-of select="$docForm" />'].stage.value = "original";
          <!-- Gray out Additional Information checkboxes -->
          for( i = 0; i &lt; additionalInfoFormList.length; i ++ )
          {
            checkbox = document.getElementById( additionalInfoFormList[ i ] );
            checkbox.checked = false;
            checkbox.disabled = true;
          }           
        }
        else
        {
          document.forms['<xsl:value-of select="$docForm" />'].taxpayerPrint.value = "false";
          document.forms['<xsl:value-of select="$docForm" />'].stage.value = originalStageValue;
          
          <!-- Enable Additional Information checkboxes -->
          for( i = 0; i &lt; additionalInfoFormList.length; i ++ )
          {
            checkbox = document.getElementById( additionalInfoFormList[ i ] );
            checkbox.disabled = false;
          }
        }
      }
      
      function setOverflowPrintStyleParameter(printStyle) {
      	document.forms['<xsl:value-of select="$docForm" />'].print.value = printStyle;
      }
    </script>
    
  </xsl:template>
  
  <xsl:template name="insertHeadElement" >
  
    <head>
      <title>Print Document List </title>
      <meta http-equiv="Pragma" content="no-cache" />
      <meta http-equiv="Cache-Control" content="no-cache" />
      <meta http-equiv="Expires" content="0" />
      <!-- No Proxy Caching -->
      <meta http-equiv="Cache-Control" content="private" />
      <!-- Define Character Set -->
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
      <!-- Set Target to Top -->
      <!-- <meta http-equiv="Window-target" content="_top" /> -->
      <!-- Set Filename and Description -->
      <meta name="Description" content="Print Document List" />
      
      <!-- Call Template to insert CSS Styles required for displaying the Print Document List -->      
      <xsl:call-template name="insertCSSStyles" />
      
      <!-- Call Template to insert JavaScript code required for displaying the Print Document List -->
      <xsl:call-template name="insertScriptElement" />            
    </head>
    
  </xsl:template>

  <xsl:template match="/">
    <html>
      <xsl:call-template name="insertHeadElement" />
      <xsl:call-template name="insertBodyElement" />  
    </html>
  </xsl:template>


  <xsl:template name="displayTaxpayerSelectCkbox" >
    <form name="PrintParamForm" id="PrintParamForm" action="">
    <table style="margin-bottom:0px;">
      <tr>
      <td class="styFormDescription"><nobr><span style="font-weight:bold;">Print overflow data:</span>
        <input title="Print overflow data separately and after the form is printed" type="radio" name="overflowPrintStyle" id="overflowStyle1" value="" checked="true" onclick="setOverflowPrintStyleParameter('separated');" style="vertical-align:middle;" /><label for="overflowStyle1" title="Print overflow data separately and after the form is printed">separated</label>
        <input title="Print overflow data where they are defined on the form" type="radio" name="overflowPrintStyle" id="overflowStyle2" value=""  onclick="setOverflowPrintStyleParameter('inline');" style="vertical-align:middle;" /><label for="overflowStyle2" title="Print overflow data where they are defined on the form">inline</label></nobr></td>
      <xsl:if test="$ReturnStatus = 'A'" >
        <td class="styFormCheckboxContainer"><input name="printCheckBox" id="printCheckBox" type="checkbox" title="Print original data only with page watermark" class="styCkbox" value="" onclick="setTaxpayerPrintParameter();" ></input></td>
        <td class="styFormDescription" style="font-weight:bold;"><label for="printCheckBox" title="Print original data only with page watermark"><nobr>Print for taxpayer</nobr></label></td>
      </xsl:if>
      </tr>
    </table>
    </form>
  </xsl:template>
  
  <xsl:template name="insertBodyElement" >

    <body onload="init()">
    
    <span style="font-size:7pt;"><span style="font-weight:bold;">Note:</span> Before clicking the Print button, please make sure the margins in your browser's Page Setup dialog are set as follows:  Left=0.35", Right=0.35", Top=0.25", Bottom=0.25".</span>

    <!-- Checkbox to allow user to set the value for the print parameter for Accepted Returns only -->
    <xsl:call-template name="displayTaxpayerSelectCkbox" />
    <form action="/mef/rrprd/sdi/proxy/{$docForm}" name="{$docForm}" id="{$docForm}" method="post" target="_blank">
      
    <input type="hidden" name="stage" value="{$Stage}" />
    <input type="hidden" name="dln" value="{$DLN}" />
    <input type="hidden" name="dlnChanged" value="{$DLNChanged}" />
    <input type="hidden" name="dlnLatest" value="{$DLNLatest}" />
    <input type="hidden" name="tin" value="{$TIN}" />
    <input type="hidden" name="tinChanged" value="{$TINChanged}" />
    <input type="hidden" name="tinLatest" value="{$TINLatest}" />
    <input type="hidden" name="submissionKey" value="{$SubmissionKey}" />
    <input type="hidden" name="acceptanceStatus" value="{$ReturnStatus}" />
    <input type="hidden" name="submissionType" value="{$SubmissionType}" />
    <input type="hidden" name="submissionVersion" value="{$SubmissionVersion}" />
    <input type="hidden" name="print" value="separated" />
    <input type="hidden" name="taxpayerPrint" value="false" />
    <input type="hidden" name="contentAndSummaryKey" value="{$ContentAndSummaryKey}" />
    
    <!--   Display documents for appropriate return section based on the parameter 
        passed in the xml data - ReturnSection -->        
    <xsl:choose >
    
      <xsl:when test="$returnSectionSelected = 'consolidated'">
        <xsl:call-template name="displayConsolidatedDocs" ></xsl:call-template>
      </xsl:when>
    
      <xsl:when test="$returnSectionSelected = 'parent'">
        <xsl:call-template name="displayParentDocs" ></xsl:call-template>
      </xsl:when>
    
      <xsl:when test="$returnSectionSelected = 'subsidiary'">
        <xsl:call-template name="displaySubsidDocs" ></xsl:call-template>
      </xsl:when>
      
      <xsl:when test="$returnSectionSelected = 'eliminations'">
      	<xsl:call-template name="displayEliminationsDocs" ></xsl:call-template>
      </xsl:when>
      
      <xsl:when test="$returnSectionSelected = 'adjustments'">
      	<xsl:call-template name="displayAdjustmentsDocs" ></xsl:call-template>
      </xsl:when>
      
      <xsl:otherwise>
        <xsl:call-template name="displayConsolidatedDocs" ></xsl:call-template>
      </xsl:otherwise>
    
    </xsl:choose>
    
    <xsl:call-template name="displayAdditionalInfo" />
    
    <div style="text-align:center;">
        <input class="styGenericBtn" type="button" value="Print" onclick="printDocs();" title="Print"></input>
        <span style="width:5px;"></span>
        <input class="styGenericBtn" type="button" value="Cancel" onclick="cancel();" title="button"></input>
    </div>

    </form>
    </body>
  </xsl:template><!-- Ends 'insertBodyElement' Template -->
  
  
  <xsl:template name="displayConsolidatedDocs" >
    
    <!-- Call Template to create  javacript arrays of landscape and portrait documents -->
    <xsl:call-template name="createPortraitLandscapeLists" >
      <xsl:with-param name="portraitNodeSet" select="$consolidatedPortraitDocs" />
      <xsl:with-param name="landscapeNodeSet"  select="$consolidatedLandscapeDocs"/>
    </xsl:call-template>

    <xsl:call-template name="displayPortraitDocs" >
      <xsl:with-param name="documentNodeSet" select="$consolidatedPortraitDocs"/>
    </xsl:call-template>
    
    <xsl:call-template name="displayLandscapeDocs" >
      <xsl:with-param name="documentNodeSet" select="$consolidatedLandscapeDocs"/>
    </xsl:call-template>
    
  </xsl:template> <!-- Ends Template 'displayConsolidatedDocs' -->
  
    <xsl:template name="displayEliminationsDocs" >

    <!-- Call Template to create  javacript arrays of landscape and portrait documents -->  
    <xsl:call-template name="createPortraitLandscapeLists" >
      <xsl:with-param name="portraitNodeSet" select="$EliminationsPortraitDocs" />
      <xsl:with-param name="landscapeNodeSet"  select="$EliminationsLandscapeDocs"/>
    </xsl:call-template>
    
    <xsl:call-template name="displayPortraitDocs" >
      <xsl:with-param name="documentNodeSet" select="$EliminationsPortraitDocs"/>
    </xsl:call-template>
    
    <xsl:call-template name="displayLandscapeDocs" >
      <xsl:with-param name="documentNodeSet" select="$EliminationsLandscapeDocs"/>
    </xsl:call-template>
        
  </xsl:template>
  
    <xsl:template name="displayAdjustmentsDocs" >

    <!-- Call Template to create  javacript arrays of landscape and portrait documents -->  
    <xsl:call-template name="createPortraitLandscapeLists" >
      <xsl:with-param name="portraitNodeSet" select="$AdjustmentsPortraitDocs" />
      <xsl:with-param name="landscapeNodeSet"  select="$AdjustmentsLandscapeDocs"/>
    </xsl:call-template>
    
    <xsl:call-template name="displayPortraitDocs" >
      <xsl:with-param name="documentNodeSet" select="$AdjustmentsPortraitDocs"/>
    </xsl:call-template>
    
    <xsl:call-template name="displayLandscapeDocs" >
      <xsl:with-param name="documentNodeSet" select="$AdjustmentsLandscapeDocs"/>
    </xsl:call-template>
        
  </xsl:template>
  
  <xsl:template name="displayParentDocs" >

    <!-- Call Template to create  javacript arrays of landscape and portrait documents -->  
    <xsl:call-template name="createPortraitLandscapeLists" >
      <xsl:with-param name="portraitNodeSet" select="$parentPortraitDocs" />
      <xsl:with-param name="landscapeNodeSet"  select="$parentLandscapeDocs"/>
    </xsl:call-template>
    
    <xsl:call-template name="displayPortraitDocs" >
      <xsl:with-param name="documentNodeSet" select="$parentPortraitDocs"/>
    </xsl:call-template>
    
    <xsl:call-template name="displayLandscapeDocs" >
      <xsl:with-param name="documentNodeSet" select="$parentLandscapeDocs"/>
    </xsl:call-template>
        
  </xsl:template> <!-- Ends Template 'displayParentDocs' -->
  
  
  <xsl:template name="displaySubsidDocs" >

    <!-- Find out the Subsidiary Element that matches the subsidiary EIN passed in the parameters list -->
    <xsl:for-each select="$subsidiaryElements" >
    
      <!-- Get the top level document in that subsidiary -->
      <xsl:variable name="topLevelDoc" select="./Document[1]" />
      
      <!-- If the top level document in the current subsidiary matches the subsidiary ein, call template
        to display the documents in this subsidiary -->     
      <xsl:if test="($topLevelDoc/@displayId = substring-before($subsidiaryEIN, '-')) and (position() = substring-after($subsidiaryEIN, '-'))">
      
        <xsl:variable name="subsidiaryDocs" select="./Document[@documentType != 'PDF']" />
        
        <xsl:variable name="subsidiaryPortraitDocs" select="$subsidiaryDocs[ 
           not(@documentName = $landscapeDocumentElements/@documentName)]" />

  
  <xsl:variable name="subsidiaryLandscapeDocs" select="$subsidiaryDocs[(@documentName = $landscapeDocumentElements/@documentName)]" />

        <!--  Create a list of subsidiary portrait and landscape docs for javascript to use,
             to facilitate checking and unchecking of boxes.  -->
             
        <xsl:call-template name="createPortraitLandscapeLists" >
          <xsl:with-param name="portraitNodeSet" select="$subsidiaryPortraitDocs" />
          <xsl:with-param name="landscapeNodeSet"  select="$subsidiaryLandscapeDocs"/>
        </xsl:call-template>
                
        <xsl:call-template name="displayPortraitDocs" >
          <xsl:with-param name="documentNodeSet" select="$subsidiaryPortraitDocs"/>
        </xsl:call-template>
    
        <xsl:call-template name="displayLandscapeDocs" >
          <xsl:with-param name="documentNodeSet" select="$subsidiaryLandscapeDocs"/>
        </xsl:call-template>
    
      </xsl:if>  <!-- Ends <xsl:if test="$topLevelDoc/@displayId = $subsidiaryEIN"> -->
    
    </xsl:for-each>
    
  </xsl:template>

  
  <xsl:template name="listDocName">
  <xsl:param name="document" />
  <xsl:param name="category" />
    
    <!-- Variable that holds the value to be displayed -->
    <xsl:variable name="displayedName">
      <xsl:call-template name="rtnDisplayName">
        <xsl:with-param name="displayName" select="$document/@displayName"/>
        <xsl:with-param name="displayId" select="$document/@displayId"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="FormId" select="$document/@documentId" />
    <xsl:variable name="docNameValue" select="$document/@documentName" />
    <xsl:variable name="displayNameValue" select="$document/@displayName" />
    <xsl:variable name="displayIdValue" select="$document/@displayId" />
    <xsl:variable name="regulationValue" select=" $document/@regulation" />

    <xsl:variable name="chkBoxValue" select="concat($document/@documentId,'[[documentName=', $docNameValue, '][displayName=', $displayNameValue, '][regulation=', $regulationValue, ']]')" />
    <tr>          
      <td class="styFormCheckboxContainer"><input name="document" id="{$FormId}" type="checkbox" class="styCkbox"  value="{$chkBoxValue}" categoryType="{$category}" onclick="handleCheckBoxClick(this, this.categoryType);"></input></td>
      <td class="styFormDescription"><label for="{$FormId}"><xsl:value-of select="$displayedName"/></label></td>
    </tr>

  </xsl:template>
    
  
  <xsl:template name="displayPortraitDocs" >
  <xsl:param name="documentNodeSet" />
  
    <xsl:if test="count($documentNodeSet) > 0" >
    <!-- BEGIN Consolidated Portrait Forms Table -->
      
      <!-- Portrait Forms Title Bar and Button -->
      <xsl:call-template name="displayPortraitTitle" />
      
      <xsl:call-template name="insertDocList" >
        <xsl:with-param name="documentNodeSet" select="$documentNodeSet" />
        <xsl:with-param name="category" select="$portraitStr" />
      </xsl:call-template>
    </xsl:if>

  </xsl:template> <!-- Ends Template 'displayPortraitDocs' -->
  
    
  <xsl:template name="displayLandscapeDocs" >
  <xsl:param name="documentNodeSet" />
    
    <xsl:if test="count($documentNodeSet) > 0" >
    <!-- BEGIN Landscape Forms Table -->  
      <!-- Landscape Forms Title Bar and Button -->
      <xsl:call-template name="displayLandscapeTitle" />

      <xsl:call-template name="insertDocList" >
        <xsl:with-param name="documentNodeSet" select="$documentNodeSet" />
        <xsl:with-param name="category" select="$landscapeStr" />
      </xsl:call-template>
    <!-- END Landscape Forms Table -->
    </xsl:if>
    
  </xsl:template> <!-- Ends Template 'displayLandscapeDocs' -->
  
  
  <xsl:template name="displayPortraitTitle" >
    
    <xsl:call-template name="displayTitle">
        <xsl:with-param name="titleString"   select="$portraitTitleString" />
        <xsl:with-param name="printMode"   select="'portrait'" />
    </xsl:call-template>
  
  </xsl:template>
  
  <xsl:template name="displayLandscapeTitle" >
    
    <xsl:call-template name="displayTitle">
        <xsl:with-param name="titleString"   select="$landscapeTitleString" />
        <xsl:with-param name="printMode"   select="'landscape'" />
    </xsl:call-template>
  
  </xsl:template>
  
  
  <xsl:template name="displayDependencyTitle" >
    
    <xsl:call-template name="displayTitle">
        <xsl:with-param name="titleString"   select="$dependencyTitleString" />
        <xsl:with-param name="printMode"   select="'dependency'" />
    </xsl:call-template>
  
  </xsl:template>
  
  
  <xsl:template name="displayTitle">
  <xsl:param name="titleString" />
  <xsl:param name="printMode" />
  

      <div class="styFormTypeTitleLine">
        <div class="styFormTypeTitle" style="{$titleStringWidth}">
          <xsl:value-of select="$titleString" />      
        </div>
        <div class="styCheckAllButtonContainer" style="{$checkAllBtnWidth}">
          <input class="styCheckAllBtn" type="button" value="Check All" onclick="verifyCheckAll('{$printMode}');" title="Check All"/>
        </div>
        <div class="styCheckAllButtonContainer" style="{$uncheckAllBtnWidth}">
          <input class="styCheckAllBtn" type="button" value="Uncheck All" onclick="uncheckAll( '{$printMode}' );" title="Uncheck All"/>
        </div>
      </div>
      
  </xsl:template>
  
  
  <xsl:template name="insertDocList" >
  <xsl:param name="documentNodeSet" />
  <xsl:param name="category" />
  
    
    
    <div class="styFormTableContainer">
        <!-- table height logic -->
          <xsl:call-template name="SetTableHeight">
            <xsl:with-param name="rowCount">
              <xsl:value-of select="count($documentNodeSet)"/>
            </xsl:with-param>
          </xsl:call-template>
        <!-- end -->      
        <table class="styFormTable">      
          <xsl:for-each select="$documentNodeSet">
          	<xsl:sort select="./@displayName"/>
            <xsl:call-template name="listDocName">
              <xsl:with-param name="document" select="."/>
              <xsl:with-param name="category" select="$category"/>
            </xsl:call-template>
          </xsl:for-each>
        </table>
    </div>
  
  </xsl:template>
  

    
  <xsl:template name="rtnDisplayName">
  <xsl:param name="displayName"/>
  <xsl:param name="displayId"/>
    
    <xsl:choose>
      <xsl:when test="($displayId != '')">
        <xsl:value-of select="concat( $displayName, ' (', $displayId, ')' )" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$displayName" />
      </xsl:otherwise>
    </xsl:choose>
    
  </xsl:template>
  
  <xsl:template name="SetTableHeight">
  <xsl:param name="rowCount"/>
    <xsl:if test="$rowCount > 6">
      <xsl:attribute name="style">overflow-y:auto;height:28mm;</xsl:attribute>
    </xsl:if>
  </xsl:template>
  
  
  <xsl:template name="displayAdditionalInfo" >
  
    <xsl:if test="(($ackPresent = $trueString) or($codeEditPresent = $trueString) or ($procStatusPresent= $trueString) or ($changeHistoryPresent = $trueString) or ($napDataPresent = $trueString) or ($indexPresent = $trueString))" >
    <!-- BEGIN Additional Information Forms Table -->
      
      <!-- Additional Information Forms Title Bar and Button -->
      <xsl:call-template name="displayTitle">
        <xsl:with-param name="titleString"   select="$additionalInfoTitleString" />
        <xsl:with-param name="printMode"   select="'additionalInfo'" />
    </xsl:call-template>
    
      <div class="styFormTableContainer">
        <table class="styFormTable">
            <xsl:if test="$ackPresent = $trueString" >
            <tr>          
              <td class="styFormCheckboxContainer"><input name="otherDocument" type="checkbox" class="styCkbox" id="Acknowledgement" value="Acknowledgement"></input></td>
              <td class="styFormDescription"><label for="Acknowledgement">Acknowledgement</label></td>
            </tr>
          </xsl:if>
            <xsl:if test="$codeEditPresent = $trueString" >
            <tr>          
              <td class="styFormCheckboxContainer"><input name="otherDocument" type="checkbox" class="styCkbox" id="CodeAndEdit" value="CodeAndEdit"></input></td>
              <td class="styFormDescription"><label for="CodeAndEdit">Code and Edit Values</label></td>
            </tr>
          </xsl:if>
            <xsl:if test="$procStatusPresent= $trueString" >
            <tr>          
              <td class="styFormCheckboxContainer"><input name="otherDocument" type="checkbox" class="styCkbox" id="ProcessingStatus" value="ProcessingStatus"></input></td>
              <td class="styFormDescription"><label for="ProcessingStatus">Processing Status</label></td>
            </tr>
          </xsl:if>
            <xsl:if test="$changeHistoryPresent = $trueString" >
            <tr>          
              <td class="styFormCheckboxContainer"><input name="otherDocument" type="checkbox" class="styCkbox" id="ChangeHistory" value="ChangeHistory"></input></td>
              <td class="styFormDescription"><label for="ChangeHistory">Change History</label></td>
            </tr>
          </xsl:if>
          <xsl:if test="$napDataPresent = $trueString" >
            <tr>          
              <td class="styFormCheckboxContainer"><input name="otherDocument" type="checkbox" class="styCkbox" id="NAPData" value="NAPData"></input></td>
              <td class="styFormDescription"><label for="NAPData">NAP Request &amp; Response</label></td>
            </tr>
          </xsl:if>
            <xsl:if test="$indexPresent = $trueString" >
            <tr>          
              <td class="styFormCheckboxContainer"><input name="otherDocument" type="checkbox" class="styCkbox" id="Index" value="Index"></input></td>
              <td class="styFormDescription"><label for="Index">Index</label></td>
            </tr>
          </xsl:if>
        </table>
      </div>
    <!-- END Additional Information Forms Table -->  
    </xsl:if>
    
  </xsl:template>
  
  <xsl:template name="createPortraitLandscapeLists" >
  <xsl:param name="portraitNodeSet" />
  <xsl:param name="landscapeNodeSet" />
  
    <script type="text/javascript" language="JavaScript" >
      
      var temp = "";
      <xsl:if test="count($portraitNodeSet) > 0" >
        temp = "<xsl:for-each select="$portraitNodeSet"><xsl:value-of select='./@documentId'/><xsl:if test="position() != last()">,</xsl:if></xsl:for-each>";
        portraitFormList = temp.split(",");   //End Portrait Form List Creation
      </xsl:if>
  
      
      <xsl:if test="count($landscapeNodeSet) > 0" >
        temp = temp + ",";
        temp = temp + "<xsl:for-each select="$landscapeNodeSet"><xsl:value-of select='@documentId'/><xsl:if test="position() != last()">,</xsl:if></xsl:for-each>";
        
      </xsl:if>
      maxCheckedFormList = temp.split(",");


      //Begin Landscape Form List Creation
      <xsl:if test="count($landscapeNodeSet) > 0" >
        temp = "<xsl:for-each select="$landscapeNodeSet"><xsl:value-of select='./@documentId'/><xsl:if test="position() != last()">,</xsl:if></xsl:for-each>";
      
        landscapeFormList = temp.split(",");  //End Landscape Form List Creation
      </xsl:if>

    </script>
  
  </xsl:template>


</xsl:stylesheet>

  
