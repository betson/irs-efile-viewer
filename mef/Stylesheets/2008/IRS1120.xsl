<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1120Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form1120Data" select="$RtnDoc/IRS1120"/>
	<xsl:param name="Form1120ScheduleA" select="$RtnDoc/IRS1120/IRS1120ScheduleA"/>
	<xsl:param name="Form1120ScheduleC" select="$RtnDoc/IRS1120/IRS1120ScheduleC"/>
	<xsl:param name="Form1120ScheduleE" select="$RtnDoc/IRS1120/IRS1120ScheduleE"/>
	<xsl:param name="Form1120ScheduleJ" select="$RtnDoc/IRS1120/IRS1120ScheduleJ"/>
	<xsl:param name="Form1120ScheduleK" select="$RtnDoc/IRS1120/IRS1120ScheduleK"/>
	<xsl:param name="Form1120ScheduleL" select="$RtnDoc/IRS1120/IRS1120ScheduleL"/>
	<xsl:param name="Form1120ScheduleM1" select="$RtnDoc/IRS1120/IRS1120ScheduleM1"/>
	<xsl:param name="Form1120ScheduleM2" select="$RtnDoc/IRS1120/IRS1120ScheduleM2"/>
	<xsl:template match="/">
		<html lang="EN-US">
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form1120Data)"/>
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
				<meta name="Description" content="IRS Form 1120"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
			<!--		<xsl:if test="not($Print) or $Print=''">     -->
						<xsl:call-template name="IRS1120Style"/>
						<xsl:call-template name="AddOnStyle"/>
