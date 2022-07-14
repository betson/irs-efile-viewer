<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
]>

<!-- Last modified on 7/17/2014 by Robert Jones for UWR  112329 which set most of the lines to RESERVED  -->
<!-- Last modified on 8/15/2014 by Robert Jones for Re-issued IBM Defect 40431  1040 ID # not displaying-->
<!-- Last modified on 11/26/2014 by Robert Jones for Re-issued IBM Defect 40431  1040 ID # not displaying-->
<!-- Last modified on 2/10/2015 by Robert Jones for UWR 150654  -->
<!-- Last modified on 2/26/2015 by Robert Jones for IBM Defect 42525  -->
<!-- Last modified on 5/6/2015 by Robert Jones UWR 123023 IE11 Upgrade Fixes  -->
<!-- Last modified on 6/3/2015 by Robert Jones IBM Defect 43145 IE11 Upgrade Fixes  -->
<!-- Last modified on 5/6/2015 by Robert Jones UWR 123023 IE11 Upgrade Fixes  -->
<!-- Last modified on 1/7/2016 by Robert Jones UWR 172430 Extender Updates  -->
<!-- Last modified on 3/1/2016 by Robert Jones per IBM Defect 45833 Moved spans at lines 17 and 34 checkboxes because in RRD they would not Populate per Mitchell B -->
<!-- Last modified on 6/8/2016 by Robert Jones UWR 165384, No Marked up PDF This changed 2015 to 2016 throughout -->
<!-- Last modified on 6/15/2016 by Robert Jones UWR 174761 and defect 46053, Per IBM this UWR updated date to 2016. Was not in our documentation  -->
<!-- Last modified on 6/21/2016 by Robert Jones UWR 165384 Just updated Tax Year  -->
<!-- Last modified on 9/27/2016 by Robert Jones UWR 183718 Added new Section D, changes to Section C per pdf  -->
<!-- Last modified on 10/27/2016 by Robert Jones per IBM Defect 47051 Line 14 should be 0.50 -->
<!-- Last modified on 11/01/2016 by Robert Jones per PDF Review Line 14 should be 0.50, lines 43/44 S Corporations, Reduce whitespace at Header -->
<!-- Last modified on 12/06/2016 by Robert Jones per IM02798098 change smallest to smaller line 44-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS6765Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form6765Data" select="$RtnDoc/IRS6765"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form6765Data)"/>
					</xsl:call-template>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 6765"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<!-- Form 6765 CSS Styles are located in the template called below -->
						<xsl:call-template name="IRS6765Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form6765">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Begin Form Number and Name -->
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:31mm;height:auto;">
        Form <span class="styFormNumber">6765</span>
        
        <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form6765Data"/>
								</xsl:call-template>
        							
							<br/>
							<br/>
							<br/>
              <!-- span class="styAgency">Rev. December 2008</span -->
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service</span>
							
						</div>
						<div class="styFTBox" style="width:123mm;height:21mm;">
							<div class="styMainTitle" style="height:8mm;">
          Credit for Increasing Research Activities
        </div>
							<br/>
							<div class="styFST" style="height:5mm;font-size:7pt;">
								<img src="{$ImagePath}/6765_Bullet.gif" alt="Bullet Image"/>
          Attach to your tax return.
       
        <div class="styFST" style="height:2mm;font-size:6pt;text-align:left;">
								<img src="{$ImagePath}/6765_Bullet.gif" alt="Bullet Image"/>
			 Information about Form 6765 and its separate instructions is at 
         <a href="http://www.irs.gov/form6765" title="Link to IRS.gov">
         <i>www.irs.gov/form6765.</i>
          </a>
       </div>
        </div>
						</div>
						<div class="styTYBox" style="width:32mm;height:21mm;">
							<div class="styOMB" style="height:auto;border-bottom-width:1px;padding-top:1mm;">
          OMB No. 1545-0619
        </div>
							<div class="styTY" style="height:7mm;">20<span class="styTYColor">16</span>
							</div>
							<div style="text-align:left;padding-left:6mm;padding-top:2mm;">Attachment<br/> Sequence No.<span class="styBoldText">
									<span style="width:4px;"/>81</span>
							</div>
						</div>
					</div>
					<!-- End Form Number and Name section -->
					<!-- Begin Names and Identifying number section -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:147mm;height:auto;font-weight:normal;font-size:7pt;">
        Name(s) shown on return<br/>
        <xsl:choose>
        <xsl:when test="$RtnHdrData/ReturnTypeCd='1040' ">
         <!--<xsl:when test="$RtnHdrData/ReturnTypeCd='1120' ">-->
        <span style="font-weight:normal;">
        		<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
							</span>
							</xsl:when>
							<xsl:otherwise>
							 <span style="font-weight:normal;">
							 <xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
							</span>
							
							</xsl:otherwise>
			 </xsl:choose>
						</div>
						<div class="styEINBox" style="width:39mm;height:4mm;padding-left:2mm;font-size:7pt;">
        Identifying number<br/>
							<br/>
							<xsl:choose>
								 <xsl:when test="$RtnHdrData/ReturnTypeCd='1040' ">
								    <!--<xsl:when test="$RtnHdrData/ReturnTypeCd='1120' ">-->
							<span style="font-weight:normal;">
								<xsl:call-template name="PopulateReturnHeaderFilerTIN">
									<xsl:with-param name="TargetNode">SSN</xsl:with-param>
								</xsl:call-template>
							</span>
							 </xsl:when>
						            <xsl:otherwise>		
						            <span style="font-weight:normal;">
								<xsl:call-template name="PopulateReturnHeaderFilerTIN">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
							</xsl:otherwise>
			 </xsl:choose>
						</div>
					</div>
					<!-- End Names and Identifying number section -->
					<!--Begin Section A-->
					<div class="styBB" style="width:187mm;font-size:7pt;">
						<div class="styLNDesc" style="height:auto;width:183mm;font-size:7pt;padding-left:0mm;"><b>Section A—Regular Credit.</b> Skip this section and go to Section B if you are electing or previously elected (and are not revoking) the alternative simplified credit.
						</div>
					</div>
					<!-- line 1 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.5mm;">
     1
        </div>
						<div class="styLNDesc" style="width:138.75mm;height:auto;">
   Certain amounts paid or incurred to energy consortia (see instructions)  
         <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.........</span> 
						</div>
						<div class="styLNRightNumBox" style="width:8.25mm;height:4.5mm;border-right-width:1px;">1</div>
						<div class="styLNAmountBox" style="height:4.5mm;border-right-width:0px;border-left-width:0px;">
				<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6765Data/RegularEnergyConsortiaAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 2 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.5mm;">
         2
        </div>
						<div class="styLNDesc" style="width:98.75mm;height:4.5mm;">
     Basic research payments to qualified organizations (see instructions)
         <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">..</span> 
        </div>
						<div class="styLNRightNumBox" style="height:4.5mm;">
         2          
        </div>
						<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6765Data/RegularBasicResearchPaymentAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
						<!--  
         <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;"></div>
         <div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"></div>
         -->
					</div>
					<!-- line 3 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.5mm;">
         3
        </div>
						<div class="styLNDesc" style="width:98.75mm;height:4.5mm;">
        Qualified organization base period amount
         <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.......</span> 
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">
         3          
        </div>
						<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
					<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6765Data/RegularBasePeriodAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
					</div>
					<!-- line 4 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.5mm;">
        4
        </div>
						<div class="styLNDesc" style="width:138.75mm;height:4.5mm;">
        
 Subtract line 3 from line 2. If zero or less, enter -0-
           <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.............</span> 
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">
         4          
        </div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6765Data/RegularPaymentMinusBaseAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 5 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.5mm;">
          5
        </div>
						<div class="styLNDesc" style="width:98.75mm;height:4.5mm;">
      Wages for qualified services (do not include wages used in figuring the work opportunity credit)
           <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.............</span> 
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3mm;">
         5          
        </div>
						<div class="styLNAmountBox" style="height:7.5mm;padding-top:3mm;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6765Data/RegularQlfyServicesWagesAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:7.5mm;border-right-width:1px;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:7.5mm;border-right-width:0px;border-left-width:0px;"/>
					</div>
					<!-- line 6 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.5mm;">
         6
        </div>
						<div class="styLNDesc" style="width:98.75mm;height:4.5mm;">
        Cost of supplies
           <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.............</span> 
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">
       6          
        </div>
						<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
					<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6765Data/RegularSupplyCostAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
					</div>
					<!-- line 7 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.5mm;">
     7
        </div>
						<div class="styLNDesc" style="width:98.75mm;height:4.5mm;">
       Rental or lease costs of computers (see instructions)
          <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">....</span> 
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">
         7          
        </div>
						<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form6765Data/RegularComputerCostAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
					</div>
					<!-- line8  -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.5mm;">
         8
        </div>
						<div class="styLNDesc" style="width:98.75mm;height:4.5mm;">
        Enter the applicable percentage of contract research expenses (see instructions)
           <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.............</span> 
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3mm;">
       8          
        </div>
						<div class="styLNAmountBox" style="height:7.5mm;padding-top:3mm;padding-right:1mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form6765Data/RegularContractResearchPctAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:7.5mm;border-right-width:1px;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:7.5mm;border-right-width:0px;border-left-width:0px;"/>
						<!-- line 9 -->
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.5mm;">
          9
        </div>
						<div class="styLNDesc" style="width:98.75mm;height:4.5mm;">
    Total qualified research expenses. Add lines 5 through 8 
           <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">...</span> 
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">
          9         
        </div>
						<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
						<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6765Data/RegularTotQlfyResearchExpnsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
					</div>
					<!-- line 10 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4.5mm;">
       10
        </div>
						<div class="styLNDesc" style="width:98.75mm;height:4.5mm;">
						Enter fixed-base percentage, but not more than 16% (0.16) (see instructions)
						 
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">
        10          
        </div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:choose>
								<xsl:when test="$Form6765Data/FixedBasePercentage=''">
									<td class="styTableCell" style="width:17mm;height:5mm;text-align:right;font-size:7pt;border-color:black;background-color:lightgrey">
										<!--<span style="width:2px;">%</span>-->
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td class="styTableCell" style="width:17mm;height:5mm;text-align:right;font-size:7pt;border-color:black;padding-right:1mm;background-color:lightgrey">
									<xsl:call-template name="PopulatePercent">
											<xsl:with-param name="TargetNode" select="$Form6765Data/FixedBasedPct"/>
										</xsl:call-template>
									</td>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
					</div>
					<!-- line 11 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4.5mm;">
          11
        </div>
						<div class="styLNDesc" style="width:98.75mm;height:4.5mm;">
      Enter average annual gross receipts (see instructions)
           <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.....</span> 
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">
          11          
        </div>
						<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
						<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6765Data/RegularAverageGrossReceiptsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
					</div>
					<!-- line 12 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4.5mm;">
          12
        </div>
						<div class="styLNDesc" style="width:98.75mm;height:4.5mm;">
    Multiply line 11 by the percentage on line 10 
           <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.......</span> 
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">
          12          
        </div>
						<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form6765Data/FixedBasePctTimesGrossRcptsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
					</div>
					<!-- line 13 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4.5mm;">
          13
        </div>
						<div class="styLNDesc" style="width:98.75mm;height:4.5mm;">
        Subtract line 12 from line 9. If zero or less, enter -0- 
            <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">......</span> 
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">
          13          
        </div>
						<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
					<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form6765Data/AdjTotQualifedRsrchExpnssAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
					</div>
					<!-- line 14 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4.5mm;">
          14
        </div>
						<div class="styLNDesc" style="width:98.75mm;height:4.5mm;">
       Multiply line 9 by 50% (0.50) 
          <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">......</span> 
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">
          14          
        </div>
						<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form6765Data/HalfAdjTotQlfyRsrchExpnssAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
					</div>
					<!--
    <div style="width:187mm">
        <div class="styLNLeftNumBox" style="height:4.5mm;">
          15
        </div>
          <div class="styLNDesc" style="width:98.75mm;height:4.5mm;">
            Enter the <span class="styBoldText">smaller</span> of line 13 or line 14          
            <span class="styBoldText">
              <span style="width:16px;"></span>.
              <span style="width:16px;"></span>.
              <span style="width:16px;"></span>.
              <span style="width:16px;"></span>.
              <span style="width:16px;"></span>.  
              <span style="width:16px;"></span>.
              <span style="width:16px;"></span>.
              <span style="width:16px;"></span>.
            </span>          
          </div>              
           <div class="styLNRightNumBox" style="height:4.5mm;">
          15          
        </div>
        <div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;" >
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form6765Data/SmallestQlfyResearchExpenses"/>
          </xsl:call-template>
        </div>
         <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;"></div>
         <div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"></div>
     </div>
     -->
					<!-- line 15-->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4.5mm;">
          15
        </div>
						<div class="styLNDesc" style="width:138.75mm;height:4.5mm;">
        Enter the <span class="styBoldText">smaller</span> of line 13 or line 14  
           <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.................</span> 
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">
          15          
        </div>
						<div class="styLNAmountBox" style="height:4.5mm;">
						<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6765Data/SmallerQlfyResearchExpnssAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 16-->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4.5mm;">
          16
        </div>
						<div class="styLNDesc" style="width:138.75mm;height:4.5mm;">
    Add lines 1, 4,  and 15 
            <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.....................</span> 
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">
          16          
        </div>
						<div class="styLNAmountBox" style="height:4.5mm;">
					<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6765Data/RsrchExpensesPlusRsrchPymtsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- 17 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:auto;padding-top:2mm;">
      17
    </div>
						<div class="styLNDesc" style="width:138.75mm;height:auto;">
  Are you electing the reduced credit under section 280C? 
        <img src="{$ImagePath}/6765_Bullet.gif" alt="Bullet Image"/>
							<!-- yes checkbox -->
						
						<span>
							<xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/RegularRedSect280CCrElectInd"/>
								</xsl:call-template>
							<label>
					<xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/RegularRedSect280CCrElectInd"/>
                  <xsl:with-param name="BackupName">IRS6765RegularRedSect280CCrElectInd</xsl:with-param>
								</xsl:call-template>
								<span style="width:.5mm;"/>
							<span style="padding-right:1mm;">Yes</span>
							</label>
								<input type="checkbox" class="styCkbox">
					<xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form6765Data/RegularRedSect280CCrElectInd"/>
                    <xsl:with-param name="BackupName">IRS6765RegularRedSect280CCrElectInd</xsl:with-param> 
									</xsl:call-template>
								</input>
							</span>
					
							<!-- no checkbox-->
						<span>
						<xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/RegularRedSect280CCrElectInd"/>
								</xsl:call-template>
							<label>
								<xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/RegularRedSect280CCrElectInd"/>
                  <xsl:with-param name="BackupName">IRS6765RegularRedSect280CCrElectInd</xsl:with-param>
								</xsl:call-template>
							
							<span style="width:2mm;"/>
							<span style="padding-right:1mm;">No</span>
							</label>
								<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form6765Data/RegularRedSect280CCrElectInd"/>
                    <xsl:with-param name="BackupName">IRS6765RegularRedSect280CCrElectInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							
						</div>
						<div class="styLNRightNumBoxNBB" style="height:6.5mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:6.5mm;"/>
					</div>

					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4.5mm;"/>
						<div class="styLNDesc" style="width:138.75mm;height:10mm;">
						If “Yes,” multiply line 16 by 13% (0.13). If “No,” multiply line 16 by 20% (0.20) and see the instructions
