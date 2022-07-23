<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl" />
	<xsl:include href="AddHeader.xsl" />
	<xsl:include href="CommonPathRef.xsl" />
	<xsl:include href="AddOnTable.xsl" />
	<xsl:include href="IRS8996Style.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS8996" />
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
				<meta name="Description" content="IRS Form 8992" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8996Style" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form8996">
					<xsl:call-template name="DocumentHeader" />
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDiv">
						<div class="styFNBox" style="width:30mm;height:17.5mm;">
							Form <span class="styFN" style="font-size:18pt;">8996</span> 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData" />
							</xsl:call-template>
							<br />
							(December 2019)
							<br />
							<span class="styAgency">
								Department of the Treasury
								<br />
								Internal Revenue Service
							</span>
						</div>
						<div class="styFTBox" style="width:127mm;height:17.5mm;">
							<span class="styFMT" style="font-size:11pt;padding-top:2mm;padding-bottom:0.5mm;">Qualified Opportunity Fund</span><br />
							<span style="font-weight:bold;padding-top:1mm;">
								&#9658;Go to
								<span style="font-style:italic">www.irs.gov/Form8996</span>
								for the latest information.
							</span><br />
							<span style="font-weight:bold;padding-top:1.5mm;">
								&#9658;Attach to your tax return. See instructions.
							</span>
						</div>
						<div class="styTYBox" style="width:30mm;height:17.5mm;">
							<div class="styOMB" style="height:auto;font-size:6pt;padding-top:2mm;padding-bottom:2mm;">OMB No. 1545-0123</div>
							<div style="margin-left:0mm;text-align:left;font-size:7pt;padding-top:1mm;">
								Attachment<br/>Sequence No. 
								<span class="styBoldText" style="font-size:9pt;">996</span>
							</div>
						</div>
					</div>
					<!-- Filer information section -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styNameBox" style="width:135mm;">
							Name<br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template><br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:52mm;padding-left:1mm;font-weight:normal;">
							<span style="font-weight:bold;">Employer identification number</span> <br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<!-- Part 1 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styPartName" style="margin-top:1.5mm;margin-bottom:1.5mm;">Part I</div>
						<div class="styPartDesc" style="margin-top:1.5mm;margin-bottom:1.5mm;">
							General Information and Certification
						</div>
					</div>
					<!-- Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="height:auto;width:179mm;">
							Type of taxpayer:  
							<input type="checkbox" class="styCkbox" style="margin-top:0px;margin-bottom:0px;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/CorporationInd"/>
									<xsl:with-param name="BackupName">F8996CorporationInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label><xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/CorporationInd"/>
								<xsl:with-param name="BackupName">F8996CorporationInd</xsl:with-param>
							</xsl:call-template>Corporation</label>
							<span style="width:5mm;height:2mm;"/>
							<input type="checkbox" class="styCkbox" style="margin-top:0px;margin-bottom:0px;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/PartnershipInd"/>
									<xsl:with-param name="BackupName">F8996PartnershipInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label><xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/PartnershipInd"/>
								<xsl:with-param name="BackupName">F8996PartnershipInd</xsl:with-param>
							</xsl:call-template>Partnership</label>
						</div>
					</div>
					<!-- Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc" style="height:auto;width:179mm;">
							Is the taxpayer organized for the purpose of investing in qualified opportunity zone property (other than another qualified <br />
							opportunity fund? <br />
							<input type="checkbox" class="styCkbox" style="margin-top:3px;margin-bottom:0px;margin-right:8px;margin-left:0px;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedOpporunityFundNoInd"/>
									<xsl:with-param name="BackupName">F8996QualifiedOpporunityFundNoInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label style="font-weight:bold;"><xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/QualifiedOpporunityFundNoInd"/>
								<xsl:with-param name="BackupName">F8996QualifiedOpporunityFundNoInd</xsl:with-param>
							</xsl:call-template>No. </label> <strong>STOP. </strong> Do not file this form with your tax return. <br />
							<input type="checkbox" class="styCkbox" style="margin-top:3px;margin-bottom:0px;margin-right:8px;margin-left:0px;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedOpporunityFundYesInd"/>
									<xsl:with-param name="BackupName">F8996QualifiedOpporunityFundYesInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label style="font-weight:bold;"><xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/QualifiedOpporunityFundYesInd"/>
								<xsl:with-param name="BackupName">F8996QualifiedOpporunityFundYesInd</xsl:with-param>
							</xsl:call-template>Yes. </label> Go to line 3.
						</div>
					</div>
					<!-- Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="height:auto;width:179mm;">
							Is this the first period the taxpayer is a Qualified Opportunity Fund? <br />
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/FirstPeriodQOFInd"/>
								</xsl:call-template>
							<div style="width:5mm;height:9mm;float:left;">
								<input type="checkbox" class="styCkbox" style="margin-top:3px;margin-bottom:0px;margin-right:0px;margin-left:0px;">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/FirstPeriodQOFInd"/>
										<xsl:with-param name="BackupName">F8996FirstPeriodQOFInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<div style="width:173mm;float:left;padding-top:0.7mm;">
								<label style="font-weight:bold;"><xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$FormData/FirstPeriodQOFInd"/>
									<xsl:with-param name="BackupName">F8996FirstPeriodQOFInd</xsl:with-param>
								</xsl:call-template>Yes. </label> By checking this box, you certify that by the end of the taxpayer's first qualified opportunity fund year, the taxpayer's <br />
								organizing documents include a statement of the entity's purpose of investing in qualified opportunity zone property and the <br />
								description of the qualified opportunity zone business. See instructions. 
							</div>
							<div style="width:5mm;height:auto;float:left;">
								<input type="checkbox" class="styCkbox" style="margin-top:3px;margin-bottom:0px;margin-right:0px;margin-left:0px;">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/FirstPeriodQOFInd"/>
										<xsl:with-param name="BackupName">F8996FirstPeriodQOFInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<div style="width:173mm;float:left;padding-top:0.7mm;">
								<label style="font-weight:bold;"><xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$FormData/FirstPeriodQOFInd"/>
										<xsl:with-param name="BackupName">F8996FirstPeriodQOFInd</xsl:with-param>
								</xsl:call-template>No.</label>
							</div>
							</span>
						</div>
					</div>
					<!-- Line 4 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc">
							If "Yes" on line 3, list the first month in which the fund chooses to be a Qualified Opportunity Fund.
						</div>
						<div class="styLNAmountBox" style="width:32mm;text-align:center;border-left-width:0px;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/FirstMonthQOFCd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc" style="height:auto;width:179mm;">
							Did any investor dispose, in part or in whole, of their equity in the Fund? <br />
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/DisposeInvestmentQOFInd"/>
								</xsl:call-template>
							<div style="width:5mm;height:4mm;float:left;">
								<input type="checkbox" class="styCkbox" style="margin-top:3px;margin-bottom:0px;margin-right:0px;margin-left:0px;">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/DisposeInvestmentQOFInd"/>
										<xsl:with-param name="BackupName">F8996DisposeInvestmentQOFInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<div style="width:173mm;height:4mm;float:left;padding-top:0.4mm;">
								<label style="font-weight:bold;"><xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$FormData/DisposeInvestmentQOFInd"/>
										<xsl:with-param name="BackupName">F8996DisposeInvestmentQOFInd</xsl:with-param>
								</xsl:call-template>Yes. </label> Attach a statement with the investor's name, the date of disposal, and the interest that they disposed of.
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/DisposeInvestmentQOFInd"/>
								</xsl:call-template>
							</div>
							<br />
							<div style="width:5mm;height:auto;float:left;">
								<input type="checkbox" class="styCkbox" style="margin-top:3px;margin-bottom:0px;margin-right:0px;margin-left:0px;">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/DisposeInvestmentQOFInd"/>
										<xsl:with-param name="BackupName">F8996DisposeInvestmentQOFInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<div style="width:173mm;float:left;padding-top:0.7mm;">
								<label style="font-weight:bold;"><xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$FormData/DisposeInvestmentQOFInd"/>
									<xsl:with-param name="BackupName">F8996DisposeInvestmentQOFInd</xsl:with-param>
								</xsl:call-template>No.</label>
							</div>
							</span>
						</div>
					</div>
					<!-- Part 2 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName" style="margin-top:1.5mm;margin-bottom:1.5mm;">Part II</div>
						<div class="styPartDesc" style="margin-top:1.5mm;margin-bottom:1.5mm;">
							Investment Standard Calculation
						</div>
					</div>
					<!-- Line 6 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc" style="height:7mm;">
							Total qualified opportunity zone property held by the taxpayer on the last day of the first 6-month <br /> 
							period of the taxpayer's tax year. See instructions if Part I, line 3 is "Yes"
							<span class="sty8996DotLn">...........</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br />6</div>
						<div class="styLNAmountBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotQOZPropLastDay6MonthAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 7 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc" style="height:7mm;">
							Total assets held by the taxpayer on the last day of the first 6-month period of the taxpayer's tax <br /> 
							year. See instructions if Part I, line 3 is "Yes"
							<span class="sty8996DotLn">....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br />7</div>
						<div class="styLNAmountBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotPropAssetsLastDay6MonthAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 8 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="styLNDesc">
							Divide line 6 by line 7
							<span class="sty8996DotLn">...........................</span>
						</div>
						<div class="styLNRightNumBox">8</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PropLastDay6MonthPct"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 9 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc">
							Total qualified opportunity zone property held by the taxpayer on the last day of the taxpayer's tax year
							<span class="sty8996DotLn">.</span>
						</div>
						<div class="styLNRightNumBox">9</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotQOZPropLastDayTYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 10 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc">
							Total assets held by the taxpayer on the last day of the taxpayer's tax year
							<span class="sty8996DotLn">..........</span>
						</div>
						<div class="styLNRightNumBox">10</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalPropAssetsLastDayTYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 11 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">11</div>
						<div class="styLNDesc">
							Divide line 9 by line 10
							<span class="sty8996DotLn">...........................</span>
						</div>
						<div class="styLNRightNumBoxNBB">11</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PropertyLastDayTYPct"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName" style="margin-top:1.5mm;margin-bottom:1.5mm;">Part III</div>
						<div class="styPartDesc" style="margin-top:1.5mm;margin-bottom:1.5mm;">
							Qualified Opportunity Fund Average and Penalty
						</div>
					</div>
					<!-- Line 12 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">12</div>
						<div class="styLNDesc">
							Add lines 8 and 11
							<span class="sty8996DotLn">...........................</span>
						</div>
						<div class="styLNRightNumBox">12</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalPropertyPct"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 13 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">13</div>
						<div class="styLNDesc">
							Divide line 12 by 2.0. See instructions if Part I, line 3 is "Yes"
							<span class="sty8996DotLn">..............</span>
						</div>
						<div class="styLNRightNumBox">13</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/InvestmentStandardPct"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 14 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">14</div>
						<div class="styLNDesc" style="height:15mm;">
							Is line 13 equal to or more than .90? <br />
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/MaintainInvestmentStandardInd"/>
								</xsl:call-template>
							<div style="width:5mm;height:4mm;float:left;">
								<input type="checkbox" class="styCkbox" style="margin-top:3px;margin-bottom:0px;margin-right:0px;margin-left:0px;">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/MaintainInvestmentStandardInd"/>
										<xsl:with-param name="BackupName">F8996MaintainInvestmentStandardInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<div style="width:132.5mm;height:4mm;float:left;padding-top:0.7mm;">
								<label style="font-weight:bold;"><xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$FormData/MaintainInvestmentStandardInd"/>
									<xsl:with-param name="BackupName">F8996MaintainInvestmentStandardInd</xsl:with-param>
								</xsl:call-template>Yes. </label> Enter -0- on this line and file this form with your tax return.
							</div>
							<br />
							<div style="width:5mm;height:auto;float:left;">
								<input type="checkbox" class="styCkbox" style="margin-top:3px;margin-bottom:0px;margin-right:0px;margin-left:0px;">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/MaintainInvestmentStandardInd"/>
										<xsl:with-param name="BackupName">F8996MaintainInvestmentStandardInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<div style="width:132.5mm;float:left;padding-top:0.7mm;">
								<label style="font-weight:bold;"><xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$FormData/MaintainInvestmentStandardInd"/>
									<xsl:with-param name="BackupName">F8996MaintainInvestmentStandardInd</xsl:with-param>
								</xsl:call-template>No. </label> The fund has failed to maintain the investment standard. Complete Part IV to figure the penalty.<br />
								Enter the penalty from line 8 of Part IV on this line, and file this form with your tax return
								<span class="sty8996DotLn">....</span>
							</div>
							</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:15mm;padding-top:2.5mm;"><br /><br /><br />14</div>
						<div class="styLNAmountBoxNBB" style="height:15mm;padding-top:2.5mm;"><br /><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyOpportunityFundPenaltyAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="margin-left:90mm;">Cat. No. 37820G</span>
						<span style="float:right;">Form <strong>8996</strong> (12-2019)</span>
					</div>
					<!-- Page 2 -->
					<div class="styStdDivLS" style="border-bottom:2px solid black;">
						Form 8996 (12-2019)
						<div style="float:right;">Page <strong>2</strong></div>
					</div>
					<!-- Part 4 -->
					<div class="styStdDivLS" style="border-bottom:1px solid black;">
						<div class="styPartName">Part IV</div>
						<div class="styPartDesc" style="width:235mm;">
							Line 14 Penalty
						</div>
					</div>
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						If you checked "No" in Part III, line 14 complete Part IV to figure the penalty. Enter the number from line 8 below on Part III, line 14. See instructions if Part I, line 3 is "Yes."
					</div>
					<div class="styStdDivLS">
						<div class="styGenericDiv" style="width:78.5mm;height:8mm;border-bottom:1px solid black;">&nbsp;</div>
						<div class="sty8996HeaderDiv"><strong>(a)</strong><br />Month 1</div>
						<div class="sty8996HeaderDiv"><strong>(b)</strong><br />Month 2</div>
						<div class="sty8996HeaderDiv"><strong>(c)</strong><br />Month 3</div>
						<div class="sty8996HeaderDiv"><strong>(d)</strong><br />Month 4</div>
						<div class="sty8996HeaderDiv"><strong>(e)</strong><br />Month 5</div>
					</div>
					<!-- Part 4, Line 1 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:7.5mm;">1</div>
						<div class="styLNDesc" style="width:71mm;">
							Total assets on the last day of the month
							<span class="sty8996DotLn">....</span>
						</div>
						<xsl:call-template name="PopulateEarlyMonth">
							<xsl:with-param name="TargetNode" select="$FormData/QOFPenaltyGrp/MthlyTotalPropAstLastDayMonGrp"/>
						</xsl:call-template>
					</div>
					<!-- Part 4, Line 2 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:7.5mm;">2</div>
						<div class="styLNDesc" style="width:71mm;">
							Multiply line 1 by .90
							<span class="sty8996DotLn">..........</span>
						</div>
						<xsl:call-template name="PopulateEarlyMonth">
							<xsl:with-param name="TargetNode" select="$FormData/QOFPenaltyGrp/MthlyPropAstLastDayMonCalcGrp"/>
						</xsl:call-template>
					</div>
					<!-- Part 4, Line 3 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:7.5mm;">3</div>
						<div class="styLNDesc" style="width:71mm;height:7mm;">
							Total Qualified Opportunity Zone Property on <br /> the last day of the month
							<span class="sty8996DotLn">.........</span>
						</div>
						<xsl:call-template name="PopulateEarlyMonth">
							<xsl:with-param name="TargetNode" select="$FormData/QOFPenaltyGrp/MthlyTotQOZPropLastDayMonthGrp"/>
							<xsl:with-param name="DoubleHeight" select="true()"/>
						</xsl:call-template>
					</div>
					<!-- Part 4, Line 4 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:7.5mm;">4</div>
						<div class="styLNDesc" style="width:71mm;height:7mm;">
							Subtract line 3 from line 2. If less than zero, <br /> enter -0-
							<span class="sty8996DotLn">..............</span>
						</div>
						<xsl:call-template name="PopulateEarlyMonth">
							<xsl:with-param name="TargetNode" select="$FormData/QOFPenaltyGrp/MthlyTotAstLessTotQOZGrp"/>
							<xsl:with-param name="DoubleHeight" select="true()"/>
						</xsl:call-template>
					</div>
					<!-- Part 4, Line 5 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:7.5mm;">5</div>
						<div class="styLNDesc" style="width:71mm;">
							Underpayment rate
							<span class="sty8996DotLn">...........</span>
						</div>
						<div class="styLNAmountBox" style="width:35.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QOFPenaltyGrp/MonthlyUnderpaymentRateGrp/Month1Pct"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:35.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QOFPenaltyGrp/MonthlyUnderpaymentRateGrp/Month2Pct"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:35.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QOFPenaltyGrp/MonthlyUnderpaymentRateGrp/Month3Pct"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:35.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QOFPenaltyGrp/MonthlyUnderpaymentRateGrp/Month4Pct"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:35.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QOFPenaltyGrp/MonthlyUnderpaymentRateGrp/Month5Pct"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 4, Line 6 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:7.5mm;">6</div>
						<div class="styLNDesc" style="width:71mm;">
							Multiply line 4 by line 5
							<span class="sty8996DotLn">.........</span>
						</div>
						<xsl:call-template name="PopulateEarlyMonth">
							<xsl:with-param name="TargetNode" select="$FormData/QOFPenaltyGrp/MonthlyTotUnderpaymentAmtGrp"/>
						</xsl:call-template>
					</div>
					<!-- Part 4, Line 7 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:7.5mm;height:7mm;border-bottom:1px solid black;">7</div>
						<div class="styLNDesc" style="width:71mm;height:7mm;border-bottom:1px solid black;">
							Divide line 6 by 12.0. Round up to two decimal <br /> places. See instructions if Part I, line 3 is "Yes"
							<span class="sty8996DotLn">..</span>
						</div>
						<xsl:call-template name="PopulateEarlyMonth">
							<xsl:with-param name="TargetNode" select="$FormData/QOFPenaltyGrp/MonthlyPenaltyAmountGrp"/>
							<xsl:with-param name="DoubleHeight" select="true()"/>
						</xsl:call-template>
					</div>
					<div class="styStdDivLS">
						<div class="styGenericDiv" style="width:7.5mm;height:8mm;border-bottom:1px solid black;">&nbsp;</div>
						<div class="sty8996HeaderDiv"><strong>(f)</strong><br />Month 6</div>
						<div class="sty8996HeaderDiv"><strong>(g)</strong><br />Month 7</div>
						<div class="sty8996HeaderDiv"><strong>(h)</strong><br />Month 8</div>
						<div class="sty8996HeaderDiv"><strong>(i)</strong><br />Month 9</div>
						<div class="sty8996HeaderDiv"><strong>(j)</strong><br />Month 10</div>
						<div class="sty8996HeaderDiv"><strong>(k)</strong><br />Month 11</div>
						<div class="sty8996HeaderDiv"><strong>(l)</strong><br />Month 12</div>
					</div>
					<!-- Part 4, Line 1 (cont) -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:7.5mm;">1</div>
						<xsl:call-template name="PopulateLateMonth">
							<xsl:with-param name="TargetNode" select="$FormData/QOFPenaltyGrp/MthlyTotalPropAstLastDayMonGrp"/>
						</xsl:call-template>
					</div>
					<!-- Part 4, Line 2 (cont) -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:7.5mm;">2</div>
						<xsl:call-template name="PopulateLateMonth">
							<xsl:with-param name="TargetNode" select="$FormData/QOFPenaltyGrp/MthlyPropAstLastDayMonCalcGrp"/>
						</xsl:call-template>
					</div>
					<!-- Part 4, Line 3 (cont) -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:7.5mm;">3</div>
						<xsl:call-template name="PopulateLateMonth">
							<xsl:with-param name="TargetNode" select="$FormData/QOFPenaltyGrp/MthlyTotQOZPropLastDayMonthGrp"/>
						</xsl:call-template>
					</div>
					<!-- Part 4, Line 4 (cont) -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:7.5mm;">4</div>
						<xsl:call-template name="PopulateLateMonth">
							<xsl:with-param name="TargetNode" select="$FormData/QOFPenaltyGrp/MthlyTotAstLessTotQOZGrp"/>
						</xsl:call-template>
					</div>
					<!-- Part 4, Line 5 (cont) -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:7.5mm;">5</div>
						<div class="styLNAmountBox" style="width:35.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QOFPenaltyGrp/MonthlyUnderpaymentRateGrp/Month6Pct"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:35.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QOFPenaltyGrp/MonthlyUnderpaymentRateGrp/Month7Pct"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:35.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QOFPenaltyGrp/MonthlyUnderpaymentRateGrp/Month8Pct"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:35.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QOFPenaltyGrp/MonthlyUnderpaymentRateGrp/Month9Pct"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:35.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QOFPenaltyGrp/MonthlyUnderpaymentRateGrp/Month10Pct"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:35.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QOFPenaltyGrp/MonthlyUnderpaymentRateGrp/Month11Pct"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:35.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QOFPenaltyGrp/MonthlyUnderpaymentRateGrp/Month12Pct"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 4, Line 6 (cont) -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:7.5mm;">6</div>
						<xsl:call-template name="PopulateLateMonth">
							<xsl:with-param name="TargetNode" select="$FormData/QOFPenaltyGrp/MonthlyTotUnderpaymentAmtGrp"/>
						</xsl:call-template>
					</div>
					<!-- Part 4, Line 7 (cont) -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:7.5mm;">7</div>
						<xsl:call-template name="PopulateLateMonth">
							<xsl:with-param name="TargetNode" select="$FormData/QOFPenaltyGrp/MonthlyPenaltyAmountGrp"/>
						</xsl:call-template>
					</div>
					<!-- Part 4, Line 8 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:7.5mm;">8</div>
						<div class="styLNDesc" style="width:213mm;">
							<strong>Penalty. </strong> Add columns (a) through (l) of line 7. Enter the total here and on Part III, line 14
							<span class="sty8996DotLn">........................</span>
						</div>
						<div class="styLNAmountBoxNBB" style="width:35.5mm;border-left-width:0px;">
							<span style="float:left;">$</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QOFPenaltyGrp/QlfyOpportunityFundPenaltyAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;">
						<span style="float:right;">Form <strong>8996</strong> (12-2019)</span>
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
	<xsl:template name="PopulateEarlyMonth">
		<xsl:param name="TargetNode" select="/.."/>
		<xsl:param name="DoubleHeight" select="false()"/>
		<div class="styLNAmountBox" style="width:35.5mm">
			<xsl:if test="$DoubleHeight">
				<xsl:attribute name="style">width:35.5mm;height:7mm;</xsl:attribute>
				<br />
			</xsl:if>
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$TargetNode/Month1Amt"/>
			</xsl:call-template>
		</div>
		<div class="styLNAmountBox" style="width:35.5mm">
			<xsl:if test="$DoubleHeight">
				<xsl:attribute name="style">width:35.5mm;height:7mm;</xsl:attribute>
				<br />
			</xsl:if>
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$TargetNode/Month2Amt"/>
			</xsl:call-template>
		</div>
		<div class="styLNAmountBox" style="width:35.5mm">
			<xsl:if test="$DoubleHeight">
				<xsl:attribute name="style">width:35.5mm;height:7mm;</xsl:attribute>
				<br />
			</xsl:if>
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$TargetNode/Month3Amt"/>
			</xsl:call-template>
		</div>
		<div class="styLNAmountBox" style="width:35.5mm">
			<xsl:if test="$DoubleHeight">
				<xsl:attribute name="style">width:35.5mm;height:7mm;</xsl:attribute>
				<br />
			</xsl:if>
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$TargetNode/Month4Amt"/>
			</xsl:call-template>
		</div>
		<div class="styLNAmountBox" style="width:35.5mm">
			<xsl:if test="$DoubleHeight">
				<xsl:attribute name="style">width:35.5mm;height:7mm;</xsl:attribute>
				<br />
			</xsl:if>
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$TargetNode/Month5Amt"/>
			</xsl:call-template>
		</div>
	</xsl:template>
	<xsl:template name="PopulateLateMonth">
		<xsl:param name="TargetNode" select="/.."/>
		<div class="styLNAmountBox" style="width:35.5mm">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$TargetNode/Month6Amt"/>
			</xsl:call-template>
		</div>
		<div class="styLNAmountBox" style="width:35.5mm">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$TargetNode/Month7Amt"/>
			</xsl:call-template>
		</div>
		<div class="styLNAmountBox" style="width:35.5mm">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$TargetNode/Month8Amt"/>
			</xsl:call-template>
		</div>
		<div class="styLNAmountBox" style="width:35.5mm">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$TargetNode/Month9Amt"/>
			</xsl:call-template>
		</div>
		<div class="styLNAmountBox" style="width:35.5mm">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$TargetNode/Month10Amt"/>
			</xsl:call-template>
		</div>
		<div class="styLNAmountBox" style="width:35.5mm">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$TargetNode/Month11Amt"/>
			</xsl:call-template>
		</div>
		<div class="styLNAmountBox" style="width:35.5mm">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$TargetNode/Month12Amt"/>
			</xsl:call-template>
		</div>
	</xsl:template>
</xsl:stylesheet>