<!--				</xsl:if>      -->
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="IRS1120">
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;border-bottom-width:1px;">
						<div class="styFNBox" style="width:31mm;height:19mm;border-right-width:.5mm;">
      Form <span class="styFormNumber">1120</span>
							<br/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120Data"/>
							</xsl:call-template>
							<span style="width:3px;"/>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Form 1120, Top Left Margin - Section 1291 Interest Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1120Data/@section1291InterestIndicator"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Form 1120, Top Left Margin - Section 1291 Interest Amount</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1120Data/@section1291InterestAmount"/>
								<xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Form 1120, Top Left Margin - Section 1294 Interest Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1120Data/@section1294InterestIndicator"/>
								<xsl:with-param name="Style">padding-left:6mm;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Form 1120, Top Left Margin - Section 1294 Interest Amount</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1120Data/@section1294InterestAmount"/>
								<xsl:with-param name="Style">padding-left:9mm;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Form 1120, Top Left Margin - Section 501d Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1120Data/@section501dIndicator"/>
								<xsl:with-param name="Style">padding-left:12mm;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Form 1120, Top Left Margin - Subchapter T Cooperative Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1120Data/@subchapterTCoopIndicator"/>
								<xsl:with-param name="Style">padding-left:12mm;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Form 1120, Top left margin - Support Statement to Consolidated Return Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1120Data/@suprtStmtToCnsldtReturnInd"/>
								<xsl:with-param name="Style">padding-left:12mm;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Form 1120, Top left margin - SECTION 444 Election Terminated Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1120Data/@section444Indicator"/>
								<xsl:with-param name="Style">padding-left:12mm;</xsl:with-param>
							</xsl:call-template>
							<!--    <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form1120Data/section30191002ElectionInd"/>
              </xsl:call-template>
              <span style="width:3px;"/>    -->
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Form 1120, Top left margin - FILED PURSUANT TO SECTION 301.9100-2</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1120Data/@section30191002ElectionInd"/>
								<xsl:with-param name="Style">padding-left:12mm;</xsl:with-param>
							</xsl:call-template>
							<br/>
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service<span style="padding-left:2mm"></span>
							</span>
						</div>
						<div class="styFTBox" style="width:125mm;height:19mm;">
							<div class="styMainTitle" style="height:8mm;">U.S. Corporation Income Tax Return</div>
							<div class="styFST" style="height:5mm;font-size:7pt;margin-left:2mm;text-align:center;">
        For calendar year 
         <span style="width: 18mm;">
									<xsl:call-template name="PopulateReturnHeaderTaxYear"/>
								</span>
        or tax year beginning
        <span style="width: 18mm;border-bottom:1 solid black;">
									<!-- No need to send the parameters -->
									<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
								</span>,
        ending 
        <span style="width: 18mm;border-bottom:1 solid black;">
									<!-- No need to send the parameters -->
									<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
								</span>
								<br/>
								<span style="text-align:center;">
									<img src="{$ImagePath}/1120_Bullet_Md.gif" alt="MediumBullet"/> 
         See separate instructions.
                 </span>
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;height:19mm;;border-left-width:.5mm;">
							<div class="styOMB" style="height:2mm;">OMB No. 1545-0123</div>
							<div class="styTY" style="height:11mm;">20<span class="styTYColor">08</span>
							</div>
						</div>
					</div>
					<div style="width:187mm;float:left;clear:left;">
						<div style="width:31mm;height:25.5mm;float:left;clear:left;">
							<div class="styComType" style="width:33mm;border-bottom-width: 0px;border-top-width:1px;border-right-width:1px">
								<div class="styBoldText" style="height:3mm;width:4mm;float:left;clear:none;">A</div>
								<div class="styGenericDiv" style="height:3mm;width:26mm;font-weight:bold;">Check if:</div>
							</div>
							<div class="styComType" style="width:33mm;border-bottom:0px;border-right-width:1px">
								<div class="styBoldText" style="height:5mm;width:4mm;float:left;clear:none;">1a</div>
								<div class="styGenericDiv" style="height:5mm;width:26mm;">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form1120Data/IsConsolidatedReturn"/>
											<xsl:with-param name="BackupName">IRS1120IsConsolidatedReturn</xsl:with-param>
										</xsl:call-template>
                    Consolidated return (attach Form 851)
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Form 1120, Section A, Line 1a - Is Parent Return</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1120Data/IsParentReturn"/>
											<xsl:with-param name="Style">padding-left:9mm;</xsl:with-param>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Form 1120, Section A, Line 1a - Is Subsidiary Return</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1120Data/IsSubsidiaryReturn"/>
											<xsl:with-param name="Style">padding-left:9mm;</xsl:with-param>
										</xsl:call-template>
										<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120Data/IsConsolidatedReturn"/>
										</xsl:call-template>
									</label>
								</div>
								<div class="styGenericDiv">
									<br/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form1120Data/IsConsolidatedReturn"/>
											<xsl:with-param name="BackupName">IRS1120IsConsolidatedReturn</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
							</div>
							<div class="styComType" style="width:33mm;border-bottom:0px;border-right-width:1px;">
								<div class="styBoldText" style="height:5mm;width:4mm;float:left;clear:none;padding-left:1mm">b</div>
								<div class="styGenericDiv" style="height:5mm;width:26mm;">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form1120Data/LifeNonlifeConsolidatedReturn"/>
											<xsl:with-param name="BackupName">IRS1120IsConsolidatedReturn</xsl:with-param>
										</xsl:call-template>
          Life/nonlife consolidated return
          <!-- Form to Form Link -->
										<!-- xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form1120Data/LifeNonlifeConsolidatedReturn"/>            
          </xsl:call-template -->
									</label>
								</div>
								<div class="styGenericDiv">
									<br/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form1120Data/LifeNonlifeConsolidatedReturn"/>
											<xsl:with-param name="BackupName">IRS1120IsConsolidatedReturn</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
							</div>
							<div class="styComType" style="width:33mm;border-bottom:0px;border-right-width:1px">
								<div class="styBoldText" style="height:5mm;width:4mm;float:left;clear:none;border-right-width:1px">2</div>
								<div class="styGenericDiv" style="height:5mm;width:26mm;">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form1120Data/PersonalHoldingCompany"/>
											<xsl:with-param name="BackupName">IRS1120PersonalHoldingCompany</xsl:with-param>
										</xsl:call-template>
            Personal holding co. (attach Sch. PH)
          <!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120Data/PersonalHoldingCompany"/>
										</xsl:call-template>
									</label>
								</div>
								<div class="styGenericDiv">
									<br/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form1120Data/PersonalHoldingCompany"/>
											<xsl:with-param name="BackupName">IRS1120PersonalHoldingCompany</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
							</div>
							<div class="styComType" style="width:33mm;border-bottom:0px;border-right-width:1px">
								<div class="styBoldText" style="height:5.5mm;width:4mm;float:left;clear:none;">3</div>
								<div class="styGenericDiv" style="height:5.5mm;width:26mm;">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form1120Data/PersonalServiceCorporation"/>
											<xsl:with-param name="BackupName">IRS1120PersonalServiceCorporation</xsl:with-param>
										</xsl:call-template>
            Personal service corp. (see instructions)
          </label>
								</div>
								<div class="styGenericDiv">
									<br/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form1120Data/PersonalServiceCorporation"/>
											<xsl:with-param name="BackupName">IRS1120PersonalServiceCorporation</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
							</div>
						</div>
						<!-- return header address box -->
						<div class="styLblNameAddr" style="width:106mm;height:24mm;">
							<div class="styUseLbl" style="width:12mm;height:24mm;border-right-width:0px;">Use IRS label. Other-wise, print or type.</div>
							<div class="styNameAddr" style="width:92mm;height:8mm;border-left-width:1px;padding-left:1px;">
        Name
          <xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
								</xsl:call-template>
								<br/>
								<span class="stySmallText" style="padding-left:7.2mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">InCareOfName</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
							<div class="styNameAddr" style="width:92mm;height:8mm;border-left-width:1px;">
        Number, street, and room or suite no. If a P.O. box, see instructions.<br/>
								<span class="stySmallText" style="padding-left:2mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
							<div class="styNameAddr" style="border-bottom-width:0px;width:92mm;height:8mm;border-left-width:1px;">
        City or town, state, and ZIP code<br/>
								<span class="stySmallText" style="width:90mm;padding-left:2mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">Country</xsl:with-param>
										<xsl:with-param name="MainForm">true</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- Since this is a main form, we must check for and display an updated EIN.  To do this, we use the EINChanged parameter PopulateReturnHeaderFiler.-->
						<div class="styEINDateAssets" style="width:48mm;height:9mm;border-top-width:1px">
							<span class="styBoldText">B Employer identification number</span>
							<br/>
							<br/>
							<span class="styEINFld">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="EINChanged">true</xsl:with-param>
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<div class="styEINDateAssets" style="width:48mm;height:8mm;">
							<span class="styBoldText">C </span>Date incorporated<br/>
							<br/>
							<span class="styEINFld" style="text-align:center;padding-left:8mm;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$Form1120Data/DateIncorporated"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styEINDateAssets" style="width:48mm;height:8.5mm;border-bottom-width:1px;">
							<span class="styBoldText">D </span>Total assets (see instructions)<br/>
							<br/>
							<span style="text-align:right;padding-left:15mm;">
          $
          <xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120Data/TotalAssets"/>
								</xsl:call-template>
							</span>
						</div>
						<br/>
					</div>
					<!-- E -->
					<div class="styBB" style="width:187mm;border-bottom-width:.5mm">
						<div class="styComType" style="width:33mm;border-bottom:0px;border-right-width:1px">
							<div class="styBoldText" style="height:8.5mm;width:4mm;float:left;clear:none;">4</div>
							<div class="styGenericDiv" style="height:5mm;width:26mm;">
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1120Data/ScheduleM3Attached"/>
										<xsl:with-param name="BackupName">IRS1120ScheduleM3Attached</xsl:with-param>
									</xsl:call-template>
             Schedule M-3 attached
          <!-- Form to Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120Data/ScheduleM3Attached"/>
									</xsl:call-template>
								</label>
							</div>
							<div class="styGenericDiv">
								<br/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1120Data/ScheduleM3Attached"/>
										<xsl:with-param name="BackupName">IRS1120ScheduleM3Attached</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
						</div>
						<span class="styBoldText" style="width:5px;padding-left:3mm;padding-top:2mm">E</span>
    Check if: <span style="width:2px;"/>
						<span class="styBoldText" style="font-size:6pt">(1)</span>
						<span style="width:1px;"/>
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$Form1120Data/InitialReturn"/>
								<xsl:with-param name="BackupName">IRS1120InitialReturn</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$Form1120Data/InitialReturn"/>
								<xsl:with-param name="BackupName">IRS1120InitialReturn</xsl:with-param>
							</xsl:call-template>
							<span style="font-size:6pt">
         Initial return</span>
							<span style="width:2mm"/>
						</label>
						<!-- checkboxes -->
						<span style="width:2px"/>
						<span class="styBoldText" style="font-size:6pt">(2)</span>
						<span style="width:1px;"/>
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$Form1120Data/FinalReturn"/>
								<xsl:with-param name="BackupName">IRS1120FinalReturn</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$Form1120Data/FinalReturn"/>
								<xsl:with-param name="BackupName">IRS1120FinalReturn</xsl:with-param>
							</xsl:call-template>
							<span style="font-size:6pt">
         Final return</span>
							<span style="width:2mm"/>
						</label>
						<span style="width:2px"/>
						<span class="styBoldText" style="font-size:6pt">(3)</span>
						<span style="width:1px;"/>
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$Form1120Data/NameChange"/>
								<xsl:with-param name="BackupName">IRS1120NameChange</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$Form1120Data/NameChange"/>
								<xsl:with-param name="BackupName">IRS1120NameChange</xsl:with-param>
							</xsl:call-template>
							<span style="font-size:6pt">
         Name change</span>
							<span style="width:2mm"/>
						</label>
						<span style="width:2px"/>
						<span class="styBoldText" style="font-size:6pt">(4)</span>
						<span style="width:1px;"/>
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$Form1120Data/AddressChange"/>
								<xsl:with-param name="BackupName">IRS1120AddressChange</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$Form1120Data/AddressChange"/>
								<xsl:with-param name="BackupName">IRS1120AddressChange</xsl:with-param>
							</xsl:call-template>
							<span style="font-size:6pt">
         Address change</span>
							<span style="width:2mm"/>
						</label>
						<!-- ************************************************************************************************************  -->
						<!-- Amended Return -->
						<span style="width:2px"/>
						<span class="styBoldText" style="font-size:6pt">(5)</span>
						<span style="width:1px;"/>
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$Form1120Data/AmendedReturn"/>
								<xsl:with-param name="BackupName">IRS1120AmendedReturn</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$Form1120Data/AmendedReturn"/>
								<xsl:with-param name="BackupName">IRS1120AmendedReturn</xsl:with-param>
							</xsl:call-template>
							<span style="font-size:6pt">
         Amended Return</span>
							<span style="width:2mm"/>
						</label>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$Form1120Data/AmendedReturn"/>
						</xsl:call-template>
						<br/>
						<!-- Superseded Return -->
						<span style="width:18mm"/>
						<span class="styBoldText" style="font-size:6pt">(6)</span>
						<span style="width:1px;"/>
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$Form1120Data/SupersededReturn"/>
								<xsl:with-param name="BackupName">IRS1120SupersededReturn</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$Form1120Data/SupersededReturn"/>
								<xsl:with-param name="BackupName">IRS1120SupersededReturn</xsl:with-param>
							</xsl:call-template>
							<span style="font-size:6pt">
         Super seded Return</span>
							<span style="width:2mm"/>
						</label>
						<!-- ************************************************************************************************************  -->
					</div>
					<!--BEGIN Main Form Income Section-->
					<div class="styBB" style="width:187mm;border-bottom-width:.5mm">
						<div class="styIRS1120VTImageBox" style="height:50mm;padding-top:20mm;">
							<img src="{$ImagePath}/1120_Income.gif" alt="VerticalIncome"/>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">
								<span class="styBoldText" style="font-size:7pt;padding-left: 1.25mm">1a</span>
							</div>
							<div class="styLNDesc" style="width:26mm;height:4mm;">
								<span class="styArialText">Gross receipts or sales</span>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1120Data/GrossReceiptsOrSales"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="width:30mm;border-bottom-width:1px;border-right-width:1px;height:4mm;">
								<span style="text-align:right;font-family:arial;font-size:8pt;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120Data/GrossReceiptsOrSales"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styLNDesc" style="width:35mm;height:4mm;padding-left:2mm;">
								<span class="styBoldText" style="width:3mm;float:left;clear:none;">b</span>
								<span class="styArialText" style="float:left;clear:none;">Less returns and allowances</span>
							</div>
							<div class="styLNAmountBox" style="width:28mm;text-align:right;border-bottom-width:1px;border-right-width:1px;height:4mm;font-family:arial;font-size:8pt;">
								<span style="text-align:right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120Data/ReturnsAndAllowances"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styLNDesc" style="width:13.25mm;height:4mm;padding-left:2mm;">
								<span class="styBoldText">c</span> Bal <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="MidSizeBullet"/>
							</div>
							<div class="styLNRightNumBox" style="height:5mm;">1c</div>
							<div class="styLNAmountBox" style="height:5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120Data/GrossReceiptsOrSalesBalance"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line 2 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">2</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">Cost of goods sold (Schedule A, line 8)
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
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
        </span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">2</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120Data/CostOfGoodsSold"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">3</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">Gross profit. Subtract line 2 from line 1c
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
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
        </span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">3</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120Data/GrossProfit"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">4</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">Dividends (Schedule C, line 19)
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
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
        </span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">4</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120Data/Dividends"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line 5 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">5</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">Interest
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
          <span style="width:16px"/>.
          <span style="width:16px"/>.
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
							<div class="styLNRightNumBox" style="height:4.5mm;">5</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120Data/InterestIncome"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line 6 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">6</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">Gross rents
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
          <span style="width:16px"/>.
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
							<div class="styLNRightNumBox" style="height:4.5mm;">6</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120Data/GrossRents"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line 7 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">7</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">Gross royalties
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
          <span style="width:16px"/>.
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
							<div class="styLNRightNumBox" style="height:4.5mm;">7</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120Data/GrossRoyalties"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line 8 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">8</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">Capital gain net income (attach Schedule D (Form 1120))
        <span style="width:2px;"/>
								<!-- Form to Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1120Data/CapitalGainNetIncome"/>
								</xsl:call-template>
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
        </span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">8</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120Data/CapitalGainNetIncome"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">9</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">Net gain or (loss) from Form 4797, Part II, line 17
        (attach Form 4797)
        <span style="width:2px;"/>
								<!-- Form to Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1120Data/NetGainLoss"/>
								</xsl:call-template>
								<span style="width:1mm;"/>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 9 - Form 4684 Indicator</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1120Data/NetGainLoss/@form4684Indicator"/>
								</xsl:call-template>
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
        </span>
							</div>
							<!-- line 9 -->
							<div class="styLNRightNumBox" style="height:4.5mm;">9</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120Data/NetGainLoss"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line 10 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">10</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">Other income (see instructions&#151;attach schedule)
        <span style="width:2px;"/>
								<!-- Form to Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1120Data/OtherIncome"/>
								</xsl:call-template>
								<span style="width:1mm;"/>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 10 - Other Income Item</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1120Data/OtherIncome/@otherIncomeItem"/>
								</xsl:call-template>
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
							<!-- line 10 -->
							<div class="styLNRightNumBox" style="height:4.5mm;">10</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120Data/OtherIncome"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line 11 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">11</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span class="styBoldText">Total income.</span>
        Add lines 3 through 10
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
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>
								</span>
								<img src="{$ImagePath}/1120_Bullet_Md.gif" alt="MediumBullet"/>
							</div>
							<!-- line 11 -->
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;">11</div>
							<div class="styLNAmountBoxNBB" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120Data/TotalIncome"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--END Main Form Income Section-->
					<!--BEGIN Main Form Deduction Section-->
					<!-- line 12 -->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS1120VTImageBox" style="height:85.5mm;padding-top:10mm;">
							<img src="{$ImagePath}/1120_Deductions.gif" alt="VertDeductions"/>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">12</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">Compensation of officers (Schedule E, line 4)
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
          <span style="width:16px"/>.
          <span style="width:16px"/>.
           <span style="width:16px"/>.           
        </span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">12</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120Data/CompensationOfOfficers"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">13</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">Salaries and wages (less employment credits)
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
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
        </span>
							</div>
							<!-- line 13 -->
							<div class="styLNRightNumBox" style="height:4.5mm;">13</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120Data/SalariesAndWages"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line 14 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">14</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">Repairs and maintenance
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
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
        </span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">14</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120Data/RepairsAndMaintenance"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line 15 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">15</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">Bad debts
        <span style="width:2px;"/>
								<!-- Form to Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1120Data/BadDebts"/>
								</xsl:call-template>
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
          <span style="width:16px"/>.
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
							<div class="styLNRightNumBox" style="height:4.5mm;">15</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120Data/BadDebts"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line 16 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">16</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">Rents
        <span style="width:2px;"/>
								<!-- Form to Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1120Data/Rents"/>
								</xsl:call-template>
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
          <span style="width:16px"/>.
          <span style="width:16px"/>.
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
							<div class="styLNRightNumBox" style="height:4.5mm;">16</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120Data/Rents"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">17</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">Taxes and licenses
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
							<div class="styLNRightNumBox" style="height:4.5mm;">17</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120Data/TaxesAndLicenses"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">18</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">Interest
        <span style="width:2px;"/>
								<!-- Form to Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1120Data/InterestDeductions"/>
								</xsl:call-template>
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
							<div class="styLNRightNumBox" style="height:4.5mm;">18</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120Data/InterestDeductions"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">19</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">Charitable contributions 
        <span style="width:2px;"/>
								<!-- Form to Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1120Data/CharitableContributions"/>
								</xsl:call-template>
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
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
        </span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">19</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120Data/CharitableContributions"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 20 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">20</div>
							<div class="styLNDesc" style="width:132mm;height:4mm; font-size:6pt;">
           Depreciation from Form 4562 not claimed on Schedule A or elsewhere on return (attach Form 4562)
            <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1120Data/Depreciation"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">20</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120Data/Depreciation"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 21 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">21</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">Depletion
        <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1120Data/Depletion"/>
								</xsl:call-template>
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
          <span style="width:16px"/>.
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
							<div class="styLNRightNumBox" style="height:4.5mm;">21</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120Data/Depletion"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">22</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">Advertising
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
          <span style="width:16px"/>.
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
							<div class="styLNRightNumBox" style="height:4.5mm;">22</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120Data/Advertising"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">23</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">Pension, profit-sharing, etc., plans
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
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
        </span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">23</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120Data/PensionProfitSharingPlans"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">24</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">Employee benefit programs
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
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
        </span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">24</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120Data/EmployeeBenefitPrograms"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- new line 25 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">25</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">Domestic production activities deduction (attach Form 8903)
             <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1120Data/DomProdActivitiesDeductions"/>
								</xsl:call-template>
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
        </span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">25</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120Data/DomProdActivitiesDeductions"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">26</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">Other deductions (attach schedule)
        <span style="width:2px;"/>
								<!-- Form to Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1120Data/OtherDeductions"/>
								</xsl:call-template>
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
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
        </span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">26</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120Data/OtherDeductions"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">27</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span class="styBoldText">Total deductions.</span>
        Add lines 12 through 26
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
          <span style="width:16px"/>.
          <span style="width:16px"/>.
        </span>
								<span style="width:12px"/>
								<img src="{$ImagePath}/1120_Bullet_Md.gif" alt="MediumBullet"/>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">27</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120Data/TotalDeductions"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">28</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;padding-top:1mm;padding-bottom:0mm;font-size:6pt;">
        Taxable income before net operating loss deduction and special deductions.
        Subtract line 27 from line 11
        <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1120Data/TaxableIncomeBeforeNOL"/>
								</xsl:call-template>
								<span style="width:2px;"/>
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:16px"/>.
          <span style="width:16px"/>.
        </span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">28</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120Data/TaxableIncomeBeforeNOL"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4.5mm;">29</div>
							<div class="styLNDesc" style="width:8mm;height:4.5mm;">
								<span class="styBoldText">Less:</span>
							</div>
							<div class="styLNDesc" style="width:84.25mm;height:4.5mm;">
								<span class="styBoldText">a</span>
        Net operating loss deduction (see instructions)
        <span style="width:2px;"/>
								<!-- Form to Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1120Data/NetOperatingLossDeduction"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">29a</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120Data/NetOperatingLossDeduction"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"/>
							<div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftLtrBox" style="height:4mm;"/>
							<div class="styLNDesc" style="width:8mm;height:4.5mm;"/>
							<div class="styLNDesc" style="width:84.25mm;height:4mm;">
								<span class="styBoldText">b</span>
        Special deductions (Schedule C, line 20)
        <!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
        </span>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;">29b</div>
							<div class="styLNAmountBoxNBB" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120Data/SpecialDeductions"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;">29c</div>
							<div class="styLNAmountBoxNBB" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120Data/TotalNOLAndSpecialDeductions"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--END Main Form Deductions Section-->
					<!--BEGIN Main Form Tax and Payment Section-->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS1120VTImageBox" style="height:72.2mm;padding-top:17mm;">
							<img src="{$ImagePath}/1120_TaxAndPayment.gif" alt="VertTaxAndPayments"/>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">30</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span class="styBoldText" style="font-size:7pt;">Taxable income.</span>
        Subtract line 29c from line 28 (see instructions)
                <xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 30 - CCF Indicator</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1120Data/TaxableIncome/@cCFIndicator"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 30 - CCF Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1120Data/TaxableIncome/@cCFAmount"/>
									<xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
								</xsl:call-template>
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
							<div class="styLNRightNumBox" style="height:4.5mm;">30</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120Data/TaxableIncome"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">31</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span class="styBoldText">Total tax.</span>
        (Schedule J, line 10)
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
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
            <span style="width:16px"/>.
      </span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">31</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120Data/TotalTax"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:7.5mm;">32 a</div>
							<div class="styLNDesc" style="width:46mm;height:7.5mm;">2007 overpayment credited to 2008
          <span class="styBoldText">
									<span style="width:16px"/>.
         <span style="width:16px"/>.
         <span style="width:16px"/>.
         <span style="width:16px"/>.
         <span style="width:16px"/>.
         <span style="width:16px"/>.
      </span>
							</div>
							<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3mm;">32a</div>
							<div class="styLNAmountBox" style="width:28mm;height:7.5mm;padding-top:3mm;border-right-width:1px;font-size:6pt;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120Data/PriorYearOverpaymentCredit"/>
								</xsl:call-template>
							</div>
							<div class="styShadingCell" style="width:50mm;height:7.5mm;border-left-width:0px;"/>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7.5mm;"/>
							<div class="styLNAmountBoxNBB" style="height:7.5mm;"/>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftLtrBox" style="height:8.5mm;padding-left:5mm;">b</div>
							<div class="styLNDesc" style="width:46mm;height:8.5mm;font-size:7pt;">2008 estimated tax payments
        <span style="width:2px;"/>
								<!-- Form to Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1120Data/EstimatedTaxPayments"/>
								</xsl:call-template>
								<span style="width:1mm;"/>
								<br/>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 32b - Beneficiary Of Trust Indicator</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1120Data/EstimatedTaxPayments/@beneficiaryOfTrustIndicator"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 32b - Beneficiary Of Trust Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1120Data/EstimatedTaxPayments/@beneficiaryOfTrustAmount"/>
									<xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 32b - Form 8816 Indicator</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1120Data/EstimatedTaxPayments/@f8816Indicator"/>
									<xsl:with-param name="Style">padding-left:10mm;</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 32b - Form 8816 Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1120Data/EstimatedTaxPayments/@f8816Amount"/>
									<xsl:with-param name="Style">padding-left:14mm;</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 32b - Section 847 Deduction Indicator</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1120Data/EstimatedTaxPayments/@section847DeductionIndicator"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:8.5mm;padding-top:4.5mm;">32b</div>
							<div class="styLNAmountBox" style="height:8.5mm;border-right-width:1px;width:28mm;font-size:6pt;padding-top:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120Data/EstimatedTaxPayments"/>
								</xsl:call-template>
							</div>
							<div class="styShadingCell" style="width:50mm;height:8.5mm;border-left-width:0px;"/>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8.5mm;"/>
							<div class="styLNAmountBoxNBB" style="height:8.5mm;"/>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftLtrBox" style="height:7.5mm;padding-left:5mm;">c</div>
							<div class="styLNDesc" style="width:46mm;height:7.5mm;font-size:7pt;">2008 refund applied for on Form 4466
                    <span class="styBoldText">
									<span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
      </span>
								<!-- line 32c -->
							</div>
							<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">32c</div>
							<div class="styLNAmountBox" style="height:7.5mm;border-right-width:1px;width:28mm;font-size:6pt;padding-top:4mm;">
								<xsl:call-template name="PopulateNegativeNumber">
									<xsl:with-param name="TargetNode" select="$Form1120Data/RefundAppliedFor"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="width:10mm;height:8mm;font-weight:bold;font-size:6pt;padding-left:1mm;padding-top:4mm;">d Bal <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">32d</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120Data/TaxPaymentBalance"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8mm;"/>
							<div class="styLNAmountBoxNBB" style="height:8mm;"/>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftLtrBox" style="height:4.5mm;padding-left:5mm;">e</div>
							<div class="styLNDesc" style="width:92mm;height:4.5mm;">Tax deposited with Form 7004
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
       </span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">32e</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120Data/TaxDepositedWithForm7004"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"/>
							<div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
						</div>
						<!-- line 32 f -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftLtrBox" style="height:4.5mm;padding-left:5mm;">f</div>
							<div class="styLNDesc" style="width:38mm;height:4.5mm;">
                Credits 
                <span style="width:5.5mm;"/>
								<span style="font-weight:bold">(1)</span> 
                Form 2439
            </div>
							<div class="styUnderlineAmount">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120Data/UndistributedCapitalGainsCr"/>
								</xsl:call-template>
							</div>
							<div class="styGenericDiv" style="width:22mm;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1120Data/UndistributedCapitalGainsCr"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 32f(1) - Backup Withholding Indicator</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1120Data/UndistributedCapitalGainsCr/@backupWithholdingIndicator"/>
									<xsl:with-param name="Style">padding-left:4mm;</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 32f(1) - Backup Withholding Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1120Data/UndistributedCapitalGainsCr/@backupWithholdingAmount"/>
									<xsl:with-param name="Style">padding-left:2mm;</xsl:with-param>
								</xsl:call-template>
								<span class="styBoldText">
									<span style="width:16px"/>.
                  <span style="width:16px"/>.
                </span>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;width:8.1mm;border-right: 1 solid black"/>
							<div class="styGenericDiv" style="width:31.7mm;height:4.5mm;"/>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"/>
							<div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
							<div style="width:181mm;float:right;clear:none;height:4.5mm;">
								<div class="styGenericDiv" style="width:24mm;"/>
								<div class="styLNDesc" style="width:22mm;height:4.5mm;">
									<span style="font-weight:bold;">(2)</span> Form 4136
            </div>
								<div class="styUnderlineAmount">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120Data/CreditForFederalTaxOnFuels"/>
									</xsl:call-template>
								</div>
								<div class="styGenericDiv" style="height:4.5mm;font-weight:bold;width:22mm;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120Data/CreditForFederalTaxOnFuels"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 32f(2) - Ozone Depleting Chemical Indicator</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1120Data/CreditForFederalTaxOnFuels/@ozoneDepletingChemicalsInd"/>
									</xsl:call-template>
									<span style="width:8px"/>.<span style="width:8px"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120Data/TotalCredits"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 32f - Other Refundable Credits Indicator</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1120Data/TotalCredits/@otherRefundableCreditsInd"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 32f - Other Refundable Credits Amount</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1120Data/TotalCredits/@otherRefundableCreditsAmount"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;">32f</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120Data/TotalCredits"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBoxNBB" style="width:8.2mm;height:4.5mm;border-right-width:1px;background-color:lightgrey;"></div>
							</div>
						</div>
						<!-- Line 32g -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftLtrBox" style="height:4.5mm;padding-left:5mm;">g</div>
							<div class="styLNDesc" style="width:92mm;height:4.5mm;">Refundable credits from Form 3800, line
                                   19c, and Form 8827, line <br/>8c
                                             <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1120Data/RefundableCredits"/>
								</xsl:call-template>
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
                   <span style="width:16px"/>.
                                              <span style="width:16px"/>.
                                              <span style="width:16px"/>.
                                               <span style="width:16px"/>.
                                        </span>
							</div>
							<div class="styLNRightNumBox" style="height:6.5mm;padding-top:4mm;">32g</div>
							<div class="styLNAmountBox" style="height:6.5mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120Data/RefundableCredits"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:6.5mm;padding-top:4mm;">32h</div>
								<div class="styLNAmountBox" style="height:6.5mm;padding-top:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120Data/TotalPayments"/>
									</xsl:call-template>
								</div>
						</div>
						<!-- Line 33 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">33</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
        Estimated tax penalty (see instructions). 
        <label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1120Data/Form2220Attached"/>
										<xsl:with-param name="BackupName">IRS1120Form2220Attached</xsl:with-param>
									</xsl:call-template>
          Check if Form 2220 is attached
          <span style="width:2px;"/>
									<!-- Form to Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120Data/Form2220Attached"/>
									</xsl:call-template>
								</label>
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
        </span>
								<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
								<span style="width:8px"/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1120Data/Form2220Attached"/>
										<xsl:with-param name="BackupName">IRS1120Form2220Attached</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">33</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120Data/EstimatedTaxPenalty"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">34</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span class="styBoldText">Amount owed.</span> If line 32h is smaller than the total of lines
        31 and 33, enter amount owed.
        <!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:16px"/>.
          <span style="width:16px"/>.
        </span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">34</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120Data/BalanceDue"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">35</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span class="styBoldText">Overpayment.</span> If line 32h is larger than the total of lines
        31 and 33, enter amount overpaid
        <span class="styBoldText">
									<span style="width:16px"/>.
          <span style="width:16px"/>.
       </span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">35</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120Data/OverpaymentSection/OverpaymentAmount"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">36</div>
							<div class="styLNDesc" style="width:86mm;height:4mm;">
								<span style="font-size:6pt;">
          Enter amount of line 35 you want:
          <!--span style="width:17px;vertical-align:top;"-->
									<!-- Form to Form Link -->
								</span>
								<span class="styBoldText">Credited to 2009 estimated tax</span>
								<span style="width:2px"/>
				<!--				<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" 
								select="$Form1120Data/OverpaymentSection/Refund"/>
							</xsl:call-template>      -->

								<!--/span-->
								<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
							</div>
							<div class="styGenericDiv" style="width:28mm;height:4mm;font-size:6pt;padding-top:3px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120Data/OverpaymentSection/CreditElect"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="width:18mm;height:4mm;font-size:6pt;">
								<span class="styBoldText">Refunded</span>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1120Data/OverpaymentSection/Refund"/>
								</xsl:call-template>
								<span style="width:4px"/>
								<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;">36</div>
							<div class="styLNAmountBoxNBB" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120Data/OverpaymentSection/Refund"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--END Main Form Tax and Payment Section-->
					<br class="pageEnd"/>
					<!-- BEGIN Signature Section -->
					<!-- Implementing the signature section as a table -->
					<table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:6pt;">
						<tr>
							<td rowspan="3" style="width:10mm;font-size: 11pt;font-weight:bold;border-right:1 solid black;border-bottom:1 solid black;">Sign Here</td>
							<td colspan="6" style="padding-left:1mm;padding-bottom:1mm;">Under penalties of perjury, I declare that I have examined this return, including accompanying schedules and statements, and to the best of my knowledge and belief, it is true, correct, and complete. Declaration of preparer (other than taxpayer) is based on all information of which preparer has any knowledge. </td>
						</tr>
						<tr>
							<td rowspan="2" style="border-bottom:1 solid black;padding-left:1mm;">
								<img src="{$ImagePath}/1120_Bullet_Lg.gif" alt="LargeBullet"/>
							</td>
							<td style="width:52mm;border-right:1 solid black;border-bottom:1 solid black;vertical-align:bottom;">
								<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">TaxpayerPIN</xsl:with-param>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<td style="width:20mm;border-bottom:1 solid black;vertical-align:bottom;padding-left:.5mm;">
								<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
								</xsl:call-template>
							</td>
							<td rowspan="2" style="border-bottom:1 solid black;padding-left:1mm;">
								<img src="{$ImagePath}/1120_Bullet_Lg.gif" alt="LargeBullet"/>
							</td>
							<td style="width:60mm;border-bottom:1 solid black;vertical-align:bottom;">
								<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">Title</xsl:with-param>
								</xsl:call-template>
							</td>
							<td rowspan="2" style="width:40mm;border-bottom:1 solid black;padding-bottom:1mm;">
								<div class="styGenericDiv" style="width:2px;"/>
								<div style="border-right:3 solid black;border-left:3 solid black;border-bottom:3 solid black;border-top:3 solid black;float:right;" class="styGenericDiv">    
    May the IRS discuss this return<br/> with the preparer shown below <br/>(see instructions)?
      <input class="styCkbox" type="checkbox" name="Checkbox" id="dummyidyes" style="width:3mm;">
										<xsl:call-template name="PopulateReturnHeaderOfficer">
											<xsl:with-param name="TargetNode">AuthorizeThirdPartyYesCheckbox</xsl:with-param>
											<xsl:with-param name="BackupName">ReturnHeaderMayIRSDiscussReturnWithPrep</xsl:with-param>
										</xsl:call-template>
									</input>
									<span class="styBoldText">
										<label for="dummyidyes">
											<xsl:call-template name="PopulateReturnHeaderOfficer">
												<xsl:with-param name="TargetNode">AuthorizeThirdPartyYesLabel</xsl:with-param>
												<xsl:with-param name="BackupName">ReturnHeaderMayIRSDiscussReturnWithPrep</xsl:with-param>
											</xsl:call-template>
          Yes
        </label>
									</span>
									<input class="styCkbox" type="checkbox" name="Checkbox" id="dummyidno" style="width:2.5mm;">
										<xsl:call-template name="PopulateReturnHeaderOfficer">
											<xsl:with-param name="TargetNode">AuthorizeThirdPartyNoCheckbox</xsl:with-param>
											<xsl:with-param name="BackupName">ReturnHeaderMayIRSDiscussReturnWithPrep</xsl:with-param>
										</xsl:call-template>
									</input>
									<span class="styBoldText">
										<label for="dummyidno">
											<xsl:call-template name="PopulateReturnHeaderOfficer">
												<xsl:with-param name="TargetNode">AuthorizeThirdPartyNoLabel</xsl:with-param>
												<xsl:with-param name="BackupName">ReturnHeaderMayIRSDiscussReturnWithPrep</xsl:with-param>
											</xsl:call-template>
          No
        </label>
									</span>
								</div>
							</td>
						</tr>
						<tr>
							<td style="border-bottom:1 solid black;vertical-align:top;">Signature of officer      </td>
							<td style="border-bottom:1 solid black;vertical-align:top;">Date</td>
							<td style="border-bottom:1 solid black;vertical-align:top;">Title</td>
						</tr>
					</table>
					<!-- END Signature Section -->
					<!-- BEGIN PREPARER SIGNATURE SECTION -->
					<!-- Implementing the Preparer section in table -->
					<table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:6pt;border-color:black;;border-bottom:1 solid black;">
						<tr>
							<td rowspan="3" style="width:18mm;font-size:10pt;font-weight:bold;font-family:'arial narrow';border-right:1 solid black;vertical-align:top;padding-top:5mm;border-bottom:1 solid black;">Paid Preparer's Use Only</td>
							<td style="width:32mm;border-bottom:1 solid black;">
								<span style="width:13mm;padding-left:1mm;" class="styGenericDiv">Preparer's <br/>signature</span>
								<span class="styGenericDiv" style="border:0 solid red;">
									<img src="{$ImagePath}/1120_Bullet_Lg.gif" align="middle" alt="Big Right Arrow" border="0"/>
								</span>
							</td>
							<td style="width:43mm;border-right:1 solid black;border-bottom:1 solid black;">
								<span style="width:2px;"/>
							</td>
							<td style="width:30mm;border-right:1 solid black;border-bottom:1 solid black;padding-left:1mm;">
        Date <br/>
								<span style="text-align:center; padding-left:7mm;">
									<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">DatePrepared</xsl:with-param>
									</xsl:call-template>
								</span>
							</td>
							<td style="width:35mm;border-right:1 solid black;border-bottom:1 solid black;padding-left:1mm;vertical-align:bottom;padding-bottom:.5mm;">
								<nobr>
									<label for="dummyid1">
										<xsl:call-template name="PopulateReturnHeaderPreparer">
											<xsl:with-param name="TargetNode">SelfEmployedLabel</xsl:with-param>
											<xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
										</xsl:call-template>Check if <br/> self-employed
          </label>
								</nobr>
								<input class="styCkbox" type="checkbox" id="dummyid1" style="width:4mm;">
									<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">SelfEmployedCheckbox</xsl:with-param>
										<xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
									</xsl:call-template>
								</input>
							</td>
							<td style="width:35mm;border-bottom:1 solid black;padding-left:1mm;">Preparer's SSN or PTIN
        <br/>
								<span style="text-align:center;padding-left:10mm;">
									<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">SSN</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">PTIN</xsl:with-param>
									</xsl:call-template>
								</span>
							</td>
						</tr>
						<tr>
							<td rowspan="2" colspan="1" style="border-bottom:1 solid black;padding-left:.5mm;">
								<span class="styGenericDiv" style="padding-right:.5mm;">Firm's name (or <br/>yours if self-employed),<br/> address, and ZIP code</span>
								<span class="styGenericDiv" style="">
									<img src="{$ImagePath}/1120_Bullet_Lg.gif" align="middle" alt="Big Right Arrow" border="0"/>
								</span>
							</td>
							<td colspan="3" style="border-right:1 solid black;border-bottom:1 solid black;padding-left:.5mm;">
								<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
								</xsl:call-template>
							</td>
							<td style="border-bottom:1 solid black;padding-left:1mm;">EIN                     
        <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</td>
						</tr>
						<tr>
							<td colspan="3" style="border-bottom:1 solid black;border-right:1 solid black;padding-left:.5mm;">
								<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">Country</xsl:with-param>
								</xsl:call-template>
							</td>
							<td style="border-bottom:1 solid black;padding-left:1mm;"> Phone no. 
        <xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">Phone</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<!-- END PREPARER SIGNATURE SECTION -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:left;">
							<span class="styBoldText">For Privacy Act and Paperwork Reduction Act Notice, see separate instructions.</span>
							<span style="width:13mm;"/>                        
      Cat. No. 11450Q 
    </div>
						<div style="float:right;">
							<span style="width:40px;"/>  
      Form <span class="styBoldText" style="font-size:8pt;">1120</span> (2008)
    </div>
					</div>
					<!-- END Page Break and Footer-->
					<!--Begin Page 2 -->
					<!-- Page Header -->
					<div class="styBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">Form 1120 (2008)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
						</div>
					</div>
					<!-- END Page Header -->
					<!-- BEGIN Schedule A Title -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:23mm;">Schedule A</div>
						<div class="styPartDesc" style="width:164mm;">Cost of Goods Sold <span class="styNormalText">(see instructions)</span>
						</div>
					</div>
					<!-- END Schedule A Title -->
					<!-- BEGIN Schedule A Line Items -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">1</div>
						<div class="styLNDesc" style="height:4mm;">Inventory at beginning of year
      <span style="width:2px;"/>
							<!-- Form to Form Link -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleA/InventoryAtBeginningOfYear"/>
							</xsl:call-template>
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
        <span style="width:16px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
      </span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">1</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleA/InventoryAtBeginningOfYear"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">2</div>
						<div class="styLNDesc" style="height:4mm;">Purchases
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
        <span style="width:16px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
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
						<div class="styLNRightNumBox" style="height:4mm;">2</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleA/Purchases"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">3</div>
						<div class="styLNDesc" style="height:4mm;">Cost of labor
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
        <span style="width:16px"/>.
        <span style="width:16px"/>.
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
						<div class="styLNRightNumBox" style="height:4mm;">3</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleA/CostOfLabor"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">4</div>
						<div class="styLNDesc" style="height:4mm;">Additional section 263A costs (attach schedule)
      <span style="width:2px;"/>
							<!-- Form to Form Link -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleA/AdditionalSection263ACosts"/>
							</xsl:call-template>
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
        <span style="width:16px"/>.
        <span style="width:16px"/>.
      </span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">4</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleA/AdditionalSection263ACosts"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">5</div>
						<div class="styLNDesc" style="height:4mm;">Other costs (attach schedule)
      <span style="width:2px;"/>
							<!-- Form to Form Link -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleA/OtherCosts"/>
							</xsl:call-template>
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
        <span style="width:16px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
      </span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">5</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleA/OtherCosts"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">6</div>
						<div class="styLNDesc" style="height:4mm;">
							<span class="styBoldText">Total.</span> Add lines 1 through 5
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
						<div class="styLNRightNumBox" style="height:4mm;">6</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleA/TotalCosts"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">7</div>
						<div class="styLNDesc" style="height:4mm;">Inventory at end of year
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
						<div class="styLNRightNumBox" style="height:4mm;">7</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleA/InventoryAtEndOfYear"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">8</div>
						<div class="styLNDesc" style="height:4mm;">
							<span class="styBoldText">Cost of goods sold.</span> Subtract line 7 from line 6.
      Enter here and on page 1, line 2 
      <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
      </span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">8</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleA/CostOfGoodsSold"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:1.5mm;">9a</div>
						<div class="styLNDesc" style="width:178mm;height:4.5mm;padding-top:1.5mm;">Check all methods used for valuing closing inventory:
    </div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;"/>
						<div class="styLNDesc" style="width:178mm;height:4.5mm;vertical-align:baseline;">
							<i>
      (i)</i>
							<input type="checkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleA/CostAsDescribedInSection14713"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleACostAsDescribedInSection14713</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleA/CostAsDescribedInSection14713"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleACostAsDescribedInSection14713</xsl:with-param>
								</xsl:call-template>
         Cost
       </label>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;"/>
						<div class="styLNDesc" style="width:178mm;height:4.5mm;vertical-align:baseline;">
							<i>
      (ii)</i>
							<input type="checkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleA/LowerOfCostOrMrktAsInSect14714"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleALowerOfCostOrMrktAsInSect14714</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleA/LowerOfCostOrMrktAsInSect14714"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleALowerOfCostOrMrktAsInSect14714</xsl:with-param>
								</xsl:call-template>
        Lower of cost or market
      </label>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;"/>
						<div class="styLNDesc" style="width:91mm;height:4.5mm;vertical-align:baseline;">
							<i>
      (iii)</i>
							<input type="checkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleA/OtherMethodUsedBox"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleAOtherMethodUsedBox</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleA/OtherMethodUsedBox"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleAOtherMethodUsedBox</xsl:with-param>
								</xsl:call-template>
        Other (Specify method used and attach explanation.)
      </label>
							<span style="width:2px;"/>
							<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
							<span style="width:2px;"/>
							<!-- Form to Form Link -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleA/OtherMethodUsedBox"/>
							</xsl:call-template>
						</div>
						<div class="styBB" style="width:87mm;height:4.5mm;clear:none">
							<span style="width:3px;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleA/OtherMethodUsedBox/@otherMethodUsed"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 9b -->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;padding-top:1mm;">b</div>
						<div style="float:left;width:68mm;">
							<div style="height:4.5mm;padding-top:1mm;">
								<label for="SubnormalGoodsCheck">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleA/SubnormalGoods"/>
										<xsl:with-param name="BackupName">IRS1120ScheduleASubnormalGoods</xsl:with-param>
									</xsl:call-template>Check if there was a writedown of subnormal goods
     </label>
							</div>
						</div>
						<div style="float:right;padding-top:1mm;">
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
         <span style="width:16px"/>.
         <span style="width:16px"/>.
         <span style="width:16px"/>.
          <span style="width:16px;"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
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
							<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
							<span style="width:7px"/>
							<input class="styCkBox" type="checkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleA/SubnormalGoods"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleASubnormalGoods</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;padding-top:1mm;">c</div>
						<div style="float:left;width:145mm;">
							<div style="height:4.5mm;padding-top:1mm;">
								<label for="LIFOCheck">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleA/LIFOAdopted"/>
										<xsl:with-param name="BackupName">IRS1120ScheduleALIFOAdopted</xsl:with-param>
									</xsl:call-template>
        Check if the LIFO inventory method was adopted this tax year for any goods (if checked, attach Form 970)
      </label>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleA/LIFOAdopted"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="float:right;padding-top:1;">
							<!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
         <span style="width:16px"/>.
         <span style="width:16px"/>.
         <span style="width:16px"/>.
       </span>
							<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
							<span style="width:7px"/>
							<input class="styCkBox" type="checkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleA/LIFOAdopted"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleALIFOAdopted</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:7mm;">d</div>
						<div class="styLNDesc" style="height:7mm;">
      If the LIFO inventory method was used for this tax year, enter percentage
      (or amounts) of closing inventory computed under LIFO
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
        <span style="width:16px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
      </span>
						</div>
						<div class="styGenericDiv" style="width:35mm;height:3mm;"/>
						<div class="styLNRightNumBox" style="height:4mm;">9d</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:choose>
								<xsl:when test="$Form1120ScheduleA/LIFOClosingInventoryPercent">
									<xsl:call-template name="PopulatePercent">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleA/LIFOClosingInventoryPercent"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:when test="$Form1120ScheduleA/LIFOClosingInventoryAmount">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleA/LIFOClosingInventoryAmount"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise/>
							</xsl:choose>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;padding-top:1.5mm;">e</div>
						<div class="styLNDesc" style="width:150mm;height:4.5mm;padding-top:1.5mm;">
      If property is produced or acquired for resale, do the rules of section 263A apply to the corporation?
       <span class="styBoldText">
								<span style="width:15px"/>.
        <span style="width:15px"/>.
         <span style="width:15px"/>.
     </span>
						</div>
						<div class="styLNDesc" style="width:13mm;height:4.5mm;padding-top:1.5mm;text-align:right;">
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleA/Section263ARulesApply"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox" name="Checkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleA/Section263ARulesApply"/>
										<xsl:with-param name="BackupName">IRS1120ScheduleASection263ARulesApply</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleA/Section263ARulesApply"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleASection263ARulesApply</xsl:with-param>
								</xsl:call-template>
          Yes
        </label>
						</div>
						<div class="styLNDesc" style="width:15mm;height:4.5mm;padding-top:1.5mm;text-align:right;">
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleA/Section263ARulesApply"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox" name="Checkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleA/Section263ARulesApply"/>
										<xsl:with-param name="BackupName">IRS1120ScheduleASection263ARulesApply</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleA/Section263ARulesApply"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleASection263ARulesApply</xsl:with-param>
								</xsl:call-template>
          No
        </label>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:7mm;padding-top:1.5mm;">f</div>
						<div class="styLNDesc" style="width:150mm;height:7mm;padding-top:1.5mm;">
      Was there any change in determining quantities, cost, or valuations between opening and closing inventory?
      If "Yes," attach explanation
      <span style="width:2px;"/>
							<!-- Form to Form Link -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleA/InventoryDeterminationChange"/>
							</xsl:call-template>
							<span class="styBoldText">
								<span style="width:16px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
        <span style="width:15px"/>.
        <span style="width:16px"/>.
        <span style="width:15px"/>.
          <span style="width:16px"/>.
        <span style="width:15px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
        <span style="width:15px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
         <span style="width:16px"/>.
        <span style="width:15px"/>.
        <span style="width:16px"/>.
  </span>
						</div>
						<div class="styLNDesc" style="width:13mm;height:7mm;padding-top:4.5mm;text-align:right;">
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleA/InventoryDeterminationChange"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox" name="Checkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleA/InventoryDeterminationChange"/>
										<xsl:with-param name="BackupName">IRS1120ScheduleAInventoryDeterminationChange</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleA/InventoryDeterminationChange"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleAInventoryDeterminationChange</xsl:with-param>
								</xsl:call-template>
        Yes
      </label>
						</div>
						<div class="styLNDesc" style="width:15mm;height:7mm;padding-top:4.5mm;text-align:right;">
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleA/InventoryDeterminationChange"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox" name="Checkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleA/InventoryDeterminationChange"/>
										<xsl:with-param name="BackupName">IRS1120ScheduleAInventoryDeterminationChange</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleA/InventoryDeterminationChange"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleAInventoryDeterminationChange</xsl:with-param>
								</xsl:call-template>
        No
      </label>
						</div>
					</div>
					<!-- END Schedule A Line Items -->
					<!--br class="pageEnd"/-->
					<!--span style="width:1px;"></span-->
					<!-- BEGIN Schedule C Table -->
					<!--   <div class="styBB" style="width:187mm;"> -->
					<table class="styTable" style="font-size:7pt;border-bottom:1 solid black;width:187mm;padding-top:0mm;" cellspacing="0">
						<thead>
							<tr scope="col">
								<th class="styBB" colspan="2" style="width:84mm;padding-bottom:3mm;">
									<div class="styPartName" style="width:20mm;">Schedule C</div>
									<div class="styPartDesc" style="width:64mm;float:right;clear:none;">Dividends and Special Deductions
                    <span class="styNormalText">(see instructions)</span>
									</div>
								</th>
								<th class="styLNAmountBox" style="width:40mm;height:8mm;text-align:center;font-size:7pt;padding-top:2mm;font-weight:normal;" colspan="2">
									<span class="styBoldText">(a)</span>
									<span style="width:2px;"/>Dividends <br/>received
        </th>
								<th class="styIRS1120LNPercentBox" style="height:8mm;font-size:7pt;padding-top:0mm;font-weight:normal;">
									<span class="styBoldText">(b)</span>
									<span style="width:2px;"/>%
      </th>
								<th class="styLNAmountBox" style="width:40mm;height:8mm;text-align:center;font-size:7pt;padding-top:1mm;font-weight:normal;" colspan="2">
									<span class="styBoldText">(c)</span>
									<span style="width:2px;"/>Special deductions <br/>
									<span class="styBoldText">(a)</span> X <span class="styBoldText">(b)</span>
								</th>
							</tr>
						</thead>
						<tfoot/>
						<tbody valign="top">
							<!-- line 1 -->
							<tr>
								<td class="styLNLeftNumBox" style="height:7mm;padding-left:2.5mm;">1</td>
								<td class="styLNDesc" style="width:84mm;height:7mm;">Dividends from less-than-20%-owned domestic corporations (other than debt-financed stock)
          <!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
           <span style="width:16px"/>.
          <span style="width:16px"/>.
          </span>
								</td>
								<td class="styLNAmountBox" style="width:40mm;height:7mm;vertical-align:bottom;" colspan="2">
									<span style="width:1px;"/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleC/DomesticOwndBelow20Dividends"/>
									</xsl:call-template>
								</td>
								<td class="styIRS1120LNPercentBox" style="height:7mm;vertical-align:bottom;">70</td>
								<td class="styLNAmountBox" style="width:40mm;height:7mm;vertical-align:bottom;" colspan="2">
									<span style="width:1px;"/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleC/DomesticOwndBelow20SpecialDed"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- line 2 -->
							<tr>
								<td class="styLNLeftNumBox" style="height:7mm;padding-left:2.5mm;">2</td>
								<td class="styLNDesc" style="width:84mm;height:7mm;">Dividends from 20%-or-more-owned domestic corporations (other than debt-financed stock)
          <!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:16px"/>.
             <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
           <span style="width:16px"/>.
          <span style="width:16px"/>.
          </span>
								</td>
								<td class="styLNAmountBox" style="width:40mm;height:7mm;vertical-align:bottom;" colspan="2">
									<span style="width:1px;"/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleC/DomesticOwnd20OrMoreDividends"/>
									</xsl:call-template>
								</td>
								<td class="styIRS1120LNPercentBox" style="height:7mm;vertical-align:bottom;">80</td>
								<td class="styLNAmountBox" style="width:40mm;height:7mm;vertical-align:bottom;" colspan="2">
									<span style="width:1px;"/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleC/DomesticOwnd20OrMoreSpecialDed"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- line 3 -->
							<tr>
								<td class="styLNLeftNumBox" style="height:5mm;padding-top: 1.5mm;padding-left:2.5mm;">3</td>
								<td class="styLNDesc" style="width:84mm;height:5mm;padding-top: 2mm">
									<span class="stySmallText">Dividends on debt-financed stock of domestic
          and foreign corporations</span>
									<span class="styBoldText"/>
								</td>
								<td class="styLNAmountBox" style="width:40mm;height:5mm;padding-top:2.5mm;" colspan="2">
									<span style="width:1px;"/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleC/DebtFinancedStockDividends"/>
									</xsl:call-template>
								</td>
								<td class="styIRS1120LNPercentBox" style="height:5mm;padding-top:0mm;padding-bottom: 0mm;font-size:6pt;">see instructions</td>
								<td class="styLNFormLinkBox" style="height:5mm;padding-top:2.5mm;">
									<!-- Form to Form Link -->
									<span style="width:2px;"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleC/DebtFinancedStockSpecialDed"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" style="width:34mm;height:7mm;padding-top:2mm;border-left-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleC/DebtFinancedStockSpecialDed"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<!-- line 4 -->
							<tr>
								<td class="styLNLeftNumBox" style="height:4mm;padding-left:2.5mm;">4</td>
								<td class="styLNDesc" style="width:84mm;height:4mm;">
									<span class="stySmallText">Dividends on certain preferred stock of less-than-20%-owned public utilities</span>
									<!-- No Dotted Line-->
								</td>
								<td class="styLNAmountBox" style="width:40mm;height:4mm;" colspan="2">
									<span style="width:1px;"/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleC/PubUtilBelow20PrefStkDiv"/>
									</xsl:call-template>
								</td>
								<td class="styIRS1120LNPercentBox" style="height:4mm;">42</td>
								<td class="styLNAmountBox" style="width:40mm;height:4mm;" colspan="2">
									<span style="width:1px;"/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleC/PubUtilBelow20PrefStkSpclDed"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- line 5 -->
							<tr>
								<td class="styLNLeftNumBox" style="height:4mm;padding-left:2.5mm;">5</td>
								<td class="styLNDesc" style="width:84mm;height:4mm;">Dividends on certain preferred stock of
          20%-or-more-owned public utilities
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
          <span style="width:16px"/>.
          </span>
								</td>
								<td class="styLNAmountBox" style="width:40mm;height:4mm;vertical-align:bottom;" colspan="2">
									<span style="width:1px;"/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleC/PubUtil20OrMorePrefStkDiv"/>
									</xsl:call-template>
								</td>
								<td class="styIRS1120LNPercentBox" style="height:4mm;vertical-align:bottom;">48</td>
								<td class="styLNAmountBox" style="width:40mm;height:4mm;vertical-align:bottom;" colspan="2">
									<span style="width:1px;"/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleC/PubUtil20OrMorePrefStkSpclDed"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- line 6 -->
							<tr>
								<td class="styLNLeftNumBox" style="height:7mm;padding-left:2.5mm;">6</td>
								<td class="styLNDesc" style="width:84mm;height:7mm;">Dividends from less-than-20%-owned foreign corporations
          and certain FSCs
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
            <span style="width:16px"/>.
       </span>
								</td>
								<td class="styLNAmountBox" style="width:40mm;height:7mm;vertical-align:bottom;" colspan="2">
									<span style="width:1px;"/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleC/ForeignOwndBelow20Dividends"/>
									</xsl:call-template>
								</td>
								<td class="styIRS1120LNPercentBox" style="height:7mm;vertical-align:bottom;">70</td>
								<td class="styLNAmountBox" style="width:40mm;height:7mm;vertical-align:bottom;" colspan="2">
									<span style="width:1px;"/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleC/ForeignOwndBelow20SpecialDed"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- line 7 -->
							<tr>
								<td class="styLNLeftNumBox" style="height:7mm;padding-left:2.5mm;">7</td>
								<td class="styLNDesc" style="width:84mm;height:7mm;">Dividends from 20%-or-more-owned foreign corporations
          and certain FSCs
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
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          </span>
								</td>
								<td class="styLNAmountBox" style="width:40mm;height:7mm;vertical-align:bottom;" colspan="2">
									<span style="width:1px;"/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleC/ForeignOwnd20OrMoreDividends"/>
									</xsl:call-template>
								</td>
								<td class="styIRS1120LNPercentBox" style="height:7mm;vertical-align:bottom;">80</td>
								<td class="styLNAmountBox" style="width:40mm;height:7mm;vertical-align:bottom;" colspan="2">
									<span style="width:1px;"/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleC/ForeignOwnd20OrMoreSpecialDed"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="height:4mm;padding-left:2.5mm;">8</td>
								<td class="styLNDesc" style="width:84mm;height:4mm;font-size:7pt;">Dividends from wholly owned
          foreign subsidiaries
          <span class="styBoldText">
										<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
         </span>
								</td>
								<td class="styLNAmountBox" style="width:40mm;height:4mm;vertical-align:bottom;" colspan="2">
									<span style="width:1px;"/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleC/WhollyOwnedDividends"/>
									</xsl:call-template>
								</td>
								<td class="styIRS1120LNPercentBox" style="height:4mm;vertical-align:bottom;">100</td>
								<td class="styLNAmountBox" style="width:40mm;height:4mm;vertical-align:bottom;" colspan="2">
									<span style="width:1px;"/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleC/WhollyOwnedSpecialDeductions"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- line 9 -->
							<tr>
								<td class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.5mm;">9</td>
								<td class="styLNDesc" style="width:84mm;height:4.5mm;">
									<span class="styBoldText">Total.</span>
          Add lines 1 through 8. See instructions for limitation
        </td>
								<td class="styShadingCell" style="height:4.5mm;" colspan="2">
									<span style="width:1px;"/>
								</td>
								<td class="styShadingCell" style="width:14mm;height:4.5mm;">
									<span style="width:1px;"/>
								</td>
								<td class="styLNAmountBox" style="width:40mm;height:4.5mm;" colspan="2">
									<span style="width:1px;"/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleC/TotalLimitedSpecialDeductions"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- line 10 -->
							<tr>
								<td class="styLNLeftNumBox" style="height:7mm;">10</td>
								<td class="styLNDesc" style="width:84mm;height:7mm;">
									<span class="stySmallText">Dividends from domestic corporations received by a small business investment 
          company operating under the Small Business Investment Act of 1958
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
            <span style="width:16px"/>.
             <span style="width:16px"/>.
            <span style="width:16px"/>.
        </span>
									</span>
								</td>
								<td class="styLNAmountBox" style="width:40mm;height:7mm;vertical-align:bottom;" colspan="2">
									<span style="width:1px;"/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleC/DomesticSmallBusInvstCoDiv"/>
									</xsl:call-template>
								</td>
								<td class="styIRS1120LNPercentBox" style="height:7mm;vertical-align:bottom;">100</td>
								<td class="styLNFormLinkBox" style="height:7mm;vertical-align:bottom;">
									<!-- Form to Form Link -->
									<span style="width:2px;"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleC/DomesticSmallBusInvstCoSpclDed"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" style="width:34mm;height:7mm;padding-top:3mm;border-left-width:0px;vertical-align:bottom;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleC/DomesticSmallBusInvstCoSpclDed"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<!-- line 11 -->
							<tr>
								<td class="styLNLeftNumBox" style="height:4mm;">11</td>
								<td class="styLNDesc" style="width:84mm;height:4mm;font-size:7pt;">Dividends from affiliated group members 
           <span class="styBoldText">
										<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          </span>
								</td>
								<td class="styLNAmountBox" style="width:40mm;height:4mm;vertical-align:bottom;" colspan="2">
									<span style="width:1px;"/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleC/DivFromAffltGroupMembers"/>
									</xsl:call-template>
								</td>
								<td class="styIRS1120LNPercentBox" style="height:4mm;vertical-align:bottom;">100</td>
								<td class="styLNAmountBox" style="width:40mm;height:4mm;vertical-align:bottom;" colspan="2">
									<span style="width:1px;"/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleC/SpecialDedAffltGroupMembers"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- line 12 -->
							<tr>
								<td class="styLNLeftNumBox" style="height:4mm;">12</td>
								<td class="styLNDesc" style="width:84mm;height:4mm;font-size:7pt;">Dividends from certain FSCs 
           <span class="styBoldText">
										<span style="width:16px"/>.
            <span style="width:16px"/>.
           <span style="width:16px"/>.
            <span style="width:16px"/>.
           <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          </span>
								</td>
								<td class="styLNAmountBox" style="width:40mm;height:4mm;vertical-align:bottom;" colspan="2">
									<span style="width:1px;"/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleC/DividendsFromCertainFSCs"/>
									</xsl:call-template>
								</td>
								<td class="styIRS1120LNPercentBox" style="height:4mm;vertical-align:bottom;">100</td>
								<td class="styLNAmountBox" style="width:40mm;height:4mm;vertical-align:bottom;" colspan="2">
									<span style="width:1px;"/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleC/SpecialDeductionsCertainFSCs"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- line 13 -->
							<tr>
								<td class="styLNLeftNumBox" style="height:4.5mm;">13</td>
								<td class="styLNDesc" style="width:84mm;height:4.5mm;">
           Dividends from foreign corporations not included on lines
                3, 6, 7, 8, 11, or 12
                <!-- Form to Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleC/OtherForeignDividends"/>
									</xsl:call-template>
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
                  <span style="width:16px"/>.
                 </span>
								</td>
								<td class="styLNAmountBox" style="width:40mm;height:4.5mm;" valign="bottom" colspan="2">
									<span style="width:1px;"/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleC/OtherForeignDividends"/>
									</xsl:call-template>
								</td>
								<td class="styShadingCell" style="width:14mm;height:4.5mm;">
									<span style="width:1px;"/>
								</td>
								<td class="styShadingCell" style="width:40mm;height:4.5mm;" colspan="2">
									<span style="width:1px;"/>
								</td>
							</tr>
							<!--line 14-->
							<tr>
								<td class="styLNLeftNumBox" style="height:4.5mm;">14</td>
								<td class="styLNDesc" style="width:84mm;height:4.5mm;">
                Income from controlled foreign corporations under 
                subpart F (attach Form(s) 5471)
                <span style="width:2px;"/>
									<!-- Form to Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleC/ControlledForeignIncome"/>
									</xsl:call-template>
									<span class="styBoldText">
										<span style="width:16px"/>.
                 <span style="width:16px"/>.
                  <span style="width:16px"/>.
                  <span style="width:16px"/>.
                  <span style="width:16px"/>.
                  <span style="width:16px"/>.
                  <span style="width:16px"/>.
                  <span style="width:16px"/>.
                </span>
								</td>
								<td class="styLNAmountBox" style="width:40mm;height:4.5mm;vertical-align:bottom;" colspan="2">
									<span style="width:1px;"/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleC/ControlledForeignIncome"/>
									</xsl:call-template>
								</td>
								<td class="styShadingCell" style="width:14mm;height:4.5mm;">
									<span style="width:1px;"/>
								</td>
								<td class="styShadingCell" style="width:40mm;height:4.5mm;" colspan="2">
									<span style="width:1px;"/>
								</td>
							</tr>
							<!-- line 15 -->
							<tr>
								<td class="styLNLeftNumBox" style="height:4.5mm;">15</td>
								<td class="styLNDesc" style="width:84mm;height:4.5mm;">
                Foreign dividend gross-up
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
                </span>
								</td>
								<td class="styLNAmountBox" style="width:40mm;height:4.5mm;" colspan="2">
									<span style="width:1px;"/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleC/ForeignDividendGrossUp"/>
									</xsl:call-template>
								</td>
								<td class="styShadingCell" style="width:14mm;height:4.5mm;">
									<span style="width:1px;"/>
								</td>
								<td class="styShadingCell" style="width:40mm;height:4.5mm;" colspan="2">
									<span style="width:1px;"/>
								</td>
							</tr>
							<!-- line 16 -->
							<tr>
								<td class="styLNLeftNumBox" style="height:4.5mm;">16</td>
								<td class="styLNDesc" style="width:84mm;height:4.5mm;" valign="bottom">
									<span class="stySmallText">IC-DISC and former DISC dividends not included on lines 1, 2, or 3</span>
									<span class="styBoldText">
										<span style="width:16px"/>.
                 </span>
								</td>
								<td class="styLNAmountBox" style="width:40mm;height:4.5mm;" colspan="2">
									<span style="width:1px;"/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleC/ICDISCFormerDISCDividends"/>
									</xsl:call-template>
								</td>
								<td class="styShadingCell" style="width:14mm;height:4.5mm;">
									<span style="width:1px;"/>
								</td>
								<td class="styShadingCell" style="width:40mm;height:4.5mm;" colspan="2">
									<span style="width:1px;"/>
								</td>
							</tr>
							<!-- line 17 -->
							<tr>
								<td class="styLNLeftNumBox" style="height:4.5mm;">17</td>
								<td class="styLNDesc" style="width:84mm;height:4.5mm;">
                Other dividends
                <!-- Form to Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleC/OtherDividends"/>
									</xsl:call-template>
									<span style="width:2px;"/>
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
								</td>
								<td class="styLNAmountBox" style="width:40mm;height:4.5mm;" colspan="2">
									<span style="width:1px;"/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleC/OtherDividends"/>
									</xsl:call-template>
								</td>
								<td class="styShadingCell" style="width:14mm;height:4.5mm;">
									<span style="width:1px;"/>
								</td>
								<td class="styShadingCell" style="width:40mm;height:4.5mm;" colspan="2">
									<span style="width:1px;"/>
								</td>
							</tr>
							<!-- line 18 -->
							<tr>
								<td class="styLNLeftNumBox" style="height:4.5mm;">18</td>
								<td class="styLNDesc" style="width:84mm;height:4.5mm;">
                Deduction for dividends paid on certain preferred stock of public utilities
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
                 <span style="width:16px"/>.
                </span>
								</td>
								<td class="styShadingCell" style="width:40mm;height:4.5mm;" colspan="2">
									<span style="width:1px;"/>
								</td>
								<td class="styShadingCell" style="width:14mm;height:4.5mm;">
									<span style="width:1px;"/>
								</td>
								<td class="styLNAmountBox" style="width:40mm;height:4.5mm;" colspan="2" valign="bottom">
									<span style="width:1px;"/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleC/PublicUtilitiesPrefStkDivDed"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- line 19 -->
							<tr>
								<td class="styLNLeftNumBox" style="height:4.5mm;">19</td>
								<td class="styLNDesc" style="width:84mm;height:4.5mm;">
									<span class="styBoldText">Total dividends.</span> 
                Add lines 1 through 17. Enter here and on page 1, line 4
                <!-- Dotted Line here-->
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
                  <span style="width:16px"/>.
                </span>
									<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
								</td>
								<td class="styLNAmountBox" style="width:40mm;height:4.5mm;padding-top:4mm;" colspan="2">
									<span style="width:1px;"/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleC/TotalDividends"/>
									</xsl:call-template>
								</td>
								<td class="styShadingCell" style="width:14mm;height:4.5mm;">
									<span style="width:1px;"/>
								</td>
								<td class="styShadingCell" style="width:40mm;height:4.5mm;" colspan="2">
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr class="styBB" style="width:187mm;">
								<td class="styLNLeftNumBox" style="height:4.5mm;">20</td>
								<td class="styLNDesc" colspan="4" style="width:143mm;height:4.5mm;">
									<span class="styBoldText">Total special deductions.</span> Add lines 9, 10, 11, 12, and 18.
                Enter here and on page 1, line 29b          <!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:12px"/>.
                  <span style="width:12px"/>.
                </span>
									<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
								</td>
								<td class="styLNAmountBoxNBB" style="width:40mm;height:4.5mm;" colspan="2">
									<span style="width:1px;"/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleC/TotalSpecialDeductions"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<!-- END Schedule C Table -->
					<!--div class="styBB" style="width:187mm;">
  </div> -->
					<!-- BEGIN Schedule E Title -->
					<div class="styBB" style="width:187mm;float:none;clear:none;border-top-width:1px;">
						<div class="styPartName" style="height:4mm;width:20mm;">Schedule E</div>
						<div class="styPartDesc" style="width:160mm;height:8mm;">Compensation of Officers
      <span class="styNormalText">(see instructions for page 1, line 12)</span>
							<br/>
							<span style="font-size:7pt;">Note: </span>
							<span class="styItalicText" style="font-size:7pt;font-weight:normal;">Complete Schedule E only
      if total receipts (line 1a plus lines 4 through 10 on page 1) are $500,000 or more.</span>
						</div>
						<div class="styGenericDiv" style="height:8mm;padding-top:4.5mm;float:right;">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleE/Officer"/>
								<xsl:with-param name="containerHeight" select="5"/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerID" select=" 'OFCctn' "/>
								<xsl:with-param name="imageID" select=" 'OFCimg' "/>
								<xsl:with-param name="buttonID" select=" 'OFCbtn' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<!-- END Schedule E Title -->
					<!-- BEGIN Schedule E Table -->
					<div class="styTableContainer" style="height:31.5mm;" id="OFCctn">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:80mm;font-weight:normal;">
										<span style="font-weight:bold;">(a)</span> Name of officer</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:23mm;font-weight:normal;">
										<span style="font-weight:bold;">(b)</span> Social security number</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:20mm;font-weight:normal;">
										<span style="font-weight:bold;">(c)</span> Percent of time devoted to business</th>
									<th class="styTableCellHeader" scope="col" colspan="2" style="width:40mm;font-weight:normal;">Percent of corporation stock owned</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:26mm;font-weight:normal;border-right:0;">
										<span style="font-weight:bold;">(f)</span> Amount of compensation </th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;">
										<span class="styBoldText">(d)</span> Common</th>
									<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;">
										<span class="styBoldText">(e)</span> Preferred</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="($Print != $Separated) or (count($Form1120ScheduleE/Officer) &lt;= 5) ">
									<xsl:for-each select="$Form1120ScheduleE/Officer">
										<tr>
											<td class="styTableCellText" style="width:60mm;">
												<span style="width:2.5mm;">
													<xsl:if test="position()=1">
														<span class="styBoldText">1</span>
													</xsl:if>
												</span>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NameOfOfficer"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellCtr" style="width:31mm;">
												<xsl:call-template name="PopulateSSN">
													<xsl:with-param name="TargetNode" select="SocialSecurityNumber"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</td>
											<td class="styTableCell" style="width:22mm">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="PercentTimeDevotedToBusiness"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:21mm">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="PercentCommonStockOwned"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:21mm">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="PercentPreferredStockOwned"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:32mm;border-right:0;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AmountOfCompensation"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="count($Form1120ScheduleE/Officer)&lt; 1 or ((count($Form1120ScheduleE/Officer) &gt; 5) and ($Print = $Separated))">
									<tr>
										<td class="styTableCell" style="width:60mm;text-align:left;">
											<span class="styBoldText">1 </span>
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$Form1120ScheduleE/Officer"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellCtr" style="width:31mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:22mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:21mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:21mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:32mm;border-right:0;">
											<span style="width:1px;"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1120ScheduleE/Officer)&lt; 2  or ((count($Form1120ScheduleE/Officer) &gt; 5) and ($Print = $Separated))">
									<tr>
										<td class="styTableCell" style="width:60mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellCtr" style="width:31mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:22mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:21mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:21mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:32mm;border-right:0;">
											<span style="width:1px;"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1120ScheduleE/Officer)&lt; 3  or ((count($Form1120ScheduleE/Officer) &gt; 5) and ($Print = $Separated))">
									<tr>
										<td class="styTableCell" style="width:60mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellCtr" style="width:31mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:22mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:21mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:21mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:32mm;border-right:0;">
											<span style="width:1px;"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1120ScheduleE/Officer)&lt; 4  or ((count($Form1120ScheduleE/Officer) &gt; 5) and ($Print = $Separated))">
									<tr>
										<td class="styTableCell" style="width:60mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellCtr" style="width:31mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:22mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:21mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:21mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:32mm;border-right:0;">
											<span style="width:1px;"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1120ScheduleE/Officer)&lt; 5  or ((count($Form1120ScheduleE/Officer) &gt; 5) and ($Print = $Separated))">
									<tr>
										<td class="styTableCell" style="width:60mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellCtr" style="width:31mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:22mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:21mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:21mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:32mm;border-right:0;">
											<span style="width:1px;"/>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form1120ScheduleE/Officer"/>
						<xsl:with-param name="containerHeight" select="5"/>
						<xsl:with-param name="headerHeight" select="2"/>
						<xsl:with-param name="containerID" select=" 'OFCctn' "/>
						<xsl:with-param name="imageID" select=" 'OFCimg' "/>
						<xsl:with-param name="buttonID" select=" 'OFCbtn' "/>
					</xsl:call-template>
					<!-- END Schedule E Table -->
					<!-- BEGIN Schedule E Line Items -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">2</div>
						<div class="styLNDesc" style="width:146mm;height:4mm;">Total compensation of officers
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
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleE/TotalCompensationOfOfficers"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">3</div>
						<div class="styLNDesc" style="width:146mm;height:4mm;">Compensation of officers claimed on Schedule A
      and elsewhere on return
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
      </span>
						</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleE/CompensationClmOnSchAAndElse"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styBB" style="width:187mm;border-bottom-width:.5mm">
						<div class="styLNLeftNumBox" style="height:4mm;">4</div>
						<div class="styLNDesc" style="width:146mm;height:4mm;">Subtract line 3 from line 2. Enter the result
      here and on page 1, line 12      <!--Dotted Line-->
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
						<div class="styLNAmountBoxNBB" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleE/NetCompensationOfOfficers"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END Schedule E Line Items -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:right;">
							<span style="width:80px;"/>  
      Form <span class="styBoldText" style="font-size:8pt;">1120</span> (2008)
    </div>
					</div>
					<!-- END Page Break and Footer-->
					<!--Begin Page 3 -->
					<!-- Page Header -->
					<div class="styBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">Form 1120 (2008)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">3</span>
						</div>
					</div>
					<!-- END Page Header -->
					<!-- BEGIN Schedule J Title -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="height:4mm;width:23mm;">Schedule J</div>
						<div class="styPartDesc" style="height:4mm;width:164mm;">Tax Computation <span class="styNormalText"> (see instructions)</span>
						</div>
					</div>
					<!-- END Schedule J Title -->
					<!-- BEGIN Schedule J Line Items -->
					<!-- line 1 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.5mm;">1</div>
						<div class="styLNDesc" style="height:4.5mm;width:138mm;">
							<span style="width:133.5mm;">
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/MemberOfControlledGroup"/>
										<xsl:with-param name="BackupName">IRS1120ScheduleJMemberOfControlledGroup</xsl:with-param>
									</xsl:call-template>
        Check if the corporation is a member of a controlled group (attach Schedule O (Form 1120))
       <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/MemberOfControlledGroup"/>
									</xsl:call-template>
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:11px"/>.
        </span>
									<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
									<span style="width:4px;"/>
								</label>
							</span>
							<span style="width:4mm;">
								<input type="checkbox" class="styCkbox" style="">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/MemberOfControlledGroup"/>
										<xsl:with-param name="BackupName">IRS1120ScheduleJMemberOfControlledGroup</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
						<div class="styLNRightNumBox" style="background-color:lightgrey;height:4.5mm;border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;"/>
					</div>
					<!-- sch J line 2 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;font-size:7pt;padding-top:1mm;padding-left:2.5mm;">2</div>
						<div class="styLNDesc" style="height:4.5mm;width:138mm;padding-top:.5mm;">
							<span class="stySmallText" style="width:133mm;">          
        Income tax. 
        <label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/QualifiedPersonalServiceCorp"/>
										<xsl:with-param name="BackupName">IRS1120ScheduleJQualifiedPersonalServiceCorp</xsl:with-param>
									</xsl:call-template>
          Check if a qualified personal service corporation (see instructions)          
          <!-- Form to Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/IncomeTax"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Schedule J Line 2 - Section 1291 Indicator</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/IncomeTax/@section1291Indicator"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Schedule J Line 2 - Section 1291 Amount</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/IncomeTax/@section1291Amount"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Schedule J Line 2 - Section 197 Indicator</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/IncomeTax/@section197Indicator"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Schedule J Line 2 - Section 197 Amount</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/IncomeTax/@section197Amount"/>
									</xsl:call-template>
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:11px"/>.
          <span style="width:11px"/>.
          <span style="width:11px"/>.
          <span style="width:11px"/>.
         <span style="width:11px"/>.
           <span style="width:3.5mm"/>
									</span>
									<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
									<span style="width:4px;"/>
								</label>
							</span>
							<span style="width:4mm;padding-top:1mm;">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/QualifiedPersonalServiceCorp"/>
										<xsl:with-param name="BackupName">IRS1120ScheduleJQualifiedPersonalServiceCorp</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:5.25mm;padding-top:1mm;">2</div>
						<div class="styLNAmountBox" style="height:5.25mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/IncomeTax"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 3 J -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.5mm;">3</div>
						<div class="styLNDesc" style="height:4mm;">Alternative minimum tax (attach Form 4626)
      <span style="width:2px;"/>
							<!-- Form to Form Link -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/AlternativeMinimumTax"/>
							</xsl:call-template>
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
        <span style="width:16px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
      </span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">3</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/AlternativeMinimumTax"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.5mm;">4</div>
						<div class="styLNDesc" style="height:4mm;">Add lines 2 and 3
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
        <span style="width:16px"/>.
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
						<div class="styLNRightNumBox" style="height:4mm;">4</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/IncomeTaxAndAlternativeMinTax"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCH J line 5a -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">5a </div>
						<div class="styLNDesc" style="width:99mm;height:4mm;">Foreign tax credit (attach Form 1118)
      
      <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/ForeignTaxCredit"/>
							</xsl:call-template>
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
						<div class="styLNRightNumBox" style="height:4mm;">5a </div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;width:31.3mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/ForeignTaxCredit"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px"/>
					</div>
					<!-- SCH J line 5b -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm">b </div>
						<div class="styLNDesc" style="width:99mm;height:4mm;">
      Credit from Form 8834 
                          <span class="styBoldText">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/CreditsFromForm8834"/>
								</xsl:call-template>
								<span style="width:3px;"/>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Schedule J Line 5b - Form 5735 Indicator</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/CreditsFromForm8834/
                        @form5735Indicator"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Schedule J Line 5b - Form 5735 Amountr</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/CreditsFromForm8834/
                        @form5735IndicatorAmount"/>
								</xsl:call-template>
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
						<div class="styLNRightNumBox" style="height:4mm;">5b </div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;width:31.3mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/CreditsFromForm8834"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px"/>
					</div>
					<!-- SCH J line 5c1 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm">c </div>
						<div class="styLNDesc" style="width:99mm;height:4mm;">
                General business credit. (attach Form 3800) 
                 <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/GeneralBusinessCredit"/>
							</xsl:call-template>
							<span style="width:3px;"/>
							<span class="styBoldText">
								<span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
        </span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">5c</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;width:31.3mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/GeneralBusinessCredit"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px"/>
					</div>
					<!-- SCH K line 5d -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm">d </div>
						<div class="styLNDesc" style="width:99mm;height:4mm;">
      Credit for prior year minimum tax (attach Form 8827)
      
      <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/PriorYearMinimumTaxCredit"/>
							</xsl:call-template>
							<span class="styBoldText">
								<span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
        </span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">5d </div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;width:31.3mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/PriorYearMinimumTaxCredit"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px"/>
					</div>
					<!-- SCH K line 5e -->
					<!--  
            <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm">e </div>
            <div class="styLNDesc" style="width:99mm;height:4mm;">
     Bond credits from:
     
      <span style="width:8px"/>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/CreditFromForm8860"/>
                  <xsl:with-param name="BackupName">IRS1120Form2220Attached</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/CreditFromForm8860"/>
                  <xsl:with-param name="BackupName">IRS1120Form2220Attached</xsl:with-param>
                </xsl:call-template>
           Form 8860
          <span style="width:2px;"/>
              </label>
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/CreditFromForm8860"/>
              </xsl:call-template>
              <span style="width:8px"/>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/CreditFromForm8912"/>
                  <xsl:with-param name="BackupName">IRS1120Form2220Attached</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/CreditFromForm8912"/>
                  <xsl:with-param name="BackupName">IRS1120Form2220Attached</xsl:with-param>
                </xsl:call-template>
           Form 8912
          <span style="width:2px;"/>
              </label>
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/CreditFromForm8912"/>
              </xsl:call-template>
              <span class="styBoldText">
                <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
        </span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;">5e </div>
            <div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;width:31.3mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/BondCredits"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
            <div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px"/>
          </div>
          </div>   -->
					<!--  THIS PART IS FOR ATTER JANUARY 20th  -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm">e</div>
						<div class="styLNDesc" style="width:99mm;height:4mm;">
                                  Bond credits from Form 8912     
                                      <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/BondCreditFromForm8912"/>
							</xsl:call-template>
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
						<div class="styLNRightNumBox" style="height:4mm;">5e</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;width:31.3mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/BondCreditFromForm8912"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px"/>
					</div>
					<!--  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->
					<!-- line 6 Sch J -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.8mm;">6</div>
						<div class="styLNDesc" style="height:4mm;">
							<span class="styBoldText">Total credits.</span> Add lines 5a through 5e
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
        <span style="width:16px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
      </span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">6</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/TotalCredits"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.8mm;">7</div>
						<div class="styLNDesc" style="height:4mm;"> 
              Subtract line 6 from line 4
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
						<div class="styLNRightNumBox" style="height:4mm;">7</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/TaxLessTotalCredit"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.8mm;">8</div>
						<div class="styLNDesc" style="height:4mm;">
      Personal holding company tax (attach Schedule PH (Form 1120))
      <span style="width:2px;"/>
							<!-- Form to Form Link -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/PersonalHoldingCompanyTax"/>
							</xsl:call-template>
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
      </span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">8</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/PersonalHoldingCompanyTax"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- found here -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.8mm;">9</div>
						<div class="styLNDesc" style="width:36mm;height:4.5mm;">Other taxes. Check if from:</div>
						<div class="styLNDesc" style="width:8mm;height:4.5mm;padding-top:0mm;">
							<!-- Form to Form Link -->
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Schedule J Line 9 - Form 8693 Approved Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/TotalOtherTaxes/@f8693ApprovedIndicator"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Schedule J Line 9 - Form 8693 Approval Date</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/TotalOtherTaxes/@f8693ApprovalDate"/>
								<xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:30mm;height:4.5mm;padding-left:.1mm;">
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/TaxFromForm4255"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleJTaxFromForm4255</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/TaxFromForm4255"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleJTaxFromForm4255</xsl:with-param>
								</xsl:call-template>
        Form 4255 
      </label>
							<!-- Form to Form Link -->
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Schedule J Line 9 - Form 4255 SECTION 1260(B) INTEREST</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/TaxFromForm4255/@section1260BIndicator"/>
								<xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Schedule J Line 9 - Form 4255 SECTION 1260(B) AMOUNT</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/TaxFromForm4255/@section1260BAmount"/>
								<xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/TaxFromForm4255"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:25mm;height:4.5mm;padding-left:.1mm;padding-top:0mm;">
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/TaxFromForm8611"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleJTaxFromForm8611</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/TaxFromForm8611"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleJTaxFromForm8611</xsl:with-param>
								</xsl:call-template>
        Form 8611
      </label>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/TaxFromForm8611"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:39.5mm;height:4.5mm;padding-left:.1mm;padding-top:0mm;">
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/TaxFromForm8697"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleJTaxFromForm8697</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/TaxFromForm8697"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleJTaxFromForm8697</xsl:with-param>
								</xsl:call-template>
        Form 8697
      </label>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/TaxFromForm8697"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;"/>
						<div class="styLNDesc" style="width:43.5mm;height:4.5mm;"/>
						<div class="styLNDesc" style="width:25mm;height:4.5mm;padding-left:.15mm;">
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/TaxFromForm8866"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleJTaxFromForm8866</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/TaxFromForm8866"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleJTaxFromForm8866</xsl:with-param>
								</xsl:call-template>
        Form 8866
      </label>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/TaxFromForm8866"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:25mm;height:4.5mm;padding-left:.15mm;">
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/TaxFromForm8902"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleJTaxFromForm8902</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/TaxFromForm8902"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleJTaxFromForm8902</xsl:with-param>
								</xsl:call-template>
        Form 8902
      </label>
							<!-- Form to Form Link -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/TaxFromForm8902"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:45mm;height:4.5mm;padding-left:.15mm;">
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/OtherTaxes"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleJOtherTaxes</xsl:with-param>
								</xsl:call-template>
							</input>
							<!--span style="width:5mm;"></span-->
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/OtherTaxes"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleJOtherTaxes</xsl:with-param>
								</xsl:call-template>
        Other (attach schedule)
      </label>
							<!-- Form to Form Link -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/OtherTaxes"/>
							</xsl:call-template>
							<!--Dotted Line-->
							<!--
      <span class="styBoldText">
        <span style="width:16px"></span>.
        <span style="width:16px"></span>.
      </span>
      -->
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">9</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/TotalOtherTaxes"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styBB" style="width:187mm;clear:both;">
						<div class="styLNLeftNumBox" style="height:4mm;">10</div>
						<div class="styLNDesc" style="height:4mm;">
							<span class="styBoldText">Total tax.</span> Add lines 7 through 9. Enter here and on page 1, line 31
      <span style="width:2px;"/>
							<!-- Form to Form Link -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/TotalTax"/>
							</xsl:call-template>
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
						<div class="styLNRightNumBoxNBB" style="height:4mm;">10</div>
						<div class="styLNAmountBoxNBB" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/TotalTax"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END Schedule J Line Items -->
					<!--br style="page-break-after:always;"/-->
					<div style="width:187mm;clear:both;border-top-width:1px;" class="styBB">
						<div style="height:4mm;width:23mm;" class="styPartName">Schedule K</div>
						<div style="height:4mm;width:164mm;" class="styPartDesc">Other Information<span class="styNormalText"> (see instructions)</span>
						</div>
					</div>
					<!--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$-->
					<!-- BEGIN Line Items -->
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">1</div>
						<div class="styLNDesc" style="width:167mm;height:4.5mm;">Check accounting method:
         <span style="width:5mm;"/>
							<span class="styBoldText">a</span>
							<span style="width:3px;"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/MethodOfAccountingCash"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleKMethodOfAccountingCash</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/MethodOfAccountingCash"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleKMethodOfAccountingCash</xsl:with-param>
								</xsl:call-template>
            Cash
          </label>
							<span style="width:5mm;"/>
							<span class="styBoldText">b</span>
							<span style="width:3px;"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/MethodOfAccountingAccrual"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleKMethodOfAccountingAccrual</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/MethodOfAccountingAccrual"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleKMethodOfAccountingAccrual</xsl:with-param>
								</xsl:call-template>
            Accrual
          </label>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/MethodOfAccountingOther"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleKMethodOfAccountingOther</xsl:with-param>
								</xsl:call-template>
								<span style="width:85mm;">
									<span style="width:7mm;"/>
									<span class="styBoldText">c</span>
									<span style="width:5px;"/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/MethodOfAccountingOther"/>
											<xsl:with-param name="BackupName">IRS1120ScheduleKMethodOfAccountingOther</xsl:with-param>
										</xsl:call-template>
									</input>
                  Other (specify)
                  <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
									<span style="width:45mm;border-bottom:1 solid black;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/MethodOfAccountingOther/@note"/>
										</xsl:call-template>
									</span>
									<!--
           <span class="styBoldText">c</span><span style="width:3px;"></span>
           <input type="checkbox" class="styCkbox">
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="$Form1120ScheduleK/MethodOfAccountingOther" />
              <xsl:with-param name="BackupName">IRS1120ScheduleKMethodOfAccountingOther</xsl:with-param>
            </xsl:call-template>
          </input> 
                  
            Other (specify)
            <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>    -->
								</span>
							</label>
						</div>
						<div class="styIRS1120LNYesNoBox">Yes</div>
						<div class="styIRS1120LNYesNoBoxRB">No</div>
					</div>
					<!-- Line 2 -->
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">2</div>
						<div class="styLNDesc" style="width:167mm;height:4.5mm;">See the instructions and enter the:</div>
						<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
						<div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px;"/>
					</div>
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;">a</div>
						<div class="styLNDesc" style="width:39mm;height:4.5mm;">
          Business activity code no. <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
						</div>
						<div class="styIRS1120BBText" style="width:127mm;text-align:right">
							<xsl:choose>
								<xsl:when test="$Form1120ScheduleK/BusinessActivityCode">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/BusinessActivityCode"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/InactiveBusinessActivityCode"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="styGenericDiv" style="width:1mm;"/>
						<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
						<div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px;"/>
					</div>
					<div class="styGenericDiv" style="width:187mm;height:4.5mm;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;">b</div>
						<div class="styLNDesc" style="width:28mm;height:4.5mm;">
          Business activity <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
						</div>
						<div class="styIRS1120BBText" style="width:137.9mm">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/BusinessActivity"/>
							</xsl:call-template>
						</div>
						<div class="styGenericDiv" style="width:1mm;"/>
						<div class="styShadingCell" style="width:6mm;height:100%;"/>
						<div class="styShadingCellRB" style="width:6mm;height:100%;border-right-width:0px;"/>
					</div>
					<div class="styGenericDiv" style="width:187mm;height:4.5mm;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;">c</div>
						<div class="styLNDesc" style="width:29mm;height:4.5mm;">
          Product or service <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
						</div>
						<div class="styIRS1120BBText" style="width:136.9mm">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/ProductOrService"/>
							</xsl:call-template>
						</div>
						<div class="styGenericDiv" style="width:1mm;"/>
						<div class="styShadingCell" style="width:6mm;height:100%;"/>
						<div class="styShadingCellRB" style="width:6mm;height:100%;border-right-width:0px;"/>
					</div>
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">3</div>
						<div class="styLNDesc" style="width:167mm;height:4.5mm;padding-bottom:0px;padding-top:0px;">
              Is the corporation a subsidiary in an affiliated group or a parent-subsidiary controlled group?
              <xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Schedule K Line 3 - Name control of the parent corporation</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/ParentCorporationNameControl"/>
							</xsl:call-template>
							<span class="styBoldText">
								<span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
             </span>
						</div>
						<div class="styGenericDiv">
							<div class="styIRS1120LNYesNoBox" style="height:4.5mm;padding-top:0mm;">
								<span style="font-weight:normal;">
									<xsl:call-template name="PopulateYesBoxText">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/ControlledGroupMember"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styIRS1120LNYesNoBoxRB" style="height:4.5mm;padding-top:0mm;border-right-width:0px;">
								<span style="font-weight:normal;">
									<xsl:call-template name="PopulateNoBoxText">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/ControlledGroupMember"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4.5mm;"/>
							<div class="styLNDesc" style="width:167mm;height:4.5mm;">
                           If “Yes,” enter name and EIN of the parent corporation
                           <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
								<span style="width:90mm;border-bottom:1 solid black;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/ParentCorporationName/BusinessNameLine1"/>
									</xsl:call-template>
								</span>
								<span style="width:165mm;border-bottom:1 solid black;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/ParentCorporationName/BusinessNameLine2"/>
									</xsl:call-template>
									<span style="width:3mm;"/>
									<xsl:choose>
										<xsl:when test="$Form1120ScheduleK/ParentCorporationEIN">
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/ParentCorporationEIN"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/MissingEINReason"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</span>
							</div>
							<div class="styShadingCell" style="width:6mm;height:12.5mm;"/>
							<div class="styShadingCellRB" style="width:6mm;height:12.5mm;border-right-width:0px;"/>
						</div>
					</div>
					<!-- Line 4 -->
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">4</div>
						<div class="styLNDesc" style="width:167mm;height:4.5mm;">At the end of the tax year;
          </div>
						<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
						<div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px;"/>
						<!--  *************  This div was added here ********** -->
					</div>
					<!-- END DIV WAS ADDED HERE - ORIGINALLY MISSING THIS END DIV -->
					<div class="styGenericDiv" style="width:187mm;height:4.5mm;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;">a</div>
						<div class="styLNDesc" style="width:167mm;height:4.5mm; font-size:8.6px;">
           Did any foreign or domestic corporation, partnership (including any entity treated as a partnership), or trust own, directly 20% or more , or own, directly or indirectly, 50% or more of the total voting power of all classes of the corporation’s stock entitled to vote? 
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
							<div style="width:167mm;height:2mm;padding-top:1mm">
                For rules of constructive ownership, see  instructions.  If “Yes,” complete (i) through (v)   
          </div>
						</div>
						<div class="styGenericDiv">
							<div class="styIRS1120LNYesNoBox" style="height:6.5mm;padding-top:3mm;">
								<span style="font-weight:normal;">
									<xsl:call-template name="PopulateYesBoxText">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/PartshpCorpTrustOwnPctVtngStk"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styIRS1120LNYesNoBoxRB" style="height:6.5mm;padding-top:3mm;border-right-width:0px;">
								<span style="font-weight:normal;">
									<xsl:call-template name="PopulateNoBoxText">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/PartshpCorpTrustOwnPctVtngStk"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styShadingCell" style="width:6.5mm;height:3.m;"/>
							<div class="styShadingCellRB" style="width:6.5mm;height:3mm;border-right-width:0px;"/>
						</div>
					</div>
					<!-- Schedule K Line 4 Table -->
					<div class="styBB" style="width:187mm;float:none;clear:none;border-top-width:1px;">
						<div class="styGenericDiv" style="height:4mm;padding-top:0mm;float:right;">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/PartshpCorpTrustOwnStockInfo"/>
								<xsl:with-param name="containerHeight" select="5"/>
								<xsl:with-param name="containerID" select=" 'OFCctn1' "/>
								<xsl:with-param name="imageID" select=" 'OFCimg1' "/>
								<xsl:with-param name="buttonID" select=" 'OFCbtn1' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<div class="styTableContainer" id="OFCctn1">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:80mm;font-weight:normal;">
										<span style="font-weight:normal">(i)</span> Name of Entity</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:35mm;font-weight:normal;">
										<span style="font-weight:normal;">(ii)</span> Employer Identification Number (if any)</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:20mm;font-weight:normal;">
										<span style="font-weight:normal;">(iii)</span> Type of Entity</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:35mm;font-weight:normal;">
										<span style="font-weight:normal;">(iv)</span> Country of Organization</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:36mm;font-weight:normal;border-right-width:0px;">
										<span style="font-weight:normal">(v)</span> Percentage Owned in Voting Stock  </th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="($Print != $Separated) or (count($Form1120ScheduleK/PartshpCorpTrustOwnStockInfo) &lt;= 5)">
									<xsl:for-each select="$Form1120ScheduleK/PartshpCorpTrustOwnStockInfo">
										<tr>
											<td class="styTableCellText" style="width:60mm;padding-left:2.55mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="EntityName/BusinessNameLine1"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="EntityName/BusinessNameLine2"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellCtr" style="width:31mm;">
												<xsl:if test="EmplrIdentificationNumber != ' '">
													<xsl:call-template name="PopulateSSN">
														<xsl:with-param name="TargetNode" select="EmplrIdentificationNumber"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</xsl:if>
												<xsl:if test="EINMissingReason !=' '">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="EINMissingReason"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</xsl:if>
											</td>
											<td class="styTableCell" style="width:22mm;text-align:left;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="EntityType"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:22mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CountryOfOrganization"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:32mm;border-right-width:1px;">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="PercentageOwnedVotingStock"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="count($Form1120ScheduleK/PartshpCorpTrustOwnStockInfo)&lt; 1 or ((count($Form1120ScheduleK/PartshpCorpTrustOwnStockInfo) &gt; 5) and ($Print = $Separated))">
									<tr>
										<td class="styTableCell" style="width:60mm;text-align:left;">
											<span class="styBoldText"/>
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/PartshpCorpTrustOwnStockInfo"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellCtr" style="width:31mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:22mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:22mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:32mm;border-right:0;">
											<span style="width:1px;"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1120ScheduleK/PartshpCorpTrustOwnStockInfo)&lt; 2  or ((count($Form1120ScheduleK/PartshpCorpTrustOwnStockInfo) &gt; 5) and ($Print = $Separated))">
									<tr>
										<td class="styTableCell" style="width:60mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellCtr" style="width:31mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:22mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:21mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:32mm;border-right:0;">
											<span style="width:1px;"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1120ScheduleK/PartshpCorpTrustOwnStockInfo)&lt; 3  or ((count($Form1120ScheduleK/PartshpCorpTrustOwnStockInfo) &gt; 5) and ($Print = $Separated))">
									<tr>
										<td class="styTableCell" style="width:60mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellCtr" style="width:31mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:22mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:21mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:32mm;border-right:0;">
											<span style="width:1px;"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1120ScheduleK/PartshpCorpTrustOwnStockInfo)&lt; 4  or ((count($Form1120ScheduleK/PartshpCorpTrustOwnStockInfo) &gt; 5) and ($Print = $Separated))">
									<tr>
										<td class="styTableCell" style="width:60mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellCtr" style="width:31mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:22mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:21mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:32mm;border-right:0;">
											<span style="width:1px;"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1120ScheduleK/PartshpCorpTrustOwnStockInfo)&lt; 5  or ((count($Form1120ScheduleK/PartshpCorpTrustOwnStockInfo) &gt; 5) and ($Print = $Separated))">
									<tr>
										<td class="styTableCell" style="width:60mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellCtr" style="width:31mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:22mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:21mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:32mm;border-right:0;">
											<span style="width:1px;"/>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/PartshpCorpTrustOwnStockInfo"/>
						<xsl:with-param name="containerHeight" select="5"/>
						<xsl:with-param name="containerID" select=" 'OFCctn1' "/>
						<xsl:with-param name="imageID" select=" 'OFCimg1' "/>
						<xsl:with-param name="buttonID" select=" 'OFCbtn1' "/>
					</xsl:call-template>
					<!-- END Schedule T Table -->
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:2.5mm;"/>
						<div class="styLNDesc" style="width:167mm;height:2.5mm;"/>
						<div class="styIRS1120LNYesNoBox" style="width:6mm;height:2.5mm;background-color:lightgrey;"/>
						<div class="styIRS1120LNYesNoBox" style="width:6mm;height:2.5mm;border-right-width:0px;background-color:lightgrey;"/>
						<div class="styGenericDiv" style="width:187mm;height:4.5mm;">
							<div class="styLNLeftLtrBox" style="height:4.5mm;">b</div>
							<div class="styLNDesc" style="width:160mm;height:4.5mm; ">
                 Did any individual or estate own, directly 20% or more or indirectly, 50% or more of the total voting power of all 
                 classes of the corporation’s stock entitled to vote? 
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
                  <span style="width:16px"/>.
                  <span style="width:16px"/>.
                  <span style="width:16px"/>.
                  <span style="width:16px"/>.
                  <span style="width:16px"/>.
                  <span style="width:16px"/>.
                  <span style="width:16px"/>.
                  <span style="width:16px"/>.
                 </span>
								<div style="width:167mm;">
                 For rules of constructive ownership, see  instructions.  If “Yes,” complete (i) through (iv) 
                </div>
							</div>
							<div class="styGenericDiv">
								<div class="styIRS1120LNYesNoBox" style="height:7.5mm;padding-top:2.5mm;border-bottom-width:1px;">
									<span style="font-weight:normal;">
										<xsl:call-template name="PopulateYesBoxText">
											<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/IndivEstateTrustOwnPctVtngStk"/>
										</xsl:call-template>
									</span>
								</div>
								<div class="styIRS1120LNYesNoBoxRB" style="height:7.5mm;padding-top:2.5mm;border-right-width:0px;border-bottom-width:1px;">
									<span style="font-weight:normal;">
										<xsl:call-template name="PopulateNoBoxText">
											<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/IndivEstateTrustOwnPctVtngStk"/>
										</xsl:call-template>
									</span>
								</div>
								<div class="styShadingCell" style="width:6mm;height:3.5mm;"/>
								<div class="styShadingCellRB" style="width:6mm;height:3.5mm;border-right-width:0px;"/>
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;float:none;clear:none;border-top-width:1px;">
						<div class="styGenericDiv" style="height:4mm;padding-top:0mm;float:right;">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/IndivEstateTrustOwnStockInfo"/>
								<xsl:with-param name="containerHeight" select="5"/>
								<xsl:with-param name="containerID" select=" 'OFCctn2' "/>
								<xsl:with-param name="imageID" select=" 'OFCimg2' "/>
								<xsl:with-param name="buttonID" select=" 'OFCbtn2' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<!-- BEGIN Schedule E Line 4B Table -->
					<div class="styTableContainer" id="OFCctn2">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:95mm;font-weight:normal;">
										<span style="font-weight:normal">(i)</span> Name of Individual or Estate</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:35mm;font-weight:normal;">
										<span style="font-weight:normal;">(ii)</span> Identifying Number (if any)</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:20mm;font-weight:normal;">
										<span style="font-weight:normal;">(iii)</span> Country of Citizenship (see instructions)</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:36mm;font-weight:normal;border-right-width:0px;">
										<span style="font-weight:normal">(iv)</span> Percentage Owned in Voting Stock</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="($Print != $Separated) or (count($Form1120ScheduleK/IndivEstateTrustOwnStockInfo) &lt;= 5) ">
									<xsl:for-each select="$Form1120ScheduleK/IndivEstateTrustOwnStockInfo">
										<tr>
											<td class="styTableCellText" style="width:95mm;">
												<span style="width:2.5mm;">
													<xsl:if test="position()=1">
														<span class="styBoldText"/>
													</xsl:if>
												</span>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="IndividualEstateName"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellCtr" style="width:35mm;">
												<xsl:if test="IdentifyingNumber != ' '">
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="IdentifyingNumber"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</xsl:if>
												<xsl:if test="IdentifyingSSNNumber != ' '">
													<xsl:call-template name="PopulateSSN">
														<xsl:with-param name="TargetNode" select="IdentifyingSSNNumber"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</xsl:if>
												<xsl:if test="MissingIdentifyingNumberReason != ' '">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="MissingIdentifyingNumberReason"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</xsl:if>
												<xsl:if test="Blank != ' '">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="Blank"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</xsl:if>
											</td>
											<td class="styTableCell" style="width:20mm;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CountryOfCitizenship"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:36mm;border-right:0;">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="VotingStockPercentageOwned"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="count($Form1120ScheduleK/IndivEstateTrustOwnStockInfo)&lt; 1 or ((count($Form1120ScheduleK/IndivEstateTrustOwnStockInfo) &gt; 5) and ($Print = $Separated))">
									<tr>
										<td class="styTableCell" style="width:95mm;text-align:left;">
											<span class="styBoldText"/>
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/IndivEstateTrustOwnStockInfo"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellCtr" style="width:35mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:20mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:36mm;border-right:0;">
											<span style="width:1px;"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1120ScheduleK/IndivEstateTrustOwnStockInfo)&lt; 2  or ((count($Form1120ScheduleK/IndivEstateTrustOwnStockInfo) &gt; 5) and ($Print = $Separated))">
									<tr>
										<td class="styTableCell" style="width:95mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellCtr" style="width:35mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:20mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:36mm;border-right:0;">
											<span style="width:1px;"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1120ScheduleK/IndivEstateTrustOwnStockInfo)&lt; 3  or ((count($Form1120ScheduleK/IndivEstateTrustOwnStockInfo) &gt; 5) and ($Print = $Separated))">
									<tr>
										<td class="styTableCell" style="width:95mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellCtr" style="width:35mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:20mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:36mm;border-right:0;">
											<span style="width:1px;"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1120ScheduleK/IndivEstateTrustOwnStockInfo)&lt; 4  or ((count($Form1120ScheduleK/IndivEstateTrustOwnStockInfo) &gt; 5) and ($Print = $Separated))">
									<tr>
										<td class="styTableCell" style="width:95mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellCtr" style="width:35mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:20mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:36mm;border-right:0;">
											<span style="width:1px;"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1120ScheduleK/IndivEstateTrustOwnStockInfo)&lt; 5  or ((count($Form1120ScheduleK/IndivEstateTrustOwnStockInfo) &gt; 5) and ($Print = $Separated))">
									<tr>
										<td class="styTableCell" style="width:95mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellCtr" style="width:35mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:20mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:36mm;border-right:0;">
											<span style="width:1px;"/>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/IndivEstateTrustOwnStockInfo"/>
						<xsl:with-param name="containerHeight" select="5"/>
						<xsl:with-param name="containerID" select=" 'OFCctn2' "/>
						<xsl:with-param name="imageID" select=" 'OFCimg2' "/>
						<xsl:with-param name="buttonID" select=" 'OFCbtn2' "/>
					</xsl:call-template>
					<!-- END Schedule S Table -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;">
						<div style="float:right;">
							<span style="width:80px;"/>  
      Form <span class="styBoldText" style="font-size:8pt;">1120</span> (2008)
    </div>
					</div>
					<div class="styBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">Form 1120 (2008)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">4</span>
						</div>
					</div>
					<!-- END Page Break and Footer-->
					<!-- ****** Start here III ******* -->
					<div style="width:187mm;clear:both;border-top-width:1px;" class="styBB">
						<div style="height:4mm;width:23mm;" class="styPartName">Schedule K</div>
						<div style="height:4mm;width:164mm;" class="styPartDesc">Continued </div>
					</div>
					<!-- Line 5 -->
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">5</div>
						<div class="styLNDesc" style="width:167mm;height:4.5mm;">At the end of the tax year; did the corporation
          </div>
						<div class="styIRS1120LNYesNoBox" style="width:6mm;height:4.5mm;">yes</div>
						<div class="styIRS1120LNYesNoBox" style="width:6mm;height:4.5mm;border-right-width:0px;">no</div>
						<div class="styGenericDiv" style="width:187mm;height:4.5mm;">
							<div class="styLNLeftLtrBox" style="height:4.5mm;">a</div>
							<div class="styLNDesc" style="width:167mm;height:4.5mm;font-size:8.6px; ">
               Own directly 20% or more, or own, directly or indirectly, 50% or more of the total voting power of all classes of stock entitled to vote of any foreign or domestic corporation not included on <b>Form 851</b>? For rules constructive ownership, see instructions 
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
								<div style="width:167mm;height:3.5mm;padding-top:1.5mm;">If “Yes,” complete (i) through below (iv)</div>
							</div>
							<div class="styGenericDiv">
								<div class="styIRS1120LNYesNoBox" style="height:7.5mm;padding-top:2.5mm;border-bottom-width:1px;">
									<span style="font-weight:normal;">
										<xsl:call-template name="PopulateYesBoxText">
											<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/CorpOwnPercentVotingStock"/>
										</xsl:call-template>
									</span>
								</div>
								<div class="styIRS1120LNYesNoBoxRB" style="height:7.5mm;padding-top:2.5mm;border-right-width:0px;border-bottom-width:1px;">
									<span style="font-weight:normal;">
										<xsl:call-template name="PopulateNoBoxText">
											<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/CorpOwnPercentVotingStock"/>
										</xsl:call-template>
									</span>
								</div>
								<div class="styShadingCell" style="width:6mm;height:2.5mm;"/>
								<div class="styShadingCellRB" style="width:6mm;height:2.5mm;border-right-width:0px;"/>
							</div>
						</div>
					</div>
					<!-- ******start here IV *******-->
					<!-- BEGIN Schedule U Table -->
					<!-- BEGIN Schedule U Title -->
					<div class="styBB" style="width:187mm;float:none;clear:none;border-top-width:1px;">
						<div class="styGenericDiv" style="height:4mm;padding-top:0mm;float:right;">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/CorpOwnPercentVotingStockInfo"/>
								<xsl:with-param name="containerHeight" select="5"/>
								<xsl:with-param name="containerID" select=" 'OFCctn3' "/>
								<xsl:with-param name="imageID" select=" 'OFCimg3' "/>
								<xsl:with-param name="buttonID" select=" 'OFCbtn3' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<!-- END Schedule E Title -->
					<!-- BEGIN Schedule E Table -->
					<div class="styTableContainer" id="OFCctn3">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:95mm;font-weight:normal;">
										<span style="font-weight:normal">(i)</span> Name of Corporation</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:35mm;font-weight:normal;">
										<span style="font-weight:normal;">(ii)</span> Employer Identification Number  (if any)</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:20mm;font-weight:normal;">
										<span style="font-weight:normal;">(iii)</span> Country of Incorporation</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:36mm;font-weight:normal;border-right:0;">
										<span style="font-weight:normal">(iv)</span> Percentage Owned in Voting Stock</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="($Print != $Separated) or (count($Form1120ScheduleK/CorpOwnPercentVotingStockInfo) &lt;= 5) ">
									<xsl:for-each select="$Form1120ScheduleK/CorpOwnPercentVotingStockInfo">
										<tr>
											<td class="styTableCellText" style="width:95mm;padding-left:2.5mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine1"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine2"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellCtr" style="width:35mm;">
												<xsl:if test="EmployerIdentificationNumber !=' '">
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="EmployerIdentificationNumber"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</xsl:if>
												<xsl:if test="MissingEmployerIdNumberReason !=' '">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="MissingEmployerIdNumberReason"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</xsl:if>
											</td>
											<td class="styTableCell" style="width:20mm;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CountryOfIncorporation"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:36mm;border-right:0;">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="VotingStockOwned"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="count($Form1120ScheduleK/CorpOwnPercentVotingStockInfo)&lt; 1 or ((count($Form1120ScheduleK/CorpOwnPercentVotingStockInfo) &gt; 5) and ($Print = $Separated))">
									<tr>
										<td class="styTableCell" style="width:95mm;text-align:left;">
											<span class="styBoldText"/>
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/IndivEstateTrustOwnStockInfo"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellCtr" style="width:35mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:20mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:36mm;border-right-width:0px;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1120ScheduleK/CorpOwnPercentVotingStockInfo)&lt; 2  or ((count($Form1120ScheduleK/CorpOwnPercentVotingStockInfo) &gt; 5) and ($Print = $Separated))">
									<tr>
										<td class="styTableCell" style="width:95mm;text-align:left;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellCtr" style="width:35mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:20mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:36mm;border-right-width:0px;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1120ScheduleK/CorpOwnPercentVotingStockInfo)&lt; 3  or ((count($Form1120ScheduleK/CorpOwnPercentVotingStockInfo) &gt; 5) and ($Print = $Separated))">
									<tr>
										<td class="styTableCell" style="width:95mm;text-align:left;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellCtr" style="width:35mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:20mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:36mm;border-right-width:0px;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1120ScheduleK/CorpOwnPercentVotingStockInfo)&lt; 4  or ((count($Form1120ScheduleK/CorpOwnPercentVotingStockInfo) &gt; 5) and ($Print = $Separated))">
									<tr>
										<td class="styTableCell" style="width:95mm;text-align:left;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellCtr" style="width:35mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:20mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:36mm;border-right-width:0px;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1120ScheduleK/CorpOwnPercentVotingStockInfo)&lt; 5  or ((count($Form1120ScheduleK/CorpOwnPercentVotingStockInfo) &gt; 5) and ($Print = $Separated))">
									<tr>
										<td class="styTableCell" style="width:95mm;text-align:left;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellCtr" style="width:35mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:20mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:36mm;border-right-width:0px;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/CorpOwnPercentVotingStockInfo"/>
						<xsl:with-param name="containerHeight" select="5"/>
						<xsl:with-param name="containerID" select=" 'OFCctn3' "/>
						<xsl:with-param name="imageID" select=" 'OFCimg3' "/>
						<xsl:with-param name="buttonID" select=" 'OFCbtn3' "/>
					</xsl:call-template>
					<!-- END Schedule K Line 5A -->
					<div class="styGenericDiv" style="width:187mm;height:4.5mm;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;">b</div>
						<div class="styLNDesc" style="width:167mm;height:4.5mm; font-size:8px;">
               Own directly an interest of 20% or more, or own, directly or indirectly, an interest of 50% or more in any foreign or domestic partnership (including an entity treated as a partnership) or in the beneficial interest of a trust? For rules of constructive ownership, see instructions.
               <span class="styBoldText">
								<span style="width:16px"/>.
                  <span style="width:16px"/>.
                  <span style="width:16px"/>.
                  <span style="width:16px"/>.
                  <span style="width:16px"/>.
                  <span style="width:16px"/>.
               </span>
							<div style="width:167mm;padding-top:1mm;">If “Yes,” complete (i) through below (iv) </div>
						</div>
						<div class="styGenericDiv">
							<div class="styIRS1120LNYesNoBox" style="height:6.5mm;padding-top:2mm;border-bottom-width:1px;">
								<span style="font-weight:normal;">
									<xsl:call-template name="PopulateYesBoxText">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/CorpOwnPercentPartnership"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styIRS1120LNYesNoBoxRB" style="height:6.5mm;padding-top:2mm;border-right-width:0px;border-bottom-width:1px;">
								<span style="font-weight:normal;">
									<xsl:call-template name="PopulateNoBoxText">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/CorpOwnPercentPartnership"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styShadingCell" style="width:6mm;height:3.5mm;"/>
							<div class="styShadingCellRB" style="width:6mm;height:3.5mm;border-right-width:0px;"/>
						</div>
					</div>
					<!-- BEGIN Schedule K Line 5B Table -->
					<div class="styBB" style="width:187mm;float:none;clear:none;border-top-width:1px;">
						<div class="styGenericDiv" style="height:4mm;padding-top:0mm;float:right;">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/CorpOwnPercentPartnershipInfo"/>
								<xsl:with-param name="containerHeight" select="5"/>
								<xsl:with-param name="containerID" select=" 'OFCctn4' "/>
								<xsl:with-param name="imageID" select=" 'OFCimg4' "/>
								<xsl:with-param name="buttonID" select=" 'OFCbtn4' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<!-- END Schedule E Title -->
					<!-- BEGIN Schedule E Table -->
					<div class="styTableContainer" id="OFCctn4">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:95mm;font-weight:normal;">
										<span style="font-weight:normal">(i)</span> Name of Entity</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:35mm;font-weight:normal;">
										<span style="font-weight:normal;">(ii)</span> Employer Identification Number (if any)</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:20mm;font-weight:normal;">
										<span style="font-weight:normal;">(iii)</span> Country of Organization</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:36mm;font-weight:normal;border-right:0;">
										<span style="font-weight:normal">(iv)</span>Percentage Owned in Profit, Loss or Capital</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="($Print != $Separated) or (count($Form1120ScheduleK/CorpOwnPercentPartnershipInfo) &lt;= 5) ">
									<xsl:for-each select="$Form1120ScheduleK/CorpOwnPercentPartnershipInfo">
										<tr>
											<td class="styTableCellText" style="width:95mm;padding-left:2.5mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NameOfEntity/BusinessNameLine1"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NameOfEntity/BusinessNameLine2"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellCtr" style="width:35mm;">
												<xsl:if test="EmployerIdentificationNum !=' '">
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="EmployerIdentificationNum"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</xsl:if>
												<xsl:if test="MissingEmployerIdNumReason !=' '">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="MissingEmployerIdNumReason"/>
													</xsl:call-template>
													<span style="width:1px;"/>
												</xsl:if>
											</td>
											<td class="styTableCell" style="width:20mm;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CountryOfOrg"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:36mm;border-right:0;">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="MaxPercentOwnedProfitLossCap"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="count($Form1120ScheduleK/CorpOwnPercentPartnershipInfo)&lt; 1 or ((count($Form1120ScheduleK/CorpOwnPercentPartnershipInfo) &gt; 5) and ($Print = $Separated))">
									<tr>
										<td class="styTableCell" style="width:95mm;text-align:left;">
											<span class="styBoldText"/>
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/IndivEstateTrustOwnStockInfo"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellCtr" style="width:35mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:20mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:36mm;border-right-width:0px;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1120ScheduleK/CorpOwnPercentPartnershipInfo)&lt; 2  or ((count($Form1120ScheduleK/CorpOwnPercentPartnershipInfo) &gt; 5) and ($Print = $Separated))">
									<tr>
										<td class="styTableCell" style="width:95mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellCtr" style="width:35mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:20mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:36mm;border-right-width:0px;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1120ScheduleK/CorpOwnPercentPartnershipInfo)&lt; 3  or ((count($Form1120ScheduleK/CorpOwnPercentPartnershipInfo) &gt; 5) and ($Print = $Separated))">
									<tr>
										<td class="styTableCell" style="width:95mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellCtr" style="width:35mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:20mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:36mm;border-right-width:0px;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1120ScheduleK/CorpOwnPercentPartnershipInfo)&lt; 4  or ((count($Form1120ScheduleK/CorpOwnPercentPartnershipInfo) &gt; 5) and ($Print = $Separated))">
									<tr>
										<td class="styTableCell" style="width:95mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellCtr" style="width:35mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:20mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:36mm;border-right-width:0px;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1120ScheduleK/CorpOwnPercentPartnershipInfo)&lt; 5  or ((count($Form1120ScheduleK/CorpOwnPercentPartnershipInfo) &gt; 5) and ($Print = $Separated))">
									<tr>
										<td class="styTableCell" style="width:95mm;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellCtr" style="width:35mm;">
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:20mm">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:36mm;border-right-width:0px;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/CorpOwnPercentPartnershipInfo"/>
						<xsl:with-param name="containerHeight" select="5"/>
						<xsl:with-param name="containerID" select=" 'OFCctn4' "/>
						<xsl:with-param name="imageID" select=" 'OFCimg4' "/>
						<xsl:with-param name="buttonID" select=" 'OFCbtn4' "/>
					</xsl:call-template>
					<!-- END Schedule U Table -->
					<div class="GenericDiv" style="width:187mm;height:4.5mm;">
						<div class="styLNLeftNumBoxSD" style="height:4.5mm;">6</div>
						<div class="styLNDesc" style="width:167mm;height:4.5mm; ">
           During this tax year, did the corporation pay dividends (other than stock dividends and distributions in exchange for stock) in excess of the corporation’s current and accumulated earnings and profits? (See sections 301 and 316.) 
                <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/ExcessDividendsPaid"/>
							</xsl:call-template>
							<span class="styBoldText">
								<span style="width:16px"/>.
                                             <span style="width:16px"/>.
                                             <span style="width:16px"/>.
                                        </span>
						</div>
						<div class="styGenericDiv">
							<div class="styIRS1120LNYesNoBox" style="height:6.5mm;padding-top:3.5mm;border-bottom-width:1px;">
								<span style="font-weight:normal;">
									<xsl:call-template name="PopulateYesBoxText">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/ExcessDividendsPaid"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styIRS1120LNYesNoBoxRB" style="height:6.5mm;padding-top:3.5mm;border-right-width:0px;border-bottom-width:1px;">
								<span style="font-weight:normal;">
									<xsl:call-template name="PopulateNoBoxText">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/ExcessDividendsPaid"/>
									</xsl:call-template>
								</span>
							</div>
							<!--  <div class="styShadingCell" style="width:6mm;height:3.5mm;"/>
              <div class="styShadingCellRB" style="width:6mm;height:3.5mm;border-right-width:0px;"/> -->
						</div>
					</div>
					<!--  tester 4    -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:3.5mm;"/>
						<div class="styLNDesc" style="width:167mm;height:3.5mm; ">
                                     If "Yes," file <b>Form 5452,</b> Corporate Report of Nondividend Distributions
                               </div>
						<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
						<div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px;"/>
						<div class="styLNDesc" style="width:175mm;height:3.5mm;padding-left:8mm;">
                                      If this is a consolidated return, answer here for the parent corporation and on Form 851 for 
                                      each subsidiary
                                </div>
						<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
						<div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px;"/>
					</div>
					<div class="GenericDiv" style="width:187mm;height:4.5mm;">
						<div class="styLNLeftNumBoxSD" style="height:4.5mm;">7</div>
						<div class="styLNDesc" style="width:167mm;height:4.5mm; ">
 At any time during the tax year, did one foreign person own, directly or indirectly, at least 25% of <b>(a)</b> the total voting power of
