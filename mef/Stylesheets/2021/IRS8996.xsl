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
				<meta name="Description" content="IRS Form 8996" />
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
							(Rev. December 2021)
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
								<a style="text-decoration:none;color:black;" href="http://www.irs.gov/Form8996" title="Link to IRS.gov">
					<i>www.irs.gov/Form8996</i>
					</a>
								for instructions and the latest information.
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
							Information and Certification
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
							Is the taxpayer organized for the purpose of investing in qualified opportunity zone (QOZ) property (other than another qualified <br />
							opportunity fund (QOF))? <br />
							<input type="checkbox" class="styCkbox" style="margin-top:3px;margin-bottom:0px;margin-right:8px;margin-left:0px;" alt="Qualified opportunity fund No">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedOpportunityFundNoInd"/>
									<xsl:with-param name="BackupName">F8996QualifiedOpportunityFundNoInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label style="font-weight:bold;"><xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/QualifiedOpportunityFundNoInd"/>
								<xsl:with-param name="BackupName">F8996QualifiedOpportunityFundNoInd</xsl:with-param>
							</xsl:call-template>No. </label> <strong>STOP. </strong> Do not file this form with your tax return. <br />
							<input type="checkbox" class="styCkbox" style="margin-top:3px;margin-bottom:0px;margin-right:8px;margin-left:0px;" alt="Qualified opportunity fund Yes">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedOpportunityFundYesInd"/>
									<xsl:with-param name="BackupName">F8996QualifiedOpportunityFundYesInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label style="font-weight:bold;"><xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/QualifiedOpportunityFundYesInd"/>
								<xsl:with-param name="BackupName">F8996QualifiedOpportunityFundYesInd</xsl:with-param>
							</xsl:call-template>Yes. </label> Go to line 3.
						</div>
					</div>
					<!-- Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="height:auto;width:179mm;">
							Is this the first period the taxpayer is a QOF? <br />
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/FirstPeriodQOFInd"/>
								</xsl:call-template>
							<div style="width:5mm;height:9mm;float:left;">
								<input type="checkbox" class="styCkbox" style="margin-top:3px;margin-bottom:0px;margin-right:0px;margin-left:0px;" alt="First Period Qualified Opportunity Fund Yes">
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
								</xsl:call-template>Yes. </label> By checking this box, you certify that by the end of the taxpayer's first QOF year, the taxpayer's <br />
								organizing documents include a statement of the entity's purpose of investing in QOZ property and a description <br /> of the trade or business(es) that the QOF is engaged in either directly or through a QOZ business. See instructions. 
							</div>
							<div style="width:5mm;height:auto;float:left;">
								<input type="checkbox" class="styCkbox" style="margin-top:3px;margin-bottom:0px;margin-right:0px;margin-left:0px;" alt="First Period Qualified Opportunity Fund No">
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
						<div class="styLNDesc" style="width:146mm;">
							If you checked "Yes" on line 3, provide the first month in which the fund chose to be a QOF &#9658;
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
							Did any investor dispose, in part or in whole, their equity in the fund? <br />
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/DisposeInvestmentQOFInd"/>
								</xsl:call-template>
							<div style="width:5mm;height:4mm;float:left;">
								<input type="checkbox" class="styCkbox" style="margin-top:3px;margin-bottom:0px;margin-right:0px;margin-left:0px;" alt="Disposed investment in Qualified Opportunity Fund Yes">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/DisposeInvestmentQOFInd"/>
										<xsl:with-param name="BackupName">F8996DisposeInvestmentQOFInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<div style="width:173mm;height:auto;min-height:4mm;float:left;padding-top:0.4mm;">
								<label style="font-weight:bold;"><xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$FormData/DisposeInvestmentQOFInd"/>
										<xsl:with-param name="BackupName">F8996DisposeInvestmentQOFInd</xsl:with-param>
								</xsl:call-template>Yes. </label> Attach a statement with the investor's name, the date of disposal, and the interest that they transferred during the QOF's tax year.
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/DisposeInvestmentQOFInd"/>
								</xsl:call-template>
							</div>
							<br />
							<div style="width:5mm;height:auto;float:left;">
								<input type="checkbox" class="styCkbox" style="margin-top:3px;margin-bottom:0px;margin-right:0px;margin-left:0px;" alt="Disposed investment in Qualified Opportunity Fund No">
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
					<!-- Line 6 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">6</div>
						   <div class="checkbox" style="height:3mm; width:3mm;border:1px solid #606060;background-color:#DCDCDC;" alt="Reserved for future use."/>
						<div style="float-left; padding-left:2mm;">Do not check this box. Reserved for future use.</div>
						</div>
