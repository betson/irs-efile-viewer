<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1065Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form1065Data" select="$RtnDoc/IRS1065"/>
	<xsl:param name="Form1065ScheduleA" select="$RtnDoc/IRS1065/IRS1065ScheduleA"/>
	<xsl:param name="Form1065ScheduleB" select="$RtnDoc/IRS1065/IRS1065ScheduleB"/>
	<xsl:param name="Form1065ScheduleK" select="$RtnDoc/IRS1065/IRS1065ScheduleK"/>
	<xsl:param name="Form1065ScheduleL" select="$RtnDoc/IRS1065/IRS1065ScheduleL"/>
	<xsl:param name="Form1065ScheduleM1" select="$RtnDoc/IRS1065/IRS1065ScheduleM1"/>
	<xsl:param name="Form1065ScheduleM2" select="$RtnDoc/IRS1065/IRS1065ScheduleM2"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form1065Data)"/>
					</xsl:call-template>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 1065"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1065Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form1065">
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:34.5mm;height:20mm;">
      Form 
            <span class="styFormNumber">1065</span>
							<br/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065Data"/>
							</xsl:call-template>
							<span style="width:3px;"/>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Form 1065, Top Left Margin - Special Condition Description
								</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1065Data/SpecialConditionDesc"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Form 1065, Top Left Margin - Section 761(a) election
								</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1065Data/Section761aElectionInd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Form 1065, Top Left Margin - Common Trust</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1065Data/CommonTrustInd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Form 1065, Top Left Margin - Nominee</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1065Data/NomineeInd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Form 1065, Top Left Margin - IRC 6114</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1065Data/IRC6114Ind"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Form 1065, Top Left Margin - Three And One Half Pct
								  Gross Income Tax</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1065Data/ThreeAndOneHalfPctGroIncmTxInd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Form 1065, Top Left Margin - Qualifying Therapeutic Discovery
								 Credit</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1065Data/QlfyTherapeuticDiscoveryCrInd"/>
							</xsl:call-template>
							<br/>
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:117.5mm;height:20mm;">
							<div class="styMainTitle" style="height:8mm;">U.S. Return of Partnership Income</div>
							<div class="styFST" style="height:5mm;font-size:7pt;text-align:center;">
							  For calendar year 2020, 
							<!--<span style="width: 18mm;">
									<xsl:call-template name="PopulateReturnHeaderTaxYear"/>
								</span>-->
							  or tax year beginning
								<span style="width: 17mm;border-bottom:1 solid black;">
									<!-- No need to send the parameters -->
									<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
								</span>,  
							  ending 
								<span style="width: 17mm;border-bottom:1 solid black;">
									<!-- No need to send the parameters -->
									<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
								</span>.
								<br/>
								<div style="text-align:center;font-style:7pt;font-size:7.5pt;padding-top:1.5mm;">
									<span style="width:auto"/>
									<img src="{$ImagePath}/1065_Bullet_Md.gif" alt="MediumBullet"/> 
									  Go to
								<a style="text-decoration:none;color:black;" href="http://www.irs.gov/Form1065" title="Link to IRS.gov">               
									<i>www.irs.gov/Form1065</i> for instructions and the latest information.
								</a>
								</div>
                			</div>
						</div>
						<div class="styTYBox" style="width:30mm;height:20mm;">
							<div class="styOMB" style="height:auto;">OMB No. 1545-0123</div>
							<div class="styTY" style="height:11mm;">20<span class="styTYColor">20</span>
							</div>
						</div>
					</div>
					<div style="width:187mm;float:left;clear:left;">
						<div style="width:34mm;height:30mm;float:left;clear:left;">
							<div class="styEINDateAssets" style="width:34mm;height:13mm;">
								<span class="styBoldText">A</span> Principal business activity
				<br/>
								<span class="styEINFld">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1065Data/PrincipalBusinessActivityDesc"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styEINDateAssets" style="width:34mm;height:16mm;">
								<span class="styBoldText">B</span> Principal product or service
                <br/>
								<span class="styEINFld">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1065Data/PrincipalProductDesc"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styEINDateAssets" style="width:34mm;height:9.5mm;border-bottom-width:1px;border-right-width:0px;">
								<span class="styBoldText">C</span> Business code number<br/><br/>
								<span class="styEINFld">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1065Data/PrincipalBusinessActivityCd"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- return header address box -->
						<div class="styLblNameAddr" style="width:118.5mm;height:auto;">
							<div class="styUseLbl" style="width:15mm;height:37mm;border-right-width:0px;font-size:6pt;          padding-top:3mm">
							   <br/><br/><br/><span style="width:3.5mm"/>Type<br/><span style="width:5.5mm"/>or 
							   <br/><span style="width:3.5mm"/>Print
                            </div>
							<div class="styNameAddr" style="width:101.5mm;height:12mm;font-size:8px;border-left-width:1px;padding-left:1px;">Name of partnership<br/>
								<span class="stySmallText" style="padding-left:2mm;">
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
							<div class="styNameAddr" style="width:101.5mm;height:12mm;border-left-width:1px;">
							  Number, street, and room or suite no. If a P.O. box, see the instructions.<br/><br/>
								<span class="stySmallText" style="padding-left:2mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
							<div class="styNameAddr" style="border-bottom-width:0px;width:89mm;height:13mm;border-left-width:1px;">City or town, state or 
province, country, and ZIP or foreign postal code<br/><br/>
								<span class="stySmallText" style="width:87mm;padding-left:2mm;">
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
						<!-- Since this is a main form, we must check for and display an updated EIN.  To do this, we use
							  the EINChanged parameter PopulateReturnHeaderFiler.-->
						<div class="styEINDateAssets" style="width:34mm;height:11mm;padding-left:.5mm">
							<span class="styBoldText">D Employer identification <br/>
								<span style="padding-left:2mm">number</span>
							</span>
							<br/><br/>
							<span style="padding-left:2mm">
								<span class="styEINFld">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="EINChanged">true</xsl:with-param>
										<xsl:with-param name="TargetNode">EIN</xsl:with-param>
									</xsl:call-template>
								</span>
							</span>
						</div>
						<div class="styEINDateAssets" style="width:34mm;height:10mm;padding-left:.5mm">
							<span class="styBoldText">E</span> Date business started<br/>
							<br/>
							<span style="padding-left:2mm">
								<span class="styEINFld">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$Form1065Data/BusinessOperationStartDt"/>
									</xsl:call-template>
								</span>
							</span>
						</div>
						<div class="styEINDateAssets" style="width:34mm;height:17.5mm;
						  border-bottom-width:1px;padding-left:.5mm">
							<span class="styBoldText">F</span> Total assets (see the <br/>
							  <span style="padding-left:2mm">instructions)</span>
							<br/><br/><span style="float:left;padding-left:2mm">$</span>
							<span style="float:right">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/TotalAssetsAmt"/>
								</xsl:call-template>
							</span>
						</div>
						<br/>
					</div>
					<div class="styNBB" style="width:187mm;">
						<div class="styBoldText" style="width:5mm;float:left;clear:none;padding-top:1mm;padding-left:1.5mm;">G</div>
						<div class="styGenericDiv" style="width:180mm;">Check applicable boxes:
						    <span style="width:.7px;"/>
							<span class="styBoldText">(1)</span>
							<span style="width:3px;"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065Data/InitialReturnInd"/>
									<xsl:with-param name="BackupName">IRS1065InitialReturn</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065Data/InitialReturnInd"/>
									<xsl:with-param name="BackupName">IRS1065InitialReturn</xsl:with-param>
								</xsl:call-template>
								 Initial return
							</label>
							<span style="width:.7px"/>
							<span class="styBoldText">(2)</span>
							<span style="width:.7px;"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065Data/FinalReturnInd"/>
									<xsl:with-param name="BackupName">IRS1065FinalReturn</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065Data/FinalReturnInd"/>
									<xsl:with-param name="BackupName">IRS1065FinalReturn</xsl:with-param>
								</xsl:call-template>
         Final return
            </label>
							<span style="width:.7px"/>
							<span class="styBoldText">(3)</span>
							<span style="width:.7px;"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065Data/NameChangeInd"/>
									<xsl:with-param name="BackupName">IRS1065NameChange</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065Data/NameChangeInd"/>
									<xsl:with-param name="BackupName">IRS1065NameChange</xsl:with-param>
								</xsl:call-template>
         Name change
            </label>
							<span style="width:.7px"/>
							<span class="styBoldText">(4)</span>
							<span style="width:.7px;"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065Data/AddressChangeInd"/>
									<xsl:with-param name="BackupName">IRS1065AddressChange</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065Data/AddressChangeInd"/>
									<xsl:with-param name="BackupName">IRS1065AddressChange</xsl:with-param>
								</xsl:call-template>
         Address change
            </label>
							<span style="width:.7px"/>
							<span class="styBoldText">(5)</span>
							<span style="width:.7px;"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065Data/AmendedReturnInd"/>
									<xsl:with-param name="BackupName">IRS1065AmendedReturn</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065Data/AmendedReturnInd"/>
									<xsl:with-param name="BackupName">IRS1065AmendedReturn</xsl:with-param>
								</xsl:call-template>
         Amended return
            </label>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065Data/AmendedReturnInd"/>
							</xsl:call-template>
						</div>
					</div>
					<xsl:if test="$Form1065Data/SupersededReturnInd">
						<div class="styNBB" style="width:187mm;">
							<div class="styGenericDiv" style="width:180mm;">
								<span style="width:35mm;"/>
							    <xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">G(6) Superseded Returns</xsl:with-param>
								 <xsl:with-param name="TargetNode" select="$Form1065Data/SupersededReturnInd"/>
								</xsl:call-template>
							</div>
						</div>
					</xsl:if>						
					<div class="styNBB" style="width:187mm;">
						<div class="styBoldText" style="width:5mm;float:left;clear:none;padding-left:1.5mm;padding-top:1mm;">H</div>
      Check accounting method: 
            <!--<span style="width:1mm;"/>-->
							<span class="styBoldText">(1)</span>
							<span style="width:.7px;"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065Data/MethodOfAccountingCashInd"/>
									<xsl:with-param name="BackupName">IRS1065MethodOfAccountingCash</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065Data/MethodOfAccountingCashInd"/>
									<xsl:with-param name="BackupName">IRS1065MethodOfAccountingCash</xsl:with-param>
								</xsl:call-template>
         Cash
            </label>
							<span style="width:8mm;"/>
							<span class="styBoldText">(2)</span>
							<span style="width:.7px;"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065Data/MethodOfAccountingAccrualInd"/>
									<xsl:with-param name="BackupName">IRS1065MethodOfAccountingAccrual
									</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065Data/MethodOfAccountingAccrualInd"/>
									<xsl:with-param name="BackupName">IRS1065MethodOfAccountingAccrual
									</xsl:with-param>
								</xsl:call-template>
         Accrual
            </label>
							<span class="styBoldText">(3)</span>
							<span style="width:.7px;"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065Data/MethodOfAccountingOtherInd"/>
									<xsl:with-param name="BackupName">IRS1065MethodOfAccountingOther</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065Data/MethodOfAccountingOtherInd"/>
									<xsl:with-param name="BackupName">IRS1065MethodOfAccountingOther</xsl:with-param>
								</xsl:call-template>
         Other (specify)
            </label>
							<img src="{$ImagePath}/1065_Bullet_Sm.gif" alt="MidSizeBullet"/>
                            <span style="width:.2mm;"/>
   						   <span style="width:70mm;border-bottom:dashed 1px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1065Data/MethodOfAccountingOtherInd/@methodOfAccountingOtherDesc"/>
							</xsl:call-template>
							</span>
						</div>
					<!-- I -->
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styBoldText" style="width:5mm;float:left;clear:none;padding-left:1.5mm;">I</div>
						<div class="styGenericDiv" style="width:145mm;">
      Number of Schedules K-1. Attach one for each person who was a partner at any time during the tax year 
                            <span style="width:.2mm;"/>
							<img src="{$ImagePath}/1065_Bullet_Sm.gif" alt="MidSizeBullet"/>
							<span style="width:.2mm"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065Data/ScheduleK1AttachedCnt"/>
							</xsl:call-template>
						</div>
						<div class="styGenericDiv" style="width:37mm;font-size:7pt;text-align:right;border-bottom:solid black 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065Data/ScheduleK1AttachedCnt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- J -->
					<div class="styNBB" style="width:187mm;">
						<div class="styBoldText" style="width:5mm;float:left;clear:none;padding-left:1.5mm;padding-top:.5mm;">J</div>
						<div class="styGenericDiv" style="width:175mm;padding-top:.5mm;">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065Data/ScheduleCAndScheduleM3AttInd"/>
									<xsl:with-param name="BackupName">IRS1065SScheduleCAndScheduleM3Attached
									</xsl:with-param>
								</xsl:call-template>
                                  Check if Schedules C and M-3 are attached 
                                <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065Data/ScheduleCAndScheduleM3AttInd"/>
								</xsl:call-template>
							</label>
							<!--Dotted Line-->
							<span style="width:1.8mm"/>
							<span style=" letter-spacing:3.1mm; font-weight:bold; ">...........................</span>
                            <span style="width:.2mm;"/>
							<img src="{$ImagePath}/1065_Bullet_Sm.gif" alt="MidSizeBullet"/>
							<span style="width:.2mm"/>
						</div>
						<div class="styGenericDiv" style="width:5mm;float:right;text-align:right;">
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065Data/ScheduleCAndScheduleM3AttInd"/>
									<xsl:with-param name="BackupName">IRS1065ScheduleCAndScheduleM3Attached
									</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<!-- K -->
					<div class="styBB" style="width:187mm;">
						<div class="styBoldText" style="width:5mm;float:left;clear:none;padding-left:1.5mm;padding-top:1.5mm;">K</div>
						<div class="styGenericDiv" style="font-size:6.5pt;">
                                  Check if partnership: 
							<span style="width:6px;"/>
							<span class="styBoldText" style="width:2mm">(1)</span>
							<span style="width:12px;"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065Data/Sect465AtRiskAggregatedActyInd"/>
									<xsl:with-param name="BackupName">Section465AtRiskAggregatedActivityIndicator</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065Data/Sect465AtRiskAggregatedActyInd"/>
									<xsl:with-param name="BackupName">Section465AtRiskAggregatedActivityIndicator</xsl:with-param>
								</xsl:call-template>
								 Aggregated activities for section 465 at-risk purposes
							</label>							
						</div>
						<div class="styGenericDiv" style="font-size:6.5pt;">
							<span style="width:6px;"/>
							<span class="styBoldText" style="width:2mm">(2)</span>
							<span style="width:3px;"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065Data/Sect469PALGroupedActyInd"/>
									<xsl:with-param name="BackupName">Section469PassiveGroupedActivityIndicator</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065Data/Sect469PALGroupedActyInd"/>
									<xsl:with-param name="BackupName">Section469PassiveGroupedActivityIndicator</xsl:with-param>
								</xsl:call-template>
								 Grouped activities for section 469 passive activity purposes
							</label>							
						</div>
					</div>
					<!-- Caution -->
					<div class="styBB" style="width:187mm;height:4mm;padding-top:0mm;">
						<span class="styBoldText">Caution.</span>
						<span class="styItalicText" style="padding-left:1mm;"> Include 
							<span class="styBoldText">only</span> 
						trade or business income and expenses on lines 1a through 22 below. See the instructions for more
						information.
						</span>
					</div>
					<!--BEGIN Main Form Income Section-->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS1065VTImageBox" style="height:45.2mm;padding-top:17mm;">
							<img src="{$ImagePath}/1065_Income.gif" alt="VerticalIncome"/>
						</div>
						<div style="width:181mm;float:right;clear:none">
							<div class="styLNLeftNumBox" style="padding-left: 2.25mm;height:3mm;">1a</div>
							<div class="styLNDesc" style="width:92mm;height:3mm;">
						      Gross receipts or sales
						      <!-- Form to Form Link -->
								<span style="width:1mm"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065Data/GrossReceiptsOrSalesAmt"/>
								</xsl:call-template> 
						        <!--Dotted Line-->
								<span style="width:1.8mm;"/>
								<span style=" letter-spacing:3.1mm; font-weight:bold; ">..............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">1a</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/GrossReceiptsOrSalesAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="background-color:lightgrey;height:4.5mm;border-bottom-width:0px"/>
							<div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftLtrBox" style="height:4mm;">
								<span style="width:4px;"/>b
							</div>
							<div class="styLNDesc" style="width:92mm;height:4mm;">
							  Returns and allowances 
							    <!--Dotted Line-->
								<span style="width:1.8mm;"/>
								<span style=" letter-spacing:3.1mm; font-weight:bold; ">...............</span>  
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">1b</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/ReturnsAndAllowancesAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;          border-bottom-width:0px"/>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px"/>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftLtrBox" style="height:4mm;">
								<span style="width:4px;"/>c
							</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
							  Balance.  Subtract line 1b from line 1a    
								<!--Dotted Line-->
								<span style="width:1mm"/>
								<span style=" letter-spacing:3.1mm; font-weight:bold; ">....................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">1c</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/NetGrossReceiptsOrSalesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">2</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
							  Cost of goods sold (attach Form 1125-A)
							<!-- Form to Form Link -->
								<span style="width:1mm"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065Data/CostOfGoodsSoldAmt"/>
								</xsl:call-template>
								<!--Dotted Line-->
								<span style="width:.8mm"/>
								<span style=" letter-spacing:3.1mm; font-weight:bold; ">..................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;">2</div>
							<div class="styLNAmountBox" style="height:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/CostOfGoodsSoldAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">3</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
							  Gross profit. Subtract line 2 from line 1c
								<!--Dotted Line-->
								<!--<span style="width:1.8mm"/>-->
								<span style=" letter-spacing:3.1mm; font-weight:bold; ">....................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">3</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/GrossProfitAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">4</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
							  Ordinary income (loss) from other partnerships, estates, and trusts (attach statement)
								<span style="width:2px"/>
								<!-- Form to Form Link -->
								<span style="width:.5mm"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065Data/OrdinaryIncomeLossAmt"/>
								</xsl:call-template>
								<!--Dotted Line-->
								<span style="width:2mm"/>
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">...</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">4</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/OrdinaryIncomeLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">5</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
							  Net farm profit (loss) (attach Schedule F (Form 1040))
								<span style="width:2px"/>
								<!-- Form to Form Link -->
								<span style="width:.5mm"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065Data/NetFarmProfitLossAmt"/>
								</xsl:call-template>
								<!--Dotted Line-->
								<span style="width:1.8mm"/>
								<span style=" letter-spacing:3.1mm; font-weight:bold; ">..............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">5</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/NetFarmProfitLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">6</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
							  Net gain (loss) from Form 4797, Part II, line 17 (attach Form 4797)
								<span style="width:2px;"/>
								<!-- Form to Form Link -->
								<span style="width:.5mm"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065Data/TotalOrdinaryGainLossAmt"/>
								</xsl:call-template>
								<!--Dotted Line-->
								<span style="width:1.8mm"/>
								<span style=" letter-spacing:3.1mm; font-weight:bold; ">.........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">6</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/TotalOrdinaryGainLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="padding-left: 2.25mm;height:4mm;">7</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
							  Other income (loss) (attach statement)
								<span style="width:2px;"/>
								<!-- Form to Form Link -->
								<span style="width:.5mm"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065Data/OtherIncomeLossAmt"/>
								</xsl:call-template>
								<!--Dotted Line-->
								<span style="width:1.8mm"/>
								<span style=" letter-spacing:3.1mm; font-weight:bold; ">...................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">7</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/OtherIncomeLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="padding-left: 2.25mm;height:4.5mm;">8</div>
							<div class="styLNDesc" style="width:132mm;height:4.5mm;padding-top:1mm">
								<span class="styBoldText">Total income (loss).</span> Combine lines 3 through 7
								<!--Dotted Line-->
								<span style="width:1.8mm"/>
								<span style=" letter-spacing:3.1mm; font-weight:bold; ">.................</span>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:5.25mm;padding-bottom:0mm;padding-top:1mm">8</div>
							<div class="styLNAmountBoxNBB" style="height:5.25mm;padding-bottom:0mm;padding-top:1mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/TotalIncomeOrLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--END Main Form Income Section-->
					<!--BEGIN Main Form Deduction Section-->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS1065VTImageBox" style="height:62.5mm;padding-top:3mm;">
							<img src="{$ImagePath}/1065_DeductionsLong.gif" alt="Deductions See The Instructions For Limitations"/>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="padding-left: 2.25mm;height:4mm;">9</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
							  Salaries and wages (other than to partners) (less employment credits)
								<!--Dotted Line-->
								<!--<span style="width:1.8mm"/>-->
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">.........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;">9</div>
							<div class="styLNAmountBox" style="height:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/SalariesAndWagesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">10</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">Guaranteed payments to partners
								<!--Dotted Line-->
								<span style="width:1mm"/>
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">.....................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">10</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/GuaranteedPaymentsToPrtnrAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">11</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">Repairs and maintenance
								<!--Dotted Line-->
								<!--<span style="width:1.8mm"/>-->
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">........................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">11</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/RepairsAndMaintenanceAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">12</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">Bad debts
								<!--Dotted Line-->
								<!--<span style="width:1.8mm"/>-->
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">.............................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">12</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/BadDebtsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">13</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">Rent
								<!--Dotted Line-->
								<!--<span style="width:1.8mm"/>-->
								<span style=" letter-spacing:3.1mm; font-weight:bold; ">...............................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">13</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/TotalRentOrLeaseExpenseAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">14</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">Taxes and licenses
								<!--Dotted Line-->
								<!--<span style="width:1.8mm"/>-->
								<span style=" letter-spacing:3.1mm; font-weight:bold; ">..........................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">14</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/TaxesAndLicensesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">15</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">Interest (see instructions)
								<span style="width:2px;"/>
								<!-- Form to Form Link -->
								<span style="width:.5mm"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065Data/InterestDeductionAmt"/>
								</xsl:call-template>
								<!--Dotted Line-->
								<span style="width:1.8mm"/>
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">......................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">15</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/InterestDeductionAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:0.5mm;">16a</div>
							<div class="styLNDesc" style="width:92mm;height:4.5mm;">
							  Depreciation (if required, attach Form 4562)
								<span style="width:2px;"/>
								<!-- Form to Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065Data/DepreciationAmt"/>
								</xsl:call-template>
								<!--Dotted Line-->
								<span style="width:1.8mm"/>
								<span style=" letter-spacing:3.1mm; font-weight:bold; ">.......</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">16a</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/DepreciationAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="background-color:lightgrey;height:4.5mm;
							  border-bottom-width:0px"/>
							<div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftLtrBox" style="height:3mm;padding-top:0.5mm;">
								<span style="width:4px;"/>b
							</div>
							<div class="styLNDesc" style="width:92mm;height:3mm;">
							  Less depreciation reported on Form 1125-A and elsewhere on return
							    <!-- Form to Form Link -->
								<span style="width:1mm"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065Data/LessDepreciationAmt"/>
								</xsl:call-template>   
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">16b</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/LessDepreciationAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm">16c</div>
							<div class="styLNAmountBox" style="height:4.5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/TotalDepreciationAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">17</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">Depletion 
								<span class="styBoldText"> (Do not deduct oil and gas depletion.)</span>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065Data/DepletionAmt"/>
								</xsl:call-template>
								<!--Dotted Line-->
								<span style="width:1.8mm"/>
								<span style=" letter-spacing:3.1mm; font-weight:bold; ">...............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">17</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/DepletionAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">18</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">Retirement plans, etc.
								<!--Dotted Line-->
								<span style="width:1.8mm"/>
								<span style=" letter-spacing:3.1mm; font-weight:bold; ">.........................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">18</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/PensionProfitSharingPlansAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">19</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">Employee benefit programs
								<!--Dotted Line-->
								<span style="width:1.8mm"/>
								<span style=" letter-spacing:3.1mm; font-weight:bold; ">.......................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">19</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/EmployeeBenefitProgramAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">20</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
							  Other deductions (attach statement)
								<span style="width:2px;"/>
								<!-- Form to Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065Data/OtherDeductionsAmt"/>
								</xsl:call-template>
								<!--Dotted Line-->
								<span style="width:1.8mm"/>
								<span style=" letter-spacing:3.1mm; font-weight:bold; ">...................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">20</div>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:1;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/OtherDeductionsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">21</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span class="styBoldText">Total deductions.</span> 
								  Add the amounts shown in the far right column for lines 9 through 20
								<!--Dotted Line-->
								<span style="width:1.8mm"/>
								<span style=" letter-spacing:3.1mm; font-weight:bold; ">...</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0;padding-bottom:0mm">21</div>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0;padding-bottom:0mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/TotalDeductionAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--END Main Form Deductions Section-->
					<!--BEGIN Ordinary Business Income or Loss Section-->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS1065VTImageBox" style="height:4.5mm;padding-top:3mm;"></div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-top:1mm;">22</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span class="styBoldText" style="font-size:7pt;">Ordinary business income (loss).</span> 
								  Subtract line 21 from line 8  
								<span style="width:1mm"/>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">
									  Form 1065, Line 22 - Three And One Half Percent</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1065Data/OrdinaryBusinessIncomeLossAmt/@threeAndOneHalfPercentAmt"/>
								</xsl:call-template>
								<span style="width:1mm"/>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">
									  Form 1065, Line 22 - Qlfy Therapeutic Discovery Credit</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1065Data/OrdinaryBusinessIncomeLossAmt/@qlfyTherapeuticDiscoveryCrAmt"/>
								</xsl:call-template>
								<!--Dotted Line-->
								<span style="width:1.8mm"/>
								<span style=" letter-spacing:3.1mm; font-weight:bold; ">..........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0;">22</div>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/OrdinaryBusinessIncomeLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--END Ordinary Business Income or Loss Section-->
					<!--BEGIN Main Form Tax and Payment Section-->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS1065VTImageBox" style="height:35.4mm;padding-top:6mm;">
							<img src="{$ImagePath}/1065_TaxAndPayment.gif" alt="Tax and Payment"/>
						</div>				
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="padding-left:1mm;height:4mm;">23</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
							  Interest due under the look-back method – completed long-term contracts (attach Form 8697)
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065Data/Form8697Amt"/>
								</xsl:call-template>
								<!--Dotted Line-->
								<!--<span style="width:1.8mm"/>-->
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">..</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;">23</div>
							<div class="styLNAmountBox" style="height:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/Form8697Amt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">24</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								Interest due under the look-back method – income forecast method (attach Form 8866)
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065Data/Form8866Amt"/>
								</xsl:call-template>
								<!--Dotted Line-->
								<span style="width:1mm"/>
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">....</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">24</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/Form8866Amt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">25</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">BBA AAR imputed underpayment (see instructions)
								<!--Dotted Line-->
								<!--<span style="width:1.8mm"/>-->
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">25</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/BBAImputeUnderpaymentAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">26</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">Other taxes (see instructions)
								<!--Dotted Line-->
								<!--<span style="width:1.8mm"/>-->
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">......................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">26</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/OtherTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">27</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span class="styBoldText">Total balance due.</span>  Add lines 23 through 26
								<!--Dotted Line-->
								<!--<span style="width:1.8mm"/>-->
								<span style=" letter-spacing:3.1mm; font-weight:bold; ">..................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">27</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/TotalBalanceDueAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">28</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">Payment (see instructions)
								<!--Dotted Line-->
								<!--<span style="width:1.8mm"/>-->
								<span style=" letter-spacing:3.1mm; font-weight:bold; ">........................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">28</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/TotalPaymentsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">29</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span class="styBoldText">Amount Owed.</span>
								  If line 28 is smaller than line 27, enter amount owed
								<span style="width:2px;"/>
								<!--Dotted Line-->
								<span style="width:1.8mm"/>
								<span style=" letter-spacing:3.1mm; font-weight:bold; ">..........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">29</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/OwedAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">30</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span class="styBoldText">Overpayment.</span> 
								  If line 28 is larger than 27, enter overpayment
								<!--Dotted Line-->
								<span style="width:1.8mm"/>
								<span style=" letter-spacing:3.1mm; font-weight:bold; ">............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0;padding-bottom:0mm">30</div>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0;padding-bottom:0mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065Data/OverpaymentAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--END Main Form Tax and Payment Section-->
					<p style="page-break-before: always" />
					<!-- BEGIN Signature Section -->
					<!-- Implementing the signature section as a table -->
					<div class="styBB" style="width:187mm;font-size:6pt;">
					<div class="styMainTitle"  style="height:24mm;width:12mm;font-size:11pt;font-weight:bold;padding-top:7mm;padding-bottom:5mm;border-style:solid;border-color:black;border-width:0px 1px 0px 0px;float:left;clear:none;">Sign Here</div>
					<div class="styLNDesc" style="height;auto;width:175mm;">
						<div class="styLNDesc" style="height:9mm;width:175mm;padding-left:1mm;padding-bottom:1mm;">
						  Under penalties of perjury, I declare that I have examined this return, including 
						  accompanying schedules and statements, and to the best of my knowledge
						  and belief, it is true, correct, and complete. Declaration of preparer (other than 
						  partner or limited liability company member) is based on all information 
						  of which preparer has any knowledge.
                   </div><br/>
						<div style="width:101mm;padding-top:6mm;">
							<div style="height:auto;with:5mm;padding-left:1mm;padding-right:2mm;float:left;clear:none;">
								<img src="{$ImagePath}/1065_Bullet_Lg.gif" alt="LargeBullet"/>
							</div>
						<div style="width:90mm;">	
							<div class="styFixedUnderline" style="width:95mm;float:left;clear:none;">
								<xsl:call-template name="PopulateReturnHeaderPartner">
									<xsl:with-param name="TargetNode">Name</xsl:with-param>
								</xsl:call-template>
							</div><br/>
						<div class="styLNDesc" style="height:auto;border-bottom:1 solid black;vertical-align:top;">Signature of partner or limited liability company member</div>
							</div>
						</div>
							<div style="width:32mm;padding-top:2mm;">
								<div style="height:auto;with:5mm;padding-left:1mm;padding-right:2mm;float:left;clear;none;">
								<img src="{$ImagePath}/1065_Bullet_Lg.gif" alt="LargeBullet"/>
							</div>
						<div style="width:25mm;">
							<div class="styFixedUnderline" style="width:25mm;float:left;clear:none;">
								<xsl:call-template name="PopulateReturnHeaderPartner">
									<xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
								</xsl:call-template>
							</div><br/>
							<div class="styLNDesc" style="height:auto;">Date</div>
						</div>
					</div>
					<div class="styLNDesc" style="width:40mm;float:right;clear:none;padding-top:0mm">
						<div class="styGenericDiv" style="width:2px;"/>
						<div style="height:auto;border-style:solid;border-color:black;border-width:3px 3px 3px 3px;float:right;clear:none;"> 
							May the IRS discuss this return<br/> with the preparer shown below <br/>(see instructions) ?
							<input class="styCkbox"  alt="May the IRS discuss this return with the preparer shown below? Yes"
								type="checkbox" name="Checkbox" id="dummyidyes" style="width:3mm;">
								<xsl:call-template name="PopulateReturnHeaderPartner">
									<xsl:with-param name="TargetNode">AuthorizeThirdPartyYesCheckbox</xsl:with-param>
									<xsl:with-param name="BackupName">
									    May the IRS discuss this return with the preparer shown below? Yes</xsl:with-param>
								</xsl:call-template>
							</input>
							<span class="styBoldText">
								<label for="dummyidyes">
									<xsl:call-template name="PopulateReturnHeaderPartner">
										<xsl:with-param name="TargetNode">AuthorizeThirdPartyYesLabel</xsl:with-param>
										<xsl:with-param name="BackupName">
											May the IRS discuss this return with the preparer shown below? Yes</xsl:with-param>
									</xsl:call-template>
										Yes
								</label>
							</span>
							<input class="styCkbox"  alt="May the IRS discuss this return with the preparer shown below? No" 
								type="checkbox" name="Checkbox" id="dummyidno" style="width:2.5mm;">
								<xsl:call-template name="PopulateReturnHeaderPartner">
									<xsl:with-param name="TargetNode">AuthorizeThirdPartyNoCheckbox</xsl:with-param>
								    <xsl:with-param name="BackupName">
										May the IRS discuss this return with the preparer shown below? No</xsl:with-param>
								</xsl:call-template>
							</input>
							<span class="styBoldText">
								<label for="dummyidno">
									<xsl:call-template name="PopulateReturnHeaderPartner">
										<xsl:with-param name="TargetNode">AuthorizeThirdPartyNoLabel</xsl:with-param>
										<xsl:with-param name="BackupName">
											May the IRS discuss this return with the preparer shown below? No</xsl:with-param>
								   </xsl:call-template>
										No
								</label>
							</span>
						</div>
					</div>
					</div>
					</div>
					<!-- END Signature Section -->
					<!-- BEGIN PREPARER SIGNATURE SECTION -->
					<!-- Implementing the Preparer section in table -->
					<div class="styBB" style="width:187mm;font-size:6pt;">
						   <div style="height:26mm;width:18mm;padding-top:5mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 1px 0px 0px;">
								<span class="styMainTitle" style="font-size:11pt;">
										  Paid<br/> Preparer<br/> Use Only</span>
							</div>
						  <div style="width:168mm;float:left;clear:none;">
								<div style="width:168mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
								<div class="styLNDesc" style="height:8mm;width:50mm;padding-left:.5mm;border-style:solid;border-color:black;border-width:0px 1px 0px 0px;">
									  Print/Type preparer's name<br/>
							   <xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">Name</xsl:with-param>
							   </xsl:call-template>
							</div>
							<div class="styLNDesc" style="height:8mm;width:62.3mm;padding-left:.5mm;border-style:solid;border-color:black;border-width:0px 1px 0px 0px;">
								Preparer's signature
							</div>
							<div class="styLNDesc" style="height:8mm;width:15mm;border-style:solid;border-color:black;border-width:0px 1px 0px 0px;padding-left:.5mm;">
									Date <br/>
								<xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">DatePrepared</xsl:with-param>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="height:8mm;width:18mm;border-style:solid;border-color:black;border-width:0px 1px 0px 0px;padding-left:.5mm;">
								   	  <label for="dummyid1">
										 <xsl:call-template name="PopulateReturnHeaderPreparer">
											<xsl:with-param name="TargetNode">SelfEmployedLabel</xsl:with-param>
											<xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
										  </xsl:call-template><span style="width:.5mm"/>Check  
									      <input class="styCkbox" type="checkbox" id="dummyid1" style="width:4mm;">
									         <xsl:call-template name="PopulateReturnHeaderPreparer">
										        <xsl:with-param name="TargetNode">SelfEmployedCheckbox</xsl:with-param>
										        <xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
									         </xsl:call-template>
								          </input><span style="width:.5mm"/>if
								   <br/> self-employed
								      </label>
								</div>
							   <div class="styLNDesc" style="height:6mm;width:19mm;padding-left:.5mm;">
							     PTIN<br/>
								  <xsl:call-template name="PopulateReturnHeaderPreparer">
								     <xsl:with-param name="TargetNode">SSN</xsl:with-param>
								  </xsl:call-template>
								  <xsl:call-template name="PopulateReturnHeaderPreparer">
									 <xsl:with-param name="TargetNode">PTIN</xsl:with-param>
								  </xsl:call-template>
								  <xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								  </xsl:call-template>
								</div>
							</div>
						<div style="width:168mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">	
						<div class="styLNDesc" style="height:6mm;width:127.3mm;border-style:solid;border-color:black;border-width:0px 1px 0px 0px;">
							<span class="styGenericDiv" style="padding-left:.5mm;">Firm's name <span style="width:2.2mm;padding-right:2mm;"/>
							  	<img src="{$ImagePath}/1065_Bullet_Sm.gif" alt="SmallBullet"/>
							</span>
								<span style="width:.8mm"/>
								<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
								</xsl:call-template>
								<br/>
								<span style="width:19.5mm"/>
								    <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
								       <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
								    </xsl:call-template>
						</div>
							<div class="styLNDesc" style="height:6mm;width:33mm;padding-left:.5mm;">Firm's EIN 
							    <img src="{$ImagePath}/1065_Bullet_Sm.gif" alt="SmallBullet"/>
								<span style="padding-right:1mm;"/>
								<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:168mm;float:left;clear:none;">	
							<div class="styLNDesc" style="height:11.5mm;width:127.3mm;border-style:solid;border-color:black;border-width:0px 1px 0px 0px;">
								<div class="styGenericDiv" style="padding-left:.5mm;">Firm's address
							  	<img src="{$ImagePath}/1065_Bullet_Sm.gif" alt="SmallBullet"/>
								</div>
								<div class="styGenericDiv" style="padding-left:.5mm;">
								<xsl:choose>
									<xsl:when test="$RtnHdrData/PreparerFirmGrp/PreparerUSAddress">
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
										</xsl:call-template>
										<xsl:if test="$RtnHdrData/PreparerFirmGrp/PreparerUSAddress/AddressLine2Txt">
											<br/>
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
										</xsl:call-template>
										<xsl:if test="$RtnHdrData/PreparerFirmGrp/PreparerUSAddress/CountryCd">
										   <br/>
										   <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
										   </xsl:call-template>
										</xsl:if>
									</xsl:when>
									<xsl:when test="$RtnHdrData/PreparerFirmGrp/PreparerForeignAddress">
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
										</xsl:call-template>
										<xsl:if test="$RtnHdrData/PreparerFirmGrp/PreparerForeignAddress/AddressLine2Txt">
											<br/>
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
										</xsl:call-template><br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
										</xsl:call-template>
										<span style="width:2px;"/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
										</xsl:call-template>
										<span style="width:2px;"/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
										</xsl:call-template>
									</xsl:when>
								</xsl:choose>
							</div>
						</div>
							<div class="styLNDesc" style="width:33mm;padding-left:.5mm;">Phone no. 
                                <xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">Phone</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
								</xsl:call-template>
							</div>
							<div style="padding-top:8mm;">
								<span style="width:3mm;"/>
							</div>
						</div>
					</div>
					</div>
					<!-- END PREPARER SIGNATURE SECTION -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:left;">
							<span class="styBoldText">
							  For Paperwork Reduction Act Notice, see separate instructions.</span>
							<span style="width:13mm;"/>Cat. No. 11390Z
						</div>
						<div style="float:right;">
							<span style="width:40px;"/>  
							  Form <span class="styBoldText" style="font-size:8pt;">1065</span> (2020)
						</div>
					</div>
					<p style="page-break-before: always"/>
					<!-- END Page Break and Footer-->
					<!--Begin Page 2 -->
					<!-- Page Header -->
					<div class="styBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">Form 1065 (2020)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
						</div>
					</div>
					<!-- END Page Header -->
					<!--br class="pageEnd"/-->
					<!--span style="width:1px;"></span-->
					<!-- BEGIN Schedule B Line Items -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="width:23mm;">Schedule B</div>
						<div class="styPartDesc" style="width:164mm;">Other Information</div>
					</div>
					<!-- SCHEDULE B Line 1-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm; padding-left:1.5mm;">1</div>
						<div class="styLNDesc" style="height:4mm;width:167mm;">
						  What type of entity is filing this return? Check the applicable box:</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm; border-left-width:1;border-right-width:1;">Yes</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;border-left-width:1;">No</div>
					</div>
					<!--SCHEDULE B Line 1a-->
					<div style="width:187mm">
						<div class="styLNLeftLtrBox" style="height:4mm;padding-top:1.5mm;">a</div>
						<div class="styLNDesc" style="width:65mm">
							<input class="styCkBox" type="checkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/DomesticGeneralPartnershipInd"/>
									<xsl:with-param name="BackupName">IRS1065DomesticGeneralPartnership
									</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1mm;"/>
							<label for="DomesticGeneralPartnershipInd">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/DomesticGeneralPartnershipInd"/>
									<xsl:with-param name="BackupName">IRS1065DomesticGeneralPartnership
									</xsl:with-param>
								</xsl:call-template>
							  Domestic general partnership
							</label>
						</div>
						<!-- SCHEDULE B Line 1b-->
						<div class="styLNLeftLtrBox" style="height:4mm;padding-top:1.5mm;">b</div>
						<div class="styLNDesc" style="width:94mm">
							<input class="styCkBox" type="checkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/DomesticLimitedPartnershipInd"/>
									<xsl:with-param name="BackupName">IRS1065DomesticLimitedPartnership
									</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1mm;"/>
							<label for="DomesticLimitedPartnershipInd">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/DomesticLimitedPartnershipInd"/>
									<xsl:with-param name="BackupName">IRS1065DomesticLimitedPartnership
									</xsl:with-param>
								</xsl:call-template>
							  Domestic limited partnership
							</label>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;background:gray;border-bottom:0"/>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;background:gray;border-bottom:0"/>
					</div>
					<!-- SCHEDULE B Line 1c-->
					<div style="width:187mm">
						<div class="styLNLeftLtrBox" style="height:4mm;padding-top:1.5mm;">c</div>
						<div class="styLNDesc" style="height:4mm; width:65mm">
							<input class="styCkBox" type="checkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/DomesticLimitedLiabilityCoInd"/>
									<xsl:with-param name="BackupName">IRS1065DomesticLimitedLiabilityCo
									</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1mm;"/>
							<label for="DomesticLimitedLiabilityCoInd">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/DomesticLimitedLiabilityCoInd"/>
									<xsl:with-param name="BackupName">IRS1065DomesticLimitedLiabilityCo
									</xsl:with-param>
								</xsl:call-template>
							  Domestic limited liability company
							</label>
						</div>
						<!-- SCHEDULE B Line 1d-->
						<div class="styLNLeftLtrBox" style="height:4mm;padding-top:1.5mm;">d</div>
						<div class="styLNDesc" style="height:4mm; width:94mm">
							<input class="styCkBox" type="checkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/DomesticLimitedLiabPrtshpInd"/>
									<xsl:with-param name="BackupName">IRS1065DomesticLimitedLiabilityPrtshp
									</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1mm;"/>
							<label for="DomesticLimitedLiabPrtshpInd">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/DomesticLimitedLiabPrtshpInd"/>
									<xsl:with-param name="BackupName">IRS1065DomesticLimitedLiabilityPrtshp
									</xsl:with-param>
								</xsl:call-template>
							  Domestic limited liability partnership
							</label>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm; background:gray;border-bottom:0"/>
						<div class="styIRS1065LNYesNoBox" style="height:4mm; background:gray;border-bottom:0"/>
					</div>
					<!-- SCHEDULE B Line 1e-->
					<div style="width:187mm">
						<div class="styLNLeftLtrBox" style="height:4mm;padding-top:1.5mm;">e</div>
						<div class="styLNDesc" style="width:65mm;height:4mm;">
							<input class="styCkBox" type="checkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/ForeignPartnershipInd"/>
									<xsl:with-param name="BackupName">IRS1065ForeignPartnership</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1mm;"/>
							<label for="ForeignPartnershipInd">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/ForeignPartnershipInd"/>
									<xsl:with-param name="BackupName">IRS1065ForeignPartnership</xsl:with-param>
								</xsl:call-template>
							   Foreign partnership
							</label>
						</div>
						<!-- SCHEDULE B Line 1f-->
						<div class="styLNLeftLtrBox" style="height:4mm;padding-top:1.5mm;">f</div>
						<div class="styLNDesc" style="height:4mm;width:94mm;">
							<input class="styCkBox" type="checkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/OtherInd"/>
									<xsl:with-param name="BackupName">IRS1065TypeOfEntityOther</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1mm;"/>
							<label for="OtherInd">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/OtherInd"/>
									<xsl:with-param name="BackupName">IRS1065TypeOfEntityOther</xsl:with-param>
								</xsl:call-template>
							  Other 
							</label>
							<span style="width:2mm;"/>
							<img src="{$ImagePath}/1065_Bullet_Sm.gif" alt="SmallBullet"/>
							<span style="width:2mm;"/>
							<span style="height:4mm;width:72mm;border-bottom:1 solid black;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/OtherInd/@otherDesc"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:5mm;background:gray;border-bottom:0"/>
						<div class="styIRS1065LNYesNoBox" style="height:5mm;background:gray;border-bottom:0"/>
					<div class="styBB" style="width:187mm"/>
					</div>
					<!-- SCHEDULE B Line 2-->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm; padding-left:1.5mm;">2</div>
						<div class="styLNDesc" style="width:167mm">At the end of the tax year:</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;;background:gray;border-bottom-width:0;"/>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;;background:gray;border-bottom-width:0;"/>
					</div>
					<!-- SCHEDULE B Line 2a-->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm; padding-left:3.5mm;">a</div>
						<div class="styLNDesc" style="width:167mm">
                          Did any foreign or domestic corporation, partnership (including any entity treated as a partnership),
                          trust, or tax-exempt organization, or any foreign government own, directly or indirectly, an interest 
                          of 50% or more in the profit, loss, or capital of the partnership?  For rules of constructive ownership, 
                          see instructions.  If "Yes," attach Schedule B-1, Information on Partners Owning 50% or More of the
                          Partnership.
                          <xsl:call-template name="SetFormLinkInline">
						     <xsl:with-param name="TargetNode" select="$Form1065ScheduleB/EntOwnInt50PctOrMorePrtshpInd"/>
						  </xsl:call-template>
						  <span style="width:1.8mm"/>
								<span style=" letter-spacing:3.1mm; font-weight:bold; ">...........................</span>
				         </div>
						<div class="styIRS1065LNYesNoBox" style="height:13mm; border-left-width:1; border-bottom-width:1;font-weight:normal;padding-top:9mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/EntOwnInt50PctOrMorePrtshpInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:13mm; border-left-width:1; border-bottom-width:1;font-weight:normal;padding-top:9mm;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/EntOwnInt50PctOrMorePrtshpInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCHEDULE B Line 2b-->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm; padding-left:3.5mm;">b</div>
						<div class="styLNDesc" style="width:167mm">
                                          Did any individual or estate own, directly or indirectly, an interest of 50% or 
                                          more in the profit, loss, or capital of the <br/>partnership? For rules of 
                                          constructive ownership, see instructions.  If "Yes," attach Schedule B-1, 
                                          Information on Partners Owning 50% or More of the Partnership.
                            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/IndivEstOwn50OrMorePrtshpInd"/>
						    </xsl:call-template>
						    <span style="width:1.8mm"/>
								<span style=" letter-spacing:3.1mm; font-weight:bold; ">...........................</span>
						</div>
						
						<div class="styIRS1065LNYesNoBox" style="height:10mm; border-left-width:1;border-bottom-width:0;font-weight:normal;padding-top:6mm">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/IndivEstOwn50OrMorePrtshpInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:10mm; border-left-width:1;border-bottom-width:0;font-weight:normal;padding-top:6mm">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/IndivEstOwn50OrMorePrtshpInd"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styBB" style="width:187mm;"/>
					<!-- SCHEDULE B Line 3-->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm; padding-left:1.5mm;">3</div>
						<div class="styLNDesc" style="width:167mm">At the end of the tax year, did the partnership:</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;background:gray;border-bottom-width:0;"/>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;background:gray;border-bottom-width:0;"/>
					</div>
					<!--SCHEDULE B Line 3a-->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm; padding-left:3.5mm;">a</div>
						<div class="styLNDesc" style="width:167mm">
                          Own directly 20% or more, or own, directly or indirectly, 50% or more of the total voting power of all
                          classes of stock entitled to vote of any foreign or domestic corporation? For rules of
                          constructive ownership, see instructions. If "Yes," complete (i)
                        </div>
						<div class="styIRS1065LNYesNoBox" style="height:6mm;background:gray;border-bottom-width:0;"/>
						<div class="styIRS1065LNYesNoBox" style="height:6mm;background:gray;border-bottom-width:0;"/>        
					</div>
					<div style="width:187mm">                          
					<div class="styLNLeftNumBox" style="height:4mm; padding-left:3.5mm;"></div>
						<div class="styLNDesc" style="width:167mm;">                          
                          through (iv) below 
                            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/PctTotalVotingPowerOwnGrp"/>
							</xsl:call-template>
							<span style="width:1.8mm"/>
								<span style=" letter-spacing:3.1mm; font-weight:bold; ">...................................</span>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm; border-left-width:1;border-bottom-width:0;font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/PercentTotalVtngPwrOwnOfStkInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm; border-left-width:1;border-bottom-width:0;font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/PercentTotalVtngPwrOwnOfStkInd"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styGenericDiv" style="width:3.1mm;float:right;" align="right">
						<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/PctTotalVotingPowerOwnGrp"/>
							<xsl:with-param name="containerHeight" select="5"/>
							<xsl:with-param name="containerID" select=" 'REPtbl4a' "/>
						</xsl:call-template>
						<!-- end button display logic -->
					</div>
				</div>



