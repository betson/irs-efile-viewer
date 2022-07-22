<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1120LEliminationsOrAdjStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form1120LEliminationsOrAdjData" select="$RtnDoc/IRS1120LEliminationsOrAdj"/>
	<xsl:param name="IRS1120LScheduleA" select="$RtnDoc/IRS1120LEliminationsOrAdj/IRS1120LScheduleA"/>
	<xsl:param name="IRS1120LScheduleB" select="$RtnDoc/IRS1120LEliminationsOrAdj/IRS1120LScheduleB"/>
	<xsl:param name="IRS1120LScheduleF" select="$RtnDoc/IRS1120LEliminationsOrAdj/IRS1120LScheduleF"/>
	<xsl:param name="IRS1120LScheduleG" select="$RtnDoc/IRS1120LEliminationsOrAdj/IRS1120LScheduleG"/>
	<xsl:param name="IRS1120LScheduleH" select="$RtnDoc/IRS1120LEliminationsOrAdj/IRS1120LScheduleH"/>
	<xsl:param name="IRS1120LScheduleI" select="$RtnDoc/IRS1120LEliminationsOrAdj/IRS1120LScheduleI"/>
	<xsl:param name="IRS1120LScheduleJ" select="$RtnDoc/IRS1120LEliminationsOrAdj/IRS1120LScheduleJ"/>
	<xsl:param name="IRS1120LScheduleK" select="$RtnDoc/IRS1120LEliminationsOrAdj/IRS1120LScheduleK"/>
	<xsl:param name="IRS1120LScheduleL" select="$RtnDoc/IRS1120LEliminationsOrAdj/IRS1120LScheduleL"/>
	<xsl:param name="IRS1120LScheduleM" select="$RtnDoc/IRS1120LEliminationsOrAdj/IRS1120LScheduleM"/>
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
						<xsl:with-param name="RootElement" select="local-name($Form1120LEliminationsOrAdjData)"/>
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
				<meta name="Description" content="IRS Form 1120L"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1120LEliminationsOrAdjStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form1120LEliminationsOrAdj">
	<!-- * Replace  $Form1120LDat a  with   $RtnDoc/IRS1120LEliminationsOrAdj ** -->
<xsl:call-template name="DocumentHeader"/>
<div class="styBB" style="width:187mm;">
<div class="styFNBox" style="width:33.3mm;height:17mm;">
                         Form <span class="styFormNumber" style="font-size:20pt">1120-L</span>
<br/>
<span class="styAgency">Department of the Treasury</span>
<br/>
<span class="styAgency">Internal Revenue Service</span>
<!-- puch pen  -->
<xsl:call-template name="SetFormLinkInline">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj"/>
</xsl:call-template>
<span style="width:1mm"/>
<xsl:call-template name="LinkToLeftoverDataTableInline">
<xsl:with-param name="Desc">Form 1120L, Top Left Margin - Supporting Statement to Consolidated Return</xsl:with-param>
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/@suprtStmtToCnsldtReturnInd"/>
</xsl:call-template>
</div>
<div class="styFTBox" style="width:120mm;height:16mm;">
<div class="styMainTitle" style="height:8mm;">U.S. Life Insurance Company Income Tax Return</div>
<div style="height:5mm;font-size:7pt;margin-left:2mm;text-align:center;">
        For calendar year 2011 or tax year beginning
        <span style="width: 18mm;border-bottom:1 solid black;">
<!-- No need to send the parameters -->
<xsl:call-template name="PopulateMonthDayYear">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/TaxYearBeginning"/>
</xsl:call-template>
</span>, ending 
            <span style="width: 18mm;border-bottom:1 solid black;">
<xsl:call-template name="PopulateMonthDayYear">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/TaxYearEnding"/>
</xsl:call-template>
</span>
<br/>
<span style="text-align:center;">
<img src="{$ImagePath}/1120_Bullet_Md.gif" alt="MediumBullet"/>
<b>See separate instructions.</b>
</span>
</div>
</div>
<div class="styTYBox" style="width:30mm;height:17mm;">
<div class="styOMB" style="height:2mm;">OMB No. 1545-0128</div>
<div class="styTY" style="height:11mm;">20<span class="styTYColor">11</span>
</div>
</div>
</div>
<!-- Header Line A 1 -->
<div style="width:187mm;float:left;clear:left;">
<div style="width:31mm;height:29mm;float:left;clear:left;">
<div class="styComType" style="width:33mm;border-bottom-width: 0px;">
<div class="styBoldText" style="height:3mm;width:4mm;float:left;clear:none;">A</div>
<div class="styGenericDiv" style="height:3mm;width:26mm;">Check if:</div>
</div>
<div class="styComType" style="width:33mm;border-bottom:0px;">
<div class="styBoldText" style="height:5mm;width:4mm;float:left;clear:none;">1</div>
<div class="styGenericDiv" style="height:5mm;width:26mm;">
<label>
<xsl:call-template name="PopulateLabel">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/IsConsolidatedReturn"/>
<xsl:with-param name="BackupName">IRS1120LIsConsolidatedReturn</xsl:with-param>
</xsl:call-template>Consolidated return (attach Form 851)
<!-- Form to Form Link -->
<xsl:call-template name="SetFormLinkInline">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/IsConsolidatedReturn"/>
</xsl:call-template>
</label>
</div>
<div class="styGenericDiv">
<input type="checkbox" class="styCkbox">
<xsl:call-template name="PopulateCheckbox">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/IsConsolidatedReturn"/>
<xsl:with-param name="BackupName">IRS1120LIsConsolidatedReturn</xsl:with-param>
</xsl:call-template>
</input>
</div>
</div>
<br/>
<br/>
<!-- Header Line A 2 -->
<div class="styComType" style="width:33mm;border-bottom:0px;">
<div class="styBoldText" style="height:5mm;width:4mm;float:left;clear:none;">2</div>
<div class="styGenericDiv" style="height:5mm;width:26mm;">
<label>
<xsl:call-template name="PopulateLabel">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/LifeNonlifeConsolidatedReturn"/>
<xsl:with-param name="BackupName">IRS1120LLifeNonlifeConsolidatedReturn</xsl:with-param>
</xsl:call-template>Life-nonlife consolidated return
</label>
</div>
<div class="styGenericDiv">
<input type="checkbox" class="styCkbox">
<xsl:call-template name="PopulateCheckbox">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/LifeNonlifeConsolidatedReturn"/>
<xsl:with-param name="BackupName">IRS1120LLifeNonlifeConsolidatedReturn</xsl:with-param>
</xsl:call-template>
</input>
</div>
</div>
<br/>
<br/>
<!-- Header Line A 3 -->
<div class="styComType" style="width:33mm;border-bottom:1 solid black;">
<div class="styBoldText" style="height:8.7mm;width:4mm;float:left;clear:none;">3</div>
<div class="styGenericDiv" style="height:8.7mm;width:26mm;">
<label>
<xsl:call-template name="PopulateLabel">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/ScheduleM3_1120L"/>
<xsl:with-param name="BackupName">IRS1120LScheduleM3Required</xsl:with-param>
</xsl:call-template>Schedule M-3 (Form 1120-L) attached
          <xsl:call-template name="SetFormLinkInline">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/ScheduleM3_1120L"/>
</xsl:call-template>
</label>
</div>
<div class="styGenericDiv">
<input type="checkbox" class="styCkbox">
<xsl:call-template name="PopulateCheckbox">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/ScheduleM3_1120L"/>
<xsl:with-param name="BackupName">IRS1120LScheduleM3Required</xsl:with-param>
</xsl:call-template>
</input>
</div>
</div>
</div>
<!-- return header Name box -->
<div class="styLblNameAddr" style="width:106mm;height:28mm;border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;">
<div class="styUseLbl" style="width:12mm;height:29.5mm;border-right-width:0px;padding-top:5mm;">
  Please<br/> print<br/> or<br/> type</div>
<div class="styNameAddr" style="width:92.5mm;height:8.5mm;border-left-width:1px;padding-left:3mm;">
Name<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/Name/BusinessNameLine1"/>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/Name/BusinessNameLine2"/>
</xsl:call-template>
</div>
<!-- return header Adress box -->
<div class="styNameAddr" style="width:92.5mm;height:9.5mm;border-left-width:1px;padding-left:3mm">
        Number, street, and room or suite no. If a P.O. box, see instructions.
    <!-- Address -->
<!-- USA Address -->
<br/>
<xsl:if test="  $RtnDoc/IRS1120LEliminationsOrAdj/USAddress/AddressLine1!=''">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/USAddress/AddressLine1"/>
</xsl:call-template>
<br/>
</xsl:if>
<xsl:if test="  $RtnDoc/IRS1120LEliminationsOrAdj/USAddress/AddressLine1!=''">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/USAddress/AddressLine2"/>
</xsl:call-template>
<br/>
</xsl:if>
<!-- Foreign Address -->
<xsl:if test="  $RtnDoc/IRS1120LEliminationsOrAdj/ForeignAddress/AddressLine1!=''">
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/ForeignAddress/AddressLine1"/>
</xsl:call-template>
<span class="styTableCellPad"/>
</xsl:if>
<xsl:if test="  $RtnDoc/IRS1120LEliminationsOrAdj/ForeignAddress/AddressLine2!=''">
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/ForeignAddress/AddressLine2"/>
</xsl:call-template>
<span class="styTableCellPad"/>
</xsl:if>
</div>
<div class="styNameAddr" style="border-bottom-width:0px;width:91mm;height:11mm;
           border-left-width:1px;padding-left:3mm">
        City or town, state, and ZIP code
<!-- USA Address -->
<xsl:if test="  $RtnDoc/IRS1120LEliminationsOrAdj/USAddress/City!=''">
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/USAddress/City"/>
</xsl:call-template>
<span class="styTableCellPad"/>
</xsl:if>
<xsl:if test="  $RtnDoc/IRS1120LEliminationsOrAdj/USAddress/State!=''">
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/USAddress/State"/>
</xsl:call-template>
<span class="styTableCellPad"/>
</xsl:if>
<xsl:if test="  $RtnDoc/IRS1120LEliminationsOrAdj/USAddress/ZIPCode!=''">
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/USAddress/ZIPCode"/>
</xsl:call-template>
<span class="styTableCellPad"/>
</xsl:if>
<!-- Foreign Address -->
<xsl:if test="  $RtnDoc/IRS1120LEliminationsOrAdj/ForeignAddress/City!=''">
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/ForeignAddress/City"/>
</xsl:call-template>
<span class="styTableCellPad"/>
</xsl:if>
<xsl:if test="  $RtnDoc/IRS1120LEliminationsOrAdj/ForeignAddress/ProvinceOrState!=''">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/ForeignAddress/ProvinceOrState"/>
</xsl:call-template>
<span class="styTableCellPad"/>
</xsl:if>
<xsl:if test="  $RtnDoc/IRS1120LEliminationsOrAdj/ForeignAddress/PostalCode!=''">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/ForeignAddress/PostalCode"/>
</xsl:call-template>
<span class="styTableCellPad"/>
</xsl:if>
<xsl:if test="  $RtnDoc/IRS1120LEliminationsOrAdj/ForeignAddress/Country!=''">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/ForeignAddress/Country"/>
</xsl:call-template>
<span class="styTableCellPad"/>
</xsl:if>
</div>
</div>
<!-- EIN B Line -->
<!-- Since this is a main form, we must check for and display an updated EIN.  
    To do this, we use the EINChanged parameter PopulateReturnHeaderFiler.-->
<div class="styEINDateAssets" style="width:48mm;height:8.5mm;">
<span class="styBoldText">B Employer identification number</span>
<br/>
<br/>
<span style="padding-left:15mm">
<xsl:if test="  $RtnDoc/IRS1120LEliminationsOrAdj/CorporationEIN !=' '">
<xsl:call-template name="PopulateEIN">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/CorporationEIN"/>
</xsl:call-template>
<span style="width: 2px"/>
</xsl:if>
<xsl:if test="  $RtnDoc/IRS1120LEliminationsOrAdj/MissingEINReason !=' '">
<span style="font-weight:normal;">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/MissingEINReason"/>
</xsl:call-template>
</span>
</xsl:if>
</span>
</div>
<!-- Header C Date incorparated -->
<div class="styEINDateAssets" style="width:48mm;height:9.5mm;">
<span class="styBoldText">C </span>Date incorporated<br/>
<br/>
<span class="styEINFld" style="padding-left:15mm;">
<xsl:call-template name="PopulateMonthDayYear">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/DateIncorporated"/>
</xsl:call-template>
</span>
</div>
<!-- Header D Date incorparated -->
<div class="styEINDateAssets" style="width:48mm;height:8.75mm;border-bottom-width:0px;">
<span class="styBoldText">D </span>Check applicable box if an election <br/>
<span style="padding-left:2.5mm">  has been made under section(s):</span>
<xsl:call-template name="LinkToLeftoverDataTableInline">
<xsl:with-param name="Desc">Line D - Section953D Indicator</xsl:with-param>
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/ElectionMadeUnderSection953D/@Section953DIndicator"/>
<xsl:with-param name="Style">padding-left:4mm;</xsl:with-param>
</xsl:call-template>
<xsl:call-template name="LinkToLeftoverDataTableInline">
<xsl:with-param name="Desc">Line D - Section953D Amount</xsl:with-param>
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/ElectionMadeUnderSection953D/@Section953DAmount"/>
<xsl:with-param name="Style">padding-left:4mm;</xsl:with-param>
</xsl:call-template>
</div>
</div>
<!-- Header E -->
<div class="styBB" style="width:187mm;border-right-width:0px">
<div class="styBB" style="border-right-width:1px;border-bottom-width:0px;">
<!-- E 1 -->
<div class="styGenericDiv" style="width:139mm;">
<div class="styBoldText" style="float:left;clear:none">E</div>
      Check if: <span style="width:3mm;"/>
<span class="styBoldText">(1)</span>
<span style="width:3px;"/>
<input type="checkbox" class="styCkbox">
<xsl:call-template name="PopulateCheckbox">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/InitialReturn"/>
<xsl:with-param name="BackupName">IRS1120LInitialReturn</xsl:with-param>
</xsl:call-template>
</input>
<label>
<xsl:call-template name="PopulateLabel">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/InitialReturn"/>
<xsl:with-param name="BackupName">IRS1120LInitialReturn</xsl:with-param>
</xsl:call-template>Final return
      </label>
<!-- E 2 -->
<span style="width:8px"/>
<span class="styBoldText">(2)</span>
<span style="width:3px;"/>
<input type="checkbox" class="styCkbox">
<xsl:call-template name="PopulateCheckbox">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/FinalReturn"/>
<xsl:with-param name="BackupName">IRS1120LFinalReturn</xsl:with-param>
</xsl:call-template>
</input>
<label>
<xsl:call-template name="PopulateLabel">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/FinalReturn"/>
<xsl:with-param name="BackupName">IRS1120LFinalReturn</xsl:with-param>
</xsl:call-template>Name change
      </label>
<!-- E 3 -->
<span style="width:8px"/>
<span class="styBoldText">(3)</span>
<span style="width:3px;"/>
<input type="checkbox" class="styCkbox">
<xsl:call-template name="PopulateCheckbox">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/AddressChange"/>
<xsl:with-param name="BackupName">IRS1120LAddressChange</xsl:with-param>
</xsl:call-template>
</input>
<label>
<xsl:call-template name="PopulateLabel">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/AddressChange"/>
<xsl:with-param name="BackupName">IRS1120LAddressChange</xsl:with-param>
</xsl:call-template>Address change
      </label>
<!--E 4 -->
<span style="width:8px"/>
<span class="styBoldText">(4)</span>
<span style="width:3px;"/>
<input type="checkbox" class="styCkbox">
<xsl:call-template name="PopulateCheckbox">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/AmendedReturn"/>
<xsl:with-param name="BackupName">IRS1120LAmendedReturn</xsl:with-param>
</xsl:call-template>
</input>
<label>
<xsl:call-template name="PopulateLabel">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/AmendedReturn"/>
<xsl:with-param name="BackupName">IRS1120LAmendedReturn</xsl:with-param>
</xsl:call-template>Amended return  <span style="width:2px;hight:1mm"/>
</label>
</div>
</div>
<span style="padding-left:3mm"/>
<input type="checkbox" class="styCkbox">
<xsl:call-template name="PopulateCheckbox">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/ElectionMadeUnderSection953C3C"/>
<xsl:with-param name="BackupName">IRS1120LElectionMadeUnderSection953C3C</xsl:with-param>
</xsl:call-template>
</input>
<label>
<xsl:call-template name="PopulateLabel">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/ElectionMadeUnderSection953C3C"/>
<xsl:with-param name="BackupName">IRS1120LElectionMadeUnderSection953C3C</xsl:with-param>
</xsl:call-template>
 953(c)(3)(C)
 </label>
<span style="padding-left:2mm"/>
<input type="checkbox" class="styCkbox">
<xsl:call-template name="PopulateCheckbox">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/ElectionMadeUnderSection953D"/>
<xsl:with-param name="BackupName">IRS1120LElectionMadeUnderSection953D</xsl:with-param>
</xsl:call-template>
</input>
<label>
<xsl:call-template name="PopulateLabel">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/ElectionMadeUnderSection953D"/>
<xsl:with-param name="BackupName">IRS1120LElectionMadeUnderSection953D</xsl:with-param>
</xsl:call-template>953(d)
      </label>
<xsl:call-template name="SetFormLinkInline">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/ElectionMadeUnderSection953D"/>
</xsl:call-template>
</div>
<!--BEGIN Main Form 46 Section-->
<div class="styBB" style="width:187mm;">
<div class="styIRS1120VTImageBox" style="height:36mm;padding-top:14mm;">
<img src="{$ImagePath}/1120_Income.gif" alt="VerticalIncome"/>
</div>
<div style="width:000mm;float:right;clear:none;">
</div>
<!-- line 1 -->
<div class="styLNLeftNumBox" style="height:4mm;padding-left: 3.5mm">1</div>
<div class="styLNDesc" style="height:4mm;width:133mm;padding-left:1mm">
   Gross premiums, etc., less return premiums, etc. Enter balance
<!--Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">..........</span>
</div>
<div class="styLNRightNumBox" style="height:4mm;">1</div>
<div class="styLNAmountBox" style="height:4mm;width:32.9mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/GrossPremiumsBalance"/>
</xsl:call-template>
</div>
<!-- line 2 -->
<div style="width:181mm;float:right;clear:none;">
<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">2</div>
<div class="styLNDesc" style="width:132mm;height:4mm;">Net decrease, if any, in reserves (see instructions)
<!--Dotted Line-->
 <span style="letter-spacing:4mm;font-weight:bold">..............</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">2</div>
<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/NetDecreaseInReserves"/>
</xsl:call-template>
</div>
</div>
<!-- line3 -->
<div style="width:181mm;float:right;clear:none;">
<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">3</div>
<div class="styLNDesc" style="width:132mm;height:4mm;">
      10% of any decrease in reserves under section 807(f)(1)(B)(ii)
<!--Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">..........</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">3</div>
<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/PercentDecreaseSection807"/>
</xsl:call-template>
</div>
</div>
<!-- line 4 -->
<div style="width:181mm;float:right;clear:none;">
<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">4</div>
<div class="styLNDesc" style="width:132mm;height:4mm;">
      Investment income (Schedule B, line 8) (see instructions)
<!--Dotted Line-->
    <span style="letter-spacing:4mm;font-weight:bold">............</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">4</div>
<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/InvestmentIncome"/>
</xsl:call-template>
</div>
</div>
<!-- line 5 -->
<div style="width:181mm;float:right;clear:none;">
<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">5</div>
<div class="styLNDesc" style="width:132mm;height:4mm;">Net capital gain (Schedule D (Form 1120), line 13)
<!--Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">..............</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">5</div>
<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/CapitalGainNetIncome"/>
</xsl:call-template>
</div>
</div>
<!-- line 6 -->
<div style="width:181mm;float:right;clear:none;">
<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">6</div>
<div class="styLNDesc" style="width:132mm;height:4mm;">
Income from a special loss discount account (attach Form 8816)
<xsl:call-template name="SetFormLinkInline">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/IncmFromSpecialLossDscntAcct"/>
</xsl:call-template>
<!--Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">.........</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">6</div>
<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/IncmFromSpecialLossDscntAcct"/>
</xsl:call-template>
</div>
</div>
<!-- line 7 -->
<div style="width:181mm;float:right;clear:none;">
<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">7</div>
<div class="styLNDesc" style="width:132mm;height:4mm;">Other income (attach schedule)
<span style="width:2px;"/>
<!-- Form to Form Link -->
<xsl:call-template name="SetFormLinkInline">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/OtherIncome"/>
</xsl:call-template>
<xsl:call-template name="LinkToLeftoverDataTableInline">
<xsl:with-param name="Desc">Line 7 - other Income Item</xsl:with-param>
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/OtherIncome/@otherIncomeItem"/>
<xsl:with-param name="Style">padding-left:4mm;</xsl:with-param>
</xsl:call-template>
<!--Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">.................</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">7</div>
<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/OtherIncome"/>
</xsl:call-template>
</div>
</div>
<!-- line 8 -->
<div style="width:181mm;float:right;clear:none;">
<div class="styLNLeftNumBox" style="height:5mm;padding-left: 2.25mm">8</div>
<div class="styLNDesc" style="width:132mm;height:4mm;">
      Life insurance company gross income. Add lines 1 through 7
<span style="width:2px;"/>
<!--Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">...........</span>
</div>
<div class="styLNRightNumBox" style="height:5mm;border-bottom-width:0px">8</div>
<div class="styLNAmountBox" style="height:5mm;border-bottom-width:0px;width:32.9mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/LifeInsuranceGrossIncome"/>
</xsl:call-template>
</div>
</div>
</div>
<!--END Main Form Income Section-->
<!--BEGIN Main Form Deduction Section-->
<div class="styBB" style="width:187mm;">
<div class="styIRS1120VTImageBox" style="height:94mm;padding-top:15mm;">
<img src="{$ImagePath}/1120_Deductions.gif" alt="VertDeductions"/>
</div>
<!-- line 9 -->
<div style="width:181mm;float:right;clear:none;">
<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.5mm">9</div>
<div class="styLNDesc" style="width:132mm;height:4mm;">Death benefits, etc.
<!--Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">......................</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">9</div>
<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/DeathBenefits"/>
</xsl:call-template>
</div>
</div>
<!-- line 10 -->
<div style="width:181mm;float:right;clear:none;">
<div class="styLNLeftNumBox" style="height:4mm;">10</div>
<div class="styLNDesc" style="width:132mm;height:4mm;">
 Net increase, if any, in reserves (Schedule F, line 35)
<!--Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">.............</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">10</div>
<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/NetIncreaseInReserves"/>
</xsl:call-template>
</div>
</div>
<!-- line 11 -->
<div style="width:181mm;float:right;clear:none;">
<div class="styLNLeftNumBox" style="height:4mm;">11</div>
<div class="styLNDesc" style="width:132mm;height:4mm;">
10% of any increase in reserves under section 807(f)(1)(B)(i)
 <!--Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">...........</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">11</div>
<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/PercentIncreaseUnderSection807"/>
</xsl:call-template>
</div>
</div>
<!-- line 12 -->
<div style="width:181mm;float:right;clear:none;">
<div class="styLNLeftNumBox" style="height:4mm;">12</div>
<div class="styLNDesc" style="width:132mm;height:4mm;">
Deductible policyholder dividends (Schedule F, line 18e)
<span style="width:2px;"/>
<!--Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">............</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">12</div>
<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/DeductiblePolicyholderDiv"/>
</xsl:call-template>
</div>
</div>
<!-- line 13 -->
<div style="width:181mm;float:right;clear:none;">
<div class="styLNLeftNumBox" style="height:4mm;">13</div>
<div class="styLNDesc" style="width:132mm;height:4mm;">
Assumption by another person of liabilities under insurance, etc., contracts
<span style="width:2px;"/>
<!--Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">.......</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">13</div>
<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/AssumptionOfLiabilities"/>
</xsl:call-template>
</div>
</div>
<!-- line 14 -->
<div style="width:181mm;float:right;clear:none;">
<div class="styLNLeftNumBox" style="height:4mm;">14</div>
<div class="styLNDesc" style="width:132mm;height:4mm;">Dividends reimbursable by taxpayer
<!--Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">..................</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">14</div>
<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/ReimbursableDividends"/>
</xsl:call-template>
</div>
</div>
<!-- line 15a -->
<div style="width:181mm;float:right;clear:none;">
<div class="styLNLeftNumBox" style="height:4mm;">15a</div>
<div class="styLNDesc" style="width:18mm;height:4mm;">Interest
<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
<xsl:call-template name="SetFormLinkInline">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/InterestDeductions"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="width:30mm;height:4.5mm;border-top-width:1px; border-bottom-width:1px; 
      border-left-width:1px; border-right-width: 1px;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/InterestDeductions"/>
</xsl:call-template>
</div>
<!-- line 15b -->
<div class="styLNLeftNumBox" style="height:4mm;width:5.3mm;">b</div>
<div class="styLNDesc" style="width:46mm;height:4mm;">Less tax-exempt interest expense
 </div>
<div class="styLNAmountBox" style="width:30mm;height:4.5mm;border-top-width:1px;border-bottom-width:1px;border-left-width:1px; border-right-width: 1px;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/TaxExemptInterestExpense"/>
</xsl:call-template>
</div>
<!-- line 15c -->
<div class="styLNLeftNumBox" style="height:4mm;padding-left:1.8mm;width:.2mm;
 font-weight:bold;">
<span style="font-weight=normal"/>
<span style="padding-left:1mm"/>
</div>
<div class="styLNRightNumBox" style="height:5mm;border-bottom-width:0px"/>
<div class="styLNAmountBox" style="height:5mm;width:32.9mm;border-bottom-width:0px"/>
</div>
<!-- ************************************************************************************************** -->
<!-- line 15a -->
<div style="width:181mm;float:right;clear:none;">
<!-- line 15c -->
<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm;width:140mm;
  font-weight:bold;padding-left:4mm">c <span style="font-weight=normal;padding-left:2mm">Bal</span>
<span style="padding-left:1mm"/>
<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
<!--Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">..........................</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">15c</div>
<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/InterestBalance"/>
</xsl:call-template>
</div>
</div>
<!-- ************************************************************************************************** -->
<!-- line 16 -->
<div style="width:181mm;float:right;clear:none;">
<div class="styLNLeftNumBox" style="height:4mm;">16</div>
<div class="styLNDesc" style="width:132mm;height:4mm;">
  Deductible policy acquisition expenses (Schedule G, line 20)
<span style="width:2px;"/>
<!--Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">...........</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">16</div>
<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/DeductibleAcquisitionExpenses"/>
</xsl:call-template>
</div>
</div>
<!-- line 17 -->
<div style="width:181mm;float:right;clear:none;">
<div class="styLNLeftNumBox" style="height:4mm;">17</div>
<div class="styLNDesc" style="width:132mm;height:4mm;">
      Additional deduction (attach Form 8816)
        <span style="width:2px;"/>
<!-- Form to Form Link-->
<xsl:call-template name="SetFormLinkInline">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/AdditionalDeduction"/>
</xsl:call-template>
<!--Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">................</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">17</div>
<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/AdditionalDeduction"/>
</xsl:call-template>
</div>
</div>
<!-- line 18 -->
<div style="width:181mm;float:right;clear:none;">
<div class="styLNLeftNumBox" style="height:4mm;">18</div>
<div class="styLNDesc" style="width:132mm;height:4mm;">
     Other deductions (see instructions) (attach schedule)
        <span style="width:2px;"/>
<!-- Form to Form Link -->
<xsl:call-template name="SetFormLinkInline">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/OtherDeductions"/>
</xsl:call-template>
<!--Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">............</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">18</div>
<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/OtherDeductions"/>
</xsl:call-template>
</div>
</div>
<!-- line 19 -->
<div style="width:181mm;float:right;clear:none;">
<div class="styLNLeftNumBox" style="height:4mm;">19</div>
<div class="styLNDesc" style="width:132mm;height:4mm;">
 Add lines 9 through 18
 <span style="width:2px;"/>
<!--Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">.....................</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">19</div>
<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/PartialTotalDeductions"/>
</xsl:call-template>
</div>
</div>
<!-- line 20 -->
<div style="width:181mm;float:right;clear:none;">
<div class="styLNLeftNumBox" style="height:4mm;">20</div>
<div class="styLNDesc" style="width:132mm;height:4mm;">
<span class="styBoldText">Subtotal.</span>  Subtract line 19 from line 8
 <span style="width:2px;"/>
<!--Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">.................</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">20</div>
<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/SubtotalOfDeductions"/>
</xsl:call-template>
</div>
</div>
<!-- line 21a -->
<div style="width:181mm;float:right;clear:none;">
<div class="styLNLeftNumBox" style="height:4.5mm;">21a</div>
<div class="styLNDesc" style="width:91mm;height:4.5mm;">
  Dividends-received deduction (Schedule A, line 16, column (c))