all classes of the corporation’s stock entitled to vote or <b>(b)</b> the total value of all classes of the corporation’s stock?
    <span class="styBoldText">
								<span style="width:16px"/>.
            <span style="width:16px"/>.
           </span>
						</div>
						<div class="styGenericDiv">
							<div class="styIRS1120LNYesNoBox" style="height:5.5mm;padding-top:1.5mm;border-bottom-width:1px;">
								<span style="font-weight:normal;">
									<xsl:call-template name="PopulateYesBoxText">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/ForeignOwn25PercentStock"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styIRS1120LNYesNoBoxRB" style="height:5.5mm;padding-top:1.5mm;border-right-width:0px;border-bottom-width:1px;">
								<span style="font-weight:normal;">
									<xsl:call-template name="PopulateNoBoxText">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/ForeignOwn25PercentStock"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styShadingCell" style="width:6mm;height:3.5mm;"/>
							<div class="styShadingCellRB" style="width:6mm;height:3.5mm;border-right-width:0px;"/>
						</div>
					</div>
					<div class="GenericDiv" style="width:187mm;height:2.5mm;">
						<div class="styLNLeftLtrBox" style="height:2.5mm;font-weight:bold"/>
						<div class="styLNDesc" style="width:167mm;height:2.5mm; ">
           For rules of attribution, see section 318. If “Yes,” enter:
            </div>
						<div class="styGenericDiv">
							<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
							<div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px;"/>
						</div>
					</div>
					<div class="GenericDiv" style="width:187mm;height:2.5mm;">
						<div class="styLNLeftLtrBox" style="height:2.5mm;font-weight:bold">(i)</div>
						<div class="styLNDesc" style="width:167mm;height:2.5mm; ">
            Percentage owned
 <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
							<span style="width:3px;"/>
							<span style="border-bottom:1 solid black;width:46mm;text-align:right;">
								<xsl:call-template name="PopulatePercent">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/ForeignOwnStockPercent"/>
								</xsl:call-template>
							</span>
 and <span style="font-weight:bold"> (ii)</span> Owner’s country:
 <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
							<span style="width:3px;"/>
							<span style="border-bottom:1 solid black;width:42mm;text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/ForeignOwnStockCountry"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styGenericDiv">
							<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
							<div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px;"/>
						</div>
					</div>
					<div class="GenericDiv" style="width:187mm;height:2.5mm;">
						<div class="styLNLeftLtrBox" style="height:2.5mm;font-weight:bold">(c)</div>
						<div class="styLNDesc" style="width:167mm;height:2.5mm; ">
           The corporation may have to file <b>Form 5472</b>, Information Return of a 25% Foreign-Owned U.S. Corporation or a Foreign Corporation Engaged in a U.S. Trade or Business. Enter the number of Forms 5472 attached
                <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/NumberOfForm5472Attached"/>
							</xsl:call-template>
							<span style="width:2mm;"/>
							<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
							<span style="width:3px;"/>
							<span style="border-bottom:1 solid black;width:34mm;text-align:right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/NumberOfForm5472Attached"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styGenericDiv">
							<div class="styShadingCell" style="width:6mm;height:8.5mm;"/>
							<div class="styShadingCellRB" style="width:6mm;height:8.5mm;border-right-width:0px;"/>
						</div>
					</div>
					<!-- here VII -->
					<div class="GenericDiv" style="width:187mm;height:2.5mm;">
						<div class="styLNLeftNumBoxSD" style="height:2.5mm;font-weight:bold">8</div>
						<div class="styLNDesc" style="width:167mm;height:2.5mm; ">