<div class="styTableContainer" id="REPtbl4a" style="width:187mm;clear:all;height:auto;">
	<!-- print logic -->
	<xsl:call-template name="SetInitialState"/>
	<!-- end -->
	<table class="styTable" cellspacing="0">
		<thead class="styTableThead">
			<tr>
				<th class="styTableCellHeader" style="width:78mm;vertical-align:top;font-size:6.5pt;border-color:black;" scope="col">
					<span class="styBoldText">(i)
                                       <span class="styNormalText"> Name of Corporation</span>
					</span>
				</th>
				<th class="styTableCellHeader" style="width:46mm;vertical-align:top;font-size:6.5pt;border-color:black;font-weight:normal;" scope="col">
					<b>(ii)</b> 
                      Employer Identification <br/>Number (if any)
				</th>
				<th class="styTableCellHeader" style="width:29mm;vertical-align:top;font-size:6.5pt;border-color:black;font-weight:normal" scope="col">
					<b>(iii)</b>
                                        Country of <br/>Incorporation
				</th>
				<th class="styTableCellHeader" style="width:34mm;vertical-align:top;font-size:6.5pt;border-color:black;border-right-width:0;font-weight:normal" scope="col">
					<b>(iv)</b>
                Percentage <br/>Owned in Voting<br/>Stock
				</th>
			</tr>
		</thead>
		<tfoot/>
		<tbody>
			<xsl:for-each select="$Form1065ScheduleB/PctTotalVotingPowerOwnGrp">
				<xsl:if test="($Print != $Separated) or           (count($Form1065ScheduleB/PctTotalVotingPowerOwnGrp) &lt;=2)">
					<tr style="font-size: 6.5pt;">
						<td class="styTableCellText" style="width:78mm;height:1mm;text-align:left;vertical-align:top;border-color:black;">
							<xsl:if test="CorporationName">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="CorporationName"/>
								</xsl:call-template>
							</xsl:if>
						</td>
						<td class="styTableCellText" style="width:46mm;text-align:center;vertical-align:top;border-color:black;">
							<xsl:choose>
								<xsl:when test="SSN">
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="SSN"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:when test="EIN">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="EIN"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</td>
						<td class="styTableCellText" style="width:29mm;text-align:center;vertical-align:top;border-color:black;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="IncorporationCountryCd"/>
							</xsl:call-template>
						</td>
						<td class="styTableCellText" style="width:33mm;text-align:center;vertical-align:top;border-color:black;border-right-width:0;">
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="VotingStockOwnedPct"/>
							</xsl:call-template>
						</td>
					</tr>
				</xsl:if>
			</xsl:for-each>
			<!-- Table Filler Rows -->
			<xsl:if test="count($Form1065ScheduleB/PctTotalVotingPowerOwnGrp) &lt; 1           or ((count($Form1065ScheduleB/PctTotalVotingPowerOwnGrp) &gt;2) and            ($Print = $Separated))">
				<tr>
					<td class="styTableCellText" style="width:78mm;height:1mm;font-size:6.5pt;border-color:black;">
						<span style="width:4px"/>
						<xsl:if test="((count($Form1065ScheduleB/PctTotalVotingPowerOwnGrp) &gt;2)               and ($Print = $Separated))">
							<xsl:call-template name="PopulateAdditionalDataTableMessage">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/PctTotalVotingPowerOwnGrp"/>
							</xsl:call-template>
						</xsl:if>
					</td>
					<td class="styTableCellText" style="width:46mm;height:1mm;border-color:black;">
						<span style="width:4px"/>
					</td>
					<td class="styTableCellCtr" style="width:29mm;border-color:black;">
						<span style="width:4px"/>
					</td>
					<td class="styTableCellCtr" style="width:33mm;border-color:black;border-right-width:0;">
						<span style="width:4px"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="count($Form1065ScheduleB/PctTotalVotingPowerOwnGrp) &lt; 2            or ((count($Form1065ScheduleB/PctTotalVotingPowerOwnGrp) &gt;2) and            ($Print = $Separated))">
				<tr>
					<td class="styTableCellText" style="width:78mm;height:1mm;border-color:black;">
						<span style="width:4px"/>
					</td>
					<td class="styTableCellText" style="width:46mm;border-color:black;">
						<span style="width:4px"/>
					</td>
					<td class="styTableCellCtr" style="width:29mm;border-color:black;">
						<span style="width:4px"/>
					</td>
					<td class="styTableCellCtr" style="width:33mm;border-color:black;border-right-width:0;">
						<span style="width:4px"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="count($Form1065ScheduleB/PctTotalVotingPowerOwnGrp) &lt; 3            or ((count($Form1065ScheduleB/PctTotalVotingPowerOwnGrp) &gt;2) and            ($Print = $Separated))">
				<tr>
					<td class="styTableCellText" style="width:78mm;height:1mm;border-color:black;">
					<span style="width:4px"/>
					</td>
					<td class="styTableCellText" style="width:46mm;border-color:black;">
						<span style="width:4px"/>
					</td>
					<td class="styTableCellCtr" style="width:29mm;border-color:black;">
						<span style="width:4px"/>
					</td>
					<td class="styTableCellCtr" style="width:33mm;border-color:black;border-right-width:0;">
						<span style="width:4px"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="count($Form1065ScheduleB/PctTotalVotingPowerOwnGrp) &lt; 4           or ((count($Form1065ScheduleB/PctTotalVotingPowerOwnGrp) &gt;2) and            ($Print = $Separated))">
				<tr>
					<td class="styTableCellText" style="width:78mm;height:1mm;border-color:black;">
						<span style="width:4px"/>
					</td>
					<td class="styTableCellText" style="width:46mm;border-color:black;">
						<span style="width:4px"/>
					</td>
					<td class="styTableCellCtr" style="width:29mm;border-color:black;">
					<span style="width:4px"/>
					</td>
					<td class="styTableCellCtr" style="width:33mm;border-color:black;border-right-width:0;">
						<span style="width:4px"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="count($Form1065ScheduleB/PctTotalVotingPowerOwnGrp) &lt; 5            or ((count($Form1065ScheduleB/PctTotalVotingPowerOwnGrp) &gt;2) and            ($Print = $Separated))">
				<tr>
					<td class="styTableCellText" style="width:78mm;height:1mm;border-color:black;border-bottom-width:0;">
						<span style="width:4px"/>
					</td>
					<td class="styTableCellText" style="width:46mm;border-color:black;border-bottom-width:0;">
						<span style="width:4px"/>
					</td>
					<td class="styTableCellCtr" style="width:29mm;border-color:black;border-bottom-width:0;">
						<span style="width:4px"/>
					</td>
					<td class="styTableCellCtr" style="width:33mm;border-color:black;border-bottom-width:0;border-right-width:0;">
						<span style="width:4px"/>
					</td>
				</tr>
			</xsl:if>
		</tbody>
	</table>
</div>




<!-- Set Initial Height of Above Table -->
<xsl:call-template name="SetInitialDynamicTableHeight">
	<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/PctTotalVotingPowerOwnGrp"/>
	<xsl:with-param name="containerHeight" select="5"/>
	<xsl:with-param name="containerID" select=" 'REPtbl4a' "/>
</xsl:call-template>
<!-- End Set Initial Height of Above Table -->

<!-- SCHEDULE B Line 3b-->
<div style="width:187mm">
	<div class="styLNLeftNumBox" style="height:4mm; padding-left:3.5mm;">b</div>
	<div class="styLNDesc" style="width:167mm">
                     Own directly an interest of 20% or more, or own, directly or indirectly, an interest of 50% or more
                     in the profit, loss, or <br/>capital in any foreign or domestic partnership (including an entity treated
                     as a partnership) or in the beneficial interest of a 
	</div>
  	<div class="styIRS1065LNYesNoBox" style="height:6.5mm;background:gray;border-bottom-width:0;"/>
	<div class="styIRS1065LNYesNoBox" style="height:6.5mm;background:gray;border-bottom-width:0;"/>
</div>
<div style="width:187mm">
		<div class="styLNLeftNumBox" style="height:4mm; padding-left:3.5mm;"></div>
		<div class="styLNDesc" style="width:167mm">
                     trust? For rules of constructive ownership,
                     see instructions.  If "Yes," complete (i) through (v) below
                       <xsl:call-template name="SetFormLinkInline">
			<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/OwnForeignOrDomesticGrp"/>
		</xsl:call-template>
		<span style="width:1.8mm"/>
			<span style=" letter-spacing:3.1mm; font-weight:bold; ">........</span>
	</div>

	<div class="styIRS1065LNYesNoBox" style="height:4mm; border-left-width:1; border-bottom-width:0;         font-weight:normal;">
		<xsl:call-template name="PopulateYesBoxText">
			<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/OwnForeignOrDomesticPrtshpInd"/>
		</xsl:call-template>
	</div>
	<div class="styIRS1065LNYesNoBox" style="height:4mm; border-left-width:1; border-bottom-width:0;         font-weight:normal;">
		<xsl:call-template name="PopulateNoBoxText">
			<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/OwnForeignOrDomesticPrtshpInd"/>
		</xsl:call-template>
	</div>
</div>
<div class="styBB" style="width:187mm;">
	<div class="styGenericDiv" style="width:3.2mm;float:right;" align="right">
		<!-- button display logic -->
		<xsl:call-template name="SetDynamicTableToggleButton">
			<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/OwnForeignOrDomesticGrp"/>
			<xsl:with-param name="containerHeight" select="5"/>
			<xsl:with-param name="containerID" select=" 'REPtbl4b' "/>
		</xsl:call-template>
		<!-- end button display logic -->
	</div>