<span style="width:2px;"/>
<!--Dotted Line-->
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">21a</div>
<div class="styLNAmountBox" style="height:4.5mm;width:33mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/DividendsReceivedDeduction"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm;border-bottom-width:0px"/>
</div>
<!-- line 21b -->
<div style="width:181mm;float:right;clear:none;">
<div class="styLNLeftLtrBox" style="height:8mm;">
<span style="width:4px;"/>
</div>
<div class="styLNDesc" style="width:91mm;height:8mm;">
<b>Plus: b </b>Operations loss deduction (see instructions) (attach schedule)
<!-- Form to Form Link  -->
<xsl:call-template name="SetFormLinkInline">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/NetOperatingLossDeduction"/>
</xsl:call-template>
<span style="letter-spacing:4mm;font-weight:bold">...............</span>
</div>
<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">21b</div>
<div class="styLNAmountBox" style="border-bottom-width:1px;height:8mm;width:33mm;padding-top:4mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/NetOperatingLossDeduction"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">21c</div>
<div class="styLNAmountBox" style="border-bottom-width:1px;height:8mm;width:32.9mm;padding-top:4mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/TotalDividendsRcvdAndOprLoss"/>
</xsl:call-template>
</div>
</div>
<!-- line 22 -->
<div style="width:181mm;float:right;clear:none;">
<div class="styLNLeftNumBox" style="height:4mm;">22</div>
<div class="styLNDesc" style="width:132mm;height:4mm;">
 Gain or (loss) from operations. Subtract line 21c from line 20
<!--Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">...........</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">22</div>
<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/GainOrLossFromOperations"/>
</xsl:call-template>
</div>
</div>
<!-- line 23 -->
<div style="width:181mm;float:right;clear:none;">
<div class="styLNLeftNumBox" style="height:4mm;">23</div>
<div class="styLNDesc" style="width:132mm;height:4mm;">
Small life insurance company deduction (Schedule H, line 17)
<!--Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">...........</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">23</div>
<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/SmallLifeInsCompanyDeduction"/>
</xsl:call-template>
</div>
</div>
<!-- line 24 -->
<div style="width:181mm;float:right;clear:none;">
<div class="styLNLeftNumBox" style="height:4mm;">24</div>
<div class="styLNDesc" style="width:132mm;height:4mm;">
Life insurance company taxable income (LICTI). Subtract line 23 from line 22
<!--Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">......</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">24</div>
<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/LICTI"/>
</xsl:call-template>
</div>
</div>
<!-- line 25 -->
<div style="width:181mm;float:right;clear:none;">
<div class="styLNLeftNumBox" style="height:4mm;">25</div>
<div class="styLNDesc" style="width:132mm;height:4mm;">
Limitation on noninsurance losses (Schedule I, line 9)
<!--Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">.............</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">25</div>
<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/LimitationOnNoninsuranceLosses"/>
</xsl:call-template>
</div>
</div>
<!--line 26 -->
<div style="width:181mm;float:right;clear:none;">
<div class="styLNLeftNumBox" style="height:4mm;">26</div>
<div class="styLNDesc" style="width:132mm;height:4mm;">
Amount subtracted from policyholders surplus account (Schedule J, Part II, line 10)
<!--Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">.....</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px">26</div>
<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;width:32.9mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/SurplusAccountDeduction"/>
</xsl:call-template>
</div>
</div>
</div>
<!--END Main Form Deductions Section-->
<!--BEGIN Main Form Tax and Payment Section-->
<div class="styBB" style="width:187mm;">
<div class="styIRS1120VTImageBox" style="height:92mm;padding-top:17mm;">
<img src="{$ImagePath}/1120_TaxAndPayment.gif" alt="VertTaxAndPayments"/>
</div>
<!-- line 27 -->
<div style="width:181mm;float:right;clear:none;">
<div class="styLNLeftNumBox" style="height:4mm;">27</div>
<div class="styLNDesc" style="width:132mm;height:4mm;">
<span class="styBoldText">Taxable income.</span>
Add lines 24, 25, and 26 (see instructions)
<!--Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">...........</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">27</div>
<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/TaxableIncome"/>
</xsl:call-template>
</div>
</div>
<!-- line 28 -->
<div style="width:181mm;float:right;clear:none;">
<div class="styLNLeftNumBox" style="height:4mm;">28</div>
<div class="styLNDesc" style="width:132mm;height:4mm;">
<span class="styBoldText">Total tax.</span>
(Schedule K, line 10)
<!--Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">...................</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">28</div>
<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/TotalTax"/>
</xsl:call-template>
</div>
</div>
<!-- line 29a -->
<div style="width:181mm;float:right;clear:none;">
<div class="styLNLeftNumBox" style="height:7mm;">29a</div>
<div class="styLNDesc" style="width:56mm;height:7mm;font-size:7pt;">
   2010 overpayment credited to 2011
</div>
<div class="styLNRightNumBox" style="height:7mm;padding-top:3mm;">29a</div>
<div class="styLNAmountBox" style="width:28mm;height:7mm;padding-top:3mm;border-right-width:1px;font-size:6pt;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/PriorYearOverpaymentCredit"/>
</xsl:call-template>
</div>
<div class="styShadingCell" style="width:40mm;height:7mm;border-left-width:0px;"/>
<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:7mm;"/>
<div class="styLNAmountBoxNBB" style="height:7mm;"/>
</div>
<!-- line 29b -->
<div style="width:181mm;float:right;clear:none;">
<div class="styLNLeftLtrBox" style="height:8.5mm;">b</div>
<div class="styLNDesc" style="width:56mm;height:8.5mm;font-size:7pt;">
 Prior year(s) special estimated tax payments to be applied
<span style="width:2px;"/>
<span style="letter-spacing:4mm;font-weight:bold">.....</span>
</div>
<div class="styLNRightNumBox" style="height:8.5mm;padding-top:4.5mm;">29b</div>
<div class="styLNAmountBox" style="height:8.5mm;border-right-width:1px;width:28mm;font-size:6pt;padding-top:4.5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/PriorYearEstimatedTaxPayments"/>
</xsl:call-template>
</div>
<div class="styShadingCell" style="width:40mm;height:8.5mm;border-left-width:0px;"/>
<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8.5mm;"/>
<div class="styLNAmountBoxNBB" style="height:8.5mm;"/>
</div>
<!-- line 29c -->
<div style="width:181mm;float:right;clear:none;">
<div class="styLNLeftLtrBox" style="height:8.5mm;">c</div>
<div class="styLNDesc" style="width:56mm;height:8.5mm;font-size:7pt;">
 2011 estimated tax payments
 <span style="width:2px;"/>
<span style="letter-spacing:4mm;font-weight:bold">...</span>
</div>
<div class="styLNRightNumBox" style="height:8.5mm;padding-top:4.5mm;">29c</div>
<div class="styLNAmountBox" style="height:8.5mm;border-right-width:1px;width:28mm;
      font-size:6pt;padding-top:4.5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/EstimatedTaxPayments"/>
</xsl:call-template>
</div>
<div class="styShadingCell" style="width:40mm;height:8.5mm;border-left-width:0px;"/>
<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8.5mm;"/>
<div class="styLNAmountBoxNBB" style="height:8.5mm;"/>
</div>
<!-- line 29d -->
<div style="width:181mm;float:right;clear:none;">
<div class="styLNLeftLtrBox" style="height:4.5mm;">d</div>
<div class="styLNDesc" style="width:92mm;height:4.5mm;">
   2011 special estimated tax payments<i> (Do not include on line 29f)</i>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">29d</div>
<div class="styLNAmountBox" style="height:4.5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/SpecialEstimatedTaxPayments"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"/>
<div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
</div>
<!-- line 29e -->
<div style="width:181mm;float:right;clear:none;">
<div class="styLNLeftLtrBox">e</div>
<div class="styLNDesc" style="width:56mm;font-size:7pt;">
    Less 2011 refund applied for on Form 4466
<span style="width:2px;"/>
</div>
<div class="styLNRightNumBox" style="width:8mm;height:4mm;padding-top:4mm">29e</div>
<div class="styLNAmountBox" style="border-right-width:0px;width:28mm;
font-size:6pt;height:8mm;padding-top:4mm">(
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/RefundAppliedFor29e"/>
</xsl:call-template>)</div>
<!-- line 29f -->
<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">29f</div>
<div class="styLNAmountBox" style="width:32.2mm;height:8mm;border-right-width:1px;padding-top:4mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/SumOfLines29aThrough29cLess29e"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBoxNBB" style="border-bottom-width: 0px;border-right-width: 1px;border-left-width: 0px;background-color:lightgrey;height:8mm;"/>
</div>
<!-- line 29g -->
<div style="width:181mm;float:right;clear:none;">
<div class="styLNLeftLtrBox" style="height:5mm;">g</div>
<div class="styLNDesc" style="width:92mm;height:5mm;">
 Tax deposited with Form 7004
<span style="letter-spacing:4mm;font-weight:bold">...........</span> 
</div>
<div class="styLNRightNumBox" style="height:6mm;">29g</div>
<div class="styLNAmountBox" style="height:6mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/TaxDepositedWithForm7004"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:6mm;"/>
<div class="styLNAmountBoxNBB" style="height:6mm;"/>
</div>
<!-- line 29h 1-->
<div style="width:181mm;float:right;clear:none;">
<div class="styLNLeftLtrBox" style="height:4.5mm;">h</div>
<div class="styLNDesc" style="width:38mm;height:4.5mm;">
Credits <span style="width:7.3mm;"/>
<span style="font-weight:bold">(1)</span> Form 2439 
</div>
<div class="styUnderlineAmount">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/UndistributedCapitalGainsCr"/>
</xsl:call-template>
</div>
<div class="styGenericDiv" style="width:22mm;">
<xsl:call-template name="LinkToLeftoverDataTableInline">
<xsl:with-param name="Desc">Line 32f(1) - Backup Withholding Amount</xsl:with-param>
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/UndistributedCapitalGainsCr/@backupWithholdingAmount"/>
<xsl:with-param name="Style">padding-left:2mm;</xsl:with-param>
</xsl:call-template >
</div>
<!-- line 29h 2-->
<div class="styLNRightNumBoxNBB" style="height:4.5mm;width:8.1mm;border-right: 1 solid black"/>
<div class="styGenericDiv" style="width:31.7mm;height:4.5mm;"/>
<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"/>
<div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
<div style="width:181mm;float:right;clear:none;height:4.5mm;">
<div class="styGenericDiv" style="width:26mm;"/>
<div class="styLNDesc" style="width:20.4mm;height:4.5mm;">
<span style="font-weight:bold;">(2)</span> Form 4136
</div>
<div class="styUnderlineAmount">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/CreditForFederalTaxOnFuels"/>
</xsl:call-template>
</div>
<div class="styGenericDiv" style="height:6mm;font-weight:bold;width:21.6mm;">
</div>
<div class="styLNRightNumBox" style="height:6mm;padding-top:4mm">29h</div>
<div class="styLNAmountBox" style="height:6mm;">
<span style="padding-right:1mm">
<xsl:call-template name="LinkToLeftoverDataTableInline">
<xsl:with-param name="Desc">Line 29H - Ozone Depleting Chemical Indicator
</xsl:with-param>
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/Form2439And4136Credits/@ODCIndicator"/>
</xsl:call-template>
</span><br/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/Form2439And4136Credits"/>
</xsl:call-template>
<span style="width:1mm;"/>
</div>
<div class="styLNRightNumBox" style="height:8mm;background-color:lightgrey;border-bottom-width: 0px"/>
<div class="styLNAmountBox" style="height:8mm; border-bottom-width: 0px"/>
</div>
</div>
<!-- line 29i -->
<div style="width:181mm;float:right;clear:none;">
<div class="styLNLeftLtrBox" style="height:5mm;">i</div>
<div class="styLNDesc" style="width:92mm;height:5mm;">
 U.S. income tax paid or withheld at source (attach Form 1042-S)
<xsl:call-template name="SetFormLinkInline">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/USIncomeTaxPaidOrWithheld29i"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBox" style="height:5mm;">29i</div>
<div class="styLNAmountBox" style="height:5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/USIncomeTaxPaidOrWithheld29i"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBoxNBB" style="height:5mm;border-bottom-width:1px;
background-color:lightgrey;border-top-width:0px"/>
<div class="styLNAmountBox" style="height:5mm;width:32.9mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/USIncomeTaxPaidOrWithheld29j"/>
</xsl:call-template>
<span style="width:1mm;"/>
<xsl:call-template name="LinkToLeftoverDataTableInline">
<xsl:with-param name="Desc">Line 29j - backup Withholding Indicator</xsl:with-param>
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/USIncomeTaxPaidOrWithheld29j/@backupWithholdingIndicator"/>
</xsl:call-template>
<xsl:call-template name="LinkToLeftoverDataTableInline">
<xsl:with-param name="Desc">Line 29j - backup Withholding Amount</xsl:with-param>
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/USIncomeTaxPaidOrWithheld29j/@backupWithholdingAmount"/>
</xsl:call-template>
</div>
</div>
<!-- line 29J and 29K-->
<div style="width:181mm;float:right;clear:none;">
<div class="styLNLeftLtrBox" style="height:8mm;">j</div>
<div class="styLNDesc" style="width:92mm;height:8mm;">
 Refundable credits from Form 3800, line 17c, and Form 8827,<br/> line 8c 
<xsl:call-template name="SetFormLinkInline">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/RefundableCredits"/>
</xsl:call-template>
<span style="letter-spacing:4mm;font-weight:bold">.................</span>
</div>
<div class="styLNRightNumBox" style="height:10mm;padding-top:5mm">29j</div>
<div class="styLNAmountBox" style="height:10mm;padding-top:5mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/RefundableCredits"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBoxNBB" style="height:10mm;border-bottom-width:1px;padding-top:5mm">29k</div>
<div class="styLNAmountBox" style="height:8mm;width:32.9mm;padding-top:3mm">
<span style="padding-right:1mm">
<xsl:call-template name="LinkToLeftoverDataTableInline">
<xsl:with-param name="Desc">Line 29k - backup Withholding Indicator</xsl:with-param>
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/USIncomeTaxPaidOrWithheld29k/@backupWithholdingIndicator"/>
</xsl:call-template>
<xsl:call-template name="LinkToLeftoverDataTableInline">
<xsl:with-param name="Desc">Line 29k - backup Withholding Amount</xsl:with-param>
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/USIncomeTaxPaidOrWithheld29k/@backupWithholdingAmount"/>
</xsl:call-template>
</span><br/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/USIncomeTaxPaidOrWithheld29k"/>
</xsl:call-template>
<span style="width:1mm;"/>
</div>
</div>
<!-- line 30 -->
<div style="width:181mm;float:right;clear:none;">
<div class="styLNLeftNumBox" style="height:4mm;">30</div>
<div class="styLNDesc" style="width:132mm;height:4mm;">
<label>
<xsl:call-template name="PopulateLabel">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/Form2220Attached"/>
<xsl:with-param name="BackupName">IRS1120LForm2220Attached</xsl:with-param>
</xsl:call-template>
 Estimated tax penalty. Check if Form 2220 is attached
<span style="width:2px;"/>
</label>
<!--Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">..........</span>
<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
<span style="width:8px"/>
<input type="checkbox" class="styCkbox">
<xsl:call-template name="PopulateCheckbox">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/Form2220Attached"/>
<xsl:with-param name="BackupName">IRS1120LForm2220Attached</xsl:with-param>
</xsl:call-template>
</input>
<xsl:call-template name="SetFormLinkInline">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/Form2220Attached"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">30</div>
<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/EstimatedTaxPenalty"/>
</xsl:call-template>
</div>
</div>
<!-- line 31 -->
<div style="width:181mm;float:right;clear:none;">
<div class="styLNLeftNumBox" style="height:4mm;">31</div>
<div class="styLNDesc" style="width:132mm;height:4mm;">
<span class="styBoldText">Amount owed.</span> 
 If line 29k is smaller than the total of lines 28 and 30, enter amount owed
<!--Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">...</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">31</div>
<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/BalanceDue"/>
</xsl:call-template>
</div>
</div>
<!-- line 32 -->
<div style="width:181mm;float:right;clear:none;">
<div class="styLNLeftNumBox" style="height:4mm;">32</div>
<div class="styLNDesc" style="width:132mm;height:4mm;">
<span class="styBoldText">Overpayment.</span>
 If line 29k is larger than the total of lines 28 and 30, enter amount overpaid
<span style="letter-spacing:4mm;font-weight:bold">..</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">32</div>
<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/OverpaymentSection/OverpaymentAmount"/>
</xsl:call-template>
</div>
</div>
<!-- line 33 -->
<div style="width:181mm;float:right;clear:none;">
<div class="styLNLeftNumBox" style="height:4mm;">33</div>
<div class="styLNDesc" style="width:77mm;height:4mm;">
<span style="font-size:6pt;">Enter amount from line 32: 
</span>
<span class="styBoldText">Credited to 2012 estimated tax</span>
<span style="width:2px"/>
<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
</div>
<div class="styGenericDiv" style="width:35mm;height:4mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/OverpaymentSection/CreditElect"/>
</xsl:call-template>
</div>
<div class="styLNDesc" style="width:20mm;height:4mm;font-size:6pt;">
<span class="styBoldText">Refunded</span>
<span style="width:4px"/>
<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
<xsl:call-template name="SetFormLinkInline">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/OverpaymentSection/Refund"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBoxNBB" style="height:4.5mm;">33</div>
<div class="styLNAmountBoxNBB" style="height:4.5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/OverpaymentSection/Refund"/>
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
<xsl:with-param name="BackupName">ReturnHeaderMayIRSDiscussReturnWithPrepYes</xsl:with-param>
</xsl:call-template>
</input>
<label for="dummyidyes">
<xsl:call-template name="PopulateReturnHeaderOfficer">
<xsl:with-param name="TargetNode">AuthorizeThirdPartyYesLabel</xsl:with-param>
<xsl:with-param name="BackupName">ReturnHeaderMayIRSDiscussReturnWithPrepYes</xsl:with-param>
</xsl:call-template>Yes
</label>
<input class="styCkbox" type="checkbox" name="Checkbox" id="dummyidno" style="width:2.5mm;">
<xsl:call-template name="PopulateReturnHeaderOfficer">
<xsl:with-param name="TargetNode">AuthorizeThirdPartyNoCheckbox</xsl:with-param>
<xsl:with-param name="BackupName">ReturnHeaderMayIRSDiscussReturnWithPrepNo</xsl:with-param>
</xsl:call-template>
</input>
<label for="dummyidno">
<xsl:call-template name="PopulateReturnHeaderOfficer">
<xsl:with-param name="TargetNode">AuthorizeThirdPartyNoLabel</xsl:with-param>
<xsl:with-param name="BackupName">ReturnHeaderMayIRSDiscussReturnWithPrepNo</xsl:with-param>
</xsl:call-template>No
</label>
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
      <!--    <table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:6pt;border-color:black;border-bottom:1 solid black;">-->
            <!--<tr>--><!--row 1--><!--
              <td rowspan="3" style="width:18mm;font-size:10pt;font-weight:bold;font-family:'arial narrow';border-right:1 solid black;vertical-align:top;padding-top:5mm;border-bottom:1 solid black;">Paid Preparer Use Only</td>
              <td style="width:43mm;border-right:1 solid black;border-bottom:1 solid black;padding-left:1mm;">Print/Type preparer's name
                <br/>
                <xsl:call-template name="PopulateReturnHeaderPreparer">
                    <xsl:with-param name="TargetNode">Name</xsl:with-param>
                  </xsl:call-template>
              </td>
              <td style="width:55mm;border-right:1 solid black;border-bottom:1 solid black;padding-left:1mm;">Preparer's signature
                <br/>
                <span style="width:2px;"/>
              </td>
              <td style="width:24mm;border-right:1 solid black;border-bottom:1 solid black;padding-left:1mm;">
				Date <br/>
                <span style="text-align:center; padding-left:7mm;">
                  <xsl:call-template name="PopulateReturnHeaderPreparer">
                    <xsl:with-param name="TargetNode">DatePrepared</xsl:with-param>
                  </xsl:call-template>
                </span>
              </td>
              <td style="width:19mm;border-right:1 solid black;border-bottom:1 solid black;padding-left:1mm;vertical-align:bottom;padding-bottom:.5mm;">
                <nobr>Check
                 <input class="styCkbox" type="checkbox" id="dummyid1" style="width:4mm;">
                  <xsl:call-template name="PopulateReturnHeaderPreparer">
                    <xsl:with-param name="TargetNode">SelfEmployedCheckbox</xsl:with-param>
                    <xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
                  </xsl:call-template>
                </input>
                  <label for="dummyid1">
                    <xsl:call-template name="PopulateReturnHeaderPreparer">
                      <xsl:with-param name="TargetNode">SelfEmployedLabel</xsl:with-param>
                      <xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
                    </xsl:call-template> if <br/>self-employed 
				  </label>
                </nobr>
              </td>
              <td style="width:35mm;border-bottom:1 solid black;padding-left:1mm;">PTIN
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
            <tr>--><!--row 2--><!--
              <td rowspan="1" colspan="4" style="border-bottom:1 solid black;border-right:1 solid black;padding-left:.5mm;">Firm's name
                <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
                <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
                  <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
                </xsl:call-template>
                <br/>
                <span style="padding-left:16mm;">
                  <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
                    <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
                  </xsl:call-template>
                </span>
              </td>
              <td style="border-bottom:1 solid black;padding-left:1mm;">Firm's EIN
                <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>                     
				<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
                  <xsl:with-param name="TargetNode">EIN</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
                  <xsl:with-param name="TargetNode">MissingEINReason</xsl:with-param>
                </xsl:call-template>
              </td>
            </tr>
            <tr>--><!--row 3--><!--
              <td rowspan="1" colspan="4" style="border-bottom:1 solid black;border-right:1 solid black;padding-left:.5mm;">Firm's address
                <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
                <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
                  <xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
                </xsl:call-template>
                <br/>
                <span style="padding-left:18mm;">
                  <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
                    <xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
                  </xsl:call-template>
                </span>
                <br/>
                <span style="padding-left:18mm;">
                  <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
                    <xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
                  </xsl:call-template>
                </span>
                <br/>
                <span style="padding-left:18mm;">
                  <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
                    <xsl:with-param name="TargetNode">Country</xsl:with-param>
                  </xsl:call-template>
                </span>
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
          </table>-->
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
								<div class="styLNDesc" style="height:6mm;width:46.8mm;padding-top:0mm;border-right:1 solid black;border-left:1 solid black;padding-left:1mm;">
								  Print/Type preparer's name<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Preparer/Name"/>
										<xsl:with-param name="BackupName">$RtnHdrDataPreparerName</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="height:6mm;width:46.5mm;padding-top:0mm;border-right:1 solid black;padding-left:1mm;">
								Preparer's signature
							</div>
								<div class="styLNDesc" style="height:6mm;width:15mm;border-right:1 solid black;padding-top:0mm;padding-left:1mm;">Date <br/>
									<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">DatePrepared</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataPreparerDatePrepared</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="height:6mm;width:18mm;border-right:1 solid black;padding-top:.5mm;padding-bottom:0mm;padding-left:1mm;">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Preparer/SelfEmployed"/>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerSelfEmployed</xsl:with-param>
										</xsl:call-template>
										Check 
										<input class="styCkbox" type="checkbox" style="width:4mm;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/Preparer/SelfEmployed"/>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerSelfEmployed</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:4px;"/>if<br/>self-employed
									</label>
								</div>
								<div class="styLNDesc" style="height:6mm;width:26mm;padding-top:0mm;padding-left:1mm;">PTIN
                  <br/>
                  <span style="width:6mm;"/>
									<xsl:if test="$RtnHdrData/Preparer/SSN">
										<xsl:call-template name="PopulateReturnHeaderPreparer">
											<xsl:with-param name="TargetNode">SSN</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerSSN</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/Preparer/PTIN">
										<xsl:call-template name="PopulateReturnHeaderPreparer">
											<xsl:with-param name="TargetNode">PTIN</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerPTIN</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<!--<xsl:if test="$RtnHdrData/Preparer/STIN">
										<xsl:call-template name="PopulateReturnHeaderPreparer">
											<xsl:with-param name="TargetNode">STIN</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerSTIN</xsl:with-param>
										</xsl:call-template>
									</xsl:if>-->
								</div>
							</div>
							<div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
								<div class="styLNDesc" style="height:6mm;width:126.5mm;border-right:1 solid black;border-left:1 solid black;padding-left:1mm;">
									<span class="styGenericDiv" style="">Firm's name 
									<span style="width:2.2mm;"/>
  <img src="{$ImagePath}/1120_Bullet_Md.gif" alt="MediumBullet"/> 
										<span style="width:4px;"/>
									</span>
									<div class="styGenericDiv" style="padding-right:.5mm;">
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerFirmPreparerFirmBusinessNameBusinessName1</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerFirmPreparerFirmBusinessNameBusinessName2</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
								<div class="styLNDesc" style="height:6mm;width:32mm;padding-left:1mm;">Firm's EIN
								  <img src="{$ImagePath}/1120_Bullet_Md.gif" alt="MediumBullet"/> 
									<span style="width:4px;"/>
									<xsl:if test="$RtnHdrData/PreparerFirm/EIN">
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">EIN</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerFirmEIN</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PreparerFirm/MissingEINReason">
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">MissingEINReason</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerFirmMissingEINReason</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
							<div style="width:164mm;float:left;clear:none;">
								<div class="styLNDesc" style="width:126.5mm;border-right:1 solid black;border-left:1 solid black;padding-left:1mm;">
									<div class="styGenericDiv" style="padding-right:.5mm;">Firm's address 
  <img src="{$ImagePath}/1120_Bullet_Md.gif" alt="MediumBullet"/> 
									</div>
									<div class="styGenericDiv" style="padding-right:.5mm;">
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerFirmAddressLine1</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerFirmAddressLine2</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:if test="$RtnHdrData/PreparerFirm/PreparerFirmUSAddress">
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">City</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerFirmUSAddressCity</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">State</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerFirmUSAddressState</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">ZIPCode</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerFirmUSAddressZip</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/PreparerFirm/PreparerFirmForeignAddress">
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">City</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerFirmForeignAddressCity</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">ProvinceOrState</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerFirmForeignProvinceOrState</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">PostalCode</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerFirmForeignPostalCode</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">Country</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerFirmForeignCountry</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</div>
								</div>
								<div class="styLNDesc" style="width:32mm;padding-left:1mm;"> Phone no. 
 								<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">Phone</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataPreparerPhone</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataPreparerForeignPhone</xsl:with-param>
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
  Cat. No. 11480E 
    </div>
<div style="float:right;">
<span style="width:40px;"/>  
 Form <span class="styBoldText" style="font-size:8pt;">1120-L</span> (2011)
</div>
</div>
<!-- END Page Break and Footer-->
<!--Begin Page 2 -->
<!-- Page Header -->
<div class="styBB" style="width:187mm;padding-top:.5mm;">
<div style="float:left;">Form 1120-L (2011)<span style="width:148mm;"/>
</div>
<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
</div>
</div>
<!-- END Page Header -->
<!-- BEGIN Schedule A Title -->
<div class="styBB" style="width:187mm;">
<div class="styPartName" style="width:23mm;">Schedule A</div>
<div class="styPartDesc" style="width:164mm;">Dividend Income and Dividends-Received Deduction 
<span class="styNormalText">(see instructions)</span>
</div>
</div>
<!-- END Schedule A Title -->
<!-- BEGIN Schedule A Table -->
<!--div class="styBB" style="width:187mm;"></div-->
<table class="styTable" style="font-size:7pt;border-bottom:1 solid black;width:187mm;" cellspacing="0">
<thead>
<tr scope="col">
<th scope="col" class="styBB" colspan="2" style="width:84mm;border-bottom-width:0px;">
<div class="styPartDesc" style="width:84mm;text-align:center;">Dividends subject to proration
</div>
</th>
<th scope="col" class="styLNAmountBox" style="width:45mm;height:8mm;text-align:center;font-size:7pt;
padding-top:1mm;font-weight:normal;border-left-width:0px;" colspan="2">
<b>(a)</b> Dividends received
</th>
<th scope="col" class="styIRS1120LNPercentBox" style="height:8mm;font-size:7pt;
padding-top:0mm;font-weight:normal;width:15mm;padding-left:4mm;">
<b>(b)</b>%
</th>
<th scope="col" class="styLNAmountBox" style="width:40mm;height:8mm;text-align:center;font-size:7pt;
 padding-top:1mm;font-weight:normal;" colspan="2">

<b>(c)</b>Deduction <br/>
(<b>(a)</b> times <b>(b)</b>)
</th>
</tr>
</thead>
<tfoot/>
<tbody valign="top">
<!-- SCH A line 1 -->
<tr>
<td class="styLNLeftNumBox" style="height:7mm;">1</td>
<td class="styLNDesc" style="width:84mm;height:7mm;">
  Domestic corporations, less-than-20%-owned (other than debt-financed stock)
  <!--Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">...........</span>
</td>
<td class="styBB" style="width:10mm;height:7mm;vertical-align:bottom;border-left-width:1px;text-align:center">
<span style="width:1px;font-weight:bold">1</span>
</td>
<td class="styLNAmountBox" style="width:45mm;height:7mm;vertical-align:bottom;">
<span style="width:1px;"/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/DomesticOwndBelow20Dividends"/>
</xsl:call-template>
</td>
<td class="styIRS1120LNPercentBox" style="height:7mm;vertical-align:bottom;padding-left:3mm">70</td>
<td class="styLNAmountBox" style="width:40mm;height:7mm;vertical-align:bottom;" colspan="2">
<span style="width:1px;"/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/DomesticOwndBelow20Deductions"/>
</xsl:call-template>
</td>
</tr>
<!-- SCH A line 2 -->
<tr>
<td class="styLNLeftNumBox" style="height:7mm;">2</td>
<td class="styLNDesc" style="width:84mm;height:7mm;">
 Domestic corporations, 20%-or-more-owned (other than debt-financed stock)