for the statement that must be attached. Members of controlled groups or businesses under
common control: see instructions for the statement that must be attached 
 
          <!-- Form to Form Link -->
					<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form6765Data/RegularCreditAmt"/>
							</xsl:call-template>
						<!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.............</span> 
						</div>
						
						<div class="styLNRightNumBox" style="height:10.5mm;padding-top:6.5mm;border-bottom-width:0px;">17</div>
							<div class="styLNAmountBox" style="height:10.5mm;padding-right:1mm;padding-top:6.5mm;border-bottom-width:0px;">
						<xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form6765Data/RegularCreditAmt"/>
							</xsl:call-template>
													</div>
													
																	</div>
																	

					<!--End of Section A-->
					<!-- Begin Section B-->
					<div class="styBB" style="width:187mm;border-top-width:1px;height:8mm;padding-top:2mm;">
						<div class="styPartDesc" style="font-size:7pt;padding-left:0mm;">Section B&#151;Alternative Simplified Credit. <span class="styNormalText">Skip this section if you are completing Section A. </span>
						</div>
					</div>
					<!-- line 18 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">
      18
    </div>
						<div class="styLNDesc" style="width:138.75mm;height:4.5mm;">
					Certain amounts paid or incurred to energy consortia (see the line 1 instructions)
    <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.......</span> 
						</div>
						<div class="styLNRightNumBox" style="width:8.25mm;height:4.5mm;border-right-width:1px;">18</div>
						<div class="styLNAmountBox" style="height:4.5mm;border-right-width:0px;border-left-width:0px;">
						<xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" 
                select="$Form6765Data/AltEnergyConsortiaAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 19 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4.5mm;">
      19
    </div>
						<div class="styLNDesc" style="width:98.75mm;height:4.5mm;">
