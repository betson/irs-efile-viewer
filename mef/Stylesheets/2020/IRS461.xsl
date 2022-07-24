<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Eugenia McDonald on 06/02/2020 -->
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
  <!ENTITY mdash "&#8212;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl" />
	<xsl:include href="AddHeader.xsl" />
	<xsl:include href="CommonPathRef.xsl" />
	<xsl:include href="AddOnTable.xsl" />
	<xsl:include href="IRS461Style.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS461" />
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
				<meta name="Description" content="IRS Form 461" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS461Style" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form461">
					<xsl:call-template name="DocumentHeader" />
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDiv">
						<div class="styFNBox" style="width:30mm;height:22.5mm;">
							Form <span class="styFN" style="font-size:18pt;">461</span> 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData" />
							</xsl:call-template>
							<br />
							<br />
							<br />
							<span class="styAgency">
								Department of the Treasury
								<br />
								Internal Revenue Service
							</span>
						</div>
						<div class="styFTBox" style="width:127mm;height:22.5mm;">
							<span class="styFMT" style="font-size:12pt;padding-top:1mm;padding-bottom:1mm;">Limitation on Business Losses</span>
							<br /><br />
							<span style="font-weight:bold;">
								&#9658;Attach to your tax return.
							</span><br /><br />
							<span style="font-weight:bold;">
								&#9658;Go to
								<span style="font-style:italic">www.irs.gov/Form461</span>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:30mm;height:22.5mm;">
							<div class="styOMB" style="height:auto;font-size:6pt;">OMB No. 1545-2283</div>
							<div class="styTY">20<span class="styTYColor">20</span>
							</div>
							<div style="margin-left:3mm;text-align:left;font-size:7pt;">
								Attachment<br/>Sequence No. 
								<span class="styBoldText" style="font-size:9pt;">461</span>
							</div>
						</div>
					</div>
					<!-- Filer information section -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styNameBox" style="width:135mm;">
							Name(s) shown on return<br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template><br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:52mm;padding-left:0.5mm;font-weight:normal;">
							<strong>Identifying number</strong><br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<!-- Part 1 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styPartName" style="height:auto;margin-top:1.5mm;margin-bottom:1.5mm;">Part I</div>
						<div class="styPartDesc" style="height:auto;">
							Total Income/Loss Items <br />
							<span style="font-weight:normal;">See instructions if you are filing a tax return other than Form 1040 or 1040-SR.</span>
						</div>
					</div>
					<!-- Line 1 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="sty461LeftBox">1</div>
						<div class="sty461Desc">
							Enter amount from Form 1040 or 1040-SR, line 1
							<span class="sty461DotLn">..................</span>
						</div>
						<div class="styLNRightNumBoxNBB">1</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/WagesSalariesAndTipsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="sty461LeftBox">2</div>
						<div class="sty461Desc">
							Enter amount from Schedule 1 (Form 1040 or 1040-SR), line 3
							<span class="sty461DotLn">..............</span>
						</div>
						<div class="styLNRightNumBoxNBB">2</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BusinessIncomeLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="sty461LeftBox">3</div>
						<div class="sty461Desc">
							Enter amount from Form 1040 or 1040-SR, line 6
							<span class="sty461DotLn">..................</span>
						</div>
						<div class="styLNRightNumBoxNBB">3</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CapitalGainLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 4 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="sty461LeftBox">4</div>
						<div class="sty461Desc">
							Enter amount from Schedule 1 (Form 1040 or 1040-SR), line 4
							<span class="sty461DotLn">..............</span>
						</div>
						<div class="styLNRightNumBoxNBB">4</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OtherGainLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="sty461LeftBox">5</div>
						<div class="sty461Desc">
							Enter amount from Schedule 1 (Form 1040 or 1040-SR), line 5
							<span class="sty461DotLn">..............</span>
						</div>
						<div class="styLNRightNumBoxNBB">5</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/RentalRealEstateIncomeLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 6 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="sty461LeftBox">6</div>
						<div class="sty461Desc">
							Enter amount from Schedule 1 (Form 1040 or 1040-SR), line 6
							<span class="sty461DotLn">..............</span>
						</div>
						<div class="styLNRightNumBoxNBB">6</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetFarmProfitLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 7 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="sty461LeftBox">7</div>
						<div class="sty461Desc">
							Enter amount from Schedule 1 (Form 1040 or 1040-SR), line 7
							<span class="sty461DotLn">..............</span>
						</div>
						<div class="styLNRightNumBoxNBB">7</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/UnemploymentCompAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 8 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="sty461LeftBox">8</div>
						<div class="sty461Desc">
							Enter other income, gain, or losses from a trade or business not reported on lines 1 through 7
							<span class="sty461DotLn">....</span>
						</div>
						<div class="styLNRightNumBoxNBB">8</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OtherIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 9 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="sty461LeftBox">9</div>
						<div class="sty461Desc">
							Combine lines 1 through 8
							<span class="sty461DotLn">.........................</span>
						</div>
						<div class="styLNRightNumBoxNBB">9</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalIncomeOrLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styPartName" style="height:auto;margin-top:1.5mm;margin-bottom:1.5mm;">Part II</div>
						<div class="styPartDesc" style="height:auto;">
							Adjustment for Amounts Not Attributable to Trade or Business <br />
							<span style="font-weight:normal;">See instructions if you are filing a tax return other than Form 1040 or 1040-SR.</span>
						</div>
					</div>
					<!-- Line 10 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="sty461LeftBox">10</div>
						<div class="sty461Desc">
							Enter any income or gain reported on lines 1 through 8 that is not attributable to a trade or business
							<span class="sty461DotLn">..</span>
						</div>
						<div class="styLNRightNumBoxNBB">10</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IncomeOrGainAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 11 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="sty461LeftBox">11</div>
						<div class="sty461Desc">
							Enter any losses or deductions reported on lines 1 through 8 that are not attributable to a trade or business. <br />See instructions
							<span class="sty461DotLn">............................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;"><br />11</div>
						<div class="styLNAmountBoxNBB" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DeductionOrLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 12 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="sty461LeftBox">12</div>
						<div class="sty461Desc">
							Subtract line 11 from line 10
							<span class="sty461DotLn">.........................</span>
						</div>
						<div class="styLNRightNumBoxNBB">12</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalGainLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styPartName" style="height:auto;margin-top:1.5mm;margin-bottom:1.5mm;">Part III</div>
						<div class="styPartDesc" style="height:auto;margin-top:1.5mm;">
							Limitation on Losses
						</div>
					</div>
					<!-- Line 13 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="sty461LeftBox">13</div>
						<div class="sty461Desc">
							If line 12 is a negative number, enter it here as a positive number. If line 12 is a positive number, enter it <br />
							here as a negative number
							<span class="sty461DotLn">.........................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;"><br />13</div>
						<div class="styLNAmountBoxNBB" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdjustedTotalGainLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 14 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="sty461LeftBox">14</div>
						<div class="sty461Desc">
							Add lines 9 and 13
							<span class="sty461DotLn">...........................</span>
						</div>
						<div class="styLNRightNumBoxNBB">14</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdjustedTotalIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 15 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="sty461LeftBox">15</div>
						<div class="sty461Desc">
							Enter $255,000 (or $510,000 if married filing jointly)
							<span class="sty461DotLn">.................</span>
						</div>
						<div class="styLNRightNumBoxNBB">15</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FilingStatusThresholdCd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 16 -->
					<div class="styStdDiv">
						<div class="sty461LeftBox">16</div>
						<div class="sty461Desc">
							Add lines 14 and 15. If less than zero, enter the amount from line 16 as a positive number on Schedule 1 (Form 1040 or 1040-SR), line 8. 
							See instructions if you are filing a tax return other than a Form 1040 or 1040-SR. If zero or greater, do not attach this form to your tax return
							<span class="sty461DotLn">............</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:10mm;"><br /><br />16</div>
						<div class="styLNAmountBoxNBB" style="height:10mm;"><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ExcessBusinessLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:2px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Privacy Act and Paperwork Reduction Act Notice, see the separate instructions.</span>
						<span style="margin-left:14mm;">Cat. No. 16654I</span>
						<span style="float:right;">Form <strong>461</strong> (2020)</span>
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