</div>
<div class="styTableContainer" id="REPtbl4b" style="width:187mm;clear:all;height:auto;">
	<!-- print logic -->
	<xsl:call-template name="SetInitialState"/>
	<!-- end -->
	<table class="styTable" cellspacing="0">
		<thead class="styTableThead">
			<tr>
				<th class="styTableCellHeader" style="width:76mm;vertical-align:top;font-size:6.5pt;border-color:black;" scope="col">
					<span class="styBoldText">(i)
                                       <span class="styNormalText"> Name of Entity</span>
					</span>
				</th>
				<th class="styTableCellHeader" style="width:26mm;vertical-align:top;font-size:6.5pt;border-color:black;font-weight:normal;" scope="col">
					<b>(ii)</b>
                   Employer <br/>Identification <br/>Number (if any)
             	</th>
				<th class="styTableCellHeader" style="width:26mm;vertical-align:top;font-size:6.5pt;border-color:black;font-weight:normal;" scope="col">
					<b>(iii)</b>
              Type of <br/>Entity
				</th>
				<th class="styTableCellHeader" style="width:29mm;vertical-align:top;font-size:6.5pt;border-color:black;font-weight:normal;" scope="col">
					<b>(iv)</b>
                  Country of <br/>Organization
				</th>
				<th class="styTableCellHeader" style="width:33mm;vertical-align:top;font-size:6.5pt;border-color:black;black;border-right-width:0;font-weight:normal;" scope="col">
					<b>(v)</b>
                   Maximum <br/>Percentage Owned in <br/>Profit,
                                         Loss, or Capital
				</th>
			</tr>
		</thead>
		<tfoot/>
		<tbody>
			<xsl:for-each select="$Form1065ScheduleB/OwnForeignOrDomesticGrp">
				<xsl:if test="($Print != $Separated) or           (count($Form1065ScheduleB/OwnForeignOrDomesticGrp) &lt;=2)">
					<tr style="font-size: 6.5pt;">
						<td class="styTableCellText" style="width:76mm;height:1mm;text-align:left;vertical-align:top;border-color:black;">
							<xsl:if test="EntityName">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="EntityName"/>
								</xsl:call-template>
							</xsl:if>
						</td>
						<td class="styTableCellText" style="width:26mm;text-align:center;vertical-align:top;border-color:black;">
							<xsl:choose>
								<xsl:when test="EIN">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="EIN"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
									</xsl:call-template>
								</xsl:otherwise>
						</xsl:choose>
						</td>
						<td class="styTableCellText" style="width:26mm;text-align:left;height:1mm;vertical-align:top;border-color:black;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="EntityTypeTxt"/>
							</xsl:call-template>
						</td>
				<td class="styTableCellText" style="width:29mm;text-align:center;vertical-align:top;border-color:black;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="OrganizationCountryCd"/>
							</xsl:call-template>
						</td>
						<td class="styTableCellText" style="width:29mm;text-align:center;vertical-align:top;border-color:black;black;border-right-width:0;">
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="MaximumOwnedPct"/>
							</xsl:call-template>
						</td>
					</tr>
				</xsl:if>
			</xsl:for-each>
			<!-- Table Filler Rows -->
			<xsl:if test="count($Form1065ScheduleB/OwnForeignOrDomesticGrp) &lt; 1            or ((count($Form1065ScheduleB/OwnForeignOrDomesticGrp) &gt;2) and           ($Print = $Separated))">
				<tr>
					<td class="styTableCellText" style="width:76mm;height:1mm;font-size:6.5pt;border-color:black;">
						<span style="width:4px"/>
						<xsl:if test="((count($Form1065ScheduleB/OwnForeignOrDomesticGrp) &gt;2)               and ($Print = $Separated))">
							<xsl:call-template name="PopulateAdditionalDataTableMessage">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/OwnForeignOrDomesticGrp"/>
							</xsl:call-template>
						</xsl:if>
					</td>
					<td class="styTableCellText" style="width:26mm;height:1mm;border-color:black;">
						<span style="width:4px"/>
					</td>
					<td class="styTableCellCtr" style="width:26mm;border-color:black;">
						<span style="width:4px"/>
					</td>
					<td class="styTableCellCtr" style="width:29mm;border-color:black;">
						<span style="width:4px"/>
					</td>
					<td class="styTableCellCtr" style="width:29mm;border-color:black;black;border-right-width:0;">
						<span style="width:4px"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="count($Form1065ScheduleB/OwnForeignOrDomesticGrp) &lt; 2           or ((count($Form1065ScheduleB/OwnForeignOrDomesticGrp) &gt;2) and            ($Print = $Separated))">
				<tr>
					<td class="styTableCellText" style="width:76mm;height:1mm;border-color:black;">
						<span style="width:4px"/>
					</td>
					<td class="styTableCellText" style="width:26mm;border-color:black;">
						<span style="width:4px"/>
					</td>
					<td class="styTableCellCtr" style="width:26mm;border-color:black;">
						<span style="width:4px"/>
					</td>
					<td class="styTableCellCtr" style="width:29mm;border-color:black;">
						<span style="width:4px"/>
					</td>
					<td class="styTableCellCtr" style="width:29mm;border-color:black;black;border-right-width:0;">
						<span style="width:4px"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="count($Form1065ScheduleB/OwnForeignOrDomesticGrp) &lt; 3            or ((count($Form1065ScheduleB/OwnForeignOrDomesticGrp) &gt;2) and           ($Print = $Separated))">
				<tr>
					<td class="styTableCellText" style="width:76mm;height:1mm;border-color:black;">
						<span style="width:4px"/>
					</td>
					<td class="styTableCellText" style="width:26mm;border-color:black;">
						<span style="width:4px"/>
					</td>
					<td class="styTableCellCtr" style="width:26mm;border-color:black;">
						<span style="width:4px"/>
					</td>
					<td class="styTableCellCtr" style="width:29mm;border-color:black;">
						<span style="width:4px"/>
					</td>
					<td class="styTableCellCtr" style="width:29mm;border-color:black;black;border-right-width:0;">
						<span style="width:4px"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="count($Form1065ScheduleB/OwnForeignOrDomesticGrp) &lt; 4           or ((count($Form1065ScheduleB/OwnForeignOrDomesticGrp) &gt;2) and           ($Print = $Separated))">
			<tr>
					<td class="styTableCellText" style="width:76mm;height:1mm;border-color:black;">
					<span style="width:4px"/>
					</td>
					<td class="styTableCellText" style="width:26mm;border-color:black;">
						<span style="width:4px"/>
					</td>
					<td class="styTableCellCtr" style="width:26mm;border-color:black;">
					<span style="width:4px"/>
					</td>
					<td class="styTableCellCtr" style="width:29mm;border-color:black;">
						<span style="width:4px"/>
					</td>
					<td class="styTableCellCtr" style="width:29mm;border-color:black;black;border-right-width:0;">
						<span style="width:4px"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="count($Form1065ScheduleB/OwnForeignOrDomesticGrp) &lt; 5           or ((count($Form1065ScheduleB/OwnForeignOrDomesticGrp) &gt;2) and            ($Print = $Separated))">
			<tr>
					<td class="styTableCellText" style="width:76mm;height:1mm;border-color:black;">
					<span style="width:4px"/>
					</td>
					<td class="styTableCellText" style="width:26mm;border-color:black;">
						<span style="width:4px"/>
					</td>
					<td class="styTableCellCtr" style="width:26mm;border-color:black;">
						<span style="width:4px"/>
					</td>
					<td class="styTableCellCtr" style="width:29mm;border-color:black;">
						<span style="width:4px"/>
					</td>
					<td class="styTableCellCtr" style="width:29mm;border-color:black;black;border-right-width:0;">
						<span style="width:4px"/>
					</td>
				</tr>
			</xsl:if>
		</tbody>
	</table>
</div>
<!-- Set Initial Height of Above Table -->
<xsl:call-template name="SetInitialDynamicTableHeight">
	<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/OwnForeignOrDomesticGrp"/>
	<xsl:with-param name="containerHeight" select="5"/>
	<xsl:with-param name="containerID" select=" 'REPtbl4b' "/>