<!--Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">...........</span>
</td>
<td class="styBB" style="width:10mm;height:7mm;vertical-align:bottom;border-left-width:1px;text-align:center">
<span style="width:1px;font-weight:bold">2</span>
</td>
<td class="styLNAmountBox" style="width:40mm;height:7mm;vertical-align:bottom;">
<span style="width:1px;"/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/DomesticOwnd20OrMoreDividends"/>
</xsl:call-template>
</td>
<td class="styIRS1120LNPercentBox" style="height:7mm;vertical-align:bottom;padding-left:3mm">80</td>
<td class="styLNAmountBox" style="width:40mm;height:7mm;vertical-align:bottom;" colspan="2">
<span style="width:1px;"/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/DomesticOwnd20OrMoreDeductions"/>
</xsl:call-template>
</td>
</tr>
<!-- SCH A line 3 -->
<tr>
<td class="styLNLeftNumBox" style="height:5mm;padding-top: 1.5mm">3</td>
<td class="styLNDesc" style="width:84mm;height:5mm;padding-top: 2mm">
Debt-financed stock of domestic and foreign corporations
</td>
<td class="styBB" style="width:10mm;height:5mm;vertical-align:bottom;border-left-width:1px;text-align:center">
<span style="width:1px;font-weight:bold">3</span>
</td>
<td class="styLNAmountBox" style="width:40mm;height:5mm;vertical-align:bottom;">
<span style="width:1px;"/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/DebtFinancedStockDividends"/>
</xsl:call-template>
</td>
<td class="styIRS1120LNPercentBox" style="height:5mm;padding-top:3mm;padding-bottom: 
 0mm;font-size:6pt;padding-left:4mm;">see instructions
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/DebtFinancedStockPercentage"/>
</xsl:call-template>
</td>
<td class="styLNAmountBox" style="width:40mm;padding-top:5mm" colspan="2">
<span style="width:1px;"/>
<!-- Form to Form Link -->
<xsl:call-template name="SetFormLinkInline">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/DebtFinancedStockDeductions"/>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/DebtFinancedStockDeductions"/>
</xsl:call-template>
</td>
</tr>
<!-- SCH A line 4 -->
<tr>
<td class="styLNLeftNumBox" style="height:4mm;">4</td>
<td class="styLNDesc" style="width:84mm;height:4mm;">
 Public utility corporations, less-than-20%-owned
<!-- Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">...</span>
</td>
<td class="styBB" style="width:10mm;height:7mm;vertical-align:bottom;border-left-width:1px;text-align:center">
<span style="width:1px;font-weight:bold">4</span>
</td>
<td class="styLNAmountBox" style="width:40mm;height:7mm;vertical-align:bottom;">
<span style="width:1px;"/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/PubUtilBelow20Dividends"/>
</xsl:call-template>
</td>
<td class="styIRS1120LNPercentBox" style="height:4mm;padding-left:3mm">42</td>
<td class="styLNAmountBox" style="width:40mm;height:4mm;" colspan="2">
<span style="width:1px;"/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/PubUtilBelow20Deductions"/>
</xsl:call-template>
</td>
</tr>
<!--SCH A  line 5 -->
<tr>
<td class="styLNLeftNumBox" style="height:4mm;">5</td>
<td class="styLNDesc" style="width:84mm;height:4mm;">Public utility corporations, 20%-or-more-owned
<span style="letter-spacing:4mm;font-weight:bold">...</span>
</td>
<td class="styBB" style="width:10mm;height:7mm;vertical-align:bottom;border-left-width:1px;text-align:center">
<span style="width:1px;font-weight:bold">5</span>
</td>
<td class="styLNAmountBox" style="width:40mm;height:7mm;vertical-align:bottom;">
<span style="width:1px;"/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/PubUtil20OrMoreDividends"/>
</xsl:call-template>
</td>
<td class="styIRS1120LNPercentBox" style="height:4mm;vertical-align:bottom;padding-left:3mm">48</td>
<td class="styLNAmountBox" style="width:40mm;height:4mm;vertical-align:bottom;" colspan="2">
<span style="width:1px;"/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/PubUtil20OrMoreDeductions"/>
</xsl:call-template>
</td>
</tr>
<!-- SCH A line 6 -->
<tr>
<td class="styLNLeftNumBox" style="height:7mm;">6</td>
<td class="styLNDesc" style="width:84mm;height:7mm;">
Foreign corporations, less-than-20%-owned, and certain FSCs
<!--Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">...............</span>
</td>
<td class="styBB" style="width:10mm;height:7mm;vertical-align:bottom;border-left-width:1px;text-align:center">
<span style="width:1px;font-weight:bold">6</span>
</td>
<td class="styLNAmountBox" style="width:40mm;height:7mm;vertical-align:bottom;">
<span style="width:1px;"/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/ForeignOwndBelow20Dividends"/>
</xsl:call-template>
</td>
<td class="styIRS1120LNPercentBox" style="height:7mm;vertical-align:bottom;padding-left:3mm">70</td>
<td class="styLNAmountBox" style="width:40mm;height:7mm;vertical-align:bottom;" colspan="2">
<span style="width:1px;"/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/ForeignOwndBelow20Deductions"/>
</xsl:call-template>
</td>
</tr>
<!-- SCH A line 7 -->
<tr>
<td class="styLNLeftNumBox" style="height:7mm;">7</td>
<td class="styLNDesc" style="width:84mm;height:7mm;">
Foreign corporations, 20%-or-more-owned, and certain FSCs
<!--Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">...............</span>
</td>
<td class="styBB" style="width:10mm;height:7mm;vertical-align:bottom;border-left-width:1px;text-align:center">
<span style="width:1px;font-weight:bold">7</span>
</td>
<td class="styLNAmountBox" style="width:40mm;height:7mm;vertical-align:bottom;">
<span style="width:1px;"/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/ForeignOwnd20OrMoreDividends"/>
</xsl:call-template>
</td>
<td class="styIRS1120LNPercentBox" style="height:7mm;vertical-align:bottom;padding-left:3mm">80</td>
<td class="styLNAmountBox" style="width:40mm;height:7mm;vertical-align:bottom;" colspan="2">
<span style="width:1px;"/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/ForeignOwnd20OrMoreDeductions"/>
</xsl:call-template>
</td>
</tr>
<tr>
<!-- SCH A line 8 -->
<td class="styLNLeftNumBox" style="height:4mm;">8</td>
<td class="styLNDesc" style="width:84mm;height:4mm;font-size:7pt;">
 Wholly owned foreign subsidiaries and certain FSCs
<span style="letter-spacing:4mm;font-weight:bold">..</span>
</td>
<td class="styBB" style="width:10mm;height:7mm;vertical-align:bottom;border-left-width:1px;text-align:center">
<span style="width:1px;font-weight:bold">8</span>
</td>
<td class="styLNAmountBox" style="width:40mm;height:7mm;vertical-align:bottom;">
<span style="width:1px;"/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/WhollyOwnedDividends"/>
</xsl:call-template>
</td>
<td class="styIRS1120LNPercentBox" style="height:4mm;vertical-align:bottom;padding-left:3mm">100</td>
<td class="styLNAmountBox" style="width:40mm;height:4mm;vertical-align:bottom;" colspan="2">
<span style="width:1px;"/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/WhollyOwnedFrgnSubsidiaryDed"/>
</xsl:call-template>
</td>
</tr>
<!-- SCH A line 9 -->
<td class="styLNLeftNumBox" style="height:4mm;">9</td>
<td class="styLNDesc" style="width:84mm;height:4mm;font-size:7pt;">
Certain affiliated company dividends
<span style="letter-spacing:4mm;font-weight:bold">.......</span>
</td>
<td class="styBB" style="width:10mm;height:7mm;vertical-align:bottom;border-left-width:1px;text-align:center">
<span style="width:1px;font-weight:bold">9</span>
</td>
<td class="styLNAmountBox" style="width:40mm;height:7mm;vertical-align:bottom;">
<span style="width:1px;"/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/DivFromAffltCompanies"/>
</xsl:call-template>
</td>
<td class="styIRS1120LNPercentBox" style="height:4mm;vertical-align:bottom;padding-left:3mm">100</td>
<td class="styLNAmountBox" style="width:40mm;height:4mm;vertical-align:bottom;" colspan="2">
<span style="width:1px;"/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/CertainAffiliatedCoDeduction"/>
</xsl:call-template>
</td>
<!-- SCH A line 10 -->
<tr>
<td class="styLNLeftNumBox" style="height:7mm;">10</td>
<td class="styLNDesc" style="width:84mm;height:7mm;">
Gross dividends-received deduction. Add lines 1 through 9
<!-- No Dotted Line-->
</td>
<td class="styBB" style="width:10mm;height:7mm;vertical-align:bottom;border-left-width:1px;text-align:center">
<span style="width:1px;font-weight:bold">10</span>
</td>
<td class="styBB" style="width:40mm;height:7mm;border-left-width:1px;border-bottom-width: 0px;background-color:lightgrey">
<span style="width:1px;"/>
</td>
<td class="styIRS1120LNPercentBox" style="border-bottom-width: 0px;height:7mm;vertical-align:bottom;background-color:lightgrey">
<span style="width:1px;"/>
</td>
<td class="styLNAmountBox" style="width:40mm;height:7mm;vertical-align:bottom;" colspan="2">
<span style="width:1px;"/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/GrossDividendsRcvdDeduction"/>
</xsl:call-template>
</td>
</tr>
<!-- SCH A line 11 -->
<tr>
<td class="styLNLeftNumBox" style="height:7mm;">11</td>
<td class="styLNDesc" style="width:84mm;height:7mm;">
Company share percentage (Schedule F, line 32)
<!--Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">...</span>
</td>
<td class="styBB" style="width:10mm;height:7mm;vertical-align:bottom;border-left-width:1px;
 text-align:center;border-bottom-width: 1px;">
<span style="width:1px;font-weight:bold">11</span>
</td>
<td class="styBB" style="width:40mm;height:7mm;border-left-width:1px;background-color:lightgrey;
 border-bottom-width: 0px;">
<span style="width:1px;"/>
</td>
<td class="styIRS1120LNPercentBox" style="height:7mm;vertical-align:bottom;background-color:lightgrey;border-bottom-width: 0px;">
<span style="width:1px;"/>
</td>
<td class="styLNAmountBox" style="width:40mm;height:7mm;vertical-align:bottom;" colspan="2">
<span style="width:1px;"/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/CompanySharePctDeduction"/>
</xsl:call-template>%</td>
</tr>
<!-- SCH A line 12 -->
<tr>
<td class="styLNLeftNumBox" style="height:7mm;">12</td>
<td class="styLNDesc" style="width:84mm;height:7mm;">
Prorated amount. Line 10 times line 11 
<!--Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">......</span>
</td>
<td class="styBB" style="width:10mm;height:7mm;vertical-align:bottom;border-left-width:1px;text-align:center">
<span style="width:1px;font-weight:bold">12</span>
</td>
<td class="styBB" style="width:40mm;height:7mm;border-left-width:1px;background-color:lightgrey">
<span style="width:1px;"/>
</td>
<td class="styIRS1120LNPercentBox" style="height:7mm;vertical-align:bottom;background-color:lightgrey">
<span style="width:1px;"/>
</td>
<td class="styLNAmountBox" style="width:40mm;height:7mm;vertical-align:bottom;" colspan="2">
<span style="width:1px;"/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/ProratedAmount"/>
</xsl:call-template>
</td>
</tr>
<!-- SCH A line header -->
<tr>
<td class="styLNLeftNumBox" style="height:4mm;">
<span style="width:1px;"/>
</td>
<td class="styLNDesc" style="width:84mm;height:4mm;text-align:center;font-size:9pt;">
<span class="styBoldText">Dividends not subject to proration </span>
<!-- No Dotted Line-->
</td>
<td class="styBB" style="width:10mm;height:7mm;vertical-align:bottom;border-left-width:1px;text-align:center;border-bottom-width:0px">
<span style="width:1px;"/>
</td>
<td class="styLNAmountBox" style="width:30mm;height:7mm;vertical-align:bottom;border-bottom-width:0px">
<span style="width:1px;"/>
</td>
<td class="styLNAmountBox" style="width:40mm;height:7mm;border-bottom-width:0px">
<span style="width:1px;"/>
</td>
<td class="styLNAmountBox" style="width:40mm;height:7mm;vertical-align:bottom;;border-bottom-width:0px" colspan="2">
<span style="width:1px;"/>
</td>
</tr>
<!-- SCH A line 13 -->
<tr>
<td class="styLNLeftNumBox" style="height:5mm;padding-top: 1.5mm">13</td>
<td class="styLNDesc" style="width:84mm;height:5mm;padding-top: 2mm">
 Affiliated company dividends
  <span style="letter-spacing:4mm;font-weight:bold">.........</span>
</td>
<td class="styBB" style="width:10mm;height:7mm;vertical-align:bottom;
  border-left-width:1px;text-align:center">
<span style="width:1px;font-weight:bold">13</span>
</td>
<td class="styLNAmountBox" style="width:40mm;height:7mm;vertical-align:bottom;">
<xsl:call-template name="SetFormLinkInline">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/AffiliatedCompanyDividendsRcvd"/>
</xsl:call-template>
<br/>
<span style="width:1px;"/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/AffiliatedCompanyDividendsRcvd"/>
</xsl:call-template>
</td>
<td class="styIRS1120LNPercentBox" style="height:5mm;padding-top:4mm;
padding-bottom: 0mm;padding-left:3mm;font-size:6pt;text-align:center;">see instructions
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/AffiliatedCompanyPercentage"/>
</xsl:call-template>
</td>
<td class="styLNAmountBox" style="width:40mm;height:4mm;vertical-align:bottom;" colspan="2">
<span style="width:1px;"/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/AffiliatedCompanyDedRecd"/>
</xsl:call-template>
</td>
</tr>
<!-- SCH A line 14 -->
<tr>
<td class="styLNLeftNumBox" style="height:7mm;">14</td>
<td class="styLNDesc" style="width:84mm;height:7mm;">
Other corporate dividends 
<!-- No Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">.........</span>
</td>
<td class="styBB" style="width:10mm;height:7mm;vertical-align:bottom;border-left-width:1px;text-align:center">
<span style="width:1px;font-weight:bold">14</span>
</td>
<td class="styBB" style="width:40mm;height:7mm;border-left-width:1px;
 border-bottom-width: 1px;vertical-align:bottom;text-align:right">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/OtherCorpDividends"/>
</xsl:call-template>
</td>
<td class="styIRS1120LNPercentBox" style="border-bottom-width: 0px;height:7mm;vertical-align:bottom;background-color:lightgrey">
<span style="width:1px;"/>
</td>
<td class="styLNAmountBox" style="width:40mm;height:7mm;vertical-align:bottom;
 background-color:lightgrey;border-bottom-width:0px" colspan="2">
<span style="width:1px;"/>
</td>
</tr>
<!-- SCH A line 15 -->
<tr>
<td class="styLNLeftNumBox" style="height:7mm;">15</td>
<td class="styLNDesc" style="width:84mm;height:7mm;">
<span class="styBoldText">Total dividends.  </span>
 Add lines 1 through 14, column (a). Enter here and on Schedule B, line 2
<!-- Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">........</span>
</td>
<td class="styBB" style="width:10mm;height:7mm;vertical-align:bottom;border-left-width:1px;text-align:center">
<span style="width:1px;font-weight:bold">15</span>
</td>
<td class="styBB" style="width:40mm;height:7mm;border-left-width:1px;
vertical-align:bottom;border-bottom-width: 1px;padding-top:4mm;text-align:right">
<span style="width:1px;"/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/OtherDividends"/>
</xsl:call-template>
</td>
<td class="styIRS1120LNPercentBox" style="border-bottom-width: 1px;height:7mm;vertical-align:bottom;background-color:lightgrey">
<span style="width:1px;"/>
</td>
<td class="styLNAmountBox" style="width:40mm;height:7mm;vertical-align:bottom;background-color:lightgrey" colspan="2">
<span style="width:1px;"/>
</td>
</tr>
<!-- SCH A line 16 -->
<tr>
<td class="styLNLeftNumBox" style="height:7mm;">16</td>
<td class="styLNDesc" style="width:84mm;height:7mm;">
<span class="styBoldText">Total deductions.</span> 
 Add lines 12 and 13, column (c). Reduce the deduction as provided in section 805(a)(4)(D)(ii).
Enter here and on page 1, line 21a and on Schedule J, Part I, line 2c

<!-- No Dotted Line-->
</td>
<td class="styBB" style="width:10mm;height:7mm;vertical-align:bottom;border-left-width:1px;text-align:center;border-bottom-width: 0px;">
<span style="width:1px;font-weight:bold">16</span>
</td>
<td class="styBB" style="width:40mm;height:7mm;border-left-width:1px;border-bottom-width: 0px;background-color:lightgrey">
<span style="width:1px;"/>
</td>
<td class="styIRS1120LNPercentBox" style="border-bottom-width: 0px;height:7mm;vertical-align:bottom;background-color:lightgrey">
<span style="width:1px;"/>
</td>
<td class="styLNAmountBox" style="width:40mm;height:7mm;vertical-align:bottom;border-bottom-width:0px" colspan="2">
<span style="width:1px;"/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/TotalDeductions"/>
</xsl:call-template>
</td>
</tr>
</tbody>
</table>
<!-- BEGIN Schedule B Title -->
<div class="styBB" style="width:187mm;">
<div class="styPartName" style="width:23mm;">Schedule B</div>
<div class="styPartDesc" style="width:164mm;">Gross Investment Income
<span class="styNormalText">(section 812(d)) (see instructions)</span>
</div>
</div>
<!-- END Schedule B Title -->
<!-- SCH B line 1 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4mm;">1</div>
<div class="styLNDesc" style="height:4mm;">Interest (excluding tax-exempt interest)
<span style="width:2px;"/>
<!-- Form to Form Link -->
<xsl:call-template name="SetFormLinkInline">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleB/GrossInvestmentIncomeInterest"/>
</xsl:call-template>
<!--Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">.................</span>
</div>
<div class="styLNRightNumBox" style="height:4mm;">1</div>
<div class="styLNAmountBox" style="height:4mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleB/GrossInvestmentIncomeInterest"/>
</xsl:call-template>
</div>
</div>
<!-- SCH B line 2 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4mm;">2</div>
<div class="styLNDesc" style="height:4mm;">Gross taxable dividends (Schedule A, line 15, column (a))
<!--Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">.............</span>
</div>
<div class="styLNRightNumBox" style="height:4mm;">2</div>
<div class="styLNAmountBox" style="height:4mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleB/GrossTaxableDividends"/>
</xsl:call-template>
</div>
</div>
<!-- SCH B line 3 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4mm;">3</div>
<div class="styLNDesc" style="height:4mm;">Gross rents
<!--Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">.........................</span>
</div>
<div class="styLNRightNumBox" style="height:4mm;">3</div>
<div class="styLNAmountBox" style="height:4mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleB/GrossRents"/>
</xsl:call-template>
</div>
</div>
<!-- SCH B line 4 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4mm;">4</div>
<div class="styLNDesc" style="height:4mm;">Gross royalties
<span style="width:2px;"/>
<!--Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">........................</span>
</div>
<div class="styLNRightNumBox" style="height:4mm;">4</div>
<div class="styLNAmountBox" style="height:4mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleB/GrossRoyalties"/>
</xsl:call-template>
</div>
</div>
<!-- SCH B line 5 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4mm;">5</div>
<div class="styLNDesc" style="height:4mm;">Leases, terminations, etc.
<span style="width:2px;"/>
<!--Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">......................</span>
</div>
<div class="styLNRightNumBox" style="height:4mm;">5</div>
<div class="styLNAmountBox" style="height:4mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleB/GrossIncomeFromLeasesTerm"/>
</xsl:call-template>
</div>
</div>
<!-- SCH B line 6 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4mm;">6</div>
<div class="styLNDesc" style="height:4mm;">
Excess of net short-term capital gain over net long-term capital loss (Schedule D (Form 1120), line 12)
<!--Dotted Line-->
</div>
<div class="styLNRightNumBox" style="height:4mm;">6</div>
<div class="styLNAmountBox" style="height:4mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleB/ExcessNetSTGainOverNetLTLoss"/>
</xsl:call-template>
</div>
</div>
<!-- SCH B line 7 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4mm;">7</div>
<div class="styLNDesc" style="height:4mm;">
Gross income from trade or business other than an insurance business (attach schedule)
<!-- Form to Form Link -->
<xsl:call-template name="SetFormLinkInline">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleB/GrossIncomeFromTradeOrBusiness"/>
</xsl:call-template>
<!--Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">....</span>
</div>
<div class="styLNRightNumBox" style="height:4mm;">7</div>
<div class="styLNAmountBox" style="height:4mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleB/GrossIncomeFromTradeOrBusiness"/>
</xsl:call-template>
</div>
</div>
<!-- SCH B line 8 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4mm;">8</div>
<div class="styLNDesc" style="height:4mm;">
 Investment income. Add lines 1 through 7. Enter here and on page 1, line 4
<!--Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">........</span>
</div>
<div class="styLNRightNumBox" style="height:4mm;">8</div>
<div class="styLNAmountBox" style="height:4mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleB/GrossInvestmentIncome"/>
</xsl:call-template>
</div>
</div>
<!-- SCH B line 9 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4mm;">9</div>
<div class="styLNDesc" style="height:4mm;">
 Tax-exempt interest. Enter here and on Schedule F, line 13 and Schedule J, Part I, line 2d
<!--Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">....</span>
</div>
<div class="styLNRightNumBox" style="height:4mm;">9</div>
<div class="styLNAmountBox" style="height:4mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleB/TaxExemptInterestIncome"/>
</xsl:call-template>
</div>
</div>
<!-- SCH B line 10 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4mm;">10</div>
<div class="styLNDesc" style="height:4mm;">
 Increase in policy cash value of section 264(f) policies as defined in section 805(a)(4)(F). Enter here and
include on Schedule F, line 13
<!--Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">....................</span>
</div>
<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">10</div>
<div class="styLNAmountBox" style="height:8mm;padding-top:4mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleB/IncrPolicyCashValueSect264f"/>
</xsl:call-template>
</div>
</div>
<!-- SCH B line 11 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4mm;">11</div>
<div class="styLNDesc" style="height:4mm;">
Add lines 8, 9, and 10
<!--Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">.......................</span>
</div>
<div class="styLNRightNumBox" style="height:4mm;">11</div>
<div class="styLNAmountBox" style="height:4mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleB/SubtotalScheduleB"/>
</xsl:call-template>
</div>
</div>
<!-- SCH B line 12 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4mm;">12</div>
<div class="styLNDesc" style="height:4mm;">100% qualifying dividends
<!--Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">......................</span>
</div>
<div class="styLNRightNumBox" style="height:4mm;">12</div>
<div class="styLNAmountBox" style="height:4mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleB/QualifyingDividends"/>
</xsl:call-template>
</div>
</div>
<!-- SCH B line 13 -->
<div class="styBB" style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4mm;">13</div>
<div class="styLNDesc" style="height:4mm;">
<span class="styBoldText">Gross investment income.</span> 
 Subtract line 12 from line 11. Enter here and on Schedule F, line 9
<!--Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">....</span>
</div>
<div class="styLNRightNumBox" style="height:4mm;border-bottom-width:0px">13</div>
<div class="styLNAmountBox" style="height:4mm;border-bottom-width:0px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleB/TotalGrossInvestmentIncome"/>
</xsl:call-template>
</div>
</div>
<!-- Page Break and Footer-->
<div class="pageEnd" style="width:187mm;padding-top:1mm;">
<div style="float:left;"/>
<div style="float:right;">
<span style="width:40px;"/>  
Form <span class="styBoldText" style="font-size:8pt;">1120-L</span> (2011)
</div>
</div>
<!-- END Page Break and Footer-->
<!--Begin Page 3 -->
<!-- Page Header -->
<div class="styBB" style="width:187mm;padding-top:.5mm;">
<div style="float:left;">Form 1120-L (2011)<span style="width:148mm;"/>
</div>
<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">3</span>
</div>
</div>
<!-- END Page Header -->
<!-- BEGIN Schedule F Title -->
<div class="styBB" style="width:187mm;">
<div class="styPartName" style="width:23mm;">Schedule F</div>
<div class="styPartDesc" style="width:164mm;">Increase (Decrease) in Reserves
    <span class="styNormalText">(section 807) </span>and Company/Policyholder Share Percentage
    <span class="styNormalText">(section 812) (see instructions)</span>
</div>
</div>
<!-- - table header  -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;"/>
<div class="styLNDesc" style="width:99mm;height:4.5mm;"/>
<div class="styLNRightNumBox" style="height:4.5mm;border-left-width:0px"/>
<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;width:40mm;text-align:center">
<b>(a)</b>Beginning of tax year</div>
<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:1px;text-align:center">
<b>(b)</b> End of tax year
</div>
</div>
<!-- SCH F line 1 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">1 </div>
<div class="styLNDesc" style="width:99mm;height:4.5mm;">Life insurance reserves
<span style="letter-spacing:4mm;font-weight:bold">..............</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">1 </div>
<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/LifeInsuranceReservesBOY"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:1px"/>
<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/LifeInsuranceReservesEOY"/>
</xsl:call-template>
</div>
</div>
<!-- SCH F line 2 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">2 </div>
<div class="styLNDesc" style="width:99mm;height:4.5mm;">Unearned premiums and unpaid losses
<span style="letter-spacing:4mm;font-weight:bold">..........</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">2 </div>
<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/UnearnedPremUnpaidLossesBOY"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:1px"/>
<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/UnearnedPremUnpaidLossesEOY"/>
</xsl:call-template>
</div>
</div>
<!-- SCH F line 3 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">3 </div>
<div class="styLNDesc" style="width:99mm;height:4.5mm;">Supplementary contracts
 <span style="letter-spacing:4mm;font-weight:bold">..............</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">3 </div>
<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/SupplementaryContractsBOY"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:1px"/>
<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/SupplementaryContractsEOY"/>
</xsl:call-template>
</div>
</div>
<!-- SCH F line 4 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">4 </div>
<div class="styLNDesc" style="width:99mm;height:4.5mm;">Dividend accumulations and other amounts
 <span style="letter-spacing:4mm;font-weight:bold">.........</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">4 </div>
<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/DividendAccumulationsBOY"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:1px"/>
<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/DividendAccumulationsEOY"/>
</xsl:call-template>
</div>
</div>
<!-- SCH F line 5 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">5 </div>
<div class="styLNDesc" style="width:99mm;height:4.5mm;">Advance premiums
<span style="letter-spacing:4mm;font-weight:bold">................</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">5 </div>
<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/AdvancePremiumsBOY"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:1px"/>
<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/AdvancePremiumsEOY"/>
</xsl:call-template>
</div>
</div>
<!-- SCH F line 6 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">6 </div>
<div class="styLNDesc" style="width:99mm;height:4.5mm;">Special contingency reserves
<span style="letter-spacing:4mm;font-weight:bold">.............</span>
</div>
<div class="styLNRightNumBox" style="height:4mm;">6 </div>
<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/SpecialContingencyBOY"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:1px"/>
<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/SpecialContingencyEOY"/>
</xsl:call-template>
</div>
</div>
<!-- SCH F line 7 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">7 </div>
<div class="styLNDesc" style="width:99mm;height:4.5mm;">Add lines 1 through 6
 <span style="letter-spacing:4mm;font-weight:bold">...............</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">7 </div>
