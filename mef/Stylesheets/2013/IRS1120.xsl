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
	<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
	  <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
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
		  <!--HINTS 1: Tester will insist that the header is incorrected with ", TY, and ending".  
                         This is invalid claim, the , TY is part of the begining and ending date.  
                         DO NOT update your Code per tester invalid claim. -->
		  <!--HINTS 2: Tester will expect a pen and ink or push pin for Special Condition.  
												 This is invalid claim, because Special Condition field is defined as an input field in the Schema 
												 and the data is displayed in the additional Data section.
												 DO NOT update your Code per tester invalid claim. -->
		  <!-- Exception: Contained shortPeriodReason112011120FInd whre 1120 E&A does not -->
		  <xsl:if test="not($Print) or $Print=''">
			<xsl:call-template name="IRS1120Style"/>
			<xsl:call-template name="AddOnStyle"/>
		  </xsl:if>
		</style>
		<xsl:call-template name="GlobalStylesForm"/>
	  </head>
	  <body class="styBodyClass">
		<form name="IRS1120">
		  <xsl:call-template name="DocumentHeader"/>
		  <div class="styBB" style="width:187mm;border-bottom-width:1px;">
			<div class="styFNBox" style="width:33.5mm;height:19mm;border-right-width:.5mm;">
        Form <span class="styFormNumber">1120</span>
			  <br/>
			  <xsl:call-template name="SetFormLinkInline">
				<xsl:with-param name="TargetNode" select="$Form1120Data"/>
			  </xsl:call-template>
			  <span style="width:3px;"/>
			  <xsl:call-template name="LinkToLeftoverDataTableInline">
				<xsl:with-param name="Desc">Form 1120, Top Left Margin - Section 1291 Interest Indicator</xsl:with-param>
				<xsl:with-param name="TargetNode" select="$Form1120Data/@section1291InterestCd"/>
			  </xsl:call-template>
			  <!-- Amount display in blue-->
			  <xsl:call-template name="LinkToLeftoverDataTableInline">
				<xsl:with-param name="Desc">Form 1120, Top Left Margin - Section 1291 Interest Amount</xsl:with-param>
				<xsl:with-param name="TargetNode" select="$Form1120Data/@section1291InterestAmt"/>
			    <xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
			  </xsl:call-template>
			  <xsl:call-template name="LinkToLeftoverDataTableInline">
				<xsl:with-param name="Desc">Form 1120, Top Left Margin - Section 1294 Interest Indicator</xsl:with-param>
				<xsl:with-param name="TargetNode" select="$Form1120Data/@section1294InterestCd"/>
				<xsl:with-param name="Style">padding-left:6mm;</xsl:with-param>
			  </xsl:call-template>
			  <xsl:call-template name="LinkToLeftoverDataTableInline">
				<xsl:with-param name="Desc">Form 1120, Top Left Margin - Section 1294 Interest Amount</xsl:with-param>
				<xsl:with-param name="TargetNode" select="$Form1120Data/@section1294InterestAmt"/>
				<xsl:with-param name="Style">padding-left:9mm;</xsl:with-param>
			  </xsl:call-template>
			  <xsl:call-template name="LinkToLeftoverDataTableInline">
				<xsl:with-param name="Desc">Form 1120, Top Left Margin - Section 501d Indicator</xsl:with-param>
				<xsl:with-param name="TargetNode" select="$Form1120Data/@section501dCd"/>
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
				<xsl:with-param name="Desc">Form 1120, Top left margin - FILED PURSUANT TO SECTION 301.9100-2</xsl:with-param>
				<xsl:with-param name="TargetNode" select="$Form1120Data/@filedPursuantToSect30191002Cd"/>
				<xsl:with-param name="Style">padding-left:12mm;</xsl:with-param>
			  </xsl:call-template>
			  <!--NOTE: THIS PEN AND INK EXISTED FOR 1120 ONLY NOT 1120E&A-->
			  <xsl:call-template name="LinkToLeftoverDataTableInline">
				<xsl:with-param name="Desc">Form 1120, Top left margin - Short Period Reason 1120 1120F Indicator</xsl:with-param>
				<xsl:with-param name="TargetNode" select="$Form1120Data/@shortPeriodReasonCd"/>
				<xsl:with-param name="Style">padding-left:12mm;</xsl:with-param>
			  </xsl:call-template>
			  <!--NOTE: THIS PEN AND INK EXISTED FOR 1120 ONLY NOT 1120E&A-->
			  <br/>
			  <span class="styAgency">Department of the Treasury</span>
			  <br/>
			  <span class="styAgency">Internal Revenue Service<span style="padding-left:2mm"/></span>
			</div>
			<div class="styFTBox" style="width:122.5mm;height:19mm;">
			  <div class="styMainTitle" style="height:8mm;">U.S. Corporation Income Tax Return</div>
			  <div class="styFST" style="height:5mm;font-size:7pt;text-align:center;">
				For calendar year 2013
				<!--No longer exist<span style="width: 18mm;">
				  <xsl:call-template name="PopulateReturnHeaderTaxYear"/>
				</span>-->
				or tax year beginning
				<span style="width: 18mm;border-bottom:1px solid black;">
				  <!-- No need to send the parameters -->
				  <xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
				</span>, ending 
				<span style="width: 18mm;border-bottom:1px solid black;">
				<!-- No need to send the parameters -->
				  <xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
				</span>
				<br/>
				<!-- EXCEPTION: browser display as one line but print out/print preview is display as two line -->
				<span style="text-align:center;margin-left:0mm;">
				  <img src="{$ImagePath}/1120_Bullet_Md.gif" alt="MediumBullet"/> 
				  Information about Form 1120 and its separate instructions is at 
				  <a href="http://www.irs.gov/form1120" title="Link to IRS.gov"><i>www.irs.gov/form1120</i></a>
				</span>
			  </div>
			</div>
			<div class="styTYBox" style="width:30mm;height:19mm;border-left-width:.5mm;">
			  <div class="styOMB" style="height:auto;">OMB No. 1545-0123</div>
			  <div class="styTY" style="height:11mm;">20<span class="styTYColor">13</span></div>
			</div>
		  </div>
		  <!--Box A-->
		  <div class="styBB" style="width:187mm;float:left;clear:left;border-bottom-width:.5mm">
			<div style="width:33mm;height:auto;float:left;clear:left;">
			  <div class="styComType" style="width:35mm;border-bottom-width: 0px;border-top-width:1px;border-right-width:1px;">
				<div class="styBoldText" style="height:3mm;width:4mm;float:left;clear:none;">A</div>
				<div class="styGenericDiv" style="height:3mm;width:26mm;font-weight:bold;">Check if:</div>
			  </div>
			  <div class="styComType" style="width:35mm;border-bottom:0px;border-right-width:1px;">
				<div class="styBoldText" style="height:5mm;width:4mm;float:left;clear:none;">1a</div>
				<div class="styGenericDiv" style="height:5mm;width:25mm;">
				  <label>
					<xsl:call-template name="PopulateLabel">
					  <xsl:with-param name="TargetNode" select="$Form1120Data/ConsolidatedReturnInd"/>
					  <xsl:with-param name="BackupName">IRS1120IsConsolidatedReturn</xsl:with-param>
					</xsl:call-template>
					Consolidated return (attach Form 851)										
					<xsl:call-template name="LinkToLeftoverDataTableInline">
					  <xsl:with-param name="Desc">Form 1120, Section A, Line 1a - Is Parent Return</xsl:with-param>
					  <xsl:with-param name="TargetNode" select="$Form1120Data/ParentReturnInd"/>
					  <xsl:with-param name="Style">padding-left:9mm;</xsl:with-param>
					</xsl:call-template>
					<xsl:call-template name="LinkToLeftoverDataTableInline">
					  <xsl:with-param name="Desc">Form 1120, Section A, Line 1a - Is Subsidiary Return</xsl:with-param>
					  <xsl:with-param name="TargetNode" select="$Form1120Data/SubsidiaryReturnInd"/>
					  <xsl:with-param name="Style">padding-left:9mm;</xsl:with-param>
					</xsl:call-template>
				  </label>
				  <!-- Form to Form Link -->
				  <xsl:call-template name="SetFormLinkInline">
					<xsl:with-param name="TargetNode" select="$Form1120Data/ConsolidatedReturnInd"/>
				  </xsl:call-template>
				</div>
				<div class="styGenericDiv">
				  <br/>
				  <input type="checkbox" class="styCkbox">
					<xsl:call-template name="PopulateCheckbox">
					  <xsl:with-param name="TargetNode" select="$Form1120Data/ConsolidatedReturnInd"/>
					  <xsl:with-param name="BackupName">IRS1120IsConsolidatedReturn</xsl:with-param>
					</xsl:call-template>
				  </input>
				</div>
			  </div>
			  <div class="styComType" style="width:35mm;border-bottom:0px;border-right-width:1px;">
				<div class="styBoldText" style="height:5mm;width:4mm;float:left;clear:none;padding-left:1.8mm">b</div>
				<div class="styGenericDiv" style="height:5mm;width:25mm;">
				  <label>
					<xsl:call-template name="PopulateLabel">
					  <xsl:with-param name="TargetNode" select="$Form1120Data/LifeNonlifeConsolidatedRetInd"/>
					  <xsl:with-param name="BackupName">IRS1120LifeNonlifeConsolidatedReturn</xsl:with-param>
					</xsl:call-template>
					Life/nonlife consolidated return
				  </label>
				</div>
				<div class="styGenericDiv">
				  <br/>
				  <input type="checkbox" class="styCkbox">
					<xsl:call-template name="PopulateCheckbox">
					  <xsl:with-param name="TargetNode" select="$Form1120Data/LifeNonlifeConsolidatedRetInd"/>
					  <xsl:with-param name="BackupName">IRS1120LifeNonlifeConsolidatedReturn</xsl:with-param>
					</xsl:call-template>
				  </input>
				</div>
			  </div>
			  <div class="styComType" style="width:35mm;border-bottom:0px;border-right-width:1px;">
				<div class="styBoldText" style="height:5mm;width:4mm;float:left;clear:none;border-right-width:1px">2</div>
				<div class="styGenericDiv" style="height:5mm;width:25mm;">
				  <label>
					<xsl:call-template name="PopulateLabel">
					  <xsl:with-param name="TargetNode" select="$Form1120Data/PersonalHoldingCompanyInd"/>
					  <xsl:with-param name="BackupName">IRS1120PersonalHoldingCompany</xsl:with-param>
					</xsl:call-template>
					Personal holding co. (attach Sch. PH)
				  </label>
				  <!-- Form to Form Link -->
				  <xsl:call-template name="SetFormLinkInline">
					<xsl:with-param name="TargetNode" select="$Form1120Data/PersonalHoldingCompanyInd"/>
				  </xsl:call-template>
				</div>
				<div class="styGenericDiv">
				  <br/>
				  <input type="checkbox" class="styCkbox">
					<xsl:call-template name="PopulateCheckbox">
					  <xsl:with-param name="TargetNode" select="$Form1120Data/PersonalHoldingCompanyInd"/>
					  <xsl:with-param name="BackupName">IRS1120PersonalHoldingCompany</xsl:with-param>
					</xsl:call-template>
				  </input>
				</div>
			  </div>
			  <div class="styComType" style="width:35mm;border-bottom:0px;border-right-width:1px;">
				<div class="styBoldText" style="height:5.5mm;width:4mm;float:left;clear:none;">3</div>
				<div class="styGenericDiv" style="height:5.5mm;width:25mm;">
				  <label>
					<xsl:call-template name="PopulateLabel">
					  <xsl:with-param name="TargetNode" select="$Form1120Data/PersonalServiceCorporationInd"/>
					  <xsl:with-param name="BackupName">IRS1120PersonalServiceCorporation</xsl:with-param>
					</xsl:call-template>
					Personal service corp. (see instructions)
				  </label>
				</div>
				<div class="styGenericDiv">
				  <br/>
				  <input type="checkbox" class="styCkbox">
					<xsl:call-template name="PopulateCheckbox">
					  <xsl:with-param name="TargetNode" select="$Form1120Data/PersonalServiceCorporationInd"/>
					  <xsl:with-param name="BackupName">IRS1120PersonalServiceCorporation</xsl:with-param>
					</xsl:call-template>
				  </input>
				</div>
			  </div>
			  <div class="styComType" style="width:35mm;border-bottom:0px;border-right-width:1px;">
			    <!-- Note: Adjust the height for item 4 to extend box E height -->
				<div class="styBoldText" style="height:14.5mm;width:4mm;float:left;clear:none;">4</div>
				<div class="styGenericDiv" style="height:5mm;width:25mm;">
				  <label>
					<xsl:call-template name="PopulateLabel">
					  <xsl:with-param name="TargetNode" select="$Form1120Data/ScheduleM3AttachedInd"/>
					  <xsl:with-param name="BackupName">IRS1120ScheduleM3Attached</xsl:with-param>
					</xsl:call-template>
					Schedule M-3 attached
				  </label>
				  <!--NOTE: THIS PUSH PIN REFERENCE 1120ScheduleM3 ON 1120 NOT 1120E&A -->
				  <!-- Form to Form Link -->
				  <xsl:call-template name="SetFormLinkInline">
					<xsl:with-param name="TargetNode" select="$Form1120Data/ScheduleM3AttachedInd"/>
				  </xsl:call-template>
				  <!--NOTE: THIS PUSH PIN REFERENCE 1120ScheduleM3 ON 1120 NOT 1120E&A -->
				</div>
				<div class="styGenericDiv">
				  <input type="checkbox" class="styCkbox">
					<xsl:call-template name="PopulateCheckbox">
					  <xsl:with-param name="TargetNode" select="$Form1120Data/ScheduleM3AttachedInd"/>
					  <xsl:with-param name="BackupName">IRS1120ScheduleM3Attached</xsl:with-param>
					</xsl:call-template>
				  </input>
				</div>
			  </div>
			</div>
			<div style="width:154mm;height:37mm;float:left;padding-left:2mm;">
			  <!-- return header address box -->
			  <div class="styLblNameAddr" style="width:106mm;height:35mm;">
				<div class="styUseLbl" style="width:12mm;height:35mm;border-right-width:0px;">TYPE OR PRINT </div>
				<div class="styNameAddr" style="width:92mm;height:12mm;border-left-width:1px;padding-left:1px;">
				  Name
				  <br/>
				  <span class="stySmallText" style="padding-left:2mm;">
				  <xsl:call-template name="PopulateReturnHeaderFiler">
					<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
				  </xsl:call-template>
				  <br/>
					<xsl:call-template name="PopulateReturnHeaderFiler">
					  <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
					</xsl:call-template>
					<br/>
					<xsl:call-template name="PopulateReturnHeaderFiler">
					  <xsl:with-param name="TargetNode">InCareOfName</xsl:with-param>
					</xsl:call-template>
				  </span>
				</div>
				<div class="styNameAddr" style="width:92mm;height:10mm;border-left-width:1px;">
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
				<div class="styNameAddr" style="border-bottom-width:0px;width:92mm;height:12mm;border-left-width:1px;">
				  City or town, state or province, country, and ZIP or foreign postal code<br/>
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
			  <!--Box B-->
			  <div class="styEINDateAssets" style="width:46mm;height:12mm;border-top-width:1px">
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
			  <!--Box C-->
			  <div class="styEINDateAssets" style="width:46mm;height:11mm;">
				<span class="styBoldText">C Date incorporated</span><br/>
				<br/>
				<span class="styEINFld" style="text-align:center;padding-left:8mm;">
				  <xsl:call-template name="PopulateMonthDayYear">
					<xsl:with-param name="TargetNode" select="$Form1120Data/IncorporationDt"/>
				  </xsl:call-template>
				</span>
			  </div>
			  <div class="styEINDateAssets" style="width:46mm;height:11mm;border-bottom-width:1px;">
				<span class="styBoldText">D Total assets (see instructions)</span><br/>
				<br/>
				<span style="text-align:right;padding-left:15mm;">
				  $
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form1120Data/TotalAssetsAmt"/>
				  </xsl:call-template>
				</span>
			  </div>
			  <br/>
			  <!--Box E-->
			  <!--NOTE: THIS PUSH PIN REFERENCE 1120ScheduleM3 -->
			  <div style="width:150mm; height:6mm;">
				<span class="styBoldText" style="width:5px;padding-left:3mm;padding-top:2mm;display:inline;">E</span>
				Check if: <span style="width:3px;"/>
				<!--NOTE: THIS INITIAL RETURN CHECK BOX EXISTED ON 1120 NOT 1120E&A-->
				<span class="styBoldText" style="font-size:6pt">(1)</span>
				<span style="width:1px;"/>
				<input type="checkbox" class="styCkbox">
				  <xsl:call-template name="PopulateCheckbox">
					<xsl:with-param name="TargetNode" select="$Form1120Data/InitialReturnInd"/>
					<xsl:with-param name="BackupName">IRS1120InitialReturn</xsl:with-param>
				  </xsl:call-template>
				</input>
				<label>
				  <xsl:call-template name="PopulateLabel">
					<xsl:with-param name="TargetNode" select="$Form1120Data/InitialReturnInd"/>
					<xsl:with-param name="BackupName">IRS1120InitialReturn</xsl:with-param>
				  </xsl:call-template>
				  <span style="font-size:6pt">
					Initial return
				  </span>
				  <span style="width:2mm"/>
				</label>
				<!--NOTE: THIS INITIAL RETURN CHECK BOX EXISTED ON 1120 NOT 1120E&A-->
				<!-- checkboxes -->
				<span style="width:2px"/>
				<!--NOTE: THIS FINAL RETURN CHECK BOX EXISTED ON 1120 NOT 1120E&A-->
				<span class="styBoldText" style="font-size:6pt">(2)</span>
				<span style="width:1px;"/>
				<input type="checkbox" class="styCkbox">
				  <xsl:call-template name="PopulateCheckbox">
					<xsl:with-param name="TargetNode" select="$Form1120Data/FinalReturnInd"/>
					<xsl:with-param name="BackupName">IRS1120FinalReturn</xsl:with-param>
				  </xsl:call-template>
				</input>
				<label>
				  <xsl:call-template name="PopulateLabel">
					<xsl:with-param name="TargetNode" select="$Form1120Data/FinalReturnInd"/>
					<xsl:with-param name="BackupName">IRS1120FinalReturn</xsl:with-param>
				  </xsl:call-template>
				  <span style="font-size:6pt">
					Final return
				  </span>
				  <span style="width:1mm"/>
				</label>
				<!--NOTE: THIS FINAL RETURN CHECK BOX EXISTED ON 1120 NOT 1120E&A-->
				<span style="width:2px"/>
				<!--NOTE: THIS NAME CHANGE CHECK BOX EXISTED ON 1120 NOT 1120E&A-->
				<span class="styBoldText" style="font-size:6pt">(3)</span>
				<span style="width:1px;"/>
				<input type="checkbox" class="styCkbox">
				  <xsl:call-template name="PopulateCheckbox">
					<xsl:with-param name="TargetNode" select="$Form1120Data/NameChangeInd"/>
					<xsl:with-param name="BackupName">IRS1120NameChange</xsl:with-param>
				  </xsl:call-template>
				</input>
				<label>
				  <xsl:call-template name="PopulateLabel">
					<xsl:with-param name="TargetNode" select="$Form1120Data/NameChangeInd"/>
					<xsl:with-param name="BackupName">IRS1120NameChange</xsl:with-param>
				  </xsl:call-template>
				  <span style="font-size:6pt">
					Name change
				  </span>
				  <span style="width:1mm"/>
				</label>
				<!--NOTE: THIS NAME CHANGE CHECK BOX EXISTED ON 1120 NOT 1120E&A-->
				<span style="width:2px"/>
				<span class="styBoldText" style="font-size:6pt">(4)</span>
				<span style="width:1px;"/>
				<input type="checkbox" class="styCkbox">
				  <xsl:call-template name="PopulateCheckbox">
					<xsl:with-param name="TargetNode" select="$Form1120Data/AddressChangeInd"/>
					<xsl:with-param name="BackupName">IRS1120AddressChange</xsl:with-param>
				  </xsl:call-template>
				</input>
				<label>
				  <xsl:call-template name="PopulateLabel">
					<xsl:with-param name="TargetNode" select="$Form1120Data/AddressChangeInd"/>
					<xsl:with-param name="BackupName">IRS1120AddressChange</xsl:with-param>
				  </xsl:call-template>
				  <span style="font-size:6pt">Address change </span>
				  <span style="width:1mm"/>
				</label>
				<!-- Amended Return -->
				<span style="width:2px"/>
				<!--NOTE: THIS AMENDED RETURN CHECK BOX EXISTED ON 1120 NOT 1120E&A-->
				<span class="styBoldText" style="font-size:6pt">(5)</span>
				<span style="width:1px;"/>
				<input type="checkbox" class="styCkbox">
				  <xsl:call-template name="PopulateCheckbox">
					<xsl:with-param name="TargetNode" select="$Form1120Data/AmendedReturnInd"/>
					<xsl:with-param name="BackupName">IRS1120AmendedReturn</xsl:with-param>
				  </xsl:call-template>
				</input>
				<label>
				  <xsl:call-template name="PopulateLabel">
					<xsl:with-param name="TargetNode" select="$Form1120Data/AmendedReturnInd"/>
					<xsl:with-param name="BackupName">IRS1120AmendedReturn</xsl:with-param>
				  </xsl:call-template>
				  <span style="font-size:6pt">
					Amended Return
				  </span>
				  <span style="width:1mm"/>
				</label>
				<xsl:call-template name="SetFormLinkInline">
				  <xsl:with-param name="TargetNode" select="$Form1120Data/AmendedReturnInd"/>
				</xsl:call-template>
				<br/>
				<!--NOTE: THIS AMENDED RETURN CHECK BOX EXISTED ON 1120 NOT 1120E&A-->
				
				<!-- Superseded Return -->
				<span style="width:18mm"/>
				<!--NOTE: THIS SUPER SEDED RETURN CHECK BOX EXISTED ON 1120 NOT 1120E&A-->
				<span class="styBoldText" style="font-size:6pt;padding-left:.5mm;">(6)</span>
				<span style="width:1px;"/>
				<input type="checkbox" class="styCkbox">
				  <xsl:call-template name="PopulateCheckbox">
					<xsl:with-param name="TargetNode" select="$Form1120Data/SupersededReturnInd"/>
					<xsl:with-param name="BackupName">IRS1120SupersededReturn</xsl:with-param>
				  </xsl:call-template>
				</input>
				<label>
				  <xsl:call-template name="PopulateLabel">
					<xsl:with-param name="TargetNode" select="$Form1120Data/SupersededReturnInd"/>
				    <xsl:with-param name="BackupName">IRS1120SupersededReturn</xsl:with-param>
				  </xsl:call-template>
				  <span style="font-size:6pt">
						Super seded Return
				  </span>
				 
				</label>
				<!--NOTE: THIS SUPER SEDED RETURN CHECK BOX EXISTED ON 1120 NOT 1120E&A-->
			  </div>
			</div>
		  </div>
		  <!-- E -->
		  <!--BEGIN Main Form Income Section-->
		  <div class="styBB" style="width:187mm;float:none;clear:none;">
        <span class="styIRS1120VTImageBox" style="width:6mm;height:59mm;padding-top:23mm;text-align:center;">
          <img src="{$ImagePath}/1120_Income.gif" alt="IncomeAmt" valign="center" height="40mm;"/>
        </span>
			<!-- line 1a --> <!--Update per -->
			<div class="styGenericDiv" style="width:181mm;">
			  <div style="float:left;clear:none;">
			    <div class="styLNLeftNumBox" style="padding-left: 2.25mm">1a</div>
			    <div class="styLNDesc" style="width:92mm;">
				  <span style="float:left;">Gross receipts or sales 
						<!-- Form to Form Link -->
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$Form1120Data/GrossReceiptsOrSalesAmt"/>
						</xsl:call-template> 
				  </span>
				  <!--Dotted Line-->
				  <div class="styDotLn" style="float:right;padding-right:1mm;">..............</div>
			    </div>
			  </div>
			  <div style="float:right;clear:none">
			    <div class="styLNRightNumBox" style="height:4.5mm;">1a</div>
			    <div class="styLNAmountBox" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
				    <xsl:with-param name="TargetNode" select="$Form1120Data/GrossReceiptsOrSalesAmt"/>
				  </xsl:call-template>
			    </div>
			    <div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-right-width:0px;border-bottom-width:0px;"/>
			    <div class="styLNAmountBox" style="height:4.5mm;background-color:lightgrey;border-left-width:0px;border-bottom-width:0px;"/>	  
			  </div>
			</div>		
			<!-- line 1b -->
			<div class="styGenericDiv" style="width:181mm;">
			  <div style="float:left;clear:none;">
			    <div class="styLNLeftNumBox" style="padding-left:4mm;'">b</div>
			    <div class="styLNDesc" style="width:92mm;">
            <span style="float:left;">Returns and allowances </span>				  
						<!--Dotted Line -->
						<span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
			    </div>
			  </div>
			  <div style="float:right;clear:none;">
			    <div class="styLNRightNumBox" style="height:4mm;">1b</div>
			    <div class="styLNAmountBox" style="height:4mm;">
				  <xsl:call-template name="PopulateAmount">
				    <xsl:with-param name="TargetNode" select="$Form1120Data/ReturnsAndAllowancesAmt"/>
				  </xsl:call-template>
			    </div>
			    <div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-right-width:0px;border-bottom-width:0px;"/>
			    <div class="styLNAmountBox" style="height:4.5mm;background-color:lightgrey;border-left-width:0px;border-bottom-width:0px;"/>	  
			  </div>
			</div>		
			<!-- line 1c -->
			<div class="styGenericDiv" style="width:181mm;">
			  <div style="float:left;clear:none;">
			    <div class="styLNLeftNumBox" style="padding-left: 4mm">c</div>
			    <div class="styLNDesc" style="width:132mm;">
				  <span style="float:left;">Balance. Subtract line 1b from line 1a </span>
				  <!--Dotted Line-->
				  <div class="styDotLn" style="float:right;padding-right:1mm;">....................</div>
			    </div>
			  </div>
			  <div style="float:right;clear:none;">
			    <div class="styLNRightNumBox" style="height:4.5mm;">1c</div>
			    <div class="styLNAmountBox" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
				    <xsl:with-param name="TargetNode" select="$Form1120Data/NetGrossReceiptsOrSalesAmt"/>
				  </xsl:call-template>
			    </div>
			  </div>
			</div>			
			<!-- line 2 -->
			<div class="styGenericDiv" style="width:181mm;">
			  <div style="float:left;clear;none;">
			    <div class="styLNLeftNumBox" style="padding-left: 2.25mm">2</div>
			    <div class="styLNDesc" style="width:132mm;">
				  <span style="float:left;">Cost of goods sold from Form 1125-A, line 8 (attach Form 1125-A) 
				  <span style="width:2px;"/>
				    <!-- Form to Form Link -->
				    <xsl:call-template name="SetFormLinkInline">
					  <xsl:with-param name="TargetNode" select="$Form1120Data/CostOfGoodsSoldAmt"/>
				    </xsl:call-template>		
				  </span>
				  <!--Dotted Line-->
				  <div class="styDotLn" style="float:right;padding-right:1mm;">.........</div>
			    </div>
			  </div>
			  <div style="float:right;clear:none;">
			    <div class="styLNRightNumBox" style="height:4.5mm;">2</div>
			    <div class="styLNAmountBox" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
				    <xsl:with-param name="TargetNode" select="$Form1120Data/CostOfGoodsSoldAmt"/>
				  </xsl:call-template>
			    </div>
			  </div>
			</div>
			<!-- line 3 -->
			<div class="styGenericDiv" style="width:181mm;">
			  <div style="float:left;clear:none;">
			    <div class="styLNLeftNumBox" style="padding-left: 2.25mm">3</div>
			    <div class="styLNDesc" style="width:132mm;">
				  <span style="float:left;">Gross profit. Subtract line 2 from line 1c </span>
				  <!--Dotted Line-->
				  <div class="styDotLn" style="float:right;padding-right:1mm;">....................</div>
			    </div>
			  </div>
			  <div style="float:right;clear:none;">
			    <div class="styLNRightNumBox" style="height:4.5mm;">3</div>
			    <div class="styLNAmountBox" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
				    <xsl:with-param name="TargetNode" select="$Form1120Data/GrossProfitAmt"/>
				  </xsl:call-template>
			    </div>
			  </div>
			</div>
			<!-- line 4 -->
			<div class="styGenericDiv" style="width:181mm;">
			  <div style="float:left;clear:none;">
			    <div class="styLNLeftNumBox" style="padding-left: 2.25mm">4</div>
			    <div class="styLNDesc" style="width:132mm;">
				  <span style="float:left;">Dividends (Schedule C, line 19) </span>
				  <!--Dotted Line-->
				  <div class="styDotLn" style="float:right;padding-right:1mm;">......................</div>
			    </div>
			  </div>
			  <div style="float:right;clear:none;">
			    <div class="styLNRightNumBox" style="height:4.5mm;">4</div>
			    <div class="styLNAmountBox" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
				    <xsl:with-param name="TargetNode" select="$Form1120Data/TotalDividendsReceivedAmt"/>
				  </xsl:call-template>
			    </div>
			  </div>
			</div>
			<!-- line 5 -->
			<div class="styGenericDiv" style="width:181mm;">
			  <div style="float:left;clear:none">
			    <div class="styLNLeftNumBox" style="padding-left: 2.25mm">5</div>
			    <div class="styLNDesc" style="width:132mm;">
				  <span style="float:left;">Interest </span>
				  <!--Dotted Line-->
				  <div class="styDotLn" style="float:right;padding-right:1mm;">.............................</div>
			    </div>
			  </div>
			  <div style="float:right;clear:none;">
			    <div class="styLNRightNumBox" style="height:4.5mm;">5</div>
			    <div class="styLNAmountBox" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
				    <xsl:with-param name="TargetNode" select="$Form1120Data/TaxableInterestAmt"/>
				  </xsl:call-template>
			    </div>
			  </div>
			</div>
			<!-- line 6 -->
			<div class="styGenericDiv" style="width:181mm;">
			  <div style="float:left;clear:none;">
			    <div class="styLNLeftNumBox" style="padding-left: 2.25mm">6</div>
			    <div class="styLNDesc" style="width:132mm;">
				  <span style="float:left;">Gross rents </span>
				  <!--Dotted Line-->
				  <div class="styDotLn" style="float:right;padding-right:1mm;">............................</div>
			    </div>
			  </div>
			  <div style="float:right;clear:none;">
			    <div class="styLNRightNumBox" style="height:4.5mm;">6</div>
			    <div class="styLNAmountBox" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
				    <xsl:with-param name="TargetNode" select="$Form1120Data/GrossRentsAmt"/>
				  </xsl:call-template>
			    </div>
			  </div>
			</div>
			<!-- line 7 -->
			<div class="styGenericDiv" style="width:181mm;">
			  <div style="float:left;clear:none;">
			    <div class="styLNLeftNumBox" style="padding-left: 2.25mm">7</div>
			    <div class="styLNDesc" style="width:132mm;">
				  <span style="float:left;">Gross royalties </span>
				  <!--Dotted Line-->
				  <div class="styDotLn" style="float:right;padding-right:1mm;">...........................</div>
			    </div>
			  </div>
			  <div style="float:right;clear:none;">
			    <div class="styLNRightNumBox" style="height:4.5mm;">7</div>
			    <div class="styLNAmountBox" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
				    <xsl:with-param name="TargetNode" select="$Form1120Data/GrossRoyaltiesAmt"/>
				  </xsl:call-template>
			    </div>
			  </div>
			</div>
			<!-- line 8 -->
			<div class="styGenericDiv" style="width:181mm;">
			  <div style="float:left;clear;none;">
			    <div class="styLNLeftNumBox" style="padding-left: 2.25mm">8</div>
			    <div class="styLNDesc" style="width:132mm;">
				  <span style="float:left;">Capital gain net income (attach Schedule D (Form 1120))
				    <span style="width:2px;"/>
				    <!-- Form to Form Link -->
				    <xsl:call-template name="SetFormLinkInline">
					  <xsl:with-param name="TargetNode" select="$Form1120Data/CapitalGainNetIncomeAmt"/>
				    </xsl:call-template>
				  </span>
				  <!--Dotted Line-->
				  <div class="styDotLn" style="float:right;padding-right:1mm;">.............</div>
			    </div>
			  </div>
			  <div style="float:right;clear:none;">
			    <div class="styLNRightNumBox" style="height:4.5mm;">8</div>
			    <div class="styLNAmountBox" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
				    <xsl:with-param name="TargetNode" select="$Form1120Data/CapitalGainNetIncomeAmt"/>
				  </xsl:call-template>
			    </div>
			  </div>
			</div>
			<!-- line 9 -->
			<div class="styGenericDiv" style="width:181mm;">
			  <div style="float:left;clear:none;">
			    <div class="styLNLeftNumBox" style="padding-left: 2.25mm">9</div>
			    <div class="styLNDesc" style="width:132mm;">
				  <span style="float:left;">Net gain or (loss) from Form 4797, Part II, line 17 (attach Form 4797)
				    <span style="width:2px;"/>
				    <!-- Form to Form Link -->
				    <xsl:call-template name="SetFormLinkInline">
					  <xsl:with-param name="TargetNode" select="$Form1120Data/TotalOrdinaryGainLossAmt"/>
				    </xsl:call-template>
				    <span style="width:1mm;"/>
				    <xsl:call-template name="LinkToLeftoverDataTableInline">
					  <xsl:with-param name="Desc">Line 9 - Form 4684 Indicator</xsl:with-param>
					  <xsl:with-param name="TargetNode" select="$Form1120Data/TotalOrdinaryGainLossAmt/@form4684Cd"/>
				    </xsl:call-template>
				  </span>
				  <!--Dotted Line-->
				  <div class="styDotLn" style="float:right;padding-right:1mm;">.......</div>
			    </div>
			  </div>
			  <div style="float:right;clear:none;">
			    <div class="styLNRightNumBox" style="height:4.5mm;">9</div>
			    <div class="styLNAmountBox" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
				    <xsl:with-param name="TargetNode" select="$Form1120Data/TotalOrdinaryGainLossAmt"/>
				  </xsl:call-template>
			    </div>
			  </div>
			</div>
			<!-- line 10 -->
			<div class="styGenericDiv" style="width:181mm;">
			  <div style="float:left;clear:none;">
			    <div class="styLNLeftNumBox">10</div>
			    <div class="styLNDesc" style="width:132mm;">
				  <span style="float:left;">Other income (see instructions?attach statement)
				    <span style="width:2px;"/>
				    <!-- Form to Form Link -->
				    <xsl:call-template name="SetFormLinkInline">
					  <xsl:with-param name="TargetNode" select="$Form1120Data/OtherIncomeAmt"/>
				    </xsl:call-template>
				    <span style="width:1mm;"/>
				    <xsl:call-template name="LinkToLeftoverDataTableInline">
					  <xsl:with-param name="Desc">Line 10 - Other Income Item</xsl:with-param>
					  <xsl:with-param name="TargetNode" select="$Form1120Data/OtherIncomeAmt/@otherIncomeDesc"/>
				    </xsl:call-template>
				  </span>
				  <!--Dotted Line-->
				  <div class="styDotLn" style="float:right;padding-right:1mm;">..............</div>
			    </div>
			  </div>
			  <div style="float:right;clear:none;">
			    <div class="styLNRightNumBox" style="height:4.5mm;">10</div>
			    <div class="styLNAmountBox" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
				    <xsl:with-param name="TargetNode" select="$Form1120Data/OtherIncomeAmt"/>
				  </xsl:call-template>
			    </div>
			  </div>
			</div>
			<!-- line 11 -->
			<div class="styGenericDiv" style="width:181mm;">
			  <div style="float:left;clear:none;">
			    <div class="styLNLeftNumBox">11</div>
			    <div class="styLNDesc" style="width:132mm;">
				  <span style="float:left;">
				    <span class="styBoldText">Total income.</span>
				    Add lines 3 through 10 
				  </span>
				  <!--Dotted Line-->
				  <div class="styDotLn" style="padding-left:2mm;">...................</div>
				  <img src="{$ImagePath}/1120_Bullet_Md.gif" alt="MediumBullet"/>
				  <span style="width:1mm;"/>
			    </div>
			  </div>
			  <div style="float:right;clear:none;">
			    <div class="styLNRightNumBoxNBB" style="height:4.5mm;">11</div>
			    <div class="styLNAmountBoxNBB" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
				    <xsl:with-param name="TargetNode" select="$Form1120Data/TotalIncomeAmt"/>
				  </xsl:call-template>
			    </div>
			  </div>
		    </div>
		  </div>
		  <!--END Main Form Income Section-->
		  <!--BEGIN Main Form Deduction Section-->
		  <!-- Vertical Deductions label -->
		  <div class="styBB" style="width:187mm;">
			<div class="styIRS1120VTImageBox" style="width:6mm;height:90mm;text-align:center;padding-top:13mm;">
			  <img src="{$ImagePath}/1120_Deductions.gif" alt="VertDeductions" valign="center"/>
			</div>
			<!-- line 12 -->
			<div class="styGenericDiv" style="width:181mm;">
			  <div style="float:left;clear:none;">
			    <div class="styLNLeftNumBox">12</div>
			    <div class="styLNDesc" style="width:132mm;">
				  <span style="float:left;">Compensation of officers from Form 1125-E, line 4 (attach Form 1125-E) 
            <span style="width:2px;"/>
				    <!-- Form to Form Link -->
				    <xsl:call-template name="SetFormLinkInline">
					  <xsl:with-param name="TargetNode" select="$Form1120Data/OfficersCompensationAmt"/>
				    </xsl:call-template>				  
				  </span>
				  <!--Dotted Line-->
				  <div class="styDotLn" style="padding-left:.5mm;">......</div>
					<img src="{$ImagePath}/1120_Bullet_Md.gif" alt="MediumBullet"/>
					<span style="width:1mm;"/>
			    </div>
			  </div>
			  <div style="float:right;clear:none;">
			    <div class="styLNRightNumBox" style="height:4.5mm;">12</div>
			    <div class="styLNAmountBox" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
				    <xsl:with-param name="TargetNode" select="$Form1120Data/OfficersCompensationAmt"/>
				  </xsl:call-template>
			    </div>
			  </div>
			</div>
			<!-- line 13 -->
			<div class="styGenericDiv" style="width:181mm;">
			  <div style="float:left;clear:none;">
			    <div class="styLNLeftNumBox">13</div>
			    <div class="styLNDesc" style="width:132mm;">
				  <span style="float:left;">Salaries and wages (less employment credits) </span>
				  <!--Dotted Line-->
				  <div class="styDotLn" style="float:right;padding-right:1mm;">..................</div>
			    </div>
			  </div>
			  <div style="float:right;clear:none;">
			    <div class="styLNRightNumBox" style="height:4.5mm;">13</div>
			    <div class="styLNAmountBox" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
				    <xsl:with-param name="TargetNode" select="$Form1120Data/SalariesAndWagesAmt"/>
				  </xsl:call-template>
			    </div>
			  </div>
			</div>
			<!-- line 14 -->
			<div class="styGenericDiv" style="width:181mm;">
			  <div style="float:left;clear:none;">
			    <div class="styLNLeftNumBox">14</div>
			    <div class="styLNDesc" style="width:132mm;">
				  <span style="float:left;">Repairs and maintenance </span>
				  <!--Dotted Line-->
				  <div class="styDotLn" style="float:right;padding-right:1mm;">........................</div>
			    </div>
			  </div>
			  <div style="float:right;clear:none;">
			    <div class="styLNRightNumBox" style="height:4.5mm;">14</div>
			    <div class="styLNAmountBox" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
				    <xsl:with-param name="TargetNode" select="$Form1120Data/RepairsAndMaintenanceAmt"/>
				  </xsl:call-template>
			    </div>
			  </div>
			</div>
			<!-- line 15 -->
			<div class="styGenericDiv" style="width:181mm;">
			  <div style="float:left;clear:none;">
			    <div class="styLNLeftNumBox">15</div>
			    <div class="styLNDesc" style="width:132mm;">
				  <span style="float:left;">Bad debts
				    <span style="width:2px;"/>
				    <!-- Form to Form Link -->
				    <xsl:call-template name="SetFormLinkInline">
					  <xsl:with-param name="TargetNode" select="$Form1120Data/BadDebtExpenseAmt"/>
				    </xsl:call-template>
				  </span>
				  <!--Dotted Line-->
				  <div class="styDotLn" style="float:right;padding-right:1mm;">...........................</div>
			    </div>
			  </div>
			  <div style="float:right;clear:none;">
			    <div class="styLNRightNumBox" style="height:4.5mm;">15</div>
			    <div class="styLNAmountBox" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
				    <xsl:with-param name="TargetNode" select="$Form1120Data/BadDebtExpenseAmt"/>
				  </xsl:call-template>
			    </div>
			  </div>
			</div>
			<!-- line 16 -->
			<div class="styGenericDiv" style="width:181mm;">
			  <div style="float:left;clear:none;">
			    <div class="styLNLeftNumBox">16</div>
			    <div class="styLNDesc" style="width:132mm;">
				  <span style="float:left;">Rents  
				    <span style="width:2px;"/>
				    <!-- Form to Form Link -->
				    <xsl:call-template name="SetFormLinkInline">
					  <xsl:with-param name="TargetNode" select="$Form1120Data/TotalRentOrLeaseExpenseAmt"/>
				    </xsl:call-template>
				  </span>
				  <!--Dotted Line-->
				  <div class="styDotLn" style="float:right;padding-right:1mm;">.............................</div>
			    </div>			  </div>
			  <div style="float:right;clear:none;">
			    <div class="styLNRightNumBox" style="height:4.5mm;">16</div>
			    <div class="styLNAmountBox" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
				    <xsl:with-param name="TargetNode" select="$Form1120Data/TotalRentOrLeaseExpenseAmt"/>
				  </xsl:call-template>
			    </div>
			  </div>
			</div>
			<!-- line 17 -->
			<div class="styGenericDiv" style="width:181mm;">
			  <div style="float:left;clear:none;">
			    <div class="styLNLeftNumBox">17</div>
			    <div class="styLNDesc" style="width:132mm;">
				  <span style="float:left;">Taxes and licenses </span>
				  <!--Dotted Line-->
				  <div class="styDotLn" style="float:right;padding-right:1mm;">..........................</div>
			    </div>
			  </div>
			  <div style="float:right;clear:none;">
			    <div class="styLNRightNumBox" style="height:4.5mm;">17</div>
			    <div class="styLNAmountBox" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
				    <xsl:with-param name="TargetNode" select="$Form1120Data/TaxesAndLicensesAmt"/>
				  </xsl:call-template>
			    </div>
			  </div>
			</div>
			<!-- line 18 -->
			<div class="styGenericDiv" style="width:181mm;">
			  <div style="float:left;clear:none;">
			    <div class="styLNLeftNumBox">18</div>
			    <div class="styLNDesc" style="width:132mm;">
				  <span style="float:left;">Interest
				    <span style="width:2px;"/>
				    <!-- Form to Form Link -->
				    <xsl:call-template name="SetFormLinkInline">
					  <xsl:with-param name="TargetNode" select="$Form1120Data/InterestDeductionAmt"/>
				    </xsl:call-template>
				  </span>
				  <!--Dotted Line-->
				  <div class="styDotLn" style="float:right;padding-right:1mm;">............................</div>
			    </div>
			  </div>
			  <div style="float:right;clear:none;">
			    <div class="styLNRightNumBox" style="height:4.5mm;">18</div>
			    <div class="styLNAmountBox" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
				    <xsl:with-param name="TargetNode" select="$Form1120Data/InterestDeductionAmt"/>
				  </xsl:call-template>
			    </div>
			  </div>
			</div>
			<!-- line 19 -->
			<div class="styGenericDiv" style="width:181mm;">
			  <div style="float:left;clear:none;">
			    <div class="styLNLeftNumBox">19</div>
			    <div class="styLNDesc" style="width:132mm;">
				  <span style="float:left;">Charitable contributions  
				    <span style="width:2px;"/>
				    <!-- Form to Form Link -->
				    <xsl:call-template name="SetFormLinkInline">
					  <xsl:with-param name="TargetNode" select="$Form1120Data/CharitableContributionsTotAmt"/>
				    </xsl:call-template>
				  </span>
				  <!--Dotted Line-->
				  <div class="styDotLn" style="float:right;padding-right:1mm;">.......................</div>
			    </div>
			  </div>
			  <div style="float:right;clear:none;">
			    <div class="styLNRightNumBox" style="height:4.5mm;">19</div>
			    <div class="styLNAmountBox" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
				    <xsl:with-param name="TargetNode" select="$Form1120Data/CharitableContributionsTotAmt"/>
				  </xsl:call-template>
			    </div>
			  </div>
			</div>
			<!-- Line 20 -->
			<div class="styGenericDiv" style="width:181mm;">
			  <div style="float:left;clear:none;">
			    <div class="styLNLeftNumBox">20</div>
			    <div class="styLNDesc" style="width:132mm; font-size:6pt;">
			      Depreciation from Form 4562 not claimed on Form 1125-A or elsewhere on return (attach Form 4562)
                  <xsl:call-template name="SetFormLinkInline">
				    <xsl:with-param name="TargetNode" select="$Form1120Data/DepreciationAmt"/>
				  </xsl:call-template>
			    </div>
			  </div>
			  <div style="float:right;clear:none;">
			    <div class="styLNRightNumBox" style="height:4.5mm;">20</div>
			    <div class="styLNAmountBox" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
				    <xsl:with-param name="TargetNode" select="$Form1120Data/DepreciationAmt"/>
				  </xsl:call-template>
			    </div>
			  </div>
			</div>
			<!-- Line 21 -->
			<div class="styGenericDiv" style="width:181mm;">
			  <div style="float:left;clear:none;">
			    <div class="styLNLeftNumBox">21</div>
			    <div class="styLNDesc" style="width:132mm;">
				  <span style="float:left;">Depletion
				    <xsl:call-template name="SetFormLinkInline">
					  <xsl:with-param name="TargetNode" select="$Form1120Data/DepletionAmt"/>
				    </xsl:call-template>
				  </span>
				  <!--Dotted Line-->
				  <div class="styDotLn" style="float:right;padding-right:1mm;">............................</div>
			    </div>
			  </div>
			  <div style="float:right;clear:none;">
			    <div class="styLNRightNumBox" style="height:4.5mm;">21</div>
			    <div class="styLNAmountBox" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
				    <xsl:with-param name="TargetNode" select="$Form1120Data/DepletionAmt"/>
				  </xsl:call-template>
			    </div>
			  </div>
			</div>
			<!-- Line 22 -->
			<div class="styGenericDiv" style="width:181mm;">
			  <div style="float:left;clear:none;">
			    <div class="styLNLeftNumBox">22</div>
			    <div class="styLNDesc" style="width:132mm;">
				  <span style="float:left;">Advertising </span>
				  <!--Dotted Line-->
				  <div class="styDotLn" style="float:right;padding-right:1mm;">............................</div>
			    </div>
			  </div>
			  <div style="float:right;clear:none;">
			    <div class="styLNRightNumBox" style="height:4.5mm;">22</div>
			    <div class="styLNAmountBox" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
				    <xsl:with-param name="TargetNode" select="$Form1120Data/AdvertisingAmt"/>
				  </xsl:call-template>
			    </div>
			  </div>
			</div>
			<!-- Line 23 -->
			<div class="styGenericDiv" style="width:181mm;">
			  <div style="float:left;clear:none;">
			    <div class="styLNLeftNumBox">23</div>
			    <div class="styLNDesc" style="width:132mm;">
				  <span style="float:left;">Pension, profit-sharing, etc., plans </span>
				  <!--Dotted Line-->
				  <div class="styDotLn" style="float:right;padding-right:1mm;">.....................</div>
			    </div>
			  </div>
			  <div style="float:right;clear:none;">
			    <div class="styLNRightNumBox" style="height:4.5mm;">23</div>
			    <div class="styLNAmountBox" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
				    <xsl:with-param name="TargetNode" select="$Form1120Data/PensionProfitSharingPlansAmt"/>
				  </xsl:call-template>
			    </div>
			  </div>
			</div>
			<!-- Line 24 -->
			<div class="styGenericDiv" style="width:181mm;">
			  <div style="float:left;clear:none;">
			    <div class="styLNLeftNumBox">24</div>
			    <div class="styLNDesc" style="width:132mm;">
			      <span style="float:left;">Employee benefit programs </span>
				  <!--Dotted Line-->
				  <div class="styDotLn" style="float:right;padding-right:1mm;">......................</div>
			    </div>
			  </div>
			  <div style="float:right;clear:none;">
			    <div class="styLNRightNumBox" style="height:4.5mm;">24</div>
			    <div class="styLNAmountBox" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
				    <xsl:with-param name="TargetNode" select="$Form1120Data/EmployeeBenefitProgramAmt"/>
				  </xsl:call-template>
			    </div>
			  </div>
			</div>
			<!-- line 25 -->
			<div class="styGenericDiv" style="width:181mm;">
			  <div style="float:left;clear:none;">
			    <div class="styLNLeftNumBox">25</div>
			    <div class="styLNDesc" style="width:132mm;">
				  <span style="float:left;">Domestic production activities deduction (attach Form 8903)
				    <xsl:call-template name="SetFormLinkInline">
					  <xsl:with-param name="TargetNode" select="$Form1120Data/DomesticProductionActDedAmt"/>
				    </xsl:call-template>
				  </span>
				  <!--Dotted Line-->
				  <div class="styDotLn" style="float:right;padding-right:1mm;">............</div>
			    </div>
			  </div>
			  <div style="float:right;clear:none;">
			    <div class="styLNRightNumBox" style="height:4.5mm;">25</div>
			    <div class="styLNAmountBox" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
				    <xsl:with-param name="TargetNode" select="$Form1120Data/DomesticProductionActDedAmt"/>
				  </xsl:call-template>
			    </div>
			  </div>
			</div>
			<!-- line 26 -->
			<div class="styGenericDiv" style="width:181mm;">
			  <div style="float:left;clear:none;">
			    <div class="styLNLeftNumBox">26</div>
			    <div class="styLNDesc" style="width:132mm;">
				  <span style="float:left;">Other deductions (attach statement)
				    <span style="width:2px;"/>
				    <!-- Form to Form Link -->
				    <xsl:call-template name="SetFormLinkInline">
					  <xsl:with-param name="TargetNode" select="$Form1120Data/OtherDeductionsAmt"/>
				    </xsl:call-template>
				  </span>
				  <!--Dotted Line-->
				  <div class="styDotLn" style="float:right;padding-right:1mm;">....................</div>
			    </div>
			  </div>
			  <div style="float:right;clear:none;">
			    <div class="styLNRightNumBox" style="height:4.5mm;">26</div>
			    <div class="styLNAmountBox" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
				    <xsl:with-param name="TargetNode" select="$Form1120Data/OtherDeductionsAmt"/>
				  </xsl:call-template>
			    </div>
			  </div>
			</div>
			<!-- line 27 -->
			<div class="styGenericDiv" style="width:181mm;">
			  <div style="float:left;clear:none;">
			    <div class="styLNLeftNumBox">27</div>
			    <div class="styLNDesc" style="width:132mm;">
				  <span style="float:left;">
				    <span class="styBoldText">Total deductions.</span>
				    Add lines 12 through 26 
				  </span>
				  <!--Dotted Line-->
				  <div class="styDotLn" style="padding-left:3mm;">.................</div>
				  <img src="{$ImagePath}/1120_Bullet_Md.gif" alt="MediumBullet"/>
			    </div>
			  </div>
			  <div style="float:right;clear:none;">
			    <div class="styLNRightNumBox" style="height:4.5mm;">27</div>
			    <div class="styLNAmountBox" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
				    <xsl:with-param name="TargetNode" select="$Form1120Data/TotalDeductionAmt"/>
				  </xsl:call-template>
			    </div>
			  </div>
			</div>
			<!-- line 28 -->
			<div class="styGenericDiv" style="width:181mm;">
			  <div style="float:left;clear:none;">
			    <div class="styLNLeftNumBox">28</div>
			    <div class="styLNDesc" style="width:132mm;padding-top:1mm;padding-bottom:0mm;font-size:6pt;">
				  <span style="float:left;">Taxable income before net operating loss deduction and special deductions.
				    Subtract line 27 from line 11
				    <span style="width:2px;"/>
				    <xsl:call-template name="SetFormLinkInline">
				      <xsl:with-param name="TargetNode" select="$Form1120Data/TaxableIncomeBfrNOLSpclDedAmt"/>
				    </xsl:call-template>
			      </span>
				  <!--Dotted Line-->
				  <div class="styDotLn" style="padding-left:1mm;font-weight:bold;">....</div>
			    </div>
			  </div>
			  <div style="float:right;clear:none;">
			    <div class="styLNRightNumBox" style="height:4.5mm;">28</div>
			    <div class="styLNAmountBox" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
				    <xsl:with-param name="TargetNode" select="$Form1120Data/TaxableIncomeBfrNOLSpclDedAmt"/>
				  </xsl:call-template>
			    </div>
			  </div>
			</div>
			<!-- line 29a -->
			<div class="styGenericDiv" style="width:181mm;">
			  <div style="float:left;clear:none;">
			    <div class="styLNLeftNumBox">29</div>
			    <div class="styLNDesc" style="width:4mm;">
				  <span class="styBoldText">a</span>
			    </div>
			    <!-- line 29a -->
			    <div class="styLNDesc" style="width:89mm;">
			      <span style="float:left;">
				  Net operating loss deduction (see instructions)
				  <span style="width:2px;"/>
				  <!-- Form to Form Link -->
				  <xsl:call-template name="SetFormLinkInline">
				    <xsl:with-param name="TargetNode" select="$Form1120Data/NetOperatingLossDeductionAmt"/>
				  </xsl:call-template>
				</span>
				<!--Dotted Line-->
				<div class="styDotLn" style="float:right;padding-right:1mm;">......</div>
			    </div>
			  </div>
			  <div style="float:right;clear:none;">
			    <div class="styLNRightNumBox" style="height:4.5mm;">29a</div>
			    <div class="styLNAmountBox" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
				    <xsl:with-param name="TargetNode" select="$Form1120Data/NetOperatingLossDeductionAmt"/>
				  </xsl:call-template>
			    </div>
			    <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"/>
			    <div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
			  </div>
			</div>
			<!-- line 29b -->
			<div class="styGenericDiv" style="width:181mm;">
			  <div style="float:left;clear:none;">
			    <div class="styLNLeftNumBox"/>
			    <div class="styLNDesc" style="width:4mm;">
                  <span class="styBoldText">b</span>			    
			    </div>
			  <div class="styLNDesc" style="width:89mm;">
				<span style="float:left;">
				  Special deductions (Schedule C, line 20)
				</span>
				<!--Dotted Line-->
				<div class="styDotLn" style="float:right;padding-right:1mm;">.........</div>
			  </div>
			  </div>
			  <div style="float:right;clear:none;">
			    <div class="styLNRightNumBox" style="height:4.5mm;">29b</div>
			    <div class="styLNAmountBox" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
				    <xsl:with-param name="TargetNode" select="$Form1120Data/TotalSpecialDeductionsAmt"/>
				  </xsl:call-template>
			    </div>
			    <div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
			    <div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
			  </div>
			</div>
			<!-- line 29c -->
			<div class="styGenericDiv" style="width:181mm;">
			  <div style="float:left;clear:none;">
			    <div class="styLNLeftNumBox"/>
			    <div class="styLNDesc" style="width:4mm;">
                  <span class="styBoldText">c</span>			    
			    </div>
			  <div class="styLNDesc" style="width:129mm;">
				<span style="float:left;">
				  Add lines 29a and 29b
				</span>
				<!--Dotted Line-->
				<div class="styDotLn" style="float:right;padding-right:1mm;">........................</div>
			  </div>
			  </div>
			  <div style="float:right;clear:none;">
			    <div class="styLNRightNumBoxNBB" style="height:4.5mm;">29c</div>
			    <div class="styLNAmountBoxNBB" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
				    <xsl:with-param name="TargetNode" select="$Form1120Data/TotalNOLSpecialDeductionAmt"/>
				  </xsl:call-template>
			    </div>
			  </div>
			</div>
		  </div>
		  <!--END Main Form Deductions Section-->
		  <!--BEGIN Main Form Tax and Payment Section-->
		  <!-- Vertical Tax and Payment line -->
		  <div class="styBB" style="width:187mm;">
			<div class="styIRS1120VTImageBox" style="width:6mm;height:31.5mm;text-align:center;padding-top:4mm;">
			  <img src="{$ImagePath}/1120_TaxAndPayment.gif" alt="VertTaxAndPayments" valign="center"/>
			</div>
			<!-- line 30 -->
			<div class="styGenericDiv" style="width:181mm;">
			  <div style="float:left;clear:none;">
			    <div class="styLNLeftNumBox">30</div>
			    <div class="styLNDesc" style="width:132mm;">
				  <span style="float:left;">
				    <span class="styBoldText" style="font-size:7pt;">Taxable income.</span>
				    Subtract line 29c from line 28 (see instructions)
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
					  <xsl:with-param name="Desc">Line 30 - CCF Indicator</xsl:with-param>
					  <xsl:with-param name="TargetNode" select="$Form1120Data/TaxableIncomeAmt/@capitalConstructionFundCd"/>
				    </xsl:call-template>
				    <xsl:call-template name="LinkToLeftoverDataTableInline">
					  <xsl:with-param name="Desc">Line 30 - CCF Amount</xsl:with-param>
					  <xsl:with-param name="TargetNode" select="$Form1120Data/TaxableIncomeAmt/@capitalConstructionFundAmt"/>
					  <xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
				    </xsl:call-template>
				  </span>
				  <!--Dotted Line-->
				  <div class="styDotLn" style="float:right;padding-right:1mm;">..........</div>
			    </div>
			  </div>
			  <div style="float:right;clear:none;">
			    <div class="styLNRightNumBox" style="height:4.5mm;">30</div>
			    <div class="styLNAmountBox" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
				    <xsl:with-param name="TargetNode" select="$Form1120Data/TaxableIncomeAmt"/>
				  </xsl:call-template>
			    </div>
			  </div>
			</div>
			<!-- line 31 -->
			<div class="styGenericDiv" style="width:181mm;">
			  <div style="float:left;clear:none;">
			    <div class="styLNLeftNumBox">31</div>
			    <div class="styLNDesc" style="width:132mm;">
				  <span style="float:left;">
				    Total tax (Schedule J, Part I, line 11) 
				  </span>
				  <!--Dotted Line-->
				  <div class="styDotLn" style="float:right;padding-right:1mm;">....................</div>
			    </div>
			  </div>
			  <div style="float:right;clear:none;">
			    <div class="styLNRightNumBox" style="height:4.5mm;">31</div>
			    <div class="styLNAmountBox" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
				    <xsl:with-param name="TargetNode" select="$Form1120Data/TotalTaxAmt"/>
				  </xsl:call-template>
			    </div>
			  </div>
			</div>
			<!-- line 32 -->
			<div class="styGenericDiv" style="width:181mm;">
			  <div style="float:left;clear:none;">
			    <div class="styLNLeftNumBox">32</div>
			    <div class="styLNDesc" style="width:132mm;">
				  <span style="float:left;">Total payments and refundable credits  (Schedule J, Part II, line 21)
				  </span>
				  <!--Dotted Line-->
				  <div class="styDotLn" style="float:right;padding-right:1mm;">...........</div>
			    </div>
			  </div>
			  <div style="float:right;clear:none;">
			    <div class="styLNRightNumBox" style="height:4.5mm;">32</div>
			    <div class="styLNAmountBox" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
				    <xsl:with-param name="TargetNode" select="$Form1120Data/TotalPaymentsAndCreditsAmt"/>
				  </xsl:call-template>
			    </div>
			  </div>
			</div>
			<!-- Line 33 -->
			<!-- Difference 1120E&A do not contained push pin and check box type where 1120 do -->
			<div class="styGenericDiv" style="width:181mm;">
			  <div style="float:left;clear:none;">
			    <div class="styLNLeftNumBox">33</div>
			    <div class="styLNDesc" style="width:132mm;">
			      <span style="float:left;">
				    Estimated tax penalty (see instructions). 
				    <label>
					  <xsl:call-template name="PopulateLabel">
					    <xsl:with-param name="TargetNode" select="$Form1120Data/Form2220AttachedInd"/>
					    <xsl:with-param name="BackupName">IRS1120Form2220Attached</xsl:with-param>
					  </xsl:call-template>
					  Check if Form 2220 is attached
					  <span style="width:2px;"/>
				    </label>
				    <!-- Form to Form Link -->
				    <xsl:call-template name="SetFormLinkInline">
					  <xsl:with-param name="TargetNode" select="$Form1120Data/Form2220AttachedInd"/>
				    </xsl:call-template>
				  </span>
				  <!--Dotted Line-->
				  <div class="styDotLn" style="padding-left:.5mm;">......</div>
				  <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
				  <span style="width:8px"/>
				  <input type="checkbox" class="styCkbox">
				    <xsl:call-template name="PopulateCheckbox">
					  <xsl:with-param name="TargetNode" select="$Form1120Data/Form2220AttachedInd"/>
					  <xsl:with-param name="BackupName">IRS1120Form2220Attached</xsl:with-param>
				    </xsl:call-template>
				  </input>
			    </div>
			  </div>
			  <div style="float:right;clear:none;">
			    <div class="styLNRightNumBox" style="height:4.5mm;">33</div>
			    <div class="styLNAmountBox" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
				    <xsl:with-param name="TargetNode" select="$Form1120Data/EsPenaltyAmt"/>
				  </xsl:call-template>
			    </div>
			  </div>
			</div>
			<!-- Line 34 -->
			<div class="styGenericDiv" style="width:181mm;">
			  <div style="float:left;clear:none;">
			    <div class="styLNLeftNumBox">34</div>
			    <div class="styLNDesc" style="width:132mm;">
				  <span style="float:left;">
				    <span class="styBoldText">Amount owed.</span> If line 32 is smaller than the total of lines 31 and 33, enter amount owed. 
				  </span>
				  <!--Dotted Line-->
				  <div class="styDotLn" style="float:right;padding-right:1mm;">...</div>
			    </div>
			  </div>
			  <div style="float:right;clear:none;">
			    <div class="styLNRightNumBox" style="height:4.5mm;">34</div>
			    <div class="styLNAmountBox" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
				    <xsl:with-param name="TargetNode" select="$Form1120Data/BalanceDueAmt"/>
				  </xsl:call-template>
			    </div>
			  </div>
			</div>
			<!-- Line 35 -->
			<div class="styGenericDiv" style="width:181mm;">
			  <div style="float:left;clear:none;">
			    <div class="styLNLeftNumBox">35</div>
			    <div class="styLNDesc" style="width:132mm;">
				  <span style="float:left;">
				    <span class="styBoldText">Overpayment.</span> If line 32 is larger than the total of lines 31 and 33, enter amount overpaid 
			      </span>
				  <!--Dotted Line-->
				  <div class="styDotLn" style="float:right;padding-right:1mm;">...</div>
			    </div>
			  </div>
			  <div style="float:right;clear:none;">
			    <div class="styLNRightNumBox" style="height:4.5mm;">35</div>
			    <div class="styLNAmountBox" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
				    <xsl:with-param name="TargetNode" select="$Form1120Data/OverpaymentSection/OverpaymentAmt"/>
				  </xsl:call-template>
			    </div>
			  </div>
			</div>
			<br/>
			<!--line 36 -->
			<div class="styGenericDiv" style="width:181mm;">
			  <div style="float:left;clear:none;">
			    <div class="styLNLeftNumBox">36</div>
			    <div class="styLNDesc" style="width:87mm;">
				  <span style="font-size:6pt;">
				    Enter amount from line 35 you want:
                  </span>
				  <span class="styBoldText">Credited to 2014 estimated tax</span>
				  <span style="width:2px;"/>
				  <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
			    </div>
			    <div class="styGenericDiv" style="width:26mm;height:4mm;font-size:6pt;padding-top:3px;">
				  <xsl:call-template name="PopulateAmount">
				    <xsl:with-param name="TargetNode" select="$Form1120Data/OverpaymentSection/AppliedToEsTaxAmt"/>
				  </xsl:call-template>
			    </div>
			    <div class="styLNDesc" style="width:18mm;height:4mm;font-size:6pt;">
				  <span class="styBoldText">Refunded</span>
				  <xsl:call-template name="SetFormLinkInline">
				    <xsl:with-param name="TargetNode" select="$Form1120Data/OverpaymentSection/RefundAmt"/>
				  </xsl:call-template>
				  <span style="width:4px"/>
				  <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
			    </div>
			  </div>
			  <div style="float:right;clear:none;">
			    <div class="styLNRightNumBoxNBB" style="height:4.5mm;">36</div>
			    <div class="styLNAmountBoxNBB" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
				    <xsl:with-param name="TargetNode" select="$Form1120Data/OverpaymentSection/RefundAmt"/>
				  </xsl:call-template>
			    </div>
			  </div>
		    </div>
		  </div>
		  <!--END Main Form Tax and Payment Section-->
		  <br class="pageEnd"/>
		  <!-- BEGIN Signature Section -->
		  <!-- Implementing the signature section as a table -->
		  <table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:6pt;">
			<tr>
			  <td rowspan="3" style="width:10mm;font-size: 11pt;font-weight:bold;border-right:1px solid black;border-bottom:1px solid black;">Sign Here</td>
			  <td colspan="6" style="padding-left:1mm;padding-bottom:1mm;">Under penalties of perjury, I declare that I have examined this return, including accompanying schedules and statements, and to the best of my knowledge and belief, it is true, correct, and complete. Declaration of preparer (other than taxpayer) is based on all information of which preparer has any knowledge. </td>
			</tr>
			<tr>
			  <td rowspan="2" style="border-bottom:1px solid black;padding-left:1mm;">
				<img src="{$ImagePath}/1120_Bullet_Lg.gif" alt="LargeBullet"/>
			  </td>
			  <td style="width:52mm;border-right:1px solid black;border-bottom:1px solid black;vertical-align:bottom;">
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
				<img src="{$ImagePath}/1120_Bullet_Lg.gif" alt="LargeBullet"/>
			  </td>
			  <td style="width:60mm;border-bottom:1px solid black;vertical-align:bottom;">
				<xsl:call-template name="PopulateReturnHeaderOfficer">
				  <xsl:with-param name="TargetNode">Title</xsl:with-param>
				</xsl:call-template>
			  </td>
			  <td rowspan="2" style="width:40mm;border-bottom:1px solid black;padding-bottom:1mm;">
				<div class="styGenericDiv" style="width:2px;"/>
				<div style="border-right:3px solid black;border-left:3px solid black;border-bottom:3px solid black;border-top:3px solid black;float:right;" class="styGenericDiv">    
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
			  <td style="border-bottom:1px solid black;vertical-align:top;">Signature of officer </td>
			  <td style="border-bottom:1px solid black;vertical-align:top;">Date </td>
			  <td style="border-bottom:1px solid black;vertical-align:top;">Title </td>
			</tr>
		  </table>
		  <!-- END Signature Section -->
		  <!-- BEGIN PREPARER SIGNATURE SECTION -->
		  <!-- paid preparer -->
					<div class="styBB" style="width:187mm;font-size:6pt;">
						<div style="width:22.75mm;padding-top:4mm;float:left;clear:none;">
							<span class="styMainTitle" style="font-size:11pt;">
									Paid
									Preparer
									Use Only
									</span>
						</div>
						<div style="width:164mm;float:left;clear:none;">
							<div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;border-leftright:1px;">
								<div class="styLNDesc" style="height:8mm;width:46.8mm;padding-top:0mm;border-right:1px solid black;border-left:1px solid black;padding-left:1mm;">
								  Print/Type preparer's name<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PreparerPersonGrp/PreparerPersonNm"/>
										<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpPreparerPersonName</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="height:8mm;width:46.5mm;padding-top:0mm;border-right:1px solid black;padding-left:1mm;">
								Preparer's signature
							</div>
								<div class="styLNDesc" style="height:8mm;width:15mm;border-right:1px solid black;padding-top:0mm;padding-left:1mm;">Date <br/>
									<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">DatePrepared</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpDatePrepared</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="height:8mm;width:18mm;border-right:1px solid black;padding-top:.5mm;padding-bottom:0mm;padding-left:1mm;">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PreparerPersonGrp/SelfEmployedInd"/>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpSelfEmployed</xsl:with-param>
										</xsl:call-template>
										Check 
										<input class="styCkbox" type="checkbox" style="width:4mm;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PreparerPersonGrp/SelfEmployedInd"/>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpSelfEmployed</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:4.5px;"/>if<br/>self-employed
									</label>
								</div>
								<div class="styLNDesc" style="height:8mm;width:26mm;padding-top:0mm;padding-left:1mm;">PTIN
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
									<!--<xsl:if test="$RtnHdrData/PreparerPersonGrp/STIN">
										<xsl:call-template name="PopulateReturnHeaderPreparer">
											<xsl:with-param name="TargetNode">STIN</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpSTIN</xsl:with-param>
										</xsl:call-template>
									</xsl:if>-->
								</div>
							</div>
							<div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
								<div class="styLNDesc" style="height:auto;width:126.5mm;border-right:1px solid black;border-left:1px solid black;padding-left:1mm;">
									<span class="styGenericDiv" style="">Firm's name 
									<span style="width:2.2mm;"/>
										<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
										<span style="width:4px;"/>
									</span>
									<div class="styGenericDiv" style="padding-right:.5mm;">
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpPreparerFirmBusinessNameBusinessName1</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpPreparerFirmBusinessNameBusinessName2</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
								<div class="styLNDesc" style="height:6mm;width:32mm;padding-left:1mm;">Firm's EIN
									<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/> 
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
								<div class="styLNDesc" style="width:126.5mm;height:auto;border-right:1px solid black;border-left:1px solid black;padding-left:1mm;">
									<div class="styGenericDiv" style="padding-right:.5mm;">Firm's address 
									<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
									</div>
									<div class="styGenericDiv" style="padding-right:.5mm;">
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpAddressLine1</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpAddressLine2</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:if test="$RtnHdrData/PreparerFirmGrp/PreparerUSAddress">
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">City</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpUSAddressCity</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">State</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpUSAddressState</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">ZIPCode</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpUSAddressZip</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/PreparerFirmGrp/PreparerForeignAddress">
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">City</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpForeignAddressCity</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">ProvinceOrState</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpForeignProvinceOrState</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">PostalCode</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpForeignPostalCode</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">Country</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpForeignCountry</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</div>
								</div>
								<div class="styLNDesc" style="width:32mm;padding-left:1mm;"> Phone no. 
 								<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">Phone</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpPhoneNum</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpForeignPhoneNum</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
		  <!-- Implementing the Preparer section in table -->
		  
		  <!-- END PREPARER SIGNATURE SECTION -->
		  <!-- Page Break and Footer-->
		  <div class="pageEnd" style="width:187mm;padding-top:1mm;">
			<div style="float:left;">
			  <span class="styBoldText">For Paperwork Reduction Act Notice, see separate instructions.</span>
			  <span style="width:13mm;"/>                        
              Cat. No. 11450Q 
            </div>
			<div style="float:right;">
			  <span style="width:40px;"/>  
              Form <span class="styBoldText" style="font-size:8pt;">1120</span> (2013)
            </div>
		  </div>
		  <!-- END Page Break and Footer-->
		  <!--Begin Page 2 -->
		  <!-- Page Header -->
		  <div class="styBB" style="width:187mm;padding-top:.5mm;float:none;">
			<div style="float:left;">Form 1120 (2013)<span style="width:148mm;"/>
		  </div>
		  <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span></div>
		</div>
		<!-- END Page Header -->
		<!--br class="pageEnd"/-->
		<!-- BEGIN Schedule C Table -->
		<table class="styTable" style="font-size:7pt;border-bottom:1px solid black;width:187mm;padding-top:0mm;" cellspacing="0">
          <thead>
			<tr scope="col">
			  <th scope="col" class="styBB" colspan="2" style="width:92mm;padding-bottom:3mm;">
				<div class="styPartName" style="width:20mm;">Schedule C</div>
				<div class="styPartDesc" style="width:64mm;float:right;clear:none;">Dividends and Special Deductions
                  <span class="styNormalText">(see instructions)</span>
				</div>
			  </th>
			  <th scope="col" class="styLNAmountBox" style="width:40mm;height:8mm;text-align:center;font-size:7pt;padding-top:2mm;font-weight:normal;" colspan="2">
				<span class="styBoldText">(a)</span>
				<span style="width:2px;"/>Dividends <br/>received
			  </th>
			  <th scope="col" class="styIRS1120LNPercentBox" style="height:8mm;font-size:7pt;padding-top:0mm;font-weight:normal;">
				<span class="styBoldText">(b)</span>
				<span style="width:2px;"/>%
			  </th>
			  <th scope="col" class="styLNAmountBox" style="width:40mm;height:8mm;text-align:center;font-size:7pt;padding-top:1mm;font-weight:normal;" colspan="2">
				<span class="styBoldText">(c)</span>
				<span style="width:2px;"/>Special deductions <br/>
				<span class="styBoldText">(a)</span> X <span class="styBoldText">(b)</span>
			  </th>
			</tr>
		  </thead>
		  <tfoot/>
		  <tbody valign="top">
			<!--Schedule C, line 1 -->
			<tr>
			  <td class="styLNLeftNumBoxSD" style="height:7mm;padding-top:2mm;">1</td>
			  <td class="styLNDesc" style="width:84mm;height:7mm;padding-top:2mm;">
                Dividends from less-than-20%-owned domestic corporations 
                <span style="float:left;">(other than debt-financed stock) </span>
				<!--Dotted Line-->
				<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
			  </td>
			  <td class="styLNAmountBox" style="width:40mm;height:7mm;padding-top:2mm;vertical-align:bottom;" colspan="2">
				<span style="width:1px;"/>
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$Form1120ScheduleC/DomCorpBelow20OwnDivRcvdAmt"/>
				</xsl:call-template>
			  </td>
			  <td class="styIRS1120LNPercentBox" style="height:7mm;padding-top:2mm;vertical-align:bottom;">70</td>
			  <td class="styLNAmountBox" style="width:40mm;height:7mm;vertical-align:bottom;" colspan="2">
				<span style="width:1px;"/>
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$Form1120ScheduleC/DomCorpBelow20OwnDeductionAmt"/>
				</xsl:call-template>
			  </td>
			</tr>
			<!--Schedule C, line 2 -->
			<tr>
			  <td class="styLNLeftNumBox" style="height:7mm;padding-left:2.5mm;padding-top:2mm;">2</td>
			  <td class="styLNDesc" style="width:84mm;height:7mm;padding-top:2mm;">Dividends from 20%-or-more-owned domestic corporations 
                <span style="float:left;">(other than debt-financed stock) </span>
				<!--Dotted Line-->
				<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
			  </td>
			  <td class="styLNAmountBox" style="width:40mm;height:7mm;padding-top:2mm;vertical-align:bottom;" colspan="2">
				<span style="width:1px;"/>
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$Form1120ScheduleC/DomCorp20OrMoreOwnDivRcvdAmt"/>
				</xsl:call-template>
			  </td>
			  <td class="styIRS1120LNPercentBox" style="height:7mm;padding-top:2mm;vertical-align:bottom;">80</td>
			  <td class="styLNAmountBox" style="width:40mm;height:7mm;padding-top:2mm;vertical-align:bottom;" colspan="2">
				<span style="width:1px;"/>
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$Form1120ScheduleC/DomCorp20OrMoreOwnDeductionAmt"/>
				</xsl:call-template>
			  </td>
			</tr>
			<!--Schedule C, line 3 -->
			<tr>
			  <td class="styLNLeftNumBox" style="height:7mm;padding-left:2.5mm;padding-top:2mm;">3</td>
			  <td class="styLNDesc" style="width:84mm;height:7mm;padding-top:2mm;">
			    Dividends on debt-financed stock of domestic and foreign
				<span style="float:left;"> corporations </span>
				<!--Dotted Line-->
				<span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
			  </td>
			  <td class="styLNAmountBox" style="width:40mm;height:7mm;padding-top:3mm;" colspan="2">
				<span style="width:1px;"/>
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$Form1120ScheduleC/DebtFincdStockCorpDivRcvdAmt"/>
				</xsl:call-template>
			  </td>
			  <td class="styIRS1120LNPercentBox" style="height:7mm;padding-top:1mm;padding-bottom: 0mm;font-size:6pt;">see instructions</td>
			  <td class="styLNFormLinkBox" style="height:7mm;padding-top:3mm;">
				<!-- Form to Form Link -->
				<span style="width:2px;"/>
				<xsl:call-template name="SetFormLinkInline">
				  <xsl:with-param name="TargetNode" select="$Form1120ScheduleC/DebtFincdStockCorpDeductionAmt"/>
				</xsl:call-template>
			  </td>
			  <td class="styLNAmountBox" style="width:34mm;height:7mm;padding-top:3mm;border-left-width:0px;">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$Form1120ScheduleC/DebtFincdStockCorpDeductionAmt"/>
				</xsl:call-template>
				<span style="width:1px;"/>
			  </td>
			</tr>
			<!--Schedule C, line 4 -->
			<tr>
			  <td class="styLNLeftNumBox" style="height:7mm;padding-left:2.5mm;padding-top:2mm;">4</td>
			  <td class="styLNDesc" style="width:84mm;height:7mm;padding-top:2mm;">Dividends on certain preferred stock of less-than-20%-owned 
				<span style="float:left;"> public utilities </span>
				<!--Dotted Line-->
				<span class="styDotLn" style="float:right;padding-right:1mm;">................</span>
			  </td>
			  <td class="styLNAmountBox" style="width:40mm;height:7mm;padding-top:3mm;" colspan="2">
				<span style="width:1px;"/>
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$Form1120ScheduleC/PubUtilityBelow20DivRcvdAmt"/>
				</xsl:call-template>
			  </td>
			  <td class="styIRS1120LNPercentBox" style="height:7mm;padding-top:3mm;">42</td>
			  <td class="styLNAmountBox" style="width:40mm;height:7mm;padding-top:3mm;" colspan="2">
				<span style="width:1px;"/>
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$Form1120ScheduleC/PubUtilityBelow20DedAmt"/>
				</xsl:call-template>
			  </td>
			</tr>
			<!--Schedule C, line 5 -->
			<tr>
			  <td class="styLNLeftNumBox" style="height:7mm;padding-left:2.5mm;padding-top:2mm;">5</td>
			  <td class="styLNDesc" style="width:84mm;height:7mm;padding-top:2mm;">Dividends on certain preferred stock of 20%-or-more-owned 
				<span style="float:left;">public utilities </span>
				<!--Dotted Line-->
				<span class="styDotLn" style="float:right;padding-right:1mm;">................</span>
			  </td>
			  <td class="styLNAmountBox" style="width:40mm;height:7mm;padding-top:2mm;vertical-align:bottom;" colspan="2">
				<span style="width:1px;"/>
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$Form1120ScheduleC/PubUtility20OrMoreDivRcvdAmt"/>
				</xsl:call-template>
			  </td>
			  <td class="styIRS1120LNPercentBox" style="height:7mm;padding-top:2mm;vertical-align:bottom;">48</td>
			  <td class="styLNAmountBox" style="width:40mm;height:7mm;vertical-align:bottom;" colspan="2">
				<span style="width:1px;"/>
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$Form1120ScheduleC/PubUtility20OrMoreDedAmt"/>
				</xsl:call-template>
			  </td>
			</tr>
			<!--Schedule C, line 6 -->
			<tr>
			  <td class="styLNLeftNumBox" style="height:7mm;padding-left:2.5mm;padding-top:2mm;">6</td>
			  <td class="styLNDesc" style="width:84mm;height:7mm;padding-top:2mm;">Dividends from less-than-20%-owned foreign corporations and 
                <span style="float:left;">certain FSCs </span>
				<!--Dotted Line-->
				<span class="styDotLn" style="float:right;padding-right:1mm;">................</span>
			  </td>
			  <td class="styLNAmountBox" style="width:40mm;height:7mm;padding-top:2mm;vertical-align:bottom;" colspan="2">
				<span style="width:1px;"/>
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$Form1120ScheduleC/FrgnCorpBelow20OwnDivRcvdAmt"/>
				</xsl:call-template>
			  </td>
			  <td class="styIRS1120LNPercentBox" style="height:7mm;padding-top:2mm;vertical-align:bottom;">70</td>
			  <td class="styLNAmountBox" style="width:40mm;height:7mm;padding-top:2mm;vertical-align:bottom;" colspan="2">
				<span style="width:1px;"/>
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$Form1120ScheduleC/FrgnCorpBelow20OwnDeductionAmt"/>
				</xsl:call-template>
			  </td>
			</tr>
			<!--Schedule C, line 7 -->
			<tr>
			  <td class="styLNLeftNumBox" style="height:7mm;padding-left:2.5mm;padding-top:2mm;">7</td>
			  <td class="styLNDesc" style="width:84mm;height:7mm;padding-top:2mm;">Dividends from 20%-or-more-owned foreign corporations and 
                <span style="float:left;">certain FSCs </span>
				<!--Dotted Line-->
				<span class="styDotLn" style="float:right;padding-right:1mm;">................</span>
			  </td>
			  <td class="styLNAmountBox" style="width:40mm;height:7mm;padding-top:2mm;vertical-align:bottom;" colspan="2">
				<span style="width:1px;"/>
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$Form1120ScheduleC/FrgnCorp20OrMoreOwnDivRcvdAmt"/>
				</xsl:call-template>
			  </td>
			  <td class="styIRS1120LNPercentBox" style="height:7mm;padding-top:2mm;vertical-align:bottom;">80</td>
			  <td class="styLNAmountBox" style="width:40mm;height:7mm;padding-top:2mm;vertical-align:bottom;" colspan="2">
				<span style="width:1px;"/>
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$Form1120ScheduleC/FrgnCorp20OrMoreOwnDedAmt"/>
				</xsl:call-template>
			  </td>
			</tr>
			<!--Schedule C, line 8 -->
			<tr>
			  <td class="styLNLeftNumBox" style="height:9mm;padding-left:2.5mm;padding-top:5mm;">8</td>
			  <td class="styLNDesc" style="width:84mm;height:9mm;padding-top:5mm;font-size:7pt;">
				<span style="float:left;">Dividends from wholly owned foreign subsidiaries </span>
				<!--Dotted Line-->
				<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
			  </td>
			  <td class="styLNAmountBox" style="width:40mm;height:9mm;padding-top:2mm;vertical-align:bottom;" colspan="2">
				<span style="width:1px;"/>
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$Form1120ScheduleC/WhollyOwnFrgnSbsdryDivRcvdAmt"/>
				</xsl:call-template>
			  </td>
			  <td class="styIRS1120LNPercentBox" style="height:9mm;padding-top:2mm;vertical-align:bottom;">100</td>
			  <td class="styLNAmountBox" style="width:40mm;height:9mm;padding-top:2mm;vertical-align:bottom;" colspan="2">
				<span style="width:1px;"/>
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$Form1120ScheduleC/WhollyOwnFrgnSbsdryDedAmt"/>
				</xsl:call-template>
			  </td>
			</tr>
			<!--Schedule C, line 9 -->
			<tr>
			  <td class="styLNLeftNumBox" style="height:7mm;padding-left:2.5mm;padding-top:5mm;">9</td>
			  <td class="styLNDesc" style="width:84mm;height:7mm;padding-top:3mm;">
				<span class="styBoldText">Total.</span>
				Add lines 1 through 8. See instructions for limitation
			  </td>
			  <td class="styShadingCell" style="width:40mm;height:7mm;padding-top:5mm;border-bottom-width:1px;" colspan="2">
				<span style="width:1px;"/>
			  </td>
			  <td class="styShadingCell" style="width:14mm;height:7mm;padding-top:2mm;border-bottom-width:1px;">
				<span style="width:1px;"/>
			  </td>
			  <td class="styLNAmountBox" style="width:40mm;height:7mm;padding-top:3mm;" colspan="2">
				<span style="width:1px;"/>
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$Form1120ScheduleC/DivRcvdDedLimitationAmt"/>
				</xsl:call-template>
			  </td>
			</tr>
			<!--Schedule C, line 10 -->
			<tr>
			  <td class="styLNLeftNumBox" style="height:9mm;padding-top:5mm;">10</td>
			  <td class="styLNDesc" style="width:84mm;height:9mm;padding-top:3mm;">
				  Dividends from domestic corporations received by a small business investment 
				  company operating under the Small 
				  <span style="float:left;"> Business Investment Act of 1958 </span>
				  <!--Dotted Line-->
				  <span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
			  </td>
			  <td class="styLNAmountBox" style="width:40mm;height:9mm;padding-top:3mm;vertical-align:bottom;" colspan="2">
				<span style="width:1px;"/>
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$Form1120ScheduleC/DomSmallBusInvstCoDivRcvdAmt"/>
				</xsl:call-template>
			  </td>
			  <td class="styIRS1120LNPercentBox" style="height:9mm;padding-top:3mm;vertical-align:bottom;">100</td>
			  <td class="styLNFormLinkBox" style="height:9mm;vertical-align:bottom;padding-top:3mm;">
				<!-- Form to Form Link -->
				<span style="width:2px;"/>
				<xsl:call-template name="SetFormLinkInline">
				  <xsl:with-param name="TargetNode" select="$Form1120ScheduleC/DomSmallBusInvstCoDedAmt"/>
				</xsl:call-template>
			  </td>
			  <td class="styLNAmountBox" style="width:34mm;height:9mm;padding-top:6mm;border-left-width:0px;vertical-align:bottom;">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$Form1120ScheduleC/DomSmallBusInvstCoDedAmt"/>
				</xsl:call-template>
				<span style="width:1px;"/>
			  </td>
			</tr>
			<!--Schedule C, line 11 -->
			<tr>
			  <td class="styLNLeftNumBox" style="height:9mm;padding-top:5mm;">11</td>
			  <td class="styLNDesc" style="width:84mm;height:9mm;padding-top:5mm;font-size:7pt;">
				<span style="float:left;">Dividends from affiliated group members </span>
				<!--Dotted Line-->
				<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
			  </td>
			  <td class="styLNAmountBox" style="width:40mm;height:9mm;padding-top:2mm;vertical-align:bottom;" colspan="2">
				<span style="width:1px;"/>
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$Form1120ScheduleC/CertainAffltCompanyDivRcvdAmt"/>
				</xsl:call-template>
			  </td>
			  <td class="styIRS1120LNPercentBox" style="height:9mm;padding-top:2mm;vertical-align:bottom;">100</td>
			  <td class="styLNAmountBox" style="width:40mm;height:9mm;padding-top:2mm;vertical-align:bottom;" colspan="2">
				<span style="width:1px;"/>
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$Form1120ScheduleC/CertainAffltCompanyDedAmt"/>
				</xsl:call-template>
			  </td>
			</tr>
			<!--Schedule C, line 12 -->
			<tr>
			  <td class="styLNLeftNumBox" style="height:9mm;padding-top:5mm;">12</td>
			  <td class="styLNDesc" style="width:84mm;height:9mm;padding-top:5mm;font-size:7pt;">
				<span style="float:left;">Dividends from certain FSCs </span>
				<!--Dotted Line-->
				<div class="styDotLn" style="float:right;padding-right:1mm;">..........</div>
			  </td>
			  <td class="styLNAmountBox" style="width:40mm;height:9mm;padding-top:2mm;vertical-align:bottom;" colspan="2">
				<span style="width:1px;"/>
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$Form1120ScheduleC/CertainFSCDivRcvdAmt"/>
				</xsl:call-template>
			  </td>
			  <td class="styIRS1120LNPercentBox" style="height:9mm;padding-top:2mm;vertical-align:bottom;">100</td>
			  <td class="styLNAmountBox" style="width:40mm;height:9mm;padding-top:2mm;vertical-align:bottom;" colspan="2">
				<span style="width:1px;"/>
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$Form1120ScheduleC/CertainFSCDedAmt"/>
				</xsl:call-template>
			  </td>
			</tr>
			<!--Schedule C, line 13 -->
			<tr>
			  <td class="styLNLeftNumBox" style="height:7mm;padding-top:2mm;">13</td>
			  <td class="styLNDesc" style="width:84mm;height:7mm;padding-top:2mm;">
			    Dividends from foreign corporations not included on lines 3, 6, 
			    <span style="float:left;">7, 8, 11, or 12
				  <!-- Form to Form Link -->
				  <xsl:call-template name="SetFormLinkInline">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleC/OtherDivForeignCorpTotRcvdAmt"/>
				  </xsl:call-template>
				</span>
				<!--Dotted Line-->
				<span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
			  </td>
			  <td class="styLNAmountBox" style="width:40mm;height:7mm;padding-top:2mm;" valign="bottom" colspan="2">
				<span style="width:1px;"/>
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$Form1120ScheduleC/OtherDivForeignCorpTotRcvdAmt"/>
				</xsl:call-template>
			  </td>
			  <td class="styShadingCell" style="width:14mm;height:7mm;padding-top:2mm;">
			    <span style="width:1px;"/>
			  </td>
			  <td class="styShadingCell" style="width:40mm;height:7mm;padding-top:2mm;" colspan="2">
			    <span style="width:1px;"/>
			  </td>
			</tr>
			<!--Schedule C, line 14 -->
			<tr>
			  <td class="styLNLeftNumBox" style="height:7mm;padding-top:2mm;">14</td>
			  <td class="styLNDesc" style="width:84mm;height:7mm;padding-top:2mm;">
                Income from controlled foreign corporations under subpart F 
                <span style="float:left;">(attach Form(s) 5471)
                  <span style="width:2px;"/>
				  <!-- Form to Form Link -->
				  <xsl:call-template name="SetFormLinkInline">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleC/TotalIncmControlledFrgnCorpAmt"/>
				  </xsl:call-template>
				</span>
				<!--Dotted Line-->
				<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
			  </td>
			  <td class="styLNAmountBox" style="width:40mm;height:7mm;padding-top:2mm;vertical-align:bottom;" colspan="2">
				<span style="width:1px;"/>
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$Form1120ScheduleC/TotalIncmControlledFrgnCorpAmt"/>
				</xsl:call-template>
			  </td>
			  <td class="styShadingCell" style="width:14mm;height:7mm;padding-top:2mm;">
				<span style="width:1px;"/>
			  </td>
			  <td class="styShadingCell" style="width:40mm;height:7mm;padding-top:2mm;" colspan="2">
				<span style="width:1px;"/>
			  </td>
			</tr>
			<!--Schedule C, line 15 -->
			<tr>
			  <td class="styLNLeftNumBox" style="height:9mm;padding-top:5mm;">15</td>
			  <td class="styLNDesc" style="width:84mm;height:9mm;padding-top:5mm;">
				<span style="float:left;">Foreign dividend gross-up </span>
				<!--Dotted Line-->
				<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
			  </td>
			  <td class="styLNAmountBox" style="width:40mm;height:9mm;padding-top:5mm;" colspan="2">
				<span style="width:1px;"/>
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$Form1120ScheduleC/ForeignDivGrossUpTotRcvdAmt"/>
				</xsl:call-template>
			  </td>
			  <td class="styShadingCell" style="width:14mm;height:9mm;padding-top:2mm;">
				<span style="width:1px;"/>
			  </td>
			  <td class="styShadingCell" style="width:40mm;height:9mm;padding-top:2mm;" colspan="2">
				<span style="width:1px;"/>
			  </td>
			</tr>
			<!--Schedule C, line 16 -->
			<tr>
			  <td class="styLNLeftNumBox" style="height:7mm;padding-top:2mm;">16</td>
			  <td class="styLNDesc" style="width:84mm;height:7mm;padding-top:2mm;" valign="bottom">
				  IC-DISC and former DISC dividends not included on lines 1, 2, <br/>
				  <span style="float:left;display:inline;"> or 3 </span>
				<!--Dotted Line-->
				<div class="styDotLn" style="float:right;padding-right:1mm;">.................</div>
			  </td>
			  <td class="styLNAmountBox" style="width:40mm;height:7mm;padding-top:3mm;" colspan="2">
				<span style="width:1px;"/>
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$Form1120ScheduleC/ICDISCFormerDISCDivRcvdAmt"/>
				</xsl:call-template>
			  </td>
			  <td class="styShadingCell" style="width:14mm;height:7mm;padding-top:2mm;">
				<span style="width:1px;"/>
			  </td>
			  <td class="styShadingCell" style="width:40mm;height:7mm;padding-top:2mm;" colspan="2">
				<span style="width:1px;"/>
			  </td>
			</tr>
			<!--Schedule C, line 17 -->
			<tr>
			  <td class="styLNLeftNumBox" style="height:9mm;padding-top:5mm;">17</td>
			  <td class="styLNDesc" style="width:84mm;height:9mm;padding-top:5mm;">
				<span style="float:left;">Other dividends  
                  <!-- Form to Form Link -->
				  <xsl:call-template name="SetFormLinkInline">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleC/OtherDividendsTotRcvdAmt"/>
				  </xsl:call-template>
				  <span style="width:2px;"/>
				</span>
				<!--Dotted Line-->
				<span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
			  </td>
			  <td class="styLNAmountBox" style="width:40mm;height:9mm;padding-top:5mm;" colspan="2">
				<span style="width:1px;"/>
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$Form1120ScheduleC/OtherDividendsTotRcvdAmt"/>
				</xsl:call-template>
			  </td>
			  <td class="styShadingCell" style="width:14mm;height:9mm;padding-top:2mm;">
				<span style="width:1px;"/>
			  </td>
			  <td class="styShadingCell" style="width:40mm;height:9mm;padding-top:2mm;border-bottom-width:1px;" colspan="2">
				<span style="width:1px;"/>
			  </td>
			</tr>
			<!--Schedule C, line 18 -->
			<tr>
			  <td class="styLNLeftNumBox" style="height:7mm;padding-top:2mm;">18</td>
			  <td class="styLNDesc" style="width:84mm;height:7mm;padding-top:2mm;">
                Deduction for dividends paid on certain preferred stock of 
                <span style="float:left;">public utilities </span>
				<!--Dotted Line-->
				<div class="styDotLn" style="float:right;padding-right:1mm;">................</div>
			  </td>
			  <td class="styShadingCell" style="width:40mm;height:7mm;padding-top:2mm;border-bottom-width:1px;" colspan="2">
				<span style="width:1px;"/>
			  </td>
			  <td class="styShadingCell" style="width:14mm;height:7mm;padding-top:2mm;">
				<span style="width:1px;"/>
			  </td>
			  <td class="styLNAmountBox" style="width:40mm;height:7mm;padding-top:2mm;" colspan="2" valign="bottom">
				<span style="width:1px;"/>
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$Form1120ScheduleC/PubUtilityPrefStockDivDedAmt"/>
				</xsl:call-template>
			  </td>
			</tr>
			<!--Schedule C, line 19 -->
			<tr>
			  <td class="styLNLeftNumBox" style="height:7mm;padding-top:2mm;">19</td>
			  <td class="styLNDesc" style="width:84mm;height:7mm;padding-top:2mm;">
				<span class="styBoldText">Total dividends.</span> 
                Add lines 1 through 17. Enter here and on 
                <span style="float:left;">page 1, line 4 </span>
				<!--Dotted Line-->
				<div class="styDotLn" style="padding-right:1mm;">................</div>
				<span style="float:right;">
				  <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
				</span>
			  </td>
			  <td class="styLNAmountBox" style="width:40mm;height:7mm;padding-top:3mm;" colspan="2">
				<span style="width:1px;"/>
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$Form1120ScheduleC/TotalDividendsReceivedAmt"/>
				</xsl:call-template>
			  </td>
			  <td class="styShadingCell" style="width:14mm;height:7mm;padding-top:2mm;border-bottom-width:1px;">
				<span style="width:1px;"/>
			  </td>
			  <td class="styShadingCell" style="width:40mm;height:7mm;padding-top:2mm;border-bottom-width:1px;" colspan="2">
				<span style="width:1px;"/>
			  </td>
			</tr>
			<!--Schedule C, line 20 -->
			<tr class="styTBB" style="width:187mm;">
			  <td class="styLNLeftNumBox" style="height:9mm;padding-top:5mm;">20</td>
			  <td class="styLNDesc" colspan="4" style="width:138mm;height:9mm;padding-top:5mm;">
				<span style="float:left;">
				  <span class="styBoldText">Total special deductions.</span> 
                  Add lines 9, 10, 11, 12, and 18. Enter here and on page 1, line 29b 
                </span>
				<!--Dotted Line-->
				<div class="styDotLn" style="padding-right:1mm;">...</div>
				<span style="float:right;">
				  <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
				</span>
			  </td>
			  <td class="styLNAmountBoxNBB" style="width:40mm;height:9mm;padding-top:5mm;" colspan="2">
				<span style="width:1px;"/>
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$Form1120ScheduleC/TotalSpecialDeductionsAmt"/>
				</xsl:call-template>
			  </td>
			</tr>
		  </tbody>
		</table>
		<!-- END Schedule C Table -->
		<!-- Page Break and Footer-->
		<div class="pageEnd" style="width:187mm;padding-top:1mm;">
		  <div style="float:right;">
			<span style="width:80px;"/>  
            Form <span class="styBoldText" style="font-size:8pt;">1120</span> (2013)
          </div>
		</div>
		<!-- END Page Break and Footer-->
		<!--Begin Page 3 -->
		<!-- Page Header -->
		<div class="styBB" style="width:187mm;padding-top:.5mm;float:none;">
		  <div style="float:left;">Form 1120 (2013)<span style="width:148mm;"/></div>
		  <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">3</span></div>
		</div>
		<!-- END Page Header -->
		<!--br style="page-break-after:always;"/-->
		<!-- BEGIN Schedule J Title -->
		<div class="styBB" style="width:187mm;border-top-width:1px;float:none;">
		  <div class="styPartName" style="height:4mm;width:23mm;">Schedule J</div>
		  <div class="styPartDesc" style="height:4mm;width:164mm;">Tax Computation and Payment 
		    <span class="styNormalText"> (see instructions)</span>
		  </div>
		</div>
		<!-- END Schedule J Title -->
		<!-- Part I - Header -->
        <div class="styBB" style="width:187mm;height:4mm;font-weight: bold;font-size: 8pt;">
          Part I  Tax Computation
        </div>
		<!-- BEGIN Schedule J Line Items -->
		<!-- Schedule J, line 1 -->
		<div style="width:187mm;">
		  <div style="float:left;clear:none;">
			<div class="styLNLeftNumBoxSD" style="height:4.5mm;">1</div>
			<div class="styLNDesc" style="width:139mm;height:4.5mm;">
			  <span style="float:left;">
			    Check if the corporation is a member of a controlled group (attach Schedule O (Form 1120))
			    <xsl:call-template name="SetFormLinkInline">
				  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/MemberOfControlledGroupInd"/>
				</xsl:call-template>
			  </span>
			  <!--Dotted Line-->
			  <span class="styDotLn" style="padding-left:1mm;">.</span>
			  <span style="width:1mm;"/>
			  <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
				<span style="width:1mm;"/>
				<span style="width:4mm;">
				  <input type="checkbox" alt="alt" class="styCkbox" style="">
					<xsl:call-template name="PopulateCheckbox">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/MemberOfControlledGroupInd"/>
					  <xsl:with-param name="BackupName">IRS1120ScheduleJMemberOfControlledGroup</xsl:with-param>
					</xsl:call-template>
				  </input>
				  <label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/MemberOfControlledGroupInd"/>
							<xsl:with-param name="BackupName">IRS1120ScheduleJMemberOfControlledGroup</xsl:with-param>
						</xsl:call-template>
     			</label>				 
				</span>
			  </div>
			</div>
			<div style="float:right;clear:none;">
			  <div class="styLNRightNumBox" style="background-color:lightgrey;height:4.5mm;border-bottom-width:0px;"/>
			  <div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;"/>
			</div>
		  </div>
		  <!-- Schedule J, line 2 -->
		  <div style="width:187mm;">
			<div style="float:left;clear:none;">
			  <div class="styLNLeftNumBoxSD" style="height:4.5mm;padding-top:1mm;">2</div>
			  <div class="styLNDesc" style="width:139mm;height:4.5mm;padding-top:.5mm;">
				<span style="float:left;">
                  Income tax. 
                  Check if a qualified personal service corporation (see instructions)          
                  <!-- Form to Form Link -->
				  <xsl:call-template name="SetFormLinkInline">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/IncomeTaxAmt"/>
				  </xsl:call-template>
				  <xsl:call-template name="LinkToLeftoverDataTableInline">
					<xsl:with-param name="Desc">Schedule J Line 2 - Section 1291 Indicator</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/IncomeTaxAmt/@section1291Cd"/>
				  </xsl:call-template>
				  <xsl:call-template name="LinkToLeftoverDataTableInline">
					<xsl:with-param name="Desc">Schedule J Line 2 - Section 1291 Amount</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/IncomeTaxAmt/@section1291Amt"/>
				  </xsl:call-template>
				  <xsl:call-template name="LinkToLeftoverDataTableInline">
					<xsl:with-param name="Desc">Schedule J Line 2 - Section 197 Indicator</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/IncomeTaxAmt/@section197Cd"/>
				  </xsl:call-template>
				  <xsl:call-template name="LinkToLeftoverDataTableInline">
					<xsl:with-param name="Desc">Schedule J Line 2 - Section 197 Amount</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/IncomeTaxAmt/@section197Amt"/>
				  </xsl:call-template>
				</span>
				<!--Dotted Line-->
				<div class="styDotLn" style="padding-left:.5mm;padding-right:1mm;">..</div>
				<span style="width:4px;"/>
				<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
				<span style="width:4px;"/>
				<span style="width:4mm;padding-top:1mm;">
				  <input type="checkbox" alt="alt" class="styCkbox">
					<!--NOTE: ELEMENT NAME FOR THIS CHECK BOX IS DIFFERENT FROM 1120E&A -->
					<xsl:call-template name="PopulateCheckbox">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/QualifiedPersonalSrvcCorpInd"/>
					  <xsl:with-param name="BackupName">IRS1120ScheduleJQualifiedPersonalServiceCorp</xsl:with-param>
					</xsl:call-template>
					<!--NOTE: ELEMENT NAME FOR THIS CHECK BOX IS DIFFERENT FROM 1120E&A -->
				  </input>
				  <label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/QualifiedPersonalSrvcCorpInd"/>
							<xsl:with-param name="BackupName">IRS1120ScheduleJQualifiedPersonalServiceCorp</xsl:with-param>
						</xsl:call-template>
     			</label>				  
				</span>
			  </div>
			</div>
			<div style="float:right;clear:none;">
			  <div class="styLNRightNumBox" style="height:5.25mm;padding-top:1mm;">2</div>
			  <div class="styLNAmountBox" style="height:5.25mm;">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/IncomeTaxAmt"/>
				</xsl:call-template>
			  </div>
			</div>
		  </div>
		  <!-- Schedule J, line 3 -->
		  <div style="width:187mm;">
			<div style="float:left;clear:none;">
			  <div class="styLNLeftNumBoxSD">3</div>
			  <div class="styLNDesc" style="width:139mm;">
				<span style="float:left;">Alternative minimum tax (attach Form 4626)
			      <span style="width:2px;"/>
				  <!-- Form to Form Link -->
				  <xsl:call-template name="SetFormLinkInline">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/AlternativeMinimumTaxAmt"/>
				  </xsl:call-template>
				</span>
				<!--Dotted Line-->
				<span class="styDotLn" style="float:right;padding-right:1mm;">..................</span>
			  </div>
			</div>
			<div style="float:right;clear:none;">
			  <div class="styLNRightNumBox" style="height:4.5mm;">3</div>
			  <div class="styLNAmountBox" style="height:4.5mm;">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/AlternativeMinimumTaxAmt"/>
				</xsl:call-template>
			  </div>
			</div>
		  </div>
		  <!-- Schedule J, line 4 -->
		  <div style="width:187mm;">
			<div style="float:left;clear:none;">
			  <div class="styLNLeftNumBoxSD">4</div>
			  <div class="styLNDesc" style="width:139mm;">
				<span style="float:left;">Add lines 2 and 3 </span>
				<!--Dotted Line-->
				<span class="styDotLn" style="float:right;padding-right:1mm;">............................</span>
			  </div>
			</div>
			<div style="float:right;clear:none;">
			  <div class="styLNRightNumBox">4</div>
			  <div class="styLNAmountBox">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/IncomeTxPlusAltMinimumTaxAmt"/>
				</xsl:call-template>
			  </div>
			</div>
		  </div>
		  <!-- Schedule J, line 5a -->
		  <div style="width:187mm;">
			<div style="float:left;clear:none;">
			  <div class="styLNLeftNumBoxSD" style="height:4.5mm;">5a </div>
			  <div class="styLNDesc" style="width:99mm;">
				<span style="float:left;">Foreign tax credit (attach Form 1118)
			      <xsl:call-template name="SetFormLinkInline">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/ForeignTaxCreditAmt"/>
				  </xsl:call-template>
				</span>
				<!--Dotted Line-->
				<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
			  </div>
			</div>
			<div style="float:right;clear:none;">
			  <div class="styLNRightNumBox" style="height:4.5mm;">5a </div>
			  <div class="styLNAmountBox" style="width:31.3mm;height:4.5mm;border-bottom-width:1px;">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/ForeignTaxCreditAmt"/>
				</xsl:call-template>
			  </div>
			  <div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
			  <div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px"/>
			</div>
		  </div>
		  <!-- Schedule J, line 5b -->
		  <div style="width:187mm;">
			<div style="float:left;clear:none;">
			  <div class="styLNLeftNumBoxSD" style="height:4.5mm;padding-left:4mm;">b </div>
			  <div class="styLNDesc" style="width:99mm;">
				<span style="float:left;">
                  Credit from Form 8834(see instructions)
                  <xsl:call-template name="SetFormLinkInline">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/QlfyElecMotorVehCrAmt"/>
				  </xsl:call-template>
				  <span style="width:3px;"/>
				  <xsl:call-template name="LinkToLeftoverDataTableInline">
					<xsl:with-param name="Desc">Schedule J Line 5b - Form 5735 Indicator</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/QlfyElecMotorVehCrAmt/@form5735Cd"/>
				  </xsl:call-template>
				  <xsl:call-template name="LinkToLeftoverDataTableInline">
					<xsl:with-param name="Desc">Schedule J Line 5b - Form 5735 Amount</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/QlfyElecMotorVehCrAmt/@form5735Amt"/>
				  </xsl:call-template>
				</span>
				<!--Dotted Line-->
				<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
			  </div>
			</div>
			<div style="float:right;clear:none;">
			  <div class="styLNRightNumBox" style="height:4.5mm;">5b </div>
			  <div class="styLNAmountBox" style="width:31.3mm;height:4.5mm;border-bottom-width:1px;">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/QlfyElecMotorVehCrAmt"/>
				</xsl:call-template>
			  </div>
			  <div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
			  <div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px"/>
			</div>
		  </div>
		  <!-- Schedule J, line 5c -->
		  <div style="width:187mm;">
			<div style="float:left;clear:none;">
			  <div class="styLNLeftNumBoxSD" style="height:4.5mm;padding-left:4mm">c </div>
			  <div class="styLNDesc" style="width:99mm;">
				<span style="float:left;">
                  General business credit. (attach Form 3800)   
				  <xsl:call-template name="SetFormLinkInline">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/CYGenBusinessCreditAllowedAmt"/>
				  </xsl:call-template>
				  <span style="width:3px;"/>
				</span>
				<!--Dotted Line-->
				<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
			  </div>
			</div>
			<div style="float:right;clear:none;">
			  <div class="styLNRightNumBox" style="height:4.5mm;">5c</div>
			  <div class="styLNAmountBox" style="width:31.3mm;height:4.5mm;border-bottom-width:1px;">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/CYGenBusinessCreditAllowedAmt"/>
				</xsl:call-template>
			  </div>
			  <div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
			  <div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px"/>
			</div>
		  </div>
		  <!-- Schedule J, line 5d -->
		  <div style="width:187mm;">
			<div style="float:left;clear:none;">
			  <div class="styLNLeftNumBoxSD" style="height:4.5mm;padding-left:4mm;">d </div>
			  <div class="styLNDesc" style="width:99mm;">
				<span style="float:left;">
				  Credit for prior year minimum tax (attach Form 8827)
                  <xsl:call-template name="SetFormLinkInline">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/CurrentYearMinimumTaxCreditAmt"/>
				  </xsl:call-template>
				</span>
				<!--Dotted Line-->
				<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
			  </div>
			</div>
			<div style="float:right;clear:none;">
			  <div class="styLNRightNumBox" style="height:4.5mm;">5d </div>
			  <div class="styLNAmountBox" style="width:31.3mm;height:4.5mm;border-bottom-width:1px;">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/CurrentYearMinimumTaxCreditAmt"/>
				</xsl:call-template>
			  </div>
			  <div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
			  <div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px"/>
			</div>
		  </div>
		  <!--  Schedule J, Line 5e  -->
		  <div style="width:187mm;">
			<div style="float:left;clear:none;">
			  <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm">e</div>
				<div class="styLNDesc" style="width:99mm;">
				  <span style="float:left;">
                    Bond credits from Form 8912     
                    <xsl:call-template name="SetFormLinkInline">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/CurrentYearAllowableCreditAmt"/>
					</xsl:call-template>
				  </span>
				  <!--Dotted Line-->
				  <span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
				</div>
			  </div>
			  <div style="float:right;clear:none;">
				<div class="styLNRightNumBox">5e</div>
				<div class="styLNAmountBox" style="width:31.3mm;border-bottom-width:1px;">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/CurrentYearAllowableCreditAmt"/>
				  </xsl:call-template>
				</div>
				<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
				<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px"/>
			  </div>
			</div>
			<!-- Schedule J, line 6 -->
			<div style="width:187mm;">
			  <div style="float:left;clear:none;">
				<div class="styLNLeftNumBoxSD">6</div>
				<div class="styLNDesc" style="width:139mm;">
				  <span style="float:left;">
					<span class="styBoldText">Total credits.</span> Add lines 5a through 5e 
				  </span>
				  <!--Dotted Line-->
				  <div class="styDotLn" style="float:right;padding-right:1mm;">......................</div>
				</div>
			  </div>
			  <div style="float:right;clear:none;">
				<div class="styLNRightNumBox">6</div>
				<div class="styLNAmountBox">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/TotalCreditAmt"/>
				  </xsl:call-template>
				</div>
			  </div>
			</div>
			<!--  Schedule J, Line 7  -->
			<div style="width:187mm;">
			  <div style="float:left;clear:none;">
				<div class="styLNLeftNumBoxSD">7</div>
				<div class="styLNDesc" style="width:139mm;">
				  <span style="float:left;">Subtract line 6 from line 4 </span>
				  <!--Dotted Line-->
				  <span class="styDotLn" style="float:right;padding-right:1mm;">.........................</span>
				</div>
			  </div>
			  <div style="float:right;clear:none;">
				<div class="styLNRightNumBox">7</div>
				<div class="styLNAmountBox">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/TaxLessCreditsAmt"/>
				  </xsl:call-template>
				</div>
			  </div>
			</div>
			<!--  Schedule J, Line 8  -->
			<div style="width:187mm;">
			  <div style="float:left;clear:none;">
				<div class="styLNLeftNumBoxSD">8</div>
				<div class="styLNDesc" style="width:139mm;">
				  <span style="float:left;">
			        Personal holding company tax (attach Schedule PH (Form 1120))
			        <span style="width:2px;"/>
					<!-- Form to Form Link -->
					<xsl:call-template name="SetFormLinkInline">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/PersonalHoldingCompanyTaxAmt"/>
					</xsl:call-template>
				  </span>
				  <!--Dotted Line-->
				  <span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
				</div>
			  </div>
			  <div style="float:right;clear:none;">
				<div class="styLNRightNumBox" style="height:4.5mm;">8</div>
				<div class="styLNAmountBox" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/PersonalHoldingCompanyTaxAmt"/>
				  </xsl:call-template>
				</div>
			  </div>
			</div>
			<!--  Schedule J, Line 9a  -->
		    <div style="width:187mm;">
			  <div style="float:left;clear:none;">
			    <div class="styLNLeftNumBoxSD">9a</div>
				<div class="styLNDesc" style="width:99mm;">
				  <span style="float:left;">
                    Recapture of investment credit (attach Form 4255)     
                    <span style="width:2px;"/>
				    <!-- Form to Form Link -->
				    <xsl:call-template name="SetFormLinkInline">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/TotalIncreaseInTaxAmt"/>
				    </xsl:call-template>
				    <xsl:call-template name="LinkToLeftoverDataTableInline">
					  <xsl:with-param name="Desc">Line 9a - Section 1260B Indicator</xsl:with-param>
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/TotalIncreaseInTaxAmt/@section1260BCd"/>
				    </xsl:call-template>
				    <xsl:call-template name="LinkToLeftoverDataTableInline">
					  <xsl:with-param name="Desc">Line 9a - Section 1260B Amount</xsl:with-param>
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/TotalIncreaseInTaxAmt/@section1260BAmt"/>
					  <xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
				    </xsl:call-template>
				  </span>
				  <!--Dotted Line-->
				  <span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
				</div>
			  </div>
			  <div style="float:right;clear:none;">
				<div class="styLNRightNumBox" style="height:4.5mm;">9a</div>
				<div class="styLNAmountBox" style="width:31.3mm;height:4.5mm;border-bottom-width:1px;">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/TotalIncreaseInTaxAmt"/>
				  </xsl:call-template>
				</div>
				<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
				<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px"/>
			  </div>
			</div>
			<!--  Schedule J, Line 9b  -->
		    <div style="width:187mm;">
			  <div style="float:left;clear:none;">
			    <div class="styLNLeftNumBoxSD" style="padding-left:4mm;">b</div>
				<div class="styLNDesc" style="width:99mm;">
				  <span style="float:left;">
                    Recapture of low-income housing credit (attach Form 8611)     
                    <span style="width:2px;"/>
				    <!-- Form to Form Link -->
				    <xsl:call-template name="SetFormLinkInline">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/RecaptureTaxAmt"/>
				    </xsl:call-template>
				    <xsl:call-template name="LinkToLeftoverDataTableInline">
					  <xsl:with-param name="Desc">Line 9b - Form 8693 Approved Indicator</xsl:with-param>
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/RecaptureTaxAmt/@form8693ApprovedCd"/>
				    </xsl:call-template>
				    <xsl:call-template name="LinkToLeftoverDataTableInline">
					  <xsl:with-param name="Desc">Line 9b - Form 8693 Approval Date</xsl:with-param>
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/RecaptureTaxAmt/@form8693ApprovedDt"/>
					  <xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
				    </xsl:call-template>
				  </span>
				  <!--Dotted Line-->
				  <span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
				</div>
			  </div>
			  <div style="float:right;clear:none;">
				<div class="styLNRightNumBox" style="height:4.5mm;">9b</div>
				<div class="styLNAmountBox" style="width:31.3mm;height:4.5mm;border-bottom-width:1px;">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/RecaptureTaxAmt"/>
				  </xsl:call-template>
				</div>
				<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
				<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px"/>
			  </div>
			</div>
			<!--  Schedule J, Line 9c  -->
		    <div style="width:187mm;">
			  <div style="float:left;clear:none;">
			    <div class="styLNLeftNumBoxSD" style="padding-left:4mm;">c</div>
				<div class="styLNDesc" style="width:99mm;">
				  Interest due under the look-back method--completed long-term contracts 
				  <span style="float:left;">
                    (attach Form 8697)      
                    <span style="width:2px;"/>
				    <!-- Form to Form Link -->
				    <xsl:call-template name="SetFormLinkInline">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/IntDueUndLkbckMthdLTCntrctAmt"/>
				    </xsl:call-template>
				  </span>
				  <!--Dotted Line-->
				  <span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>
				</div>
			  </div>
			  <div style="float:right;clear:none;">
				<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">9c</div>
				<div class="styLNAmountBox" style="width:31.3mm;height:8mm;padding-top:4mm;border-bottom-width:1px;">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/IntDueUndLkbckMthdLTCntrctAmt"/>
				  </xsl:call-template>
				</div>
				<div class="styLNRightNumBox" style="height:8mm;background-color:lightgrey;border-bottom-width:0px"/>
				<div class="styLNAmountBox" style="height:8mm;border-bottom-width:0px"/>
			  </div>
			</div>
			<!--  Schedule J, Line 9d  -->
		    <div style="width:187mm;">
			  <div style="float:left;clear:none;">
			    <div class="styLNLeftNumBoxSD" style="padding-left:4mm;">d</div>
				<div class="styLNDesc" style="width:99mm;">
				  Interest due under the look-back method--income forecast method      
				  <span style="float:left;">
                    (attach Form 8866)     
                    <span style="width:2px;"/>
				    <!-- Form to Form Link -->
				    <xsl:call-template name="SetFormLinkInline">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/IntDueUndLkbckMthdIncmFrcstAmt"/>
				    </xsl:call-template>
				  </span>
				  <!--Dotted Line-->
				  <span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>
				</div>
			  </div>
			  <div style="float:right;clear:none;">
				<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">9d</div>
				<div class="styLNAmountBox" style="width:31.3mm;height:8mm;padding-top:4mm;border-bottom-width:1px;">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/IntDueUndLkbckMthdIncmFrcstAmt"/>
				  </xsl:call-template>
				</div>
				<div class="styLNRightNumBox" style="height:8mm;background-color:lightgrey;border-bottom-width:0px;"/>
				<div class="styLNAmountBox" style="height:8mm;border-bottom-width:0px"/>
			  </div>
			</div>
			<!--  Schedule J, Line 9e  -->
		    <div style="width:187mm;">
			  <div style="float:left;clear:none;">
			    <div class="styLNLeftNumBoxSD" style="padding-left:4mm;">e</div>
				<div class="styLNDesc" style="width:99mm;">
				  <span style="float:left;">
                    Alternative tax on qualifying shipping activities (attach Form 8902)     
                    <span style="width:2px;"/>
				    <!-- Form to Form Link -->
				    <xsl:call-template name="SetFormLinkInline">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/AlternativeTaxQlfyShipActyAmt"/>
				    </xsl:call-template>
				  </span>
				  <!--Dotted Line-->
				  <span class="styDotLn" style="float:right;padding-right:1mm;">.</span>
				</div>
			  </div>
			  <div style="float:right;clear:none;">
				<div class="styLNRightNumBox" style="height:4.5mm;">9e</div>
				<div class="styLNAmountBox" style="width:31.3mm;height:4.5mm;border-bottom-width:1px;">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/AlternativeTaxQlfyShipActyAmt"/>
				  </xsl:call-template>
				</div>
				<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
				<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px"/>
			  </div>
			</div>
			<!--  Schedule J, Line 9f  -->
			<div style="width:187mm;">
			  <div style="float:left;clear:none;">
				<div class="styLNLeftNumBoxSD" style="padding-left:4mm;">f</div>
				<div class="styLNDesc" style="width:99mm;">
				  <span style="float:left;">
			        Other (see instructions  attach statement)
			        <span style="width:2px;"/>
					<!-- Form to Form Link -->
					<xsl:call-template name="SetFormLinkInline">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/OtherTaxesAmt"/>
					</xsl:call-template>
				  </span>
				  <!--Dotted Line-->
				  <span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
				</div>
			  </div>
			  <div style="float:right;clear:none;">
				<div class="styLNRightNumBox">9f</div>
				<div class="styLNAmountBox" style="width:31.3mm;border-bottom-width:1px;">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/OtherTaxesAmt"/>
				  </xsl:call-template>
				</div>
				<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
				<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px"/>
			  </div>
			</div>
		    <!--  Schedule J, Line 10  -->
			<div style="width:187mm;clear:both;">
			  <div style="float:left;clear:none;">
				<div class="styLNLeftNumBox">10</div>
				<div class="styLNDesc">
				  <span style="float:left;">
					<span class="styBoldText">Total. </span>Add lines 9a through 9f 
					  <!-- Form to Form Link -->
				    <xsl:call-template name="SetFormLinkInline">
					   <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/TotalOtherTaxesAndInterestAmt"/>
				    </xsl:call-template>
					</span>					
				  <!--Dotted Line-->
				  <span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
				</div>
			  </div>
			  <div style="float:right;clear:none;">
				<div class="styLNRightNumBox" style="height:4.5mm;">10</div>
				<div class="styLNAmountBox" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/TotalOtherTaxesAndInterestAmt"/>
				  </xsl:call-template>
				</div>
			  </div>
			</div>
			<!--  Schedule J, Line 11  -->
			<div class="styBB" style="width:187mm;clear:both;">
			  <div style="float:left;clear:none;">
				<div class="styLNLeftNumBox">11</div>
				<div class="styLNDesc">
				  <span style="float:left;">
					<span class="styBoldText">Total tax.</span> Add lines 7, 8, and 10. Enter here and on page 1, line 31
				  </span>
				  <!--Dotted Line-->
				  <span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
				</div>
			  </div>
			  <div style="float:right;clear:none;">
				<div class="styLNRightNumBoxNBB" style="height:4.5mm;">11</div>
				<div class="styLNAmountBoxNBB" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/TotalTaxAmt"/>
				  </xsl:call-template>
				</div>
			  </div>
			</div>
			<!-- Schedule J Part II - Header -->
			<div class="styBB" style="width:187mm;height:4mm;font-weight: bold;font-size: 8pt;">
              Part II  Payments and Refundable Credits (see instructions)
            </div>
            <!--  Schedule J, Line 12  -->
			<div style="width:187mm;clear:both;">
			  <div style="float:left;clear:none;">
				<div class="styLNLeftNumBox">12</div>
				<div class="styLNDesc">
				  <span style="float:left;">
				    2012 overpayment credited to 2013				
			        <span style="width:2px;"/> 
				  </span>
				  <!--Dotted Line-->
				  <span class="styDotLn" style="float:right;padding-right:1mm;">......................</span>
				</div>
			  </div>
			  <div style="float:right;clear:none;">
				<div class="styLNRightNumBox" style="height:4.5mm;">12</div>
				<div class="styLNAmountBox" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/PriorYearOverpaymentCreditAmt"/>
				  </xsl:call-template>
				</div>
			  </div>
			</div>
			<!--  Schedule J, Line 13  -->
			<div style="width:187mm;clear:both;">
			  <div style="float:left;clear:none;">
				<div class="styLNLeftNumBox">13</div>
				<div class="styLNDesc">
				  <span style="float:left;">2013 estimated tax payments
			        <span style="width:2px;"/> 
				    <!-- Form to Form Link -->
				    <xsl:call-template name="SetFormLinkInline">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/EstimatedTaxPaymentsAmt"/>
				    </xsl:call-template>
				    <!-- Beneficiary Of Trust Indicator -->
				    <xsl:call-template name="LinkToLeftoverDataTableInline">
					  <xsl:with-param name="Desc">Line 13 - Beneficiary Of Trust Indicator</xsl:with-param>
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/EstimatedTaxPaymentsAmt/@beneficiaryTrustCd"/>
				    </xsl:call-template>
				    <xsl:call-template name="LinkToLeftoverDataTableInline">
					  <xsl:with-param name="Desc">Line 13 - Beneficiary Of Trust Amount</xsl:with-param>
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/EstimatedTaxPaymentsAmt/@beneficiaryTrustAmt"/>
					  <xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
				    </xsl:call-template>
				    <!-- Form 8816 Indicator -->
				    <xsl:call-template name="LinkToLeftoverDataTableInline">
					  <xsl:with-param name="Desc">Line 13 - Form 8816 Indicator</xsl:with-param>
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/EstimatedTaxPaymentsAmt/@form8816Cd"/>
				    </xsl:call-template>
				    <xsl:call-template name="LinkToLeftoverDataTableInline">
					  <xsl:with-param name="Desc">Line 13 - Form 8816 Amount</xsl:with-param>
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/EstimatedTaxPaymentsAmt/@form8816Amt"/>
					  <xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
				    </xsl:call-template>
				    <!-- Section 847 Deduction Indicator -->
				    <xsl:call-template name="LinkToLeftoverDataTableInline">
					  <xsl:with-param name="Desc">Line 13 - Section 847 Deduction Indicator</xsl:with-param>
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/EstimatedTaxPaymentsAmt/@section847DeductionCd"/>
				    </xsl:call-template>
				  </span>
				  <!--Dotted Line-->
				  <span class="styDotLn" style="float:right;padding-right:1mm;">...................</span>
				</div>
			  </div>
			  <div style="float:right;clear:none;">
				<div class="styLNRightNumBox" style="height:4.5mm;">13</div>
				<div class="styLNAmountBox" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/EstimatedTaxPaymentsAmt"/>
				  </xsl:call-template>
				</div>
			  </div>
			</div>
			<!--  Schedule J, Line 14  -->
			<div style="width:187mm;clear:both;">
			  <div style="float:left;clear:none;">
				<div class="styLNLeftNumBox">14</div>
				<div class="styLNDesc">
				  <span style="float:left;">2013 refund applied for on Form 4466
			        <span style="width:2px;"/> 
				  </span>
				  <!--Dotted Line-->
				  <span class="styDotLn" style="float:right;padding-right:1mm;">....................</span>
				</div>
			  </div>
			  <div style="float:right;clear:none;">
				<div class="styLNRightNumBox" style="height:4.5mm;">14</div>
				<div class="styLNAmountBox" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/OverpaymentOfEstimatedTaxAmt"/>
				  </xsl:call-template>
				</div>
			  </div>
			</div>
			<!--  Schedule J, Line 15  -->
			<div style="width:187mm;clear:both;">
			  <div style="float:left;clear:none;">
				<div class="styLNLeftNumBox">15</div>
				<div class="styLNDesc">
				  <span style="float:left;">
				    Combine lines 12, 13, and 14 
			        <span style="width:2px;"/> 
				  </span>
				  <!--Dotted Line-->
				  <span class="styDotLn" style="float:right;padding-right:1mm;">......................</span>
				</div>
			  </div>
			  <div style="float:right;clear:none;">
				<div class="styLNRightNumBox" style="height:4.5mm;">15</div>
				<div class="styLNAmountBox" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/BalanceAmt"/>
				  </xsl:call-template>
				</div>
			  </div>
			</div>
			<!--  Schedule J, Line 16  -->
			<div style="width:187mm;clear:both;">
			  <div style="float:left;clear:none;">
				<div class="styLNLeftNumBox">16</div>
				<div class="styLNDesc">
				  <span style="float:left;">
				    Tax deposited with Form 7004
			        <span style="width:2px;"/> 
				  </span>
				  <!--Dotted Line-->
				  <span class="styDotLn" style="float:right;padding-right:1mm;">........................</span>
				</div>
			  </div>
			  <div style="float:right;clear:none;">
				<div class="styLNRightNumBox" style="height:4.5mm;">16</div>
				<div class="styLNAmountBox" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/TaxPaidForm7004Amt"/>
				  </xsl:call-template>
				</div>
			  </div>
			</div>
			<!--  Schedule J, Line 17  -->
			<div style="width:187mm;clear:both;">
			  <div style="float:left;clear:none;">
				<div class="styLNLeftNumBox">17</div>
				<div class="styLNDesc">
				  <span style="float:left;">
				    Withholding (see instructions)
			        <span style="width:2px;"/> 
				  </span>
				  <!--Dotted Line-->
				  <span class="styDotLn" style="float:right;padding-right:1mm;">.......................</span>
				</div>
			  </div>
			  <div style="float:right;clear:none;">
				<div class="styLNRightNumBox" style="height:4.5mm;">17</div>
				<div class="styLNAmountBox" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/FederalIncomeTaxWithheldAmt"/>
				  </xsl:call-template>
				</div>
			  </div>
			</div>
			<!--  Schedule J, Line 18 -->
			<div style="width:187mm;clear:both;">
			  <div style="float:left;clear:none;">
				<div class="styLNLeftNumBox">18</div>
				<div class="styLNDesc">
				  <span style="float:left;">
					<span class="styBoldText">Total payments. </span>Add lines 15, 16 and 17 
			        <span style="width:2px;"/> 
				  </span>
				  <!--Dotted Line-->
				  <span class="styDotLn" style="float:right;padding-right:1mm;">....................</span>
				</div>
			  </div>
			  <div style="float:right;clear:none;">
				<div class="styLNRightNumBox" style="height:4.5mm;">18</div>
				<div class="styLNAmountBox" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/TotalPaymentsAmt"/>
				  </xsl:call-template>
				</div>
			  </div>
			</div>
			<!--  Schedule J, Line 19 --> <!--Update per WR51699 for R7_DD4 PDF draft dated 8/9/2011-->
			<div style="width:187mm;clear:both;">
			  <div style="float:left;clear:none;">
				<div class="styLNLeftNumBox">19</div>
				<div class="styLNDesc">Refundable credits from: </div>
			  </div>
			  <div style="float:right;clear:none;">
				<div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
				<div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
			  </div>
			</div>
			<!--  Schedule J, Line 19a  -->
		    <div style="width:187mm;">
			  <div style="float:left;clear:none;">
			    <div class="styLNLeftNumBox" style="padding-left:4mm;">a</div>
				<div class="styLNDesc" style="width:99mm;">
				  <span style="float:left;">
                    Form 2439 
                    <span style="width:2px;"/>
                    <!-- Form to Form Link -->     
                    <xsl:call-template name="SetFormLinkInline">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/TotalUndistributedLTCapGainAmt"/>
					</xsl:call-template>
				  </span>
				  <!--Dotted Line-->
				  <span class="styDotLn" style="float:right;padding-right:1mm;">...................</span>
				</div>
			  </div>
			  <div style="float:right;clear:none;">
				<div class="styLNRightNumBox" style="height:4.5mm;">19a</div>
				<div class="styLNAmountBox" style="width:31.3mm;height:4.5mm;border-bottom-width:1px;">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/TotalUndistributedLTCapGainAmt"/>
				  </xsl:call-template>
				</div>
				<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
				<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px"/>
			  </div>
			</div>
			<!--  Schedule J, Line 19b  -->
		    <div style="width:187mm;">
			  <div style="float:left;clear:none;">
			    <div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
				<div class="styLNDesc" style="width:99mm;">
				  <span style="float:left;">
                    Form 4136     
                    <span style="width:2px;"/> 
				    <!-- Form to Form Link -->
				    <xsl:call-template name="SetFormLinkInline">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/TotalFuelTaxCreditAmt"/>
				    </xsl:call-template>
				    <!-- Ozone Depleting Chemicals IndIndicator -->
				    <xsl:call-template name="LinkToLeftoverDataTableInline">
					  <xsl:with-param name="Desc">Line 19b - Ozone Depleting Chemicals IndIndicator</xsl:with-param>
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/TotalFuelTaxCreditAmt/@ozoneDepletingChemicalCd"/>
				    </xsl:call-template>
				  </span>
				  <!--Dotted Line-->
				  <span class="styDotLn" style="float:right;padding-right:1mm;">...................</span>
				</div>
			  </div>
			  <div style="float:right;clear:none;">
				<div class="styLNRightNumBox" style="height:4.5mm;">19b</div>
				<div class="styLNAmountBox" style="width:31.3mm;height:4.5mm;border-bottom-width:1px;">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/TotalFuelTaxCreditAmt"/>
				  </xsl:call-template>
				</div>
				<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
				<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px"/>
			  </div>
			</div>
			<!--  Schedule J, Line 19c -->
			<div style="width:187mm;clear:both;">
			  <div style="float:left;clear:none;">
				<div class="styLNLeftNumBox" style="padding-left:4mm;">c</div>
				<div class="styLNDesc" style="width:99mm;">
				  <span style="float:left;">
				    Form 8827, line 8c
			        <span style="width:2px;"/> 
					<!-- Form to Form Link --> 
					<xsl:call-template name="SetFormLinkInline">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/RefundableCreditsAmt"/>
					</xsl:call-template>
				  </span>
				  <!--Dotted Line-->
				  <span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
				</div>
			  </div>
			  <div style="float:right;clear:none;">
				<div class="styLNRightNumBox" style="height:4.5mm;">19c</div>
				<div class="styLNAmountBox" style="width:31.3mm;height:4.5mm;border-bottom-width:1px;">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/RefundableCreditsAmt"/>
				  </xsl:call-template>
				</div>
				<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
				<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px"/>
			  </div>
			</div>
			<!--  Schedule J, Line 19d -->
			<div style="width:187mm;clear:both;">
			  <div style="float:left;clear:none;">
				<div class="styLNLeftNumBox" style="padding-left:4mm;">d</div>
				<div class="styLNDesc" style="width:99mm;">
				  <span style="float:left;">
				    Other (attach statement  see instructions)
			        <span style="width:2px;"/> 
					<!-- Form to Form Link --> 
					<xsl:call-template name="SetFormLinkInline">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/OtherRefundableCreditsAmt"/>
					</xsl:call-template>
				  </span>
				  <!--Dotted Line-->
				  <span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
				</div>
			  </div>
			  <div style="float:right;clear:none;">
				<div class="styLNRightNumBox">19d</div>
				<div class="styLNAmountBox" style="width:31.3mm;border-bottom-width:1px;">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/OtherRefundableCreditsAmt"/>
				  </xsl:call-template>
				</div>
				<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
				<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px"/>
			  </div>
			</div>
			<!--  Schedule J, Line 20 -->
			<div style="width:187mm;clear:both;">
			  <div style="float:left;clear:none;">
				<div class="styLNLeftNumBox">20</div>
				<div class="styLNDesc">
				  <span style="float:left;">
					<span class="styBoldText">Total credits. </span>Add lines 19a through 19d 
			        <span style="width:2px;"/> 
				  </span>
				  <!--Dotted Line-->
				  <span class="styDotLn" style="float:right;padding-right:1mm;">....................</span>
				</div>
			  </div>
			  <div style="float:right;clear:none;">
				<div class="styLNRightNumBox" style="height:4.5mm;">20</div>
				<div class="styLNAmountBox" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/TotalRefundableCreditsAmt"/>
				  </xsl:call-template>
				</div>
			  </div>
			</div>
			<!--  Schedule J, Line 21 -->
			<div class="styBB" style="width:187mm;clear:both;">
			  <div style="float:left;clear:none;">
				<div class="styLNLeftNumBox">21</div>
				<div class="styLNDesc">
				  <span style="float:left;">
					<span class="styBoldText">Total payments and credits. </span>
					Add lines 18 and 20. Enter here and on page 1, line 32 
			        <span style="width:2px;"/> 
				  </span>
				  <!--Dotted Line-->
				  <span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
				</div>
			  </div>
			  <div style="float:right;clear:none;">
				<div class="styLNRightNumBoxNBB" style="height:4.5mm;">21</div>
				<div class="styLNAmountBoxNBB" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/TotalPaymentsAndCreditsAmt"/>
				  </xsl:call-template>
				</div>
			  </div>
			</div>
			<!-- END Schedule J Line Items -->			
			<!-- BEGIN SCHEDULE K -->
			<div style="width:187mm;clear:both;border-top-width:1px;" class="styBB">
			  <div style="height:4mm;width:23mm;" class="styPartName">Schedule K</div>
			  <div style="height:4mm;width:164mm;" class="styPartDesc">Other Information
			    <span class="styNormalText"> (see instructions)</span>
			  </div>
			</div>
			<!-- Schedule K, line 1 -->
			<div style="width:187mm;">
			  <div class="styLNLeftNumBoxSD" style="height:4.5mm;">1</div>
			  <div class="styLNDesc" style="width:167mm;height:4.5mm;">Check accounting method:
                <span style="width:5mm;"/>
				<span class="styBoldText">a</span>
				<span style="width:3px;"/>
				<input type="checkbox" class="styCkbox">
				  <xsl:call-template name="PopulateCheckbox">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/MethodOfAccountingCashInd"/>
					<xsl:with-param name="BackupName">IRS1120ScheduleKMethodOfAccountingCash</xsl:with-param>
				  </xsl:call-template>
				</input>
				<label>
				  <xsl:call-template name="PopulateLabel">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/MethodOfAccountingCashInd"/>
					<xsl:with-param name="BackupName">IRS1120ScheduleKMethodOfAccountingCash</xsl:with-param>
				  </xsl:call-template>
				  Cash
			    </label>
				<span style="width:5mm;"/>
				<span class="styBoldText">b</span>
				<span style="width:3px;"/>
				<input type="checkbox" class="styCkbox">
				  <xsl:call-template name="PopulateCheckbox">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/MethodOfAccountingAccrualInd"/>
					<xsl:with-param name="BackupName">IRS1120ScheduleKMethodOfAccountingAccrual</xsl:with-param>
				  </xsl:call-template>
				</input>
				<label>
				  <xsl:call-template name="PopulateLabel">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/MethodOfAccountingAccrualInd"/>
					<xsl:with-param name="BackupName">IRS1120ScheduleKMethodOfAccountingAccrual</xsl:with-param>
				  </xsl:call-template>
				  Accrual
			    </label>
				<label>
				  <xsl:call-template name="PopulateLabel">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/MethodOfAccountingOtherInd"/>
					<xsl:with-param name="BackupName">IRS1120ScheduleKMethodOfAccountingOther</xsl:with-param>
				  </xsl:call-template>
				  <span style="width:85mm;">
					<span style="width:7mm;"/>
					<span class="styBoldText">c</span>
					<span style="width:5px;"/>
					<input type="checkbox" class="styCkbox">
					  <xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/MethodOfAccountingOtherInd"/>
						<xsl:with-param name="BackupName">IRS1120ScheduleKMethodOfAccountingOther</xsl:with-param>
					  </xsl:call-template>
					</input>
                    Other (specify)
                    <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
					<span style="width:45mm;border-bottom:1px solid black;">
					  <xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/MethodOfAccountingOtherInd/@methodOfAccountingOtherDesc"/>
					  </xsl:call-template>
					</span>
				  </span>
				</label>
			  </div>
			  <div class="styIRS1120LNYesNoBox">Yes</div>
			  <div class="styIRS1120LNYesNoBoxRB" style="border-right-width:0px;">No</div>
			</div>
			<!-- Schedule K, Line 2 -->
			<div style="width:187mm;">
			  <div class="styLNLeftNumBoxSD" style="height:4.5mm;">2</div>
			  <div class="styLNDesc" style="width:167mm;height:4.5mm;">See the instructions and enter the:</div>
			  <div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
			  <div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px;"/>
			</div>
			<!-- Schedule K, Line 2a -->
			<div style="width:187mm;">
			  <div class="styLNLeftNumBoxSD" style="height:4.5mm;padding-left:4mm;">a</div>
			  <div class="styLNDesc" style="width:39mm;height:4.5mm;">
                Business activity code no. <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
			  </div>
			  <div class="styIRS1120BBText" style="width:128mm;text-align:left;float:left;">
				<xsl:choose>
				  <xsl:when test="$Form1120ScheduleK/PrincipalBusinessActivityCd">
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleK/PrincipalBusinessActivityCd"/>
					</xsl:call-template>
				  </xsl:when>
				  <xsl:otherwise>
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleK/InactivePrincipalBusActyCd"/>
					</xsl:call-template>
				  </xsl:otherwise>
				</xsl:choose>
			  </div>
			  <div class="styGenericDiv" style="width:1mm;"/>
			  <div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
			  <div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px;"/>
			</div>
			<!-- Schedule K, Line 2b -->
			<div style="width:187mm;height:4.5mm;">
			  <div class="styLNLeftNumBoxSD" style="height:4.5mm;padding-left:4mm;">b</div>
			  <div class="styLNDesc" style="width:28mm;height:4.5mm;">
			    Business activity <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
			  </div>
			  <div class="styIRS1120BBText" style="width:138.9mm;float:left;">
				<xsl:call-template name="PopulateText">
				  <xsl:with-param name="TargetNode" select="$Form1120ScheduleK/PrincipalBusinessActivityDesc"/>
				</xsl:call-template>
			  </div>
			  <div class="styGenericDiv" style="width:1mm;"/>
			  <div class="styShadingCell" style="width:6.1mm;height:4.5mm;"/>
			  <div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px;"/>
			</div>
			<!-- Schedule K, Line 2c -->
			<div style="width:187mm;height:4.5mm;">
			  <div class="styLNLeftNumBoxSD" style="height:4.5mm;padding-left:4mm;">c</div>
			  <div class="styLNDesc" style="width:29mm;height:4.5mm;">
			    Product or service <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
			  </div>
			  <div class="styIRS1120BBText" style="width:137.9mm;float:left;">
				<xsl:call-template name="PopulateText">
				  <xsl:with-param name="TargetNode" select="$Form1120ScheduleK/PrincipalProductDesc"/>
				</xsl:call-template>
			  </div>
			  <div class="styGenericDiv" style="width:1mm;"/>
			  <div class="styShadingCell" style="width:6.1mm;height:4.5mm;"/>
			  <div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px;"/>
			</div>
			<!-- Schedule K, Line 3 -->
			<div style="width:187mm;">
			  <div class="styLNLeftNumBoxSD" style="height:4.5mm;">3</div>
			  <div class="styLNDesc" style="width:167mm;height:4.5mm;padding-bottom:0px;padding-top:0px;">
				<span style="float:left;">
				  Is the corporation a subsidiary in an affiliated group or a parent-subsidiary controlled group?
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
					<xsl:with-param name="Desc">Schedule K Line 3 - Name control of the parent corporation</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/PrntCorporationNameControlTxt"/>
				  </xsl:call-template>
				</span>
				<!--Dotted Line-->
				<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
			  </div>
			  <div class="styGenericDiv">
				<div class="styIRS1120LNYesNoBox" style="height:4.5mm;padding-top:0mm;">
				  <span style="font-weight:normal;">
					<xsl:call-template name="PopulateYesBoxText">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleK/ControlledGroupMemberInd"/>
					</xsl:call-template>
				  </span>
				</div>
				<div class="styIRS1120LNYesNoBoxRB" style="height:4.5mm;padding-top:0mm;border-right-width:0px;">
				  <span style="font-weight:normal;">
					<xsl:call-template name="PopulateNoBoxText">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleK/ControlledGroupMemberInd"/>
					</xsl:call-template>
				  </span>
				</div>
			  </div>
			  <!-- Schedule K, Line 3 row 2 -->
			  <div style="width:187mm;">
				<div class="styLNLeftNumBoxSD" style="height:4.5mm;"/>
				<div class="styLNDesc" style="width:167mm;height:4.5mm;">
                  If "Yes," enter name and EIN of the parent corporation
                  <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
				  <span style="width:90mm;border-bottom:1px solid black;">
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleK/ParentCorporationName/BusinessNameLine1"/>
					</xsl:call-template>
				  </span>
				  <span style="width:165mm;border-bottom:1px solid black;">
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
						  <xsl:with-param name="TargetNode" select="$Form1120ScheduleK/MissingEINReasonCd"/>
						</xsl:call-template>
					  </xsl:otherwise>
					</xsl:choose>
				  </span>
				</div>
				<div class="styShadingCell" style="width:6mm;height:12mm;"/>
				<div class="styShadingCellRB" style="width:6mm;height:12mm;border-right-width:0px;"/>
			  </div>
			</div>
			<!-- Schedule K, Line 4 -->
			<div style="width:187mm;">
			  <div class="styLNLeftNumBoxSD">4</div>
			  <div class="styLNDesc" style="width:167mm;">At the end of the tax year: </div>
			  <div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
			  <div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px;"/>
			</div>
			<!-- Schedule K, Line 4a -->
			<div style="width:187mm;">
			  <div class="styLNLeftNumBoxSD" style="padding-left:4mm;">a</div>
			  <div class="styLNDesc" style="width:167mm;height:10.5mm; ">
			    Did any foreign or domestic corporation, partnership (including any entity treated as a partnership), trust, or tax-exempt 
			    organization own directly 20% or more, or own, directly or indirectly, 50% or more of the total voting power of all classes of 
                <span style="float:left;display:inline;">
                  the corporation’s stock entitled to vote? If "Yes," complete Part I of Schedule G (Form 1120) (attach Schedule G)
                  <!-- Form to Form Link -->
				  <xsl:call-template name="SetFormLinkInline">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/PrtshpCorpTrOwnPctVtngStkInd"/>
				  </xsl:call-template>
				</span>
				<!--Dotted Line-->
				<div class="styDotLn" style="float:right;padding-right:1mm;">..</div>
			  </div>
			  <div class="styGenericDiv">
				<div class="styShadingCell" style="width:6mm;height:6.5mm;"/>
				<div class="styShadingCellRB" style="width:6mm;height:6.5mm;border-right-width:0px;"/>
			  </div>
			  <div class="styGenericDiv">
				<div class="styIRS1120LNYesNoBox" style="height:4mm;">
				  <span style="font-weight:normal;display:inline">
					<xsl:call-template name="PopulateYesBoxText">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleK/PrtshpCorpTrOwnPctVtngStkInd"/>
					</xsl:call-template>
				  </span>
				</div>
				<div class="styIRS1120LNYesNoBoxRB" style="height:4mm;border-right-width:0px;">
				  <span style="font-weight:normal;display:inline">
					<xsl:call-template name="PopulateNoBoxText">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleK/PrtshpCorpTrOwnPctVtngStkInd"/>
					</xsl:call-template>
				  </span>
				</div>
			  </div>
			</div>
			<!-- Schedule K, Line 4b row 1 and 2-->
			<div style="width:187mm;">
			  <div class="styLNLeftNumBoxSD" style="height:4.5mm;padding-left:4mm;">b</div>
			  <div class="styLNDesc" style="width:167mm;height:4.5mm; ">
                Did any individual or estate own directly 20% or more, or own, directly or indirectly, 50% or more of the total voting power of all classes of the corporation’s stock entitled to vote? If "Yes," complete Part II of Schedule G (Form 1120) (attach Schedule 
              </div>
			  <div class="styGenericDiv">
				<div class="styShadingCell" style="width:6mm;height:7.5mm;"/>
				<div class="styShadingCellRB" style="width:6mm;height:7.5mm;border-right-width:0px;"/>
			  </div>
			</div>
			<!-- Schedule K, Line 4b row 3-->
			<div class="styTBB" style="width:187mm;">
			  <div class="styLNLeftNumBoxSD" style="height:4.5mm;padding-left:4mm;"/>
			  <div class="styLNDesc" style="width:167mm;height:4.5mm;padding-top:0px; ">
				<span style="float:left;">G)
                <!-- Form to Form Link -->
				  <xsl:call-template name="SetFormLinkInline">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/IndivEstTrOwnPctVtngStkInd"/>
				  </xsl:call-template>
				</span>
				<!--Dotted Line-->
				<span class="styDotLn" style="float:right;padding-right:1mm;padding-top:0px;">......................................</span>
			  </div>
			  <div class="styGenericDiv">
				<div class="styIRS1120LNYesNoBox" style="width:6mm;height:4.5mm;border-bottom-width:0px;padding-top:0px;">
				  <span style="font-weight:normal;">
					<xsl:call-template name="PopulateYesBoxText">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleK/IndivEstTrOwnPctVtngStkInd"/>
					</xsl:call-template>
				  </span>
				</div>
				<div class="styIRS1120LNYesNoBoxRB" style="width:6mm;height:4.5mm;border-right-width:0px;border-bottom-width:0px;padding-top:0px;">
				  <span style="font-weight:normal;">
					<xsl:call-template name="PopulateNoBoxText">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleK/IndivEstTrOwnPctVtngStkInd"/>
					</xsl:call-template>
				  </span>
				</div>
			  </div>
			</div>
			<!-- Page Break and Footer-->
			  <div class="pageEnd" style="width:187mm;padding-top:1mm;">
				<div style="float:right;">
				  <span style="width:80px;"/>  
                  Form <span class="styBoldText" style="font-size:8pt;">1120</span> (2013)
                </div>
			  </div>
			  <!-- END Page Break and Footer-->
			  <!--Begin Page 4 -->
			  <!-- Page Header -->
			  <div class="styBB" style="width:187mm;padding-top:.5mm;float:none;">
				<div style="float:left;">Form 1120 (2013)<span style="width:148mm;"/>
			  </div>
			  <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">4</span></div>
			  </div>
		      <!-- END Page Header -->
			<!--br style="page-break-after:always;"/-->
			<!-- BEGIN Schedule K Title -->
			  <div class="styBB" style="width:187mm;border-top-width:1px;">
				<div class="styPartName" style="height:4mm;width:23mm;">Schedule K</div>
				<div class="styPartDesc" style="height:4mm;width:164mm;"/>
			  </div>
			<!-- END Schedule K Title -->
			<!-- Schedule K, blank line before Line 5 --> <!--Update per WR51699 for R7_DD4 PDF draft dated 8/9/2011-->
			<div style="width:187mm;">
			  <div class="styLNLeftNumBoxSD" style="height:4.5mm;"/>
			  <div class="styLNDesc" style="width:167mm;height:4.5mm;"/>
			  <div class="styIRS1120LNYesNoBox" style="width:6mm;height:4.5mm;border-bottom-width:1px;">Yes</div>
			  <div class="styIRS1120LNYesNoBox" style="width:6mm;height:4.5mm;border-right-width:0px;">No</div>
			</div>
			<!-- Schedule K, Line 5 -->
			<div style="width:187mm;">
			  <div class="styLNLeftNumBoxSD" style="height:4.5mm;">5</div>
			  <div class="styLNDesc" style="width:167mm;height:4.5mm;">At the end of the tax year, did the corporation: </div>
			  <div class="styShadingCell" style="width:6mm;height:4.5mm;border-bottom-width:1px;"/>
				<div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px;border-bottom-width:1px;"/>
			</div>
			<!-- Schedule K, Line 5a row 1 and 2-->
			<div style="width:187mm;height:4.5mm;">
			  <div class="styLNLeftNumBoxSD" style="height:4.5mm;padding-left:4mm;">a</div>
			  <div class="styLNDesc" style="width:167mm;height:4.5mm; ">
                Own directly 20% or more, or own, directly or indirectly, 50% or more of the total voting power of all classes of stock entitled to vote of any foreign or domestic corporation not included on <b>Form 851,</b> Affiliations Schedule? For rules of constructive 
              </div>
			  <div class="styGenericDiv">
				<div class="styIRS1120LNYesNoBox" style="height:7.5mm;padding-top:2.5mm;border-bottom-width:0px;">
				  <span style="font-weight:normal;">
					<!--<xsl:call-template name="PopulateYesBoxText">
                      <xsl:with-param name="TargetNode" select="$Form1120ScheduleK/CorpOwnPercentVotingStock"/>
                    </xsl:call-template>-->
				  </span>
				</div>
				<div class="styIRS1120LNYesNoBoxRB" style="height:7.5mm;padding-top:2.5mm;border-right-width:0px;border-bottom-width:0px;">
				  <span style="font-weight:normal;">
					<!-- <xsl:call-template name="PopulateNoBoxText">
                      <xsl:with-param name="TargetNode" select="$Form1120ScheduleK/CorpOwnPercentVotingStock"/>
                    </xsl:call-template>-->
				  </span>
				  </div>
				</div>
			  </div>
			  <!-- Schedule K, Line 5a row 3-->
			  
			  <div style="width:187mm;">
				<div class="styLNLeftNumBoxSD" style="height:4.5mm;padding-left:4mm;padding-top:0px;"/>
				<div class="styLNDesc" style="width:167mm;height:4.5mm;padding-top:2mm; ">
				  <span style="float:left;">ownership, see instructions </span>
				  <!--Dotted Line-->
				  <span class="styDotLn" style="float:right;padding-right:1mm;padding-top:0px;">................................</span>
				  <!--<div style="width:167mm;padding-top:1mm;">If "Yes," complete (i) through (iv) below.</div>-->
				</div>
				<div class="styGenericDiv">
				  <div class="styIRS1120LNYesNoBox" style="border-bottom-width:1px;padding-top:0px;">
					<span style="font-weight:normal;">
					  <xsl:call-template name="PopulateYesBoxText">
						<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/CorporationOwnedPctVtngStkInd"/>
					  </xsl:call-template>
					</span>
				  </div>
				  <div class="styIRS1120LNYesNoBoxRB" style="border-right-width:0px;border-bottom-width:1px;padding-top:0px;">
					<span style="font-weight:normal;">
					  <xsl:call-template name="PopulateNoBoxText">
						<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/CorporationOwnedPctVtngStkInd"/>
					  </xsl:call-template>
					</span>
				  </div>
				  <!--<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
				  <div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px;"/>-->
				</div>
			  </div>
			<div style="width:187mm;height:4.5mm;">
			  <div class="styLNLeftNumBoxSD" style="height:4.5mm;"></div>
			  <div class="styLNDesc" style="width:167mm;height:4.5mm;">If "Yes," complete (i) through (iv) below. </div>
			  <div class="styShadingCell" style="width:6mm;height:4.5mm;border-bottom-width:1px;"/>
				<div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px;border-bottom-width:1px;"/>	
			</div>
			  <!-- BEGIN Schedule K, Line 5a Table -->
			  <!-- BEGIN Schedule K, Line 5a Title -->
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
			  <!-- END Schedule K Title -->
			  <!-- BEGIN Schedule K Table -->
			  <div class="styTableContainer" id="OFCctn3">
				<!-- print logic -->
				<xsl:call-template name="SetInitialState"/>
				<!-- end -->
				<table class="styTable" cellspacing="0" style="font-size:7pt;">
				  <thead class="styTableThead">
					<tr>
					  <th class="styTableCellHeader" scope="col" rowspan="2" style="width:95mm;font-weight:normal;">
						<span style="font-weight:bold;">(i)</span> Name of Corporation
					  </th>
					  <th class="styTableCellHeader" scope="col" rowspan="2" style="width:35mm;font-weight:normal;">
						<span style="font-weight:bold;">(ii)</span> Employer Identification Number  (if any)
					  </th>
					  <th class="styTableCellHeader" scope="col" rowspan="2" style="width:20mm;font-weight:normal;">
						<span style="font-weight:bold;">(iii)</span> Country of Incorporation
                      </th>
					  <th class="styTableCellHeader" scope="col" rowspan="2" style="width:36mm;font-weight:normal;border-right:0;">
						<span style="font-weight:bold;">(iv)</span> Percentage Owned in Voting Stock
					  </th>
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
							<xsl:if test="CorporationEIN !=' '">
							  <xsl:call-template name="PopulateEIN">
								<xsl:with-param name="TargetNode" select="CorporationEIN"/>
							  </xsl:call-template>
							  <span style="width:1px;"/>
							</xsl:if>
							<xsl:if test="MissingEINReasonCd !=' '">
							  <xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
							  </xsl:call-template>
							  <span style="width:1px;"/>
							</xsl:if>
						  </td>
						  <td class="styTableCell" style="width:20mm;text-align:center;">
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="IncorporationCountryCd"/>
							</xsl:call-template>
							<span class="styTableCellPad"/>
						  </td>
						  <td class="styTableCell" style="width:36mm;border-right:0;">
							<xsl:call-template name="PopulatePercent">
							  <xsl:with-param name="TargetNode" select="VotingStockOwnedPct"/>
							</xsl:call-template>
							<span class="styTableCellPad"/>
						  </td>
						</tr>
					  </xsl:for-each>
					</xsl:if>
					<!-- Build blank row 1 data for Schedule K line 5a table -->
					<xsl:if test="count($Form1120ScheduleK/CorpOwnPercentVotingStockInfo)&lt; 1 or ((count($Form1120ScheduleK/CorpOwnPercentVotingStockInfo) &gt; 5) and ($Print = $Separated))">
					  <tr>
						<td class="styTableCell" style="width:95mm;text-align:left;">
						  <span class="styBoldText"/>
						  <xsl:call-template name="PopulateAdditionalDataTableMessage">
							<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/CorpOwnPercentVotingStockInfo"/>
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
					<!-- Build blank row 2 data for Schedule K line 5a table -->
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
					<!-- Build blank row 3 data for Schedule K line 5a table -->
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
					<!-- Build blank row 4 data for Schedule K line 5a table -->
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
					<!-- Build blank row 5 data for Schedule K line 5a table -->
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
			  <!-- END Schedule K Line 5a table -->
			  <!--Update per WR51699 for R7_DD4 PDF draft dated 8/9/2011-->
			  <!-- Schedule K, Line 5b Yes and No 
              <div style="width:187mm;">
                <div class="styLNLeftNumBoxSD" style="height:4.5mm;"></div>
                <div class="styLNDesc" style="width:167mm;height:4.5mm;"></div>
                <div class="styIRS1120LNYesNoBox" style="width:6mm;height:4.5mm;">Yes</div>
                <div class="styIRS1120LNYesNoBox" style="width:6mm;height:4.5mm;border-right-width:0px;">No</div>
              </div>-->
			  <!-- Schedule K, Line 5b -->
			  <div style="width:187mm;">
				<div class="styLNLeftNumBoxSD" style="height:4.5mm;padding-left:4mm;">b</div>
				<div class="styLNDesc" style="width:167mm;height:4.5mm; ">
                  Own directly an interest of 20% or more, or own, directly or indirectly, an interest of 50% or more in any foreign or domestic partnership
                  (including an entity treated as a partnership) or in the beneficial interest of a trust? For rules of constructive 
                  <span style="float:left;">ownership, see instructions. </span>
				  <!--Dotted Line-->
				  <span class="styDotLn" style="float:right;padding-right:1mm;">................................</span>
				  <!--<div style="width:167mm;padding-top:1mm;">If "Yes," complete (i) through (iv). </div>-->
				</div>
				<div class="styGenericDiv">
				  <div class="styIRS1120LNYesNoBox" style="height:10.5mm;padding-top:7mm;border-bottom-width:1px;">
					<span style="font-weight:normal;">
					  <xsl:call-template name="PopulateYesBoxText">
						<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/CorporationOwnPctPrtshpInd"/>
					  </xsl:call-template>
					</span>
				  </div>
				  <div class="styIRS1120LNYesNoBoxRB" style="height:10.5mm;padding-top:7mm;border-right-width:0px;border-bottom-width:1px;">
					<span style="font-weight:normal;">
					  <xsl:call-template name="PopulateNoBoxText">
						<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/CorporationOwnPctPrtshpInd"/>
					  </xsl:call-template>
					</span>
				  </div>
				  <!--<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
				  <div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px;"/>-->
				</div>
			  </div>
			<div style="width:187mm;height:4.5mm;">
			  <div class="styLNLeftNumBoxSD" style="height:4.5mm;"></div>
			  <div class="styLNDesc" style="width:167mm;height:4.5mm;">If "Yes," complete (i) through (iv) below. </div>
			  <div class="styShadingCell" style="width:6mm;height:4.5mm;border-bottom-width:1px;"/>
				<div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px;border-bottom-width:1px;"/>	
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
			  <!-- END Schedule K Title -->
			  <!-- BEGIN Schedule K Table -->
			  <div class="styTableContainer" id="OFCctn4">
				<!-- print logic -->
				<xsl:call-template name="SetInitialState"/>
				<!-- end -->
				<table class="styTable" cellspacing="0" style="font-size:7pt;">
				  <thead class="styTableThead">
					<tr>
					  <th class="styTableCellHeader" scope="col" rowspan="2" style="width:95mm;font-weight:normal;">
						<span style="font-weight:bold;">(i)</span> Name of Entity
					  </th>
					  <th class="styTableCellHeader" scope="col" rowspan="2" style="width:35mm;font-weight:normal;">
						<span style="font-weight:bold;">(ii)</span> Employer Identification Number (if any)
					  </th>
					  <th class="styTableCellHeader" scope="col" rowspan="2" style="width:20mm;font-weight:normal;">
						<span style="font-weight:bold;">(iii)</span> Country of Organization
					  </th>
					  <th class="styTableCellHeader" scope="col" rowspan="2" style="width:36mm;font-weight:normal;border-right:0;">
						<span style="font-weight:bold;">(iv)</span> Maximum Percentage Owned in Profit, Loss or Capital
					  </th>
					</tr>
				  </thead>
				  <tfoot/>
				  <tbody>
					<xsl:if test="($Print != $Separated) or (count($Form1120ScheduleK/CorpOwnPercentPartnershipInfo) &lt;= 5) ">
					  <xsl:for-each select="$Form1120ScheduleK/CorpOwnPercentPartnershipInfo">
						<tr>
						  <td class="styTableCellText" style="width:95mm;padding-left:2.5mm;">
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="EntityName/BusinessNameLine1"/>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="EntityName/BusinessNameLine2"/>
							</xsl:call-template>
							<span class="styTableCellPad"/>
						  </td>
						  <td class="styTableCellCtr" style="width:35mm;">
							<xsl:if test="EIN !=' '">
							  <xsl:call-template name="PopulateEIN">
								<xsl:with-param name="TargetNode" select="EIN"/>
							  </xsl:call-template>
							  <span style="width:1px;"/>
							</xsl:if>
							<xsl:if test="MissingEINReasonCd !=' '">
							  <xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
							  </xsl:call-template>
							  <span style="width:1px;"/>
							</xsl:if>
						  </td>
						  <td class="styTableCell" style="width:20mm;text-align:center;">
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="OrganizationCountryCd"/>
							</xsl:call-template>
							<span class="styTableCellPad"/>
						  </td>
						  <td class="styTableCell" style="width:36mm;border-right:0;">
							<xsl:call-template name="PopulatePercent">
							  <xsl:with-param name="TargetNode" select="OwnedProfitLossCapMaximumPct"/>
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
							  <xsl:with-param name="TargetNode" select="$Form1120ScheduleK/CorpOwnPercentPartnershipInfo"/>
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
				<!-- END Schedule K line 5b Table -->
				<!-- Schedule K, Line 6 row 1 and 2--> <!--Update per WR51699 for R7_DD4 PDF draft dated 8/9/2011-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBoxSD" style="height:4.5mm;">6</div>
				  <div class="styLNDesc" style="width:167mm;height:4.5mm; ">
                    During this tax year, did the corporation pay dividends (other than stock dividends and distributions in exchange for stock) in 
                    <span style="float:left;">excess of the corporation’s current and accumulated earnings and profits? (See sections 301 and 316.) 
                      <xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/ExcessDividendsPaidInd"/>
					  </xsl:call-template>
					</span>
					<!--Dotted Line-->
					<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
				  </div>
				  <div class="styGenericDiv">
				    <!--Update per WR51699 for R7_DD4 PDF draft dated 8/9/2011-->
				    <!--<div class="styIRS1120LNYesNoBox" style="width:6mm;height:4mm;">Yes</div>
					<div class="styIRS1120LNYesNoBox" style="width:6mm;height:4mm;border-right-width:0px;">No</div>-->
					<div class="styIRS1120LNYesNoBox" style="height:8mm;border-bottom-width:1px;">
					  <span style="font-weight:normal;">
						<xsl:call-template name="PopulateYesBoxText">
						  <xsl:with-param name="TargetNode" select="$Form1120ScheduleK/ExcessDividendsPaidInd"/>
						</xsl:call-template>
					  </span>
					</div>
					<div class="styIRS1120LNYesNoBoxRB" style="height:8mm;border-right-width:0px;border-bottom-width:1px;">
					  <span style="font-weight:normal;">
						<xsl:call-template name="PopulateNoBoxText">
						  <xsl:with-param name="TargetNode" select="$Form1120ScheduleK/ExcessDividendsPaidInd"/>
						</xsl:call-template>
					  </span>
					</div>
				  </div>
				</div>
				<!-- Schedule K, Line 6 row 3 and 4-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBoxSD" style="height:4.5mm;"/>
				  <div class="styLNDesc" style="width:167mm;height:4.5mm; ">
                    If "Yes," file <b>Form 5452,</b> Corporate Report of Nondividend Distributions.
                  </div>
				  <div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
				  <div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px;"/>
				  <div class="styLNDesc" style="width:175mm;height:4.5mm;padding-left:8mm;">
                    If this is a consolidated return, answer here for the parent corporation and on Form 851 for each subsidiary.
                  </div>
				  <div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
				  <div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px;"/>
				</div>
				<!-- Schedule K, Line 7 row 1 and 2-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBoxSD">7</div>
				  <div class="styLNDesc" style="width:167mm; ">
                    At any time during the tax year, did one foreign person own, directly or indirectly, at least 25% of <b>(a)</b> the total voting power of
                    <span style="float:left;">all classes of the corporation’s stock entitled to vote or <b>(b)</b> 
                      the total value of all classes of the corporation’s stock? 
                    </span>
					<!--Dotted Line-->
					<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
				  </div>
				  <div class="styGenericDiv">
					<div class="styIRS1120LNYesNoBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px;">
					  <span style="font-weight:normal;">
						<xsl:call-template name="PopulateYesBoxText">
						  <xsl:with-param name="TargetNode" select="$Form1120ScheduleK/FrgnOwn25PctTotVotingPowerInd"/>
						</xsl:call-template>
					  </span>
					</div>
					<div class="styIRS1120LNYesNoBoxRB" style="height:8mm;padding-top:4mm;border-right-width:0px;border-bottom-width:1px;">
					  <span style="font-weight:normal;">
						<xsl:call-template name="PopulateNoBoxText">
						  <xsl:with-param name="TargetNode" select="$Form1120ScheduleK/FrgnOwn25PctTotVotingPowerInd"/>
						</xsl:call-template>
					  </span>
					</div>
				  </div>
				</div>
				<!-- Schedule K, Line 7 row 3-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBoxSD" style="font-weight:bold"/>
				  <div class="styLNDesc" style="width:167mm; ">
                    For rules of attribution, see section 318. If "Yes," enter:
                  </div>
				  <div class="styGenericDiv">
					<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
					<div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px;"/>
				  </div>
				</div>
				<!-- Schedule K, Line 7(i) and (ii)-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBoxSD" style="font-weight:bold"/>
				  <div class="styLNDesc" style="width:167mm;">
					<b>(i)</b>
					<span style="width:1mm;"/>
			        Percentage owned
                    <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
					<span style="width:3px;"/>
					<span style="border-bottom:1px solid black;width:46mm;text-align:right;">
					  <xsl:call-template name="PopulatePercent">
						<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/VotingStockForeignOwnedPct"/>
					  </xsl:call-template>
					</span>
					<span style="width:1mm;"/>
                    and 
                    <span style="font-weight:bold"> (ii) </span>
					<span style="width:1mm;"/>
                    Owner’s country:
                    <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
					<span style="width:3px;"/>
					<span style="border-bottom:1px solid black;width:42mm;text-align:left;">
					  <xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/ForeignOwnStockCountryCd"/>
					  </xsl:call-template>
					</span>
				  </div>
				  <div class="styGenericDiv">
					<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
					<div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px;"/>
				  </div>
				</div>
				<!-- Schedule K, Line 7(c)-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBoxSD" style="font-weight:bold"/>
				  <div class="styLNDesc" style="width:167mm; ">
					<b>(c)</b>
					<span style="width:2mm;"/>
                    The corporation may have to file <b>Form 5472</b>, Information Return of a 25% Foreign-Owned U.S. Corporation or a Foreign Corporation Engaged in a U.S. Trade or Business. Enter the number of Forms 5472 attached
                    <xsl:call-template name="SetFormLinkInline">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleK/TotalForm5472FiledCnt"/>
					</xsl:call-template>
					<span style="width:1mm;"/>
					<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
					<span style="width:3px;"/>
					<span style="width:34mm;border-bottom:1px solid black;text-align:right;">
					  <xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/TotalForm5472FiledCnt"/>
					  </xsl:call-template>
					</span>
				  </div>
				  <div class="styGenericDiv">
					<div class="styShadingCell" style="width:6mm;height:8.5mm;"/>
					<div class="styShadingCellRB" style="width:6mm;height:8.5mm;border-right-width:0px;"/>
				  </div>
				</div>
				<!-- Schedule K, Line 8-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBoxSD">8</div>
				  <div class="styLNDesc" style="width:167mm; ">
					<span style="float:left;">Check this box if the corporation issued publicly offered debt instruments with original issue discount </span>
					<!--Dotted Line-->
					<span class="styDotLn" style="padding-right:1mm;">......</span>
					<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
					<span style="width:3mm;"/>
					<input type="checkbox" alt="alt" class="styCkbox">
					  <xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/OfferedDebtInstrumentsInd"/>
						<xsl:with-param name="BackupName">IRS1120ScheduleKOfferedDebtInstruments</xsl:with-param>
					  </xsl:call-template>
					</input>
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/OfferedDebtInstrumentsInd"/>
							<xsl:with-param name="BackupName">IRS1120ScheduleKOfferedDebtInstruments</xsl:with-param>
						</xsl:call-template>
     			</label>
				  </div>
				  <div class="styGenericDiv">
					<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
					<div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px;"/>
				  </div>
				</div>
				<!-- Schedule K, Line 8 row 2 and 3-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBoxSD"/>
				  <div class="styLNDesc" style="width:167mm;">
                    If checked, the corporation may have to file <b>Form 8281</b>, Information Return for Publicly Offered Original Issue Discount Instruments.
                  </div>
				  <div class="styGenericDiv">
					<div class="styShadingCell" style="width:6mm;height:7.5mm;"/>
					<div class="styShadingCellRB" style="width:6mm;height:7.5mm;border-right-width:0px;"/>
				  </div>
				</div>
				<!-- Schedule K, Line 9-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBoxSD">9</div>
				  <div class="styLNDesc" style="width:167mm; ">
                    Enter the amount of tax-exempt interest received or accrued during the tax year
			        <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
					<span style="width:3px;">$</span>
					<span style="border-bottom:1px solid black;width:46mm;text-align:right;">
					  <xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/TaxExemptInterestAmt"/>
					  </xsl:call-template>
					</span>
				  </div>
				  <div class="styGenericDiv">
					<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
					<div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px;"/>
				  </div>
				</div>
				<!-- Schedule K, Line 10-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBox">10</div>
				  <div class="styLNDesc" style="width:167mm; ">
                    Enter the number of shareholders at the end of the tax year (if 100 or fewer)
			        <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
					<span style="width:3px;"/>
					<span style="border-bottom:1px solid black;width:46mm;text-align:right;">
					  <xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/ShareholderCnt"/>
					  </xsl:call-template>
					</span>
				  </div>
				  <div class="styGenericDiv">
					<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
					<div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px;"/>
				  </div>
				</div>
				<!-- Schedule K, Line 11 row 1-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBox">11</div>
				  <div class="styLNDesc" style="width:167mm;">
					<span style="float:left;">If the corporation has an NOL for the tax year and is electing to forego the carryback period, check here
                      <xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/NOLForegoCarrybackInd"/>
					  </xsl:call-template>
					</span>
					<!--Dotted Line-->
					<span class="styDotLn" style="padding-right:1mm;">....</span>
					<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
					<span style="width:3mm;"/>
					<input type="checkbox" alt="alt" class="styCkbox">
					  <xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/NOLForegoCarrybackInd"/>
						<xsl:with-param name="BackupName">IRS1120ScheduleKNOLForegoCarryback</xsl:with-param>
					  </xsl:call-template>
					</input>
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/NOLForegoCarrybackInd"/>
							<xsl:with-param name="BackupName">IRS1120ScheduleKNOLForegoCarryback</xsl:with-param>
						</xsl:call-template>
     			</label>
				  </div>
				  <div class="styGenericDiv">
				    <div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
					<div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px;"/>
				  </div>
				</div>
				<!-- Schedule K, Line 11 row 2 and 3-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBox"/>
				  <div class="styLNDesc" style="width:167mm; ">
                    If the corporation is filing a consolidated return, the statement required by Regulations section 1.1502-21(b)(3) 
                    must be attached or the election will not be valid.
                  </div>
				  <div class="styGenericDiv">
					<div class="styShadingCell" style="width:6mm;height:8.5mm;"/>
					<div class="styShadingCellRB" style="width:6mm;height:8.5mm;border-right-width:0px;"/>
				  </div>
				</div>
				<!-- Schedule K, Line 12-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBox">12</div>
				  <div class="styLNDesc" style="width:167mm;">
                    Enter the available NOL carryover from prior tax years (do not reduce it by any deduction on line 29a.)
			        <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
					<span style="width:3px;">$</span>
					<span style="border-bottom:1px solid black;width:26mm;text-align:right;font-size:6.3pt;">
					  <xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/NOLCarryoverFromPriorYearAmt"/>
					  </xsl:call-template>
					</span>
				  </div>
				  <div class="styGenericDiv">
					<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
					<div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px;"/>
				  </div>
				</div>
				<!-- Schedule K, Line 13-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBox">13</div>
				  <div class="styLNDesc" style="width:167mm;">
			        Are the corporation’s total receipts (page 1, line 1 a, plus lines 4 through 10) for the tax year <b>and</b> its total assets at the end 
			        <span style="float:left;">of the tax year less than $250,000? </span>
					<!--Dotted Line-->
					<span class="styDotLn" style="float:right;padding-right:1mm;">.............................</span>
					<!--<div style="width:167mm;padding-top:1mm;">
                      If "Yes," the corporation is not required to complete Schedules L, M-1, and M-2 on page 5. Instead, enter the 
                      total amount of cash distributions and the book value of property distributions (other than cash) made during the 
                      tax year.
                      <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
					  <span style="width:3px;">$</span>
					  <span style="border-bottom:1px solid black;width:22mm;text-align:right;font-size:6pt;">
						<xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="$Form1120ScheduleK/TotalCashDistribtionsAmt"/>
						</xsl:call-template>
					  </span>
					</div>-->
				  </div>
				  <div class="styGenericDiv">
				    <div class="styIRS1120LNYesNoBox" style="height:7.5mm;padding-top:4mm;border-bottom-width:1px;">
					  <span style="font-weight:normal;">
						<xsl:call-template name="PopulateYesBoxText">
						  <xsl:with-param name="TargetNode" select="$Form1120ScheduleK/TotalRcptsAssetsLessThanLmtInd"/>
						</xsl:call-template>
					  </span>
					</div>
					<div class="styIRS1120LNYesNoBoxRB" style="height:7.5mm;padding-top:4mm;border-right-width:0px;border-bottom-width:1px;">
					  <span style="font-weight:normal;">
						<xsl:call-template name="PopulateNoBoxText">
						  <xsl:with-param name="TargetNode" select="$Form1120ScheduleK/TotalRcptsAssetsLessThanLmtInd"/>
						</xsl:call-template>
					  </span>
					</div>
					<!--<div class="styShadingCell" style="width:6mm;height:7.5mm;"/>
					<div class="styShadingCellRB" style="width:6mm;height:7.5mm;border-right-width:0px;"/>-->
				  </div>
				</div>
				<!-- Schedule K, Line 13 row 3 and 4-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBox"/>
				  <div class="styLNDesc" style="width:167mm; ">
                      If "Yes," the corporation is not required to complete Schedules L, M-1, and M-2 on page 5. Instead, enter the 
                      total amount of cash distributions and the book value of property distributions (other than cash) made during the 
                      tax year.
                      <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
					  <span style="width:3px;">$</span>
					  <span style="border-bottom:1px solid black;width:22mm;text-align:right;font-size:6pt;">
						<xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="$Form1120ScheduleK/TotalCashDistribtionsAmt"/>
						</xsl:call-template>
					  </span>
                  		</div>
				  <div class="styGenericDiv">
					<div class="styShadingCell" style="width:6mm;height:8.5mm;"/>
					<div class="styShadingCellRB" style="width:6mm;height:8.5mm;border-right-width:0px;"/>
				  </div>
				</div>
				<!-- Schedule K, Line 14 L1-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBox">14</div>
				  <div class="styLNDesc" style="width:167mm;">
					<span style="float:left;">Is the corporation required to file Schedule UTP (Form 1120), Uncertain Tax Position Statement (see instructions)? </span>
					<!--Dotted Line-->
					<div class="styDotLn" style="float:right;padding-right:1mm;">...</div>
				  </div>
				  <div class="styGenericDiv">
				 	<div class="styIRS1120LNYesNoBox" style="border-bottom-width:1px;">
					  <span style="font-weight:normal;">
						<xsl:call-template name="PopulateYesBoxText">
						  <xsl:with-param name="TargetNode" select="$Form1120ScheduleK/UncertainTaxPositionStmtInd"/>
						</xsl:call-template>
					  </span>
					</div>
					<div class="styIRS1120LNYesNoBoxRB" style="border-right-width:0px;border-bottom-width:1px;">
					  <span style="font-weight:normal;">
						<xsl:call-template name="PopulateNoBoxText">
						  <xsl:with-param name="TargetNode" select="$Form1120ScheduleK/UncertainTaxPositionStmtInd"/>
						</xsl:call-template>
					  </span>
					</div>
				  </div>
				</div>
				<!-- Schedule K, Line 14 L2-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBox"/>					
					<div class="styLNDesc" style="width:167mm;">
            <span style="float:left;clear:none;">If "yes," complete and attach Schedule UTP.
             <!-- <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/UncertainTaxPositionStatement"/>
					    </xsl:call-template>-->
					  </span> 
				    </div>
				  <div class="styGenericDiv">
						<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
						<div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px;"/>
				  </div>
				</div>
				<!-- Schedule K, Line 15a-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBox">15a</div>
				  <div class="styLNDesc" style="width:167mm;">
					<span style="float:left;">Did the corporation make any payments in 2013 that would require it to file Form(s) 1099? </span>
					<!--Dotted Line-->
					<div class="styDotLn" style="float:right;padding-right:1mm;">............</div>
				  </div>
				  <div class="styGenericDiv">
					<div class="styIRS1120LNYesNoBox" style="border-bottom-width:1px;">
					  <span style="font-weight:normal;">
						<xsl:call-template name="PopulateYesBoxText">
						  <xsl:with-param name="TargetNode" select="$Form1120ScheduleK/RequiredToFileForms1099Ind"/>
						</xsl:call-template>
					  </span>
					</div>
					<div class="styIRS1120LNYesNoBoxRB" style="border-right-width:0px;border-bottom-width:1px;">
					  <span style="font-weight:normal;">
						<xsl:call-template name="PopulateNoBoxText">
						  <xsl:with-param name="TargetNode" select="$Form1120ScheduleK/RequiredToFileForms1099Ind"/>
						</xsl:call-template>
					  </span>
					</div>
				  </div>
				</div>
				<!-- Schedule K, Line 15b--> <!--Update per WR51699 for R7_DD4 PDF draft dated 8/9/2011-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
				  <div class="styLNDesc" style="width:167mm;">
					<span style="float:left;">If "Yes," did or will the corporation file required Form(s) 1099? </span>
					<!--Dotted Line-->
					<div class="styDotLn" style="float:right;padding-right:1mm;">....................</div>
				  </div>
				  <div class="styGenericDiv">
					<div class="styIRS1120LNYesNoBox" style="border-bottom-width:1px;">
					  <span style="font-weight:normal;">
						<xsl:call-template name="PopulateYesBoxText">
						  <xsl:with-param name="TargetNode" select="$Form1120ScheduleK/RequiredForms1099FiledInd"/>
						</xsl:call-template>
					  </span>
					</div>
					<div class="styIRS1120LNYesNoBoxRB" style="border-right-width:0px;border-bottom-width:1px;">
					  <span style="font-weight:normal;">
						<xsl:call-template name="PopulateNoBoxText">
						  <xsl:with-param name="TargetNode" select="$Form1120ScheduleK/RequiredForms1099FiledInd"/>
						</xsl:call-template>
					  </span>
					</div>
				  </div>
				</div>
				<!-- Schedule K, Line 16 L1-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBox">16</div>					
					<div class="styLNDesc" style="width:167mm;">
						During this tax year, did the corporation have an 80% or more change in ownership, including a change due to redemption of 
				  </div>
				  <div class="styGenericDiv">
						<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
						<div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px;"/>
				  </div>
				</div>
				<!-- Schedule K, Line 16 L2--> <!--Update per WR-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBox"/>
				  <div class="styLNDesc" style="width:167mm;">				     
						<span style="float:left;">its own stock? </span>
						<!--Dotted Line-->
						<div class="styDotLn" style="float:right;padding-right:1mm;">....................................</div>
				  </div>
				  <!--EXCEPTION: Browser limitation when 5a and 5b contain 5+ repeating data line 16 is displaying properly 
																	 but print out/print preview line 16 will split and Yes and No box will display 1mm of line gap --> 
				  <div class="styGenericDiv">
						<div class="styIRS1120LNYesNoBox" style="border-bottom-width:1px;">
							<span style="font-weight:normal;">
								<xsl:call-template name="PopulateYesBoxText">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/OwnershipChg80PctOrMoreInd"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styIRS1120LNYesNoBoxRB" style="border-right-width:0px;border-bottom-width:1px;">
							<span style="font-weight:normal;">
								<xsl:call-template name="PopulateNoBoxText">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/OwnershipChg80PctOrMoreInd"/>
								</xsl:call-template>
							</span>
						</div>
				  </div>
				</div>
				<!-- Schedule K, Line 17 L1-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBox">17</div>					
					<div class="styLNDesc" style="width:167mm;">
						During or subsequent to this tax year, but before the filing of this return, did the corporation dispose of more than 65% (by 
				  </div>
				  <div class="styGenericDiv">
						<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
						<div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px;"/>
				  </div>
				</div>
				<!-- Schedule K, Line 17 L2--> <!--Update per WR-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBox"/>
				  <div class="styLNDesc" style="width:167mm;">				    
				    <span style="float:left;">value) of its assets in a taxable, non-taxable, or tax deferred transaction? </span>
						<!--Dotted Line-->
						<div class="styDotLn" style="float:right;padding-right:1mm;">.................</div>
				  </div>
				  <div class="styGenericDiv">
						<div class="styIRS1120LNYesNoBox" style="border-bottom-width:1px;">
							<span style="font-weight:normal;">
								<xsl:call-template name="PopulateYesBoxText">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/DisposOver65PctAstTxblTransInd"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styIRS1120LNYesNoBoxRB" style="border-right-width:0px;border-bottom-width:1px;">
							<span style="font-weight:normal;">
								<xsl:call-template name="PopulateNoBoxText">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/DisposOver65PctAstTxblTransInd"/>
								</xsl:call-template>
							</span>
						</div>
				  </div>
				</div>
				<!-- Schedule K, Line 18 L1-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBox">18</div>					
					<div class="styLNDesc" style="width:167mm;">
						Did the corporation receive assets in a section 351 transfer in which any of the transferred assets had a fair market basis or 
				  </div>
				  <div class="styGenericDiv">
						<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
						<div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px;"/>
				  </div>
				</div>
				<!-- Schedule K, Line 18 L2--> <!--Update per WR-->
				<div class="styTBB" style="width:187mm;">
				  <div class="styLNLeftNumBox"/>
				  <div class="styLNDesc" style="width:167mm;">				    
				    <span style="float:left;">fair market value of more than $1 million? </span>
						<!--Dotted Line-->
						<div class="styDotLn" style="float:right;padding-right:1mm;">...........................</div>
				  </div>
				  <div class="styGenericDiv">
						<div class="styIRS1120LNYesNoBox" style="border-bottom-width:0px;">
							<span style="font-weight:normal;">
								<xsl:call-template name="PopulateYesBoxText">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/Sect351TrnsfrFMVFMBOverLmtInd"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styIRS1120LNYesNoBoxRB" style="border-right-width:0px;border-bottom-width:0px;">
							<span style="font-weight:normal;">
								<xsl:call-template name="PopulateNoBoxText">
									<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/Sect351TrnsfrFMVFMBOverLmtInd"/>
								</xsl:call-template>
							</span>
						</div>
				  </div>
				</div>
				<!-- END Schedule K Line Items -->
				<!-- Page Break and Footer-->
				<div class="pageEnd" style="width:187mm;">
				  <div style="float:right;">
					<span style="width:80px;"/>  
			        Form <span class="styBoldText" style="font-size:8pt;">1120</span> (2013)
			      </div>
				</div>
				<!-- END Page Break and Footer-->
				<!--Begin Page 5 -->
				<!-- Page Header -->
				<div class="styBB" style="width:187mm;padding-top:.5mm;float:none;">
				  <div style="float:left;">Form 1120 (2013)<span style="width:148mm;"/>
				</div>
				<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">5</span></div>
			  </div>
			  <!-- END Page Header -->
			  <!-- BEGIN Schedule L Title -->
			  <div class="styBB" style="width:187mm;border-top-width:1px;">
				<div class="styPartName" style="width:21mm;height:4mm;">Schedule L</div>
				<div class="styPartDesc" style="width:37mm;">Balance Sheets per Books</div>
				<div class="styLNAmountBox" style="width:64mm;height:8mm;text-align:center;border-bottom-width:0px;">Beginning of tax year</div>
				<div class="styLNAmountBox" style="width:64mm;height:8mm;text-align:center;border-bottom-width:0px;">End of tax year</div>
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
				<!-- Schedule L, line 1-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBoxSD" style="height:4.5mm;">1</div>
				  <div class="styLNDesc" style="width:50mm;height:4.5mm;">
					<span style="float:left;">Cash </span>
					<!--Dotted Line-->
					<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
				  </div>
				  <div class="styShadingCell" style="height:5mm;"/>
				  <div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/CashBOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styShadingCell" style="height:5mm;"/>
				  <div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/CashEOYAmt"/>
					</xsl:call-template>
				  </div>
				</div>
				<!-- Schedule L, line 2a-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBoxSD" style="height:5mm;">2a</div>
				  <div class="styLNDesc" style="width:50mm;height:5mm;">Trade notes and accounts receivable</div>
				  <div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/TradeNotesAccountsRcvblBOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styShadingCell" style="height:5mm;"/>
				  <div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/TradeNotesAccountsRcvblEOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styShadingCell" style="height:5mm;"/>
				</div>
				<!-- Schedule L, line 2b-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBoxSD" style="height:4.5mm;padding-left:4mm;">b</div>
				  <div class="styLNDesc" style="width:50mm;height:4.5mm;">
					<span style="float:left;">Less allowance for bad debts </span>
					<!--Dotted Line-->
					<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
				  </div>
				  <div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
					<xsl:call-template name="PopulateNegativeNumber">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/BadDebtAllowanceBOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/NetTradeNotesAcctRcvblBOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
					<xsl:call-template name="PopulateNegativeNumber">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/BadDebtAllowanceEOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/NetTradeNotesAcctRcvblEOYAmt"/>
					</xsl:call-template>
				  </div>
				</div>
				<!-- Schedule L, line 3-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBoxSD" style="height:4.5mm;">3</div>
				  <div class="styLNDesc" style="width:50mm;height:4.5mm;">
					<span style="float:left;">Inventories </span>
					<!--Dotted Line-->
					<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
				  </div>
				  <div class="styShadingCell" style="height:5mm;"/>
				  <div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/InventoriesBOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styShadingCell" style="height:5mm;"/>
				  <div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/InventoriesEOYAmt"/>
					</xsl:call-template>
				  </div>
				</div>
				<!-- Schedule L, line 4-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBoxSD" style="height:4.5mm;">4</div>
				  <div class="styLNDesc" style="width:50mm;height:4.5mm;">
					<span style="float:left;">U.S. government obligations </span>
					<!--Dotted Line-->
					<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
				  </div>
				  <div class="styShadingCell" style="height:5mm;"/>
				  <div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/USGovernmentObligationsBOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styShadingCell" style="height:5mm;"/>
				  <div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/USGovernmentObligationsEOYAmt"/>
					</xsl:call-template>
				  </div>
				</div>
				<!-- Schedule L, line 5-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBoxSD" style="height:4.5mm;">5</div>
				  <div class="styLNDesc" style="width:50mm;height:4.5mm;padding-top:1mm;">
					<span class="stySmallText">Tax-exempt securities (see instructions)</span>
				  </div>
				  <div class="styShadingCell" style="height:5mm;"/>
				  <div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/TaxExemptSecuritiesBOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styShadingCell" style="height:5mm;"/>
				  <div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/TaxExemptSecuritiesEOYAmt"/>
					</xsl:call-template>
				  </div>
				</div>
				<!-- Schedule L, line 6-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBoxSD" style="height:5.5mm;">6</div>
				  <div class="styLNDesc" style="width:50mm;height:5.5mm;padding-top:1mm;">
					<span class="stySmallText">Other current assets (attach statement)</span>
				  </div>
				  <div class="styShadingCell" style="height:5.5mm;"/>
				  <div class="styLNFormLinkBox" style="height:5.5mm;">
					<!-- Form to Form Link -->
					<span style="width:2px;"/>
					<xsl:call-template name="SetFormLinkInline">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/OtherCurrentAssetsBOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styLNAmountBoxFormLink" style="height:5.5mm;font-family:arial;font-size:8pt;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/OtherCurrentAssetsBOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styShadingCell" style="height:5.5mm;"/>
				  <div class="styLNFormLinkBox" style="height:5.5mm;">
					<!-- Form to Form Link -->
					<span style="width:2px;"/>
					<xsl:call-template name="SetFormLinkInline">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/OtherCurrentAssetsEOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styLNAmountBoxFormLink" style="height:5.5mm;font-family:arial;font-size:8pt;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/OtherCurrentAssetsEOYAmt"/>
					</xsl:call-template>
				  </div>
				</div>
				<!-- Schedule L, line 7-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBoxSD" style="height:4.5mm;">7</div>
				  <div class="styLNDesc" style="width:50mm;height:4.5mm;">
					<span style="float:left;">Loans to shareholders </span>
					<!--Dotted Line-->
					<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
				  </div>
				  <div class="styShadingCell" style="height:5mm;"/>
				  <div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/LoansToShareholdersBOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styShadingCell" style="height:5mm;"/>
				  <div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/LoansToShareholdersEOYAmt"/>
					</xsl:call-template>
				  </div>
				</div>
				<!-- Schedule L, line 8-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBoxSD" style="height:4.5mm;">8</div>
				  <div class="styLNDesc" style="width:50mm;height:4.5mm;">
					<span style="float:left;">Mortgage and real estate loans </span>
					<!--Dotted Line-->
					<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
				  </div>
				  <div class="styShadingCell" style="height:5mm;"/>
				  <div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/MortgageRealEstateLoansBOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styShadingCell" style="height:5mm;"/>
				  <div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/MortgageRealEstateLoansEOYAmt"/>
					</xsl:call-template>
				  </div>
				</div>
				<!-- Schedule L, line 9-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBoxSD" style="height:5.5mm;">9</div>
				  <div class="styLNDesc" style="width:50mm;height:5.5mm;font-size:6pt;">
            Other investments (attach statement)
			    </div>
				  <div class="styShadingCell" style="height:5.5mm;"/>
				  <div class="styLNFormLinkBox" style="height:5.5mm;">
					<!-- Form to Form Link -->
					<span style="width:2px;"/>
					<xsl:call-template name="SetFormLinkInline">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/OtherInvestmentsBOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styLNAmountBoxFormLink" style="height:5.5mm;font-family:arial;font-size:8pt;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/OtherInvestmentsBOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styShadingCell" style="height:5.5mm;font-family:arial;font-size:8pt;"/>
				  <div class="styLNFormLinkBox" style="height:5.5mm;">
					<!-- Form to Form Link -->
					<span style="width:2px;"/>
					<xsl:call-template name="SetFormLinkInline">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/OtherInvestmentsEOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styLNAmountBoxFormLink" style="height:5.5mm;font-family:arial;font-size:8pt;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/OtherInvestmentsEOYAmt"/>
					</xsl:call-template>
				  </div>
				</div>
				<!-- Schedule L, line 10a-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBox" style="height:4.5mm;">10a</div>
				  <div class="styLNDesc" style="width:50mm;height:4.5mm;padding-top:1mm;">
					<span class="stySmallText">Buildings and other depreciable assets</span>
				  </div>
				  <div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/BuildingOtherDeprecAstBOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styShadingCell" style="height:5mm;"/>
				  <div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/BuildingOtherDeprecAstEOYAmt"/>
					</xsl:call-template>
			      </div>
				  <div class="styShadingCell" style="height:5mm;"/>
				</div>
				<!-- Schedule L, line 10b-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm;">b</div>
				  <div class="styLNDesc" style="width:50mm;height:4.5mm;">
					<span style="float:left;">Less accumulated depreciation </span>
					<!--Dotted Line-->
					<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
				  </div>
				  <div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
					<xsl:call-template name="PopulateNegativeNumber">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/AccumulatedDepreciationBOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/NetDepreciableAssetsBOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
					<xsl:call-template name="PopulateNegativeNumber">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/AccumulatedDepreciationEOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/NetDepreciableAssetsEOYAmt"/>
					</xsl:call-template>
				  </div>
				</div>
				<!-- Schedule L, line 11a-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBox" style="height:4.5mm;">11a</div>
				  <div class="styLNDesc" style="width:50mm;height:4.5mm;">
					<span style="float:left;">Depletable assets </span>
					<!--Dotted Line-->
					<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
				  </div>
				  <div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/DepletableAssetsBOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styShadingCell" style="height:5mm;"/>
				  <div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/DepletableAssetsEOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styShadingCell" style="height:5mm;"/>
				</div>
				<!-- Schedule L, line 11b-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm;">b</div>
				  <div class="styLNDesc" style="width:50mm;height:4.5mm;">
					<span style="float:left;">Less accumulated depletion </span>
					<!--Dotted Line-->
					<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
				  </div>
				  <div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;">
					<xsl:call-template name="PopulateNegativeNumber">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/AccumulatedDepletionBOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/NetDepletableAssetsBOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;">
					<xsl:call-template name="PopulateNegativeNumber">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/AccumulatedDepletionEOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/NetDepletableAssetsEOYAmt"/>
					</xsl:call-template>
				  </div>
				</div>
				<!-- Schedule L, line 12-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBox" style="height:4.5mm;">12</div>
				  <div class="styLNDesc" style="width:50mm;height:4.5mm;">
					<span style="float:left;">Land (net of any amortization) </span>
					<!--Dotted Line-->
					<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
				  </div>
				  <div class="styShadingCell" style="height:5mm;"/>
				  <div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/LandBOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styShadingCell" style="height:5mm;"/>
				  <div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/LandEOYAmt"/>
					</xsl:call-template>
				  </div>
				</div>
				<!-- Schedule L, line 13a-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBox" style="height:4.5mm;">13a</div>
				  <div class="styLNDesc" style="width:50mm;height:4.5mm;">Intangible assets (amortizable only)</div>
				  <div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/IntangibleAssetsBOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styShadingCell" style="height:5mm;"/>
				  <div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/IntangibleAssetsEOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styShadingCell" style="height:5mm;"/>
				</div>
				<!-- Schedule L, line 13b-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm;">b</div>
				  <div class="styLNDesc" style="width:50mm;height:4.5mm;">
					<span style="float:left;">Less accumulated amortization </span>
					<!--Dotted Line-->
					<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
				  </div>
				  <div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;">
					<xsl:call-template name="PopulateNegativeNumber">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/AccumulatedAmortizationBOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/NetIntangibleAssetsBOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;">
					<xsl:call-template name="PopulateNegativeNumber">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/AccumulatedAmortizationEOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/NetIntangibleAssetsEOYAmt"/>
					</xsl:call-template>
				  </div>
				</div>
				<!-- Schedule L, line 14-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBox" style="height:5.5mm;">14</div>
				  <div class="styLNDesc" style="width:50mm;height:5.5mm;">
					<span style="float:left;">Other assets (attach statement) </span>
					<!--Dotted Line-->
					<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
				  </div>
				  <div class="styShadingCell" style="height:5.5mm;"/>
				  <div class="styLNFormLinkBox" style="height:5.5mm;">
					<!-- Form to Form Link -->
					<span style="width:2px;"/>
					<xsl:call-template name="SetFormLinkInline">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/OtherAssetsBOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styLNAmountBoxFormLink" style="height:5.5mm;font-family:arial;font-size:8pt;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/OtherAssetsBOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styShadingCell" style="height:5.5mm;"/>
				  <div class="styLNFormLinkBox" style="height:5.5mm;">
					<!-- Form to Form Link -->
					<span style="width:2px;"/>
					<xsl:call-template name="SetFormLinkInline">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/OtherAssetsEOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styLNAmountBoxFormLink" style="height:5.5mm;font-family:arial;font-size:8pt;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/OtherAssetsEOYAmt"/>
					</xsl:call-template>
				  </div>
				</div>
				<!-- Schedule L, line 15-->
				<div class="styBB" style="width:187mm;">
				  <div class="styLNLeftNumBox" style="height:4.5mm;">15</div>
				  <div class="styLNDesc" style="width:50mm;height:4.5mm;">
					<span style="float:left;">Total assets </span>
					<!--Dotted Line-->
					<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
				  </div>
				  <div class="styShadingCell" style="height:5mm;border-bottom-width:0px;"/>
				  <div class="styLNAmountBoxNBB" style="height:5mm;font-family:arial;font-size:8pt;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/TotalAssetsBOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styShadingCell" style="height:5mm;border-bottom-width:0px;"/>
				  <div class="styLNAmountBoxNBB" style="height:5mm;font-family:arial;font-size:8pt;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/TotalAssetsEOYAmt"/>
					</xsl:call-template>
				  </div>
				</div>
				<!-- Schedule L, Liabilities and Shareholders' Equity line-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBox" style="height:4.5mm;"/>
				  <div class="styGenericDiv" style="width:50mm;height:4.5mm;text-align:center;">
					<span class="styBoldText">Liabilities and Shareholders' Equity</span>
				  </div>
				  <div class="styShadingCell" style="height:4.5mm;border-top-width:0px;"/>
				  <div class="styShadingCell" style="height:4.5mm;"/>
				  <div class="styShadingCell" style="height:4.5mm;"/>
				  <div class="styShadingCell" style="height:4.5mm;"/>
				</div>
				<!-- Schedule L, line 16-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBox" style="height:4.5mm;">16</div>
				  <div class="styLNDesc" style="width:50mm;height:4.5mm;">
					<span style="float:left;">Accounts payable </span>
					<!--Dotted Line-->
					<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
				  </div>
				  <div class="styShadingCell" style="height:5mm;"/>
				  <div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/AccountsPayableBOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styShadingCell" style="height:5mm;"/>
				  <div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/AccountsPayableEOYAmt"/>
					</xsl:call-template>
				  </div>
				</div>
				<!-- Schedule L, line 17-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBox" style="height:7mm;">17</div>
				  <div class="styLNDesc" style="width:50mm;height:7mm;">
					<span>Mortgages, notes, bonds payable in less than 1 year</span>
				  </div>
				  <div class="styShadingCell" style="height:7.5mm;"/>
				  <div class="styLNAmountBox" style="height:7.5mm;padding-top:3mm;font-family:arial;font-size:8pt;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/ShortTermPayableBOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styShadingCell" style="height:7.5mm;"/>
				  <div class="styLNAmountBox" style="height:7.5mm;padding-top:3mm;font-family:arial;font-size:8pt;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/ShortTermPayableEOYAmt"/>
					</xsl:call-template>
				  </div>
				</div>
				<!-- Schedule L, line 18-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBox" style="height:5.5mm;">18</div>
				  <div class="styLNDesc" style="width:50mm;height:5.5mm;padding-top:1mm;">
				    <span class="stySmallText">Other current liabilities (attach statement)</span>
				  </div>
				  <div class="styShadingCell" style="height:5.5mm;"/>
				  <div class="styLNFormLinkBox" style="height:5.5mm;">
					<!-- Form to Form Link -->
					<span style="width:2px;"/>
					<xsl:call-template name="SetFormLinkInline">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/OtherCurrentLiabilitiesBOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styLNAmountBoxFormLink" style="height:5.5mm;font-family:arial;font-size:8pt;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/OtherCurrentLiabilitiesBOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styShadingCell" style="height:5.5mm;"/>
				  <div class="styLNFormLinkBox" style="height:5.5mm;">
					<!-- Form to Form Link -->
					<span style="width:2px;"/>
					<xsl:call-template name="SetFormLinkInline">
					 <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/OtherCurrentLiabilitiesEOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styLNAmountBoxFormLink" style="height:5.5mm;font-family:arial;font-size:8pt;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/OtherCurrentLiabilitiesEOYAmt"/>
					</xsl:call-template>
				  </div>
				</div>
			    <!-- Schedule L, line 19-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBox" style="height:4.5mm;">19</div>
				  <div class="styLNDesc" style="width:50mm;height:4.5mm;">
				    <span style="float:left;">Loans from shareholders </span>
					<!--Dotted Line-->
					<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
				  </div>
				  <div class="styShadingCell" style="height:5mm;"/>
				  <div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/LoansFromShareholdersBOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styShadingCell" style="height:5mm;"/>
				  <div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/LoansFromShareholdersEOYAmt"/>
					</xsl:call-template>
				  </div>
				</div>
				<!-- Schedule L, line 20-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBox" style="height:7mm;">20</div>
				  <div class="styLNDesc" style="width:50mm;height:7mm;">
					<span>Mortgages, notes, bonds payable in 1 year or more</span>
				  </div>
				  <div class="styShadingCell" style="height:7.5mm;"/>
				  <div class="styLNAmountBox" style="height:7.5mm;padding-top:3mm;font-family:arial;font-size:8pt;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/LongTermPayableBOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styShadingCell" style="height:7.5mm;"/>
				  <div class="styLNAmountBox" style="height:7.5mm;padding-top:3mm;font-family:arial;font-size:8pt;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/LongTermPayableEOYAmt"/>
					</xsl:call-template>
				  </div>
				</div>
				<!-- Schedule L, line 21-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBox" style="height:5.5mm;">21</div>
				  <div class="styLNDesc" style="width:50mm;height:5.5mm;">
                    Other liabilities (attach statement)
			      </div>
				  <div class="styShadingCell" style="height:5.5mm;"/>
				  <div class="styLNFormLinkBox" style="height:5.5mm;">
					<!-- Form to Form Link -->
					<span style="width:2px;"/>
					<xsl:call-template name="SetFormLinkInline">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/OtherLiabilitiesBOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styLNAmountBoxFormLink" style="height:5.5mm;font-family:arial;font-size:8pt;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/OtherLiabilitiesBOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styShadingCell" style="height:5.5mm;"/>
				  <div class="styLNFormLinkBox" style="height:5.5mm;">
					<!-- Form to Form Link -->
					<span style="width:2px;"/>
					<xsl:call-template name="SetFormLinkInline">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/OtherLiabilitiesEOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styLNAmountBoxFormLink" style="height:5.5mm;font-family:arial;font-size:8pt;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/OtherLiabilitiesEOYAmt"/>
					</xsl:call-template>
				  </div>
				</div>
				<!-- Schedule L, line 22a-->
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
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/CapitalPreferredStockBOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styShadingCell" style="height:5mm;"/>
				  <div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/CapitalPreferredStockEOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styShadingCell" style="height:5mm;"/>
				</div>
				<!-- Schedule L, line 22b-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBox" style="height:4.5mm;"/>
				  <div class="styLNDesc" style="width:50mm;height:4.5mm;">
					<span style="width:20mm;" class="styLNDesc"/>
					<span style="width:28mm;" class="styLNDesc">
					  <span class="styBoldText">b</span> Common stock
			        </span>
				  </div>
				  <div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;border-bottom-width:1px;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/CapitalCommonStockBOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;border-bottom-width:1px;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/CapitalStockBOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;border-bottom-width:1px;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/CapitalCommonStockEOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;border-bottom-width:1px;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/CapitalStockEOYAmt"/>
					</xsl:call-template>
				  </div>
				</div>
				<!-- Schedule L, line 23-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBox" style="height:4.5mm;">23</div>
				  <div class="styLNDesc" style="width:50mm;height:4.5mm;">
					<span style="float:left;">Additional paid-in capital </span>
					<!--Dotted Line-->
					<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
				  </div>
				  <div class="styShadingCell" style="height:5mm;"/>
				  <div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/AdditionalPaidInCapitalBOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styShadingCell" style="height:5mm;"/>
				  <div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/AdditionalPaidInCapitalEOYAmt"/>
					</xsl:call-template>
				  </div>
				</div>
				<!-- Schedule L, line 24-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBox" style="height:7mm;">24</div>
				  <div class="styLNDesc" style="width:50mm;height:7mm;">
					<span>Retained earnings—Appropriated (attach statement)</span>
				  </div>
				  <div class="styShadingCell" style="height:7.5mm;"/>
				  <div class="styLNFormLinkBox" style="height:7.5mm;padding-top:1.5mm;padding-top:3mm;">
					<!-- Form to Form Link -->
					<span style="width:2px;"/>
					<xsl:call-template name="SetFormLinkInline">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/RetainedEarningsApprBOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styLNAmountBoxFormLink" style="height:7.5mm;padding-top:3mm;font-family:arial;font-size:8pt;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/RetainedEarningsApprBOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styShadingCell" style="height:7.5mm;"/>
				  <div class="styLNFormLinkBox" style="height:7.5mm;padding-top:1.5mm;padding-top:3mm;">
					<!-- Form to Form Link -->
					<span style="width:2px;"/>
					<xsl:call-template name="SetFormLinkInline">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/RetainedEarningsApprEOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styLNAmountBoxFormLink" style="height:7.5mm;padding-top:3mm;font-family:arial;font-size:8pt;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/RetainedEarningsApprEOYAmt"/>
					</xsl:call-template>
				  </div>
				</div>
				<!-- Schedule L, line 25-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBox" style="height:4.5mm;">25</div>
				  <div class="styLNDesc" style="width:50mm;height:4.5mm;">
			        Retained earnings—Unappropriated
			      </div>
				  <div class="styShadingCell" style="height:5mm;"/>
				  <div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
				    <xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/RetainedEarningsUnapprBOYAmt"/>
				    </xsl:call-template>
				  </div>
				  <div class="styShadingCell" style="height:5mm;"/>
				  <div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
				    <xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/RetainedEarningsUnapprEOYAmt"/>
				    </xsl:call-template>
				  </div>
			    </div>
			    <!-- Schedule L, line 26-->
			    <div style="width:187mm;">
				  <div class="styLNLeftNumBox" style="height:7mm;">26</div>
				  <div class="styLNDesc" style="width:50mm;height:7mm;">
					<span>Adjustments to shareholders' equity (attach statement)</span>
				  </div>
				  <div class="styShadingCell" style="height:7.5mm;"/>
				  <div class="styLNFormLinkBox" style="height:7.5mm;padding-top:1.5mm;padding-top:3mm;">
					<!-- Form to Form Link -->
					<span style="width:2px;"/>
					<xsl:call-template name="SetFormLinkInline">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/AdjustmentToShrEqtyBOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styLNAmountBoxFormLink" style="height:7.5mm;padding-top:3mm;font-family:arial;font-size:8pt;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/AdjustmentToShrEqtyBOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styShadingCell" style="height:7.5mm;"/>
				  <div class="styLNFormLinkBox" style="height:7.5mm;padding-top:1.5mm;padding-top:3mm;">
					<!-- Form to Form Link -->
					<span style="width:2px;"/>
					<xsl:call-template name="SetFormLinkInline">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/AdjustmentToShrEqtyEOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styLNAmountBoxFormLink" style="height:7.5mm;padding-top:3mm;font-family:arial;font-size:8pt;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/AdjustmentToShrEqtyEOYAmt"/>
					</xsl:call-template>
				  </div>
				</div>
				<!-- Schedule L, line 27-->
				<div style="width:187mm;">
				  <div class="styLNLeftNumBox" style="height:4.5mm;">27</div>
				  <div class="styLNDesc" style="width:50mm;height:4.5mm;">
					<span style="float:left;">Less cost of treasury stock </span>
					<!--Dotted Line-->
					<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
				  </div>
				  <div class="styShadingCell" style="height:5.5mm;"/>
				  <div class="styLNAmountBox" style="height:5.5mm;font-family:arial;font-size:8pt;border-bottom-width:2px;">
					<xsl:call-template name="PopulateNegativeNumber">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/CostOfTreasuryStockBOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styShadingCell" style="height:5.5mm;"/>
				  <div class="styLNAmountBox" style="height:5.5mm;font-family:arial;font-size:8pt;border-bottom-width:2px;">
					<xsl:call-template name="PopulateNegativeNumber">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/CostOfTreasuryStockEOYAmt"/>
					</xsl:call-template>
				  </div>
				</div>
				<!-- Schedule L, line 28-->
				<div class="styBB" style="width:187mm;">
				  <div class="styLNLeftNumBox" style="height:4.5mm;">28</div>
				  <div class="styGenericDiv" style="width:50mm;height:4.5mm;padding-top:1mm;">
					<span class="stySmallText" style="font-size:7pt">Total liabilities and shareholders' equity</span>
				  </div>
				  <div class="styShadingCell" style="height:4.5mm;"/>
				  <div class="styLNAmountBoxNBB" style="height:4.5mm;font-family:arial;font-size:8pt;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/TotalLiabilitiesShrEqtyBOYAmt"/>
					</xsl:call-template>
				  </div>
				  <div class="styShadingCell" style="height:4.5mm;"/>
				  <div class="styLNAmountBoxNBB" style="height:4.5mm;font-family:arial;font-size:8pt;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleL/TotalLiabilitiesShrEqtyEOYAmt"/>
					</xsl:call-template>
				  </div>
				</div>
				<!-- END Schedule L Line Items -->
				<br style="page-break-after:always;"/>
				<!-- BEGIN Schedule M-1 Title -->
				<div class="styBB" style="width:187mm;border-top-width:1px;border-top:solid black;border-top-width:1px;">
				  <div class="styPartName" style="width:28mm;">Schedule M-1</div>
				  <div class="styPartDesc" style="width:158mm;height:6mm;font-size:7pt;">Reconciliation of Income (Loss) per Books With Income per Return<br/>
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
					<!-- Schedule M-1, Line 1-->
					<td class="styLNLeftNumBoxSD" style="height:4.5mm;float:none;">1</td>
					<td class="styGenericDiv" style="width:52mm;height:4.5mm;float:none;" colspan="2">
					  <span style="float:left;">Net income (loss) per books </span>
					  <!--Dotted Line-->
					  <span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
					</td>
					<td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;width:31mm;float:none;">
					  <xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form1120ScheduleM1/NetIncomeLossPerBooksAmt"/>
					  </xsl:call-template>
					  <span style="width:1px;"/>
					</td>
				  </tr>
				  <tr>
				    <!-- Schedule M-1, Line 2-->
					<td class="styLNLeftNumBoxSD" style="height:4.5mm;float:none;">2</td>
					<td class="styGenericDiv" style="width:52mm;height:4.5mm;float:none;" colspan="2">
					  <span style="float:left;">Federal income tax per books </span>
					  <!--Dotted Line-->
					  <span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
					</td>
					<td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;width:31mm;float:none;">
					  <xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form1120ScheduleM1/FederalIncomeTaxPerBooksAmt"/>
					  </xsl:call-template>
					  <span style="width:1px;"/>
					</td>
				  </tr>
				  <tr>
					<!-- Schedule M-1, Line 3-->
					<td class="styLNLeftNumBoxSD" style="height:4.5mm;float:none;">3</td>
					<td class="styGenericDiv" style="width:52mm;height:4.5mm;float:none;" colspan="2">
					  <span class="stySmallText">
						<span style="float:left;">Excess of capital losses over capital gains </span>
						<!--Dotted Line-->
						<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
					  </span>
					</td>
					<td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;width:31mm;float:none;">
					  <xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form1120ScheduleM1/ExcessCapLossesOverCapGainsAmt"/>
					  </xsl:call-template>
					  <span style="width:1px;"/>
					</td>
				  </tr>
				  <tr>
				    <!-- Schedule M-1, Line 4-->
				    <td class="styLNLeftNumBoxSD" style="height:4.5mm;float:none;">4</td>
					<td class="styGenericDiv" style="width:52mm;height:4.5mm;float:none;" colspan="2">Income subject to tax not recorded on</td>
					<td class="styShadingCell" style="height:4.5mm;border-right-width:1px;31mm;float:none;">
					  <span style="width:1px;"/>
					</td>
				  </tr>
				  <tr>
					<td class="styLNLeftNumBoxSD" style="height:4.5mm;float:none;"/>
					<td class="styGenericDiv" style="width:50mm;height:4.5mm;float:none;" colspan="2">
					  <div class="styGenericDiv" style="width:36mm;">books this year (itemize): </div>
					  <div class="styIRS1120BBText" style="width:14mm;float:none;"/>
					</td>
					<td class="styShadingCell" style="height:4.5mm;border-right-width:1px;31mm;float:none;">
					  <span style="width:1px;"/>
					</td>
				  </tr>
				  <tr class="styGenericDiv" style="height:4.5mm;float:none;">
					<td class="styLNLeftNumBoxSD" style="height:4.5mm;float:none;"/>
					<td class="styGenericDiv" style="width:52mm;height:4.5mm;padding-right:.5mm;float:none;" colspan="2">
					  <div class="styIRS1120BBText" style="width:51mm;text-align:right;padding-right:3mm;height:4.5mm;float:none;">
						<xsl:call-template name="SetFormLinkInline">
						  <xsl:with-param name="TargetNode" select="$Form1120ScheduleM1/TotalTaxableIncmNotRecOnBksAmt"/>
						</xsl:call-template>
					  </div>
					</td>
					<td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;width:31.5mm;float:none;">
					  <xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form1120ScheduleM1/TotalTaxableIncmNotRecOnBksAmt"/>
					  </xsl:call-template>
					  <span style="width:1px;"/>
					</td>
				  </tr>
				  <tr>
					<!-- Schedule M-1, Line 5-->
					<td class="styLNLeftNumBoxSD" style="height:4.5mm;float:none;">5</td>
					<td class="styGenericDiv" style="width:52mm;height:4.5mm;float:none;" colspan="2">Expenses recorded on books this year</td>
					<td class="styShadingCell" style="height:4.5mm;border-right-width:1px;float:none;">
					  <span style="width:1px;"/>
					</td>
				  </tr>
				  <tr>
					<td class="styLNLeftNumBoxSD" style="height:4.5mm;float:none;"/>
					<td class="styGenericDiv" style="width:52mm;height:4.5mm;float:none;" colspan="2">not deducted on this return (itemize):</td>
					<td class="styShadingCell" style="height:4.5mm;border-right-width:1px;width:31.5mm;float:none;">
					  <span style="width:1px;"/>
					</td>
				  </tr>
				  <tr>
					<!-- Schedule M-1, Line 5a-->
					<td class="styLNLeftNumBoxSD" style="height:4.5mm;float:none;">
					  <span style="width:3mm;"/>a
					</td>
					<td class="styGenericDiv" style="width:52mm;height:4.5mm;float:none;" colspan="2">
					  <div class="styGenericDiv" style="width:23.5mm;float:none;">Depreciation<span style="width:2mm;"/>$ </div>
					  <div class="styIRS1120BBText" style="width:23mm;float:left;text-align:right;font-size:6pt;float:none;">
						<xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="$Form1120ScheduleM1/DepreciationExpensesAmt"/>
						</xsl:call-template>
						<span style="width:1px;"/>
					  </div>
					</td>
					<td class="styShadingCell" style="height:4.5mm;border-right-width:1px;float:none;">
					  <span style="width:1px;"/>
					</td>
				  </tr>
				<tr>
				  <!-- Schedule M-1, Line 5b-->
				  <td class="styLNLeftNumBox" style="height:4.5mm;vertical-align:top;float:none;">
					<span style="width:3mm;"/>b
				  </td>
				  <td class="styGenericDiv" style="width:52mm;height:4.5mm;float:none;" colspan="2">
					<div class="styGenericDiv" style="width:23.5mm;float:none;">Charitable contributions<span style="width:1.5mm;"/>$ </div>
					<div class="styIRS1120BBText" style="width:23mm;float:left;text-align:right;font-size:6pt;padding-top:3mm;float:none;">
					  <xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form1120ScheduleM1/CharitableContriExpnssAmt"/>
					  </xsl:call-template>
					  <span style="width:1px;"/>
					</div>
				  </td>
				  <td class="styShadingCell" style="height:4.5mm;border-right-width:1px;float:none;">
					<span style="width:1px;"/>
				  </td>
				</tr>
				<tr>
				  <!-- Schedule M-1, Line 5c-->
				  <td class="styLNLeftNumBox" style="vertical-align:top;float:none;">
					<span style="width:3mm;"/>c
			      </td>
				  <td class="styGenericDiv" style="width:52mm;height:4.5mm;float:none;" colspan="2">
					<div class="styGenericDiv" style="width:23.5mm;float:none;">Travel and entertainment 
                      <span style="font-size:6pt;"/>$
                    </div>
					<div class="styIRS1120BBText" style="width:23mm;float:left;text-align:right;font-size:6pt;padding-top:3mm;float:none;">
					  <xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form1120ScheduleM1/TravelEntertainmentAmt"/>
					  </xsl:call-template>
					  <span style="width:1px;"/>
					</div>
					<span style="width:1px;"/>
				  </td>
				  <td class="styShadingCell" style="height:4.5mm;border-right-width:1px;float:none;">
					<span style="width:1px;"/>
				  </td>
				</tr>
				<tr class="styGenericDiv" style="height:4.5mm;float:none;">
				  <td class="styLNLeftNumBoxSD" style="height:4.5mm;float:none;"/>
				  <td class="styGenericDiv" style="width:48mm;height:4.5mm;float:none;" colspan="2">
					<div class="styIRS1120BBText" style="width:51.5mm;text-align:right;padding-right:3mm;height:4.5mm;float:none;">
					  <xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="$Form1120ScheduleM1/TotalExpensesNotDeductedAmt"/>
					  </xsl:call-template>
					</div>
				  </td>
				  <td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;border-bottom-width: 1px;float:none;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleM1/TotalExpensesNotDeductedAmt"/>
					</xsl:call-template>
					<span style="width:1px;"/>
				  </td>
				</tr>
				<tr>
				  <!-- Schedule M-1, Line 6-->
				  <td class="styLNLeftNumBoxSD" style="height:4.5mm;padding-top:1.5mm;float:none;">6</td>
				  <td class="styGenericDiv" style="width:52mm;height:4.5mm;padding-top:1.5mm;float:none;" colspan="2">
					<span style="float:left;">Add lines 1 through 5 </span>
					<!--Dotted Line-->
					<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
				  </td>
				  <td class="styLNAmountBoxNBB" style="width:31.5mm;height:5.5mm;border-top-width:1px;border-right-width:1px;padding-top:1.5mm;float:none;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleM1/IncomeExpensesSubtotalAmt"/>
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
				  <!-- Schedule M-1, Line 7-->
				  <td class="styLNLeftNumBoxSD" style="height:4.5mm;width:7.5mm;">7</td>
				  <td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">Income recorded on books this year</td>
				  <td class="styShadingCell" style="height:4.5mm;width:30.5mm;">
					<span style="width:1px;"/>
				  </td>
				</tr>
				<tr class="styGenericDiv">
				  <td class="styLNLeftNumBoxSD" style="height:4.5mm;"/>
				  <td class="styGenericDiv" style="width:51.5mm;height:4.5mm;" colspan="2">not included on this return (itemize):</td>
				  <td class="styShadingCell" style="height:4.5mm;width:30.5mm;">
					<span style="width:1px;"/>
				  </td>
				</tr>
			    <tr>
				  <td class="styLNLeftNumBoxSD" style="height:4.5mm;"/>
				  <td class="styGenericDiv" style="width:51.5mm;height:4.5mm;" colspan="2">
					<div class="styGenericDiv" style="width:22.5mm;">Tax-exempt interest 
					  <span style="width:4px;"/>$
				  </div>
				  <div class="styIRS1120BBText" style="width:23mm;font-size:6pt;text-align:right;font-family:verdana;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleM1/TaxExemptInterestAmt"/>
					</xsl:call-template>
					<span style="width:1px;"/>
				  </div>
				  </td>
				  <td class="styShadingCell" style="height:4.5mm;width:30.5mm;">
					<span style="width:1px;"/>
				  </td>
				</tr>
				<tr class="styGenericDiv" style="height:4.5mm;">
				  <td class="styLNLeftNumBoxSD" style="height:4.5mm;"/>
				  <td class="styGenericDiv" style="width:51.5mm;height:4.5mm;padding-right:.5mm;" colspan="2">
					<div class="styIRS1120BBText" style="width:51.5mm;text-align:right;padding-right:3mm;height:4.5mm;"/>
				  </td>
				  <td class="styShadingCell" style="height:4.5mm;width:30.5mm;">
					<span style="width:1px;"/>
				  </td>
				</tr>
				<tr class="styGenericDiv" style="height:4.5mm;">
				  <td class="styLNLeftNumBoxSD" style="height:4.5mm;"/>
				  <td class="styGenericDiv" style="width:51.5mm;height:4.5mm;padding-right:.5mm;" colspan="2">
					<div class="styIRS1120BBText" style="width:51.5mm;text-align:right;padding-right:3mm;height:4.5mm;">
					  <xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="$Form1120ScheduleM1/TotIncmRecordedNotIncludedAmt"/>
					  </xsl:call-template>
					</div>
				  </td>
				  <td class="styLNAmountBox" style="height:4.5mm;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleM1/TotIncmRecordedNotIncludedAmt"/>
					</xsl:call-template>
					<span style="width:1px;"/>
				  </td>
				</tr>
				<tr class="styGenericDiv">
				  <!-- Schedule M-1, Line 8-->
				  <td class="styLNLeftNumBoxSD" style="height:4.5mm;">8</td>
				  <td class="styGenericDiv" style="width:51.5mm;height:4.5mm;" colspan="2">
					<span class="stySmallText">Deductions on this return not charged</span>
				  </td>
				  <td class="styShadingCell" style="height:4.5mm;width:30.5mm;">
					<span style="width:1px;"/>
				  </td>
				</tr>
				<tr class="styGenericDiv">
				  <td class="styLNLeftNumBoxSD" style="height:4.5mm;"/>
				  <td class="styGenericDiv" style="width:51.5mm;height:4.5mm;" colspan="2">
					<span class="stySmallText">against book income this year (itemize):</span>
				  </td>
				  <td class="styShadingCell" style="height:4.5mm;width:30.5mm;">
					<span style="width:1px;"/>
				  </td>
				</tr>
				<tr>
				  <!-- Schedule M-1, Line 8a-->
				  <td class="styLNLeftNumBoxSD" style="height:4.5mm;">
					<span style="width:3mm;"/>a
				  </td>
				  <td class="styGenericDiv" style="width:51.5mm;height:4.5mm;" colspan="2">
					<div class="styGenericDiv" style="width:22.5mm;">Depreciation<span style="width:2mm;"/>$ </div>
					<div class="styIRS1120BBText" style="width:23mm;float:left;text-align:right;font-size:6pt;">
					  <xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form1120ScheduleM1/DepreciationDeductionAmt"/>
					  </xsl:call-template>
					  <span style="width:1px;"/>
					</div>
				  </td>
				  <td class="styShadingCell" style="height:4.5mm;width:30.5mm;">
					<span style="width:1px;"/>
				  </td>
				</tr>
				<tr>
				  <!-- Schedule M-1, Line 8b-->
				  <td class="styLNLeftNumBoxSD" style="height:4.5mm;vertical-align:top;">
					<span style="width:3mm;"/>b
			      </td>
				  <td class="styGenericDiv" style="width:51.5mm;height:4.5mm;" colspan="2">
					<div class="styGenericDiv" style="width:22.5mm;">Charitable contributions<span style="width:1.5mm;"/>$ </div>
					<div class="styIRS1120BBText" style="width:23mm;height:8mm;float:left;text-align:right;font-size:6pt;padding-top:4mm;">
					  <xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form1120ScheduleM1/CharitableContributionsDedAmt"/>
					  </xsl:call-template>
					  <span style="width:1px;"/>
					</div>
				  </td>
				  <td class="styShadingCell" style="height:6mm;width:30.5mm;">
					<span style="width:1px;"/>
				  </td>
				</tr>
				<tr class="styGenericDiv" style="height:4.5mm;">
				  <td class="styLNLeftNumBoxSD" style="height:4.5mm;"/>
				  <td class="styGenericDiv" style="width:51.5mm;height:4.5mm;padding-right:.5mm;" colspan="2">
					<div class="styIRS1120BBText" style="width:51.5mm;text-align:right;padding-right:3mm;height:4.5mm;"/>
				  </td>
				  <td class="styShadingCell" style="height:4.5mm;width:30.5mm;float:none">
					<span style="width:1px;"/>
				  </td>
				</tr>
				<tr class="styGenericDiv" style="height:4.5mm;">
				  <td class="styLNLeftNumBoxSD" style="height:4.5mm;width:7.5mm"/>
				  <td class="styGenericDiv" style="width:52mm;height:4.5mm;padding-right:.5mm;" colspan="2">
					<div class="styIRS1120BBText" style="width:50.5mm;text-align:right;padding-right:3mm;height:4.5mm;">
					  <xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="$Form1120ScheduleM1/TotalDeductionsNotChargedAmt"/>
					  </xsl:call-template>
					</div>
				  </td>
				  <td class="styLNAmountBox" style="height:4.5mm;border-bottom-width:1px">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleM1/TotalDeductionsNotChargedAmt"/>
					</xsl:call-template>
					<span style="width:1px;"/>
				  </td>
				</tr>
				<!-- Schedule M-1, Line 9-->
				<tr class="styGenericDiv">
				  <td class="styLNLeftNumBoxSD" style="height:5.5mm;">9</td>
				  <td class="styGenericDiv" style="width:51.5mm;height:5.5mm;" colspan="2">
					<span style="float:left;">Add lines 7 and 8 </span>
					<!--Dotted Line-->
					<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
				  </td>
				  <td class="styLNAmountBox" style="height:5.5mm;border-top-width:1px;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleM1/IncomeDeductionsSubtotalAmt"/>
					</xsl:call-template>
					<span style="width:1px;"/>
				  </td>
				</tr>
				<tr class="styGenericDiv">
				  <!-- Schedule M-1, Line 10-->
				  <td class="styLNLeftNumBox" style="height:4.5mm;">10</td>
				  <td class="styGenericDiv" style="width:51.5mm;height:4.5mm;" colspan="2">
					<span class="stySmallText">Income (page 1, line 28)—line 6 less line 9</span>
				  </td>
				  <td class="styLNAmountBox" style="height:4.5mm;border-bottom-width: 0px; padding-top:1mm;border-top-width:1px;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleM1/IncomeAmt"/>
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
			  Analysis of Unappropriated Retained Earnings per Books (Line 25, Schedule L)
			</div>
		  </div>
		  <!-- END Schedule M-2 Title -->
		  <!-- BEGIN Schedule M-2 Line Items -->
		  <div style="width:187mm;clear:both;" class="styBB">
		    <!-- BEGIN Left Side Table of Schedule M-2-->
			<table class="styTable" style="width:93mm;float:left;clear:none;font-size:7pt;" cellspacing="0">
			  <tr class="styGenericDiv">
				<!-- Schedule M2, line 1 -->
				<td class="styLNLeftNumBoxSD" style="height:4.5mm;">1</td>
				<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">
				  <span style="float:left;">Balance at beginning of year </span>
				  <!--Dotted Line-->
				  <span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
			    </td>
				<td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;border-bottom:1px solid black;border-bottom-width:1px;">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleM2/BeginningYearBalanceAmt"/>
				  </xsl:call-template>
				  <span style="width:1px;"/>
				</td>
			  </tr>
			  <tr class="styGenericDiv">
				<!-- Schedule M2, line 2 -->
				<td class="styLNLeftNumBoxSD" style="height:4.5mm;">2</td>
				<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">
				  <span style="float:left;">Net income (loss) per books </span>
				  <!--Dotted Line-->
				  <span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
				</td>
				<td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleM2/NetIncomeLossPerBooksAmt"/>
				  </xsl:call-template>
				  <span style="width:1px;"/>
				</td>
			  </tr>
			  <tr class="styGenericDiv">
				<!-- Schedule M2, line 3 -->
				<td class="styLNLeftNumBoxSD" style="height:4.5mm;">3</td>
				<td class="styLNDesc" style="width:52mm;height:4.5mm;vertical-align:bottom;padding-top:1.5mm;" colspan="2">
				  <div class="styGenericDiv" style="width:38mm;">Other increases (itemize): </div>
				  <div class="styIRS1120BBText" style="width:11mm;float:left;"/>
				</td>
				<td class="styShadingCell" style="height:4.5mm;border-right-width:1px;">
				  <span style="width:1px;"/>
				</td>
			  </tr>
			  <tr class="styGenericDiv" style="height:4.5mm;">
				<td class="styLNLeftNumBoxSD" style="height:4.5mm;"/>
				<td class="styGenericDiv" style="width:52mm;height:4.5mm;padding-right:2mm;" colspan="2">
				  <div class="styIRS1120BBText" style="width:49mm;"/>
				</td>
				<td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;background-color:lightgrey;">
				  <span style="width:1px;"/>
				</td>
			  </tr>
			  <tr class="styGenericDiv" style="height:4.5mm;">
				<td class="styLNLeftNumBoxSD" style="height:4.5mm;"/>
				<td class="styGenericDiv" style="width:52mm;height:4.5mm;padding-right:2mm;" colspan="2">
				  <div class="styIRS1120BBText" style="width:49mm;text-align:right;height:4.5mm;padding-right:3mm;">
					<xsl:call-template name="SetFormLinkInline">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleM2/TotalOtherIncreasesAmt"/>
					</xsl:call-template>
				  </div>
				</td>
				<td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;border-bottom-width: 2px">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleM2/TotalOtherIncreasesAmt"/>
				  </xsl:call-template>
				  <span style="width:1px;"/>
				</td>
			  </tr>
			  <tr class="styGenericDiv">
				<!-- Schedule M2, line 4 -->
				<td class="styLNLeftNumBoxSD" style="height:4.5mm;border-bottom-width:2px;">4</td>
				<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">
				  <span style="float:left;">Add lines 1, 2, and 3 </span>
				  <!--Dotted Line-->
				  <span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
				</td>
				<td class="styLNAmountBoxNBB" style="height:4.5mm;border-right-width:1px;">
				  <!--<xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form1120ScheduleM2/BalanceIncomeOtherIncreases"/>
                  </xsl:call-template>-->
				  <span style="width:1px;"/>
				</td>
			  </tr>
			  <tr class="styGenericDiv">
				<!-- Schedule M2, line 4 row 2-->
				<td class="styLNLeftNumBoxSD" style="height:4.5mm;border-bottom-width:2px;"/>
				<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2"/>
			    <td class="styLNAmountBoxNBB" style="height:5.5mm;border-right-width:1px;">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleM2/BalanceIncomeOtherIncreasesAmt"/>
				  </xsl:call-template>
				  <span style="width:1px;"/>
				</td>
			  </tr>
			</table>
			<!-- END Left Side Table of Schedule M-2-->
			<!-- BEGIN Right Side Table of Schedule M-2-->
			<table class="styTable" style="width:94mm;float:left;clear:none;font-size:7pt;" cellspacing="0">
			  <tr class="styGenericDiv">
				<!-- Schedule M2, line 5a -->
				<td class="styLNLeftNumBoxSD" style="height:4.5mm;">5</td>
				<td class="styGenericDiv" style="width:20mm;height:4.5mm;">
				  Distributions:
				</td>
				<td class="styGenericDiv" style="width:32mm;height:4.5mm;">
				  <span style="float:left;">
					<span class="styBoldText">a</span>
					<span style="width:4px"/>
                    Cash 
                  </span>
				  <!--Dotted Line-->
				  <span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
				</td>
				<td class="styLNAmountBox" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleM2/CashDistributionAmt"/>
				  </xsl:call-template>
				  <span style="width:1px;"/>
				</td>
			  </tr>
			  <tr class="styGenericDiv">
				<!-- Schedule M2, line 5b -->
				<td class="styLNLeftNumBoxSD" style="height:4.5mm;"/>
				<td class="styGenericDiv" style="width:20mm;height:4.5mm;"/>
				<td class="styGenericDiv" style="width:32mm;height:4.5mm;">
				  <span style="float:left;">
					<span class="styBoldText">b</span>
					<span style="width:4px"/>Stock
                  </span>
				  <!--Dotted Line-->
				  <span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
				</td>
				<td class="styLNAmountBox" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleM2/StockDistributionAmt"/>
				  </xsl:call-template>
				  <span style="width:1px;"/>
				</td>
			  </tr>
			  <tr class="styGenericDiv">
				<!-- Schedule M2, line 5c -->
				<td class="styLNLeftNumBoxSD" style="height:4.5mm;"/>
				<td class="styGenericDiv" style="width:20mm;height:4.5mm;"/>
				<td class="styGenericDiv" style="width:32mm;height:4.5mm;">
				  <span style="float:left;">
					<span class="styBoldText">c</span>
					<span style="width:4px"/>Property 
                  </span>
				  <!--Dotted Line-->
				  <span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
				</td>
				<td class="styLNAmountBox" style="height:4.5mm;">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleM2/PropertyDistributionAmt"/>
				  </xsl:call-template>
				  <span style="width:1px;"/>
				</td>
			  </tr>
			  <tr class="styGenericDiv">
				<!-- Schedule M2, line 6 -->
				<td class="styLNLeftNumBoxSD" style="height:4.75mm;">6</td>
				<td class="styGenericDiv" style="width:52mm;height:4.75mm;padding-top:1.5mm;" colspan="2">
				  <div class="styGenericDiv" style="width:36mm;">Other decreases (itemize): </div>
				  <div class="styIRS1120BBText" style="width:13mm;float:left;height:4.75mm;text-align:right;padding-right:2mm;">
					<xsl:call-template name="SetFormLinkInline">
					  <xsl:with-param name="TargetNode" select="$Form1120ScheduleM2/TotalOtherDecreasesAmt"/>
					</xsl:call-template>
				  </div>
				</td>
				<td class="styLNAmountBox" style="height:4.75mm;vertical-align:bottom;border-bottom-width: 2px">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleM2/TotalOtherDecreasesAmt"/>
				  </xsl:call-template>
				  <span style="width:1px;"/>
				</td>
			  </tr>
			  <tr class="styGenericDiv">
				<!-- Schedule M2, line 7 -->
				<td class="styLNLeftNumBoxSD" style="height:5mm;">7</td>
				<td class="styGenericDiv" style="width:52mm;height:5mm;" colspan="2">
				  <span style="float:left;">Add lines 5 and 6 </span>
				  <!--Dotted Line-->
				  <span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
				</td>
				<td class="styLNAmountBox" style="height:5mm;border-bottom-width: 2px">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleM2/DistributionsOtherDecreasesAmt"/>
				  </xsl:call-template>
				  <span style="width:1px;"/>
				</td>
			  </tr>
			  <tr class="styGenericDiv">
				<!-- Schedule M2, line 8 -->
				<td class="styLNLeftNumBoxSD" style="height:5mm;">8</td>
				<td class="styGenericDiv" style="width:52mm;height:5mm;" colspan="2">
				  <span class="stySmallText">Balance at end of year(line 4 less line 7)</span>
				</td>
				<td class="styLNAmountBoxNBB" style="height:11mm;padding-top:7mm;">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form1120ScheduleM2/EndYearBalanceAmt"/>
				  </xsl:call-template>
				  <span style="width:1px;"/>
				</td>
			  </tr>
			</table>
			<!-- END Right Side Table of Schedule M-2-->
		  </div>
		  <!-- END Schedule M-2 Line Items -->
		  <!-- Page Break and Footer-->
		  <div class="pageEnd" style="width:187mm;padding-top:1mm;border-top:1px solid black;border-top-width1px;">
			<div style="width:100mm;float:left;">
			  <span style="width:90mm;"/>
			</div>
			<div style="float:right;">
			  <span style="width:80px;"/>  
              Form <span class="styBoldText" style="font-size:8pt;">1120</span> (2013)
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
			<!--REMOVE in 6.2_Drop 1<xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Form 1120, Top Left Margin - Section Section 444 Indicator
            </xsl:with-param>
            <xsl:with-param name="TargetNode" select="$Form1120Data/@section444Indicator"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>-->
			<xsl:call-template name="PopulateLeftoverRow">
			  <xsl:with-param name="Desc">Form 1120, Top Left Margin - Section 1291 Interest Indicator
            </xsl:with-param>
			<xsl:with-param name="TargetNode" select="$Form1120Data/@section1291InterestCd"/>
			  <xsl:with-param name="DescWidth" select="100"/>
			</xsl:call-template>
			<xsl:call-template name="PopulateLeftoverRowAmount">
			  <xsl:with-param name="Desc">Form 1120, Top Left Margin - Section 1291 Interest Amount</xsl:with-param>
			  <xsl:with-param name="TargetNode" select="$Form1120Data/@section1291InterestAmt"/>
			  <xsl:with-param name="DescWidth" select="100"/>
			</xsl:call-template>
			<xsl:call-template name="PopulateLeftoverRow">
			  <xsl:with-param name="Desc">Form 1120, Top Left Margin - Section 1294 Interest Indicator</xsl:with-param>
			  <xsl:with-param name="TargetNode" select="$Form1120Data/@section1294InterestCd"/>
			  <xsl:with-param name="DescWidth" select="100"/>
			</xsl:call-template>
			<xsl:call-template name="PopulateLeftoverRowAmount">
			  <xsl:with-param name="Desc">Form 1120, Top Left Margin - Section 1294 Interest Amount</xsl:with-param>
			  <xsl:with-param name="TargetNode" select="$Form1120Data/@section1294InterestAmt"/>
			  <xsl:with-param name="DescWidth" select="100"/>
			</xsl:call-template>
			<xsl:call-template name="PopulateLeftoverRow">
			  <xsl:with-param name="Desc">Form 1120, Top Left Margin - Section 501d Indicator</xsl:with-param>
			  <xsl:with-param name="TargetNode" select="$Form1120Data/@section501dCd"/>
			  <xsl:with-param name="DescWidth" select="100"/>
			</xsl:call-template>
			<xsl:call-template name="PopulateLeftoverRow">
			  <xsl:with-param name="Desc">Form 1120, Top Left Margin - FILED PURSUANT TO SECTION 301.9100-2</xsl:with-param>
			  <xsl:with-param name="TargetNode" select="$Form1120Data/@filedPursuantToSect30191002Cd"/>
			  <xsl:with-param name="DescWidth" select="100"/>
			</xsl:call-template>
			<xsl:call-template name="PopulateLeftoverRow">
			  <xsl:with-param name="Desc">Form 1120, Top Left Margin - Short Period Reason 1120 1120F Indicator</xsl:with-param>
			  <xsl:with-param name="TargetNode" select="$Form1120Data/@shortPeriodReasonCd"/>
			  <xsl:with-param name="DescWidth" select="100"/>
			</xsl:call-template>
			<!-- not display -->
			<xsl:call-template name="PopulateLeftoverRow">
			  <xsl:with-param name="Desc">Form 1120, Top Left Margin - Subchapter T Cooperative Indicator</xsl:with-param>
			  <xsl:with-param name="TargetNode" select="$Form1120Data/@subchapterTCoopIndicator"/>
			  <xsl:with-param name="DescWidth" select="100"/>
			</xsl:call-template>
			<!-- not display -->
			<xsl:call-template name="PopulateLeftoverRow">
			  <xsl:with-param name="Desc">Form 1120, Top Left Margin - Support Statement to Consolidated Return Indicator</xsl:with-param>
			  <xsl:with-param name="TargetNode" select="$Form1120Data/@suprtStmtToCnsldtReturnInd"/>
			  <xsl:with-param name="DescWidth" select="100"/>
			</xsl:call-template>
			<!-- not display -->
			<xsl:call-template name="PopulateLeftoverRow">
			  <xsl:with-param name="Desc">Form 1120, Section A, Line 1a - Is Parent Return</xsl:with-param>
			  <xsl:with-param name="TargetNode" select="$Form1120Data/ParentReturnInd"/>
			  <xsl:with-param name="DescWidth" select="100"/>
			</xsl:call-template>
			<!-- not display -->
			<xsl:call-template name="PopulateLeftoverRow">
			  <xsl:with-param name="Desc">Form 1120, Section A, Line 1a - Is Subsidiary Return</xsl:with-param>
			  <xsl:with-param name="TargetNode" select="$Form1120Data/SubsidiaryReturnInd"/>
			  <xsl:with-param name="DescWidth" select="100"/>
			</xsl:call-template>
			<xsl:call-template name="PopulateLeftoverRow">
			  <xsl:with-param name="Desc">Form 1120, Page 1, Line 9 - Form 4684 Indicator</xsl:with-param>
			  <xsl:with-param name="TargetNode" select="$Form1120Data/TotalOrdinaryGainLossAmt/@form4684Cd"/>
			  <xsl:with-param name="DescWidth" select="100"/>
			</xsl:call-template>
			<xsl:call-template name="PopulateLeftoverRow">
			  <xsl:with-param name="Desc">Form 1120, Page 1, Line 10 - Other Income Item</xsl:with-param>
			  <xsl:with-param name="TargetNode" select="$Form1120Data/OtherIncomeAmt/@otherIncomeDesc"/>
			  <xsl:with-param name="DescWidth" select="100"/>
			</xsl:call-template>
			<xsl:call-template name="PopulateLeftoverRow">
			  <xsl:with-param name="Desc">Form 1120, Page 1, Line 30 - CCF Indicator</xsl:with-param>
			  <xsl:with-param name="TargetNode" select="$Form1120Data/TaxableIncomeAmt/@capitalConstructionFundCd"/>
			  <xsl:with-param name="DescWidth" select="100"/>
			</xsl:call-template>
			<xsl:call-template name="PopulateLeftoverRowAmount">
			  <xsl:with-param name="Desc">Form 1120, Page 1, Line 30 - CCF Amount</xsl:with-param>
			  <xsl:with-param name="TargetNode" select="$Form1120Data/TaxableIncomeAmt/@capitalConstructionFundAmt"/>
			  <xsl:with-param name="DescWidth" select="100"/>
			</xsl:call-template>
			<xsl:call-template name="PopulateLeftoverRow">
			  <xsl:with-param name="Desc">Form 1120, Page 2, Schedule J, Line 2 - Section 1291 Indicator</xsl:with-param>
			  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/IncomeTaxAmt/@section1291Cd"/>
			  <xsl:with-param name="DescWidth" select="100"/>
			</xsl:call-template>
			<xsl:call-template name="PopulateLeftoverRowAmount">
			  <xsl:with-param name="Desc">Form 1120, Page 2, Schedule J Line 2 - Section 1291 Amount</xsl:with-param>
			  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/IncomeTaxAmt/@section1291Amt"/>
			  <xsl:with-param name="DescWidth" select="100"/>
			</xsl:call-template>
			<xsl:call-template name="PopulateLeftoverRow">
			  <xsl:with-param name="Desc">Form 1120, Page 2, Schedule J Line 2 - Section 197 Indicator</xsl:with-param>
			  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/IncomeTaxAmt/@section197Cd"/>
			  <xsl:with-param name="DescWidth" select="100"/>
			</xsl:call-template>
			<xsl:call-template name="PopulateLeftoverRowAmount">
			  <xsl:with-param name="Desc">Form 1120, Page 2, Schedule J Line 2 - Section 197 Amount</xsl:with-param>
			  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/IncomeTaxAmt/@section197Amt"/>
			  <xsl:with-param name="DescWidth" select="100"/>
			</xsl:call-template>
			<xsl:call-template name="PopulateLeftoverRow">
			  <xsl:with-param name="Desc">Form 1120, Page 2, Schedule J, Line 5b - Form 5735 Indicator</xsl:with-param>
			  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/QlfyElecMotorVehCrAmt/@form5735Cd"/>
			  <xsl:with-param name="DescWidth" select="100"/>
			</xsl:call-template>
			<xsl:call-template name="PopulateLeftoverRowAmount">
			  <xsl:with-param name="Desc">Form 1120, Page 2, Schedule J, Line 5b - Form 5735 Amount </xsl:with-param>
			  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/QlfyElecMotorVehCrAmt/@form5735Amt"/>
			  <xsl:with-param name="DescWidth" select="100"/>
			</xsl:call-template>
			<xsl:call-template name="PopulateLeftoverRow">
			  <xsl:with-param name="Desc">Form 1120, Page 2, Schedule J, Part I, Line 9a - Section 1260B Indicator</xsl:with-param>
			  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/TotalIncreaseInTaxAmt/@section1260BCd"/>
			  <xsl:with-param name="DescWidth" select="100"/>
			</xsl:call-template>
			<xsl:call-template name="PopulateLeftoverRowAmount">
			  <xsl:with-param name="Desc">Form 1120, Page 2, Schedule J, Part I, Line 9a - Section 1260B Amount</xsl:with-param>
			  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/TotalIncreaseInTaxAmt/@section1260BAmt"/>
			  <xsl:with-param name="DescWidth" select="100"/>
			</xsl:call-template>
			<xsl:call-template name="PopulateLeftoverRow">
			  <xsl:with-param name="Desc">Form 1120, Page 2, Schedule J, Part I, Line 9b - Form 8693 Approved Indicator</xsl:with-param>
			  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/RecaptureTaxAmt/@form8693ApprovedCd"/>
			  <xsl:with-param name="DescWidth" select="100"/>
			</xsl:call-template>
			<xsl:call-template name="PopulateLeftoverRow">
			  <xsl:with-param name="Desc">Form 1120, Page 2, Schedule J, Part I, Line 9b - Form 8693 Approval Date</xsl:with-param>
			  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/RecaptureTaxAmt/@form8693ApprovedDt"/>
			  <xsl:with-param name="DescWidth" select="100"/>
			</xsl:call-template>
			<xsl:call-template name="PopulateLeftoverRow">
			  <xsl:with-param name="Desc">Form 1120, Page 2, Schedule J, Part II, Line 13 - Beneficiary Of Trust Indicator</xsl:with-param>
			  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/EstimatedTaxPaymentsAmt/@beneficiaryTrustCd"/>
			  <xsl:with-param name="DescWidth" select="100"/>
			</xsl:call-template>
			<xsl:call-template name="PopulateLeftoverRowAmount">
			  <xsl:with-param name="Desc">Form 1120, Page 2, Schedule J, Part II, Line 13 - Beneficiary Of Trust Amount</xsl:with-param>
			  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/EstimatedTaxPaymentsAmt/@beneficiaryTrustAmt"/>
			  <xsl:with-param name="DescWidth" select="100"/>
			</xsl:call-template>
			<xsl:call-template name="PopulateLeftoverRow">
			  <xsl:with-param name="Desc">Form 1120, Page 2, Schedule J, Part II, Line 13 - Form 8816 Indicator</xsl:with-param>
			  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/EstimatedTaxPaymentsAmt/@form8816Cd"/>
			  <xsl:with-param name="DescWidth" select="100"/>
			</xsl:call-template>
			<xsl:call-template name="PopulateLeftoverRowAmount">
			  <xsl:with-param name="Desc">Form 1120, Page 2, Schedule J, Part II, Line 13 - Form 8816 Amount</xsl:with-param>
			  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/EstimatedTaxPaymentsAmt/@form8816Amt"/>
			  <xsl:with-param name="DescWidth" select="100"/>
			</xsl:call-template>
			<xsl:call-template name="PopulateLeftoverRow">
			  <xsl:with-param name="Desc">Form 1120, Page 2, Schedule J, Part II, Line 13 - Section 847 Deduction Indicator</xsl:with-param>
			  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/EstimatedTaxPaymentsAmt/@section847DeductionCd"/>
			  <xsl:with-param name="DescWidth" select="100"/>
			</xsl:call-template>
			<xsl:call-template name="PopulateLeftoverRow">
			  <xsl:with-param name="Desc">Form 1120, Page 2, Schedule J, Part II, Line 19b - Ozone Depleting Chemicals IndIndicator</xsl:with-param>
			  <xsl:with-param name="TargetNode" select="$Form1120ScheduleJ/TotalFuelTaxCreditAmt/@ozoneDepletingChemicalCd"/>
			  <xsl:with-param name="DescWidth" select="100"/>
			</xsl:call-template>
			<br/>
			<br/>
			<br/>
			<xsl:call-template name="PopulateLeftoverRow">
			  <xsl:with-param name="Desc">Form 1120, Page 1, Line 32f - Other Refundable Credits Indicator</xsl:with-param>
			  <xsl:with-param name="TargetNode" select="$Form1120Data/TotalCreditAmt/@otherRefundableCreditsInd"/>
			  <xsl:with-param name="DescWidth" select="100"/>
			</xsl:call-template>
			<xsl:call-template name="PopulateLeftoverRowAmount">
			  <xsl:with-param name="Desc">Form 1120, Page 1, Line 32f - Other Refundable Credits Amount</xsl:with-param>
			  <xsl:with-param name="TargetNode" select="$Form1120Data/TotalCreditAmt/@otherRefundableCreditsAmount"/>
			  <xsl:with-param name="DescWidth" select="100"/>
			</xsl:call-template>
			<xsl:call-template name="PopulateLeftoverRow">
			  <xsl:with-param name="Desc">Form 1120, Page 1, Line 32h - Backup Withholding Indicator</xsl:with-param>
			  <xsl:with-param name="TargetNode" select="$Form1120Data/TotalPaymentsAmt/@backupWithholdingIndicator"/>
			  <xsl:with-param name="DescWidth" select="100"/>
			</xsl:call-template>
			<xsl:call-template name="PopulateLeftoverRowAmount">
			  <xsl:with-param name="Desc">Form 1120, Page 1, Line 32h - Backup Withholding Amount</xsl:with-param>
			  <xsl:with-param name="TargetNode" select="$Form1120Data/TotalPaymentsAmt/@backupWithholdingAmount"/>
			  <xsl:with-param name="DescWidth" select="100"/>
			</xsl:call-template>
			<xsl:call-template name="PopulateLeftoverRow">
			  <xsl:with-param name="Desc">Form 1120, Page 3, Schedule K Line 3 - Parent Corporation Name Control</xsl:with-param>
			  <xsl:with-param name="TargetNode" select="$Form1120ScheduleK/PrntCorporationNameControlTxt"/>
			  <xsl:with-param name="DescWidth" select="100"/>
			</xsl:call-template>
		  </table>
		  <br/>
		  <!--NOTE: SPECIAL CONDITION EXISTED ON 1120 NOT ON 1120E&A-->
		  <!--Special Condition Description -->
		  <div class="pageEnd"/>
		  <span class="styRepeatingDataTitle">Form 1120, Special Condition: </span>
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
				<xsl:for-each select="$Form1120Data/SpecialConditionDesc">
				  <tr style="border-color:black;height:6mm;">
					<xsl:attribute name="class">
					  <xsl:choose>
					    <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
					    <xsl:otherwise>styDepTblRow2</xsl:otherwise>
					  </xsl:choose>
					</xsl:attribute>
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
			<!--NOTE: SPECIAL CONDITION EXISTED ON 1120 NOT ON 1120E&A-->
			<!-- table 3 -->
			<div style="width:187mm;"/>
			<xsl:if test="($Print = $Separated) and (count($Form1120ScheduleK/CorpOwnPercentVotingStockInfo) &gt; 5)">
			  <span class="styRepeatingDataTitle">Form 1120, Schedule K, Line 5a -  Partnership, Corporation, or Trust owning 20% - 50% of the corporation's voting stock</span>
			  <table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
				<thead class="styTableThead">
				  <tr class="styDepTblHdr">
					<th class="styDepTblCell" scope="col" rowspan="2" style="width:121mm;">
					  <span style="font-weight:bold;">(i)</span> Name of Corporation
					</th>
					<th class="styDepTblCell" scope="col" rowspan="2" style="width:23mm;">
					  <span style="font-weight:bold;">(ii)</span> Employer Identification Number (if any)
					</th>
					<th class="styDepTblCell" scope="col" rowspan="2" style="width:23mm;">
					  <span style="font-weight:bold;">(iii)</span>Country of Incorporation
					</th>
					<th class="styDepTblCell" scope="col" rowspan="2" style="width:20mm;">
					  <span style="font-weight:bold;">(iv)</span> Percentage Owned in Voting Stock
					</th>
				  </tr>
				</thead>
				<tfoot/>
				<tbody>
				  <xsl:for-each select="$Form1120ScheduleK/CorpOwnPercentVotingStockInfo">
					<tr style="border-color:black;height:6mm;">
					  <xsl:attribute name="class">
					    <xsl:choose>
					      <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
					      <xsl:otherwise>styDepTblRow2</xsl:otherwise>
					    </xsl:choose>
					  </xsl:attribute>
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
						<xsl:if test="CorporationEIN !=' '">
						  <xsl:call-template name="PopulateEIN">
							<xsl:with-param name="TargetNode" select="CorporationEIN"/>
						  </xsl:call-template>
						  <span style="width:1px;"/>
						</xsl:if>
						<xsl:if test="MissingEINReasonCd !=' '">
						  <xsl:call-template name="PopulateEIN">
							<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
						  </xsl:call-template>
						  <span style="width:1px;"/>
						</xsl:if>
					  </td>
					  <td class="styTableCellCtr" style="width:23mm;">
						<xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="IncorporationCountryCd"/>
						</xsl:call-template>
						<span style="width:1px;"/>
					  </td>
					  <td class="styTableCell" style="width:20mm">
						<span style="width:1px;"/>
						<xsl:call-template name="PopulatePercent">
						  <xsl:with-param name="TargetNode" select="VotingStockOwnedPct"/>
						</xsl:call-template>
					  </td>
					</tr>
				  </xsl:for-each>
				</tbody>
			  </table>
			</xsl:if>
			<!-- table 4 -->
			<div style="width:187mm;"/>
			<xsl:if test="($Print = $Separated) and (count($Form1120ScheduleK/CorpOwnPercentPartnershipInfo) &gt; 5)">
			  <span class="styRepeatingDataTitle">Form 1120, Schedule K, Line 5b -  Corporation owning 20% -50% or more in foreign or domestic partnership</span>
			  <table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
				<thead class="styTableThead">
				  <tr class="styDepTblHdr">
					<th class="styDepTblCell" scope="col" rowspan="2" style="width:121mm;">
					  <span style="font-weight:bold;">(i)</span> Name of Entity
					</th>
					<th class="styDepTblCell" scope="col" rowspan="2" style="width:23mm;">
					  <span style="font-weight:bold;">(ii)</span> Employer Identification Number (if any)
					</th>
					<th class="styDepTblCell" scope="col" rowspan="2" style="width:23mm;">
					  <span style="font-weight:bold;">(iii)</span>Country of Organization
					</th>
					<th class="styDepTblCell" scope="col" rowspan="2" style="width:20mm;">
					  <span style="font-weight:bold;">(iv)</span> Maximum Percentage Owned in Profit, Loss, or Capital
					</th>
				  </tr>
				</thead>
				<tfoot/>
				<tbody>
				  <xsl:for-each select="$Form1120ScheduleK/CorpOwnPercentPartnershipInfo">
					<tr style="border-color:black;height:6mm;">
					  <xsl:attribute name="class">
					    <xsl:choose>
					      <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
					      <xsl:otherwise>styDepTblRow2</xsl:otherwise>
					    </xsl:choose>
					  </xsl:attribute>
					  <td class="styTableCellText" style="width:121mm;">
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
						<xsl:if test="EIN !=' '">
						  <xsl:call-template name="PopulateEIN">
							<xsl:with-param name="TargetNode" select="EIN"/>
						  </xsl:call-template>
						  <span style="width:1px;"/>
						</xsl:if>
						<xsl:if test="MissingEINReasonCd !=' '">
						  <xsl:call-template name="PopulateEIN">
							<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
						  </xsl:call-template>
						  <span style="width:1px;"/>
						</xsl:if>
					  </td>
					  <td class="styTableCellCtr" style="width:23mm;">
						<xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="OrganizationCountryCd"/>
						</xsl:call-template>
						<span style="width:1px;"/>
					  </td>
					  <td class="styTableCell" style="width:20mm">
					    <span style="width:1px;"/>
						<xsl:call-template name="PopulatePercent">
						  <xsl:with-param name="TargetNode" select="OwnedProfitLossCapMaximumPct"/>
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