Basic research payments to qualified organizations (see the line 2 instructions)
  
       
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3mm;">
      19          
    </div>
						<div class="styLNAmountBox" style="height:7.5mm;padding-top:3mm;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6765Data/AltBasicResearchPaymentAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:7.5mm;border-right-width:1px;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:7.5mm;border-right-width:0px;border-left-width:0px;"/>
					</div>
					<!-- line 20 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4.5mm;">
      20
    </div>
						<div class="styLNDesc" style="width:98.75mm;height:4.5mm;">
  Qualified organization base period amount (see the line 3 instructions)
     <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">..</span> 
      </div>
						<div class="styLNRightNumBox" style="height:4.5mm;">
      20          
    </div>
						<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
					<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6765Data/AltBasePeriodAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
					</div>
					<!-- line 21 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4.5mm;">
      21
    </div>
						<div class="styLNDesc" style="width:138.75mm;height:4.5mm;">
  Subtract line 20 from line 19. If zero or less, enter -0- 
     <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.............</span> 
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">
      21          
    </div>
						<div class="styLNAmountBox" style="height:4.5mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form6765Data/AltPaymentMinusBaseAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 22 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4.5mm;">
      22
    </div>
						<div class="styLNDesc" style="width:138.75mm;height:4.5mm;">
    Add lines 18 and 21
   <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">......................</span> 
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">
      22          
    </div>
						<div class="styLNAmountBox" style="height:4.5mm;">
						<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6765Data/TotalSumEnergyAndNetBaseAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 23 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4.5mm;">
      23
    </div>
						<div class="styLNDesc" style="width:138.75mm;height:4.5mm;">
 Multiply line 22 by 20% (0.20)
    <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">...................</span> 
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">
      23          
    </div>
						<div class="styLNAmountBox" style="height:4.5mm;">
					<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6765Data/TotalSumTimesTwentyPctAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 24  -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4.5mm;">
      24
    </div>
						<div class="styLNDesc" style="width:98.75mm;height:4.5mm;">
  Wages for qualified services (do not include wages used in figuring the work opportunity credit)
    <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">..............</span> 
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3mm;">
      24         
    </div>
						<div class="styLNAmountBox" style="height:7.5mm;padding-top:3mm;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form6765Data/AltQlfyServicesWagesAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:7.5mm;border-right-width:1px;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:7.5mm;border-right-width:0px;border-left-width:0px;"/>
					</div>
					<!-- line 25 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4.5mm;">
      25
    </div>
						<div class="styLNDesc" style="width:98.75mm;height:4.5mm;">
     Cost of supplies
    <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">...............</span> 
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">
      25          
    </div>
						<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
					<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6765Data/AltSupplyCostAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
					</div>
					<!-- line 26 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4.5mm;">
      26
    </div>
						<div class="styLNDesc" style="width:98.75mm;height:4.5mm;">
 Rental or lease costs of computers (see the line 7 instructions)
     <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">..</span> 
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">
      26          
    </div>
						<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
					<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6765Data/AltComputerCostAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
					</div>
					<!-- line 27 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4.5mm;">
      27
    </div>
						<div class="styLNDesc" style="width:98.75mm;height:4.5mm;">
  Enter the applicable percentage of contract research expenses (see the line 8 instructions) 
    <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">...............</span> 
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">
      27          
    </div>
						<div class="styLNAmountBox" style="height:7.5mm;padding-top:3mm;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6765Data/AltContractResearchPctAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:7.5mm;border-right-width:1px;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:7.5mm;border-right-width:0px;border-left-width:0px;"/>
					</div>
					<!-- line 28-->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4.5mm;">
      28
    </div>
						<div class="styLNDesc" style="width:98.75mm;height:4.5mm;">
     Total qualified research expenses. Add lines 24 through 27
    <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">...</span> 
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">
      28          
    </div>
						<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6765Data/AltTotQlfyResearchExpnsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
					</div>
					<!-- line 29 -->
						<div style="width:187mm">
							<div class="styLNLeftNumBox" style="height:4.5mm;">
      29
    </div>
							<div class="styLNDesc" style="width:98.75mm;height:4.5mm;">
 Enter your total qualified research expenses for the prior 3 tax years. If