<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/TotalReservesBOY"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:1px"/>
<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/TotalReservesEOY"/>
</xsl:call-template>
</div>
</div>
<!-- SCH F line 8-->
<div class="styBB" style="width:187mm;">
<div class="styLNLeftNumBox" style="height:6mm;padding-top:2mm">8 </div>
<div class="styLNDesc" style="width:139mm;height:6mm;padding-top:2mm">
Increase (decrease) in reserves under section 807. Subtract line 7, column (a) from line 7, column (b)
</div>
<div class="styLNRightNumBoxNBB" style="height:6mm;padding-top:2mm">8</div>
<div class="styLNAmountBoxNBB" style="height:6mm;padding-top:2mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/ReservesIncreaseDecreaseEOY"/>
</xsl:call-template>
</div>
</div>
<!-- SCH F line 9 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">9</div>
<div class="styLNDesc" style="width:139mm;height:4mm;">
Gross investment income (Schedule B, line 13)
<span style="letter-spacing:4mm;font-weight:bold">................</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">9</div>
<div class="styLNAmountBox" style="height:4.5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/GrossInvestmentIncomeEOY"/>
</xsl:call-template>
</div>
</div>
<!-- SCH F line 10a -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">10a</div>
<div class="styLNDesc" style="width:99mm;height:4.5mm;">
Required interest on reserves under sections 807(c)(1), (3), (4), (5), and (6)(attach schedule)
<span style="width:2px;"/>
<!-- Form to Form Link -->
<xsl:call-template name="SetFormLinkInline">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/RequiredInterestOnReserves"/>
</xsl:call-template>
<!--Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">..............</span>
</div>
<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">10a</div>
<div class="styLNAmountBox" style="height:8mm;padding-top:4mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/RequiredInterestOnReserves"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBox" style="background-color:lightgrey;height:8mm;border-bottom-width:0px"/>
<div class="styLNAmountBoxNBB" style="height:8mm;background-color:lightgrey;"/>
</div>
<!-- SCH F line 10b -->
<div style="width:187mm;">
<div class="styLNLeftLtrBox" style="height:4mm;">
<span style="width:4px;"/>b</div>
<div class="styLNDesc" style="width:99mm;height:4mm;">Deductible excess interest. Enter here and on 
lines 18b and 19 below
<span style="letter-spacing:4mm;font-weight:bold">..</span>
</div>
<div class="styLNRightNumBox" style="height:4mm;">10b</div>
<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/DeductibleExcessInterest"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
<div class="styLNAmountBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
</div>
<!-- SCH F line 10c -->
<div style="width:187mm;">
<div class="styLNLeftLtrBox" style="height:4mm;">
<span style="width:4px;"/>c</div>
<div class="styLNDesc" style="width:99mm;height:4mm;">Deductible amounts credited to employee pension funds
<span style="letter-spacing:4mm;font-weight:bold">.....</span>
</div>
<div class="styLNRightNumBox" style="height:4mm;">10c</div>
<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/DedAmtCreditedEmplPensionFunds"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
<div class="styLNAmountBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
</div>
<!-- SCH F line 10d -->
<div style="width:187mm;">
<div class="styLNLeftLtrBox" style="height:4mm;">
<span style="width:4px;"/>d</div>
<div class="styLNDesc" style="width:99mm;height:4mm;">Deductible amounts credited to deferred annuities
<span style="letter-spacing:4mm;font-weight:bold">.......</span>
</div>
<div class="styLNRightNumBox" style="height:4mm;">10d</div>
<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/DedAmtCreditedDefrdAnnuities"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
<div class="styLNAmountBox" style="height:4.5mm;background-color:lightgrey;;border-bottom-width:0px"/>
</div>
<!-- SCH F line 10e -->
<div style="width:187mm;">
<div class="styLNLeftLtrBox" style="height:4mm;">
<span style="width:4px;"/>e</div>
<div class="styLNDesc" style="width:99mm;height:4mm;">Deductible interest on amounts left on deposit
<span style="letter-spacing:4mm;font-weight:bold">........</span>
</div>
<div class="styLNRightNumBox" style="height:4mm;">10e</div>
<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/DeductibleInterest"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
<div class="styLNAmountBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
</div>
<!-- SCH F line 10f blank -->
<div style="width:187mm;">
<div class="styLNLeftLtrBox" style="height:4mm;">
<span style="width:4px;"/>
</div>
<div class="styLNDesc" style="width:139mm;height:4mm;"/>
<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
<div class="styLNAmountBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
</div>
<!-- SCH F line 10f -->
<div style="width:187mm;">
<div class="styLNLeftLtrBox" style="height:4mm;">
<span style="width:4px;"/>f</div>
<div class="styLNDesc" style="width:139mm;height:4mm;">
 Total policy interest. Add lines 10a through 10e. Enter here and on line 26 below 
<span style="letter-spacing:4mm;font-weight:bold">.......</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">10f</div>
<div class="styLNAmountBox" style="height:4.5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/TotalPolicyInterest"/>
</xsl:call-template>
</div>
</div>
<!-- SCH F line 11 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">11 </div>
<div class="styLNDesc" style="width:139mm;height:4mm;">Subtract line 10f from line 9 
<span style="letter-spacing:4mm;font-weight:bold">.....................</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">11</div>
<div class="styLNAmountBox" style="height:4.5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/GrossInvstIncmLessTotPolicyInt"/>
</xsl:call-template>
</div>
</div>
<!-- SCH F line 12 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">12 </div>
<div class="styLNDesc" style="width:99mm;height:4mm;">Life insurance company gross income (see instructions)
<span style="letter-spacing:4mm;font-weight:bold">.....</span>
</div>
<div class="styLNRightNumBox" style="height:4mm;">12 </div>
<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/GrossIncome"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
<div class="styLNAmountBox" style="height:4.5mm;background-color:lightgrey;;border-bottom-width:0px"/>
</div>
<!-- SCH F line 13 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">13 </div>
<div class="styLNDesc" style="width:99mm;height:4mm;">
 Tax-exempt interest and the increase in policy cash value of section 264(f) policies as defined in section 805(a)(4)(F).
  (Enter the sum of Schedule B, line 9 and line 10.)
<span style="letter-spacing:4mm;font-weight:bold">...............</span>
</div>
<div class="styLNRightNumBox" style="height:11mm;padding-top:6mm">13 </div>
<div class="styLNAmountBox" style="border-bottom-width:1px;height:11mm;padding-top:6mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/TaxExemptIntIncreaseInPolicy"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBox" style="height:11mm;background-color:lightgrey;border-bottom-width:0px"/>
<div class="styLNAmountBox" style="height:11mm;background-color:lightgrey;;border-bottom-width:0px"/>
</div>
<!-- SCH F line 14 blank -->
<div style="width:187mm;">
<div class="styLNLeftLtrBox" style="height:4mm;">
<span style="width:4px;"/>
</div>
<div class="styLNDesc" style="width:139mm;height:5mm;"/>
<div class="styLNRightNumBox" style="height:5mm;border-bottom-width:0px"/>
<div class="styLNAmountBox" style="height:5mm;border-bottom-width:0px"/>
</div>
<!-- SCH F line 14 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4mm;">14 </div>
<div class="styLNDesc" style="width:139mm;height:4mm;">Add lines 12 and 13
<span style="letter-spacing:4mm;font-weight:bold">.......................</span>
</div>
<div class="styLNRightNumBox" style="height:4mm;">14</div>
<div class="styLNAmountBox" style="height:4mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/TotGrossIncomeAndTaxExemptInt"/>
</xsl:call-template>
</div>
</div>
<!-- SCH F line 15 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">15</div>
<div class="styLNDesc" style="width:139mm;height:4mm;">
 Increase in reserves from line 8. (If a decrease in reserves, enter -0-.) 
<span style="letter-spacing:4mm;font-weight:bold">..........</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">15</div>
<div class="styLNAmountBox" style="height:4.5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/IncreaseInReserves"/>
</xsl:call-template>
</div>
</div>
<!-- SCH F line 16 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">16</div>
<div class="styLNDesc" style="width:139mm;height:4mm;">Subtract line 15 from line 14 
 <span style="letter-spacing:4mm;font-weight:bold">.....................</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px">16</div>
<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/Line14LessLine15"/>
</xsl:call-template>
</div>
</div>
<!-- SCH F line 17 -->
<!--
When data value is longer then 16 digits expand the width of the 
amount box so the data value can be displayed properly.
Otherwise display the data value in an amount box with a normal width.
-->
<xsl:choose>
<xsl:when test="string-length($IRS1120LScheduleF/InvestmentIncomeRatio) &gt; 15">
<div class="styBB" style="width:187mm;">
<div class="styLNLeftNumBox" style="height:5mm;">17 </div>
<div class="styLNDesc" style="width:126mm;height:4mm;">
Investment income ratio. Divide line 11 by line 16. If zero or less, enter -0-. 
<span style="letter-spacing:4mm;font-weight:bold">.....</span>
</div>
<div class="styLNRightNumBoxNBB" style="height:5mm;border-top-width:1px;">17</div>
<div class="styLNAmountBoxNBB" style="height:5mm;border-top-width:1px;">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/InvestmentIncomeRatio"/>
</xsl:call-template>%
</div>
</div>
</xsl:when>
<xsl:otherwise>
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">17</div>
<div class="styLNDesc" style="width:139mm;height:4mm;">
Investment income ratio. Divide line 11 by line 16
<span style="letter-spacing:4mm;font-weight:bold">..........................</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;border-top-width:1px">17</div>
<div class="styLNAmountBox" style="height:4.5mm;border-top-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/InvestmentIncomeRatio"/>
</xsl:call-template>%
</div>
</div>
</xsl:otherwise>
</xsl:choose>
<!-- SCH F line 18a -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">18a</div>
<div class="styLNDesc" style="width:99mm;height:4mm;">Policyholder dividends paid or accrued
<span style="letter-spacing:4mm;font-weight:bold">..........</span>
</div>
<div class="styLNRightNumBox" style="height:4mm;">18a</div>
<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/PolicyholderDivPaidOrAccrued"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
<div class="styLNAmountBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
</div>
<!-- SCH F line 18b -->
<div style="width:187mm;">
<div class="styLNLeftLtrBox" style="height:4mm;">
<span style="width:4px;"/>b</div>
<div class="styLNDesc" style="width:99mm;height:4mm;">Excess interest from line 10b
<span style="letter-spacing:4mm;font-weight:bold">.............</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">18b</div>
<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/ExcessInterest"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
<div class="styLNAmountBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
</div>
<!-- SCH F line 18c -->
<div style="width:187mm;">
<div class="styLNLeftLtrBox" style="height:4mm;">
<span style="width:4px;"/>c</div>
<div class="styLNDesc" style="width:99mm;height:4mm;">Premium adjustments
<span style="letter-spacing:4mm;font-weight:bold">...............</span>
</div>
<div class="styLNRightNumBox" style="height:4mm;">18c</div>
<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/PremiumAdjustments"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
<div class="styLNAmountBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
</div>
<!-- SCH F line 18d -->
<div style="width:187mm;">
<div class="styLNLeftLtrBox" style="height:4mm;">
<span style="width:4px;"/>d</div>
<div class="styLNDesc" style="width:99mm;height:4mm;">Experience-rated refunds
<span style="letter-spacing:4mm;font-weight:bold">..............</span>
</div>
<div class="styLNRightNumBox" style="height:4mm;">18d</div>
<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/ExperienceRatedRefunds"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
<div class="styLNAmountBox" style="height:4.5mm;background-color:lightgrey;;border-bottom-width:0px"/>
</div>
<!-- SCH F line 18e -->
<div style="width:187mm;">
<div class="styLNLeftLtrBox" style="height:4mm;">
<span style="width:4px;"/>e</div>
<div class="styLNDesc" style="width:139mm;height:4mm;">
Deductible policyholder dividends. Add lines 18a through 18d. Enter here and on page 1, line 12
<span class="styBoldText">
<span style="width:16px"/>.
<span style="width:16px"/>.
</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">18e</div>
<div class="styLNAmountBox" style="height:4.5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/DeductiblePolicyholderDiv"/>
</xsl:call-template>
</div>
</div>
<!-- SCH F line 19 blank -->
<div style="width:187mm;">
<div class="styLNLeftLtrBox" style="height:4mm;">
<span style="width:4px;"/>
</div>
<div class="styLNDesc" style="width:139mm;height:4mm;"/>
<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
<div class="styLNAmountBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
</div>
<!-- SCH F line 19 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">19 </div>
<div class="styLNDesc" style="width:99mm;height:4mm;">Deductible excess interest from line 10b
 <span style="letter-spacing:4mm;font-weight:bold">.........</span>
</div>
<div class="styLNRightNumBox" style="height:4mm;">19 </div>
<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/DeductibleExcess"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
<div class="styLNAmountBox" style="height:4.5mm;background-color:lightgrey;;border-bottom-width:0px"/>
</div>
<!-- SCH F line 20 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">20 </div>
<div class="styLNDesc" style="width:99mm;height:4mm;">Deductible dividends on employee pension funds
 <span style="letter-spacing:4mm;font-weight:bold">.......</span>
</div>
<div class="styLNRightNumBox" style="height:4mm;">20 </div>
<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/EmployeePensionFunds"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
<div class="styLNAmountBox" style="height:4.5mm;background-color:lightgrey;;border-bottom-width:0px"/>
</div>
<!-- SCH F line 21 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">21 </div>
<div class="styLNDesc" style="width:99mm;height:4mm;">Deductible dividends on deferred annuities
<span style="letter-spacing:4mm;font-weight:bold">.........</span>
</div>
<div class="styLNRightNumBox" style="height:4mm;">21 </div>
<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/DeferredAnnuities"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
<div class="styLNAmountBox" style="height:4.5mm;background-color:lightgrey;;border-bottom-width:0px"/>
</div>
<!-- SCH F line 22 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">22 </div>
<div class="styLNDesc" style="width:99mm;height:4.5mm;">
Deductible premium and mortality charges for contracts paying excess interest
<span style="letter-spacing:4mm;font-weight:bold">..................</span>
</div>
<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">22 </div>
<div class="styLNAmountBox" style="border-bottom-width:1px;height:8mm;padding-top:4mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/MortalityCharges"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBox" style="height:8mm;background-color:lightgrey;border-bottom-width:0px"/>
<div class="styLNAmountBox" style="height:8mm;background-color:lightgrey;border-bottom-width:0px"/>
</div>
<!-- SCH F line 23 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">23</div>
<div class="styLNDesc" style="width:139mm;height:4mm;">Add lines 19 through 22
 <span style="letter-spacing:4mm;font-weight:bold">......................</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">23</div>
<div class="styLNAmountBox" style="height:4.5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/TotalLines19Through22"/>
</xsl:call-template>
</div>
</div>
<!-- SCH F line 24 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">24</div>
<div class="styLNDesc" style="width:139mm;height:4mm;">Subtract line 23 from line 18e
<span style="letter-spacing:4mm;font-weight:bold">.....................</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">24</div>
<div class="styLNAmountBox" style="height:4.5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/Line18eLessLine23"/>
</xsl:call-template>
</div>
</div>
<!-- SCH F line 25 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">25</div>
<div class="styLNDesc" style="width:139mm;height:4mm;">
 Investment portion of dividends. Line 17 times line 24
<span style="letter-spacing:4mm;font-weight:bold">..............</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">25</div>
<div class="styLNAmountBox" style="height:4.5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/InvestmentPortion"/>
</xsl:call-template>
</div>
</div>
<!-- SCH F line 26 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">26</div>
<div class="styLNDesc" style="width:139mm;height:4mm;">Policy interest from line 10f
<span style="letter-spacing:4mm;font-weight:bold">.....................</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">26</div>
<div class="styLNAmountBox" style="height:4.5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/PolicyInterest"/>
</xsl:call-template>
</div>
</div>
<!-- SCH F line 27 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">27</div>
<div class="styLNDesc" style="width:139mm;height:4mm;">Policyholder share amount. Add lines 25 and 26
<span style="letter-spacing:4mm;font-weight:bold">................</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">27</div>
<div class="styLNAmountBox" style="height:4.5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/PolicyholderShareAmount"/>
</xsl:call-template>
</div>
</div>
<!-- SCH F line 28 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">28</div>
<div class="styLNDesc" style="width:139mm;height:4mm;">Net investment income (see instructions)
<span style="letter-spacing:4mm;font-weight:bold">..................</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">28</div>
<div class="styLNAmountBox" style="height:4.5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/NetInvestmentIncome"/>
</xsl:call-template>
</div>
</div>
<!-- SCH F line 29 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">29</div>
<div class="styLNDesc" style="width:139mm;height:4mm;">Policyholder share amount from line 27
<span style="letter-spacing:4mm;font-weight:bold">..................</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">29</div>
<div class="styLNAmountBox" style="height:4.5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/PolicyholderShareAmount29"/>
</xsl:call-template>
</div>
</div>
<!-- SCH F line 30 -->
<div class="styBB" style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">30</div>
<div class="styLNDesc" style="width:139mm;height:4mm;">
 Company share of net investment income. Subtract line 29 from line 28 
<span style="letter-spacing:4mm;font-weight:bold">.........</span>
</div>
<div class="styLNRightNumBoxNBB" style="height:4.5mm;">30</div>
<div class="styLNAmountBoxNBB" style="height:4.5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/CompanyShareNetInvestmentIncm"/>
</xsl:call-template>
</div>
</div>
<!-- SCH F line 31 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">31</div>
<div class="styLNDesc" style="width:139mm;height:4mm;">Total share percentage 
<span style="letter-spacing:4mm;font-weight:bold">.......................</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px">31</div>
<div class="styLNAmountBox" style="height:4.5mm;text-align:center;border-bottom-width:0px">
<i>100%</i>
</div>
</div>
<!-- SCH F line 32 -->
<!--

When data value is longer then 16 digits expand the width of the 
amount box so the data value can be displayed properly.
Otherwise display the data value in an amount box with a normal width.
-->
<xsl:choose>
<xsl:when test="string-length($IRS1120LScheduleF/InvestmentIncomeRatio) &gt; 15">
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:5mm;">32</div>
<div class="styLNDesc" style="width:126mm;height:4mm;">
<span class="styBoldText">Company share percentage. </span> Divide line 30 by line 28. Enter here and on Schedule A, line 11
</div>
<div class="styLNRightNumBoxNBB" style="height:5mm;border-top-width:1px;">32</div>
<div class="styLNAmountBoxNBB" style="height:5mm;border-top-width:1px;">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/CompanySharePercentage"/>
</xsl:call-template>%
</div>
</div>
</xsl:when>
<xsl:otherwise>
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">32</div>
<div class="styLNDesc" style="width:139mm;height:4mm;">
<span class="styBoldText">Company share percentage. </span> Divide line 30 by line 28. Enter here and on Schedule A, line 11
<span style="letter-spacing:4mm;font-weight:bold">.....</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;border-top-width:1px">32</div>
<div class="styLNAmountBox" style="height:4.5mm;border-top-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/CompanySharePercentage"/>
</xsl:call-template>%
</div>
</div>
</xsl:otherwise>
</xsl:choose>
<!-- SCH F line 33 -->
<!--When data value is longer then 16 digits expand the width of the 
amount box so the data value can be displayed properly.
Otherwise display the data value in an amount box with a normal width.-->
<xsl:choose>
<xsl:when test="string-length($IRS1120LScheduleF/InvestmentIncomeRatio) &gt; 15">
<div class="styBB" style="width:187mm;">
<div class="styLNLeftNumBox" style="height:5mm;">33</div>
<div class="styLNDesc" style="width:126mm;height:4mm;">
<span class="styBoldText">Policyholders&#8217; share percentage. </span> Subtract line 32 from line 31
<span style="letter-spacing:4mm;font-weight:bold">........</span>
</div>
<div class="styLNRightNumBoxNBB" style="height:5mm;border-top-width:1px;">33</div>
<div class="styLNAmountBoxNBB" style="height:5mm;border-top-width:1px;">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/PolicyholdersSharePercentage"/>
</xsl:call-template>%
</div>
</div>
</xsl:when>
<xsl:otherwise>
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">33</div>
<div class="styLNDesc" style="width:139mm;height:4mm;">
<span class="styBoldText">Policyholders&#8217; share percentage. </span> Subtract line 32 from line 31
<span style="letter-spacing:4mm;font-weight:bold">.....</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;border-top-width:1px">33</div>
<div class="styLNAmountBox" style="height:4.5mm;border-top-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/PolicyholdersSharePercentage"/>
</xsl:call-template>%
</div>
</div>
</xsl:otherwise>
</xsl:choose>
<!-- SCH F line 34 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">34</div>
<div class="styLNDesc" style="width:139mm;height:4mm;">
Policyholders&#8217; share of tax-exempt interest and the increase in policy cash value of section 264(f)
policies as defined in section 805(a)(4)(F). Multiply line 13 by line 33
<span style="letter-spacing:4mm;font-weight:bold">..........</span>
</div>
<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">34</div>
<div class="styLNAmountBox" style="height:8mm;padding-top:4mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/PolicyholdersShareTaxExemptInt"/>
</xsl:call-template>
</div>
</div>
<!-- SCH F line 35 -->
<div class="styBB" style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">35</div>
<div class="styLNDesc" style="width:139mm;height:4mm;">
<span class="styBoldText">Net increase (decrease) in reserves. </span>
 Subtract line 34 from line 8. If an increase, enter here and on page 1,
  line 10. If a (decrease), enter here and on page 1, line 2 
<span style="letter-spacing:4mm;font-weight:bold">.............</span>
</div>
<div class="styLNRightNumBoxNBB" style="height:8mm;padding-top:4mm">35</div>
<div class="styLNAmountBoxNBB" style="height:8mm;padding-top:4mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/NetIncreaseDecreaseInReserves"/>
</xsl:call-template>
</div>
</div>
<!-- Page Break and Footer-->
<div class="pageEnd" style="width:187mm;padding-top:1mm;">
<div style="float:left;"/>
<div style="float:right;">
<span style="width:40px;"/>  
 Form <span class="styBoldText" style="font-size:8pt;">1120-L</span> (2011)
 </div>
</div>
<!-- END Page Break and Footer-->
<!--Begin Page 4 -->
<!-- Page Header -->
<div class="styBB" style="width:187mm;padding-top:.5mm;">
<div style="float:left;">Form 1120-L (2011)<span style="width:148mm;"/>
</div>
<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">4</span>
</div>
</div>
<!-- END Page Header -->
<!-- BEGIN Schedule G Title -->
<div class="styBB" style="width:187mm;">
<div class="styPartName" style="width:23mm;">Schedule G</div>
<div class="styPartDesc" style="width:164mm;">Policy Acquisition Expenses <span style="font-weight: normal">(section 848) (see instructions)</span>
</div>
</div>
<!-- SCH G header line -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;"/>
<div class="styLNDesc" style="width:75mm;height:4mm;"/>
<div class="styLNRightNumBoxNBB" style="height:8mm;padding-top:4mm"/>
<div class="styLNAmountBox" style="height:8mm;width:32mm;text-align:center;border-bottom-width:2px">
<span class="styBoldText">(a) </span> Annuity</div>
<div class="styLNAmountBox" style="height:8mm;width:32mm;text-align:center;border-bottom-width:2px">
<span class="styBoldText">(b) </span> Group life<br/> insurance</div>
<div class="styLNAmountBox" style="height:8mm;width:32mm;text-align:center;border-bottom-width:2px">
<span class="styBoldText">(c) </span> Other </div>
</div>
<!-- SCH G line 1 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">1</div>
<div class="styLNDesc" style="width:75mm;height:4mm;">
 Gross premiums and other consideration
<span style="letter-spacing:4mm;font-weight:bold">.....</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">1</div>
<div class="styLNAmountBox" style="height:4.5mm;width:32mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/GrossPremiumsAnnuity"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:4.5mm;width:32mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/GrossPremiumsGroupLifeIns"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:4.5mm;width:32mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/GrossPremiumsOther"/>
</xsl:call-template>
</div>
</div>
<!-- SCH G line 2 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">2</div>
<div class="styLNDesc" style="width:75mm;height:4mm;">
 Return premiums and premiums and other consideration incurred for reinsurance
<span style="letter-spacing:4mm;font-weight:bold">.........</span>
</div>
<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">2</div>
<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:4mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/ReturnPremiumsAnnuity"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:4mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/ReturnPremiumsGroupLifeIns"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:4mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/ReturnPremiumsOther"/>
</xsl:call-template>
</div>
</div>
<!-- SCH G line 3 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">3</div>
<div class="styLNDesc" style="width:75mm;height:4mm;">
Net premiums. Subtract line 2 from line 1
<span style="letter-spacing:4mm;font-weight:bold">....</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">3</div>
<div class="styLNAmountBox" style="height:4.5mm;width:32mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/NetPremiumsAnnuity"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:4.5mm;width:32mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/NetPremiumsGroupLifeIns"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:4.5mm;width:32mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/NetPremiumsOther"/>
</xsl:call-template>
</div>
</div>
<!-- SCH G line 4 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">4</div>
<div class="styLNDesc" style="width:75mm;height:4mm;">Net premium percentage
<span style="letter-spacing:4mm;font-weight:bold">.........</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">4</div>
<div class="styLNAmountBox" style="height:4.5mm;width:32mm;text-align:center">
<i>1.75%</i>
</div>
<div class="styLNAmountBox" style="height:4.5mm;width:32mm;text-align:center">
<i>2.05%</i>
</div>
<div class="styLNAmountBox" style="height:4.5mm;width:32mm;text-align:center">
<i>7.7%</i>
</div>
</div>
<!-- SCH G line 5 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">5</div>
<div class="styLNDesc" style="width:75mm;height:4mm;">Multiply line 3 by line 4
<span style="letter-spacing:4mm;font-weight:bold">.........</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">5</div>
<div class="styLNAmountBox" style="height:4.5mm;width:32mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/Multiply3By4Annuity"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:4.5mm;width:32mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/Multiply3By4GroupLifeIns"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:4.5mm;width:32mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/Multiply3By4Other"/>
</xsl:call-template>
</div>
</div>
<!-- SCH G line 6 blank -->
<div style="width:187mm;">
<div class="styLNLeftLtrBox" style="height:4mm;">
<span style="width:4px;"/>
</div>
<div class="styLNDesc" style="width:139mm;height:5mm;"/>
<div class="styLNRightNumBox" style="height:5mm;border-bottom-width:0px"/>
<div class="styLNAmountBox" style="height:5mm;border-bottom-width:0px"/>
</div>
<!-- SCH G line 6 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:5mm;">6 </div>
<div class="styLNDesc" style="width:139mm;height:4mm;">
Combine line 5, columns (a), (b), and (c), and enter here. If zero or less, enter -0- on lines 7 and 8
<span style="letter-spacing:4mm;font-weight:bold">..</span>
</div>
<div class="styLNRightNumBox" style="height:5mm;">6</div>
<div class="styLNAmountBox" style="height:5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/TotalLines5a5b5c"/>
</xsl:call-template>
</div>
</div>
<!-- SCH G line 7 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:5mm;">7 </div>
<div class="styLNDesc" style="width:139mm;height:4mm;">
Unused balance of negative capitalization amount from prior years
<span style="letter-spacing:4mm;font-weight:bold">...........</span>
</div>
<div class="styLNRightNumBox" style="height:5mm;">7</div>
<div class="styLNAmountBox" style="height:5mm;">(
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/UnusedBalanceNegCapAmountPY"/>
</xsl:call-template>)
</div>
</div>
<!-- SCH G line 8 blank -->
<div style="width:187mm;">
<div class="styLNLeftLtrBox" style="height:4mm;">
<span style="width:4px;"/>
</div>
<div class="styLNDesc" style="width:139mm;height:5mm;"/>
<div class="styLNRightNumBox" style="height:5mm;border-bottom-width:0px"/>
<div class="styLNAmountBox" style="height:5mm;border-bottom-width:0px"/>
</div>
<!-- SCH F line 8 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:5mm;">8 </div>
<div class="styLNDesc" style="width:139mm;height:4mm;">
Combine lines 6 and 7. If zero or less, enter -0-
<span style="letter-spacing:4mm;font-weight:bold">................</span>
</div>
<div class="styLNRightNumBox" style="height:5mm;">8</div>
<div class="styLNAmountBox" style="height:5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/TotalLines6And7"/>
</xsl:call-template>
</div>
</div>
<!-- SCH G line 9 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:5mm;">9 </div>
<div class="styLNDesc" style="width:139mm;height:4mm;">
General deductions (attach schedule)
<xsl:call-template name="SetFormLinkInline">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/GeneralDeductions"/>
</xsl:call-template>
<span style="letter-spacing:4mm;font-weight:bold">..................</span>
</div>
<div class="styLNRightNumBox" style="height:5mm;">9</div>
<div class="styLNAmountBox" style="height:5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/GeneralDeductions"/>
</xsl:call-template>
</div>
</div>
<!-- SCH G line 10 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">10</div>
<div class="styLNDesc" style="width:139mm;height:4mm;">
Enter the lesser of line 8 or line 9
<span style="letter-spacing:4mm;font-weight:bold">....................</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">10</div>
<div class="styLNAmountBox" style="height:4.5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/LesserLine8OrLine9"/>
</xsl:call-template>
</div>
</div>
<!-- SCH G line 11 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">11</div>
<div class="styLNDesc" style="width:139mm;height:4mm;">
   Deductible general deductions. Subtract line 10 from line 9. Enter here and include on page 1, line 18
 </div>
<div class="styLNRightNumBox" style="height:4.5mm;">11</div>
<div class="styLNAmountBox" style="height:4.5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/DeductibleGeneralDeductions"/>
</xsl:call-template>
</div>
</div>
<!-- SCH G line 12 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">12</div>
<div class="styLNDesc" style="width:139mm;height:4.5mm;">
 If the amount on line 6 is negative, enter it as a positive amount. If the amount on line 6 is positive, enter -0-

