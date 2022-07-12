<?xml version="1.0"?>
<!-- 09/04/2012 - Made changes per UWR #58906 - Jeremy Nichols -->
<!-- 10/11/2012 - Modified per UWR #73255 - Jeremy Nichols -->
<!-- 10/11/2012 - Modified per KISAMS #IM00804153 - Jeremy Nichols -->
<!-- 12/18/2012 - Modified per defect #34714 - Jeremy Nichols -->
<!-- 12/18/2012 - Modified per defect #34716 - Jeremy Nichols -->

<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS8849Schedule6Style.xsl"/>
  <xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="FormData" select="$RtnDoc/IRS8849Schedule6"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($FormData)"/>
          </xsl:call-template>
        </title>
        <!-- No Browser Caching  -->
        <meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Cache-Control" content="no-cache"/>
        <meta http-equiv="Expires" content="0"/>
        <!-- No Proxy Caching -->
        <meta http-equiv="Cache-Control" content="private"/>
        <meta name="Description" content="IRS8849Schedule1"/>
        <meta name="GENERATOR" content="IBM WebSphere Studio"/>
         <xsl:call-template name="GlobalStylesForm"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">

        <xsl:if test="not($Print) or $Print=''"> 
          <xsl:call-template name="IRS8849Schedule6Style"/>  
          <xsl:call-template name="AddOnStyle"/>
        </xsl:if>

        </style>
      </head>
      <body class="styBodyClass">
        <form name="IRS8849Schedule6">
          <xsl:call-template name="DocumentHeader"/>
          <!--Title of Form -->
		<div class="styBB" style="width:187mm;height: 21mm">
		
		<div class="styFNBox" style="height: 21mm; width:31mm; border-right:1px solid black">
			<br/>
			<span style="font-size:7.5pt; font-weight:bold">Schedule 6</span>
			<br/>
          		<span style="font-size:7.5pt; font-weight:bold">(Form 8849)</span>
           	 	<span>
                		<xsl:call-template name="SetFormLinkInline">
                 			<xsl:with-param name="TargetNode" select="$FormData"/>
               	 	</xsl:call-template>
			</span>
			<br/>
			<span class="styAgency" style="font-size: 7.pt; font-weight:bold">(Rev. January 2013)</span><br/>
			
			<div class="styAgency" style="font-size: 7pt; font-weight:bold;padding-top:1mm;">
				Department of the Treasury<br/>
				Internal Revenue Service
			</div>
 		</div>
 		
		<div class="styFTBox" style="width:125mm; height: 21mm">
			<div class="styMainTitle" style="height:9mm; font-weight: bold; padding-top:2mm">Other Claims</div>
			<div class="styFST" style="height:5mm;font-size:7pt;font-weight:bold;">
				<img src="{$ImagePath}/8849Sch6_Bullet.gif" alt="MediumBullet"/> Attach to Form 8849.
			</div>
			<div class="styFST" style="width:125mm;height:5mm;font-size:7pt;font-weight:bold;padding-bottom:0.5mm;">
				<img src="{$ImagePath}/8849Sch6_Bullet.gif" alt="MediumBullet"/> For information about Schedule 6 (Form 8849) and <br/>its instructions, go to www.irs.gov/form8849.
			</div>
		</div>
		<div class="styTYBox" style="width:31mm; height: 21mm">
			<div style="padding-top:9mm; font-size:7pt">OMB No. 1545-1420</div>
		</div>
		
		</div>
		<!--  End title of Form  -->
          
		<!--  Name / Employer identification number / Total Refund  -->
		<table cellspacing="0" style="width:187mm; border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 0px">
		<tr>
		<td class="styNameBox" style="width:107mm;font-size:7pt;font-weight:normal; height:10mm">Name as shown on Form 8849<br/>
		<xsl:choose>
			<xsl:when test="normalize-space($FormData/NameOfEmployer) != ''">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$FormData/NameOfEmployer/BusinessNameLine1"/>
				</xsl:call-template>
				<xsl:if test="normalize-space($FormData/NameOfEmployer/BusinessNameLine2)!=''">
				<br/>
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$FormData/NameOfEmployer/BusinessNameLine2"/>
				</xsl:call-template>
			</xsl:if>
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
		</td>
		<td valign="top" class="styNameBox" style="padding-left:2mm;font-size:7pt;font-weight:normal; height:10mm;">
		<span class="BoldText"  style="width:33mm;">EIN or SSN</span>
             <div style="text-align:left; padding-top:2mm;font-weight:normal;">
		<xsl:choose>
			<xsl:when test="normalize-space($FormData/EmployerIdentificationNumber) != ''">
			<xsl:call-template name="PopulateEIN">
				<xsl:with-param name="TargetNode" select="$FormData/EmployerIdentificationNumber"/>
			</xsl:call-template>
			</xsl:when>
			<xsl:when test="normalize-space($FormData/MissingEINReason) != ''">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$FormData/MissingEINReason"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
			<xsl:if test="($RtnHdrData/Filer/EIN)">
				<xsl:call-template name="PopulateEIN">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
				</xsl:call-template>		
			</xsl:if>
			<xsl:if test="($RtnHdrData/Filer/SSN) and not ($RtnHdrData/Filer/EIN)">
				<xsl:call-template name="PopulateEIN">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SSN"/>
				</xsl:call-template>		
			</xsl:if>                 
			</xsl:otherwise>
		</xsl:choose>
		</div>
		</td>
		<td valign="top" class="styEINBox" style="padding-left:2mm;font-size:7pt;font-weight:normal;">
		<span class="BoldText">Total refund (total of lines 1-5)</span>
		<div style="text-align:right; padding-top:2mm;font-weight:normal;">
		<span style="float:left;">$</span>
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/TotalRefund"/>
			</xsl:call-template>
		</div>
		</td>
		</tr>
		</table>		
		<!--  Name / Employer identification number / Total Refund  -->
		
		<!-- Begin Dates format -->

		<div style="width:187mm; border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 	1px; border-bottom-width: 0px">
			<br />
			<span class="BoldText" style="font-size:8pt;">
				Enter the earliest and latest <b>dates of the events </b> included in this claim.  Enter in MMDDYYYY format.					</span>
			<br /><br />
		</div>

		<div style="width:187mm;">
		<table class="styTable" cellspacing="0">
         	<thead class="styTableThead" style="font-size:7pt">
		<tr>
			<td>
			<div style="height:4mm;"/>
				<div style="padding-top:1mm">
					<div style="float:left; font-size:8pt; padding-left:5mm;">
						Earliest date <img src="{$ImagePath}/8849Sch6_Bullet.gif" alt="MediumBullet"/><span style="width:1mm;"/>
					</div>
				<div style="float:left;width:35mm;border-bottom:1 solid black;">
				<div style="float:left;width:30mm;border-bottom:0 solid black;">		
					<xsl:call-template name="PopulateMonthDayYear">
						<xsl:with-param name="TargetNode" select="$FormData/EarliestDate"/>
					</xsl:call-template>		
				</div>
				</div>  
			</div>			
			</td>
			<td>
			<div style="height:4mm;"/>
				<div style="padding-top:1mm">
					<div style="float:left; font-size:8pt; padding-left:7mm;">
						Latest date <img src="{$ImagePath}/8849Sch6_Bullet.gif" alt="MediumBullet"/><span style="width:1mm;"/>
					</div>
				<div style="float:left;width:35mm;border-bottom:1 solid black;">
				<div style="float:left;width:30mm;border-bottom:0 solid black;">		
					<xsl:call-template name="PopulateMonthDayYear">
						<xsl:with-param name="TargetNode" select="$FormData/LatestDate"/>
					</xsl:call-template>		
				</div>
				</div>  
			</div>				
			</td>
		</tr>
		</thead>
		</table>
		</div>

		<!-- End Dates format -->
		<div style="width:187mm; padding-top: 5mm; border-bottom:1px solid black">
			<span style="width:1px"></span>
			<span style="float:right">				
				<div class="styGenericDiv" style="width:1mm;padding-left:2mm;">
					<!-- button display logic -->
					<xsl:call-template name="SetDynamicTableToggleButton">
					<xsl:with-param name="TargetNode" select="$FormData/OtherClaims/Item"/>
					<xsl:with-param name="containerHeight" select="5"/>
					<xsl:with-param name="containerID" select=" 'OGLctn' "/>
					</xsl:call-template>
					<!-- end button display logic -->
				</div>
				</span>

		</div>
		
		<div class="styTableContainer" style="height:57.5mm;width:187mm; border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width:0px; border-bottom-width: 1px" id="OGLctn">
        <!-- print logic -->
          <xsl:call-template name="SetInitialState"/>
        <!-- end -->      

		<table cellspacing="0" cellpadding="0" style="font-size:7pt;">
		<thead class="styTableHead">
		<tr>
			<th style="width:5mm;height:8mm;text_align:center;font-weight:normal; border-top:1px solid black;" scope="col">
				<span style="width:1px"></span>
			</th>
			<th style="border-right:black solid 1; width:122mm;height:8mm;text_align:center;font-weight:normal; border-top:1px solid black;" scope="col">
				<span style="font-weight:bold; font-size:8pt">Tax</span>
			</th>
			<th style="border-right:black solid 1; width:40mm;height:8mm;text_align:center;font-weight:normal; border-top:1px solid black;" scope="col">
				<span style="font-weight:bold;; font-size:8pt">Amount of refund</span>
			</th>
			<th style="width:20mm;height:8mm;border-right-width:0px;text_align:center;font-weight:normal; border-top:1px solid black;" scope="col">
				<span style="font-weight:bold; font-size:8pt;">CRN</span>
			</th>
		</tr>
		</thead>
		<tfoot></tfoot>
		
		<!-- Begin Table 1, Other Claims item -->
		<tbody style="font-size:7pt; padding:5px">
            	<xsl:if test="((count($FormData/OtherClaims/Item) &lt; 6) or ($Print != $Separated))">
		
          	<xsl:for-each select="$FormData/OtherClaims/Item">
		<tr>
			<td style="text-align: center; vertical-align: top; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; font-weight:bold">				
				<xsl:number value="position()" />
			</td>
			<td style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="Tax/TypeOfTax"/>
				</xsl:call-template> 
				<xsl:if test="normalize-space(Tax/VIN)!=''">
					<br/>
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="Tax/VIN"/>
					</xsl:call-template>
				</xsl:if>        
				<span style="width:1px;"></span>
				<xsl:call-template name="SetFormLinkInline">
					<xsl:with-param name="TargetNode" select="."/>
				</xsl:call-template>		          			 	
          		</td>
          		<td style="text-align: right; vertical-align: top; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
				<span style="float:left;"><xsl:if test="position()=1">$</xsl:if></span>
          			<xsl:call-template name="PopulateAmount">
          				<xsl:with-param name="TargetNode" select="Amount"/>
				</xsl:call-template>
          		</td>
          		<td style="text-align: center; vertical-align: top; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">	
				<xsl:call-template name="PopulateText">
          				<xsl:with-param name="TargetNode" select="CRN"/>
          			</xsl:call-template>
          		</td>
		</tr>
		</xsl:for-each>
		</xsl:if>
		
            <xsl:if test="count($FormData/OtherClaims/Item) &lt; 1 or ((count($FormData/OtherClaims/Item) &gt; 5) and ($Print = $Separated))">
		<tr>
			<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; font-weight:bold">				
			<span style="width:1px">1</span>
			</td>
			<td style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
				<xsl:call-template name="PopulateAdditionalDataTableMessage">
					<xsl:with-param name="TargetNode" select="$FormData/OtherClaims/Item"/>
				</xsl:call-template>
			<span style="width:1px"></span>       	
          		</td>
          		<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-top:5mm">
          			<span style="float:left;">$</span>
			<span style="width:1px"></span>
          		</td>
          		<td style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">	
			<span style="width:1px"></span>
          		</td>
		</tr>
		</xsl:if>

            <xsl:if test="count($FormData/OtherClaims/Item) &lt; 2 or ((count($FormData/OtherClaims/Item) &gt; 5) and ($Print = $Separated))">

		<tr>
			<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; font-weight:bold">				
			<span style="width:1px">2</span>
			</td>
			<td style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
			<span style="width:1px"></span>       	
          		</td>
          		<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-top:5mm">
          			<span style="float:left;"></span>
			<span style="width:1px"></span>
          		</td>
          		<td style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">	
			<span style="width:1px"></span>
          		</td>
		</tr>
		</xsl:if>

            <xsl:if test="count($FormData/OtherClaims/Item) &lt; 3 or ((count($FormData/OtherClaims/Item) &gt; 5) and ($Print = $Separated))">

		<tr>
			<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; font-weight:bold">				
			<span style="width:1px">3</span>
			</td>
			<td style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
			<span style="width:1px"></span>       	
          		</td>
          		<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-top:5mm">
          			<span style="float:left;"></span>
			<span style="width:1px"></span>
          		</td>
          		<td style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">	
			<span style="width:1px"></span>
          		</td>
		</tr>
		</xsl:if>

            <xsl:if test="count($FormData/OtherClaims/Item) &lt; 4 or ((count($FormData/OtherClaims/Item) &gt; 5) and ($Print = $Separated))">

		<tr>
			<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; font-weight:bold">				
			<span style="width:1px">4</span>
			</td>
			<td style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
			<span style="width:1px"></span>       	
          		</td>
          		<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-top:5mm">
          			<span style="float:left;"></span>
			<span style="width:1px"></span>
          		</td>
          		<td style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">	
			<span style="width:1px"></span>
          		</td>
		</tr>
		</xsl:if>

            <xsl:if test="count($FormData/OtherClaims/Item) &lt; 5 or ((count($FormData/OtherClaims/Item) &gt; 5) and ($Print = $Separated))">

		<tr>
			<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; font-weight:bold">				
			<span style="width:1px">5</span>
			</td>
			<td style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
			<span style="width:1px"></span>       	
          		</td>
          		<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-top:5mm">
          			<span style="float:left;"></span>
			<span style="width:1px"></span>
          		</td>
          		<td style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">	
			<span style="width:1px"></span>
          		</td>
		</tr>
		</xsl:if>

											
		<!-- End Table 1, Other Claims item -->
		</tbody>
		</table>
		<!-- Set Initial Height of Above Table -->
		<xsl:call-template name="SetInitialDynamicTableHeight">
		<xsl:with-param name="TargetNode" select="$FormData/OtherClaims/Item"/>
		<xsl:with-param name="containerHeight" select="5"/>
		<xsl:with-param name="containerID" select=" 'OGLctn' "/>
		</xsl:call-template>
		<!-- End Set Initial Height of Above Table -->
		
		</div>
		<!-- Begin Explanation Text -->
		<div style="width:187mm; font-size:7pt; padding:2px">
		Use the space below for an explanation of each tax claimed. <br /><br />
		<span style="padding-left:5mm">For claims under section 6416(b)(2) relating to certain uses and resales of certain articles subject to manufacturers or retailers taxes, claimant certifies that it sold the article at a tax-excluded price, repaid the amount of tax to the ultimate vendor, or has obtained the written consent of the ultimate vendor to make the claim; and has the required supporting evidence.</span>
		</div>
		<br />     
		    	
		<!--
       	<xsl:for-each select="$FormData/Explanation">
			<span> 
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="." />
			</xsl:call-template>
			</span>
		<br />
		</xsl:for-each>
		-->
		<!-- End Explanation Text -->
		<br />    
		<!-- Begin Footer -->
		<div style="width:187mm; border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 2px; border-bottom-width: 0px">
			<div style="float: left; clear: none;">
      				<span class="styBoldText" style="font-size:6pt">For Privacy Act and Paperwork Reduction Act Notice, see Form 8849 instructions.</span>
       			<span style="padding-left:4mm;width:27mm; font-size:6pt">Cat. No. 27454M </span>
          			<span class="styBoldText"><span style="width:2px"></span> Schedule 6 (Form 8849) </span>(Rev. 1-2013)
     			</div>        
		</div>     
		<div class="pageEnd"></div>
	
		<!-- End Footer -->  
