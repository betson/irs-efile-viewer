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
		<html lang="EN-US">
			<head>
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
						<div class="styFNBox" style="width:30mm;">
							Form <span class="styFN">8867</span><br/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template> <br/><br/>
							<span class="styAgency">Department of the Treasury <br/>Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:122mm;padding-top:2mm;">
							<span class="styFMT" style="font-size:12.5pt;">Paid Preparer's Earned Income Credit Checklist</span>
							<br/><br/>
							<img alt="Bullet" src="{$ImagePath}/8867_Bullet.gif" height="9" width="9"/>
							<span class="styFBT" > For more information about Form 8867, see www.irs.gov/form8867</span>
							<br/>
							<img alt="Bullet" src="{$ImagePath}/8867_Bullet.gif" height="9" width="9"/>
							<span class="styFBT"> To be completed by preparer and filed with Form 1040, 1040EZ, or 1040A.</span>
						</div>
						<div class="styTYBox" style="width:33.7mm;">
							<div class="styOMB">OMB No. 1545-1629</div>
							<span class="styTaxYear">20<span class="styTYColor">11</span></span><br/>
							<span class="stySequence">Attachment <br/>Sequence No. <span style="font-size:10pt;font-weight:bold;">177</span></span>
						</div>
					</div>
					<!-- Taxpayer Name/SSN -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:137mm;">
							Taxpayer name(s) shown on return <br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">Name</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:48mm;">
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
					<div class="styTBB" style="width:187mm;">
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styIRS8867BranchDesc"/>
						</div>
						<!-- Line 1 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBoxSD">1</div>
							<div class="styIRS8867LNDesc" style="height:auto;width:76.2mm">
								Enter preparer's name and PTIN as shown on return 
								<img alt="Bullet" src="{$ImagePath}/8867_Bullet.gif" height="9" width="9"/>
							</div>
							<div class="styIRS8867LNDesc" style="height:auto;border-right:1px solid black;width:70mm;border-bottom:1px black dashed;text-align:left;">
								<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
									<xsl:with-param name="TargetNode">PreparerPersonName</xsl:with-param>
								</xsl:call-template>
								<span style="width:6px"/>
									<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
									<xsl:with-param name="TargetNode">PTIN</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styIRS8867BranchDesc" />
						</div>

						<!-- Line 2 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBoxSD">2</div>
							<div class="styIRS8867LNDesc">
								<span style="float:left;clear:none;">Is the taxpayer's filing status married filing separately?</span>
								<span class="styIRS8867Dots">..............</span>
							</div>
							<div class="styIRS8867LNAmountBox">
								<span style="width:100%;">
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
							<div class="styLNLeftNumBoxSD">3</div>
							<div class="styIRS8867LNDesc">
								Does the taxpayer (and the taxpayer's spouse if filing jointly) have a social security number <br/>
								(SSN) that allows him or her to work or is valid for EIC purposes? See the instructions before <br/>
								<span style="float:left;clear:none;">answering</span>
								<span class="styIRS8867Dots">..........................</span>
							</div>
							<div class="styIRS8867LNAmountBox">
								<br/><br/>
								<span style="width:100%;">
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
							<div class="styLNLeftNumBoxSD">4</div>
							<div class="styIRS8867LNDesc">
								Is the taxpayer filing Form 2555 or Form 2555-EZ (relating to the exclusion of foreign earned <br/>
								<span style="float:left;clear:none;">income)?</span>
								<span class="styIRS8867Dots">..........................</span>
							</div>
							<div class="styIRS8867LNAmountBox">
								<br/>
								<span style="width:100%;">
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
							<div class="styLNLeftNumBoxSD">5a</div>
							<div class="styIRS8867LNDesc">
								<span style="float:left;clear:none;">Was the taxpayer a nonresident alien for any part of 2011?</span>
								<span class="styIRS8867Dots">.............</span>
							</div>
							<div class="styIRS8867LNAmountBox">
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
							<div class="styLNLeftLtrBox">b</div>
							<div class="styIRS8867LNDesc">
								<span style="float:left;clear:none;">Is the taxpayer's filing status married filing jointly?</span>
								<span class="styIRS8867Dots">...............</span>
							</div>
							<div class="styIRS8867LNAmountBox">
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
							<div class="styIRS8867BranchDesc">
								<img alt="Bullet" src="{$ImagePath}/8867_Bullet.gif" height="9" width="9"/>
								If you checked <b>"Yes"</b> on line 5a and <b>"No"</b> on line 5b, <b>stop;</b> the taxpayer <b>cannot</b> take the EIC. Otherwise, continue.
							</div>
						</div>
						<!--<div class="styGenericDiv" style="width:187mm;">
							<div class="styIRS8867BranchDesc"/>
						</div>-->
						<!-- Line 6 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBoxSD">6</div>
							<div class="styIRS8867LNDesc">
								<span style="float:left;clear:none;">Is the taxpayer's <b>investment income</b> more than $3,150? See Rule 6 in Pub. 596 before answering</span>
								<span class="styIRS8867Dots">..</span>
							</div>
							<div class="styIRS8867LNAmountBox">
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
						<!--<div class="styGenericDiv" style="width:187mm;">
							<div class="styIRS8867BranchDesc"/>
						</div>-->
						<!-- Line 7 -->
						<div class="styGenericDiv" style="width:187mm">
							<div class="styLNLeftNumBoxSD"><br/>7</div>
							<div class="styIRS8867LNDesc" > <br/>
								Could the taxpayer, or the taxpayer's spouse if filing jointly, be a <b>qualifying child</b> of another 
								person for 2011? If the taxpayer's filing status is married filing jointly, check "No." Otherwise, see Rule 10 
								(Rule 13 if  <br/>
								<span style="float:left;clear:none;">the taxpayer does not have a qualifying child) see Pub. 596 before answering</span>
								<span class="styIRS8867Dots">........</span>
							</div>
							<div class="styIRS8867LNAmountBox">
								<br/><br/><br/>
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
							<div class="styIRS8867BranchDesc" style="height:8mm;">
								<img alt="Bullet" src="{$ImagePath}/8867_Bullet.gif" height="9" width="9"/>
								If you checked <b>"Yes"</b> on line 7, <b>stop;</b> the taxpayer <b>cannot</b> take the EIC. Otherwise, go to Part II or Part III, whichever applies.
							</div>
							<div class="styShading" style="height:8mm;"/>
						</div>
					</div>
					<!-- END Part I -->
					<!-- Page boundary -->
					<div class="pageEnd" style="width:187mm;">
						<span style="float:left;clear:none;font-weight:bold;">For Paperwork Reduction Act Notice, see page 4.</span>
						<span style="float:left;clear:none;margin-left:30mm;">Cat. No. 26142H</span>
						<span style="float:right;clear:none;">Form <span style="font-weight:bold;font-size:9pt;">8867</span> (2011)</span>
					</div>
					<div class="styTBB" style="width:187mm;">
						<span style="float:left;clear:none;">Form 8867 (2011)</span>
						<span style="float:right;clear:none;">Page <span style="font-weight:bold;font-size:9pt;">2</span></span>
					</div>
					<!-- BEGIN Part II -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">Taxpayers With a Child</div>
					</div>
					<div class="styTBB" style="width:187mm;">
						<!-- Caution Line -->
						<div class="styGenericdiv" style="width:187mm;">
							<div class="styLNLeftNumBoxSD"/>
							<div class="styIRS8867ChildDesc">
								<b>Caution.</b> If there is more than one child, complete lines 8 through 14 for one <br/>
								child before going to the next column.
							</div>
							<div class="styIRS8867ChildBox" style="text-align:center;">
								Child 1
							</div>
							<div class="styIRS8867ChildBox" style="text-align:center;">
								Child 2
							</div>
							<div class="styIRS8867ChildBox" style="text-align:center;">
								Child 3
							</div>
							<div class="styIRS8867ChildBox" style="height:3mm;padding:0px;border-bottom-width:0px;"/>
							<div class="styIRS8867ChildBox" style="height:3mm;padding:0px;border-bottom-width:0px;"/>
							<div class="styIRS8867ChildBox" style="height:3mm;padding:0px;border-bottom-width:0px;"/>
						</div>
						<!-- Line 8 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBoxSD">8</div>
							<div class="styIRS8867ChildDesc">
								<span style="float:left;clear:none;">Child's name</span>
								<span class="styIRS8867Dots">.................</span>
							</div>
							<table class="styTable" style="float:left;clear:none;border-collapse:collapse;border-width:0px;font-size:7pt;table-layout:fixed;">
								<tbody>
									<tr style="height:auto;vertical-align:top;">
										<td style="width:24mm;border-style:solid;border-color:black;border-width:0px 0px 1px 1px;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[1]/ChildName"/>
											</xsl:call-template>
										</td>
										<td style="width:24mm;border-style:solid;border-color:black;border-width:0px 0px 1px 1px;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[2]/ChildName"/>
											</xsl:call-template>
										</td>
										<td style="width:24mm;border-style:solid;border-color:black;border-width:0px 0px 1px 1px;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[3]/ChildName"/>
											</xsl:call-template>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- Line 9 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBoxSD">9</div>
							<div class="styIRS8867ChildDesc" >
								<span style="float:left;clear:none;">Is the child the taxpayer's son, daughter, stepchild, foster child, brother,
								sister, stepbrother, stepsister, half brother, half sister, or a descendant of any of them? </span>
								</div>
							<div class="styIRS8867ChildBox">
								<br/>
								<span style="width:100%;">
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
							<div class="styIRS8867ChildBox">
								<br/>
								<span style="width:100%;">
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
							<div class="styIRS8867ChildBox">
								<br/>
								<span style="width:100%;">
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
							<div class="styLNLeftNumBox">10</div>
							<div class="styIRS8867ChildDesc">
								Is either of the following true? <br/>
								&bull; The child is unmarried, or <br/>
								&bull; The child is married, can be claimed as the taxpayer's dependent, and <br/>
								<span style="float:left;clear:none;">is not filing a joint return (or is filing it only as a claim for refund).</span>
								<span class="styIRS8867Dots">....</span>
							</div>
							<div class="styIRS8867ChildBox">
								<br/><br/><br/>
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
							<div class="styIRS8867ChildBox">
								<br/><br/><br/>
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
							<div class="styIRS8867ChildBox">
								<br/><br/><br/>
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
							<div class="styLNLeftNumBox">11</div>
							<div class="styIRS8867ChildDesc">
								Did the child live with the taxpayer in the United States for over half of the <br/>
								<span style="float:left;clear:none;">year? See the instructions before answering</span>
								<span class="styIRS8867Dots">.........</span>
							</div>
							<div class="styIRS8867ChildBox">
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
							<div class="styIRS8867ChildBox">
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
							<div class="styIRS8867ChildBox">
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
							<div class="styLNLeftNumBox">12</div>
							<div class="styIRS8867ChildDesc">
								Was the child (at the end of 2011) &mdash; <br/>
								&bull; Under age 19 and younger than the taxpayer (or the taxpayer's spouse, <br/>
								if the taxpayer files jointly), <br/>
								&bull; Under age 24, a full-time student, and younger than the taxpayer (or the <br/>
								taxpayer's spouse, if the taxpayer files jointly), or <br/>
								<span style="float:left;clear:none;">&bull; Any age and permanently and totally disabled?</span>
								<span class="styIRS8867Dots">........</span>
							</div>
							<div class="styIRS8867ChildBox">
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
							<div class="styIRS8867ChildBox">
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
							<div class="styIRS8867ChildBox">
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
						
							<div class="styIRS8867ChildBranch">
								<img alt="Bullet" src="{$ImagePath}/8867_Bullet.gif" height="9" width="9"/>
								If you checked <b>"Yes"</b> on lines 9, 10, 11, <b>and</b> 12, the child is the <br/>
								taxpayer's qualifying child; go to line 13a. If you checked <b>"No"</b> on line <br/>
								9, 10, 11, <b>or</b> 12, the child is not the taxpayer's qualifying child; see the <br/>
								instructions for line 12 on page 4.
							</div>
							<div class="styIRS8867ChildBox" style="border-bottom-width:0px;"><br/><br/><br/><span style="width:0px;"/></div>
							<div class="styIRS8867ChildBox" style="border-bottom-width:0px;"><br/><br/><br/><span style="width:0px;"/></div>
							<div class="styIRS8867ChildBox" style="border-bottom-width:0px;"><br/><br/><br/><span style="width:0px;"/></div>
						</div>
						<!-- Line 13a -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox">13a</div>
							<div class="styIRS8867ChildDesc">
								Could any other person check <b>"Yes"</b> on lines 9, 10, 11, <b>and</b> 12 for the child?
							</div>
							<div class="styIRS8867ChildBox">
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
							<div class="styIRS8867ChildBox">
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
							<div class="styIRS8867ChildBox">
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
							<div class="styIRS8867ChildBranch">
								<img alt="Bullet" src="{$ImagePath}/8867_Bullet.gif" height="9" width="9"/>
								If you checked <b>"No"</b> on line 13a, go to line 14. Otherwise, go to <br/>
								line 13b.
							</div>
							<div class="styIRS8867ChildBox" style="border-bottom-width:0px;"><br/><span style="width:0px;"/></div>
							<div class="styIRS8867ChildBox" style="border-bottom-width:0px;"><br/><span style="width:0px;"/></div>
							<div class="styIRS8867ChildBox" style="border-bottom-width:0px;"><br/><span style="width:0px;"/></div>
						</div>
						<!-- Line 13b -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftLtrBox">b</div>
							<div class="styIRS8867ChildDesc">
								<span style="float:left;clear:none;">Enter the child's relationship to the other person(s)</span>
								<span class="styIRS8867Dots">.......</span>
							</div>
							<div class="styIRS8867ChildBox" style="font-weight:normal;padding-left:2px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[1]/ChildRelationship"/>
								</xsl:call-template>
							</div>
							<div class="styIRS8867ChildBox" style="font-weight:normal;padding-left:2px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[2]/ChildRelationship"/>
								</xsl:call-template>
							</div>
							<div class="styIRS8867ChildBox" style="font-weight:normal;padding-left:2px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/TaxpayerWithAChildGrp/QualifyingChldDeterminationGrp[3]/ChildRelationship"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 13c -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftLtrBox">c</div>
							<div class="styIRS8867ChildDesc">
								Under the tiebreaker rules, is the child treated as the taxpayer's qualifying <br/>
								<span style="float:left;clear:none;">child? See the instructions before answering</span>
								<span class="styIRS8867Dots">.........</span>
							</div>
							<div class="styIRS8867ChildBox">
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
							<div class="styIRS8867ChildBox">
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
							<div class="styIRS8867ChildBox">
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
							<div class="styIRS8867ChildBranch">
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
							<div class="styIRS8867ChildBox" style="border-bottom-width:0px;"><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><span style="width:0px;"/></div>
							<div class="styIRS8867ChildBox" style="border-bottom-width:0px;"><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><span style="width:0px;"/></div>
							<div class="styIRS8867ChildBox" style="border-bottom-width:0px;"><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><span style="width:0px;"/></div>
						</div>
						<!-- Line 14 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox">14</div>
							<div class="styIRS8867ChildDesc">
								Does the qualifying child have an SSN that allows him or her to work or is <br/>
								<span style="float:left;clear:none;">valid for EIC purposes? See the instructions before answering</span>
								<span class="styIRS8867Dots">.....</span>
							</div>
							<div class="styIRS8867ChildBox">
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
							<div class="styIRS8867ChildBox">
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
							<div class="styIRS8867ChildBox">
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
							<div class="styIRS8867ChildBranch">
								<img alt="Bullet" src="{$ImagePath}/8867_Bullet.gif" height="9" width="9"/>
								If you checked <b>"No"</b> on line 14, the taxpayer <b>cannot</b> take the EIC <br/>
								based on this child and cannot take the EIC for taxpayers who do not <br/>
								have a qualifying child. If there is more than one child, see the <b>Note</b> at <br/>
								the bottom of this page. If you checked <b>"Yes"</b> on line 14, continue.
							</div>
							<div class="styIRS8867ChildBox" style="border-bottom-width:0px;"><br/><br/><br/><span style="width:0px;"/></div>
							<div class="styIRS8867ChildBox" style="border-width:0px;"><br/><br/><br/><span style="width:0px;"/></div>
							<div class="styIRS8867ChildBox" style="border-width:0px;"><br/><br/><br/><span style="width:0px;"/></div>
						</div>
						<!-- Line 15 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox">15</div>
							<div class="styIRS8867ChildDesc">
								Are the taxpayer's <b>earned income</b> and <b>adjusted gross income</b> each less <br/>
								than the limit that applies to the taxpayer for 2011? See Pub. 596 for <br/>
								<span style="float:left;clear:none;">the limit</span>
								<span class="styIRS8867Dots">..................</span>
							</div>
							<div class="styIRS8867ChildBox">
								<br/><br/><span style="width:0px;"/>
							</div>
							<div class="styIRS8867ChildBox" style="border-left-width:0px;">
								<br/><br/><span style="width:0px;"/>
							</div>
							<div class="styIRS8867ChildBox" style="border-left-width:0px;">
								<br/>
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
							<div class="styIRS8867ChildBranch">
								<img alt="Bullet" src="{$ImagePath}/8867_Bullet.gif" height="9" width="9"/>
								If you checked <b>"No"</b> on line 15, <b>stop</b>; the taxpayer <b>cannot</b> take the <br/>
								EIC. If you checked <b>"Yes"</b> on line 15, the taxpayer can take the EIC. <br/>
								Complete <b>Schedule EIC</b> and attach it to the taxpayer's return. If there <br/>
								are two or three qualifying children with valid SSNs, list them on <br/>
								Schedule EIC in the same order as they are listed here. If the taxpayer's <br/>
								EIC was reduced or disallowed for a year after 1996, see Pub. 596 to <br/>
								see if <b>Form 8862</b> must be filed. Go to line 20.
							</div>
							<div class="styIRS8867ChildBox" style="border-width:0px;background-color:lightgrey;"><br/><br/><br/><br/><br/><br/><span style="width:0px"/></div>
							<div class="styIRS8867ChildBox" style="border-width:0px;background-color:lightgrey;"><br/><br/><br/><br/><br/><br/><span style="width:0px"/></div>
							<div class="styIRS8867ChildBox" style="border-width:0px;background-color:lightgrey;"><br/><br/><br/><br/><br/><br/><span style="width:0px"/></div>
						</div>
						<!-- Note Line -->
						<div class="styGenericdiv" style="width:187mm;">
							<div class="styLNLeftNumBoxSD"/>
							<div class="styIRS8867ChildDesc">
								<b>Note.</b> If you checked <b>"No"</b> on line 13c or 14 but there is more than one <br/>
								child, complete lines 8 through 14 for the other child(ren) (but for no more <br/>
								than three qualifying children). Also do this if you checked <b>"Don't know"</b> on <br/>
								line 13c and the taxpayer is not taking the EIC based on this child.
							</div>
							<div class="styIRS8867ChildBox" style="border-width:0px;background-color:lightgrey;"><br/><br/><br/><span style="width:0px"/></div>
							<div class="styIRS8867ChildBox" style="border-width:0px;background-color:lightgrey;"><br/><br/><br/><span style="width:0px"/></div>
							<div class="styIRS8867ChildBox" style="border-width:0px;background-color:lightgrey;"><br/><br/><br/><span style="width:0px"/></div>
						</div>
					</div>
					<!-- END Part II -->
					<!-- Page boundary -->
					<div class="pageEnd" style="width:187mm;">
						<span style="float:right;clear:none;">Form <span style="font-weight:bold;font-size:9pt;">8867</span> (2011)</span>
					</div>
					<div class="styTBB" style="width:187mm;">
						<span style="float:left;clear:none;">Form 8867 (2011)</span>
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
							<div class="styLNLeftNumBox">16</div>
							<div class="styIRS8867LNDesc">
								Was the taxpayer's main home, and the main home of the taxpayer's spouse if filing jointly, in the <br/>
								United States for more than half the year? (Military personnel on extended active duty outside the <br/>
								<span style="float:left;clear:none;">United States are considered to be living in the United States during that duty period. See Pub. 596.)</span>
								<span class="styIRS8867Dots">..</span>
							</div>
							<div class="styIRS8867LNAmountBox">
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
							<div class="styIRS8867BranchDesc">
								<img alt="Bullet" src="{$ImagePath}/8867_Bullet.gif" height="9" width="9"/>
								If you checked <b>"No"</b> on line 16, <b>stop</b>; the taxpayer <b>cannot</b> take the EIC. Otherwise, <br/>
								continue.
							</div>
						</div>
						<!-- Line 17 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox">17</div>
							<div class="styIRS8867LNDesc">
								Was the taxpayer, or the taxpayer's spouse if filing jointly, at least age 25 but under age 65 at <br/>
								<span style="float:left;clear:none;">the end of 2011?</span>
								<span class="styIRS8867Dots">........................</span>
							</div>
							<div class="styIRS8867LNAmountBox">
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
							<div class="styIRS8867BranchDesc">
								<img alt="Bullet" src="{$ImagePath}/8867_Bullet.gif" height="9" width="9"/>
								If you checked <b>"No"</b> on line 17, <b>stop</b>; the taxpayer <b>cannot</b> take the EIC. Otherwise, <br/>
								continue.
							</div>
						</div>
						<!-- Line 18 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox">18</div>
							<div class="styIRS8867LNDesc">
								Is the taxpayer, or the taxpayer's spouse if filing jointly, eligible to be claimed as a dependent on <br/>
								anyone else's federal income tax return for 2011? If the taxpayer's filing status is married filing <br/>
								<span style="float:left;clear:none;">jointly, check "No" </span>
								<span class="styIRS8867Dots">.......................</span>
							</div>
							<div class="styIRS8867LNAmountBox">
								<br/><br/>
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
							<div class="styIRS8867BranchDesc">
								<img alt="Bullet" src="{$ImagePath}/8867_Bullet.gif" height="9" width="9"/>
								If you checked <b>"Yes"</b> on line 18, <b>stop</b>; the taxpayer <b>cannot</b> take the EIC. Otherwise, <br/>
								continue.
							</div>
						</div>
						<!-- Line 19 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox">19</div>
							<div class="styIRS8867LNDesc">
								Are the taxpayer's <b>earned income</b> and <b>adjusted gross income</b> each less than the limit that <br/>
								<span style="float:left;clear:none;">applies to the taxpayer for 2011? See Pub. 596 for the limit</span>
								<span class="styIRS8867Dots">.............</span>
							</div>
							<div class="styIRS8867LNAmountBox">
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
							<div class="styIRS8867BranchDesc" style="">
								<img alt="Bullet" src="{$ImagePath}/8867_Bullet.gif" height="9" width="9"/>
								If you checked <b>"No"</b> on line 19, <b>stop</b>; the taxpayer <b>cannot</b> take the EIC. If you checked <br/>
								<b>"Yes"</b> on line 19, the taxpayer can take the EIC. If the taxpayer's EIC was reduced or disallowed <br/>
								for a year after 1996, see Pub. 596 to find out if <b>Form 8862</b> must be filed. Go to line 20.
						</div>
						<div class="styGenericDiv" style="height:10.5mm;background-color:lightgrey;width:32.6mm"/>	
					</div>
				</div>
					<!-- END Part III -->
					<!-- BEGIN Part IV -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName">Part IV</div>
						<div class="styPartDesc">Due Diligence Requirements</div>
					</div>
					<div class="styTBB" style="width:187mm;">
						<!-- Line 20 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox">20</div>
							<div class="styIRS8867LNDesc">
								Did you complete Form 8867 based on current information provided by the taxpayer or reasonably <br/>
								<span style="float:left;clear:none;">obtained by you?</span>
								<span class="styIRS8867Dots">........................</span>
							</div>
							<div class="styIRS8867LNAmountBox">
								<br/>
								<span style="width:100%;">
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
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styIRS8867BranchDesc"/>
						</div>
						<!-- Line 21 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox">21</div>
							<div class="styIRS8867LNDesc">
								Did you complete the EIC worksheet found in the Form 1040, 1040A, or 1040EZ instructions (or your <br/>
								<span style="float:left;clear:none;">own worksheet that provides the same information as the 1040, 1040A, or 1040EZ worksheet)?</span>
								<span class="styIRS8867Dots">...</span>
							</div>
							<div class="styIRS8867LNAmountBox">
								<br/>
								<span style="width:100%;">
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
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styIRS8867BranchDesc"/>
						</div>
						<!-- Line 22 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox">22</div>
							<div class="styIRS8867LNDesc">
								Did you comply with the knowledge requirements? (To comply with the knowledge requirements, you <br/>
								must not know or have reason to know that any information used to determine the taxpayer's eligibility <br/>
								for, and the amount of, the EIC is incorrect. You may not ignore the implications of information furnished <br/>
								to or known by you, and you must make reasonable inquiries if the information furnished appears to <br/>
								be incorrect, inconsistent, or incomplete. At the time you make these inquiries, you must document in <br/>
								<span style="float:left;clear:none;">your files the inquiries you made and the responses you received.)</span>
								<span class="styIRS8867Dots">...........</span>
							</div>
							<div class="styIRS8867LNAmountBox">
								<br/><br/><br/><br/><br/>
								<span style="width:100%;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/CompliedWithKnowledgeRqrInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CompliedWithKnowledgeRqrInd"/>
											<xsl:with-param name="BackupName">IRS8867CompliedWithKnowledgeRqrInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/CompliedWithKnowledgeRqrInd"/>
											<xsl:with-param name="BackupName">IRS8867CompliedWithKnowledgeRqrInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<span style="width:24px;"/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CompliedWithKnowledgeRqrInd"/>
											<xsl:with-param name="BackupName">IRS8867CompliedWithKnowledgeRqrInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/CompliedWithKnowledgeRqrInd"/>
											<xsl:with-param name="BackupName">IRS8867CompliedWithKnowledgeRqrInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
								</span>
							</div>
						</div>
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styIRS8867BranchDesc"/>
						</div>
						<!-- Line 23 -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox">23</div>
							<div class="styIRS8867LNDesc">
								Did you keep the following records? <br/>
								&bull; Form 8867, <br/>
								&bull; The EIC worksheet(s) or your own worksheet(s),<br/>
								&bull; A record of how, when, and from whom the information used to prepare the form and worksheet(s) <br/> was obtained, and <span style="font-weight:bold;letter-spacing:14px;padding-left:3px">  ..........................</span> <br/>
								&bull; Copies of any documents on which you relied.
							</div>
							<div class="styIRS8867LNAmountBox">
								<br/><br/><br/><br/>
								<span style="width:100%;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/KeepRecordsInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/KeepRecordsInd"/>
											<xsl:with-param name="BackupName">IRS8867KeepRecordsInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/KeepRecordsInd"/>
											<xsl:with-param name="BackupName">IRS8867KeepRecordsInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<span style="width:24px;"/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/KeepRecordsInd"/>
											<xsl:with-param name="BackupName">IRS8867KeepRecordsInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:2px;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/KeepRecordsInd"/>
											<xsl:with-param name="BackupName">IRS8867KeepRecordsInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
								</span>
							</div>
							<div class="styGenericDiv" style="margin-left:0.2mm;background-color:lightgrey;width:32.1mm"/>
						</div>
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styIRS8867BranchDesc" style="border-width:0px;">
								<img alt="Bullet" src="{$ImagePath}/8867_Bullet.gif" height="9" width="9"/>
								If you checked <b>"Yes"</b> on lines 20, 21, 22, and 23, submit Form 8867 in the manner required, and keep the records described on line 23 for 3 years (see instructions), you have complied with all the due diligence requirements. <br/>
								<br/>
								<img alt="Bullet" src="{$ImagePath}/8867_Bullet.gif" height="9" width="9"/>
								If you checked <b>"No"</b> on lines 20, 21, 22, or 23, you have not complied with all the due <br/>
								diligence requirements and may have to pay a $500 penalty for each failure to comply.
							</div>
							<div class="styIRS8867LNAmountBox" style="border-width:0px;background-color:lightgrey;height:22mm"></div>
						</div>
					</div>
					<!-- END Part IV -->
					<div class="pageEnd" style="width:187mm;">
						<span style="float:right;clear:none;">Form <span style="font-weight:bold;font-size:9pt;">8867</span> (2011)</span>
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
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>