</div>
<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">12</div>
<div class="styLNAmountBox" style="height:8mm;padding-top:4mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/AmountOfLine6"/>
</xsl:call-template>
</div>
</div>
<!-- SCH G line 13 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:5mm;">13 </div>
<div class="styLNDesc" style="width:139mm;height:4mm;">
Unamortized specified policy acquisition expenses from prior years
<span style="letter-spacing:4mm;font-weight:bold">..........</span>
</div>
<div class="styLNRightNumBox" style="height:5mm;">13</div>
<div class="styLNAmountBox" style="height:5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/UnamortzSpcfdPlcyAcqExpnss"/>
</xsl:call-template>
</div>
</div>
<!-- SCH G line 14 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">14</div>
<div class="styLNDesc" style="width:139mm;height:4mm;">
Deductible negative capitalization amount. Enter the lesser of line 12 or line 13
<span style="letter-spacing:4mm;font-weight:bold">.......</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">14</div>
<div class="styLNAmountBox" style="height:4.5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/DedNegativeCapitalization"/>
</xsl:call-template>
</div>
</div>
<!-- SCH G line 15a -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:8mm;">15a </div>
<div class="styLNDesc" style="width:99mm;height:8mm;">
Tentative 60-month specified policy acquisition expenses. Enter amount from line 10, but not more than $5 million
<span style="letter-spacing:4mm;font-weight:bold">.........</span>
</div>
<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">15a </div>
<div class="styLNAmountBox" style="width:40mm;border-bottom-width:1px;height:8mm;padding-top:4mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/Tentative60MonthSpecifiedPlcy"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;background-color:lightgrey;;border-bottom-width:0px"/>
</div>
<!-- SCH G line 15b -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:5mm;padding-left:4mm">b </div>
<div class="styLNDesc" style="width:99mm;height:5mm;">Limitation
<span style="letter-spacing:4mm;font-weight:bold">.................</span>
</div>
<div class="styLNRightNumBox" style="height:5mm;">15b </div>
<div class="styLNAmountBox" style="width:40mm;border-bottom-width:1px;height:5mm;">
<i>$10,000,000</i>
</div>
<div class="styLNAmountBox" style="height:5mm;background-color:lightgrey;border-bottom-width:0px"/>
</div>
<!-- SCH G line 16 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">16 </div>
<div class="styLNDesc" style="width:99mm;height:4.5mm;">
  Phase-out amount. Subtract line 15b from line 10. If zero or less, enter -0-
</div>
<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">16 </div>
<div class="styLNAmountBox" style="width:40mm;border-bottom-width:1px;height:8mm;padding-top:4mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/PhaseOutAmount"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;background-color:lightgrey;border-bottom-width:0px"/>
</div>
<!-- SCH F line 17a -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:8mm;">17a </div>
<div class="styLNDesc" style="width:99mm;height:8mm;">
Current year 60-month specified policy acquisition expenses. Subtract line 16 from line 15a. If zero or less,
enter -0-
<span style="letter-spacing:4mm;font-weight:bold">........</span>
</div>
<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">17a </div>
<div class="styLNAmountBox" style="width:40mm;border-bottom-width:1px;height:8mm;padding-top:4mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/Current60MonthSpecifiedPlcy"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;background-color:lightgrey;;border-bottom-width:0px"/>
</div>
<!-- SCH G line 17b -->
<div style="width:187mm;">
<div class="styLNLeftLtrBox" style="height:8mm;">
<span style="width:4px;padding-top:4mm"/>b</div>
<div class="styLNDesc" style="width:139mm;height:4mm;padding-top:4mm">
Enter 10% of line 17a
<span style="letter-spacing:4mm;font-weight:bold">.......................</span>
</div>
<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">17b</div>
<div class="styLNAmountBox" style="height:8mm;padding-top:4mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/TenPercentLine17a"/>
</xsl:call-template>
</div>
</div>
<!-- SCH G line 18a -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:8mm;">18a </div>
<div class="styLNDesc" style="width:99mm;height:8mm;">
Current year 120-month specified policy acquisition expenses. Subtract line 17a from line 10
<span style="letter-spacing:4mm;font-weight:bold">...............</span>
</div>
<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">18a </div>
<div class="styLNAmountBox" style="width:40mm;border-bottom-width:1px;height:8mm;padding-top:4mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/Current120MonthSpecifiedPlcy"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;background-color:lightgrey;;border-bottom-width:0px"/>
</div>
<!-- SCH G line 18b -->
<div style="width:187mm;">
<div class="styLNLeftLtrBox" style="height:8mm;">
<span style="width:4px;padding-top:4mm"/>b</div>
<div class="styLNDesc" style="width:139mm;height:8mm;padding-top:4mm">
Enter 5% of line 18a
<span style="letter-spacing:4mm;font-weight:bold">.......................</span>
</div>
<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">18b</div>
<div class="styLNAmountBox" style="height:8mm;padding-top:4mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/FivePercentLine18a"/>
</xsl:call-template>
</div>
</div>
<!-- SCH G line 19 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:5mm;">19 </div>
<div class="styLNDesc" style="width:139mm;height:4mm;">
Enter the applicable amount of amortization from specified policy 
acquisition expenses capitalized in prior years and deductible this year. Attach schedule 
<span class="styBoldText">
<xsl:call-template name="SetFormLinkInline">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/AmtAmortizationSpecifiedPlcy"/>
</xsl:call-template>
<span style="letter-spacing:4mm;font-weight:bold">.............</span>
</span>
</div>
<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">19</div>
<div class="styLNAmountBox" style="height:8mm;padding-top:4mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/AmtAmortizationSpecifiedPlcy"/>
</xsl:call-template>
</div>
</div>
<!-- SCH G line 20 -->
<div class="styBB" style="width:187mm;">
<div class="styLNLeftNumBox" style="height:5mm;">20 </div>
<div class="styLNDesc" style="width:139mm;height:5mm;">
<b>Deductible policy acquisition expenses.</b> Add lines 14, 17b, 18b, and 19. Enter here and on page 1, line 16
<span style="letter-spacing:4mm;font-weight:bold">............................</span>
</div>
<div class="styLNRightNumBox" style="height:8mm;border-bottom-width:0px;padding-top:4mm">20</div>
<div class="styLNAmountBox" style="height:8mm;border-bottom-width:0px;;padding-top:4mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/DedPolicyAcquisitionExpenses"/>
</xsl:call-template>
</div>
</div>
<!-- Page Break and Footer-->
<div class="pageEnd" style="width:187mm;padding-top:1mm;">
<div style="float:left;"/>
<div style="float:right;">
<span style="width:40px;"/>  
Form <span class="styBoldText" style="font-size:8pt;">1120-L</span> (2011)

</div>
</div>
<!-- END Page Break and Footer-->
<!--Begin Page 5 -->
<!-- Page Header -->
<div class="styBB" style="width:187mm;padding-top:.5mm;">
<div style="float:left;">Form 1120-L (2011)<span style="width:148mm;"/>
</div>
<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">5</span>
</div>
</div>
<!-- BEGIN Schedule H Title -->
<div class="styBB" style="width:187mm;">
<div class="styPartName" style="width:23mm;">Schedule H</div>
<div class="styPartDesc" style="width:164mm;">
Small Life Insurance Company Deduction <span class="styNormalText">(section 806(a)) (see instructions)</span>
</div>
</div>
<div class="styBB" style="width:187mm;text-align:center;font-size:9pt;font-weight:bold">Part I&#8212; Controlled Group Information</div>
<!-- SCH H header line1 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;"/>
<div class="styLNAmountBoxNBB" style="height:4.5mm;width:115mm;border-left-width:0px"/>
<div class="styLNAmountBox" style="height:4.5mm;width:64mm;text-align:center">
Tentative LICTI</div>
</div>
<!-- SCH H header line2 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;"/>
<div class="styLNAmountBox" style="height:4.5mm;width:115mm;border-left-width:0px;
text-align:center">Name of company</div>
<div class="styLNAmountBox" style="height:4.5mm;width:32mm;text-align:center">
<span class="styBoldText">(a) </span>Income</div>
<div class="styLNAmountBox" style="height:4.5mm;width:31.5mm;text-align:center">
<span class="styBoldText">(b) </span>(Loss)</div>
</div>
<!-- SCH H line 1 -->
<div style="width:187mm;">
<xsl:for-each select="$IRS1120LScheduleH/ControlledGroupInformation">
<xsl:choose>
<xsl:when test="(position() &lt; 5) or (position() = 5)">
<div class="styLNLeftNumBox" style="height:6mm;">
<xsl:value-of select="position()"/>
</div>
</xsl:when>
<xsl:otherwise>
<div class="styLNLeftNumBox" style="height:6mm;"/>
</xsl:otherwise>
</xsl:choose>
<div class="styLNAmountBox" style="height:8mm;width:115mm;border-left-width:0px;
text-align:left; border-bottom-width: 1px solid black;overflow:hidden">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="CompanyName/BusinessNameLine1"/>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="CompanyName/BusinessNameLine2"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;width:32mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="TentativeIncome"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;width:31.5mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="TentativeLoss"/>
</xsl:call-template>
</div>
</xsl:for-each>
<!--  *******************************************************************************************  -->
<xsl:if test=" (count($IRS1120LScheduleH/ControlledGroupInformation) =0)">
<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm">1
</div>
<div class="styLNAmountBox" style="height:8mm;width:115mm;border-left-width:0px;
text-align:left; border-bottom-width: 1px solid black;overflow:hidden">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="CompanyName/BusinessNameLine1"/>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="CompanyName/BusinessNameLine2"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;width:32mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="TentativeIncome"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;width:31.5mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="TentativeLoss"/>
</xsl:call-template>
</div>
<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm">2
</div>
<div class="styLNAmountBox" style="height:8mm;width:115mm;border-left-width:0px;
text-align:left; border-bottom-width: 1px solid black;overflow:hidden">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="CompanyName/BusinessNameLine1"/>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="CompanyName/BusinessNameLine2"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;width:32mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="TentativeIncome"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;width:31.5mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="TentativeLoss"/>
</xsl:call-template>
</div>
<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm">3
</div>
<div class="styLNAmountBox" style="height:8mm;width:115mm;border-left-width:0px;
text-align:left; border-bottom-width: 1px solid black;overflow:hidden">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="CompanyName/BusinessNameLine1"/>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="CompanyName/BusinessNameLine2"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;width:32mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="TentativeIncome"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;width:31.5mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="TentativeLoss"/>
</xsl:call-template>
</div>
<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm">4
</div>
<div class="styLNAmountBox" style="height:8mm;width:115mm;border-left-width:0px;
text-align:left; border-bottom-width: 1px solid black;overflow:hidden">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="CompanyName/BusinessNameLine1"/>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="CompanyName/BusinessNameLine2"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;width:32mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="TentativeIncome"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;width:31.5mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="TentativeLoss"/>
</xsl:call-template>
</div>
<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm">5
</div>
<div class="styLNAmountBox" style="height:8mm;width:115mm;border-left-width:0px;
text-align:left; border-bottom-width: 1px solid black;overflow:hidden">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="CompanyName/BusinessNameLine1"/>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="CompanyName/BusinessNameLine2"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;width:32mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="TentativeIncome"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;width:31.5mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="TentativeLoss"/>
</xsl:call-template>
</div>
</xsl:if>  
<!--  *******************************************************************************************  -->
<xsl:if test=" (count($IRS1120LScheduleH/ControlledGroupInformation) =1)">
<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm">2
</div>
<div class="styLNAmountBox" style="height:8mm;width:115mm;border-left-width:0px;
text-align:left; border-bottom-width: 1px solid black;overflow:hidden">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="CompanyName/BusinessNameLine1"/>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="CompanyName/BusinessNameLine2"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;width:32mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="TentativeIncome"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;width:31.5mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="TentativeLoss"/>
</xsl:call-template>
</div>
<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm">3
</div>
<div class="styLNAmountBox" style="height:8mm;width:115mm;border-left-width:0px;
text-align:left; border-bottom-width: 1px solid black;overflow:hidden">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="CompanyName/BusinessNameLine1"/>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="CompanyName/BusinessNameLine2"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;width:32mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="TentativeIncome"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;width:31.5mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="TentativeLoss"/>
</xsl:call-template>
</div>
<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm">4
</div>
<div class="styLNAmountBox" style="height:8mm;width:115mm;border-left-width:0px;
text-align:left; border-bottom-width: 1px solid black;overflow:hidden">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="CompanyName/BusinessNameLine1"/>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="CompanyName/BusinessNameLine2"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;width:32mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="TentativeIncome"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;width:31.5mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="TentativeLoss"/>
</xsl:call-template>
</div>
<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm">5
</div>
<div class="styLNAmountBox" style="height:8mm;width:115mm;border-left-width:0px;
text-align:left; border-bottom-width: 1px solid black;overflow:hidden">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="CompanyName/BusinessNameLine1"/>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="CompanyName/BusinessNameLine2"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;width:32mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="TentativeIncome"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;width:31.5mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="TentativeLoss"/>
</xsl:call-template>
</div>
</xsl:if>  
<!--  *******************************************************************************************  -->
<xsl:if test=" (count($IRS1120LScheduleH/ControlledGroupInformation) =2)">
<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm">3
</div>
<div class="styLNAmountBox" style="height:8mm;width:115mm;border-left-width:0px;
text-align:left; border-bottom-width: 1px solid black;overflow:hidden">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="CompanyName/BusinessNameLine1"/>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="CompanyName/BusinessNameLine2"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;width:32mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="TentativeIncome"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;width:31.5mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="TentativeLoss"/>
</xsl:call-template>
</div>
<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm">4
</div>
<div class="styLNAmountBox" style="height:8mm;width:115mm;border-left-width:0px;
text-align:left; border-bottom-width: 1px solid black;overflow:hidden">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="CompanyName/BusinessNameLine1"/>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="CompanyName/BusinessNameLine2"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;width:32mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="TentativeIncome"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;width:31.5mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="TentativeLoss"/>
</xsl:call-template>
</div>
<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm">5
</div>
<div class="styLNAmountBox" style="height:8mm;width:115mm;border-left-width:0px;
text-align:left; border-bottom-width: 1px solid black;overflow:hidden">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="CompanyName/BusinessNameLine1"/>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="CompanyName/BusinessNameLine2"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;width:32mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="TentativeIncome"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;width:31.5mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="TentativeLoss"/>
</xsl:call-template>
</div>
</xsl:if>  
<!--  *******************************************************************************************  --> 
<xsl:if test=" (count($IRS1120LScheduleH/ControlledGroupInformation) =3)">
<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm">4
</div>
<div class="styLNAmountBox" style="height:8mm;width:115mm;border-left-width:0px;
text-align:left; border-bottom-width: 1px solid black;overflow:hidden">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="CompanyName/BusinessNameLine1"/>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="CompanyName/BusinessNameLine2"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;width:32mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="TentativeIncome"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;width:31.5mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="TentativeLoss"/>
</xsl:call-template>
</div>
<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm">5
</div>
<div class="styLNAmountBox" style="height:8mm;width:115mm;border-left-width:0px;
text-align:left; border-bottom-width: 1px solid black;overflow:hidden">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="CompanyName/BusinessNameLine1"/>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="CompanyName/BusinessNameLine2"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;width:32mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="TentativeIncome"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;width:31.5mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="TentativeLoss"/>
</xsl:call-template>
</div>
</xsl:if>  
<!-- ********************************************************************************************   -->
<xsl:if test=" (count($IRS1120LScheduleH/ControlledGroupInformation) =4)">
<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm">5
</div>
<div class="styLNAmountBox" style="height:8mm;width:115mm;border-left-width:0px;
text-align:left; border-bottom-width: 1px solid black;overflow:hidden">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="CompanyName/BusinessNameLine1"/>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="CompanyName/BusinessNameLine2"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;width:32mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="TentativeIncome"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;width:31.5mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="TentativeLoss"/>
</xsl:call-template>
</div>
</xsl:if>  
</div>
<!-- SCH H line 6 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm">6</div>
<div class="styLNDesc" style="height:8mm;width:115mm;border-left-width:0px;padding-top:4mm">
 Add lines 1 through 5 in both columns
<span style="letter-spacing:4mm;font-weight:bold">.............</span>
</div>
<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:4mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleH/TotalOfLines1Through5ColumnA"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;width:31.5mm;padding-top:4mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleH/TotalOfLines1Through5ColumnB"/>
</xsl:call-template>
</div>
</div>
<!-- SCH H line 7 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:8mm;padding-top:2mm">7</div>
<div class="styLNDesc" style="height:8mm;width:115mm;border-left-width:0px;padding-top:2mm">
Net controlled group tentative LICTI. Subtract line 6, column (b) from line 6, column (a). Enter here and on line 11 below 
<span style="letter-spacing:4mm;font-weight:bold">..............</span>
</div>
<div class="styLNAmountBox" style="height:10mm;width:32mm;padding-top:2mm;background-color:lightgrey;border-bottom-width: 0px;"/>
<div class="styLNAmountBox" style="height:10mm;width:31.5mm;padding-top:6mm;border-bottom-width: 0px;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleH/NetControlledGrpTentativeLICTI"/>
</xsl:call-template>
</div>
</div>
<div class="styBB" style="width:187mm;font-size:8pt;border-top-width: 1px;">
<span class="styBoldText">Part II&#8212; Small Life Insurance Company Deduction </span>
<span style="width:4px"/>
 If total assets (Schedule L, Part I, line 6, column (b)), are $500 million or more, 
complete lines 8 through 12, line 16, and enter -0- on line 17 (see instructions).
</div>
<!-- Part II line 8 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">8 </div>
<div class="styLNDesc" style="width:99mm;height:4.5mm;">
Gain or (loss) from operations from page 1, line 22<span class="styBoldText">
<span style="letter-spacing:4mm;font-weight:bold">.......</span>
</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">8 </div>
<div class="styLNAmountBox" style="width:32mm;border-bottom-width:1px;height:4.5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleH/GainOrLossFromOperationsDed"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:4.5mm;background-color:lightgrey;width:40mm;border-bottom-width:0px"/>
</div>
<!-- Part II line 9a -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">9a </div>
<div class="styLNDesc" style="width:99mm;height:4.5mm;">
Noninsurance income
<span style="letter-spacing:4mm;font-weight:bold">...............</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">9a </div>
<div class="styLNAmountBox" style="width:32mm;border-bottom-width:1px;height:4.5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleH/NoninsuranceIncome"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:4.5mm;background-color:lightgrey;width:40mm;border-bottom-width:0px"/>
</div>
<!-- Part II line 9b -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm">b </div>
<div class="styLNDesc" style="width:99mm;height:4.5mm;">
Noninsurance deductions
<span style="letter-spacing:4mm;font-weight:bold">..............</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">9b </div>
<div class="styLNAmountBox" style="width:32mm;border-bottom-width:1px;height:4.5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleH/NoninsuranceDeductions"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:4.5mm;background-color:lightgrey;width:40mm;border-bottom-width:0px"/>
</div>
<!-- Part II line 10a -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:8mm;">10a </div>
<div class="styLNDesc" style="width:99mm;height:8mm;">
 Gain or (loss) on insurance operations. Subtract line 9a from line 8 and add line 9b
<span style="letter-spacing:4mm;font-weight:bold">..................</span>
</div>
<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">10a </div>
<div class="styLNAmountBox" style="width:32mm;border-bottom-width:1px;height:8mm;padding-top:4mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleH/GainOrLossOnInsOperations"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;background-color:lightgrey;width:40mm;border-bottom-width:0px"/>
</div>
<!-- Part II line 10b -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm">b </div>
<div class="styLNDesc" style="width:99mm;height:4.5mm;">Adjustments (attach schedule)
<xsl:call-template name="SetFormLinkInline">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleH/DeductionAdjustments"/>
</xsl:call-template>
<span style="letter-spacing:4mm;font-weight:bold">............</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">10b </div>
<div class="styLNAmountBox" style="width:32mm;border-bottom-width:1px;height:4.5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleH/DeductionAdjustments"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:4.5mm;background-color:lightgrey;width:40mm;border-bottom-width:0px"/>
</div>
<!-- Part II line 10c -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm">c </div>
<div class="styLNDesc" style="width:99mm;height:4.5mm;">Tentative LICTI. Combine lines 10a and 10b
<span style="letter-spacing:4mm;font-weight:bold">........</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">10c </div>
<div class="styLNAmountBox" style="width:32mm;border-bottom-width:1px;height:4.5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleH/TentativeLICTI"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:4.5mm;background-color:lightgrey;width:40mm;border-bottom-width:0px"/>
</div>
<!-- Part II line 11 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">11 </div>
<div class="styLNDesc" style="width:99mm;height:4.5mm;">
 Net controlled group tentative LICTI from line 7
<span style="letter-spacing:4mm;font-weight:bold">........</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">11 </div>
<div class="styLNAmountBox" style="width:32mm;border-bottom-width:1px;height:4.5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleH/NetCtrlGrpTentativeLICTIPartII"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:4.5mm;background-color:lightgrey;width:40mm;border-bottom-width:0px"/>
</div>
<!-- Part II line 12 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:8mm;">12 </div>
<div class="styLNDesc" style="width:99mm;height:8mm;">
Combined tentative LICTI. Add line 10c and line 11. If $15 million or more, skip lines 13 through 15 
and enter -0- on line 17 below and on page 1, line 23
<span style="letter-spacing:4mm;font-weight:bold">..................</span>
</div>
<div class="styLNRightNumBox" style="height:12mm;padding-top:8mm">12 </div>
<div class="styLNAmountBox" style="width:32mm;border-bottom-width:1px;height:12mm;padding-top:8mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleH/CombinedTentativeLICTI"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:12mm;background-color:lightgrey;width:40mm;border-bottom-width:0px"/>
</div>
<!-- Part II line 13 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:5mm;">13 </div>
<div class="styLNDesc" style="width:139mm;height:4mm;">
Enter 60% of line 12, but not more than $1,800,000
<span style="letter-spacing:4mm;font-weight:bold">...............</span>
</div>
<div class="styLNRightNumBox" style="height:5mm;">13</div>
<div class="styLNAmountBox" style="height:5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleH/CombinedTentativeLICTI60Prcnt"/>
</xsl:call-template>
</div>
</div>
<!-- Part II line 14a -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:5mm;">14a </div>
<div class="styLNDesc" style="width:99mm;height:5mm;">
Maximum statutory amount
<span style="letter-spacing:4mm;font-weight:bold">.............</span>
</div>
<div class="styLNRightNumBox" style="height:5mm;">14a </div>
<div class="styLNAmountBox" style="width:32mm;border-bottom-width:1px;height:5mm;text-align:center">
<i>$3,000,000</i>
</div>
<div class="styLNAmountBox" style="height:5mm;background-color:lightgrey;width:40mm;border-bottom-width:0px"/>
</div>
<!-- Part II line 14b -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:5mm;padding-left:4mm">b </div>
<div class="styLNDesc" style="width:99mm;height:5mm;">
Subtract line 14a from line 12. If zero or less, enter -0-
<span style="letter-spacing:4mm;font-weight:bold">.....</span>
</div>
<div class="styLNRightNumBox" style="height:5mm;">14b </div>
<div class="styLNAmountBox" style="width:32mm;border-bottom-width:1px;height:5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleH/Line12LessLine14a"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:5mm;background-color:lightgrey;width:40mm;border-bottom-width:0px"/>
</div>
<!-- Part II line 14c -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:5mm;padding-left:4mm">c </div>
<div class="styLNDesc" style="width:139mm;height:4mm;">
Enter 15% of line 14b, but not more than $1,800,000
<span style="letter-spacing:4mm;font-weight:bold">..............</span>
</div>
<div class="styLNRightNumBox" style="height:5mm;">14c</div>
<div class="styLNAmountBox" style="height:5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleH/Line14B15Pct"/>
</xsl:call-template>
</div>
</div>
<!-- Part II line 15 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:5mm;">15 </div>
<div class="styLNDesc" style="width:139mm;height:4mm;">
Tentative small life insurance company deduction. Subtract line 14c from line 13 
<span style="letter-spacing:4mm;font-weight:bold">.......</span>
</div>
<div class="styLNRightNumBox" style="height:5mm;border-bottom-width:0px">15</div>
<div class="styLNAmountBox" style="height:5mm;border-bottom-width:0px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleH/TentativeSmallLifeInsCoDed"/>
</xsl:call-template>
</div>
</div>
<!--  Part II line 16 -->
<!--When data value is longer then 16 digits expand the width of the 
amount box so the data value can be displayed properly.
Otherwise display the data value in an amount box with a normal width.-->
<xsl:choose>
<xsl:when test="string-length($IRS1120LScheduleF/InvestmentIncomeRatio) &gt; 15">
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:5mm;">16</div>
<div class="styLNDesc" style="width:126mm;height:4mm;">
 Taxpayer’s share. Divide line 10c by the total of line 6, column (a) and line 10c. If line 10c is zero or
  less, enter -0- on this line
