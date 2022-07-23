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
	<xsl:include href="IRS965Style.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS965" />
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
						<xsl:call-template name="IRS965Style" />
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
							Form <span class="styFN" style="font-size:18pt;">965</span> 
							<xsl:call-template name="SetFormLinkInline">
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
							<span class="styFMT" style="font-size:11pt;padding-top:1mm;padding-bottom:2mm;">Inclusion of Deferred Foreign Income <br />
							Upon Transition to Participation Exemption System</span>
							<br />
							<span style="font-weight:bold;">
								&#9658;Attach to tax return.
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
					<!-- Filing year section -->
					<div class="styStdDiv" style="font-weight:bold;padding-left:2mm;padding-top:0.5mm;padding-bottom:0.5mm;border-top:1px solid black;">
						For calendar year 
						<span style="width:10mm;text-align:center;">
							<xsl:call-template name="PopulateReturnHeaderTaxYear"/>
						</span>
						, or other tax year beginning 
						<span style="width:20mm;text-align:center;">
							<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
						</span>
						and ending 
						<span style="width:20mm;text-align:center;">
							<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
						</span>
						of the filer.
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
					<!-- Note -->
					<div class="styStdDiv">
						<strong>Note. </strong> Throughout this form, the term "2018 tax year" refers to 2018 calendar tax years and fiscal tax years of the person filing this 
						return that begin in 2018. The term "2017 tax year" refers to 2017 calendar tax years and fiscal tax years of the person filing this return 
						that begin in 2017.
					</div>
					<!-- Part 1 -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc">Section 965(a) Inclusion</div>
					</div>
					<!-- Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>2018 tax year section 965(a) inclusion amounts from Schedule A.</strong><br />
							Enter the sum of column (k) of Schedule A
							<span class="sty965DotLn">....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br />1</div>
						<div class="styLNAmountBox" style="height:auto;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCYSection965aInclusionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc">
							<strong>2018 tax year section 965(a) inclusions from pass-throughs. </strong> Attach schedule
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/CYSect965aInclusionPassThruAmt"/>
							</xsl:call-template>
							<span class="sty965DotLn">.......</span>
						</div>
						<div class="styLNRightNumBox">2</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CYSect965aInclusionPassThruAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Total 2018 tax year section 965(a) inclusion.</strong> Add lines 1 and 2.<br />
							Enter on Form 1120, Schedule C, line 15, column (a); Form 1040, line 21; or the <br />
							corresponding line of other applicable tax return
							<span class="sty965DotLn" style="padding-right:0px;margin-right:-4px;">.................&#9658;</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br /><br />3</div>
						<div class="styLNAmountBox" style="height:auto;"><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Section965aInclusionRcvdAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 4 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>2017 tax year section 965(a) inclusion amounts from Schedule A.</strong><br />
							Enter the sum of column (j) of Schedule A
							<span class="sty965DotLn">....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br />4</div>
						<div class="styLNAmountBox" style="height:auto;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalPYSection965aInclusionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc">
							<strong>2017 tax year section 965(a) inclusions from pass-throughs. </strong> Attach schedule
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/PYSect965aInclusionPassThruAmt"/>
							</xsl:call-template>
							<span class="sty965DotLn">.......</span>
						</div>
						<div class="styLNRightNumBox">5</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PYSect965aInclusionPassThruAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 6 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Total 2017 tax year section 965(a) inclusion.</strong> Add lines 4 and 5
							<span class="sty965DotLn" style="padding-right:0px;margin-right:-4px;">...........&#9658;</span>
						</div>
						<div class="styLNRightNumBoxNBB">6</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PYSection965aInclusionRcvdAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2 -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">Section 965(c) Deduction</div>
					</div>
					<!-- Section 1 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="" style="font-weight:bold;padding-top:1mm;padding-bottom:1.5mm;font-size:8pt;">
							SECTION 1 &mdash; Section 965(c) Deduction by Tax Year
						</div>
						<div class="styLNAmountBoxNBB" style="height:auto;width:33mm;text-align:center;font-weight:bold;float:right;padding-top:1mm;padding-bottom:1.5mm;">
							2018 Tax Year
							<span style="font-size:8pt;">&nbsp;</span>
						</div>
					</div>
					<!-- Line 7 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc">
							Enter the amount from Part I, line 1. If -0-, skip to line 16
							<span class="sty965DotLn">...............</span>
						</div>
						<div class="styLNRightNumBox">7</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCYSection965aInclusionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 8 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Aggregate Foreign Cash Position.</strong><br />
							Enter the sum from Schedule D, line 21
							<span class="sty965DotLn">.....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br />8</div>
						<div class="styLNAmountBox" style="height:auto;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CYAggrgtForeignCashPositionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 9 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc">
							Enter the smaller of line 7 or 8
							<span class="sty965DotLn">........................</span>
						</div>
						<div class="styLNRightNumBox">9</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SmllrCY965aOrFrgnCashPosAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 10 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Enter the 2018 15.5% Rate Equivalent Percentage from Part II, Section 2.</strong><br />
							Enter amount from Section 2, line 1a
							<span class="sty965DotLn">......................</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br />10</div>
						<div class="styLNAmountBox" style="height:auto;"><br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/CY15Pnt5PctRateEquivalentPct"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 11 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">11</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Section 965(c) Deduction Related to 15.5% Rate Equivalent Percentage.</strong><br />
							Multiply line 9 by line 10
							<span class="sty965DotLn">..........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br />11</div>
						<div class="styLNAmountBox" style="height:auto;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CYSect965cDed15Pnt5PctAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 12 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">12</div>
						<div class="styLNDesc">
							Subtract line 9 from line 7
							<span class="sty965DotLn">.........................</span>
						</div>
						<div class="styLNRightNumBox">12</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetSmllrCY965aOrFrgnCashPosAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 13 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">13</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Enter the 2018 8% Rate Equivalent Percentage from Part II, Section 2.</strong><br />
							Enter amount from Section 2, line 1b
							<span class="sty965DotLn">......................</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br />13</div>
						<div class="styLNAmountBox" style="height:auto;"><br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/CY8PctRateEquivalentPct"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 14 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">14</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Section 965(c) Deduction Related to 8% Rate Equivalent Percentage.</strong><br />
							Multiply line 12 by line 13
							<span class="sty965DotLn">..........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br />14</div>
						<div class="styLNAmountBox" style="height:auto;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CYSect965cDeduction8PctAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 15 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">15</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>2018 tax year section 965(c) deduction not from pass-throughs.</strong><br />
							Add lines 11 and 14
							<span class="sty965DotLn">...........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br />15</div>
						<div class="styLNAmountBox" style="height:auto;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CYSect965cDedNonPassThruAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 16 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">16</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>2018 tax year section 965(c) deduction from pass-throughs.</strong><br />
							Attach schedule
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/CYSect965cDedPassThruAmt"/>
							</xsl:call-template>
							<span class="sty965DotLn">............................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.4mm;"><br />16</div>
						<div class="styLNAmountBox" style="height:7.4mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CYSect965cDedPassThruAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 17 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">17</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Total 2018 tax year section 965(c) deduction.</strong><br />
							Add lines 15 and 16
							<span class="sty965DotLn">...........................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:auto;"><br />17</div>
						<div class="styLNAmountBoxNBB" style="height:auto;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CYTotalSect965cDeductionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Footer -->
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Privacy Act and Paperwork Reduction Act Notice, see the separate instructions.</span>
						<span style="margin-left:19mm;">Cat. No. 71279D</span>
						<span style="float:right;">Form <strong>965</strong> (1-2019)</span>
					</div>
					<!-- Page 2 -->
					<div class="styStdDiv" style="border-bottom:2px solid black;">
						Form 965 (1-2019)
						<div style="float:right;">Page <strong>2</strong></div>
					</div>
					<!-- Section 1 cont -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="" style="font-weight:bold;padding-top:1mm;padding-bottom:1.5mm;font-size:8pt;">
							SECTION 1 &mdash; Section 965(c) Deduction by Tax Year <span style="font-weight:normal;font-style:italic;">(continued)</span>
						</div>
						<div class="styLNAmountBoxNBB" style="height:auto;width:33mm;text-align:center;font-weight:bold;float:right;padding-top:1mm;padding-bottom:1.5mm;">
							2017 Tax Year
							<span style="font-size:8pt;">&nbsp;</span>
						</div>
					</div>
					<!-- Line 18 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">18</div>
						<div class="styLNDesc">
							Enter the amount from Part I, line 4. If -0-, skip to line 27
							<span class="sty965DotLn">...............</span>
						</div>
						<div class="styLNRightNumBox">18</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalPYSection965aInclusionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 19 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">19</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Aggregate Foreign Cash Position.</strong><br />
							Enter the sum from Schedule D, line 19
							<span class="sty965DotLn">.....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br />19</div>
						<div class="styLNAmountBox" style="height:auto;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AggrgtForeignCashPositionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 20 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">20</div>
						<div class="styLNDesc">
							Enter the smaller of line 18 or 19
							<span class="sty965DotLn">.......................</span>
						</div>
						<div class="styLNRightNumBox">20</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SmllrPY965aOrFrgnCashPosAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 21 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">21</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Enter the 2017 15.5% Rate Equivalent Percentage from Part II, Section 2.</strong><br />
							For calendar year persons, enter amount from Section 2, line 1a. For fiscal year persons, enter <br /> amount from Section 2, line 2c
							<span class="sty965DotLn">........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br /><br />21</div>
						<div class="styLNAmountBox" style="height:auto;"><br /><br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PY15Pnt5PctRateEquivalentPct"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 22 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">22</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Section 965(c) Deduction Related to 15.5% Rate Equivalent Percentage.</strong><br />
							Multiply line 20 by line 21
							<span class="sty965DotLn">..........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br />22</div>
						<div class="styLNAmountBox" style="height:auto;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PYSect965cDed15Pnt5PctAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 23 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">23</div>
						<div class="styLNDesc">
							Subtract line 20 from line 18
							<span class="sty965DotLn">.........................</span>
						</div>
						<div class="styLNRightNumBox">23</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetSmllrPY965aOrFrgnCashPosAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 24 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">24</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Enter the 2017 8% Rate Equivalent Percentage from Part II, Section 2.</strong><br />
							For calendar year persons, enter amount from Section 2, line 1b. For fiscal year persons, enter <br /> amount from Section 2, line 2e
							<span class="sty965DotLn">........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br /><br />24</div>
						<div class="styLNAmountBox" style="height:auto;"><br /><br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PY8PctRateEquivalentPct"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 25 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">25</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Section 965(c) Deduction Related to 8% Rate Equivalent Percentage.</strong><br />
							Multiply line 23 by line 24
							<span class="sty965DotLn">..........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br />25</div>
						<div class="styLNAmountBox" style="height:auto;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PYSect965cDeduction8PctAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 26 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">26</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>2017 tax year section 965(c) deductions not from pass-throughs.</strong><br />
							Add lines 22 and 25
							<span class="sty965DotLn">...........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br />26</div>
						<div class="styLNAmountBox" style="height:auto;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PYSect965cDedNonPassThruAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 27 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">27</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>2017 tax year section 965(c) deductions from pass-throughs.</strong><br />
							Attach schedule
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/PYSect965cDedPassThruAmt"/>
							</xsl:call-template>
							<span class="sty965DotLn">............................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.4mm;"><br />27</div>
						<div class="styLNAmountBox" style="height:7.4mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PYSect965cDedPassThruAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 28 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">28</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Total 2017 tax year section 965(c) deduction.</strong><br />
							Add lines 26 and 27
							<span class="sty965DotLn">...........................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:auto;"><br />28</div>
						<div class="styLNAmountBoxNBB" style="height:auto;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PYTotalSect965cDeductionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Section 2 -->
					<div class="styStdDiv" style="font-weight:bold;font-size:8pt;padding-top:1mm;padding-bottom:1.5mm;border-bottom:1px solid black;border-top:1px solid black;">
						SECTION 2 &mdash; Rate Equivalent Percentages 
					</div>
					<!-- Sec 2, Line 1 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styLNLeftNumBoxSD" style="padding-top:2mm;">1</div>
						<div style="float:left;font-weight:bold;padding-top:2mm;">
							Calendar Year Persons
						</div>
						<div style="float:right;">
							<div class="styLNAmountBoxNBB" style="width:28mm;height:auto;text-align:center;padding-top:1mm;padding-bottom:1.5mm;">
								<strong>2017</strong><br />Calendar Year
							</div>
							<div class="styLNAmountBoxNBB" style="width:28mm;height:auto;text-align:center;padding-top:1mm;padding-bottom:1.5mm;">
								<strong>2018</strong><br />Calendar Year
							</div>
						</div>
					</div>
					<!-- Sec 2, Line 1a -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styLNLeftLtrBox" style="height:auto;"><br />a</div>
						<div class="styLNDesc" style="width:auto;height:auto;"><br />
							15.5 Percent Rate Equivalent Percentage
						</div>
						<div style="float:right;">
							<div class="styLNAmountBoxNBB" style="width:28mm;height:auto;text-align:center;">
								<br />0.557142857
							</div>
							<div class="styLNAmountBoxNBB" style="width:28mm;height:auto;text-align:center;">
								<br />0.261904762
							</div>
						</div>
					</div>
					<!-- Sec 2, Line 1b -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styLNLeftLtrBox" style="height:auto;"><br />b</div>
						<div class="styLNDesc" style="width:auto;height:auto;"><br />
							8 Percent Rate Equivalent Percentage
						</div>
						<div style="float:right;">
							<div class="styLNAmountBoxNBB" style="width:28mm;height:auto;text-align:center;">
								<br />0.771428571
							</div>
							<div class="styLNAmountBoxNBB" style="width:28mm;height:auto;text-align:center;">
								<br />0.619047619
							</div>
						</div>
					</div>
					<!-- Sec 2, Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-top:2mm;padding-bottom:2mm;">2</div>
						<div class="styLNDesc" style="font-weight:bold;padding-top:2mm;height:auto;">
							Fiscal Year Persons
						</div>
						<div class="styLNRightNumBoxNBB" style="padding-top:2mm;padding-bottom:2mm;height:auto;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="padding-top:2mm;padding-bottom:2mm;height:auto;">&nbsp;</div>
					</div>
					<!-- Sec 2, Line 2a -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBox">a</div>
						<div class="styLNDesc">
							Enter the section 15 blended rate calculated in accordance with section 965(c)(2) (see instructions)
						</div>
						<div class="styLNRightNumBox">2a</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/FYSect15Blended965c2Rt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="text-align:center;font-weight:bold;">
							15.5 Percent Rate Equivalent Percentage
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;border-left:none;"/>
					</div>
					<!-- Sec 2, Line 2b -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBox">b</div>
						<div class="styLNDesc">
							Subtract 15.5% from line 2a 
							<span class="sty965DotLn">.........................</span>
						</div>
						<div class="styLNRightNumBox">2b</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/FYSect15Blend965c2Less15PctRt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Sec 2, Line 2c -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBox">c</div>
						<div class="styLNDesc">
							Divide line 2b by line 2a
							<span class="sty965DotLn">..........................</span>
						</div>
						<div class="styLNRightNumBox">2c</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/FY15Pnt5PctRateEquivalentPct"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftLtrBox"/>
						<div class="styLNDesc" style="text-align:center;font-weight:bold;">
							8 Percent Rate Equivalent Percentage
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;border-left:none;"/>
					</div>
					<!-- Sec 2, Line 2d -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBox">d</div>
						<div class="styLNDesc">
							Subtract 8% from line 2a 
							<span class="sty965DotLn">..........................</span>
						</div>
						<div class="styLNRightNumBox">2d</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/FYSect15Blend965c2Less8PctRt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Sec 2, Line 2e -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBox">e</div>
						<div class="styLNDesc">
							Divide line 2d by line 2a
							<span class="sty965DotLn">..........................</span>
						</div>
						<div class="styLNRightNumBoxNBB">2e</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/FY8PctRateEquivalentPct"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3 -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc" style="width:153mm;">Elections</div>
						<div class="styLNAmountBoxNBB" style="width:10mm;text-align:center;font-weight:bold;">Yes</div>
						<div class="styLNAmountBoxNBB" style="width:10mm;text-align:center;font-weight:bold;">No</div>
					</div>
					<!-- Line A -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">A</div>
						<div class="styLNDesc" style="width:159mm;">
							Was an election made to pay the net tax liability over 8 years as provided for in section 965(h)?
							<span class="sty965DotLn">.........</span>
						</div>
						<div class="styLNAmountBox" style="width:10mm;text-align:center;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/Section965hElectionInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:10mm;text-align:center;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/Section965hElectionInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line B -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">B</div>
						<div class="styLNDesc" style="width:159mm;height:auto;">
							Complete if a shareholder in an S corporation. <br />
							Was an election made to defer payment of net tax liability as provided for in section 965(i)?
							<span class="sty965DotLn">..........</span>
						</div>
						<div class="styLNAmountBox" style="width:10mm;text-align:center;height:auto;"><br />
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/Section965iElectionInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:10mm;text-align:center;height:auto;"><br />
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/Section965iElectionInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line C -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">C</div>
						<div class="styLNDesc" style="width:159mm;height:auto;">
							Complete if a Real Estate Investment Trust. <br />
							Was an election made to include income over 8 years as provided for in section 965(m)?
							<span class="sty965DotLn">...........</span>
						</div>
						<div class="styLNAmountBox" style="width:10mm;text-align:center;height:auto;"><br />
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/Section965mElectionInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:10mm;text-align:center;height:auto;"><br />
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/Section965mElectionInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line D -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">D</div>
						<div class="styLNDesc" style="width:159mm;">
							Was an election made not to apply a net operating loss deduction as provided for in section 965(n)?
							<span class="sty965DotLn">........</span>
						</div>
						<div class="styLNAmountBox" style="width:10mm;text-align:center;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/Section965nElectionInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:10mm;text-align:center;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/Section965nElectionInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line E -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">E</div>
						<div class="styLNDesc" style="width:159mm;">
							Was the election provided for in Regulations section 1.965-2(f)(2) made?
							<span class="sty965DotLn">................</span>
						</div>
						<div class="styLNAmountBoxNBB" style="width:10mm;text-align:center;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/Section9652f2ElectionInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:10mm;text-align:center;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/Section9652f2ElectionInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Footer -->
					<div class="styStdDiv pageEnd" style="border-top:1px solid black;">
						<span style="float:right;">Form <strong>965</strong> (1-2019)</span>
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