Check this box if the corporation issued publicly offered debt instruments with original issue discount
<span class="styBoldText">
								<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          
            <span style="width:16px"/>.
           
         </span>
							<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
							<span style="width:3mm;"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/OfferedDebtInstruments"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleKOfferedDebtInstruments</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
						<div class="styGenericDiv">
							<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
							<div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px;"/>
						</div>
					</div>
					<div class="GenericDiv" style="width:187mm;height:2.5mm;">
						<div class="styLNLeftLtrBox" style="height:2.5mm;font-weight:bold"/>
						<div class="styLNDesc" style="width:167mm;height:2.5mm; ">
           If checked, the corporation may have to file <b>Form 8281</b>, Information Return for Publicly Offered Original Issue Discount Instruments.
            </div>
						<div class="styGenericDiv">
							<div class="styShadingCell" style="width:6mm;height:8.5mm;"/>
							<div class="styShadingCellRB" style="width:6mm;height:8.5mm;border-right-width:0px;"/>
						</div>
					</div>
					<div class="GenericDiv" style="width:187mm;height:2.5mm;">
						<div class="styLNLeftNumBoxSD" style="height:2.5mm;font-weight:bold">9</div>
						<div class="styLNDesc" style="width:167mm;height:2.5mm; ">
            Enter the amount of tax-exempt interest received or accrued during the tax year
 <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
							<span style="width:3px;">$</span>
							<span style="border-bottom:1 solid black;width:46mm;text-align:right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/TaxExemptInterest"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styGenericDiv">
							<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
							<div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px;"/>
						</div>
					</div>
					<div class="GenericDiv" style="width:187mm;height:2.5mm;">
						<div class="styLNLeftNumBox" style="height:2.5mm;font-weight:bold">10</div>
						<div class="styLNDesc" style="width:167mm;height:2.5mm; ">
            Enter the number of shareholders at the end of the tax year (if 100 or fewer)
 <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
							<span style="width:3px;"/>
							<span style="border-bottom:1 solid black;width:46mm;text-align:right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/NumberOfShareholders"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styGenericDiv">
							<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
							<div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px;"/>
						</div>
					</div>
					<div class="GenericDiv" style="width:187mm;height:2.5mm;">
						<div class="styLNLeftNumBox" style="height:2.5mm;font-weight:bold">11</div>
						<div class="styLNDesc" style="width:167mm;height:2.5mm; ">
          If the corporation has an NOL for the tax year and is electing to forego the carryback period, check here
                                   <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/NOLForegoCarryback"/>
							</xsl:call-template>
							<span class="styBoldText">
								<span style="width:16px"/>.
                                        <span style="width:16px"/>.
                                        <span style="width:16px"/>.
                                  </span>
							<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
							<span style="width:3mm;"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/NOLForegoCarryback"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleKNOLForegoCarryback
                  </xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
						<div class="styGenericDiv">
							<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
							<div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px;"/>
						</div>
					</div>
					<div class="GenericDiv" style="width:187mm;height:2.5mm;">
						<div class="styLNLeftLtrBox" style="height:2.5mm;font-weight:bold"/>
						<div class="styLNDesc" style="width:167mm;height:2.5mm; ">
                If the corporation is filing a consolidated return, the statement required by Regulations section 1.1502-21(b)(3) 
                   must be attached or the election will not be valid.
            </div>
						<div class="styGenericDiv">
							<div class="styShadingCell" style="width:6mm;height:8.5mm;"/>
							<div class="styShadingCellRB" style="width:6mm;height:8.5mm;border-right-width:0px;"/>
						</div>
					</div>
					<!--          <div class="GenericDiv" style="width:187mm;height:2.5mm;">
            <div class="styLNLeftNumBox" style="height:2.5mm;font-weight:bold">11</div>
            <div class="styLNDesc" style="width:167mm;height:2.5mm; ">