<span style="letter-spacing:4mm;font-weight:bold">.................</span>
</div>
<div class="styLNRightNumBoxNBB" style="height:8mm;border-top-width:1px;padding-top:4mm;border-bottom-width:1px;">16</div>
<div class="styLNAmountBoxNBB" style="height:8mm;border-top-width:1px;padding-top:4mm;border-bottom-width:1px">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleH/TaxpayersShare"/>
</xsl:call-template>
</div>
</div>
</xsl:when>
<xsl:otherwise>
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">16</div>
<div class="styLNDesc" style="width:139mm;height:4mm;">
Taxpayer’s share. Divide line 10c by the total of line 6, column (a) and line 10c. If line 10c is zero or
less, enter -0- on this line
<span style="letter-spacing:4mm;font-weight:bold">...............</span>
</div>
<div class="styLNRightNumBox" style="height:8mm;border-top-width:1px;padding-top:4mm">16</div>
<div class="styLNAmountBox" style="height:8mm;border-top-width:1px;padding-top:4mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleH/TaxpayersShare"/>
</xsl:call-template>%
</div>
</div>
</xsl:otherwise>
</xsl:choose>
<!-- Part II line 17 -->
<div class="styBB" style="width:187mm;border-bottom-width:1px">
<div class="styLNLeftNumBox" style="height:8mm;">17 </div>
<div class="styLNDesc" style="width:139mm;height:8mm;">
<span class="styBoldText">Small life insurance company deduction.</span>
Multiply line 15 by line 16. Enter here and on page 1, line 23, and on Schedule J, Part I, line 2b 
<span style="letter-spacing:4mm;font-weight:bold">...................</span>
</div>
<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;border-bottom-width:0px">17</div>
<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-bottom-width:0px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleH/SmallLifeInsuranceCompanyDed"/>
</xsl:call-template>
</div>
</div>
<!-- BEGIN Schedule I Title -->
<div class="styBB" style="width:187mm;">
<div class="styPartName" style="width:23mm;">Schedule I</div>
<div class="styPartDesc" style="width:164mm;">
Limitation on Noninsurance Losses <span class="styNormalText"> (section 806(b)(3)(C)) (see instructions)</span>
</div>
</div>
<!-- Schedule I line 1 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:5mm;padding-top:2mm">1 </div>
<div class="styLNDesc" style="width:139mm;height:5mm;padding-top:2mm">
Noninsurance income (attach schedule)
<xsl:call-template name="SetFormLinkInline">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleI/NoninsuranceIncomeSchI"/>
</xsl:call-template>
<span style="letter-spacing:4mm;font-weight:bold">.................</span>
</div>
<div class="styLNRightNumBox" style="height:5mm;padding-top:2mm;border-bottom-width:1px">1</div>
<div class="styLNAmountBox" style="height:5mm;padding-top:2mm;border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleI/NoninsuranceIncomeSchI"/>
</xsl:call-template>
</div>
</div>
<!-- Schedule I line 2 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:5mm;padding-top:2mm">2 </div>
<div class="styLNDesc" style="width:139mm;height:5mm;padding-top:2mm">
Noninsurance deductions (attach schedule)
<xsl:call-template name="SetFormLinkInline">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleI/NoninsuranceDeductionsSchI"/>
</xsl:call-template>
<span style="letter-spacing:4mm;font-weight:bold">................</span>
</div>
<div class="styLNRightNumBox" style="height:5mm;padding-top:2mm;border-bottom-width:1px">2</div>
<div class="styLNAmountBox" style="height:5mm;padding-top:2mm;border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleI/NoninsuranceDeductionsSchI"/>
</xsl:call-template>
</div>
</div>
<!-- Schedule I line 3 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:5mm;padding-top:2mm">3 </div>
<div class="styLNDesc" style="width:139mm;height:5mm;padding-top:2mm">
Noninsurance operations loss deductions
<span style="letter-spacing:4mm;font-weight:bold">..................</span>
</div>
<div class="styLNRightNumBox" style="height:5mm;padding-top:2mm;border-bottom-width:1px">3</div>
<div class="styLNAmountBox" style="height:5mm;padding-top:2mm;border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleI/NoninsuranceOperationsLossDed"/>
</xsl:call-template>
</div>
</div>
<!-- Schedule I line 4 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:5mm;padding-top:2mm">4 </div>
<div class="styLNDesc" style="width:139mm;height:5mm;padding-top:2mm">
Add lines 2 and 3
<span style="letter-spacing:4mm;font-weight:bold">........................</span>
</div>
<div class="styLNRightNumBox" style="height:5mm;padding-top:2mm;border-bottom-width:1px">4</div>
<div class="styLNAmountBox" style="height:5mm;padding-top:2mm;border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleI/SchITotalLines2And3"/>
</xsl:call-template>
</div>
</div>
<!-- Schedule I line 5 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:5mm;padding-top:2mm">5 </div>
<div class="styLNDesc" style="width:139mm;height:5mm;padding-top:2mm">
Noninsurance loss. Subtract line 1 from line 4. If line 1 is greater than line 4, 
skip lines 5 through 8 and <br/>enter -0- on line 9 
<span style="letter-spacing:4mm;font-weight:bold">........................</span>
</div>
<div class="styLNRightNumBox" style="height:9mm;padding-top:5mm;border-bottom-width:1px">5</div>
<div class="styLNAmountBox" style="height:9mm;padding-top:5mm;border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleI/NoninsuranceLoss"/>
</xsl:call-template>
</div>
</div>
<!-- Schedule I line 6 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:5mm;padding-top:2mm">6 </div>
<div class="styLNDesc" style="width:139mm;height:5mm;padding-top:2mm">
Enter 35% of line 5
<span style="letter-spacing:4mm;font-weight:bold">.......................</span>
</div>
<div class="styLNRightNumBox" style="height:5mm;padding-top:2mm;border-bottom-width:1px">6</div>
<div class="styLNAmountBox" style="height:5mm;padding-top:2mm;border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleI/NoninsuranceLoss35Pct"/>
</xsl:call-template>
</div>
</div>
<!-- Schedule I line 7 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:5mm;padding-top:2mm">7 </div>
<div class="styLNDesc" style="width:139mm;height:5mm;padding-top:2mm">
Enter 35% of the excess of LICTI (page 1, line 24) over any noninsurance loss included on page 1 
<span class="styBoldText">
<span style="width:16px"/>.
</span>
</div>
<div class="styLNRightNumBox" style="height:5mm;padding-top:2mm;border-bottom-width:1px">7</div>
<div class="styLNAmountBox" style="height:5mm;padding-top:2mm;border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleI/ExcessLICTI35Pct"/>
</xsl:call-template>
</div>
</div>
<!-- Schedule I line 8 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:5mm;padding-top:2mm">8 </div>
<div class="styLNDesc" style="width:139mm;height:5mm;padding-top:2mm">
Enter the lesser of line 6 or line 7
<span style="letter-spacing:4mm;font-weight:bold">....................</span>
</div>
<div class="styLNRightNumBox" style="height:5mm;padding-top:2mm;border-bottom-width:1px">8</div>
<div class="styLNAmountBox" style="height:5mm;padding-top:2mm;border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleI/LesserOfLine6OrLine7"/>
</xsl:call-template>
</div>
</div>
<!-- Schedule I  line 9 -->
<div class="styBB" style="width:187mm;border-bottom-width:1px;">
<div class="styLNLeftNumBox" style="height:5mm;padding-top:2mm">9 </div>
<div class="styLNDesc" style="width:139mm;height:5mm;padding-top:2mm">
<span class="styBoldText">Limitation on noninsurance losses. </span>
Subtract line 8 from line 5. Enter here and on page 1, line 25
<span class="styBoldText">
<span style="width:16px"/>.
<span style="width:16px"/>.
</span>
</div>
<div class="styLNRightNumBox" style="height:5mm;padding-top:2mm;border-bottom-width:0px">9</div>
<div class="styLNAmountBox" style="height:5mm;padding-top:2mm;border-bottom-width:0px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleI/NoninsuranceLossesLimitation"/>
</xsl:call-template>
</div>
</div>
<!-- Page Break and Footer-->
<div class="pageEnd" style="width:187mm;padding-top:1mm;">
<div style="float:left;"/>
<div style="float:right;">
<span style="width:40px;"/>  
Form <span class="styBoldText" style="font-size:8pt;">1120-L</span> (2011)
</div>
</div>
<!-- END Page Break and Footer-->
<!--Begin Page 6 -->
<!-- Page Header -->
<div class="styBB" style="width:187mm;padding-top:.5mm;">
<div style="float:left;">Form 1120-L (2011)<span style="width:148mm;"/>
</div>
<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">6</span>
</div>
</div>
<!-- BEGIN Schedule J Title -->
<div class="styBB" style="width:187mm;">
<div class="styPartName" style="width:23mm;">Schedule J</div>
<div class="styPartDesc" style="width:164mm;">
Part I&#8212; Shareholders Surplus Account (Stock Companies Only)
<span class="styNormalText"> (section 815(c)) (see instructions)</span>
</div>
</div>
<!-- SCH J line 1a -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">1a</div>
<div class="styLNDesc" style="width:139mm;height:4mm;">
Balance at the beginning of the tax year
<xsl:call-template name="SetFormLinkInline">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleJ/BeginningTaxYearBalance"/>
</xsl:call-template>
<span style="letter-spacing:4mm;font-weight:bold">.................</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">1a</div>
<div class="styLNAmountBox" style="height:4.5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleJ/ShrBeginningTaxYearBalance"/>
</xsl:call-template>
</div>
</div>
<!-- SCH J line 1b -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm">b</div>
<div class="styLNDesc" style="width:139mm;height:4mm;">
Transfers under pre-1984 sections 815(d)(1) and (4) for the preceding year
<span style="letter-spacing:4mm;font-weight:bold">........</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">1b</div>
<div class="styLNAmountBox" style="height:4.5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleJ/AcctUnderPre1984Sect815d1And4"/>
</xsl:call-template>
</div>
</div>
<!-- SCH J line 1c -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm">c</div>
<div class="styLNDesc" style="width:139mm;height:4mm;">
Balance at the beginning of the tax year. Add lines 1a and 1b
<span style="letter-spacing:4mm;font-weight:bold">............</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">1c</div>
<div class="styLNAmountBox" style="height:4.5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleJ/TotalBeginningTaxYearBalance"/>
</xsl:call-template>
</div>
</div>
<!-- SCH J line 2a -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">2a </div>
<div class="styLNDesc" style="width:139mm;height:4mm;">LICTI. Add lines 24 and 25, page 1. if zero or less, enter -0-  
<span style="letter-spacing:4mm;font-weight:bold">............</span>
</div>
<div class="styLNRightNumBox" style="height:4mm;">2a </div>
<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleJ/ShareholdersLICTI"/>
</xsl:call-template>
</div>
</div>
<!-- SCH J line 2b -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm">b </div>
<div class="styLNDesc" style="width:139mm;height:4mm;">Small life insurance company deduction (Schedule H, line 17)
<span style="letter-spacing:4mm;font-weight:bold">............</span>
</div>
<div class="styLNRightNumBox" style="height:4mm;">2b </div>
<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleJ/ShrSmallLifeInsCompanyDed"/>
</xsl:call-template>
</div>
</div>
<!-- SCH J line 2c -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm">c </div>
<div class="styLNDesc" style="width:139mm;height:4mm;">
Dividends-received deduction (Schedule A, line 16, column (c))
<span style="letter-spacing:4mm;font-weight:bold">...........</span>
</div>
<div class="styLNRightNumBox" style="height:4mm;">2c </div>
<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleJ/ShrDividendsReceivedDeduction"/>
</xsl:call-template>
</div>
</div>
<!-- SCH J line 2d -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm">d </div>
<div class="styLNDesc" style="width:139mm;height:4mm;">
Tax-exempt interest (Schedule B, line 9) (see instructions)
<span style="letter-spacing:4mm;font-weight:bold">............</span>
</div>
<div class="styLNRightNumBox" style="height:4mm;">2d </div>
<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleJ/ShrTaxExemptInterest"/>
</xsl:call-template>
</div>
</div>
<!-- SCH J line 3 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">3</div>
<div class="styLNDesc" style="width:139mm;height:4mm;">
Add lines 1c through 2d
<span style="letter-spacing:4mm;font-weight:bold">.......................</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">3</div>
<div class="styLNAmountBox" style="height:4.5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleJ/TotalLines1cAnd2d"/>
</xsl:call-template>
</div>
</div>
<!-- SCH J line 4 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">4</div>
<div class="styLNDesc" style="width:139mm;height:4mm;">
Tax liability without regard to section 815. Figure the tax on line 2a as if it were total taxable income
<span style="letter-spacing:4mm;font-weight:bold">.</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">4</div>
<div class="styLNAmountBox" style="height:4.5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleJ/TaxLiabWithoutRegardSect815"/>
</xsl:call-template>
</div>
</div>
<!-- SCH F line 5 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">5</div>
<div class="styLNDesc" style="width:139mm;height:4mm;">
Subtract line 4 from line 3. If zero or less, enter -0-
<span style="letter-spacing:4mm;font-weight:bold">..............</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">5</div>
<div class="styLNAmountBox" style="height:4.5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleJ/Line3LessLine4"/>
</xsl:call-template>
</div>
</div>
<!-- SCH J line 6 -->
<div style="width:187mm;border-bottom-width:1px">
<div class="styLNLeftNumBox" style="height:4.5mm;">6</div>
<div class="styLNDesc" style="width:139mm;height:4mm;">
Direct or indirect distributions in the tax year but not more than line 5
<span style="letter-spacing:4mm;font-weight:bold">..........</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:1px">6</div>
<div class="styLNAmountBox" style="height:4.5mm;;border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleJ/ShrDirectIndirectDistributions"/>
</xsl:call-template>
</div>
</div>
<!-- SCH J line 7 -->
<div class="styBB" style="width:187mm;border-bottom-width:1px">
<div class="styLNLeftNumBox" style="height:4.5mm;">7</div>
<div class="styLNDesc" style="width:139mm;height:4mm;">
Balance at the end of the tax year. Subtract line 6 from line 5
<span style="letter-spacing:4mm;font-weight:bold">............</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px">7</div>
<div class="styLNAmountBox" style="height:4.5mm;;border-bottom-width:0px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleJ/ShrEndOfTaxYearBalance"/>
</xsl:call-template>
</div>
</div>
<!-- BEGIN Schedule J Part II  Title -->
<div class="styBB" style="width:187mm;">
<div class="styPartDesc" style="width:170mm;">
Part II&#8212; Policyholders Surplus Account (Stock Companies Only)
<span class="styNormalText">(section 815(d)) (see instructions)</span>
</div>
</div>
<!-- SCH J line 8 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">8</div>
<div class="styLNDesc" style="width:139mm;height:4mm;">
Balance at the beginning of the tax year
<xsl:call-template name="SetFormLinkInline">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleJ/BeginningTaxYearBalance"/>
</xsl:call-template>
<span style="letter-spacing:4mm;font-weight:bold">..................</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">8</div>
<div class="styLNAmountBox" style="height:4.5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleJ/BeginningTaxYearBalance"/>
</xsl:call-template>
</div>
</div>
<!-- SCH J line 9a -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:5mm;">9a</div>
<div class="styLNDesc" style="width:99mm;height:5mm;">
Direct or indirect distributions in excess of the amount on line 5, Part I above
<span style="letter-spacing:4mm;font-weight:bold">...................</span>
</div>
<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">9a </div>
<div class="styLNAmountBox" style="border-bottom-width:1px;height:8mm;padding-top:4mm">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleJ/DirectIndirectDistributions"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBox" style="height:8mm;background-color:lightgrey;border-bottom-width:0px"/>
<div class="styLNAmountBox" style="height:8mm;border-bottom-width:0px;;background-color:lightgrey"/>
</div>
<!-- SCH J line 9b -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm">b</div>
<div class="styLNDesc" style="width:99mm;height:4mm;">
Tax increase on line 9a
<span style="letter-spacing:4mm;font-weight:bold">..............</span>
</div>
<div class="styLNRightNumBox" style="height:4mm;">9b </div>
<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleJ/TaxIncreaseLine9A"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;background-color:lightgrey"/>
</div>
<!-- SCH J line 9c -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm">c</div>
<div class="styLNDesc" style="width:99mm;height:4mm;">
Subtractions from account under pre-1984 sections 815(d)(1) and (4)
</div>
<div class="styLNRightNumBox" style="height:4mm;">9c </div>
<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleJ/SubAcctUndPre1984Sect815d1And4"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;background-color:lightgrey"/>
</div>
<!-- SCH J line 9d -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm">d</div>
<div class="styLNDesc" style="width:99mm;height:4mm;">
Tax increase on line 9c
<span style="letter-spacing:4mm;font-weight:bold">..............</span>
</div>
<div class="styLNRightNumBox" style="height:4mm;">9d </div>
<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleJ/TaxIncreaseLine9c"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;background-color:lightgrey"/>
</div>
<!-- SCH J line 9e -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm">e</div>
<div class="styLNDesc" style="width:99mm;height:4mm;">
Subtraction from account under pre-1984 sections 815(d)(2)
<span style="letter-spacing:4mm;font-weight:bold">....</span>
</div>
<div class="styLNRightNumBox" style="height:4mm;">9e </div>
<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleJ/SubAcctUnderPre1984Sect815d2"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;background-color:lightgrey"/>
</div>
<!-- SCH J line 10 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">10</div>
<div class="styLNDesc" style="width:139mm;height:4mm;">
Add lines 9a through 9e, but not more than line 8. Enter here and on page 1, line 26
<span style="letter-spacing:4mm;font-weight:bold">......</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">10</div>
<div class="styLNAmountBox" style="height:4.5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleJ/TotalLines9aThrough9e"/>
</xsl:call-template>
</div>
</div>
<!-- SCH J line 11 -->
<div class="styBB" style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">11</div>
<div class="styLNDesc" style="width:139mm;height:4mm;">
Balance at the end of the tax year. Subtract line 10 from line 8
<span style="letter-spacing:4mm;font-weight:bold">............</span>
</div>
<div class="styLNRightNumBoxNBB" style="height:4.5mm;border-bottom-width:0px">11</div>
<div class="styLNAmountBoxNBB" style="height:4.5mm;border-bottom-width:0px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleJ/EndOfTaxYearBalance"/>
</xsl:call-template>
</div>
</div>
<!-- BEGIN Schedule K Title -->
<div class="styBB" style="width:187mm;">
<div class="styPartName" style="width:23mm;">Schedule K</div>
<div class="styPartDesc" style="width:164mm;">
Tax Computation
<span class="styNormalText"> (see instructions)</span>
</div>
</div>
<!-- SCH K line 1 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4mm;">1</div>
<div class="styLNDesc" style="width:139mm;height:4mm;">
<label>
<xsl:call-template name="PopulateLabel">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/MemberOfControlledGroup"/>
<xsl:with-param name="BackupName">MemberOfControlledGroup</xsl:with-param>
</xsl:call-template>
Check if the corporation is a member of a controlled group (attach Schedule O (Form 1120))
<span style="width:2px;"/>
<!-- Form to Form Link  -->
<xsl:call-template name="SetFormLinkInline">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/MemberOfControlledGroup"/>
</xsl:call-template>
</label>
<span style="letter-spacing:4mm;font-weight:bold">..</span>
<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
<span style="width:4px"/>
<input type="checkbox" class="styCkbox">
<xsl:call-template name="PopulateCheckbox">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/MemberOfControlledGroup"/>
<xsl:with-param name="BackupName">MemberOfControlledGroup</xsl:with-param>
</xsl:call-template>
</input>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px"/>
</div>
<!-- SCH K line 2 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4mm;">2</div>
<div class="styLNDesc" style="width:139mm;height:4mm;">
Income tax
<xsl:call-template name="LinkToLeftoverDataTableInline">
<xsl:with-param name="Desc">Schedule K Line 2 - differential Rate316 Indicator</xsl:with-param>
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/IncomeTax/@differentialRate316Indicator"/>
</xsl:call-template>
<xsl:call-template name="LinkToLeftoverDataTableInline">
<xsl:with-param name="Desc">Schedule K Line 2 - differential Rate316 Amount</xsl:with-param>
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/IncomeTax/@differentialRate316Amount"/>
</xsl:call-template>
<xsl:call-template name="LinkToLeftoverDataTableInline">
<xsl:with-param name="Desc">Schedule K Line 2 - section 1291 Indicator</xsl:with-param>
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/IncomeTax/@section1291Indicator"/>
</xsl:call-template>
<xsl:call-template name="LinkToLeftoverDataTableInline">
<xsl:with-param name="Desc">Schedule K Line 2 - section 1291 Amount</xsl:with-param>
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/IncomeTax/@section1291Amount"/>
</xsl:call-template>
<xsl:call-template name="LinkToLeftoverDataTableInline">
<xsl:with-param name="Desc">Schedule K Line 2 - section1291 Interest Indicator</xsl:with-param>
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/IncomeTax/@section1291InterestIndicator"/>
</xsl:call-template>
<xsl:call-template name="LinkToLeftoverDataTableInline">
<xsl:with-param name="Desc">Schedule K Line 2 - section 1291 Interest Amount</xsl:with-param>
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/IncomeTax/@section1291InterestAmount"/>
</xsl:call-template>
<xsl:call-template name="LinkToLeftoverDataTableInline">
<xsl:with-param name="Desc">Schedule K Line 2 - section197 Indicator</xsl:with-param>
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/IncomeTax/@section197Indicator"/>
</xsl:call-template>
<xsl:call-template name="LinkToLeftoverDataTableInline">
<xsl:with-param name="Desc">Schedule K Line 2 - section197 Amount</xsl:with-param>
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/IncomeTax/@section197Amount"/>
</xsl:call-template>
<span style="letter-spacing:4mm;font-weight:bold">....................</span>
</div>
<div class="styLNRightNumBoxNBB" style="height:4mm;border-bottom-width:1px;">2</div>
<div class="styLNAmountBoxNBB" style="height:4mm;border-bottom-width:1px;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/IncomeTax"/>
</xsl:call-template>
</div>
</div>
<!-- SCH K line 3 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4mm;">3</div>
<div class="styLNDesc" style="width:139mm;height:4mm;">
Alternative minimum tax (attach Form 4626)
<xsl:call-template name="SetFormLinkInline">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/AlternativeMinimumTax"/>
</xsl:call-template>
<span style="letter-spacing:4mm;font-weight:bold">................</span>
</div>
<div class="styLNRightNumBoxNBB" style="height:4mm;border-bottom-width:1px;">3</div>
<div class="styLNAmountBoxNBB" style="height:4mm;border-bottom-width:1px;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/AlternativeMinimumTax"/>
</xsl:call-template>
</div>
</div>
<!-- SCH K line 4 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4mm;">4</div>
<div class="styLNDesc" style="width:139mm;height:4mm;">
Add lines 2 and 3
<span style="letter-spacing:4mm;font-weight:bold">........................</span>
</div>
<div class="styLNRightNumBoxNBB" style="height:4mm;border-bottom-width:1px;">4</div>
<div class="styLNAmountBoxNBB" style="height:4mm;border-bottom-width:1px;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/TaxesPlusAltMinimumTax"/>
</xsl:call-template>
</div>
</div>
<!-- SCH K line 5a -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">5a </div>
<div class="styLNDesc" style="width:99mm;height:4mm;">Foreign tax credit (attach Form 1118)
<xsl:call-template name="SetFormLinkInline">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/ForeignTaxCredit"/>
</xsl:call-template>
<span style="letter-spacing:4mm;font-weight:bold">.........</span>
</div>
<div class="styLNRightNumBox" style="height:4mm;">5a </div>
<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/ForeignTaxCredit"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px"/>
</div>
<!-- SCH K line 5b -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm">b </div>
<div class="styLNDesc" style="width:99mm;height:4mm;">
Credit from Form 8834, line 30 (attach Form 8834). 
<span class="styBoldText">
<xsl:call-template name="SetFormLinkInline">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/CreditFromForm8834"/>
</xsl:call-template>
<span style="letter-spacing:4mm;font-weight:bold">.....</span>
</span>
</div>
<div class="styLNRightNumBox" style="height:4mm;">5b </div>
<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/CreditFromForm8834"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px"/>
</div>
<!-- SCH K line 5c -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm">c </div>
<div class="styLNDesc" style="width:99mm;height:4mm;">
General business credit (attach Form 3800)
<span class="styBoldText">
<xsl:call-template name="SetFormLinkInline">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/GeneralBusinessCredit"/>
</xsl:call-template>
<span style="letter-spacing:4mm;font-weight:bold">........</span>
</span>
</div>
<div class="styLNRightNumBox" style="height:4mm;">5c </div>
<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/GeneralBusinessCredit"/>
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
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/PriorYearMinimumTaxCredit"/>
</xsl:call-template>
<span style="letter-spacing:4mm;font-weight:bold">.....</span>
</div>
<div class="styLNRightNumBox" style="height:4mm;">5d </div>
<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/PriorYearMinimumTaxCredit"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px"/>
</div>
<!-- SCH K line 5e -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm">e </div>
<div class="styLNDesc" style="width:99mm;height:4mm;">
Bond credits from Form 8912
<xsl:call-template name="SetFormLinkInline">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/BondCreditsFromForm8912"/>
</xsl:call-template>
<span style="letter-spacing:4mm;font-weight:bold">............</span>
</div>
<div class="styLNRightNumBox" style="height:4mm;">5e </div>
<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/BondCreditsFromForm8912"/>
</xsl:call-template>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px"/>
</div>
<!-- SCH K line 6 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4mm;">6</div>
<div class="styLNDesc" style="width:139mm;height:4mm;">
<span class="styBoldText">Total credits. </span> Add lines 5a through 5e 
<span style="letter-spacing:4mm;font-weight:bold">...................</span>
</div>
<div class="styLNRightNumBoxNBB" style="height:4mm;border-bottom-width:1px;">6</div>
<div class="styLNAmountBoxNBB" style="height:4mm;border-bottom-width:1px;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/TotalCredits"/>
</xsl:call-template>
</div>
</div>
<!-- SCH K line 7 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4mm;">7</div>
<div class="styLNDesc" style="width:139mm;height:4mm;">
Subtract line 6 from line 4
<span style="letter-spacing:4mm;font-weight:bold">......................</span>
</div>
<div class="styLNRightNumBoxNBB" style="height:4mm;border-bottom-width:1px;">7</div>
<div class="styLNAmountBoxNBB" style="height:4mm;border-bottom-width:1px;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/TaxLessTotalCredit"/>
</xsl:call-template>
</div>
</div>
<!-- SCH K line 8 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4mm;">8</div>
<div class="styLNDesc" style="width:139mm;height:4mm;">

Foreign corporations&#8212; tax on income not effectively connected with U.S. business

<span class="styBoldText">
<!-- Form to Form Link   -->
<xsl:call-template name="SetFormLinkInline">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/ForeignCorpTaxOnIncome"/>
</xsl:call-template>
<span style="letter-spacing:4mm;font-weight:bold">......</span>
</span>
</div>
<div class="styLNRightNumBoxNBB" style="height:4mm;border-bottom-width:1px;">8</div>
<div class="styLNAmountBoxNBB" style="height:4mm;border-bottom-width:1px;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/ForeignCorpTaxOnIncome"/>
</xsl:call-template>
</div>
</div>
<!-- Schedule K line 9 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4mm;">9</div>
<div class="styLNDesc" style="width:139mm;height:4mm;">

<span style="width:8px"/>
<input type="checkbox" class="styCkbox">
<xsl:call-template name="PopulateCheckbox">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/TaxFromForm4255"/>
<xsl:with-param name="BackupName">IRS1120LForm4255Attached</xsl:with-param>
</xsl:call-template>
</input>
<label>
<xsl:call-template name="PopulateLabel">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/TaxFromForm4255"/>
<xsl:with-param name="BackupName">IRS1120LForm4255Attached</xsl:with-param>
</xsl:call-template>
Form 4255
<span style="width:2px;"/>
</label>
<xsl:call-template name="SetFormLinkInline">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/TaxFromForm4255"/>
</xsl:call-template>
<span style="width:8px"/>
<input type="checkbox" class="styCkbox">
<xsl:call-template name="PopulateCheckbox">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/TaxFromForm8611"/>
<xsl:with-param name="BackupName">IRS1120LForm8611Attached</xsl:with-param>
</xsl:call-template>
</input>
<label>
<xsl:call-template name="PopulateLabel">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/TaxFromForm8611"/>
<xsl:with-param name="BackupName">IRS1120LForm8611Attached</xsl:with-param>
</xsl:call-template>
Form 8611
<span style="width:2px;"/>
</label>
<xsl:call-template name="SetFormLinkInline">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/TaxFromForm8611"/>
</xsl:call-template>
<span style="width:8px"/>
<input type="checkbox" class="styCkbox">
<xsl:call-template name="PopulateCheckbox">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/TaxFromOtherForm"/>
<xsl:with-param name="BackupName">IRS1120LFormOtherAttached</xsl:with-param>
</xsl:call-template>
</input>
<label>
<xsl:call-template name="PopulateLabel">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/TaxFromOtherForm"/>
<xsl:with-param name="BackupName">IRS1120LFormOtherAttached</xsl:with-param>
</xsl:call-template>
Other (attach schedule)
<span style="width:2px;"/>
</label>
<xsl:call-template name="SetFormLinkInline">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/TaxFromOtherForm"/>
</xsl:call-template>
<span style="letter-spacing:4mm;font-weight:bold">..........</span>
</div>
<div class="styLNRightNumBox" style="height:4.5mm;">9</div>
<div class="styLNAmountBox" style="height:4.5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/OtherTaxes"/>
</xsl:call-template>
</div>
</div>
<!-- SCH K line 10 -->
<div class="styBB" style="width:187mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">10</div>
<div class="styLNDesc" style="width:139mm;height:4mm;">
<span class="styBoldText">Total tax. </span>
Add lines 7 through 9. Enter here and on page 1, line 28 
<xsl:call-template name="SetFormLinkInline">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/TotalTax"/>
</xsl:call-template>
<span style="letter-spacing:4mm;font-weight:bold">..........</span>
</div>
<div class="styLNRightNumBoxNBB" style="height:4.5mm;">10</div>
<div class="styLNAmountBoxNBB" style="height:4.5mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/TotalTax"/>
</xsl:call-template>
</div>
</div>
<!-- Page Break and Footer-->
<div class="pageEnd" style="width:187mm;padding-top:1mm;">
<div style="float:left;"/>
<div style="float:right;">
<span style="width:40px;"/>  
Form <span class="styBoldText" style="font-size:8pt;">1120-L</span> (2011)
</div>
</div>
<!-- END Page Break and Footer-->
<!--Begin Page 7 -->
<!-- Page Header -->
<div class="styBB" style="width:187mm;padding-top:.5mm;">
<div style="float:left;">Form 1120-L (2011)<span style="width:148mm;"/>
</div>
<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">7</span>
</div>
</div>
<!-- BEGIN Schedule L Title -->
<div class="styBB" style="width:187mm;">
<div class="styPartName" style="width:23mm;">Schedule L</div>
<div class="styPartDesc" style="width:164mm;">

Part I&#8212; Total Assets <span class="styNormalText">(section 806(a)(3)(C)) (see instructions)</span>
</div>
</div>
<!-- Schedule L head line -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm"/>
<div class="styLNDesc" style="width:107mm;height:8mm;padding-top:4mm"/>
<div class="styLNAmountBox" style="width:40mm;height:8mm;;border-bottom-width:1px;
border-left-width:1px;text-align:center;padding-top:2mm">
<b>(a)</b> Beginning of tax year</div>
<div class="styLNAmountBox" style="height:8mm;border-bottom-width:1px;padding-top:2mm;
text-align:center">
<b>(b)</b> End of tax year
</div>
</div>
<!-- Schedule L line 1 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm">1 </div>
<div class="styLNDesc" style="width:107mm;height:8mm;padding-top:4mm">
Real property
<span style="letter-spacing:4mm;font-weight:bold">..................</span>
</div>
<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px">1</div>
<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/RealPropertyBOY"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/RealPropertyEOY"/>
</xsl:call-template>
</div>
</div>
<!-- Schedule L line 2 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm">2 </div>
<div class="styLNDesc" style="width:107mm;height:8mm;padding-top:4mm">
Stocks
<span style="letter-spacing:4mm;font-weight:bold">....................</span>
</div>
<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px">2</div>
<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/StocksBOY"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/StocksEOY"/>
</xsl:call-template>
</div>
</div>
<!-- Schedule L line 3 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm">3 </div>
<div class="styLNDesc" style="width:107mm;height:8mm;padding-top:4mm">
Proportionate share of partnership and trust assets
<span style="letter-spacing:4mm;font-weight:bold">........</span>
</div>
<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px">3</div>
<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/ProportionateShareBOY"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/ProportionateShareEOY"/>
</xsl:call-template>
</div>
</div>
<!-- Schedule L line 4 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm">4 </div>
<div class="styLNDesc" style="width:107mm;height:8mm;padding-top:4mm">
Other assets (attach schedule)
<span style="letter-spacing:4mm;font-weight:bold">.............</span>
</div>
<div class="styLNRightNumBox" style="height:11.5mm;padding-top:7mm;border-bottom-width:1px">4</div>
<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px">
<xsl:call-template name="SetFormLinkInline">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/OtherAssetsBOY"/>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/OtherAssetsBOY"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px">
<xsl:call-template name="SetFormLinkInline">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/OtherAssetsEOY"/>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/OtherAssetsEOY"/>
</xsl:call-template>
</div>
</div>
<!-- Schedule L line 5 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm">5 </div>
<div class="styLNDesc" style="width:107mm;height:8mm;padding-top:4mm">
Total assets of controlled groups
<span style="letter-spacing:4mm;font-weight:bold">.............</span>
</div>
<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px">5</div>
<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/TotalAssetsControlledGroupsBOY"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/TotalAssetsControlledGroupsEOY"/>
</xsl:call-template>
</div>
</div>
<!-- Schedule L line 6 -->
<div class="styBB" style="width:187mm;">
<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm">6 </div>
<div class="styLNDesc" style="width:107mm;height:8mm;padding-top:4mm">
<b>Total assets.</b> Add lines 1 through 5
<span style="letter-spacing:4mm;font-weight:bold">.............</span>
</div>
<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;border-bottom-width:0px">6</div>
<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-bottom-width:0px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/TotalAssetsBOY"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-bottom-width:0px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/TotalAssetsEOY"/>
</xsl:call-template>
</div>
</div>
<!-- BEGIN Schedule L Part II Title1 -->
<div class="styBB" style="width:187mm;">
<div class="styPartDesc" style="width:164mm;">
   Part II&#8212; Total Assets and Total Insurance Liabilities <span class="styNormalText">
  (section 842(b)(2)(B)(i)) (see instructions)</span>
