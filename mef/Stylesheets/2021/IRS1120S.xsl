<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1120SStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!-- Defines the stage of the data, e.g. original or latest -->
	<xsl:param name="Form1120SData" select="$RtnDoc/IRS1120S"/>
	<xsl:param name="Form1120SScheduleB" select="$RtnDoc/IRS1120S/IRS1120SScheduleB"/>
	<xsl:param name="Form1120SScheduleK" select="$RtnDoc/IRS1120S/IRS1120SScheduleK"/>
	<xsl:param name="Form1120SScheduleL" select="$RtnDoc/IRS1120S/IRS1120SScheduleL"/>
	<xsl:param name="Form1120SScheduleM1" select="$RtnDoc/IRS1120S/IRS1120SScheduleM1"/>
	<xsl:param name="Form1120SScheduleM2" select="$RtnDoc/IRS1120S/IRS1120SScheduleM2"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form1120SData)"/>
					</xsl:call-template>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set  -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 1120S"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<!--  Updated 05/28/2014 WT: Per UWR 101606/107101 for R9.5_D2   -->
					<!--  Updated 06/14/2014 WT: Per UWR 112660 for R9.5_D3  -->
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1120SStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form1120&#8211;S">
					<xsl:call-template name="DocumentHeader"/>
					<div class="styTBB" style="width:187mm;height:20mm;">
						<div class="styFNBox" style="width:31mm;height:21mm;">
							<div style="padding-top:1mm;">
								Form<span class="styFormNumber">1120-S</span>
								<br/>
								<span style="width:1mm;"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1120SData"/>
								</xsl:call-template>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1120SData/Elec1141110gFlowThruEntStatement"/>
								</xsl:call-template>
								<span style="width:1mm;"/>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Form 1120&#8211;S, Top Left Margin - Section 501d Indicator</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1120SData/@section501dCd"/>
								</xsl:call-template>
								<span style="width:1mm;"/>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Form 1120S, Top Left Margin - Change Annual Accounting Period2 </xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1120SData/@changeAnnualAccountingPeriodCd"/>
								</xsl:call-template>
								<span style="width:1mm;"/>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Form 1120S, Top Left Margin - Section 30191002 Election Ind </xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1120SData/@filedPursuantToSect30191002Cd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Form 1120S, Top Left Margin - Short Period  Reason Ind</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1120SData/@shortPeriodReasonCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Form 1120S, Top Left Margin - Special Condition Description</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1120SData/SpecialConditionDesc"/>
								</xsl:call-template>
							</div>
							<div style="padding-top:0mm;">
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service</span>
							</div>
						</div>
						<div class="styFTBox" style="width:125mm;height:18.75mm;">
							<div class="styMainTitle">U.S. Income Tax Return for an S Corporation</div>
							<div class="styFBT" style="height:5mm;">
								<span>
									<img src="{$ImagePath}/1120S_Bullet_Md.gif" alt="Right Pointing Arrow"/> 
									Do not file this form unless the corporation has filed or is<br/>	attaching  Form 2553 to elect to be an S corporation.
								</span>
								<br/>
								<span style="height:2mm;">
									<img src="{$ImagePath}/1120S_Bullet_Md.gif" alt="Right Pointing Arrow"/>
									Go to 
									<a style="text-decoration:none;color:black;" href="http://www.irs.gov/form1120s" title="Link to IRS.gov">
										<i>www.irs.gov/Form1120S </i>
									</a>
									for instructions and the latest information.
								</span>
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;height:20mm;">
							<div class="styOMB" style="height:auto;">OMB No. 1545-0123</div>
							<div class="styTY" style="height:11mm;padding-top:3mm;">20<span class="styTYColor">21</span>
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						For calendar year 2021<span style="width: 1mm"/>or tax year beginning
						<span style="width: 18mm">
							<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
						</span>
						ending         
						<span style="width: 20mm">
							<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
						</span>
					</div>
					<!-- Left header boxes Start Here -->
					<div class="styBB" style="width:187mm;float:left;clear:left;">
						<div style="width:31mm;height:26mm;float:left;clear:left;">
							<div class="styComType" style="width:31mm;height:auto;">
								<div class="styBoldText" style="height:7mm;width:3mm;float:left;clear:none;">A</div>
								<div style="height:3mm;width:27mm;float:left;">S election effective date </div>
								<div class="styGenericDiv" style="height:4mm;width:26mm;padding-left:7mm;">
									<span class="stySmallText">
										<xsl:call-template name="PopulateMonthDayYear">
											<xsl:with-param name="TargetNode" select="$Form1120SData/ElectionEffectiveDt"/>
										</xsl:call-template>
									</span>
								</div>
							</div>
							<div class="styComType" style="width:31mm;height:auto;border-bottom-width:1px;">
								<div class="styBoldText" style="height:7mm;width:3mm;float:left;clear:none;">B</div>
								<div style="height:7.4mm;width:27.7mm;float:left;">Business activity code number (see instructions)
								</div>
								<xsl:if test="$Form1120SData/PrincipalBusinessActivityCd">
									<div class="styGenericDiv" style="height:4mm;width:27mm;">
										<span class="stySmallText" style="width:27mm;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form1120SData/PrincipalBusinessActivityCd"/>
											</xsl:call-template>
										</span>
									</div>
								</xsl:if>
								<xsl:if test="$Form1120SData/InactivePrincipalBusActyCd">
									<div class="styGenericDiv" style="height:4mm;width:27mm;">
										<span class="stySmallText" style="width:27mm;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form1120SData/InactivePrincipalBusActyCd"/>
											</xsl:call-template>
										</span>
									</div>
								</xsl:if>
							</div>
							<div class="styComType" style="width:31mm;height:7mm;border-bottom:0px;">
								<div class="styBoldText" style="height:5mm;width:3mm;float:left;clear:none;">C</div>
								<div class="styGenericDiv" style="float:left;clear:none;">
								Check if Sch. M-3 <span style="width:1px;"/>
									<br/>attached
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form1120SData/ScheduleM3AttachedInd"/>
											<xsl:with-param name="BackupName">SchM3AttachedLabel</xsl:with-param>
										</xsl:call-template>
									</label>
									<span style="width:2px;float:left;"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120SData/ScheduleM3AttachedInd"/>
									</xsl:call-template>
								</div>
								<input type="checkbox" alt="SchM3 Attached Indicator" class="styCkbox" style="padding-left:10mm;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1120SData/ScheduleM3AttachedInd"/>
										<xsl:with-param name="BackupName">SchM3AttachedIndicator</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
						</div>
						<div class="styLblNameAddr" style="width:109mm;height:32mm;">
							<div class="styUseLbl" style="text-align:center;width:12mm;height:30mm;border-right-width:0px;font-size:7pt;font-weight:bold;padding-top:10mm;">
							TYPE<br/>
							OR<br/>
							PRINT
							</div>
							<div class="styNameAddr" style="width:95.4mm;height:11mm;border-left-width:1px;">
								Name<br/>
								<span class="stySmallText" style="padding-left:2mm;border-left-width:1px;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">InCareOfName</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
							<div class="styNameAddr" style="width:95.4mm;height:8mm;border-left-width:1px;">
								Number, street, and room or suite no. If a P.O. box, see instructions.<br/>
								<span class="stySmallText" style="padding-left:2mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
									</xsl:call-template>
								</span>
								<br/>
							</div>
							<div class="styNameAddr" style="border-bottom-width:0px;width:95.4mm;height:11.5mm;border-left-width:1px;">
							 City or town, state or province, country, and ZIP or foreign postal code<br/>
								<span class="stySmallText" style="width:90mm;padding-left:2mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
										<xsl:with-param name="MainForm">true</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- Since this is a main form, we must check for and display an updated EIN. 
							To do this, we use the EINChanged parameter when calling PopulateReturnHeaderFiler.-->
						<div class="styEINDateAssets" style="width:46.75mm;height:8mm;">
							<span class="styBoldText">D Employer identification number</span>
							<br/>
							<span class="styEINFld">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="EINChanged">true</xsl:with-param>
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<div class="styEINDateAssets" style="width:46.75mm;height:10mm;">
							<span class="styBoldText" style="padding-right:1mm;">E </span>Date incorporated<br/>
							<span class="styEINFld" style="text-align:center;width:34mm;padding-top:3mm;padding-left:1mm;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$Form1120SData/IncorporationDt"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styEINDateAssets" style="width:46mm;height:5mm;border-bottom-width:0px;">
							<span class="styBoldText" style="padding-right:1mm;">F </span>Total assets (see instructions)
							<br/>
							<br/>
							<br/>
							<br/>
							<span style="font-size:7pt;width:44mm;text-align:right;">$
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120SData/TotalAssetsAmt"/>
								</xsl:call-template>
							</span>
						</div>
						<br/>
					</div>
					<div style="width:187mm;">
						<div class="styBoldText" style="width:3mm;float:left;clear:none;padding-top:1mm;">G</div>
						Is the corporation electing to be an S corporation beginning with this tax year? See instructions.
						<input class="styCkbox" type="checkbox" alt="First Year S Corporation Yes Indicator" name="Checkbox" id="dummyidyes" style="width:3mm;">
							<xsl:call-template name="PopulateYesCheckbox">
								<xsl:with-param name="TargetNode" select="$Form1120SData/FirstYearSCorporationInd"/>
								<xsl:with-param name="BackupName">FirstYearSCorporationYesIndicator</xsl:with-param>
							</xsl:call-template>
						</input>
						<label for="dummyidyes">
							<xsl:call-template name="PopulateLabelYes">
								<xsl:with-param name="TargetNode" select="$Form1120SData/FirstYearSCorporationInd"/>
								<xsl:with-param name="BackupName">FirstYearSCorporationIndicatorYesLabel</xsl:with-param>
							</xsl:call-template>
							Yes
						</label>
						<input class="styCkbox" type="checkbox" alt="First Year S Corporation No Indicator" name="Checkbox" id="dummyidno" style="width:3mm;">
							<xsl:call-template name="PopulateNoCheckbox">
								<xsl:with-param name="TargetNode" select="Data/FirstYearSCorporationInd"/>
								<xsl:with-param name="BackupName">FirstYearSCorporationNoIndicator</xsl:with-param>
							</xsl:call-template>
						</input>
						<label for="dummyidno">
							<xsl:call-template name="PopulateLabelNo">
								<xsl:with-param name="TargetNode" select="$Form1120SData/FirstYearSCorporationInd"/>
								<xsl:with-param name="BackupName">FirstYearSCorporationIndicatorNoLabel</xsl:with-param>
							</xsl:call-template>
							No
						</label>
					</div>
					<!-- Per Schema a choice of Amended or superseded Return Indicator 4 and 5 or 4, 5, and 6-->
					<!-- NOTE: Check box 6 is an electronic check box only, this box does not display on Paper format-->
					<div class="styBB" style="width:187mm;">
						<div class="styBoldText" style="width:4mm;float:left;clear:none;padding-top:1mm;">H</div>
						<div class="styGenericDiv" style="width:182mm; ">
							Check if: 
						    <span class="styBoldText" style="padding-right:1mm; font-size:6pt;">(1)</span>
							<input type="checkbox" alt="Final Return Indicator" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120SData/FinalReturnInd"/>
									<xsl:with-param name="BackupName">FinalReturnIndicator</xsl:with-param>
								</xsl:call-template>
							</input>
							<label style="font-size:6pt; padding-right:1mm;">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120SData/FinalReturnInd"/>
									<xsl:with-param name="BackupName">FinalReturnLabel</xsl:with-param>
								</xsl:call-template>
								Final return          
							</label>
							<span class="styBoldText" style="padding-right:1mm; font-size:6pt;">(2)</span>
							<input type="checkbox" alt="Name Change Indicator" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120SData/NameChangeInd"/>
									<xsl:with-param name="BackupName">NameChangeIndicator</xsl:with-param>
								</xsl:call-template>
							</input>
							<label style="font-size:6pt; padding-right:1mm;">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120SData/NameChangeInd"/>
									<xsl:with-param name="BackupName">NameChangeLabel</xsl:with-param>
								</xsl:call-template>
								Name change          
							</label>
							<span class="styBoldText" style="padding-right:1mm; font-size:6pt;">(3)</span>
							<input type="checkbox" alt="Address Change Indicator" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120SData/AddressChangeInd"/>
									<xsl:with-param name="BackupName">AddressChangeIndicator</xsl:with-param>
								</xsl:call-template>
							</input>
							<label style="font-size:6pt; padding-right:1mm;">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120SData/AddressChangeInd"/>
									<xsl:with-param name="BackupName">AddressChangeLabel</xsl:with-param>
								</xsl:call-template>
								Address change            
							</label>
							<span class="styBoldText" style="padding-right:1mm; font-size:6pt;">(4)</span>
							<input type="checkbox" alt="Amended Return Indicator" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120SData/AmendedReturnInd"/>
									<xsl:with-param name="BackupName">AmendedReturnIndicator</xsl:with-param>
								</xsl:call-template>
							</input>
							<label style="font-size:6pt;">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120SData/AmendedReturnInd"/>
									<xsl:with-param name="BackupName">AmendedReturnLabel</xsl:with-param>
								</xsl:call-template>
										Amended return           
									</label>
							<span style="width:2px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120SData/AmendedReturnInd"/>
							</xsl:call-template>
							<span class="styBoldText" style="padding-left:2mm;padding-right:1mm; font-size:6pt;">(5)</span>
							<input type="checkbox" alt="Election Termination " class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120SData/ElectionTerminationRvkInd"/>
									<xsl:with-param name="BackupName">ElectionTerminationRevocationIndicator</xsl:with-param>
								</xsl:call-template>
							</input>
							<label style="font-size:6pt; padding-right:2mm;">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120SData/ElectionTerminationRvkInd"/>
									<xsl:with-param name="BackupName">ElectionTerminationRevocationLabel</xsl:with-param>
								</xsl:call-template>
										S election termination          
									</label>
							<span style="width:17mm;"/>
							<span class="styBoldText" style="padding-right:1mm; font-size:6pt;">(6)</span>
							<input type="checkbox" alt="Superseded Return Indicator" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120SData/SupersededReturnInd"/>
									<xsl:with-param name="BackupName">SupersededReturnIndicator</xsl:with-param>
								</xsl:call-template>
							</input>
							<label style="font-size:6pt; padding-right:2mm;">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120SData/SupersededReturnInd"/>
									<xsl:with-param name="BackupName">SupersededReturnLabel</xsl:with-param>
								</xsl:call-template>
										Superseded Return            
									</label>
						</div>
						<!-- line I -->
						<div class="styGenericDiv" style="width:182mm; ">
							<div class="styBoldText" style="width:4mm;float:left;clear:none;">I</div>
							<div class="styGenericDiv" style="width:138mm;">
								Enter the number of shareholders who were shareholders during any part of the tax year 
								<span style="width:2px;"/>
								<!-- Form to Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1120SData/ShareholderCnt"/>
								</xsl:call-template>
								<span style="float:right;padding-right:0mm;">
									<span class="styDotLn" style="padding-right:1mm;">....</span>
									<span style="padding-right:1mm;">
										<img src="{$ImagePath}/1120S_Bullet_Md.gif" alt="Right Pointing Arrow"/>
									</span>
								</span>
							</div>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1120SData/ShareholderCnt"/>
							</xsl:call-template>
						</div>
						<br/>
						<div class="styBB" style="width:187mm;font size:7pt">
							<div class="styBoldText" style="width:4mm;float:left;clear:none;padding-top:1mm;">J</div>
							<div class="styGenericDiv" style="width:182mm; ">
							Check if corporation:
						    <span class="styBoldText" style="padding-right:1mm; font-size:7pt;">(1)</span>
								<input type="checkbox" alt="Sect465 At Risk Aggregated Acty Indicator" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1120SData/Sect465AtRiskAggregatedActyInd"/>
										<xsl:with-param name="BackupName">Sect465AtRiskAggregatedActyIndicator</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-size:6pt; padding-right:2mm;">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1120SData/Sect465AtRiskAggregatedActyInd"/>
										<xsl:with-param name="BackupName">Sect465AtRiskAggregatedActyILabel</xsl:with-param>
									</xsl:call-template>
								Aggregated activities for section 465 at&#8211;risk purposes          
							</label>
								<span class="styBoldText" style="padding-right:1mm; font-size:7pt;">(2)</span>
								<input type="checkbox" alt="Sect469 PAL Grouped Acty Indicator" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1120SData/Sect469PALGroupedActyInd"/>
										<xsl:with-param name="BackupName">Sect469PALGroupedActyIndicator</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-size:6pt; padding-right:2mm;">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1120SData/Sect469PALGroupedActyInd"/>
										<xsl:with-param name="BackupName">Sect469PALGroupedActyLabel</xsl:with-param>
									</xsl:call-template>
								Grouped activities for section 469 passive activity purposes       
							</label>
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<span class="styBoldText" style="font-style:normal">Caution.</span>
						Include <span class="styBoldText">only</span> trade or business income and
						expenses on lines 1a through 21. See the instructions for more
						information.
					</div>
					<!-- Income vertical image -->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS1120SVTImageBox" style="height:36.5mm;padding-top:12mm;">
							<img src="{$ImagePath}/1120S_Income.gif" alt="Vertical Income"/>
						</div>
						<!-- Line 1a -->
						<div class="styGenericDiv" style="width:181mm;height:4.5mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4.5mm;">1a</div>
								<div class="styLNDesc" style="width:92mm;height:4.5mm;">
									<span style="float:left;padding-left:1mm;">Gross receipts or sales 
										<span style="width:2px;"/>
										<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120SData/GrossReceiptsOrSalesAmt"/>
										</xsl:call-template>
									</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">.............</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">1a</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SData/GrossReceiptsOrSalesAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px;"/>
								<div class="styLNAmountBox" style="width:31mm;height:4.5mm;border-bottom-width:0px;"/>
							</div>
						</div>
						<!-- Line 1b -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox" style="padding-left:6mm">b</div>
								<div class="styLNDesc" style="width:92mm;">
									<span style="float:left;padding-left:1mm;">Returns and allowances
									</span>
									<div class="styDotLn" style="float:right;padding-right:1mm;">..............</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox">1b</div>
								<div class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SData/ReturnsAndAllowancesAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px;"/>
								<div class="styLNAmountBox" style="width:31mm;height:4.5mm;border-bottom-width:0px;"/>
							</div>
						</div>
						<!-- Line 1c -->
						<div style="width:181mm;float:right;">
							<div style="float:left;clear;none;">
								<div class="styLNLeftNumBox" style="padding-left:5mm">c</div>
								<div class="styLNDesc" style="width:133mm;height:4mm;">
									<span style="float:left">
										Balance.  Subtract line 1b from line 1a
									</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">.....................</span>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;">1c</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SData/NetGrossReceiptsOrSalesAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- Line 2 -->
						<div style="width:181mm;float:right;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.75mm;">2</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">
									Cost of goods sold (attach Form 1125-A)
								<span style="width:2px;"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120SData/CostOfGoodsSoldAmt"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">..................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">2</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120SData/CostOfGoodsSoldAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 3 -->
						<div style="width:181mm;float:right;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.75mm;">3</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">
									Gross profit. Subtract line 2 from line 1c
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">....................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">3</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120SData/GrossProfitAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 4 -->
						<div style="width:181mm;float:right;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.75mm;">4</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">
									Net gain (loss) from Form 4797, line 17 (attach Form 4797)
									<span style="width:2px;"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120SData/TotalOrdinaryGainLossAmt"/>
									</xsl:call-template>
									<span style="width:1mm;"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 4 - Form 4684 Indicator</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1120SData/TotalOrdinaryGainLossAmt/@form4684Cd"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">4</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120SData/TotalOrdinaryGainLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 5 -->
						<div style="width:181mm;float:right;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.75mm;">5</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">
									Other income (loss) (see instructions&#8212;attach statement)
									<span style="width:2px;"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120SData/OtherIncomeLossAmt"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 5 - otherIncomeLossItem</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1120SData/OtherIncomeLossAmt/@otherIncomeLossDesc"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">5</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120SData/OtherIncomeLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 6 -->
						<div style="width:181mm;float:right;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.75mm;">6</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">
									<span class="styBoldText">Total income (loss).</span>
									Add lines 3 through 5
									</span>
								<span style="float:right;padding-right:0mm;">
									<span class="styDotLn" style="padding-right:2.2mm;">.................</span>
									<span style="padding-right:2mm;">
										<img src="{$ImagePath}/1120S_Bullet_Md.gif" alt="Right Pointing Arrow"/>
									</span>
								</span>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:5mm;">6</div>
							<div class="styLNAmountBoxNBB" style="height:5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120SData/TotalIncomeOrLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Deductions vertical image -->
					<div class="styBB" style="width:187mm;height:auto">
						<div class="styIRS1120SVTImageBox" style="height:68mm;padding-top:6mm;">
							<img src="{$ImagePath}/1120S_DeductionsLong_2.gif" alt="Deductions (see instructions for limitations) section"/>
						</div>
						<!-- Line 7 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.75mm;">7</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">
									Compensation of officers (see instructions&#8212;attach Form 1125&#8211;E) 
									<span style="width:2px;"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120SData/OfficersCompensationAmt"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">7</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120SData/OfficersCompensationAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 8 -->
						<div style="width:181mm;float:right;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.75mm;">8</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">
									Salaries and wages (less employment credits)
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">..................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">8</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120SData/SalariesAndWagesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 9 -->
						<div style="width:181mm;float:right;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.75mm;">9</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">Repairs and maintenance </span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">........................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">9</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120SData/RepairsAndMaintenanceAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 10 -->
						<div style="width:181mm;float:right;">
							<div class="styLNLeftNumBox" style="height:4mm;">10</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">Bad debts </span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.............................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">10</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120SData/BadDebtExpenseAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 11 -->
						<div style="width:181mm;float:right;">
							<div class="styLNLeftNumBox" style="height:4mm;">11</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">Rents <span style="width:2px;"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120SData/TotalRentOrLeaseExpenseAmt"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.............................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">11</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120SData/TotalRentOrLeaseExpenseAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 12 -->
						<div style="width:181mm;float:right;">
							<div class="styLNLeftNumBox" style="height:4mm;">12</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">Taxes and licenses </span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">..........................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">12</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120SData/TaxesAndLicensesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 13 -->
						<div style="width:181mm;float:right;">
							<div class="styLNLeftNumBox" style="height:4mm;">13</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">Interest (see instructions) <span style="width:2px;"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120SData/InterestDeductionAmt"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.......................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">13</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120SData/InterestDeductionAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 14 -->
						<div style="width:181mm;float:right;">
							<div class="styLNLeftLtrBox" style="height:4.5mm;padding-left:1mm;">14</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">Depreciation not claimed on Form 1125&#8211;A or elsewhere on return (attach Form 4562)
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120SData/DepreciationAmt"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">14</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120SData/DepreciationAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 15 -->
						<div style="width:181mm;float:right;">
							<div class="styLNLeftNumBox" style="height:4mm;">15</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">Depletion
									<span class="styBoldText">(Do not deduct oil and gas depletion.)</span>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120SData/DepletionAmt"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">15</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120SData/DepletionAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 16 -->
						<div style="width:181mm;float:right;">
							<div class="styLNLeftNumBox" style="height:4mm;">16</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left;">Advertising </span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">............................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">16</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120SData/AdvertisingAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 17 -->
						<div style="width:181mm;float:right;">
							<div class="styLNLeftNumBox" style="height:4mm;">17</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">Pension, profit-sharing, etc., plans </span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">......................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">17</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120SData/PensionProfitSharingPlansAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line1 8 -->
						<div style="width:181mm;float:right;">
							<div class="styLNLeftNumBox" style="height:4mm;">18</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">Employee benefit programs </span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">........................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">18</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120SData/EmployeeBenefitProgramAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 19 -->
						<div style="width:181mm;float:right;">
							<div class="styLNLeftNumBox" style="height:4mm;">19</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">Other deductions (attach statement) <span style="width:2px;"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120SData/OtherDeductionsAmt"/>
									</xsl:call-template>
									<!--Dotted Line-->
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">....................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">19</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120SData/OtherDeductionsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 20 -->
						<div style="width:181mm;float:right;">
							<div class="styLNLeftNumBox" style="height:4mm;">20</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">
									<span class="styBoldText">Total deductions.</span>
									Add lines 7 through 19
									</span>
								<span style="float:right;padding-right:0mm;">
									<span class="styDotLn" style="padding-right:2mm;">.................</span>
									<span style="padding-right:2mm;">
										<img src="{$ImagePath}/1120S_Bullet_Md.gif" alt="Mid Size Right Pointing Arrow"/>
									</span>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">20</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120SData/TotalDeductionAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 21 -->
						<div style="width:181mm;float:right;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-top:0mm;padding-bottom:0px">21</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;padding-top:0mm;padding-bottom:0px">
								<span style="float:left">
									<b>Ordinary business income (loss). </b>Subtract line 20 from line 6
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
							</div>
							<div class="styLNRightNumBoxNBB" style="padding-top:1mm;height:5mm;">21</div>
							<div class="styLNAmountBoxNBB" style="padding-top:1mm;height:5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120SData/OrdinaryBusinessIncomeLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Tax and Payment Section -->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS1120SVTImageBox" style="height:53mm;padding-top:11mm;">
							<img src="{$ImagePath}/1120S_TaxAndPayments.gif" alt="Tax and Payments section"/>
						</div>
						<!-- Line 22a -->
						<div class="styGenericDiv" style="width:181mm;border-top-width:1px">
							<div style="float:left;clear:none;">
								<div class="styLNLeftLtrBox" style="padding-left: 2.25mm;;border-top-width:1px">22a</div>
								<div class="styLNDesc" style="width:94mm;padding-left:1mm;;border-top-width:1px">
									Excess net passive income or LIFO recapture tax (see
									<br/>
									<span style="float:left">
										instructions)
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 22a - LIFO Tax Indicator</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1120SData/ExcessNetPassiveIncmLIFOTxAmt/@lIFOTaxCd"/>
											<xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 22a - LIFO Tax Amount</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1120SData/ExcessNetPassiveIncmLIFOTxAmt/@lIFOTaxAmt"/>
											<xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
										</xsl:call-template>
										<span style="width:6px;"/>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120SData/ExcessNetPassiveIncmLIFOTxAmt"/>
										</xsl:call-template>
									</span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">................</span>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;;border-top-width:0px">22a</div>
								<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;;border-top-width:0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SData/ExcessNetPassiveIncmLIFOTxAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBox" style="height:8mm;background-color:lightgrey;border-bottom-width:0px;"/>
								<div class="styLNAmountBox" style="width:31mm;height:8mm;border-bottom-width:0px;"/>
							</div>
						</div>
						<!-- Line 22b -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftLtrBox" style="padding-left:5mm">b</div>
								<div class="styLNDesc" style="width:94mm;padding-left:1mm;">
									<span style="float:left;">Tax from Schedule D (Form 1120&#8211;S)
									<span style="width:2px;"/>
										<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120SData/BuiltInGainsTaxAmt"/>
										</xsl:call-template>
									</span>
									<!--Dotted Line -->
									<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox">22b</div>
								<div class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SData/BuiltInGainsTaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px;"/>
								<div class="styLNAmountBox" style="width:31mm;height:4.5mm;border-bottom-width:0px;"/>
							</div>
						</div>
						<!-- Line 22c -->
						<div style="width:181mm;float:right;">
							<div class="styLNLeftLtrBox" style="height:4.5mm;padding-left:4.25mm;">c</div>
							<div class="styLNDesc" style="width:133mm;height:4.5mm;padding-bottom:0;padding-top:1mm;">
								<span style="float:left">
									Add lines 22a and 22b (see instructions for additional taxes)
									<span style="width:2px;"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120SData/TotalTaxAmt"/>
									</xsl:call-template>
									<span style="width:2mm;"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 22c - Tax From Form 4255 Indicator</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1120SData/TotalTaxAmt/@taxFromForm4255Cd"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 22c - Tax From Form 4255 Amount</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1120SData/TotalTaxAmt/@taxFromForm4255Amt"/>
										<xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 22c - LIFO Tax Indicator</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1120SData/TotalTaxAmt/@lIFOTaxCd"/>
										<xsl:with-param name="Style">padding-left:6mm;</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 22c - LIFO Tax Amount</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1120SData/TotalTaxAmt/@lIFOTaxAmt"/>
										<xsl:with-param name="Style">padding-left:9mm;</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 22c - From Form 8697 Indicator</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1120SData/TotalTaxAmt/@form8697Cd"/>
										<xsl:with-param name="Style">padding-left:12mm;</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 22c - From Form 8697 Amount</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1120SData/TotalTaxAmt/@form8697Amt"/>
										<xsl:with-param name="Style">padding-left:15mm;</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 22c - From Form 8866 Indicator</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1120SData/TotalTaxAmt/@form8866Cd"/>
										<xsl:with-param name="Style">padding-left:18mm;</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 22c - From Form 8866 Amount</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1120SData/TotalTaxAmt/@form8866Amt"/>
										<xsl:with-param name="Style">padding-left:21mm;</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 22c - Bipartisan Budget Act Imputed Underpayment Indicator</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1120SData/TotalTaxAmt/@bBAImputeUnderpaymentCd"/>
										<xsl:with-param name="Style">padding-left:18mm;</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 22c - Bipartisan Budget Act Imputed Underpayment Amount</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1120SData/TotalTaxAmt/@bBAImputeUnderpaymentAmt"/>
										<xsl:with-param name="Style">padding-left:21mm;</xsl:with-param>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">22c</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120SData/TotalTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 23a -->
						<div class="styGenericDiv" style="width:181mm;height:4mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftLtrBox" style="padding-left: 2.25mm;height:4mm;">23a</div>
								<div class="styLNDesc" style="width:94mm;padding-left:1mm;height:4mm;">
									2021 estimated tax payments and 2020 overpayment credited to 2021 
								</div>
							</div>
							<div style="float:right;clear:none;height:4mm;">
								<div class="styLNRightNumBox" style="height:4mm;padding-top:0mm;">23a</div>
								<div class="styLNAmountBox" style="height:4mm;padding-top:0mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SData/TotOvpmtCrAndEstTxPaymentsAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBox" style="height:4mm;background-color:lightgrey;border-bottom-width:0px;"/>
								<div class="styLNAmountBox" style="width:31mm;height:4mm;border-bottom-width:0px;"/>
							</div>
						</div>
						<!-- Line 23b -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftLtrBox" style="padding-left:5mm">b</div>
								<div class="styLNDesc" style="width:94mm;padding-left:1mm;">
									<span style="float:left;">Tax deposited with Form 7004
									<span style="width:2px;"/>
									</span>
									<!--Dotted Line -->
									<span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">23b</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SData/TaxPaidForm7004Amt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px;"/>
								<div class="styLNAmountBox" style="width:31mm;height:4.5mm;border-bottom-width:0px;"/>
							</div>
						</div>
						<!-- Line 23c Begin-->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftLtrBox" style="padding-left:5mm">c</div>
								<div class="styLNDesc" style="width:94mm;padding-left:1mm;">
									<span style="float:left;">Credit for federal tax paid on fuels (attach Form 4136)
										<span style="width:2px;"/>
										<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120SData/TotalFuelTaxCreditAmt"/>
										</xsl:call-template>
									</span>
									<!--Dotted Line -->
									<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">23c</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SData/TotalFuelTaxCreditAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px;"/>
								<div class="styLNAmountBox" style="width:31mm;height:4.5mm;border-bottom-width:0px;"/>
							</div>
						</div>
						<!-- Line 23c End-->
						<!-- line 23d Begin -->
						<div style="width:181mm;float:right;">
							<div class="styLNLeftLtrBox" style="height:4.5mm;padding-left:4.25mm;">d</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">Add lines 23a through 23c							
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 23d - Beneficiary Of Trust Indicator</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1120SData/TotalPaymentsAmt/@beneficiaryTrustCd"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 23d - Beneficiary Of Trust Amount</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1120SData/TotalPaymentsAmt/@beneficiaryTrustAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
									<!--Dotted Line-->
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">......................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">23d</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120SData/TotalPaymentsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line 23d End -->
						<!-- Line 24 -->
						<div style="width:181mm;float:right;">
							<div class="styLNLeftNumBox" style="height:4mm;">24</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left;">Estimated tax penalty (see instructions).
									Check if Form 2220 is attached
											<!-- Form to Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120SData/Form2220AttachedInd"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">....
										<img src="{$ImagePath}/1120S_Bullet_Md.gif" alt="Right Pointing Arrow"/>
									<span style="width:4mm;"/>
									<input type="checkbox" alt="Form2220 Attached Indicator" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form1120SData/Form2220AttachedInd"/>
											<xsl:with-param name="BackupName">Form2220AttachedIndicator</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="font-size:6pt; padding-right:2mm;">
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form1120SData/Form2220AttachedInd"/>
											<xsl:with-param name="BackupName">Form2220AttachedLabel</xsl:with-param>
										</xsl:call-template>
									</label>
									<span style="width:2mm;"/>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">24</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120SData/EsPenaltyAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 25 -->
						<div style="width:181mm;float:right;">
							<div class="styLNLeftNumBox" style="height:4mm;">25</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">
									<span class="styBoldText">Amount owed.</span> If line 23d is smaller than the total of lines 22c and 24, enter amount owed 	</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
							</div>
							<!-- line 25 -->
							<div class="styLNRightNumBox" style="height:4.5mm;">25</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120SData/BalanceDueAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;">
							<div class="styLNLeftNumBox" style="height:4.5mm">26</div>
							<div class="styLNDesc" style="width:133mm;height:4.5mm">
								<span style="float:left">
									<span class="styBoldText">Overpayment.</span> 
									If line 23d is larger than the total of lines 22c and 24, enter amount overpaid
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">26</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120SData/OverpaymentSection/OverpaymentAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--EXCEPTION: Right column line number and amount is misalign due to IE limitation.
							To get the line to display on one line in both browser display and print out developer and customer agree to have a hair line misalignment to achieve this result -->
						<div style="width:181mm;float:right">
							<div class="styLNLeftNumBox">27</div>
							<div class="styLNDesc" style="width:80.0mm;">
								Enter amount of line 26
								<span class="styBoldText">Credited to 2022 estimated tax</span>
								<span style="width:3px;"/>
								<img src="{$ImagePath}/1120S_Bullet_Md.gif" alt="Right Pointing Arrow"/>
							</div>
							<div class="styLNAmountBoxNBB" style="width:25mm;border-right-width:1px;border-left-width:0px;font-size:6pt;height:4.9mm;padding-top:1.5mm;padding-right:2px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120SData/OverpaymentSection/AppliedToEsTaxAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="width:28mm;padding-left:2mm;font-size:6pt;padding-top:1mm;">
								<span class="styBoldText">Refunded</span>
								<span style="width:8px"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1120SData/OverpaymentSection/RefundAmt"/>
								</xsl:call-template>
								<span style="width:8px"/>
								<img src="{$ImagePath}/1120S_Bullet_Md.gif" alt="Right Pointing Arrow"/>
							</div>
							<span style=""/>
							<div class="styLNRightNumBoxNBB" style="height:4.9mm;">27</div>
							<div class="styLNAmountBoxNBB" style="height:4.9mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120SData/OverpaymentSection/RefundAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
					</div>
					<!-- END Page Break and Footer-->
					<!-- BEGIN Signature Section -->
					<!-- the difference between form 1065 and 1120S is a known issue due to choice coding format.1065 code by Div and 1120S code by table  -->
				    <!-- Implementing Signature Section in the table -->
					<table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:6pt;float:none; clear:both;">
						<tr>
							<td rowspan="3" style="width:10mm;font-size: 11pt;font-weight:bold;border-right:1px solid black;;border-bottom:1px solid black;;">Sign Here</td>
							<td colspan="6" style="padding-left:1mm;padding-bottom:1mm;">
							Under penalties of perjury, I declare that I have examined this return, including accompanying schedules and statements, and to the best of my knowledge and belief, it is true, correct, and complete. Declaration of preparer (other than taxpayer) is based on all information of which preparer has any knowledge.
							</td>
						</tr>
						<tr>
							<!-- This information is located in the return header in Business Officer Group -->
							<td rowspan="2" style="border-bottom:1px solid black;padding-left:1mm;">
								<img src="{$ImagePath}/1120S_Bullet_Lg.gif" alt="Large Right Pointing Arrow"/>
							</td>
							<td style="width:52mm;border-right:1px solid black;border-bottom:1px solid black;;vertical-align:bottom;">
								<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">TaxpayerPIN</xsl:with-param>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<td style="width:20mm;border-bottom:1px solid black;vertical-align:bottom;padding-left:.5mm;">
								<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
								</xsl:call-template>
							</td>
							<td rowspan="2" style="border-bottom:1px solid black;padding-left:1mm;">
								<img src="{$ImagePath}/1120S_Bullet_Lg.gif" alt="Large Right Pointing Arrow"/>
							</td>
							<td style="width:60mm;border-bottom:1px solid black;vertical-align:bottom;">
								<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">Title</xsl:with-param>
								</xsl:call-template>
							</td>
							<!-- Authorize Third Party Indicator box -->
							<td rowspan="2" style="width:41mm;border-bottom:1px solid black;padding-bottom:1mm;">
								<div class="styGenericDiv" style="width:2px;"/>
								<div style="border-right:3px solid black;border-left:3px solid black;border-bottom:3px solid black;border-top:3px solid black;float:right;width:41mm;" class="styGenericDiv">		
									&#160;May the IRS discuss this return<br/> &#160;with the preparer shown below <br/>&#160;(see instructions)?
									<input class="styCkbox" type="checkbox" alt="Discuss With Paid Preparer Yes Indicator" name="Checkbox" id="dummyidyes" style="width:3mm;">
										<xsl:call-template name="PopulateReturnHeaderOfficer">
											<xsl:with-param name="TargetNode">AuthorizeThirdPartyYesCheckbox</xsl:with-param>
											<xsl:with-param name="BackupName">DiscussWithPaidPreparerIndicatorYesIndicator</xsl:with-param>
										</xsl:call-template>
									</input>
									<label for="dummyidyes">
										<xsl:call-template name="PopulateReturnHeaderOfficer">
											<xsl:with-param name="TargetNode">AuthorizeThirdPartyYesLabel</xsl:with-param>
											<xsl:with-param name="BackupName">DiscussWithPaidPreparerIndicatorYesLabel</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<input class="styCkbox" type="checkbox" alt="Discuss With Paid Preparer No Indicator" name="Checkbox" id="dummyidno" style="width:2.5mm;">
										<xsl:call-template name="PopulateReturnHeaderOfficer">
											<xsl:with-param name="TargetNode">AuthorizeThirdPartyNoCheckbox</xsl:with-param>
											<xsl:with-param name="BackupName">DiscussWithPaidPreparerNoIndicator</xsl:with-param>
										</xsl:call-template>
									</input>
									<label for="dummyidno">
										<xsl:call-template name="PopulateReturnHeaderOfficer">
											<xsl:with-param name="TargetNode">AuthorizeThirdPartyNoLabel</xsl:with-param>
											<xsl:with-param name="BackupName">DiscussWithPaidPreparerINoLabel</xsl:with-param>
										</xsl:call-template>
										No
									</label>
								</div>
							</td>
						</tr>
						<tr>
							<td style="border-bottom:1px solid black;vertical-align:top;">Signature of officer </td>
							<td style="border-bottom:1px solid black;vertical-align:top;">Date</td>
							<td style="border-bottom:1px solid black;vertical-align:top;">Title</td>
						</tr>
					</table>
					<!-- END Signature Section -->
					<!-- BEGIN PREPARER SIGNATURE SECTION -->
					<!-- paid preparer -->
					<div class="styBB" style="width:187mm;font-size:6pt; float:none; clear:both;">
						<div style="width:22.75mm;padding-top:4mm;float:left;clear:none;">
							<span class="styMainTitle" style="font-size:11pt;">
								Paid
								Preparer
								Use Only
							</span>
						</div>
						<div style="width:164mm;float:left;clear:none;">
							<div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;border-leftright:1px;">
								<div class="styLNDesc" style="height:7.5mm;width:43.8mm;padding-top:0mm;border-right:1px solid black;;border-left:1px solid black;padding-left:1mm;">
								  Print/Type preparer's name<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PreparerPersonGrp/PreparerPersonNm"/>
										<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpPreparerPersonName</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="height:7.5mm;width:46.5mm;padding-top:0mm;border-right:1px solid black;padding-left:1mm;">
								Preparer's signature
							</div>
								<div class="styLNDesc" style="height:7.5mm;width:15mm;border-right:1px solid black;padding-top:0mm;padding-left:1mm;">Date <br/>
									<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">DatePrepared</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpDatePrepared</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="height:7.5mm;width:18.2mm;border-right:1px solid black;padding-top:0mm;padding-bottom:0mm;padding-left:1mm;">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PreparerPersonGrp/SelfEmployedInd"/>
											<xsl:with-param name="BackupName">PreparerPersonSelfEmployedLabel</xsl:with-param>
										</xsl:call-template>
										Check 
										<input class="styCkbox" alt="Preparer Person Self Employed Indicator" type="checkbox" style="width:4mm;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PreparerPersonGrp/SelfEmployedInd"/>
												<xsl:with-param name="BackupName">PreparerPersonSelfEmployedIndicator</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:4px;"/>if<br/>self-employed
									</label>
								</div>
								<!-- This information is located in the return header in Business Officer Group -->
								<div class="styLNDesc" style="height:7.5mm;width:26mm;padding-top:0mm;padding-left:1mm;">PTIN
									<br/>
									<span style="width:6mm;"/>
									<xsl:if test="$RtnHdrData/PreparerPersonGrp/SSN">
										<xsl:call-template name="PopulateReturnHeaderPreparer">
											<xsl:with-param name="TargetNode">SSN</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpSSN</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PreparerPersonGrp/PTIN">
										<xsl:call-template name="PopulateReturnHeaderPreparer">
											<xsl:with-param name="TargetNode">PTIN</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpPTIN</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
							<div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
								<div class="styLNDesc" style="height:6mm;width:123.5mm;border-right:1px solid black;;border-left:1px solid black;;padding-left:1mm;">
									<span class="styGenericDiv" style="">Firm's name 
									<span style="width:2.2mm;"/>
										<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="Right Pointing Arrow"/>
										<span style="width:4px;"/>
									</span>
									<div class="styGenericDiv" style="padding-right:.5mm;">
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpPreparerFirmBusinessNameBusinessName1
											</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpPreparerFirmBusinessNameBusinessName2
											</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
								<div class="styLNDesc" style="height:6mm;width:32mm;padding-left:1mm;">Firm's EIN
									<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="Right Pointing Arrow"/>
									<span style="width:4px;"/>
									<xsl:if test="$RtnHdrData/PreparerFirmGrp/PreparerFirmEIN">
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">EIN</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpPreparerFirmEIN</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PreparerFirmGrp/MissingEINReasonCd">
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">MissingEINReason</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpMissingEINReasonCd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
							<div style="width:164mm;float:left;clear:none;">
								<div class="styLNDesc" style="height:auto;width:123.5mm;border-right:1px solid black;border-left:1px solid black;padding-left:1mm;">
									<div class="styGenericDiv" style="padding-right:.5mm;">Firm's address 
									<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="Right Pointing Arrow"/>
									</div>
									<div class="styGenericDiv" style="padding-right:.5mm;">
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpAddressLine1</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpAddressLine2</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:if test="$RtnHdrData/PreparerFirmGrp/PreparerUSAddress">
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpUSAddressCity</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">StateAbbreviationCd</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpUSAddressState</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">ZIPCd</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpUSAddressZip</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/PreparerFirmGrp/PreparerForeignAddress">
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpForeignAddressCity</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpForeignProvinceOrState
												</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpForeignPostalCd</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpForeignCountryCd</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</div>
								</div>
								<div class="styLNDesc" style="width:38mm;padding-left:1mm;"> Phone no. 
									<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">Phone</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpPhoneNum</xsl:with-param>
									</xsl:call-template>
									<span style="width:38mm;word-wrap: break-word;">
										<xsl:call-template name="PopulateReturnHeaderPreparer">
											<xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpForeignPhoneNum</xsl:with-param>
										</xsl:call-template>
									</span>
								</div>
							</div>
						</div>
					</div>
					<!-- Implementing the Preparer section in table -->
					<!-- END PREPARER SIGNATURE SECTION -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:left;">
							<span class="styBoldText" style="width:120mm">For Paperwork Reduction Act  Notice, see separate instructions.</span>
							Cat. No. 11510H
						</div>
						<div style="float:right;">
							<span style="width:28px;"/>  
							Form <span class="styBoldText" style="font-size:8pt;">1120&#8211;S</span> (2021)
						</div>
					</div>
					<!-- END Page Break and Footer-->
					<!--Begin Page 2 -->
					<!-- Page Header -->
					<div class="styBB" style="width:187mm; padding-top:.5mm; float:none; clear:both;">
						<div style="float:left;">Form 1120&#8211;S (2021)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
						</div>
					</div>
					<!-- END Page Header -->
					<!-- BEGIN Schedule B Title -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="width: 21mm;height:4.25mm;">Schedule B</div>
						<div class="styPartDesc" style="width: 126mm;">Other Information <span class="styNormalText">(see instructions)</span>
						</div>
						<span style="float:right;">
							<div class="styIRS1120SLNYesNoBox" style="height:4.25mm;border-bottom-width:0px;">
								<span class="styBoldText">Yes</span>
							</div>
							<div class="styIRS1120SLNYesNoBox" style="height:4.25mm;border-bottom-width:0px;">
								<span class="styBoldText">No</span>
							</div>
						</span>
					</div>
					<!-- END Schedule B Title -->
					<!-- BEGIN Schedule B Line 1 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:5mm;padding-top:2mm;">1</div>
						<div class="styLNDesc" style="width:119mm;height:5mm;">Check accounting method:
							<span style="width:8px"/>
							<!-- BEGIN Schedule B Line 1a -->
							<span class="styBoldText">a </span>
							<input type="checkbox" alt="Method Of Accounting Cash Indicator" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/MethodOfAccountingCashInd"/>
									<xsl:with-param name="BackupName">MethodOfAccountingCashIndicator</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/MethodOfAccountingCashInd"/>
									<xsl:with-param name="BackupName">MethodOfAccountingCashLabel</xsl:with-param>
								</xsl:call-template>
								Cash
							</label>
							<span style="width:12px"/>
							<!-- BEGIN Schedule B Line 1b -->
							<span class="styBoldText">b </span>
							<input type="checkbox" alt="Method Of Accounting Accrual Indicator" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/MethodOfAccountingAccrualInd"/>
									<xsl:with-param name="BackupName">MethodOfAccountingAccrualIndicator</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/MethodOfAccountingAccrualInd"/>
									<xsl:with-param name="BackupName">MethodOfAccountingAccrualLabel</xsl:with-param>
								</xsl:call-template>
								Accrual
							</label>
						</div>
						<span style="float:right;">
							<div class="styShadingCell" style="width:10mm;height:5mm;"/>
							<div class="styShadingCell" style="width:10mm;height:5mm;"/>
						</span>
					</div>
					<!-- BEGIN Schedule B Line 1c -->
					<div style="width:187mm;">
						<div class="styLNDesc" style="width:44mm;height:5mm;"/>
						<span class="styBoldText">c </span>
						<input type="checkbox" alt="Method Of Accounting Other Indicator" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/MethodOfAccountingOtherInd"/>
								<xsl:with-param name="BackupName">MethodOfAccountingOtherIndicator</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/MethodOfAccountingOtherInd"/>
								<xsl:with-param name="BackupName">MethodOfAccountingOtherLabel</xsl:with-param>
							</xsl:call-template>
							Other (specify)
						</label>
						<img src="{$ImagePath}/1120S_Bullet_Md.gif" alt="Right Pointing Arrow"/>
						<div style="width:90mm;padding-left:2mm;">
							<span class="styIRS1120SBBText" style="height:auto;width:86mm">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/MethodOfAccountingOtherInd/@methodOfAccountingOtherDesc"/>
								</xsl:call-template>
							</span>
						</div>
						<span style="float:right;">
							<div class="styShadingCell" style="width:10mm;height:8mm;"/>
							<div class="styShadingCell" style="width:10mm;height:8mm;"/>
						</span>
					</div>
					<!-- BEGIN Schedule B Line 2 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4.5mm;">2</div>
						<div class="styLNDesc" style="width:158mm;height:4.5mm;">See the instructions and enter the:</div>
						<span style="float:right;">
							<div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
							<div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
						</span>
					</div>
					<!-- BEGIN Schedule B Line 2a -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4.5mm;"/>
						<div class="styLNDesc" style="width:29mm;height:4.5mm;">
							<span class="styBoldText">a</span> Business activity <img src="{$ImagePath}/1120S_Bullet_Md.gif" alt="Right Pointing Arrow"/>
						</div>
						<div class="styIRS1120SBBText" style="width:46mm;min-height:4.5mm;height:auto;font-size:6pt;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/PrincipalBusinessActivityDesc"/>
							</xsl:call-template>
						</div>
						<!-- BEGIN Schedule B Line 2b -->
						<div class="styLNDesc" style="width:35mm;height:4.5mm;padding-left:4mm;">
							<span class="styBoldText">b</span> Product or service <img src="{$ImagePath}/1120S_Bullet_Md.gif" alt="Right Pointing Arrow"/>
						</div>
						<div class="styIRS1120SBBText" style="width:43mm;min-height:4.5mm;height:auto;font-size:6pt;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/PrincipalProductDesc"/>
							</xsl:call-template>
						</div>
						<!--  Updated 09/18/2014 WT: Per Defect 41623 for R9.5_D3  change the height of grey shaded area from 4.5 mm to 10mm.  -->
						<span style="float:right;">
							<div class="styShadingCell" style="width:10mm;min-height:9mm;"/>
							<div class="styShadingCell" style="width:10mm;min-height:9mm;"/>
						</span>
					</div>
					<!-- BEGIN Schedule B Line 3 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style=";">3</div>
						<div class="styLNDesc" style="width:159mm;;">
							At any time during the tax year, was any shareholder of the corporation a disregarded entity, a trust, an estate, or a 
							<span style="float:left">
								nominee or similar person? If &#8221;Yes,&#8220; attach Schedule B&#8211;1, Information on Certain Shareholders of an S Corporation 
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/ShrEntTrEstNomneSmlrPrsnInd"/>
								</xsl:call-template>
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;"/>
						</div>
						<div class="styShadingCell" style="width:10mm;height:3mm;border-bottom-width:1px;"/>
						<div class="styShadingCell" style="width:10mm;height:3mm;border-bottom-width:1px;"/>
						<div class="styIRS1120SLNYesNoBox" style="border-bottom-width:1px;;border-top-width:0;height:4mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/ShrEntTrEstNomneSmlrPrsnInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120SLNYesNoBox" style="border-bottom-width:1px;;border-top-width:0;height:4mm;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/ShrEntTrEstNomneSmlrPrsnInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN Schedule B Line 4 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc" style="width:158mm;">At the end of the tax year, did the corporation:</div>
						<span style="float:right;">
							<div class="styShadingCell" style="width:10mm;height:4mm;border-bottom-width:0px;"/>
							<div class="styShadingCell" style="width:10mm;height:4mm;border-bottom-width:0px;"/>
						</span>
					</div>
					<!-- BEGIN Schedule B Line 4a -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftLtrBox" style="padding-left:4mm;">a</div>
						<div class="styLNDesc" style="width:158mm;">
							Own directly 20% or more, or own, directly or indirectly, 50% or more of the total stock issued and outstanding of any foreign 
							<span style="float:left">
								or domestic corporation? For rules of constructive ownership, see instructions. If &#8220;Yes,&#8221; complete (i) through (v) below. 
							</span>
							<span style="width:2mm;"/>
						</div>
						<div class="styShadingCell" style="float:right;width:10mm;height:3mm;border-bottom-width:0px;"/>
						<div class="styShadingCell" style="float:right;width:10mm;height:3mm;border-bottom-width:0px;"/>
						<div style="float:right;">
							<div class="styIRS1120SLNYesNoBox" style="height:4mm;border-bottom-width:0px;border-top-width:1px;">
								<xsl:call-template name="PopulateYesBoxText">
									<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/CorporationOwnedPctStkIssdInd"/>
								</xsl:call-template>
							</div>
							<div class="styIRS1120SLNYesNoBox" style="height:4mm;border-bottom-width:0px;border-top-width:1px;">
								<xsl:call-template name="PopulateNoBoxText">
									<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/CorporationOwnedPctStkIssdInd"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule B Line 4a Repeatign Table toggle button -->
					<div style="width:187mm;" class="styBB">
						<div class="styGenericDiv" style="float:right;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/CorpOwnPctStkIssdOutstdGrp"/>
								<xsl:with-param name="containerHeight" select="4"/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerID" select=" 'Line4a' "/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN Schedule B Line 4a Repeatign Table -->
					<div id="Line4a" class="styTableContainer">
						<xsl:call-template name="SetInitialState"/>
						<table id="Line4a" name="Line4a" cellspacing="0" class="styTable">
							<thead class="styTableThead" style="border-color:black;font-size: 7pt;">
								<tr>
									<th scope="col" style="width:50mm;font-weight:normal;text-align:center" class="styTableCellHeader" rowspan="1">
										<b>(i)</b> Name of Corporation
									</th>
									<th scope="col" style="width:38mm;border-right-width:1px;font-weight:normal;" class="styTableCellHeader" rowspan="1">
										<b>(ii)</b> Employer Identification Number (if any)
									</th>
									<th scope="col" style="width:24mm;border-left-width:0px;font-weight:normal;" class="styTableCellHeader" rowspan="1">
										<b>(iii)</b> Country of Incorporation
									</th>
									<th scope="col" style="width:42mm;border-left-width:0px;font-weight:normal;" class="styTableCellHeader" rowspan="1">
										<b>(iv)</b> Percentage of Stock Owned
									</th>
									<th scope="col" style="width:33mm;border-right-width:0px;font-weight:normal;" class="styTableCellHeader" rowspan="1">
										<b>(v)</b>  If Percentage in (iv) is 100%, Enter the Date (if applicable) a Qualified Subchapter S Subsidiary Election Was Made
									</th>
								</tr>
							</thead>
							<tfoot/>
							<xsl:choose>
								<xsl:when test="$Form1120SScheduleB/CorpOwnPctStkIssdOutstdGrp">
									<tbody style="border-color:black;">
										<xsl:if test="($Print != $Separated) or (($Print=$Separated) and (count($Form1120SScheduleB/CorpOwnPctStkIssdOutstdGrp) &lt;= 4))">
											<xsl:for-each select="$Form1120SScheduleB/CorpOwnPctStkIssdOutstdGrp">
												<tr style="vertical-align:bottom;font-size: 7pt; font-weight: normal;">
													<td style="width:50mm;text-align:left;" class="styTableCell">
														<xsl:if test="position() = last() and position() &gt;= 4">
															<xsl:attribute name="style">width:50mm;text-align:left;border-bottom-width:0px;</xsl:attribute>
														</xsl:if>
														<div class="styGenericDiv" style="vertical-align:bottom;float:left;">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="CorporationNm"/>
															</xsl:call-template>
															<span style="width:1px;"/>
														</div>
													</td>
													<td style="width:38mm;text-align:center;" valign="bottom" class="styTableCell">
														<xsl:if test="position() = last() and position() &gt;= 4">
															<xsl:attribute name="style">width:38mm;text-align:center;border-bottom-width:0px;</xsl:attribute>
														</xsl:if>
														<xsl:choose>
															<xsl:when test="SSN !=''">
																<xsl:call-template name="PopulateSSN">
																	<xsl:with-param name="TargetNode" select="SSN"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:when test="EIN!=''">
																<xsl:call-template name="PopulateEIN">
																	<xsl:with-param name="TargetNode" select="EIN"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:when test="MissingSSNEINReasonCd!=''">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="MissingSSNEINReasonCd"/>
																</xsl:call-template>
															</xsl:when>
														</xsl:choose>
														<span style="width:1px;"/>
													</td>
													<td style="width:24mm;text-align:center;" valign="bottom" class="styTableCell">
														<xsl:if test="position() = last() and position() &gt;= 4">
															<xsl:attribute name="style">width:24mm;text-align:center;border-bottom-width:0px;</xsl:attribute>
														</xsl:if>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="IncorporationCountryCd"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td style="width:42mm;border-right-width:1px;" class="styTableCell">
														<xsl:if test="position() = last() and position() &gt;= 4">
															<xsl:attribute name="style">width:42mm;border-right-width:1px;border-bottom-width:0px;</xsl:attribute>
														</xsl:if>
														<xsl:call-template name="PopulatePercent">
															<xsl:with-param name="TargetNode" select="VotingStockOwnedPct"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td style="width:33mm;border-right-width:0px;text-align:center;" class="styTableCell">
														<xsl:if test="position() = last() and position() &gt;= 4">
															<xsl:attribute name="style">width:33mm;border-right-width:0px;border-bottom-width:0px;text-align:center;
															</xsl:attribute>
														</xsl:if>
														<xsl:call-template name="PopulateMonthDayYear">
															<xsl:with-param name="TargetNode" select="QSubElectionDt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
												</tr>
											</xsl:for-each>
										</xsl:if>
										<xsl:if test="(count($Form1120SScheduleB/CorpOwnPctStkIssdOutstdGrp)&lt; 1) or (($Print=$Separated) and (count($Form1120SScheduleB/CorpOwnPctStkIssdOutstdGrp) &gt;4))">
											<xsl:call-template name="SchBLine4aEmptyCells">
												<xsl:with-param name="index">1</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="(count($Form1120SScheduleB/CorpOwnPctStkIssdOutstdGrp)&lt; 2) or (($Print=$Separated) and (count($Form1120SScheduleB/CorpOwnPctStkIssdOutstdGrp) &gt;4))">
											<xsl:call-template name="SchBLine4aEmptyCells">
												<xsl:with-param name="index"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="(count($Form1120SScheduleB/CorpOwnPctStkIssdOutstdGrp)&lt; 3) or (($Print=$Separated) and (count($Form1120SScheduleB/CorpOwnPctStkIssdOutstdGrp) &gt;4))">
											<xsl:call-template name="SchBLine4aEmptyCells">
												<xsl:with-param name="index"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="(count($Form1120SScheduleB/CorpOwnPctStkIssdOutstdGrp)&lt; 4) or (($Print=$Separated) and (count($Form1120SScheduleB/CorpOwnPctStkIssdOutstdGrp) &gt;4))">
											<xsl:call-template name="SchBLine4aEmptyCells">
												<xsl:with-param name="index"/>
												<xsl:with-param name="end">true</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</tbody>
								</xsl:when>
								<xsl:otherwise>
									<tbody style="border-color:black;">
										<xsl:call-template name="SchBLine4aEmptyCells">
											<xsl:with-param name="index">1</xsl:with-param>
										</xsl:call-template>
										<xsl:call-template name="SchBLine4aEmptyCells">
											<xsl:with-param name="index"/>
										</xsl:call-template>
										<xsl:call-template name="SchBLine4aEmptyCells">
											<xsl:with-param name="index"/>
										</xsl:call-template>
										<xsl:call-template name="SchBLine4aEmptyCells">
											<xsl:with-param name="index"/>
										</xsl:call-template>
										<xsl:call-template name="SchBLine4aEmptyCells">
											<xsl:with-param name="index"/>
											<xsl:with-param name="end">true</xsl:with-param>
										</xsl:call-template>
									</tbody>
								</xsl:otherwise>
							</xsl:choose>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/CorpOwnPctStkIssdOutstdGrp"/>
						<xsl:with-param name="containerHeight" select="4"/>
						<xsl:with-param name="headerHeight" select="1"/>
						<xsl:with-param name="containerID" select=" 'Line4a' "/>
					</xsl:call-template>
					<!-- END Schedule B Line 4a Repeatign Table -->
					<!-- BEGIN Schedule B Line 4b -->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="padding-left:4mm;">b</div>
						<div class="styLNDesc" style="width:158mm;">
							Own directly an interest of 20% or more, or own, directly or indirectly, an interest of 50% or more in the profit, loss, or 
						</div>
						<span style="float:right;">
							<div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
							<div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
						</span>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD"/>
						<div class="styLNDesc" style="width:158mm;">
							capital in any foreign or domestic partnership (including an entity treated as a partnership) or in the beneficial interest 
						</div>
						<span style="float:right;">
							<div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
							<div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
						</span>
					</div>
					<div style="width:187mm;" class="styBB">
						<div class="styLNLeftNumBoxSD"/>
						<div class="styLNDesc" style="width:159mm;">
							<span style="float:left">of a trust? For rules of constructive ownership, see instructions. If &#8220;Yes,&#8221; complete (i) through (v) below.
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
						</div>
						<div class="styIRS1120SLNYesNoBox" style="border-bottom:0;border-top-width:1px;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/CorporationOwnPctPrtshpInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120SLNYesNoBox" style="border-bottom:0;border-top-width:1px;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/CorporationOwnPctPrtshpInd"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;" class="styBB">
						<div class="styGenericDiv" style="float:right;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/CorpOwnPctFrgnDomPrtshpGrp"/>
								<xsl:with-param name="containerHeight" select="4"/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerID" select=" 'Line4b' "/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN Schedule B Line 4b Repeatign Table -->
					<div id="Line4b" class="styTableContainer">
						<xsl:call-template name="SetInitialState"/>
						<table id="Line4b" name="Line4b" cellspacing="0" class="styTable">
							<thead class="styTableThead" style="border-color:black;font-size: 7pt;">
								<tr>
									<th scope="col" style="width:50mm;font-weight:normal;text-align:center" class="styTableCellHeader">
										<b>(i)</b> Name of Entity
									</th>
									<th scope="col" style="width:38mm;border-right-width:1px;font-weight:normal;" class="styTableCellHeader">
										<b>(ii)</b> Employer Identification Number (if any)
									</th>
									<th scope="col" style="width:24mm;border-left-width:0px;font-weight:normal;" class="styTableCellHeader">
										<b>(iii)</b> Type of Entity
									</th>
									<th scope="col" style="width:42mm;border-left-width:0px;font-weight:normal;" class="styTableCellHeader">
										<b>(iv)</b> Country of Organization
									</th>
									<th scope="col" style="width:33mm;border-right-width:0px;font-weight:normal;" class="styTableCellHeader">
										<b>(v)</b>  Maximum Percentage Owned in Profit, Loss, or Capital
									</th>
								</tr>
							</thead>
							<tfoot/>
							<xsl:choose>
								<xsl:when test="$Form1120SScheduleB/CorpOwnPctFrgnDomPrtshpGrp">
									<tbody style="border-color:black;">
										<xsl:if test="($Print != $Separated) or (($Print=$Separated) and (count($Form1120SScheduleB/CorpOwnPctFrgnDomPrtshpGrp) &lt;= 4))">
											<xsl:for-each select="$Form1120SScheduleB/CorpOwnPctFrgnDomPrtshpGrp">
												<tr style="vertical-align:bottom;font-size: 7pt; font-weight: normal;">
													<td style="width:50mm;text-align:left;" class="styTableCell">
														<xsl:if test="position() = last() and position() &gt;= 4">
															<xsl:attribute name="style">width:50mm;text-align:left;border-bottom-width:0px;</xsl:attribute>
														</xsl:if>
														<div class="styGenericDiv" style="vertical-align:bottom;float:left;">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="EntityNm"/>
															</xsl:call-template>
															<span style="width:1px;"/>
														</div>
													</td>
													<td style="width:38mm;text-align:center;" valign="bottom" class="styTableCell">
														<xsl:if test="position() = last() and position() &gt;= 4">
															<xsl:attribute name="style">width:38mm;text-align:center;border-bottom-width:0px;</xsl:attribute>
														</xsl:if>
														<xsl:choose>
															<xsl:when test="EIN!=''">
																<xsl:call-template name="PopulateEIN">
																	<xsl:with-param name="TargetNode" select="EIN"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:when test="MissingEINReasonCd!=''">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
																</xsl:call-template>
															</xsl:when>
														</xsl:choose>
														<span style="width:1px;"/>
													</td>
													<td style="width:24mm;text-align:left;" valign="bottom" class="styTableCell">
														<xsl:if test="position() = last() and position() &gt;= 4">
															<xsl:attribute name="style">width:24mm;text-align:left;border-bottom-width:0px;</xsl:attribute>
														</xsl:if>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="EntityTypeTxt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td style="width:42mm;border-right-width:1px;text-align:center;" class="styTableCell">
														<xsl:if test="position() = last() and position() &gt;= 4">
															<xsl:attribute name="style">width:42mm;border-right-width:1px;border-bottom-width:0px;text-align:center;
															</xsl:attribute>
														</xsl:if>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="OrganizationCountryCd"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td style="width:33mm;border-right-width:0px;" class="styTableCell">
														<xsl:if test="position() = last() and position() &gt;= 4">
															<xsl:attribute name="style">width:33mm;border-right-width:0px;border-bottom-width:0px;text-align:right;
															</xsl:attribute>
														</xsl:if>
														<xsl:call-template name="PopulatePercent">
															<xsl:with-param name="TargetNode" select="MaximumOwnedPct"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
												</tr>
											</xsl:for-each>
										</xsl:if>
										<xsl:if test="(count($Form1120SScheduleB/CorpOwnPctFrgnDomPrtshpGrp)&lt; 1) or (($Print=$Separated) and (count($Form1120SScheduleB/CorpOwnPctFrgnDomPrtshpGrp) &gt;4))">
											<xsl:call-template name="SchBLine4bEmptyCells">
												<xsl:with-param name="index">1</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="(count($Form1120SScheduleB/CorpOwnPctFrgnDomPrtshpGrp)&lt; 2) or (($Print=$Separated) and (count($Form1120SScheduleB/CorpOwnPctFrgnDomPrtshpGrp) &gt;4))">
											<xsl:call-template name="SchBLine4bEmptyCells">
												<xsl:with-param name="index"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="(count($Form1120SScheduleB/CorpOwnPctFrgnDomPrtshpGrp)&lt; 3) or (($Print=$Separated) and (count($Form1120SScheduleB/CorpOwnPctFrgnDomPrtshpGrp) &gt;4))">
											<xsl:call-template name="SchBLine4bEmptyCells">
												<xsl:with-param name="index"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="(count($Form1120SScheduleB/CorpOwnPctFrgnDomPrtshpGrp)&lt; 4) or (($Print=$Separated) and (count($Form1120SScheduleB/CorpOwnPctFrgnDomPrtshpGrp) &gt;4))">
											<xsl:call-template name="SchBLine4bEmptyCells">
												<xsl:with-param name="index"/>
												<xsl:with-param name="end">true</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</tbody>
								</xsl:when>
								<xsl:otherwise>
									<tbody style="border-color:black;">
										<xsl:call-template name="SchBLine4bEmptyCells">
											<xsl:with-param name="index">1</xsl:with-param>
										</xsl:call-template>
										<xsl:call-template name="SchBLine4bEmptyCells">
											<xsl:with-param name="index"/>
										</xsl:call-template>
										<xsl:call-template name="SchBLine4bEmptyCells">
											<xsl:with-param name="index"/>
										</xsl:call-template>
										<xsl:call-template name="SchBLine4bEmptyCells">
											<xsl:with-param name="index"/>
										</xsl:call-template>
										<xsl:call-template name="SchBLine4bEmptyCells">
											<xsl:with-param name="index"/>
											<xsl:with-param name="end">true</xsl:with-param>
										</xsl:call-template>
									</tbody>
								</xsl:otherwise>
							</xsl:choose>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/CorpOwnPctFrgnDomPrtshpGrp"/>
						<xsl:with-param name="containerHeight" select="4"/>
						<xsl:with-param name="headerHeight" select="1"/>
						<xsl:with-param name="containerID" select=" 'Line4b' "/>
					</xsl:call-template>
					<!-- END Schedule B Line 4b Repeatign Table -->
					<!-- BEGIN Schedule B Line 5a -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4.5mm;">5a</div>
						<div class="styLNDesc" style="width:159mm;height:4.5mm;">
							At the end of the tax year, did the corporation have any outstanding shares of restricted stock? 
						</div>
						<div class="styIRS1120SLNYesNoBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/OutstandingRestrictedStockInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120SLNYesNoBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/OutstandingRestrictedStockInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN Schedule B Line 5a If yes -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:0mm;"/>
						<div class="styLNDesc" style="width:154mm;height:4.5mm;padding-top:0mm;">
							<span style="float:left">If &#8220;Yes,&#8221; complete lines (i) and (ii) below. </span>
						</div>
						<span style="float:right;">
							<div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
							<div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
						</span>
					</div>
					<!-- BEGIN Schedule B Line 5a (i) -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:0mm;"/>
						<div class="styLNDesc" style="width:104mm;height:4.5mm;padding-top:0mm;">
							<span style="float:left">(i) Total shares of restricted stock </span>
							<span class="styDotLn" style="padding-left:2mm;">............
								<span style="padding-left:1mm;">
									<img src="{$ImagePath}/1120S_Bullet_Md.gif" alt="Right Pointing Arrow"/>
								</span>
							</span>
						</div>
						<div class="styIRS1120SBBText" style="width:50mm;height:4.5mm;padding-top:0mm;margin-right:5mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/TotalRestrictedStockOutstdNum"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
						<div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
					</div>
					<!-- BEGIN Schedule B Line 5a (ii) -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:0mm;"/>
						<div class="styLNDesc" style="width:104mm;height:4.5mm;padding-top:0mm;">
							<span style="float:left">(ii) Total shares of non&#8211;restricted stock </span>
							<span class="styDotLn" style="padding-left:3.5mm;">..........
								<span style="padding-left:1mm;">
									<img src="{$ImagePath}/1120S_Bullet_Md.gif" alt="Right Pointing Arrow"/>
								</span>
							</span>
						</div>
						<div class="styIRS1120SBBText" style="width:50mm;height:4.5mm;padding-top:0mm;margin-right:5mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/TotNonrestrictedStockOutsdtNum"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:10mm;height:4.5mm;border-bottom-width:1px;"/>
						<div class="styShadingCell" style="width:10mm;height:4.5mm;border-bottom-width:1px;"/>
					</div>
					<!-- BEGIN Schedule B Line 5b-->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4mm;padding-left:4.5mm;">b</div>
						<div class="styLNDesc" style="width:159mm;height:4.5mm;">
							At the end of the tax year, did the corporation have any outstanding stock options, warrants, or similar instruments? 
						</div>
						<div class="styIRS1120SLNYesNoBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/OutstandingStkOptWarrantsInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120SLNYesNoBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/OutstandingStkOptWarrantsInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN Schedule B Line 5b If yes-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:0mm;"/>
						<div class="styLNDesc" style="width:154mm;height:4.5mm;padding-top:0mm;">
							<span style="float:left">If &#8220;Yes,&#8221; complete lines (i) and (ii) below. </span>
						</div>
						<span style="float:right;">
							<div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
							<div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
						</span>
					</div>
					<!-- BEGIN Schedule B Line 5b (i)-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:0mm;"/>
						<div class="styLNDesc" style="width:104mm;height:4.5mm;padding-top:0mm;">
							<span style="float:left">(i) Total shares of stock outstanding at the end of the tax year </span>
							<span class="styDotLn" style="padding-left:3.9mm;">
								<span style="padding-right:1mm;float:right;">...
									<img src="{$ImagePath}/1120S_Bullet_Md.gif" alt="Right Pointing Arrow"/>
								</span>
							</span>
						</div>
						<div class="styIRS1120SBBText" style="width:50mm;height:4.5mm;padding-top:0mm;margin-right:5mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/TotShareStockOutstandingEOYCnt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
						<div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
					</div>
					<!-- BEGIN Schedule B Line 5b (ii) -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:0mm;"/>
						<div class="styLNDesc" style="width:104mm;height:4.5mm;padding-top:0mm;">
							<span style="float:left">(ii) Total shares of stock outstanding if all instruments were executed </span>
							<span class="styDotLn" style="padding-left:3.5mm;">
								<span style="padding-right:1mm;float:right;">.
									<img src="{$ImagePath}/1120S_Bullet_Md.gif" alt="Right Pointing Arrow"/>
								</span>
							</span>
						</div>
						<div class="styIRS1120SBBText" style="width:50mm;height:4.5mm;padding-top:0mm;margin-right:5mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/TotShrStkOutstdAllExecutedCnt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
						<div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
					</div>
					<!-- BEGIN Schedule B Line 6 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:7.5mm;">6</div>
						<div class="styLNDesc" style="width:159mm;height:7.5mm;">
							Has this corporation filed, or is it required to file, <b>Form 8918, </b>Material Advisor Disclosure Statement, to provide
							<span style="float:left">information on any reportable transaction? </span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.........................</span>
						</div>
						<div class="styShadingCell" style="width:10mm;height:3mm;border-bottom-width:1px;"/>
						<div class="styShadingCell" style="width:10mm;height:3mm;border-bottom-width:1px;"/>
						<div class="styIRS1120SLNYesNoBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/FiledOrRequiredFileForm8918Ind"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120SLNYesNoBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/FiledOrRequiredFileForm8918Ind"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN Schedule B Line 7 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4mm;">7</div>
						<div class="styLNDesc" style="width:159mm;height:4mm;">
							<span style="float:left">
								Check this box if the corporation issued publicly offered debt instruments with original issue discount
							</span>
							<span class="styDotLn" style="padding-right:2mm;padding-left:3.5mm;">...</span>
							<img src="{$ImagePath}/1120S_Bullet_Md.gif" alt="Right Pointing Arrow"/>
							<span style="width:4mm"/>
							<input type="checkbox" alt="Offered Deb tInstruments Indicator" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/OfferedDebtInstrumentsInd"/>
									<xsl:with-param name="BackupName">OfferedDebtInstrumentsIndicator</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/OfferedDebtInstrumentsInd"/>
									<xsl:with-param name="BackupName">OfferedDebtInstrumentsLabel</xsl:with-param>
								</xsl:call-template>
							</label>
						</div>
						<div class="styShadingCell" style="width:10mm;height:5.25mm;"/>
						<div class="styShadingCell" style="width:10mm;height:5.25mm;"/>
					</div>
					<!-- BEGIN Schedule B Line 7 If yes -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:8mm;"/>
						<div class="styLNDesc" style="width:159mm;height:8mm;">If checked, the corporation may have to file
							<span class="styBoldText">Form 8281,</span> 
							Information Return for Publicly Offered Original Issue Discount Instruments.
						</div>
						<div class="styShadingCell" style="width:10mm;height:8mm;"/>
						<div class="styShadingCell" style="width:10mm;height:8mm;"/>
					</div>
					<!-- BEGIN Schedule B Line 8 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:14mm">8</div>
						<div class="styLNDesc" style="width:159mm;height:14mm">If the corporation: <b>(a) </b>
							was a C corporation before it elected to be an S corporation <b>or</b> the corporation acquired an<br/>
							asset with a basis determined by reference to the basis of the asset (or the basis of any other property) in the hands<br/>
							of a C corporation, <b>and (b) </b> has net unrealized built&#8211;in gain in excess of the net recognized built&#8211;gain from prior<br/>
							years, enter the net unrealized built&#8211;gain reduced by net recognized built&#8211;gain from prior years.<br/>
						</div>
						<div class="styShadingCell" style="width:10mm;height:14mm"/>
						<div class="styShadingCell" style="width:10mm;height:14mm"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:0mm;"/>
						<div class="styLNDesc" style="width:119mm;height:4.5mm;padding-top:0mm;">
							<span style="float:left">
								See instructions
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/NetUnrlzdRedPYNetRcgnzGainAmt"/>
								</xsl:call-template>
							</span>
							<span class="styDotLn" style="padding-left:2mm;padding-right:1mm;">...................
								<span style="padding-left:1mm;">
									<img src="{$ImagePath}/1120S_Bullet_Md.gif" alt="Right Pointing Arrow"/>
								</span>
							</span>
							$
						</div>
						<div class="styIRS1120SBBText" style="width:35mm;height:6mm;padding-top:0mm;margin-right:5mm;text-align:right;">
							<xsl:if test="$Form1120SScheduleB/NetUnrlzdRedPYNetRcgnzGainAmt">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/NetUnrlzdRedPYNetRcgnzGainAmt"/>
								</xsl:call-template>
							</xsl:if>
							<br/>
							<xsl:if test="$Form1120SScheduleB/AttachmentIndicatorCd">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/AttachmentIndicatorCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styShadingCell" style="width:10mm;height:6mm;"/>
						<div class="styShadingCell" style="width:10mm;height:6mm;"/>
					</div>
					<!-- BEGIN Schedule B Line 9 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style=";">9</div>
						<div class="styLNDesc" style="width:159mm;">
							<div style="font-weight:6pt">
								Did the corporation have an election under section 163(j) for any real property trade or business or any farming business in 
								<span style="float:left;"> effect during the tax year? See instructions. </span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.........................</span>
							</div>
						</div>
						<div class="styShadingCell" style="width:10mm;height:3mm;border-bottom-width:1px;"/>
						<div class="styShadingCell" style="width:10mm;height:3mm;border-bottom-width:1px;"/>
						<div class="styIRS1120SLNYesNoBox" style="height:4.5mm;border-bottom-width:1px;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/Section163jElectionInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120SLNYesNoBox" style="height:4.5mm;border-bottom-width:1px;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/Section163jElectionInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN Schedule B Line 10 -->
					<!-- Exception: IE limitation, browser display take precedent over print out -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-top:4mm;">10</div>
						<div class="styLNDesc" style="width:159mm;padding-top:4mm;">
							Does the corporation satisfy one or more of the following? See instructions
							<span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
						</div>
						<div class="styShadingCell" style="width:10mm;height:3mm;border-bottom-width:1px;"/>
						<div class="styShadingCell" style="width:10mm;height:3mm;border-bottom-width:1px;"/>
						<div class="styIRS1120SLNYesNoBox" style="height:4.5mm;border-bottom-width:1px;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/SatisfyOneOrMoreConditionsInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120SLNYesNoBox" style="height:4.5mm;border-bottom-width:1px;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/SatisfyOneOrMoreConditionsInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN Schedule B Line 10a -->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="padding-left:4.5mm;">a</div>
						<div class="styLNDesc" style="width:159mm;">
						The corporation owns a pass&#8211;through entity with current, or prior year carryover, excess business interest expense.
						</div>
						<div class="styShadingCell" style="width:10mm;height:4mm;border-bottom-width:0px;"/>
						<div class="styShadingCell" style="width:10mm;height:4mm;border-bottom-width:0px;"/>
					</div>
					<!-- BEGIN Schedule B Line 10b -->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="padding-left:4.5mm;height:7mm">b</div>
						<div class="styLNDesc" style="width:159mm;">
						The corporation&#8216;s aggregate average annual gross receipts (determined under section 448(c)) for the 3 tax years preceding&#160;&#160;the current tax year are more than $26 million and the corporation has business interest expense.
						</div>
						<div class="styShadingCell" style="width:10mm;height:7mm;border-bottom-width:0px;"/>
						<div class="styShadingCell" style="width:10mm;height:7mm;border-bottom-width:0px;"/>
					</div>
					<!-- BEGIN Schedule B Line 10c -->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="padding-left:4.5mm;">c</div>
						<div class="styLNDesc" style="width:159mm;">
						The corporation is a tax shelter and the corporation has business interest expense.
						
					</div>
						<div class="styShadingCell" style="width:10mm;height:4mm;border-bottom-width:0px;"/>
						<div class="styShadingCell" style="width:10mm;height:4mm;border-bottom-width:0px;"/>
					</div>
					<!-- BEGIN Schedule B Line 10d  -->
					<!-- BEGIN Schedule B Line 10 If Yes -->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4mm;padding-left:4.5mm;"/>
						<div class="styLNDesc" style="width:159mm;height:4mm">
							<div style="font-weight:6pt;">
								If &#8220;Yes,&#8221; complete and attach Form 8990.
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/SatisfyOneOrMoreConditionsInd"/>
								</xsl:call-template>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/SatisfyOneConditionInd"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styShadingCell" style="width:10mm;height:4.5mm;border-bottom-width:0px;"/>
						<div class="styShadingCell" style="width:10mm;height:4.5mm;border-bottom-width:0px;"/>
					</div>
					<!-- BEGIN Schedule B Line 11 -->
					<!-- Exception: IE limitation, browser display take precedent over print out -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">11</div>
						<div class="styLNDesc" style="width:159mm;">
							<div style="font-weight:6pt">
							Does the corporation satisfy <b>both</b> of the following conditions?
							</div>
						</div>
						<div class="styShadingCell" style="width:10mm;height:4mm;"/>
						<div class="styShadingCell" style="width:10mm;height:4mm;"/>
					</div>
					<!-- BEGIN Schedule B Line 11a -->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="padding-left:4.5mm;">a</div>
						<div class="styLNDesc" style="width:159mm;">
							<div style="font-weight:6pt">
							The corporation’s total receipts (see instructions) for the tax year were less than $250,000.
							</div>
							<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
						</div>
						<div class="styShadingCell" style="width:10mm;height:4mm;border-bottom-width: 1px;"/>
						<div class="styShadingCell" style="width:10mm;height:4mm;border-bottom-width: 1px;"/>
					</div>
					<!-- BEGIN Schedule B Line 11b -->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="padding-left:4.5mm;;border-bottom-width:1px;">b</div>
						<div class="styLNDesc" style="width:159mm;">
							<span style="float:left">
								The corporation’s total assets at the end of the tax year were less than $250,000.
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
						</div>
						<div class="styIRS1120SLNYesNoBox" style="height:4.5mm;border-bottom-width:1px;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/SchLAndSchM1NotRequiredInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120SLNYesNoBox" style="height:4.5mm;border-bottom-width:1px;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/SchLAndSchM1NotRequiredInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN Schedule B Line 11 If Yes -->
					<div class="styBB" style="width:187mm; float:none; clear:both;">
						<div class="styLNLeftLtrBox" style="height:4mm;padding-left:4.5mm;"/>
						<div class="styLNDesc" style="width:159mm;height:4mm;border-bottom-width:1px">
							<div style="font-weight:6pt;">
								If &#8220;Yes,&#8221; the corporation is not required to complete Schedules L and M-1.
							</div>
						</div>
						<div class="styShadingCell" style="width:10mm;height:4mm;border-bottom-width:0px;"/>
						<div class="styShadingCell" style="width:10mm;height:4mm;border-bottom-width:0px;"/>
					</div>
					<!-- BEGIN Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:right;">
							<span style="width:80px;"/>  
								Form <span class="styBoldText" style="font-size:8pt;">1120&#8211;S</span> (2021)
						</div>
					</div>
					<!-- END Page Break and Footer-->
					<!-- BEGIN Page 3 Header -->
					<div class="styBB" style="width:187mm;padding-top:.5mm; float:none; clear:both;">
						<div style="float:left;">Form 1120&#8211;S (2021)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">3</span>
						</div>
					</div>
					<!-- END Page 3 Header -->
					<!-- BEGIN Schedule B continued Title -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="width: 21mm;height:4.25mm;">Schedule B</div>
						<div class="styPartDesc" style="width: 126mm;">Other Information <span class="styNormalText">(see instructions) <i> (continued)</i>
							</span>
						</div>
						<span style="float:right;">
							<div class="styIRS1120SLNYesNoBox" style="height:4.25mm;border-bottom-width:0px;">
								<span class="styBoldText">Yes</span>
							</div>
							<div class="styIRS1120SLNYesNoBox" style="height:4.25mm;border-bottom-width:0px;">
								<span class="styBoldText">No</span>
							</div>
						</span>
					</div>
					<!-- BEGIN Schedule B Line 12 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style=";">12</div>
						<div class="styLNDesc" style="width:159mm;">
							During the tax year, did the corporation have any non&#8211;shareholder debt that was canceled, was forgiven, or had the
							<span style="float:left">
								terms modified so as to reduce the principal amount of the debt?
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">..................</span>
						</div>
						<div class="styShadingCell" style="width:10mm;height:3mm;border-bottom-width:1px;"/>
						<div class="styShadingCell" style="width:10mm;height:3mm;border-bottom-width:1px;"/>
						<div class="styIRS1120SLNYesNoBox" style="height:4mm;;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/DebtCancelledForgivenModifInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120SLNYesNoBox" style="height:4mm;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/DebtCancelledForgivenModifInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN Schedule B Line 12 If yes -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;padding-top:0mm;"/>
						<div class="styLNDesc" style="width:119mm;height:5mm;padding-top:0mm;">
							<span style="float:left">
							If &#8220;Yes,&#8221; enter the amount of principal reduction

							</span>
							<span class="styDotLn" style="padding-left:2mm;padding-right:1mm;">..........
								<!--<span style="padding-left:0mm;">-->
								<img src="{$ImagePath}/1120S_Bullet_Md.gif" alt="Right Pointing Arrow"/>
								<!--</span>-->
							</span>
							$
						</div>
						<div class="styIRS1120SBBText" style="width:35mm;height:5mm;padding-top:1.5mm;margin-right:5mm;text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/PrincipalReductionAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:10mm;height:5mm;border-bottom-width:1px;"/>
						<div class="styShadingCell" style="width:10mm;height:5mm;border-bottom-width:1px;"/>
					</div>
					<!-- BEGIN Schedule B Line 13 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style=";">13</div>
						<div class="styLNDesc" style="width:159mm;">
							During the tax year, was a qualified subchapter S subsidiary election terminated or revoked?
							If &#8220;Yes,&#8221; see instructions
							<!--Dotted Line-->
						</div>
						<div class="styIRS1120SLNYesNoBox" style="height:4mm;border-bottom-width:1px;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/QSubElectionTerminatedRvkdInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120SLNYesNoBox" style="height:4mm;border-bottom-width:1px;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/QSubElectionTerminatedRvkdInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN Schedule B Line 14a -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style=";">14a</div>
						<div class="styLNDesc" style="width:159mm;">
							<span style="float:left">
								Did the corporation make any payments in 2021 that would require it to file Form(s) 1099?
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
						</div>
						<div class="styIRS1120SLNYesNoBox" style="height:4mm;border-bottom-width:1px;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/RequiredToFileForms1099Ind"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120SLNYesNoBox" style="height:4mm;border-bottom-width:1px;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/RequiredToFileForms1099Ind"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN Schedule B Line 14b -->
					<div style="width:187mm; float:none; clear:both;">
						<div class="styLNLeftLtrBox" style="padding-left:4.5mm;">b</div>
						<div class="styLNDesc" style="width:159mm;">
							<span style="float:left">If &#8220;Yes,&#8221; did the corporation file or will it file required Form(s) 1099? </span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>
						</div>
						<div class="styIRS1120SLNYesNoBox" style="height:4mm;border-bottom-width:1px;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/RequiredForms1099FiledInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120SLNYesNoBox" style="height:4mm;border-bottom-width:1px;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/RequiredForms1099FiledInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- New Line 15 -->
					<!-- BEGIN Schedule B Line 15-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style=";">15</div>
						<div class="styLNDesc" style="width:159mm;;">
							<span style="float:left">Is the corporation attaching Form 8996 to certify as a Qualified Opportunity Fund?
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/QlfyOpportunityFundPenaltyAmt"/>
								</xsl:call-template>
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
						</div>
						<div class="styIRS1120SLNYesNoBox" style="height:4mm;border-bottom-width:1px;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/Form8996AttachedInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120SLNYesNoBox" style="height:4mm;border-bottom-width:1px;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/Form8996AttachedInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN Schedule B Line 15 If yes -->
					<!--  *******************************************************************************************************  -->
					<div style="width:187mm;height:5.5mm;padding-top:0mm;">
						<div class="styLNLeftNumBox" style="height:5mm;padding-top:0mm;"/>
						<div class="styLNDesc" style="width:119mm;height:5mm;padding-top:0mm;">
							<span style="float:left">
							If &#8220;Yes,&#8221; enter the amount from Form 8996, line 15 
							</span>
							<span class="styDotLn" style="padding-left:2mm;padding-right:1mm;">...........
									<img src="{$ImagePath}/1120S_Bullet_Md.gif" alt="Right Pointing Arrow"/>
							</span>
							$
						</div>
						<div class="styIRS1120SBBText" style="width:35mm;height:5mm;padding-top:1.5mm;margin-right:5mm;text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/QlfyOpportunityFundPenaltyAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:10mm;height:5.5mm;border-bottom-width:0px;"/>
						<div class="styShadingCell" style="width:10mm;height:5.5mm;border-bottom-width:0px;"/>
					</div>
					<!-- BEGIN Schedule K Title -->
					<div class="styBB" style="width:187mm; border-top-width:1px;">
						<div class="styPartName" style="width: 21mm; height:4.25mm;">Schedule K</div>
						<div class="styPartDesc" style="width: 121.5mm; height:4.25mm;">
							Shareholders’ Pro Rata Share Items
							<span style="width:2px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleK"/>
							</xsl:call-template>
						</div>
						<span class="styLNAmountBoxNBB" style="width:44mm; height:4.25mm; text-align:center;">
							<b>Total amount </b>
						</span>
					</div>
					<!-- END Schedule K Title -->
					<!-- BEGIN Schedule K, Income Section -->
					<div class="styBB" style="width:187mm;">
						<span class="styIRS1120SVTImageBox" style="width:10mm; height:67mm; padding-top:25mm; text-align:center;">
							<img src="{$ImagePath}/1120S_IncomeLoss.gif" alt="ScheduleK, Income (loss) Section" valign="center" height="80mm;"/>
						</span>
						<!-- BEGIN Schedule K, Line 1-->
						<div class="styGenericDiv" style="width:177mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBoxSD">1</div>
								<div class="styLNDesc" style="width:124mm;">
									<span style="float:left;">Ordinary business income (loss) (page 1, line 21)
										<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/OrdinaryBusinessIncomeLossAmt"/>
										</xsl:call-template>
									</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">..............</div>
								</div>
							</div>
							<div style="float:right;clear:none">
								<div class="styLNRightNumBox" style="width:12.3mm;">1</div>
								<div class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/OrdinaryBusinessIncomeLossAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- BEGIN Schedule K, Line 2-->
						<div class="styGenericDiv" style="width:177mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBoxSD">2</div>
								<div class="styLNDesc" style="width:124mm;">
									<span style="float:left;">Net rental real estate income (loss) (attach Form 8825)
										<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/NetIncomeLossAmt"/>
										</xsl:call-template>
									</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">............</div>
								</div>
							</div>
							<div style="float:right;clear:none">
								<div class="styLNRightNumBox" style="width:12.3mm;height:4.5mm;">2</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/NetIncomeLossAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- BEGIN Schedule K, Line 3a-->
						<div class="styGenericDiv" style="width:177mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBoxSD">3a</div>
								<div class="styLNDesc" style="width:84.7mm;">
									<span style="float:left;">
										Other gross rental income (loss)
										<span style="width:2px;"/>
										<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/OtherGrossRentalIncomeLossAmt"/>
										</xsl:call-template>
									</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">.........</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">3a</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/OtherGrossRentalIncomeLossAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBoxNBB" style="width:12.3mm;height:4.5mm;background-color:lightgrey;"/>
								<div class="styLNAmountBoxNBB" style="height:4.5mm;;border-bottom-width:1px"/>
							</div>
						</div>
						<!-- BEGIN Schedule K, Line 3b-->
						<div class="styGenericDiv" style="width:177mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBoxSD" style="padding-left:4mm;">b</div>
								<div class="styLNDesc" style="width:84.7mm;">
									<span style="float:left;">Expenses from other rental activities (attach statement)
										<span style="width:2px;"/>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/ExpensesFromOtherRentalActyAmt"/>
										</xsl:call-template>
									</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">.</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">3b</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/ExpensesFromOtherRentalActyAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBoxNBB" style="width:12.3mm;height:4.5mm;background-color:lightgrey;"/>
								<div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
							</div>
						</div>
						<!-- BEGIN Schedule K, Line 3c-->
						<div class="styGenericDiv" style="width:177mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBoxSD" style="padding-left:4mm;">c</div>
								<div class="styLNDesc" style="width:123.7mm;">
									<span style="float:left;">Other net rental income (loss). Subtract line 3b from line 3a </span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">...........</div>
								</div>
							</div>
							<div style="float:right;clear:none">
								<div class="styLNRightNumBox" style="width:12.3mm;">3c</div>
								<div class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/NetIncmLossFromOthRntlActyAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- BEGIN Schedule K, Line 4-->
						<div class="styGenericDiv" style="width:177mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBoxSD">4</div>
								<div class="styLNDesc" style="width:123.7mm;">
									<span style="float:left;">Interest income </span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">.........................</div>
								</div>
							</div>
							<div style="float:right;clear:none">
								<div class="styLNRightNumBox" style="width:12.3mm;">4</div>
								<div class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/InterestIncomeAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- BEGIN Schedule K, Line 5a -->
						<div class="styGenericDiv" style="width:177mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBoxSD">5</div>
								<div class="styLNDesc" style="width:123.7mm;">
									<span style="float:left;">
										<span style="width:15mm;">Dividends:</span>
										<b>a</b> Ordinary dividends </span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">....................</div>
								</div>
							</div>
							<div style="float:right;clear:none">
								<div class="styLNRightNumBox" style="width:12.3mm;">5a</div>
								<div class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/OrdinaryDividendsAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- BEGIN Schedule K, Line 5b -->
						<div class="styGenericDiv" style="width:177mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBoxSD"/>
								<div class="styLNDesc" style="width:84.7mm;">
									<span style="float:left;">
										<span style="width:15mm;"/>
										<b>b</b> Qualified dividends </span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1.4mm;">..........</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">5b</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/QualifiedDividendsAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBoxNBB" style="width:12.3mm;height:4.5mm;background-color:lightgrey"/>
								<div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
							</div>
						</div>
						<!-- BEGIN Schedule K, Line 6-->
						<div class="styGenericDiv" style="width:177mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBoxSD">6</div>
								<div class="styLNDesc" style="width:123.7mm;">
									<span style="float:left;">Royalties </span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">...........................</div>
								</div>
							</div>
							<div style="float:right;clear:none">
								<div class="styLNRightNumBox" style="width:12.3mm;">6</div>
								<div class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/RoyaltiesReceivedAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- BEGIN Schedule K, Line 7-->
						<div class="styGenericDiv" style="width:177mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBoxSD">7</div>
								<div class="styLNDesc" style="width:123mm;">
									<span style="float:left;">Net short&#8211;term capital gain (loss) (attach Schedule D (Form 1120&#8211;S))
										<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/NetSTCapitalGainOrLossAmt"/>
										</xsl:call-template>
									</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">.......</div>
								</div>
							</div>
							<div style="float:right;clear:none">
								<div class="styLNRightNumBox" style="width:12.3mm;">7</div>
								<div class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/NetSTCapitalGainOrLossAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- BEGIN Schedule K, Line 8a-->
						<div class="styGenericDiv" style="width:177mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBoxSD">8a</div>
								<div class="styLNDesc" style="width:123.7mm;">
									<span style="float:left;">Net long&#8211;term capital gain (loss) (attach Schedule D (Form 1120&#8211;S))
										<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/NetLTCapitalGainOrLossAmt"/>
										</xsl:call-template>
									</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">.......</div>
								</div>
							</div>
							<div style="float:right;clear:none">
								<div class="styLNRightNumBox" style="width:12.3mm;height:4.5mm;">8a</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/NetLTCapitalGainOrLossAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- BEGIN Schedule K, Line 8b-->
						<div class="styGenericDiv" style="width:177mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBoxSD" style="padding-left:4mm;">b</div>
								<div class="styLNDesc" style="width:84.7mm;">
									<span style="float:left;">Collectibles (28%) gain (loss)
										<span style="width:2px;"/>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/CollectiblesGainLossAmt"/>
										</xsl:call-template>
									</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">..........</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">8b</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/CollectiblesGainLossAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBoxNBB" style="width:12.3mm;height:4.5mm;background-color:lightgrey;"/>
								<div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
							</div>
						</div>
						<!-- BEGIN Schedule K, Line 8c-->
						<div class="styGenericDiv" style="width:177mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBoxSD" style="padding-left:4mm;">c</div>
								<div class="styLNDesc" style="width:84.7mm;">
									<span style="float:left;">Unrecaptured section 1250 gain (attach statement)
										<span style="width:2px;"/>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/UnrecapturedSection1250GainAmt"/>
										</xsl:call-template>
									</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">...</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">8c</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/UnrecapturedSection1250GainAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBoxNBB" style="width:12.3mm;height:4.5mm;background-color:lightgrey;"/>
								<div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
							</div>
						</div>
						<!-- BEGIN Schedule K, Line 9-->
						<div class="styGenericDiv" style="width:177mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBoxSD">9</div>
								<div class="styLNDesc" style="width:123.7mm;">
									<span style="float:left;">Net section 1231 gain (loss) (attach Form 4797)
										<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/NetSection1231GainLossAmt"/>
										</xsl:call-template>
									</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">..............</div>
								</div>
							</div>
							<div style="float:right;clear:none">
								<div class="styLNRightNumBox" style="width:12.3mm;">9</div>
								<div class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/NetSection1231GainLossAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- BEGIN Schedule K, Line 10-->
						<!-- Exception: IE limitation, browser display take precedent over print out -->
						<div class="styGenericDiv" style="width:177mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox">10</div>
								<div class="styLNDesc" style="width:123.7mm;">
									<span style="float:left;">Other income (loss) (see instructions)
										<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/OtherIncomeLossAmt"/>
										</xsl:call-template>
									</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:left;padding-right:1mm;">.....</div>
									Type <img src="{$ImagePath}/1120S_Bullet_Md.gif" alt="Right Pointing Arrow"/>
									<span style="width:35mm;padding-left:2mm">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/OtherIncomeLossAmt/@otherIncomeTyp"/>
										</xsl:call-template>
										<!--	</span>-->
										<span style="padding-left:2mm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/OtherIncomeLossAmt/@globalIntangibleLowTxIncmAmt"/>
											</xsl:call-template>
										</span>
									</span>
								</div>
							</div>
							<div style="float:right;clear:none">
								<div class="styLNRightNumBoxNBB" style="width:12.3mm;height:7.5mm;padding-top:4mm;">10</div>
								<div class="styLNAmountBoxNBB" style="height:7.5mm;padding-top:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/OtherIncomeLossAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- BEGIN Schedule K, Deduction Section -->
					<div class="styBB" style="width:187mm;float:none;clear:none;">
						<span class="styIRS1120SVTImageBox" style="width:10mm;height:23.8mm;padding-top:4mm;text-align:center;">
							<img src="{$ImagePath}/1120S_Deductions.gif" alt="Schedule K, Deduction Section" valign="center" height="60mm;"/>
						</span>
						<!-- BEGIN Schedule K, Line 11-->
						<div class="styGenericDiv" style="width:177mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox">11</div>
								<div class="styLNDesc" style="width:123.7mm;">
									<span style="float:left;">Section 179 deduction (attach Form 4562)
										<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/Section179ExpenseDeductionAmt"/>
										</xsl:call-template>
									</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">................</div>
								</div>
							</div>
							<div style="float:right;clear:none">
								<div class="styLNRightNumBox" style="width:12.3mm;height:4.5mm;">11</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/Section179ExpenseDeductionAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- BEGIN Schedule K, Line 12a-->
						<div class="styGenericDiv" style="width:177mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox">12a</div>
								<div class="styLNDesc" style="width:123.7mm;">
									<span style="float:left;">Charitable contributions
										<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/CharitableContributionsTotAmt"/>
										</xsl:call-template>
									</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">.....................</div>
								</div>
							</div>
							<div style="float:right;clear:none">
								<div class="styLNRightNumBox" style="width:12.3mm;height:4.5mm;">12a</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/CharitableContributionsTotAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- BEGIN Schedule K, Line 12b-->
						<div class="styGenericDiv" style="width:177mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
								<div class="styLNDesc" style="width:123.7mm;">
									<span style="float:left;">Investment interest expense										
									</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">.....................</div>
								</div>
							</div>
							<div style="float:right;clear:none">
								<div class="styLNRightNumBox" style="width:12.3mm;">12b</div>
								<div class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/InterestExpenseOnInvstDbAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- BEGIN Schedule K, Line 12c -->
						<div class="styGenericDiv" style="width:177mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">c</div>
								<div class="styLNDesc" style="width:124.7mm;height:4mm">
									<span style="float:left;">Section 59(e)(2) expenditures <span class="styBoldText">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/Section59e2ExpenditureAmt"/>
											</xsl:call-template>
											<span style="width:1.2mm"/>
											<div class="styDotLn" style="float:right;padding-right:1mm;">.......</div>
										</span> 
										Type <img src="{$ImagePath}/1120S_Bullet_Md.gif" alt="Right Pointing Arrow"/>
									</span>
									<span class="styIRS1120SBBText" style="width:35.75mm;height:4mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/Sect59e2ExpenditureDesc"/>
										</xsl:call-template>
									</span>
									<span class="styLNDesc" style="width:25mm;height:4mm;text-align:center">
										<!--<span class="styBoldText">(2) </span> 
											Amount <img src="{$ImagePath}/1120S_Bullet_Md.gif" alt="Right Pointing Arrow"/>-->
										<!-- Form to Form Link -->
									</span>
									<!--Dotted Line-->
									<!--<div class="styDotLn" style="float:right;padding-right:1mm;">..</div>-->
								</div>
							</div>
							<div style="float:right;clear:none">
								<div class="styLNRightNumBox" style="width:12.3mm;height:5.5mm;padding-top:2mm;">12c</div>
								<div class="styLNAmountBox" style="height:5.5mm;padding-top:2mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/Section59e2ExpenditureAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- BEGIN Schedule K, Line 12d-->
						<!-- Exception: IE limitation, browser display take precedent over print out -->
						<div class="styGenericDiv" style="width:177mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">d</div>
								<div class="styLNDesc" style="width:123.7mm;">
									<span style="float:left;">Other deductions (see instructions)
										<span style="width:2px;"/>
										<!-- Push Pin -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/OtherDeductionsAmt"/>
											<xsl:with-param name="IDstring">1120SSchKLine10</xsl:with-param>
										</xsl:call-template>
										<!-- Pen and ink -->
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Schedule K, Line 12d - Form 4684 Indicator </xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/OtherDeductionsAmt/@form4684Cd"/>
										</xsl:call-template>
									</span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:left;padding-right:1mm;">.....</span>
									 Type <img src="{$ImagePath}/1120S_Bullet_Md.gif" alt="Right Pointing Arrow"/>
									<span style="width:35mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/OtherDeductionsAmt/@otherDeductionsDesc"/>
										</xsl:call-template>
									</span>
								</div>
							</div>
							<div style="float:right;clear:none">
								<div class="styLNRightNumBoxNBB" style="width:12.3mm;height:5.2mm;padding-top:2mm;">12d</div>
								<div class="styLNAmountBoxNBB" style="height:5.2mm;padding-top:2mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/OtherDeductionsAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- BEGIN BEGIN Schedule K, Credits Section -->
					<div class="styBB" style="width:187mm;float:none;clear:none;">
						<!--<span class="styIRS1120SVTImageBox" style="width:10mm;height:31.5mm;padding-top:10mm;text-align:center;">-->
						<span class="styIRS1120SVTImageBox" style="width:10mm;height:35mm;padding-top:10mm;text-align:center;">
							<img src="{$ImagePath}/1120S_Credits.gif" alt="Schedule K, Credit Section" valign="center" height="40mm;"/>
						</span>
						<!-- BEGIN Schedule K, Line 13a-->
						<div class="styGenericDiv" style="width:177mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox">13a</div>
								<div class="styLNDesc" style="width:123.7mm;">
									<span style="float:left;">Low&#8211;income housing credit (section 42(j)(5))
										<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/LowIncmHsngCrSect42j5PrtshpAmt"/>
										</xsl:call-template>
									</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">...............</div>
								</div>
							</div>
							<div style="float:right;clear:none">
								<div class="styLNRightNumBox" style="width:12.3mm;height:4.5mm;">13a</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/LowIncmHsngCrSect42j5PrtshpAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- BEGIN Schedule K, Line 13b-->
						<div class="styGenericDiv" style="width:177mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
								<div class="styLNDesc" style="width:123.7mm;">
									<span style="float:left;">Low&#8211;income housing credit (other)
										<!-- Form to Form Link   -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/LowIncomeHousingCrOthPrtshpAmt"/>
										</xsl:call-template>
									</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">..................</div>
								</div>
							</div>
							<div style="float:right;clear:none">
								<div class="styLNRightNumBox" style="width:12.3mm;height:4.5mm;">13b</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/LowIncomeHousingCrOthPrtshpAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- BEGIN Schedule K, Line 13c-->
						<!-- Exception: IE limitation, browser display take precedent over print out -->
						<div class="styGenericDiv" style="width:177mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">c</div>
								<div class="styLNDesc" style="width:123.7mm;">
									<span style="float:left;">Qualified rehabilitation expenditures (rental real estate) (attach Form 3468, if applicable)
										<!-- Form to Form Link   -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/QlfyRehbltExpendRntlREActyAmt"/>
										</xsl:call-template>
									</span>
								</div>
							</div>
							<div style="float:right;clear:none">
								<div class="styLNRightNumBox" style="width:12.3mm;height:4.5mm;">13c</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/QlfyRehbltExpendRntlREActyAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- BEGIN Schedule K, Line 13d-->
						<div class="styGenericDiv" style="width:177mm;">
							<div style="float:left;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">d</div>
								<div class="styLNDesc" style="width:123.7mm;">
									<span style="float:left;">Other rental real estate credits (see instructions)
										<span style="width:2px;"/>
										<!-- Push Pin -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/OtherRentalRealEstateAmt"/>
											<xsl:with-param name="IDstring">1120SSchKLine10</xsl:with-param>
										</xsl:call-template>
										<span style="width:8px;"/>
									</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:left;padding-right:1mm;">.</div>
									Type <img src="{$ImagePath}/1120S_Bullet_Md.gif" alt="Right Pointing Arrow"/>
									<span style="width:33mm;border-bottom:1px solid black;;padding-left:1mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/OtherRentalRealEstateAmt/@otherRentalRealEstateCrDesc"/>
										</xsl:call-template>
									</span>
								</div>
							</div>
							<div style="float:right;">
								<div class="styLNRightNumBox" style="width:12.3mm;height:4.5mm;">13d</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/OtherRentalRealEstateAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- BEGIN Schedule K, Line 13e-->
						<div class="styGenericDiv" style="width:177mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">e</div>
								<div class="styLNDesc" style="width:123.7mm;">
									<span style="float:left;">Other rental credits (see instructions)
										<span style="width:2px;"/>
										<!-- Push Pin -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/OtherRentalCreditsAmt"/>
											<xsl:with-param name="IDstring">1120SSchKLine10</xsl:with-param>
										</xsl:call-template>
										<span style="width:.3px;"/>
									</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:left;padding-right:1mm;">.....</div>
									Type <img src="{$ImagePath}/1120S_Bullet_Md.gif" alt="Right Pointing Arrow"/>
									<span style="width:33mm;border-bottom:1px solid black;;padding-left:1mm;"> See Additional Data
										<!--<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/OtherRentalCreditsAmt/@otherRentalCreditDesc"/>
										</xsl:call-template>-->
									</span>
								</div>
							</div>
							<div style="float:right;clear:none">
								<div class="styLNRightNumBox" style="width:12.3mm;height:4.5mm;">13e</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/OtherRentalCreditsAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- BEGIN Schedule K, Line 13f-->
						<div class="styGenericDiv" style="width:177mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">f</div>
								<div class="styLNDesc" style="width:123.7mm;">
									<span style="float:left;">Biofuel producer credit (attach Form 6478)
										<!-- Form to Form Link   -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/AlcoholFuelCreditAmt"/>
										</xsl:call-template>
									</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">................</div>
								</div>
							</div>
							<div style="float:right;clear:none">
								<div class="styLNRightNumBox" style="width:12.3mm;height:4.5mm;">13f</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/AlcoholFuelCreditAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- BEGIN Schedule K, Line 13g-->
						<!-- Exception: IE limitation, browser display take precedent over print out -->
						<div class="styGenericDiv" style="width:177mm;">
							<div style="float:left;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">g</div>
								<div class="styLNDesc" style="width:123.7mm;">
									<span style="float:left;">Other credits (see instructions)
										<span style="width:2px;"/>
										<!-- Push Pin -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/OtherCreditsAmt"/>
											<xsl:with-param name="IDstring">1120SSchKLine10</xsl:with-param>
										</xsl:call-template>
										<span style="width:2px;"/>
									</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:left;padding-right:1mm;">.......</div>
									Type <img src="{$ImagePath}/1120S_Bullet_Md.gif" alt="Right Pointing Arrow"/>
									<span style="width:33mm;border-bottom:1px solid black;;padding-left:1mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/OtherCreditsAmt/@otherCreditsTotalDesc"/>
										</xsl:call-template>
										<!--</span>-->
										<span style=";padding-left:2mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/OtherCreditsAmt/@emplrCrPdFamilyMedLeaveAmt"/>
											</xsl:call-template>
										</span>
									</span>
								</div>
							</div>
							<div style="float:right;">
								<div class="styLNRightNumBoxNBB" style="width:12.3mm;height:8mm;padding-top:4mm">13g</div>
								<div class="styLNAmountBoxNBB" style="height:8mm;padding-top:4mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/OtherCreditsAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- BEGIN Schedule K, Foreign Transactions Section -->
					<!--  Schedule K, Line 14-->
					<!-- Customer review on PKG3 indicatge this rest of section is split to the next page add display: block; 
						  when transform it looks like it fix the issue but when get check the next day it did not.  
                          If display at 101% then display has no problem but >101% the display will split. -->
					<div class="styBB" style="width:187mm; ">
						<span class="styIRS1120SVTImageBox" style="width:10mm;height:25mm;padding-top:2mm;padding-right: 2mm;">
							<img src="{$ImagePath}/1120SSchK_Transactions1.gif" alt="Schedule K, International Transactions Section" valign="center"/>
						</span>
							<!-- BEGIN Schedule K, Line 14-->
						<div class="styGenericDiv" style="width:177mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox" style="padding-left:1mm;padding-top:10mm;">14</div>
								<div class="styLNDesc" style="width:168mm;height:4.5mm;padding-top:10mm;">
								<!--<div class="styLNDesc" style="width:123.7mm;height:4.5mm;padding-top:10mm;">-->
									Attach Schedule K-2 (Form 1120-S), Shareholders’ Pro Rata Share Items—International, and check this box to indicate you are reporting items of international tax relevance 
									<span style="width:2px;"/>
										<!-- Push Pin -->
										<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/IntntlTaxRelevanceRptgInd"/>
											<!--<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/OtherCreditsAmt"/>-->
											<xsl:with-param name="IDstring">1120SSchKLine14</xsl:with-param>
										</xsl:call-template>
										<span style="width:2px;"/>					
       <span class="styDotLn" style="float:right;padding-right:1mm;">........................
									<input type="checkbox" alt="Intntl Tax Relevance Rptg Ind" class="styCkbox" style="margin:2px;">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/IntntlTaxRelevanceRptgInd"/>
											<xsl:with-param name="BackupName">IntntlTaxRelevanceRptgInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/IntntlTaxRelevanceRptgInd"/>
											<xsl:with-param name="BackupName">TotalForeignTaxesPaidLabel</xsl:with-param>
										</xsl:call-template>
									</label>
                                   </span>
								</div>
							</div>
						</div>
					</div>
					<!-- END Schedule K, Foreign Transactions Section Line Items -->
					<!-- BEGIN Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:right;">
							<span style="width:80px;"/>  
							Form <span class="styBoldText" style="font-size:8pt;">1120&#8211;S</span> (2021)
						</div>
					</div>
					<!-- END Page Break and Footer-->
					<!-- BEGIN Page 4 Header-->
					<div class="styBB" style="width:187mm;padding-top:.5mm; float:none; clear:both;">
						<div style="float:left;">Form 1120&#8211;S (2021)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">
							Page <span style="font-weight:bold;font-size:8pt;">4</span>
						</div>
					</div>
					<!-- END Page 4 Header-->
					<!-- BEGIN Schedule K Title -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width: 21mm;height:4.25mm;">Schedule K</div>
						<div class="styPartDesc" style="width: 121.5mm;height:4.25mm;">
							Shareholders’ Pro Rata Share Items 
							<span style="font-weight:normal;">
								<i> (continued)</i>
							</span>
						</div>
						<span class="styLNAmountBox" style="width:44mm;height:4.25mm;text-align:center;border-bottom-width:0px;">
							<b>Total amount </b>
						</span>
					</div>
					<!-- BEGIN Schedule K, Alternative Minimum Tax (AMT) Section Line Items -->
					<div class="styBB" style="width:187mm;float:none;clear:none;">
						<span class="styIRS1120SVTImageBox" style="width:10mm;height:25mm;padding-top:5.5mm;text-align:center;">
						<img src="{$ImagePath}/1120SSchK_Items.gif" alt="Schedule K, Alternative Mininum Tax (AMT) Section" valign="center" height="60mm;"/>
						</span>
						<!-- BEGIN Schedule K, Line 15a-->
						<div class="styGenericDiv" style="width:177mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox">15a</div>
								<div class="styLNDesc" style="width:123.7mm;">
									<span style="float:left;">Post&#8211;1986 depreciation adjustment </span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">...................</div>
								</div>
							</div>
							<div style="float:right;clear:none">
								<div class="styLNRightNumBox" style="width:12.3mm;">15a</div>
								<div class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/Post1986DepreciationAdjAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- BEGIN Schedule K, Line 15b-->
						<div class="styGenericDiv" style="width:177mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
								<div class="styLNDesc" style="width:123.7mm;">
									<span style="float:left;">Adjusted gain or loss  
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/AdjustedGainOrLossAmt"/>
										</xsl:call-template>
									</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">......................</div>
								</div>
							</div>
							<div style="float:right;clear:none">
								<div class="styLNRightNumBox" style="width:12.3mm;height:4.5mm;">15b</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/AdjustedGainOrLossAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- BEGIN Schedule K, Line 15c-->
						<div class="styGenericDiv" style="width:177mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">c</div>
								<div class="styLNDesc" style="width:123.7mm;">
									<span style="float:left;">Depletion (other than oil and gas) </span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">...................</div>
								</div>
							</div>
							<div style="float:right;clear:none">
								<div class="styLNRightNumBox" style="width:12.3mm;">15c</div>
								<div class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/DepletionOtherThanOilAndGasAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- BEGIN Schedule K, Line 15d-->
						<div class="styGenericDiv" style="width:177mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">d</div>
								<div class="styLNDesc" style="width:123.7mm;">
									<span style="float:left;">Oil, gas, and geothermal properties&#8212;gross income </span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">..............</div>
								</div>
							</div>
							<div style="float:right;clear:none">
								<div class="styLNRightNumBox" style="width:12.3mm;">15d</div>
								<div class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/OilGasAndGeothermalGroIncmAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- BEGIN Schedule K, Line 15e-->
						<div class="styGenericDiv" style="width:177mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">e</div>
								<div class="styLNDesc" style="width:123.7mm;">
									<span style="float:left;">Oil, gas, and geothermal properties&#8212;deductions </span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">...............</div>
								</div>
							</div>
							<div style="float:right;clear:none">
								<div class="styLNRightNumBox" style="width:12.3mm;">15e</div>
								<div class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/OilGasAndGeothermalDedsAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- BEGIN Schedule K, Line 15f-->
						<!-- Exception: IE limitation, browser display take precedent over print out -->
						<div class="styGenericDiv" style="width:177mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">f</div>
								<div class="styLNDesc" style="width:123.7mm;">
									<span style="float:left;">Other AMT items (attach statement)
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/OtherAMTItemsAmt"/>
										</xsl:call-template>
									</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">..................</div>
								</div>
							</div>
							<div style="float:right;clear:none">
								<div class="styLNRightNumBoxNBB" style="width:12.3mm;height:4.5mm;">15f</div>
								<div class="styLNAmountBoxNBB" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/OtherAMTItemsAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- BEGIN Schedule K, Items Affecting Shareholder Basis Section Line Items -->
					<div class="styBB" style="width:187mm; float:none; clear:none;">
						<span class="styIRS1120SVTImageBox" style="width:10mm; height:26mm; padding-top:2mm; text-align:center;">
							<img src="{$ImagePath}/1120SSchK_Basis.gif" alt="Schedule K, Items Affecting Shareholder Basis" valign="center" height="70mm;"/>
						</span>
						<!-- BEGIN Schedule K, Line 16a-->
						<div class="styGenericDiv" style="width:177mm;">
							<div style="float:left; clear:none;">
								<div class="styLNLeftNumBox">16a</div>
								<div class="styLNDesc" style="width:123.7mm;">
									<span style="float:left;">Tax&#8211;exempt interest income </span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right; padding-right:1mm;">.....................</div>
								</div>
							</div>
							<div style="float:right; clear:none">
								<div class="styLNRightNumBox" style="width:12.3mm;">16a</div>
								<div class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/TaxExemptInterestIncomeAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- BEGIN Schedule K, Line 16b-->
						<div class="styGenericDiv" style="width:177mm">
							<div style="float:left; clear:none;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
								<div class="styLNDesc" style="width:123.7mm;">
									<span style="float:left;">Other tax&#8211;exempt income
									</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right; padding-right:1mm;">......................</div>
								</div>
							</div>
							<div style="float:right; clear:none">
								<div class="styLNRightNumBox" style="width:12.3mm; height:4.5mm;">16b</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/OtherTaxExemptIncomeAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- BEGIN Schedule K, Line 16c-->
						<div class="styGenericDiv" style="width:177mm;">
							<div style="float:left; clear:none;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">c</div>
								<div class="styLNDesc" style="width:123.7mm;">
									<span style="float:left;">Nondeductible expenses 
									</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right; padding-right:1mm;">......................</div>
								</div>
							</div>
							<div style="float:right; clear:none">
								<div class="styLNRightNumBox" style="width:12.3mm;height:4.5mm;">16c</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/NondeductibleExpensesAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- BEGIN Schedule K, Line 16d-->
						<div class="styGenericDiv" style="width:177mm;">
							<div style="float:left; clear:none;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">d</div>
								<div class="styLNDesc" style="width:123.7mm;">
									<span style="float:left;">Distributions (attach statement if required) (see instructions)
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/DistributionsOtherThanDivAmt"/>
										</xsl:call-template>
									</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right; padding-right:1mm;">..........</div>
								</div>
							</div>
							<div style="float:right; clear:none">
								<div class="styLNRightNumBox" style="width:12.3mm; height:4.5mm;">16d</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/DistributionsOtherThanDivAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- BEGIN Schedule K, Line 16e-->
						<div class="styGenericDiv" style="width:177mm">
							<div style="float:left; clear:none;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">e</div>
								<div class="styLNDesc" style="width:123.7mm;">
									<span style="float:left;">Repayment of loans from shareholders 
									</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right; padding-right:1mm;">..................</div>
								</div>
							</div>
							<div style="float:right; clear:none">
							<div class="styLNRightNumBox" style="width:12.3mm; height:4.5mm;">16e</div>
								<!--<div class="styLNRightNumBoxNBB" style="width:12.3mm; height:5mm;">16e</div>-->
								<!--<div class="styLNAmountBoxNBB" style="height:5mm;">-->
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/ShareholderLoanRepaymentAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					<!--</div>-->
					<!-- BEGIN Schedule K, Line 16f-->
						<div class="styGenericDiv" style="width:177mm;">
							<div style="float:left; clear:none;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">f</div>
								<div class="styLNDesc" style="width:123.7mm;">
									<span style="float:left;">Foreign taxes paid or accrued
									</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right; padding-right:1mm;">....................</div>
								</div>
							</div>
							<div style="float:right; clear:none">
								<div class="styLNRightNumBoxNBB" style="width:12.3mm; height:4.5mm;">16f</div>
								<div class="styLNAmountBoxNBB" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/TotalForeignTaxesPaidOrAccrAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- BEGIN Schedule K, Other Information Section -->
					<div class="styBB" style="width:187mm; float:none; clear:none;">
						<span class="styIRS1120SVTImageBox" style="width:10mm; height:17.5mm; padding-top:1mm; text-align:center;">
							<img src="{$ImagePath}/1120S_Other_2.gif" alt="Schedule K, Other Information" valign="center" height="60mm;"/>
						</span>
						<!-- BEGIN Schedule K, Line 17a-->
						<div class="styGenericDiv" style="width:177mm;">
							<div style="float:left; clear:none;">
								<div class="styLNLeftNumBox">17a</div>
								<div class="styLNDesc" style="width:123.7mm;">
									<span style="float:left;">Investment income </span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">........................</div>
								</div>
							</div>
							<div style="float:right;clear:none">
								<div class="styLNRightNumBox" style="width:12.3mm;">17a</div>
								<div class="styLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/InvestmentIncomeAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- BEGIN Schedule K, Line 17b-->
						<div class="styGenericDiv" style="width:177mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
								<div class="styLNDesc" style="width:123.7mm;">
									<span style="float:left;">Investment expenses 
									</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">.......................</div>
								</div>
							</div>
							<div style="float:right;clear:none">
								<div class="styLNRightNumBox" style="width:12.3mm;height:4.5mm;">17b</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/InvestmentExpenseAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- BEGIN Schedule K, Line 17c-->
						<div class="styGenericDiv" style="width:177mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">c</div>
								<div class="styLNDesc" style="width:123.7mm;">
									<span style="float:left;">Dividend distributions paid from accumulated earnings and profits 
									</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">.........</div>
								</div>
							</div>
							<div style="float:right;clear:none">
								<div class="styLNRightNumBox" style="width:12.3mm;height:4.5mm;">17c</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/DivDistriPaidAccumEarnPrftAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- BEGIN Schedule K, Line 17d-->
						<!-- Exception: IE limitation, browser display take precedent over print out -->
						<div class="styGenericDiv" style="width:177mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox" style="padding-left:4mm;">d</div>
								<div class="styLNDesc" style="width:123.7mm;">
									<span style="float:left;">Other items and amounts (attach statement)
									</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">................</div>
								</div>
							</div>
							<div style="float:right;clear:none">
								<div class="styLNRightNumBoxNBB" style="width:12.3mm;height:4.5mm;background-color:lightgrey;"/>
								<div class="styLNAmountBoxNBB" style="height:4.5mm;background-color:lightgrey;">
								</div>
							</div>
						</div>
					</div>
					<!-- BEGIN Schedule K, Other Information Section -->
					<div class="styBB" style="width:187mm;float:none;clear:none;">
						<span class="styIRS1120SVTImageBox" style="width:10mm;height:15mm;padding-top:1.5mm;text-align:center">
							<img src="{$ImagePath}/1120S_Recon.gif" alt="Schedule K, Reconciliation" valign="center;" height="45mm;"/>
						</span>
						<!-- BEGIN Schedule K, Line 18-->
						<div class="styGenericDiv" style="width:177mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:8mm;padding-top:8mm;">18</div>
								<div class="styLNDesc" style="width:123.7mm;height:10mm;padding-top:8mm;">
									<span style="float:left;">
										<b>Income/loss reconciliation.</b>  
										Combine the amounts on lines 1 through 10 in the far right column. From the result, subtract the 
										sum of the amounts on lines 11 through 12d and 16f
									</span>
								</div>
							</div>
							<div style="float:right;clear:none">
								<div class="styLNRightNumBoxNBB" style="width:12.3mm;height:10.3mm;padding-top:10.3mm;">18</div>
								<div class="styLNAmountBoxNBB" style="height:10.3mm;padding-top:10.3mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/IncomeLossReconciliationAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- BEGIN Schedule K, blank Line -->
						<div class="styGenericDiv" style="width:177mm;height:3mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox"/>
								<div class="styLNDesc" style="width:123.7mm;">
								</div>
							</div>
							<div style="float:right;clear:none">
								<div class="styLNRightNumBoxNBB" style="width:12.3mm;height:4.5mm;"/>
								<div class="styLNAmountBoxNBB" style="height:4.5mm;">
								</div>
							</div>
						</div>
					</div>
					<!-- END Schedule K Line Items -->
					<!-- BEGIN Schedule L Title -->
					<div class="styBB" style="width:187mm; float:none;">
						<div class="styPartName" style="width:21mm; height:4.25mm;">Schedule L</div>
						<div class="styPartDesc" style="width:37mm; height:4.25mm; font-size:6pt; padding-top:1mm;">Balance Sheets per Books</div>
						<div class="styLNAmountBox" style="text-align:center; border-bottom-width:0px; width:64mm; height:4.25mm;">Beginning of tax year</div>
						<div class="styLNAmountBox" style="text-align:center; border-bottom-width:0px; width:64mm; height:4.25mm;">End of tax year</div>
					</div>
					<!-- END Schedule L Title -->
					<!-- BEGIN Schedule L Line Items -->
					<div style="width:187mm; float:none;">
						<div class="styLNLeftNumBox" style="height:4.5mm;"/>
						<div class="styGenericDiv" style="width:50mm; height:4.5mm; text-align:center; font-weight:bold;">Assets</div>
						<div class="styLNAmountBox" style="height:4.5mm; text-align:center; font-weight:bold;">(a)</div>
						<div class="styLNAmountBox" style="height:4.5mm; text-align:center; font-weight:bold;">(b)</div>
						<div class="styLNAmountBox" style="height:4.5mm; text-align:center; font-weight:bold;">(c)</div>
						<div class="styLNAmountBox" style="height:4.5mm; text-align:center; font-weight:bold;">(d)</div>
					</div>
					<!-- BEGIN Schedule L Line 1 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4.5mm;">1</div>
						<div class="styGenericDiv" style="width:50mm; height:4.5mm; padding-top:0.5mm">
							<span style="float:left;">Cash</span>
							<span class="styDotLn" style="float:right; padding-right:1mm;">..........</span>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm; padding-top:1.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/CashBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm; padding-top:1.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/CashEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN Schedule L Line 2a -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4.5mm;">2a</div>
						<div class="styGenericDiv" style="width:50mm; height:4.5mm; padding-top:0.5mm">Trade notes and accounts receivable</div>
						<div class="styLNAmountBox" style="height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/TradeNotesAccountsRcvblBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styLNAmountBox" style="height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/TradeNotesAccountsRcvblEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
					</div>
					<!-- BEGIN Schedule L Line 2b -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4.5mm; padding-left:4mm;">b</div>
						<div class="styGenericDiv" style="width:50mm; height:4.5mm; padding-top:0.3mm">
							<span style="float:left">Less allowance for bad debts </span>
							<span class="styDotLn" style="float:right; padding-right:1mm;">...</span>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/BadDebtAllowanceBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/NetTradeNotesAcctRcvblBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/BadDebtAllowanceEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/NetTradeNotesAcctRcvblEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN Schedule L Line 3 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4.5mm;">3</div>
						<div class="styGenericDiv" style="width:50mm; height:4.5mm;">
							<span style="float:left;">Inventories </span>
							<span class="styDotLn" style="float:right; padding-right:1mm;">........</span>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styLNAmountBox" style="height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/InventoriesBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styLNAmountBox" style="height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/InventoriesEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN Schedule L Line 4 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4.5mm;">4</div>
						<div class="styGenericDiv" style="width:50mm; height:4.5mm; padding-top:0.3mm">
							<span style="float:left;">U.S. government obligations </span>
							<span class="styDotLn" style="float:right; padding-right:1mm;">...</span>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styLNAmountBox" style="height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/USGovernmentObligationsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styLNAmountBox" style="height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/USGovernmentObligationsEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN Schedule L Line 5 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:7mm;">5</div>
						<div class="styGenericDiv" style="width:50mm; height:7mm; padding-top:0.3mm;">
							Tax&#8211;exempt securities (see instructions) 
							<span class="styDotLn" style="float:right; padding-right:1mm;">........</span>
						</div>
						<div class="styShadingCell" style="height:7mm;"/>
						<div class="styLNAmountBox" style="height:7mm; padding-top:3.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/TaxExemptSecuritiesBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:7mm;"/>
						<div class="styLNAmountBox" style="height:7mm; padding-top:3.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/TaxExemptSecuritiesEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN Schedule L Line 6 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4.5mm; padding-top:1mm;">6</div>
						<div class="styGenericDiv" style="width:50mm; height:4.5mm; padding-top:1mm;">
							Other current assets (attach statement) 
							<span class="styDotLn" style="float:right; padding-right:1mm;"/>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styLNAmountBox" style="width:4mm; height:4.5mm;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/OtherCurrentAssetsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120SLNAmountBoxNLB" style="width:28mm; height:4.5mm; padding-top:1mm; left-border:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/OtherCurrentAssetsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styLNAmountBox" style="width:4mm; height:4.5mm;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/OtherCurrentAssetsEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120SLNAmountBoxNLB" style="width:28mm; height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/OtherCurrentAssetsEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN Schedule L Line 7 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4.5mm;">7</div>
						<div class="styGenericDiv" style="width:50mm; height:4.5mm;">
							<span style="float:left">Loans to shareholders </span>
							<span class="styDotLn" style="float:right; padding-right:1mm;">.....</span>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styLNAmountBox" style="height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/LoansToShareholdersBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styLNAmountBox" style="height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/LoansToShareholdersEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN Schedule L Line 8 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4.5mm;">8</div>
						<div class="styGenericDiv" style="width:50mm; height:4.5mm;">
							<span style="float:left">Mortgage and real estate loans </span>
							<span class="styDotLn" style="float:right; padding-right:1mm;">..</span>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styLNAmountBox" style="height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/MortgageRealEstateLoansBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styLNAmountBox" style="height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/MortgageRealEstateLoansEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN Schedule L Line 9 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4.5mm; padding-top:1mm;">9</div>
						<div class="styGenericDiv" style="width:50mm; height:4.5mm; padding-top:1mm;">Other investments (attach statement) </div>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styLNAmountBox" style="width:4mm; height:4.5mm;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/OtherInvestmentsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120SLNAmountBoxNLB" style="width:28mm; height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/OtherInvestmentsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styLNAmountBox" style="width:4mm; height:4.5mm;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/OtherInvestmentsEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120SLNAmountBoxNLB" style="width:28mm; height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/OtherInvestmentsEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN Schedule L Line 10a -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">10a</div>
						<div class="styGenericDiv" style="width:50mm; height:4.5mm; padding-top:.5mm;">
							Buildings and other depreciable assets
						</div>
						<div class="styLNAmountBox" style="height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/BuildingOtherDeprecAstBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styLNAmountBox" style="height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/BuildingOtherDeprecAstEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
					</div>
					<!-- BEGIN Schedule L Line 10b -->
					<div style="width:187mm;">
						<div class="styIRS1120SLNLeftLtrBoxTD" style="height:4.5mm; padding-top:1mm;">b</div>
						<div class="styGenericDiv" style="width:50mm; height:4.5mm; padding-top:1mm;">
							<span style="float:left">Less accumulated depreciation </span>
							<span class="styDotLn" style="float:right; padding-right:1mm;">..</span>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/AccumulatedDepreciationBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/NetDepreciableAssetsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/AccumulatedDepreciationEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/NetDepreciableAssetsEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN Schedule L Line 11a -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm; padding-top:1mm;">11a</div>
						<div class="styGenericDiv" style="width:50mm; height:4.5mm;  padding-top:1mm;">
							<span style="float:left">Depletable assets </span>
							<span class="styDotLn" style="float:right; padding-right:1mm;">......</span>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/DepletableAssetsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styLNAmountBox" style="height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/DepletableAssetsEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
					</div>
					<!-- BEGIN Schedule L Line 11b -->
					<div style="width:187mm;">
						<div class="styIRS1120SLNLeftLtrBoxTD" style="height:4.5mm; padding-top:1mm;">b</div>
						<div class="styGenericDiv" style="width:50mm; height:4.5mm;  padding-top:1mm;">
							<span style="float:left">Less accumulated depletion </span>
							<span class="styDotLn" style="float:right; padding-right:1mm;">..</span>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/AccumulatedDepletionBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/NetDepletableAssetsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/AccumulatedDepletionEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/NetDepletableAssetsEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN Schedule L Line 12 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm; padding-top:1mm;">12</div>
						<div class="styGenericDiv" style="width:50mm; height:4.5mm;  padding-top:1mm;">
							<span style="float:left">Land (net of any amortization) </span>
							<span class="styDotLn" style="float:right; padding-right:1mm;">..</span>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styLNAmountBox" style="height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/LandBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styLNAmountBox" style="height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/LandEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN Schedule L Line 13a -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm; padding-top:1mm;">13a</div>
						<div class="styGenericDiv" style="width:50mm; height:4.5mm;  padding-top:1mm;">Intangible assets (amortizable only)</div>
						<div class="styLNAmountBox" style="height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/IntangibleAssetsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styLNAmountBox" style="height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/IntangibleAssetsEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
					</div>
					<!-- BEGIN Schedule L Line 13b -->
					<div style="width:187mm;">
						<div class="styIRS1120SLNLeftLtrBoxTD" style="height:4.5mm; padding-top:1mm;">b</div>
						<div class="styGenericDiv" style="width:50mm; height:4.5mm; padding-top:1mm;">
							<span style="float:left">Less accumulated amortization </span>
							<span class="styDotLn" style="float:right; padding-right:1mm;">..</span>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/AccumulatedAmortizationBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/NetIntangibleAssetsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/AccumulatedAmortizationEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/NetIntangibleAssetsEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN Schedule L Line 14 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm; padding-top:1mm;">14</div>
						<div class="styGenericDiv" style="width:50mm; height:4.5mm; padding-top:1mm;">
							<span style="float:left">Other assets (attach statement) </span>
							<span class="styDotLn" style="float:right; padding-right:1mm;">..</span>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styLNAmountBox" style="width:4mm; height:4.5mm;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/OtherAssetsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120SLNAmountBoxNLB" style="width:28mm; height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/OtherAssetsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styLNAmountBox" style="width:4mm; height:4.5mm;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/OtherAssetsEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120SLNAmountBoxNLB" style="width:28mm; height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/OtherAssetsEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN Schedule L Line 15 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm; padding-top:1mm;">15</div>
						<div class="styGenericDiv" style="width:50mm; height:4.5mm; padding-top:1mm;">
							<span style="float:left">Total assets </span>
							<span class="styDotLn" style="float:right; padding-right:1mm;">........</span>
						</div>
						<div class="styShadingCell" style="border-bottom-width:0px; height:4.5mm;"/>
						<div class="styLNAmountBox" style="height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/TotalAssetsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="border-bottom-width:0px; height:4.5mm;"/>
						<div class="styLNAmountBox" style="height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/TotalAssetsEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm; padding-top:1mm;"/>
						<div class="styGenericDiv" style="width:50mm; height:4.5mm; text-align:center; padding-top:1mm;">
							<span class="styBoldText">Liabilities and Shareholders' Equity</span>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styShadingCell" style="height:4.5mm;"/>
					</div>
					<!-- BEGIN Schedule L Line 16 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm; padding-top:1mm;">16</div>
						<div class="styGenericDiv" style="width:50mm; height:4.5mm; padding-top:1mm;">
							<span style="float:left">Accounts payable </span>
							<span class="styDotLn" style="float:right; padding-right:1mm;">......</span>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styLNAmountBox" style="height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/AccountsPayableBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styLNAmountBox" style="height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/AccountsPayableEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN Schedule L Line 17 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:7mm;">17</div>
						<div class="styGenericDiv" style="width:50mm; height:7mm; padding-top:.5mm;">
							Mortgages, notes, bonds payable in
							<span style="float:left"> less than 1 year </span>
							<span class="styDotLn" style="float:right; padding-right:1mm;">.......</span>
						</div>
						<div class="styShadingCell" style="height:7mm;"/>
						<div class="styLNAmountBox" style="height:7mm; padding-top:3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/ShortTermPayableBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:7mm;"/>
						<div class="styLNAmountBox" style="height:7mm; padding-top:3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/ShortTermPayableEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN Schedule L Line 18 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:7mm;">18</div>
						<div class="styGenericDiv" style="width:50mm; height:7mm; padding-top:.5mm;">
							Other current liabilities (attach
							<span style="float:left">statement) </span>
							<span class="styDotLn" style="float:right; padding-right:1mm;">........</span>
						</div>
						<div class="styShadingCell" style="height:7mm;"/>
						<div class="styLNAmountBox" style="width:4mm; height:7mm;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/OtherCurrentLiabilitiesBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120SLNAmountBoxNLB" style="width:28mm; height:7mm; padding-top:3.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/OtherCurrentLiabilitiesBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:7mm;"/>
						<div class="styLNAmountBox" style="width:4mm; height:7mm;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/OtherCurrentLiabilitiesEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120SLNAmountBoxNLB" style="width:28mm; height:7mm; padding-top:3.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/OtherCurrentLiabilitiesEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN Schedule L Line 19 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm; padding-top:1mm;">19</div>
						<div class="styGenericDiv" style="width:50mm; height:4.5mm; padding-top:1mm;">
							<span style="float:left">Loans from shareholders </span>
							<span class="styDotLn" style="float:right; padding-right:1mm;">....</span>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styLNAmountBox" style="height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/LoansFromShareholdersBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styLNAmountBox" style="height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/LoansFromShareholdersEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN Schedule L Line 20 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:7mm;">20</div>
						<div class="styGenericDiv" style="width:50mm; height:7mm; padding-top:.5mm;">						
							Mortgages, notes, bonds payable in 1 
							<span style="float:left">year or more </span>
							<span class="styDotLn" style="float:right; padding-right:1mm;">........</span>
						</div>
						<div class="styShadingCell" style="height:7mm;"/>
						<div class="styLNAmountBox" style="height:7mm; padding-top:3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/LongTermPayableBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:7mm;"/>
						<div class="styLNAmountBox" style="height:7mm; padding-top:3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/LongTermPayableEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN Schedule L Line 21 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm; padding-top:1mm;">21</div>
						<div class="styGenericDiv" style="width:50mm; height:4.5mm; padding-top:1mm;">
							<span style="float:left">Other liabilities (attach statement) </span>
							<span class="styDotLn" style="float:right; padding-right:1mm;">.</span>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styLNAmountBox" style="width:4mm;height:4.5mm;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/OtherLiabilitiesBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120SLNAmountBoxNLB" style="width:28mm;height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/OtherLiabilitiesBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styLNAmountBox" style="width:4mm;height:4.5mm;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/OtherLiabilitiesEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120SLNAmountBoxNLB" style="width:28mm;height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/OtherLiabilitiesEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN Schedule L Line 22 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">22</div>
						<div class="styGenericDiv" style="width:50mm; height:4.5mm; padding-top:.5mm;">
							<span style="float:left">Capital stock</span>
							<span class="styDotLn" style="float:right; padding-right:1mm;">........</span>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styLNAmountBox" style="height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/CapitalStockBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styLNAmountBox" style="height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/CapitalStockEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN Schedule L Line 23 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">23</div>
						<div class="styGenericDiv" style="width:50mm; height:4.5mm; padding-top:.5mm;">
							<span style="float:left">Additional paid&#8211;in capital</span>
							<span class="styDotLn" style="float:right; padding-right:1mm;">....</span>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styLNAmountBox" style="height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/AdditionalPaidInCapitalBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styLNAmountBox" style="height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/AdditionalPaidInCapitalEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN Schedule L Line 24 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm; padding-top:1mm;">24</div>
						<div class="styGenericDiv" style="width:50mm; height:4.5mm; padding-top:1mm;">
							<span style="float:left">Retained earnings</span>
							<span class="styDotLn" style="float:right; padding-right:1mm;">......</span>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styLNAmountBox" style="height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/RetainedEarningBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styLNAmountBox" style="height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/RetainedEarningEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN Schedule L Line 25 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:7mm;">25</div>
						<div class="styGenericDiv" style="width:50mm; height:7mm; padding-top:.5mm;">
							Adjustments to shareholders' equity
							<span style="float:left">(attach statement) </span>
							<span class="styDotLn" style="float:right; padding-right:1mm;">......</span>
						</div>
						<div class="styShadingCell" style="height:7mm;"/>
						<div class="styLNAmountBox" style="width:4mm; height:7mm;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/AdjustmentToShrEqtyBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120SLNAmountBoxNLB" style="width:28mm; height:7mm; padding-top:3.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/AdjustmentToShrEqtyBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:7mm;"/>
						<div class="styLNAmountBox" style="width:4mm; height:7mm;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/AdjustmentToShrEqtyEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120SLNAmountBoxNLB" style="width:28mm; height:7mm; padding-top:3.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/AdjustmentToShrEqtyEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN Schedule L Line 26 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm; padding-top:1mm;">26</div>
						<div class="styGenericDiv" style="width:50mm; height:4.5mm;  padding-top:1mm;">
							<span style="float:left">Less cost of treasury stock</span>
							<span class="styDotLn" style="float:right; padding-right:1mm;">...</span>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styLNAmountBox" style="height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/CostOfTreasuryStockBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styLNAmountBox" style="height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/CostOfTreasuryStockEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN Schedule L Line 27 -->
					<div class="styBB" style="width:187mm; float:none; clear:both;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">27</div>
						<div class="styGenericDiv" style="width:50mm; height:4.5mm; padding-top:1mm;">
							Total liabilities and shareholders'  equity 							
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm; padding-top:1.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/TotalLiabilitiesShrEqtyBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm; padding-top:1.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleL/TotalLiabilitiesShrEqtyEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END Schedule L Line Items -->
					<!-- BEGIN Page Break and Footer of Page 4-->
					<div class="pageEnd" style="width:187mm; padding-top:1mm;">
						<div style="float:right;">
							<span style="width:80px;"/>  
							Form <span class="styBoldText" style="font-size:8pt;">1120&#8211;S</span> (2021)
						</div>
					</div>
					<!-- END Page Break and Footer-->
					<!-- BEGIN Page 5 Header-->
					<div class="styBB" style="width:187mm; padding-top:.5mm; float:none; clear:both;">
						<div style="float:left;">Form 1120&#8211;S (2021)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold; font-size:8pt;">5</span>
						</div>
					</div>
					<!-- END Page 5 Header -->
					<!-- BEGIN Schedule M-1 Title -->
					<div class="styBB" style="width:187mm; float:none; clear:none;">
						<div class="styPartName" style="width:23mm; height:4.25mm;">Schedule M&#8211;1</div>
						<div class="styPartDesc" style="width:164mm;">Reconciliation of Income (Loss) per Books With Income (Loss) per Return</div>
						<div class="styGenericDiv" style="width:186mm; padding-left:26.5mm; font-size:7pt;">
							<b>Note: </b>
							<!--Schedule M-3 required instead of Schedule M-1 if total assets are $10 million or more&#8212;see instructions-->
							The corporation may be required to file Schedule M-3 (see instructions)
							</div>
					</div>
					<!-- END Schedule M-1 Title -->
					<!-- BEGIN Schedule M-1 Line Items -->
					<div style="width:187mm; float:none; clear:none; border-bottom:1px solid black;">
						<!-- BEGIN Left Side Div of Schedule M-1-->
						<div style="width:93mm; float:left; clear:none;">
							<!-- BEGIN Left Side Div of Schedule M-1 Line 1-->
							<div class="styGenericDiv">
								<div class="styLNLeftNumBoxSD" style="height:4.5mm;">1</div>
								<div class="styGenericDiv" style="width:52mm; height:4.5mm; padding-top:0.4mm;">Net income (loss) per books
								  <!--Dotted Line-->
									<span style="letter-spacing:4mm; font-weight:bold;">...</span>
								</div>
								<div class="styLNAmountBox" style="height:4.5mm; border-right-width:1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleM1/NetIncomeLossPerBooksAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- BEGIN Left Side Div of Schedule M-1 Line 2-->
							<div class="styGenericDiv">
								<div class="styLNLeftNumBoxSD" style="height:4.5mm;">2</div>
								<div class="styGenericDiv" style="width:52mm; height:4.5mm; padding-top:0.7mm;">
									<span class="stySmallText">Income included on Schedule K, lines 1, 2, 3c, 4, 5a, 6, 7, 8a, 9, and 10, not recorded on books this year (itemize):
									</span>
									<div class="styIRS1120SBBText" style="width:23mm; height:4.5mm; text-align:left; padding-right:3mm;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120SScheduleM1/TotalIncmNotRecordedOnBooksAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<div class="styLNAmountBox" style="height:14mm; border-right-width:1px; padding-top:10mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleM1/TotalIncmNotRecordedOnBooksAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- BEGIN Left Side Div of Schedule M-1 Line 3-->
							<div class="styGenericDiv">
								<div class="styLNLeftNumBoxSD" style="height:4.5mm;">3</div>
								<div class="styGenericDiv" style="width:52mm; height:4.5mm; padding-top:0.4mm;">Expenses recorded on books this year</div>
								<div class="styLNAmountBox" style="height:4.5mm; border-bottom-width: 0px; border-right-width:1px;"/>
							</div>
							<div class="styGenericDiv">
								<div class="styLNLeftNumBox" style="height:4.5mm;"/>
								<div class="styGenericDiv" style="width:52mm; height:4.5mm;">not included on Schedule K, lines 1</div>
								<div class="styLNAmountBox" style="height:4.5mm; border-bottom-width: 0px; border-right-width:1px;"/>
							</div>
							<div class="styGenericDiv">
								<div class="styLNLeftNumBox" style="height:4.5mm;"/>
								<div class="styGenericDiv" style="width:52mm; height:4.5mm;">through 12 and 16f (itemize):</div>
								<div class="styLNAmountBox" style="height:4.5mm; border-bottom-width: 0px; border-right-width:1px;"/>
							</div>
							<!-- BEGIN Left Side Div of Schedule M-1 Line 3a -->
							<div class="styGenericDiv">
								<div class="styLNLeftLtrBox" style="height:4.5mm;">a</div>
								<div class="styGenericDiv" style="width:28mm; height:4.5mm; padding-top:0.4mm;">Depreciation <span style="float:right;">$</span>
								</div>
								<div class="styIRS1120SBBText" style="width:24mm; text-align:right; font-size:6pt; padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleM1/DepreciationExpensesAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:4.5mm; border-bottom-width: 0px; border-right-width:1px;"/>
							</div>
							<!-- BEGIN Left Side Div of Schedule M-1 Line 3b -->
							<div class="styGenericDiv">
								<div class="styLNLeftLtrBox" style="height:4.5mm;">b</div>
								<div class="styGenericDiv" style="width:28mm; height:4.5mm; padding-top:0.7mm;">
									<span class="styArialText">Travel and entertainment </span>
									<span style="float:right;">$</span>
								</div>
								<div class="styIRS1120SBBText" style="width:24mm; text-align:right; font-size:6pt; padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleM1/TravelEntertainmentAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:4.5mm; border-bottom-width: 0px; border-right-width:1px;"/>
							</div>
							<div class="styGenericDiv" style="height:4.5mm;">
								<div class="styLNLeftNumBox" style="height:4.5mm;"/>
								<div class="styGenericDiv" style="width:52mm; height:4.5mm; padding-right:2mm;">
									<div class="styIRS1120SBBText" style="width:50mm; height:4.5mm; text-align:left; padding-right:3mm;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120SScheduleM1/TotalExpensesNotDeductedAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<div class="styLNAmountBox" style="height:5mm; border-right-width:1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleM1/TotalExpensesNotDeductedAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- BEGIN Left Side Div of Schedule M-1 Line 4-->
							<div class="styGenericDiv">
								<div class="styLNLeftNumBoxSD" style="height:5.5mm; padding-top:1.4mm;">4</div>
								<div class="styGenericDiv" style="width:52mm; height:5.5mm; padding-top:1.4mm;">Add lines 1 through 3
								  <!--Dotted Line-->
									<span style="letter-spacing:4mm; font-weight:bold;">....</span>
								</div>
								<div class="styLNAmountBoxNBB" style="height:5.5mm; border-right-width:1px; padding-top:1.4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleM1/IncomeExpensesSubtotalAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- END Left Side Div of Schedule M-1-->
						<!-- BEGIN Right Side Div of Schedule M-1-->
						<div style="width:93mm; float:left; clear:none;">
							<!-- BEGIN Right Side Div of Schedule M-1 Line 5 -->
							<div class="styGenericDiv">
								<div class="styLNLeftNumBox" style="height:4.5mm;">5</div>
								<div class="styGenericDiv" style="width:52mm; height:4.5mm; padding-top:0.7mm;">
									<span class="styArialText">Income recorded on books this year not included on</span>
								</div>
								<div class="styLNAmountBox" style="height:4.5mm; border-bottom-width:0px;"/>
							</div>
							<div class="styGenericDiv">
								<div class="styLNLeftNumBox" style="height:4.5mm;"/>
								<div class="styGenericDiv" style="width:52mm; height:4.5mm;">
									<span class="styArialText">Schedule K, lines 1 through 10 (itemize):</span>
								</div>
								<div class="styLNAmountBox" style="height:4.5mm; border-bottom-width:0px;"/>
							</div>
							<!-- BEGIN Right Side Div of Schedule M-1 Line 5a -->
							<div class="styGenericDiv">
								<div class="styLNLeftLtrBox" style="height:4.5mm;">a</div>
								<div class="styGenericDiv" style="width:23mm; height:4.5mm; padding-top:0.7mm;">
									<span class="styArialText">Tax-exempt interest</span>
									<span style="float:right;">$</span>
								</div>
								<div class="styIRS1120SBBText" style="width:29mm; text-align: right; font-size: 6pt; padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleM1/TaxExemptInterestAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:4.5mm; border-bottom-width:0px;"/>
							</div>
							<div class="styGenericDiv" style="height:4.5mm;">
								<div class="styLNLeftNumBox" style="height:4.5mm;"/>
								<div class="styGenericDiv" style="width:52mm; height:4.5mm; padding-right:2mm;">
									<div class="styIRS1120SBBText" style="width:50mm; text-align:left; padding-right:3mm; height:4.5mm;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120SScheduleM1/TotIncmRecordedNotIncludedAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<div class="styLNAmountBox" style="height:5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleM1/TotIncmRecordedNotIncludedAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- BEGIN Right Side Div of Schedule M-1 Line 6 -->
							<div class="styGenericDiv">
								<div class="styLNLeftNumBox" style="height:4.5mm;">6</div>
								<div class="styGenericDiv" style="width:52mm; height:4.5mm; padding-top:0.7mm;">
									<span class="stySmallText">Deductions included on Schedule K, lines 1</span>
								</div>
								<div class="styLNAmountBox" style="height:4.5mm; border-bottom-width:0px;"/>
							</div>
							<div class="styGenericDiv">
								<div class="styLNLeftNumBox" style="height:4.5mm;"/>
								<div class="styGenericDiv" style="width:52mm; height:4.5mm;">
									<span class="stySmallText">through 12 and 16f, not charged</span>
								</div>
								<div class="styLNAmountBox" style="height:4.5mm; border-bottom-width:0px;"/>
							</div>
							<div class="styGenericDiv">
								<div class="styLNLeftNumBox" style="height:4.5mm;"/>
								<div class="styGenericDiv" style="width:52mm; height:4.5mm;">
									<span class="stySmallText">against book income this year (itemize):</span>
								</div>
								<div class="styLNAmountBox" style="height:4.5mm; border-bottom-width:0px;"/>
							</div>
							<!-- BEGIN Right Side Div of Schedule M-1 Line 6a -->
							<div class="styGenericDiv">
								<div class="styLNLeftLtrBox" style="height:4.5mm;">a</div>
								<div class="styGenericDiv" style="width:28mm; height:4.5mm; padding-top:0.4mm;">Depreciation <span style="float:right;">$</span>
								</div>
								<div class="styIRS1120SBBText" style="width:24mm; text-align:right; font-size:6pt; padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleM1/DepreciationDeductionAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:4.5mm; border-bottom-width:0px;"/>
							</div>
							<div class="styGenericDiv" style="height:4.5mm;">
								<div class="styLNLeftNumBox" style="height:4.5mm;"/>
								<div class="styGenericDiv" style="width:52mm; height:4.5mm; padding-right:2mm;">
									<div class="styIRS1120SBBText" style="width:50mm; text-align:left; padding-right:3mm; height:4.5mm;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120SScheduleM1/TotalDeductionsNotChargedAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<div class="styLNAmountBox" style="height:5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleM1/TotalDeductionsNotChargedAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- BEGIN Right Side Div of Schedule M-1 Line 7 -->
							<div class="styGenericDiv">
								<div class="styLNLeftNumBox" style="height:4.5mm;">7</div>
								<div class="styGenericDiv" style="width:52mm; height:4.5mm; padding-top:0.4mm;">Add lines 5 and 6
								  <!--Dotted Line-->
									<span style="letter-spacing:4mm; font-weight:bold;">......</span>
								</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleM1/IncomeDeductionsSubtotalAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- BEGIN Right Side Div of Schedule M-1 Line 8 -->
							<div class="styGenericDiv">
								<div class="styLNLeftNumBox" style="height:5.5mm;">8</div>
								<div class="styGenericDiv" style="width:52mm; height:4.5mm; padding-top:0.7mm;">
									<span class="styArialText">Income (loss) (Schedule K, line 18). Subtract line 7 from line 4</span>
								</div>
								<div class="styLNAmountBoxNBB" style="height:5.8mm; padding-top:2mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120SScheduleM1/IncomeLossAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- END Right Side Div of Schedule M-1-->
					</div>
					<!-- END Schedule M-1 Line Items -->
					<!-- BEGIN Schedule M-2 Title -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="width:28mm; margin-top: 2mm;">Schedule M&#8211;2</div>
						<div class="styPartDesc" style="width:158mm; height:11mm;">
							Analysis of Accumulated Adjustments Account, Shareholders' Undistributed Taxable Income Previously Taxed,
							Accumulated Earnings and Profits, and Other Adjustments Account 						
							<span class="styNormalText">(see instructions)</span>
							<span style="width:2px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleM2"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END Schedule M-2 Title -->
					<!-- BEGIN Schedule M-2 Line Items Table-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:12mm;"/>
						<div class="styGenericDiv" style="width:51mm; height:12mm;"/>
						<div class="styLNAmountBox" style="height:12mm; text-align:center; padding-top:3mm;">
							<span class="styBoldText">(a)</span> Accumulated adjustments account
						</div>
						<div class="styLNAmountBox" style="height:12mm; text-align:center; padding-top:3mm;">
							<span class="styBoldText">(b)</span> Shareholders' undistributed taxable income previously taxed
						</div>
						<div class="styLNAmountBox" style="height:12mm; text-align:center; padding-top:3mm;">
							<span class="styBoldText">(c)</span> Accumulated earnings and profits
						</div>
						<div class="styLNAmountBox" style="height:12mm; text-align:center; padding-top:3mm;">
							<span class="styBoldText">(d)</span> Other adjustments account
						</div>
					</div>
					<!-- BEGIN Schedule M-2 Line Items Table Line 1 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style=";">1</div>
						<div class="styGenericDiv" style="width:51mm;">
							<span style="float:left">
							Balance at beginning of tax year
							</span>
							<span class="styDotLn" style="float:right; padding-right:1mm;">..</span>
						</div>
						<div class="styLNAmountBox" style=";">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleM2/BalanceBOYAccumAdjAcctAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style=";">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleM2/BalBOYShrUndistrTxblIncmAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style=";">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleM2/AccumulatedEarnProfitsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style=";">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleM2/BalanceBOYOtherAdjAcctAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN Schedule M-2 Line Items Table Line 2 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style=";">2</div>
						<div class="styGenericDiv" style="width:51mm;">
							<span style="float:left">
							Ordinary income from page 1, line 21
							</span>
						</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleM2/OrdinaryBusinessIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4mm;"/>
						<div class="styShadingCell" style="height:4mm;"/>
						<div class="styShadingCell" style="height:4mm;"/>
					</div>
					<!-- BEGIN Schedule M-2 Line Items Table Line 3 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style=";">3</div>
						<div class="styGenericDiv" style="width:51mm;">
							<span style="float:left">
							Other additions
							</span>
							<span class="styDotLn" style="float:right; padding-right:1mm;">.......</span>
						</div>
						<div class="styLNAmountBox" style="width:4mm;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleM2/TotalOtherAddnAccumAdjAcctAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120SLNAmountBoxNLB" style="width:28mm;;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleM2/TotalOtherAddnAccumAdjAcctAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4mm;"/>
						<div class="styShadingCell" style="height:4mm;"/>
						<div class="styLNAmountBox" style="width:4mm;;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleM2/TotalOtherAddnOtherAdjAcctAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120SLNAmountBoxNLB" style="width:28mm;;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleM2/TotalOtherAddnOtherAdjAcctAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN Schedule M-2 Line Items Table Line 4 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style=";">4</div>
						<div class="styGenericDiv" style="width:51mm;">
							<span style="float:left">
							Loss from page 1, line 21
							</span>
							<span class="styDotLn" style="float:right; padding-right:1mm;">....</span>
						</div>
						<div class="styLNAmountBox" style=";">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleM2/OrdinaryBusinessLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4mm;"/>
						<div class="styShadingCell" style="height:4mm;"/>
						<div class="styShadingCell" style="height:4mm;"/>
					</div>
					<!-- BEGIN Schedule M-2 Line Items Table Line 5 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style=";">5</div>
						<div class="styGenericDiv" style="width:51mm;">
							<span style="float:left">
							Other reductions
							<span style="width:2px;"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1120SScheduleM2/TT"/>
								</xsl:call-template>
							</span>
							<span class="styDotLn" style="float:right; padding-right:1mm;">......</span>
						</div>
						<div class="styLNAmountBox" style="width:4mm;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleM2/OtherReductionsAccumAdjAcctAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120SLNAmountBoxNLB" style="width:28mm;">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleM2/OtherReductionsAccumAdjAcctAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4mm;"/>
						<div class="styShadingCell" style="height:4mm;"/>
						<div class="styLNAmountBox" style="width:4mm;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleM2/OtherReductionsOtherAdjAcctAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120SLNAmountBoxNLB" style="width:28mm;">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleM2/OtherReductionsOtherAdjAcctAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN Schedule M-2 Line Items Table Line 6 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="">6</div>
						<div class="styGenericDiv" style="width:51mm;">
							<span style="float:left">
								Combine lines 1 through 5
							</span>
							<span class="styDotLn" style="float:right; padding-right:1mm;">....</span>
						</div>
						<div class="styLNAmountBox" style="padding-top:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleM2/SubtotalAccumAdjAcctAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="padding-top:.5mm;; border-top-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleM2/SubtotalShrUndistrTxblIncmAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="padding-top:.5mm;; border-top-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleM2/SubtotalAccumEarnProfitsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="padding-top:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleM2/SubtotalOtherAdjAcctAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN Schedule M-2 Line Items Table Line 7 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="">7</div>
						<div class="styGenericDiv" style="width:51mm;">
							Distributions
							<span class="styDotLn" style="float:right; padding-right:1mm;">........</span>
						</div>
						<div class="styLNAmountBox" style="height:6mm; padding-top:2.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleM2/NotDivDistriAccumAdjAcctAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:6mm; padding-top:2.5mm;;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleM2/NotDivShrUndistrTxblIncmAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:6mm; padding-top:2.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleM2/AccumulatedEPNotDivDistriAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:6mm; padding-top:2.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleM2/NotDivDistriOtherAdjAcctAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN Schedule M-2 Line Items Table Line 8 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="">8</div>
						<div class="styGenericDiv" style="width:51mm;">
							Balance at end of tax year. Subtract line
							<span style="float:left"> 7 from line 6 </span>
							<span class="styDotLn" style="float:right; padding-right:1mm;">........</span>
						</div>
						<div class="styLNAmountBoxNBB" style="height:6mm; padding-top:2.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleM2/BalanceEOYAccumAdjAcctAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="height:6mm; padding-top:2.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleM2/BalEOYShrUndistrTxblIncmAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="height:6mm; padding-top:2.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleM2/AccumulatedEarnProfitsEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="height:6mm; padding-top:2.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleM2/BalanceEOYOtherAdjAcctAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END Schedule M-2 Line Items -->
					<!-- BEGIN Page Break and Footer-->
					<div class="pageEnd" style="width:187mm; padding-top:1mm;">
						<div style="float:right;">
							<span style="width:80px;"/>  
							  Form <span class="styBoldText" style="font-size:8pt;">1120&#8211;S</span> (2021)
						</div>
					</div>
					<!-- END Page Break and Footer-->
					<!-- BEGIN Left Over Table -->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
						Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form1120SData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Form 1120S, Top Left Margin - 
							Section 501d Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120SData/@section501dCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Form 1120S, Top Left Margin - 
							Change Annual Accounting Period 2</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120SData/@changeAnnualAccountingPeriodCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Form 1120S, Top Left Margin - 
							Section30191002 Election Ind</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120SData/@filedPursuantToSect30191002Cd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Form 1120S, Top Left Margin -
							 Short Period Reason Ind</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120SData/@shortPeriodReasonCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<!-- start here -->
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 4 - Form 4684 Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120SData/TotalOrdinaryGainLossAmt/@form4684Cd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 5 - Other Income Loss Item</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120SData/OtherIncomeLossAmt/@otherIncomeLossDesc"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 22a - LIFO Tax indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120SData/ExcessNetPassiveIncmLIFOTxAmt/@lIFOTaxCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 22a - LIFO Tax Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120SData/ExcessNetPassiveIncmLIFOTxAmt/@lIFOTaxAmt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 22c - Tax From Form 4255 Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120SData/TotalTaxAmt/@taxFromForm4255Cd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 22c - Tax From Form 4255 Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120SData/TotalTaxAmt/@taxFromForm4255Amt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 22c - LIFO Tax Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120SData/TotalTaxAmt/@lIFOTaxCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 22c - LIFO Tax Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120SData/TotalTaxAmt/@lIFOTaxAmt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 22c - From Form 8697 Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120SData/TotalTaxAmt/@form8697Cd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 22c - From Form 8697 Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120SData/TotalTaxAmt/@form8697Amt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 22c - From Form 8866 Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120SData/TotalTaxAmt/@form8866Cd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 22c - From Form 8866 Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120SData/TotalTaxAmt/@form8866Amt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<!-- Added per WR 211941 -->
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 22c - BIPARTISAN BUDGET ACT IMPUTED UNDERPAYMENT Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120SData/TotalTaxAmt/@bBAImputeUnderpaymentCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 22c - BIPARTISAN BUDGET ACT IMPUTED UNDERPAYMENT Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120SData/TotalTaxAmt/@bBAImputeUnderpaymentAmt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<!-- Added per WR 211941 -->
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 23d - Beneficiary Of Trust Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120SData/TotalPaymentsAmt/@beneficiaryTrustCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 23d - Beneficiary Of Trust Amount </xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120SData/TotalPaymentsAmt/@beneficiaryTrustAmt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Schedule K, Line 12d - Form 4684 Indicator </xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/OtherDeductionsAmt/@form4684Cd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Schedule K, Line 13e - OtherRentalCreditsAmt</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120SScheduleK/OtherRentalCreditsAmt/@otherRentalCreditDesc"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<br/>
					<br/>
					<span style="padding-left:1mm;font-size:9pt">
						<b>F1120S - Special Condition Description:</b>
					</span>
					<br/>
					<!--Special Condition Description -->
					<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
						<thead class="styTableThead">
							<tr class="styDepTblHdr">
								<th class="styDepTblCell" scope="col" rowspan="2" style="width:179mm;font-size:8pt;">
								Special Condition Description
								</th>
							</tr>
						</thead>
						<tfoot/>
						<tbody>
							<xsl:for-each select="$Form1120SData/SpecialConditionDesc">
								<tr style="border-color:black;height:6mm;">
									<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
									<td class="styTableCellText" style="width:179mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="."/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<!-- END Left Over Table -->
					<!-- Additonal Data Table for separated data from Schedule K, Line 12d -->
					<!-- No separated data table is necessary because as of 2004v2.0 Sect59e2Expenditures no longer exists as a recurring structure-->
					<!-- End Schedule K, Line 12d separated data -->
					<!-- START LINE 4a LEFTOVER TABLE-->
					<xsl:if test="($Print = $Separated) and ( count($Form1120SScheduleB/CorpOwnPctStkIssdOutstdGrp) &gt; 4)">
						<br/>
						<span class="styRepeatingDataTitle">
							<br/>
							Schedule B Line 4(a)
						</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead" style="font-size: 7pt;">
								<tr class="styDepTblHdr">
									<th scope="col" style="width:50mm; text-align:center; vertical-align:middle;" class="styDepTblCell">
										<b>(i)</b> Name of Corporation
									</th>
									<th scope="col" style="width:38mm; vertical-align:middle;" class="styDepTblCell">
										<b>(ii)</b> Employer Identification Number (if any)
									</th>
									<th scope="col" style="width:24mm; vertical-align:middle;" class="styDepTblCell">
										<b>(iii)</b> Country of Incorporation
									</th>
									<th scope="col" style="width:42mm; vertical-align:middle;" class="styDepTblCell">
										<b>(iv)</b> Percentage of Stock Owned
									</th>
									<th scope="col" style="width:33mm; vertical-align:middle;" class="styDepTblCell">
										<b>(v)</b>  If Percentage in (iv) is 100%, Enter the Date (if any) a Qualified Subchapter S Subsidiary Election Was Made?
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody style="border-color:black;">
								<xsl:for-each select="$Form1120SScheduleB/CorpOwnPctStkIssdOutstdGrp">
									<tr style="vertical-align:bottom; font-size:7pt; font-weight:normal;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1
												</xsl:when><xsl:otherwise>styDepTblRow2
												</xsl:otherwise></xsl:choose></xsl:attribute>
										<td style="width:50mm; text-align:left;" class="styTableCell">
											<div class="styGenericDiv" style="vertical-align:bottom; float:left;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CorporationNm"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</div>
										</td>
										<td style="width:38mm; text-align:center;" valign="bottom" class="styDepTblCell">
											<xsl:choose>
												<xsl:when test="SSN !=''">
													<xsl:call-template name="PopulateSSN">
														<xsl:with-param name="TargetNode" select="SSN"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:when test="EIN!=''">
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="EIN"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:when test="MissingSSNEINReasonCd!=''">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="MissingSSNEINReasonCd"/>
													</xsl:call-template>
												</xsl:when>
											</xsl:choose>
											<span style="width:1px;"/>
										</td>
										<td style="width:24mm; text-align:center;" valign="bottom" class="styDepTblCell">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="IncorporationCountryCd"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td style="width:42mm; text-align:right;" class="styDepTblCell">
											<xsl:call-template name="PopulatePercent">
												<xsl:with-param name="TargetNode" select="VotingStockOwnedPct"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td style="width:33mm; text-align:center;" class="styDepTblCell">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="QSubElectionDt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- END LINE 4a LEFTOVER TABLE-->
					<!-- START LINE 4b LEFTOVER TABLE-->
					<xsl:if test="($Print = $Separated) and ( count($Form1120SScheduleB/CorpOwnPctFrgnDomPrtshpGrp) &gt; 4)">
						<br/>
						<span class="styRepeatingDataTitle">
							<br/>
							Schedule B Line 4(b)
						</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead" style="font-size: 7pt;">
								<tr class="styDepTblHdr" style="vertical-align:bottom;">
									<th scope="col" style="width:50mm; text-align:center; vertical-align:middle;" class="styDepTblCell">
										<b>(i)</b> Name of Entity
									</th>
									<th scope="col" style="width:38mm; vertical-align:middle;" class="styDepTblCell">
										<b>(ii)</b> Employer Identification Number (if any)
									</th>
									<th scope="col" style="width:24mm; vertical-align:middle;" class="styDepTblCell">
										<b>(iii)</b> Type of Entity
									</th>
									<th scope="col" style="width:42mm; vertical-align:middle;" class="styDepTblCell">
										<b>(iv)</b> Country of Organization
									</th>
									<th scope="col" style="width:33mm; vertical-align:middle;" class="styDepTblCell">
										<b>(v)</b>  Maximum Percentage Owned in Profit, Loss, or Capital
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody style="border-color:black;">
								<xsl:for-each select="$Form1120SScheduleB/CorpOwnPctFrgnDomPrtshpGrp">
									<tr style="vertical-align:bottom; font-size:7pt; font-weight:normal;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td style="width:50mm; text-align:left;" class="styTableCell">
											<div class="styGenericDiv" style="vertical-align:bottom; float:left;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="EntityNm"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</div>
										</td>
										<td style="width:38mm; text-align:center;" valign="bottom" class="styTableCell">
											<xsl:choose>
												<xsl:when test="EIN!=''">
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="EIN"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:when test="MissingEINReasonCd!=''">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
													</xsl:call-template>
												</xsl:when>
											</xsl:choose>
											<span style="width:1px;"/>
										</td>
										<td style="width:24mm; text-align:left;" valign="bottom" class="styTableCell">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="EntityTypeTxt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td style="width:42mm; text-align:center;" class="styTableCell">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="OrganizationCountryCd"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td style="width:33mm;" class="styTableCell">
											<xsl:call-template name="PopulatePercent">
												<xsl:with-param name="TargetNode" select="MaximumOwnedPct"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<br/>
					<br/>
					<!-- END LINE 4b LEFTOVER TABLE-->
				</form>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="SchBLine4aEmptyCells">
		<xsl:param name="index"/>
		<xsl:param name="end">false</xsl:param>
		<tr>
			<xsl:if test="($end = 'false')">
				<td class="styTableCell" style="width:50mm; text-align:left; font-weight:bold; font-size: 7pt;">
					<span style="width:1mm;"/>
					<span style="font-weight: normal">
						<xsl:if test="($Print=$Separated) and (count($Form1120SScheduleB/CorpOwnPctStkIssdOutstdGrp) &gt;4) and ($index = 1)">
							<xsl:call-template name="PopulateAdditionalDataTableMessage">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/CorpOwnPctStkIssdOutstdGrp/CorporationNm"/>
							</xsl:call-template>
						</xsl:if>
					</span>
				</td>
				<td style="width:38mm;" class="styTableCell">
					<span style="width:1px;"/>
				</td>
				<td style="width:24mm;" class="styTableCell">
					<span style="width:1px;"/>
				</td>
				<td style="width:42mm; border-left-width:0px;" class="styTableCell">
					<span style="width:1px;"/>
				</td>
				<td style="width:33mm; border-right-width:0px;" class="styTableCell">
					<span style="width:1px;"/>
				</td>
			</xsl:if>
			<xsl:if test="($end != 'false')">
				<td style="width:50mm; border-bottom-width:0px;" class="styTableCell">
					<span style="width:1px;"/>
				</td>
				<td style="width:38mm; border-bottom-width:0px;" class="styTableCell">
					<span style="width:1px;"/>
				</td>
				<td style="width:24mm; border-bottom-width:0px;" class="styTableCell">
					<span style="width:1px;"/>
				</td>
				<td style="width:42mm; border-left-width:0px; border-bottom-width:0px;" class="styTableCell">
					<span style="width:1px;"/>
				</td>
				<td style="width:33mm; border-right-width:0px; border-bottom-width:0px;" class="styTableCell">
					<span style="width:1px;"/>
				</td>
			</xsl:if>
		</tr>
	</xsl:template>
	<xsl:template name="SchBLine4bEmptyCells">
		<xsl:param name="index"/>
		<xsl:param name="end">false</xsl:param>
		<tr>
			<xsl:if test="($end = 'false')">
				<td class="styTableCell" style="width:50mm; text-align:left; font-weight:bold; font-size: 7pt;">
					<span style="width:1mm;"/>
					<span style="font-weight: normal">
						<xsl:if test="($Print=$Separated) and (count($Form1120SScheduleB/CorpOwnPctFrgnDomPrtshpGrp) &gt;4) and ($index = 1)">
							<xsl:call-template name="PopulateAdditionalDataTableMessage">
								<xsl:with-param name="TargetNode" select="$Form1120SScheduleB/CorpOwnPctFrgnDomPrtshpGrp/EntityNm"/>
							</xsl:call-template>
						</xsl:if>
					</span>
				</td>
				<td style="width:38mm;" class="styTableCell">
					<span style="width:1px;"/>
				</td>
				<td style="width:24mm;" class="styTableCell">
					<span style="width:1px;"/>
				</td>
				<td style="width:42mm; border-left-width:0px;" class="styTableCell">
					<span style="width:1px;"/>
				</td>
				<td style="width:33mm; border-right-width:0px;" class="styTableCell">
					<span style="width:1px;"/>
				</td>
			</xsl:if>
			<xsl:if test="($end != 'false')">
				<td style="width:50mm; border-bottom-width:0px;" class="styTableCell">
					<span style="width:1px;"/>
				</td>
				<td style="width:38mm; border-bottom-width:0px;" class="styTableCell">
					<span style="width:1px;"/>
				</td>
				<td style="width:24mm; border-bottom-width:0px;" class="styTableCell">
					<span style="width:1px;"/>
				</td>
				<td style="width:42mm; border-left-width:0px; border-bottom-width:0px;" class="styTableCell">
					<span style="width:1px;"/>
				</td>
				<td style="width:33mm; border-right-width:0px; border-bottom-width:0px;" class="styTableCell">
					<span style="width:1px;"/>
				</td>
			</xsl:if>
		</tr>
	</xsl:template>
</xsl:stylesheet>