you had no qualified research expenses in any one of those years, skip
lines 30 and 31
     <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">................</span> 
							</div>
							<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm">
      29          
    </div>
							<div class="styLNAmountBox" style="height:11mm;padding-right:1mm;padding-top:7mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6765Data/TotQlfyResearchExpns3PYAmt"/>
							</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:11mm;border-right-width:1px;background-color:lightgrey"/>
							<div class="styLNAmountBoxNBB" style="height:11mm;border-right-width:0px;border-left-width:0px;"/>
						</div>
					
					<!-- line 30-->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4.5mm;">
      30
    </div>
						<div class="styLNDesc" style="width:98.75mm;height:4.5mm;">
      Divide line 29 by 6.0
     <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.............</span> 
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">
      30          
    </div>
						<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
						<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6765Data/TotQlfyResearchExpns3PYPctAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
					</div>
					<!-- line 31 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4.5mm;">
      31
    </div>
						<div class="styLNDesc" style="width:98.75mm;height:4.5mm;">
    Subtract line 30 from line 28. If zero or less, enter -0- 
    <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">....</span> 
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">
      31          
    </div>
						<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form6765Data/NetQlfyResearchExpns3PYPctAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4.5mm;border-right-width:1px;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:0px;border-left-width:0px;"/>
					</div>
					<!--line32 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:3.5mm;">32</div>
							<div class="styLNDesc" style="width:138.75mm;height:4.5mm;">
      Multiply line 31 by 14% (0.14). If you skipped lines 30 and 31, multiply line
                28 by 6% (0.06) 
         <!--     <img src="{$ImagePath}/8912_Bullet_Round.gif" alt="dot"/>
                Line 56 by 12% (.12) for tax years ending before 2009,
        <br/>
                <img src="{$ImagePath}/8912_Bullet_Round.gif" alt="dot"/>
                Line 56 by 14% (.14) for tax years ending after 2009, or
          <br/>
                <img src="{$ImagePath}/8912_Bullet_Round.gif" alt="dot"/>
                Line 53 by 6% (.06) if you skipped line 55 and 56.-->
               <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">...</span> 
              </div>
              <div class="styLNRightNumBox" style="height:4.5mm;">32
              </div>
              
              <div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form6765Data/NetQlfyResearchExpnsPctAmt"/>
								</xsl:call-template>
								
							</div>
							</div>
		
   <div style="width:187mm; border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width: 0px" class="pageEnd">
            <div class="styGenericDiv" style="width:117mm;font-weight:bold;">For  Paperwork Reduction Act Notice, see separate instructions.</div>
            <div class="styGenericDiv" style="width:23mm;">Cat. No. 13700H</div>
            <div class="styGenericDiv" style="float:right;">Form <span class="styBoldText">6765</span> (2016)</div>
          </div>
           <p style="page-break-before: always"/> 
		 <!--Begin Page 2 -->
  <!-- Header -->
  <div class="styBB" style="width:187mm;padding-top:.5mm;border-top-width:0px;">  
    <div style="float:left;">Form 6765 (2016)<span style="width:140mm;"></span>
    </div>  
    <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