</div>
</div>
<!-- BEGIN Schedule L Part II Title II -->
<div class="styBB" style="width:187mm;">
<div class="styPartDesc" style="width:184mm;">
<span class="styNormalText">
Line references below are to the “Assets” (lines 1 and 2) and “Liabilities, 
Surplus, and Other Funds” (lines 3 through 13) sections of the NAIC Annual Statement.</span>
</div>
</div>
<!-- Schedule L head line -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm"/>
<div class="styLNDesc" style="width:107mm;height:8mm;padding-top:4mm"/>
<div class="styLNAmountBox" style="width:40mm;height:8mm;;border-bottom-width:1px;
border-left-width:1px;text-align:center;padding-top:2mm">
<b>(a)</b> Beginning of tax year</div>
<div class="styLNAmountBox" style="height:8mm;border-bottom-width:1px;padding-top:2mm;
text-align:center">
<b>(b)</b> End of tax year
</div>
</div>
<!-- Schedule L line 1 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm">1 </div>
<div class="styLNDesc" style="width:107mm;height:8mm;padding-top:4mm">
Subtotals for assets (line 26)
<span style="letter-spacing:4mm;font-weight:bold">..............</span>
</div>
<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px">1</div>
<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/SubtotalsForAssetsBOY"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/SubtotalsForAssetsEOY"/>
</xsl:call-template>
</div>
</div>
<!-- Schedule L line 2 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm">2 </div>
<div class="styLNDesc" style="width:107mm;height:8mm;padding-top:4mm">
<span class="styBoldText">Total assets </span>(line 28)
<span style="letter-spacing:4mm;font-weight:bold">................</span>
</div>
<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px">2</div>
<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/TotalAssetsBOYPartII"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/TotalAssetsEOYPartII"/>
</xsl:call-template>
</div>
</div>
<!-- Schedule L line 3 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm">3 </div>
<div class="styLNDesc" style="width:107mm;height:8mm;padding-top:4mm">
Reserve for life policies and contracts (line 1)
<span style="letter-spacing:4mm;font-weight:bold">..........</span>
</div>
<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px">3</div>
<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/RsrvForLifePoliciesCntrctBOY"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/RsrvForLifePoliciesCntrctEOY"/>
</xsl:call-template>
</div>
</div>
<!-- Schedule L line 4 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm">4 </div>
<div class="styLNDesc" style="width:107mm;height:8mm;padding-top:4mm">
Reserve for accident and health policies (line 2)
<span style="letter-spacing:4mm;font-weight:bold">.........</span>
</div>
<div class="styLNRightNumBox" style="height:12mm;border-bottom-width:1px;padding-top:8mm">4</div>
<div class="styLNAmountBox" style="height:12mm;padding-top:4mm;border-bottom-width:1px;">
<xsl:call-template name="SetFormLinkInline">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/RsrvForAccidentHealthPlcyBOY"/>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/RsrvForAccidentHealthPlcyBOY"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:12mm;padding-top:8mm;border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/RsrvForAccidentHealthPlcyEOY"/>
</xsl:call-template>
</div>
</div>
<!-- Schedule L line 5 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm">5 </div>
<div class="styLNDesc" style="width:107mm;height:8mm;padding-top:4mm">
Liability for deposit-type contracts (line 3)
<span style="letter-spacing:4mm;font-weight:bold">..........</span>
</div>
<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px">5</div>
<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/LiabilityDepositTypeCntrctBOY"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/LiabilityDepositTypeCntrctEOY"/>
</xsl:call-template>
</div>
</div>
<!-- Schedule L line 6 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm">6 </div>
<div class="styLNDesc" style="width:107mm;height:8mm;padding-top:4mm">
Life policy and contract claims (line 4.1)
<span style="letter-spacing:4mm;font-weight:bold">...........</span>
</div>
<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px">6 </div>
<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/LifePolicyAndContractClaimsBOY"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/LifePolicyAndContractClaimsEOY"/>
</xsl:call-template>
</div>
</div>
<!-- Schedule L line 7 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm">7 </div>
<div class="styLNDesc" style="width:107mm;height:8mm;padding-top:4mm">
Accident and health policy and contract claims (line 4.2)
<span style="letter-spacing:4mm;font-weight:bold">......</span>
</div>
<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px">7</div>
<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/AccdntHlthPlcyContractClmsBOY"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/AccdntHlthPlcyContractClmsEOY"/>
</xsl:call-template>
</div>
</div>
<!-- Schedule L line 8 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm">8 </div>
<div class="styLNDesc" style="width:107mm;height:8mm;padding-top:4mm">
Policyholder’s dividend and coupon accumulations (line 5)
<span style="letter-spacing:4mm;font-weight:bold">......</span>
</div>
<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px">8 </div>
<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/PlcyhldrDivAndCouponAccumBOY"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/PlcyhldrDivAndCouponAccumEOY"/>
</xsl:call-template>
</div>
</div>
<!-- Schedule L line 9 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm">9 </div>
<div class="styLNDesc" style="width:107mm;height:8mm;padding-top:4mm">
Premiums and annuity considerations received in advance less discount (line 8)
</div>
<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px">9 </div>
<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/PremAndAnntyConsiderationsBOY"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/PremAndAnntyConsiderationsEOY"/>
</xsl:call-template>
</div>
</div>
<!-- Schedule L line 10 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm">10 </div>
<div class="styLNDesc" style="width:107mm;height:8mm;padding-top:4mm">
Surrender values on canceled policies (line 9.1)
<span style="letter-spacing:4mm;font-weight:bold">.........</span>
</div>
<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px">10</div>
<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/SurrenderValuesBOY"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/SurrenderValuesEOY"/>
</xsl:call-template>
</div>
</div>
<!-- Schedule L line 11 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm">11 </div>
<div class="styLNDesc" style="width:107mm;height:8mm;padding-top:4mm">
Part of other amounts payable on reinsurance assumed (line 9.3)
<span style="letter-spacing:4mm;font-weight:bold">.....</span>
</div>
<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px">11 </div>
<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/PartOfOtherAmountsPayableBOY"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/PartOfOtherAmountsPayableEOY"/>
</xsl:call-template>
</div>
</div>
<!-- Schedule L line 12 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:16mm;padding-top:4mm">12 </div>
<div class="styLNDesc" style="width:107mm;height:16mm;padding-top:4mm">
Part of aggregate write-ins for liabilities (line 25). (Only include items or 
amounts includable in “total insurance liabilities on U.S. business” as defined in section 842(b)(2)(B)(i)) 
<span style="letter-spacing:4mm;font-weight:bold">................</span>
</div>
<div class="styLNRightNumBox" style="height:16mm;padding-top:12mm;border-bottom-width:1px">12 </div>
<div class="styLNAmountBox" style="height:16mm;padding-top:12mm;border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/PartOfAggrgtWriteinsForLiabBOY"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:16mm;padding-top:12mm;border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/PartOfAggrgtWriteinsForLiabEOY"/>
</xsl:call-template>
</div>
</div>
<!-- Schedule L line 13 -->
<div style="width:187mm;">
<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm">13 </div>
<div class="styLNDesc" style="width:107mm;height:8mm;padding-top:4mm">
Separate accounts statement (line 27)
<span style="letter-spacing:4mm;font-weight:bold">............</span>
</div>
<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px">13</div>
<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/SeperateAccountsStatementBOY"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/SeperateAccountsStatementEOY"/>
</xsl:call-template>
</div>
</div>
<!-- Schedule L line 14 -->
<div class="styBB" style="width:187mm;border-bottom-width:2px">
<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm">14 </div>
<div class="styLNDesc" style="width:107mm;height:8mm;padding-top:4mm">
<span class="styBoldText">Total insurance liabilities. </span>Add lines 3 through 13
<span style="letter-spacing:4mm;font-weight:bold">.........</span>
</div>
<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;border-bottom-width:0px">14 </div>
<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-bottom-width:0px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/TotalInsuranceLiabilitiesBOY"/>
</xsl:call-template>
</div>
<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-bottom-width:0px">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/TotalInsuranceLiabilitiesEOY"/>
</xsl:call-template>
</div>
</div>
<!-- Page Break and Footer-->
<div class="pageEnd" style="width:187mm;padding-top:1mm;">
<div style="float:left;"/>
<div style="float:right;">
<span style="width:40px;"/>  
Form <span class="styBoldText" style="font-size:8pt;">1120-L</span> (2011)
</div>
</div>
<!-- END Page Break and Footer-->
<!--Begin Page 8 -->
<!-- Page Header -->
<div class="styBB" style="width:187mm;padding-top:.5mm;">
<div style="float:left;">Form 1120-L (2011)<span style="width:148mm;"/>
</div>
<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">8</span>
</div>
</div>
<div style="width:187mm;clear:both;" class="styTBB">
<!-- BEGIN Schedule M Title -->
<div class="styBB" style="width:187mm;">
<div class="styPartName" style="width:23mm;">Schedule M</div>
<div class="styPartDesc" style="width:164mm;">
Other Information  <span class="styNormalText">(see instructions)</span>
</div>
</div>
<!--br style="page-break-after:always;"/-->
<!-- BEGIN Line Items -->
<table class="styTable" style="width:187mm;clear:both;float:none;">
<tr>
<!--BEGIN Schedule M Left Side-->
<td class="styGenericDiv" style="width:93mm;vertical-align:top;">
<div class="styGenericDiv" style="width:93mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">1</div>
<div class="styLNDesc" style="width:72mm;height:4.5mm;">Check method of accounting:</div>
<div class="styIRS1120LNYesNoBox">Yes</div>
<div class="styIRS1120LNYesNoBoxRB">No</div>
</div>
<!-- line 1 a and b -->
<div class="styGenericDiv" style="width:93mm;">
<div class="styLNLeftLtrBox" style="height:4.5mm;"/>
<!-- Line 1 A -->
<div class="styLNDesc" style="width:42mm;height:4.5mm;">
<span class="styBoldText">a</span>
<span style="width:3px;"/>
<input type="checkbox" class="styCkbox">
<xsl:call-template name="PopulateCheckbox">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/MethodOfAccountingAccrual"/>
<xsl:with-param name="BackupName">IRS1120LScheduleKMethodOfAccountingAccrual</xsl:with-param>
</xsl:call-template>
</input>
<label>
<xsl:call-template name="PopulateLabel">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/MethodOfAccountingAccrual"/>
<xsl:with-param name="BackupName">IRS1120LScheduleKMethodOfAccountingAccrual</xsl:with-param>
</xsl:call-template>
Accrual
</label>
<!-- Line 1 B -->
<span style="width:6px;"/>
<span class="styBoldText">b</span>
<span style="width:3px;"/>
<input type="checkbox" class="styCkbox">
<xsl:call-template name="PopulateCheckbox">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/MethodOfAccountingOther"/>
<xsl:with-param name="BackupName">IRS1120LScheduleKMethodOfAccountingOther</xsl:with-param>
</xsl:call-template>
</input>
<label>
<xsl:call-template name="PopulateLabel">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/MethodOfAccountingOther"/>
<xsl:with-param name="BackupName">IRS1120LScheduleKMethodOfAccountingOther</xsl:with-param>
</xsl:call-template>
Other (specify)
</label>
<xsl:call-template name="LinkToLeftoverDataTableInline">
<xsl:with-param name="Desc">Schedule M Line 1b - Method Of Accounting Other</xsl:with-param>
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/MethodOfAccountingOther/@note"/>
</xsl:call-template>
</div>
<div class="styIRS1120BBText" style="width:29.5mm;padding-left:1mm">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/MethodOfAccountingOther/@note"/>
</xsl:call-template>
</div>
<div class="styGenericDiv" style="width:.4mm;"/>
<div class="styShadingCell" style="width:6mm;height:5mm;"/>
<div class="styShadingCellRB" style="width:6mm;height:5mm;"/>
</div>
<!-- Sch M line 2 -->
<div class="styGenericDiv" style="width:93mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">2</div>
<div class="styLNDesc" style="width:72mm;height:4.5mm;">Check if the corporation is a:</div>
<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
<div class="styShadingCellRB" style="width:6mm;height:4.5mm;"/>
</div>
<!-- line 2 a -->
<div class="styGenericDiv" style="width:93mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;"/>
<div class="styLNDesc" style="width:72mm;height:4.5mm;">
<span class="styBoldText">a</span>
<span style="width:3px;"/>
<input type="checkbox" class="styCkbox">
<xsl:call-template name="PopulateCheckbox">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/LegalReserveCompany"/>
<xsl:with-param name="BackupName">IRS1120LScheduleMLegalReserveCompany</xsl:with-param>
</xsl:call-template>
</input>
<label>
<xsl:call-template name="PopulateLabel">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/LegalReserveCompany"/>
<xsl:with-param name="BackupName">IRS1120LScheduleMLegalReserveCompany</xsl:with-param>
</xsl:call-template>
Legal reserve company&#8212; if checked:<br/>
<span style="padding-left:2mm">Kind of company:</span>
</label>
</div>
<div class="styShadingCell" style="width:6mm;height:7mm;"/>
<div class="styShadingCellRB" style="width:6mm;height:7mm;"/>
</div>
<!-- line 2    1 and 2 -->
<div class="styGenericDiv" style="width:93mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;"/>
<div class="styLNDesc" style="width:42mm;height:4.5mm;padding-left:2mm">
<span class="styBoldText">(1)</span>
<span style="width:3px;"/>
<input type="checkbox" class="styCkbox">
<xsl:call-template name="PopulateCheckbox">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/StockCompany"/>
<xsl:with-param name="BackupName">IRS1120LScheduleMStockCompany</xsl:with-param>
</xsl:call-template>
</input>
<label>
<xsl:call-template name="PopulateLabel">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/StockCompany"/>
<xsl:with-param name="BackupName">IRS1120LScheduleMStockCompany</xsl:with-param>
</xsl:call-template>
Stock
</label>
<span style="width:6px;"/>
<span class="styBoldText">(2)</span>
<span style="width:3px;"/>
<input type="checkbox" class="styCkbox">
<xsl:call-template name="PopulateCheckbox">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/MutualCompany"/>
<xsl:with-param name="BackupName">IRS1120LScheduleMMutualCompany</xsl:with-param>
</xsl:call-template>
</input>
<label>
<xsl:call-template name="PopulateLabel">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/MutualCompany"/>
<xsl:with-param name="BackupName">IRS1120LScheduleMMutualCompany</xsl:with-param>
</xsl:call-template>
Mutual<br/>Principal business:
</label>
</div>
<div class="styGenericDiv" style="width:30mm;"/>
<div class="styShadingCell" style="width:6mm;height:7mm;"/>
<div class="styShadingCellRB" style="width:6mm;height:7mm;"/>
</div>
<!-- line 2 a1 -->
<div class="styGenericDiv" style="width:93mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;"/>
<div class="styLNDesc" style="width:72mm;height:4.5mm;">
<span class="styBoldText" style="padding-left:2mm">(1)</span>
<span style="width:3px;"/>
<input type="checkbox" class="styCkbox">
<xsl:call-template name="PopulateCheckbox">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/LifeInsuranceBusiness"/>
<xsl:with-param name="BackupName">IRS1120LScheduleMLifeInsuranceBusiness</xsl:with-param>
</xsl:call-template>
</input>
<label>
<xsl:call-template name="PopulateLabel">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/LifeInsuranceBusiness"/>
<xsl:with-param name="BackupName">IRS1120LScheduleMLifeInsuranceBusiness</xsl:with-param>
</xsl:call-template>
Life insurance
</label>
</div>
<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
<div class="styShadingCellRB" style="width:6mm;height:4.5mm;"/>
</div>
<!-- line 2 a2 -->
<div class="styGenericDiv" style="width:93mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;"/>
<div class="styLNDesc" style="width:72mm;height:4.5mm;">
<span class="styBoldText" style="padding-left:2mm">(2)</span>
<span style="width:3px;"/>
<input type="checkbox" class="styCkbox">
<xsl:call-template name="PopulateCheckbox">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/
HealthAndAccidentInsBusiness"/>
<xsl:with-param name="BackupName">IRS1120LScheduleMHealthAndAccidentInsBusiness</xsl:with-param>
</xsl:call-template>
</input>
<label>
<xsl:call-template name="PopulateLabel">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/HealthAndAccidentInsBusiness"/>
<xsl:with-param name="BackupName">IRS1120LScheduleMHealthAndAccidentInsBusiness</xsl:with-param>
</xsl:call-template>
Health and accident insurance
</label>
</div>
<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
<div class="styShadingCellRB" style="width:6mm;height:4.5mm;"/>
</div>
<!-- line 2 b -->
<div class="styGenericDiv" style="width:93mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;"/>
<div class="styLNDesc" style="width:72mm;height:4.5mm;">
<span class="styBoldText">b</span>
<span style="width:3px;"/>
<input type="checkbox" class="styCkbox">
<xsl:call-template name="PopulateCheckbox">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/FraternalAssessmentAssociation"/>
<xsl:with-param name="BackupName">IRS1120LScheduleMFraternalAssessmentAssociation</xsl:with-param>
</xsl:call-template>
</input>
<label>
<xsl:call-template name="PopulateLabel">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/FraternalAssessmentAssociation"/>
<xsl:with-param name="BackupName">IRS1120LScheduleMFraternalAssessmentAssociation</xsl:with-param>
</xsl:call-template>
Fraternal or assessment association
</label>
</div>
<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
<div class="styShadingCellRB" style="width:6mm;height:4.5mm;"/>
</div>
<!-- line 2 c -->
<div class="styGenericDiv" style="width:93mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;"/>
<div class="styLNDesc" style="width:72mm;height:4.5mm;">
<span class="styBoldText">c</span>
<span style="width:3px;"/>
<input type="checkbox" class="styCkbox">
<xsl:call-template name="PopulateCheckbox">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/BurialOrOtherInsuranceCompany"/>
<xsl:with-param name="BackupName">IRS1120LScheduleMBurialOrOtherInsuranceCompany</xsl:with-param>
</xsl:call-template>
</input>
<label>
<xsl:call-template name="PopulateLabel">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/BurialOrOtherInsuranceCompany"/>
<xsl:with-param name="BackupName">IRS1120LScheduleMBurialOrOtherInsuranceCompany</xsl:with-param>
</xsl:call-template>
Burial or other insurance company
</label>
</div>
<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
<div class="styShadingCellRB" style="width:6mm;height:4.5mm;"/>
</div>
<!-- Sch M line 3 -->
<div class="styGenericDiv" style="width:93mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">3</div>
<div class="styLNDesc" style="width:72mm;height:4.5mm;">
<span class="stySmallText">Enter the percentage that the total of the corporation’s life insurance reserves (section 816 (b)) plus
unearned premiums and unpaid losses (whether or not ascertained) on noncancelable life, health 
or accident policies not included in life insurance reserves bears to the corporation’s total reserves (section 816 (c))
<!-- Form to Form Link  -->
<xsl:call-template name="SetFormLinkInline">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/TotalCorpLifeInsuranceReserves"/>
</xsl:call-template>
<span style="width:3px;"/>
<span style="width:3px;"/>
<span style="width:25.5mm;font-size:6pt;border-bottom:1 solid black;text-align:right">
<xsl:call-template name="PopulatePercent">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/TotalCorpLifeInsuranceReserves"/>
<xsl:with-param name="MaxSize" select="4"/>
</xsl:call-template>
</span>
<br/>Attach a schedule of the computation.<br/>
</span>
</div>
<div class="styShadingCell" style="width:6mm;height:26mm;"/>
<div class="styShadingCell" style="width:6mm;height:26mm;border-right-width:1px"/>
</div>
<!-- Line 4 -->
<div class="styGenericDiv" style="width:93mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">4</div>
<div class="styLNDesc" style="width:72mm;height:4.5mm;padding-bottom:0px;padding-top:0px;">
Does the corporation have any variable annuity contracts outstanding?
<span style="letter-spacing:4mm;font-weight:bold">............</span>
<br/>
</div>
<div class="styGenericDiv">
<div class="styShadingCell" style="width:6mm;height:1mm;"/>
<div class="styShadingCellRB" style="width:6mm;height:1mm;"/>
<div class="styIRS1120LNYesNoBox" style="height:6mm;">
<span style="font-weight:normal;">
<xsl:call-template name="PopulateYesBoxText">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/
VariableAnnuityContracts"/>
<xsl:with-param name="BackupName">VariableAnnuityContractsYes</xsl:with-param> 
</xsl:call-template>
</span>
<!--<label>
     <xsl:call-template name="PopulateLabel">
   <xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/
VariableAnnuityContracts"/>
<xsl:with-param name="BackupName">VariableAnnuityContractsYes</xsl:with-param> 
</xsl:call-template>
   </label>-->
</div>
<div class="styIRS1120LNYesNoBoxRB" style="height:6mm;">
<span style="font-weight:normal;">
<xsl:call-template name="PopulateNoBoxText">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/VariableAnnuityContracts"/>
<xsl:with-param name="BackupName">VariableAnnuityContractsNo</xsl:with-param> 
</xsl:call-template>
</span>
<!--<label>
     <xsl:call-template name="PopulateLabel">
   <xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/
VariableAnnuityContracts"/>
<xsl:with-param name="BackupName">VariableAnnuityContractsNo</xsl:with-param> 
</xsl:call-template>
    </label>-->
</div>
</div>
</div>
<!-- Line 5 -->
<div class="styGenericDiv" style="width:93mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:0mm;padding-bottom:0mm;">5</div>
<div class="styLNDesc" style="width:72mm;padding-top:0mm;padding-bottom:0mm;">
<span class="stySmallText">
At the end of the tax year, did the corporation own, directly or indirectly, 50% or more of the voting stock of a 
domestic corporation? (For rules of attribution, see section 267(c).)
<xsl:call-template name="SetFormLinkInline">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/Own50PercentOrMoreVotingStock"/>
</xsl:call-template>
</span>
</div>
<div class="styGenericDiv">
<div class="styShadingCell" style="width:6mm;height:5mm;"/>
<div class="styShadingCellRB" style="width:6mm;height:5mm;"/>
<div class="styIRS1120LNYesNoBox">
<span style="font-weight:normal;">
<xsl:call-template name="PopulateYesBoxText">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/Own50PercentOrMoreVotingStock"/>
</xsl:call-template>
</span>
</div>
<div class="styIRS1120LNYesNoBoxRB">
<span style="font-weight:normal;">
<xsl:call-template name="PopulateNoBoxText">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/Own50PercentOrMoreVotingStock"/>
</xsl:call-template>
</span>
</div>
</div>
</div>
<!-- line 5 sub -->
<div class="styGenericDiv" style="width:93mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:0mm;padding-bottom:0mm;"/>
<div class="styLNDesc" style="width:72mm;padding-top:0mm;padding-bottom:0mm;">
<span class="stySmallText">If “Yes,” attach a schedule showing <span class="styBoldText">
(a)  </span>name and employer identification number
(EIN),  <span class="styBoldText">(b)  </span>percentage owned, and  <span class="styBoldText">
(c)  </span>taxable income or (loss) before NOL and special deductions of such 
corporation for the tax year ending with or within your tax year.
</span>
</div>
<div class="styShadingCell" style="width:6mm;height:14mm;"/>
<div class="styShadingCellRB" style="width:6mm;height:14mm;"/>
</div>
<!-- Line 6 -->
<div class="styGenericDiv" style="width:93mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:0mm;padding-bottom:0mm;">6</div>
<div class="styLNDesc" style="width:72mm;padding-top:0mm;padding-bottom:0mm;">
Is the corporation a subsidiary in an affiliated group or a parent-subsidiary controlled group? 
<span style="letter-spacing:4mm;font-weight:bold">.........</span>
</div>
<div class="styGenericDiv">
<div class="styShadingCell" style="width:6mm;height:2mm;"/>
<div class="styShadingCellRB" style="width:6mm;height:2mm;"/>
<div class="styIRS1120LNYesNoBox">
<span style="font-weight:normal;">
<xsl:call-template name="PopulateYesBoxText">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/ControlledGroupMember"/>
<xsl:with-param name="BackupName">ControlledGroupMemberYes</xsl:with-param>
</xsl:call-template>
</span>
<!-- <label>
     <xsl:call-template name="PopulateLabel">
    <xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/ControlledGroupMember"/>
<xsl:with-param name="BackupName">ControlledGroupMemberYes</xsl:with-param>
 </xsl:call-template>
</label>-->
</div>
<div class="styIRS1120LNYesNoBoxRB">
<span style="font-weight:normal;">
<xsl:call-template name="PopulateNoBoxText">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/ControlledGroupMember"/>
<xsl:with-param name="BackupName">ControlledGroupMemberNo</xsl:with-param>
</xsl:call-template>
</span>
<!--<label>
     <xsl:call-template name="PopulateLabel">
    <xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/ControlledGroupMember"/>
<xsl:with-param name="BackupName">ControlledGroupMemberNo</xsl:with-param>
 </xsl:call-template>
</label>-->
</div>
</div>
</div>
<!-- Line 6 sub 1 -->
<div class="styGenericDiv" style="width:93mm;">
<div class="styLNLeftLtrBox" style="height:4.5mm;"/>
<div class="styLNDesc" style="width:72mm;height:4.5mm;">
If “Yes,” enter name and EIN of the parent corporation.
<span style="width:3px;"/>
<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
<span style="width:6px;"/>
<span style="width:70mm;border-bottom:1 solid black;">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/ParentCorporationName/BusinessNameLine1"/>
</xsl:call-template><br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/ParentCorporationName/BusinessNameLine2"/>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/ParentCorporationNameControl"/>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/ParentCorporationEIN"/>
</xsl:call-template>
<xsl:if test="$IRS1120LScheduleM/MissingEINReason !=' '">
<span style="font-weight:normal;">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/MissingEINReason"/>
</xsl:call-template>
</span>
</xsl:if>
</span>
</div>
<div class="styShadingCell" style="width:6mm;height:20mm;border-bottom-width:0px;"/>
<div class="styShadingCell" style="width:6mm;height:20mm;border-bottom-width:0px;border-right-width:1px;"/>
</div>
<!-- Line 7 -->
<div class="styGenericDiv" style="width:93mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:0mm;padding-bottom:0mm;">7</div>
<div class="styLNDesc" style="width:72mm;padding-top:0mm;padding-bottom:0mm;">
At the end of the tax year, did any individual, partnership, corporation, estate, or trust own, directly or indirectly,
50% or more of the corporation’s voting stock? (For rules of attribution, see section 267(c).) If “Yes,”
complete <span class="styBoldText">a</span> and<span class="styBoldText"> b </span>below.
<xsl:call-template name="SetFormLinkInline">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/Own50PercentCorpVotingStock"/>
</xsl:call-template>
</div>
<div class="styGenericDiv">
<div class="styShadingCell" style="width:6mm;height:8mm;"/>
<div class="styShadingCellRB" style="width:6mm;height:8mm;"/>
<div class="styIRS1120LNYesNoBox">
<span style="font-weight:normal;">
<xsl:call-template name="PopulateYesBoxText">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/Own50PercentCorpVotingStock"/>
<xsl:with-param name="BackupName">Own50PercentCorpVotingStockYes</xsl:with-param>
</xsl:call-template>
</span>
<!--<label>
     <xsl:call-template name="PopulateLabel">
    <xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/Own50PercentCorpVotingStock"/>
<xsl:with-param name="BackupName">Own50PercentCorpVotingStockYes</xsl:with-param>
</xsl:call-template>
</label>-->
</div>
<div class="styIRS1120LNYesNoBoxRB">
<span style="font-weight:normal;">
<xsl:call-template name="PopulateNoBoxText">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/Own50PercentCorpVotingStock"/>
<xsl:with-param name="BackupName">Own50PercentCorpVotingStockNo</xsl:with-param>
</xsl:call-template>
</span>
<!--<label>
     <xsl:call-template name="PopulateLabel">
    <xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/Own50PercentCorpVotingStock"/>
<xsl:with-param name="BackupName">Own50PercentCorpVotingStockNo</xsl:with-param>
</xsl:call-template>
</label>-->
</div>
</div>
</div>
<!-- Line 7a-->
<div class="styGenericDiv" style="width:93mm;">
<div class="styLNLeftLtrBox" style="height:4.5mm;">a</div>
<div class="styLNDesc" style="width:72mm;height:4.5mm;">
<span class="stySmallText">Attach a schedule showing name and identifying number.
(Do not include any information already entered in <b>6</b> above.)
<span style="width:3px;"/>
</span>
</div>
<div class="styShadingCell" style="width:6mm;height:7mm;"/>
<div class="styShadingCell" style="width:6mm;height:7mm;;border-right-width:1px;"/>
</div>
<!-- Line 7b-->
<div class="styGenericDiv" style="width:93mm;">
<div class="styLNLeftLtrBox" style="height:4.5mm;">b</div>
<div class="styLNDesc" style="width:72mm;height:4.5mm;">
Enter percentage owned
<span style="width:3px;"/>
<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
<span style="width:6px;"/>
<span style="width:25mm;border-bottom:1 solid black;text-align:right">
<xsl:call-template name="PopulatePercent">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/OwnCorpVotingStockPercent"/>
</xsl:call-template>
</span>
</div>
<div class="styShadingCell" style="width:6mm;height:25mm;border-bottom-width:1px;border-bottom-width:0mm"/>
<div class="styShadingCell" style="width:6mm;height:25mm;border-bottom-width:1px;border-right-width:1px;border-bottom-width:0mm"/>
</div>
</td>
<!--END Schedule M Left Side-->
<!--BEGIN Schedule M Right Side-->
<!--Line 8 -->
<td class="styGenericDiv" style="width:93mm;vertical-align:top;">
<div class="styGenericDiv" style="width:93mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">8</div>
<div class="styLNDesc" style="width:72mm;height:4.5mm;">
At any time during the year, did one foreign person own, 
directly or indirectly, at least 25% of <span class="styBoldText">(a)</span>
the total voting power of all classes of stock of the corporation entitled to vote or 
<span class="styBoldText">(b)</span> the total value of all classes of stock of the corporation?
<!--Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">............</span>
</div>
<div class="styGenericDiv">
<div class="styIRS1120LNYesNoBox">Yes</div>
<div class="styIRS1120LNYesNoBox">No</div>
<div class="styShadingCell" style="width:6mm;height:5mm;"/>
<div class="styShadingCell" style="width:6mm;height:5mm;"/>

