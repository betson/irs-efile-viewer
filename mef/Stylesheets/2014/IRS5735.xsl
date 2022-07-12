<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS5735Style.xsl"/>
	<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS5735"/>
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
				<!-- No Browser Caching  -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>  
				<meta name="Description" content="Form IRS 5735"/>
				<meta name="GENERATOR" content="IBM WebSphere Studio"/>
				<xsl:call-template name="GlobalStylesForm"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>  
				<style type="text/css">    
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS5735Style"/>    
						<xsl:call-template name="AddOnStyle"/>  
					</xsl:if>
				</style>        
			</head>
			<body class="styBodyClass">
				<form name="Form5735">    
					<xsl:call-template name="DocumentHeader"/>    
					<!--Title of Form -->    
					<div class="styBB" style="width:187mm;height:19mm;">
						<div class="styFNBox" style="width:31mm;font-size: 7pt; height: 19mm">
							Form 
							<span class="styFormNumber" style="font-size: 16pt">5735 </span>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>  
							<br/>
							(Rev. January 2013)
							<br/>
							<div class="styAgency" style="padding-top: 2mm">Department of the Treasury</div>
							<div class="styAgency">Internal Revenue Service</div>
						</div>
						<div class="styFTBox" style="width:125mm">
							<div class="styMainTitle" style="height:8mm;">American Samoa Economic Development Credit<br/> <span style="font-size:11pt"/></div>
							<div class="styFST" style="height:4mm;font-size:7pt;margin-left:3mm;font-weight:bold">
								<div style="padding-top: .5mm">
									<img src="{$ImagePath}/5735_Bullet_Sm.gif" alt="SmallBullet"/> 
									See the separate instructions.
								</div>
								<div style="padding-top: .5mm">
									<img src="{$ImagePath}/5735_Bullet_Sm.gif" alt="SmallBullet"/> 
										Attach to the corporation's tax return.
								</div>
							</div>
						</div>
						<div class="styTYBox" style="width:31mm; height: 19mm">        
							<div style="padding-top:8mm; font-size:7pt">OMB No. 1545-0217</div>
						</div>
					</div>
					<!--  End title of Form  -->
				
					<!--  For calendar year line  -->
			<div class="styBB" style="width: 187mm">
			  <div class="styBoldText" >For calendar year
				<span style="width: 28mm;">
				  <xsl:if test="normalize-space($FormData/CalendarYr) != ''">
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="$FormData/CalendarYr"/>
					</xsl:call-template>
				  </xsl:if>   
				</span>, or other tax year beginning
				<span style="width: 57mm">
				 <xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
				</span>, and ending 
				<span style="width: 17mm">
				<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
				</span>
				<span>.</span>
			  </div>
			</div>
	<!--  End For calendar year line  -->
					<!--  Name and Employer identification number (input vs return header) -->
					<div class="styBB" style="width:187mm;float:left;clear:left;border-top:1 solid black;">
						<!-- Name -->
						<div class="styNameBox" style="width:132mm;height:10mm;font-size:7pt;">
									Name
									<br/>
							<span>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
								</xsl:call-template><br/>
								<div>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!-- EIN -->
						<div class="styEINBox" style="width:50mm;height:4mm;font-size:7pt;padding-left:2mm;">
									Employer identification number
									<br/>
								<br/>
							<div style="text-align:left;font-weight:normal;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
					</div>
				  <!--  End Name and Employer indentification number  -->
				  <!--  Caution line -->
				  <div class="styBB" style="width:187mm;">
						<span class="styBoldText" style="padding-top:1mm;">Caution:</span>
						<span class="styNormalText" style="font-style:italic;padding-bottom:1mm;padding-top:.5mm;">
							The corporation must meet the qualified production activities income requirement to qualify for the American Samoa economic development credit.
						</span>
					</div>
					<!--  Caution line -->
					<!--  Line 1  -->  
					<div style="width: 187mm;">
						<div class="styLNLeftNumBox" style="padding-left:3mm;">1</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Enter 60% of qualified compensation</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">......................</span>
						</div>
						<div class="styLNRightNumBox">1</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SixtyPercentQualifiedCompAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  End Line 1  -->
					<!--  Line 2  -->  
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left:3mm;">2</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Enter 15% of the depreciation deduction for short-life qualified tangible property</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">........</span>
						</div>
						<div class="styLNRightNumBox">2</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FifteenPctDeprecTngblPropAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  End Line 2  -->
					<!--  Line 3 -->  
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left:3mm;">3</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Enter 40% of the depreciation deduction for medium-life qualified tangible property</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">.......</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">3</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FortyPercentDeprecTngblPropAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  End Line 3  -->
					<!--  Line 4 -->  
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left:3mm;">4</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Enter 65% of the depreciation deduction for long-life qualified tangible property</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">........</span>
						</div>
						<div class="styLNRightNumBox" style="height: 4mm;">4</div>
						<div class="styLNAmountBox" style="height: 4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SixtyFivePctDeprecTngblPropAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  End Line 4  -->
					<!--  Line 5 -->  
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left:3mm;">5</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Tentative credit. Add lines 1 through 4</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;"> .....................</span>
						</div>
						<div class="styLNRightNumBox" style="height: 4mm;">5</div>
						<div class="styLNAmountBox" style="height: 4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TentativeCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  End Line 5  -->
					<!--  Line 6 -->  
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left:3mm;">6</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Total U.S. income tax against which credit is allowed</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;"> .................</span>
						</div>
						<div class="styLNRightNumBox" style="height: 4mm;">6</div>
						<div class="styLNAmountBox" style="height: 4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalUSIncomeTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  End Line 6  -->
					<!--  Line 7  -->  
					<div style="width: 187mm">
						<div class="styLNLeftNumBoxBB" style="padding-left:3mm;height:8mm;">7</div>
						<div class="styIRS5735LNDescBB" style="height:8mm;width:139mm;">
							<b>American Samoa economic development credit. </b>Enter the <b>smaller </b>of line 5 or line 6. Enter
							the result here and on Form 1120, Schedule J, line 5b, or the corresponding line of other returns
							(see instructions)
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">7</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:4mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AmericanSamoaEconomicDevCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  End Line 7  -->
					<!--Form footer-->
					<div style="width:187mm;">
						<span class="styBoldText" style="width:100mm;padding-top:.5mm;float:left;clear:none;font-size:6.5pt;">For Paperwork Reduction Act Notice, see the separate instructions. </span> 
						<span class="styNormalText" style="padding-top:.5mm;float:left;clear:none;">Cat. No. 12090G</span>
						<span style="float:right;clear:none;">
							Form <span class="styBoldText">5735</span> (Rev. 1-2013)
						</span>
					</div>
					<!--Form footer-->
					<!--*****ADDITIONAL DATA************************************ -->      
					<div class="styLeftOverTitleLine" id="LeftoverData" style="padding-top: 4mm">
						<div class="styLeftOverTitle">Additional Data </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>      
					</div>
					<!-- Additional Data Table-->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>    
					<!-- Additional Data Table-->
					<!--*****ADDITIONAL DATA************************************ -->
				</form>  
			</body>
		</html>
	</xsl:template> 
</xsl:stylesheet>