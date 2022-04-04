<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
  <!ENTITY mdash "&#8212;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl" />
	<xsl:include href="AddHeader.xsl" />
	<xsl:include href="CommonPathRef.xsl" />
	<xsl:include href="AddOnTable.xsl" />
	<xsl:include href="IRS965ScheduleHStyle.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS965ScheduleH" />
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge" />
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)" />
					</xsl:call-template>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache" />
				<meta http-equiv="Cache-Control" content="no-cache" />
				<meta http-equiv="Expires" content="0" />
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private" />
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
				<meta name="Description" content="IRS Form 965 Schedule H" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS965ScheduleHStyle" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form1040NR">
					<xsl:call-template name="DocumentHeader" />
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDiv">
						<div class="styFNBox" style="width:30mm;height:22.5mm;">
							<span class="styFN" style="font-size:9pt;">Schedule H<br />
							(Form 965)</span> <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData" />
							</xsl:call-template>
							<br />
							
							<br />
							(Rev. December 2020)<br />
							<br />
							<span class="styAgency">
								Department of the Treasury
								<br />
								Internal Revenue Service
							</span>
						</div>
						<div class="styFTBox" style="width:127mm;height:22.5mm;">
							<span class="styFMT" style="font-size:12pt;padding-top:1mm;padding-bottom:2mm;">Amounts Reported on Forms 1116 and 1118 <br />
							and Disallowed Foreign Taxes</span>
							<br />
							<span style="font-weight:bold;">
								<img src="{$ImagePath}/945A_Bullet_Sm.gif"  alt="Bullet Image"/> Attach to Form 965.
							</span><br />
							<span style="font-weight:bold;">
								<img src="{$ImagePath}/945A_Bullet_Sm.gif"  alt="Bullet Image"/> Go to
								<span style="font-style:italic">www.irs.gov/Form965</span>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:30mm;height:22.5mm;">
							<div class="styOMB" style="font-size:6pt;border:none;padding-top:8mm;">OMB No. 1545-0123</div>
						</div>
					</div>
					<!-- Filer information section -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styNameBox" style="width:145mm;">
							Name of person filing this return<br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template><br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:42mm;padding-left:0.5mm;font-weight:normal;">
							<strong>Identifying number</strong><br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<!-- Section 1 -->
					<div class="styStdDiv" style="font-weight:bold;padding-top:1mm;padding-bottom:1.5mm;border-bottom:1px solid black;font-size:9pt;">
						SECTION 1 &mdash; Amounts Reported on Forms 1116 and 1118 and Disallowed Foreign Taxes
					</div>
					<!-- Category Section -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">a</div>
						<div class="styLNDesc" style="">
							Separate Category (Enter code &mdash; see instructions.)
							<span class="sty965sHDotLn">.................</span>
						</div>
						<div class="styLNRightNumBox" style="border-left-width:0px;border-bottom-width:0px;">
							<img src="{$ImagePath}/945A_Bullet_Sm.gif"  alt="Bullet Image"/>
						</div>
						<div class="styLNAmountBox" style="border-left-width:0px;text-align:center;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/SeparateCategoryCd"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv" style="border-bottom:1px solid black;padding-bottom:3mm;">
						<div class="styLNLeftNumBoxSD">b</div>
						<div class="styLNDesc" style="">
							If code 901j is entered on line a, enter the country code for the sanctioned country (see instructions)
							<span class="sty965sHDotLn">..</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="border-left-width:0px;">
							<img src="{$ImagePath}/945A_Bullet_Sm.gif"  alt="Bullet Image"/>
						</div>
						<div class="styLNAmountBox" style="border-left-width:0px;text-align:center;height:auto;">
							<xsl:for-each select="$FormData/SanctionedCountryCd">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
								<xsl:if test="position() != last()"> &nbsp; </xsl:if>
							</xsl:for-each>&nbsp;
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD"/>
						<div class="styLNDesc"/>
						<div class="styLNRightNumBoxNBB"></div>
						<div class="styLNAmountBox" style="text-align:center;font-weight:bold;">
							2020 Tax Year
						</div>
					</div>
					<!-- Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc">
							Reserved
							<span class="sty965sHDotLn">..............................</span>
						</div>
						<div class="styLNRightNumBox">1</div>
						<div class="styLNAmountBox" style="background-color:lightgrey"/>
					</div>
					<!-- Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc">
							Reserved
							<span class="sty965sHDotLn">..............................</span>
						</div>
						<div class="styLNRightNumBox">2</div>
						<div class="styLNAmountBox" style="background-color:lightgrey"/>
					</div>
					<!-- Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Section 965(a) inclusion in U.S. dollars with respect to pass-throughs from Schedule F,</strong>
							<br /><strong>column (e)(1), line 16. </strong> Enter here and on Form 1116, Part I, or 1118, Sch. A (see instructions)
							<div class="styDotLn" style="padding-right:2mm;float:right;">..
								<span style="float:right;">          
								<img src="{$ImagePath}/945A_Bullet_Sm.gif" alt="right pointing arrow"/> </span>
							</div>
							<!--<span class="sty965sHDotLn" style="padding-right:0px;margin-right:-4px;">..&#9658;</span>-->
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br />3</div>
						<div class="styLNAmountBox" style="height:auto;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Section965aInclusionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 4 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc">
							Reserved
							<span class="sty965sHDotLn">..............................</span>
						</div>
						<div class="styLNRightNumBox">4</div>
						<div class="styLNAmountBox" style="background-color:lightgrey"/>
					</div>
					<!-- Line 5 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc">
							Reserved
							<span class="sty965sHDotLn">..............................</span>
						</div>
						<div class="styLNRightNumBox">5</div>
						<div class="styLNAmountBox" style="background-color:lightgrey"/>
					</div>
					<!-- Line 6 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Section 965(c) deduction in U.S. dollars from pass-throughs allocable to section 965(a)</strong> 
							<br /><strong>inclusion </strong>(see instructions). Enter here and on Form 1116, Part I, or Form 1118, Sch. A 
							<div class="styDotLn" style="padding-right:2mm;float:right;">.....
								<span style="float:right;">          
								<img src="{$ImagePath}/945A_Bullet_Sm.gif" alt="right pointing arrow"/> </span>
							</div>
							<!--<span class="sty965sHDotLn" style="padding-right:0px;margin-right:-4px;">.....&#9658;</span>-->
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br />6</div>
						<div class="styLNAmountBox" style="height:auto;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Section965cDeductionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 7 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc">
							Reserved
							<span class="sty965sHDotLn">..............................</span>
						</div>
						<div class="styLNRightNumBox">7</div>
						<div class="styLNAmountBox" style="background-color:lightgrey"/>
					</div>
					<!-- Line 8 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="styLNDesc">
							Reserved
							<span class="sty965sHDotLn">..............................</span>
						</div>
						<div class="styLNRightNumBox">8</div>
						<div class="styLNAmountBox" style="background-color:lightgrey"/>
					</div>
					<!-- Line 9 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Taxes deemed paid through pass-throughs. </strong>
							Enter amount from Schedule F, column (l), line 16. Also report on Form 1118, Schedule B, Part I, column 3
							<span class="sty965sHDotLn">.................</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br />9</div>
						<div class="styLNAmountBox" style="height:auto;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotPTETaxesDeemedPaidAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 10 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc">
							Reserved
							<span class="sty965sHDotLn">..............................</span>
						</div>
						<div class="styLNRightNumBox">10</div>
						<div class="styLNAmountBox" style="background-color:lightgrey"/>
					</div>
					<!-- Line 11 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">11</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>2020 Applicable Percentage from pass-throughs.</strong>
							If there are multiple pass-throughs, leave this line blank and attach a schedule
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/ApplicablePTEPct"/>
							</xsl:call-template>
							<span class="sty965sHDotLn">........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;"><br />11</div>
						<div class="styLNAmountBox" style="height:7.5mm;"><br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/ApplicablePTEPct"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 12 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">12</div>
						<div class="styLNDesc">
							Reserved
							<span class="sty965sHDotLn">..............................</span>
						</div>
						<div class="styLNRightNumBox">12</div>
						<div class="styLNAmountBox" style="background-color:lightgrey"/>
					</div>
					<!-- Line 13 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">13</div>
						<div class="styLNDesc">
							Reserved
							<span class="sty965sHDotLn">..............................</span>
						</div>
						<div class="styLNRightNumBox">13</div>
						<div class="styLNAmountBox" style="background-color:lightgrey"/>
					</div>
					<!-- Line 14 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">14</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Disallowed foreign taxes through pass-throughs.</strong>  
							Attach calculation. See instructions. Report amount here and include on Form 1118, Schedule G, Part I, line F
							<span class="sty965sHDotLn">...............</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:auto;"><br />14</div>
						<div class="styLNAmountBoxNBB" style="height:auto;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DisallowedForeignTaxPTEAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Privacy Act and Paperwork Reduction Act Notice, see the separate instructions.</span>
						<span style="margin-left:6mm;">Cat. No. 71323K</span>
						<span style="float:right;font-weight:bold;">Schedule H (Form 965) (Rev. 12-2020)</span>
					</div>
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
						   Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<br/>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