</div>
      </div>  
  						
						
					<!-- Begin Section B-->
					<div class="styBB" style="width:187mm;border-top-width:0px;height:4.5mm;padding-top:0mm;">
						<div class="styPartDesc" style="font-size:7pt;padding-left:0mm;">Section B&#151;Alternative Simplified Credit. <span class="styNormalText">(continued) </span>
						</div>
					</div>	
						<!--line 33 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4.5mm;">33</div>
							<div class="styLNDesc" style="width:138.75mm;height:4.5mm;">
  Add lines 23 and 32
        <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.....................</span> 
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">33</div>
							<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form6765Data/TotalAltPctAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line 34 -->
						<div style="width:187mm">
							<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:2mm;">
      34
    </div>
							<div class="styLNDesc" style="width:138.75mm;height:4.5mm;">
Are you electing the reduced credit under section 280C?
       <img src="{$ImagePath}/6765_Bullet.gif" alt="Bullet Image"/>
								<!-- yes checkbox -->
							<span>
							  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" 
                    select="$Form6765Data/AltRedSect280CCrElectInd"/>
                  </xsl:call-template>
								<label>
                  <xsl:call-template name="PopulateLabelYes">
               <xsl:with-param name="TargetNode" select="$Form6765Data/AltRedSect280CCrElectInd"/>
                 <xsl:with-param name="BackupName">IRS6765AltRedSect280CCrElectInd</xsl:with-param>
                  </xsl:call-template>
                
								<span style="width:.5mm;"/>
								<span style="padding-right:1mm;">Yes</span>
								</label>
								<span>
									
               <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateYesCheckbox">
              <xsl:with-param name="TargetNode" select="$Form6765Data/AltRedSect280CCrElectInd"/>
               <xsl:with-param name="BackupName">IRS6765AltRedSect280CCrElectInd</xsl:with-param>       
                    </xsl:call-template>
               </input>
                </span>
           
                <!-- no checkbox -->
                	<xsl:call-template name="PopulateSpan">
               <xsl:with-param name="TargetNode" select="$Form6765Data/AltRedSect280CCrElectInd"/>
                  </xsl:call-template>
              <label>
                 <xsl:call-template name="PopulateLabelNo">
                 <xsl:with-param name="TargetNode" select="$Form6765Data/AltRedSect280CCrElectInd"/>
                 <xsl:with-param name="BackupName">IRS6765AltRedSect280CCrElectInd</xsl:with-param>
									</xsl:call-template>
								
                <span style="width:2mm;"/>
             <span style="padding-right:1mm;">No</span>
                </label>
                <span>
                  
              <input type="checkbox" class="styCkbox">
                 <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form6765Data/AltRedSect280CCrElectInd"/>
                      <xsl:with-param name="BackupName">IRS6765AltRedSect280CCrElectInd</xsl:with-param>
                    </xsl:call-template>
                </input>
                </span>
                
						
                  </span>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
						</div>
						<div class="styBB" style="width:187mm">
							<div class="styLNLeftNumBox" style="height:4.5mm;"/>
							<div class="styLNDesc" style="width:138.75mm;height:4.5mm;">
