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
							(January 2021)<br />
							<br />
							<span class="styAgency">
								Department of the Treasury
								<br />
								Internal Revenue Service
							</span>
						</div>
						<div class="styFTBox" style="width:127mm;height:22.5mm;">
							<label><xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectedInd"/>
								<xsl:with-param name="BackupName">965CorrectedInd</xsl:with-param>
							</xsl:call-template>CORRECTED </label> 
							<input type="checkbox" class="styCkboxNM" style="margin:2px 0px -2px 0px;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/CorrectedInd"/>
									<xsl:with-param name="BackupName">965CorrectedInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span class="styFMT" style="font-size:11pt;padding-top:1mm;padding-bottom:2mm;">Inclusion of Deferred Foreign Income <br />
							Upon Transition to Participation Exemption System</span>
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
							<div class="styOMB" style="font-size:6pt;border:none;padding-top:8mm;">OMB No. 1545-0123</div>
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
						<strong>Note. </strong> Throughout this form, the term "2020 tax year" refers to 2020 calendar tax years and fiscal tax years of the person filing this 
						return that begin in 2020. 
					</div>
					<!-- Part 1 -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc">Section 965(a) Inclusion</div>
					</div>
					<!-- Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc">
							Reserved
							<span class="sty965DotLn">..............................</span>
						</div>
						<div class="styLNRightNumBox">1</div>
						<div class="styLNAmountBox" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc">
							Reserved
							<span class="sty965DotLn">..............................</span>
						</div>
						<div class="styLNRightNumBox">2</div>
						<div class="styLNAmountBox" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>2020 tax year section 965(a) inclusions from pass-throughs.</strong><br />
							Enter the sum here and on your tax return as follows.<br />
							Corporations: Enter the line 3 total on Form 1120, Schedule C, line 15, column (a), or the <br />corresponding line of other corporate tax returns. <br />
							All others: See instructions
							<span class="sty965DotLn" style="padding-right:0px;margin-right:-4px;">........................&#9658;</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br /><br /><br /><br />3</div>
						<div class="styLNAmountBox" style="height:auto;"><br /><br /><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Section965aInclusionRcvdAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 4 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc">
							Reserved
							<span class="sty965DotLn">..............................</span>
						</div>
						<div class="styLNRightNumBox">4</div>
						<div class="styLNAmountBox" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 5 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc">
							Reserved
							<span class="sty965DotLn">..............................</span>
						</div>
						<div class="styLNRightNumBox">5</div>
						<div class="styLNAmountBox" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 6 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc">
							Reserved
							<span class="sty965DotLn">..............................</span>
						</div>
						<div class="styLNRightNumBoxNBB">6</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Part 2 -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">Section 965(c) Deduction</div>
					</div>
					<!-- Section 1 -->
					<!--<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="" style="font-weight:bold;padding-top:1mm;padding-bottom:1.5mm;font-size:8pt;">
							SECTION 1 &mdash; Section 965(c) Deduction by Tax Year
						</div>
						<div class="styLNAmountBoxNBB" style="height:auto;width:33mm;text-align:center;font-weight:bold;float:right;padding-top:1mm;padding-bottom:1.5mm;">
							2019 Tax Year
							<span style="font-size:8pt;">&nbsp;</span>
						</div>
					</div>-->
					<!-- Line 7 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc">
							Reserved
							<span class="sty965DotLn">..............................</span>
						</div>
						<div class="styLNRightNumBox">7</div>
						<div class="styLNAmountBox" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 8 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="styLNDesc">
							Reserved
							<span class="sty965DotLn">..............................</span>
						</div>
						<div class="styLNRightNumBox">8</div>
						<div class="styLNAmountBox" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 9 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc">
							Reserved
							<span class="sty965DotLn">..............................</span>
						</div>
						<div class="styLNRightNumBox">9</div>
						<div class="styLNAmountBox" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 10 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc">
							Reserved
							<span class="sty965DotLn">..............................</span>
						</div>
						<div class="styLNRightNumBox">10</div>
						<div class="styLNAmountBox" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 11 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">11</div>
						<div class="styLNDesc">
							Reserved
							<span class="sty965DotLn">..............................</span>
						</div>
						<div class="styLNRightNumBox">11</div>
						<div class="styLNAmountBox" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 12 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">12</div>
						<div class="styLNDesc">
							Reserved
							<span class="sty965DotLn">..............................</span>
						</div>
						<div class="styLNRightNumBox">12</div>
						<div class="styLNAmountBox" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 13 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">13</div>
						<div class="styLNDesc">
							Reserved
							<span class="sty965DotLn">..............................</span>
						</div>
						<div class="styLNRightNumBox">13</div>
						<div class="styLNAmountBox" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 14 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">14</div>
						<div class="styLNDesc">
							Reserved
							<span class="sty965DotLn">..............................</span>
						</div>
						<div class="styLNRightNumBox">14</div>
						<div class="styLNAmountBox" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 15 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">15</div>
						<div class="styLNDesc">
							Reserved
							<span class="sty965DotLn">..............................</span>
						</div>
						<div class="styLNRightNumBox">15</div>
						<div class="styLNAmountBox" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 16 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">16</div>
						<div class="styLNDesc">
							Reserved
							<span class="sty965DotLn">..............................</span>
						</div>
						<div class="styLNRightNumBox">16</div>
						<div class="styLNAmountBox" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Line 17 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">17</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>2020 tax year section 965(c) deduction from pass-throughs.</strong><br />
							Enter the sum here and on your tax return as follows.<br />
							Corporations: Enter the line 17 total on Form 1120, Schedule C, line 15, column (c), or the <br />corresponding line of other corporate tax returns. <br />
							All others: See instructions
							<span class="sty965DotLn" style="padding-right:0px;margin-right:-4px;">........................&#9658;</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:auto;"><br /><br /><br /><br />17</div>
						<div class="styLNAmountBoxNBB" style="height:auto;"><br /><br /><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Section965cDeductionAmt"/>
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
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Privacy Act and Paperwork Reduction Act Notice, see the separate instructions.</span>
						<span style="margin-left:19mm;">Cat. No. 71279D</span>
						<span style="float:right;">Form <strong>965</strong> (1-2021)</span>
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