<div class="styIRS1120LNYesNoBox">
<span style="font-weight:normal;">
<xsl:call-template name="PopulateYesBoxText">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/ForeignOwn25PercentStock"/>
<xsl:with-param name="BackupName">ForeignOwn25PercentStockYes</xsl:with-param>
</xsl:call-template>
</span>
<!--<label>
     <xsl:call-template name="PopulateLabel">
     <xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/ForeignOwn25PercentStock"/>
<xsl:with-param name="BackupName">ForeignOwn25PercentStockYes</xsl:with-param>
</xsl:call-template>
</label>-->
</div>
<div class="styIRS1120LNYesNoBox">
<span style="font-weight:normal;">
<xsl:call-template name="PopulateNoBoxText">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/ForeignOwn25PercentStock"/>
<xsl:with-param name="BackupName">ForeignOwn25PercentStockNo</xsl:with-param>
</xsl:call-template>
</span>
<!--<label>
     <xsl:call-template name="PopulateLabel">
     <xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/ForeignOwn25PercentStock"/>
<xsl:with-param name="BackupName">ForeignOwn25PercentStockNo</xsl:with-param>
</xsl:call-template>
</label>-->
</div>
</div>
</div>
<!-- line 8a-->
<div class="styGenericDiv" style="width:93mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;"/>
<div class="styLNDesc" style="width:45mm;height:4.5mm;">If "Yes," Enter: 
<span class="styBoldText">a </span>
Percentage owned <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
</div>
<div class="styIRS1120BBText" style="width:25.8mm;text-align:right;">
<xsl:call-template name="PopulatePercent">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/ForeignOwnStockPercent"/>
</xsl:call-template>
</div>
<div class="styGenericDiv" style="width:1mm"/>
<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
</div>
<!-- line 8b -->
<div class="styGenericDiv" style="width:93mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;"/>
<div class="styLNDesc" style="width:31mm;height:4.5mm;">and <span class="styBoldText">b</span>
Owner's country <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
</div>
<div class="styIRS1120BBText" style="width:40mm;">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/ForeignOwnStockCountry"/>
</xsl:call-template>
</div>
<div class="styGenericDiv" style="width:1mm"/>
<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
</div>
<!-- Line 8c-->
<div class="styGenericDiv" style="width:93mm;">
<div class="styLNLeftLtrBox" style="height:4.5mm;">c</div>
<div class="styLNDesc" style="width:72mm;height:4.5mm;">
<span class="stySmallText">The corporation may have to file <span class="styBoldText">Form 5472,
</span> Information Return of a 25% Foreign-Owned U.S. Corporation or a Foreign Corporation 
Engaged in a U.S. Trade or Business. <br/>Enter number of Forms 5472 attached 
<!-- Form to Form Link   -->
<xsl:call-template name="SetFormLinkInline">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/NumberOfForm5472Attached"/>
</xsl:call-template>
<span style="width:3px;"/>
<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
<span style="width:3px;"/>
<span style="width:25.5mm;font-size:6pt;border-bottom:1 solid black;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/NumberOfForm5472Attached"/>
<xsl:with-param name="MaxSize" select="4"/>
</xsl:call-template>
</span>
</span>
</div>
<div class="styShadingCell" style="width:6mm;height:20mm;"/>
<div class="styShadingCell" style="width:6mm;height:20mm;"/>
</div>
<!-- line 9 -->
<div class="styGenericDiv" style="width:93mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:0mm;padding-bottom:0mm;">9</div>
<div class="styLNDesc" style="width:72mm;padding-top:0mm;padding-bottom:0mm;">
Has the corporation elected to use its own payout pattern for discounting unpaid losses and unpaid loss adjustment expenses?
</div>
<div class="styGenericDiv">
<div class="styShadingCell" style="width:6mm;height:2.5mm;"/>
<div class="styShadingCell" style="width:6mm;height:2.5mm;"/>
<div class="styIRS1120LNYesNoBox">
<span style="font-weight:normal;">
<xsl:call-template name="PopulateYesBoxText">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/ElectedOwnPayoutPattern"/>
<xsl:with-param name="BackupName">ElectedOwnPayoutPatternYes</xsl:with-param>
</xsl:call-template>
</span>
<!--  <label>
     <xsl:call-template name="PopulateLabel">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/ElectedOwnPayoutPattern"/>
<xsl:with-param name="BackupName">ElectedOwnPayoutPatternYes</xsl:with-param>
</xsl:call-template>
</label>-->
</div>
<div class="styIRS1120LNYesNoBox">
<span style="font-weight:normal;">
<xsl:call-template name="PopulateNoBoxText">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/ElectedOwnPayoutPattern"/>
<xsl:with-param name="BackupName">ElectedOwnPayoutPatternNo</xsl:with-param>
</xsl:call-template>
</span>
<!--  <label>
     <xsl:call-template name="PopulateLabel">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/ElectedOwnPayoutPattern"/>
<xsl:with-param name="BackupName">ElectedOwnPayoutPatternNo</xsl:with-param>
</xsl:call-template>
</label>-->
</div>
</div>
</div>
<!-- Line 10 -->
<div class="styGenericDiv" style="width:93mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:0mm;padding-bottom:0mm;">10</div>
<div class="styLNDesc" style="width:72mm;padding-top:0mm;padding-bottom:0mm;">
Does the corporation discount any of the loss reserves shown on its annual statement?
<!--Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">..........</span>
</div>
<div class="styGenericDiv">
<div class="styShadingCell" style="width:6mm;height:2.5mm;"/>
<div class="styShadingCell" style="width:6mm;height:2.5mm;"/>
<div class="styIRS1120LNYesNoBox">
<span style="font-weight:normal;">
<xsl:call-template name="PopulateYesBoxText">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/DiscountsLossReserves"/>
<xsl:with-param name="BackupName">DiscountsLossReservesYes</xsl:with-param>
</xsl:call-template>
</span>
<!-- <label>
     <xsl:call-template name="PopulateLabel">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/DiscountsLossReserves"/>
<xsl:with-param name="BackupName">DiscountsLossReservesYes</xsl:with-param>
</xsl:call-template>
</label>-->
</div>
<div class="styIRS1120LNYesNoBox">
<span style="font-weight:normal;">
<xsl:call-template name="PopulateNoBoxText">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/DiscountsLossReserves"/>
<xsl:with-param name="BackupName">DiscountsLossReservesNo</xsl:with-param>
</xsl:call-template>
</span>
<!-- <label>
     <xsl:call-template name="PopulateLabel">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/DiscountsLossReserves"/>
<xsl:with-param name="BackupName">DiscountsLossReservesNo</xsl:with-param>
</xsl:call-template>
</label>-->
</div>
</div>
</div>
<!-- Line 11a -->
<div class="styGenericDiv" style="width:93mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">11a</div>
<div class="styLNDesc" style="width:72mm;height:4.5mm;">Enter the total unpaid losses shown on the
corporation’s annual statement:</div>
<div class="styShadingCell" style="width:6mm;height:6.5mm;"/>
<div class="styShadingCellRB" style="width:6mm;height:6.5mm;border-right-width:0px"/>
</div>
<div class="styGenericDiv" style="width:93mm;height:4.5mm;">
<div class="styLNLeftLtrBox" style="height:4.5mm;padding-left:8mm">(1)</div>
<div class="styLNDesc" style="width:30mm;height:4.5mm;padding-left:2mm">
For the current year: $ 
</div>
<div class="styIRS1120BBText" style="width:37.3mm;text-align:right">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/UnpaidLossesForCurrentYear"/>
</xsl:call-template>
</div>
<div class="styGenericDiv" style="width:1mm;"/>
<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
<div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px"/>
</div>
<div class="styGenericDiv" style="width:93mm;height:4.5mm;">
<div class="styLNLeftLtrBox" style="height:4.5mm;padding-left:8mm">(2)</div>
<div class="styLNDesc" style="width:30mm;height:4.5mm;padding-left:2mm">

For the previous year: $ 
</div>
<div class="styIRS1120BBText" style="width:37.3mm;text-align:right">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/UnpaidLossesForPreviousYear"/>
</xsl:call-template>
</div>
<div class="styGenericDiv" style="width:1mm;"/>
<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
<div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px"/>
</div>
<!-- Line 11b -->
<div class="styGenericDiv" style="width:93mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4.5mm">  b</div>
<div class="styLNDesc" style="width:72mm;height:4.5mm;">Enter the total unpaid loss adjustment expenses
shown on the corporation’s annual statement:
</div>
<div class="styShadingCell" style="width:6mm;height:6.5mm;"/>
<div class="styShadingCellRB" style="width:6mm;height:6.5mm;border-right-width:0px"/>
</div>
<div class="styGenericDiv" style="width:93mm;height:4.5mm;">
<div class="styLNLeftLtrBox" style="height:4.5mm;padding-left:8mm">(1)</div>
<div class="styLNDesc" style="width:30mm;height:4.5mm;padding-left:2mm;">
For the current year: $ 
</div>
<div class="styIRS1120BBText" style="width:37.3mm;text-align:right">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/TotalUnpaidLossForCurrentYear"/>
</xsl:call-template>
</div>
<div class="styGenericDiv" style="width:1mm;"/>
<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
<div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px"/>
</div>
<div class="styGenericDiv" style="width:93mm;height:4.5mm;">
<div class="styLNLeftLtrBox" style="height:4.5mm;padding-left:8mm">(2)</div>
<div class="styLNDesc" style="width:30mm;height:4.5mm;padding-left:2mm">
For the previous year: $ 
</div>
<div class="styIRS1120BBText" style="width:37.3mm;text-align:right">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/TotalUnpaidLossForPreviousYear"/>
</xsl:call-template>
</div>
<div class="styGenericDiv" style="width:1mm;"/>
<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
<div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px"/>
</div>
<!-- Line 12 -->
<div class="styGenericDiv" style="width:93mm;">
<div class="styLNLeftNumBox" style="height:7mm;">12</div>
<div class="styLNDesc" style="width:72mm;height:7mm;font-size:6pt;">
<label>
<xsl:call-template name="PopulateLabel">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/OLDForegoCarryback"/>
<xsl:with-param name="BackupName">IRS1120LScheduleMOLDForegoCarryback</xsl:with-param>
</xsl:call-template>
If the corporation has an operations loss deduction (OLD)
for the tax year and is electing under section 810(b)(3) to forego the carryback period, check here  
<!-- Form to Form Link   -->
<xsl:call-template name="SetFormLinkInline">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/OLDForegoCarryback"/>
</xsl:call-template>
<!--Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">.......</span>
<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
</label>
<span style="width:2px;"/>
<input type="checkbox" class="styCkbox">
<xsl:call-template name="PopulateCheckbox">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/OLDForegoCarryback"/>
<xsl:with-param name="BackupName">IRS1120LScheduleMOLDForegoCarryback</xsl:with-param>
</xsl:call-template>
</input>
</div>
<div class="styShadingCell" style="width:6mm;height:11mm;"/>
<div class="styShadingCell" style="width:6mm;height:11mm;"/>
</div>
<!-- Line 12 - sub -->
<div class="styGenericDiv" style="width:93mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;"/>
<div class="styLNDesc" style="width:72mm;height:4.5mm;padding-right:2px;">
If the corporation is filing a consolidated return, the statement required by Regulations section 1.1502-21(b)(3) must be attached or the election will not be valid.</div>
<div class="styShadingCell" style="width:6mm;height:10mm;"/>
<div class="styShadingCell" style="width:6mm;height:10mm;"/>
</div>
<!-- Line 13 sub -->
<div class="styGenericDiv" style="width:93mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;">13</div>
<div class="styLNDesc" style="width:72mm;height:4.5mm;">
Enter the available OLD carryover from prior tax years. (Do not reduce it by any deduction on page 1, line 21b.)
<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
<br/> $
<span style="width:25mm;border-bottom:1 solid black;text-align:right">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/NOLCarryoverFromPriorYear"/>
</xsl:call-template>
</span>
</div>
<div class="styGenericDiv">
<div class="styShadingCell" style="width:6mm;height:10mm;"/>
<div class="styShadingCell" style="width:6mm;height:10mm;"/>
</div>
<!-- Line 14a  -->
<div class="styGenericDiv" style="width:93mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:0mm;
padding-bottom:0mm;">14a</div>
<div class="styLNDesc" style="width:72mm;padding-top:0mm;padding-bottom:0mm;">
Enter the corporation’s state of domicile
<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
<span style="width:15mm;border-bottom:1 solid black;text-align:right">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/CorporateStateOfDomicile"/>
</xsl:call-template>
</span>
</div>
<div class="styGenericDiv">
<div class="styShadingCell" style="width:6mm;height:5mm;"/>
<div class="styShadingCell" style="width:6mm;height:5mm;"/>
</div>
</div>
<!-- Line 14b1 -->
<div class="styGenericDiv" style="width:93mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:0mm;
padding-bottom:0mm;padding-left:5mm">b</div>
<div class="styLNDesc" style="width:72mm;padding-top:0mm;padding-bottom:0mm;">
Was the annual statement used to prepare the tax return filed with the state of domicile?
</div>
<div class="styGenericDiv">
<div class="styShadingCell" style="width:6mm;height:3mm;"/>
<div class="styShadingCell" style="width:6mm;height:3mm;"/>
<div class="styIRS1120LNYesNoBox">
<span style="font-weight:normal;">
<xsl:call-template name="PopulateYesBoxText">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/AnnualStmtFiledInLine14aState"/>
<xsl:with-param name="BackupName">AnnualStmtFiledInLine14aStateYes</xsl:with-param>
</xsl:call-template>
</span>
<!-- <label>
     <xsl:call-template name="PopulateLabel">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/AnnualStmtFiledInLine14aState"/>
<xsl:with-param name="BackupName">AnnualStmtFiledInLine14aStateYes</xsl:with-param>
</xsl:call-template>
</label>-->
</div>
<div class="styIRS1120LNYesNoBox">
<span style="font-weight:normal;">
<xsl:call-template name="PopulateNoBoxText">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/AnnualStmtFiledInLine14aState"/>
<xsl:with-param name="BackupName">AnnualStmtFiledInLine14aStateNo</xsl:with-param>
</xsl:call-template>
</span>
<!--<label>
     <xsl:call-template name="PopulateLabel">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/AnnualStmtFiledInLine14aState"/>
<xsl:with-param name="BackupName">AnnualStmtFiledInLine14aStateNo</xsl:with-param>
</xsl:call-template>
</label>-->
</div>
</div>
</div>
<!-- Line 14b2 -->
<div class="styGenericDiv" style="width:93mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:0mm;
padding-bottom:0mm;padding-left:5mm"/>
<div class="styLNDesc" style="width:72mm;padding-top:0mm;padding-bottom:0mm;">
If “No,” complete<b> c</b> below.
</div>
<div class="styGenericDiv">
<div class="styShadingCell" style="width:6mm;height:5mm;"/>
<div class="styShadingCell" style="width:6mm;height:5mm;"/>
</div>
</div>
<!-- Line 14c -->
<div class="styGenericDiv" style="width:93mm;">
<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:0mm;
padding-bottom:0mm;padding-left:5mm">c</div>
<div class="styLNDesc" style="width:72mm;padding-top:0mm;padding-bottom:0mm;">
Enter the state where the annual statement used to prepare the tax return was filed
<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
<span style="width:15mm;border-bottom:1 solid black;text-align:right">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/AnnualStmtFiledInAnotherState"/>
</xsl:call-template>
</span>
</div>
<div class="styGenericDiv">
<div class="styShadingCell" style="width:6mm;height:9mm;"/>
<div class="styShadingCell" style="width:6mm;height:9mm;"/>
</div>
</div>
</div>
<!-- Line 15 -->
<div class="styGenericDiv" style="width:93mm;">
<div class="styLNLeftNumBox" style="height:6mm;padding-top:0mm;padding-bottom:0mm;">15</div>
<div class="styLNDesc" style="width:72mm;padding-top:0mm;padding-bottom:0mm;">
Is the corporation required to file Schedule UTP (Form 1120), Uncertain Tax Position Statement (see instructions)? 
<!--Dotted Line-->
<span style="letter-spacing:4mm;font-weight:bold">...</span>
</div>
<div class="styGenericDiv">
<div class="styShadingCell" style="width:6mm;height:4mm;"/>
<div class="styShadingCell" style="width:6mm;height:4mm;"/>
<div class="styIRS1120LNYesNoBox">
<span style="font-weight:normal;">
<xsl:call-template name="PopulateYesBoxText">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/UncertainTaxPositionStatement"/>
<xsl:with-param name="BackupName">UncertainTaxPositionStatementYes</xsl:with-param>
</xsl:call-template>
</span>
<!--     <label>
     <xsl:call-template name="PopulateLabel">
    <xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/UncertainTaxPositionStatement"/>
<xsl:with-param name="BackupName">UncertainTaxPositionStatementYes</xsl:with-param>
</xsl:call-template> 
</label>-->
</div>
<div class="styIRS1120LNYesNoBox">
<span style="font-weight:normal;">
<xsl:call-template name="PopulateNoBoxText">
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/UncertainTaxPositionStatement"/>
<xsl:with-param name="BackupName">UncertainTaxPositionStatementNo</xsl:with-param>
</xsl:call-template>
</span>
<!-- <label>
     <xsl:call-template name="PopulateLabel">
    <xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/UncertainTaxPositionStatement"/>
<xsl:with-param name="BackupName">UncertainTaxPositionStatementNo</xsl:with-param>
</xsl:call-template> 
</label>-->
</div>
</div>
</div>
<div class="styLNDesc" style="width:80mm;height:4.5mm;padding-left:8mm">If "Yes," complete and attach Schedule UTP.
</div>
<div class="styShadingCell" style="width:6mm;height:19mm;"/>
<div class="styShadingCell" style="width:6mm;height:19mm;"/>
</td>
<!--END Schedule M Right Side-->
</tr>
</table>
<!-- END Schedule M Line Items -->
</div>
<!-- Page Break and Footer-->
<div class="pageEnd" style="width:187mm;">
<div style="float:right;">
<span style="width:80px;"/>  
Form <span class="styBoldText" style="font-size:8pt;">1120-L</span> (2011)
</div>
</div>
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
<!-- ****************************Additional Data Table **********************************-->
<table class="styLeftOverTbl">
<xsl:call-template name="PopulateCommonLeftover">
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj"/>
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
<xsl:with-param name="Desc">Form 1120L, Top Left Margin - Supporting Statement to Consolidated Return 
</xsl:with-param>
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/@suprtStmtToCnsldtReturnInd"/>
<xsl:with-param name="DescWidth" select="100"/>
</xsl:call-template>
<xsl:call-template name="PopulateLeftoverRowAmount">
<xsl:with-param name="Desc">Form 1120, Top Left Margin - Section 1291 Interest Amount</xsl:with-param>
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/@section1291InterestAmount"/>
<xsl:with-param name="DescWidth" select="100"/>
</xsl:call-template>
<xsl:call-template name="PopulateLeftoverRow">
<xsl:with-param name="Desc">Form 1120, Top Left Margin - Section 1294 Interest Indicator</xsl:with-param>
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/@section1294InterestIndicator"/>
<xsl:with-param name="DescWidth" select="100"/>
</xsl:call-template>
<xsl:call-template name="PopulateLeftoverRowAmount">
<xsl:with-param name="Desc">Form 1120, Top Left Margin - Section 1294 Interest Amount</xsl:with-param>
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/@section1294InterestAmount"/>
<xsl:with-param name="DescWidth" select="100"/>
</xsl:call-template>
<xsl:call-template name="PopulateLeftoverRow">
<xsl:with-param name="Desc">Form 1120, Top Left Margin - Section 501d Indicator</xsl:with-param>
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/@section501dIndicator"/>
<xsl:with-param name="DescWidth" select="100"/>
</xsl:call-template>
<xsl:call-template name="PopulateLeftoverRow">
<xsl:with-param name="Desc">Form 1120, Top Left Margin - Subchapter T Cooperative Indicator</xsl:with-param>
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/@subchapterTCoopIndicator"/>
<xsl:with-param name="DescWidth" select="100"/>
</xsl:call-template>
<xsl:call-template name="PopulateLeftoverRow">
<xsl:with-param name="Desc">Line D - SECTION 953(D) Indicator</xsl:with-param>
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/ElectionMadeUnderSection953D/@Section953DIndicator"/>
<xsl:with-param name="DescWidth" select="100"/>
</xsl:call-template>
<xsl:call-template name="PopulateLeftoverRowAmount">
<xsl:with-param name="Desc">Line D - SECTION 953(D) Amount</xsl:with-param>
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/ElectionMadeUnderSection953D/@Section953DAmount"/>
<xsl:with-param name="DescWidth" select="100"/>
</xsl:call-template>
<xsl:call-template name="PopulateLeftoverRow">
<xsl:with-param name="Desc">Line 7 - Other Income Item</xsl:with-param>
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/OtherIncome/@otherIncomeItem"/>
<xsl:with-param name="DescWidth" select="100"/>
</xsl:call-template>
<xsl:call-template name="PopulateLeftoverRow">
<xsl:with-param name="Desc">Line 9 - Form 4684 Indicator</xsl:with-param>
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/NetGainLoss/@form4684Indicator"/>
<xsl:with-param name="DescWidth" select="100"/>
</xsl:call-template>
<xsl:call-template name="PopulateLeftoverRow">
<xsl:with-param name="Desc">Line 30 - CCF Indicator</xsl:with-param>
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/TaxableIncome/@cCFIndicator"/>
<xsl:with-param name="DescWidth" select="100"/>
</xsl:call-template>
<xsl:call-template name="PopulateLeftoverRow">
<xsl:with-param name="Desc">Line 29h -ODCIndicator</xsl:with-param>
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/Form2439And4136Credits/@ODCIndicator"/>
<xsl:with-param name="DescWidth" select="100"/>
</xsl:call-template>
<xsl:call-template name="PopulateLeftoverRow">
<xsl:with-param name="Desc">Line 29k - backupWithholdingIndicator</xsl:with-param>
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/USIncomeTaxPaidOrWithheld29k/@backupWithholdingIndicator"/>
<xsl:with-param name="DescWidth" select="100"/>
</xsl:call-template>
<xsl:call-template name="PopulateLeftoverRowAmount">
<xsl:with-param name="Desc">Line 29k - backupWithholdingAmount</xsl:with-param>
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/USIncomeTaxPaidOrWithheld29k/@backupWithholdingAmount"/>
<xsl:with-param name="DescWidth" select="100"/>
</xsl:call-template>
<xsl:call-template name="PopulateLeftoverRowAmount">
<xsl:with-param name="Desc">Line 30 - CCF Amount</xsl:with-param>
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/TaxableIncome/@cCFAmount"/>
<xsl:with-param name="DescWidth" select="100"/>
</xsl:call-template>
<xsl:call-template name="PopulateLeftoverRow">
<xsl:with-param name="Desc">Line 32b - Beneficiary Of Trust Indicator</xsl:with-param>
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/EstimatedTaxPayments/@beneficiaryOfTrustIndicator"/>
<xsl:with-param name="DescWidth" select="100"/>
</xsl:call-template>
<xsl:call-template name="PopulateLeftoverRowAmount">
<xsl:with-param name="Desc">Line 32b - Beneficiary Of Trust Amount</xsl:with-param>
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/EstimatedTaxPayments/@beneficiaryOfTrustAmount"/>
<xsl:with-param name="DescWidth" select="100"/>
</xsl:call-template>
<xsl:call-template name="PopulateLeftoverRow">
<xsl:with-param name="Desc">Line 32b - Form 8816 Indicator</xsl:with-param>
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/EstimatedTaxPayments/@f8816Indicator"/>
<xsl:with-param name="DescWidth" select="100"/>
</xsl:call-template>
<xsl:call-template name="PopulateLeftoverRowAmount">
<xsl:with-param name="Desc">Line 32b - Form 8816 Amount</xsl:with-param>
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/EstimatedTaxPayments/@f8816Amount"/>
<xsl:with-param name="DescWidth" select="100"/>
</xsl:call-template>
<xsl:call-template name="PopulateLeftoverRow">
<xsl:with-param name="Desc">Line 32b - Section 847 Deduction Indicator</xsl:with-param>
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/EstimatedTaxPayments/@section847DeductionIndicator"/>
<xsl:with-param name="DescWidth" select="100"/>
</xsl:call-template>
<xsl:call-template name="PopulateLeftoverRow">
<xsl:with-param name="Desc">Line 32f(1) - Backup Withholding Indicator</xsl:with-param>
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/UndistributedCapitalGainsCr/@backupWithholdingIndicator"/>
<xsl:with-param name="DescWidth" select="100"/>
</xsl:call-template>
<xsl:call-template name="PopulateLeftoverRowAmount">
<xsl:with-param name="Desc">Line 32f(1) - Backup Withholding Amount</xsl:with-param>
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/UndistributedCapitalGainsCr/@backupWithholdingAmount"/>
<xsl:with-param name="DescWidth" select="100"/>
</xsl:call-template>
<xsl:call-template name="PopulateLeftoverRow">
<xsl:with-param name="Desc">Line 32f(2) - Ozone Depleting Chemicals Indicator</xsl:with-param>
<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/CreditForFederalTaxOnFuels/@ozoneDepletingChemicalsInd"/>
<xsl:with-param name="DescWidth" select="100"/>
</xsl:call-template>
<xsl:call-template name="PopulateLeftoverRow">
<xsl:with-param name="Desc">Schedule K Line 02 - differential Rate 316 Indicator</xsl:with-param>
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/IncomeTax/@differentialRate316Indicator"/>
<xsl:with-param name="DescWidth" select="100"/>
</xsl:call-template>
<xsl:call-template name="PopulateLeftoverRowAmount">
<xsl:with-param name="Desc">Schedule K Line 02 - differential Rate316 Amount</xsl:with-param>
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/IncomeTax/@differentialRate316Amount"/>
<xsl:with-param name="DescWidth" select="100"/>
</xsl:call-template>
<xsl:call-template name="PopulateLeftoverRow">
<xsl:with-param name="Desc">Schedule K Line 02 - section1291 Indicator</xsl:with-param>
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/IncomeTax/@section1291Indicator"/>
<xsl:with-param name="DescWidth" select="100"/>
</xsl:call-template>
<xsl:call-template name="PopulateLeftoverRowAmount">
<xsl:with-param name="Desc">Schedule K Line 02 - section1291 Amount</xsl:with-param>
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/IncomeTax/@section1291Amount"/>
<xsl:with-param name="DescWidth" select="100"/>
</xsl:call-template>
<xsl:call-template name="PopulateLeftoverRow">
<xsl:with-param name="Desc">Schedule K Line 02 - section1291 Interest Indicator</xsl:with-param>
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/IncomeTax/@section1291InterestIndicator"/>
<xsl:with-param name="DescWidth" select="100"/>
</xsl:call-template>
<xsl:call-template name="PopulateLeftoverRowAmount">
<xsl:with-param name="Desc">Schedule K Line 02 - section1291 Interest Amount</xsl:with-param>
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/IncomeTax/@section1291InterestAmount"/>
<xsl:with-param name="DescWidth" select="100"/>
</xsl:call-template>
<xsl:call-template name="PopulateLeftoverRow">
<xsl:with-param name="Desc">Schedule K Line 02 - section197 Indicator</xsl:with-param>
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/IncomeTax/@section197Indicator"/>
<xsl:with-param name="DescWidth" select="100"/>
</xsl:call-template>
<xsl:call-template name="PopulateLeftoverRowAmount">
<xsl:with-param name="Desc">Schedule K Line 02 - section197 Amount</xsl:with-param>
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/IncomeTax/@section197Amount"/>
<xsl:with-param name="DescWidth" select="100"/>
</xsl:call-template>
<xsl:call-template name="PopulateLeftoverRow">
<xsl:with-param name="Desc">Schedule K Line 4 - Parent Corporation Name Control</xsl:with-param>
<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/ParentCorporationNameControl"/>
<xsl:with-param name="DescWidth" select="100"/>
</xsl:call-template>
<xsl:call-template name="PopulateLeftoverRow">
<xsl:with-param name="Desc">Schedule M Line 1b - Method Of Accounting Other</xsl:with-param>
<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/MethodOfAccountingOther/@note"/>
<xsl:with-param name="DescWidth" select="100"/>
</xsl:call-template>
</table>
<!-- ****************************END Left Over Table *******************************-->
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
</form>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