If “Yes,” multiply line 33 by 65% (0.65). If “No,” enter the amount from line 33 and see the line 17 instructions for the statement that must be attached. Members of controlled groups or businesses under common control: see instructions for the statement that must be attached 
   
          <!-- Form to Form Link -->
							<xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/AltCreditAmt"/>
								</xsl:call-template>
							<!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.......</span> 
           
              
							</div>
							<div class="styLNRightNumBoxNBB" style="height:10.5mm;padding-top:7mm;">34</div>
							<div class="styLNAmountBoxNBB" style="height:10.5mm;padding-top:7mm;">
						<xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/AltCreditAmt"/>
								</xsl:call-template>
							</div>
						</div>
										
					
					
					
						<!-- Begin Section C-->
						<div class="styBB" style="width:187mm;float:none; clear:none;">
							<div class="styGenericDiv" style="font-size:7pt;font-weight:bold;height:8mm;padding-top:2mm;">Section C &#151; Current Year Credit
    </div>
						</div>
						<!--line 35 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:7.5mm;">35</div>
							<div class="styLNDesc" style="width:138mm;height:7.5mm;">
           Enter the portion of the credit from Form 8932, line 2, that is attributable to wages that were also used to figure the credit on line 17 or line 34 (whichever applies)
         <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">............</span> 
              </div>
              <div class="styLNRightNumBox" style="height:7.5mm;padding-top:2mm">35</div>
              <div class="styLNAmountBox" style="height:7.5mm;padding-right:1mm;padding-top:2mm;">
            <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/EmployerDiffWagePymtCrAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <br></br>
						<!--line 36 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:auto;">36</div>
							<div class="styLNDesc" style="width:138mm;height:auto;">
       Subtract line 35 from line 17 or line 34 (whichever applies). If zero or less, enter -0- 
        <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">....</span> 
              </div>
              <div class="styLNRightNumBox" style="height:4.5mm;">36</div>
              <div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;">
          <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/NetEmployerDiffWagePymtCrAmt"/>
                </xsl:call-template>
              </div>
            </div>
						<!--line 37 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:auto;">37</div>
							<div class="styLNDesc" style="width:138mm;height:auto;">
        Credit for increasing research activities from partnerships, S corporations, estates, and trusts
         <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">...</span> 
              </div>
							<div class="styLNRightNumBox" style="height:auto;">37</div>
							<div class="styLNAmountBox" style="height:auto;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/ResearchActivitiesIncrCrAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!--line 38 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:auto;">38</div>
              <div class="styLNDesc" style="width:138mm;height:auto;">
             Add lines 36 and 37. 
             <br></br>
             <span style="padding-left:0mm"/><img src="{$ImagePath}/990_Bullet_Round.gif" alt="RoundBullet"/>
 Estates and trusts, go to line 39.<br></br>
 <span style="padding-left:0mm"/><img src="{$ImagePath}/990_Bullet_Round.gif" alt="RoundBullet"/>
 Partnerships and S corporations not electing the payroll tax credit, stop here and report this amount on Schedule K.
