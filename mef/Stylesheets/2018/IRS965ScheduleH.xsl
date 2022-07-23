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
							(January 2019)<br />
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
								&#9658;Attach to Form 965.
							</span><br />
							<span style="font-weight:bold;">
								&#9658;Go to
								<span style="font-style:italic">www.irs.gov/Form965</span>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:30mm;height:22.5mm;">
							<div class="styOMB" style="font-size:6pt;border:none;padding-top:8mm;">OMB No. XXXX-XXXX</div>
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
							&#9658;
						</div>
						<div class="styLNAmountBox" style="border-left-width:0px;text-align:center;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/SeparateCategoryCd"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styLNLeftNumBoxSD">b</div>
						<div class="styLNDesc" style="">
							If code 901j is entered on line a, enter the country code for the sanctioned country (see instructions)
							<span class="sty965sHDotLn">..</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="border-left-width:0px;">
							&#9658;
						</div>
						<div class="styLNAmountBoxNBB" style="border-left-width:0px;text-align:center;height:auto;">
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
							2018 Tax Year
						</div>
					</div>
					<!-- Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc">
							<strong>Section 965(a) inclusion amount in U.S. Dollars from Schedule F, column (e)(1), line 16</strong>
							<span class="sty965sHDotLn">...</span>
						</div>
						<div class="styLNRightNumBox">1</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CYDisallowedForeignTaxGrp/TotNotPTESect965aInclusionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Section 965(a) inclusion in U.S. Dollars with respect to pass-throughs from Schedule F, <br /> column (e)(1), line 17</strong>
							<span class="sty965sHDotLn">..........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br />2</div>
						<div class="styLNAmountBox" style="height:auto;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CYDisallowedForeignTaxGrp/TotPTESect965aInclusionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Total 965(a) inclusion in U.S. Dollars.</strong><br />
							Add lines 1 and 2. Report amount here and on Form 1116, Part I, or 1118, Sch. A (see instructions) 
							<span class="sty965sHDotLn" style="padding-right:0px;margin-right:-4px;">.&#9658;</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br />3</div>
						<div class="styLNAmountBox" style="height:auto;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CYDisallowedForeignTaxGrp/TotalSection965aInclusionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 4 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Section 965(c) deduction in U.S. Dollars not from pass-throughs allocable to section <br />
							965(a) inclusion amount</strong> (see instructions)
							<span class="sty965sHDotLn">...................</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br />4</div>
						<div class="styLNAmountBox" style="height:auto;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CYDisallowedForeignTaxGrp/TotNotPTESect965cDeductionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Section 965(c) deduction in U.S. Dollars from pass-throughs allocable to section <br />
							965(a) inclusion</strong> (see instructions)
							<span class="sty965sHDotLn">......................</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br />5</div>
						<div class="styLNAmountBox" style="height:auto;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CYDisallowedForeignTaxGrp/TotPTESect965cDeductionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 6 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Total section 965(c) deduction in U.S. Dollars.</strong><br />
							Add lines 4 and 5. Report amount here and on Form 1116, Part I, or 1118, Sch. A (see instructions) 
							<span class="sty965sHDotLn" style="padding-right:0px;margin-right:-4px;">.&#9658;</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br />6</div>
						<div class="styLNAmountBox" style="height:auto;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CYDisallowedForeignTaxGrp/TotalSection965cDeductionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 7 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Taxes deemed paid not from pass-throughs.</strong><br />
							Enter amount from Schedule F, column (l), line 16 (see instructions)
							<span class="sty965sHDotLn">............</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br />7</div>
						<div class="styLNAmountBox" style="height:auto;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CYDisallowedForeignTaxGrp/TotNotPTETaxesDeemedPaidAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 8 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Taxes deemed paid through pass-throughs.</strong><br />
							Enter amount from Schedule F, column (l), line 17 (see instructions)
							<span class="sty965sHDotLn">............</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br />8</div>
						<div class="styLNAmountBox" style="height:auto;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CYDisallowedForeignTaxGrp/TotPTETaxesDeemedPaidAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 9 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Taxes deemed paid.</strong><br />
							Sum lines 7 and 8 and report on Form 1118, Part I, Sch. B, column 3
							<span class="sty965sHDotLn">............</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br />9</div>
						<div class="styLNAmountBox" style="height:auto;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CYDisallowedForeignTaxGrp/TotalTaxesDeemedPaidAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 10 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>2018 Applicable Percentage not from pass-throughs.</strong><br />
							Enter amount from Schedule H, line 37
							<span class="sty965sHDotLn">.....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br />10</div>
						<div class="styLNAmountBox" style="height:auto;"><br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/CYDisallowedForeignTaxGrp/ApplicableNotPTEPct"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 11 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">11</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>2018 Applicable Percentage from pass-through.</strong><br />
							(if there are multiple pass-throughs, leave this line blank and attach a schedule) 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/CYDisallowedForeignTaxGrp/ApplicablePTEPct"/>
							</xsl:call-template>
							<span class="sty965sHDotLn">.......</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.4mm;"><br />11</div>
						<div class="styLNAmountBox" style="height:7.4mm;"><br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/CYDisallowedForeignTaxGrp/ApplicablePTEPct"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 12 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">12</div>
						<div class="styLNDesc">
							<strong>Disallowed foreign taxes not from pass-throughs.</strong> Multiply line 7 by line 10
							<span class="sty965sHDotLn">........</span>
						</div>
						<div class="styLNRightNumBox">12</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CYDisallowedForeignTaxGrp/DisallowedForeignTaxNotPTEAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 13 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">13</div>
						<div class="styLNDesc">
							<strong>Disallowed foreign taxes through pass-throughs.</strong> Attach calculation (see instructions) 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/CYDisallowedForeignTaxGrp/DisallowedForeignTaxPTEAmt"/>
							</xsl:call-template>
							<span class="sty965sHDotLn">....</span>
						</div>
						<div class="styLNRightNumBox">13</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CYDisallowedForeignTaxGrp/DisallowedForeignTaxPTEAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 14 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">14</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Disallowed foreign taxes.</strong> <br /> 
							(Sum lines 12 and 13) Enter result here and include on Form 1118, Schedule G, Part I, line F
							<span class="sty965sHDotLn">....</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:auto;"><br />14</div>
						<div class="styLNAmountBoxNBB" style="height:auto;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CYDisallowedForeignTaxGrp/TotalDisallowedForeignTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="styLNLeftNumBoxSD"/>
						<div class="styLNDesc"/>
						<div class="styLNRightNumBoxNBB"></div>
						<div class="styLNAmountBox" style="text-align:center;font-weight:bold;">
							2017 Tax Year
						</div>
					</div>
					<!-- Line 15 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">15</div>
						<div class="styLNDesc">
							<strong>Section 965(a) inclusion amount in U.S. Dollars from Schedule G, column (e)(1), line 16</strong>
							<span class="sty965sHDotLn">...</span>
						</div>
						<div class="styLNRightNumBox">15</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PYDisallowedForeignTaxGrp/TotNotPTESect965aInclusionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 16 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">16</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Section 965(a) inclusion in U.S. Dollars from pass-throughs from Schedule G, <br /> column (e)(1), line 17</strong>
							<span class="sty965sHDotLn">.........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br />16</div>
						<div class="styLNAmountBox" style="height:auto;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PYDisallowedForeignTaxGrp/TotPTESect965aInclusionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 17 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">17</div>
						<div class="styLNDesc">
							<strong>Total 965(a) inclusion in U.S. Dollars.</strong> Add lines 15 and 16
							<span class="sty965sHDotLn">..............</span>
						</div>
						<div class="styLNRightNumBox">17</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PYDisallowedForeignTaxGrp/TotalSection965aInclusionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 18 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">18</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Section 965(c) deduction in U.S. Dollars not from pass-throughs allocable to section <br />
							965(a) inclusion amount</strong> (see instructions)
							<span class="sty965sHDotLn">...................</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br />18</div>
						<div class="styLNAmountBox" style="height:auto;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PYDisallowedForeignTaxGrp/TotNotPTESect965cDeductionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 19 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">19</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Section 965(c) deduction in U.S. Dollars from pass-throughs allocable to section <br />
							965(a) inclusion</strong> (see instructions)
							<span class="sty965sHDotLn">......................</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br />19</div>
						<div class="styLNAmountBox" style="height:auto;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PYDisallowedForeignTaxGrp/TotPTESect965cDeductionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 20 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">20</div>
						<div class="styLNDesc">
							<strong>Total section 965(c) deduction in U.S. Dollars. </strong> Add lines 18 and 19
							<span class="sty965sHDotLn">...........</span>
						</div>
						<div class="styLNRightNumBox">20</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PYDisallowedForeignTaxGrp/TotalSection965cDeductionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 21 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">21</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Taxes deemed paid not from pass-throughs.</strong><br />
							Enter amount from Schedule G, column (l), line 16 (see instructions)
							<span class="sty965sHDotLn">............</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br />21</div>
						<div class="styLNAmountBox" style="height:auto;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PYDisallowedForeignTaxGrp/TotNotPTETaxesDeemedPaidAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 22 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">22</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Taxes deemed paid through pass-throughs.</strong><br />
							Enter amount from Schedule G, column (l), line 17 (see instructions)
							<span class="sty965sHDotLn">............</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br />22</div>
						<div class="styLNAmountBox" style="height:auto;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PYDisallowedForeignTaxGrp/TotPTETaxesDeemedPaidAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 23 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">23</div>
						<div class="styLNDesc">
							<strong>Taxes deemed paid. </strong> Sum lines 21 and 22
							<span class="sty965sHDotLn">....................</span>
						</div>
						<div class="styLNRightNumBox">23</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PYDisallowedForeignTaxGrp/TotalTaxesDeemedPaidAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 24 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">24</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>2017 Applicable Percentage. </strong>
							Enter percentage not from pass-throughs from Schedule H, line 46
							<span class="sty965sHDotLn">...</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;">24</div>
						<div class="styLNAmountBox" style="height:auto;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PYDisallowedForeignTaxGrp/ApplicableNotPTEPct"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 25 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">25</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>2017 Applicable Percentage from pass-through.</strong><br />
							(if there are multiple pass-throughs, leave this line blank and attach a schedule) 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/PYDisallowedForeignTaxGrp/ApplicablePTEPct"/>
							</xsl:call-template>
							<span class="sty965sHDotLn">.......</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.6mm;"><br />25</div>
						<div class="styLNAmountBox" style="height:7.6mm;"><br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PYDisallowedForeignTaxGrp/ApplicablePTEPct"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 26 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">26</div>
						<div class="styLNDesc">
							<strong>Disallowed foreign taxes not from pass-throughs.</strong> Multiply line 21 by line 24
							<span class="sty965sHDotLn">........</span>
						</div>
						<div class="styLNRightNumBox">26</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PYDisallowedForeignTaxGrp/DisallowedForeignTaxNotPTEAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 27 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">27</div>
						<div class="styLNDesc">
							<strong>Disallowed foreign taxes through pass-throughs.</strong> Attach calculation (see instructions) 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/PYDisallowedForeignTaxGrp/DisallowedForeignTaxPTEAmt"/>
							</xsl:call-template>
							<span class="sty965sHDotLn">....</span>
						</div>
						<div class="styLNRightNumBox">27</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PYDisallowedForeignTaxGrp/DisallowedForeignTaxPTEAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 28 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">28</div>
						<div class="styLNDesc">
							<strong>Disallowed foreign taxes. </strong> Sum lines 26 and 27
							<span class="sty965sHDotLn">..................</span>
						</div>
						<div class="styLNRightNumBoxNBB">28</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PYDisallowedForeignTaxGrp/TotalDisallowedForeignTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Privacy Act and Paperwork Reduction Act Notice, see the separate instructions.</span>
						<span style="margin-left:6mm;">Cat. No. 71323K</span>
						<span style="float:right;font-weight:bold;">Schedule H (Form 965) (1-2019)</span>
					</div>
					<!-- Page 2 -->
					<div class="styStdDiv" style="border-bottom:2px solid black;">
						Schedule H  (Form 965) (1-2019)
						<div style="float:right;">Page <strong>2</strong></div>
					</div>
					<!-- Section 2 -->
					<div class="styStdDiv" style="font-weight:bold;padding-top:1.5mm;padding-bottom:2.5mm;border-bottom:1px solid black;font-size:9pt;">
						SECTION 2 &mdash; Applicable Percentage for Disallowance of Foreign Tax Credit Not From Pass-Throughs
					</div>
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styLNLeftNumBoxSD"/>
						<div class="styLNDesc" style="padding-top:1.5mm;padding-bottom:2.5mm;font-weight:bold;height:auto;">2018 Tax Year Aplicable Percentage</div>
						<div class="styLNRightNumBoxNBB" style="border-left-width:0px;"></div>
						<div class="styLNAmountBoxNBB" style="text-align:center;font-weight:bold;padding-top:1.5mm;padding-bottom:2.5mm;height:auto;">
							2018 Tax Year
						</div>
					</div>
					<!-- Line 29 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">29</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Portion of the aggregate 2018 tax year section 965(a) inclusion not corresponding to the aggregate foreign cash position.</strong> <br />
							Enter amount from Form 965, Part II, section 1, line 12
							<span class="sty965sHDotLn">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br /><br />29</div>
						<div class="styLNAmountBox" style="height:auto;"><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetSmllrCY965aOrFrgnCashPosAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 30 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">30</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Total section 965(a) inclusion amount</strong><br />
							Enter the sum of Form 965, Part II, section 1, lines 9 and 12
							<span class="sty965sHDotLn">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br />30</div>
						<div class="styLNAmountBox" style="height:auto;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CYTotalSection965aInclusionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 31 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">31</div>
						<div class="styLNDesc">
							<strong>Divide line 29 by line 30</strong>
							<span class="sty965sHDotLn">.........................</span>
						</div>
						<div class="styLNRightNumBox">31</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/CYTot965aNetSmllrPct"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 32 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">32</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Applicable percentage with respect to the portion of the aggregate 2018 tax year section 965(a) inclusion not corresponding to the aggregate foreign cash position.</strong> <br />
							Multiply line 31 by 0.771
							<span class="sty965sHDotLn">..........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br /><br />32</div>
						<div class="styLNAmountBox" style="height:auto;"><br /><br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/CYApplcblTot965aNetSmllrPct"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 33 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">33</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Portion of the aggregate 2018 tax year section 965(a) inclusion corresponding to the aggregate foreign cash position. </strong><br /> 
							Enter amount from Form 965, Part II, section 1, line 9
							<span class="sty965sHDotLn">.................</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br /><br />33</div>
						<div class="styLNAmountBox" style="height:auto;"><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SmllrCY965aOrFrgnCashPosAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 34 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">34</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Total section 965(a) inclusion amount.</strong><br />
							Enter the sum of Form 965, Part II, section 1, lines 9 and 12
							<span class="sty965sHDotLn">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br />34</div>
						<div class="styLNAmountBox" style="height:auto;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CYTotalSection965aInclusionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 35 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">35</div>
						<div class="styLNDesc">
							<strong>Divide line 33 by line 34</strong>
							<span class="sty965sHDotLn">.........................</span>
						</div>
						<div class="styLNRightNumBox">35</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/CYTot965aSmllrPct"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 36 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">36</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Applicable percentage with respect to the portion of the aggregate 2018 tax year section 965(a) inclusion corresponding to the aggregate foreign cash position.</strong> <br />
							Multiply line 35 by 0.557
							<span class="sty965sHDotLn">..........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br /><br />36</div>
						<div class="styLNAmountBox" style="height:auto;"><br /><br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/CYApplcblTot965aSmllrPct"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 37 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">37</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>2018 Applicable Percentage.</strong><br />
							Add lines 32 and 36
							<span class="sty965sHDotLn">...........................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:auto;"><br />37</div>
						<div class="styLNAmountBoxNBB" style="height:auto;"><br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/CYApplicableNotPTEPct"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styLNLeftNumBoxSD"/>
						<div class="styLNDesc" style="padding-top:1.5mm;padding-bottom:2.5mm;font-weight:bold;height:auto;">2017 Tax Year Aplicable Percentage</div>
						<div class="styLNRightNumBoxNBB" style="border-left-width:0px;"></div>
						<div class="styLNAmountBoxNBB" style="text-align:center;font-weight:bold;padding-top:1.5mm;padding-bottom:2.5mm;height:auto;">
							2017 Tax Year
						</div>
					</div>
					<!-- Line 38 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">38</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Portion of the aggregate 2017 tax year section 965(a) inclusion not corresponding to the aggregate foreign cash position.</strong> <br />
							Enter amount from Form 965, Part II, section 1, line 23
							<span class="sty965sHDotLn">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br /><br />38</div>
						<div class="styLNAmountBox" style="height:auto;"><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetSmllrPY965aOrFrgnCashPosAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 39 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">39</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Total section 965(a) inclusion amount</strong><br />
							Enter the sum of Form 965, Part II, section 1, lines 20 and 23
							<span class="sty965sHDotLn">..............</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br />39</div>
						<div class="styLNAmountBox" style="height:auto;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PYTotalSection965aInclusionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 40 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">40</div>
						<div class="styLNDesc">
							<strong>Divide line 38 by line 39</strong>
							<span class="sty965sHDotLn">.........................</span>
						</div>
						<div class="styLNRightNumBox">40</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PYTot965aNetSmllrPct"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 41-->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">41</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Applicable percentage with respect to the portion of the aggregate 2017 tax year section 965(a) inclusion not corresponding to the aggregate foreign cash position.</strong> <br />
							Multiply line 40 by 0.771
							<span class="sty965sHDotLn">..........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br /><br />41</div>
						<div class="styLNAmountBox" style="height:auto;"><br /><br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PYApplcblTot965aNetSmllrPct"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 42 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">42</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Portion of the aggregate 2017 tax year section 965(a) inclusion corresponding to the aggregate foreign cash position. </strong><br /> 
							Enter amount from Form 965, Part II, section 1, line 20
							<span class="sty965sHDotLn">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br /><br />42</div>
						<div class="styLNAmountBox" style="height:auto;"><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SmllrPY965aOrFrgnCashPosAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 43 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">43</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Total section 965(a) inclusion amount.</strong><br />
							Enter the sum of Form 965, Part II, section 1, lines 20 and 23
							<span class="sty965sHDotLn">..............</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br />43</div>
						<div class="styLNAmountBox" style="height:auto;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PYTotalSection965aInclusionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 44 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">44</div>
						<div class="styLNDesc">
							<strong>Divide line 42 by line 43</strong>
							<span class="sty965sHDotLn">.........................</span>
						</div>
						<div class="styLNRightNumBox">44</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PYTot965aSmllrPct"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 45 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">45</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Applicable percentage with respect to the portion of the aggregate 2017 tax year section 965(a) inclusion corresponding to the aggregate foreign cash position.</strong> <br />
							Multiply line 44 by 0.557
							<span class="sty965sHDotLn">..........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br /><br />45</div>
						<div class="styLNAmountBox" style="height:auto;"><br /><br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PYApplcblTot965aSmllrPct"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 46 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">46</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>2017 Applicable Percentage.</strong><br />
							Add lines 41 and 45
							<span class="sty965sHDotLn">...........................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:auto;"><br />46</div>
						<div class="styLNAmountBoxNBB" style="height:auto;"><br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PYApplicableNotPTEPct"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:1px solid black;">
						<span style="float:right;font-weight:bold;">Schedule H (Form 965) (1-2019)</span>
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
