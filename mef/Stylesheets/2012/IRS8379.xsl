<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8379Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form8379Data" select="$RtnDoc/IRS8379"/>
	<xsl:template match="/">
		<html lang="EN-US">
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form8379Data)"/>
					</xsl:call-template>
				</title>
				<!--  No Browser Caching  -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set  -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 8379"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8379Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="IRS8379" style="font-family:arial;">
					<!--  Begin Header section 1 -->
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;border-bottom-width:2px;">
						<div class="styFNBox" style="width:31mm;height:20mm;border-right-width:2px;padding-top:.5mm;">
							<div style="padding-top:1mm;">
								Form<span class="styFormNumber">  8379</span>
							</div>
							<!--General Dependency Push Pin-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form8379Data"/>
							</xsl:call-template>
							<span class="styAgency">(Rev. December 2012)</span>
							<br/>
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:125mm;">
							<!--  Main Title >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
							<div class="styMainTitle" style="height:8mm;">
								Injured Spouse Allocation<br/>
								<br/>
							</div>
							<div class="styFST" style="height:5mm;font-size:7pt;margin-left:0mm;text-align:center;">
								<span style="text-align:center;font-weight:bold;">
									<div style="width:100%;height:5mm;padding-left:0px;">
										<div style="width:95%;height:5mm;padding-top:2mm;">
											<br/>
											<img src="{$ImagePath}/8379_Bullet_Sm.gif" alt="Small Bullet"/> 
											Information about Form 8379 and its separate instructions is at <i>www.irs.gov/form8379</i>.
										</div>
									</div>
								</span>
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;border-left-width:2px;">
							<div class="styOMB" style="height:9mm;font-size:7pt;padding-top:2mm;">OMB No. 1545-0074</div>
							<div style="margin-left:3mm;text-align:left;font-size:7pt;height:12mm;padding-top:2mm;">
								Attachment<br/>Sequence No. 
								<span class="styBoldText" style="font-size:9pt;">104</span>
							</div>
						</div>
					</div>
					<!--  End Header section 1 -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part I																								 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;" class="styBB">
						<!-- Content -->
						<div class="styPartName" style="width:15mm;">Part I</div>
						<div class="styPartDesc" style="padding-left:3mm;font-size:8.5pt;">
							Should you file this form?<span class="styNormalText"> You must complete this part.</span>
						</div>
					</div>
					<!-- Body -->
					<div class="styBB" style="width:187mm;">
						<!-- (1) ////////////////////////////////////////////////////-->
						<div class="styIRS8379LineItem">
							<div class="styIRS8379LNLeftNumBox">1</div>
							<div class="styIRS8379LNDesc" style="width:75mm;">
								Enter the tax year for which you are filing this form.
								<span style="width:4px;"/>
								<img src="{$ImagePath}/8379_Bullet_Sm.gif" alt="Small Bullet"/>
							</div>
							<div class="styIRS8379CleanDiv" style="height:100%;width:20mm;border-bottom-width:1px;text-align:center;">
								<xsl:call-template name="PopulateYear">
									<xsl:with-param name="TargetNode" select="$Form8379Data/InjuredSpouseClaimTaxYear"/>
								</xsl:call-template>
							</div>
							<div class="styIRS8379LNDesc" style="width:auto;">
								Answer the following questions for that year.
							</div>
						</div>
						<br/>
						<!-- (2) ////////////////////////////////////////////////////-->
						<div class="styIRS8379LineItem">
							<div class="styIRS8379LNLeftNumBox">2</div>
							<div class="styIRS8379LNDesc" style="width:181mm;">
								Did you (or will you) file a joint return?<br/>
								<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8379Data/JointReturnInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8379Data/JointReturnInd"/>
											<xsl:with-param name="BackupName">IRS8379JointReturnInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:2mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form8379Data/JointReturnInd"/>
										<xsl:with-param name="BackupName">IRS8379JointReturnInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText" style="width:8mm;">Yes.</span>Go to line 3.<br/>
								</label>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8379Data/JointReturnInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8379Data/JointReturnInd"/>
											<xsl:with-param name="BackupName">IRS8379JointReturnInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:2mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form8379Data/JointReturnInd"/>
										<xsl:with-param name="BackupName">IRS8379JointReturnInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText" style="width:8mm;">No.</span>
									<b>Stop here.</b> Do not file this form. You are not an injured spouse.
								</label>
							</div>
						</div>
						<br/>
						<!-- (3) ////////////////////////////////////////////////////-->
						<div class="styIRS8379LineItem">
							<div class="styIRS8379LNLeftNumBox">3</div>
							<div class="styIRS8379LNDesc" style="width:181mm;">
								Did (or will) the IRS use the joint overpayment to pay any of the following legally enforceable past-due debt(s) owed only by your<br/>
								spouse? (see instructions)<br/>
								<img src="{$ImagePath}/8379_Bullet_Round.gif" alt="Round Bullet"/>
								<span style="width:3px;"/>Federal tax<span style="width:3px;"/>
								<img src="{$ImagePath}/8379_Bullet_Round.gif" alt="Round Bullet"/>
								<span style="width:3px;"/>State income tax<span style="width:3px;"/>
								<img src="{$ImagePath}/8379_Bullet_Round.gif" alt="Round Bullet"/>
								<span style="width:3px;"/>State unemployment compensation<span style="width:3px;"/>
								<img src="{$ImagePath}/8379_Bullet_Round.gif" alt="Round Bullet"/>
								<span style="width:3px;"/>Child support<span style="width:3px;"/>
								<img src="{$ImagePath}/8379_Bullet_Round.gif" alt="Round Bullet"/>
								<span style="width:3px;"/>Spousal support<br/>
								<img src="{$ImagePath}/8379_Bullet_Round.gif" alt="Round Bullet"/>
								<span style="width:3px;"/>Federal nontax debt (such as a student loan)<span style="width:3px;"/>
								<br/>
								<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8379Data/JointPayPastDueDebtsInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8379Data/JointPayPastDueDebtsInd"/>
											<xsl:with-param name="BackupName">IRS8379JointPayPastDueDebtsInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:2mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form8379Data/JointPayPastDueDebtsInd"/>
										<xsl:with-param name="BackupName">IRS8379JointPayPastDueDebtsInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText" style="width:8mm;">Yes.</span>Go to line 4.<br/>
								</label>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8379Data/JointPayPastDueDebtsInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8379Data/JointPayPastDueDebtsInd"/>
											<xsl:with-param name="BackupName">IRS8379JointPayPastDueDebtsInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:2mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form8379Data/JointPayPastDueDebtsInd"/>
										<xsl:with-param name="BackupName">IRS8379JointPayPastDueDebtsInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText" style="width:8mm;">No.</span>
									<b>Stop here.</b> Do not file this form. You are not an injured spouse.<br/>
									<span style="width:5mm;"/>
									<b>Note.</b> If the past-due amount is for a joint federal tax, you may qualify for innocent spouse relief for the year to which the<br/>
									<span style="width:5mm;"/>overpayment was applied. See <span class="styItalicText">Innocent Spouse Relief</span>, in the instructions for more information.
								</label>
							</div>
						</div>
						<br/>
						<!-- (4) ////////////////////////////////////////////////////-->
						<div class="styIRS8379LineItem">
							<div class="styIRS8379LNLeftNumBox">4</div>
							<div class="styIRS8379LNDesc" style="width:181mm;">
								Are you legally obligated to pay this past-due amount?<br/>
								<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8379Data/ObligatedToPayPastDueDebtsInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8379Data/ObligatedToPayPastDueDebtsInd"/>
											<xsl:with-param name="BackupName">IRS8379ObligatedToPayPastDueDebtsInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:2mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form8379Data/ObligatedToPayPastDueDebtsInd"/>
										<xsl:with-param name="BackupName">IRS8379ObligatedToPayPastDueDebtsInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText" style="width:8mm;">Yes.</span>
									<b>Stop here.</b> Do not file this form. You are not an injured spouse.<br/>
									<span style="width:5mm;"/>
									<b>Note.</b> If the past-due amount is for a joint federal tax, you may qualify for innocent spouse relief for the year to which the<br/>
									<span style="width:5mm;"/>overpayment was applied. See <span class="styItalicText">Innocent Spouse Relief</span>, in the instructions for more information.<br/>
								</label>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8379Data/ObligatedToPayPastDueDebtsInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8379Data/ObligatedToPayPastDueDebtsInd"/>
											<xsl:with-param name="BackupName">IRS8379ObligatedToPayPastDueDebtsInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:2mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form8379Data/ObligatedToPayPastDueDebtsInd"/>
										<xsl:with-param name="BackupName">IRS8379ObligatedToPayPastDueDebtsInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText" style="width:8mm;">No.</span>Go to line 5.<br/>
								</label>
							</div>
						</div>
						<br/>
						<!-- (5) ////////////////////////////////////////////////////-->
						<div class="styIRS8379LineItem">
							<div class="styIRS8379LNLeftNumBox">5</div>
							<div class="styIRS8379LNDesc" style="width:181mm;">
								Were you a resident of a community property state (Arizona, California, Idaho, Louisiana, Nevada, New Mexico, Texas,<br/>
								Washington, or Wisconsin) at any time during the tax year entered on line 1? (see instructions)<br/>
								<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8379Data/CommunityPropertyStateInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8379Data/CommunityPropertyStateInd"/>
											<xsl:with-param name="BackupName">IRS8379CommunityPropertyStateInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:2mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form8379Data/CommunityPropertyStateInd"/>
										<xsl:with-param name="BackupName">IRS8379CommunityPropertyStateInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText" style="width:8mm;">Yes.</span>Enter the name(s) of the community property state(s)
									<span style="width:93mm;border-style:solid;border-color:black;border-width:0px 0px 1px 0x;text-align:center;">
										<xsl:for-each select="$Form8379Data/CommunityPropertyStateCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
											<span style="width:21px;"/>
										</xsl:for-each>
									</span>.<br/>
									<span style="width:5mm;"/>Skip lines 6 through 9 and <b>go to Part II</b> and complete the rest of this form.<br/>
								</label>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8379Data/CommunityPropertyStateInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8379Data/CommunityPropertyStateInd"/>
											<xsl:with-param name="BackupName">IRS8379CommunityPropertyStateInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:2mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form8379Data/CommunityPropertyStateInd"/>
										<xsl:with-param name="BackupName">IRS8379CommunityPropertyStateInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText" style="width:8mm;">No.</span>Go to line 6.<br/>
								</label>
							</div>
						</div>
						<br/>
						<!-- (6) ////////////////////////////////////////////////////-->
						<div class="styIRS8379LineItem">
							<div class="styIRS8379LNLeftNumBox">6</div>
							<div class="styIRS8379LNDesc" style="width:181mm;">
								Did you make and report payments, such as federal income tax withholding or estimated tax payments?<br/>
								<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8379Data/PaymentsMadeAndReportedInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8379Data/PaymentsMadeAndReportedInd"/>
											<xsl:with-param name="BackupName">IRS8379PaymentsMadeAndReportedInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:2mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form8379Data/PaymentsMadeAndReportedInd"/>
										<xsl:with-param name="BackupName">IRS8379PaymentsMadeAndReportedInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText" style="width:8mm;">Yes.</span>Skip lines 7 through 9 and <b>go to Part II</b> and complete the rest of this form.<br/>
								</label>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8379Data/PaymentsMadeAndReportedInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8379Data/PaymentsMadeAndReportedInd"/>
											<xsl:with-param name="BackupName">IRS8379PaymentsMadeAndReportedInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:2mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form8379Data/PaymentsMadeAndReportedInd"/>
										<xsl:with-param name="BackupName">IRS8379PaymentsMadeAndReportedInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText" style="width:8mm;">No.</span>Go to line 7.<br/>
								</label>
							</div>
						</div>
						<br/>
						<!-- (7) ////////////////////////////////////////////////////-->
						<div class="styIRS8379LineItem">
							<div class="styIRS8379LNLeftNumBox">7</div>
							<div class="styIRS8379LNDesc" style="width:181mm;">
								Did you have earned income, such as wages, salaries, or self-employment income?<br/>
								<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8379Data/EarnedIncomeInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8379Data/EarnedIncomeInd"/>
											<xsl:with-param name="BackupName">IRS8379EarnedIncomeInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:2mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form8379Data/EarnedIncomeInd"/>
										<xsl:with-param name="BackupName">IRS8379EarnedIncomeInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText" style="width:8mm;">Yes.</span>Go to line 8.<br/>
								</label>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8379Data/EarnedIncomeInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8379Data/EarnedIncomeInd"/>
											<xsl:with-param name="BackupName">IRS8379EarnedIncomeInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:2mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form8379Data/EarnedIncomeInd"/>
										<xsl:with-param name="BackupName">IRS8379EarnedIncomeInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText" style="width:8mm;">No.</span>Skip line 8 and go to line 9.<br/>
								</label>
							</div>
						</div>
						<br/>
						<!-- (8) ////////////////////////////////////////////////////-->
						<div class="styIRS8379LineItem">
							<div class="styIRS8379LNLeftNumBox">8</div>
							<div class="styIRS8379LNDesc" style="width:181mm;">
								Did (or will) you claim the earned income credit or additional child tax credit?<br/>
								<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8379Data/EICOrAdditionalChildTaxCrInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8379Data/EICOrAdditionalChildTaxCrInd"/>
											<xsl:with-param name="BackupName">IRS8379EICOrAdditionalChildTaxCrInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:2mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form8379Data/EICOrAdditionalChildTaxCrInd"/>
										<xsl:with-param name="BackupName">IRS8379EICOrAdditionalChildTaxCrInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText" style="width:8mm;">Yes.</span>Skip line 9 and <b>go to Part II</b> and complete the rest of this form.<br/>
								</label>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8379Data/EICOrAdditionalChildTaxCrInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8379Data/EICOrAdditionalChildTaxCrInd"/>
											<xsl:with-param name="BackupName">IRS8379EICOrAdditionalChildTaxCrInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:2mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form8379Data/EICOrAdditionalChildTaxCrInd"/>
										<xsl:with-param name="BackupName">IRS8379EICOrAdditionalChildTaxCrInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText" style="width:8mm;">No.</span>Go to line 9.<br/>
								</label>
							</div>
						</div>
						<br/>
						<!-- (9) ////////////////////////////////////////////////////-->
						<div class="styIRS8379LineItem">
							<div class="styIRS8379LNLeftNumBox">9</div>
							<div class="styIRS8379LNDesc" style="width:181mm;">
								Did (or will) you claim a refundable tax credit (see instructions)?<br/>
								<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8379Data/RefundableTaxCreditClaimInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8379Data/RefundableTaxCreditClaimInd"/>
											<xsl:with-param name="BackupName">IRS8379RefundableTaxCreditClaimInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:2mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form8379Data/RefundableTaxCreditClaimInd"/>
										<xsl:with-param name="BackupName">IRS8379RefundableTaxCreditClaimInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText" style="width:8mm;">Yes.</span>
									<b>Go to Part II</b> and complete the rest of this form.<br/>
								</label>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form8379Data/RefundableTaxCreditClaimInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8379Data/RefundableTaxCreditClaimInd"/>
											<xsl:with-param name="BackupName">IRS8379RefundableTaxCreditClaimInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:2mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form8379Data/RefundableTaxCreditClaimInd"/>
										<xsl:with-param name="BackupName">IRS8379RefundableTaxCreditClaimInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText" style="width:8mm;">No.</span>
									<b>Stop here.</b> Do not file this form. You are not an injured spouse.<br/>
								</label>
							</div>
						</div>
						<br/>
					</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part II																								 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;" class="styBB">
						<!-- Content -->
						<div class="styPartName" style="width:15mm;">Part II</div>
						<div class="styPartDesc" style="padding-left:3mm;font-size:8.5pt;">
							Information About the Joint Tax Return for Which This Form Is Filed
						</div>
					</div>
					<!-- Body -->
					<div class="styTBB" style="width:187mm;">
						<!-- (10) ////////////////////////////////////////////////////-->
						<div class="styIRS8379LineItem">
							<div class="styIRS8379LNLeftNumBox">10</div>
							<div class="styIRS8379LNDesc" style="width:181mm;padding-top:0px;">
								<div class="styIRS8379CleanDiv" style="width:100%;height:auto;border-bottom-width:1px;">
									<div class="styIRS8379LNDesc" style="width:100%;padding-left:0px;padding-top:0px;">
										Enter the following information exactly as it is shown on the tax return for which you are filing this form.<br/>
										The spouse’s name and social security number shown first on that tax return must also be shown first below.
									</div>
								</div>
								<div class="styIRS8379CleanDiv" style="width:100%;border-bottom-width:1px;height:10mm;padding-top:0px;">
									<!-- Top Line -->
									<div class="styIRS8379CleanDiv" style="width:100%;height:50%;border-bottom-width:1px;padding-top:0px;">
										<div class="styIRS8379LNDesc" style="width:50%;height:100%;border-right-width:1px;border-color:black;font-size:7pt;">
											First name, initial, and last name shown first on the return<br/>
											<span style="width:100%">
												<xsl:if test="$Form8379Data/InjuredSpouseInformationGrp">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form8379Data/InjuredSpouseInformationGrp[1]/PersonName"/>
													</xsl:call-template>
												</xsl:if>
											</span>
										</div>
										<div class="styIRS8379LNDesc" style="width:30%;height:100%;border-right-width:1px;border-color:black;font-size:7pt;">
											Social security number shown first<br/>
											<span style="width:100%;text-align:center;">
												<xsl:if test="$Form8379Data/InjuredSpouseInformationGrp">
													<xsl:call-template name="PopulateSSN">
														<xsl:with-param name="TargetNode" select="$Form8379Data/InjuredSpouseInformationGrp[1]/SSN"/>
													</xsl:call-template>
												</xsl:if>
											</span>
										</div>
										<div class="styIRS8379LNDesc" style="width:19%;height:100%;font-size:7pt;">
											<span class="styBoldText" style="width:70%;height:100%;float:left;">
												If Injured Spouse, check here
												<span style="width:3px;"/>
												<img src="{$ImagePath}/8379_Bullet_Sm.gif" alt="Small Bullet"/>
											</span>
											<span style="width:30%;padding-top:2.5mm;height:auto;float:left;">
												<span style="width:2mm;"/>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$Form8379Data/InjuredSpouseInformationGrp[1]/InjuredSpouseInd"/>
														<xsl:with-param name="BackupName">Form8379DataInjuredSpouseInformationGrp[1]InjuredSpouseInd</xsl:with-param>
													</xsl:call-template>
												</label>
												<input type="checkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="$Form8379Data/InjuredSpouseInformationGrp[1]/InjuredSpouseInd"/>
														<xsl:with-param name="BackupName">Form8379DataInjuredSpouseInformationGrp[1]InjuredSpouseInd</xsl:with-param>
													</xsl:call-template>
												</input>
											</span>
										</div>
									</div>
									<!-- Bottom Line -->
									<div class="styIRS8379CleanDiv" style="width:100%;height:50%;padding-top:0px;">
										<div class="styIRS8379LNDesc" style="width:50%;height:100%;border-right-width:1px;border-color:black;font-size:7pt;">
											First name, initial, and last name shown second on the return<br/>
											<span style="width:100%">
												<xsl:if test="$Form8379Data/InjuredSpouseInformationGrp">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form8379Data/InjuredSpouseInformationGrp[2]/PersonName"/>
													</xsl:call-template>
												</xsl:if>
											</span>
										</div>
										<div class="styIRS8379LNDesc" style="width:30%;height:100%;border-right-width:1px;border-color:black;font-size:7pt;">
											Social security number shown second<br/>
											<span style="width:100%;text-align:center;">
												<xsl:if test="$Form8379Data/InjuredSpouseInformationGrp">
													<xsl:call-template name="PopulateSSN">
														<xsl:with-param name="TargetNode" select="$Form8379Data/InjuredSpouseInformationGrp[2]/SSN"/>
													</xsl:call-template>
												</xsl:if>
											</span>
										</div>
										<div class="styIRS8379LNDesc" style="width:19%;height:100%;font-size:7pt;">
											<span class="styBoldText" style="width:70%;height:100%;float:left;">
												If Injured Spouse, check here
												<span style="width:3px;"/>
												<img src="{$ImagePath}/8379_Bullet_Sm.gif" alt="Small Bullet"/>
											</span>
											<span style="width:30%;padding-top:2.5mm;height:auto;float:left;">
												<span style="width:2mm;"/>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$Form8379Data/InjuredSpouseInformationGrp[2]/InjuredSpouseInd"/>
														<xsl:with-param name="BackupName">Form8379DataInjuredSpouseInformationGrp[2]InjuredSpouseInd</xsl:with-param>
													</xsl:call-template>
												</label>
												<input type="checkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="$Form8379Data/InjuredSpouseInformationGrp[2]/InjuredSpouseInd"/>
														<xsl:with-param name="BackupName">Form8379DataInjuredSpouseInformationGrp[2]InjuredSpouseInd</xsl:with-param>
													</xsl:call-template>
												</input>
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- (11) ////////////////////////////////////////////////////-->
						<div class="styIRS8379LineItem">
							<div class="styIRS8379LNLeftNumBox">11</div>
							<div class="styIRS8379LNDesc" style="width:171mm;">
								Check this box only if you are divorced or legally separated from the spouse with whom you filed the joint return and<br/>
								you want your refund issued in your name only
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
								</span>
							</div>
							<div class="styIRS8379CleanDiv" style="width:10mm;padding-top:4mm;height:100%;padding-left:1.3mm;">
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8379Data/DivorcedOrSeparatedInd"/>
										<xsl:with-param name="BackupName">Form8379DataDivorcedOrSeparatedInd</xsl:with-param>
									</xsl:call-template>
								</label>
								<input type="checkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8379Data/DivorcedOrSeparatedInd"/>
										<xsl:with-param name="BackupName">Form8379DataDivorcedOrSeparatedInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
						</div>
						<br/>
						<!-- (12) ////////////////////////////////////////////////////-->
						<div class="styIRS8379LineItem">
							<div class="styIRS8379LNLeftNumBox">12</div>
							<div class="styIRS8379LNDesc" style="width:181mm;">
								<div class="styIRS8379CleanDiv" style="padding-top:0px;width:100%; height:auto;font-size:8.5pt;">
									Do you want any injured spouse refund mailed to an address different from the one on your joint return?
									<span style="width:14mm;"/>
									<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8379Data/AlternateAddressInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8379Data/AlternateAddressInd"/>
												<xsl:with-param name="BackupName">IRS8379AlternateAddressInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form8379Data/AlternateAddressInd"/>
											<xsl:with-param name="BackupName">IRS8379AlternateAddressInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">Yes</span>
									</label>
									<span style="width:5mm;"/>
									<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8379Data/AlternateAddressInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8379Data/AlternateAddressInd"/>
												<xsl:with-param name="BackupName">IRS8379AlternateAddressInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form8379Data/AlternateAddressInd"/>
											<xsl:with-param name="BackupName">IRS8379AlternateAddressInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">No</span>
									</label>
								</div>
								<div class="styIRS8379CleanDiv" style="padding-top:0px;width:100%; height:8mm;">
									<div class="styIRS8379CleanDiv" style="padding-top:0px;width:100%; height:50%;">
										<div class="styIRS8379CleanDiv" style="padding-top:0px;width:22%; height:100%;font-size:8.5pt;">
											If “Yes,” enter the address.
										</div>
										<div class="styIRS8379CleanDiv" style="padding-top:0px;width:35%; height:100%;">
											<xsl:choose>
												<xsl:when test="$Form8379Data/USAddress">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form8379Data/USAddress/AddressLine1"/>
													</xsl:call-template>
													<xsl:if test="$Form8379Data/USAddress/AddressLine2">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form8379Data/USAddress/AddressLine2"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:when>
												<xsl:when test="$Form8379Data/ForeignAddress">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form8379Data/ForeignAddress/AddressLine1"/>
													</xsl:call-template>
													<xsl:if test="$Form8379Data/ForeignAddress/AddressLine2">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form8379Data/ForeignAddress/AddressLine2"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:when>
											</xsl:choose>
										</div>
										<div class="styIRS8379CleanDiv" style="padding-top:0px;width:43%; height:100%;word-wrap:break-word;">
											<xsl:choose>
												<xsl:when test="$Form8379Data/USAddress">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form8379Data/USAddress/City"/>
													</xsl:call-template>
													<span style="width:3mm;">,</span>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form8379Data/USAddress/State"/>
													</xsl:call-template>
													<span style="width:3mm;">,</span>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form8379Data/USAddress/ZIPCode"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:when test="$Form8379Data/ForeignAddress">
													<xsl:if test="$Form8379Data/ForeignAddress/City">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form8379Data/ForeignAddress/City"/>
														</xsl:call-template>
														<span style="width:3mm;">,</span>
													</xsl:if>
													<xsl:if test="$Form8379Data/ForeignAddress/ProvinceOrState">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form8379Data/ForeignAddress/ProvinceOrState"/>
														</xsl:call-template>
														<span style="width:3mm;">,</span>
													</xsl:if>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form8379Data/ForeignAddress/Country"/>
													</xsl:call-template>
													<span style="width:3mm;">,</span>
													<xsl:if test="$Form8379Data/ForeignAddress/PostalCode">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form8379Data/ForeignAddress/PostalCode"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:when>
											</xsl:choose>
										</div>
									</div>
									<div class="styIRS8379CleanDiv" style="padding-top:0px;width:100%; height:50%;">
										<div class="styIRS8379CleanDiv" style="padding-top:0px;width:22%; height:100%;"/>
										<div class="styIRS8379CleanDiv" style="padding-top:0px;width:35%; height:100%;font-size:8.5pt;border-top-width:1px;">
											Number and street
										</div>
										<div class="styIRS8379CleanDiv" style="padding-top:0px;width:43%; height:100%;font-size:8.5pt;border-top-width:1px;">
											City, town, or post office, state, and ZIP code
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:left;">
							<span class="styBoldText">
								For Privacy Act and Paperwork Reduction Act Notice, see separate instructions.
							</span>
						</div>
						<div style="float:right;">
							<span style="width:50px;"/>  
								Form 
							<span class="styBoldText" style="font-size:8pt;">8379</span> (Rev. 12-2012)
						</div>
						<div style="float:right;text-align:center;width:26mm;font-size:7pt;">
							Cat. No. 62474Q
						</div>
					</div>
					<!-- END Page Break and Footer-->
					<!-- BEGIN Page Header -->
					<div class="styTBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">
							Form 8379 (Rev. 12-2012)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">
							Page <span style="font-weight:bold;font-size:8pt;">2</span>
						</div>
					</div>
					<!-- END Page Header -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part III																								 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;" class="styBB">
						<!-- Content -->
						<div class="styPartName" style="width:15mm;">Part III</div>
						<div class="styPartDesc" style="padding-left:3mm;font-size:8.5pt;">
							Allocation Between Spouses of Items on the Joint Tax Return
							<span class="styNormalText"> (see instructions)</span>
						</div>
					</div>
					<!-- Body -->
					<div class="styBB" style="width:187mm;">
						<!-- (Header Line) ////////////////////////////////////////////////////-->
						<div class="styIRS8379LineItem" style="border-bottom-width:1px;border-color:black;">
							<div class="styIRS8379CleanDiv" style="width:100%;height:10mm;padding-top:0px;">
								<div class="styIRS8379CleanDiv" style="width:55%;height:100%;">
									<span class="styBoldText" style="width:100%;text-align:center;font-size:8.5pt;padding-top:2mm;">
										Allocated Items
									</span>
								</div>
								<div class="styIRS8379CleanDiv" style="width:15%;height:100%;border-left-width:1px;">
									<span style="width:100%;text-align:center;font-size:8.5pt;padding-top:1mm;padding-bottom:1mm;">
										<b>(a)</b> Amount shown<br/>on joint return
									</span>
								</div>
								<div class="styIRS8379CleanDiv" style="width:15%;height:100%;border-left-width:1px;">
									<span style="width:100%;text-align:center;font-size:8.5pt;padding-top:1mm;padding-bottom:1mm;">
										<b>(b)</b> Allocated to<br/>injured spouse
									</span>
								</div>
								<div class="styIRS8379CleanDiv" style="width:15%;height:100%;border-left-width:1px;">
									<span style="width:100%;text-align:center;font-size:8.5pt;padding-top:1mm;padding-bottom:1mm;">
										<b>(c)</b> Allocated to<br/>other spouse
									</span>
								</div>
							</div>
						</div>
						<!-- (13a) ////////////////////////////////////////////////////-->
						<div class="styIRS8379LineItem" style="border-bottom-width:1px;border-color:black;">
							<div class="styIRS8379CleanDiv" style="width:100%;height:8mm;padding-top:0px;">
								<div class="styIRS8379CleanDiv" style="width:55%;height:100%;padding-top:0px;">
									<div class="styIRS8379CleanDiv" style="width:100%;height:3mm;padding-top:0px;"/>
									<div class="styIRS8379CleanDiv" style="width:100%;height:5mm;padding-top:0px;">
										<div class="styIRS8379LNLeftNumBox" style="height:auto;">13</div>
										<div class="styIRS8379LNDesc" style="width:13mm;height:auto;">
											Income:
										</div>
										<div class="styIRS8379LNLeftNumBox" style="height:auto;">a.</div>
										<div class="styIRS8379LNDesc" style="width:60mm;height:auto;">
											Income reported on Form W-2
										</div>
									</div>
								</div>
								<div class="styIRS8379CleanDiv" style="width:15%;height:100%;border-left-width:1px;padding-right:3px;padding-top:0px;border-color:black;">
									<span style="width:100%;text-align:right;font-size:7pt;padding-top:4.5mm;height:auto;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8379Data/JointReturnAmtGrp/WagesAmt"/>
										</xsl:call-template>
									</span>
								</div>
								<div class="styIRS8379CleanDiv" style="width:15%;height:100%;border-left-width:1px;padding-right:3px;padding-top:0px;">
									<span style="width:100%;text-align:right;font-size:7pt;padding-top:4.5mm;height:auto;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8379Data/InjuredSpouseAllocatedAmtGrp/WagesAmt"/>
										</xsl:call-template>
									</span>
								</div>
								<div class="styIRS8379CleanDiv" style="width:15%;height:100%;border-left-width:1px;padding-right:3px;padding-top:0px;">
									<span style="width:100%;text-align:right;font-size:7pt;padding-top:4.5mm;height:auto;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8379Data/OtherSpouseAllocatedAmtGrp/WagesAmt"/>
										</xsl:call-template>
									</span>
								</div>
							</div>
						</div>
						<!-- (13b) ////////////////////////////////////////////////////-->
						<div class="styIRS8379LineItem" style="border-bottom-width:1px;border-color:black;">
							<div class="styIRS8379CleanDiv" style="width:100%;height:8mm;padding-top:0px;">
								<div class="styIRS8379CleanDiv" style="width:55%;height:100%;padding-top:0px;">
									<div class="styIRS8379CleanDiv" style="width:100%;height:5mm;padding-top:2mm;">
										<div class="styIRS8379LNLeftNumBox"/>
										<div class="styIRS8379LNDesc" style="width:13mm;height:auto;"/>
										<div class="styIRS8379LNLeftNumBox" style="height:auto;">b.</div>
										<div class="styIRS8379LNDesc" style="width:auto;height:auto;">
											All other income
											<span style="">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="$Form8379Data/JointReturnAmtGrp/TotalOtherIncomeAmt"/>
												</xsl:call-template>
											</span>
										</div>
									</div>
								</div>
								<div class="styIRS8379CleanDiv" style="width:15%;height:100%;border-left-width:1px;padding-right:3px;padding-top:0px;border-color:black;">
									<span>
										<xsl:attribute name="style">
											width:100%;text-align:right;font-size:7pt;padding-top:4.5mm;height:auto;
											<xsl:if test="$Form8379Data/JointReturnAmtGrp/TotalOtherIncomeAmt/@referenceDocumentId">
												padding-top:0.8mm;
											</xsl:if></xsl:attribute>
										<xsl:if test="$Form8379Data/JointReturnAmtGrp/TotalOtherIncomeAmt/@referenceDocumentId">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$Form8379Data/JointReturnAmtGrp/WagesAmt"/>
											</xsl:call-template>
											<br/>
										</xsl:if>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8379Data/JointReturnAmtGrp/TotalOtherIncomeAmt"/>
										</xsl:call-template>
									</span>
								</div>
								<div class="styIRS8379CleanDiv" style="width:15%;height:100%;border-left-width:1px;padding-right:3px;padding-top:0px;">
									<span style="width:100%;text-align:right;font-size:7pt;padding-top:4.5mm;height:auto;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8379Data/InjuredSpouseAllocatedAmtGrp/TotalOtherIncomeAmt"/>
										</xsl:call-template>
									</span>
								</div>
								<div class="styIRS8379CleanDiv" style="width:15%;height:100%;border-left-width:1px;padding-right:3px;padding-top:0px;">
									<span style="width:100%;text-align:right;font-size:7pt;padding-top:4.5mm;height:auto;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8379Data/OtherSpouseAllocatedAmtGrp/TotalOtherIncomeAmt"/>
										</xsl:call-template>
									</span>
								</div>
							</div>
						</div>
						<!-- (14) ////////////////////////////////////////////////////-->
						<div class="styIRS8379LineItem" style="border-bottom-width:1px;border-color:black;">
							<div class="styIRS8379CleanDiv" style="width:100%;height:8mm;padding-top:0px;">
								<div class="styIRS8379CleanDiv" style="width:55%;height:100%;padding-top:0px;">
									<div class="styIRS8379CleanDiv" style="width:100%;height:3mm;padding-top:0px;"/>
									<div class="styIRS8379CleanDiv" style="width:100%;height:5mm;padding-top:0px;">
										<div class="styIRS8379LNLeftNumBox" style="height:auto;">14</div>
										<div class="styIRS8379LNDesc" style="width:auto;height:auto;">
											Adjustments to income
										</div>
									</div>
								</div>
								<div class="styIRS8379CleanDiv" style="width:15%;height:100%;border-left-width:1px;padding-right:3px;padding-top:0px;border-color:black;">
									<span style="width:100%;text-align:right;font-size:7pt;padding-top:4.5mm;height:auto;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8379Data/JointReturnAmtGrp/IncomeAdjustmentAmt"/>
										</xsl:call-template>
									</span>
								</div>
								<div class="styIRS8379CleanDiv" style="width:15%;height:100%;border-left-width:1px;padding-right:3px;padding-top:0px;">
									<span style="width:100%;text-align:right;font-size:7pt;padding-top:4.5mm;height:auto;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8379Data/InjuredSpouseAllocatedAmtGrp/IncomeAdjustmentAmt"/>
										</xsl:call-template>
									</span>
								</div>
								<div class="styIRS8379CleanDiv" style="width:15%;height:100%;border-left-width:1px;padding-right:3px;padding-top:0px;">
									<span style="width:100%;text-align:right;font-size:7pt;padding-top:4.5mm;height:auto;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8379Data/OtherSpouseAllocatedAmtGrp/IncomeAdjustmentAmt"/>
										</xsl:call-template>
									</span>
								</div>
							</div>
						</div>
						<!-- (15) ////////////////////////////////////////////////////-->
						<div class="styIRS8379LineItem" style="border-bottom-width:1px;border-color:black;">
							<div class="styIRS8379CleanDiv" style="width:100%;height:8mm;padding-top:0px;">
								<div class="styIRS8379CleanDiv" style="width:55%;height:100%;padding-top:0px;">
									<div class="styIRS8379CleanDiv" style="width:100%;height:3mm;padding-top:0px;"/>
									<div class="styIRS8379CleanDiv" style="width:100%;height:5mm;padding-top:0px;">
										<div class="styIRS8379LNLeftNumBox" style="height:auto;">15</div>
										<div class="styIRS8379LNDesc" style="width:auto;height:auto;">
											Standard deduction or Itemized deductions
										</div>
									</div>
								</div>
								<div class="styIRS8379CleanDiv" style="width:15%;height:100%;border-left-width:1px;padding-right:3px;padding-top:0px;border-color:black;">
									<span style="width:100%;text-align:right;font-size:7pt;padding-top:4.5mm;height:auto;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8379Data/JointReturnAmtGrp/StandardOrItemizedDeductionAmt"/>
										</xsl:call-template>
									</span>
								</div>
								<div class="styIRS8379CleanDiv" style="width:15%;height:100%;border-left-width:1px;padding-right:3px;padding-top:0px;">
									<span style="width:100%;text-align:right;font-size:7pt;padding-top:4.5mm;height:auto;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8379Data/InjuredSpouseAllocatedAmtGrp/StandardOrItemizedDeductionAmt"/>
										</xsl:call-template>
									</span>
								</div>
								<div class="styIRS8379CleanDiv" style="width:15%;height:100%;border-left-width:1px;padding-right:3px;padding-top:0px;">
									<span style="width:100%;text-align:right;font-size:7pt;padding-top:4.5mm;height:auto;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8379Data/OtherSpouseAllocatedAmtGrp/StandardOrItemizedDeductionAmt"/>
										</xsl:call-template>
									</span>
								</div>
							</div>
						</div>
						<!-- (16) ////////////////////////////////////////////////////-->
						<div class="styIRS8379LineItem" style="border-bottom-width:1px;border-color:black;">
							<div class="styIRS8379CleanDiv" style="width:100%;height:8mm;padding-top:0px;">
								<div class="styIRS8379CleanDiv" style="width:55%;height:100%;padding-top:0px;">
									<div class="styIRS8379CleanDiv" style="width:100%;height:3mm;padding-top:0px;"/>
									<div class="styIRS8379CleanDiv" style="width:100%;height:5mm;padding-top:0px;">
										<div class="styIRS8379LNLeftNumBox" style="height:auto;">16</div>
										<div class="styIRS8379LNDesc" style="width:auto;height:auto;">
											Number of exemptions
										</div>
									</div>
								</div>
								<div class="styIRS8379CleanDiv" style="width:15%;height:100%;border-left-width:1px;padding-right:3px;padding-top:0px;border-color:black;">
									<span style="width:100%;text-align:right;font-size:7pt;padding-top:4.5mm;height:auto;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8379Data/JointReturnAmtGrp/AllocatedExemptionCnt"/>
										</xsl:call-template>
									</span>
								</div>
								<div class="styIRS8379CleanDiv" style="width:15%;height:100%;border-left-width:1px;padding-right:3px;padding-top:0px;">
									<span style="width:100%;text-align:right;font-size:7pt;padding-top:4.5mm;height:auto;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8379Data/InjuredSpouseAllocatedAmtGrp/AllocatedExemptionCnt"/>
										</xsl:call-template>
									</span>
								</div>
								<div class="styIRS8379CleanDiv" style="width:15%;height:100%;border-left-width:1px;padding-right:3px;padding-top:0px;">
									<span style="width:100%;text-align:right;font-size:7pt;padding-top:4.5mm;height:auto;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8379Data/OtherSpouseAllocatedAmtGrp/AllocatedExemptionCnt"/>
										</xsl:call-template>
									</span>
								</div>
							</div>
						</div>
						<!-- (17) ////////////////////////////////////////////////////-->
						<div class="styIRS8379LineItem" style="border-bottom-width:1px;border-color:black;">
							<div class="styIRS8379CleanDiv" style="width:100%;height:8mm;padding-top:0px;">
								<div class="styIRS8379CleanDiv" style="width:55%;height:100%;padding-top:0px;">
									<div class="styIRS8379CleanDiv" style="width:100%;height:3mm;padding-top:0px;"/>
									<div class="styIRS8379CleanDiv" style="width:100%;height:5mm;padding-top:0px;">
										<div class="styIRS8379LNLeftNumBox" style="height:auto;">17</div>
										<div class="styIRS8379LNDesc" style="width:auto;height:auto;">
											Credits (<b>do not</b> include any earned income credit)
										</div>
									</div>
								</div>
								<div class="styIRS8379CleanDiv" style="width:15%;height:100%;border-left-width:1px;padding-right:3px;padding-top:0px;border-color:black;">
									<span style="width:100%;text-align:right;font-size:7pt;padding-top:4.5mm;height:auto;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8379Data/JointReturnAmtGrp/CreditAmt"/>
										</xsl:call-template>
									</span>
								</div>
								<div class="styIRS8379CleanDiv" style="width:15%;height:100%;border-left-width:1px;padding-right:3px;padding-top:0px;">
									<span style="width:100%;text-align:right;font-size:7pt;padding-top:4.5mm;height:auto;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8379Data/InjuredSpouseAllocatedAmtGrp/CreditAmt"/>
										</xsl:call-template>
									</span>
								</div>
								<div class="styIRS8379CleanDiv" style="width:15%;height:100%;border-left-width:1px;padding-right:3px;padding-top:0px;">
									<span style="width:100%;text-align:right;font-size:7pt;padding-top:4.5mm;height:auto;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8379Data/OtherSpouseAllocatedAmtGrp/CreditAmt"/>
										</xsl:call-template>
									</span>
								</div>
							</div>
						</div>
						<!-- (18) ////////////////////////////////////////////////////-->
						<div class="styIRS8379LineItem" style="border-bottom-width:1px;border-color:black;">
							<div class="styIRS8379CleanDiv" style="width:100%;height:8mm;padding-top:0px;">
								<div class="styIRS8379CleanDiv" style="width:55%;height:100%;padding-top:0px;">
									<div class="styIRS8379CleanDiv" style="width:100%;height:3mm;padding-top:0px;"/>
									<div class="styIRS8379CleanDiv" style="width:100%;height:5mm;padding-top:0px;">
										<div class="styIRS8379LNLeftNumBox" style="height:auto;">18</div>
										<div class="styIRS8379LNDesc" style="width:auto;height:auto;">
											Other taxes
										</div>
									</div>
								</div>
								<div class="styIRS8379CleanDiv" style="width:15%;height:100%;border-left-width:1px;padding-right:3px;padding-top:0px;border-color:black;">
									<span style="width:100%;text-align:right;font-size:7pt;padding-top:4.5mm;height:auto;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8379Data/JointReturnAmtGrp/OtherTaxesAmt"/>
										</xsl:call-template>
									</span>
								</div>
								<div class="styIRS8379CleanDiv" style="width:15%;height:100%;border-left-width:1px;padding-right:3px;padding-top:0px;">
									<span style="width:100%;text-align:right;font-size:7pt;padding-top:4.5mm;height:auto;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8379Data/InjuredSpouseAllocatedAmtGrp/OtherTaxesAmt"/>
										</xsl:call-template>
									</span>
								</div>
								<div class="styIRS8379CleanDiv" style="width:15%;height:100%;border-left-width:1px;padding-right:3px;padding-top:0px;">
									<span style="width:100%;text-align:right;font-size:7pt;padding-top:4.5mm;height:auto;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8379Data/OtherSpouseAllocatedAmtGrp/OtherTaxesAmt"/>
										</xsl:call-template>
									</span>
								</div>
							</div>
						</div>
						<!-- (19) ////////////////////////////////////////////////////-->
						<div class="styIRS8379LineItem" style="border-bottom-width:1px;border-color:black;">
							<div class="styIRS8379CleanDiv" style="width:100%;height:8mm;padding-top:0px;">
								<div class="styIRS8379CleanDiv" style="width:55%;height:100%;padding-top:0px;">
									<div class="styIRS8379CleanDiv" style="width:100%;height:3mm;padding-top:0px;"/>
									<div class="styIRS8379CleanDiv" style="width:100%;height:5mm;padding-top:0px;">
										<div class="styIRS8379LNLeftNumBox" style="height:auto;">19</div>
										<div class="styIRS8379LNDesc" style="width:auto;height:auto;">
											Federal income tax withheld
										</div>
									</div>
								</div>
								<div class="styIRS8379CleanDiv" style="width:15%;height:100%;border-left-width:1px;padding-right:3px;padding-top:0px;border-color:black;">
									<span style="width:100%;text-align:right;font-size:7pt;padding-top:4.5mm;height:auto;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8379Data/JointReturnAmtGrp/FederalIncomeTaxWithheldAmt"/>
										</xsl:call-template>
									</span>
								</div>
								<div class="styIRS8379CleanDiv" style="width:15%;height:100%;border-left-width:1px;padding-right:3px;padding-top:0px;">
									<span style="width:100%;text-align:right;font-size:7pt;padding-top:4.5mm;height:auto;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8379Data/InjuredSpouseAllocatedAmtGrp/FederalIncomeTaxWithheldAmt"/>
										</xsl:call-template>
									</span>
								</div>
								<div class="styIRS8379CleanDiv" style="width:15%;height:100%;border-left-width:1px;padding-right:3px;padding-top:0px;">
									<span style="width:100%;text-align:right;font-size:7pt;padding-top:4.5mm;height:auto;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8379Data/OtherSpouseAllocatedAmtGrp/FederalIncomeTaxWithheldAmt"/>
										</xsl:call-template>
									</span>
								</div>
							</div>
						</div>
						<!-- (20) ////////////////////////////////////////////////////-->
						<div class="styIRS8379LineItem">
							<div class="styIRS8379CleanDiv" style="width:100%;height:8mm;padding-top:0px;">
								<div class="styIRS8379CleanDiv" style="width:55%;height:100%;padding-top:0px;">
									<div class="styIRS8379CleanDiv" style="width:100%;height:3mm;padding-top:0px;"/>
									<div class="styIRS8379CleanDiv" style="width:100%;height:5mm;padding-top:0px;">
										<div class="styIRS8379LNLeftNumBox" style="height:auto;">20</div>
										<div class="styIRS8379LNDesc" style="width:auto;height:auto;">
											Payments
										</div>
									</div>
								</div>
								<div class="styIRS8379CleanDiv" style="width:15%;height:100%;border-left-width:1px;padding-right:3px;padding-top:0px;border-color:black;">
									<span style="width:100%;text-align:right;font-size:7pt;padding-top:4.5mm;height:auto;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8379Data/JointReturnAmtGrp/EstimatedTaxPaymentAmt"/>
										</xsl:call-template>
									</span>
								</div>
								<div class="styIRS8379CleanDiv" style="width:15%;height:100%;border-left-width:1px;padding-right:3px;padding-top:0px;">
									<span style="width:100%;text-align:right;font-size:7pt;padding-top:4.5mm;height:auto;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8379Data/InjuredSpouseAllocatedAmtGrp/EstimatedTaxPaymentAmt"/>
										</xsl:call-template>
									</span>
								</div>
								<div class="styIRS8379CleanDiv" style="width:15%;height:100%;border-left-width:1px;padding-right:3px;padding-top:0px;">
									<span style="width:100%;text-align:right;font-size:7pt;padding-top:4.5mm;height:auto;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8379Data/OtherSpouseAllocatedAmtGrp/EstimatedTaxPaymentAmt"/>
										</xsl:call-template>
									</span>
								</div>
							</div>
						</div>
					</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part IV																								 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;" class="styBB">
						<!-- Content -->
						<div class="styPartName" style="width:15mm;">Part IV</div>
						<div class="styPartDesc" style="padding-left:3mm;font-size:8.5pt;">
							Signature.
							<span class="styNormalText"> Complete this part only if you are filing Form 8379 by itself and not with your tax return.</span>
						</div>
					</div>
					<!-- Body -->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS8379LineItem">
							<div class="styIRS8379LNDesc" style="width:100%;padding-left:0px;font-size:7.5pt;">
								Under penalties of perjury, I declare that I have examined this form and any accompanying schedules or statements and to the best of my knowledge<br/>
								and belief, they are true, correct, and complete. Declaration of preparer (other than taxpayer) is based on all information of which preparer has any<br/>
								knowledge.
							</div>
						</div>
						<div class="styIRS8379LineItem" style="border-bottom-width:1px;border-top-width:1px;border-color:black;height:7mm;">
							<div class="styIRS8379CleanDiv" style="padding-top:0px;width:22.75mm;height:100%;">
								<span style="width:100%;text-align:center;font-size:6pt;">
									Keep a copy of<br/>this form for<br/>your records
								</span>
							</div>
							<div class="styIRS8379LNDesc" style="padding-top:0px;width:93.3mm;height:100%;border-left-width:1px;font-size:6pt;border-color:black;padding-left:3px;">
								Injured spouse’s signature<br/>
								<span style="width:100%;text-align:left;">
									<xsl:call-template name="PopulatePin">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/SpouseSignature"/>
										<xsl:with-param name="BackupName">$RtnHdrDataSpouseSignature</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
							<div class="styIRS8379LNDesc" style="padding-top:0px;width:18mm;height:100%;border-left-width:1px;font-size:6pt;border-color:black;padding-left:3px;">
								Date<br/>
								<span style="width:100%;text-align:left;">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/SpouseSignatureDate"/>
										<xsl:with-param name="BackupName">$RtnHdrDataSpouseSignatureDate</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
							<div class="styIRS8379LNDesc" style="padding-top:0px;width:51mm;height:100%;border-left-width:1px;font-size:6pt;border-color:black;padding-left:3px;">
								Phone number (optional)<br/>
							</div>
						</div>
						<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
						<!-- Paid Preparer Section																					 -->
						<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
						<div class="styTBB" style="width:187mm;font-size:6pt;">
							<div style="width:22mm;padding-top:4mm;float:left;clear:none;">
								<span class="styMainTitle" style="font-size:11pt;">
									Paid
									Preparer
									Use Only
								</span>
							</div>
							<div style="width:164mm;float:right;clear:none;border-width:0px 0px 0px 1px; border-color:black;border-style:solid;">
								<div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
									<div class="styLNDesc" style="height:6mm;width:46.8mm;padding-top:0mm;border-right:1 solid black;padding-left:3px;">
										Print/Type preparer's name<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformation/PreparerPersonName"/>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerPersonName</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styLNDesc" style="height:6mm;width:46.5mm;padding-top:0mm;border-right:1 solid black;padding-left:1mm;">
										Preparer's signature
									</div>
									<div class="styLNDesc" style="height:6mm;width:15mm;border-right:1 solid black;padding-top:0mm;padding-left:1mm;">Date <br/>
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationDateSigned</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styLNDesc" style="height:6mm;width:18mm;border-right:1 solid black;padding-top:.5mm;padding-bottom:0mm;padding-left:1mm;">Check 
										<label>
										<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformation/SelfEmployed"/>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployed</xsl:with-param>
											</xsl:call-template>
											<input class="styCkbox" type="checkbox" style="width:4mm;">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformation/SelfEmployed"/>
													<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployed</xsl:with-param>
												</xsl:call-template>
											</input>
											<span style="width:4px;"/>if<br/>self-employed
									</label>
									</div>
									<div class="styLNDesc" style="height:6mm;width:16mm;padding-top:0mm;padding-left:1mm;">PTIN
										<br/>
										<xsl:if test="$RtnHdrData/PaidPreparerInformation/PreparerSSN">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">PreparerSSN</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerSSN</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/PaidPreparerInformation/PTIN">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">PTIN</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPTIN</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/PaidPreparerInformation/STIN">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">STIN</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSTIN</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</div>
								</div>
								<div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
									<div class="styLNDesc" style="height:6mm;width:108.5mm;border-right:1 solid black;">
										<span class="styGenericDiv" style="padding-left:3px;">Firm's name 
									<span style="width:2.2mm;"/>
											<img src="{$ImagePath}/8379_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>
											<span style="width:4px;"/>
										</span>
										<div class="styGenericDiv" style="padding-right:.5mm;">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerBusinessName1</xsl:with-param>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerBusinessName2</xsl:with-param>
											</xsl:call-template>
										</div>
									</div>
									<div class="styLNDesc" style="height:6mm;width:32mm;padding-left:1mm;">Firm's EIN
								<img src="{$ImagePath}/8379_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>
										<span style="width:4px;"/>
										<xsl:if test="$RtnHdrData/PaidPreparerInformation/PreparerFirmIDNumber">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">PreparerFirmIDNumber</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerFirmIDNumber</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/PaidPreparerInformation/MissingEINReason">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">MissingEINReason</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationMissingEINReason</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</div>
								</div>
								<div style="width:164mm;float:left;clear:none;">
									<div class="styLNDesc" style="width:108.5mm;border-right:1 solid black;">
										<div class="styGenericDiv" style="padding-right:.5mm;padding-left:3px;">Firm's address 
											<img src="{$ImagePath}/8379_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>
										</div>
										<div class="styGenericDiv" style="padding-right:.5mm;">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationAddressLine1</xsl:with-param>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationAddressLine2</xsl:with-param>
											</xsl:call-template>
											<br/>
											<xsl:if test="$RtnHdrData/PaidPreparerInformation/PreparerUSAddress">
												<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
													<xsl:with-param name="TargetNode">City</xsl:with-param>
													<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressCity</xsl:with-param>
												</xsl:call-template>,
											<span style="width:2px;"/>
												<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
													<xsl:with-param name="TargetNode">State</xsl:with-param>
													<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressState</xsl:with-param>
												</xsl:call-template>,
											<span style="width:2px;"/>
												<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
													<xsl:with-param name="TargetNode">ZIPCode</xsl:with-param>
													<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressZip</xsl:with-param>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="$RtnHdrData/PaidPreparerInformation/PreparerForeignAddress">
												<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
													<xsl:with-param name="TargetNode">City</xsl:with-param>
													<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignAddressCity</xsl:with-param>
												</xsl:call-template>,
											<span style="width:2px;"/>
												<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
													<xsl:with-param name="TargetNode">ProvinceOrState</xsl:with-param>
													<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignProvinceOrState</xsl:with-param>
												</xsl:call-template>,
											<span style="width:2px;"/>
												<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
													<xsl:with-param name="TargetNode">PostalCode</xsl:with-param>
													<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignPostalCode</xsl:with-param>
												</xsl:call-template>,
											<span style="width:2px;"/>
												<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
													<xsl:with-param name="TargetNode">Country</xsl:with-param>
													<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignCountry</xsl:with-param>
												</xsl:call-template>
											</xsl:if>
										</div>
									</div>
									<div class="styLNDesc" style="width:32mm;padding-left:1mm;"> Phone no. 
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">Phone</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPhone</xsl:with-param>
										</xsl:call-template>
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignPhone</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:right;">
							<span style="width:50px;"/>  
								Form 
							<span class="styBoldText" style="font-size:8pt;">8379</span> (Rev. 12-2012)
						</div>
					</div>
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData" style="padding-top:5mm;">
						<div class="styLeftOverTitle">
							Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<xsl:variable name="TableWidth">100</xsl:variable>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form8379Data"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