If the corporation has an NOL for the tax year and is electing to forego the carryback period, check here
                                   <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form1120ScheduleK/NOLForegoCarryback"/>
              </xsl:call-template>
              <span class="styBoldText">
                <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
         </span>
              <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
              <span style="width:3mm;"/>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleK/NOLForegoCarryback"/>
                  <xsl:with-param name="BackupName">IRS1120ScheduleKNOLForegoCarryback</xsl:with-param>
                </xsl:call-template>
              </input>
            </div>
            <div class="styGenericDiv">
              <div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
              <div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px;"/>
            </div>
          </div>   -->
					<div class="GenericDiv" style="width:187mm;height:2.5mm;">
						<div class="styLNLeftNumBox" style="height:2.5mm;font-weight:bold">12</div>
						<div class="styLNDesc" style="width:167mm;height:2.5mm; font-size:6pt; ">
            Enter the available NOL carryover from prior tax years (do not reduce it by any deduction on line 29a.)
 <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
							<span style="width:3px;">$</span>
							<span style="border-bottom:1 solid black;width:24mm;text-align:right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/NOLCarryoverFromPriorYear"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styGenericDiv">
							<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
							<div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px;"/>
						</div>
					</div>
					<div class="styTBB" style="width:187mm;height:4.5mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">13</div>
						<div class="styLNDesc" style="width:167mm;height:4.5mm; ">
 Are the corporation’s total receipts (line 1a plus lines 4 through 10 on page 1) for the tax year <b>and</b> its total assets at the end of