<!--
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styGenericDiv" style="width:5mm;height:auto;">
							<input type="checkbox" class="styCkboxNM" style="margin-top:2px;" alt="Elect Decertify Q O F">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/QOFDecertificationGrp/QOFDecertificationElectInd"/>
									<xsl:with-param name="BackupName">IRS8996QOFDecertificationElectInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
						<div class="styLNDesc" style="height:auto;width:173mm;">
							Check this box <strong>only</strong> if the taxpayer is electing to decertify as a QOF. If you check this box, 
							provide the date the taxpayer <br /> elected to decertify as a QOF, and attach a statement to Form 8996 with additional 
							information regarding <br /> decertification. See instructions. &#9658; 
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/QOFDecertificationGrp/QOFDecertificationElectDt"/>
							</xsl:call-template>
						</div>
					</div>
-->

					<!-- Part 2 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName" style="margin-top:1.5mm;margin-bottom:1.5mm;">Part II</div>
						<div class="styPartDesc" style="margin-top:1.5mm;margin-bottom:1.5mm;">
							Investment Standard Calculation
						</div>
					</div>
					<!-- Line 7 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc" style="height:7mm;">
							Enter the amount from Part VI, line 2, for total QOZ property held by the taxpayer on the last day of the <br /> 
							first 6-month period of the taxpayer's tax year. See instructions if Part I, line 3 is "Yes"
							<span class="sty8996DotLn">.......</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br />7</div>
						<div class="styLNAmountBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotQOZPropLastDay6MonthAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 8 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="styLNDesc" style="height:7mm;">
							Total assets held by the taxpayer on the last day of the first 6-month period of the taxpayer's tax <br /> 
							year. See instructions if Part I, line 3 is "Yes"
							<span class="sty8996DotLn">....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br />8</div>
						<div class="styLNAmountBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotPropAssetsLastDay6MonthAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 9 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc">
							Divide line 7 by line 8
							<span class="sty8996DotLn">...........................</span>
						</div>
						<div class="styLNRightNumBox">9</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PropLastDay6MonthPct"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 10 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc" style="height:auto;">
							Enter the amount from Part VI, line 3, for total QOZ property held by the taxpayer on the last day of the <br />
							taxpayer's tax year
							<span class="sty8996DotLn">............................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br />10</div>
						<div class="styLNAmountBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotQOZPropLastDayTYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 11 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">11</div>
						<div class="styLNDesc">
							Total assets held by the taxpayer on the last day of the taxpayer's tax year
							<span class="sty8996DotLn">..........</span>
						</div>
						<div class="styLNRightNumBox">11</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalPropAssetsLastDayTYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 12 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">12</div>
						<div class="styLNDesc">
							Divide line 10 by line 11
							<span class="sty8996DotLn">..........................</span>
						</div>
						<div class="styLNRightNumBoxNBB">12</div>
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
					<!-- Line 13 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">13</div>
						<div class="styLNDesc">
							Add lines 9 and 12
							<span class="sty8996DotLn">...........................</span>
						</div>
						<div class="styLNRightNumBox">13</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalPropertyPct"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 14 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">14</div>
						<div class="styLNDesc">
							Divide line 13 by 2.0. See instructions if Part I, line 3 is "Yes"
							<span class="sty8996DotLn">..............</span>
						</div>
						<div class="styLNRightNumBox">14</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/InvestmentStandardPct"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 15 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">15</div>
						<div class="styLNDesc" style="height:15mm;">
							Is line 14 equal to or more than .90? <br />
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/MaintainInvestmentStandardInd"/>
								</xsl:call-template>
							<div style="width:5mm;height:4mm;float:left;">
								<input type="checkbox" class="styCkbox" style="margin-top:3px;margin-bottom:0px;margin-right:0px;margin-left:0px;" alt="Maintained investment standard Yes">
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
								<input type="checkbox" class="styCkbox" style="margin-top:3px;margin-bottom:0px;margin-right:0px;margin-left:0px;" alt="Maintained investment standard No">
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
								Enter the penalty from line 8 of Part IV on this line. See instructions
								<span class="sty8996DotLn">...........</span>
							</div>
							</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:15mm;padding-top:2.5mm;"><br /><br /><br />15</div>
						<div class="styLNAmountBoxNBB" style="height:15mm;padding-top:2.5mm;"><br /><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyOpportunityFundPenaltyAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="font-weight:bold;">For Paperwork Reduction Act Notice, see your tax return instructions.</span>
						<span style="margin-left:20mm;">Cat. No. 37820G</span>
						<span style="float:right;">Form <strong>8996</strong> (Rev. 12-2021)</span>
					</div>
					<!-- Page 2 -->
					<div class="styStdDivLS" style="border-bottom:2px solid black;">
						Form 8996 (Rev. 12-2021)
						<div style="float:right;">Page <strong>2</strong></div>
					</div>
					<!-- Part 4 -->
					<div class="styStdDivLS" style="border-bottom:1px solid black;">
						<div class="styPartName" style="margin-top:1.5mm;margin-bottom:1.5mm;">Part IV</div>
						<div class="styPartDesc" style="margin-top:1.5mm;margin-bottom:1.5mm;width:235mm;">
							Line 15 Penalty
						</div>
					</div>
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						If you checked "No" in Part III, line 15, complete Part IV to figure the penalty. Enter the number from line 8 below on Part III, line 15. See instructions if Part I, line 3 is "Yes."
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
						<div class="styLNLeftNumBoxSD" style="width:7.5mm;border-bottom:1px solid black;">1</div>
						<div class="styLNDesc" style="width:71mm;border-bottom:1px solid black;">
							Total assets on the last day of the month
							<span class="sty8996DotLn">....</span>
						</div>
						<xsl:call-template name="PopulateEarlyMonth">
							<xsl:with-param name="TargetNode" select="$FormData/QOFPenaltyGrp/MthlyTotalPropAstLastDayMonGrp"/>
						</xsl:call-template>
					</div>
					<!-- Part 4, Line 2 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:7.5mm;border-bottom:1px solid black;">2</div>
						<div class="styLNDesc" style="width:71mm;border-bottom:1px solid black;">
							Multiply line 1 by 0.90
							<span class="sty8996DotLn">..........</span>
						</div>
						<xsl:call-template name="PopulateEarlyMonth">
							<xsl:with-param name="TargetNode" select="$FormData/QOFPenaltyGrp/MthlyPropAstLastDayMonCalcGrp"/>
						</xsl:call-template>
					</div>
					<!-- Part 4, Line 3 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:7.5mm;border-bottom:1px solid black;">3</div>
						<div class="styLNDesc" style="width:71mm;border-bottom:1px solid black;">
							Total QOZ property on the last day of the month
							<span class="sty8996DotLn">..</span>
						</div>
						<xsl:call-template name="PopulateEarlyMonth">
							<xsl:with-param name="TargetNode" select="$FormData/QOFPenaltyGrp/MthlyTotQOZPropLastDayMonthGrp"/>
						</xsl:call-template>
					</div>
					<!-- Part 4, Line 4 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:7.5mm;height:7mm;border-bottom:1px solid black;">4</div>
						<div class="styLNDesc" style="width:71mm;height:7mm;border-bottom:1px solid black;">
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
						<div class="styLNLeftNumBoxSD" style="width:7.5mm;border-bottom:1px solid black;">5</div>
						<div class="styLNDesc" style="width:71mm;border-bottom:1px solid black;">
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
						<div class="styLNLeftNumBoxSD" style="width:7.5mm;border-bottom:1px solid black;">6</div>
						<div class="styLNDesc" style="width:71mm;border-bottom:1px solid black;">
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
							Divide line 6 by 12.0. Round up to two decimal <br /> places. See instructions if Part I, line 3, is "Yes"
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
						<div class="styLNLeftNumBoxSD" style="width:7.5mm;">&nbsp;</div>
						<div class="styLNDesc" style="width:213mm;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="width:35.5mm;border-left-width:0px;">&nbsp;</div>
					</div>
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:7.5mm;">8</div>
						<div class="styLNDesc" style="width:213mm;">
							<strong>Penalty. </strong> Add columns (a) through (l) of line 7. Enter the total here and on Part III, line 15
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
						<span style="float:right;">Form <strong>8996</strong> (Rev. 12-2021)</span>
					</div>
					<!-- Page 3 -->
					<div class="styStdDivLS" style="border-bottom:2px solid black;">
						Form 8996 (Rev. 12-2021)
						<div style="float:right;">Page <strong>3</strong></div>
					</div>
					<!-- Part 5 -->
					<div class="styStdDivLS" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName" style="margin-top:1.5mm;margin-bottom:1.5mm;">Part V</div>
						<div class="styPartDesc" style="width:230mm;margin-top:1.5mm;margin-bottom:1.5mm;">QOZ Business Property &mdash; Directly Owned or Leased by Taxpayer</div>
						<div style="float:right;width:5mm;height:4mm;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/QOZBusPropDrtOwnedLeasedGrp"/>
								<xsl:with-param name="containerID" select=" 'Part5Table' "/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerHeight" select="9"/>
							</xsl:call-template>
						</div>
					</div>
					<xsl:variable name="shouldSepP5" select="($Print = $Separated) and (count($FormData/QOZBusPropDrtOwnedLeasedGrp) &gt; 9)"/>
					<div class="styTableContainerLandscapeNBB" id="Part5Table">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="colgroup" style="width:88mm;font-weight:normal;font-family:Arial;">
										Enter every QOZ where QOZ business property directly <br /> owned or leased by the taxpayer is located
									</th>
									<th class="styTableCellHeader" scope="colgroup" colspan="2" style="width:84mm;font-weight:normal;font-family:Arial;">
										QOZ business property held directly on last day of the first 6-month <br /> period of tax year
									</th>
									<th class="styTableCellHeader" scope="colgroup" colspan="2" style="width:84mm;font-weight:normal;font-family:Arial;border-right-width:0px;">
										QOZ business property held directly <br /> on last day of the tax year
									</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:88mm;font-weight:normal;background-color:#DCDCDC;">
										<strong>(a)</strong><br /> QOZ No.
									</th>
									<th class="styTableCellHeader" scope="col" style="width:42mm;font-weight:normal;background-color:#DCDCDC;">
										<strong>(b)</strong><br /> Owned Property Value
									</th>
									<th class="styTableCellHeader" scope="col" style="width:42mm;font-weight:normal;background-color:#DCDCDC;">
										<strong>(c)</strong><br /> Leased Property Value
									</th>
									<th class="styTableCellHeader" scope="col" style="width:42mm;font-weight:normal;background-color:#DCDCDC;">
										<strong>(d)</strong><br /> Owned Property Value
									</th>
									<th class="styTableCellHeader" scope="col" style="width:42mm;font-weight:normal;background-color:#DCDCDC;border-right-width:0px;">
										<strong>(e)</strong><br /> Leased Property Value
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSepP5)">
									<xsl:for-each select="$FormData/QOZBusPropDrtOwnedLeasedGrp">
										<tr>
											<td class="styTableCellTextInherit" style="padding-left:1mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TractNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="First6MonOwnedValueAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="First6MonLeasedValueAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="LastDayTYOwnedValueAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="LastDayTYLeasedValueAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="(count($FormData/QOZBusPropDrtOwnedLeasedGrp) &lt; 9) or $shouldSepP5">
									<xsl:call-template name="Part5ExtraRows">
										<xsl:with-param name="LineNumber" select="count($FormData/QOZBusPropDrtOwnedLeasedGrp) + 1"/>
										<xsl:with-param name="SepMessage" select="$shouldSepP5"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:if test="not($shouldSepP5)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/QOZBusPropDrtOwnedLeasedGrp"/>
							<xsl:with-param name="containerID" select=" 'Part5Table' "/>
							<xsl:with-param name="headerHeight" select="2"/>
							<xsl:with-param name="containerHeight" select="9"/>
						</xsl:call-template>
					</xsl:if>
					<!-- P5, Line 1 -->
					<!--<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="width:79.9mm;height:13mm;">
							If taxpayer directly owned/leased QOZ business property located in more than the qualified opportunity zones 
							listed above, see instructions and enter total QOZ business property value from continuation sheet
							<span class="sty8996DotLn">.........</span>
						</div>
						<div class="styLNAmountBoxNBB" style="width:42mm;height:13mm;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="width:42mm;height:13mm;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="width:42mm;height:13mm;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="width:42mm;height:13mm;">&nbsp;</div>
					</div>-->
					<!-- Part 6 -->
					<div class="styStdDivLS" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName" style="margin-top:1.5mm;margin-bottom:1.5mm;">Part VI</div>
						<div class="styPartDesc" style="width:230mm;margin-top:1.5mm;margin-bottom:1.5mm;">QOZ Stock or Partnership Interests</div>
						<div style="float:right;width:5mm;height:4mm;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/QOZStockPartnershipIntInvstGrp"/>
								<xsl:with-param name="containerID" select=" 'Part6Table' "/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerHeight" select="8"/>
							</xsl:call-template>
						</div>
					</div>
					<xsl:variable name="shouldSepP6" select="($Print = $Separated) and (count($FormData/QOZStockPartnershipIntInvstGrp) &gt; 8)"/>
					<div class="styTableContainerLandscapeNBB" id="Part6Table">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="colgroup" colspan="2" style="width:66mm;font-weight:normal;font-family:Arial;padding:0.5mm;">
										For every QOZ business in which the taxpayer holds stock or a partnership interest, enter every QOZ in which the tangible property of the QOZ business is located and the EIN of that QOZ business.
									</th>
									<th class="styTableCellHeader" scope="colgroup" colspan="1" style="width:43mm;font-weight:normal;font-family:Arial;padding:0.5mm;">
										Value of QOZ stock or partnership interest held on last day of the first 6-month period of the tax year apportioned to each QOZ
									</th>
									<th class="styTableCellHeader" scope="colgroup" colspan="2" style="width:52mm;font-weight:normal;font-family:Arial;padding:0.5mm;">
										Tangible property held by QOZ business on last day of the first 6-month period of the tax year
									</th>
									<th class="styTableCellHeader" scope="colgroup" colspan="1" style="width:43mm;font-weight:normal;font-family:Arial;padding:0.5mm;">
										Value of QOZ stock or partnership interest held on last day of the tax year apportioned to each QOZ
									</th>
									<th class="styTableCellHeader" scope="colgroup" colspan="2" style="width:52mm;font-weight:normal;font-family:Arial;padding:0.5mm;border-right-width:0px;">
										Tangible property held by QOZ business on last day of the tax year
									</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:33mm;font-weight:normal;background-color:#DCDCDC;">
										<strong>(a)</strong><br /> QOZ No. <br />
										(indicate non-QOZs by 99999999999)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:33mm;font-weight:normal;background-color:#DCDCDC;">
										<strong>(b)</strong><br /> EIN of QOZ Business
									</th>
									<th class="styTableCellHeader" scope="col" style="width:43mm;font-weight:normal;background-color:#DCDCDC;">
										<strong>(c)</strong><br /> Investment Value
									</th>
									<th class="styTableCellHeader" scope="col" style="width:26mm;font-weight:normal;background-color:#DCDCDC;">
										<strong>(d)</strong><br /> Owned Property Value
									</th>
									<th class="styTableCellHeader" scope="col" style="width:26mm;font-weight:normal;background-color:#DCDCDC;">
										<strong>(e)</strong><br /> Leased Property Value
									</th>
									<th class="styTableCellHeader" scope="col" style="width:43mm;font-weight:normal;background-color:#DCDCDC;">
										<strong>(f)</strong><br /> Investment Value
									</th>
									<th class="styTableCellHeader" scope="col" style="width:26mm;font-weight:normal;background-color:#DCDCDC;">
										<strong>(g)</strong><br /> Owned Property Value
									</th>
									<th class="styTableCellHeader" scope="col" style="width:26mm;font-weight:normal;background-color:#DCDCDC;border-right-width:0px;">
										<strong>(h)</strong><br /> Leased Property Value
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSepP6)">
									<xsl:for-each select="$FormData/QOZStockPartnershipIntInvstGrp">
										<tr>
											<td class="styTableCellTextInherit" style="padding-left:1mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TractNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="EIN"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="First6MonInvestmentValueAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="First6MonOwnedValueAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="First6MonLeasedValueAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="LastDayTYInvestmentValueAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="LastDayTYOwnedValueAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="LastDayTYLeasedValueAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="(count($FormData/QOZStockPartnershipIntInvstGrp) &lt; 8) or $shouldSepP6">
									<xsl:call-template name="Part6ExtraRows">
										<xsl:with-param name="LineNumber" select="count($FormData/QOZStockPartnershipIntInvstGrp) + 1"/>
										<xsl:with-param name="SepMessage" select="$shouldSepP6"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:if test="not($shouldSepP6)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/QOZStockPartnershipIntInvstGrp"/>
							<xsl:with-param name="containerID" select=" 'Part6Table' "/>
							<xsl:with-param name="headerHeight" select="2"/>
							<xsl:with-param name="containerHeight" select="9"/>
						</xsl:call-template>
					</xsl:if>
					<!-- P6, Line 1 -->
					<!--<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="width:163.9mm;height:7mm;">
							If additional lines are needed, see instructions and enter total QOZ business value held by the taxpayer from Part VII, line 2, columns (c) and (d)
							<span class="sty8996DotLn">..................................</span>
						</div>
						<div class="styLNAmountBox" style="width:42mm;height:7mm;">&nbsp;</div>
						<div class="styLNAmountBox" style="width:42mm;height:7mm;">&nbsp;</div>
					</div>-->
					<!-- P6, Line 2 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc" style="width:205.9mm;">
							6-month test QOZ property. Add Part V, columns (b) and (c), and Part VI, column (c). Enter the total here and on Part II, line 7
							<span class="sty8996DotLn">..........</span>
						</div>
						<div class="styLNAmountBox" style="width:42mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotQOZPropLastDay6MonthAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- P6, Line 3 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="width:205.9mm;">
							Year-end test QOZ property. Add Part V, columns (d) and (e), and Part VI, column (f). Enter the total here and on Part II, line 10
							<span class="sty8996DotLn">..........</span>
						</div>
						<div class="styLNAmountBox" style="width:42mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotQOZPropLastDayTYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- P6, Line 4 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc" style="width:247mm;height:14mm;">
							Type of accounting method used to value the property listed on this form. <br />
							<input type="checkbox" class="styCkboxNM" style="margin-right:6px;margin-top:4px;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/FinclStmtValuationMethodInd"/>
									<xsl:with-param name="BackupName">F8996FinclStmtValuationMethodInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/FinclStmtValuationMethodInd"/>
									<xsl:with-param name="BackupName">F8996FinclStmtValuationMethodInd</xsl:with-param>
								</xsl:call-template>Applicable financial statement valuation method.</label><br />
							<input type="checkbox" class="styCkboxNM" style="margin-right:6px;margin-top:4px;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/AlternativeValuationMethodInd"/>
									<xsl:with-param name="BackupName">F8996AlternativeValuationMethodInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/AlternativeValuationMethodInd"/>
									<xsl:with-param name="BackupName">F8996AlternativeValuationMethodInd</xsl:with-param>
								</xsl:call-template>Alternative valuation method.</label>
						</div>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;">
						<span style="float:right;">Form <strong>8996</strong> (Rev. 12-2021)</span>
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
					<!-- Part 5 separated table -->
					<xsl:if test="$shouldSepP5">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part V - Qualified Opportunity Zone (QOZ) Business Property&mdash;directly owned or leased by taxpayer</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="colgroup" style="width:88mm;font-weight:normal;font-family:Arial;">
										Enter every QOZ where QOZ business property directly <br /> owned or leased by the taxpayer is located.
									</th>
									<th class="styDepTblCell" scope="colgroup" colspan="2" style="width:84mm;font-weight:normal;font-family:Arial;">
										QOZ business property held directly on last day of the first 6-month <br /> period of tax year
									</th>
									<th class="styDepTblCell" scope="colgroup" colspan="2" style="width:84mm;font-weight:normal;font-family:Arial;border-right-width:0px;">
										QOZ business property held directly <br /> on last day of the tax year
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:88mm;font-weight:normal;">
										<strong>(a)</strong><br /> QOZ No.
									</th>
									<th class="styDepTblCell" scope="col" style="width:42mm;font-weight:normal;">
										<strong>(b)</strong><br /> Owned Property Value
									</th>
									<th class="styDepTblCell" scope="col" style="width:42mm;font-weight:normal;">
										<strong>(c)</strong><br /> Leased Property Value
									</th>
									<th class="styDepTblCell" scope="col" style="width:42mm;font-weight:normal;">
										<strong>(d)</strong><br /> Owned Property Value
									</th>
									<th class="styDepTblCell" scope="col" style="width:42mm;font-weight:normal;">
										<strong>(e)</strong><br /> Leased Property Value
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/QOZBusPropDrtOwnedLeasedGrp">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit" style="padding-left:1mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TractNum"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="First6MonOwnedValueAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="First6MonLeasedValueAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="LastDayTYOwnedValueAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="LastDayTYLeasedValueAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Part 6 separated table -->
					<xsl:if test="$shouldSepP6">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part VI - Qualified Opportunity Zone (QOZ) Stock or Partnership Interests</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="colgroup" colspan="2" style="width:66mm;font-weight:normal;font-family:Arial;padding:0.5mm;">
										For every QOZ business in which the taxpayer holds stock or a partnership interest, enter every QOZ in which the tangible property of the QOZ business is located and the EIN of that QOZ business.
									</th>
									<th class="styDepTblCell" scope="colgroup" colspan="1" style="width:43mm;font-weight:normal;font-family:Arial;padding:0.5mm;">
										Value of QOZ stock or partnership interest held on last day of the first 6-month period of the tax year apportioned to each QOZ
									</th>
									<th class="styDepTblCell" scope="colgroup" colspan="2" style="width:52mm;font-weight:normal;font-family:Arial;padding:0.5mm;">
										Tangible property held by QOZ business on last day of the first 6-month period of the tax year
									</th>
									<th class="styDepTblCell" scope="colgroup" colspan="1" style="width:43mm;font-weight:normal;font-family:Arial;padding:0.5mm;">
										Value of QOZ stock or partnership interest held on last day of the tax year apportioned to each QOZ
									</th>
									<th class="styDepTblCell" scope="colgroup" colspan="2" style="width:52mm;font-weight:normal;font-family:Arial;padding:0.5mm;">
										Tangible property held by QOZ business on last day of the tax year
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:33mm;font-weight:normal;background-color:#DCDCDC;">
										<strong>(a)</strong><br /> QOZ No. <br /> 
										(indicate non-QOZs by 99999999999)
									</th>
									<th class="styDepTblCell" scope="col" style="width:33mm;font-weight:normal;background-color:#DCDCDC;">
										<strong>(b)</strong><br /> EIN of QOZ Business
									</th>
									<th class="styDepTblCell" scope="col" style="width:43mm;font-weight:normal;background-color:#DCDCDC;">
										<strong>(c)</strong><br /> Investment Value
									</th>
									<th class="styDepTblCell" scope="col" style="width:26mm;font-weight:normal;background-color:#DCDCDC;">
										<strong>(d)</strong><br /> Owned Property Value
									</th>
									<th class="styDepTblCell" scope="col" style="width:26mm;font-weight:normal;background-color:#DCDCDC;">
										<strong>(e)</strong><br /> Leased Property Value
									</th>
									<th class="styDepTblCell" scope="col" style="width:43mm;font-weight:normal;background-color:#DCDCDC;">
										<strong>(f)</strong><br /> Investment Value
									</th>
									<th class="styDepTblCell" scope="col" style="width:26mm;font-weight:normal;background-color:#DCDCDC;">
										<strong>(g)</strong><br /> Owned Property Value
									</th>
									<th class="styDepTblCell" scope="col" style="width:26mm;font-weight:normal;background-color:#DCDCDC;">
										<strong>(h)</strong><br /> Leased Property Value
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/QOZStockPartnershipIntInvstGrp">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit" style="padding-left:1mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TractNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="EIN"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="First6MonInvestmentValueAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="First6MonOwnedValueAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="First6MonLeasedValueAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="LastDayTYInvestmentValueAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="LastDayTYOwnedValueAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="LastDayTYLeasedValueAmt"/>
												</xsl:call-template>
											</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<br/>
				</form>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="Part5ExtraRows">
		<xsl:param name="LineNumber"/>
		<xsl:param name="SepMessage" select="false()"/>
		<xsl:param name="MaxLine" select="9"/>
		<tr style="vertical-align:bottom;">
			<td class="styTableCellTextInherit">
				<xsl:choose>
					<xsl:when test="$SepMessage">
						See Additional Data Table
					</xsl:when>
					<xsl:otherwise>&nbsp;</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:choose>
			<xsl:when test="$SepMessage">
				<xsl:call-template name="Part5ExtraRows">
					<xsl:with-param name="LineNumber" select="2"/>
					<xsl:with-param name="SepMessage" select="false()"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$LineNumber &lt; $MaxLine">
				<xsl:call-template name="Part5ExtraRows">
				<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="Part6ExtraRows">
		<xsl:param name="LineNumber"/>
		<xsl:param name="SepMessage" select="false()"/>
		<xsl:param name="MaxLine" select="8"/>
		<tr style="vertical-align:bottom;">
			<td class="styTableCellTextInherit">
				<xsl:choose>
					<xsl:when test="$SepMessage">
						See Additional Data Table
					</xsl:when>
					<xsl:otherwise>&nbsp;</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:choose>
			<xsl:when test="$SepMessage">
				<xsl:call-template name="Part6ExtraRows">
					<xsl:with-param name="LineNumber" select="2"/>
					<xsl:with-param name="SepMessage" select="false()"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$LineNumber &lt; $MaxLine">
				<xsl:call-template name="Part6ExtraRows">
				<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
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
