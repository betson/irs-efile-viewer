<?xml version="1.0"?>
<!-- edited with XML Spy v4.4 U (http://www.xmlspy.com) by Ken Dulabhan (Comteq Federal Inc) -->
<!DOCTYPE xsl:stylesheet [
<!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="IRS8910Style.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
<xsl:strip-space elements="*"/>
<xsl:param name="FormData" select="$RtnDoc/IRS8910"/>
<xsl:template match="/">
<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title>
<xsl:call-template name="FormTitle">
<xsl:with-param name="RootElement" select="local-name($FormData)"/>
</xsl:call-template>
</title>
<!-- No Browser Caching -->
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<!-- No Proxy Caching -->
<meta http-equiv="Cache-Control" content="private"/>
<meta name="Description" content="Form IRS 8910"/>
<meta name="GENERATOR" content="IBM WebSphere Studio"/>
<xsl:call-template name="GlobalStylesForm"/>
<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
<xsl:call-template name="InitJS"/>
<style type="text/css">
<!-- ************************************************************************
     Notes: Part I, line 1 thru 5, Part II, 6 and 7, and Part 3, line 11
              is an unbound repeatable columns.
     ************************************************************************** -->
<xsl:if test="not($Print) or $Print=''">
<xsl:call-template name="IRS8910Style"/>
<xsl:call-template name="AddOnStyle"/>
</xsl:if> 
</style>
</head>
<body class="styBodyClass">
<form name="Form8910">
<xsl:call-template name="DocumentHeader"/>
<!--Title of Form -->
<div class="styBB" style="width:187mm;height: 20mm">
<div class="styFNBox" style="width:31mm;font-size: 7pt;height:20mm;">
      Form <span class="styFormNumber">8910</span>
<br/><br/>
<span class="styAgency">Department of the Treasury</span>
<xsl:call-template name="SetFormLinkInline">
 <xsl:with-param name="TargetNode" select="$FormData"/>
 </xsl:call-template>
<br/>
<span class="styAgency">Internal Revenue Service</span>
</div>
<div class="styFTBox" style="height: 22mm;width:125mm;padding-top:3mm;">
<div class="styMainTitle" style="height: 6mm">Alternative Motor Vehicle Credit</div>

<div class="styFST" style="font-size:7pt;margin-left:1mm;font-weight:bold;">
        <div style="margin-left: .5mm;">
 <img src="{$ImagePath}/8910_Triangle_Title.gif" alt="Pointer"/>
       Attach to your tax return.<br/>
          <img src="{$ImagePath}/8910_Triangle_Title.gif" alt="Pointer"/>
             Information about Form 8910 and its separate instructions is at <a href="http://www.irs.gov/form8910">
             <i>www.irs.gov/form8910.</i></a>  
    </div>
<!-- start second-title -->
<!--<div style="margin-left: 1.5mm;">
 <img src="{$ImagePath}/8910_Triangle_Title.gif" alt="Pointer"/>
       Attach to your tax return.<br/>           
</div>-->
<!--<div >
         <img src="{$ImagePath}/8910_Triangle_Title.gif" alt="Pointer"/>
			 Information about Form 8910 and its separate instructions is at 
    </div>
   <a href="http://www.irs.gov/form8910" title="Link to IRS.gov">
                <i>www.IRS.gov/form8910</i>
            </a> -->
            <!-- End Second title -->
</div>
</div>
<div class="styTYBox" style="width:30mm;height:20mm; border-left-width: 1px">
<div class="styOMB" style="height:auto;">OMB No. 1545-1998</div>
<div class="styTY" style="height:9mm">20<span class="styTYColor">13</span>
</div>
<div class="stySequence">Attachment<br/>Sequence No. <b>152</b>
</div>
</div>
</div>
<!--  End title of Form   -->
<!--  Name and Employer identification number  -->
<div class="styBB" style="width:187mm">
<div class="styNameBox" style="width:141mm;font-size:7pt;height:auto;">Name(s) shown on return<br/>
<div style="font-family:verdana;font-size:6pt;height:6mm">
<xsl:choose>
	<xsl:when test="$RtnHdrData/ReturnTypeCd='1040'">
		<xsl:call-template name="PopulateReturnHeaderFiler">
		<xsl:with-param name="TargetNode">Name</xsl:with-param>
		</xsl:call-template>
	</xsl:when>
	<xsl:otherwise>
		<xsl:call-template name="PopulateReturnHeaderFiler">
		<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
		</xsl:call-template>
		<br/> 
		<xsl:call-template name="PopulateReturnHeaderFiler">
		<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
		</xsl:call-template>						
	</xsl:otherwise>
</xsl:choose>
</div>
</div>
<!--   ****************************************************************************** -->     
<div class="styEINBox" style=" padding-left:2mm; font-size:7pt;">
<span class="BoldText">Identifying number</span>
<br/>
<div style="text-align:left;font-weight:normal; ">
<br/>
<xsl:choose>
	<xsl:when test="$RtnHdrData/ReturnTypeCd='1040'">
		<xsl:call-template name="PopulateReturnHeaderFiler">
		<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
		</xsl:call-template>
	</xsl:when>
	<xsl:otherwise>
		<xsl:call-template name="PopulateReturnHeaderFiler">
		<xsl:with-param name="TargetNode">EIN</xsl:with-param>
		</xsl:call-template>
	</xsl:otherwise>
</xsl:choose>
</div>
</div>
</div>
<!--  End Name and Employer indentification number  -->
<!-- *******************************************************************  -->
<!--  line 1a4  -->
 <div style="width: 187mm"><b>Note.</b></div>
  <div style="width: 187mm">
  <span class="styBoldText">
  <img src="{$ImagePath}/8910_Bullet_Round.gif" alt="SmalllBullet"/> 
   </span>
    <span style="width: 1mm"/>Use this form to claim the credit for certain alternative motor vehicles.
</div>
<div class="styBB" style="width: 187mm">
<span class="styBoldText">
<img src="{$ImagePath}/8910_Bullet_Round.gif" alt="SmalllBullet"/> 
</span>
Claim the credit for certain plug-in electric vehicles on Form 8936.
</div>
<!-- *******************************************************************  -->
<!--  Part I -->
<div class="styBB" style="width: 187mm;">
<div class="styPartName">Part I</div>
<div class="styPartDesc">Tentative Credit</div>
</div>
<!--  End Part I -->
<xsl:if test="($Print != $Separated) or (count($FormData/IRS8910TentativeCreditGrp) &lt;= 2)">
<xsl:for-each select="$FormData/IRS8910TentativeCreditGrp">
<xsl:variable name="pos" select="position()"/>
<xsl:if test="(position() mod 2)=1">
<!--print logic-->
<!--end-->
<table class="styTable" cellspacing="0" cellpadding="0" border="0" style="width: 187mm;font-size: 7pt; font-family:verdana;">
<tr style="height: 8mm">
<th scope="col" class="PopulateTxt" style="border-color:black;border-bottom-width:1px;padding-left:0px;padding-right:0px;"/>
<th scope="col" class="PopulateTxt" colspan="2" style="width:83.5mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width:1mm; border-bottom-width:0px; text-align: left;padding-left:0px;padding-right:0px;">
<span class="styNormalText" style="font-size:6pt;"> Use a separate column for each vehicle. If you need more columns, use additional Forms 8910 and include the total on lines 7 and 11.
</span>
</th>
<th scope="col" class="styTableCell" style=";border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width:0px;border-bottom-width:0px; text-align: center">(
<xsl:number value="($pos)" format="a"/>)
<span style="font-weight:normal;">Vehicle <xsl:number value="($pos)" format="1"/></span>
</th>
<th scope="col" class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width:0px;border-bottom-width:0px; text-align: center;">(
<xsl:number value="($pos + 1)" format="a"/>)
<span style="font-weight:normal;">Vehicle 
<xsl:number value="($pos + 1)" format="1"/></span>
</th>
</tr>
<tfoot/>
<tbody>
<!--  Line 1   -->
<tr>
<td class="styTableCell" style="width:5.25mm;text-align:right;font-weight:bold;padding-bottom:0mm;border-color:black;border-top-width:1px;border-right-width:0px;border-bottom-width:0px;padding-top:5mm;">
<b>1</b>
</td>
<td class="styTableCell" style="width: 84mm;padding-left:2mm; text-align:left; 
border-color: black; border-left-width: 0px; border-right-width: 0px;
border-top-width:1px; border-bottom-width:0px;;padding-bottom:0mm;padding-top:5mm;">
<span style="float: left; clear: none;">Year, make, and model of vehicle</span>
  <span class="styDotLn" style="float:right;padding-right:2mm;">.......</span>
</td>
<td class="styLNRightNumBoxNBB" style="border-left-width:1px;height:10mm;padding-top:5.75mm;padding-bottom:0px;
border-bottom-width:0px;border-top-width:1px;border-right-width:0px;
background-color:lightgrey;padding-left:0px;padding:right:0px;">
<span class="styLNRightNumBox" style="width:8mm;padding-bottom:0mm;f
 loat:right;border-top-width:0px;border-left-width:0px;background-color:white;
padding-left:0px;padding-right:1px">1
</span>
</td>
<td class="styTableCell" style="width:45mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px; text-align: left;
 padding-left:0mm;padding-right:1mm">
<span class="styTableCellPad"/>
<span class="styDotLn" style="padding-right:.5mm;"></span>
<xsl:call-template name="PopulateYear">
<xsl:with-param name="TargetNode" select="VehicleDescriptionGrp/VehicleYear"/>
</xsl:call-template>
    <br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="VehicleDescriptionGrp/VehicleMake"/>
</xsl:call-template>
 <br/>
 <span class="styDotLn" style="padding-right:.5mm;"></span>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="VehicleDescriptionGrp/VehicleModel"/>
</xsl:call-template>
</td>
<td class="styTableCell" style="width:45mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width:1px; text-align: left">
<span class="styTableCellPad"/>
<span class="styDotLn" style="padding-right:.5mm;"></span>
<xsl:call-template name="PopulateYear">
<xsl:with-param name="TargetNode" select="$FormData/IRS8910TentativeCreditGrp [$pos + 1]/VehicleDescriptionGrp/VehicleYear"/>
</xsl:call-template><br/>

<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$FormData/IRS8910TentativeCreditGrp [$pos + 1]/VehicleDescriptionGrp/VehicleMake"/>
</xsl:call-template>
<br/>
 <span class="styDotLn" style="padding-right:.5mm;"></span>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$FormData/IRS8910TentativeCreditGrp [$pos + 1]/VehicleDescriptionGrp/VehicleModel"/>
</xsl:call-template>
</td>
</tr>
<!-- Line 2  -->
<tr>
<td class="styTableCell" style="width:5.25mm;text-align:right;font-weight:bold; border-right-width: 0px;border-bottom-width:0px;padding-top:2mm;" valign="top">2</td>
<td class="styTableCell" style="width: 84mm;padding-left:2mm;text-align: left;    border-color: black; border-left-width: 0px; border-right-width: 0px;   border-top-width: 0px; border-bottom-width:0px;">
 <span style="float: left; clear: none;">Vehicle identification number (see instructions)</span>
  <span class="styDotLn" style="float:right;padding-right:2mm;">..</span>
</td>
<td class="styLNRightNumBox" style="border-bottom-width:1px; height:7mm;padding-top:3mm">2</td>
<td class="styTableCell" style="border-color: black; border-left-width:1px; border-right-width:1px; border-top-width: 0px; border-bottom-width:1px;padding-left:14mm" valign="bottom">
<span class="styTableCellPad"/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="VIN"/>
</xsl:call-template>
</td>
<td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px;border-top-width: 0px; border-bottom-width:1px;padding-left:14mm" valign="bottom">
<span class="styTableCellPad"/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$FormData/IRS8910TentativeCreditGrp[$pos + 1]/VIN"/>
</xsl:call-template>
</td>
</tr>
<!-- Line 3  -->
<tr style="font-size: 7pt">
<td class="styTableCell" style="width:5.25mm;text-align:right;font-weight:bold;border-right-width: 0px; border-bottom-width:0px;padding-bottom:1.75mm;">3
</td>
<td class="styTableCell" style="width: 84mm; padding-left:2mm;text-align: left; border-color: black;border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;">Enter date vehicle was placed in service (MM/DD/YYYY)
 </td>
<td class="styLNRightNumBox" style="height: 4.75mm;">3</td>
<td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-left:2mm;">
<span class="styTableCellPad"/>
<xsl:call-template name="PopulateMonthDayYear">
<xsl:with-param name="TargetNode" select="VehiclePlacedInServiceDt"/>
</xsl:call-template>
</td>
<td class="styTableCell" style="border-color: black; border-left-width: 0px;  border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;padding-left:2mm">
<span class="styTableCellPad"/>
<xsl:call-template name="PopulateMonthDayYear">
<xsl:with-param name="TargetNode" select="$FormData/IRS8910TentativeCreditGrp[$pos + 1]/VehiclePlacedInServiceDt"/>
</xsl:call-template>
</td>
</tr>
<!-- Line 4  -->
<tr>
<td class="styTableCell" style="width:5.25mm;text-align:right;font-weight:bold;
border-color:black;border-right-width:0px;border-bottom-width:1px;" valign="top">4</td>
<td class="styTableCell" style="width: 84mm;padding-left:2mm;text-align: left; 
 border-color: black; border-left-width: 0px; border-right-width: 0px; 
border-top-width: 0px; border-bottom-width:1px">
<b>Tentative credit</b> (see instructions for amount to enter)
</td>
<td class="styLNRightNumBox" style="border-bottom-width:1px;">4</td>
<td class="styTableCell" style="border-color: black; border-left-width:1px;
 border-right-width:1px; border-top-width: 0px; border-bottom-width:1px;padding-left:14mm" valign="bottom">
<span class="styTableCellPad"/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="AltMotorVehTentativeCreditAmt"/>
</xsl:call-template>
</td>
<td class="styTableCell" style="border-color: black; border-left-width: 0px; 
 border-right-width: 0px; border-top-width: 0px; border-bottom-width:01px;;padding-left:14mm" valign="bottom">
<span class="styTableCellPad"/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/IRS8910TentativeCreditGrp[$pos + 1]/AltMotorVehTentativeCreditAmt"/>
</xsl:call-template>
</td>
</tr>
</tbody>
</table>
</xsl:if>
</xsl:for-each>
</xsl:if>
<!-- Display if there are no data elements, or Print is set to separated and there are more than 2 elements.  Be sure to test by commenting 
 out "if separated" statements in 3 places: at top of form, on transmissionXML.xml print paramter and in the populateTemplate globalStylesForm -->
<xsl:if test="(count($FormData/IRS8910TentativeCreditGrp)=0) or (($Print = $Separated) and (count($FormData/IRS8910TentativeCreditGrp) &gt; 2))">
<div class="styIRS8910TableContainer" id="Spcctn">
<!--print logic for the table that remains empty if separated (repeating) data appears at the bottom of form-->
<xsl:call-template name="SetInitialState"/>
<!--end-->
<!-- blank lines -->
<table class="styTable" cellspacing="0" style="font-size: 7pt">
<thead class="styTableThead">
<tr style="height: 8mm">
<th scope="col" class="PopulateTxt" style="border-color:black;border-bottom-width:1px;padding-left:0px;padding-right:0px;"/>
<th scope="col" class="PopulateTxt" colspan="2" style="width:83.5mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width:1mm; border-bottom-width:0px; text-align: left;padding-left:0px;padding-right:0px;">
<span class="styNormalText" style="font-size:6pt;"> Use a separate column for each vehicle. If you need more columns, use additional Forms 8910 and include the total on lines 7 and 11.
</span>
</th>
<th scope="col" class="styTableCell" style="width:45mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px;border-bottom-width:0px; text-align: center">(a) Vehicle 1
</th>
<th scope="col" class="styTableCell" style="width:46mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px;border-bottom-width:0px; text-align: center;">(b) Vehicle 2
</th>
</tr>
</thead>
<tfoot/>
<tbody>
<!--  Line 1   -->
<tr>
<td class="styTableCell" style="width:6mm;text-align:right;font-weight:bold;padding-top:6mm;border-color:black;border-top-width:1px;border-right-width:0px;border-bottom-width:0px;padding-right:0mm;">
<b>1</b>
</td>
<td class="styTableCell" style="width: 82mm;padding-left:2mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width:1px; border-bottom-width:0px;padding-top:6mm;">
<span style="float: left; clear: none;">Year, make, and model of vehicle</span>
  <span class="styDotLn" style="float:right;padding-right:2mm;">.......</span>
</td>
<td class="styLNRightNumBoxNBB" style="border-left-width:1px;padding-top:5mm;padding-bottom:0px;border-bottom-width:0px;border-top-width:1px;border-right-width:0px;background-color:lightgrey;padding-left:0px; padding-right:0px">
<span class="styLNRightNumBox" style="width:8mm;height:4.2mm;padding-bottom:0mm;float:right;border-top-width:0px; border-left-width:1px;background-color:white;padding-left:0px;padding-right:0px">1
</span>
</td>
<xsl:choose>
<!-- Display "Additional Data" message if Print is set to separated and there are more than 3 elements -->
<xsl:when test="(($Print = $Separated) and (count($FormData/IRS8910TentativeCreditGrp) &gt; 2))">
<td class="styTableCell" style="border-color: black; border-left-width: 1px;border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px;text-align:center;padding-top:5mm">
<xsl:call-template name="PopulateAdditionalDataTableMessage">
<xsl:with-param name="ShortMessage">true</xsl:with-param>
<xsl:with-param name="TargetNode" select="$FormData/IRS8910TentativeCreditGrp/VehicleDescriptionGrp"/>
</xsl:call-template>
</td>
</xsl:when>
<xsl:otherwise>
<td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px; text-align: center">
<span class="styTableCellPad"/>
</td>
</xsl:otherwise>
</xsl:choose>
<td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width:1px; text-align: center">
<span class="styTableCellPad"/>
</td>
</tr>
<!-- Line 2  -->
<tr>
<td class="styTableCell" style="width:5.25mm;font-weight:bold;padding-left:.5mm;
 border-right-width: 0px;border-bottom-width:0px;">2</td>
<td class="styTableCell" style="width: 82mm;padding-left:2mm;text-align: left; 
 border-color: black; border-left-width: 0px; border-right-width: 0px;border-top-width: 0px; border-bottom-width:0px;">
  <span style="float: left; clear: none;">Vehicle identification number (see instructions)</span>
  <span class="styDotLn" style="float:right;padding-right:2mm;">..</span>
</td>
<td class="styLNRightNumBox" style="border-bottom-width:1px;">2</td>
<td class="styTableCell" style="border-color: black; border-left-width:1px;
 border-right-width:1px; border-top-width: 0px; border-bottom-width:1px;" valign="bottom">
<span class="styTableCellPad"/>
</td>
<td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px;border-top-width: 0px; border-bottom-width:1px;" valign="bottom">
<span class="styTableCellPad"/>
</td>
</tr>
<!-- Line 3  -->
<tr style="font-size: 7pt">
<td class="styTableCell" style="width:5.25mm;text-align:right;font-weight:bold;padding-right:0mm;border-right-width: 0px;border-bottom-width:0px;padding-left:.5mm;">3
</td>
<td class="styTableCell" style="width: 82mm;padding-left:2mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px">
   Enter date vehicle was placed in service (MM/DD/YY)
</td>
<td class="styLNRightNumBox">3</td>
<td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: right">
<span class="styTableCellPad"/>
</td>
<td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: right">
<span class="styTableCellPad"/>
</td>
</tr>

<!-- ***********************************************************************************  -->
<!-- Line 4  -->
<tr>
<td class="styTableCell" style="width:5.25mm;text-align:right;font-weight:bold;
border-color:black;border-right-width:0px;border-bottom-width:1px;" valign="top">4</td>
<td class="styTableCell" style="width: 82mm;padding-left:2mm;text-align: left; 
 border-color: black; border-left-width: 0px; border-right-width: 0px; 
border-top-width: 0px; border-bottom-width:1px">
<b>Tentative credit.</b> (see instructions for amount to enter)
</td>
<td class="styLNRightNumBox" style="border-bottom-width:1px;">4</td>
<td class="styTableCell" style="border-color: black; border-left-width:1px;
border-right-width:1px; border-top-width: 0px; border-bottom-width:1px;" valign="bottom">
<span class="styTableCellPad"/>
</td>
<td class="styTableCell" style="border-color: black; border-left-width: 0px; 
 border-right-width: 0px; border-top-width: 0px; border-bottom-width:01px;" valign="bottom">
<span class="styTableCellPad"/>
</td>
</tr>
<!-- ***********************************************************************************  -->
</tbody>
</table>
</div>
</xsl:if>
<!--  Part II -->
<div style="width: 187mm;border-top-width:0px;"><br/>
<span style="padding-left:7mm"/>
<b>Next:</b> If you did NOT use your vehicle for business or 
 investment purposes and did not have a credit from a partnership or<br/>
<span style="padding-left:7mm;border-top-width:1px;"/> S corporation, skip Part II and go to Part III. ALL others, go to Part II.<br/><br/>
</div>
<div class="styBB" style="width: 187mm;border-top-width:1px">
<div class="styPartName">Part II</div>
<div class="styPartDesc">Credit for Business/Investment Use Part of Vehicle</div>
</div><br/>
<div style="width:187mm">
<!-- Added by Doug Peterson-->
<!--  End Part II header-->
<xsl:if test="($Print != $Separated) or (count($FormData/BusinessInvestmentUseGrp) &lt;= 2)">
<xsl:for-each select="$FormData/BusinessInvestmentUseGrp">
<xsl:variable name="pos" select="position()"/>
<xsl:if test="(position() mod 2)=1">
<div class="styIRS8910TableContainer" id="Spcctn">
<!--print logic-->
<xsl:call-template name="SetInitialState"/>
<!--end-->
<table class="styTable" cellspacing="0" cellpadding="0" border="0" style="font-size: 7pt;font-family:verdana">
<thead class="styTableThead"/>
<tfoot/>
<tbody>
<!-- line 5 -->
<tr>
<td class="styTableCell" style="width:5.25mm;text-align:right;font-weight:bold;  border-right-width:0px;border-bottom-width:0px;">5
</td>
<td class="styTableCell" style="width:82mm; padding-left:2mm;text-align:left;border-color:black;border-left-width:0px;border-right-width: 0px;border-top-width:0px;border-bottom-width:0px;padding-top:.5mm;font-size:7pt;">
 Business/investment use percentage (see instructions)
</td>
<td class="styLNRightNumBox">5</td>
<td class="styTableCell" style="border-color: black; border-left-width:1px;width:48mm; border-right-width:0px; border-top-width: 0px; border-bottom-width:1px;" valign="bottom">
<span class="styTableCellPad"/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="BusinessInvestmentUsePct"/>
</xsl:call-template>%
</td>
<td class="styTableCell" style="border-color: black; border-left-width:1px;width:45mm; border-right-width:0px; border-top-width: 0px; border-bottom-width:1px;" valign="bottom">
<span class="styTableCellPad"/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$FormData/BusinessInvestmentUseGrp[$pos + 1]/BusinessInvestmentUsePct"/>
</xsl:call-template>%
</td>
</tr>
<!-- Line 6 -->
<tr>
<td class="styTableCell" style=";width:5.5mm;text-align:right;  font-weight:bold;border-right-width: 0px;border-bottom-width:0px;" valign="center">6</td>
<td class="styTableCell" style="width:82mm; padding-left:2mm;text-align: left;   border-color: black; border-left-width: 0px; border-right-width: 0px;   border-top-width: 0px; border-bottom-width:0px;font-size:7pt;">Multiply line 4 by line 5<b>
 <span style="letter-spacing:4mm;font-weight:bold">........</span>
</b>
</td>
<td class="styLNRightNumBox" style="border-bottom-width:1px;">6</td>
<td class="styTableCell" style="border-color: black; border-left-width:1px;width:48mm; border-right-width:0px; border-top-width: 0px; border-bottom-width:1px;" valign="bottom">
<span class="styTableCellPad"/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="BusinessInvestmentUseAmt"/>
</xsl:call-template>
</td>
<td class="styTableCell" style="border-color: black; border-left-width: 1px;width:45mm; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;" valign="bottom">
<span class="styTableCellPad"/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/BusinessInvestmentUseGrp[$pos + 1]/BusinessInvestmentUseAmt"/>
</xsl:call-template>
</td>
</tr>
</tbody>
</table>
</div>
</xsl:if>
</xsl:for-each>
</xsl:if>
<!-- Display if there are no data elements, or Print is set to separated and there are more than 2 elements.  Be sure to test by commenting 
 out "if separated" statements in 3 places: at top of form, on transmissionXML.xml print paramter and in the populateTemplate globalStylesForm -->
<xsl:if test="(count($FormData/BusinessInvestmentUseGrp)=0) or (($Print = $Separated)              and (count($FormData/BusinessInvestmentUseGrp) &gt; 2))">
<div class="styIRS8910TableContainer" id="Spcctn">
<!--print logic for the table that remains empty if separated (repeating) data appears at the bottom of form-->
<xsl:call-template name="SetInitialState"/>
<!--end-->
<!-- blank lines -->
<table class="styTable" cellspacing="0" style="font-size: 7pt">
<tfoot/>
<tbody>
<!-- line 5  -->
<tr>
<td class="styTableCell" style="padding-left:.25mm;width:5.5mm;text-align:right;  font-weight:bold;border-right-width: 0px;border-bottom-width:0px;">5
</td>
<td class="styTableCell" style="width:82mm;text-align:left;padding-left:2mm; border-color:black; border-left-width:0px;border-right-width: 0px;border-top-width:0px; border-bottom-width:0px;font-size:7pt;padding-top:.5mm;">
Business/investment use percentage (See instructions)
</td>
<td class="styLNRightNumBox" style="border-bottom-width:1px;border-left:width:0px; border-right-width:1px;">5</td>
<xsl:choose>
<!-- Display "Additional Data" message if Print is set to separated and there are more than 2 elements -->
<xsl:when test="(($Print = $Separated) and (count($FormData/BusinessInvestmentUseGrp) &gt; 2))">
<td class="styTableCell" style="padding-left:1mm;width:45mm;border-color: black; border-left-width: 0px; border-right-width:0px; border-top-width:0px;border-bottom-width:1px; text-align:center;">
<xsl:call-template name="PopulateAdditionalDataTableMessage">
<xsl:with-param name="ShortMessage">true</xsl:with-param>
<xsl:with-param name="TargetNode" select="$FormData/BusinessInvestmentUseGrp/BusinessInvestmentUsePct"/>
</xsl:call-template>
<span style="text-align:right;padding-left:7.5mm;width:auto">%</span>
</td>
</xsl:when>
<xsl:otherwise>
<td class="styTableCell" style="width:47mm;border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px;  border-bottom-width:1px; text-align: right">
<span class="styTableCellPad"/>%
</td>
</xsl:otherwise>
</xsl:choose>
<td class="styTableCell" style="width:45mm;border-color: black; border-left-width: 1px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px">
<span class="styTableCellPad"/>%
</td>
</tr>
<!-- Line 6  -->
<tr>
<td class="styBoldText" style="padding-left: 4mm;width:6mm;padding-top:.5mm;">6</td>
<td class="styTableCell" style="width:82mm; text-align: left;padding-left:2mm; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px">Multiply line 4 by line 5<b>
<span style="letter-spacing:4mm;font-weight:bold">........</span>
 </b>
</td>
<td class="styLNRightNumBox" style="border-bottom-width:1px;border-left:width:0px; border-right-width:1px;">6</td>
<td style="border-style:solid black;border-color:black;border-bottom: 1px solid black;  border-left-width:1px;border-right-width:1 solid black; border-right-width:1px; border-top-width: 0px; border-bottom-width:1px;" valign="bottom">
<span class="styTableCellPad" style="border-color:black;  border-left-width:1px;border-right-width:1px; border-top-width:0px; border-bottom-width:1px "/>
</td>
<td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;">
<span class="styTableCellPad"/>
</td>
</tr>
</tbody>
</table>
</div>
</xsl:if>
<!--  Line 7 -->
<div style="width: 187mm">
<div class="styLNLeftNumBox" style="padding-left: 4mm">7</div>
<div style="float:left;padding-top:.5mm;">Add columns (a) and (b) on line 6
 </div>
<div style="float:right;">
<span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold; float:left">................
</span>
<div class="styLNRightNumBox" style="border-bottom-width: 1px">7</div>
<div class="styLNAmountBox" style="border-bottom-width: 1px;width:44.7mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/TotalBusinessInvestmentUseAmt"/>
</xsl:call-template>
</div>
</div>
</div>
<!--  Line 8 -->
<div style="width: 187mm">
<div class="styLNLeftNumBox" style="padding-left: 4mm;">8</div>
<div style="float:left;padding-top:.5mm;">Alternative motor vehicle credit from partnerships and S corporations
</div>
<div style="float:right;">
<span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold; float:left">......
</span>
<div class="styLNRightNumBox" style="border-bottom-width: 1px">8</div>
<div class="styLNAmountBox" style="border-bottom-width: 1px;width:44.7mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/AlternativeMotorVehicleCrAmt"/>
</xsl:call-template>
</div>
</div>
</div>
<!--  Line 9-->
<div style="width: 187mm">
<div class="styLNLeftNumBox" style="padding-left: 4mm;">9</div>
<div style="float:left;padding-top:.5mm;">
<b>Business/investment use part of credit. </b>Add lines 7 and 8. 
Partnerships and S corporations, 
</div>
<div style="float:right;">
<span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold; float:left"/>
<div class="styLNRightNumBox" style="border-bottom-width: 0px;background-color:lightgrey;"/>
<div class="styLNAmountBox" style="border-bottom-width: 0px;width:44.7mm;"/>
</div>
</div>
<!-- end  Line 9a -->
<!--  Line 9b -->
<div style="width: 187mm">
<div class="styLNLeftNumBox" style="padding-left: 2mm"/>
<div style="float:left;padding-top:.5mm;">report this amount on Schedule K. All others, report this amount on Form 3800, line 1r
</div>
<div style="float:right;">
<span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold; float:left">...
</span>
<div class="styLNRightNumBox" style="border-bottom-width: 0px">9</div>
<div class="styLNAmountBox" style="border-bottom-width: 0px;width:44.7mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/BusinessInvstUsePartOfCrAmt"/>
</xsl:call-template>
</div>
</div>
</div>
</div>
<!--  end Line 9b -->
<!--   Part III header -->
<div class="styBB" style="width:187mm;border-top-width:1px">
<div class="styPartName">Part III</div>
<div class="styPartDesc">Credit for Personal Use Part of Vehicle</div>
</div>
<!-- Line 10  -->
<div style="width:187mm">
<xsl:if test="($Print != $Separated) or (count($FormData/TentativeCreditForPrsnlUseAmt) &lt;= 2)">
<xsl:for-each select="$FormData/TentativeCreditForPrsnlUseAmt">
<xsl:variable name="pos" select="position()"/>
<xsl:if test="(position() mod 2)=1">
<div class="styIRS8910TableContainer" id="Spcctn">
<!--print logic-->
<xsl:call-template name="SetInitialState"/>
<!--end-->
<table class="styTable" cellspacing="0" border="0" cellpadding="0" style="font-size: 7pt;font-family:verdana">
<thead class="styTableThead"/>
<tfoot/>
<tbody>
<tr style="font-size: 7pt">
<td class="styTableCell" style="width:5.25mm;text-align:right;font-weight:bold;  border-right-width: 0px;border-bottom-width:0px;padding-bottom:4mm;">10</td>
<td class="styTableCell" style="width: 82mm; padding-left:2mm;  text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px">
If you skipped Part II, enter the amount from line 4.
If you completed Part II, subtract line 6 from line 4
<span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold;">.</span>
</td>
<td class="styLNRightNumBoxNBB" style="border-left-width:1px;padding-top:0px;padding-bottom:0px;  border-bottom-width:0px;border-top-width:0px;border-right-width:0px; background-color:lightgrey;padding-left:0px;padding:right:0px">
<span class="styLNRightNumBox" style="width:8mm;height:7mm;padding-bottom:0mm;padding-top:3mm;float:right;border-top-width:0px; border-left-width:1px;background-color:white;padding-left:0px;padding-right:0px;">10
 </span>
</td>
<td class="styTableCell" style="border-color: black; border-left-width: 1px;width:47mm; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; text-align: right;padding-top:3mm">
<span class="styTableCellPad"/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/TentativeCreditForPrsnlUseAmt[$pos]"/>
</xsl:call-template>
</td>
<td class="styTableCell" style="border-color: black; border-left-width: 0px;width:44.7mm; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: right;;padding-top:3mm">
<span class="styTableCellPad"/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/TentativeCreditForPrsnlUseAmt[$pos + 1]"/>
</xsl:call-template>
</td>
</tr>
</tbody>
</table>
</div>
</xsl:if>
</xsl:for-each>
</xsl:if>
<!-- Display if there are no data elements, or Print is set to separated and there are more than 2 elements.  Be sure to test by commenting 
 out "if separated" statements in 3 places: at top of form, on transmissionXML.xml print paramter and in the populateTemplate globalStylesForm -->
<xsl:if test="(count($FormData/TentativeCreditForPrsnlUseAmt)=0) or (($Print = $Separated) and (count($FormData/TentativeCreditForPrsnlUseAmt) &gt; 2))">
<div class="styIRS8910TableContainer" id="Spcctn">
<!--print logic for the table that remains empty if separated (repeating) data appears at the bottom of form-->
<xsl:call-template name="SetInitialState"/>
<!--end-->
<table class="styTable" cellspacing="0" style="font-size: 7pt">
<thead class="styTableThead"/>
<tfoot/>
<tbody>
<!-- line 17 -->
<tr style="font-size: 7pt">
<td class="styBoldText" style="font-size: 7pt; padding-left: 2mm;width:4mm;  padding-bottom:2mm;">10
</td>
<td class="styTableCell" style="width: 82mm; text-align: left; border-color: black;  border-left-width: 0px; border-right-width: 0px; border-top-width: 0px;border-bottom-width:0px;padding-left:2mm;">if you skipped Part II, enter the amount from line 4. if you completed Part II, subtract line 6 from line 4
</td>
<td class="styLNRightNumBoxNBB" style="border-left-width:1px;height:7mm;padding-top:3mm;padding-bottom:0px;  border-bottom-width:0px;border-top-width:0px;border-right-width:0px;  background-color:lightgrey;padding-left:0px;padding-right:0px">
<span class="styLNRightNumBox" style="width:8mm;padding-bottom:0mm;float:right;border-top-width:0px; border-left-width:1px;background-color:white;padding-left:0px;padding-right:0px">10
</span>
</td>
<xsl:choose>
<!-- Display "Additional Data" message if Print is set to separated and there are more than 2 elements -->
<xsl:when test="(($Print = $Separated) and (count($FormData/TentativeCreditForPrsnlUseAmt) &gt; 2))">
<td class="styTableCell" style="width:47mm;border-color: black; border-left-width:1px; border-right-width:1px;  border-top-width:0px; border-bottom-width:1px; text-align:center;">
<xsl:call-template name="PopulateAdditionalDataTableMessage">
<xsl:with-param name="ShortMessage">true</xsl:with-param>
<xsl:with-param name="TargetNode" select="$FormData/TentativeCreditForPrsnlUseAmt"/>
</xsl:call-template>
</td>
<td class="styTableCell" style="border-color: black; border-left-width: 0px;width:45mm;  border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: right;">
<span class="styTableCellPad"/>
</td>
</xsl:when>
<xsl:otherwise>
<!-- separated but no data -->
<td class="styTableCell" style="width:47mm;border-color: black; border-left-width:1px; border-right-width:1px;  border-top-width:0px; border-bottom-width:1px; text-align:center;">
</td>
<td class="styTableCell" style="border-color: black; border-left-width: 0px;width:45mm;  border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; text-align: right;">
</td>
</xsl:otherwise>
</xsl:choose>
</tr>
</tbody>
</table>
</div>
</xsl:if>
</div>
<!--  Line 11 -->
<div style="width: 187mm">
<div class="styLNLeftNumBox" style="padding-left: 2mm;">11</div>
<div style="float:left;padding-top:.5mm;">Add columns (a) and (b) on line 10
</div>
<div style="float:right;">
<span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold; float:left">..............
</span>
<div class="styLNRightNumBox" style="border-bottom-width: 1px;">11</div>
<div class="styLNAmountBox" style="border-bottom-width: 1px;width:45mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/TotalTentativeCrForPrsnlUseAmt"/>
</xsl:call-template>
</div>
</div>
</div>
<!-- End Line 11 -->
<!--  Line 12 -->
<div style="width: 187mm">
<div class="styLNLeftNumBox" style="padding-left: 2mm;">12</div>
<div style="float:left;padding-top:.5mm;">Enter the amount from Form 1040, line 46, or Form 1040NR, line 44
</div>
<div style="float:right;">
<span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold; float:left">.....
</span>
<div class="styLNRightNumBox" style="border-bottom-width: 1px;">12</div>
<div class="styLNAmountBox" style="border-bottom-width: 1px;width:45mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/TotalTaxBeforeCrAndOthTaxesAmt"/>
</xsl:call-template>
</div>
</div>
</div>
<!-- End Line 12 -->
  <!-- Start Line 13 -->
<div style="width: 187mm">
<div class="styLNLeftNumBox" style="padding-left: 2mm;">13</div>
<div style="float:left;padding-top:.5mm;">Personal credits from Form 1040 or 1040NR (see instructions)
</div>
<div style="float:right;">
<span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold; float:left">......
</span>
<div class="styLNRightNumBox" style="border-bottom-width: 1px;">13</div>
<div class="styLNAmountBox" style="border-bottom-width: 1px;height:4mm;width:45mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/AltMotorVehCreditFromFormsAmt"/>
</xsl:call-template>
</div>
</div>
</div>
<!-- End Line 13B -->
<!-- Start Line 14A -->
<div style="width: 187mm">
<div class="styLNLeftNumBox" style="padding-left: 2mm;">14</div>
<div style="float:left;padding-top:.5mm;">Subtract line 13 from line 12.  If zero or less,
enter -0- and stop here. You 
</div>
<div style="float:right;">
<!--<span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold; float:left">...........
</span>-->
<div class="styLNRightNumBox" style="border-bottom-width: 0px;background-color:lightgrey"/>
<div class="styLNAmountBox" style="border-bottom-width: 0px;width:45mm;">

</div>
</div>
</div>
<!-- End Line 14A -->
<!-- Start Line 14B -->
<div style="width: 187mm">
<div class="styLNLeftNumBox" style="padding-left: 2mm;"/>
<div style="float:left;padding-top:.5mm;">cannot claim the personal use part of the credit
</div>
<div style="float:right;">
<span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold; float:left">.........
</span>
<div class="styLNRightNumBox" style="border-bottom-width: 1px;">14</div>
<div class="styLNAmountBox" style="border-bottom-width: 1px;height:4mm;width:45mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/AltMotorVehAdjustedCreditAmt"/>
</xsl:call-template>
</div>
</div>
</div>
<!-- End Line 14B -->
 <!-- Start Line 15A -->
<div style="width: 187mm">
<div class="styLNLeftNumBox" style="padding-left: 2mm;">15</div>
<div style="float:left;padding-top:.5mm;"><b> Personal use part of credit.</b> Enter the <b>smaller</b> of line 11 or line 14 here and on Form 
</div>
<div style="float:right;">
<!--<span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold; float:left">...........
</span>-->
<div class="styLNRightNumBox" style="border-bottom-width: 0px;background-color:lightgrey;"/>
<div class="styLNAmountBox" style="border-bottom-width: 0px;width:45mm;">
<!--<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/TotTentCreditForPersonalUse"/>
</xsl:call-template>-->
</div>
</div>
</div>
<!-- End Line 15A -->
<!-- Start Line 15B -->
<div style="width: 187mm">
<div class="styLNLeftNumBox" style="padding-left: 2mm;"/>
<div style="float:left;padding-top:.5mm;">1040, line 53   (or Form 1040NR, line 50).  Check box <b>c</b> on that line and enter "8910" in 
</div>
<div style="float:right;">
<!--<span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold; float:left">...........
</span>-->
<div class="styLNRightNumBox" style="border-bottom-width: 0px;background-color:lightgrey;"/>
<div class="styLNAmountBox" style="border-bottom-width: 0px;width:45mm;">
<!--<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/TotTentCreditForPersonalUse"/>
</xsl:call-template>-->
</div>
</div>
</div>
<!-- End Line 15B -->
<!-- Start Line 15C -->
<div class="styBB" style="width: 187mm">
<div class="styLNLeftNumBox" style="padding-left: 2mm;"/>
<div style="float:left;padding-top:.5mm;">the space next to that box. If line 14 is smaller than line 11, see instructions
</div>
<div style="float:right;">
<span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold; float:left">.....
</span>
<div class="styLNRightNumBox" style="border-bottom-width: 0px;">15</div>
<div class="styLNAmountBox" style="border-bottom-width: 0px;height:4mm;width:45mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/PersonalUsePartOfCreditAmt"/>
</xsl:call-template>
</div>
</div>
</div>
<!-- End Line 15C -->
<!--  Line 22 -->
<!--<div class="styBB" style="width: 187mm">
<div class="styLNLeftNumBox" style="padding-left: 2mm">22</div>
<div class="styLNDesc" style="width:139.2mm;height:4mm;padding-right:1mm;">
<b> Personal use part of credit.</b> Enter the <b>smaller</b> of line 18 or line 21 here 
and on Form 1040, line 53 (or Form 1040NR, line 50).  Check box <b>c</b> on that line and enter "8910" in the space next to that box. If line 21 is smaller than line 18, see instructions
<span style="letter-spacing:4mm; font-weight:bold">.................</span>
</div>
<div class="styLNRightNumBox" style="height:11mm;padding-top:0mm;padding-bottom:0mm;border-bottom:0px;">
<div class="styLNRightNumBoxNBB" style="padding-bottom:0mm;width:7.75mm;padding-top:5mm;
border-left-width:0px;border-top-width:0px;background-color:lightgrey;"/>22
</div>
<div class="styLNAmountBox" style="height:10mm;width:31mm;padding-top: 8mm;border-bottom:0px;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/PersonalUsePartOfCredit"/>
</xsl:call-template>
</div>
</div>
--><!-- End of page -->
<div style="width:187mm;">
<span class="styBoldText">For Paperwork Reduction Act Notice, see separate instructions. </span>
<span style="width:120px;"/>Cat. No. 37720F 
<span style="width:80px;"/>Form <span class="styBoldText">8910</span> (2013)
</div>
<br/>
<div class="pageEnd"/>
<!-- BEGIN Left Over Table -->
<!-- Additonal Data Title Bar and Button -->
<div class="styLeftOverTitleLine" id="LeftoverData">
<div class="styLeftOverTitle">Additional Data        
</div>
<div class="styLeftOverButtonContainer">
<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
</div>
</div>
<!-- Additional Data Table -->
<table class="styLeftOverTbl">
<xsl:call-template name="PopulateCommonLeftover">
<xsl:with-param name="TargetNode" select="$FormData"/>
<xsl:with-param name="DescWidth" select="100"/>
</xsl:call-template>
</table>
<!-- END Left Over Table -->
<!-- Additional Data Table for Separated Data from Part I; displayed if more than 2 elements and Print is set to separated-->
<xsl:if test="($Print = $Separated) and (count($FormData/IRS8910TentativeCreditGrp) &gt; 2)">
<br/>
<br/>
<span class="styRepeatingDataTitle">Form IRS8910, Part I - Tentative Credit:</span>
<xsl:for-each select="$FormData/IRS8910TentativeCreditGrp">
<xsl:variable name="pos" select="position()"/>
<xsl:if test="(position() mod 2)=1">
<table class="styDepTbl" cellspacing="0" style="font-size: 7pt">
<thead class="styTableThead">
<tr style="height: 8mm" class="styDepTblHdr">
<td class="styDepTblCell" colspan="2" style="width: 91mm; border-color: black;    border-left-width: 0px; border-right-width: 0px; border-top-width:   0px; border-bottom-width:1px; text-align: left">
<span class="styNormalText" style="padding-left: 5mm">
 Use a separate column for each vehicle. If you need more<br/>
<span style="width: 5mm"/>
columns, use additional Forms 8910 and include the totals <br/>
<span style="width: 5mm"/>on line 7 and 11.
</span>
</td>
<td class="styDepTblCell" style="width: 30mm;border-color: black; border-left-width: 1px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;  text-align: center;">(
 <xsl:number value="($pos)" format="a"/>)
 Vehicle 
 <xsl:number value="($pos)" format="1"/>
</td>
<td class="styDepTblCell" style="width: 30mm;border-color: black; border-left-width: 0px;  border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;  text-align: center">(
 <xsl:number value="($pos + 1)" format="a"/>)
 Vehicle 
 <xsl:number value="($pos + 1)" format="1"/>
</td>
</tr>
</thead>
<tfoot/>
<tbody>
<!--  Line 1   -->
<!-- column 1 -->
<tr class="styDepTblRow1" style="height: 5mm">
<td class="styTableCell" style="width: 99mm; text-align: left; border-color: black;  border-left-width: 0px; border-right-width: 0px; border-top-width: 1px;    border-bottom-width:1px">
<span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">1</span>
<span style="width: 1mm"/>
<span>Year, make, and model of vehicle</span>
<span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold;">.......
</span>
</td>
<td class="styLNRightNumBox" style="border-top-width: 0px;height: 10mm;">1</td>
<td class="styTableCell" style="border-color: black; border-left-width: 1px;                        border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px; text-align: center">
<span class="styTableCellPad"/>
<xsl:call-template name="PopulateYear">
<xsl:with-param name="TargetNode" select="VehicleDescriptionGrp/VehicleYear"/>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="VehicleDescriptionGrp/VehicleMake"/>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="VehicleDescriptionGrp/VehicleModel"/>
</xsl:call-template>
</td>
<!-- column 2 -->
<td class="styTableCell" style="border-color: black; border-left-width: 1px;   border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px;text-align: center">
<span class="styTableCellPad"/>
<xsl:call-template name="PopulateYear">
<xsl:with-param name="TargetNode" select="$FormData/IRS8910TentativeCreditGrp [$pos + 1]/VehicleDescriptionGrp/VehicleYear"/>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$FormData/IRS8910TentativeCreditGrp [$pos + 1]/VehicleDescriptionGrp/VehicleMake"/>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$FormData/IRS8910TentativeCreditGrp [$pos + 1]/VehicleDescriptionGrp/VehicleModel"/>
</xsl:call-template>
</td>
</tr>
<!-- Line 2  -->
<tr class="styDepTblRow2" style="height: 5mm">
<td class="styTableCell" style="width: 99mm; text-align: left; border-color: black;  border-left-width: 0px; border-right-width: 0px; border-top-width: 0px;  border-bottom-width:0px">
<span class="styBoldText" style="font-size:7pt; padding-left: 2mm;">2</span>
<span style="width: 1mm"/>Vehicle identification number (see instructions)
 <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold;">..
</span>
</td>
<td class="styLNRightNumBox" style="border-bottom-width:1px;height: 7mm;">2</td>
<td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 0px; border-top-width: 1px; border-bottom-width:1px;">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="VIN"/>
</xsl:call-template>
</td>
<td class="styTableCell" style="border-color: black; border-left-width: 1px;  border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px;">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$FormData/IRS8910TentativeCreditGrp[$pos + 1]/VIN"/>
</xsl:call-template>
</td>
</tr>
<!-- Line 3  -->
<tr class="styDepTblRow1" style="height: 5mm; font-size: 7pt">
<td class="styTableCell" style="width: 99mm; text-align: left; border-color: black;  border-left-width: 0px; border-right-width: 0px; border-top-width: 0px;   border-bottom-width:0px">
<span class="styBoldText" style="font-size: 7pt; padding-left: 2mm">3</span>
<span style="width: 1mm"/>Enter date vehicle was placed in service (MM/DD/YYYY)
</td>
<td class="styLNRightNumBox"  style="height: 6mm;">3</td>
<td class="styTableCell" style="border-color: black; border-left-width: 1px; 
border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;text-align:center">
<xsl:call-template name="PopulateMonthDayYear">
<xsl:with-param name="TargetNode" select="VehiclePlacedInServiceDt"/>
</xsl:call-template>
<span class="styTableCellPad"/>
</td>
<td class="styTableCell" style="border-color: black; border-left-width: 0px;
 border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;text-align:center">
<xsl:call-template name="PopulateMonthDayYear">
<xsl:with-param name="TargetNode" select="$FormData/IRS8910TentativeCreditGrp[$pos + 1]/VehiclePlacedInServiceDt"/>
</xsl:call-template>
<span class="styTableCellPad"/>
</td>
</tr>
<!-- Line 4  -->
<!--<tr class="styDepTblRow2" style="height: 5mm">
<td class="styTableCell" style="width: 83mm; text-align: left; border-color: black;
 border-left-width: 0px; border-right-width: 0px; border-top-width: 0px;
border-bottom-width:0px">
<span class="styBoldText" style="font-size:7pt; padding-left: 2mm;">4</span>
<span style="width: 1mm"/>
<b> Credit allowable </b>(see instructions for amount to enter)
 <span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold;">.</span>
</td>
<td class="styLNRightNumBox">4</td>
<td class="styTableCell" style="border-color: black; border-left-width:1px; 
 border-right-width:1px; border-top-width: 0px; border-bottom-width:0px;padding-left:14mm;">
<span class="styTableCellPad"/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="MaximumAllowedCredit"/>
</xsl:call-template>
</td>
<td class="styTableCell" style="border-color: black; border-left-width: 0px;
 border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;padding-left:14mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/IRS8910TentativeCreditGrp[$pos + 1]/MaximumAllowedCredit"/>
</xsl:call-template>
</td>
</tr> -->
<!-- ***********************************************************************************  -->
<!--  Line 5   -->
<!-- <tr class="styDepTblRow1" style="height: 5mm">
<td class="styTableCell" style="width: 83mm; text-align: left; border-color: black;
 border-left-width: 0px; border-right-width: 0px; border-top-width: 0px;
border-bottom-width:0px">
<span class="styBoldText" style="font-size:7pt; padding-left: 2mm;">5</span>
<span style="width: 1mm"/>
If you are not claiming the plug-in conversion credit, skip lines 5 through 
 9, enter -0- on line 10, and go to line 11. Otherwise, enter the cost of converting the vehicle to a qualified plug-in electric drive motor vehicle 
</td>
<td class="styLNRightNumBox">5</td>
<td class="styTableCell" style="border-color: black; border-left-width: 1px; 
border-right-width: 1px; border-top-width: 1px; border-bottom-width:1px;
 text-align:right;padding-left:0mm;padding-right:0mm;padding-top:16mm;padding-left:14mm;">
<span class="styTableCellPad"/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="AltMotorVehCostOfConversionAmt"/>
</xsl:call-template>
</td>
<td class="styTableCell" style="border-color: black; border-left-width: 0px; 
border-right-width: 0px; border-top-width: 1px; border-bottom-width:1px;
 text-align: right;padding-top:16mm;padding-left:14mm">
<span class="styTableCellPad"/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/IRS8910TentativeCreditGrp[$pos + 1]/AltMotorVehCostOfConversionAmt"/>
</xsl:call-template>
</td>
</tr> -->
<!-- Line 6  -->
<!-- <tr class="styDepTblRow2" style="height: 5mm">
<td class="styTableCell" style="width: 83mm; text-align: left; border-color: black;
 border-left-width: 0px; border-right-width: 0px; border-top-width: 0px;
border-bottom-width:0px">
<span class="styBoldText" style="font-size:7pt; padding-left: 2mm;">6</span>
<span style="width: 1mm"/>
Section 179 expense deduction (see instructions)
</td>
<td class="styLNRightNumBox">6</td>
<td class="styTableCell" style="border-color: black; border-left-width:1px;
 border-right-width:1px; border-top-width: 0px; border-bottom-width:1px;padding-left:14mm;" valign="bottom">
<span class="styTableCellPad"/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="AltMotorVehSect179ExpDedAmt"/>
</xsl:call-template>
</td>
<td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px;border-top-width: 0px; border-bottom-width:1px;padding-left:14mm;" valign="bottom">
<span class="styTableCellPad"/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/IRS8910TentativeCreditGrp[$pos + 1]/AltMotorVehSect179ExpDedAmt"/>
</xsl:call-template>
</td>
</tr> -->
<!-- *****************************************************************************  -->
<!-- Line 7  -->
<!--  <tr class="styDepTblRow1" style="height: 5mm">
<td class="styTableCell" style="width: 83mm; text-align: left; border-color: black;
 border-left-width: 0px; border-right-width: 0px; border-top-width: 0px;
border-bottom-width:0px">
<span class="styBoldText" style="font-size:7pt; padding-left: 2mm;">7</span>
<span style="width: 1mm"/>Subtract line 6 from line 5
<span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold;">........
</span>
</td>
<td class="styLNRightNumBox" style="border-bottom-width:1px;">7</td>
<td class="styTableCell" style="border-color: black; border-left-width:1px;
 border-right-width:1px; border-top-width: 0px; border-bottom-width:1px;padding-left:14mm;" valign="bottom">
<span class="styTableCellPad"/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="AltMotorVehNetCostOfCnvrtAmt"/>
</xsl:call-template>
</td>
<td class="styTableCell" style="border-color: black; border-left-width: 0px; 
 border-right-width: 0px;border-top-width: 0px; border-bottom-width:1px;padding-left:14mm;" valign="bottom">
<span class="styTableCellPad"/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/IRS8910TentativeCreditGrp[$pos + 1]/AltMotorVehNetCostOfCnvrtAmt"/>
</xsl:call-template>
</td>
</tr> -->
<!-- ***************************************************************************** -->
<!-- Line 8  -->
<!-- <tr class="styDepTblRow2" style="height: 5mm">
<td class="styTableCell" style="width: 83mm; text-align: left; border-color: black;  border-left-width: 0px; border-right-width: 0px; border-top-width: 0px;   border-bottom-width:0px">
<span class="styBoldText" style="font-size:7pt; padding-left: 2mm;">8</span>
<span style="width: 1mm"/>
Multiply line 7 by 10% (.10)
<span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold;">.......
</span>
</td>
<td class="styLNRightNumBox" style="border-bottom-width:1px;">8</td>
<td class="styTableCell" style="border-color: black; border-left-width:1px;
  border-right-width:1px; border-top-width: 0px; border-bottom-width:1px;padding-left:14mm;" valign="bottom">
<span class="styTableCellPad"/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="AltMotorVehConversionPctAmt"/>
</xsl:call-template>
</td>
<td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px;border-top-width: 0px; border-bottom-width:1px;padding-left:14mm;" valign="bottom">
<span class="styTableCellPad"/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/IRS8910TentativeCreditGrp[$pos + 1]/AltMotorVehConversionPctAmt"/>
</xsl:call-template>
</td>
</tr> -->
<!-- Line 9  -->
<!-- <tr class="styDepTblRow1" style="height: 5mm">
<td class="styTableCell" style="width: 83mm; text-align: left; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px;  border-bottom-width:0px">
<span class="styBoldText" style="font-size:7pt; padding-left: 2mm;">9</span>
<span style="width: 1mm"/>
Maximum plug-in conversation credit amount allowable
    </td>
<td class="styLNRightNumBox" style="border-bottom-width:1px;">9</td>
<td class="styTableCell" style="border-color: black; border-left-width:1px;
 border-right-width:1px; border-top-width: 0px; border-bottom-width:1px;padding-left:14mm
" valign="bottom">
<span class="styTableCellPad"/>4000.00
  <br/>
  <span class="styTableCellPad"/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="AltMotorVehMaxPlugInCreditAmt"/>
</xsl:call-template>
</td>
<td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px;border-top-width: 0px; border-bottom-width:1px;
padding-left:14mm" valign="bottom">
<span class="styTableCellPad"/>4000.00
 <br/>
<span class="styTableCellPad"/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/IRS8910TentativeCreditGrp[$pos + 1]/AltMotorVehMaxPlugInCreditAmt"/>
</xsl:call-template>
</td>
</tr> -->
<!-- Line 10  -->
<!-- <tr class="styDepTblRow2" style="height: 5mm">
<td class="styTableCell" style="width: 83mm; text-align: left; border-color: black;  border-left-width: 0px; border-right-width: 0px; border-top-width: 0px;  border-bottom-width:0px">
<span class="styBoldText" style="font-size:7pt; padding-left: 1mm;">10</span>
<span style="width: 1mm"/> 
Enter the <b>smaller</b> of line 8 or line 9
<span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold;">.....
</span>
</td>
<td class="styLNRightNumBox" style="border-bottom-width:1px;">10</td>
<td class="styTableCell" style="border-color: black; border-left-width:1px;
border-right-width:1px; border-top-width: 0px; border-bottom-width:1px;padding-left:14mm" valign="bottom">
<span class="styTableCellPad"/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="AltMotorVehAllowableCreditAmt"/>
</xsl:call-template>
</td>
<td class="styTableCell" style="border-color: black; border-left-width: 0px; border-right-width: 0px;border-top-width: 0px; border-bottom-width:1px;padding-left:14mm" valign="bottom">
<span class="styTableCellPad"/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/IRS8910TentativeCreditGrp[$pos + 1]/AltMotorVehAllowableCreditAmt"/>
</xsl:call-template>
</td>
</tr> -->
<!-- Line 4  -->
<tr class="styDepTblRow2" style="height: 5mm">
<td class="styTableCell" style="width: 99mm; text-align: left; border-color: black;  border-left-width: 0px; border-right-width: 0px; border-top-width: 0px;  border-bottom-width:0px;">
<span class="styBoldText" style="font-size:7pt; padding-left: 2mm;">4</span>
<span style="width: 1mm;"/>
<b>Tentative credit.</b> (see instructions for amount to enter)
</td>
<td class="styLNRightNumBox" style="border-bottom-width:1px;padding-right:2mm;height: 7mm;float:none;">4</td>
<td class="styTableCell" style="border-color: black; border-left-width:1px;
 border-right-width:1px; border-top-width: 0px; border-bottom-width:1px;padding-left:14mm" valign="bottom">
<span class="styTableCellPad"/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="AltMotorVehTentativeCreditAmt"/>
</xsl:call-template>
</td>
<td class="styTableCell" style="border-color: black; border-left-width: 0px; 
 border-right-width: 0px; border-top-width: 0px; border-bottom-width:01px;;padding-left:14mm" valign="bottom">
<span class="styTableCellPad"/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/IRS8910TentativeCreditGrp[$pos + 1]/AltMotorVehTentativeCreditAmt"/>
</xsl:call-template>
</td>
</tr>
<!-- ***********************************************************************************  -->
</tbody>
</table>
<br/>
</xsl:if>
</xsl:for-each>
</xsl:if>
<!-- Additional Data Table for Separated Data from Part II;
       displayed if more than 3 elements and Print is set to separated-->
<xsl:if test="($Print = $Separated) and (count($FormData/BusinessInvestmentUseGrp) &gt; 2)">
<br/>
<br/>
<span class="styRepeatingDataTitle">Form IRS8910, Part II -Credit for Business/investment Use Part of Vehicle:</span>
<xsl:for-each select="$FormData/BusinessInvestmentUseGrp">
<xsl:variable name="pos" select="position()"/>
<xsl:if test="(position() mod 2)=1">
<table class="styDepTbl" cellspacing="0" style="font-size: 7pt">
<tbody>
<!-- line 15 -->
<tr class="styDepTblRow1">
<td class="styTableCell" style="width: 114mm; text-align: left; border-color: black;   border-left-width: 0px; border-right-width: 0px; border-top-width: 0px;   border-bottom-width:0px;">
<span class="styBoldText" style="font-size:7pt; padding-left: 2mm;">5</span>
<span style="width: 1mm;font-size:5pt"/>Business/investment use percentage (see instructions)
 </td>
<td class="styLNRightNumBox" style="float:none;">5</td>
<td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px;border-top-width:0px; border-bottom-width:1px">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="BusinessInvestmentUsePct"/>
</xsl:call-template>
<span class="styTableCellPad"/>%
 </td>
<td class="styTableCell" style="border-color: black; border-left-width: 0px;   border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$FormData/BusinessInvestmentUseGrp[$pos + 1]/BusinessInvestmentUsePct"/>
</xsl:call-template>
<span class="styTableCellPad"/>%
</td>
</tr>
<!-- line 6 -->
<tr class="styDepTblRow2">
<td class="styTableCell" style="width: 114mm; text-align: left; border-color: black; border-left-width: 0px;border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;">
<span class="styBoldText" style="font-size:7pt; padding-left: 2mm;">6</span>
<span style="width: 1mm"/>Multiple line 4 by line 5
<span style="letter-spacing:4mm;padding-top:.5mm; font-weight:bold;">.......
</span>
</td>
<td class="styLNRightNumBox" style="float:none;">6</td>
<td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px;border-top-width: 0px; border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="BusinessInvestmentUseAmt "/>
</xsl:call-template>
<span class="styTableCellPad"/>
</td>
<td class="styTableCell" style="border-color: black;   border-left-width: 0px; border-right-width: 1px; border-top-width: 0px;  border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/BusinessInvestmentUseGrp[$pos + 1]/BusinessInvestmentUseAmt "/>
</xsl:call-template>
<span class="styTableCellPad"/>
</td>
</tr>
</tbody>
</table>
<br/>
</xsl:if>
</xsl:for-each>
</xsl:if>
<!-- Additional Data Table for Separated Data from Part III; displayed if more than 3 elements and Print is set to separated-->
<xsl:if test="($Print = $Separated) and (count($FormData/TentativeCreditForPrsnlUseAmt) &gt; 2)">
<br/>
<br/>
<span class="styRepeatingDataTitle">Form IRS8910, Part III -Credit for Personal Use of Vehicle:</span>
<xsl:for-each select="$FormData/TentativeCreditForPrsnlUseAmt">
<xsl:variable name="pos" select="position()"/>
<xsl:if test="(position() mod 2)=1">
<table class="styDepTbl" cellspacing="0" style="font-size: 7pt">
<tbody>
<!-- line10 -->
<!--  *********************************************************************  -->
<table class="styDepTbl" cellspacing="0" style="font-size: 7pt">
<tbody>
<tr class="styDepTblRow1">
<td class="styTableCell" style="width: 114mm; text-align: left; border-color: black; border-left-width: 0px;border-right-width: 0px; border-top-width: 0px; border-bottom-width:0px;">
<span class="styBoldText" style="font-size:7pt; padding-left: 2mm;">10</span>
<span style="width: 1mm"/><span style="width: 1mm;"/>if you skipped Part II, enter the amount from line 4.<br/>
<span style="width:7mm"/>if you completed Part II, subtract line 6 from line 4
 </td>
<td class="styLNRightNumBox" style="height: 7mm;float:none;">10</td>
<td class="styTableCell" style="border-color: black; border-left-width: 1px; border-right-width: 1px;border-top-width: 0px; border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/TentativeCreditForPrsnlUseAmt[$pos]"/>
</xsl:call-template>
<span class="styTableCellPad"/>
</td>
<td class="styTableCell" style="border-color: black;border-left-width: 0px; border-right-width: 1px; border-top-width: 0px;border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$FormData/TentativeCreditForPrsnlUseAmt[$pos + 1]"/>
</xsl:call-template>
<span class="styTableCellPad"/>
</td>
</tr>
</tbody>
</table>
<!--  *********************************************************************  -->
</tbody>
</table>
<br/>
</xsl:if>
</xsl:for-each>
</xsl:if>
</form>
</body>
</html>
</xsl:template>
</xsl:stylesheet>