</xsl:call-template>
<!-- End Set Initial Height of Above Table -->
					<!-- SCHEDULE B Line 4-->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm; padding-left:1.5mm;">4</div>
						<div class="styLNDesc" style="height:4mm; width:179mm;">Does the partnership satisfy 
							<span class="styBoldText">all four </span> of the following conditions?
							<span class="styIRS1065LNYesNoBox" style="float:right;height:4mm;border-left-width:1;">No</span>
							<span class="styIRS1065LNYesNoBox" style="float:right;height:4mm;border-left-width:1;border-right-width:1;">Yes</span>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftLtrBox" style="height:4mm;padding-left:3.5mm">a</div>
						<div class="styLNDesc" style="height:4mm;width:167mm">
						  The partnership's total receipts for the tax year were less than $250,000.</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;background:gray;border-bottom:0"/>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;background:gray;border-bottom:0"/>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftLtrBox" style="height:4mm;padding-left:3.5mm">b</div>
						<div class="styLNDesc" style="height:4mm;width:167mm">
						  The partnership's total assets at the end of the tax year were less than $1 million.</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;background:gray;border-bottom:0"/>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;background:gray;border-bottom:0"/>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftLtrBox" style="height:4mm;padding-left:3.5mm">c</div>
						<div class="styLNDesc" style="height:4mm;width:167mm">
						  Schedules K-1 are filed with the return and furnished to the partners on or before the due date
						  (including extensions) <br/>for the partnership return.
                        </div>
						<div class="styIRS1065LNYesNoBox" style="height:7mm;background:gray;border-bottom:0"/>
						<div class="styIRS1065LNYesNoBox" style="height:7mm;background:gray;border-bottom:0"/>
						<div style="width:187mm">
							<div class="styLNLeftLtrBox" style="height:4mm;padding-left:3.5mm">d</div>
							<div class="styLNDesc" style="height:4mm;width:167mm">
							  The partnership is not filing and is not required to file Schedule M-3
                                <span style="width:1.8mm"/>
								<span style=" letter-spacing:3.1mm; font-weight:bold; ">...................</span>
							</div>
							<div class="styIRS1065LNYesNoBox" style="height:4mm; border-left-width:1;border-bottom-width:1;font-weight:normal;">
								<xsl:call-template name="PopulateYesBoxText">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/PrtshpSatisfyAllConditionsInd"/>
								</xsl:call-template>
							</div>
							<div class="styIRS1065LNYesNoBox" style="height:4mm; border-left-width:1;border-bottom-width:1;font-weight:normal;">
								<xsl:call-template name="PopulateNoBoxText">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/PrtshpSatisfyAllConditionsInd"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styBB" style="width:187mm">
							<div class="styLNLeftLtrBox" style="height:4mm"/>
							<div class="styLNDesc" style="height:4mm;width:167mm">
                              If "Yes," the partnership is not required to complete Schedules L, M-1, and M-2; Item F on page 1 
                              of Form 1065;<br/>or Item L on Schedule K-1.</div>
							<div class="styIRS1065LNYesNoBox" style="height:7mm;background:gray;border-bottom:0"/>
							<div class="styIRS1065LNYesNoBox" style="height:7mm;background:gray;border-bottom:0"/>
						</div>
					</div>
					<!--SCHEDULE B Line 5-->
					<div class="styBB" style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm; padding-left:1.5mm;">5</div>
						<div class="styLNDesc" style="height:4mm;width:167mm">
						  Is this partnership a publicly traded partnership as defined in section 469(k)(2)?
						   <span style="width:1.8mm"/>
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">...............</span>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm; border-left-width:1; border-bottom-width:0;         font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/PubliclyTradedPartnershipInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm; border-left-width:1; border-bottom-width:0;         font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/PubliclyTradedPartnershipInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!--SCHEDULE B Line 6-->
					<div class="styBB" style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm; padding-left:1.5mm;">6</div>
						<div class="styLNDesc" style="height:4mm;width:167mm">
						  During the tax year, did the partnership have any debt that was cancelled, was forgiven, or had the 
						  terms<br/> modified so as to reduce the principal amount of the debt?
                            <span style="width:1.8mm"/>
								<span style=" letter-spacing:3.1mm; font-weight:bold; ">......................</span> 
						</div>

						<div class="styIRS1065LNYesNoBox" style="height:7mm; border-left-width:1; border-bottom-width:0;font-weight:normal;padding-top:3.5mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/DebtCancelledForgivenModifInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:7mm; border-left-width:1; border-bottom-width:0;font-weight:normal;padding-top:3.5mm;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/DebtCancelledForgivenModifInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!--SCHEDULE B Line 7-->
					<div class="styBB" style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm; padding-left:1.5mm;">7</div>
						<div class="styLNDesc" style="height:4mm;width:167mm">
						  Has this partnership filed, or is it required to file, Form 8918, Material Advisor Disclosure
						  Statement, to provide<br/> information on any reportable transaction?
                            <span style="width:1.8mm"/>
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">...........................</span> 
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:7mm; border-left-width:1; border-bottom-width:0;font-weight:normal;padding-top:3.5mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/FiledOrRequiredFileForm8918Ind"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:7mm; border-left-width:1; border-bottom-width:0;font-weight:normal;padding-top:3.5mm;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/FiledOrRequiredFileForm8918Ind"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCHEDULE B Line 8-->
					<div class="styBB" style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:1.0mm;">8</div>
						<div class="styLNDesc" style="height:9mm;width:167mm">
							At any time during calendar year 2020 
						   did the partnership have an interest in or a signature or other authority over a <br/>financial account
						   in a foreign country (such as a bank account, securities account, or other financial account)? See
						   the<br/>instructions for exceptions and filing requirements for FinCEN Form 114, Report of
						   Foreign Bank and Financial Accounts (FBAR).</div>
						<div class="styIRS1065LNYesNoBox" style="height:9mm;background:gray;border-bottom:0"/>
						<div class="styIRS1065LNYesNoBox" style="height:9mm;background:gray;border-bottom:0"/> 
						<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm; padding-left:3.5mm;"></div>
						<div class="styLNDesc" style="width:167mm;">                           
						      If "Yes," enter the name of the foreign country.
                           <span style="width:8px"/>
						   <img src="{$ImagePath}/1065_Bullet_Sm.gif" alt="MidSizeBullet"/>
						   <span style="width:1mm;"/>
						   <xsl:call-template name="SetFormLinkInline">
							  <xsl:with-param name="TargetNode" select="$Form1065ScheduleB/ForeignFinancialAccountInd"/>
						   </xsl:call-template>
						   <span style="width:1mm;"/>
						   <span style="width:80mm;">
							  <xsl:call-template name="PopulateText">
                                 <xsl:with-param name="TargetNode" select="$Form1065ScheduleB/ForeignFinancialAccountInd/@foreignCountryCd"/>
                                 </xsl:call-template>
                           </span> 
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:5mm;border-bottom-width:0;font-weight:normal;">
						   <xsl:call-template name="PopulateYesBoxText">
							  <xsl:with-param name="TargetNode" select="$Form1065ScheduleB/ForeignFinancialAccountInd"/>
							  </xsl:call-template>	
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:5mm;border-bottom-width:0;font-weight:normal;">
						   <xsl:call-template name="PopulateNoBoxText">
							  <xsl:with-param name="TargetNode" select="$Form1065ScheduleB/ForeignFinancialAccountInd"/>
						   </xsl:call-template>
						</div>
					</div>
					</div>
					<!-- SCHEDULE B Line 9-->
					<div class="styBB" style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:1.0mm">9</div>
						<div class="styLNDesc" style="height:4mm; width:167mm">
						  At any time during the tax year, did the partnership receive a distribution from, or was it the grantor
						  of, or transferor<br/>to, a foreign trust? If "Yes," the partnership may have to file Form 3520,
						  Annual Return To Report Transactions With
						</div>	
						<div class="styIRS1065LNYesNoBox" style="height:6mm;background:gray;border-bottom:0"/>
						<div class="styIRS1065LNYesNoBox" style="height:6mm;background:gray;border-bottom:0"/>
					<div style="width:187mm">
					<div class="styLNLeftNumBox" style="height:4mm; padding-left:3.5mm;"></div>
					<div class="styLNDesc" style="width:167mm;">                          
						  Foreign Trusts and Receipt of Certain Foreign
						  Gifts.  See instructions
                            <xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">
								  Form 1065, Schedule B, Line 9 - Form 3520 Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/ReceivedDistributionFrgnTrInd/@form3520Cd"/>
							</xsl:call-template>
							<span style="width:1.8mm"/>
								<span style=" letter-spacing:3.1mm; font-weight:bold; ">..................</span>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm; border-left-width:1; border-bottom-width:0;         font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/ReceivedDistributionFrgnTrInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm; border-left-width:1; border-bottom-width:0;         font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/ReceivedDistributionFrgnTrInd"/>
							</xsl:call-template>
						</div>
					</div>
					</div>
					<!-- SCHEDULE B Line 10a-->
					<div style="width:187mm">
						<div class="styLNLeftLtrBox" style="height:4mm;padding-left:1mm">10a</div>
						<div class="styLNDesc" style="height:4mm;width:167mm">
						  Is the partnership making, or had it previously made (and not revoked), a section 754 election?
						  <span style="width:1.8mm"/>
								<span style=" letter-spacing:3.1mm; font-weight:bold; ">...........</span>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm; border-left-width:1; border-bottom-width:0;font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/Section754ElectionInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm; border-left-width:1; border-bottom-width:0;font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/Section754ElectionInd"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm; padding-left:3.5mm;"></div>
						<div class="styLNDesc" style="height:4mm;width:167mm">                          
										See instructions for details regarding a section 754 election.
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/Section754ElectionInd"/>
								</xsl:call-template>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;background:gray;border-bottom-width:1"/>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;background:gray;border-bottom-width:1"/>
					</div>
					<!-- SCHEDULE B Line 10b-->
					<div style="width:187mm">
						<div class="styLNLeftLtrBox" style="height:4mm;padding-left:4mm">b</div>
						<div class="styLNDesc" style="height:4mm;width:167mm">
						  Did the partnership make for this tax year an optional basis adjustment under section 743(b) or
						  734(b)? If "Yes,"
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;border-bottom:0"/>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;border-bottom:0"/>
					</div>						  
					<div class="styBB" style="width:187mm">
					<div class="styLNLeftNumBox" style="height:4mm; padding-left:3.5mm;"></div>
					<div class="styLNDesc" style="width:167mm;">                          
						  attach a statement showing the computation and allocation of the basis
						  adjustment.  See instructions
                            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/OptionalBasisAdjustmentInd"/>
							</xsl:call-template>
							<span style="width:1.8mm"/>
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">........</span>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm; border-left-width:1;border-bottom:0;font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/OptionalBasisAdjustmentInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm; border-left-width:1;border-bottom:0;font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/OptionalBasisAdjustmentInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:right;">
							<span style="width:80px;"/> 
							      Form <span class="styBoldText" style="font-size:8pt;">1065</span> (2020)
                        </div>
					</div>
					<p style="page-break-before: always"/>
					<!-- END Page Break and Footer-->
					<!--Begin Page 3 -->
					<!-- Page Header -->
					<div class="styBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">Form 1065 (2020)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">3</span>
						</div>
					</div>
					<!-- END Page Header -->
					<div class="styBB" style="width:187mm;">
							<div class="styPartName" style="width:23mm;">Schedule B</div>
							<div class="styPartDesc" style="width:33mm;">Other Information</div>
							<div class="styPartDesc" style="width:131mm;font-style:italic;font-weight:normal;">(continued)</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:1.5mm;"></div>
						<div class="styLNDesc" style="height:4mm; width:167mm;"/>
						<div class="styIRS1065LNYesNoBox" style="height:4mm; border-left-width:1;border-right-width:1;">Yes</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;border-left-width:1;">No</div>
					</div>
						<!--<div class="styLNLeftNumBox" style="height:4mm; padding-left:1.5mm;">1</div>
						<div class="styLNDesc" style="height:4mm;width:167mm;">
						  What type of entity is filing this return? Check the applicable box:</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm; border-left-width:1;border-right-width:1;">Yes</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;border-left-width:1;">No</div>-->

					<!-- SCHEDULE B Line 10c-->
					<div class="styBB" style="width:187mm">
						<div class="styLNLeftLtrBox" style="height:4mm;padding-left:4mm">c</div>
						<div class="styLNDesc" style="height:4mm;width:167mm">
						  Is the partnership required to adjust the basis of partnership assets under section 743(b) or 734(b)
						  because of a <br/>substantial built-in loss (as defined under section 743(d)) or substantial basis
						  reduction (as defined under section 734(d))?
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:6mm;background:gray;border-bottom:0"/>
						<div class="styIRS1065LNYesNoBox" style="height:6mm;background:gray;border-bottom:0"/>						

						<div style="width:187mm">                          
						<div class="styLNLeftNumBox" style="height:4mm; padding-left:3.5mm;"></div>
						<div class="styLNDesc" style="width:167mm;">                          
						  If "Yes," attach a statement showing the
						  computation and allocation of the basis adjustment.  See instructions 
                            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/PrtshpRequiredToAdjustBasisInd"/>
							</xsl:call-template>
							<span style="width:1.8mm"/>
								<span style=" letter-spacing:3.1mm; font-weight:bold; ">......</span>
						</div>

						<div class="styIRS1065LNYesNoBox" style="height:4mm; border-left-width:1; border-bottom-width:0;         font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/PrtshpRequiredToAdjustBasisInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm; border-left-width:1; border-bottom-width:0;         font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/PrtshpRequiredToAdjustBasisInd"/>
							</xsl:call-template>
					</div>	
					</div>
					</div>
					<!-- SCHEDULE B Line 11-->
					<div class="styBB" style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">11</div>
						<div class="styLNDesc" style="height:4mm; width:167mm">
						  Check this box if, during the current or prior tax year, the partnership distributed any property 
						  received in a like-kind <br/>exchange or contributed such property to another entity (other than 
						  disregarded entities wholly owned by the partnership throughout the tax year)
                           <span style="width:1.8mm"/>
								<span style=" letter-spacing:3.1mm; font-weight:bold; ">................................</span>  
							<span style="width:4mm"/>
							<img src="{$ImagePath}/1065_Bullet_Sm.gif" alt="MidSizeBullet"/>
							<span style="width:4mm"/>
							<input class="styCkBox" alt="LikeKindExchangeInd" type="checkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/LikeKindExchangeInd"/>
									<xsl:with-param name="BackupName">IRS1065LikeKindExchange</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:11mm;background:gray;border-bottom:0"/>
						<div class="styIRS1065LNYesNoBox" style="height:11mm;background:gray;border-bottom:0"/>
					</div>
					<!-- SCHEDULE B Line 12-->
					<div class="styBB" style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">12</div>
						<div class="styLNDesc" style="height:4mm; width:167mm">
						  At any time during the tax year, did the partnership distribute to any partner a tenancy-in-common
						  or other <br/> undivided interest in partnership property?
                          <span style="width:1.8mm"/>
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">...........................</span>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:7mm; border-left-width:1; border-bottom-width:0;font-weight:normal;padding-top:3.5mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/TenancyInCommonInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:7mm; border-left-width:1; border-bottom-width:0;font-weight:normal;padding-top:3.5mm;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/TenancyInCommonInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCHEDULE B Line 13-->
					<div class="styBB" style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">13</div>
						<div class="styLNDesc" style="height:4mm; width:167mm">
						  If the partnership is required to file Form 8858, Information Return of U.S. Persons With Respect To
						  Foreign<br/>Disregarded Entities, enter the number of Forms 8858 attached.  See instructions
                            <span style="width:4mm"/>
							<img src="{$ImagePath}/1065_Bullet_Sm.gif" alt="MidSizeBullet"/>
							<span style="width:1mm"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/Form8858AttachedCnt"/>
							</xsl:call-template>
							<span style="width:45mm;text-align:right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/Form8858AttachedCnt"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:8mm;background:gray;border-bottom-width:0"/>
						<div class="styIRS1065LNYesNoBox" style="height:8mm;background:gray;border-bottom-width:0"/>
					</div>
					<!-- SCHEDULE B Line 14-->
					<div class="styBB" style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">14</div>
						<div class="styLNDesc" style="height:4mm; width:167mm">
						  Does the partnership have any foreign partners? If "Yes," enter the number of Forms 8805, Foreign
						  Partner's</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;background:gray;border-bottom:0"/>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;background:gray;border-bottom:0"/>						  
						<div style="width:187mm">                          
						<div class="styLNLeftNumBox" style="height:4mm; padding-left:3.5mm;"></div>						  
						<div class="styLNDesc" style="width:167mm;"> 
							  Information Statement of Section 1446 Withholding Tax, filed for this partnership.
                            <span style="width:4mm"/>
							<img src="{$ImagePath}/1065_Bullet_Sm.gif" alt="MidSizeBullet"/>
							<span style="width:1mm;"/>
							<span style="width:48mm;text-align:right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/Form8805Cnt"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm; border-left-width:1; border-bottom-width:0;         font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/PrtshpHasForeignPartnersInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm; border-left-width:1; border-bottom-width:0;         font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/PrtshpHasForeignPartnersInd"/>
							</xsl:call-template>
						</div>
						</div>
					</div>
					<!-- SCHEDULE B Line 15-->
					<div class="styBB" style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm">15</div>
						<div class="styLNDesc" style="height:4mm;width:167mm">
						  Enter the number of Forms 8865, Return of U.S. Persons With Respect to Certain Foreign
						  Partnerships, attached to this<br/>return
                            <span style="height:4mm;width:1mm;"/>
							<img src="{$ImagePath}/1065_Bullet_Sm.gif" alt="MidSizeBullet"/>
							<span style="width:1mm;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/Form8865Cnt"/>
							</xsl:call-template>
							<span style="height:3mm;width:30mm;text-align:right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/Form8865Cnt"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:8.2mm;right-border-width:0;background:gray;         border-bottom-width:0;"/>
						<div class="styIRS1065LNYesNoBox" style="height:8.2mm;background:gray;         border-bottom-width:0;"/>
					</div>
					<!-- SCHEDULE B Line 16a-->
					<div style="width:187mm">
						<div class="styLNLeftLtrBox" style="height:4mm;padding-left:1mm">16a</div>
						<div class="styLNDesc" style="height:4mm;width:167mm">
						  Did you make any payments in 2020 that would require you to file Form(s) 1099? See instructions
							<span style="width:1.8mm"/>
						    <span style=" letter-spacing:3.2mm; font-weight:bold; ">........</span>
                            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/RequiredToFileForms1099Ind"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:5mm; border-left-width:1; border-bottom-width:1;         font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/RequiredToFileForms1099Ind"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:5mm; border-left-width:1; border-bottom-width:1;         font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/RequiredToFileForms1099Ind"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCHEDULE B Line 16b-->
					<div class="styBB" style="width:187mm">
						<div class="styLNLeftLtrBox" style="height:4mm;padding-left:4mm">b</div>
						<div class="styLNDesc" style="height:4mm;width:167mm">
						  If "Yes," did you or will you file required Form(s) 1099?
						    <span style="width:1.8mm"/>
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">......................</span>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm; border-left-width:1; border-bottom-width:0;         font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/RequiredForms1099FiledInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm; border-left-width:1; border-bottom-width:0;         font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/RequiredForms1099FiledInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCHEDULE B Line 17-->
					<div class="styBB" style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm">17</div>
						<div class="styLNDesc" style="height:4mm;width:167mm">
						  Enter the number of Forms 5471, Information Return of U.S. Persons With Respect To Certain
							<br/>Foreign Corporations, attached to this return.
                            <span style="height:4mm;width:1mm;"/>
							<img src="{$ImagePath}/1065_Bullet_Sm.gif" alt="MidSizeBullet"/>
							<span style="width:1mm;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/Form5471Cnt"/>
							</xsl:call-template>
							<span style="height:3mm;width:30mm;text-align:right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/Form5471Cnt"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:8.2mm;right-border-width:0;background:gray;border-bottom-width:0;"/>
						<div class="styIRS1065LNYesNoBox" style="height:8.2mm;background:gray;border-bottom-width:0;"/>
					</div>
					<!-- SCHEDULE B Line 18-->
					<div class="styBB" style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm">18</div>
						<div class="styLNDesc" style="height:4mm;width:167mm">
						  Enter the number of partners that are foreign governments under section 892.
						    <span style="height:4mm;width:1mm;"/>
							<img src="{$ImagePath}/1065_Bullet_Sm.gif" alt="MidSizeBullet"/>
							<span style="width:1mm;"/>
							<span style="height:3mm;width:30mm;text-align:right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/PartnersUnderSection892Cnt"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:5.2mm;right-border-width:0;background:gray;border-bottom-width:0;"/>
						<div class="styIRS1065LNYesNoBox" style="height:5.2mm;background:gray;border-bottom-width:0;"/>
					</div>
					<!-- SCHEDULE B Line 19-->
					<div class="styBB" style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">19</div>
						<div class="styLNDesc" style="height:4mm; width:167mm">
						  During the partnership’s tax year, did the partnership make any payments that would require it to file
						  Forms 1042 and 1042-S under chapter 3 (sections 1441 through 1464) or chapter 4 (sections 1471 through 1474)?
                          <span style="width:1.8mm"/>
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">..............</span>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:7mm; border-left-width:1; border-bottom-width:0;font-weight:normal;padding-top:3.5mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/RequiredToFileForms1042Ind"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:7mm; border-left-width:1; border-bottom-width:0;font-weight:normal;padding-top:3.5mm;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/RequiredToFileForms1042Ind"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCHEDULE B Line 20-->
					<div class="styBB" style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:1mm;">20</div>
						<div class="styLNDesc" style="height:4mm; width:167mm;padding-top:1mm;">
						  Was the partnership a specified domestic entity required to file Form 8938 for the tax year (see the Instructions for Form 8938)?
                            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/RequiredToFileForm8938Ind"/>
							</xsl:call-template>
                          <span style="width:1.8mm"/>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:4.5mm; border-left-width:1; border-bottom-width:0;font-weight:normal;padding-top:1mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/RequiredToFileForm8938Ind"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:4.5mm; border-left-width:1; border-bottom-width:0;font-weight:normal;padding-top:1mm;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/RequiredToFileForm8938Ind"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCHEDULE B Line 21-->
					<div class="styBB" style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;padding-top:1mm;">21</div>
						<div class="styLNDesc" style="height:4mm; width:167mm;padding-top:1mm;">
						  Is the partnership a section 721(c) partnership, as defined in Regulations section 1.721(c)-1T(b)(14)?
                           <span style="width:1.8mm"/>
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">......</span>
                          <span style="width:1.8mm"/>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:4.5mm; border-left-width:1; border-bottom-width:0;font-weight:normal;padding-top:1mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/Section721cPartnershipInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:4.5mm; border-left-width:1; border-bottom-width:0;font-weight:normal;padding-top:1mm;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/Section721cPartnershipInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCHEDULE B Line 22-->
					<div class="styBB" style="width:187mm;height:13.5mm;">
						<div class="styLNLeftNumBox">22</div>
						<div class="styLNDesc" style="width:167mm">
						  During the tax year, did the partnership pay or accrue any interest or royalty for which one or more partners are not allowed a</div>
							<div class="styIRS1065LNYesNoBox" style="background:gray;border-bottom:0"/>
							<div class="styIRS1065LNYesNoBox" style="background:gray;border-bottom:0"/>
						<div style="width:187mm;height:4.5mm;">
						<div class="styLNLeftNumBox" style="padding-left:3.5mm;"></div>						  
						<div class="styLNDesc" style="width:167mm;">deduction under section 267A?  See instructions
                           <span style="width:1.8mm"/>
								<span style=" letter-spacing:3.2mm; font-weight:bold; ">.........................</span>
                          <span style="width:1.8mm"/>
						</div>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/NondedIntRoyaltyUndSect267AInd"/>
								</xsl:call-template>
							<div class="styIRS1065LNYesNoBox" style="border-left-width:1;border-bottom-width:1;font-weight:normal;">
								<xsl:call-template name="PopulateYesBoxText">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/NondedIntRoyaltyUndSect267AInd"/>
								</xsl:call-template>
							</div>
							<div class="styIRS1065LNYesNoBox" style="border-left-width:1;border-bottom-width:1;font-weight:normal;">
								<xsl:call-template name="PopulateNoBoxText">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/NondedIntRoyaltyUndSect267AInd"/>
								</xsl:call-template>
							</div>
							</span>
						</div>
						<div style="width:187mm;">                          
						<div class="styLNLeftNumBox" style="padding-left:3.5mm;"></div>						  
						<div class="styLNDesc" style="width:167mm;">If "Yes," enter the total amount of the disallowed deductions.
                            <span style="width:1mm;"/>
							<img src="{$ImagePath}/1065_Bullet_Sm.gif" alt="MidSizeBullet"/>
							<span style="width:1mm;"/>$
							<span style="width:30mm;text-align:right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/NondedIntRoyaltyUndSect267AAmt"/>
								</xsl:call-template>
							</span>
						</div>
							<div class="styIRS1065LNYesNoBox" style="background:gray;border-bottom-width:1"/>
							<div class="styIRS1065LNYesNoBox" style="background:gray;border-bottom-width:1"/>
						</div>
					</div>
					<!-- SCHEDULE B Line 23-->
					<div class="styBB" style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">23</div>
						<div class="styLNDesc" style="height:4mm; width:167mm">
						  Did the partnership have an election under section 163(j) for any real property trade or business or any farming business in effect</div>
							<div class="styIRS1065LNYesNoBox" style="height:4mm;background:gray;border-bottom:0"/>
							<div class="styIRS1065LNYesNoBox" style="height:4mm;background:gray;border-bottom:0"/>
						<div style="width:187mm">                          
						<div class="styLNLeftNumBox" style="height:4mm; padding-left:3.5mm;"></div>						  
						<div class="styLNDesc" style="width:167mm;">
						   during the tax year?  See instructions
                           <span style="width:1.8mm"/>
								<span style=" letter-spacing:3.1mm; font-weight:bold; ">.............................</span>  
						</div>
							<div class="styIRS1065LNYesNoBox" style="height:4mm;border-left-width:1;border-bottom-width:0;font-weight:normal;">
								<xsl:call-template name="PopulateYesBoxText">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/Section163jElectionInd"/>
								</xsl:call-template>
							</div>
							<div class="styIRS1065LNYesNoBox" style="height:4mm;border-left-width:1;border-bottom-width:0;font-weight:normal;">
								<xsl:call-template name="PopulateNoBoxText">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/Section163jElectionInd"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- SCHEDULE B Line 24-->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4.5mm;">24</div>
						<div class="styLNDesc" style="height:4.5mm; width:167mm;">Does the partnership satisfy one or more of the following (see instructions):
                            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/SatisfyOneOrMoreConditionsInd"/>
							</xsl:call-template>
							<span style="width:1.8mm"/>
							<span style=" letter-spacing:3.2mm; font-weight:bold; ">................</span>
						</div>
							<div class="styIRS1065LNYesNoBox" style="height:4.5mm;border-left-width:1;border-bottom-width:1;font-weight:normal;">
								<xsl:call-template name="PopulateYesBoxText">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/SatisfyOneOrMoreConditionsInd"/>
								</xsl:call-template>
							</div>
							<div class="styIRS1065LNYesNoBox" style="height:4.5mm;border-left-width:1;border-bottom-width:1;font-weight:normal;">
								<xsl:call-template name="PopulateNoBoxText">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/SatisfyOneOrMoreConditionsInd"/>
								</xsl:call-template>
							</div>
					</div>
					<div style="width:187mm;padding-left:4.5mm;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;padding-left:3.5mm">a</div>
						<div class="styLNDesc" style="height:4.5mm;width:162.5mm">
						 The partnership owns a pass-through entity with current, or prior year carryover, excess business interest expense.
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:4.5mm;background:gray;border-bottom:0"/>
						<div class="styIRS1065LNYesNoBox" style="height:4.5mm;background:gray;border-bottom:0"/>
					</div>
					<div style="width:187mm;padding-left:4.5mm;">
						<div class="styLNLeftLtrBox" style="height:7mm;padding-left:3.5mm">b</div>
						<div class="styLNDesc" style="height:7mm;width:162.5mm">
						  The partnership's aggregate average annual gross receipts (determined under section 448(c)) for the 3 tax years
							preceding the current tax year are more than $26 million and the partnership has business interest expense.
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:7mm;background:gray;border-bottom:0"/>
						<div class="styIRS1065LNYesNoBox" style="height:7mm;background:gray;border-bottom:0"/>
					</div>
					<div style="width:187mm;padding-left:4.5mm;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;padding-left:3.5mm">c</div>
						<div class="styLNDesc" style="height:4.5mm;width:162.5mm">
						 The partnership is a tax shelter (see instructions) and the partnership has business interest expense.
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:4.5mm;background:gray;border-bottom:0"/>
						<div class="styIRS1065LNYesNoBox" style="height:4.5mm;background:gray;border-bottom:0"/>
					</div>
					<div class="styBB" style="width:187mm">
						<div class="styLNLeftLtrBox" style="height:4mm;padding-left:3.5mm"/>
						<div class="styLNDesc" style="height:4mm;width:167mm;padding-left:4.5mm;">
						  If "Yes," to any, complete and attach Form 8990.</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;background:gray;border-bottom:0"/>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;background:gray;border-bottom:0"/>
					</div>
					<!-- SCHEDULE B Line 25-->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm; padding-left:1.5mm;padding-top:1mm;">25</div>
						<div class="styLNDesc" style="height:4mm; width:167mm;">Is the partnership electing out of the centralized partnership audit regime
						   under section 6221(b)?  See instructions
                            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/ElectOutUnderSection6221bInd"/>
							</xsl:call-template>
							<span style="width:1.8mm"/>
							<span style=" letter-spacing:3.2mm; font-weight:bold; ">....</span>
						</div>
							<div class="styIRS1065LNYesNoBox" style="height:4mm;border-left-width:1;border-bottom-width:1;font-weight:normal;">
								<xsl:call-template name="PopulateYesBoxText">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/ElectOutUnderSection6221bInd"/>
								</xsl:call-template>
							</div>
							<div class="styIRS1065LNYesNoBox" style="height:4mm;border-left-width:1;border-bottom-width:1;font-weight:normal;">
								<xsl:call-template name="PopulateNoBoxText">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/ElectOutUnderSection6221bInd"/>
								</xsl:call-template>
							</div>
					</div>
					<div style="width:187mm">
						<div class="styLNLeftLtrBox" style="height:8mm;padding-left:3.5mm"></div>
						<div class="styLNDesc" style="height:8mm;width:167mm">
						  If “Yes,” the partnership must complete Schedule B-2 (Form 1065). Enter the total from Schedule B-2, Part III, line 3<br/>
							<span style="width:1mm;"/>
								<img src="{$ImagePath}/1065_Bullet_Sm.gif" alt="MidSizeBullet"/>
							<span style="width:1mm;"/>
							<span style="width:30mm;text-align:right;border-bottom:solid 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/TotalK1IssuedCnt"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:8mm;background:gray;border-bottom:0"/>
						<div class="styIRS1065LNYesNoBox" style="height:8mm;background:gray;border-bottom:0"/>
					</div>
					<div class="styBB" style="width:187mm">
						<div class="styLNLeftLtrBox" style="height:4mm;padding-left:3.5mm"></div>
						<div class="styLNDesc" style="height:4mm;width:167mm">
						  If “No,” complete Designation of Partnership Representative, below.</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;background:gray;border-bottom:0"/>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;background:gray;border-bottom:0"/>
					</div>
					<!-- Designation Of Partnership Representative -->
					<div style="height:4mm;width:187mm;font-size:8pt;">
						<span class="styBoldText">Designation of Partnership Representative</span>
						  (see instructions)
					</div>
					<div style="width:187mm;height:4mm;">
					  Enter below the information for the partnership representative (PR) for the tax year of this return.
					</div>
					<br/>
					<div style="width:187mm;"></div>
					<div class="styBB" style="width:187mm;">
						<div class="styGenericDiv" style="width:14mm;">
                          Name of <br/>PR</div>
						<div class="styGenericDiv" style="width:5mm;padding-top:2mm;">
							<img src="{$ImagePath}/1065_Bullet_Lg.gif" alt="LargeBullet"/>
						</div>
						<div class="styGenericDiv" style="width:104mm;padding-top:2mm;">
							<xsl:choose>
								<xsl:when test="$Form1065ScheduleB/EntityPRDesignationGrp/BusinessName/BusinessNameLine1Txt">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/EntityPRDesignationGrp/BusinessName/BusinessNameLine1Txt"/>
									</xsl:call-template><br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/EntityPRDesignationGrp/BusinessName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/IndividualPRDesignationGrp/PersonNm"/>
									</xsl:call-template>								
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<div style="width:187mm;"></div>
					<div class="styBB" style="width:187mm;">
						<div class="styGenericDiv" style="width:27mm;padding-top:3mm;">
                          U.S. Address of PR</div>
						<div class="styGenericDiv" style="width:5mm;padding-top:2mm;">
							<img src="{$ImagePath}/1065_Bullet_Lg.gif" alt="LargeBullet"/>
						</div>
						<div class="styGenericDiv" style="width:91mm;padding-top:2mm;">
							<xsl:choose>
								<xsl:when test="$Form1065ScheduleB/EntityPRDesignationGrp/BusinessName/BusinessNameLine1Txt">
									<xsl:call-template name="PopulateUSAddressTemplate">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/EntityPRDesignationGrp/USAddress"/>
									</xsl:call-template>
								</xsl:when>									
								<xsl:otherwise>									
									<xsl:call-template name="PopulateUSAddressTemplate">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/IndividualPRDesignationGrp/USAddress"/>
									</xsl:call-template>									
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="styGenericDiv" style="width:23mm;padding-top:3mm;">
                          U.S. phone<br/>number of PR</div>
						<div class="styGenericDiv" style="width:5mm;padding-top:2mm;">
							<img src="{$ImagePath}/1065_Bullet_Lg.gif" alt="LargeBullet"/>
						</div>
						<div class="styGenericDiv" style="width:35mm;padding-top:5mm;">
							<xsl:choose>
								<xsl:when test="$Form1065ScheduleB/EntityPRDesignationGrp/BusinessName/BusinessNameLine1Txt">
									<xsl:call-template name="PopulatePhoneNumber">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/EntityPRDesignationGrp/PhoneNum"/>
									</xsl:call-template>
								</xsl:when>									
								<xsl:otherwise>									
									<xsl:call-template name="PopulatePhoneNumber">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/IndividualPRDesignationGrp/PhoneNum"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<div style="width:187mm;"></div>
					<div class="styBB" style="width:187mm;">
						<div class="styGenericDiv" style="width:21mm;">
                          If the PR is an<br/>entity, name of<br/>the designated<br/>individual for<br/>the PR</div>
						<div class="styGenericDiv" style="width:5mm;padding-top:9mm;">
							<img src="{$ImagePath}/1065_Bullet_Lg.gif" alt="LargeBullet"/>
						</div>
						<div class="styGenericDiv" style="width:97mm;padding-top:11mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/EntityPRDesignationGrp/IndividualDesigneeApptGrp/PersonNm"/>
									</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;"></div>
					<div class="styBB" style="width:187mm;">
						<div class="styGenericDiv" style="width:22mm;padding-top:3mm;">
                          U.S. address of<br/>designated<br/>individual</div>
						<div class="styGenericDiv" style="width:5mm;padding-top:5mm;">
							<img src="{$ImagePath}/1065_Bullet_Lg.gif" alt="LargeBullet"/>
						</div>
						<div class="styGenericDiv" style="width:96mm;padding-top:3mm;">
							<xsl:call-template name="PopulateUSAddressTemplate">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/EntityPRDesignationGrp/IndividualDesigneeApptGrp/USAddress"/>
							</xsl:call-template>
						</div>
						<div class="styGenericDiv" style="width:16mm;">
                          U.S. phone<br/>number of<br/>designated<br/>individual</div>
						<div class="styGenericDiv" style="width:5mm;padding-top:5mm;">
							<img src="{$ImagePath}/1065_Bullet_Lg.gif" alt="LargeBullet"/>
						</div>
						<div class="styGenericDiv" style="width:42mm;padding-top:8mm;">
							<xsl:call-template name="PopulatePhoneNumber">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/EntityPRDesignationGrp/IndividualDesigneeApptGrp/PhoneNum"/>
							</xsl:call-template>
						</div>
					</div>
					<p style="page-break-before: always" />
					<!-- SCHEDULE B Line 26-->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">26</div>
						<div class="styLNDesc" style="height:4mm; width:167mm">
						  Is the partnership attaching Form 8996 to certify as a Qualified Opportunity Fund?
                            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/QlfyOpportunityFundPenaltyAmt"/>
							</xsl:call-template>
						  	<span style="width:1.8mm"/>
							<span style=" letter-spacing:3.2mm; font-weight:bold; ">..............</span> 
						</div>
							<div class="styIRS1065LNYesNoBox" style="height:4mm;border-left-width:1;border-bottom-width:1;font-weight:normal;">
								<xsl:call-template name="PopulateYesBoxText">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/Form8996AttachedInd"/>
								</xsl:call-template>
							</div>
							<div class="styIRS1065LNYesNoBox" style="height:4mm;border-left-width:1;border-bottom-width:1;font-weight:normal;">
								<xsl:call-template name="PopulateNoBoxText">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/Form8996AttachedInd"/>
								</xsl:call-template>
							</div>
					</div>
					<div class="styBB" style="width:187mm">
						<div class="styLNLeftLtrBox" style="height:4mm;padding-left:3.5mm"/>
						<div class="styLNDesc" style="height:4mm;width:167mm">
						  If "Yes," enter the amount from Form 8996, line 16
						  	<span style="width:1.8mm"/>
							<span style=" letter-spacing:3.2mm; font-weight:bold; ">..............</span>
							<span style="width:1mm;"/>
							<img src="{$ImagePath}/1065_Bullet_Sm.gif" alt="MidSizeBullet"/>
							<span style="width:1mm;"/>$
							<span style="width:30mm;text-align:right;border-bottom-solid 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/QlfyOpportunityFundPenaltyAmt"/>
								</xsl:call-template>
							</span>
					</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;background:gray;border-bottom:0"/>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;background:gray;border-bottom:0"/>
					</div>
					<!-- SCHEDULE B Line 27-->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">27</div>
						<div class="styLNDesc" style="height:4mm; width:167mm">
						  Enter the number of foreign partners subject to section 864(c)(8) as a result of transferring all or a portion of an
							interest in the
						</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;background:gray;border-bottom:0"/>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;background:gray;border-bottom:0"/>
					</div>
					<div class="styBB" style="width:187mm">
						<div class="styLNLeftLtrBox" style="height:4mm;padding-left:3.5mm"/>
						<div class="styLNDesc" style="height:4mm;width:167mm">
						   partnership or of receiving a distribution from the partnership
						  	<span style="width:1.8mm"/>
							<span style=" letter-spacing:3.2mm; font-weight:bold; ">............</span>
							<span style="width:1mm;"/>
							<img src="{$ImagePath}/1065_Bullet_Sm.gif" alt="MidSizeBullet"/>
							<span style="width:1mm;"/>
							<span style="width:30mm;text-align:right;border-bottom-solid 1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/FrgnPrtnrTrnsfrIntDistriCnt"/>
								</xsl:call-template>
							</span>
					</div>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;background:gray;border-bottom:0"/>
						<div class="styIRS1065LNYesNoBox" style="height:4mm;background:gray;border-bottom:0"/>
					</div>
					<!-- SCHEDULE B Line 28-->
					<div class="styBB" style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">28</div>
						<div class="styLNDesc" style="height:4mm; width:167mm">
						  At any time during the tax year, were there any transfers between the partnership and its partners subject to the disclosure</div>
							<div class="styIRS1065LNYesNoBox" style="height:4mm;background:gray;border-bottom:0"/>
							<div class="styIRS1065LNYesNoBox" style="height:4mm;background:gray;border-bottom:0"/>
						<div style="width:187mm">                          
						<div class="styLNLeftNumBox" style="height:4mm; padding-left:3.5mm;"></div>						  
						<div class="styLNDesc" style="width:167mm;">
						   requirements of Regulations section 1.707-8?
                            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/TransfersSubjectToDisclRqrInd"/>
							</xsl:call-template>
                           <span style="width:1.8mm"/>
								<span style=" letter-spacing:3.1mm; font-weight:bold; ">..........................</span>  
						</div>
							<div class="styIRS1065LNYesNoBox" style="height:4mm;border-left-width:1;border-bottom-width:0;font-weight:normal;">
								<xsl:call-template name="PopulateYesBoxText">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/TransfersSubjectToDisclRqrInd"/>
								</xsl:call-template>
							</div>
							<div class="styIRS1065LNYesNoBox" style="height:4mm;border-left-width:1;border-bottom-width:0;font-weight:normal;">
								<xsl:call-template name="PopulateNoBoxText">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/TransfersSubjectToDisclRqrInd"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- SCHEDULE B Line 29-->
					<div class="styBB" style="width:187mm">
						<div style="height:12.5mm; width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">29</div>
						<div class="styLNDesc" style="width:167mm">
						  Since December 22, 2017, did a foreign corporation directly or indirectly acquire substantially all of the properties
							constituting a trade or business of your partnership, and was the ownership percentage (by vote or value) for
							purposes of section 7874 greater than 50% (for example, the partners held more than 50% of the stock of
							the foreign corporation)? If "Yes," list the ownership percentage by vote and by value. See instructions.
                           <span style="width:1.8mm"/>
								<span style=" letter-spacing:3.1mm; font-weight:bold; ">.........................</span>  
						  </div>
							<div class="styIRS1065LNYesNoBox" style="height:12.5mm;background:gray;border-bottom:0"/>
							<div class="styIRS1065LNYesNoBox" style="height:12.5mm;background:gray;border-bottom:0"/>
						</div>
						<div style="width:187mm">                          
						<div class="styLNLeftNumBox" style="height:4mm; padding-left:3.5mm;"></div>						  
						<div class="styLNDesc" style="width:167mm;">
						   Percentage:
							<span style="width:75mm;"/>						   
							<span style="width:30mm;text-align:right;border-bottom-solid 1px;">
							  By Vote:
								<xsl:call-template name="PopulatePercent">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/OwnershipByVotePct"/>
								</xsl:call-template>
							</span>
							<span style="width:10mm;"/>
							<span style="width:30mm;text-align:right;border-bottom-solid 1px;">
							  By Value:
								<xsl:call-template name="PopulatePercent">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/OwnershipByValuePct"/>
								</xsl:call-template>
							</span>
						</div>
							<div class="styIRS1065LNYesNoBox" style="height:4mm;border-left-width:1;border-bottom-width:0;font-weight:normal;">
								<xsl:call-template name="PopulateYesBoxText">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/OwnershipPctVoteVlGrtr50PctInd"/>
								</xsl:call-template>
							</div>
							<div class="styIRS1065LNYesNoBox" style="height:4mm;border-left-width:1;border-bottom-width:0;font-weight:normal;">
								<xsl:call-template name="PopulateNoBoxText">
									<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/OwnershipPctVoteVlGrtr50PctInd"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Designation Of Tax Matters Partners -->
					<!--<div style="height:4mm;width:187mm;font-size:8pt;">
						<span class="styBoldText">Designation of Tax Matters Partner</span>
						  (see instructions)
					</div>
					<div style="width:187mm;height:4mm;">
					  Enter below the general partner or member-manager designated as the tax matters partner (TMP) for
					  the tax year of this return:
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styGenericDiv" style="width:23mm;">
                          Name of <br/>designated TMP</div>
						<div class="styGenericDiv" style="width:5mm;">
							<img src="{$ImagePath}/1065_Bullet_Lg.gif" alt="LargeBullet"/>
						</div>
						<div class="styGenericDiv" style="width:95mm;padding-top:1mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/TMPMemberManagerOrPersonNm"/>
							</xsl:call-template>
						</div>
						<div class="styGenericDiv" style="width:23mm;">
                          Identifying <br/>number of TMP</div>
						<div class="styGenericDiv" style="width:5mm;">
							<img src="{$ImagePath}/1065_Bullet_Lg.gif" alt="LargeBullet"/>
						</div>
						<div class="styGenericDiv" style="width:35mm;padding-top:1mm;">
							<xsl:choose>
								<xsl:when test="not($Form1065ScheduleB/TMPEIN) or          $Form1065ScheduleB/TMPEIN=''">
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/TMPSSN"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/TMPEIN"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
                    <div class="styBB" style="width:187mm;padding-top:1mm">
  					    <div class="styGenericDiv" style="width:32mm;">
                          If the TMP is an <br/>entity, name <br/>of TMP representative<span style="width:1mm"/>
                        </div>
                        <div class="styGenericDiv" style="width:5mm;padding-top:2mm">
							<img src="{$ImagePath}/1065_Bullet_Lg.gif" alt="LargeBullet"/>
						</div>
                        <div class="styGenericDiv" style="width:86mm;padding-top:3mm">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/TMPRepresentativePersonNm"/>
							</xsl:call-template>
						</div>
					    <div class="styGenericDiv" style="width:23mm;padding-top:2mm">
                          Phone number <br/>of TMP <span style="width:1mm"/>
                        </div>
                        <div class="styGenericDiv" style="width:5mm;padding-top:2mm">
							<img src="{$ImagePath}/1065_Bullet_Lg.gif" alt="LargeBullet"/>
						</div> 
                        <div class="styGenericDiv" style="width:25mm;padding-top:3mm">
                            <xsl:call-template name="PopulatePhoneNumber">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/PhoneNum"/>
							</xsl:call-template>
                        </div>
                    </div>                      
					<div class="styBB" style="width:187mm;">
						<div class="styGenericDiv" style="width:23mm;height:auto;padding-top:2mm;">
						  Address of <br/>designated TMP</div>
						<div class="styGenericDiv" style="width:5mm;height:6mm;padding-top:2mm;">
							<img src="{$ImagePath}/1065_Bullet_Lg.gif" alt="LargeBullet"/>
						</div>
						<div class="styGenericDiv" style="width:158mm;">
							<xsl:choose>
								<xsl:when test="$Form1065ScheduleB/TMPUSAddress">
									<xsl:call-template name="PopulateUSAddressTemplate">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/TMPUSAddress"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateForeignAddressTemplate">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleB/TMPForeignAddress"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>-->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:right;">
							<span style="width:80px;"/>  
							  Form <span class="styBoldText" style="font-size:8pt;">1065</span> (2020)
						</div>
					</div>
					<p style="page-break-before: always"/>
					<!-- END Page Break and Footer-->
					<!--Begin Page 4-->
					<!-- Page Header-->
					<div class="styBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">Form 1065 (2020)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">4</span>
						</div>
					</div>
					<!--END Page Header -->
					<!-- BEGIN Schedule K Title -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="width:21mm;height:4mm;">Schedule K</div>
						<div class="styPartDesc" style="width:121.5mm;height:4mm;">Partners' Distributive Share Items
                            <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleK"/>
							</xsl:call-template>
						</div>
						<span class="styBoldText" style="width:40mm;height:4mm;border-left:1 solid black;padding-left:15mm;padding-top:.5mm;">Total amount</span>
					</div>
					<!-- END Schedule K Title -->
					<!-- BEGIN Schedule K Line Items -->
					<!-- BEGIN Schedule K Income (Loss) Line Items -->
					<div class="styBB" style="width:187mm;">
								<!-- Begin Schedule K section "Income (Loss)", Line 1-11 -->
								<!-- Schedule K, Line 1-11 Column Label -->
									<div class="styIRS1065VTImageBox" style="width:11mm;height:75.7mm;padding-left:3mm;border-bottom:1px solid black;">
										<img src="{$ImagePath}/1065_IncomeLoss.gif" alt="VertIncomeLoss" style="padding-top:10mm;"/>
									</div>

										<div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:3mm;">1</div>
										<div class="styIRS1065LNDesc" style="height:4mm;width:124.5mm;">
										  Ordinary business income (loss) (page 1, line 22)
										<!--<span style="width:10px;"/>-->									
										<span style="float:right;height:4mm;">
											<span class="styIRS1065DotLn">..............</span>
										</span>
										</div>
										<div class="styLNRightNumBox" style="width:11.5mm;height:4.8mm;">1</div>
										<div class="styLNAmountBox" style="height:4.8mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/OrdinaryBusinessIncomeLossAmt"/>
											</xsl:call-template>
										</div>
								<!-- Schedule K, Line 2 -->
										<div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:3mm;">2</div>
										<div class="styIRS1065LNDesc" style="height:4mm;width:124.5mm;">Net rental real estate income
										 (loss) (attach Form 8825)
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/NetIncomeLossAmt"/>
											</xsl:call-template>
											<!--<span style="width:14px;"/>-->
											<span style="float:right;height:4mm;">
											<span class="styIRS1065DotLn">...........</span>
										</span>
										</div>
										<div class="styLNRightNumBox" style="width:11.5mm;height:5.2mm;">2</div>
										<div class="styLNAmountBox" style="height:5.2mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/NetIncomeLossAmt"/>
											</xsl:call-template>
										</div>
								<!-- Schedule K, Line 3a -->
										<div class="styLNLeftNumBoxSD" style="height:4.5mm;padding-left:3mm;padding-top:1mm">3a</div>
										<div class="styIRS1065LNDesc" style="height:4.5mm;width:84.5mm;">Other gross rental income (loss)
									    <!-- Form to Form Link -->
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/OtherGrossRentalIncomeLossAmt"/>
											</xsl:call-template>
											<!--<span style="width:4px;"/>-->
											<span style="float:right;height:4mm;">
											<span class="styIRS1065DotLn">.........</span>
											</span>
											</div>
											<div class="styLNRightNumBox" style="height:4.5mm;">3a</div>
											<div class="styLNAmountBox" style="height:4.5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/OtherGrossRentalIncomeLossAmt"/>
												</xsl:call-template>
											</div>
										<div class="styLNRightNumBoxNBB" style="width:11.5mm;background-color:lightgrey;height:4.5mm;border-bottom-width:0px;"/>
										<div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
								<!-- Schedule K, Line 3b -->
										<div class="styIRS1065LNLeftLtrBoxTD" style="height:4.5mm;padding-top:1mm;">b</div>
										<div class="styIRS1065LNDesc" style="height:4.5mm;width:84.5mm;">
										  Expenses from other rental activities (attach statement)
											<span style="width:2px;"/>
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/ExpensesFromOtherRentalActyAmt"/>
											</xsl:call-template>
											<!--<span style="width:36px;"/>-->
										<span style="float:right;"/>
										</div>
											<!--<span class="styIRS1065DotLn" style="padding-right:2mm;">..</span>-->
											<div class="styLNRightNumBox" style="height:4.5mm;">3b</div>
											<div class="styLNAmountBox" style="height:4.5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/ExpensesFromOtherRentalActyAmt"/>
												</xsl:call-template>
											</div>
										<div class="styLNRightNumBoxNBB" style="width:11.5mm; background-color:lightgrey;height:4.4mm; border-bottom-width:0px;"/>
										<div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
								<!-- Schedule K, Line 3c -->
										<div class="styIRS1065LNLeftLtrBoxTD" style="height:4.5mm;">c</div>
										<div class="styIRS1065LNDesc" style="height:4.5mm;width:124.5mm;">Other net rental income (loss). 
										  Subtract line 3b from line 3a
										<!--<span style="width:6px;"/>-->
										<span style="float:right;">
											<span class="styIRS1065DotLn">...........</span>
										</span>
										</div>
										<div class="styLNRightNumBox" style="width:11.5mm;height:4.5mm;">3c</div>
										<div class="styLNAmountBox" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/NetIncmLossFromOthRntlActyAmt"/>
											</xsl:call-template>
										</div>
								<!-- Schedule K, Line 4 -->
										<div class="styLNLeftNumBoxSD" style="height:4.5mm;padding-left:3mm;padding-top:1.5mm;">4</div>
										<div class="styIRS1065LNDesc" style="height:4.5mm;width:124.5mm;font-size:6.5pt;">Guaranteed payments:
											<span class="styBoldText">a</span> Services
										<span style="padding-left:1mm;"/>
											<div style="width:34mm;height:4mm;">
												<div class="styLNRightNumBox" style="height:4mm;">4a</div>
												<div class="styLNAmountBox" style="height:4mm;width:26mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/GuaranteedPaymentsServicesAmt"/>
													</xsl:call-template>
												</div>											
											</div>
										<span style="width:11px;"/>
											<span class="styBoldText">b</span> Capital
												<span style="padding-left:1mm;"/>
											<div style="width:34mm;height:4mm;float:right;">
												<div class="styLNRightNumBox" style="height:4mm;">4b</div>
												<div class="styLNAmountBox" style="height:4mm;width:26mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/GuaranteedPaymentsCapitalAmt"/>
													</xsl:call-template>
												</div>											
											</div>
										</div>
										<div class="styLNRightNumBoxNBB" style="width:11.5mm; background-color:lightgrey;height:4.4mm; border-bottom-width:0px;"/>
										<div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
										
										<div class="styIRS1065LNLeftLtrBoxTD" style="height:4mm;"/>
										<div class="styIRS1065LNDesc" style="height:4mm;width:124.5mm;padding-top:1mm;">
											<span class="styBoldText">c</span>
												<span style="width:3px;"/>Total.  Add line 4a and line 4b
										<span style="float:right;">
											<span class="styIRS1065DotLn">....................</span>
										</span>
										</div>
										<div class="styLNRightNumBox" style="width:11.5mm;height:4mm;">4c</div>
										<div class="styLNAmountBox" style="height:4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/GuaranteedPaymentsAmt"/>
											</xsl:call-template>
										</div>										
								<!-- Schedule K, Line 5 -->
										<div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:3mm;">5</div>
										<div class="styIRS1065LNDesc" style="height:4mm;width:124.5mm;">Interest income
										<!--<span style="width:14px;"/>-->										
										<span style="float:right;">
											<span class="styIRS1065DotLn">........................</span>
										</span>
										</div>
										<div class="styLNRightNumBox" style="width:11.5mm;height:4mm;">5</div>
										<div class="styLNAmountBox" style="height:4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/InterestIncomeAmt"/>
											</xsl:call-template>
										</div>
								<!-- Schedule K, Line 6a -->
										<div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:3mm;">6</div>
										<div class="styIRS1065LNDesc" style="height:4mm;width:124.5mm;">
                                            Dividends and dividend equivalents: <b>a</b> Ordinary dividends
										<!--<span style="width:14px;"/>-->
										<span style="float:right;">
											<span class="styIRS1065DotLn">............</span>
										</span>
										</div>
										<div class="styLNRightNumBox" style="width:11.5mm;height:4mm;">6a</div>
										<div class="styLNAmountBox" style="height:4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/OrdinaryDividendsAmt"/>
											</xsl:call-template>
										</div>

										<div class="styIRS1065LNLeftLtrBoxTD" style="height:4mm;"/>
										<div class="styIRS1065LNDesc" style="height:4mm;width:124.5mm;font-size:6.5pt;">
											<span class="styBoldText">b</span>
												<span style="width:3px;"/>Qualified dividends
											<span style="padding-left:1mm;"/>
												<div style="width:34mm;height:4mm;">
													<div class="styLNRightNumBox" style="height:4mm;">6b</div>
													<div class="styLNAmountBox" style="height:4mm;width:25mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/QualifiedDividendsAmt"/>
														</xsl:call-template>
													</div>											
												</div>
											<span style="width:1px;"/>
												<span class="styBoldText">c</span> Dividend equivalents
													<span style="padding-left:1mm;"/>
												<div style="width:33mm;height:4mm;float:right;">
													<div class="styLNRightNumBox" style="height:4mm;">6c</div>
													<div class="styLNAmountBox" style="height:4mm;width:25mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/DividendEquivalentsAmt"/>
														</xsl:call-template>
													</div>											
												</div>
										</div>
										<div class="styLNRightNumBoxNBB" style="width:11.5mm; background-color:lightgrey;height:4.4mm; border-bottom-width:0px;"/>
										<div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
								<!-- Schedule K, Line 7 -->
										<div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:3mm;">7</div>
										<div class="styIRS1065LNDesc" style="height:4mm;width:124.5mm;">Royalties
										<!--<span style="width:15px;"/>-->
										<span style="float:right;">
											<span class="styIRS1065DotLn">..........................</span>
										</span>
										</div>
										<div class="styLNRightNumBox" style="width:11.5mm;height:4.5mm;">7</div>
										<div class="styLNAmountBox" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/RoyaltiesReceivedAmt"/>
											</xsl:call-template>
										</div>
								<!-- Schedule K, Line 8 -->
										<div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:3mm;">8</div>
										<div class="styIRS1065LNDesc" style="height:4mm;width:124.5mm;">Net short-term capital gain (loss)
										(attach Schedule D (Form 1065))
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/NetSTCapitalGainOrLossAmt"/>
											</xsl:call-template>
											<!--<span style="width:6px;"/>-->
										<span style="float:right;">
											<span class="styIRS1065DotLn">........</span>
										</span>
										</div>
										<div class="styLNRightNumBox" style="width:11.5mm;height:4mm;">8</div>
										<div class="styLNAmountBox" style="height:4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/NetSTCapitalGainOrLossAmt"/>
											</xsl:call-template>
										</div>
								<!-- Schedule K, Line 9a -->
										<div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:3mm;">9a</div>
										<div class="styIRS1065LNDesc" style="height:4mm;width:124.5mm">Net long-term capital gain (loss)
										 (attach Schedule D (Form 1065))
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/NetLTCapitalGainOrLossAmt"/>
											</xsl:call-template>
										<!--<span style="width:10px;"/>-->
										<span style="float:right;">
											<span class="styIRS1065DotLn">........</span>
										</span>
										</div>
										<div class="styLNRightNumBox" style="width:11.5mm;height:4mm;">9a</div>
										<div class="styLNAmountBox" style="height:4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/NetLTCapitalGainOrLossAmt"/>
											</xsl:call-template>
										</div>
								<!-- Schedule K, Line 9b -->
										<div class="styIRS1065LNLeftLtrBoxTD" style="height:4mm;">b</div>
										<div class="styIRS1065LNDesc" style="height:4mm;width:84.5mm;">Collectibles (28%) gain (loss)
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/CollectiblesGainLossAmt"/>
											</xsl:call-template>
											<!--<span style="width:1px;"/>-->
										<span style="float:right;">
											<span class="styIRS1065DotLn">..........</span>
											</span>
										</div>
											<div class="styLNRightNumBox" style="height:4.5mm;">9b</div>
											<div class="styLNAmountBox" style="height:4.5mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/CollectiblesGainLossAmt"/>
												</xsl:call-template>
										</div>
										<div class="styLNRightNumBoxNBB" style="width:11.5mm;background-color:lightgrey;             height:4.5mm;border-bottom-width:0px;"/>
										<div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
								<!-- Schedule K, Line 9c -->
											<div class="styIRS1065LNLeftLtrBoxTD" style="height:4mm;">c</div>
											<div class="styIRS1065LNDesc" style="height:4mm;width:84.5mm;">Unrecaptured section 1250
											 gain (attach statement)
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/UnrecapturedSection1250GainAmt"/>
												</xsl:call-template>
											<!--<span style="width:1px;"/>-->
											<span style="float:right;">
												<span class="styIRS1065DotLn" style="letter-spacing:2.5mm;padding-top:1mm;">....</span>
											</span>
											</div>
												<div class="styLNRightNumBox" style="height:4.5mm;">9c</div>
												<div class="styLNAmountBox" style="height:4.5mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/UnrecapturedSection1250GainAmt"/>
													</xsl:call-template>
											</div>
										<div class="styLNRightNumBoxNBB" style="width:11.5mm;background-color:lightgrey;height:4.5mm;border-bottom-width:0px;"/>
										<div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
								<!-- Schedule K, Line 10 -->
										<div class="styLNLeftNumBox" style="height:4mm;">10</div>
										<div class="styIRS1065LNDesc" style="height:4mm;width:124.5mm;">Net section 1231 gain (loss)
										  (attach Form 4797)
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/NetSection1231GainLossAmt"/>
											</xsl:call-template>
											<span style="width:2px;"/>
										<span style="float:right;">
											<span class="styIRS1065DotLn">..............</span>
										</span>
										</div>
										<div class="styLNRightNumBox" style="width:11.5mm;height:4mm;">10</div>
										<div class="styLNAmountBox" style="height:4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/NetSection1231GainLossAmt"/>
											</xsl:call-template>
										</div>
								<!-- Schedule K, Line 11 -->
								  <div style="border-bottom:1px solid black;">
									<div class="styLNLeftNumBox" style="height:5.5mm;padding-top:2mm;">11</div>
									<div class="styIRS1065LNDesc" style="height:5.5mm;width:124.5mm;">
									  Other income (loss) (see instructions) 
									  <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/OtherIncomeLossAmt"/>
									  </xsl:call-template>
									  <!--<span style="width:8px;"/>-->
                                        Type <img src="{$ImagePath}/1065_Bullet_Md.gif" alt="MidSizeBullet"/>
									  <div style="width:60.7mm;padding-left:1mm;height:5mm;padding-top:1.5mm;">
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">
													  Form 1065, Schedule K, Line 11 - Other income (loss) (see instructions)</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/OtherIncomeLossAmt/@otherIncomeTyp"/>
											</xsl:call-template>
									  </div>
								  </div>
								  <div style="height:5.5mm;">
									<div class="styLNRightNumBoxNBB" style="width:11.5mm;height:100%;">11
										<div style="vertical-align:baseline;height:100%;"/>
									</div>
									<div class="styLNAmountBoxNBB" style="height:100%;">
									  <xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/OtherIncomeLossAmt"/>
									  </xsl:call-template>
									  <div style="vertical-align:baseline;height:100%;"/>
									</div>
									</div>
								  </div>

								<!-- End Schedule K section "Income (Loss)", Line 1-11 -->
								<!-- Schedule K, Line 12-13d Column Label -->
								<div style="width:187mm;">
									<div class="styIRS1065VTImageBox" style="width:11mm;height:23.7mm;padding-left:3mm;border-bottom:1px solid black;">
										<img src="{$ImagePath}/1065_Deductions.gif" alt="VertDeductions" style="padding-top:3mm;"/>
									</div>

										<div class="styLNLeftNumBox">12</div>
										<div class="styIRS1065LNDesc" style="width:124.5mm;">Section 179 deduction (attach Form 4562)
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/Section179ExpenseDeductionAmt"/>
											</xsl:call-template>
										<!--<span style="width:14px;"/>-->
										<span style="float:right;">
											<span class="styIRS1065DotLn">...............</span>
										</span>
										</div>
										<div class="styLNRightNumBox" style="width:11.5mm;height:4.5mm;">12</div>
										<div class="styLNAmountBox" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/Section179ExpenseDeductionAmt"/>
											</xsl:call-template>
										</div>
								<!-- Schedule K, Line 13a -->
										<div class="styLNLeftNumBox">13a</div>
										<div class="styIRS1065LNDesc" style="width:124.5mm;">Contributions
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/CharitableContributionsTotAmt"/>
											</xsl:call-template>
										<!--<span style="width:13px;"/>-->
										<span style="float:right;">
											<span class="styIRS1065DotLn">........................</span>
										</span>
										</div>
										<div class="styLNRightNumBox" style="width:11.5mm;height:4mm;">13a</div>
										<div class="styLNAmountBox" style="height:4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/CharitableContributionsTotAmt"/>
											</xsl:call-template>
										</div>
								<!-- Schedule K, Line 13b -->
										<div class="styIRS1065LNLeftLtrBoxTD" style="padding-top:1mm;">b</div>
										<div class="styIRS1065LNDesc" style="padding-top:1mm;width:124.5mm;">Investment interest expense
										<!--<span style="width:15px;"/>-->										
										<span style="float:right;">
											<span class="styIRS1065DotLn">....................</span>
										</span>
										</div>
										<div class="styLNRightNumBox" style="width:11.5mm;height:4mm;">13b</div>
										<div class="styLNAmountBox" style="height:4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/InterestExpenseOnInvstDbAmt"/>
											</xsl:call-template>
										</div>
								<!-- Schedule K, Line 13c -->
										<div class="styIRS1065LNLeftLtrBoxTD" style="padding-top:3mm;">c</div>
										<div class="styIRS1065LNDesc" style="width:124.5mm;padding-top:1mm;">
										  Section 59(e)(2) expenditures:
										  <span class="styBoldText">(1)</span>
										<span style="padding-left:1mm;">
										Type <img src="{$ImagePath}/1065_Bullet_Md.gif" alt="MidSizeBullet"/>
										</span>
										<span style="width:1mm;"/>
									    <div style="width:42mm;padding-left:.3mm;height:5mm;padding-top:1mm;border-bottom:dashed 1px;">
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">
												  Form 1065, Schedule K, Line 13c - Section 59(e)(2) expenditures</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/Sect59e2ExpenditureDesc"/>
											</xsl:call-template>
										</div>
										<div style="width:25mm;text-align:left;height:5.5mm;padding-top:1.5mm;padding-bottom:.5mm;float:right">
										  <span class="styBoldText">(2)</span>
									      Amount <img src="{$ImagePath}/1065_Bullet_Md.gif" alt="MidSizeBullet"/>
										  <xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/Section59e2ExpenditureAmt"/>
										  </xsl:call-template>
										</div>
										</div>

								  <div style="height:6mm;">
									<span class="styLNRightNumBox" style="width:11.5mm;height:100%;">
									  13c(2)<span style="vertical-align:baseline;height:100%;"/> 
									</span>
									<span class="styLNAmountBox" style="height:100%;">
									  <xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/Section59e2ExpenditureAmt"/>
									  </xsl:call-template>
									  <span style="vertical-align:baseline;height:100%;"/> 
									</span>
								  </div>
								<!-- Schedule K, Line 13d -->
								  <div style="border-bottom:1px solid black;">
									<div class="styIRS1065LNLeftLtrBoxTD" style="height:5mm;padding-top:2mm;">d</div>
									<div class="styIRS1065LNDesc" style="padding-bottom:0mm;padding-top:0mm;height:5mm;width:124.5mm;">
									  Other deductions (see instructions)

									  <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/OtherDeductionsAmt"/>
										  <xsl:with-param name="IDstring">1065SchKLine10</xsl:with-param>
									  </xsl:call-template>
									<!--Dotted Line-->
									<span style="width:6px;"/>
                                        Type <img src="{$ImagePath}/1065_Bullet_Md.gif" alt="MidSizeBullet"/>

									  <div style="width:64.5mm;padding-left:.3mm;height:5mm;padding-top:1.5mm;">
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">
												  Form 1065, Schedule K, Line 13d - Other deductions (see instructions)</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/OtherDeductionsAmt/@otherDeductionsDesc"/>
										</xsl:call-template>
									  </div>
									</div>
								  <div style="height:5mm;">
									<div class="styLNRightNumBoxNBB" style="width:11.5mm;height:100%;">13d
										<div style="vertical-align:baseline;height:100%;"/>
									</div>
									<div class="styLNAmountBoxNBB" style="height:100%;">
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/OtherDeductionsAmt"/>
										</xsl:call-template>
									  <xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/OtherDeductionsAmt"/>
									  </xsl:call-template>
									  <div style="vertical-align:baseline;height:100%;"/> 
									</div>
							      </div>
								  </div>
								</div>
								<!-- End Schedule K section "Other Deductions", line 11-13d -->
								<!-- Schedule K, Line 14a-14c Column Label -->
								<div style="width:187mm;">
									<div class="styIRS1065VTImageBox" style="width:11mm;height:12.2mm;border-bottom:1px solid black;
									padding-left:0mm;padding-top:1.5mm;">
										<img src="{$ImagePath}/1065_SelfEmp.gif" alt="VertSelfEmp" style="height:10mm;"/>
									</div>

										<div class="styLNLeftNumBox">14a</div>
										<div class="styIRS1065LNDesc" style="width:124.5mm;">Net earnings (loss) from self-employment
										<span style="width:0px;"/>
										<span style="float:right;">
											<span class="styIRS1065DotLn">.................</span>
										</span>
										</div>
										<div class="styLNRightNumBox" style="width:11.5mm;height:4mm;">14a</div>
										<div class="styLNAmountBox" style="height:4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/NetEarningsLossFromSEAmt"/>
											</xsl:call-template>
										</div>
										<div class="styIRS1065LNLeftLtrBoxTD">b</div>
										<div class="styIRS1065LNDesc" style="width:124.5mm;">Gross farming or fishing income
										<!--<span style="width1px;"/>-->
										<span style="float:right;">
											<span class="styIRS1065DotLn">....................</span>
										</span>
										</div>
										<div class="styLNRightNumBox" style="width:11.5mm;height:4mm;">14b</div>
										<div class="styLNAmountBox" style="height:4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/GrossFarmingOrFishingIncomeAmt"/>
											</xsl:call-template>
										</div>
									<div style="border-bottom:1px solid black;">
										<div class="styIRS1065LNLeftLtrBoxTD">c</div>
										<div class="styIRS1065LNDesc" style="width:124.5mm;">Gross nonfarm income
										<!--<span style="width:13px;"/>-->
										<span style="float:right;">
											<span class="styIRS1065DotLn">......................</span>
										</span>
										</div>
										<div class="styLNRightNumBox" style="width:11.5mm;border-bottom-width:0px;">14c</div>
										<div class="styLNAmountBox" style="border-bottom-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/GrossNonfarmIncomeAmt"/>
											</xsl:call-template>
										</div>
									</div>
								<!-- Begin Schedule K section "Credit and Credit Recapture", Line 15a-f -->
									<div style="width:187mm;">
									<div class="styIRS1065VTImageBox" style="width:11mm;height:32.2mm;padding-left:1mm;border-bottom:1px solid black;">
										<img src="{$ImagePath}/1065_Recapture.gif" alt="Credits and Credit Recapture" style="padding-top:0px;"/>
									</div>
								<!-- Schedule K, Line 15a -->
										<div class="styLNLeftNumBox" style="padding-top:1mm;">15a</div>
										<div class="styIRS1065LNDesc" style="width:124.5mm;">Low-income housing credit (section 42(j)(5))
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/LowIncmHsngCrSect42j5PrtshpAmt"/>
											</xsl:call-template>
										<!--<span style="width:2px;"/>-->
										<span style="float:right;">
											<span class="styIRS1065DotLn">...............</span>
										</span>
										</div>
										<div class="styLNRightNumBox" style="width:11.5mm;height:4.7mm;padding-top:1mm">15a</div>
										<div class="styLNAmountBox" style="height:4.7mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/LowIncmHsngCrSect42j5PrtshpAmt"/>
											</xsl:call-template>
										</div>

								<!-- Schedule K, Line 15b -->

										<div class="styIRS1065LNLeftLtrBoxTD" style="padding-top:0.5mm;">b</div>
										<div class="styIRS1065LNDesc" style="width:124.5mm;">Low-income housing credit (other)
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/LowIncomeHousingCrOthPrtshpAmt"/>
											</xsl:call-template>
										<!--<span style="width:6px;"/>-->
										<span style="float:right;">
											<span class="styIRS1065DotLn">..................</span>
										</span>
										</div>
										<div class="styLNRightNumBox" style="width:11.5mm;height:4.6mm;">15b</div>
										<div class="styLNAmountBox" style="height:4.6mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/LowIncomeHousingCrOthPrtshpAmt"/>
											</xsl:call-template>
										</div>

								<!-- Schedule K, Line 15c -->

										<div class="styIRS1065LNLeftLtrBoxTD" style="padding-top:0.5mm;">c</div>
										<div class="styIRS1065LNDesc" style="width:124.5mm;">
										  Qualified rehabilitation expenditures (rental real estate) (attach Form 3468, if applicable)
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/QlfyRehbltExpendRntlREActyAmt"/>
											</xsl:call-template>
										<!--<span style="width:11px;"/>-->
										<span style="float:right;">
											<span class="styIRS1065DotLn">.</span>
										</span>
										</div>
										<div class="styLNRightNumBox" style="width:11.5mm;height:4.6mm;">15c</div>
										<div class="styLNAmountBox" style="height:4.6mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/QlfyRehbltExpendRntlREActyAmt"/>
											</xsl:call-template>
										</div>

								<!-- Schedule K, Line 15d -->

									<div class="styIRS1065LNLeftLtrBoxTD" style="padding-top:2.5mm;">d</div>
									<xsl:choose>
										<xsl:when test="$Form1065ScheduleK/OtherRentalRealEstateAmt/@otherRentalRealEstateCrDesc">
										<div class="styIRS1065LNDesc" style="padding-top:1mm;width:124.5mm;">
									  Other rental real estate credits (see instructions)
									  <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/OtherRentalRealEstateAmt"/>
									  </xsl:call-template>
										<span style="width:6mm;"/>
										<span style="padding-left:2mm;">
                                        Type <img src="{$ImagePath}/1065_Bullet_Md.gif" alt="MidSizeBullet"/>
										</span>
										<div style="width:39.4mm;border-bottom:dashed 1px;padding-left:1mm;padding-top:1mm;">
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">
											  Form 1065, Schedule K, Line 15d - Other rental real estate credits (see instructions)</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/OtherRentalRealEstateAmt/@otherRentalRealEstateCrDesc"/>
										</xsl:call-template>
									</div>
									</div>
										</xsl:when>
										<xsl:otherwise>
											<div class="styIRS1065LNDesc" style="padding-top:2.5mm;width:124.5mm;">
									  Other rental real estate credits (see instructions)
									  <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/OtherRentalRealEstateAmt"/>
									  </xsl:call-template>
										<span style="width:6mm;"/>
										<span style="padding-left:2mm;">
                                        Type <img src="{$ImagePath}/1065_Bullet_Md.gif" alt="MidSizeBullet"/>
										</span>
										<div style="width:39.4mm;border-bottom:dashed 1px;padding-left:1mm;padding-top:1mm;">
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">
											  Form 1065, Schedule K, Line 15d - Other rental real estate credits (see instructions)</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/OtherRentalRealEstateAmt/@otherRentalRealEstateCrDesc"/>
										</xsl:call-template>
									</div>
									</div>
										</xsl:otherwise>
									</xsl:choose>
									 <div style="height:6mm;">
									<div class="styLNRightNumBox" style="width:11.5mm;height:100%;">15d
										<div style="vertical-align:baseline;height:100%;"/>
									</div>
									<div class="styLNAmountBox" style="height:100%;">
									  <xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/OtherRentalRealEstateAmt"/>
									  </xsl:call-template>
									  <div style="vertical-align:baseline;height:100%;"/>
									</div>
								  </div>

								<!-- Schedule K, Line 15e -->

									<div class="styIRS1065LNLeftLtrBoxTD" style="padding-top:2.5mm;">e</div>
									<xsl:choose>
										<xsl:when test="$Form1065ScheduleK/OtherRentalCreditsAmt/@otherRentalCreditDesc">
											<div class="styIRS1065LNDesc" style="padding-top:1mm;width:124.5mm;">Other rental credits (see instructions)
									  <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/OtherRentalCreditsAmt"/>
									  </xsl:call-template>
									<span style="width:20mm;"/>
									  <span style="padding-left:2mm;">
                                        Type <img src="{$ImagePath}/1065_Bullet_Md.gif" alt="MidSizeBullet"/>
									  </span>
									  <div style="width:39.4mm;border-bottom:dashed 1px;padding-left:1mm;padding-top:1mm;">
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">
											  Form 1065, Schedule K, Line 15e - Other rental credits (see instructions)</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/OtherRentalCreditsAmt/@otherRentalCreditDesc"/>
										</xsl:call-template>
									  </div>
									</div>
										</xsl:when>
										<xsl:otherwise>
											<div class="styIRS1065LNDesc" style="padding-top:2.5mm;width:124.5mm;">Other rental credits (see instructions)
									  <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/OtherRentalCreditsAmt"/>
									  </xsl:call-template>
									<span style="width:20mm;"/>
									  <span style="padding-left:2mm;">
                                        Type <img src="{$ImagePath}/1065_Bullet_Md.gif" alt="MidSizeBullet"/>
									  </span>
									  <div style="width:39.4mm;border-bottom:dashed 1px;padding-left:1mm;padding-top:1mm;">
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">
											  Form 1065, Schedule K, Line 15e - Other rental credits (see instructions)</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/OtherRentalCreditsAmt/@otherRentalCreditDesc"/>
										</xsl:call-template>
									  </div>
									</div>
										</xsl:otherwise>
									</xsl:choose>
									<div style="height:6mm">
									<div class="styLNRightNumBox" style="width:11.5mm;height:100%;">
									  15e<div style="vertical-align:baseline;height:100%;"/>
									</div>
									<div class="styLNAmountBox" style="height:100%;">
									  <xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/OtherRentalCreditsAmt"/>
									  </xsl:call-template>
									  <div style="vertical-align:baseline;height:100%;"/>
									</div>
								  </div>

								<!-- Schedule K, Line 15f -->

								  <div style="border-bottom:1px solid black;">
									<div class="styIRS1065LNLeftLtrBoxTD" style="padding-top:2.5mm;">f</div>
									<xsl:choose>
										<xsl:when test="$Form1065ScheduleK/OtherCreditsAmt/@otherCreditsTotalDesc">
											<div class="styIRS1065LNDesc" style="padding-bottom:0mm;padding-top:1.5mm;width:124.5mm;">Other credits (see instructions)
									  <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/OtherCreditsAmt "/>
									  </xsl:call-template>
									<span style="width:28mm;"/>
									  <span style="padding-left:2mm;">
                                        Type <img src="{$ImagePath}/1065_Bullet_Md.gif" alt="MidSizeBullet"/>
									  </span>
									  <div style="width:39.4mm;padding-left:1mm;border-bottom:1 solid black;padding-top:1mm;">
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">
											  Form 1065, Schedule K, Line 15f - Other credits (see instructions)</xsl:with-param>
										  <xsl:with-param name="TargetNode" select="$Form1065ScheduleK/OtherCreditsAmt/@otherCreditsTotalDesc"/>
									    </xsl:call-template>
									  </div>
									</div>
										</xsl:when>
										<xsl:otherwise>
											<div class="styIRS1065LNDesc" style="padding-bottom:0mm;padding-top:2.5mm;width:124.5mm;">Other credits (see instructions)
									  <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/OtherCreditsAmt "/>
									  </xsl:call-template>
									<span style="width:28mm;"/>
									  <span style="padding-left:2mm;">
                                        Type <img src="{$ImagePath}/1065_Bullet_Md.gif" alt="MidSizeBullet"/>
									  </span>
									  <div style="width:39.4mm;padding-left:1mm;border-bottom:1 solid black;padding-top:1mm;">
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">
											  Form 1065, Schedule K, Line 15f - Other credits (see instructions)</xsl:with-param>
										  <xsl:with-param name="TargetNode" select="$Form1065ScheduleK/OtherCreditsAmt/@otherCreditsTotalDesc"/>
									    </xsl:call-template>
									  </div>
									</div>
										</xsl:otherwise>
									</xsl:choose>
									<div style="height:6mm;">
								    <div class="styLNRightNumBoxNBB" style="width:11.5mm;height:100%;">
								      15f<div style="vertical-align:baseline;height:100%;"/>
								    </div>
									<div class="styLNAmountBoxNBB" style="height:100%;">
									  <xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/OtherCreditsAmt "/>
									  </xsl:call-template>
									  <div style="vertical-align:baseline;height:100%;"/>
								  </div>	
								  </div>
								  </div>
								</div>
								</div>
								<!-- End Schedule K section "Credit and Credit Recapture", line 15a-f -->
								<!-- Begin Schedule K section "Foreign Transactions", Line 16a-n -->
								<xsl:choose>
									<xsl:when test="count($Form1065ScheduleK/ForeignTransactionsSchKGrp) &gt; 0">
										<xsl:for-each select="$Form1065ScheduleK/ForeignTransactionsSchKGrp">
											<xsl:call-template name="FrnTran"/>
										</xsl:for-each>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="FrnTran"/>
									</xsl:otherwise>
								</xsl:choose>
								<!-- Begin Schedule K section "Alternative Minimum Tax (AMT) Items", Line 17a-f -->
								<div style="width:187mm;">
									<div class="styIRS1065VTImageBox" style="width:11mm;height:27.3mm;padding-top:5mm;border-bottom:1px solid black;">
										<img src="{$ImagePath}/1065_Items.gif" alt="Alternative Minimum Tax AMT Items"/>
									</div>

								<!-- Schedule K, Line 17a -->

										<div class="styLNLeftNumBox">17a</div>
										<div class="styIRS1065LNDesc" style="width:124.5mm;">Post-1986 depreciation adjustment
										<span style="float:right;padding-left:4px;">
											<span class="styIRS1065DotLn">...................</span>
										</span>
										</div>
										<div class="styLNRightNumBox" style="width:11.5mm;height:4.5mm;">17a</div>
										<div class="styLNAmountBox" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/Post1986DepreciationAdjAmt"/>
											</xsl:call-template>
										</div>

								<!-- Schedule K, Line 17b -->

										<div class="styIRS1065LNLeftLtrBoxTD">b</div>
										<div class="styIRS1065LNDesc" style="width:124.5mm;">Adjusted gain or loss 
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">
												  Form 1065, Schedule K, Line 17b - Adjusted gain or loss</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/AdjustedGainOrLossAmt/@desc"/>
											</xsl:call-template>
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/AdjustedGainOrLossAmt"/>
											</xsl:call-template>
										<span style="float:right;">
											<span class="styIRS1065DotLn">.....................</span>
										</span>
										</div>
										<div class="styLNRightNumBox" style="width:11.5mm;height:4.5mm;">17b</div>
										<div class="styLNAmountBox" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/AdjustedGainOrLossAmt"/>
											</xsl:call-template>
										</div>

								<!-- Schedule K, Line 17c -->

										<div class="styIRS1065LNLeftLtrBoxTD">c</div>
										<div class="styIRS1065LNDesc" style="width:124.5mm;">Depletion (other than oil and gas) 
										<span style="float:right;">
											<span class="styIRS1065DotLn">...................</span>
										</span>
										</div>
										<div class="styLNRightNumBox" style="width:11.5mm;height:4.5mm;">17c</div>
										<div class="styLNAmountBox" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/DepletionOtherThanOilAndGasAmt"/>
											</xsl:call-template>
										</div>

								<!-- Schedule K, Line 17d -->

										<div class="styIRS1065LNLeftLtrBoxTD">d</div>
										<div class="styIRS1065LNDesc" style="width:124.5mm;">
										  Oil, gas, and geothermal properties&#8211;gross income 
										<span style="float:right;">
											<span class="styIRS1065DotLn">..............</span>
										</span>
										</div>
										<div class="styLNRightNumBox" style="width:11.5mm;height:4.5mm;">17d</div>
										<div class="styLNAmountBox" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/OilGasAndGeothermalGroIncmAmt"/>
											</xsl:call-template>
										</div>

								<!-- Schedule K, Line 17e -->

										<div class="styIRS1065LNLeftLtrBoxTD">e</div>
										<div class="styIRS1065LNDesc" style="width:124.5mm;">
										  Oil, gas, and geothermal properties&#8211;deductions 
										<span style="float:right;">
											<span class="styIRS1065DotLn">...............</span>
										</span>
										</div>
										<div class="styLNRightNumBox" style="width:11.5mm;height:4.5mm;">17e</div>
										<div class="styLNAmountBox" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/OilGasAndGeothermalDedsAmt"/>
											</xsl:call-template>
										</div>

								<!-- Schedule K, Line 17f -->

									<div style="border-bottom:1px solid black;">
										<div class="styIRS1065LNLeftLtrBoxTD" style="height:4mm;">f</div>
										<div class="styIRS1065LNDesc" style="width:124.5mm;">Other AMT items (attach statement)
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/OtherAMTItemsAmt"/>
											</xsl:call-template>
										<span style="float:right;">
											<span class="styIRS1065DotLn">.................</span>
										</span>
										</div>
										<div class="styLNRightNumBoxNBB" style="width:11.5mm;height:4.5mm;">17f</div>
										<div class="styLNAmountBoxNBB" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/OtherAMTItemsAmt"/>
											</xsl:call-template>
										</div>
									</div>
									</div>	
								<!-- End Schedule K section "Alternative Minimum Tax (AMT) Items", Line 17a-f -->
								<!-- Begin Schedule K section "Other Information", Line 18a-20c -->

									<div class="styIRS1065VTImageBox" style="width:11mm;height:35.5mm;padding-left:3mm;padding-top:2mm;">
										<img src="{$ImagePath}/1065_Information.gif" alt="Other information"/>
									</div>

								<!-- Schedule K, Line 18a -->

										<div class="styLNLeftNumBox">18a</div>
										<div class="styIRS1065LNDesc" style="width:124.5mm;">Tax-exempt interest income
										<span style="float:right;">
											<span class="styIRS1065DotLn">.....................</span>
										</span>
										</div>
										<div class="styLNRightNumBox" style="width:11.5mm;height:4.5mm;">18a</div>
										<div class="styLNAmountBox" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/TaxExemptInterestIncomeAmt"/>
											</xsl:call-template>
										</div>

								<!-- Schedule K, Line 18b -->

										<div class="styIRS1065LNLeftLtrBoxTD">b</div>
										<div class="styIRS1065LNDesc" style="width:124.5mm;">Other tax-exempt income
										<span style="float:right;">
											<span class="styIRS1065DotLn">......................</span>
										</span>
										</div>
										<div class="styLNRightNumBox" style="width:11.5mm;height:4.5mm;">18b</div>
										<div class="styLNAmountBox" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/OtherTaxExemptIncomeAmt"/>
											</xsl:call-template>
										</div>

								<!-- Schedule K, Line 18c -->

										<div class="styIRS1065LNLeftLtrBoxTD">c</div>
										<div class="styIRS1065LNDesc" style="width:124.5mm;">Nondeductible expenses
										<span style="float:right;">
											<span class="styIRS1065DotLn">......................</span>
										</span>
										</div>
										<div class="styLNRightNumBox" style="width:11.5mm;height:4.5mm;">18c</div>
										<div class="styLNAmountBox" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/NondeductibleExpensesAmt"/>
											</xsl:call-template>
										</div>

								<!-- Schedule K, Line 19a -->

										<div class="styLNLeftNumBox">19a</div>
										<div class="styIRS1065LNDesc" style="width:124.5mm;">Distributions of cash and marketable securities
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/DistributionsOfMoneyAmt"/>
											</xsl:call-template>
										<span style="float:right;">
											<span class="styIRS1065DotLn">..............</span>
										</span>
										</div>
										<div class="styLNRightNumBox" style="width:11.5mm;height:4.5mm;">19a</div>
										<div class="styLNAmountBox" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/DistributionsOfMoneyAmt"/>
											</xsl:call-template>
										</div>

								<!-- Schedule K, Line 19b -->

										<div class="styIRS1065LNLeftLtrBoxTD">b</div>
										<div class="styIRS1065LNDesc" style="width:124.5mm;">Distributions of other property
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/DistriOfPropOthThanMonyAmt"/>
											</xsl:call-template>
										<span style="float:right;">
											<span class="styIRS1065DotLn">...................</span>
										</span>
										</div>
										<div class="styLNRightNumBox" style="width:11.5mm;height:4.5mm;">19b</div>
										<div class="styLNAmountBox" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/DistriOfPropOthThanMonyAmt"/>
											</xsl:call-template>
										</div>

								<!-- Schedule K, Line 20a -->

										<div class="styLNLeftNumBox">20a</div>
										<div class="styIRS1065LNDesc" style="width:124.5mm;">Investment income
										<span style="float:right;">
											<span class="styIRS1065DotLn">........................</span>
										</span>
										</div>
										<div class="styLNRightNumBox" style="width:11.5mm;height:4.5mm;">20a</div>
										<div class="styLNAmountBox" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/InvestmentIncomeAmt"/>
											</xsl:call-template>
										</div>

								<!-- Schedule K, Line 20b -->

										<div class="styIRS1065LNLeftLtrBoxTD">b</div>
										<div class="styIRS1065LNDesc" style="width:124.5mm;">Investment expenses
										<span style="float:right;">
											<span class="styIRS1065DotLn">.......................</span>
										</span>
										</div>
										<div class="styLNRightNumBox" style="width:11.5mm;height:4.5mm;">20b</div>
										<div class="styLNAmountBox" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/InvestmentExpenseAmt"/>
											</xsl:call-template>
										</div>

								<!-- Schedule K, Line 20c -->

										<div class="styIRS1065LNLeftLtrBoxTD">c</div>
										<div class="styIRS1065LNDesc" style="width:124.5mm;height:4mm;">Other items and amounts (attach statement)

											<span class="styIRS1065DotLn"  style="float:right;clear: none;" >................</span>
										
									</div>
									<div style="width:43.5mm;">
										<div class="styLNRightNumBoxNBB" style="width:11.5mm;height:4mm;border-bottom-width: 0px;background-color:lightgrey;"/>
										<div class="styLNAmountBoxNBB" style="height:4mm;border-bottom-width: 0px;background-color:lightgrey"/>
										
									</div>		<!-- No element in the schema correspond to this line -->
								<!-- End Schedule K section "Foreign Transactions", Line 18a-20c -->
					</div>
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:right;">
							<span style="width:80px;"/>  
							  Form <span class="styBoldText" style="font-size:8pt;">1065</span> (2020)
						</div>
					</div>
					<p style="page-break-before: always"/>
					<!-- END Page Break and Footer-->
					<!--Begin Page 5 -->
					<!-- Page Header -->
					<div class="styBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">Form 1065 (2020)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">5</span>
						</div>
					</div>
					<!-- END Page Header -->
				<div style="width:187mm;">
					<div class="styBB" style="width:187mm;">
						<div class="styPartDesc" style="width:187mm;padding-left:0mm;">Analysis of Net Income (Loss)
						</div>
					</div>
					<!--  Line 1 -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">1</div>
						<div class="styLNDesc">
						 Net income (loss). Combine Schedule K, lines 1 through 11. From the result, subtract the sum of
						    <br/>Schedule K, lines 12 through 13d, and 16p
						    <span class="styBoldText">
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
						        <span style="width:16px"/>.
							    <span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:15px"/>.
								<span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
							</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:8mm;padding-top:4mm;">1</div>
						<div class="styLNAmountBoxNBB" style="height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065Data/AnalysisOfNetIncomeLoss/NetIncomeLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  Line 1 -->
					<!--  Line 2 -->
					<div style="width:187mm;">
						<table class="styTable" cellspacing="0" style="width:187mm;">
							<thead class="styTableThead">
								<tr>
									<td class="styLNLeftNumBox" style="width:5mm;font-size:7pt;vertical-align:top;">2</td>
									<td style="width:29mm;font-size:7pt;">Analysis by <br/>partner type:</td>
									<th class="styTableCellHeader" style="width:25mm;border-color:black;border-top-width:1px;border-left-width:1px;font-size:7pt;" scope="col">
            (i)<span style="width:3px;"/><span class="styNormalText">Corporate</span>
									</th>
									<th class="styTableCellHeader" style="width:25mm;border-color:black;border-top-width:1px;font-size:7pt;" scope="col">
            (ii)<span style="width:3px;"/><span class="styNormalText">Individual</span> <br/><span class="styNormalText" style="padding-left:4mm;">(active)</span>
									</th>
									<th class="styTableCellHeader" style="width:25mm;border-color:black;border-top-width:1px;font-size:7pt;" scope="col">
            (iii)<span style="width:3px;"/><span class="styNormalText">Individual</span> <br/><span class="styNormalText" style="padding-left:5mm;">(passive)</span>
									</th>
									<th class="styTableCellHeader" style="width:25mm;border-color:black;border-top-width:1px;font-size:7pt;" scope="col">
            (iv)<span style="width:3px;"/><span class="styNormalText">Partnership</span>
									</th>
									<th class="styTableCellHeader" style="width:25mm;border-color:black;border-top-width:1px; font-size:7pt;" scope="col">
            (v)<span style="width:3px;"/><span class="styNormalText">Exempt</span> <br/><span class="styNormalText" style="padding-left:4mm;">Organization</span>
									</th>
									<th class="styTableCellHeader" style="width:25mm;border-color:black;border-top-width:1px;font-size:7pt;" scope="col">
            (vi)<br/><span class="styNormalText" style="font-size:6pt;"> Nominee/Other</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!-- Begin Schedule AnalysisPartner Type Gen -->
								<xsl:choose>
									<xsl:when test="          count($Form1065Data/AnalysisOfNetIncomeLoss/AnalysisPartnerGeneralPrtnrGrp) &gt; 0">
										<xsl:for-each select="$Form1065Data/AnalysisOfNetIncomeLoss/AnalysisPartnerGeneralPrtnrGrp">
											<xsl:call-template name="GenPart"/>
										</xsl:for-each>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="GenPart"/>
									</xsl:otherwise>
								</xsl:choose>
								<!-- Begin Schedule AnalysisPartner Type Ltd -->
								<xsl:choose>
									<xsl:when test="          count($Form1065Data/AnalysisOfNetIncomeLoss/AnalysisPartnerLimitedPrtnrGrp) &gt; 0">
										<xsl:for-each select="$Form1065Data/AnalysisOfNetIncomeLoss/AnalysisPartnerLimitedPrtnrGrp">
											<xsl:call-template name="LtdPart"/>
										</xsl:for-each>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="LtdPart"/>
									</xsl:otherwise>
								</xsl:choose>
							</tbody>
						</table>
					</div>
					<!--  Line 2 -->
					<!-- BEGIN Schedule L Title -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:19.9mm;height:4mm;">Schedule L</div>
						<div class="styPartDesc" style="width:54mm;font-size:8pt;">Balance Sheets per Books</div>
						<div class="styLNAmountBox" style="text-align:center;border-bottom-width:0px;width:56mm;         height:4mm;">Beginning of tax year</div>
						<div class="styLNAmountBox" style="text-align:center;border-bottom-width:0px;width:56mm;         height:4mm;">End of tax year</div>
					</div>
					<!-- END Schedule L Title -->
					<!-- BEGIN Schedule L Line Items -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;"/>
						<div class="styGenericDiv" style="width:66mm;height:4.5mm;text-align:center;font-weight:bold;">Assets</div>
						<div class="styLNAmountBox" style="width:28mm;height:4.5mm;text-align:center;font-weight:bold;">(a)</div>
						<div class="styLNAmountBox" style="width:28mm;height:4.5mm;text-align:center;font-weight:bold;">(b)</div>
						<div class="styLNAmountBox" style="width:28mm;height:4.5mm;text-align:center;font-weight:bold;">(c)</div>
						<div class="styLNAmountBox" style="width:28mm;height:4.5mm;text-align:center;font-weight:bold;">(d)</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;">1</div>
						<div class="styLNDesc" style="width:66mm;height:4.5mm;">Cash
						<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
								<span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
								<span style="width:16px"/>.
							    <span style="width:16px"/>.
							</span>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-size:7pt;font-family:arial;         padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/CashBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-size:7pt;font-family:arial;         padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/CashEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;padding-left:3mm;">2a</div>
						<div class="styLNDesc" style="width:66mm;height:5mm;">Trade notes and accounts receivable
							<span class="styBoldText">
								<span style="width:16px"/>.
								<span style="width:16px"/>.
							</span>
						</div>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-size:7pt;font-family:arial;         padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/TradeNotesAccountsRcvblBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-size:7pt;font-family:arial;         padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/TradeNotesAccountsRcvblEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftLtrBoxDD" style="height:4.5mm;">b</div>
						<div class="styLNDesc" style="width:66mm;height:4.5mm;">Less allowance for bad debts
						<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
								<span style="width:16px"/>.
							    <span style="width:16px"/>.
							</span>
						</div>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-size:7pt;font-family:arial;         padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/BadDebtAllowanceBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-size:7pt;font-family:arial;         padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/NetTradeNotesAcctRcvblBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-size:7pt;font-family:arial;         padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/BadDebtAllowanceEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-size:7pt;font-family:arial;         padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/NetTradeNotesAcctRcvblEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;">3</div>
						<div class="styLNDesc" style="width:66mm;height:4.5mm;">Inventories
						<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
								<span style="width:16px"/>.
							    <span style="width:16px"/>.
							</span>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-size:7pt;font-family:arial;         padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/InventoriesBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-size:7pt;font-family:arial;         padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/InventoriesEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;">4</div>
						<div class="styLNDesc" style="width:66mm;height:4.5mm;">U.S. government obligations
						<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
						   </span>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-size:7pt;font-family:arial;         padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/USGovernmentObligationsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-size:7pt;font-family:arial;         padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/USGovernmentObligationsEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;">5</div>
						<div class="styLNDesc" style="width:66mm;height:4.5mm;font-size7pt;padding-top:1mm;">
							<span>Tax-exempt securities </span>
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
								<span style="width:16px"/>.
							</span>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-size:7pt;font-family:arial;         padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/TaxExemptSecuritiesBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-size:7pt;font-family:arial;         padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/TaxExemptSecuritiesEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5.5mm;padding-left:3mm;">6</div>
						<div class="styLNDesc" style="width:66mm;height:5.5mm;padding-top:1mm;font-size7pt;">
							<span>Other current assets (attach statement)</span>
							<span class="styBoldText">
								<span style="width:16px"/>.
							</span>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5.5mm;"/>
						<div class="styLNFormLinkBox" style="height:5.5mm;">
							<!-- Form to Form Link -->
							<span style="width:.7px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/OtherCurrentAssetsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="width:23mm;height:5.5mm; font-family:arial;         font-size:7pt;padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/OtherCurrentAssetsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5.5mm;"/>
						<div class="styLNFormLinkBox" style="height:5.5mm;">
							<!-- Form to Form Link -->
							<span style="width:.7px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/OtherCurrentAssetsEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="width:23mm;height:5.5mm;font-family:arial;         font-size:7pt;padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/OtherCurrentAssetsEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;">7a</div>
						<div class="styLNDesc" style="width:66mm;height:4.5mm;">
							<span style="font-family:arial; font-size:7pt;">Loans to partners (or persons related to partners)
							</span>
							<span class="styBoldText">
								<span style="width:16px"/>.
							</span>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-size:7pt;font-family:arial;         padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/PartnerLoanBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-size:7pt;font-family:arial;         padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/PartnerLoanEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:18px;">b</div>
						<div class="styLNDesc" style="width:66mm;height:4.5mm;">Mortgage and real estate loans
						<span class="styBoldText">
								<span style="width:16px"/>.
								<span style="width:16px"/>.
								<span style="width:16px"/>.
							</span>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-size:7pt;font-family:arial;         padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/MortgageRealEstateLoansBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-size:7pt;font-family:arial;         padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/MortgageRealEstateLoansEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5.5mm;padding-left:3mm;">8</div>
						<div class="styLNDesc" style="width:66mm;height:5.5mm;font-size:7pt;">
						  Other investments (attach statement)
							<span class="styBoldText">
								<span style="width:16px"/>.
							</span>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5.5mm;"/>
						<div class="styLNFormLinkBox" style="height:5.5mm;">
							<!-- Form to Form Link -->
							<span style="width:.7px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/OtherInvestmentsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="width:23mm;height:5.5mm;font-family:arial;         font-size:7pt;padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/OtherInvestmentsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5.5mm;font-family:arial;font-size:7pt;"/>
						<div class="styLNFormLinkBox" style="height:5.5mm;">
							<!-- Form to Form Link -->
							<span style="width:.7px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/OtherInvestmentsEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="width:23mm;height:5.5mm;font-family:arial;         font-size:7pt;padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/OtherInvestmentsEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;">9a</div>
						<div class="styLNDesc" style="width:66mm;height:4.5mm;padding-top:1mm;">
							<span>Buildings and other depreciable assets</span>
							<span class="styBoldText">
								<span style="width:16px"/>.
							</span>
						</div>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-family:arial;font-size:7pt;         padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/BuildingOtherDeprecAstBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-family:arial;font-size:7pt;         padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/BuildingOtherDeprecAstEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftLtrBoxDD" style="height:4.5mm;">b</div>
						<div class="styLNDesc" style="width:66mm;height:4.5mm;">Less accumulated depreciation
						<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
								<span style="width:16px"/>.
							</span>
						</div>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-family:arial;font-size:7pt;         padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/AccumulatedDepreciationBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-family:arial;font-size:7pt;         padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/NetDepreciableAssetsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-family:arial;font-size:7pt;         padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/AccumulatedDepreciationEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-family:arial;font-size:7pt;         padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/NetDepreciableAssetsEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">10a</div>
						<div class="styLNDesc" style="width:66mm;height:4.5mm;">Depletable assets
						<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
								<span style="width:16px"/>.
							    <span style="width:16px"/>.
								<span style="width:16px"/>.
							    <span style="width:16px"/>.
							</span>
						</div>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-family:arial;font-size:7pt;         padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/DepletableAssetsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-family:arial;font-size:7pt;         padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/DepletableAssetsEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftLtrBoxDD" style="height:4.5mm;">b</div>
						<div class="styLNDesc" style="width:66mm;height:4.5mm;">Less accumulated depletion
						<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
							</span>
						</div>
						<div class="styLNAmountBox" style="width:28mm;height:4.5mm;font-family:arial;font-size:7pt;         padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/AccumulatedDepletionBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:28mm;height:4.5mm;font-family:arial;font-size:7pt;         padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/NetDepletableAssetsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:28mm;height:4.5mm;font-family:arial;font-size:7pt;         padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/AccumulatedDepletionEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:28mm;height:4.5mm;font-family:arial;font-size:7pt;         padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/NetDepletableAssetsEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">11</div>
						<div class="styLNDesc" style="width:66mm;height:4.5mm;">Land (net of any amortization)
						<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
						    </span>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-family:arial;font-size:7pt;         padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/LandBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-family:arial;font-size:7pt;         padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/LandEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">12a</div>
						<div class="styLNDesc" style="width:66mm;height:4.5mm;">Intangible assets (amortizable only)
						<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
							    <span style="width:16px"/>.
						    </span>
						</div>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-family:arial;font-size:7pt;         padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/IntangibleAssetsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-family:arial;font-size:7pt;         padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/IntangibleAssetsEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftLtrBoxDD" style="height:4.5mm;">b</div>
						<div class="styLNDesc" style="width:66mm;height:4.5mm;">Less accumulated amortization
						<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
							    <span style="width:16px"/>.
								<span style="width:16px"/>.
						    </span>
						</div>
						<div class="styLNAmountBox" style="width:28mm;height:4.5mm;font-family:arial;font-size:7pt;         padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/AccumulatedAmortizationBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:28mm;height:4.5mm;font-family:arial;font-size:7pt;         padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/NetIntangibleAssetsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:28mm;height:4.5mm;font-family:arial;font-size:7pt;         padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/AccumulatedAmortizationEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:28mm;height:4.5mm;font-family:arial;font-size:7pt;         padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/NetIntangibleAssetsEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5.5mm;">13</div>
						<div class="styLNDesc" style="width:66mm;height:5.5mm;">Other assets (attach statement)
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
						    </span>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5.5mm;"/>
						<div class="styLNFormLinkBox" style="height:5.5mm;">
							<!-- Form to Form Link -->
							<span style="width:.7px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/OtherAssetsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="width:23mm;height:5.5mm;font-family:arial;         font-size:7pt;padding-right:.5mm;">
						    <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/OtherAssetsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5.5mm;"/>
						<div class="styLNFormLinkBox" style="height:5.5mm;">
							<!-- Form to Form Link -->
							<span style="width:.7px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/OtherAssetsEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="width:23mm;height:5.5mm;font-family:arial;         font-size:7pt;padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/OtherAssetsEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">14</div>
						<div class="styLNDesc" style="width:66mm;height:4.5mm;">Total assets
						<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
								<span style="width:16px"/>.
							</span>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5.5mm;"/>
						<div class="styLNFormLinkBox" style="height:5.5mm;">
							<!-- Form to Form Link -->
							<span style="width:.7px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/TotalAssetsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="width:23mm;height:5.5mm;font-family:arial;         font-size:7pt;padding-right:.5mm;">
						    <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/TotalAssetsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5.5mm;"/>
						<div class="styLNFormLinkBox" style="height:5.5mm;">
							<!-- Form to Form Link -->
							<span style="width:.7px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/TotalAssetsEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="width:23mm;height:5.5mm;font-family:arial;         font-size:7pt;padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/TotalAssetsEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>

					<!--<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-family:arial;font-size:7pt;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/TotalAssetsBOY"/>
							</xsl:call-template>
						</div>-->
						<!--<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-family:arial;font-size:7pt;
						  padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/TotalAssetsEOY"/>
							</xsl:call-template>
						</div>
					</div>-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;"/>
						<div class="styGenericDiv" style="width:66mm;height:5mm;text-align:center;">
							<span class="styBoldText">Liabilities and Capital</span>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">15</div>
						<div class="styLNDesc" style="width:66mm;height:4.5mm;">Accounts payable
						<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
								<span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
							</span>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-family:arial;font-size:7pt;         padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/AccountsPayableBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-family:arial;font-size:7pt;         padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/AccountsPayableEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;">16</div>
						<div class="styLNDesc" style="width:66mm;height:5mm;">
							<span>Mortgages, notes, bonds payable in less than 1 <br/>year</span>
							<!--<span class="styBoldText">
								<span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
							</span>-->
						</div>
						<div class="styShadingCell" style="width:28mm;height:8mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:8mm;padding-top:2mm;font-family:arial;         font-size:7pt;padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/ShortTermPayableBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:8mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:8mm;padding-top:2mm;font-family:arial;         font-size:7pt;padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/ShortTermPayableEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5.5mm;">17</div>
						<div class="styLNDesc" style="width:66mm;height:5.5mm;font-size:7pt;padding-top:1mm;">
							<span>Other current liabilities (attach statement)
							</span>
							<span class="styBoldText">
								<span style="width:16px"/>.
							</span>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5.5mm;"/>
						<div class="styLNFormLinkBox" style="height:5.5mm;">
							<!-- Form to Form Link -->
							<span style="width:.7px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/OtherCurrentLiabilitiesBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="width:23mm;height:5.5mm;font-family:arial;         font-size:7pt;padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/OtherCurrentLiabilitiesBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5.5mm;"/>
						<div class="styLNFormLinkBox" style="height:5.5mm;">
							<!-- Form to Form Link -->
							<span style="width:.7px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/OtherCurrentLiabilitiesEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="width:23mm;height:5.5mm;font-family:arial;         font-size:7pt;padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/OtherCurrentLiabilitiesEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">18</div>
						<div class="styLNDesc" style="width:66mm;height:4.5mm;">All nonrecourse loans
						<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
							</span>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-family:arial;font-size:7pt;         padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/AllNonrecourseLoansBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-family:arial;font-size:7pt;         padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/AllNonrecourseLoansEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">19a</div>
						<div class="styLNDesc" style="width:66mm;height:4.5mm;">
							<span style="font-family:arial; font-size:7pt;">Loans from partners (or persons related to partners)
							</span>
							<span class="styBoldText">
								<span style="width:16px"/>.
							</span>
						</div>
						<!--Schedule L line 19a (b)-->
						<div class="styShadingCell" style="width:28mm;height:4.5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:4.5mm;padding-top:0mm;font-family:arial;         font-size:7pt;padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/LoansFromPartnersBOYAmt"/>
							</xsl:call-template>
						</div>
						<!--Schedule L line 19a (d)-->
						<div class="styShadingCell" style="width:28mm;height:4.5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:4.5mm;padding-top:0mm;font-family:arial;         font-size:7pt;padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/LoansFromPartnersEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:17px">b</div>
						<div class="styLNDesc" style="width:66mm;height:4.5mm;">
							<span style="font-family:arial; font-size:7pt;">Mortgages, notes, bonds payable in 1 year or more
							</span>
							<span class="styBoldText">
								<span style="width:16px"/>.
							</span>
						</div>
						<!--Schedule L line 19b (b)-->
						<div class="styShadingCell" style="width:28mm;height:4.5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:4.5mm;padding-top:0mm;font-family:arial;         font-size:7pt;padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/LongTermPayableBOYAmt"/>
							</xsl:call-template>
						</div>
						<!--Schedule L line 19b (d)-->
						<div class="styShadingCell" style="width:28mm;height:4.5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:4.5mm;padding-top:0mm;font-family:arial;         font-size:7pt;padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/LongTermPayableEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5.5mm;">20</div>
						<div class="styLNDesc" style="width:66mm;height:5.5mm;">Other liabilities (attach statement)
							<span class="styBoldText">
								<span style="width:16px"/>.
								<span style="width:16px"/>.
							</span>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5.5mm;"/>
						<div class="styLNFormLinkBox" style="height:5.5mm;">
							<!-- Form to Form Link -->
							<span style="width:.7px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/OtherLiabilitiesBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="width:23mm;height:5.5mm;font-family:arial;         font-size:7pt;padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/OtherLiabilitiesBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5.5mm;"/>
						<div class="styLNFormLinkBox" style="height:5.5mm;">
							<!-- Form to Form Link -->
							<span style="width:.7px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/OtherLiabilitiesEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="width:23mm;height:5.5mm;font-family:arial;         font-size:7pt;padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/OtherLiabilitiesEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">21</div>
						<div class="styLNDesc" style="width:66mm;height:4.5mm;">Partners' capital accounts
						<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
							    <span style="width:16px"/>.
						    </span>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-family:arial;font-size:7pt;         padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/PartnersCapitalAccountsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:5mm;"/>
						<div class="styLNAmountBox" style="width:28mm;height:5mm;font-family:arial;font-size:7pt;         padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/PartnersCapitalAccountsEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">22</div>
						<div class="styGenericDiv" style="width:66mm;height:4.5mm;padding-top:1mm;">
						  Total liabilities and capital
						<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
							    <span style="width:16px"/>.
								<span style="width:16px"/>.
							    <span style="width:16px"/>.
						    </span>
						</div>
						<div class="styShadingCell" style="width:28mm;height:4.5mm;"/>
						<div class="styLNAmountBoxNBB" style="width:28mm;height:4.5mm;font-family:arial;font-size:7pt;         padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/TotalLiabilitiesCapitalBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="width:28mm;height:4.5mm;"/>
						<div class="styLNAmountBoxNBB" style="width:28mm;height:4.5mm;font-family:arial;font-size:7pt;         padding-right:.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleL/TotalLiabilitiesCapitalEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END Schedule L Line Items -->
				</div>
					<br style="page-break-after:always;"/>
				<div style="width:187mm;">
					<!-- BEGIN Schedule M-1 Title -->
					<div class="styBB" style="width:187mm;height:10mm;">
						<div class="styPartName" style="width:28mm;">Schedule M-1</div>
						<div class="styPartDesc" style="width:158mm;">
						  Reconciliation of Income (Loss) per Books With Income (Loss) per Return
							<br/>Note. <span style="font-weight:normal">
							 The partnership may be required to file Schedule M-3  (see instructions).</span>
						</div>
					</div>
					<!-- END Schedule M-1 Title -->
					<!-- BEGIN Schedule M-1 Line Items -->
					<div style="height:53mm;width:187mm;border-style:solid;border-color:black;border-width:0px 0px 1px 0px">
						<!-- BEGIN Left Side Table of Schedule M-1-->
						<table class="styTable" style="width:93.5mm;float:left;font-size:7pt;height:59mm;" cellspacing="0">
							<thead/>
							<tfoot/>
							<tbody>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBoxSD" style="height:6mm;width:4mm;padding-top:2mm;padding-bottom:0mm;">1</td>
									<td class="styLNDesc" style="width:57mm;height:6mm;padding-left:4mm;padding-top:2mm;padding-bottom:0mm;" colspan="2">
									  <span style="float:left;clear:none;">Net income (loss) per books</span>
									    <!--Dotted Line-->
										<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...</span>
									</td>
									<td class="styLNAmountBox" style="height:6mm;border-right-width:1px;padding-top:2mm;padding-bottom:0mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065ScheduleM1/NetIncomeLossPerBooksAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBoxSD" style="height:12mm;width:4mm;vertical-align:top;padding-bottom:0mm;">2</td>
									<td class="styLNDesc" style="height:12mm;width:57mm;padding-left:4mm;padding-bottom:0mm;" colspan="2">
									  Income included on Schedule K, lines 1, 2, 3c, 5, 6a, 7, 8, 9a, 10, and 11, 
										not recorded on books this year (itemize):
										    <xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleM1/TotalIncmNotRecordedOnBooksAmt"/>
											</xsl:call-template>
											<span style="width:2px;"/>
											<span class="styFixedUnderline" style="width:50mm;border-style:dashed;float:none;padding-right:2mm;"/>
									</td>
									<td class="styLNAmountBox" style="border-bottom-width:1px;border-right-width:1px;height:12.5mm;padding-top:9mm;padding-bottom:0mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065ScheduleM1/TotalIncmNotRecordedOnBooksAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBoxSD" style="height:8mm;width:4mm;vertical-align:center;padding-top:1mm;padding-bottom:0mm;">3</td>
									<td class="styLNDesc" style="height:5mm;width:57mm;padding-left:4mm;padding-top:1mm;padding-bottom:0mm;" colspan="2">
									  Guaranteed payments (other than health insurance)
									    <!--Dotted Line-->
										<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.........</span>
									</td>
									<td class="styLNAmountBox" style="height:8mm;border-right-width:1px;padding-top:4.5mm;padding-bottom:0mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065ScheduleM1/GuaranteedPaymentsAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBoxSD" style="height:10mm;width:4mm;vertical-align:top;padding-bottom:0mm;">4</td>
									<td class="styLNDesc" style="width:57mm;padding-left:4mm;padding-bottom:0mm;" colspan="2">
									  Expenses recorded on books this year not
									  included on Schedule K, lines 1 through 13d, and 16p (itemize):
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1065ScheduleM1/TotalExpensesNotDeductedAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxNBB" style="height:10mm;border-right-width:1px;padding-bottom:0mm;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftLtrBox" style="width:4mm;padding-left:3.5mm;padding-top:1mm;">a</td>
									<td class="styLNDesc" style="width:57mm;padding-left:4mm;padding-bottom:0mm;" colspan="2">
										<div class="styLNDesc" style="width:22mm;padding-bottom:0mm">Depreciation $</div>
										<div class="styIRS1065BBText" style="width:28mm;float:left;text-align:right;padding-top:1mm;padding-bottom:0mm;border-style:dashed;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleM1/DepreciationExpensesAmt"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="styLNAmountBoxNBB" style="border-right-width:1px;padding-bottom:0mm;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftLtrBox" style="width:4mm;padding-left:3.5mm;padding-top:1mm;">b</td>
									<td class="styLNDesc" style="width:57mm;padding-left:4mm;padding-bottom:0mm;" colspan="2">
										<div class="styLNDesc" style="height:6mm;width:22mm;padding-bottom:0mm;">Travel and entertainment $</div>
										<div class="styIRS1065BBText" style="height:6.5mm;width:28mm;float:left;text-align:right;padding-top:3.5mm;padding-bottom:0mm;border-style:dashed;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1065ScheduleM1/TravelEntertainmentAmt"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="styLNAmountBox" style="height:7.5mm;border-bottom-width:1px;border-right-width:1px;padding-top:3.5mm;padding-bottom:0mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065ScheduleM1/TotalExpensesNotDeductedAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBoxSD" style="height:5mm;width:4mm;padding-top:1.5mm;padding-bottom:0mm;">5</td>
									<td class="styLNDesc" style="height:5mm;width:57mm;padding-left:4mm;padding-top:1.5mm;padding-bottom:0mm;" colspan="2">
										<span style="float:left;clear:none;">Add lines 1 through 4</span>
									    <!--Dotted Line-->
										<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.....</span>
									</td>
									<td class="styLNAmountBoxNBB" style="height:5mm;border-right-width:1px;padding-top:1.5mm;padding-bottom:0mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065ScheduleM1/IncomeExpensesSubtotalAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
							</tbody>
						</table>
						<!-- END Left Side table of Schedule M-1-->
						<!-- BEGIN Right Side table of Schedule M-1-->
						<table class="styTable" style="height:50mm;width:93.5mm;float:left;font-size:7pt;" cellspacing="0">
							<thead/>
							<tfoot/>
							<tbody>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBoxSD" style="width:4mm;vertical-align:top;padding-bottom:0mm;">6</td>
									<td class="styLNDesc" style="height:10mm;width:57mm;padding-left:4mm;padding-bottom:0mm;" colspan="2">
									  Income recorded on books this year not included
									  on Schedule K, lines 1 through 11 (itemize):
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1065ScheduleM1/TotIncmRecordedNotIncludedAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxNBB" style="height:10mm;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftLtrBox" style="width:4mm;padding-left:3.5mm;padding-top:1.5mm;">a</td>
									<td class="styLNDesc" style="height:11mm;width:57mm;padding-left:4mm;padding-top:1mm;padding-bottom:0mm;" colspan="2">
										<div class="styLNDesc" style="width:29mm;padding-bottom:0mm;">Tax-exempt interest $</div>
									<div class="styIRS1065BBText" style="width:21mm;float:left;text-align:right;font-size:6pt;font-family:verdana;border-style:dashed;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065ScheduleM1/TaxExemptInterestAmt"/>
										</xsl:call-template>
									</div>
									<span class="styFixedUnderline" style="width:50mm;border-style:dashed;float:none;padding-right:2mm;padding-top:5mm;"/>
									</td>
									<td class="styLNAmountBox" style="height:11mm;border-bottom-width:1px;padding-top:7.5mm;padding-bottom:0mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065ScheduleM1/TotIncmRecordedNotIncludedAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBoxSD" style="width:4mm;vertical-align:top;padding-bottom:0mm;">7</td>
									<td class="styLNDesc" style="height:12mm;width:57mm;padding-left:4mm;padding-bottom:0mm;" colspan="2">
									  Deductions included on Schedule K, lines 1
									  through 13d, and 16p, not charged against
									  book income this year (itemize):
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1065ScheduleM1/TotalDeductionsNotChargedAmt"/>
										</xsl:call-template>
									</td>
									<td class="styLNAmountBoxNBB" style="height:12mm;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styGenericDiv">
									<td class="styLNLeftLtrBox" style="width:4mm;padding-left:3.5mm;padding-top:1.5mm;">a</td>
									<td class="styLNDesc" style="height:6mm;width:57mm;padding-left:4mm;padding-top:1mm;padding-bottom:0mm;" colspan="2">
									  <div class="styLNDesc" style="width:19mm;padding-bottom:0mm;">Depreciation $</div>
									  <div class="styIRS1065BBText" style="width:31mm;float:left;text-align:right;font-family:verdana;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065ScheduleM1/DepreciationDeductionAmt"/>
										</xsl:call-template>
									  </div>
										<span class="styFixedUnderline" style="width:50mm;border-style:dotted;float:none;padding-right:2mm;"/>
									</td>	
									<td class="styLNAmountBoxNBB">
										<span style="width:1px;"/>
									</td>
									<td class="styLNAmountBox" style="height:4mm;border-bottom-width:1px;padding-bottom:0mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065ScheduleM1/TotalDeductionsNotChargedAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBoxSD" style="height:4.5;width:4mm;padding-bottom:0mm;">8</td>
									<td class="styLNDesc" style="height:4.5mm;width:57mm;padding-left:4mm;padding-bottom:0mm;" colspan="2">
										<span style="float:left;clear:none;">Add lines 6 and 7</span>	
										<!--Dotted Line-->
										<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">......</span>
									</td>
									<td class="styLNAmountBox" style="height:4.5mm;padding-top:1mm;padding-bottom:0mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065ScheduleM1/IncomeDeductionsSubtotalAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBoxSD" style="width:4mm;vertical-align:top;padding-bottom:0mm;">9</td>
									<td class="styLNDesc" style="height:10mm;width:57mm;font-size:7pt;padding-left:4mm;padding-bottom:0mm;" colspan="2">
									  Income (loss) (Analysis of Net Income (Loss), line 1). Subtract line 8 from line 5</td>
									<td class="styLNAmountBox" style="height:7.5mm;border-bottom-width:0px;padding-top:4mm;padding-bottom:0mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1065ScheduleM1/IncomeLossAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
							</tbody>
						</table>
						<!-- END Right Side Table of Schedule M-1-->
					</div>
					<!--br style="page-break-after:always;"/-->
					<!-- BEGIN Schedule M-2 Title -->
					<div style="width:187mm;border-style:solid;border-color:black;border-width:0px 0px 1px 0px">
						<div class="styPartName" style="width:28mm;height:4mm;">Schedule M-2</div>
						<div class="styPartDesc" style="width:158mm;">
							  Analysis of Partners' Capital Accounts
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1065ScheduleM2"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END Schedule M-2 Title -->
					<!-- BEGIN Schedule M-2 Line Items -->
					<div style="width:187mm;border-style:solid;border-color:black;border-width:0px 0px 1px 0px">
						<!-- BEGIN Left Side Table of Schedule M-2-->
						<table class="styTable" style="width:93.5mm;float:left;clear:none;font-size:7pt;" cellspacing="0">
							<tr class="styGenericDiv">
								<td class="styLNLeftNumBoxSD" style="width:4mm;padding-bottom:0mm;">1</td>
								<td class="styLNDesc" style="width:57mm;padding-left:4mm;padding-bottom:0mm;" colspan="2">
									<span style="float:left;clear:none;">Balance at beginning of year</span>
								<!--Dotted Line-->
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...</span>
								</td>
								<td class="styLNAmountBox" style="border-right-width:1px;padding-bottom:0mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleM2/BeginningYearBalanceAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr class="styGenericDiv">
								<td class="styLNLeftNumBoxSD" style="width:4mm;padding-top:1mm;">2</td>
								<td class="styLNDesc" style="width:57mm;" colspan="2">
									<div class="styLNDesc" style="width:30mm;height:4.5mm;font-size:7pt;padding-left:4mm;">Capital Contributed:</div>
								<div class="styLNDesc" style="width:25mm;padding-bottom:0mm;">
									<span class="styBoldText">a</span>
									<span style="width:4px"/>Cash
								<!--Dotted Line-->
									<span class="styDotLn" style="float:none;padding-left:2mm;">...</span>
									</div>
								</td>
								<td class="styLNAmountBox" style="border-right-width:1px;padding-bottom:0mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleM2/CapitalContributedDurYrCashAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr class="styGenericDiv">
								<td class="styLNLeftNumBox" style="width:4mm;padding-bottom:0mm;"/>
								<td class="styLNDesc" style="width:57mm;padding-bottom:0mm;" colspan="2">
								<div class="styGenericDiv" style="width:30mm;height:4.5mm;"/>
								<div class="styGenericDiv" style="width:25mm;height:4.5mm;">
									<span class="styBoldText">b</span>
									<span style="width:4px"/>Property
									<!--Dotted Line-->
									<span class="styDotLn" style="float:none;padding-left:1.5mm;">..</span>
									</div>
								</td>
								<td class="styLNAmountBox" style="border-right-width:1px;padding-bottom:0mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleM2/CapitalContributedDurYrPropAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr class="styGenericDiv">
								<td class="styLNLeftNumBoxSD" style="width:4mm;padding-bottom:0mm;">3</td>
								<td class="styLNDesc" style="width:57mm;padding-left:4mm;padding-bottom:0mm;" colspan="2">
									<span style="float:left;clear:none;">Net income (loss) per books</span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...</span>
								</td>
								<td class="styLNAmountBox" style="border-right-width:1px;padding-bottom:0mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleM2/NetIncomeLossPerBooksAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr class="styGenericDiv">
								<td class="styLNLeftNumBoxSD" style="width:4.5mm;padding-top:1.35mm;padding-bottom:0mm;">4</td>
								<td class="styLNDesc" style="width:56.5mm;vertical-align:bottom;padding-left:4mm;padding-bottom:0mm;" colspan="2">
									<div class="styLNDesc" style="width:40mm;padding-bottom:0mm;">
										<span style="float:left;clear:none;">Other increases (itemize):
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1065ScheduleM2/TotalOtherIncreasesAmt"/>
										</xsl:call-template>
										</span>
									</div>
									<div class="styIRS1065BBText" style="width:11mm;float:left;border-style:dashed;padding-top:3mm"/>
								</td>
								<td class="styLNAmountBoxNBB" style="border-right-width:1px;height:4.5mm;border-bottom-width:1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleM2/TotalOtherIncreasesAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>

							<tr class="styGenericDiv">
								<td class="styLNLeftNumBoxSD" style="width:4mm;padding-bottom:0mm;padding-top:5mm;">5</td>
								<td class="styLNDesc" style="width:57mm;padding-left:4mm;padding-bottom:0mm;padding-top:5mm;" colspan="2">
								  <span style="float:left;clear:none;">Add lines 1 through 4</span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.....</span>
								</td>
								<td class="styLNAmountBoxNBB" style="border-right-width:1px;padding-bottom:0mm;height:8.5mm;padding-top:5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleM2/BalBOYCapNetIncmOtherTotalAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
						</table>
						<!-- END Left Side Table of Schedule M-2-->
						<!-- BEGIN Right Side Table of Schedule M-2-->
						<table class="styTable" style="width:93.5mm;float:left;clear:none;font-size:7pt;" cellspacing="0">
							<tr class="styGenericDiv">
								<td class="styLNLeftNumBoxSD" style="height:4.5mm;width:4mm;padding-top:1mm;">6</td>
								<td class="styLNDesc" style="width:57mm;padding-bottom:0mm;" colspan="2">
									<div class="styLNDesc" style="height:4.5mm;width:27mm;padding-left:4mm;padding-bottom:0mm;">
										 Distributions:</div>
								<div class="styLNDesc" style="height:4.5mm;width:26mm;">
									<span class="styBoldText">a</span>
									<span style="width:4px"/>Cash
									<!--Dotted Line-->
									<span class="styDotLn" style="float:none;padding-left:2mm;">...</span>
								</div>
								</td>
								<td class="styLNAmountBox" style="height:4.5mm;padding-bottom:0mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleM2/DistributionsCashAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr class="styGenericDiv">
								<td class="styLNLeftNumBoxSD" style="height:4.5mm;width:4mm;padding-bottom:0mm;"/>
								<td class="styLNDesc" style="height:4.5mm;width:57mm;padding-bottom:0mm;" colspan="2">
										<div class="styLNDesc" style="width:27mm;padding-bottom:0mm;"/>
										<div class="styLNDesc" style="height:4.5mm;width:26mm;padding-bottom:0mm;">
									<span class="styBoldText">b</span>
									<span style="width:4px"/>Property
									<!--Dotted Line-->
									<span class="styDotLn" style="float:none;padding-left:2mm;">..</span>
									</div>
								</td>
								<td class="styLNAmountBox" style="height:4.5mm;padding-bottom:0mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleM2/DistributionsPropertyAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr class="styGenericDiv">
								<td class="styLNLeftNumBoxSD" style="height:4mm;width:4mm;padding-top:1mm;padding-bottom:0mm;">7</td>
								<td class="styLNDesc" style="height:4mm;width:57mm;vertical-align:bottom;padding-top:.5mm;padding-bottom:0mm;" colspan="2">
									<div class="styLNDesc" style="width:42mm;padding-left:4mm;padding-bottom:0mm;">
											<span style="float:left;clear:none;">Other decreases (itemize):
									   <xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1065ScheduleM2/TotalOtherDecreasesAmt"/>
										</xsl:call-template>
										</span>
									</div>
									<div class="styIRS1065BBText" style="width:12mm;float:left;border-style:dashed;padding-top:3mm;"/>
								</td>
								<td class="styLNAmountBoxNBB" style="height:4mm;padding-bottom:0mm;">
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr class="styGenericDiv">
								<td class="styLNLeftNumBoxSD" style="width:4mm;"/>
								<td class="styLNDesc" style="width:57mm;padding-right:2mm;padding-left:4mm;" colspan="2">
										<div class="styIRS1065BBText" style="width:50mm;text-align:left;font-size:6pt;border-style:dashed;padding-top:2mm;"/>
								</td>
								<td class="styLNAmountBox" style="border-bottom-width:1px;">
									<span style="width:1px;"/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleM2/TotalOtherDecreasesAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr class="styGenericDiv">
								<td class="styLNLeftNumBoxSD" style="height:4.5mm;width:4mm;padding-bottom:0mm;">8</td>
								<td class="styLNDesc" style="height:4.5mm;width:57mm;padding-left:4mm;padding-bottom:0mm;" colspan="2">
										<span style="float:left;clear:none;">Add lines 6 and 7</span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.......</span>
								</td>
								<td class="styLNAmountBox" style="height:4.5mm;padding-top:1mm;padding-bottom:0mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleM2/TotDistriAndOthDecreasesAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr class="styGenericDiv">
								<td class="styLNLeftNumBoxSD" style="width:4mm;vertical-align:top;padding-top:1.3mm;padding-bottom:0mm;">9</td>
								<td class="styLNDesc" style="width:57mm;height:7mm;font-size:7pt;padding-top:1.3mm;padding-left:4mm;padding-bottom:0mm;" colspan="2">
								  Balance at end of year. Subtract line 8 from line 5</td>
								<td class="styLNAmountBox" style="height:7.5mm;border-bottom-width:0px;padding-top:3mm;padding-bottom:0mm;">
									<span style="vertical-align:baseline;height:100%;"/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1065ScheduleM2/EndYearBalanceAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
						</table>
						<!-- END Right Side Table of Schedule M-2-->
					</div>
					<!-- END Schedule M-2 Line Items -->
				</div>
					<!--div class="styBB" style="width:187mm;">
					</div-->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="width:100mm;float:left;">
							<span style="width:90mm;"/>
						</div>
						<div style="float:right;">
							<span style="width:80px;"/>  
							  Form <span class="styBoldText" style="font-size:8pt;">1065</span> (2020)
						</div>
					</div>
					<!-- END Page Break and Footer-->
					<!-- BEGIN Left Over Table -->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">Additional Data</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form1065Data"/>
							<xsl:with-param name="DescWidth" select="130"/>
						</xsl:call-template>
						<!-- Had to hardcode the table as a checkbox has to be represented.
							  There is no predefined template to represent the checkbox -->
						<xsl:if test="$Form1065Data/Section761aElectionInd">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:130mm;" scope="row">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form1065Data/Section761aElectionInd"/>
											<xsl:with-param name="BackupName">Section761aElection</xsl:with-param>
										</xsl:call-template>
									  Form 1065, Top Left Margin - Section 761(a) election:</label>
								</td>
								<td class="styLeftOverTableRowAmount" style="width:57mm;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form1065Data/Section761aElectionInd"/>
											<xsl:with-param name="BackupName">Section764Election</xsl:with-param>
										</xsl:call-template>
									</input>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="$Form1065Data/CommonTrustInd">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:130mm;" scope="row">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form1065Data/CommonTrustInd"/>
											<xsl:with-param name="BackupName">CommonTrust</xsl:with-param>
										</xsl:call-template>
									  Form 1065, Top Left Margin - Common Trust:</label>
								</td>
								<td class="styLeftOverTableRowAmount" style="width:57mm;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form1065Data/CommonTrustInd"/>
											<xsl:with-param name="BackupName">CommonTrust</xsl:with-param>
										</xsl:call-template>
									</input>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="$Form1065Data/NomineeInd">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:130mm;" scope="row">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form1065Data/NomineeInd"/>
											<xsl:with-param name="BackupName">Nominee</xsl:with-param>
										</xsl:call-template>
									  Form 1065, Top Left Margin - Nominee:</label>
								</td>
								<td class="styLeftOverTableRowAmount" style="width:57mm;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form1065Data/NomineeInd"/>
											<xsl:with-param name="BackupName">Nominee</xsl:with-param>
										</xsl:call-template>
									</input>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="$Form1065Data/IRC6114Ind">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:130mm;" scope="row">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form1065Data/IRC6114Ind"/>
											<xsl:with-param name="BackupName">IRC6114</xsl:with-param>
										</xsl:call-template>
									  Form 1065, Top Left Margin - IRC 6114:</label>
								</td>
								<td class="styLeftOverTableRowAmount" style="width:57mm;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form1065Data/IRC6114Ind"/>
											<xsl:with-param name="BackupName">IRC6114</xsl:with-param>
										</xsl:call-template>
									</input>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="$Form1065Data/ThreeAndOneHalfPctGroIncmTxInd">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:130mm;" scope="row">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form1065Data/ThreeAndOneHalfPctGroIncmTxInd"/>
											<xsl:with-param name="BackupName">ThreeAndOneHalfPctGrsIncomeTax
											</xsl:with-param>
										</xsl:call-template>
                                          Form 1065, Top Left Margin - Three And One Half Pct Gross Income Tax:
                                    </label>
								</td><br/>
								<td class="styLeftOverTableRowAmount" style="width:57mm;">
								    <input type="checkbox" alt="alt" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form1065Data/ThreeAndOneHalfPctGroIncmTxInd"/>
											<xsl:with-param name="BackupName">ThreeAndOneHalfPctGrsIncomeTax
											</xsl:with-param>
										</xsl:call-template>
									</input>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="$Form1065Data/QlfyTherapeuticDiscoveryCrInd">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:130mm;" scope="row">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form1065Data/QlfyTherapeuticDiscoveryCrInd"/>
											<xsl:with-param name="BackupName">QualifyingTherapeuticDiscvCr
											</xsl:with-param>
										</xsl:call-template>
                                          Form 1065, Top Left Margin - Qualifying Therapeutic Discovery Credit:
                                    </label>
								</td><br/>
								<td class="styLeftOverTableRowAmount" style="width:57mm;">
								    <input type="checkbox" alt="alt" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form1065Data/QlfyTherapeuticDiscoveryCrInd"/>
											<xsl:with-param name="BackupName">QualifyingTherapeuticDiscvCr
											</xsl:with-param>
										</xsl:call-template>
									</input>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="$Form1065Data/SupersededReturnInd">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form1065Data/SupersededReturnInd"/>
											<xsl:with-param name="BackupName">IRS1065SupersededReturn</xsl:with-param>
										</xsl:call-template>
											Form 1065, Line G(7) - Superseded Returns:
									</label>
								</td>
								<td class="styLeftOverTableRowAmount" style="width:87mm;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form1065Data/SupersededReturnInd"/>
											<xsl:with-param name="BackupName">IRS1065SupersededReturn</xsl:with-param>
										</xsl:call-template>
									</input>
								</td>
							</tr>
						</xsl:if>
						
						
						<xsl:call-template name="PopulateLeftoverRowAmount">
						   <xsl:with-param name="Desc">Form 1065, Line 22 - Three And One Half Percent
						   </xsl:with-param>
						   <xsl:with-param name="TargetNode" select="$Form1065Data/OrdinaryBusinessIncomeLossAmt/@threeAndOneHalfPercentAmt"/>
						   <xsl:with-param name="DescWidth" select="130"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
						   <xsl:with-param name="Desc">Form 1065, Line 22 - Qualifying Therapeutic Discovery Credit
						   </xsl:with-param>
						   <xsl:with-param name="TargetNode" select="$Form1065Data/OrdinaryBusinessIncomeLossAmt/@qlfyTherapeuticDiscoveryCrAmt"/>
						   <xsl:with-param name="DescWidth" select="130"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
						   <xsl:with-param name="Desc">Form 1065, Schedule B, Line 9 - Form 3520 Indicator
						   </xsl:with-param>
						   <xsl:with-param name="TargetNode" select="$Form1065ScheduleB/ReceivedDistributionFrgnTrInd/@form3520Cd"/>
						   <xsl:with-param name="DescWidth" select="130"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
						   <xsl:with-param name="Desc">Form 1065, Schedule K, Line 11 - Other income (loss) (see instructions)
						   </xsl:with-param>
						   <xsl:with-param name="TargetNode" select="$Form1065ScheduleK/OtherIncomeLossAmt/@otherIncomeTyp"/>
						   <xsl:with-param name="DescWidth" select="130"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
						   <xsl:with-param name="Desc">Form 1065, Schedule K, Line 13c - Section 59(e)(2) expenditures
						   </xsl:with-param>
						   <xsl:with-param name="TargetNode" select="$Form1065ScheduleK/Sect59e2ExpenditureDesc"/>
						   <xsl:with-param name="DescWidth" select="130"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Form 1065, Schedule K, Line 13d - Other deductions (see instructions)
						   </xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1065ScheduleK/OtherDeductionsAmt/@otherDeductionsDesc"/>
							<xsl:with-param name="DescWidth" select="130"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
						   <xsl:with-param name="Desc">Form 1065, Schedule K, Line 15d - Other rental real estate credits (see instructions)
						   </xsl:with-param>
						   <xsl:with-param name="TargetNode" select="$Form1065ScheduleK/OtherRentalRealEstateAmt/@otherRentalRealEstateCrDesc"/>
						   <xsl:with-param name="DescWidth" select="130"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
						   <xsl:with-param name="Desc">Form 1065, Schedule K, Line 15e - Other rental credits (see instructions)
						   </xsl:with-param>
						   <xsl:with-param name="TargetNode" select="$Form1065ScheduleK/OtherRentalCreditsAmt/@otherRentalCreditDesc"/>
						   <xsl:with-param name="DescWidth" select="130"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
						   <xsl:with-param name="Desc">Form 1065, Schedule K, Line 15f - Other credits (see instructions)
						   </xsl:with-param>
						   <xsl:with-param name="TargetNode" select="$Form1065ScheduleK/OtherCreditsAmt/@otherCreditsTotalDesc"/>
						   <xsl:with-param name="DescWidth" select="130"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
						   <xsl:with-param name="Desc">Form 1065, Schedule K, Line 17b - Adjusted gain or loss
						   </xsl:with-param>
						   <xsl:with-param name="TargetNode" select="$Form1065ScheduleK/AdjustedGainOrLossAmt/@desc"/>
						   <xsl:with-param name="DescWidth" select="130"/>
						</xsl:call-template>
					</table>
					<br/>
					<table id="SpecialConditionDescriptionTbl" class="styDepTbl">
        	          <thead class="styTableThead">
        		        <tr class="styDepTblHdr">
           		          <th class="styDepTblCell" scope="col" style="width: 60mm;text-align:left">
           		            Special Condition Description</th>
           		        </tr>
					  </thead>
      	              <xsl:for-each select="$Form1065Data/SpecialConditionDesc">
        		        <tr>
          		          <xsl:attribute name="class">
          			        <xsl:choose>
             				  <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             				  <xsl:otherwise>styDepTblRow2</xsl:otherwise>
         				    </xsl:choose>
         			      </xsl:attribute>
         			      <td class="styDepTblCell" style="text-align:left;">
            			    <xsl:call-template name="PopulateText">          
                		      <xsl:with-param name="TargetNode" select="."/>
           			        </xsl:call-template>
         			      </td>   
         			   	</tr>
     	              </xsl:for-each>
    	            </table>
					<!-- END Left Over Table -->
					<!-- Additional Data Table -->
					<!-- Separated Data for Schedule B, Line 3a  -->
					<xsl:if test="($Print = $Separated) and  (count($Form1065ScheduleB/EntityOwnIntGrp) &gt;2)">
						<br/>
						<span class="styRepeatingDataTitle">Form 1065 Schedule B, Line 3a</span>
						<table class="styDepTbl" style="font-size:7pt;">
							<thead class="styTableThead">
								<!-- Label the Column Headers -->
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" valign="middle">(i) Name of Entity</th>
									<th class="styDepTblCell" scope="col" valign="middle">(ii) Employer Identification Number
									 (if any)</th>
									<th class="styDepTblCell" scope="col" valign="middle">(iii) Type of Entity</th>
									<th class="styDepTblCell" scope="col" valign="middle">(iv) Country of Organization</th>
									<th class="styDepTblCell" scope="col" align="center" valign="middle">
									  (v) Maximum Percentage Owned in Profit, Loss, or Capital</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1065ScheduleB/EntityOwnIntGrp">
									<tr style="border-color:black;">
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose>
										<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
										<xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<!-- First Column -->
										<td class="styTableCellText" align="left">
											<div style="width:76mm;">
												<span style="float:left;">
													<xsl:if test="EntityName">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="EntityName"/>
														</xsl:call-template>
													</xsl:if>
												</span>
											</div>
										</td>
										<!-- Second Column -->
										<td class="styTableCellText">
											<div style="width:26mm;" align="center">
												<span style="">
													<xsl:choose>
														<xsl:when test="EIN">
															<xsl:call-template name="PopulateEIN">
																<xsl:with-param name="TargetNode" select="EIN"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
												</span>
											</div>
										</td>
										<!-- Third Column -->
										<td class="styTableCellText">
											<div style="width:26mm;" align="left">
												<span style="">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="EntityTypeTxt"/>
													</xsl:call-template>
												</span>
											</div>
										</td>
										<!-- Fourth Column -->
										<td class="styTableCellText">
											<div style="width:29mm;" align="center">
												<span style="">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="OrganizationCountryNm"/>
													</xsl:call-template>
												</span>
											</div>
										</td>
										<!-- Fifth Column -->
										<td class="styTableCellCtr">
											<div style="width:33mm;" align="center">
												<span style="">
													<xsl:call-template name="PopulatePercent">
														<xsl:with-param name="TargetNode" select="MaxPctOwned"/>
													</xsl:call-template>
												</span>
											</div>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- End Separated Data for Schedule B, Line 3a -->
					<!-- Separated Data for Schedule B, Line 3b  -->
					<xsl:if test="($Print = $Separated) and  (count($Form1065ScheduleB/IndivOrEstateOwnIntGrp) &gt;2)">
						<br/>
						<span class="styRepeatingDataTitle">Form 1065 Schedule B, Line 3b</span>
						<table class="styDepTbl" style="font-size:7pt;">
							<thead class="styTableThead">
								<!-- Label the Column Headers -->
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" valign="middle">(i) Name of Individual or Estate</th>
									<th class="styDepTblCell" scope="col" valign="middle">
									  (ii) Social Security Number or Employer Identification Number (if any)</th>
									<th class="styDepTblCell" scope="col" valign="middle">(iii) Country of Citizenship 
										<br/>(see instructions)</th>
									<th class="styDepTblCell" scope="col" align="center" valign="middle">
									  (iv) Maximum Percentage Owned in Profit, Loss, or Capital</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1065ScheduleB/IndivOrEstateOwnIntGrp">
									<tr style="border-color:black;">
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose>
										<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
										<xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<!-- First Column -->
										<td class="styTableCellText" align="left">
											<div style="width:78mm;">
												<span style="float:left;">
													<xsl:if test="NameOfIndivOrEstate">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" 
															 select="NameOfIndivOrEstate"/>
														</xsl:call-template>
													</xsl:if>
												</span>
											</div>
										</td>
										<!-- Second Column -->
										<td class="styTableCellText">
											<div style="width:46mm;" align="center">
												<span style="">
													<xsl:choose>
														<xsl:when test="SSN">
															<xsl:call-template name="PopulateSSN">
																<xsl:with-param name="TargetNode" select="SSN"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:when test="EIN">
															<xsl:call-template name="PopulateEIN">
																<xsl:with-param name="TargetNode" select="EIN"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode"
																  select="MissingEINReasonCd"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
												</span>
											</div>
										</td>
										<!-- Third Column -->
										<td class="styTableCellText">
											<div style="width:29mm;" align="center">
												<span style="">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="CountryOfCitizenship"/>
													</xsl:call-template>
												</span>
											</div>
										</td>
										<!-- Fourth Column -->
										<td class="styTableCellCtr">
											<div style="width:33mm;" align="center">
												<span style="">
													<xsl:call-template name="PopulatePercent">
														<xsl:with-param name="TargetNode" select="MaxPctOwn"/>
													</xsl:call-template>
												</span>
											</div>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- End Separated Data for Schedule B, Line 3b -->
					<!-- Separated Data for Schedule B, Line 3a  -->
					<xsl:if test="($Print = $Separated) and        (count($Form1065ScheduleB/PctTotalVotingPowerOwnGrp) &gt;2)">
						<br/>
						<span class="styRepeatingDataTitle">Form 1065 Schedule B, Line 3a</span>
						<table class="styDepTbl" style="font-size:7pt;">
							<thead class="styTableThead">
								<!-- Label the Column Headers -->
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" valign="middle">(i) Name of Corporation</th>
									<th class="styDepTblCell" scope="col" valign="middle">(ii) Employer Identification Number
									 (if any)</th>
									<th class="styDepTblCell" scope="col" valign="middle">(iii) Country of Incorporation</th>
									<th class="styDepTblCell" scope="col" align="center" valign="middle">
									  (iv) Percentage Owned in Voting Stock</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1065ScheduleB/PctTotalVotingPowerOwnGrp">
									<tr style="border-color:black;">
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose>
										<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
										<xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<!-- First Column -->
										<td class="styTableCellText" align="left">
											<div style="width:78mm;">
												<span style="float:left;">
													<xsl:if test="CorporationName">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="CorporationName"/>
														</xsl:call-template>
													</xsl:if>
												</span>
											</div>
										</td>
										<!-- Second Column -->
										<td class="styTableCellText">
											<div style="width:46mm;" align="center">
												<span style="">
													<xsl:choose>
														<xsl:when test="SSN">
															<xsl:call-template name="PopulateSSN">
																<xsl:with-param name="TargetNode" select="SSN"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:when test="EIN">
															<xsl:call-template name="PopulateEIN">
																<xsl:with-param name="TargetNode" select="EIN"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode"
																  select="MissingEINReasonCd"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
												</span>
											</div>
										</td>
										<!-- Third Column -->
										<td class="styTableCellText">
											<div style="width:29mm;" align="center">
												<span style="">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode"
														  select="IncorporationCountryCd"/>
													</xsl:call-template>
												</span>
											</div>
										</td>
										<!-- Fourth Column -->
										<td class="styTableCellCtr">
											<div style="width:33mm;" align="center">
												<span style="">
													<xsl:call-template name="PopulatePercent">
														<xsl:with-param name="TargetNode"
														  select="VotingStockOwnedPct"/>
													</xsl:call-template>
												</span>
											</div>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- End Separated Data for Schedule B, Line 3a -->
					<!-- Separated Data for Schedule B, Line 3b  -->
					<xsl:if test="($Print = $Separated) and        (count($Form1065ScheduleB/OwnForeignOrDomesticGrp) &gt;2)">
						<br/>
						<span class="styRepeatingDataTitle">Form 1065 Schedule B, Line 3b</span>
						<table class="styDepTbl" style="font-size:7pt;">
							<thead class="styTableThead">
								<!-- Label the Column Headers -->
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" valign="middle">(i) Name of Entity</th>
									<th class="styDepTblCell" scope="col" valign="middle">(ii) Employer Identification Number
									 (if any)</th>
									<th class="styDepTblCell" scope="col" valign="middle">(iii) Type of Entity</th>
									<th class="styDepTblCell" scope="col" valign="middle">(iv) Country of Organization</th>
									<th class="styDepTblCell" scope="col" align="center" valign="middle">
									  (v) Maximum Percentage Owned in Profit, Loss, or Capital</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1065ScheduleB/OwnForeignOrDomesticGrp">
									<tr style="border-color:black;">
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose>
										<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
										<xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<!-- First Column -->
										<td class="styTableCellText" align="left">
											<div style="width:76mm;">
												<span style="float:left;">
													<xsl:if test="EntityName">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="EntityName"/>
														</xsl:call-template>
													</xsl:if>
												</span>
											</div>
										</td>
										<!-- Second Column -->
										<td class="styTableCellText">
											<div style="width:26mm;" align="center">
												<span style="">
													<xsl:choose>
														<xsl:when test="EIN">
															<xsl:call-template name="PopulateEIN">
																<xsl:with-param name="TargetNode" select="EIN"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" 
															     select="MissingEINReasonCd"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
												</span>
											</div>
										</td>
										<!-- Third Column -->
										<td class="styTableCellText">
											<div style="width:26mm;" align="left">
												<span style="">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="EntityTypeTxt"/>
													</xsl:call-template>
												</span>
											</div>
										</td>
										<!-- Fourth Column -->
										<td class="styTableCellText">
											<div style="width:29mm;" align="center">
												<span style="">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode"
													   	 select="OrganizationCountryCd"/>
													</xsl:call-template>
												</span>
											</div>
										</td>
										<!-- Fifth Column -->
										<td class="styTableCellCtr">
											<div style="width:33mm;" align="center">
												<span style="">
													<xsl:call-template name="PopulatePercent">
														<xsl:with-param name="TargetNode" select="MaximumOwnedPct"/>
													</xsl:call-template>
												</span>
											</div>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- End Separated Data for Schedule B, Line 3b -->
				</form>
			</body>
		</html>
	</xsl:template>
	<!-- Begin Foreign Transaction Schedule K -->
	<xsl:template name="FrnTran">
		<div style="width:187mm;">
			<div class="styIRS1065VTImageBox" style="width:11mm;height:65.8mm;border-bottom:1px solid black;padding-left:3mm;padding-top:11mm;">
				<img src="{$ImagePath}/1065_Transactions.gif" alt="Foreign Transactions"/>
			</div>
		<!-- Schedule K, Line 16a -->
				<div class="styLNLeftNumBox" style="padding-top:1mm;height:4mm;">16a
                </div>
				<div class="styIRS1065LNDesc" style="height:4mm;width:124.5mm;">Name of country or U.S. possession
                    <xsl:if test="ForeignCountryOrUSPossessionCd">
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossessionCd"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="FrgnCountryOrUSPossVariousCd">
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="FrgnCountryOrUSPossVariousCd"/>
						</xsl:call-template>
					</xsl:if>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="ForeignRegulatedInvestmtCompCd"/>
						</xsl:call-template>
					<span style="width:10px;"/>
					<img src="{$ImagePath}/1065_Bullet_Md.gif" alt="MidSizeBullet"/>
					<span style="width:4px;"/>
					<div style="width:65mm;height:4mm;border-bottom:dashed 1px;">
						<xsl:if test="ForeignCountryOrUSPossessionCd">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossessionCd"/>
							</xsl:call-template>
							<span style="width:5px;"/>
						</xsl:if>
						<xsl:if test="FrgnCountryOrUSPossVariousCd">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="FrgnCountryOrUSPossVariousCd"/>
							</xsl:call-template>
							<span style="width:5px;"/>
						</xsl:if>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="ForeignRegulatedInvestmtCompCd"/>
							</xsl:call-template>
							<span style="width:5px;"/>
					</div>
				</div>
				<div class="styLNRightNumBoxNBB" style="width:11.5mm;height:5mm;background-color:lightgrey;"/>
				<div class="styLNAmountBoxNBB" style="height:5mm;"/>

		<!-- Schedule K, Line 16b -->

				<div class="styIRS1065LNLeftLtrBoxTD" style="height:4mm;">b</div>
				<div class="styIRS1065LNDesc" style="height:4mm;width:124.5mm;">Gross income from all sources
				<!--<span style="width:8px;"/>-->
				<span style="float:right;">
					<span class="styIRS1065DotLn">....................</span>
				</span>
				</div>
				<div class="styLNRightNumBox" style="width:11.5mm;height:4mm;">16b</div>
				<div class="styLNAmountBox" style="height:4mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="GrossIncomeFromAllSourcesAmt"/>
					</xsl:call-template>
				</div>

		<!-- Schedule K, Line 16c -->

				<div class="styIRS1065LNLeftLtrBoxTD" style="height:4mm;">c</div>
				<div class="styIRS1065LNDesc" style="height:4mm;width:124.5mm;">Gross income sourced at partner level
                    <xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="GrossIncomeSrceAtPrtnrLvlAmt"/>
					</xsl:call-template>
					<!--<span style="width:5px;"/>-->
				<span style="float:right;">
					<span class="styIRS1065DotLn">.................</span>
				</span>
				</div>
				<div class="styLNRightNumBox" style="width:11.5mm;height:4mm;">16c</div>
				<div class="styLNAmountBox" style="height:4mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="GrossIncomeSrceAtPrtnrLvlAmt"/>
					</xsl:call-template>
				</div>

		<!-- Schedule K - Line 16c expla -->

				<div class="styIRS1065LNLeftLtrBoxTD" style="height:4mm;"/>
				<div class="styIRS1065LNDesc" style="height:4mm;width:124.5mm;">
					Foreign gross income sourced at partnership level
				<span style="width:61.5mm;"/>
				</div>				
				<div class="styLNRightNumBoxNBB" style="width:11.5mm;height:4mm;background-color:lightgrey;"/>
				<div class="styLNAmountBoxNBB" style="height:4mm;"/>

		<!-- Schedule K, Line 16d,e -->

				<div class="styIRS1065LNLeftLtrBoxTD" style="height:4mm;">d</div>
				<div style="height:4mm;width:62mm;float:left; clear: none;">	
				<div class="styIRS1065LNDesc" style="height:4mm;width:33mm;">Reserved for future use
                          <img src="{$ImagePath}/1065_Bullet_Md.gif" alt="MidSizeBullet"/>
                </div>          
					<div style="height:4mm;width:22mm;font-family:arial; font-size:7pt; text-align:right; border-bottom:dashed 1px;padding-top:0.5mm;background-color:lightgrey;">
					</div>
			</div>
			<div style="height:4mm;width:62.5mm;float:left; clear: none;">
					<div style="height:4mm;float:left; clear: none;width:6mm;font-size:7pt;font-weight:bold; padding-left:3mm;padding-top:0.5mm;">e</div>
					<div class="styIRS1065LNDesc" style="height:4mm;width:34mm;font-size:7pt;vertical-align:bottom;">Foreign branch category</div>
						<span class="styIRS1065DotLn" style="padding-top:0.5mm;">....</span>
                        <img src="{$ImagePath}/1065_Bullet_Md.gif" alt="MidSizeBullet"/>
			</div>
			<div style="height:4mm;float:right; clear: none;">
				<div class="styLNRightNumBox" style="height:4mm;width:11.5mm;">16e</div>
				<div class="styLNAmountBox" style="height:4mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="FrgnGroIncmPrtshpLvlFrgnBrAmt"/>
					</xsl:call-template>
				</div>
			</div>
			
		<!-- Schedule K, Line 16f,g,h -->

			<div style="height:5mm;width:47mm;float:left; clear: none;padding-top:1mm;font-size:6pt;">	
				<div class="styIRS1065LNLeftLtrBoxTD" style="height:5mm;padding-top:0.5mm;font-size:7pt;">f</div>
				<div class="styIRS1065LNDesc" style="height:5mm;">Passive category
                          <img src="{$ImagePath}/1065_Bullet_Md.gif" alt="MidSizeBullet"/>
                </div>          
					<div style="height:4mm;width:18mm;font-family:arial; text-align:right; border-bottom:dashed 1px;padding-top:1mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="FrgnGroIncmPrtshpLvlPssvAmt"/>
						</xsl:call-template>
					</div>
			</div>
			<div style="height:5mm;width:46mm;float:left; clear: none;padding-top:1mm;font-size:6pt;">
					<div style="height:5mm;float:left; clear: none;width:5mm;font-size:7pt;font-weight:bold; padding-left:2mm;padding-top:0.5mm;">g</div>
					<div class="styIRS1065LNDesc" style="height:5mm;vertical-align:bottom;">General category
                          <img src="{$ImagePath}/1065_Bullet_Md.gif" alt="MidSizeBullet"/>
                    </div>      
					<div style="height:4mm;width:18mm;font-family:arial;text-align:right; border-bottom:dashed 1px;padding-top:1mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="FrgnGroIncmPrtshpLvlGenAmt"/>
						</xsl:call-template>
					</div>
			</div>
			<div style="height:5mm;float:left; clear: none;font-size:6pt;padding-top:1mm;">
				<div style="height:5mm;float:left; clear: none;width:4.5mm;font-size:7pt; font-weight:bold; padding-left:1mm;padding-top:0.5mm;">h</div>
				<div class="styIRS1065LNDesc" style="height:5mm;vertical-align:bottom;">Other (attach statement)
					<img src="{$ImagePath}/1065_Bullet_Md.gif" alt="MidSizeBullet"/>
				</div>
				<div style="height:5mm;">	
                    <xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="FrgnGroIncmPrtshpLvlOtherAmt"/>
					</xsl:call-template>
				</div>
			</div>
			<div style="height:5mm;width:43.5mm;float:right; clear: none;">		
				<div class="styLNRightNumBox" style="height:5mm;width:11.5mm;padding-top:1mm;">16h</div>
				<div class="styLNAmountBox" style="height:5mm;padding-top:1mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="FrgnGroIncmPrtshpLvlOtherAmt"/>
					</xsl:call-template>
				</div>
			</div>
		<!-- Schedule K - Line 16f expla -->

				<div class="styIRS1065LNLeftLtrBoxTD" style="height:4mm;"/>
				<div class="styGenericDiv" style="height:4mm;font-size:7pt;padding-top:1mm;width:124.5mm;">
					Deductions allocated and apportioned at partner level
					<span style="width:56.7mm;"/>
				</div>

				<div class="styLNRightNumBoxNBB" style="width:11.5mm;height:5mm;background-color:lightgrey;"/>
				<div class="styLNAmountBoxNBB" style="height:5mm;"/>

		<!-- Schedule K, Line 16i and 16j-->

				<div class="styIRS1065LNLeftLtrBoxTD" style="height:4mm; padding-top:1.5mm;">i</div>
				<div class="styIRS1065LNDesc" style="width:124.5mm;">Interest expense
                          <img src="{$ImagePath}/1065_Bullet_Md.gif" alt="MidSizeBullet"/>
					<div style="width:32mm;text-align:right; border-bottom:dashed 1px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="DedAllocApprtnPrtnrLvlIntAmt"/>
						</xsl:call-template>
					</div>
					<div style="width:2mm;"/>
					<div style="font-weight:bold;padding-left:1.5mm;padding-top:1.2mm">j</div>
                    Other

				<div style="float:right;padding-top:1.5mm;padding-left:2.8mm">
					<span class="styIRS1065DotLn">..........</span>
					<img src="{$ImagePath}/1065_Bullet_Md.gif" alt="MidSizeBullet"/>
					<span style="width:2mm;"/>
				</div>
                </div>
				<div class="styLNRightNumBox" style="width:11.5mm;height:5.5mm;padding-top:2mm;">16j</div>
				<div class="styLNAmountBox" style="height:5.5mm;padding-top:2mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="DedAllocApprtnPrtnrLvlOthAmt"/>
					</xsl:call-template>
				</div>

		<!-- Schedule K - Line 16j Lien exp-->

				<div class="styIRS1065LNLeftLtrBoxTD" style="height:4mm;"/>
				<div class="styGenericDiv" style="height:4mm;padding-top:1mm;124.5mm;">
					Deductions allocated and apportioned at partnership level to foreign source income
					<span style="width:20.1mm;"/>
				</div>
				<div class="styLNRightNumBoxNBB" style="width:11.5mm;height:5mm;background-color:lightgrey;"/>
				<div class="styLNAmountBoxNBB" style="height:5mm;"/>

		<!-- Schedule K, Line 16k,l -->

				<div class="styIRS1065LNLeftLtrBoxTD" style="height:4mm;">k</div>
				<div style="height:4mm;width:62mm;float:left; clear: none;">	
				<div class="styIRS1065LNDesc" style="height:4mm;width:33mm;">Reserved for future use
                          <img src="{$ImagePath}/1065_Bullet_Md.gif" alt="MidSizeBullet"/>
                </div>          
					<div style="height:4mm;width:22mm;font-family:arial; font-size:7pt; text-align:right; border-bottom:dashed 1px;padding-top:0.5mm;background-color:lightgrey;">
					</div>
			</div>
			<div style="height:4mm;width:62.5mm;float:left; clear: none;">
					<div style="height:4mm;float:left; clear: none;width:6mm;font-size:7pt;font-weight:bold; padding-left:3mm;padding-top:0.5mm;">l</div>
					<div class="styIRS1065LNDesc" style="height:4mm;width:34mm;font-size:7pt;vertical-align:bottom;">Foreign branch category</div>
						<span class="styIRS1065DotLn" style="padding-top:0.5mm;">....</span>
                        <img src="{$ImagePath}/1065_Bullet_Md.gif" alt="MidSizeBullet"/>
			</div>
			<div style="height:4mm;float:right; clear: none;">
				<div class="styLNRightNumBox" style="height:4mm;width:11.5mm;">16l</div>
				<div class="styLNAmountBox" style="height:4mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="DedAllocApprtnPrtshpLvlBrAmt"/>
					</xsl:call-template>
				</div>
			</div>
			
		<!-- Schedule K, Line 16m,16n,16o -->
		
			<div style="height:5mm;width:47mm;float:left; clear: none;padding-top:1mm;font-size:6pt;">	
				<div class="styIRS1065LNLeftLtrBoxTD" style="height:5mm;padding-top:0.5mm;font-size:7pt;">m</div>
				<div class="styIRS1065LNDesc" style="height:5mm;">Passive category
                          <img src="{$ImagePath}/1065_Bullet_Md.gif" alt="MidSizeBullet"/>
                </div>          
					<div style="height:4mm;width:18mm;font-family:arial;text-align:right; border-bottom:dashed 1px;padding-top:1mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="DedAllocApprtnPrtshpLvlPssvAmt"/>
						</xsl:call-template>
					</div>
			</div>
			<div style="height:5mm;width:46mm;float:left; clear: none;padding-top:1mm;font-size:6pt;">
					<div style="height:5mm;float:left;clear:none;width:5mm;font-size:7pt;font-weight:bold; padding-left:2mm;padding-top:0.5mm;">n</div>
					<div class="styIRS1065LNDesc" style="height:5mm;vertical-align:bottom;">General category
                          <img src="{$ImagePath}/1065_Bullet_Md.gif" alt="MidSizeBullet"/>
                    </div>      
					<div style="height:4mm;width:18mm;font-family:arial;text-align:right; border-bottom:dashed 1px;padding-top:1mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="DedAllocApprtnPrtshpLvlGenAmt"/>
						</xsl:call-template>
					</div>
			</div>
			<div style="height:5mm;float:left;clear:none;font-size:6pt;padding-top:1mm;">
				<div style="height:5mm;float:left; clear: none;width:4mm;font-size:7pt; font-weight:bold; padding-left:1mm;padding-top:0.5mm;">o</div>
				<div class="styIRS1065LNDesc" style="height:5mm;vertical-align:bottom;">Other (attach statement)
					<img src="{$ImagePath}/1065_Bullet_Md.gif" alt="MidSizeBullet"/>
				</div>
				<div style="height:5mm;width:5mm;">	
                    <xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="DedAllocApprtnPrtshpLvlOthAmt"/>
					</xsl:call-template>
				</div>
			</div>
			<div style="height:5mm;width:43.5mm;float:right; clear: none;">		
				<div class="styLNRightNumBox" style="height:5mm;width:11.5mm;padding-top:1mm;">16o</div>
				<div class="styLNAmountBox" style="height:5mm;padding-top:1mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="DedAllocApprtnPrtshpLvlOthAmt"/>
					</xsl:call-template>
				</div>
			</div>
		<!-- Schedule K, Line 16p -->

				<div class="styIRS1065LNLeftLtrBoxTD" style="padding-top:2.5mm;">p</div>
				<div class="styIRS1065LNDesc" style="width:124.5mm;">Total foreign taxes (check one): 
                          <img src="{$ImagePath}/1065_Bullet_Md.gif" alt="MidSizeBullet"/>
					<xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="TotalForeignTaxesAmt"/>
					</xsl:call-template>
					<span style="width:8px"/>
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="TotalForeignTaxesPaidInd"/>
							<xsl:with-param name="BackupName">IRS1065ScheduleKTotalForeignTaxesPaid
                                         </xsl:with-param>
						</xsl:call-template>
						<div style="padding-top:1mm;padding-bottom:0mm;"> Paid</div>
					</label>
					<span style="width:1mm"/>
					<input type="checkbox" class="styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="TotalForeignTaxesPaidInd"/>
							<xsl:with-param name="BackupName">IRS1065ScheduleKTotalForeignTaxesPaid
							</xsl:with-param>
						</xsl:call-template>
					</input>
					<span style="width:12px"/>
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="TotalForeignTaxesAccruedInd"/>
							<xsl:with-param name="BackupName">IRS1065ScheduleKTotalForeignTaxesAccrued
							</xsl:with-param>
						</xsl:call-template>
						<span style="padding-top:2mm;padding-bottom:0mm;">Accrued</span>
					</label>
					<span style="width:1mm"/>
					<input type="checkbox" class="styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="TotalForeignTaxesAccruedInd"/>
							<xsl:with-param name="BackupName">IRS1065ScheduleKTotalForeignTaxesAccrued
							</xsl:with-param>
						</xsl:call-template>
					</input>
				<span style="width:13px;"/>
				<span class="styIRS1065DotLn" style="float:right;padding-top:2mm;">.........</span>
				</div>
				<div class="styLNRightNumBox" style="width:11.5mm; height:5.5mm; padding-top:2mm;">16p</div>
				<div class="styLNAmountBox" style="height:5.5mm;padding-top:2mm">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="TotalForeignTaxesAmt"/>
					</xsl:call-template>
				</div>

		<!-- Schedule K, Line 16q -->

				<div class="styIRS1065LNLeftLtrBoxTD" style="padding-top:1mm;">q</div>
				<div class="styIRS1065LNDesc" style="width:124.5mm;padding-top:1mm;">
				  Reduction in taxes available for credit (attach statement)
					<xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="ReductionInTaxesAvlblForCrAmt"/>
					</xsl:call-template>
				<span style="float:right;padding-top:1mm;">
					<span class="styIRS1065DotLn">...........</span>
				</span>
				</div>
				<div class="styLNRightNumBox" style="width:11.5mm;height:5.5mm;padding-top:2mm;">16q</div>
				<div class="styLNAmountBox" style="height:5.5mm;padding-top:2mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="ReductionInTaxesAvlblForCrAmt"/>
					</xsl:call-template>
				</div>

		<!-- Schedule K, Line 16r -->

			<div style="border-bottom:1px solid black;">
				<div class="styIRS1065LNLeftLtrBoxTD" style="height:4mm;">r</div>
				<div class="styIRS1065LNDesc" style="height:4mm;width:124.5mm;">Other foreign tax information (attach statement)
				<span style="float:right;padding-left:1px;">
					<span class="styIRS1065DotLn">...............</span>
				</span>
				</div>
				<div class="styLNRightNumBoxNBB" style="width:11.5mm;height:4mm;background-color:lightgrey;"/>
				<div class="styLNAmountBoxNBB" style="height:4mm;background-color:lightgrey;">
					<span style="width:2mm;"/>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template name="GenPart">
		<tr>
			<td class="styLNLeftLtrBox" style="width:5mm;font-size:7pt;vertical-align:top;">a</td>
			<td style="width:29mm;font-size:7pt;">General partners</td>
			<td class="styTableCellSmall" style="border-color:black;border-left-width:1px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="CorporateAmt"/>
				</xsl:call-template>
			</td>
			<td class="styTableCellSmall" style="border-color:black;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="IndividualActiveAmt"/>
				</xsl:call-template>
			</td>
			<td class="styTableCellSmall" style="border-color:black;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="IndividualPassiveAmt"/>
				</xsl:call-template>
			</td>
			<td class="styTableCellSmall" style="border-color:black;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="PartnershipAmt"/>
				</xsl:call-template>
			</td>
			<td class="styTableCellSmall" style="border-color:black;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="ExemptOrganizationAmt"/>
				</xsl:call-template>
			</td>
			<td class="styTableCellSmall" style="border-color:black;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="NomineeOtherAmt"/>
				</xsl:call-template>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="LtdPart">
		<tr>
			<td class="styLNLeftLtrBox" style="width:5mm;font-size:7pt;vertical-align:top;">
				<xsl:if test="position()=last()">
					<xsl:attribute name="style">width:5mm;font-size:7pt;vertical-align:top;border-bottom:1 solid black;
					</xsl:attribute>
				</xsl:if>
              b
            </td>
			<td style="width:29mm;font-size:7pt;">
				<xsl:if test="position()=last()">
					<xsl:attribute name="style">width:29mm;font-size:7pt;border-bottom:1 solid black;</xsl:attribute>
				</xsl:if>
              Limited partners
            </td>
			<td class="styTableCellSmall" style="border-color:black;border-left-width:1px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="CorporateAmt"/>
				</xsl:call-template>
			</td>
			<td class="styTableCellSmall" style="border-color:black;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="IndividualActiveAmt"/>
				</xsl:call-template>
			</td>
			<td class="styTableCellSmall" style="border-color:black;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="IndividualPassiveAmt"/>
				</xsl:call-template>
			</td>
			<td class="styTableCellSmall" style="border-color:black;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="PartnershipAmt"/>
				</xsl:call-template>
			</td>
			<td class="styTableCellSmall" style="border-color:black;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="ExemptOrganizationAmt"/>
				</xsl:call-template>
			</td>
			<td class="styTableCellSmall" style="border-color:black;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="NomineeOtherAmt"/>
				</xsl:call-template>
			</td>
		</tr>
	</xsl:template>
</xsl:stylesheet>