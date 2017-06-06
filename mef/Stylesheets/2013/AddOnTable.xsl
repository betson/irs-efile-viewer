<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <!--
*****************************************************************************************************
Add-On Table styles
*****************************************************************************************************
Created by: Charles Moore
*****************************************************************************************************
Description: CSS styles for Dependencies and Left-Over tables. These styles are in an XSL stylesheet
instead of a CSS stylesheet because of the calls to gather User Preference values. Gloabally applied
body style is also located here because this stylesheet is always included by both form stylesheets 
and dependencies.

updated 01/05/2004 by Jessica Lee to modify "styDepTblLandscape" to eliminate cell spacing.
updated 02/03/2004 by Ravi Venigalla to add "styTableThead" to show table headers on the second page of print in dependencies.
updated 10/14/2005 by Charlie Moore to add "styTopSectionLineLandscape" for landscape dependencies
*****************************************************************************************************
-->
  <xsl:template name="AddOnStyle">
    .styBodyClass {   /* body style for all stylesheets */
      width: auto; height: auto;
      margin-top: 6px; margin-right: 0px; margin-bottom: 0px; margin-left: 6px;
      color: black; background-color: white;
      background-image: url( "<xsl:value-of select="$PageWatermark"/>" );  /*  url({url}) || none  */
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
      cursor: default;
      zoom: <xsl:value-of select="$ZoomLevel"/>;
    }
    .styDepTitle {   /* Dependency Document Title  */        
      background-color: gold;
      font-family: verdana, arial, sans-serif; font-size: 11pt;
      font-weight: bold;
      text-align: left;
      padding-left: 8px; padding-right: 0px; padding-top:0px; padding-bottom:0px;
    }
    .styDepTitleLine {   /* Dependency Document Title Line */
      width:187mm;
      border-style: solid; border-color: gold;
      border-top-width: 0px; border-bottom-width: 2px; border-left-width: 0px; border-right-width: 0px;
    }
    .styDepTitleLineLandscape {   /* Dependency Document Title Line */
      width:256mm;
      border-style: solid; border-color: gold;
      border-top-width: 0px; border-bottom-width: 2px; border-left-width: 0px; border-right-width: 0px;
    }
    .styDepTbl {   /* Dependency Table */
      width: 187mm;
      font-family: verdana, arial, sans-serif; font-size: 9pt;
      font-weight: normal;
      text-align: center;
      border-style: ridge; border-color: <xsl:value-of select="$UserPref/View/TableHeaderBgColor"/>;   /* set in User Preferences */
      border-top-width: 4px; border-bottom-width: 4px; border-left-width: 4px; border-right-width: 4px;
      border-collapse: collapse;
    }
    .styDepTblLandscape {   /* Dependency Table */
      width: 256mm;
      font-family: verdana, arial, sans-serif; font-size: 9pt;
      font-weight: normal;
      text-align: center;
      border-style: ridge; border-color: <xsl:value-of select="$UserPref/View/TableHeaderBgColor"/>;   /* set in User Preferences */
      border-top-width: 4px; border-bottom-width: 4px; border-left-width: 4px; border-right-width: 4px;
      border-collapse: collapse;
    }

    .styDepTblHdr {   /* Dependency Table Header */
      background-color: <xsl:value-of select="$UserPref/View/TableHeaderBgColor"/>;   /* set in User Preferences */
      color: white;,
      text-align: center;
      vertical-align: middle;
    }
    .styDepTblRow1 {   /* Dependency Table Row 1 */
      background-color: <xsl:value-of select="$UserPref/View/TableRow1BgColor"/>;   /* set in User Preferences */
      cursor: default;
      vertical-align: middle;
    }
    .styDepTblRow2 {   /* Dependency Table Row 2 */
      background-color: <xsl:value-of select="$UserPref/View/TableRow2BgColor"/>;   /* set in User Preferences */
      cursor: default;
      vertical-align: middle;
    }
    .styDepTblCell {   /* Dependency Table Cell */
      padding-top: 4px; padding-bottom: 4px; padding-left: 4px; padding-right: 4px;vertical-align: top; 
      border:1 solid black;
    }    
    .styDepTblRow1Cell {   /* Dependency Table Cell with Background Color for Row 1 */
      background-color: <xsl:value-of select="$UserPref/View/TableRow1BgColor"/>;   /* set in User Preferences */
      padding-top: 4px; padding-bottom: 4px; padding-left: 4px; padding-right: 4px;vertical-align: top; 
      border:1 solid black;
    }    
    .styDepTblRow2Cell {   /* Dependency Table Cell with Background Color for Row 2 */
      background-color: <xsl:value-of select="$UserPref/View/TableRow2BgColor"/>;   /* set in User Preferences */
      padding-top: 4px; padding-bottom: 4px; padding-left: 4px; padding-right: 4px;vertical-align: top; 
      border:1 solid black;
    }    
    .styDepTableThead{ /* Style for Dependency HTML 'thead' element  */
      display:table-header-group;
    }          
    .styTopSectionLine { /* Style for Bold Text Listings at the Top of Dependencies */
      font-size: 10pt;
      margin-top: 5px;
      margin-bottom:5px;
      width:187mm
    }
    .styTopSectionLineLbl {
      font-weight: bold;
      width: 250px;
      text-align: right;
      margin-right: 10px;
    }
    .styTopSectionLineLandscape { /* Style for Bold Text Listings at the Top of Landscape Dependencies */
      font-size: 10pt;
      margin-top: 5px;
      margin-bottom:5px;
      width:256mm
    }
    .styDepTableCellPad {   /* Dependency Table Cell Padding */
      width: 4px;
    }  
    .styDepGenericDiv {
      float:left;
      clear:none;
    }  
    .styExplanationLine {
      width: 118mm;
      float:left;
      clear:none;
    }
            
    .styLeftOverTitleLine {   /* Left Over Document Title Line */
      width: 187mm;      
      border-style: solid; border-color: gold;
      border-top-width: 0px; border-bottom-width: 2px; border-left-width: 0px; border-right-width: 0px;
    }
    .styLeftOverTitle {   /* Left Over Document Title */
      width:35mm;
      font-size:10pt;
      font-family: verdana, arial, sans-serif; 
      font-weight: bold;
      float:left;
      height:5mm;
      background-color: gold;
      text-align: left;
      padding-left: 8px; padding-right: 0px; padding-top:0px; padding-bottom:0px;
    }
    .styLeftOverButtonContainer { /* Style for Container of Left Over Table Button */
      width:151mm;
      text-align:right;
      <xsl:if test="string($Print)">
      visibility:hidden;
      </xsl:if>
    }
    .styLeftoverTableBtn { /* Left Over Table Button Style */
      height:5mm;
      width: 130px;
      font-family: verdana, arial, sans-serif; font-size: 8pt;
      font-weight: bold; font-style: normal;
    }
    .styLeftOverTbl {   /* Left Over Table */
      width:187mm;
    }
    .styLeftOverTableRowDesc { /* Left Over Table Row Description Field */
      width: 100mm;
      font-size: 8pt;
      font-weight: bold;
      text-align: right;
      padding-right: 2mm;
    }
    .styLeftOverTableRowAmount { /* Left Over Table Row Amount Field */
      width:87mm;
      font-size: 8pt;
      text-align:left;
      margin-top: 5px; margin-bottom:5px;
    }
    .styLeftOverTitleLineLandscape {   /* Left Over Document Title Line in Landscape Format */
      width: 256mm;      
      border-style: solid; border-color: gold;
      border-top-width: 0px; border-bottom-width: 2px; border-left-width: 0px; border-right-width: 0px;
    }
    .styLeftOverButtonContainerLandscape { /* Style for Container of Left Over Table Button in Landscape Format */
      width:220.5mm;
      text-align:right;
      <xsl:if test="string($Print)">
      visibility:hidden;
      </xsl:if>
    }
    .styLeftOverTblLandscape {   /* Left Over Table in Landscape Format */
      width:256mm;
    }
    .styTableThead{ /* Style for HTML 'thead' element  */
      display:table-header-group;
    }
    .styRepeatingDataTitle{ /* Style for the titles of repeating data tables */
      font-weight:bold;
      font-size:8pt;
      width:187mm;
    }
  </xsl:template>
</xsl:stylesheet>