<br />
		<div class="styLeftOverTitleLine" id="LeftoverData">
		<div class="styLeftOverTitle">Additional Data</div>
		<div class="styLeftOverButtonContainer">
			<input class="styLeftoverTableBtn" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
		</div>      
		</div>

    <!-- Additional Data Table -->
		<table class="styLeftOverTbl">
		<xsl:call-template name="PopulateCommonLeftover">
		<xsl:with-param name="TargetNode" select="$FormData" />
		<xsl:with-param name="DescWidth" select="100"/>
		</xsl:call-template>
		</table>

            <xsl:if test="((count($FormData/OtherClaims/Item) &gt; 5) and ($Print = $Separated))">
		<br />
		        <span class="styRepeatingDataTitle">Form 8849 Schedule 6 table</span>		
		<br />
		<table class="styDepTbl" cellspacing="0" cellpadding="0" style="font-size:7pt;">
		<thead class="styTableHead">
		<tr class="styDepTblHdr">
			<th style="width:5mm;height:8mm;text_align:center;font-weight:normal; border-right-color:red; border-right-width:0px" scope="col">
				<span style="width:1px"></span>
			</th>
			<th class="styDepTblCell" style="border-right:black solid 1; width:122mm;height:8mm;text_align:center;border-left-width:0px; font-weight:normal;" scope="col">
				<span style="font-weight:bold; font-size:8pt">Tax</span>
			</th>
			<th class="styDepTblCell" style="border-right:black solid 1; width:40mm;height:8mm;text_align:center;font-weight:normal;" scope="col">
				<span style="font-weight:bold;; font-size:8pt">Amount of refund</span>
			</th>
			<th class="styDepTblCell" style="width:20mm;height:8mm;border-right-width:0px;text_align:center;font-weight:normal;" scope="col">
				<span style="font-weight:bold; font-size:8pt;">CRN</span>
			</th>
		</tr>
		</thead>
		<tfoot></tfoot>
		
		<!-- Begin Table 1, Other Claims item -->
		<tbody style="font-size:7pt; padding:5px">
          	<xsl:for-each select="$FormData/OtherClaims/Item">
		<tr>
            <xsl:attribute name="class">
            <xsl:choose>
               <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
               <xsl:otherwise>styDepTblRow2</xsl:otherwise>
            </xsl:choose>
            </xsl:attribute>
		
			<td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; font-weight:bold">				
				<xsl:number value="position()" />
			</td>
			<td style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="Tax/TypeOfTax"/>
				</xsl:call-template> 
				<xsl:if test="normalize-space(Tax/VIN)!=''">
					<br/>
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="Tax/VIN"/>
					</xsl:call-template>
				</xsl:if> 	          			
          		</td>
          		<td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;padding-top:5mm">
				<span style="float:left;"><xsl:if test="position()=1">$</xsl:if></span>
          			<xsl:call-template name="PopulateAmount">
          				<xsl:with-param name="TargetNode" select="Amount"/>
				</xsl:call-template>
          		</td>
          		<td style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">	
				<xsl:call-template name="PopulateText">
          				<xsl:with-param name="TargetNode" select="CRN"/>
          			</xsl:call-template>
          		</td>
		</tr>
		</xsl:for-each>
		</tbody>
		</table>
		</xsl:if>
		</form>    		
   	</body>
	</html>
  </xsl:template>
</xsl:stylesheet>