the tax year less than $250,000?
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
            <span style="width:16px"/>.
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
							<div style="width:155mm;font-size:6pt;">
                   If “Yes,” the corporation is not required to complete Schedules L, M-1, and M-2 on page 5. Instead, enter the 
                   total amount of cash distributions and the book value of property distributions (other than cash) made during the 
                   tax year.
                     <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
								<span style="width:3px;">$</span>
								<span style="border-bottom:1 solid black;width:24mm;text-align:right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/TotalCashDistribtions"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<div class="styGenericDiv">
							<div class="styIRS1120LNYesNoBox" style="height:5.5mm;padding-top:1.5mm;border-bottom-width:1px;">
								<span style="font-weight:normal;">
									<xsl:call-template name="PopulateYesBoxText">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/IsTotalReceiptsLessThan250000"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styIRS1120LNYesNoBoxRB" style="height:5.5mm;padding-top:1.5mm;border-right-width:0px;border-bottom-width:1px;">
								<span style="font-weight:normal;">
									<!--          <xsl:call-template name="PopulateNoBoxText">
              <xsl:with-param name="TargetNode" select="$Form1120ScheduleK/ControlledGroupMember" />
          </xsl:call-template>   -->
								</span>
							</div>
							<div class="styShadingCell" style="width:6mm;height:7.5mm;"/>
							<div class="styShadingCellRB" style="width:6mm;height:7.5mm;border-right-width:0px;"/>
						</div>
					</div>
					<!--  *******  This div was commented out -->
					<!--    </div>    -->
					<!-- THIS END DIV WAS COMMENTED OUT - THE PLACEMENT OF THIS END DIV WAS CAUSING PRINT ISSUES -->
					<!-- END Schedule K Line Items -->
					<!-- <div style="width:187mm;" class="styTBB">jjjjjj
 
  </div>     -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;">
						<div style="float:right;">
							<span style="width:80px;"/>  
      Form <span class="styBoldText" style="font-size:8pt;">1120</span> (2008)
    </div>
					</div>
					<!-- END Page Break and Footer-->
					<!--Begin Page 4 -->
					<!-- Page Header -->
					<div class="styBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">Form 1120 (2008)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">5</span>
						</div>
					</div>
					<!-- END Page Header -->
					<!-- BEGIN Schedule L Title -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:21mm;height:4mm;">Schedule L</div>
						<div class="styPartDesc" style="width:37mm;">Balance Sheets per Books</div>
						<div class="styLNAmountBox" style="text-align:center;border-bottom-width:0px;width:64mm;height:8mm;">Beginning of tax year</div>
						<div class="styLNAmountBox" style="text-align:center;border-bottom-width:0px;width:64mm;height:8mm;">End of tax year</div>
					</div>
					<!-- END Schedule L Title -->
					<!-- BEGIN Schedule L Line Items -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;"/>
						<div class="styGenericDiv" style="width:50mm;height:4.5mm;text-align:center;font-weight:bold;">Assets</div>
						<div class="styLNAmountBox" style="height:4.5mm;text-align:center;font-weight:bold;">(a)</div>
						<div class="styLNAmountBox" style="height:4.5mm;text-align:center;font-weight:bold;">(b)</div>
						<div class="styLNAmountBox" style="height:4.5mm;text-align:center;font-weight:bold;">(c)</div>
						<div class="styLNAmountBox" style="height:4.5mm;text-align:center;font-weight:bold;">(d)</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.5mm;">1</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;">Cash
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
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/CashBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/CashEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;padding-left:2.5mm;">2a</div>
						<div class="styLNDesc" style="width:50mm;height:5mm;">Trade notes and accounts receivable</div>
						<div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/TradeNotesAcctReceivableBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/TradeNotesAcctReceivableEOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;padding-left:4.5mm;">b</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;">Less allowance for bad debts
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
          <span style="width:16px"/>.
        </span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/BadDebtAllowanceBOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/NetTradeNotesAcctRcvblBOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/BadDebtAllowanceEOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/NetTradeNotesAcctRcvblEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.8mm;">3</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;">Inventories
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
        </span>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/InventoriesBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/InventoriesEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.8mm;">4</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;">U.S. government obligations
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
          <span style="width:16px"/>.
        </span>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/USGovernmentObligationsBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/USGovernmentObligationsEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.8mm;">5</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;font-size:6pt;padding-top:1mm;">
							<span>Tax-exempt securities (see instructions)</span>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/TaxExemptSecuritiesBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/TaxExemptSecuritiesEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5.5mm;padding-left:2.8mm;">6</div>
						<div class="styLNDesc" style="width:50mm;height:5.5mm;padding-top:1mm;">
							<span class="stySmallText">Other current assets (attach schedule)</span>
						</div>
						<div class="styShadingCell" style="height:5.5mm;"/>
						<div class="styLNFormLinkBox" style="height:5.5mm;">
							<!-- Form to Form Link -->
							<span style="width:2px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/OtherCurrentAssetsBOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="height:5.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/OtherCurrentAssetsBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5.5mm;"/>
						<div class="styLNFormLinkBox" style="height:5.5mm;">
							<!-- Form to Form Link -->
							<span style="width:2px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/OtherCurrentAssetsEOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="height:5.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/OtherCurrentAssetsEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.8mm;">7</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;">Loans to shareholders
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
        </span>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/LoansToShareholdersBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/LoansToShareholdersEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.8mm;">8</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;">Mortgage and real estate loans
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
        </span>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/MortgageRealEstateLoansBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/MortgageRealEstateLoansEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5.5mm;padding-left:2.8mm;">9</div>
						<div class="styLNDesc" style="width:50mm;height:5.5mm;">Other investments
        (attach schedule)
      </div>
						<div class="styShadingCell" style="height:5.5mm;"/>
						<div class="styLNFormLinkBox" style="height:5.5mm;">
							<!-- Form to Form Link -->
							<span style="width:2px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/OtherInvestmentsBOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="height:5.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/OtherInvestmentsBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5.5mm;font-family:arial;font-size:8pt;"/>
						<div class="styLNFormLinkBox" style="height:5.5mm;">
							<!-- Form to Form Link -->
							<span style="width:2px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/OtherInvestmentsEOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="height:5.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/OtherInvestmentsEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">10a</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;padding-top:1mm;">
							<span class="stySmallText">Buildings and other depreciable assets</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/BldgOtherDepreciableAssetsBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/BldgOtherDepreciableAssetsEOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftLtrBoxDD" style="height:4.5mm;">b</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;">Less accumulated depreciation
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
        </span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/AccumulatedDepreciationBOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/NetDepreciableAssetsBOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/AccumulatedDepreciationEOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/NetDepreciableAssetsEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">11a</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;">Depletable assets
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
        </span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/DepletableAssetsBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/DepletableAssetsEOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftLtrBoxDD" style="height:4.5mm;">b</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;">Less accumulated depletion
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
          <span style="width:16px"/>.
        </span>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/AccumulatedDepletionBOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/NetDepletableAssetsBOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/AccumulatedDepletionEOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/NetDepletableAssetsEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">12</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;">Land (net of any amortization)
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
        </span>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/LandBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/LandEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">13a</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;">Intangible assets (amortizable only)</div>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/IntangibleAssetsBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/IntangibleAssetsEOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftLtrBoxDD" style="height:4.5mm;">b</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;">Less accumulated amortization
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
        </span>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/AccumulatedAmortizationBOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/NetIntangibleAssetsBOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/AccumulatedAmortizationEOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/NetIntangibleAssetsEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5.5mm;">14</div>
						<div class="styLNDesc" style="width:50mm;height:5.5mm;">Other assets
        (attach schedule)
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
        </span>
						</div>
						<div class="styShadingCell" style="height:5.5mm;"/>
						<div class="styLNFormLinkBox" style="height:5.5mm;">
							<!-- Form to Form Link -->
							<span style="width:2px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/OtherAssetsBOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="height:5.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/OtherAssetsBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5.5mm;"/>
						<div class="styLNFormLinkBox" style="height:5.5mm;">
							<!-- Form to Form Link -->
							<span style="width:2px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/OtherAssetsEOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="height:5.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/OtherAssetsEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styBB" style="width:187mm;border-bottom-width:1px;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">15</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;">Total assets
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
        </span>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBoxNBB" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/TotalAssetsBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBoxNBB" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/TotalAssetsEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;"/>
						<div class="styGenericDiv" style="width:50mm;height:4.5mm;text-align:center;">
							<span class="styBoldText">Liabilities and Shareholders' Equity</span>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styShadingCell" style="height:4.5mm;"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">16</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;">Accounts payable
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
        </span>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/AccountsPayableBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/AccountsPayableEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:7mm;">17</div>
						<div class="styLNDesc" style="width:50mm;height:7mm;">
							<span>Mortgages, notes, bonds payable in less than 1 year</span>
						</div>
						<div class="styShadingCell" style="height:7.5mm;"/>
						<div class="styLNAmountBox" style="height:7.5mm;padding-top:3mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/ShortTermPayableBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:7.5mm;"/>
						<div class="styLNAmountBox" style="height:7.5mm;padding-top:3mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/ShortTermPayableEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5.5mm;">18</div>
						<div class="styLNDesc" style="width:50mm;height:5.5mm;font-size:6pt;padding-top:1mm;">
							<span>Other current liabilities (attach schedule)</span>
						</div>
						<div class="styShadingCell" style="height:5.5mm;"/>
						<div class="styLNFormLinkBox" style="height:5.5mm;">
							<!-- Form to Form Link -->
							<span style="width:2px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/OtherCurrentLiabilitiesBOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="height:5.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/OtherCurrentLiabilitiesBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5.5mm;"/>
						<div class="styLNFormLinkBox" style="height:5.5mm;">
							<!-- Form to Form Link -->
							<span style="width:2px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/OtherCurrentLiabilitiesEOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="height:5.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/OtherCurrentLiabilitiesEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">19</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;">Loans from shareholders
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
        </span>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/LoansFromShareholdersBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/LoansFromShareholdersEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:7mm;">20</div>
						<div class="styLNDesc" style="width:50mm;height:7mm;">
							<span>Mortgages, notes, bonds payable in 1 year or more</span>
						</div>
						<div class="styShadingCell" style="height:7.5mm;"/>
						<div class="styLNAmountBox" style="height:7.5mm;padding-top:3mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/LongTermPayableBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:7.5mm;"/>
						<div class="styLNAmountBox" style="height:7.5mm;padding-top:3mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/LongTermPayableEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5.5mm;">21</div>
						<div class="styLNDesc" style="width:50mm;height:5.5mm;">Other liabilities
        (attach schedule)
      </div>
						<div class="styShadingCell" style="height:5.5mm;"/>
						<div class="styLNFormLinkBox" style="height:5.5mm;border-top-width:1px;">
							<!-- Form to Form Link -->
							<span style="width:2px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/OtherLiabilitiesBOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="height:5.5mm;font-family:arial;font-size:8pt;border-top-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/OtherLiabilitiesBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5.5mm;"/>
						<div class="styLNFormLinkBox" style="height:5.5mm;border-top-width:1px;">
							<!-- Form to Form Link -->
							<span style="width:2px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/OtherLiabilitiesEOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="height:5.5mm;font-family:arial;font-size:8pt;border-top-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/OtherLiabilitiesEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 22 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">22</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;">
							<span style="width:20mm;" class="styLNDesc">Capital stock: </span>
							<span style="width:30mm;" class="styLNDesc">
								<span class="styBoldText">a</span> Preferred stock
        </span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/CapitalPreferredStockBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/CapitalPreferredStockEOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
					</div>
					<!-- line 22b -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;"/>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;">
							<span style="width:20mm;" class="styLNDesc"/>
							<span style="width:28mm;" class="styLNDesc">
								<span class="styBoldText">b</span> Common stock
        </span>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;border-bottom-width:2px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/CapitalCommonStockBOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;border-bottom-width:2px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/CapitalStockBOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;border-bottom-width:2px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/CapitalCommonStockEOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;border-bottom-width:2px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/CapitalStockEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 23 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">23</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;">Additional paid-in capital
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
          <span style="width:16px"/>.
        </span>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/AdditionalPaidInCapitalBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/AdditionalPaidInCapitalEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:7mm;">24</div>
						<div class="styLNDesc" style="width:50mm;height:7mm;">
							<span>Retained earnings—Appropriated (attach schedule)</span>
						</div>
						<div class="styShadingCell" style="height:7.5mm;"/>
						<div class="styLNFormLinkBox" style="height:7.5mm;padding-top:1.5mm;padding-top:3mm;">
							<!-- Form to Form Link -->
							<span style="width:2px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/RetainedEarningsApprBOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="height:7.5mm;padding-top:3mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/RetainedEarningsApprBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:7.5mm;"/>
						<div class="styLNFormLinkBox" style="height:7.5mm;padding-top:1.5mm;padding-top:3mm;">
							<!-- Form to Form Link -->
							<span style="width:2px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/RetainedEarningsApprEOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="height:7.5mm;padding-top:3mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/RetainedEarningsApprEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">25</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;">
        Retained earnings—Unappropriated
      </div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/RetainedEarningsUnapprBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/RetainedEarningsUnapprEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:7mm;">26</div>
						<div class="styLNDesc" style="width:50mm;height:7mm;">
							<span>Adjustments to shareholders' equity (attach schedule)</span>
						</div>
						<div class="styShadingCell" style="height:7.5mm;"/>
						<div class="styLNFormLinkBox" style="height:7.5mm;padding-top:1.5mm;padding-top:3mm;">
							<!-- Form to Form Link -->
							<span style="width:2px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/AdjToShareholdersEquityBOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="height:7.5mm;padding-top:3mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/AdjToShareholdersEquityBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:7.5mm;"/>
						<div class="styLNFormLinkBox" style="height:7.5mm;padding-top:1.5mm;padding-top:3mm;">
							<!-- Form to Form Link -->
							<span style="width:2px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/AdjToShareholdersEquityEOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="height:7.5mm;padding-top:3mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/AdjToShareholdersEquityEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">27</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;">Less cost of treasury stock
        <!--Dotted Line-->
							<span class="styBoldText">
								<span style="width:16px"/>.
          <span style="width:16px"/>.
        </span>
						</div>
						<div class="styShadingCell" style="height:5.5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;border-bottom-width:2px;">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/CostOfTreasuryStockBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5.5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;border-bottom-width:2px;">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/CostOfTreasuryStockEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">28</div>
						<div class="styGenericDiv" style="width:50mm;height:4.5mm;padding-top:1mm;">
							<span class="stySmallText">Total liabilities and shareholders' equity</span>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/TotalLiabilitiesEquityBOY"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleL/TotalLiabilitiesEquityEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END Schedule L Line Items -->
					<br style="page-break-after:always;"/>
					<!-- BEGIN Schedule M-1 Title -->
					<div class="styBB" style="width:187mm;border-top-width:1px;border-top:solid black;border-top-width:1px;">
						<div class="styPartName" style="width:28mm;">Schedule M-1</div>
						<div class="styPartDesc" style="width:158mm;">Reconciliation of Income (Loss) per Books With Income per Return<br/>
							<span class="styBoldText">Note: </span>
							<span class="styNormalText"> M-3 required instead of Schedule M-1 if total assets are $10 million or more—see instructions</span>
						</div>
					</div>
					<!-- END Schedule M-1 Title -->
					<!-- BEGIN Schedule M-1 Line Items -->
					<div class="styBB" style="width:187mm;clear:both;">
						<!-- BEGIN Left Side Table of Schedule M-1-->
						<table class="styTable" style="width:93mm;float:left;clear:none;font-size:7pt;" cellspacing="0">
							<thead/>
							<tfoot/>
							<tbody>
								<tr>
									<td class="styLNLeftNumBox" style="height:4.5mm;">1</td>
									<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">Net income (loss) per books
              <!--Dotted Line-->
										<span class="styBoldText">
											<span style="width:16px"/>.
               </span>
									</td>
									<td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;width:31mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1120ScheduleM1/NetIncomeLossPerBooks"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="height:4.5mm;">2</td>
									<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">Federal income tax per books
              <!--Dotted Line-->
										<span class="styBoldText">
											<span style="width:15px"/>.
              </span>
									</td>
									<td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;width:31mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1120ScheduleM1/FederalIncomeTaxPerBooks"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="height:4.5mm;">3</td>
									<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">
										<span class="stySmallText">Excess of capital losses over capital gains
                <span class="styBoldText"/>
										</span>
									</td>
									<td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;width:31mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1120ScheduleM1/ExcessOfCapLossesOverCapGains"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="height:4.5mm;">4</td>
									<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">Income subject to tax not recorded on</td>
									<td class="styShadingCell" style="height:4.5mm;border-right-width:1px;31mm;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="height:4.5mm;"/>
									<td class="styGenericDiv" style="width:50mm;height:4.5mm;" colspan="2">
										<div class="styGenericDiv" style="width:36mm;">books this year (itemize):
              </div>
										<div class="styIRS1120BBText" style="width:14mm;float:left;"/>
									</td>
									<td class="styShadingCell" style="height:4.5mm;border-right-width:1px;31mm;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styGenericDiv" style="height:4.5mm;">
									<td class="styLNLeftNumBox" style="height:4.5mm;"/>
									<td class="styGenericDiv" style="width:52mm;height:4.5mm;padding-right:.5mm;" colspan="2">
										<div class="styIRS1120BBText" style="width:51mm;text-align:right;padding-right:3mm;height:4.5mm;">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$Form1120ScheduleM1/TotalTaxableIncomeNotRecOnBks"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;width:31.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1120ScheduleM1/TotalTaxableIncomeNotRecOnBks"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="height:4.5mm;">5</td>
									<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">Expenses recorded on books this year</td>
									<td class="styShadingCell" style="height:4.5mm;border-right-width:1px;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="height:4.5mm;"/>
									<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">not deducted on this return (itemize):</td>
									<td class="styShadingCell" style="height:4.5mm;border-right-width:1px;width:31.5mm;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="height:4.5mm;">
										<span style="width:3mm;"/>a</td>
									<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">
										<div class="styGenericDiv" style="width:23.5mm;">Depreciation<span style="width:2mm;"/>$

              </div>
										<div class="styIRS1120BBText" style="width:23mm;float:left;text-align:right;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1120ScheduleM1/DepreciationExpenses"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</div>
									</td>
									<td class="styShadingCell" style="height:4.5mm;border-right-width:1px;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="height:4.5mm;vertical-align:top;">
										<span style="width:3mm;"/>b</td>
									<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">
										<div class="styGenericDiv" style="width:23.5mm;">Charitable contributions<span style="width:1.5mm;"/>$
              </div>
										<div class="styIRS1120BBText" style="width:23mm;float:left;text-align:right;font-size:6pt;padding-top:3mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1120ScheduleM1/CharitableContributionsExpense"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</div>
									</td>
									<td class="styShadingCell" style="height:4.5mm;border-right-width:1px;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<!-- line 5c Sch M-1 -->
								<tr>
									<td class="styLNLeftNumBox" style="vertical-align:top;">
										<span style="width:3mm;"/>c</td>
									<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">
										<div class="styGenericDiv" style="width:23.5mm;">Travel and entertainment 
                      <span style="font-size:6pt;"/>$
                      </div>
										<div class="styIRS1120BBText" style="width:23mm;float:left;text-align:right;font-size:6pt;padding-top:3mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1120ScheduleM1/TravelEntertainment"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</div>
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="height:4.5mm;border-right-width:1px;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styGenericDiv" style="height:4.5mm;">
									<td class="styLNLeftNumBox" style="height:4.5mm;"/>
									<td class="styGenericDiv" style="width:48mm;height:4.5mm;" colspan="2">
										<div class="styIRS1120BBText" style="width:51.5mm;text-align:right;padding-right:3mm;height:4.5mm;">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$Form1120ScheduleM1/TotalExpensesNotDeducted"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;border-bottom-width: 1px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1120ScheduleM1/TotalExpensesNotDeducted"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="height:4.5mm;padding-top:1.5mm">6</td>
									<td class="styGenericDiv" style="width:52mm;height:4.5mm;padding-top:1.5mm" colspan="2">Add lines 1 through 5
                       <!--Dotted Line-->
										<span class="styBoldText">
											<span style="width:16px"/>.
                <span style="width:16px"/>.
                <span style="width:16px"/>.
             </span>
									</td>
									<td class="styLNAmountBoxNBB" style="height:4.5mm;border-top-width:1px;border-right-width:1px;width:31.5mm;padding-top:1.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1120ScheduleM1/IncomeExpensesSubtotal"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
							</tbody>
						</table>
						<!-- END Left Side table of Schedule M-1-->
						<!-- BEGIN Right Side table of Schedule M-1-->
						<table class="styTable" style="width:94mm;float:left;clear:none;font-size:7pt;" cellspacing="0">
							<thead/>
							<tfoot/>
							<tbody>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBoxSD" style="height:4.5mm;width:7.5mm;">7</td>
									<td class="styGenericDiv" style="width:51.5mm;height:4.5mm;" colspan="2">Income recorded on books this year</td>
									<td class="styShadingCell" style="height:4.5mm;width:30.5mm;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBox" style="height:4.5mm;"/>
									<td class="styGenericDiv" style="width:51.5mm;height:4.5mm;" colspan="2">not included on this return (itemize):</td>
									<td class="styShadingCell" style="height:4.5mm;width:30.5mm;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styGenericDiv" style="width:51.5mm;">
									<td class="styLNLeftNumBox" style="height:4.5mm;"/>
									<td class="styGenericDiv" style="width:29mm;height:4.5mm;">
										<span class="stySmallText">Tax-exempt interest 
          <span style="width:4px;"/>
          $</span>
									</td>
									<td class="styIRS1120BBText" style="width:23mm;font-size:6pt;text-align:right;font-family:verdana;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1120ScheduleM1/TaxExemptInterest"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
									<td class="styShadingCell" style="height:4.5mm;width:30.5mm;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styGenericDiv" style="height:4.5mm;">
									<td class="styLNLeftNumBox" style="height:4.5mm;"/>
									<td class="styGenericDiv" style="width:51.5mm;height:4.5mm;padding-right:.5mm;" colspan="2">
										<div class="styIRS1120BBText" style="width:51.5mm;text-align:right;padding-right:3mm;height:4.5mm;"/>
									</td>
									<td class="styShadingCell" style="height:4.5mm;width:30.5mm;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styGenericDiv" style="height:4.5mm;">
									<td class="styLNLeftNumBox" style="height:4.5mm;"/>
									<td class="styGenericDiv" style="width:51.5mm;height:4.5mm;padding-right:.5mm;" colspan="2">
										<div class="styIRS1120BBText" style="width:51.5mm;text-align:right;padding-right:3mm;height:4.5mm;">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$Form1120ScheduleM1/TotalIncomeRecordedNotIncluded"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="styLNAmountBox" style="height:4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1120ScheduleM1/TotalIncomeRecordedNotIncluded"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBoxSD" style="height:4.5mm;">8</td>
									<td class="styGenericDiv" style="width:51.5mm;height:4.5mm;" colspan="2">
										<span class="stySmallText">Deductions on this return not charged</span>
									</td>
									<td class="styShadingCell" style="height:4.5mm;width:30.5mm;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBox" style="height:4.5mm;"/>
									<td class="styGenericDiv" style="width:51.5mm;height:4.5mm;" colspan="2">
										<span class="stySmallText">against book income this year (itemize):</span>
									</td>
									<td class="styShadingCell" style="height:4.5mm;width:30.5mm;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="height:4.5mm;">
										<span style="width:3mm;"/>a</td>
									<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">
										<div class="styGenericDiv" style="width:22.5mm;">Depreciation<span style="width:2mm;"/>$
              </div>
										<div class="styIRS1120BBText" style="width:23mm;float:left;text-align:right;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1120ScheduleM1/DepreciationDeduction"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</div>
									</td>
									<td class="styShadingCell" style="height:4.5mm;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr>
									<td class="styLNLeftNumBox" style="height:4.5mm;vertical-align:top;">
										<span style="width:3mm;"/>b</td>
									<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">
										<div class="styGenericDiv" style="width:22.5mm;">Charitable contributions<span style="width:1.5mm;"/>$
              </div>
										<div class="styIRS1120BBText" style="width:23mm;height:8mm;float:left;text-align:right;font-size:6pt;padding-top:4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1120ScheduleM1/CharitableContributionsDed"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</div>
									</td>
									<td class="styShadingCell" style="height:4.5mm;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styGenericDiv" style="height:4.5mm;">
									<td class="styLNLeftNumBox" style="height:4.5mm;"/>
									<td class="styGenericDiv" style="width:51.5mm;height:4.5mm;padding-right:.5mm;" colspan="2">
										<div class="styIRS1120BBText" style="width:51.5mm;text-align:right;padding-right:3mm;height:4.5mm;"/>
									</td>
									<td class="styShadingCell" style="height:4.5mm;width:30.5mm;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr class="styGenericDiv" style="height:4.5mm;">
									<td class="styLNLeftNumBox" style="height:4.5mm;"/>
									<td class="styGenericDiv" style="width:52mm;height:4.5mm;padding-right:.5mm;" colspan="2">
										<div class="styIRS1120BBText" style="width:51.5mm;text-align:right;padding-right:3mm;height:4.5mm;">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$Form1120ScheduleM1/TotalDeductionsNotCharged"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="styLNAmountBox" style="height:4.5mm;border-bottom-width:1px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1120ScheduleM1/TotalDeductionsNotCharged"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<!--Sch M-1 line 9 left side -->
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBoxSD" style="height:5.5mm;">9</td>
									<td class="styGenericDiv" style="width:52mm;height:5.5mm;" colspan="2">Add lines 7 and 8
            <!--Dotted Line-->
										<span class="styBoldText">
											<span style="width:15px"/>.
              <span style="width:15px"/>.
              <span style="width:15px"/>.
              <span style="width:15px"/>.
              <span style="width:15px"/>.
            </span>
									</td>
									<td class="styLNAmountBox" style="height:5.5mm;border-top-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1120ScheduleM1/IncomeDeductionsSubtotal"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</td>
								</tr>
								<!--Sch m-1 line 10 left side -->
								<tr class="styGenericDiv">
									<td class="styLNLeftNumBox" style="height:4.5mm;">10</td>
									<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">
										<span class="stySmallText">Income (page 1, line 28)—line 6 less line 9</span>
									</td>
									<td class="styLNAmountBox" style="height:4.5mm;border-bottom-width: 0px; padding-top:1mm;border-top-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1120ScheduleM1/Income"/>
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
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:28mm;">Schedule M-2</div>
						<div class="styPartDesc" style="width:158mm;height:">
      Analysis of Unappropriated Retained Earnings per Books
      (Line 25, Schedule L)
    </div>
					</div>
					<!-- END Schedule M-2 Title -->
					<!-- BEGIN Schedule M-2 Line Items -->
					<div style="width:187mm;clear:both;" class="styBB">
						<!-- BEGIN Left Side Table of Schedule M-2-->
						<table class="styTable" style="width:93mm;float:left;clear:none;font-size:7pt;" cellspacing="0">
							<tr class="styGenericDiv">
								<td class="styLNLeftNumBox" style="height:4.5mm;">1</td>
								<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">Balance at beginning of year
            <!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
								</td>
								<td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;border-bottom:1 solid black;border-bottom-width:2px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM2/BalanceBOY"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr class="styGenericDiv">
								<td class="styLNLeftNumBox" style="height:4.5mm;">2</td>
								<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">Net income (loss) per books
            <!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
								</td>
								<td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM2/NetIncomeLossPerBooks"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<!-- line 3 Sch M-2 -->
							<tr class="styGenericDiv">
								<td class="styLNLeftNumBox" style="height:4.5mm;">3</td>
								<td class="styLNDesc" style="width:52mm;height:4.5mm;vertical-align:bottom;padding-top:1.5mm;" colspan="2">
									<div class="styGenericDiv" style="width:38mm;">Other increases (itemize):
          </div>
									<div class="styIRS1120BBText" style="width:11mm;float:left;"/>
								</td>
								<td class="styShadingCell" style="height:4.5mm;border-right-width:1px;">
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr class="styGenericDiv" style="height:4.5mm;">
								<td class="styLNLeftNumBox" style="height:4.5mm;"/>
								<td class="styGenericDiv" style="width:52mm;height:4.5mm;padding-right:2mm;" colspan="2">
									<div class="styIRS1120BBText" style="width:49mm;"/>
								</td>
								<td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;background-color:lightgrey;">
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr class="styGenericDiv" style="height:4.5mm;">
								<td class="styLNLeftNumBox" style="height:4.5mm;"/>
								<td class="styGenericDiv" style="width:52mm;height:4.5mm;padding-right:2mm;" colspan="2">
									<div class="styIRS1120BBText" style="width:49mm;text-align:right;height:4.5mm;padding-right:3mm;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120ScheduleM2/TotalOtherIncreases"/>
										</xsl:call-template>
									</div>
								</td>
								<td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;border-bottom-width: 2px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM2/TotalOtherIncreases"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<!-- line 4 Sch M-2 -->
							<tr class="styGenericDiv">
								<td class="styLNLeftNumBox" style="height:4.5mm;border-bottom-width:2px;">4</td>
								<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">Add lines 1, 2, and 3
            <!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
								</td>
								<td class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM2/BalanceIncomeOtherIncreases"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
						</table>
						<!-- END Left Side Table of Schedule M-2-->
						<!-- BEGIN Right Side Table of Schedule M-2-->
						<table class="styTable" style="width:94mm;float:left;clear:none;font-size:7pt;" cellspacing="0">
							<tr class="styGenericDiv">
								<td class="styLNLeftNumBox" style="height:4.5mm;">5</td>
								<td class="styGenericDiv" style="width:20mm;height:4.5mm;">
            Distributions:
          </td>
								<td class="styGenericDiv" style="width:32mm;height:4.5mm;">
									<span class="styBoldText">a</span>
									<span style="width:4px"/>Cash
            <!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
								</td>
								<td class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM2/CashDistribution"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr class="styGenericDiv">
								<td class="styLNLeftNumBox" style="height:4.5mm;"/>
								<td class="styGenericDiv" style="width:20mm;height:4.5mm;"/>
								<td class="styGenericDiv" style="width:32mm;height:4.5mm;">
									<span class="styBoldText">b</span>
									<span style="width:4px"/>Stock
            <!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
								</td>
								<td class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM2/StockDistribution"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr class="styGenericDiv">
								<td class="styLNLeftNumBox" style="height:4.5mm;"/>
								<td class="styGenericDiv" style="width:20mm;height:4.5mm;"/>
								<td class="styGenericDiv" style="width:32mm;height:4.5mm;">
									<span class="styBoldText">c</span>
									<span style="width:4px"/>Property
            <!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
								</td>
								<td class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM2/PropertyDistribution"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<!-- line 6 M-2 -->
							<tr class="styGenericDiv">
								<td class="styLNLeftNumBox" style="height:4.75mm;">6</td>
								<td class="styGenericDiv" style="width:52mm;height:4.75mm;padding-top:1.5mm;" colspan="2">
									<div class="styGenericDiv" style="width:36mm;">Other decreases (itemize):
          </div>
									<div class="styIRS1120BBText" style="width:13mm;float:left;height:4.75mm;text-align:right;padding-right:2mm;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120ScheduleM2/TotalOtherDecreases"/>
										</xsl:call-template>
									</div>
								</td>
								<td class="styLNAmountBox" style="height:4.75mm;vertical-align:bottom;border-bottom-width: 2px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM2/TotalOtherDecreases"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<!-- line 7 M-2 -->
							<tr class="styGenericDiv">
								<td class="styLNLeftNumBox" style="height:5mm;">7</td>
								<td class="styGenericDiv" style="width:52mm;height:5mm;" colspan="2">Add lines 5 and 6
            <!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
								</td>
								<td class="styLNAmountBox" style="height:5mm;border-bottom-width: 2px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM2/DistributionsOtherDecreases"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<!-- line 8 Sch M-2 -->
							<tr class="styGenericDiv">
								<td class="styLNLeftNumBox" style="height:5mm;">8</td>
								<td class="styGenericDiv" style="width:52mm;height:5mm;" colspan="2">
									<span class="stySmallText">Balance at end of year(line 4 less line 7)</span>
								</td>
								<td class="styLNAmountBoxNBB" style="height:5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120ScheduleM2/BalanceEOY"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
						</table>
						<!-- END Right Side Table of Schedule M-2-->
					</div>
					<!-- END Schedule M-2 Line Items -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;border-top:1 solid black;border-top-width1px;">
						<div style="width:100mm;float:left;">
							<span style="width:90mm;"/>
						</div>
						<div style="float:right;">
							<span style="width:80px;"/>  
      Form <span class="styBoldText" style="font-size:8pt;">1120</span> (2008)
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
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form1120Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Return Software ID</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$RtnHdrData/SoftwareId"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Return Software Version</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$RtnHdrData/SoftwareVersion"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Form 1120, Top Left Margin - Section Section 444 Indicator
        </xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120Data/@section444Indicator"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Form 1120, Top Left Margin - Section 1291 Interest Indicator
        </xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120Data/@section1291InterestIndicator"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Form 1120, Top Left Margin - Section 1291 Interest Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120Data/@section1291InterestAmount"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Form 1120, Top Left Margin - Section 1294 Interest Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120Data/@section1294InterestIndicator"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Form 1120, Top Left Margin - Section 1294 Interest Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120Data/@section1294InterestAmount"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Form 1120, Top Left Margin - Section 501d Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120Data/@section501dIndicator"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Form 1120, Top Left Margin - FILED PURSUANT TO SECTION 301.9100-2</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120Data/@section30191002ElectionInd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Form 1120, Top Left Margin - Subchapter T Cooperative Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120Data/@subchapterTCoopIndicator"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Form 1120, Top Left Margin - Support Statement to Consolidated Return Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120Data/@suprtStmtToCnsldtReturnInd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Form 1120, Section A, Line 1a - Is Parent Return</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120Data/IsParentReturn"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Form 1120, Section A, Line 1a - Is Subsidiary Return</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120Data/IsSubsidiaryReturn"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 5b - Form 5735 Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/CreditsFromForm8834/
                        @form5735Indicator"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 5b - Form 5735 Amount </xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/CreditsFromForm8834/
                        @form5735IndicatorAmount"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 9 - Form 4684 Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120Data/NetGainLoss/@form4684Indicator"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 10 - Other Income Item</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120Data/OtherIncome/@otherIncomeItem"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 30 - CCF Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120Data/TaxableIncome/@cCFIndicator"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 30 - CCF Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120Data/TaxableIncome/@cCFAmount"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 32b - Beneficiary Of Trust Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120Data/EstimatedTaxPayments/@beneficiaryOfTrustIndicator"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 32b - Beneficiary Of Trust Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120Data/EstimatedTaxPayments/@beneficiaryOfTrustAmount"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 32b - Form 8816 Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120Data/EstimatedTaxPayments/@f8816Indicator"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 32b - Form 8816 Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120Data/EstimatedTaxPayments/@f8816Amount"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 32b - Section 847 Deduction Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120Data/EstimatedTaxPayments/@section847DeductionIndicator"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 32f(1) - Backup Withholding Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120Data/UndistributedCapitalGainsCr/@backupWithholdingIndicator"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 32f(1) - Backup Withholding Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120Data/UndistributedCapitalGainsCr/@backupWithholdingAmount"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 32f(2) - Ozone Depleting Chemicals Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120Data/CreditForFederalTaxOnFuels/@ozoneDepletingChemicalsInd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 32f - Other Refundable Credits Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120Data/TotalCredits/@otherRefundableCreditsInd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 32f - Other Refundable Credits Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120Data/TotalCredits/@otherRefundableCreditsAmount"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Schedule J Line 2 - Section 1291 Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/IncomeTax/@section1291Indicator"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Schedule J Line 2 - Section 1291 Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/IncomeTax/@section1291Amount"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Schedule J Line 2 - Section 197 Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/IncomeTax/@section197Indicator"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Schedule J Line 2 - Section 197 Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/IncomeTax/@section197Amount"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Schedule J Line 9 - Form 8693 Approved Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/TotalOtherTaxes/@f8693ApprovedIndicator"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Schedule J Line 9 - Form 8693 Approval Date</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/TotalOtherTaxes/@f8693ApprovalDate"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Schedule J Line 9 - Form Section1260B Indicator </xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/TaxFromForm4255/@section1260BIndicator"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Schedule J Line 9 - Form Section1260B Amount </xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/TaxFromForm4255/@section1260BAmount"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
			<!--			<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Schedule J Line 10 - Form 8693 Approved Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/TotalOtherTaxes/@f8693ApprovedIndicator"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>  -->
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Schedule K Line 3 - Parent Corporation Name Control</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/ParentCorporationNameControl"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<br/>
					<!-- END Left Over Table -->
					<!-- Begin Separated Repeating data table -->
					<xsl:if test="($Print = $Separated) and (count($Form1120ScheduleE/Officer) &gt; 5)">
						<span class="styRepeatingDataTitle">Form 1120, Schedule E -  Compensation of Officers:</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:80mm;">
										<span style="font-weight:bold;">(a)</span> Name of officer</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:23mm;">
										<span style="font-weight:bold;">(b)</span> Social security number</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:20mm;">
										<span style="font-weight:bold;">(c)</span> Percent of time devoted to business</th>
									<th class="styDepTblCell" scope="col" colspan="2" style="width:40mm;">Percent of corporation stock owned</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:26mm;border-right:0;">
										<span style="font-weight:bold;">(f)</span> Amount of compensation </th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:20mm;">
										<span class="styBoldText">(d)</span> Common</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;">
										<span class="styBoldText">(e)</span> Preferred</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1120ScheduleE/Officer">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:60mm;">
											<span style="width:4mm;font-weight:bold;" class="styGenericDiv">
												<xsl:number value="position()" format="1"/>
											</span>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="NameOfOfficer"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellCtr" style="width:31mm;">
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="SocialSecurityNumber"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:22mm">
											<span style="width:1px;"/>
											<xsl:call-template name="PopulatePercent">
												<xsl:with-param name="TargetNode" select="PercentTimeDevotedToBusiness"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="width:21mm">
											<span style="width:1px;"/>
											<xsl:call-template name="PopulatePercent">
												<xsl:with-param name="TargetNode" select="PercentCommonStockOwned"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="width:21mm">
											<span style="width:1px;"/>
											<xsl:call-template name="PopulatePercent">
												<xsl:with-param name="TargetNode" select="PercentPreferredStockOwned"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="width:32mm;border-right:0;">
											<span style="width:1px;"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="AmountOfCompensation"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- #########new start 1 #######-->
					<div style="width:187mm;"/>
					<xsl:if test="($Print = $Separated) and (count($Form1120ScheduleK/PartshpCorpTrustOwnStockInfo) &gt; 6)">
						<span class="styRepeatingDataTitle">Form 1120, Schedule K, Line 4a -  Partnership, Corporation, or Trust owning voting stock:</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:95mm;">
										<span style="font-weight:bold;">(i)</span> EntityName</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:23mm;">
										<span style="font-weight:bold;">(ii)</span> Employer Identification Number (if any)</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:23mm;">
										<span style="font-weight:bold;">(iii)</span> Type of Entity</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:23mm;">
										<span style="font-weight:bold;">(iv)</span>Country of Organization</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:20mm;">
										<span style="font-weight:bold;">(v)</span> Percentage Owned in Voting Stock</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1120ScheduleK/PartshpCorpTrustOwnStockInfo">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:95mm;">
											<span style="width:4mm;font-weight:bold;" class="styGenericDiv">
												<xsl:number value="position()" format="1"/>
											</span>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="EntityName/BusinessNameLine1"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="EntityName/BusinessNameLine2"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellCtr" style="width:23mm;">
											<xsl:if test="EmplrIdentificationNumber !=' '">
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="EmplrIdentificationNumber"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</xsl:if>
											<xsl:if test="EINMissingReason !=' '">
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="EINMissingReason"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</xsl:if>
										</td>
										<td class="styTableCellCtr" style="width:23mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="EntityType"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styTableCellCtr" style="width:23mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CountryOfOrganization"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:20mm">
											<span style="width:1px;"/>
											<xsl:call-template name="PopulatePercent">
												<xsl:with-param name="TargetNode" select="PercentageOwnedVotingStock"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Table 2 -->
					<div style="width:187mm;"/>
					<xsl:if test="($Print = $Separated) and (count($Form1120ScheduleK/PartshpCorpTrustOwnStockInfo) &gt; 6)">
						<span class="styRepeatingDataTitle">Form 1120, Schedule K, Line 4b - Individual, Estate or Trust owning  20% to 50%  of the corporation's voting stock</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:80mm;">
										<span style="font-weight:bold;">(i)</span> Name of Corporation</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:23mm;">
										<span style="font-weight:bold;">(ii)</span> Employer Identification Number</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:23mm;">
										<span style="font-weight:bold;">(iii)</span> Country of Citizenship </th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:20mm;">
										<span style="font-weight:bold;">(iv)</span> Percentage Owned in Voting Stock</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1120ScheduleK/IndivEstateTrustOwnStockInfo">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:60mm;">
											<span style="width:4mm;font-weight:bold;" class="styGenericDiv">
												<xsl:number value="position()" format="1"/>
											</span>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="IndividualEstateName"/>
											</xsl:call-template>
											<span style="width:3mm;"/>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellCtr" style="width:31mm;">
											<xsl:if test="IdentifyingNumber !=' '">
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="IdentifyingNumber"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</xsl:if>
											<xsl:if test="IdentifyingSSNNumber !=' '">
												<xsl:call-template name="PopulateSSN">
													<xsl:with-param name="TargetNode" select="IdentifyingSSNNumber"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</xsl:if>
											<xsl:if test="MissingIdentifyingNumberReason !=' '">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="MissingIdentifyingNumberReason"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</xsl:if>
											<xsl:if test="Blank !=' '">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="Blank"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</xsl:if>
										</td>
										<td class="styTableCellCtr" style="width:31mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CountryOfCitizenship"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:22mm">
											<span style="width:1px;"/>
											<xsl:call-template name="PopulatePercent">
												<xsl:with-param name="TargetNode" select="VotingStockPercentageOwned"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- table 3 -->
					<div style="width:187mm;"/>
					<xsl:if test="($Print = $Separated) and (count($Form1120ScheduleK/CorpOwnPercentVotingStockInfo) &gt; 6)">
						<span class="styRepeatingDataTitle">Form 1120, Schedule K, Line 5a -  Partnership, Corporation, or Trust owning 20% - 50% of the corporation's voting stock</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:121mm;">
										<span style="font-weight:bold;">(i)</span> Name of Corporation</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:23mm;">
										<span style="font-weight:bold;">(ii)</span> Employer Identification Number (if any)</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:23mm;">
										<span style="font-weight:bold;">(iii)</span>Country of Incorporation</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:20mm;">
										<span style="font-weight:bold;">(iv)</span> Percentage Owned in Voting Stock</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1120ScheduleK/CorpOwnPercentVotingStockInfo">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:121mm;">
											<span style="width:4mm;font-weight:bold;" class="styGenericDiv">
												<xsl:number value="position()" format="1"/>
											</span>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine1"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine2"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellCtr" style="width:23mm;">
											<xsl:if test="EmployerIdentificationNumber !=' '">
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="EmployerIdentificationNumber"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</xsl:if>
											<xsl:if test="MissingEmployerIdNumberReason !=' '">
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="MissingEmployerIdNumberReason"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</xsl:if>
										</td>
										<td class="styTableCellCtr" style="width:23mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CountryOfIncorporation"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:20mm">
											<span style="width:1px;"/>
											<xsl:call-template name="PopulatePercent">
												<xsl:with-param name="TargetNode" select="VotingStockOwned"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- table 4 -->
					<div style="width:187mm;"/>
					<xsl:if test="($Print = $Separated) and (count($Form1120ScheduleK/CorpOwnPercentPartnershipInfo) &gt; 6)">
						<span class="styRepeatingDataTitle">Form 1120, Schedule K, Line 5b -  Corporation owning 20% -50% or more in foreign or domestic partnership</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:121mm;">
										<span style="font-weight:bold;">(i)</span> Name of Entity</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:23mm;">
										<span style="font-weight:bold;">(ii)</span> Employer Identification Number (if any)</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:23mm;">
										<span style="font-weight:bold;">(iii)</span>Country of Organization</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:20mm;">
										<span style="font-weight:bold;">(iv)</span> Percentage Owned in Voting Stock</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1120ScheduleK/CorpOwnPercentPartnershipInfo">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:121mm;">
											<span style="width:4mm;font-weight:bold;" class="styGenericDiv">
												<xsl:number value="position()" format="1"/>
											</span>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="NameOfEntity/BusinessNameLine1"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="NameOfEntity/BusinessNameLine2"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellCtr" style="width:23mm;">
											<xsl:if test="EmployerIdentificationNum !=' '">
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="EmployerIdentificationNum"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</xsl:if>
											<xsl:if test="MissingEmployerIdNumReason !=' '">
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="MissingEmployerIdNumReason"/>
												</xsl:call-template>
												<span style="width:1px;"/>
											</xsl:if>
										</td>
										<td class="styTableCellCtr" style="width:23mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CountryOfOrg"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td class="styTableCell" style="width:20mm">
											<span style="width:1px;"/>
											<xsl:call-template name="PopulatePercent">
												<xsl:with-param name="TargetNode" select="MaxPercentOwnedProfitLossCap"/>
											</xsl:call-template>
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
