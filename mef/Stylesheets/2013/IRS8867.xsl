<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
  <!ENTITY bull "&#8226;">
  <!ENTITY ndash "&#8211;">
  <!ENTITY mdash "&#8212;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8867Style.xsl"/>
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />  
	<xsl:param name="FormData" select="$RtnDoc/IRS8867" />  
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)"/>
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
				<meta name="Description" content="IRS Form 8867" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8867Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form id="IRS8867">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Header -->
					<div class="styTBB" style="width:187mm;">
						<div class="styFNBox" style="width:27mm;height:22mm;">
							Form <span class="styFN">8867</span><br/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template> <br/><br/>
							<span class="styAgency">Department of the Treasury <br/>Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:128mm;padding-top:2mm;height:22mm;">
							<span class="styFMT" style="font-size:12.5pt;">Paid Preparer's Earned Income Credit Checklist</span>
							<br/>
							<img alt="Bullet" src="{$ImagePath}/8867_Bullet.gif" height="9" width="9"/>
							<span class="styFBT"> To be completed by preparer and filed with Form 1040, 1040A, or 1040EZ.</span>
							<br/>
							<img alt="Bullet" src="{$ImagePath}/8867_Bullet.gif" height="9" width="9"/>
							<span class="styFBT">Information about Form 8867 and its separate instructions is at <i>www.irs.gov/form8867.</i></span>
						</div>
						<div class="styTYBox" style="width:32mm;height:22mm;">
							<div class="styOMB">OMB No. 1545-1629</div>
							<span class="styTaxYear">20<span class="styTYColor">13</span></span><br/>
							<span class="stySequence">Attachment <br/>Sequence No. <span style="font-size:10pt;font-weight:bold;">177</span></span>
						</div>
					</div>
					<!-- Taxpayer Name/SSN -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:137mm; height:8mm; font-size: 7pt; ">
							Taxpayer name(s) shown on return <br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">Name</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:48mm; height:8mm; font-size: 7pt; ">
							Taxpayer's social security number <br/>
							<span style="font-weight:normal;width:100%;text-align:center;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Terms -->
					<div class="styBB" style="width:187mm;padding-top:2px;padding-bottom:8px;">
						For the definitions of the following terms, see <b>Pub. 596</b><br/>
						<span style="width:186mm;text-align:center;font-weight:bold;">
							<img alt="Round bullet" src="{$ImagePath}/8867_Bullet_Round.gif" width="6" height="6"/>
							Investment Income
							<span style="width:10mm;"/>
							<img alt="Round bullet" src="{$ImagePath}/8867_Bullet_Round.gif" width="6" height="6"/>
							Qualifying Child
							<span style="width:10mm;"/>
							<img alt="Round bullet" src="{$ImagePath}/8867_Bullet_Round.gif" width="6" height="6"/>
							Earned Income
							<span style="width:10mm;"/>
							<img alt="Round bullet" src="{$ImagePath}/8867_Bullet_Round.gif" width="6" height="6"/>
							Full-time Student
						</span>
					</div>
					<!-- BEGIN Part I -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc">All Taxpayers</div>
					</div>
					<div class="styGenericDiv" style="width:187mm;">
							<div class="styIRS8867BranchDesc" />
						</div>
					<div class="styTBB" style="width:187mm; float:none; clear:both;">
						<!-- Line 1 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBoxSD" style="height:5mm;">1</div>
							<div class="styIRS8867LNDesc" style="height:5mm;width:44mm">
								Enter preparer's name and PTIN  
								<img alt="Bullet" src="{$ImagePath}/8867_Bullet.gif" style="width: 2.4mm; height: 2.4mm;"/>
							</div>
							<div class="styIRS8867LNDesc" style="height:5mm;width:102.25mm;border-bottom:1px black dashed;text-align:left;border-right: 1px solid black;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/PreparerPersonName"/>
								</xsl:call-template>
								<span style="width:6px"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/PTIN"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styIRS8867BranchDesc" />
						</div>
						<!-- Line 2 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBoxSD" style="height:5mm;">2</div>
							<div class="styIRS8867LNDesc" style="height:5mm;">
								<span style="float:left;clear:none;">Is the taxpayer's filing status married filing separately?</span>
								<span class="styIRS8867Dots">..............</span>
							</div>
							<div class="styIRS8867LNAmountBox" style="height:5mm;">
								<span style="width:100%; ">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/TaxpayerFSMarriedFilingSepInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerFSMarriedFilingSepInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerFSMarriedFilingSepInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerFSMarriedFilingSepInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerFSMarriedFilingSepInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<span style="width:24px;"/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerFSMarriedFilingSepInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerFSMarriedFilingSepInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerFSMarriedFilingSepInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerFSMarriedFilingSepInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
								</span>
							</div>
						</div>
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styIRS8867BranchDesc">
								<img alt="Bullet" src="{$ImagePath}/8867_Bullet.gif" height="9" width="9"/>
								If you checked <b>"Yes"</b> on line 2, <b>stop;</b> the taxpayer <b>cannot</b> take the EIC. Otherwise, continue.
							</div>
						</div>
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styIRS8867BranchDesc"/>
						</div>
						<!-- Line 3 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBoxSD" style="height:11mm;">3</div>
							<div class="styIRS8867LNDesc" style="height:11mm;">
								Does the taxpayer (and the taxpayer's spouse if filing jointly) have a social security number <br/>
								(SSN) that allows him or her to work or is valid for EIC purposes? See the instructions before <br/>
								<span style="float:left;clear:none;">answering</span>
								<span class="styIRS8867Dots">.........................</span>
							</div>
							<div class="styIRS8867LNAmountBox" style="height:11mm;">
								<span style="width:100%; padding-top:6mm;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/SSNValidForEmplmnOrEICPrpsInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/SSNValidForEmplmnOrEICPrpsInd"/>
											<xsl:with-param name="BackupName">IRS8867SSNValidForEmplmnOrEICPrpsInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/SSNValidForEmplmnOrEICPrpsInd"/>
											<xsl:with-param name="BackupName">IRS8867SSNValidForEmplmnOrEICPrpsInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<span style="width:24px;"/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/SSNValidForEmplmnOrEICPrpsInd"/>
											<xsl:with-param name="BackupName">IRS8867SSNValidForEmplmnOrEICPrpsInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/SSNValidForEmplmnOrEICPrpsInd"/>
											<xsl:with-param name="BackupName">IRS8867SSNValidForEmplmnOrEICPrpsInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
								</span>
							</div>
						</div>
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styIRS8867BranchDesc">
								<img alt="Bullet" src="{$ImagePath}/8867_Bullet.gif" height="9" width="9"/>
								If you checked <b>"No"</b> on line 3, <b>stop;</b> the taxpayer <b>cannot</b> take the EIC. Otherwise, continue.
							</div>
						</div>
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styIRS8867BranchDesc"/>
						</div>
						<!-- Line 4 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBoxSD" style="height:7.5mm;">4</div>
							<div class="styIRS8867LNDesc" style="height:7.5mm;">
								Is the taxpayer filing Form 2555 or Form 2555-EZ (relating to the exclusion of foreign earned <br/>
								<span style="float:left;clear:none;">income)?</span>
								<span class="styIRS8867Dots">.........................</span>
							</div>
							<div class="styIRS8867LNAmountBox" style="height:7.5mm;">
								<span style="width:100%; padding-top:2mm;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/Form2555OrForm2555EZInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/Form2555OrForm2555EZInd"/>
											<xsl:with-param name="BackupName">IRS8867Form2555OrForm2555EZInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/Form2555OrForm2555EZInd"/>
											<xsl:with-param name="BackupName">IRS8867Form2555OrForm2555EZInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<span style="width:24px;"/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/Form2555OrForm2555EZInd"/>
											<xsl:with-param name="BackupName">IRS8867Form2555OrForm2555EZInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/Form2555OrForm2555EZInd"/>
											<xsl:with-param name="BackupName">IRS8867Form2555OrForm2555EZInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
								</span>
							</div>
						</div>
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styIRS8867BranchDesc">
								<img alt="Bullet" src="{$ImagePath}/8867_Bullet.gif" height="9" width="9"/>
								If you checked <b>"Yes"</b> on line 4, <b>stop;</b> the taxpayer <b>cannot</b> take the EIC. Otherwise, continue.
							</div>
						</div>
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styIRS8867BranchDesc"/>
						</div>
						<!-- Line 5a -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBoxSD" style="height:5.5mm;">5a</div>
							<div class="styIRS8867LNDesc" style="height:5.5mm;">
								<span style="float:left;clear:none;">Was the taxpayer a nonresident alien for any part of 2013?</span>
								<span class="styIRS8867Dots">.............</span>
							</div>
							<div class="styIRS8867LNAmountBox" style="height:5.5mm;">
								<span style="width:100%;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/NonresidentAlienInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/NonresidentAlienInd"/>
											<xsl:with-param name="BackupName">IRS8867NonresidentAlienInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/NonresidentAlienInd"/>
											<xsl:with-param name="BackupName">IRS8867NonresidentAlienInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<span style="width:24px;"/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/NonresidentAlienInd"/>
											<xsl:with-param name="BackupName">IRS8867NonresidentAlienInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/NonresidentAlienInd"/>
											<xsl:with-param name="BackupName">IRS8867NonresidentAlienInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
								</span>
							</div>
						</div>
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styIRS8867BranchDesc">
								<img alt="Bullet" src="{$ImagePath}/8867_Bullet.gif" height="9" width="9"/>
								If you checked <b>"Yes"</b> on line 5a, go to line 5b. Otherwise, skip line 5b and go to line 6.
							</div>
						</div>
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styIRS8867BranchDesc"/>
						</div>
						<!-- Line 5b -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftLtrBox" style="height:5.5mm;">b</div>
							<div class="styIRS8867LNDesc" style="height:5.5mm;">
								<span style="float:left;clear:none;">Is the taxpayer's filing status married filing jointly?</span>
								<span class="styIRS8867Dots">...............</span>
							</div>
							<div class="styIRS8867LNAmountBox" style="height:5.5mm;">
								<span style="width:100%;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/TxpyrFSMarriedFilingJointlyInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TxpyrFSMarriedFilingJointlyInd"/>
											<xsl:with-param name="BackupName">IRS8867TxpyrFSMarriedFilingJointlyInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/TxpyrFSMarriedFilingJointlyInd"/>
											<xsl:with-param name="BackupName">IRS8867TxpyrFSMarriedFilingJointlyInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<span style="width:24px;"/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TxpyrFSMarriedFilingJointlyInd"/>
											<xsl:with-param name="BackupName">IRS8867TxpyrFSMarriedFilingJointlyInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/TxpyrFSMarriedFilingJointlyInd"/>
											<xsl:with-param name="BackupName">IRS8867TxpyrFSMarriedFilingJointlyInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
								</span>
							</div>
						</div>
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styIRS8867BranchDesc" style="height:9mm;">
								<img alt="Bullet" src="{$ImagePath}/8867_Bullet.gif" height="9" width="9"/>
								If you checked <b>"Yes"</b> on line 5a and <b>"No"</b> on line 5b, <b>stop;</b> the taxpayer <b>cannot</b> take the EIC. Otherwise, continue.
							</div>
						</div>
						<!-- Line 6 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBoxSD" style="height:5.5mm;">6</div>
							<div class="styIRS8867LNDesc" style="height:5.5mm;">
								<span style="float:left;clear:none;">Is the taxpayer's <b>investment income</b> more than $3,300? See Rule 6 in Pub. 596 before answering</span>
								<span class="styIRS8867Dots">...</span>
							</div>
							<div class="styIRS8867LNAmountBox" style="height:5.5mm;">
								<span style="width:100%;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/InvestmentIncomeOverLimitInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/InvestmentIncomeOverLimitInd"/>
											<xsl:with-param name="BackupName">IRS8867InvestmentIncomeOverLimitInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/InvestmentIncomeOverLimitInd"/>
											<xsl:with-param name="BackupName">IRS8867InvestmentIncomeOverLimitInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<span style="width:24px;"/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/InvestmentIncomeOverLimitInd"/>
											<xsl:with-param name="BackupName">IRS8867InvestmentIncomeOverLimitInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/InvestmentIncomeOverLimitInd"/>
											<xsl:with-param name="BackupName">IRS8867InvestmentIncomeOverLimitInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
								</span>
							</div>
						</div>
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styIRS8867BranchDesc">
								<img alt="Bullet" src="{$ImagePath}/8867_Bullet.gif" height="9" width="9"/>
								If you checked <b>"Yes"</b> on line 6, <b>stop;</b> the taxpayer <b>cannot</b> take the EIC. Otherwise, continue.
							</div>
						</div>
						<!-- Line 7 -->
						<div class="styGenericDiv" style="width:187mm">
							<div class="styLNLeftNumBoxSD" style="height:14mm;"><br/>7</div>
							<div class="styIRS8867LNDesc" > <br/>
								Could the taxpayer be a <b>qualifying child</b> of another 
								person for 2013? If the taxpayer's filing status is married<br/>filing jointly, check "No." Otherwise, see Rule 10 
								(Rule 13 if the taxpayer does not have a qualifying child) see<br/>
								<span style="float:left;clear:none;">Pub. 596 before answering</span>
								<span class="styIRS8867Dots">.....................</span>
							</div>
							<div class="styIRS8867LNAmountBox" style="height:14mm; padding-top:9mm;">
								<span style="width:100%;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/EICEligClmQlfyChldOfOtherInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/EICEligClmQlfyChldOfOtherInd"/>
											<xsl:with-param name="BackupName">IRS8867EICEligClmQlfyChldOfOtherInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/EICEligClmQlfyChldOfOtherInd"/>
											<xsl:with-param name="BackupName">IRS8867EICEligClmQlfyChldOfOtherInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<span style="width:24px;"/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/EICEligClmQlfyChldOfOtherInd"/>
											<xsl:with-param name="BackupName">IRS8867EICEligClmQlfyChldOfOtherInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/EICEligClmQlfyChldOfOtherInd"/>
											<xsl:with-param name="BackupName">IRS8867EICEligClmQlfyChldOfOtherInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
								</span>
							</div>
						</div>
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styIRS8867BranchDesc" style="height:9mm;">
								<img alt="Bullet" src="{$ImagePath}/8867_Bullet.gif" height="9" width="9"/>
								If you checked <b>"Yes"</b> on line 7, <b>stop;</b> the taxpayer <b>cannot</b> take the EIC. Otherwise, go to Part II or Part III, whichever applies.
							</div>
							<div class="styShading" style="height:9mm;"/>
						</div>
					</div>
					<!-- END Part I -->
					<!-- Page boundary -->
					<div class="pageEnd" style="width:187mm;">
						<span style="float:left;clear:none;font-weight:bold;">For Paperwork Reduction Act Notice, see separate instructions.</span>
						<span style="float:left;clear:none;margin-left:30mm;">Cat. No. 26142H</span>
						<span style="float:right;clear:none;">Form <span style="font-weight:bold;font-size:9pt;">8867</span> (2013)</span>
					</div>
					<div class="styTBB" style="width:187mm; float:none; clear:both;">
						<span style="float:left;clear:none;">Form 8867 (2013)</span>
						<span style="float:right;clear:none;">Page <span style="font-weight:bold;font-size:9pt;">2</span></span>
					</div>
					<!-- BEGIN Part II -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">Taxpayers With a Child</div>
					</div>
					<div class="styTBB" style="width:187mm; float:none; clear:both; ">
						<!-- Caution Line -->
						<div class="styGenericdiv" style="width:187mm;">
							<div class="styLNLeftNumBoxSD"/>
							<div class="styIRS8867ChildDesc" style="height:9mm;">
								<b>Caution.</b> If there is more than one child, complete lines 8 through 14 for one <br/>
								child before going to the next column.
							</div>
							<div class="styIRS8867ChildBox" style="text-align:center;height:4mm;">
								Child 1
							</div>
							<div class="styIRS8867ChildBox" style="text-align:center;height:4mm;">
								Child 2
							</div>
							<div class="styIRS8867ChildBox" style="text-align:center;height:4mm;">
								Child 3
							</div>
							<div class="styIRS8867ChildBox" style="height:5mm;padding:0px;border-bottom-width:0px;"/>
							<div class="styIRS8867ChildBox" style="height:5mm;padding:0px;border-bottom-width:0px;"/>
							<div class="styIRS8867ChildBox" style="height:5mm;padding:0px;border-bottom-width:0px;"/>
						</div>
						<!-- Line 8 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBoxSD" style="height:7mm;">8
							</div>
							<div class="styIRS8867ChildDesc" style="height:7mm;">
								<span style="float:left;clear:none;">Child's name</span>
								<span class="styIRS8867Dots">................</span>
							</div>							
							<div class="styIRS8867ChildBox" style="height:7mm; font-weight:normal; padding-left:.25mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[1]/ChildName"/>
								</xsl:call-template>
							</div>
							<div class="styIRS8867ChildBox" style="height:7mm; font-weight:normal; padding-left:.25mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[2]/ChildName"/>
								</xsl:call-template>
							</div>
							<div class="styIRS8867ChildBox" style="height:7mm; font-weight:normal; padding-left:.25mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[3]/ChildName"/>
								</xsl:call-template>
							</div>									
						</div>
						<!-- Line 9 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBoxSD" style="height:7mm;">9</div>
							<div class="styIRS8867ChildDesc" style="height:7mm;">
								<span style="float:left;clear:none;">Is the child the taxpayer's son, daughter, stepchild, foster child, brother,
								sister, stepbrother, stepsister, half brother, half sister, or a descendant of any of them? </span>
								</div>
							<div class="styIRS8867ChildBox" style="height:7mm; padding-left: 0px;">
								<span style="width:100%; padding-top:1.5mm;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[1]/ChildRelationshipTestInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[1]/ChildRelationshipTestInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp1ChildRelationshipTestInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[1]/ChildRelationshipTestInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp1ChildRelationshipTestInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<span style="width:4px;"/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[1]/ChildRelationshipTestInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp1ChildRelationshipTestInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[1]/ChildRelationshipTestInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp1ChildRelationshipTestInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
								</span>
							</div>
							<div class="styIRS8867ChildBox" style="height:7mm; padding-left: 0px;">
								<span style="width:100%; padding-top:1.5mm;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[2]/ChildRelationshipTestInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[2]/ChildRelationshipTestInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp2ChildRelationshipTestInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[2]/ChildRelationshipTestInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp2ChildRelationshipTestInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<span style="width:4px;"/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[2]/ChildRelationshipTestInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp2ChildRelationshipTestInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[2]/ChildRelationshipTestInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp2ChildRelationshipTestInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
								</span>
							</div>
							<div class="styIRS8867ChildBox" style="height:7mm; padding-left: 0px;">
								<span style="width:100%; padding-top:1.5mm;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[3]/ChildRelationshipTestInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[3]/ChildRelationshipTestInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp3ChildRelationshipTestInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[3]/ChildRelationshipTestInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp3ChildRelationshipTestInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<span style="width:4px;"/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[3]/ChildRelationshipTestInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp3ChildRelationshipTestInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[3]/ChildRelationshipTestInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp3ChildRelationshipTestInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
								</span>
							</div>
						</div>
						<!-- Line 10 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:11mm;">10</div>
							<div class="styIRS8867ChildDesc" style="height:11mm;">
								Was the child unmarried at the end of 2013? <br/>
								If the child was married at the end of 2013, see the instructions before <br/>
								<span style="float:left;clear:none;">answering.</span>
								<span class="styIRS8867Dots">.................</span>
							</div>
							<div class="styIRS8867ChildBox" style="height:11mm; padding-left: 0px;">
								<br/><br/>
								<span style="width:100%;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[1]/ChldUnmarriedOrMarClmAsDepdInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[1]/ChldUnmarriedOrMarClmAsDepdInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp1ChldUnmarriedOrMarClmAsDepdInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[1]/ChldUnmarriedOrMarClmAsDepdInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp1ChldUnmarriedOrMarClmAsDepdInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<span style="width:4px;"/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[1]/ChldUnmarriedOrMarClmAsDepdInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp1ChldUnmarriedOrMarClmAsDepdInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[1]/ChldUnmarriedOrMarClmAsDepdInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp1ChldUnmarriedOrMarClmAsDepdInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
								</span>
							</div>
							<div class="styIRS8867ChildBox" style="height:11mm; padding-left: 0px;">
								<br/><br/>
								<span style="width:100%;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[2]/ChldUnmarriedOrMarClmAsDepdInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[2]/ChldUnmarriedOrMarClmAsDepdInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp2ChldUnmarriedOrMarClmAsDepdInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[2]/ChldUnmarriedOrMarClmAsDepdInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp2ChldUnmarriedOrMarClmAsDepdInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<span style="width:4px;"/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[2]/ChldUnmarriedOrMarClmAsDepdInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp2ChldUnmarriedOrMarClmAsDepdInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[2]/ChldUnmarriedOrMarClmAsDepdInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp2ChldUnmarriedOrMarClmAsDepdInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
								</span>
							</div>
							<div class="styIRS8867ChildBox" style="height:11mm; padding-left: 0px;">
								<br/><br/>
								<span style="width:100%;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[3]/ChldUnmarriedOrMarClmAsDepdInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[3]/ChldUnmarriedOrMarClmAsDepdInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp3ChldUnmarriedOrMarClmAsDepdInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[3]/ChldUnmarriedOrMarClmAsDepdInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp3ChldUnmarriedOrMarClmAsDepdInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<span style="width:4px;"/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[3]/ChldUnmarriedOrMarClmAsDepdInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp3ChldUnmarriedOrMarClmAsDepdInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[3]/ChldUnmarriedOrMarClmAsDepdInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp3ChldUnmarriedOrMarClmAsDepdInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
								</span>
							</div>
						</div>
						<!-- Line 11 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:8mm;">11</div>
							<div class="styIRS8867ChildDesc" style="height:8mm;">
								Did the child live with the taxpayer in the United States for over half of the <br/>
								<span style="float:left;clear:none;">year? See the instructions before answering</span>
								<span class="styIRS8867Dots">.........</span>
							</div>
							<div class="styIRS8867ChildBox" style="height:8mm; padding-left: 0px;">
								<br/>
								<span style="width:100%;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[1]/LiveWithChldInUSOverHalfYrInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[1]/LiveWithChldInUSOverHalfYrInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp1LiveWithChldInUSOverHalfYrInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[1]/LiveWithChldInUSOverHalfYrInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp1LiveWithChldInUSOverHalfYrInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<span style="width:4px;"/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[1]/LiveWithChldInUSOverHalfYrInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp1LiveWithChldInUSOverHalfYrInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[1]/LiveWithChldInUSOverHalfYrInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp1LiveWithChldInUSOverHalfYrInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
								</span>
							</div>
							<div class="styIRS8867ChildBox" style="height:8mm; padding-left: 0px;">
								<br/>
								<span style="width:100%;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[2]/LiveWithChldInUSOverHalfYrInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[2]/LiveWithChldInUSOverHalfYrInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp2LiveWithChldInUSOverHalfYrInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[2]/LiveWithChldInUSOverHalfYrInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp2LiveWithChldInUSOverHalfYrInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<span style="width:4px;"/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[2]/LiveWithChldInUSOverHalfYrInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp2LiveWithChldInUSOverHalfYrInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[2]/LiveWithChldInUSOverHalfYrInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp2LiveWithChldInUSOverHalfYrInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
								</span>
							</div>
							<div class="styIRS8867ChildBox" style="height:8mm; padding-left: 0px;">
								<br/>
								<span style="width:100%;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[3]/LiveWithChldInUSOverHalfYrInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[3]/LiveWithChldInUSOverHalfYrInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp3LiveWithChldInUSOverHalfYrInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[3]/LiveWithChldInUSOverHalfYrInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp3LiveWithChldInUSOverHalfYrInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<span style="width:4px;"/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[3]/LiveWithChldInUSOverHalfYrInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp3LiveWithChldInUSOverHalfYrInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[3]/LiveWithChldInUSOverHalfYrInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp3LiveWithChldInUSOverHalfYrInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
								</span>
							</div>
						</div>
						<!-- Line 12 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:20mm;">12</div>
							<div class="styIRS8867ChildDesc" style="height:20mm;">
								Was the child (at the end of 2013) &mdash; <br/>
								&bull; Under age 19 and younger than the taxpayer (or the taxpayer's spouse, <br/>
								if the taxpayer files jointly), <br/>
								&bull; Under age 24, a full-time student, and younger than the taxpayer (or the <br/>
								taxpayer's spouse, if the taxpayer files jointly), or <br/>
								<span style="float:left;clear:none;">&bull; Any age and permanently and totally disabled?</span>
								<span class="styIRS8867Dots">........</span>
							</div>
							<div class="styIRS8867ChildBox" style="height:20mm; padding-left: 0px;">
								<br/><br/><br/><br/><br/>
								<span style="width:100%;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[1]/ChildUnder19YngrStdntOrDsblInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[1]/ChildUnder19YngrStdntOrDsblInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp1ChildUnder19YngrStdntOrDsblInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[1]/ChildUnder19YngrStdntOrDsblInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp1ChildUnder19YngrStdntOrDsblInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<span style="width:4px;"/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[1]/ChildUnder19YngrStdntOrDsblInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp1ChildUnder19YngrStdntOrDsblInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[1]/ChildUnder19YngrStdntOrDsblInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp1ChildUnder19YngrStdntOrDsblInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
								</span>
							</div>
							<div class="styIRS8867ChildBox" style="height:20mm; padding-left: 0px;">
								<br/><br/><br/><br/><br/>
								<span style="width:100%;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[2]/ChildUnder19YngrStdntOrDsblInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[2]/ChildUnder19YngrStdntOrDsblInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp2ChildUnder19YngrStdntOrDsblInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[2]/ChildUnder19YngrStdntOrDsblInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp2ChildUnder19YngrStdntOrDsblInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<span style="width:4px;"/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[2]/ChildUnder19YngrStdntOrDsblInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp2ChildUnder19YngrStdntOrDsblInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[2]/ChildUnder19YngrStdntOrDsblInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp2ChildUnder19YngrStdntOrDsblInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
								</span>
							</div>
							<div class="styIRS8867ChildBox" style="height:20mm; padding-left: 0px;">
								<br/><br/><br/><br/><br/>
								<span style="width:100%;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[3]/ChildUnder19YngrStdntOrDsblInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[3]/ChildUnder19YngrStdntOrDsblInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp3ChildUnder19YngrStdntOrDsblInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[3]/ChildUnder19YngrStdntOrDsblInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp3ChildUnder19YngrStdntOrDsblInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<span style="width:4px;"/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[3]/ChildUnder19YngrStdntOrDsblInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp3ChildUnder19YngrStdntOrDsblInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[3]/ChildUnder19YngrStdntOrDsblInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp3ChildUnder19YngrStdntOrDsblInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
								</span>
							</div>
						</div>
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styIRS8867ChildBranch" style="height:13mm;">
								<img alt="Bullet" src="{$ImagePath}/8867_Bullet.gif" height="9" width="9"/>
								If you checked <b>"Yes"</b> on lines 9, 10, 11, <b>and</b> 12, the child is the <br/>
								taxpayer's qualifying child; go to line 13a. If you checked <b>"No"</b> on line <br/>
								9, 10, 11, <b>or</b> 12, the child is not the taxpayer's qualifying child; see the <br/>
								instructions for line 12.
							</div>
							<div class="styIRS8867ChildBox" style="border-bottom-width:0px;height:13mm;"><br/><br/><br/><span style="width:0px;"/></div>
							<div class="styIRS8867ChildBox" style="border-bottom-width:0px;height:13mm;"><br/><br/><br/><span style="width:0px;"/></div>
							<div class="styIRS8867ChildBox" style="border-bottom-width:0px;height:13mm;"><br/><br/><br/><span style="width:0px;"/></div>
						</div>
						<!-- Line 13a -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:11mm;">13a</div>
							<div class="styIRS8867ChildDesc" style="height:11mm;">
								Could any other person check <b>"Yes"</b> on lines 9, 10, 11, <b>and</b> 12 for the child? (If<br/>the only other person is the taxpayer's spouse, see the instructions before<br/>
								<span style="float:left;clear:none;">answering.)</span>
								<span class="styIRS8867Dots">.................</span>
							</div>
							<div class="styIRS8867ChildBox" style="height:11mm; padding-left:0;">
								<br/><br/>
								<span style="width:100%;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[1]/OtherPersonClaimAsQlfyChildInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[1]/OtherPersonClaimAsQlfyChildInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp1OtherPersonClaimAsQlfyChildInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[1]/OtherPersonClaimAsQlfyChildInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp1OtherPersonClaimAsQlfyChildInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<span style="width:4px;"/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[1]/OtherPersonClaimAsQlfyChildInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp1OtherPersonClaimAsQlfyChildInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[1]/OtherPersonClaimAsQlfyChildInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp1OtherPersonClaimAsQlfyChildInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
								</span>
							</div>
							<div class="styIRS8867ChildBox" style="height:11mm; padding-left:0;">
								<br/><br/>
								<span style="width:100%;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[2]/OtherPersonClaimAsQlfyChildInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[2]/OtherPersonClaimAsQlfyChildInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp2OtherPersonClaimAsQlfyChildInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[2]/OtherPersonClaimAsQlfyChildInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp2OtherPersonClaimAsQlfyChildInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<span style="width:4px;"/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[2]/OtherPersonClaimAsQlfyChildInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp2OtherPersonClaimAsQlfyChildInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[2]/OtherPersonClaimAsQlfyChildInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp2OtherPersonClaimAsQlfyChildInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
								</span>
							</div>
							<div class="styIRS8867ChildBox" style="height:11mm; padding-left:0;">
								<br/><br/>
								<span style="width:100%;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[3]/OtherPersonClaimAsQlfyChildInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[3]/OtherPersonClaimAsQlfyChildInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp3OtherPersonClaimAsQlfyChildInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[3]/OtherPersonClaimAsQlfyChildInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp3OtherPersonClaimAsQlfyChildInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<span style="width:4px;"/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[3]/OtherPersonClaimAsQlfyChildInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp3OtherPersonClaimAsQlfyChildInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[3]/OtherPersonClaimAsQlfyChildInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp3OtherPersonClaimAsQlfyChildInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
								</span>
							</div>
						</div>
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styIRS8867ChildBranch" style="height:7mm;">
								<img alt="Bullet" src="{$ImagePath}/8867_Bullet.gif" height="9" width="9"/>
								If you checked <b>"No"</b> on line 13a, go to line 14. Otherwise, go to <br/>
								line 13b.
							</div>
							<div class="styIRS8867ChildBox" style="border-bottom-width:0px;height:7mm;"><br/><span style="width:0px;"/></div>
							<div class="styIRS8867ChildBox" style="border-bottom-width:0px;height:7mm;"><br/><span style="width:0px;"/></div>
							<div class="styIRS8867ChildBox" style="border-bottom-width:0px;height:7mm;"><br/><span style="width:0px;"/></div>
						</div>
						<!-- Line 13b -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftLtrBox" style="height:5mm;">b</div>
							<div class="styIRS8867ChildDesc" style="height:5mm;">
								<span style="float:left;clear:none;">Enter the child's relationship to the other person(s)</span>
								<span class="styIRS8867Dots">.......</span>
							</div>
							<div class="styIRS8867ChildBox" style="height:5mm;font-weight:normal;padding-left:2px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[1]/ChildRelationship"/>
								</xsl:call-template>
							</div>
							<div class="styIRS8867ChildBox" style="height:5mm;font-weight:normal;padding-left:2px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[2]/ChildRelationship"/>
								</xsl:call-template>
							</div>
							<div class="styIRS8867ChildBox" style="height:5mm;font-weight:normal;padding-left:2px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[3]/ChildRelationship"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 13c -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftLtrBox" style="height:10mm;">c</div>
							<div class="styIRS8867ChildDesc" style="height:10mm;">
								Under the tiebreaker rules, is the child treated as the taxpayer's qualifying <br/>
								<span style="float:left;clear:none;">child? See the instructions before answering</span>
								<span class="styIRS8867Dots">.........</span>
							</div>
							<div class="styIRS8867ChildBox" style="height:10mm; padding-left:0;">
								<span style="width:100%;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[1]/QlfyChldUnderTiebreakerRuleInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[1]/QlfyChldUnderTiebreakerRuleInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp1QlfyChldUnderTiebreakerRuleInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[1]/QlfyChldUnderTiebreakerRuleInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp1QlfyChldUnderTiebreakerRuleInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<span style="width:4px;"/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[1]/QlfyChldUnderTiebreakerRuleInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp1QlfyChldUnderTiebreakerRuleInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[1]/QlfyChldUnderTiebreakerRuleInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp1QlfyChldUnderTiebreakerRuleInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
								</span>
								<br/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[1]/DoNotKnowInd"/>
										<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp1DoNotKnowInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[1]/DoNotKnowInd"/>
										<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp1DoNotKnowInd</xsl:with-param>
									</xsl:call-template>
									Don't Know
								</label>
							</div>
							<div class="styIRS8867ChildBox" style="height:10mm; padding-left:0;">
								<span style="width:100%;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[2]/QlfyChldUnderTiebreakerRuleInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[2]/QlfyChldUnderTiebreakerRuleInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp2QlfyChldUnderTiebreakerRuleInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[2]/QlfyChldUnderTiebreakerRuleInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp2QlfyChldUnderTiebreakerRuleInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<span style="width:4px;"/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[2]/QlfyChldUnderTiebreakerRuleInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp2QlfyChldUnderTiebreakerRuleInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[2]/QlfyChldUnderTiebreakerRuleInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp2QlfyChldUnderTiebreakerRuleInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
								</span>
								<br/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[2]/DoNotKnowInd"/>
										<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp2DoNotKnowInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[2]/DoNotKnowInd"/>
										<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp2DoNotKnowInd</xsl:with-param>
									</xsl:call-template>
									Don't Know
								</label>
							</div>
							<div class="styIRS8867ChildBox" style="height:10mm; padding-left:0;">
								<span style="width:100%;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[3]/QlfyChldUnderTiebreakerRuleInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[3]/QlfyChldUnderTiebreakerRuleInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp3QlfyChldUnderTiebreakerRuleInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[3]/QlfyChldUnderTiebreakerRuleInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp3QlfyChldUnderTiebreakerRuleInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<span style="width:4px;"/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[3]/QlfyChldUnderTiebreakerRuleInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp3QlfyChldUnderTiebreakerRuleInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[3]/QlfyChldUnderTiebreakerRuleInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp3QlfyChldUnderTiebreakerRuleInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
								</span>
								<br/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[3]/DoNotKnowInd"/>
										<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp3DoNotKnowInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[3]/DoNotKnowInd"/>
										<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp3DoNotKnowInd</xsl:with-param>
									</xsl:call-template>
									Don't Know
								</label>
							</div>
						</div>
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styIRS8867ChildBranch" style="height:35mm;">
								<img alt="Bullet" src="{$ImagePath}/8867_Bullet.gif" height="9" width="9"/>
								If you checked <b>"Yes"</b> on line 13c, go to line 14. If you checked <br/>
								<b>"No,"</b> the taxpayer <b>cannot</b> take the EIC based on this child and cannot <br/>
								take the EIC for taxpayers who do not have a qualifying child. If there <br/>
								is more than one child, see the <b>Note</b> at the bottom of this page. If you <br/>
								checked <b>"Don't know,"</b> explain to the taxpayer that, under the <br/>
								tiebreaker rules, the taxpayer's EIC and other tax benefits may be <br/>
								disallowed. Then, if the taxpayer wants to take the EIC based on this <br/>
								child, complete lines 14 and 15. If not, and there are no other qualifying <br/>
								children, the taxpayer cannot take the EIC, including the EIC for <br/>
								taxpayers without a qualifying child; do not complete Part III. If there <br/>
								is more than one child, see the <b>Note</b> at the bottom of this page.
							</div>
							<div class="styIRS8867ChildBox" style="border-bottom-width:0px;height:35mm;"><span style="width:0px;"/></div>
							<div class="styIRS8867ChildBox" style="border-bottom-width:0px;height:35mm;"><span style="width:0px;"/></div>
							<div class="styIRS8867ChildBox" style="border-bottom-width:0px;height:35mm;"><span style="width:0px;"/></div>
						</div>
						<!-- Line 14 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:8mm;">14</div>
							<div class="styIRS8867ChildDesc" style="height:8mm;">
								Does the qualifying child have an SSN that allows him or her to work or is <br/>
								<span style="float:left;clear:none;">valid for EIC purposes? See the instructions before answering</span>
								<span class="styIRS8867Dots">.....</span>
							</div>
							<div class="styIRS8867ChildBox" style="height:8mm; padding-left:0;">
								<br/>
								<span style="width:100%;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[1]/SSNValidForEmplmnOrEICPrpsInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[1]/SSNValidForEmplmnOrEICPrpsInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp1SSNValidForEmplmnOrEICPrpsInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[1]/SSNValidForEmplmnOrEICPrpsInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp1SSNValidForEmplmnOrEICPrpsInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<span style="width:4px;"/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[1]/SSNValidForEmplmnOrEICPrpsInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp1SSNValidForEmplmnOrEICPrpsInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[1]/SSNValidForEmplmnOrEICPrpsInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp1SSNValidForEmplmnOrEICPrpsInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
								</span>
							</div>
							<div class="styIRS8867ChildBox" style="height:8mm; padding-left:0;">
								<br/>
								<span style="width:100%;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[2]/SSNValidForEmplmnOrEICPrpsInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[2]/SSNValidForEmplmnOrEICPrpsInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp2SSNValidForEmplmnOrEICPrpsInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[2]/SSNValidForEmplmnOrEICPrpsInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp2SSNValidForEmplmnOrEICPrpsInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<span style="width:4px;"/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[2]/SSNValidForEmplmnOrEICPrpsInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp2SSNValidForEmplmnOrEICPrpsInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[2]/SSNValidForEmplmnOrEICPrpsInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp2SSNValidForEmplmnOrEICPrpsInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
								</span>
							</div>
							<div class="styIRS8867ChildBox" style="height:8mm; padding-left:0;">
								<br/>
								<span style="width:100%;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[3]/SSNValidForEmplmnOrEICPrpsInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[3]/SSNValidForEmplmnOrEICPrpsInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp3SSNValidForEmplmnOrEICPrpsInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[3]/SSNValidForEmplmnOrEICPrpsInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp3SSNValidForEmplmnOrEICPrpsInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<span style="width:4px;"/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[3]/SSNValidForEmplmnOrEICPrpsInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp3SSNValidForEmplmnOrEICPrpsInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[3]/SSNValidForEmplmnOrEICPrpsInd"/>
											<xsl:with-param name="BackupName">IRS8867TaxpayerWithAChildGrp3SSNValidForEmplmnOrEICPrpsInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
								</span>
							</div>
						</div>
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styIRS8867ChildBranch" style="height:13mm;">
								<img alt="Bullet" src="{$ImagePath}/8867_Bullet.gif" height="9" width="9"/>
								If you checked <b>"No"</b> on line 14, the taxpayer <b>cannot</b> take the EIC <br/>
								based on this child and cannot take the EIC for taxpayers who do not <br/>
								have a qualifying child. If there is more than one child, see the <b>Note</b> at <br/>
								the bottom of this page. If you checked <b>"Yes"</b> on line 14, continue.
							</div>
							<div class="styIRS8867ChildBox" style="border-bottom-width:0px;height:13mm;"><span style="width:0px;"/></div>
							<div class="styIRS8867ChildBox" style="border-width:0px;height:13mm;"><span style="width:0px;"/></div>
							<div class="styIRS8867ChildBox" style="border-width:0px;height:13mm;"><span style="width:0px;"/></div>
						</div>
						<!-- Line 15 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:11mm;">15</div>
							<div class="styIRS8867ChildDesc" style="height:11mm;">
								Are the taxpayer's <b>earned income</b> and <b>adjusted gross income</b> each less <br/>
								than the limit that applies to the taxpayer for 2013? See Pub. 596 for <br/>
								<span style="float:left;clear:none;">the limit</span>
								<span class="styIRS8867Dots">..................</span>
							</div>
							<div class="styIRS8867ChildBox" style="height:11mm;">
								<br/><br/><span style="width:0px;"/>
							</div>
							<div class="styIRS8867ChildBox" style="border-left-width:0px;height:11mm;padding-left:0;">
								<br/><br/><span style="width:0px;"/>
							</div>
							<div class="styIRS8867ChildBox" style="border-left-width:0px;height:11mm;padding-left:0;">
								<br/><br/>
								<span style="width:100%;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/EarnedIncmAndAGIBelowLimitInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/EarnedIncmAndAGIBelowLimitInd"/>
											<xsl:with-param name="BackupName">IRS8867EarnedIncmAndAGIBelowLimitInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/EarnedIncmAndAGIBelowLimitInd"/>
											<xsl:with-param name="BackupName">IRS8867EarnedIncmAndAGIBelowLimitInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<span style="width:4px;"/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/EarnedIncmAndAGIBelowLimitInd"/>
											<xsl:with-param name="BackupName">IRS8867EarnedIncmAndAGIBelowLimitInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/EarnedIncmAndAGIBelowLimitInd"/>
											<xsl:with-param name="BackupName">IRS8867EarnedIncmAndAGIBelowLimitInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
								</span>
								<br/>
								<span style="width:0px;"/>
							</div>
						</div>
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styIRS8867ChildBranch" style="height:22mm;">
								<img alt="Bullet" src="{$ImagePath}/8867_Bullet.gif" height="9" width="9"/>
								If you checked <b>"No"</b> on line 15, <b>stop</b>; the taxpayer <b>cannot</b> take the <br/>
								EIC. If you checked <b>"Yes"</b> on line 15, the taxpayer can take the EIC. <br/>
								Complete <b>Schedule EIC</b> and attach it to the taxpayer's return. If there <br/>
								are two or three qualifying children with valid SSNs, list them on <br/>
								Schedule EIC in the same order as they are listed here. If the taxpayer's <br/>
								EIC was reduced or disallowed for a year after 1996, see Pub. 596 to <br/>
								see if <b>Form 8862</b> must be filed. Go to line 20.
							</div>
							<div class="styIRS8867ChildBox" style="border-width:0px;background-color:lightgrey;height:22mm; border-left:1px solid black;"><span style="width:0px"/></div>
							<div class="styIRS8867ChildBox" style="border-width:0px;background-color:lightgrey;height:22mm;"><span style="width:0px"/></div>
							<div class="styIRS8867ChildBox" style="border-width:0px;background-color:lightgrey;height:22mm;"><span style="width:0px"/></div>
						</div>
						<!-- Note Line -->
						<div class="styGenericdiv" style="width:187mm;">
							<div class="styLNLeftNumBoxSD"/>
							<div class="styIRS8867ChildDesc" style="height:13mm;">
								<b>Note.</b> If you checked <b>"No"</b> on line 13c or 14 but there is more than one <br/>
								child, complete lines 8 through 14 for the other child(ren) (but for no more <br/>
								than three qualifying children). Also do this if you checked <b>"Don't know"</b> on <br/>
								line 13c and the taxpayer is not taking the EIC based on this child.
							</div>
							<div class="styIRS8867ChildBox" style="border-width:0px;background-color:lightgrey;height:13mm; border-left:1px solid black;"><span style="width:0px"/></div>
							<div class="styIRS8867ChildBox" style="border-width:0px;background-color:lightgrey;height:13mm;"><span style="width:0px"/></div>
							<div class="styIRS8867ChildBox" style="border-width:0px;background-color:lightgrey;height:13mm;"><span style="width:0px"/></div>
						</div>
					</div>
					<!-- END Part II -->
					<!-- Page boundary -->
					<div class="pageEnd" style="width:187mm;">
						<span style="float:right;clear:none;">Form <span style="font-weight:bold;font-size:9pt;">8867</span> (2013)</span>
					</div>
					<div class="styTBB" style="width:187mm; float:none; clear:both; ">
						<span style="float:left;clear:none;">Form 8867 (2013)</span>
						<span style="float:right;clear:none;">Page <span style="font-weight:bold;font-size:9pt;">3</span></span>
					</div>
					<!-- BEGIN Part III -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc">Taxpayers Without a Qualifying Child</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<!-- Line 16 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:11mm;">16</div>
							<div class="styIRS8867LNDesc" style="height:11mm;">
								Was the taxpayer's main home, and the main home of the taxpayer's spouse if filing jointly, in the <br/>
								United States for more than half the year? (Military personnel on extended active duty outside the <br/>
								<span style="float:left;clear:none;">United States are considered to be living in the United States during that duty period. See Pub. 596.)</span>
								<span class="styIRS8867Dots">...</span>
							</div>
							<div class="styIRS8867LNAmountBox" style="height:11mm;">
								<br/><br/>
								<span style="width:100%;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/MainHomeInUSOverHalfYrInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/MainHomeInUSOverHalfYrInd"/>
											<xsl:with-param name="BackupName">IRS8867MainHomeInUSOverHalfYrInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/MainHomeInUSOverHalfYrInd"/>
											<xsl:with-param name="BackupName">IRS8867MainHomeInUSOverHalfYrInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<span style="width:24px;"/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/MainHomeInUSOverHalfYrInd"/>
											<xsl:with-param name="BackupName">IRS8867MainHomeInUSOverHalfYrInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/MainHomeInUSOverHalfYrInd"/>
											<xsl:with-param name="BackupName">IRS8867MainHomeInUSOverHalfYrInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
								</span>
							</div>
						</div>
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styIRS8867BranchDesc" style="height:7mm;">
								<img alt="Bullet" src="{$ImagePath}/8867_Bullet.gif" height="9" width="9"/>
								If you checked <b>"No"</b> on line 16, <b>stop</b>; the taxpayer <b>cannot</b> take the EIC. Otherwise, <br/>
								continue.
							</div>
						</div>
						<!-- Line 17 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:8mm;">17</div>
							<div class="styIRS8867LNDesc" style="height:8mm;">
								Was the taxpayer, or the taxpayer's spouse if filing jointly, at least age 25 but under age 65 at <br/>
								<span style="float:left;clear:none;">the end of 2013? See the instructions before answering</span>
								<span class="styIRS8867Dots">..............</span>
							</div>
							<div class="styIRS8867LNAmountBox" style="height:8mm;">
								<br/>
								<span style="width:100%;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/TxpyerOrSpsAge25ButUnder65Ind"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TxpyerOrSpsAge25ButUnder65Ind"/>
											<xsl:with-param name="BackupName">IRS8867TxpyerOrSpsAge25ButUnder65Ind</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/TxpyerOrSpsAge25ButUnder65Ind"/>
											<xsl:with-param name="BackupName">IRS8867TxpyerOrSpsAge25ButUnder65Ind</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<span style="width:24px;"/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TxpyerOrSpsAge25ButUnder65Ind"/>
											<xsl:with-param name="BackupName">IRS8867TxpyerOrSpsAge25ButUnder65Ind</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/TxpyerOrSpsAge25ButUnder65Ind"/>
											<xsl:with-param name="BackupName">IRS8867TxpyerOrSpsAge25ButUnder65Ind</xsl:with-param>
										</xsl:call-template>
										No
									</label>
								</span>
							</div>
						</div>
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styIRS8867BranchDesc" style="height:7mm;">
								<img alt="Bullet" src="{$ImagePath}/8867_Bullet.gif" height="9" width="9"/>
								If you checked <b>"No"</b> on line 17, <b>stop</b>; the taxpayer <b>cannot</b> take the EIC. Otherwise, <br/>
								continue.
							</div>
						</div>
						<!-- Line 18 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:8mm;">18</div>
							<div class="styIRS8867LNDesc" style="height:8mm;">
								Is the taxpayer eligible to be claimed as a dependent on anyone else's federal income tax return<br/>
								<span style="float:left;clear:none;">for 2013? If the taxpayer's filing status is married filing jointly, check "No" </span>
								<span class="styIRS8867Dots">.........</span>
							</div>
							<div class="styIRS8867LNAmountBox" style="height:8mm;">
								<br/>
								<span style="width:100%;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/ClaimedAsDependentInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/ClaimedAsDependentInd"/>
											<xsl:with-param name="BackupName">IRS8867ClaimedAsDependentInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/ClaimedAsDependentInd"/>
											<xsl:with-param name="BackupName">IRS8867ClaimedAsDependentInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<span style="width:24px;"/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/ClaimedAsDependentInd"/>
											<xsl:with-param name="BackupName">IRS8867ClaimedAsDependentInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/ClaimedAsDependentInd"/>
											<xsl:with-param name="BackupName">IRS8867ClaimedAsDependentInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
								</span>
							</div>
						</div>
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styIRS8867BranchDesc" style="height:7mm;">
								<img alt="Bullet" src="{$ImagePath}/8867_Bullet.gif" height="9" width="9"/>
								If you checked <b>"Yes"</b> on line 18, <b>stop</b>; the taxpayer <b>cannot</b> take the EIC. Otherwise, <br/>
								continue.
							</div>
						</div>
						<!-- Line 19 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:8mm;">19</div>
							<div class="styIRS8867LNDesc" style="height:8mm;">
								Are the taxpayer's <b>earned income</b> and <b>adjusted gross income</b> each less than the limit that <br/>
								<span style="float:left;clear:none;">applies to the taxpayer for 2013? See Pub. 596 for the limit</span>
								<span class="styIRS8867Dots">.............</span>
							</div>
							<div class="styIRS8867LNAmountBox" style="height:8mm;">
								<br/>
								<span style="width:100%;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/EarnedIncmAndAGIBelowLimitInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/EarnedIncmAndAGIBelowLimitInd"/>
											<xsl:with-param name="BackupName">IRS8867EarnedIncmAndAGIBelowLimitInd2</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/EarnedIncmAndAGIBelowLimitInd"/>
											<xsl:with-param name="BackupName">IRS8867EarnedIncmAndAGIBelowLimitInd2</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<span style="width:24px;"/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/EarnedIncmAndAGIBelowLimitInd"/>
											<xsl:with-param name="BackupName">IRS8867EarnedIncmAndAGIBelowLimitInd2</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/EarnedIncmAndAGIBelowLimitInd"/>
											<xsl:with-param name="BackupName">IRS8867EarnedIncmAndAGIBelowLimitInd2</xsl:with-param>
										</xsl:call-template>
										No
									</label>
								</span>
							</div>
						</div>
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styIRS8867BranchDesc" style="height:11mm;">
								<img alt="Bullet" src="{$ImagePath}/8867_Bullet.gif" height="9" width="9"/>
								If you checked <b>"No"</b> on line 19, <b>stop</b>; the taxpayer <b>cannot</b> take the EIC. If you checked <br/>
								<b>"Yes"</b> on line 19, the taxpayer can take the EIC. If the taxpayer's EIC was reduced or disallowed <br/>
								for a year after 1996, see Pub. 596 to find out if <b>Form 8862</b> must be filed. Go to line 20.
						</div>
						<div class="styGenericDiv" style="height:11mm;background-color:lightgrey;width:32.6mm"/>
					</div>
					</div>
					<!-- END Part III -->
					<!-- BEGIN Part IV -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName">Part IV</div>
						<div class="styPartDesc">Due Diligence Requirements</div>
					</div>
					<div class="styTBB" style="width:187mm; float:none; clear:both; ">
						<!-- Line 20 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:8mm;">20</div>
							<div class="styIRS8867LNDesc" style="height:8mm;">
								Did you complete Form 8867 based on current information provided by the taxpayer or reasonably <br/>
								<span style="float:left;clear:none;">obtained by you?</span>
								<span class="styIRS8867Dots">.......................</span>
							</div>
							<div class="styIRS8867LNAmountBox" style="height:8mm;">
								<br/>
								<span style="width:100%;text-align: left;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/TxpyrProvidedOrObtainedInfoInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TxpyrProvidedOrObtainedInfoInd"/>
											<xsl:with-param name="BackupName">IRS8867TxpyrProvidedOrObtainedInfoInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/TxpyrProvidedOrObtainedInfoInd"/>
											<xsl:with-param name="BackupName">IRS8867TxpyrProvidedOrObtainedInfoInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<span style="width:24px;"/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TxpyrProvidedOrObtainedInfoInd"/>
											<xsl:with-param name="BackupName">IRS8867TxpyrProvidedOrObtainedInfoInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/TxpyrProvidedOrObtainedInfoInd"/>
											<xsl:with-param name="BackupName">IRS8867TxpyrProvidedOrObtainedInfoInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
								</span>
							</div>
						</div>
						<!-- Line 21 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:8mm;">21</div>
							<div class="styIRS8867LNDesc" style="height:8mm;">
								Did you complete the EIC worksheet found in the Form 1040, 1040A, or 1040EZ instructions (or your <br/>
								<span style="float:left;clear:none;">own worksheet that provides the same information as the 1040, 1040A, or 1040EZ worksheet)?</span>
								<span class="styIRS8867Dots">....</span>
							</div>
							<div class="styIRS8867LNAmountBox" style="height:8mm;">
								<br/>
								<span style="width:100%;text-align: left;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/CompletedEICOrOwnWorksheetInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CompletedEICOrOwnWorksheetInd"/>
											<xsl:with-param name="BackupName">IRS8867CompletedEICOrOwnWorksheetInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/CompletedEICOrOwnWorksheetInd"/>
											<xsl:with-param name="BackupName">IRS8867CompletedEICOrOwnWorksheetInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<span style="width:24px;"/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CompletedEICOrOwnWorksheetInd"/>
											<xsl:with-param name="BackupName">IRS8867CompletedEICOrOwnWorksheetInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/CompletedEICOrOwnWorksheetInd"/>
											<xsl:with-param name="BackupName">IRS8867CompletedEICOrOwnWorksheetInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
								</span>
							</div>
						</div>
						<!-- Line 22 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:10mm;">22</div>
							<div class="styIRS8867LNDesc" style="height:10mm;">
								If any qualifying child was not the taxpayer’s son or daughter, did you ask why the parents were not <br/>
								<span style="float:left;clear:none;">claiming the child and document the answer?</span>
								<span class="styIRS8867Dots">................</span>
							</div>
							<div class="styIRS8867LNAmountBox" style="height:10mm;">
								<span style="width:100%;text-align: left;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/ParentsNotClaimQlfyChildInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/ParentsNotClaimQlfyChildInd"/>
											<xsl:with-param name="BackupName">IRS8867ParentsNotClaimQlfyChildInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/ParentsNotClaimQlfyChildInd"/>
											<xsl:with-param name="BackupName">IRS8867ParentsNotClaimQlfyChildInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<span style="width:24px;"/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/ParentsNotClaimQlfyChildInd"/>
											<xsl:with-param name="BackupName">IRS8867ParentsNotClaimQlfyChildInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/ParentsNotClaimQlfyChildInd"/>
											<xsl:with-param name="BackupName">IRS8867ParentsNotClaimQlfyChildInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
								</span>
								<span style="width:100%;text-align: left;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/DoesNotApplyInd"/>
											<xsl:with-param name="BackupName">IRS8867DoesNotApplyInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/DoesNotApplyInd"/>
											<xsl:with-param name="BackupName">IRS8867DoesNotApplyInd</xsl:with-param>
										</xsl:call-template>
										Does not apply
									</label>
								</span>
							</div>
						</div>
						<!-- Line 23 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:13mm;">23</div>
							<div class="styIRS8867LNDesc" style="height:13mm;">
								If the answer to question 13a is "Yes" (indicating that the child lived for more than half the year <br/>
								with someone else who could claim the child for the EIC), did you explain the tiebreaker rules and <br/>
								<span style="float:left;clear:none;">possible consequences of another person claiming your client's qualifying child?</span>
								<span class="styIRS8867Dots">........</span>
							</div>
							<div class="styIRS8867LNAmountBox" style="height:13mm;">
								<br/>
								<span style="width:100%;text-align:left;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/ExplainTiebreakerRulesInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/ExplainTiebreakerRulesInd"/>
											<xsl:with-param name="BackupName">IRS8867ExplainTiebreakerRulesInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/ExplainTiebreakerRulesInd"/>
											<xsl:with-param name="BackupName">IRS8867ExplainTiebreakerRulesInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<span style="width:24px;"/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/ExplainTiebreakerRulesInd"/>
											<xsl:with-param name="BackupName">IRS8867ExplainTiebreakerRulesInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/ExplainTiebreakerRulesInd"/>
											<xsl:with-param name="BackupName">IRS8867ExplainTiebreakerRulesInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
								</span>
								<span style="width:100%;text-align:left;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/DoesNotApplyInd2"/>
											<xsl:with-param name="BackupName">IRS8867DoesNotApplyInd2</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/DoesNotApplyInd2"/>
											<xsl:with-param name="BackupName">IRS8867DoesNotApplyInd2</xsl:with-param>
										</xsl:call-template>
										Does not apply
									</label>
								</span>
							</div>
						</div>
						<!-- Line 24 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:29mm;">24</div>
							<div class="styIRS8867LNDesc" style="height:29mm;">
								Did you ask this taxpayer any additional questions that are necessary to meet your knowledge requirement?<br/>
								<span style="float:left;clear:none;">See the instructions before answering</span>
								<span class="styIRS8867Dots">..................</span><br /><br />
								<span style="font-weight:bold;">To comply with the EIC knowledge requirement, you must not know or have reason to know that any<br />
								information used to determine the taxpayer's eligibility for, and the amount of, the EIC is incorrect.<br />
								You may not ignore the implications of information furnished to or known by you, and you must make<br />
								reasonable inquiries if the information furnished appears to be incorrect, inconsistent, or incomplete.<br />
								At the time you make these inquiries, you must document in your files the inquiries you made and<br />
								the taxpayer's responses.</span>
							</div>
							<div class="styIRS8867LNAmountBox" style="height:29mm;">
								<span style="width:100%;text-align:left;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/AdditionalQuestionsAskedInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/AdditionalQuestionsAskedInd"/>
											<xsl:with-param name="BackupName">IRS8867AdditionalQuestionsAskedInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/AdditionalQuestionsAskedInd"/>
											<xsl:with-param name="BackupName">IRS8867AdditionalQuestionsAskedInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<span style="width:24px;"/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/AdditionalQuestionsAskedInd"/>
											<xsl:with-param name="BackupName">IRS8867AdditionalQuestionsAskedInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/AdditionalQuestionsAskedInd"/>
											<xsl:with-param name="BackupName">IRS8867AdditionalQuestionsAskedInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
								</span>
								<span style="width:100%;text-align:left;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/DoesNotApplyInd3"/>
											<xsl:with-param name="BackupName">IRS8867DoesNotApplyInd3</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/DoesNotApplyInd3"/>
											<xsl:with-param name="BackupName">IRS8867DoesNotApplyInd3</xsl:with-param>
										</xsl:call-template>
										Does not apply
									</label>
								</span>
								<span style="width:100%; height: 19.3mm; background-color: lightgrey; border-top: 1px solid black;" />
							</div>
						</div>
						<!-- Line 25 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:10mm;">25</div>
							<div class="styIRS8867LNDesc" style="height:10mm;">
								<span style="float:left;clear:none;">Did you document the additional questions you asked and your client's answers?</span>
								<span class="styIRS8867Dots">........</span>
							</div>
							<div class="styIRS8867LNAmountBox" style="border-bottom:1px solid black; height:10mm;">
								<span style="width:100%;text-align:left;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/AdditionalQstnDocumentedInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/AdditionalQstnDocumentedInd"/>
											<xsl:with-param name="BackupName">IRS8867AdditionalQstnDocumentedInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/AdditionalQstnDocumentedInd"/>
											<xsl:with-param name="BackupName">IRS8867AdditionalQstnDocumentedInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<span style="width:24px;"/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/AdditionalQstnDocumentedInd"/>
											<xsl:with-param name="BackupName">IRS8867AdditionalQstnDocumentedInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/AdditionalQstnDocumentedInd"/>
											<xsl:with-param name="BackupName">IRS8867AdditionalQstnDocumentedInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
								</span>
								<span style="width:100%;text-align:left;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/DoesNotApplyInd4"/>
											<xsl:with-param name="BackupName">IRS8867DoesNotApplyInd4</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/DoesNotApplyInd4"/>
											<xsl:with-param name="BackupName">IRS8867DoesNotApplyInd4</xsl:with-param>
										</xsl:call-template>
										Does not apply
									</label>
								</span>
							</div>
						</div>
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styIRS8867DRDesc" style="width: 151.5mm; height:43mm; padding-top:0;">
								<img alt="Bullet" src="{$ImagePath}/8867_Bullet.gif" height="9" width="9"/>
								You have complied with all the due diligence requirements if you:<br/>
								<span style="width:3.3mm;"/>
								1. Completed the actions described on lines 20 and 21 and checked <b>"Yes"</b> on those lines,<br/>
								<span style="width:3.3mm;"/>
								2. Completed the actions described on lines 22, 23, 24, and 25 (if they apply) and checked <b>"Yes"</b> (or <br/>
								<span style="width:7.3mm;"/>
								<b>"Does not apply"</b>) on those lines,<br/>
								<span style="width:3.3mm;"/>
								3. Submit Form 8867 in the manner required, <b>and</b> <br/>
								<span style="width:3.3mm;"/>
								4. Keep all five of the following records for 3 years from the latest of the dates specified in the instructions under <br/>
								<span style="width:7.3mm;"/>
								<i>Document Retention</i>:
								<br/>
								<span style="width:6.6mm; padding-top:4mm;"/>
								a. Form 8867, Paid Preparer's Earned Income Credit Checklist, <br/>
								<span style="width:6.6mm;"/>
								b. The EIC worksheet(s) or your own worksheet(s), <br/>
								<span style="width:6.6mm;"/>
								c. Copies of any taxpayer documents you relied on to determine eligibility for or amount of EIC, <br/>
								<span style="width:6.6mm;"/>
								d. A record of how, when, and from whom the information used to prepare the form and worksheet(s) was<br/>
								<span style="width:9.6mm;"/>
								obtained, and<br/>
								<span style="width:6.6mm;"/>
								e. A record of any additional questions you asked and your client's answers.
							</div>
							<div class="styIRS8867LNAmountBox" style="border-bottom:none; height:43mm; background-color: lightgrey;"></div>
						</div>
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styIRS8867DRDesc" style="width: 151.5mm; height:7mm; padding-top:0;">
								<img alt="Bullet" src="{$ImagePath}/8867_Bullet.gif" height="9" width="9"/>
								If you checked <b>"No"</b> on line 20, 21, 22, 23, 24, or 25, you have not complied with all the due diligence requirements<br/>
								<span style="padding-left:2.3mm;" />
								and may have to pay a $500 penalty for each failure to comply.
							</div>
							<div class="styIRS8867LNAmountBox" style="border-bottom:none; height:7mm; background-color: lightgrey;">
							</div>
						</div>
					</div>
					<!-- END Part IV -->
					<div class="pageEnd" style="width:187mm;">
						<span style="float:right;clear:none;">Form <span style="font-weight:bold;font-size:9pt;">8867</span> (2013)</span>
					</div>
					<div class="styTBB" style="width:187mm; float:none; clear:both; ">
						<span style="float:left;clear:none;">Form 8867 (2013)</span>
						<span style="float:right;clear:none;">Page <span style="font-weight:bold;font-size:9pt;">4</span></span>
					</div>
					<div class="styTBB" style="width:187mm;">
						<!-- Line 26 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:11mm;">26</div>
							<div class="styIRS8867LNDesc" style="width:170mm;height:11mm;">
								Which documents below, if any, did you rely on to determine EIC eligibility for the qualifying child(ren) listed on Schedule EIC?<br/>
								Check all that apply. <b>Keep a copy of any documents you relied on.</b> See the instructions before answering. If there is no qualifying<br/>
								child, check box a. If there is no disabled child, check box o.
							</div>
						</div>
						<!-- Line 26 table -->
						<div class="styIRS8867Page4Box">
							<div class="styIRS8867Page4BoxHeader">Residency of Qualifying Child(ren)</div>
							<!-- 26a -->
							<div class="styIRS8867CheckboxBox">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ResidencyOfQlfyChildDocGrp/NoQualifyingChildInd"/>
										<xsl:with-param name="BackupName">IRS8867ResNoQualifyingChildInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/ResidencyOfQlfyChildDocGrp/NoQualifyingChildInd"/>
										<xsl:with-param name="BackupName">IRS8867ResNoQualifyingChildInd</xsl:with-param>
									</xsl:call-template>
									<span class="styIRS8867CheckboxLetter">a</span>No qualifying child
								</label>
							</div>
							<!-- 26i -->
							<div class="styIRS8867CheckboxBox">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ResidencyOfQlfyChildDocGrp/PlaceOfWorshipStatementInd"/>
										<xsl:with-param name="BackupName">IRS8867ResPlaceOfWorshipStatementInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/ResidencyOfQlfyChildDocGrp/PlaceOfWorshipStatementInd"/>
										<xsl:with-param name="BackupName">IRS8867ResPlaceOfWorshipStatementInd</xsl:with-param>
									</xsl:call-template>
									<span class="styIRS8867CheckboxLetter">i</span>Place of worship statement
								</label>
							</div>
							<!-- 26b -->
							<div class="styIRS8867CheckboxBox">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ResidencyOfQlfyChildDocGrp/SchoolRecordsOrStatementInd"/>
										<xsl:with-param name="BackupName">IRS8867ResSchoolRecordsOrStatementInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/ResidencyOfQlfyChildDocGrp/SchoolRecordsOrStatementInd"/>
										<xsl:with-param name="BackupName">IRS8867ResSchoolRecordsOrStatementInd</xsl:with-param>
									</xsl:call-template>
									<span class="styIRS8867CheckboxLetter">b</span>School records or statement
								</label>
							</div>
							<!-- 26j -->
							<div class="styIRS8867CheckboxBox">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ResidencyOfQlfyChildDocGrp/IndianTribalOfficialStmtInd"/>
										<xsl:with-param name="BackupName">IRS8867ResIndianTribalOfficialStmtInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/ResidencyOfQlfyChildDocGrp/IndianTribalOfficialStmtInd"/>
										<xsl:with-param name="BackupName">IRS8867ResIndianTribalOfficialStmtInd</xsl:with-param>
									</xsl:call-template>
									<span class="styIRS8867CheckboxLetter">j</span>Indian tribal official statement
								</label>
							</div>
							<!-- 26c -->
							<div class="styIRS8867CheckboxBox">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ResidencyOfQlfyChildDocGrp/LandlordOrPropertyMgmtStmtInd"/>
										<xsl:with-param name="BackupName">IRS8867ResLandlordOrPropertyMgmtStmtInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/ResidencyOfQlfyChildDocGrp/LandlordOrPropertyMgmtStmtInd"/>
										<xsl:with-param name="BackupName">IRS8867ResLandlordOrPropertyMgmtStmtInd</xsl:with-param>
									</xsl:call-template>
									<span class="styIRS8867CheckboxLetter">c</span>Landlord or property management statement
								</label>
							</div>
							<!-- 26k -->
							<div class="styIRS8867CheckboxBox">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ResidencyOfQlfyChildDocGrp/EmployerStatementInd"/>
										<xsl:with-param name="BackupName">IRS8867ResEmployerStatementInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/ResidencyOfQlfyChildDocGrp/EmployerStatementInd"/>
										<xsl:with-param name="BackupName">IRS8867ResEmployerStatementInd</xsl:with-param>
									</xsl:call-template>
									<span class="styIRS8867CheckboxLetter">k</span>Employer statement
								</label>
							</div>
							<!-- 26d -->
							<div class="styIRS8867CheckboxBox">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ResidencyOfQlfyChildDocGrp/HealthCareProviderStatementInd"/>
										<xsl:with-param name="BackupName">IRS8867ResHealthCareProviderStatementInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/ResidencyOfQlfyChildDocGrp/HealthCareProviderStatementInd"/>
										<xsl:with-param name="BackupName">IRS8867ResHealthCareProviderStatementInd</xsl:with-param>
									</xsl:call-template>
									<span class="styIRS8867CheckboxLetter">d</span>Health care provider statement
								</label>
							</div>
							<!-- 26l -->
							<div class="styIRS8867CheckboxBox">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ResidencyOfQlfyChildDocGrp/OtherInformationGrp/OtherInd"/>
										<xsl:with-param name="BackupName">IRS8867ResOtherInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/ResidencyOfQlfyChildDocGrp/OtherInformationGrp/OtherInd"/>
										<xsl:with-param name="BackupName">IRS8867ResOtherInd</xsl:with-param>
									</xsl:call-template>
									<span class="styIRS8867CheckboxLetter">l</span>Other (specify) 
									<img alt="Bullet" src="{$ImagePath}/8867_Bullet_Down.gif" height="8" width="8"/>
									<span style="width:4px;"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Part IV, Line 26l - Residency of Qualifying Child, Other Information</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/ResidencyOfQlfyChildDocGrp/OtherInformationGrp/OtherTxt"/>
									</xsl:call-template>
								</label>
							</div>
							<!-- 26e -->
							<div class="styIRS8867CheckboxBox">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ResidencyOfQlfyChildDocGrp/MedicalRecordsInd"/>
										<xsl:with-param name="BackupName">IRS8867ResMedicalRecordsInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/ResidencyOfQlfyChildDocGrp/MedicalRecordsInd"/>
										<xsl:with-param name="BackupName">IRS8867ResMedicalRecordsInd</xsl:with-param>
									</xsl:call-template>
									<span class="styIRS8867CheckboxLetter">e</span>Medical records
								</label>
							</div>
							<!-- 26 other blank 1 -->
							<div class="styIRS8867CheckboxBlank"><span style="width:0px;"/></div>
							<!-- 26f -->
							<div class="styIRS8867CheckboxBox">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ResidencyOfQlfyChildDocGrp/ChildCareProviderRecordsInd"/>
										<xsl:with-param name="BackupName">IRS8867ResChildCareProviderRecordsInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/ResidencyOfQlfyChildDocGrp/ChildCareProviderRecordsInd"/>
										<xsl:with-param name="BackupName">IRS8867ResChildCareProviderRecordsInd</xsl:with-param>
									</xsl:call-template>
									<span class="styIRS8867CheckboxLetter">f</span>Child care provider records
								</label>
							</div>
							<!-- 26 other blank 2 -->
							<div class="styIRS8867CheckboxBox"><span style="width:0px;"/></div>
							<!-- 26g -->
							<div class="styIRS8867CheckboxBox">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ResidencyOfQlfyChildDocGrp/PlacementAgencyStatementInd"/>
										<xsl:with-param name="BackupName">IRS8867ResPlacementAgencyStatementInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/ResidencyOfQlfyChildDocGrp/PlacementAgencyStatementInd"/>
										<xsl:with-param name="BackupName">IRS8867ResPlacementAgencyStatementInd</xsl:with-param>
									</xsl:call-template>
									<span class="styIRS8867CheckboxLetter">g</span>Placement agency statement
								</label>
							</div>
							<!-- 26 other blank 3 -->
							<div class="styIRS8867CheckboxBlank"><span style="width:0px;"/></div>
							<!-- 26h -->
							<div class="styIRS8867CheckboxBox">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ResidencyOfQlfyChildDocGrp/SocialServiceRecordsOrStmtInd"/>
										<xsl:with-param name="BackupName">IRS8867ResSocialServiceRecordsOrStmtInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/ResidencyOfQlfyChildDocGrp/SocialServiceRecordsOrStmtInd"/>
										<xsl:with-param name="BackupName">IRS8867ResSocialServiceRecordsOrStmtInd</xsl:with-param>
									</xsl:call-template>
									<span class="styIRS8867CheckboxLetter">h</span>Social service records or statement
								</label>
							</div>
							<!-- 26m -->
							<div class="styIRS8867CheckboxBox">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ResidencyOfQlfyChildDocGrp/DidNotRelyOnDocFileNotatedInd"/>
										<xsl:with-param name="BackupName">IRS8867ResDidNotRelyOnDocFileNotatedInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/ResidencyOfQlfyChildDocGrp/DidNotRelyOnDocFileNotatedInd"/>
										<xsl:with-param name="BackupName">IRS8867ResDidNotRelyOnDocFileNotatedInd</xsl:with-param>
									</xsl:call-template>
									<span class="styIRS8867CheckboxLetter">m</span>Did not rely on any documents, but made notes in file
								</label>
							</div>
							<!-- 26 blank 4 -->
							<div class="styIRS8867CheckboxBox"><span style="width:0px;"/></div>
							<!-- 26n -->
							<div class="styIRS8867CheckboxBox">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ResidencyOfQlfyChildDocGrp/DidNotRelyOnDocumentsInd"/>
										<xsl:with-param name="BackupName">IRS8867ResDidNotRelyOnDocumentsInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/ResidencyOfQlfyChildDocGrp/DidNotRelyOnDocumentsInd"/>
										<xsl:with-param name="BackupName">IRS8867ResDidNotRelyOnDocumentsInd</xsl:with-param>
									</xsl:call-template>
									<span class="styIRS8867CheckboxLetter">n</span>Did not rely on any documents
								</label>
							</div>
							<div class="styIRS8867Page4BoxHeader" style="margin-top:2mm;">
								Disability of Qualifying Child(ren)
							</div>
							<!-- 26o -->
							<div class="styIRS8867CheckboxBox">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/DisabilityOfQlfyChildDocGrp/NoDisabledChildInd"/>
										<xsl:with-param name="BackupName">IRS8867DisNoDisabledChildInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/DisabilityOfQlfyChildDocGrp/NoDisabledChildInd"/>
										<xsl:with-param name="BackupName">IRS8867DisNoDisabledChildInd</xsl:with-param>
									</xsl:call-template>
									<span class="styIRS8867CheckboxLetter">o</span>No disabled child
								</label>
							</div>
							<!-- 26s -->
							<div class="styIRS8867CheckboxBox">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/DisabilityOfQlfyChildDocGrp/OtherInformationGrp/OtherInd"/>
										<xsl:with-param name="BackupName">IRS8867DisOtherInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/DisabilityOfQlfyChildDocGrp/OtherInformationGrp/OtherInd"/>
										<xsl:with-param name="BackupName">IRS8867DisOtherInd</xsl:with-param>
									</xsl:call-template>
									<span class="styIRS8867CheckboxLetter">s</span>Other (specify) 
									<img alt="Bullet" src="{$ImagePath}/8867_Bullet_Down.gif" height="8" width="8"/>
									<span style="width:4px;"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Part IV, Line 26s - Disability of Qualifying Child, Other Information</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/DisabilityOfQlfyChildDocGrp/OtherInformationGrp/OtherTxt"/>
									</xsl:call-template>
								</label>
							</div>
							<!-- 26p -->
							<div class="styIRS8867CheckboxBox">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/DisabilityOfQlfyChildDocGrp/DoctorStatementInd"/>
										<xsl:with-param name="BackupName">IRS8867DisDoctorStatementInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/DisabilityOfQlfyChildDocGrp/DoctorStatementInd"/>
										<xsl:with-param name="BackupName">IRS8867DisDoctorStatementInd</xsl:with-param>
									</xsl:call-template>
									<span class="styIRS8867CheckboxLetter">p</span>Doctor statement
								</label>
							</div>
							<!-- 26 other blank 1 -->
							<div class="styIRS8867CheckboxBlankTop"><span style="width:0px;"/></div>
							<!-- 26q -->
							<div class="styIRS8867CheckboxBox">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/DisabilityOfQlfyChildDocGrp/OtherHealthCareProviderStmtInd"/>
										<xsl:with-param name="BackupName">IRS8867DisOtherHealthCareProviderStmtInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/DisabilityOfQlfyChildDocGrp/OtherHealthCareProviderStmtInd"/>
										<xsl:with-param name="BackupName">IRS8867DisOtherHealthCareProviderStmtInd</xsl:with-param>
									</xsl:call-template>
									<span class="styIRS8867CheckboxLetter">q</span>Other health care provider statement
								</label>
							</div>
							<!-- 26 other blank 2 -->
							<div class="styIRS8867CheckboxBlank"><span style="width:0px;"/></div>
							<!-- 26r -->
							<div class="styIRS8867CheckboxBox">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/DisabilityOfQlfyChildDocGrp/SocialServicesAgOrProgStmtInd"/>
										<xsl:with-param name="BackupName">IRS8867DisSocialServicesAgOrProgStmtInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/DisabilityOfQlfyChildDocGrp/SocialServicesAgOrProgStmtInd"/>
										<xsl:with-param name="BackupName">IRS8867DisSocialServicesAgOrProgStmtInd</xsl:with-param>
									</xsl:call-template>
									<span class="styIRS8867CheckboxLetter">r</span>Social services agency or program statement
								</label>
							</div>
							<!-- 26t -->
							<div class="styIRS8867CheckboxBox">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/DisabilityOfQlfyChildDocGrp/DidNotRelyOnDocFileNotatedInd"/>
										<xsl:with-param name="BackupName">IRS8867DisDidNotRelyOnDocFileNotatedInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/DisabilityOfQlfyChildDocGrp/DidNotRelyOnDocFileNotatedInd"/>
										<xsl:with-param name="BackupName">IRS8867DisDidNotRelyOnDocFileNotatedInd</xsl:with-param>
									</xsl:call-template>
									<span class="styIRS8867CheckboxLetter">t</span>Did not rely on any documents, but made notes in file
								</label>
							</div>
							<!-- 26 blank 4 -->
							<div class="styIRS8867CheckboxBox"><span style="width:0px;"/></div>
							<!-- 26u -->
							<div class="styIRS8867CheckboxBox">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/DisabilityOfQlfyChildDocGrp/DidNotRelyOnDocumentsInd"/>
										<xsl:with-param name="BackupName">IRS8867DisDidNotRelyOnDocumentsInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/DisabilityOfQlfyChildDocGrp/DidNotRelyOnDocumentsInd"/>
										<xsl:with-param name="BackupName">IRS8867DisDidNotRelyOnDocumentsInd</xsl:with-param>
									</xsl:call-template>
									<span class="styIRS8867CheckboxLetter">u</span>Did not rely on any documents
								</label>
							</div>
						</div>
						<div class="styGenericDiv" style="width:187mm; padding-top: 1mm; padding-bottom: 5mm;">
							<span class="styGenericDiv" style="width:187mm;border-style:solid;border-color:black;border-width:1px 1px 0px 0px;" />
						</div>
						<!-- Line 27 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox" style="height: 11mm;">27</div>
							<div class="styIRS8867LNDesc" style="width:178mm;height: 11mm;">
								If a Schedule C is included with this return, which documents or other information, if any, did you rely on to confirm the existence<br/>
								of the business and to figure the amount of Schedule C income and expenses reported on the return? Check all that apply.<br/>
								<b>Keep a copy of any documents you relied on.</b> See the instructions before answering. If there is no Schedule C, check box a.
							</div>
						</div>
						<!-- Line 27 table -->
						<div class="styIRS8867Page4Box">
							<div class="styIRS8867Page4BoxHeader">Documents or Other Information</div>
							<!-- 27a -->
							<div class="styIRS8867CheckboxBox">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/BusinessExstConfirmationDocGrp/NoScheduleCInd"/>
										<xsl:with-param name="BackupName">IRS8867BusNoScheduleCInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/BusinessExstConfirmationDocGrp/NoScheduleCInd"/>
										<xsl:with-param name="BackupName">IRS8867BusNoScheduleCInd</xsl:with-param>
									</xsl:call-template>
									<span class="styIRS8867CheckboxLetter">a</span>No Schedule C
								</label>
							</div>
							<!-- 27h -->
							<div class="styIRS8867CheckboxBox">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/BusinessExstConfirmationDocGrp/BankStatementInd"/>
										<xsl:with-param name="BackupName">IRS8867BusBankStatementInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/BusinessExstConfirmationDocGrp/BankStatementInd"/>
										<xsl:with-param name="BackupName">IRS8867BusBankStatementInd</xsl:with-param>
									</xsl:call-template>
									<span class="styIRS8867CheckboxLetter">h</span>Bank statements
								</label>
							</div>
							<!-- 27b -->
							<div class="styIRS8867CheckboxBox">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/BusinessExstConfirmationDocGrp/BusinessLicenseInd"/>
										<xsl:with-param name="BackupName">IRS8867BusBusinessLicenseInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/BusinessExstConfirmationDocGrp/BusinessLicenseInd"/>
										<xsl:with-param name="BackupName">IRS8867BusBusinessLicenseInd</xsl:with-param>
									</xsl:call-template>
									<span class="styIRS8867CheckboxLetter">b</span>Business license
								</label>
							</div>
							<!-- 27i -->
							<div class="styIRS8867CheckboxBox">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/BusinessExstConfirmationDocGrp/ReconstrOfIncomeAndExpnssInd"/>
										<xsl:with-param name="BackupName">IRS8867BusReconstrOfIncomeAndExpnssInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/BusinessExstConfirmationDocGrp/ReconstrOfIncomeAndExpnssInd"/>
										<xsl:with-param name="BackupName">IRS8867BusReconstrOfIncomeAndExpnssInd</xsl:with-param>
									</xsl:call-template>
									<span class="styIRS8867CheckboxLetter">i</span>Reconstruction of income and expenses
								</label>
							</div>
							<!-- 27c -->
							<div class="styIRS8867CheckboxBox">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/BusinessExstConfirmationDocGrp/Form1099Ind"/>
										<xsl:with-param name="BackupName">IRS8867BusForm1099Ind</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/BusinessExstConfirmationDocGrp/Form1099Ind"/>
										<xsl:with-param name="BackupName">IRS8867BusForm1099Ind</xsl:with-param>
									</xsl:call-template>
									<span class="styIRS8867CheckboxLetter">c</span>Forms 1099
								</label>
							</div>
							<!-- 27j -->
							<div class="styIRS8867CheckboxBox">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/BusinessExstConfirmationDocGrp/OtherInformationGrp/OtherInd"/>
										<xsl:with-param name="BackupName">IRS8867BusOtherInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/BusinessExstConfirmationDocGrp/OtherInformationGrp/OtherInd"/>
										<xsl:with-param name="BackupName">IRS8867BusOtherInd</xsl:with-param>
									</xsl:call-template>
									<span class="styIRS8867CheckboxLetter">j</span>Other (specify) 
									<img alt="Bullet" src="{$ImagePath}/8867_Bullet_Down.gif" height="8" width="8"/>
									<span style="width:4px;"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Part IV, Line 27j - Documents or Other Information, Other Information</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/BusinessExstConfirmationDocGrp/OtherInformationGrp/OtherTxt"/>
									</xsl:call-template>
								</label>
							</div>
							<!-- 27d -->
							<div class="styIRS8867CheckboxBox">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/BusinessExstConfirmationDocGrp/RecordOfGrossReceiptsProvInd"/>
										<xsl:with-param name="BackupName">IRS8867BusRecordOfGrossReceiptsProvInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/BusinessExstConfirmationDocGrp/RecordOfGrossReceiptsProvInd"/>
										<xsl:with-param name="BackupName">IRS8867BusRecordOfGrossReceiptsProvInd</xsl:with-param>
									</xsl:call-template>
									<span class="styIRS8867CheckboxLetter">d</span>Records of gross receipts provided by taxpayer
								</label>
							</div>
							<!-- 27 other blank 1 -->
							<div class="styIRS8867CheckboxBlankTop"><span style="width:0px;"/></div>
							<!-- 27e -->
							<div class="styIRS8867CheckboxBox">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/BusinessExstConfirmationDocGrp/TaxpayerSummaryOfIncomeInd"/>
										<xsl:with-param name="BackupName">IRS8867BusTaxpayerSummaryOfIncomeInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/BusinessExstConfirmationDocGrp/TaxpayerSummaryOfIncomeInd"/>
										<xsl:with-param name="BackupName">IRS8867BusTaxpayerSummaryOfIncomeInd</xsl:with-param>
									</xsl:call-template>
									<span class="styIRS8867CheckboxLetter">e</span>Taxpayer summary of income
								</label>
							</div>
							<!-- 27 other blank 2 -->
							<div class="styIRS8867CheckboxBlank"><span style="width:0px;"/></div>
							<!-- 27f -->
							<div class="styIRS8867CheckboxBox">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/BusinessExstConfirmationDocGrp/RecordOfExpensesProvidedInd"/>
										<xsl:with-param name="BackupName">IRS8867BusRecordOfExpensesProvidedInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/BusinessExstConfirmationDocGrp/RecordOfExpensesProvidedInd"/>
										<xsl:with-param name="BackupName">IRS8867BusRecordOfExpensesProvidedInd</xsl:with-param>
									</xsl:call-template>
									<span class="styIRS8867CheckboxLetter">f</span>Records of expenses provided by taxpayer
								</label>
							</div>
							<!-- 27k -->
							<div class="styIRS8867CheckboxBox">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/BusinessExstConfirmationDocGrp/DidNotRelyOnDocFileNotatedInd"/>
										<xsl:with-param name="BackupName">IRS8867BusDidNotRelyOnDocFileNotatedInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/BusinessExstConfirmationDocGrp/DidNotRelyOnDocFileNotatedInd"/>
										<xsl:with-param name="BackupName">IRS8867BusDidNotRelyOnDocFileNotatedInd</xsl:with-param>
									</xsl:call-template>
									<span class="styIRS8867CheckboxLetter">k</span>Did not rely on any documents, but made notes in file
								</label>
							</div>
							<!-- 27g -->
							<div class="styIRS8867CheckboxBox">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/BusinessExstConfirmationDocGrp/TaxpayerSummaryOfExpensesInd"/>
										<xsl:with-param name="BackupName">IRS8867BusTaxpayerSummaryOfExpensesInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/BusinessExstConfirmationDocGrp/TaxpayerSummaryOfExpensesInd"/>
										<xsl:with-param name="BackupName">IRS8867BusTaxpayerSummaryOfExpensesInd</xsl:with-param>
									</xsl:call-template>
									<span class="styIRS8867CheckboxLetter">g</span>Taxpayer summary of expenses
								</label>
							</div>
							<!-- 27l -->
							<div class="styIRS8867CheckboxBox">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/BusinessExstConfirmationDocGrp/DidNotRelyOnDocumentsInd"/>
										<xsl:with-param name="BackupName">IRS8867BusDidNotRelyOnDocumentsInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:2px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/BusinessExstConfirmationDocGrp/DidNotRelyOnDocumentsInd"/>
										<xsl:with-param name="BackupName">IRS8867BusDidNotRelyOnDocumentsInd</xsl:with-param>
									</xsl:call-template>
									<span class="styIRS8867CheckboxLetter">l</span>Did not rely on any documents
								</label>
							</div>
						</div>
						<div class="styGenericDiv" style="width:187mm; padding-top:1mm;"/>
					</div>
					<div class="pageEnd" style="width:187mm;">
						<span style="float:right;clear:none;">Form <span style="font-weight:bold;font-size:9pt;">8867</span> (2013)</span>
					</div>
					<!-- BEGIN Left Over Table -->
					<!-- Additonal Data Title Bar and Button -->
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
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- Separated Data for Part IV - Line 26l -->
					<xsl:if test="count($FormData/ResidencyOfQlfyChildDocGrp/OtherInformationGrp/OtherTxt) &gt;= 1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">
							Form 8867, Part IV, Line 26l - Residency of Qualifying Child, Other Information
						</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:142mm;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:141mm;">Other Text</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$FormData/ResidencyOfQlfyChildDocGrp/OtherInformationGrp/OtherTxt">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:141.5mm;">
											<div style="width:6.5mm;" class="styGenericDiv">
												<div style="width:6mm;font-weight:bold;float:right;clear:none;">
													<span class="styBoldText" style="float:right;text-align:right;padding-right:2mm;">
														<xsl:value-of select="position()"/>
													</span>
												</div>
											</div>
											<div style="width:130mm;float:none;clear:none;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Separated Data for Part II - Line 26s -->
					<xsl:if test="count($FormData/DisabilityOfQlfyChildDocGrp/OtherInformationGrp/OtherTxt) &gt;= 1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">
							Form 8867, Part IV, Line 26s - Disability of Qualifying Child, Other Information
						</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:142mm;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:141mm;">Other Text</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$FormData/DisabilityOfQlfyChildDocGrp/OtherInformationGrp/OtherTxt">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:141.5mm;">
											<div style="width:6.5mm;" class="styGenericDiv">
												<div style="width:6mm;font-weight:bold;float:right;clear:none;">
													<span class="styBoldText" style="float:right;text-align:right;padding-right:2mm;">
														<xsl:value-of select="position()"/>
													</span>
												</div>
											</div>
											<div style="width:130mm;float:none;clear:none;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Separated Data for Part IV - Line 27j -->
					<xsl:if test="count($FormData/BusinessExstConfirmationDocGrp/OtherInformationGrp/OtherTxt) &gt;= 1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">
							Form 8867, Part IV, Line 27j - Documents or Other Information, Other Information
						</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:142mm;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:141mm;">Other Text</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$FormData/BusinessExstConfirmationDocGrp/OtherInformationGrp/OtherTxt">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:141.5mm;">
											<div style="width:6.5mm;" class="styGenericDiv">
												<div style="width:6mm;font-weight:bold;float:right;clear:none;">
													<span class="styBoldText" style="float:right;text-align:right;padding-right:2mm;">
														<xsl:value-of select="position()"/>
													</span>
												</div>
											</div>
											<div style="width:130mm;float:none;clear:none;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</div>
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