<br></br>
               <span style="padding-left:0mm"/><img src="{$ImagePath}/990_Bullet_Round.gif" alt="RoundBullet"/>
 Partnerships and S corporations electing the payroll tax credit, complete Section D and report on Schedule K the amount on this line reduced by the amount on line 44.
<br></br>
<span style="padding-left:0mm"/><img src="{$ImagePath}/990_Bullet_Round.gif" alt="RoundBullet"/>
 Eligible small businesses, stop here and report the credit on Form 3800, Part III,line 4i. See instructions for the definition of eligible small business.
<br></br>
<span style="padding-left:0mm"/><img src="{$ImagePath}/990_Bullet_Round.gif" alt="RoundBullet"/>
 Filers other than eligible small businesses, stop here and report the credit on Form 3800, Part III, line 1c.
<br></br>
<b>Note.</b> Qualified small business filers, other than partnerships and S corporations, electing the payroll tax credit must complete Form 3800 before completing Section D.
               </div>
              <div class="styLNRightNumBox" style="height:4.5mm;padding-top:1mm;">38</div>
              <div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;padding-top:1mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/CYResearchCreditAmt"/>
                </xsl:call-template>
              </div>
              <div class="styLNRightNumBox" style="height:30mm;background-color:lightgrey"></div>
              <div class="styLNAmountBox" style="height:30mm;">
               
              </div>
            </div>
            <!--line39 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:auto;">39</div>
              <div class="styLNDesc" style="width:138mm;height:auto;">
    Amount allocated to beneficiaries of the estate or trust (see instructions)
         <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.......</span> 
              </div>
              <div class="styLNRightNumBox" style="height:auto;">39</div>
              <div class="styLNAmountBox" style="height:auto;padding-right:1mm;">
                <xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form6765Data/EstateOrTrustAllocatedBenefAmt"/>
								</xsl:call-template>
							</div>
						</div>
            <!-- line 40 -->
            			<div class="styBB" style="width:187mm;float:none; clear:none;">
              <div class="styLNLeftNumBox" style="height:auto;">40</div>
              <div class="styLNDesc" style="width:138mm;height:auto;">Estates and trusts,
               subtract line 39 from line 38. For eligible small businesses, report the credit on Form 3800, Part III, line 4i. See instructions. For filers other than eligible small businesses, report the credit on Form 3800, Part III, line 1c.               
               
							</div>
							<div class="styLNRightNumBoxNBB" style="height:10mm;padding-top:7mm;">40</div>
							<div class="styLNAmountBoxNBB" style="height:10mm;padding-right:1mm;padding-top:7mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form6765Data/NetEstateOrTrustAllocBenefAmt"/>
								</xsl:call-template>
							</div>
								</div>
					<!-- Begin Section D-->
						<div class="styBB" style="width:187mm;float:none; clear:none;">
							<div class="styGenericDiv" style="font-size:7pt;height:8mm;padding-top:2mm;"><b>
								Section D &#151; Qualified Small Business Payroll Tax Election and Payroll Tax Credit.</b> Skip this section if the payroll tax election does not apply. See instructions.
    </div>
						</div>
						<!--line 41 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:1.5mm;">41</div>
							<div class="styLNDesc" style="width:138mm;height:4.5mm;">
           Check this box if you are a qualified small business electing the payroll tax credit. See instructions
         
               <input type="checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form6765Data/PayrollTaxCreditElectionInd"/>
                      <xsl:with-param name="BackupName">IRS6765PayrollTaxCreditElectionInd</xsl:with-param>
                    </xsl:call-template>
               </input>
               <label style="float: right; clear: none;">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form6765Data/PayrollTaxCreditElectionInd"/>
									<xsl:with-param name="BackupName">IRS6765PayrollTaxCreditElectionInd</xsl:with-param>
								</xsl:call-template>
							</label>
              </div>
              <div class="styLNRightNumBox" style="height:4.5mm;padding-top:1mm;background-color:lightgrey;border-right-width:1px;"></div>
              
            <!--<xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/EmployerDiffWagePymtCrAmt"/>
                </xsl:call-template>-->
             
            </div>
            <br></br>
            <!--line 42 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4.5mm;">42</div>
							<div class="styLNDesc" style="width:138mm;height:4.5mm;">
           Enter the portion of line 36 elected as a payroll tax credit (do not enter more than $250,000). See instructions
         <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;"></span> 
              </div>
              <div class="styLNRightNumBox" style="height:4.5mm;padding-top:1mm">42</div>
              <div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm;padding-top:1mm;">
            <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/PayrollTaxLimitationAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <br></br>
             <!--line 43 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:7.5mm;">43</div>
							<div class="styLNDesc" style="width:138mm;height:7.5mm;">
          General business credit carryforward from the current year (see instructions). Partnerships and S Corporations skip this line and go to line 44
         <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">..</span> 
              </div>
              <div class="styLNRightNumBox" style="height:7.5mm;padding-top:4mm">43</div>
              <div class="styLNAmountBox" style="height:7.5mm;padding-right:1mm;padding-top:4mm;">
            <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/CYGeneralBusCrCarryfowardAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <br></br>
             <!--line 44 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:10.5mm;">44</div>
							<div class="styLNDesc" style="width:138mm;height:10.5mm;">
          Partnerships and S Corporations, enter the smaller of line 36 or line 42. All others, enter the smaller of line 36, line 42, or line 43. Enter here and on Form 8974, line 5. Members of controlled groups or businesses under common control: see instructions for the statement that must be attached
         <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">..</span> 
              <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/PayrollTaxCreditAmt"/>
								</xsl:call-template>
              </div>
              <div class="styLNRightNumBox" style="height:10.5mm;padding-top:7mm">44</div>
              <div class="styLNAmountBox" style="height:10.5mm;padding-right:1mm;padding-top:7mm;">
            <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form6765Data/PayrollTaxCreditAmt"/>
                </xsl:call-template>
              </div>
            </div>
            
            <br></br>
					<!-- END Part II  -->
					
		<!--Footer-->
					<div style="width:187mm; border-style: solid; border-color: black; border-left-width: 0px;  text-align:right; border-right-width: 0px; border-top-width: 1px; border-bottom-width: 0px" class="pageEnd">  
					<!--<div style="float:left;">
					<span class="styBoldText">For Paperwork Reduction Act Notice, see instructions </span>    
					</div> -->  
        Form <span class="styBoldText">6765</span>    (2016)
      </div>
					
					
					<!-- BEGIN Left Over Table -->
					<!-- Additonal Data Title Bar and Button -->
					 <p style="page-break-before: always"/> 
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
            Additional Data        
          </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form6765Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 16 - Reduced Credit Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form6765Data/RegularCredit/@reducedCreditIndicator"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 39 - Reduced Credit Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form6765Data/AlternateIncrementalCredit/@reducedCreditIndicator"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
