<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1120PCStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form1120PCData" select="$RtnDoc/IRS1120PC"/>
	<xsl:param name="Form1120PCScheduleA" select="$RtnDoc/IRS1120PC/IRS1120PCScheduleA"/>
	<xsl:param name="Form1120PCScheduleB" select="$RtnDoc/IRS1120PC/IRS1120PCScheduleB"/>
	<xsl:param name="Form1120PCScheduleC" select="$RtnDoc/IRS1120PC/IRS1120PCScheduleC"/>
	<xsl:param name="Form1120PCScheduleE" select="$RtnDoc/IRS1120PC/IRS1120PCScheduleE"/>
	<xsl:param name="Form1120PCScheduleF" select="$RtnDoc/IRS1120PC/IRS1120PCScheduleF"/>
	<xsl:param name="Form1120PCScheduleG" select="$RtnDoc/IRS1120PC/IRS1120PCScheduleG"/>
	<xsl:param name="Form1120PCScheduleH" select="$RtnDoc/IRS1120PC/IRS1120PCScheduleH"/>
	<xsl:param name="Form1120PCScheduleI" select="$RtnDoc/IRS1120PC/IRS1120PCScheduleI"/>
	<xsl:param name="Form1120PCScheduleL" select="$RtnDoc/IRS1120PC/IRS1120PCScheduleL"/>
	<xsl:param name="Form1120PCScheduleM1" select="$RtnDoc/IRS1120PC/IRS1120PCScheduleM1"/>
	<xsl:param name="Form1120PCScheduleM2" select="$RtnDoc/IRS1120PC/IRS1120PCScheduleM2"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form1120PCData)"/>
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
				<meta name="Description" content="IRS Form 1120PC"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<!--EXCEPTION: the value of this pen and ink image will not be display at the Additional data section becz the text is being display on the line inside the form -->
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1120PCStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<!-- Form Header -->
				<form name="Form1120-PC">
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;">
						<!--Form box begin -->
						<div class="styFNBox" style="width:33.3mm;height:18mm;">
                    Form <span class="styFormNumber" style="font-size:18pt">1120-PC</span>
							<!-- Form to Form Link (Push Pin plus pen and ink) -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120PCData"/>
							</xsl:call-template>
							<span style="width:3px;"/>
							<!-- start here -->
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Header - Suport Statement Consolidated Return Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1120PCData/@suprtStmtConsolidatedReturnCd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Header - SECTION 301.9100-2</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1120PCData/@filedPursuantToSect30191002Cd"/>
							</xsl:call-template>
							<br/>
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service</span>
						</div>
						<!--Form box end -->
						<div class="styFTBox" style="width:120mm;height:18mm;">
							<div class="styMainTitle" style="height:11mm;">U.S. Property and Casualty Insurance Company Income Tax Return</div>
							<div class="styFST" style="height:5mm;font-size:6pt;margin-left:2mm;text-align:center;font-weight:normal">
                    For calendar year 2013, or tax year beginning   
                    <span style="width: 18mm;border-bottom:1px solid black;">
									<!-- No need to send the parameters -->
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/TaxYearBeginDt"/>
									</xsl:call-template>
								</span>,2013
                     and ending 
                      <span style="width: 18mm;border-bottom:1px solid black;">
									<!-- No need to send the parameters -->
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/TaxYearEndDt"/>
									</xsl:call-template>
								</span>
								<br/>
								<div class="styFST" style="height:5mm;font-size:5.6pt;padding-top:1mm;">
									<img src="{$ImagePath}/1120_Bullet_Md.gif" alt="MediumBullet"/>
                 Information about Form 1120-PC and its separate instructions is at 
                 <a href="http://www.irs.gov/form1120-PC" title="Link to irs.gov">
										<i>www.irs.gov/form1120-PC </i>
									</a>
								</div>
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;height:18mm;">
							<div class="styOMB" style="height:4mm;">OMB No. 1545-1027</div>
							<div class="styTY" style="height:11mm;">20<span class="styTYColor">13</span>
							</div>
						</div>
					</div>
					<!--Return Header End -->
					<!-- Header Line A 1 -->
<!-- Header Line A 1 -->
<!--<div style="width:187mm;float:left;clear:left;height:27mm;">-->
<div style="width:187mm;float:left;clear:left;height:32mm;">
<div style="width:33.3mm;height:2mm;float:left;clear:left">
<div class="styComType" style="width:33.3mm;border-bottom-width: 0px;padding-top:2mm;border-right-width: 1px;">
<!--<div class="styBoldText" style="height:3mm;width:4mm;float:left;clear:none;">A</div>-->
<div class="styBoldText" style="height:3mm;width:3mm;float:left;clear:none;">A</div>
<div class="styGenericDiv" style="height:3mm;width:26mm">Check if:</div>
</div>
<div class="styComType" style="width:33.3mm;border-bottom:0px;border-right-width: 1px;">
<div class="styBoldText" style="height:8.5mm;width:3mm;float:left;clear:none;padding-top:2mm;">1</div>
<div class="styGenericDiv" style="height:8.5mm;width:25mm;padding-top:2mm;">
<label>
<xsl:call-template name="PopulateLabel">
<xsl:with-param name="TargetNode" select="  $Form1120PCData/ConsolidatedReturnInd"/>
<xsl:with-param name="BackupName">IRS1120LIsConsolidatedReturn</xsl:with-param>
</xsl:call-template>Consolidated return (attach Form 851)
<!-- Form to Form Link -->
<xsl:call-template name="SetFormLinkInline">
<xsl:with-param name="TargetNode" select="  $Form1120PCData/ConsolidatedReturnInd"/>
</xsl:call-template>
</label>
</div>
<div class="styGenericDiv" style="height:7mm;padding-top:2mm;">
<input type="checkbox" class="styCkbox">
<xsl:call-template name="PopulateCheckbox">
<xsl:with-param name="TargetNode" select="  $Form1120PCData/ConsolidatedReturnInd"/>
<xsl:with-param name="BackupName">IRS1120LIsConsolidatedReturn</xsl:with-param>
</xsl:call-template>
</input>
</div>
</div>
<br/>
<br/>
<!-- Header Line A 2 -->
<div class="styComType" style="width:33.3mm;border-bottom:0px;border-right-width: 1px;">
<div class="styBoldText" style="height:9.5mm;width:3mm;float:left;clear:none;padding-top:2mm;">2</div>
<div class="styGenericDiv" style="height:9.5mm;width:25mm;padding-top:2mm;">
<label>
<xsl:call-template name="PopulateLabel">
<xsl:with-param name="TargetNode" select="  $Form1120PCData/LifeNonlifeConsolidatedRetInd"/>
<xsl:with-param name="BackupName">IRS1120LLifeNonlifeConsolidatedReturn</xsl:with-param>
</xsl:call-template>Life-nonlife consolidated return
</label>
</div>
<div class="styGenericDiv" style="height:7mm;padding-top:2mm;">
<input type="checkbox" class="styCkbox">
<xsl:call-template name="PopulateCheckbox">
<xsl:with-param name="TargetNode" select="  $Form1120PCData/LifeNonlifeConsolidatedRetInd"/>
<xsl:with-param name="BackupName">IRS1120LLifeNonlifeConsolidatedReturn</xsl:with-param>
</xsl:call-template>
</input>
</div>
</div>
<br/>
<br/>
<!-- Header Line A 3 -->
<div class="styComType" style="width:33.3mm;border-bottom:1px solid black;border-right-width: 1px;height:auto;">
<div class="styBoldText" style="height:9mm;width:3mm;float:left;clear:none;padding-top:2mm;">3</div>
<div class="styGenericDiv" style="height:9mm;width:25mm;padding-top:2mm;">
<label>
<xsl:call-template name="PopulateLabel">
<xsl:with-param name="TargetNode" select="  $Form1120PCData/ScheduleM3Form1120PCInd"/>
<xsl:with-param name="BackupName">IRS1120LScheduleM3Required</xsl:with-param>
</xsl:call-template>Schedule M-3 (Form 1120-PC) attached
          <xsl:call-template name="SetFormLinkInline">
<xsl:with-param name="TargetNode" select="  $Form1120PCData/ScheduleM3Form1120PCInd"/>
</xsl:call-template>
</label>
</div>
<div class="styGenericDiv" style="height:9mm;padding-top:2mm;">
<input type="checkbox" class="styCkbox">
<xsl:call-template name="PopulateCheckbox">
<xsl:with-param name="TargetNode" select="  $Form1120PCData/ScheduleM3Form1120PCInd"/>
<xsl:with-param name="BackupName">IRS1120LScheduleM3Required</xsl:with-param>
</xsl:call-template>
</input>
</div>
</div>
</div>
<!-- return header Name box -->
<div class="styLblNameAddr" style="width:105mm;height:auto;border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
<!--<div class="styUseLbl" style="width:10mm;height:27mm;border-right-width:0px;padding-top:12mm;padding-left:1mm">-->
<div class="styUseLbl" style="width:10mm;height:32mm;border-right-width:0px;padding-top:6mm;padding-left:1mm">
  Please<br/> print<br/> or<br/> type</div>
<!--<div class="styNameAddr" style="width:94mm;height:9mm;border-left-width:1px;padding-left:2mm;">-->
<div class="styNameAddr" style="width:94.5mm;height:13mm;border-left-width:1px;padding-left:2mm;">
Name<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="  $Form1120PCData/BusinessName/BusinessNameLine1"/>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="  $Form1120PCData/BusinessName/BusinessNameLine2"/>
</xsl:call-template>
</div>
<!-- return header Adress box -->
<div class="styNameAddr" style="width:94.5mm;height:9mm;border-left-width:1px;padding-left:2mm;">
        Number, street, and room or suite no. If a P.O. box, see instructions.
    <!-- Address -->
<!-- USA Address -->
<br/>
<xsl:if test="  $Form1120PCData/USAddress/AddressLine1!=''">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="  $Form1120PCData/USAddress/AddressLine1"/>
</xsl:call-template>
<br/>
</xsl:if>
<xsl:if test="  $Form1120PCData/USAddress/AddressLine1!=''">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="  $Form1120PCData/USAddress/AddressLine2"/>
</xsl:call-template>
<br/>
</xsl:if>
<!-- Foreign Address -->
<xsl:if test="  $Form1120PCData/ForeignAddress/AddressLine1!=''">
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="  $Form1120PCData/ForeignAddress/AddressLine1"/>
</xsl:call-template>
<span class="styTableCellPad"/>
</xsl:if>
<xsl:if test="  $Form1120PCData/ForeignAddress/AddressLine2!=''">
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="  $Form1120PCData/ForeignAddress/AddressLine2"/>
</xsl:call-template>
<span class="styTableCellPad"/>
</xsl:if>
</div>
<!--<div class="styNameAddr" style="border-bottom-width:0px;width:90mm;border-left-width:1px;padding-left:2mm;height:9mm;">-->
<div class="styNameAddr" style="border-bottom-width:0px;width:94.5mm;border-left-width:1px;padding-left:2mm;height:10mm;">
        City or town, state or province, country, and ZIP or foreign postal code
<!-- USA Address -->
<xsl:if test="  $Form1120PCData/USAddress/City!=''">
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="  $Form1120PCData/USAddress/City"/>
</xsl:call-template>
<span class="styTableCellPad"/>
</xsl:if>
<xsl:if test="  $Form1120PCData/USAddress/State!=''">
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="  $Form1120PCData/USAddress/State"/>
</xsl:call-template>
<span class="styTableCellPad"/>
</xsl:if>
<xsl:if test="  $Form1120PCData/USAddress/ZIPCode!=''">
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="  $Form1120PCData/USAddress/ZIPCode"/>
</xsl:call-template>
<span class="styTableCellPad"/>
</xsl:if>
<!-- Foreign Address -->
<xsl:if test="  $Form1120PCData/ForeignAddress/City!=''">
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="  $Form1120PCData/ForeignAddress/City"/>
</xsl:call-template>
<span class="styTableCellPad"/>
</xsl:if>
<xsl:if test="  $Form1120PCData/ForeignAddress/ProvinceOrState!=''">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="  $Form1120PCData/ForeignAddress/ProvinceOrState"/>
</xsl:call-template>
<span class="styTableCellPad"/>
</xsl:if>
<xsl:if test="  $Form1120PCData/ForeignAddress/PostalCode!=''">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="  $Form1120PCData/ForeignAddress/PostalCode"/>
</xsl:call-template>
<span class="styTableCellPad"/>
</xsl:if>
<xsl:if test="  $Form1120PCData/ForeignAddress/Country!=''">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="  $Form1120PCData/ForeignAddress/Country"/>
</xsl:call-template>
<span class="styTableCellPad"/>
</xsl:if>
</div>
</div>
<!-- EIN B Line -->
<!-- Since this is a main form, we must check for and display an updated EIN.  
    To do this, we use the EINChanged parameter PopulateReturnHeaderFiler.-->
<!--<div class="styEINDateAssets" style="width:46mm;height:8.5mm;">-->
<div class="styEINDateAssets" style="width:48mm;height:13mm;">
<span class="styBoldText" style="padding-right:1.5mm">B</span> <b> Employer identification number</b>
<br/>
<br/>
<span style="padding-left:15mm">
								<xsl:if test="$Form1120PCData/EIN !=' '">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/EIN"/>
									</xsl:call-template>
									<span style="width: 2px"/>
								</xsl:if>
								<xsl:if test="$Form1120PCData/MissingEINReasonCd!=' '">
									<span style="font-weight:normal;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form1120PCData/MissingEINReasonCd"/>
										</xsl:call-template>
									</span>
								</xsl:if>
</span>
</div>
<!-- Header C Date incorparated -->
<!--<div class="styEINDateAssets" style="width:46mm;height:9.5mm;">-->
<div class="styEINDateAssets" style="width:48mm;height:9.0mm;">
<span class="styBoldText" style="padding-right:2mm">C </span>Date incorporated<br/>
<br/>
<span class="styEINFld" style="padding-left:15mm;">
<xsl:call-template name="PopulateMonthDayYear">
<xsl:with-param name="TargetNode" select="  $Form1120PCData/IncorporationDt"/>
</xsl:call-template>
</span>
</div>
<!-- Header D Date incorparated -->
<!--<div class="styEINDateAssets" style="width:46mm;height:8.75mm;border-bottom-width:0px;">-->
<div class="styEINDateAssets" style="width:48mm;height:10mm;border-bottom-width:0px;">
<span class="styBoldText" style="padding-right:1mm">D </span>Check applicable box if an election <br/>
<span style="padding-left:1mm">  has been made under section(s):</span>
</div>
</div>
<!-- Header E -->
<div class="styBB" style="width:187mm;border-right-width:0px;">
<div class="styBB" style="border-right-width:1px;border-bottom-width:0px;">
<!-- E 1 -->
<div class="styGenericDiv" style="width:138mm;height:5mm;">
<div class="styBoldText" style="float:left;clear:none;padding-right:2mm;padding-top:1.5mm;">E</div>
      Check if: <span style="width:1mm;"/>
<span class="styBoldText">(1)</span>
<span style="width:3px;"/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/FinalReturnInd"/>
										<xsl:with-param name="BackupName">IRS1120FinalReturn</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/FutureFilingNotRequiredInd"/>
										<xsl:with-param name="BackupName">IRS1120FinalReturn</xsl:with-param>
									</xsl:call-template>
                  Final return 
                </label>
      								<xsl:variable name="finalReturnID">
									<xsl:call-template name="PopulateID">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/FutureFilingNotRequiredInd"/>
									</xsl:call-template>
								</xsl:variable>
<!-- E 2 -->
<span style="width:4px"/>
<span class="styBoldText">(2)</span>
<span style="width:3px;"/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/FutureFilingNotRequiredInd"/>
										<xsl:with-param name="BackupName">IRS1120FinalReturn</xsl:with-param>
									</xsl:call-template>
									<xsl:attribute name="id"><xsl:value-of select="concat($finalReturnID, '[2]')"/></xsl:attribute>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/FutureFilingNotRequiredInd"/>
										<xsl:with-param name="BackupName">IRS1120FinalReturn</xsl:with-param>
									</xsl:call-template>
									<xsl:attribute name="for"><xsl:value-of select="concat($finalReturnID, '[2]')"/></xsl:attribute>
                Name change
                </label>
<!-- E 3 -->
<span style="width:4px"/>
<span class="styBoldText">(3)</span>
<span style="width:3px;"/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/AddressChangeInd"/>
										<xsl:with-param name="BackupName">IRS1120AddressChange</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/AddressChangeInd"/>
										<xsl:with-param name="BackupName">IRS1120AddressChange</xsl:with-param>
									</xsl:call-template>
                  Address change
          </label>
<!--E 4 -->
<span style="width:4px"/>
<span class="styBoldText">(4)</span>
<span style="width:3px;"/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/AmendedReturn"/>
										<xsl:with-param name="BackupName">IRS1120AmendedReturn</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/AmendedReturn"/>
										<xsl:with-param name="BackupName">IRS1120AmendedReturn</xsl:with-param>
									</xsl:call-template>
                Amended return  <span style="width:2px;height:1mm"/>
								</label>
</div>
</div>
<span style="padding-left:.5mm"/>
<input type="checkbox" class="styCkbox">
<xsl:call-template name="PopulateCheckbox">
<xsl:with-param name="TargetNode" select="  $Form1120PCData/Section953c3CElectionInd"/>
<xsl:with-param name="BackupName">IRS1120LElectionMadeUnderSection953C3C</xsl:with-param>
</xsl:call-template>
</input>
<label>
<xsl:call-template name="PopulateLabel">
<xsl:with-param name="TargetNode" select="  $Form1120PCData/Section953c3CElectionInd"/>
<xsl:with-param name="BackupName">IRS1120LElectionMadeUnderSection953C3C</xsl:with-param>
</xsl:call-template>
 953(c)(3)(C)
 </label>
<!--<span style="padding-left:2mm"/>-->
<span style="padding-left:1mm"/>
<input type="checkbox" class="styCkbox">
<xsl:call-template name="PopulateCheckbox">
<xsl:with-param name="TargetNode" select="  $Form1120PCData/Section953dElectionInd"/>
<xsl:with-param name="BackupName">IRS1120LElectionMadeUnderSection953D</xsl:with-param>
</xsl:call-template>
</input>
<label>
<xsl:call-template name="PopulateLabel">
<xsl:with-param name="TargetNode" select="  $Form1120PCData/Section953dElectionInd"/>
<xsl:with-param name="BackupName">IRS1120LElectionMadeUnderSection953D</xsl:with-param>
</xsl:call-template>953(d)
      </label>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$Form1120PCData/Section953dElectionInd"/>
						</xsl:call-template>
						<!--Pen and Ink 953D indicator-->
						<xsl:call-template name="LinkToLeftoverDataTableInline">
							<xsl:with-param name="Desc">Line D - Section 953D Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120PCData/Section953dElectionInd/@section953dCd"/>
						</xsl:call-template>
						<!--Pen and Ink 953D Amount -->
						<xsl:call-template name="LinkToLeftoverDataTableInline">
							<xsl:with-param name="Desc">Line D - Section 953D Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120PCData/Section953dElectionInd/@section953dAmt"/>
						</xsl:call-template>
</div>

					<!--close what line ? -->
					

					<!--BEGIN Main Form Tax Computation and Payments Section-->
					<div class="styBB" style="width:187mm;border-bottom:2px solid black;">
						<div class="styIRS1120PCVTImageBox" style="height:151mm;padding-top:14mm;">
							<div style="width:2mm;height:35mm;"/>
							<img src="{$ImagePath}/1120PC_TaxComputation.gif" alt="Tax Computation and Payments section" style="width:4.8mm;"/>
						</div>

						<!--line 1 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div class="styLNLeftNumBoxSD">1</div>
							<div class="styLNDesc" style="width:133mm;">
								<span style="float:left;">Taxable income (Schedule A, line 37)</span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">....................</div>
							</div>
							<div class="styLNRightNumBox">1</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/TaxableIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line 2 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">2</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left;">Taxable investment income for electing small companies (Schedule B, line 21)</span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">.......</div>
							</div>
							<div style="width:40mm;float:left;clear:none">
								<div class="styLNRightNumBox" style="height:4.5mm;">2</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/TaxableInvestmentIncomeAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- line3 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm;">3</div>
								<div class="styLNDesc" style="width:132mm;height:4mm;">
                                  <span style="float:left">Check if a member of a controlled group (attach Schedule O (Form 1120))
                                        <!--Need to add a pushpin here for Schedule O -->
									<!-- Form to Form Link (Push Pin)-->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/MemberOfControlledGroupInd"/>
									</xsl:call-template></span>
									<!--Dotted Line-->
				<div class="styDotLn" style="float:right;padding-right:1mm;">.....</div><span style="width:2mm" />
              <img src="{$ImagePath}/1120_Bullet_Md.gif" alt="MediumBullet"/>
									
									<span style="width:3.5mm;"/>
									<input type="checkbox" alt="alt" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form1120PCData/MemberOfControlledGroupInd"/>
											<xsl:with-param name="BackupName">IRS1120PCMemberOfControlledGroup</xsl:with-param>
										</xsl:call-template>
									</input>
								
								</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
								<div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
							</div>
						</div>
						<!-- line 4 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">4</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">Income tax</span>
								<!-- Form to Form Link (Push Pin plus pen and inks) -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IncomeTaxAmt"/>
								</xsl:call-template>
								<span style="width:1mm;"/>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 4 - Section 1291 Indicator</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IncomeTaxAmt/@section1291Cd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 4 - Section 1291 Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IncomeTaxAmt/@section1291Amt"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 4 - Section 197 Indicator</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IncomeTaxAmt/@section197Cd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 4 - Section 197 Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IncomeTaxAmt/@section197Amt"/>
								</xsl:call-template>
								<div class="styDotLn" style="float:right;padding-right:1mm;">........................</div>
							</div>
							<div style="width:40mm;float:left;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">4</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IncomeTaxAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- line 5 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">5</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left;">Enter amount of tax that a reciprocal must include
                                    <!-- Form to Form Link (Push Pin)-->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/TaxReciprocalMustIncludeAmt"/>
									</xsl:call-template>
								</span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">...............</div>
							</div>
							<div style="width:40mm;float:left;clear:none">
								<div class="styLNRightNumBox" style="height:4.5mm;">5</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/TaxReciprocalMustIncludeAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- line 6 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">6</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left;"> Alternative minimum tax (attach Form 4626)
                                    <!-- Form to Form Link (Push Pin)-->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/AlternativeMinimumTaxAmt"/>
									</xsl:call-template>
								</span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">.................</div>
							</div>
							<div style="width:40mm;float:left;clear:none">
								<div class="styLNRightNumBox" style="height:4.5mm;">6</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/AlternativeMinimumTaxAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- line 7 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm;">7</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left"> Add lines 4 through 6</span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">.........................</div>
							</div>
							<div style="width:40mm;float:right;clear;none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">7</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IncomeTxPlusAltMinimumTaxAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- line 8a -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none;">
								<div class="styLNLeftLtrBox" style="height:4mm;padding-left: 2.25mm;">8a</div>
								<div class="styLNDesc" style="width:93mm;height:4mm;">
									<span style="float:left"> Foreign tax credit (attach Form 1118)
                                           <!-- Form to Form Link (Push Pin) -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120PCData/ForeignTaxCreditAmt"/>
										</xsl:call-template>
									</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">.........</div>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;">8a</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/ForeignTaxCreditAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="width:40mm;float:left;clear:none;">
								<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"/>
								<div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
							</div>
						</div>
						<!-- line 8b -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none;">
								<div class="styLNLeftLtrBox" style="height:4mm;padding-left: 4.25mm;"> b</div>
								<div class="styLNDesc" style="width:93mm;height:4mm;">
									<span style="float:left">Credit from Form 8834 (attach Form 8834)
                                                          <!-- Form to Form Link (Push Pin) -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120PCData/QlfyElecMotorVehCrAmt"/>
										</xsl:call-template>
									</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">....</div>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;">8b</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/QlfyElecMotorVehCrAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.50mm;"/>
								<div class="styLNAmountBoxNBB" style="height:4.50mm;"/>
							</div>
						</div>
						<!-- line 8c -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none;">
								<div class="styLNLeftLtrBox" style="height:4mm;padding-left: 4.25mm;"> c</div>
								<div class="styLNDesc" style="width:93mm;height:4mm;">
									<span style="float:left">General business credit (attach Form 3800)
                                                        <!-- Form to Form Link (Push Pin) -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120PCData/CYGenBusinessCreditAllowedAmt"/>
										</xsl:call-template>
									</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">......</div>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;">8c</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/CYGenBusinessCreditAllowedAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.50mm;"/>
								<div class="styLNAmountBoxNBB" style="height:4.50mm;"/>
							</div>
						</div>
						<!-- line 8d -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none">
								<div class="styLNLeftLtrBox" style="height:4mm;padding-left: 4.25mm;">d</div>
								<div class="styLNDesc" style="width:93mm;height:4mm;">
									<span style="float:left"> Credit for prior year minimum tax (attach Form 8827)
                                           <!-- Form to Form Link (Push Pin) -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120PCData/PriorYearMinimumTaxCreditAmt"/>
										</xsl:call-template>
									</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">....</div>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;">8d</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/PriorYearMinimumTaxCreditAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"/>
							<div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
						</div>
						<!-- line 8e -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none;">
								<div class="styLNLeftLtrBox" style="height:4mm;padding-left: 4.25mm;">e</div>
								<div class="styLNDesc" style="width:93mm;height:4mm;">
									<span style="float:left;">Bond credits from Form 8912
            
									<!-- Form to Form Link (Push Pin) -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120PCData/CurrentYearAllowableCreditAmt"/>
										</xsl:call-template>
									</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">............</div>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;">8e</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/CurrentYearAllowableCreditAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="width:40mm;float:left;clear:none;">
								<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"/>
								<div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
							</div>
						</div>
						<!-- line 8f -->
						<div class="styGenericDiv" style="width:181mm;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 4.25mm">f</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">
									<b>Total credits.</b> Add lines 8a through 8e</span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">....................</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">8f</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/TotalCreditAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- line 9 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.5mm;">9</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">Subtract line 8f from line 7</span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">........................</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">9</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/TaxLessCreditsAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- line 10 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">10</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left;">Foreign corporations?Tax on income not connected with U.S. business 
                                              <!-- Form to Form Link (Push Pin)-->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/ForeignCorporationTaxOnIncmAmt"/>
									</xsl:call-template>
								</span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">.........</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">10</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/ForeignCorporationTaxOnIncmAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- line 11 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">11</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left;">Personal holding company tax (attach Schedule PH (Form 1120))
                                           <!-- Form to Form Link (Push Pin)-->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/PersonalHoldingCompanyTaxAmt"/>
									</xsl:call-template>
								</span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">..........</div>
							</div>
							<div style="width:40mm;float:right;clear:none">
								<div class="styLNRightNumBox" style="height:4.5mm;">11</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/PersonalHoldingCompanyTaxAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- line 12 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;">12</div>
								<div class="styLNDesc" style="width:132mm;height:4mm;">
                                     Other taxes. Check if from:
                                     <span style="width:2mm;"/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form1120PCData/Form4255Ind"/>
											<xsl:with-param name="BackupName">IRS1120PCTaxFromForm4255</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form1120PCData/Form4255Ind"/>
											<xsl:with-param name="BackupName">IRS1120PCTaxFromForm4255</xsl:with-param>
										</xsl:call-template>
             Form 4255
          </label>
									<!-- Form to Form Link (Push Pin) -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/Form4255Ind"/>
									</xsl:call-template>
									<span style="width:2mm;"/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form1120PCData/Form8611Ind"/>
											<xsl:with-param name="BackupName">IRS1120PCTaxFromForm8611</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form1120PCData/Form8611Ind"/>
											<xsl:with-param name="BackupName">IRS1120PCTaxFromForm8611</xsl:with-param>
										</xsl:call-template>
             Form 8611
          </label>
									<!-- Form to Form Link (Push Pin) -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/Form8611Ind"/>
									</xsl:call-template>
									<span style="width:2mm;"/>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form1120PCData/OtherInd"/>
											<xsl:with-param name="BackupName">IRS1120PCOtherTaxes</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form1120PCData/OtherInd"/>
											<xsl:with-param name="BackupName">IRS1120PCOtherTaxes</xsl:with-param>
										</xsl:call-template>
             Other (attach statement)
          </label>
									<!-- Form to Form Link (Push Pin) -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/OtherInd"/>
									</xsl:call-template>
				
								</div>
							</div>
							<div style="width:40mm;float:right;clear:none">
								<div class="styLNRightNumBox" style="height:4.5mm;">12</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/OtherTaxesAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- line 13 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">13</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">
									<b>Total tax.</b> Add lines 9 through 12
          <!-- Form to Form Link (Push Pin)-->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/TotalTaxAmt"/>
									</xsl:call-template>
								</span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">....................</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">13</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/TotalTaxAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- line 14a -->
							<!-- line 14a -->
						<div style="width:181mm;">
							<div style="float:left;clear:none">
								<div class="styLNLeftNumBox" style="height:4mm;">14a</div>
								<div class="styLNDesc" style="width:53.5mm;height:4mm;">
       	  2012 overpayment credited to 2013
      	</div>
								<div class="styLNRightNumBox" style="height:4.5mm;">14a</div>
								<div class="styLNAmountBox" style="height:4.5mm;width:32mm;border-right-width:1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/PriorYearOverpaymentCreditAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styShadingCell" style="width:39.5mm;height:4.5mm;border-left-width:0px;"/>
								<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"/>
								<div class="styLNAmountBoxNBB" style="height:4.5mm;width:32mm;"/>
							</div>
						</div>
						<!-- line 14b -->
						<div style="width:181mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftLtrBox" style="height:8.5mm;padding-left: 4.25mm;">b</div>
								<div class="styLNDesc" style="width:53.5mm;height:8.5mm;font-size:7pt;">
        	  Prior year(s) special estimated tax payments to be applied
        	  <!-- Form to Form Link (Push Pin)-->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/PriorYearEstimatedTaxPymtAmt"/>
									</xsl:call-template>
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:16px"/>.
		          <span style="width:16px"/>.
		          <span style="width:16px"/>.
        		</span>
								</div>
								<div class="styLNRightNumBox" style="height:8.5mm;padding-top:4.5mm;">14b</div>
								<div class="styLNAmountBox" style="height:8.5mm;border-right-width:1px;padding-top:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/PriorYearEstimatedTaxPymtAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styShadingCell" style="width:39.5mm;height:8.5mm;border-left-width:0px;"/>
								<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8.5mm;"/>
								<div class="styLNAmountBoxNBB" style="height:8.5mm;width:32mm;"/>
							</div>
						</div>
						<!-- line 14c -->
						<div style="width:181mm;">
							<div style="float:left; clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;padding-left: 4.25mm;">c</div>
								<div class="styLNDesc" style="width:53.5mm;height:4mm;font-size:6pt;"> 2013 estimated tax payments (see instructions)</div>
								<div class="styLNRightNumBox" style="height:4.5mm;">14c</div>
								<div class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/EstimatedTaxPaymentsAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styShadingCell" style="width:39.5mm;height:4.5mm;border-left-width:0px;"/>
								<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"/>
								<div class="styLNAmountBoxNBB" style="height:4.5mm;width:32mm;"/>
							</div>
						</div>
						<!-- line 14d -->
						<div style="width:181mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftLtrBox" style="height:4mm;padding-left: 4.25mm;">d</div>
								<div class="styLNDesc" style="width:91.5mm;height:4mm;">
								<span style="float:left"> 2013 special estimated tax payments (Do not include on line 14f)</span>
								 </div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;width:8.5mm;">14d</div>
								<div class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/SpecialEstimatedTaxPaymentsAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"/>
								<div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;"/>
								<!--<div style="float:right;clear:none;">
								<div class="styShadingCell" style="width:39.5mm;height:8.5mm;border-left-width:0px;"/>
								<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8.5mm;"/>
								<div class="styLNAmountBoxNBB" style="height:8.5mm;width:32.5mm;"/>
							</div>-->
							</div>
						</div>
						<!-- line 14e -->
						<div style="width:181mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;padding-left: 4.25mm;">e</div>
								<div class="styLNDesc" style="width:53.5mm;height:4mm;font-size:6pt;">2013 refund applied for on Form 4466
								   	  <!-- Form to Form Link (Push Pin) -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/OverpaymentOfEstimatedTaxAmt"/>
									</xsl:call-template>
									<!--Dotted Line-->
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;">14e</div>
								<div class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;">
									<xsl:call-template name="PopulateNegativeNumber">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/OverpaymentOfEstimatedTaxAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styShadingCell" style="width:39.5mm;height:4.5mm;border-left-width:0px;"/>
								<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"/>
								<div class="styLNAmountBoxNBB" style="height:4.5mm;width:32mm;"/>
							</div>
						</div>
						<!-- line 14f -->
					<div style="width:181mm;">
						
								<div class="styLNLeftLtrBox" style="height:4mm;padding-left: 4.25mm;">f</div>
								<div class="styLNDesc" style="width:92.5mm;height:4mm;">
                                                 <span style="float:left">Enter the total of lines 14a through 14c less line 14e</span>
                                                  <!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">......</div>
								
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;width:8.5mm;">14f</div>
								<div class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/TotOvpmtCrAndEstTxPaymentsAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"/>
								<div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;"/>
							</div>
						</div>
						<!-- line 14g -->
						<div style="width:181mm;">
							
								<div class="styLNLeftLtrBox" style="height:4mm;padding-left: 4.25mm;">g</div>
								<div class="styLNDesc" style="width:92.5mm;height:4mm;">
                                    <span style="float:left">Tax deposited with Form 7004</span>                
                                                  <!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">.............</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;width:8.5mm;">14g</div>
								<div class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/TaxPaidForm7004Amt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"/>
								<div class="styLNAmountBoxNBB" style="height:4.5mm;width:32mm;"/>
							</div>
						</div>
						<!-- line 14h -->
						<div style="width:181mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftLtrBox" style="height:4mm;padding-left: 4.25mm;">h</div>
								<div class="styLNDesc" style="width:91.5mm;height:4mm;font-size:6pt;">
         	  Credit by reciprocal for tax paid by attorney-in-fact under section 835(d)
      	</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;width:8.5mm;">14h</div>
								<div class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/ReciprocalTaxPaidSect835dAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"/>
								<div class="styLNAmountBoxNBB" style="height:4.5mm;width:32mm;"/>
							</div>
						</div>
						<!-- line 14i  -->
						<div style="width:181mm;">
							<div class="styLNLeftLtrBox" style="height:4mm;padding-left: 4.25mm;">i</div>
								<div class="styLNDesc" style="width:92.5mm;height:4mm;">
                            <span style="float:left">   Other credits and payments
                  <!-- Form to Form Link (Push Pin) -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/OtherCreditsPaymentsAmt"/>
									</xsl:call-template>
									<span style="width:1mm;"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 14i - Backup Withholding Indicator</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1120PCData/OtherCreditsPaymentsAmt/@backupWithholdingTypeCd"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 14i - Backup Withholding Amount</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1120PCData/OtherCreditsPaymentsAmt/@backupWithholdingAmt"/>
									</xsl:call-template></span>
									<!--Dotted Line-->
						<div class="styDotLn" style="float:right;padding-right:1mm;">..........</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;width:8.5mm;">14i</div>
								<div class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/OtherCreditsPaymentsAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"/>
								<div class="styLNAmountBoxNBB" style="height:4.5mm;width:32mm;"/>
							</div>
						</div>
						<!-- line 14j  -->
						<div style="width:181mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftLtrBox" style="height:4mm;padding-left: 4.25mm;">j</div>
								<div class="styLNDesc" style="width:92.5mm;height:4mm;">
         	                                         <span style="float:left"> Refundable credit Form 8827, line 8c
         	                                          <!-- Form to Form Link (Push Pin) -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/RefundableCreditsAmt"/>
									</xsl:call-template></span>
									
									
									<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">.........</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:5.5mm;width:8.5mm;padding-top:2.0mm;">14j</div>
								<div class="styLNAmountBox" style="height:5.5mm;width:31.5mm;padding-top:2.0mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/RefundableCreditsAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBox" style="height:5.5mm;padding-top:2.0mm;width:8mm;">14k</div>
								<div class="styLNAmountBox" style="height:5.5mm;padding-top:2.0mm;width:32mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/TotalPaymentsAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- line15 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;">15</div>
								<div class="styLNDesc" style="width:132mm;height:4mm;">
                                                        Estimated tax penalty (see instructions). Check if Form 2220 is attached
                                                        <!-- Form to Form Link (Push Pin)-->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/Form2220AttachedInd"/>
									</xsl:call-template>
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:16px"/>.
                                                            <span style="width:16px"/>.
                                                <span style="width:16px"/>.
                                                            <img src="{$ImagePath}/1120_Bullet_Md.gif" alt="MediumBullet"/>
									</span>
									<span style="width:3.5mm;"/>
									<input type="checkbox" alt="alt" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form1120PCData/Form2220AttachedInd"/>
											<xsl:with-param name="BackupName">IRS1120Form2220Attached</xsl:with-param>
										</xsl:call-template>
									</input>
									<!--<label style="float: right; clear: none;">
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form1120PCData/Form2220Attached" />
											<xsl:with-param name="BackupName">IRS1120Form2220Attached</xsl:with-param>
										</xsl:call-template>
									 </label>-->
								</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">15</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/EsPenaltyAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- line16 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">16</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">
									<b>Amount owed.</b> If line 14k is smaller than the total of lines 13 and 15, enter amount owed</span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">....</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">16</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/BalanceDueAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- line17 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">17</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">
									<b>Overpayment.</b> If line 14k is larger than the total of lines 13 and 15, enter amount overpaid</span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">...</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">17</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/OverpaymentSection/OverpaymentAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- line 18 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none">
								<div class="styLNLeftNumBox" style="height:4mm;">18</div>
								<div class="styLNDesc" style="width:86mm;height:4mm;">
									<span style="font-size:6pt;">
                                                    Enter amount from line 17: 
                    <!-- Form to Form Link -->
									</span>
									<span class="styBoldText">Credited to 2014 estimated tax</span>
									<span style="width:2px"/>
									<!-- Form to Form Link -->
									<!--   <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/Form2220Attached"/>
									</xsl:call-template>    -->
									<!--/span-->
									<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
								</div>
								<div class="styGenericDiv" style="width:28mm;height:4mm;font-size:6pt; padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/OverpaymentSection/AppliedToEsTaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="width:18mm;height:4mm;font-size:6pt;">
									<span class="styBoldText">Refunded</span>
									<!-- Form to Form Link Push Pin-->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/OverpaymentSection/RefundAmt"/>
									</xsl:call-template>
									<span style="width:4px"/>
									<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
								</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBoxNBB" style="height:7mm;">18</div>
								<div class="styLNAmountBoxNBB" style="height:7mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/OverpaymentSection/RefundAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!--END of Tax Computation and Payments Section-->
					<br class="pageEnd" style="float:none;"/>
					<!-- BEGIN Signature Section -->
					<!-- Implementing the signature section as a table -->
					<table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:6pt;float:none;">
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
							<td style="border-bottom:1px solid black;vertical-align:top;">Signature of officer      </td>
							<td style="border-bottom:1px solid black;vertical-align:top;">Date</td>
							<td style="border-bottom:1px solid black;vertical-align:top;">Title</td>
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
								<div class="styLNDesc" style="height:7.5mm;width:46.8mm;padding-top:0mm;border-right:1px solid black;border-left:1px solid black;padding-left:1mm;">
								  Print/Type preparer's name<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PreparerPersonGrp/BusinessName"/>
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
								<div class="styLNDesc" style="height:7.5mm;width:18mm;border-right:1px solid black;padding-top:0mm;padding-bottom:0mm;padding-left:1mm;">
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
										<span style="width:4px;"/>if<br/>self-employed
									</label>
								</div>
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
									<!--<xsl:if test="$RtnHdrData/PreparerPersonGrp/STIN">
										<xsl:call-template name="PopulateReturnHeaderPreparer">
											<xsl:with-param name="TargetNode">STIN</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpSTIN</xsl:with-param>
										</xsl:call-template>
									</xsl:if>-->
								</div>
							</div>
							<div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
								<div class="styLNDesc" style="height:6mm;width:126.5mm;border-right:1px solid black;border-left:1px solid black;padding-left:1mm;">
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
									<xsl:if test="$RtnHdrData/PreparerFirmGrp/AppliedForEINReasonCd">
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">MissingEINReason</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpMissingEINReasonCd</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
							<div style="width:164mm;float:left;clear:none;">
								<div class="styLNDesc" style="width:126.5mm;border-right:1px solid black;border-left:1px solid black;padding-left:1mm;height:auto;">
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
					<!-- Page 1 Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;float:none;">
						<div style="float:left;">
							<span class="styBoldText">For Paperwork Reduction Act Notice, see separate instructions.</span>
							<span style="width:13mm;"/>                        
       Cat. No. 64270Q 
    </div>
						<div style="float:right;">
							<span style="width:40px;"/>  
        Form <span class="styBoldText" style="font-size:8pt;">1120-PC</span> (2013)
    </div>
					</div>
					<!-- END Page 1 Break and Footer-->
					<!--Begin Page 2 -->
					<!-- Page 2 Header -->
					<div class="styBB" style="width:187mm;padding-top:.5mm;float:none;">
						<div style="float:left;">Form 1120-PC (2013)<span style="width:146mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
						</div>
					</div>
					<!-- END Page 2 Header -->
					<!-- BEGIN Schedule A Title -->
					<div class="styBB" style="width:187mm;border-top:1px solid black;">
						<div class="styPartName" style="width:23mm;">Schedule A</div>
						<div class="styPartDesc" style="width:164mm;">Taxable Income&#8212;Section 832  
      <span class="styNormalText">(see instructions)</span>
						</div>
					</div>
					<!-- END Schedule A Title -->
					<!--BEGIN Main Form Income Section-->
					<div class="styBB" style="width:187mm;float:none;clear:none;">
						<span class="styIRS1120PCVTImageBox" style="width:6mm;height:97mm;text-align:center;padding-top:38mm;">
							<img src="{$ImagePath}/1120PC_Income.gif" alt="Income section" valign="center" height="40mm;"/>
						</span>					
						<!--Sch A line 1 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox" style="padding-left: 2.25mm">1</div>
								<div class="styLNDesc" style="width:133mm;">
									<span style="float:left">Premiums earned (Schedule E, line 7)</span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">....................</span>
								</div>
							</div>
							<div style="float:right;clear:none">
								<div class="styLNRightNumBox" style="height:4.5mm;">1</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/PremiumsEarnedAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch A line 2 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox" style="padding-left: 2.25mm">2</div>
								<div class="styLNDesc" style="width:133mm;">
									<span style="float:left">Dividends (Schedule C, line 14)</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">.....................</div>
								</div>
							</div>
							<div style="float:right;clear:none">
								<div class="styLNRightNumBox" style="height:4.5mm;">2</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/TotalDividendAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch A line a and b  -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:8mm;padding-left: 2.25mm"/>
								<div class="styLNDesc" style="width:68mm;height:8mm;"/>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNAmountBox" style="width:32mm;height:8.5mm;border-top:1px solid black;text-align:center;padding-top:2mm;">
									<b>(a)</b> Interest received </div>
								<div class="styLNAmountBox" style="width:32mm;height:8.5mm;border-top:1px solid black;text-align:center;">
									<b>(b)</b> Amortization of premium </div>
								<div class="styLNRightNumBoxNBB" style="height:8.5mm;background-color:lightgrey;"/>
								<div class="styLNAmountBoxNBB" style="height:8.5mm;background-color:lightgrey;border-left-width: 0px;"/>
							</div>
						</div>
						<!--Sch A line 3a  -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:8mm;padding-left: 2.25mm;padding-top:4mm;">3a</div>
								<div class="styLNDesc" style="width:68mm;height:8mm;padding-top:4mm;">
									<span style="float:left">Gross interest</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">............</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNAmountBox" style="width:32mm;height:8.5mm;text-align:right;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/GrossInterestReceivedAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="width:32mm;height:8.5mm;text-align:right;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/GrossInterestAmortzPremAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:8.5mm;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="height:8.5mm;background-color:lightgrey;border-left-width: 0px;"/>
						</div>
					</div>
					<!--Sch A line 3b  -->
					<div class="styGenericDiv" style="width:181mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox" style="height:8mm;padding-left: 4.25mm;padding-top:4mm;">b</div>
							<div class="styLNDesc" style="width:68mm;height:8mm;padding-top:4mm;">
								<span style="float:left">Interest exempt under section 103</span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">.....</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNAmountBox" style="width:32mm;height:8.5mm;text-align:right;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/IntExemptUnderSect103RcvdAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="width:32mm;height:8.5mm;text-align:right;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/IntExemptUnderSect103AmortzAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:8.5mm;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="height:8.5mm;background-color:lightgrey;border-left-width: 0px;"/>
						</div>
						</div>
						<!--Sch A line 3c  -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:8mm;padding-left: 4.25mm;padding-top:4mm;">c</div>
								<div class="styLNDesc" style="width:68mm;height:8mm;padding-top:4mm;">
									<span style="float:left">Subtract line 3b from line 3a</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">.......</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNAmountBox" style="height:8.5mm;text-align:right;padding-top:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/GroIntRcvdLessIntExmptRcvdAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:8.5mm;text-align:right;padding-top:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/GrossIntAmortzLessIntExmptAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBox" style="height:8.5mm;background-color:lightgrey;"/>
								<div class="styLNAmountBox" style="height:8.5mm;background-color:lightgrey;border-left-width: 0px;"/>
							</div>
						</div>
						<!--Sch A line 3d -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox" style="padding-left: 4.25mm">d</div>
								<div class="styLNDesc" style="width:133mm;">
									<span style="float:left">Taxable interest. Subtract line 3c, column (b) from line 3c, column (a)</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">..........</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">3d</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/TaxableInterestAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch A line 4 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox" style="padding-left: 2.25mm">4</div>
								<div class="styLNDesc" style="width:133mm;">
									<span style="float:left">Gross rents</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">............................</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">4</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/GrossRentsAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch A line 5 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox" style="padding-left: 2.25mm">5</div>
								<div class="styLNDesc" style="width:133mm;">
									<span style="float:left">Gross royalties</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">..........................</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">5</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/GrossRoyaltiesAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch A line 6 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox" style="padding-left: 2.25mm">6</div>
								<div class="styLNDesc" style="width:133mm;">
									<span style="float:left">Capital gain net income (attach Schedule D (Form 1120))
									<!-- Form to Form Link (Push Pin)-->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/CapitalGainNetIncomeAmt"/>
										</xsl:call-template>
									</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">.............</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">6</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/CapitalGainNetIncomeAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch A line 7 -->
						<div class="styGenericDiv" tyle="width:181mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox" style="padding-left: 2.25mm">7</div>
								<div class="styLNDesc" style="width:133mm;">
									<span style="float:left">Net gain or (loss) from Form 4797, Part II, line 17 (attach Form 4797)
									<!-- Form to Form Link (Push Pin)-->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/TotalOrdinaryGainLossAmt"/>
										</xsl:call-template>
									</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">........</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">7</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/TotalOrdinaryGainLossAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch A line 8 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox" style="padding-left: 2.25mm">8</div>
								<div class="styLNDesc" style="width:133mm;">
									<span style="float:left"> Certain mutual fire or flood insurance company premiums (section 832(b)(1)(D))</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">......</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">8</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/FireOrFloodInsuranceCoPremAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch A line 9 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox" style="padding-left: 2.25mm">9</div>
								<div class="styLNDesc" style="width:133mm;">
									<span style="float:left">Income on account of special income and deduction accounts</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">.............</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">9</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/SpecialIncmAndDedAcctIncmAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch A line 10 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox">10</div>
								<div class="styLNDesc" style="width:133mm;">
									<span style="float:left">Income from protection against loss account (see instructions)
									  <!-- Form to Form Link (Push Pin)-->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/ProtectionAgainstLossIncmAmt"/>
										</xsl:call-template>
									</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">..........</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">10</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/ProtectionAgainstLossIncmAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch A line 11 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox">11</div>
								<div class="styLNDesc" style="width:133mm;">
									<span style="float:left">Mutual interinsurers or reciprocal underwriters&#8212;decrease in subscriber accounts</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">.. ....</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">11</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/MutualRcprclUnderwriterDecrAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch A line 12 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox">12</div>
								<div class="styLNDesc" style="width:133mm;">
									<span style="float:left">Income from a special loss discount account (attach Form 8816)
									  <!-- Form to Form Link (Push Pin)-->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/SpecialLossDscntAcctIncomeAmt"/>
										</xsl:call-template>
									</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">.........</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">12</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/SpecialLossDscntAcctIncomeAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch A line 13 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox">13</div>
								<div class="styLNDesc" style="width:133mm;">
									<span style="float:left">Other income (attach statement)
									 <!-- Form to Form Link (Push Pin)-->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/OtherIncomeAmt"/>
										</xsl:call-template>
										<span style="width:1mm;"/>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Schedule A Line 13 - Other Income Item</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/OtherIncomeAmt/@otherIncomeDesc"/>
										</xsl:call-template>
									</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">...................</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">13</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/OtherIncomeAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch A line 14 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox">14</div>
								<div class="styLNDesc" style="width:133mm;">
									<span style="float:left">Gross income. Add lines 1 through 13</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">.....................</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBoxNBB" style="height:4.5mm;">14</div>
								<div class="styLNAmountBoxNBB" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/GrossIncomeAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!--END Schedule A Income Section-->
					<!--BEGIN Schedule A Deduction Section-->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS1120PCVTImageBox" style="width:6mm;height:129.5mm;padding-top:13mm;">
							<img src="{$ImagePath}/1120PC_Deductions_limitations.gif" alt="Deductions section (See instructions for limitations on deductions)"/>
						</div>
						<!--Sch A line 15 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;">15</div>
								<div class="styLNDesc" style="width:133mm;height:4mm;">
									<span style="float:left">Compensation of officers (attach statement) (see instructions)
                                              <!-- Form to Form Link (Push Pin)-->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/OfficersCompensationAmt"/>
										</xsl:call-template>
									</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">...........</div>
								</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">15</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/OfficersCompensationAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch A line 16 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;">16</div>
								<div class="styLNDesc" style="width:133mm;height:4mm;">
									<span style="float:left">Salaries and wages (less employment credits)</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">..................</div>
								</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">16</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/SalariesAndWagesAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch A line 17 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;">17</div>
								<div class="styLNDesc" style="width:133mm;height:4mm;">
									<span style="float:left"> Agency balances and bills receivable that became worthless during the tax year</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">.......</div>
								</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">17</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/AgencyBalancesAndBillsRcvblAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch A line 18 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;">18</div>
								<div class="styLNDesc" style="width:133mm;height:4mm;">
									<span style="float:left"> Rents
      	 <!-- Form to Form Link (Push Pin)-->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/TotalRentOrLeaseExpenseAmt"/>
										</xsl:call-template>
									</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">.............................</div>
								</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">18</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/TotalRentOrLeaseExpenseAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch A line 19 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;">19</div>
								<div class="styLNDesc" style="width:133mm;height:4mm;">
									<span style="float:left">Taxes and licenses</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">..........................</div>
								</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">19</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/TaxesAndLicensesAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- Schedule A line 20  -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;">20a</div>
								<div class="styLNDesc" style="width:20mm;height:4mm;">Interest
        <!-- Form to Form Link (Push Pin)-->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/InterestDeductionAmt"/>
									</xsl:call-template>
									<span style="width:2mm;"/>
									<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
								</div>
								<div class="styLNAmountBox" style="width:24mm;height:4.5mm;border-top-width:0px; border-bottom-width:1px;border-left-width:0px; border-right-width: 0px;font-size:6pt;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/InterestDeductionAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.5mm;width:4mm">b</div>
								<div class="styLNDesc" style="width:44mm;height:4mm;padding-left:2.5mm;"> Less tax-exempt interest exp.</div>
								<div class="styLNAmountBox" style="width:26mm;height:4.5mm;border-top-width:0px; border-bottom-width:1px;border-left-width:0px; border-right-width: 0px;font-size:6pt;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/TaxExemptInterestExpenseAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm;width:14.2mm;font-weight:bold;">c 
            <span style="font-weight:normal">Bal.</span>
									<span style="padding-left:1mm"/>
									<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">20c</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/InterestBalanceAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch A line 21 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;">21</div>
								<div class="styLNDesc" style="width:133mm;height:4mm;">
									<span style="float:left"> Charitable contributions
         <!-- Form to Form Link (Push Pin)-->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/CharitableContributionsTotAmt"/>
										</xsl:call-template>
									</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">.......................</div>
								</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">21</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/CharitableContributionsTotAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch A line 22 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;">22</div>
								<div class="styLNDesc" style="width:133mm;height:4mm;">
									<span style="float:left">Depreciation (attach Form 4562)
                                                    <!-- Form to Form Link (Push Pin)-->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/DepreciationAmt"/>
										</xsl:call-template>
									</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">.....................</div>
								</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">22</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/DepreciationAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch A line 23 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;">23</div>
								<div class="styLNDesc" style="width:133mm;height:4mm;">
									<span style="float:left">Depletion
          <!-- Form to Form Link (Push Pin)-->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/DepletionAmt"/>
										</xsl:call-template>
									</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">...........................</div>
								</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">23</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/DepletionAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch A line 24 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;">24</div>
								<div class="styLNDesc" style="width:133mm;height:4mm;">
									<span style="float:left"> Pension, profit-sharing, etc., plans</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">.....................</div>
								</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">24</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/PensionProfitSharingPlansAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch A line 25 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;">25</div>
								<div class="styLNDesc" style="width:133mm;height:4mm;">
									<span style="float:left">Employee benefit programs</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">.......................</div>
								</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">25</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/EmployeeBenefitProgramAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch A line 26 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;">26</div>
								<div class="styLNDesc" style="width:133mm;height:4mm;">
									<span style="float:left">Losses incurred (Schedule F, line 14)</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">.....................</div>
								</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">26</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/LossesIncurdDedUndSect832c4Amt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch A line 27 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;">27</div>
								<div class="styLNDesc" style="width:133mm;height:4mm;">
									<span style="float:left">Additional deduction (attach Form 8816)
                                                  <!-- Form to Form Link (Push Pin)-->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/SpecialLossDscntAcctDedAmt"/>
										</xsl:call-template>
									</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">..................</div>
								</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">27</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/SpecialLossDscntAcctDedAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch A line 28 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;">28</div>
								<div class="styLNDesc" style="width:133mm;height:4mm;">
									<span style="float:left">Other capital losses (Schedule G, line 12, column (g))</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">...............</div>
								</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">28</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/TotalLossAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch A line 29 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;">29</div>
								<div class="styLNDesc" style="width:133mm;height:4mm;">
									<span style="float:left">Dividends to policyholders</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">........................</div>
								</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">29</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/PolicyholderDividendDistriAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch A line 30 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;">30</div>
								<div class="styLNDesc" style="width:133mm;height:4mm;">
									<span style="float:left"> Mutual interinsurers or reciprocal underwriters—increase in subscriber accounts</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">.......</div>
								</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">30</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/MutualRcprclUnderwriterIncrAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch A line 31 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;">31</div>
								<div class="styLNDesc" style="width:133mm;height:4mm;">
									<span style="float:left">  Other deductions (see instructions) (attach statement)
          <!-- Form to Form Link (Push Pin)-->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/OtherDeductionsAmt"/>
										</xsl:call-template>
									</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">..............</div>
								</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">31</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/OtherDeductionsAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch A line 32 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;">32</div>
								<div class="styLNDesc" style="width:133mm;height:4mm;">
									<span style="float:left">Total deductions. Add lines 15 through 31
                                            <!-- Form to Form Link (Push Pin)-->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/TotalDeductionAmt"/>
										</xsl:call-template>
									</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">..................</div>
								</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">32</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/TotalDeductionAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch A line 33 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;">33</div>
								<div class="styLNDesc" style="width:133mm;height:4mm;">
									<span style="float:left"><b>Subtotal.</b> Subtract line 32 from line 14</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">....................</div>
								</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">33</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/DeductionsSubtotalAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch A line 34a line 1 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;">34a</div>
								<div class="styLNDesc" style="height:4mm;width:133mm;">Special deduction for section 833 organizations (Schedule H,</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
								<div class="styLNAmountBoxNBB" style="height:4.5mm;background-color:lightgrey;border-left-width:0px;"/>
							</div>
						</div>
						<!-- Schedule A line 34a line2 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;padding-left: 4.25mm;"/>
								<div class="styLNDesc" style="width:93mm;height:4mm;">
									<span style="float:left">  line 6)</span>
									<!--Dotted Line-->
									<div class="styDotLn" style="float:right;padding-right:1mm;">....................</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">34a</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/SpecialDeductionSect833OrgAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"/>
								<div class="styLNAmountBoxNBB" style="background-color:lightgrey;height:4.5mm;border-left-width:0px;"/>
							</div>
						</div>
						<!-- Schedule A line 34b -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;padding-left: 4.25mm;">b</div>
								<div class="styLNDesc" style="width:93mm;height:4mm;">
                                 <span style="float:left">Deduction on account of special income and deduction accounts</span>
                                                 <!--Dotted Line-->
							<div class="styDotLn" style="float:right;padding-right:1mm;">..</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">34b</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/SpecialIncmAndDedAcctDedAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBox" style="background-color:lightgrey;height:4.5mm;"/>
								<div class="styLNAmountBox" style="background-color:lightgrey;height:4.5mm;border-left-width:0px;"/>
							</div>
						</div>
						<!--Sch A line 34c -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;padding-left: 4.25mm">c</div>
								<div class="styLNDesc" style="width:133mm;height:4mm;">
                                   <span style="float:left">Total. Add lines 34a and 34b</span>
                                                       <!--Dotted Line-->
		                         <div class="styDotLn" style="float:right;padding-right:1mm;">.......................</div>
								</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">34c</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/TotalSpecialDeductionsAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch A line 35 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;">35</div>
								<div class="styLNDesc" style="width:133mm;height:4mm;">
									<span style="float:left"><b>Subtotal.</b> Subtract line 34c from line 33</span>
                                                                <!--Dotted Line-->
			                     <div class="styDotLn" style="float:right;padding-right:1mm;">...................</div>
								</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">35</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/SpecialDeductionsSubtotalAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- Schedule A line 36a -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;">36a</div>
								<div class="styLNDesc" style="width:93mm;height:4mm;">
                                   <span style="float:left"> Dividends-received deduction (Schedule C, line 25)</span>
                                                  <!--Dotted Line-->
			                        <div class="styDotLn" style="float:right;padding-right:1mm;">.....</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">36a</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/DividendsReceivedDeductionAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"/>
								<div class="styLNAmountBoxNBB" style="background-color:lightgrey;height:4.5mm;border-left-width:0px;"/>
							</div>
						</div>
						<!-- Schedule A line 36b -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;padding-left: 4.25mm;">b</div>
								<div class="styLNDesc" style="width:93mm;height:4mm;">
                                   <span style="float:left">Net operating loss deduction
                                        <!-- Form to Form Link (Push Pin)-->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/NetOperatingLossDeductionAmt"/>
									</xsl:call-template></span>
									<!--Dotted Line-->
							<div class="styDotLn" style="float:right;padding-right:1mm;">............</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">36b</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/NetOperatingLossDeductionAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBox" style="background-color:lightgrey;height:4.5mm;"/>
								<div class="styLNAmountBox" style="background-color:lightgrey;height:4.5mm;border-left-width:0px;"/>
							</div>
						</div>
						<!--Sch A line 36c -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;padding-left: 4.25mm">c</div>
								<div class="styLNDesc" style="width:133mm;height:4mm;">
                                   <span style="float:left"> Total. Add lines 36a and 36b</span>
                                              <!--Dotted Line-->
				             <div class="styDotLn" style="float:right;padding-right:1mm;">.......................</div>
								</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">36c</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/TotalDivReceivedAndOprLossAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch A line 37 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm;">37</div>
								<div class="styLNDesc" style="width:133mm;height:8mm;padding-top:4mm;">
									<span style="float:left"><b>Taxable income</b> (subtract line 36c from line 35). Enter here and on page 1, line 1</span>
              <!--Dotted Line-->
				<div class="styDotLn" style="float:right;padding-right:1mm;">......</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBoxNBB" style="height:8mm;padding-top:4mm;">37</div>
								<div class="styLNAmountBoxNBB" style="height:8mm;padding-top:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/TaxableIncomeAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!--END Main Form Deductions Section-->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;float:none;">
						<div style="float:left;"/>
						<div style="float:right;">
							<span style="width:40px;"/>  
          Form <span class="styBoldText" style="font-size:8pt;">1120-PC</span> (2013)
     </div>
					</div>
					<!-- END Page Break and Footer-->
					<!--Begin Page 3 -->
					<!-- Page 3 Header -->
					<div class="styBB" style="width:187mm;padding-top:.5mm;float:none;">
						<div style="float:left;">Form 1120-PC (2013)<span style="width:146mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">3</span>
						</div>
					</div>
					<!-- END Page Header -->
					<!-- BEGIN Schedule B Title -->
					<div class="styBB" style="width:187mm;border-top:1px solid black;">
						<div class="styPartName" style="width:23mm;">Schedule B</div>
		<div class="styPartDesc" style="width:164mm;">Part I &#8212; Taxable Investment Income of Electing Small Companies Section 834
      <span class="styNormalText" style="font-size:6.5pt;">(see instructions)</span>
						</div>
					</div>
					<!-- END Schedule B Title -->
					<!--BEGIN Main Schedule B Income Section-->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS1120PCVTImageBox" style="width:6mm;text-align:center;height:70.5mm;padding-top:30mm;">
							
							<img src="{$ImagePath}/1120PC_Income.gif" alt="Income section" valign="center" height="40mm;"/>
						</div>
						
						<!--Sch B line a and b  -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:8mm;padding-left: 2.25mm"/>
								<div class="styLNDesc" style="width:68mm;height:8mm;"/>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNAmountBox" style="height:8.5mm;width:32mm;text-align:center;padding-top:2mm;">
									<b>(a)</b> Interest received </div>
								<div class="styLNAmountBox" style="height:8.5mm;width:32mm;text-align:center;">
									<b>(b)</b> Amortization of premium </div>
								<div class="styLNRightNumBoxNBB" style="height:8.5mm;background-color:lightgrey;"/>
								<div class="styLNAmountBoxNBB" style="height:8.5mm;background-color:lightgrey;border-left-width: 0px;"/>
							</div>
						</div>
						<!--Sch B line 1a  -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:8mm;padding-left: 2.25mm;padding-top:4mm;">1a</div>
								<div class="styLNDesc" style="width:68mm;height:8mm;padding-top:4mm;">
                                     <span style="float:left">Gross interest</span>
                                        <!--Dotted Line-->
			                          <div class="styDotLn" style="float:right;padding-right:1mm;">...........</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNAmountBox" style="height:8.5mm;width:32mm;text-align:right;padding-top:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/GrossInterestReceivedAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:8.5mm;width:32mm;text-align:right;padding-top:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/GrossInterestAmortzPremAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBoxNBB" style="height:8.5mm;background-color:lightgrey;"/>
								<div class="styLNAmountBoxNBB" style="height:8.5mm;background-color:lightgrey;border-left-width: 0px;"/>
							</div>
						</div>
						<!--Sch B line 1b  -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:8mm;padding-left: 4.25mm;padding-top:4mm;">b</div>
								<div class="styLNDesc" style="width:68mm;height:8mm;padding-top:4mm;">
                                  <span style="float:left"> Interest exempt under section 103</span>
                                      <!--Dotted Line-->
			                    	<div class="styDotLn" style="float:right;padding-right:1mm;">.....</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNAmountBox" style="height:8.5mm;width:32mm;text-align:right;padding-top:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/IntExemptUnderSect103RcvdAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:8.5mm;width:32mm;text-align:right;padding-top:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/IntExemptUnderSect103AmortzAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBoxNBB" style="height:8.5mm;background-color:lightgrey;"/>
								<div class="styLNAmountBoxNBB" style="height:8.5mm;background-color:lightgrey;border-left-width: 0px;"/>
							</div>
						</div>
						<!--Sch B line 1c  -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:8mm;padding-left: 4.25mm;padding-top:4mm;">c</div>
								<div class="styLNDesc" style="width:68mm;height:8mm;padding-top:4mm;">
                                <span style="float:left"> Subtract line 1b from line 1a</span>
                                              <!--Dotted Line-->
			                     <div class="styDotLn" style="float:right;padding-right:1mm;">.......</div>
								</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNAmountBox" style="height:8.5mm;width:32mm;text-align:right;padding-top:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/GroIntRcvdLessIntExmptRcvdAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:8.5mm;width:32mm;text-align:right;padding-top:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/GrossIntAmortzLessIntExmptAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBoxNBB" style="height:8.5mm;background-color:lightgrey;"/>
								<div class="styLNAmountBoxNBB" style="height:8.5mm;background-color:lightgrey;border-left-width: 0px;"/>
							</div>
						</div>
						<!--Sch B line 1d -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;padding-left: 4.25mm">d</div>
								<div class="styLNDesc" style="width:133mm;height:4mm;">
                                    <span style="float:left"> Taxable interest. Subtract line 1c, column (b) from line 1c, column (a)</span>
                                         <!--Dotted Line-->
		                            	<div class="styDotLn" style="float:right;padding-right:1mm;">..........</div>
			     				</div>
							</div>
							<div style="float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">1d</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/TaxableInterestAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch B line 2 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">2</div>
								<div class="styLNDesc" style="width:133mm;height:4mm;">
                               <span style="float:left">Dividends (Schedule C, line 14)</span>
                                              <!--Dotted Line-->
				                <div class="styDotLn" style="float:right;padding-right:1mm;">......................</div>
								</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">2</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/TotalDividendAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch B line 3 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">3</div>
								<div class="styLNDesc" style="width:133mm;height:4mm;">
                                 <span style="float:left"> Gross rents</span>
                                        <!--Dotted Line-->
	                             <div class="styDotLn" style="float:right;padding-right:1mm;">............................</div>
								</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">3</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/GrossRentsAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch B line 4 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">4</div>
								<div class="styLNDesc" style="width:133mm;height:4mm;">
                                <span style="float:left"> Gross royalties</span>
                                        <!--Dotted Line-->
		                         <div class="styDotLn" style="float:right;padding-right:1mm;">...........................</div>
								</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">4</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/GrossRoyaltiesAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch B line 5 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">5</div>
								<div class="styLNDesc" style="width:133mm;height:4mm;">
                 <span style="float:left"> Gross income from a trade or business, other than an insurance business, and from Form 4797</span>
                                             <!--Dotted Line-->
				                     <div class="styDotLn" style="float:right;padding-right:1mm;">..</div>
								</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">5</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/GrossIncomeFromTradeOrBusAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch B line 6 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">6</div>
								<div class="styLNDesc" style="width:133mm;height:4mm;">
                                <span style="float:left">Income from leases described in sections 834(b)(1)(B) and 834(b)(1)(C)</span>
                                       <!--Dotted Line-->
		                             <div class="styDotLn" style="float:right;padding-right:1mm;">.........</div>
								</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">6</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/GrossIncomeFromLeasesTermAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch B line 7 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm;">7</div>
								<div class="styLNDesc" style="width:133mm;height:4mm;">
                                   <span style="float:left"> Gain from Schedule D (Form 1120), line 18</span>
                                                           <!--Dotted Line-->
	                                     	<div class="styDotLn" style="float:right;padding-right:1mm;">...................</div>
								</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">7</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/CapitalGainNetIncomeAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch B line 8 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm;">8</div>
								<div class="styLNDesc" style="width:133mm;height:4mm;">
                   <span style="float:left">Gross investment income. Add lines 1d through 7
                  <!-- Form to Form Link (Push Pin plus pen and ink) -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/GrossInvestmentIncomeAmt"/>
									</xsl:call-template>
									<span style="width:1mm;"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Form 1120PC - Schedule B Line 8 - PAL Indicator</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/GrossInvestmentIncomeAmt/@protectionAgainstLossCd"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Form 1120PC - Schedule B Line 8 - PAL Amount</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/GrossInvestmentIncomeAmt/@protectionAgainstLossIncmAmt"/>
									</xsl:call-template></span>
									<!--Dotted Line-->
						<div class="styDotLn" style="float:right;padding-right:1mm;">..............</div>
								</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBoxNBB" style="height:5mm;padding-top:1mm;">8</div>
								<div class="styLNAmountBoxNBB" style="height:5mm;padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/GrossInvestmentIncomeAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!--END Schedule B Income Section-->
					<!--BEGIN Schedule B Deduction Section-->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS1120PCVTImageBox" style="width:6mm;height:62.5mm;padding-top:5mm;">
							<div style="width:2mm;height:17mm;"/>
							<img src="{$ImagePath}/1120PC_Deductions.gif" alt="Deductions section"/>
						</div>
						<!--Sch B line 9 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">9</div>
								<div class="styLNDesc" style="width:133mm;height:4mm;">
                                 <span style="float:left">Real estate taxes</span>
                                       <!--Dotted Line-->
		                           <div class="styDotLn" style="float:right;padding-right:1mm;">...........................</div>
								</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">9</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/RealEstateTaxesAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch B line 10 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;">10</div>
								<div class="styLNDesc" style="width:133mm;height:4mm;">
                                  <span style="float:left">Other real estate expenses</span>
                                   <!--Dotted Line-->
			                     <div class="styDotLn" style="float:right;padding-right:1mm;">........................</div>
								</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">10</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/OtherRealEstateExpensesAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch B line 11 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;">11</div>
								<div class="styLNDesc" style="width:133mm;height:4mm;">
                                <span style="float:left">Depreciation (attach Form 4562)
                                       <!-- Form to Form Link (Push Pin) -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/DepreciationAmt"/>
									</xsl:call-template></span>
									<!--Dotted Line-->
			                        <div class="styDotLn" style="float:right;padding-right:1mm;">.....................</div>
								</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">11</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/DepreciationAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch B line 12 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;">12</div>
								<div class="styLNDesc" style="width:133mm;height:4mm;">
                                         <span style="float:left">Depletion</span>
                                                   <!--Dotted Line-->
			                   <div class="styDotLn" style="float:right;padding-right:1mm;">.............................</div>
								</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">12</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/DepletionAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch B line 13 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;">13</div>
								<div class="styLNDesc" style="width:133mm;height:4mm;">
                                 <span style="float:left">Trade or business deductions as provided in section 834(c)(8) (attach statement)
                                            <!-- Form to Form Link (Push Pin) -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/TradeOrBusinessDeductionsAmt"/>
									</xsl:call-template></span>
									<!--Dotted Line-->
					                  <div class="styDotLn" style="float:right;padding-right:1mm;">.....</div>
								</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">13</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/TradeOrBusinessDeductionsAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch B line 14 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;">14</div>
								<div class="styLNDesc" style="width:133mm;height:4mm;">
                                     <span style="float:left"> Interest</span>
                                        <!--Dotted Line-->
			                        <div class="styDotLn" style="float:right;padding-right:1mm;">.............................</div>
								</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">14</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/InterestDeductionAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch B line 15 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;">15</div>
								<div class="styLNDesc" style="width:133mm;height:4mm;">
                                 <span style="float:left"> Other capital losses (Schedule G, line 12, column (g))</span>
                                       <!--Dotted Line-->
				                  <div class="styDotLn" style="float:right;padding-right:1mm;">...............</div>
								</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">15</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/TotalLossAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch B line 16 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;">16</div>
								<div class="styLNDesc" style="width:133mm;height:4mm;">
                              <span style="float:left"> Total. Add lines 9 through 15</span>
                                           <!--Dotted Line-->
	                          <div class="styDotLn" style="float:right;padding-right:1mm;">.......................</div>
								</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">16</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/TotalInvestmentAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch B line 17 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;">17</div>
								<div class="styLNDesc" style="width:133mm;height:4mm;">
                                 <span style="float:left">Investment expenses (attach statement)
                                             <!-- Form to Form Link (Push Pin) -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/InvestmentExpenseAmt"/>
									</xsl:call-template></span>
									<!--Dotted Line-->
				                   	<div class="styDotLn" style="float:right;padding-right:1mm;">..................</div>
								</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">17</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/InvestmentExpenseAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch B line 18 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;">18</div>
								<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">	<b>Total deductions.</b> Add lines 16 and 17
                                                <!-- Form to Form Link (Push Pin) -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/TotalDeductionAmt"/>
									</xsl:call-template></span>
									<!--Dotted Line-->
				                   	<div class="styDotLn" style="float:right;padding-right:1mm;">...................</div>
								</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">18</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/TotalDeductionAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch B line 19 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;">19</div>
								<div class="styLNDesc" style="width:133mm;height:4mm;">
                                <span style="float:left">Subtract line 18 from line 8</span>
                                                    <!--Dotted Line-->
                             	<div class="styDotLn" style="float:right;padding-right:1mm;">........................</div>
								</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">19</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/GrossInvstIncmLessTotDedAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch B line 20 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:4mm;">20</div>
								<div class="styLNDesc" style="width:133mm;height:4mm;">
                                  <span style="float:left">Dividends-received deduction (Schedule C, line 25)</span>
                                  <!--Dotted Line-->
			                        <div class="styDotLn" style="float:right;padding-right:1mm;">................</div>
								</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBox" style="height:4.5mm;">20</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/DividendsReceivedDeductionAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Sch B line 21 -->
						<div class="styGenericDiv" style="width:181mm;">
							<div style="width:141mm;float:left;clear:none;">
								<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm;">21</div>
								<div class="styLNDesc" style="width:133mm;height:8mm;padding-top:4mm;">
									<span style="float:left"><b>Taxable investment income.</b> Subtract line 20 from line 19. Enter here and on page 1, line 2</span>
                                      <!--Dotted Line-->
			                          	<div class="styDotLn" style="float:right;padding-right:1mm;">...</div>
								</div>
							</div>
							<div style="width:40mm;float:right;clear:none;">
								<div class="styLNRightNumBoxNBB" style="height:8.5mm;padding-top:4mm;">21</div>
								<div class="styLNAmountBoxNBB" style="height:8.5mm;padding-top:4mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/TaxableInvestmentIncomeAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!--END Main Form Deductions Section-->
					<!-- BEGIN Part II -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartDesc" style="width:164mm;padding-left:0mm;height:auto;">Part II - Invested Assets Book Values<br/>
      (Complete only if claiming a deduction for general expenses allocated to investment income.) 
      </div>
					</div>
					<!-- END Part II Title -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;"/>
							<div class="styLNDesc" style="width:99mm;height:4mm;"/>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNAmountBox" style="height:4.5mm;width:40mm;text-align:center;">
								<b>(a)</b>Beginning of tax year</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:40mm;text-align:center;">
								<b>(b)</b>End of tax year</div>
						</div>
					</div>
					<!-- Part II line 22 -->
					<div style="width:187mm;">
						<div style=" float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;">22</div>
							<div class="styLNDesc" style="height:4mm;width:99mm;">
							<span style="float:left">Real estate</span>
          <!--Dotted Line-->
	<div class="styDotLn" style="float:right;padding-right:1mm;">....................</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">22 </div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/RealEstateBOYAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:1px; border-right-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:1px; border-left-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/RealEstateEOYAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Part II line 23 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;">23</div>
							<div class="styLNDesc" style="height:4mm;width:99mm;"><span style="float:left">Mortgage loans</span>
          <!--Dotted Line-->
	<div class="styDotLn" style="float:right;padding-right:1mm;">...................</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">23 </div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/MortgageLoansBOYAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:1px; border-right-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:1px; border-left-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/MortgageLoansEOYAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Part II line 24 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;">24</div>
							<div class="styLNDesc" style="height:4mm;width:99mm;"><span style="float:left">Collateral loans</span>
          <!--Dotted Line-->
		<div class="styDotLn" style="float:right;padding-right:1mm;">...................</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">24 </div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/CollateralLoansBOYAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:1px; border-right-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:1px; border-left-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/CollateralLoansEOYAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Part II line 25 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;">25</div>
							<div class="styLNDesc" style="height:4mm;width:99mm;"><span style="float:left">Policy loans, including premium notes</span>
          <!--Dotted Line-->
	<div class="styDotLn" style="float:right;padding-right:1mm;">............</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">25 </div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/PolicyLoansBOYAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:1px; border-right-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:1px; border-left-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/PolicyLoansEOYAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Part II line 26 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;">26</div>
							<div class="styLNDesc" style="height:4mm;width:99mm;"><span style="float:left">Bonds of domestic corporations</span>
          <!--Dotted Line-->
	<div class="styDotLn" style="float:right;padding-right:1mm;">..............</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">26 </div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/BondsOfDomesticCorpBOYAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:1px; border-right-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:1px; border-left-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/BondsOfDomesticCorpEOYAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Part II line 27 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;">27</div>
							<div class="styLNDesc" style="height:4mm;width:99mm;">
							<span style="float:left">Stock of domestic corporations</span>
          <!--Dotted Line-->
		<div class="styDotLn" style="float:right;padding-right:1mm;">..............</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">27 </div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/StockOfDomesticCorpBOYAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:1px; border-right-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:1px; border-left-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/StockOfDomesticCorpEOYAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Part II line 28 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;">28</div>
							<div class="styLNDesc" style="height:4mm;width:99mm;">
						<span style="float:left">Government obligations, etc.</span>
          <!--Dotted Line-->
					<div class="styDotLn" style="float:right;padding-right:1mm;">..............</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">28 </div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/USGovernmentObligationsBOYAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:1px; border-right-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:1px; border-left-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/USGovernmentObligationsEOYAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Part II line 29 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;">29</div>
							<div class="styLNDesc" style="height:4mm;width:99mm;"><span style="float:left">Bank deposits bearing interest</span>
          <!--Dotted Line-->
	                              <div class="styDotLn" style="float:right;padding-right:1mm;">..............</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">29 </div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/BankDepositsBOYAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:1px; border-right-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:1px; border-left-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/BankDepositsEOYAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Part II line 30 -->
					<div style="width:187mm;">
						<div style=" float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm;">30</div>
							<div class="styLNDesc" style="height:8mm;width:99mm;padding-top:4mm;">
							<span style="float:left">Other interest-bearing assets (attach statement)</span>
          <!--Dotted Line-->
			<div class="styDotLn" style="float:right;padding-right:1mm;">........</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">30</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:8mm;">
								<span style="float:left;width:31mm;">
									<!-- Form to Form Link (Push Pin) -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/OtherInterestBearingAstBOYAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/OtherInterestBearingAstBOYAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;border-bottom-width:1px; border-right-width:0px;"/>
							<div class="styLNAmountBox" style="height:8mm;border-bottom-width:1px; border-left-width:0px;">
								<span style="float:left;width:31mm;">
									<!-- Form to Form Link (Push Pin) -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/OtherInterestBearingAstEOYAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/OtherInterestBearingAstEOYAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Part II line 31 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;">31</div>
							<div class="styLNDesc" style="height:4mm;width:99mm;"><span style="float:left">Total. Add lines 22 through 30</span>
          <!--Dotted Line-->
					<div class="styDotLn" style="float:right;padding-right:1mm;">..............</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">31</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/TotalInvestedAssetsBOYAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:1px; border-right-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:1px; border-left-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/TotalInvestedAssetsEOYAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Part II line 32 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;">32</div>
							<div class="styLNDesc" style="height:4mm;"><span style="float:left">Add columns (a) and (b), line 31</span>
          <!--Dotted Line-->
			<div class="styDotLn" style="float:right;padding-right:1mm;">.......................</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">32</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/TotalInvestedAssetsAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Part II line 33 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;">33</div>
							<div class="styLNDesc" style="height:4mm;">
							<span style="float:left">Mean of invested assets for the tax year. Enter one-half of line 32</span>
          <!--Dotted Line-->
			<div class="styDotLn" style="float:right;padding-right:1mm;">............</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">33</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/MeanOfInvestedAssetsAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Part II line 34 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;">34</div>
							<div class="styLNDesc" style="height:4mm;"><span style="float:left">Multiply line 33 by .0025</span>
          <!--Dotted Line-->
		<div class="styDotLn" style="float:right;padding-right:1mm;">.........................</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">34</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/MeanOfInvestedAssets0025PctAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Part II line 35 Line 1-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;">35</div>
							<div class="styLNDesc" style="height:4mm;">
							<span style="float:left">Income base. Line 1b, column (a) plus line 8 less the sum of line 1b, column</span>
        
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-right-width:0px;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="border-bottom-width:0px;height:4.5mm;background-color:lightgrey;border-left-width:0px;"/>
						</div>
					</div>
					<!-- Part II line 35 Line 2-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;width:8mm;"/>
							<div class="styLNDesc" style="height:4mm;width:99mm;">
							<span style="float:left">(b) and line 16</span>
          <!--Dotted Line -->
			 <div class="styDotLn" style="float:right;padding-right:1mm;">..................</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">35</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/IncomeBaseAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-right-width:0px;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="border-bottom-width:0px;height:4.5mm;background-color:lightgrey;border-left-width:0px;"/>
						</div>
					</div>
					<!-- Part II line 36-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;width:8mm;">36</div>
							<div class="styLNDesc" style="height:4mm;width:99mm;"><span style="float:left">Multiply line 33 by .0375</span>
          <!--Dotted Line -->
			<div class="styDotLn" style="float:right;padding-right:1mm;">...............</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">36</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/MeanOfInvestedAssets0375PctAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-right-width:0px;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="border-bottom-width:0px;height:4.5mm;background-color:lightgrey;border-left-width:0px;"/>
						</div>
					</div>
					<!-- Part II line 37-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;width:8mm;">37</div>
							<div class="styLNDesc" style="height:4mm;width:99mm;">
							<span style="float:left">Subtract line 36 from line 35. Do not enter less than zero</span>
          <!--Dotted Line -->
				<div class="styDotLn" style="float:right;padding-right:1mm;">.....</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">37</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/NetIncomeBaseAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-right-width:0px;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="border-bottom-width:0px;height:4.5mm;background-color:lightgrey;border-left-width:0px;"/>
						</div>
					</div>
					<!-- Part II line 38 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;">38</div>
							<div class="styLNDesc" style="height:4mm;">
							<span style="float:left">Multiply line 37 by .25</span>
          <!--Dotted Line-->
			<div class="styDotLn" style="float:right;padding-right:1mm;">..........................</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">38</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/NetIncomeBasePctAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Part II line 39 -->
					<div class="styBB" style="width:187mm;border-bottom:2px solid black;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm;">39</div>
							<div class="styLNDesc" style="height:8mm;padding-top:4mm;">
							<span style="float:left">Limitation on deduction for investment expenses. Add lines 34 and 38</span>
          <!--Dotted Line-->
				<div class="styDotLn" style="float:right;padding-right:1mm;">..........</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBoxNBB" style="height:8.5mm;padding-top:4mm;">39</div>
							<div class="styLNAmountBoxNBB" style="height:8.5mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/DeductionLimitationAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Page Break and Footer for Page 3-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;float:none;">
						<div style="float:left;"/>
						<div style="float:right;">
							<span style="width:40px;"/>  
          Form <span class="styBoldText" style="font-size:8pt;">1120-PC</span> (2013)
     </div>
					</div>
					<!-- END Page Break and Footer for Page 3-->
					<!--Begin Page 4 -->
					<!-- Page 4 Header -->
					<div class="styBB" style="width:187mm;padding-top:.5mm;float:none;">
						<div style="float:left;">Form 1120-PC (2013)<span style="width:146mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">4</span>
						</div>
					</div>
					<!-- END Page 4 Header -->
					<!-- BEGIN Schedule C Title Income Section -->
					
						<div style="float:left;clear:none;border-top:1px solid black;border:0px solid red;width:123mm;border-bottom:1px solid black;">
							<div class="styPartName" style="width:23mm;">Schedule C</div>
							<div class="styPartDesc" style="width:70mm; height:8mm;">Dividends and Special Deductions <br /> <span style="font-weight:normal" >(see instructions)</span></div>	
						</div>
						<div style="float:right;clear:none;width:65mm;border:0px solid green;" >
								<div class="styLNAmountBox" style="heigh:4.5mm;width:65mm;text-align:center;border-top:1px solid black;">Dividends-Received</div>
													   									<div class="styLNAmountBox" style="height:8mm;text-align:center;float:left;width:32mm;border-right:none;border-top:none;border-bottom:none;border-left:1px solid black;">
									<b>(a)</b> Subject to section <br/>832(b)(5)(B)</div>	
									<div class="styLNAmountBox" style="height:8mm;text-align:center;float:right;width:33mm;border-right:none;border-top:none;border-bottom:none;border-left:1px solid black;">
									<b>(b)</b> Total dividends-<br/>received</div>	
						</div>
						<div class="styGenericDiv">
					   	<div class="styPartDesc" style="width:123mm;height:4mm;font-weight:bold;text-align:center;">Income</div>
							
						</div>
					 
					
					
					
					<!--div style="width:187mm;">
						<div style="float:left;clear:none;border-top:1px solid black;border:1px solid red;width:100mm;">
							<div class="styPartName" style="width:23mm;">Schedule C</div>
							<div class="styPartDesc" style="width:70mm;">Dividends and Special Deductions</div>
							<div class="styPartDesc" style="width:70mm;height:4mm;font-weight:normal;padding-left:26mm;border-bottom:1px solid black;">(see instructions)</div>
							<div class="styPartDesc" style="width:70mm;height:4mm;font-weight:bold;text-align:center;">Income</div>
						</div>
						<div style="float:right;clear:none;width:86mm;border:0px solid green;" class="styLNDesc">
							<div class="styLNAmountBox" style="heigh:4.5mm;width:64mm;text-align:center;border-top:1px solid black;">Dividends-Received</div>
							<div style="border:0px solid blue;width:88mm;">
								<div class="styLNAmountBox" style="height:15mm;text-align:center;float:left;width:42mm;border-right:none;border-top:none;border-bottom:none;border-left:1px solid black;border:0px solid green;padding-left:24mm;">
									<b>(a)</b> Subject to section <br/>832(b)(5)(B)</div>
								<div class="styLNAmountBox" style="height:15mm;text-align:center;float:right;width120pxborder-right:none;border-top:none;border-bottom:none;border-left:1px solid black;">
									<b>(b)</b> Total dividends-<br/>received</div>
							</div>
						</div>
					</div-->
					<!-- END Schedule C Title Income Section -->
					<!-- Schedule C Line 1-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:8mm;padding-left:2.25mm;">1</div>
							<div class="styLNDesc" style="height:8mm;width:107mm;"> 
                Dividends from less-than-20%-owned domestic corporations 
               <span style="float:left">(other than debt-financed stock)</span>
                      <!--Dotted Line -->
							<div class="styDotLn" style="float:right;padding-right:1mm;">...............</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8.5mm;padding-top:4mm;border-top:1px solid black;">1</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;padding-top:4mm;border-top:1px solid black;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/DomCorpBelow20OwnDivRcvdAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;padding-top:4mm;border-top:1px solid black;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/DomCorpBelow20OwnTotRcvdAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule C Line 2-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:8mm;padding-left:2.25mm;padding-top:1mm;">2</div>
							<div class="styLNDesc" style="height:8mm;width:107mm;padding-top:1mm;"> 
                Dividends from 20%-or-more-owned domestic corporations 
                <span style="float:left">(other than debt-financed stock) </span>
                      <!--Dotted Line -->
						<div class="styDotLn" style="float:right;padding-right:1mm;">...............</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8.5mm;padding-top:4mm;">2</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/DomCorp20OrMoreOwnDivRcvdAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/DomCorp20OrMoreOwnTotRcvdAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- End Schedule C Line 2 -->
					<!-- Schedule C Line 3-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:8mm;padding-left:2.25mm;padding-top:4mm;">3</div>
							<div class="styLNDesc" style="height:8mm;width:107mm;padding-top:4mm;">
         <span style="float:left"> Dividends on debt-financed stock of domestic and foreign corporations</span>
          <!--Dotted Line -->
			<div class="styDotLn" style="float:right;padding-right:1mm;">...</div>
            
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8.5mm;padding-top:4mm;">3</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/DebtFincdStockCorpDivRcvdAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;">
								<span style="width:31mm;">
									<!-- Form to Form Link (Push Pin) -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/DebtFincdStockCorpTotRcvdAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/DebtFincdStockCorpTotRcvdAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule C Line 4-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:8mm;padding-left:2.25mm;padding-top:4mm;">4</div>
							<div class="styLNDesc" style="height:8mm;width:107mm;padding-top:4mm;">
          Dividends on certain preferred stock of less-than-20%-owned public utilities
        </div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8.5mm;padding-top:4mm;">4</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/PubUtilityBelow20DivRcvdAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;padding-top:4mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/PubUtilityBelow20TotRcvdAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule C Line 5-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:8mm;padding-left:2.25mm;padding-top:4mm;">5</div>
							<div class="styLNDesc" style="height:8mm;width:107mm;padding-top:4mm;">
          <span style="float:left">Dividends on certain preferred stock of 20%-or-more-owned public utilities</span>
            <!--Dotted Line -->
					<div class="styDotLn" style="float:right;padding-right:1mm;">..</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8.5mm;padding-top:4mm;">5</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/PubUtility20OrMoreDivRcvdAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/PubUtility20OrMoreTotRcvdAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule C Line 6-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:8mm;padding-left:2.25mm;">6</div>
							<div class="styLNDesc" style="height:8mm;width:107mm;">
           Dividends on stock of certain less-than-20%-owned foreign corporations and 
           <span style="float:left">certain FSCs</span>
          <!--Dotted Line -->
			<div class="styDotLn" style="float:right;padding-right:1mm;">.....................</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8.5mm;padding-top:4mm;">6</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/FrgnCorpBelow20OwnDivRcvdAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/FrgnCorpBelow20OwnTotRcvdAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule C Line 7-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:8mm;padding-left:2.25mm;">7</div>
							<div class="styLNDesc" style="height:8mm;width:107mm;">
          Dividends on stock of certain 20%-or-more-owned foreign corporations and 
          <span style="float:left">certain FSCs</span>
          <!--Dotted Line -->
			<div class="styDotLn" style="float:right;padding-right:1mm;">.....................</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8.5mm;padding-top:4mm;">7</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/FrgnCorp20OrMoreOwnDivRcvdAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/FrgnCorp20OrMoreOwnTotRcvdAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule C Line 8-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:8mm;padding-left:2.25mm;padding-top:4mm;">8</div>
							<div class="styLNDesc" style="height:8mm;width:107mm;padding-top:4mm;">
        <span style="float:left">Dividends from wholly owned foreign subsidiaries and certain FSCs</span>
          <!--Dotted Line -->
				<div class="styDotLn" style="float:right;padding-right:1mm;">....</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8.5mm;padding-top:4mm;">8</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/WhollyOwnFrgnSbsdryDivRcvdAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/WhollyOwnFrgnSbsdryTotRcvdAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule C Line 9-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:8mm;padding-left:2.25mm;padding-top:4mm;">9</div>
							<div class="styLNDesc" style="height:8mm;width:107mm;padding-top:4mm;">
          <span style="float:left">Dividends from affiliated companies</span>
          <!--Dotted Line -->
				<div class="styDotLn" style="float:right;padding-right:1mm;">..............</div>
            
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8.5mm;padding-top:4mm;">9</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/CertainAffltCompanyDivRcvdAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/CertainAffltCompanyTotRcvdAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule C Line 10-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:8mm;padding-top:4.mm;">10</div>
							<div class="styLNDesc" style="height:8mm;width:107mm;padding-top:4.mm;">
          <span style="float:left">Other dividends from foreign corporations not included on lines 3, 6, 7, or 8</span>
            <!--Dotted Line -->
					<div class="styDotLn" style="float:right;padding-right:1mm;">..</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8.5mm;padding-top:4.mm;">10</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;padding-top:4.mm;background-color:lightgrey;"/>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;padding-top:4.mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/OtherDivForeignCorpTotRcvdAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule C Line 11-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:8mm;">11</div>
							<div class="styLNDesc" style="height:8mm;width:107mm;">
          Income from controlled foreign corporations under subpart F 
          <span style="float:none">(attach Forms 5471)</span>
          <!--Dotted Line -->
				<div class="styDotLn" style="float:right;padding-right:1mm;"></div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8.5mm;padding-top:4mm;">11</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;background-color:lightgrey;"/>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;">
								<span style="width:31mm;">
									<!-- Form to Form Link (Push Pin) -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/TotalIncmControlledFrgnCorpAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/TotalIncmControlledFrgnCorpAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule C Line 12-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm;">12</div>
							<div class="styLNDesc" style="height:8mm;width:107mm;padding-top:4mm;">
          <span style="float:left">Foreign dividend gross-up (section 78)</span>
          <!--Dotted Line -->
			<div class="styDotLn" style="float:right;padding-right:1mm;">..............</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8.5mm;padding-top:4mm;">12</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;background-color:lightgrey;"/>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/ForeignDivGrossUpTotRcvdAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule C Line 13-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm;">13</div>
							<div class="styLNDesc" style="height:8mm;width:107mm;padding-top:4mm;">
       <span style="float:left"> Other dividends (attach statement)</span>
          <!--Dotted Line -->
		<div class="styDotLn" style="float:right;padding-right:1mm;">..............</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8.5mm;padding-top:4mm;">13</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;background-color:lightgrey;"/>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:8.5mm;">
								<span style="width:31mm;">
									<!-- Form to Form Link (Push Pin) -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/OtherDividendsTotRcvdAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/OtherDividendsTotRcvdAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule C Line 14-->
					<div class="styBB" style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:12mm;padding-top:4mm;">14</div>
							<div class="styLNDesc" style="height:12mm;width:107mm;padding-top:4mm;">
								<b>Total dividends.</b> Add lines 1 through 13. Enter here and on Schedule A, line 2, or
        
        <span style="float:left">Schedule B, line 2, whichever applies</span>
          <!--Dotted Line -->
			<div class="styDotLn" style="float:right;padding-right:1mm;">..............</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBoxNBB" style="height:12.5mm;padding-top:8mm;">14</div>
							<div class="styLNAmountBoxNBB" style="height:12.5mm;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="height:12.5mm;padding-top:8mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/TotalDividendsReceivedAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>

					<!-- BEGIN Schedule C Title Deduction Section -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;background-color:none;height:12mm;">
							<br/>
							<br/>
							<div class="styPartDesc" style="width:123mm;height:4mm;font-weight:bold;text-align:center;background-color:none;">Deduction</div>
						</div>
						<div style="float:right;clear:none;width:64mm;">
							<div class="styLNAmountBox" style="heigh:4.5mm;width:64mm;text-align:center;">Dividends-Received Deduction</div>
							<div>
								<div class="styLNAmountBox" style="height:8.5mm;text-align:center;float:left;width:120px;border-right:none;border-top:none;border-bottom:1px solid black;border-left:1px solid black;">
									<b>(a)</b>Subject to section <br/>832(b)(5)(B)</div>
								<div class="styLNAmountBox" style="height:8.5mm;text-align:center;float:right;width:120px;border-right:none;border-top:none;border-bottom:1px solid black;border-left:1px solid black;">
									<b>(b)</b>Total dividends-<br/>received deduction</div>
							</div>
						</div>
					</div>
					<!-- END Schedule C Title Deduction Section -->
					<!-- Schedule C Line 15-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;">15</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;">
        <span style="float:left">  Multiply line 1 by 70%</span>
          <!--Dotted Line -->
	<div class="styDotLn" style="float:right;padding-right:1mm;">...................</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;border-top:1px solid black;">15</div>
							<div class="styLNAmountBox" style="width:32mm;border-bottom-width:1px;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/DomCorpBelow20OwnDeductionAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="width:32mm;border-bottom-width:1px;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/DomCorpBelow20OwnTotDedAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule C Line 16-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;">16</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;">
         <span style="float:left"> Multiply line 2 by 80%</span>
          <!--Dotted Line -->
	<div class="styDotLn" style="float:right;padding-right:1mm;">...................</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4mm;">16</div>
							<div class="styLNAmountBox" style="width:32mm;border-bottom-width:1px;height:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/DomCorp20OrMoreOwnDeductionAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="width:32mm;height:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/DomCorp20OrMoreOwnTotDedAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule C Line 17-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:8mm;">17</div>
							<div class="styLNDesc" style="height:8mm;width:107mm;">
          <span style="float:left"> Deduction for line 3 (see instructions)</span>
          <!--Dotted Line -->
		<div class="styDotLn" style="float:right;padding-right:1mm;">.............</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8mm;">17</div>
							<div class="styLNAmountBox" style="width:32mm;border-bottom-width:1px;height:8mm;">
								<span style="width:31mm;float:left;">
									<!-- Form to Form Link (Push Pin) -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/DebtFincdStockCorpDeductionAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/DebtFincdStockCorpDeductionAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="width:32mm;height:8mm;">
								<span style="width:31mm;float:left;">
									<!-- Form to Form Link (Push Pin) -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/DebtFincdStockCorpTotDedAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/DebtFincdStockCorpTotDedAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule C Line 18-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;">18</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;">
         <span style="float:left"> Multiply line 4 by 42%</span>
          <!--Dotted Line -->
		<div class="styDotLn" style="float:right;padding-right:1mm;">...................</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">18</div>
							<div class="styLNAmountBox" style="width:32mm;border-bottom-width:1px;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/PubicUtilityBelow20DedAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="width:32mm;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/PubUtilityBelow20TotDedAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule C Line 19-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;">19</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;">
         <span style="float:left"> Multiply line 5 by 48%</span>
          <!--Dotted Line -->
			<div class="styDotLn" style="float:right;padding-right:1mm;">...................</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">19</div>
							<div class="styLNAmountBox" style="width:32mm;border-bottom-width:1px;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/PubUtility20OrMoreDedAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="width:32mm;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/PubUtility20OrMoreTotDedAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule C Line 20-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;">20</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;">
        <span style="float:left"> Multiply line 6 by 70%</span>
          <!--Dotted Line -->
				<div class="styDotLn" style="float:right;padding-right:1mm;">...................</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">20</div>
							<div class="styLNAmountBox" style="width:32mm;border-bottom-width:1px;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/FrgnCorpBelow20OwnDeductionAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="width:32mm;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/FrgnCorpBelow20OwnTotDedAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule C Line 21-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;">21</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;">
          <span style="float:left">Multiply line 7 by 80%</span>
          <!--Dotted Line -->
		<div class="styDotLn" style="float:right;padding-right:1mm;">...................</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">21</div>
							<div class="styLNAmountBox" style="width:32mm;border-bottom-width:1px;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/FrgnCorp20OrMoreOwnDedAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="width:32mm;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/FrgnCorp20OrMoreOwnTotDedAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule C Line 22-->
					<div style="width:187mm;">
						<div style=" float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;">22</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;">
          <span style="float:left">Enter the amount from line 8</span>
          <!--Dotted Line -->
			<div class="styDotLn" style="float:right;padding-right:1mm;">...............</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">22</div>
							<div class="styLNAmountBox" style="width:32mm;border-bottom-width:1px;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/WhollyOwnFrgnSbsdryDivDedAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="width:32mm;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/WhollyOwnFrgnSbsdryTotDedAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule C Line 23-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;">23</div>
							<div class="styLNDesc" style="height:4mm;width:107mm;">
						<span style="float:left"><b>Total.</b> Add lines 15 through 22. (See instructions for limitation.)</span>
          <!--Dotted Line -->
			<div class="styDotLn" style="float:right;padding-right:1mm;">.....</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4mm;">23</div>
							<div class="styLNAmountBox" style="width:32mm;border-bottom-width:1px;height:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/TotDivRcvdDedSect832b5BAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="width:32mm;height:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/DivRcvdDedLimitationAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule C Line 24-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:12mm;padding-top:4mm;">24</div>
							<div class="styLNDesc" style="height:12mm;width:107mm;padding-top:4mm;">
          Total. Add line 23, column (a), and line 9, column (a). Enter here and on 
          <span style="float:left">Schedule F, line 10</span>
          <!--Dotted Line -->
		<div class="styDotLn" style="float:right;padding-right:1mm;">...................</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:12.5mm;padding-top:8mm;">24</div>
							<div class="styLNAmountBox" style="width:32mm;border-bottom-width:1px;height:12.5mm;padding-top:7.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/DivRcvdDeductionSect832b5BAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="width:32mm;height:12.5mm;background-color:lightgrey;padding-top:7.5mm;"/>
						</div>
					</div>
					<!-- Schedule C Line 25-->
					<div class="styBB" style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:7.5mm;">25</div>
							<div class="styLNDesc" style="height:7.5mm;">
								<b>Total deductions.</b> Add line 23, column (b), and line 9, column (b). Enter here and on Schedule A, line 
      <span style="float:left">36a, or Schedule B, line 20, whichever applies</span>
          <!--Dotted Line -->
		<div class="styDotLn" style="float:right;padding-right:1mm;">..................</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBoxNBB" style="height:8mm;padding-top:4mm;">25</div>
							<div class="styLNAmountBoxNBB" style="width:32mm;height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleC/TotalDividendsReceivedDedAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;float:none;">
						<div style="float:left;"/>
						<div style="float:right;">
							<span style="width:40px;"/>  
          Form <span class="styBoldText" style="font-size:8pt;">1120-PC</span> (2013)
      </div>
					</div>
					<!-- END Page Break and Footer-->
					<!--Begin Page 5 -->
					<!-- Page Header -->
					<div class="styBB" style="width:187mm;padding-top:.5mm;float:none;">
						<div style="float:left;">Form 1120-PC (2013)<span style="width:146mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">5</span>
						</div>
					</div>
					<!-- END Page Header -->
					<!-- BEGIN Schedule E Title -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="width:23mm;border-bottom:1px solid black;">Schedule E</div>
						<div class="styPartDesc" style="width:164mm;border-top:1px solid black;">Premiums Earned?Section 832 
    <span class="styNormalText">(see instructions)</span>
						</div>
					</div>
					<!-- END Schedule E Title -->
					<!-- Schedule E Line 1-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">1</div>
							<div class="styLNDesc" style="height:4mm;">
          <span style="float:left">Net premiums written</span>
          <!--Dotted Line -->
		<div class="styDotLn" style="float:right;padding-right:1mm;">...........................</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">1</div>
							<div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleE/NetPremiumsWrittenAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule E Line 2-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">2</div>
							<div class="styLNDesc" style="height:4mm;">
          Unearned premiums on outstanding business at the end of the preceding tax year:
        </div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;;"/>
						</div>
					</div>
					<!-- Schedule E Line 2a line 1-->
					<div style="width:187mm;">
						<div style=" float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4.25mm;">a</div>
							<div class="styLNDesc" style="height:4mm;">
          Enter 100% of life insurance reserves included in unearned premiums
        </div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;;"/>
						</div>
					</div>
					<!-- Schedule E Line 2a line2-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4.25mm;"/>
							<div class="styLNDesc" style="height:4mm;width:99mm;">
    	832(b)(7)(A)) and unearned premiums of section 833 organizations 
      	 <span style="float:left">(see instructions)</span>
      	   <!--Dotted Line -->
					<div class="styDotLn" style="float:right;padding-right:1mm;">..................</div>
						</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8.5mm;padding-top:4mm;">2a</div>
							<div class="styLNAmountBox" style="width:32mm;height:8.5mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleE/PriorTYLifeInsReservesAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:8.5mm;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="width:32mm;height:8.5mm;"/>
						</div>
					</div>
					<!-- Schedule E Line 2b-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4.25mm;">b</div>
							<div class="styLNDesc" style="height:4mm;width:99mm;font-size:6pt;">
          <span style="float:left">Enter 90% of unearned premiums attributable to insuring certain securities</span>
          <!--Dotted Line -->
		<div class="styDotLn" style="float:right;padding-right:1mm;">....</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">2b</div>
							<div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleE/PriorTYUnearnedPremiumsPctAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;;"/>
						</div>
					</div>
					<!-- Schedule E Line 2c-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4.25mm;">c</div>
							<div class="styLNDesc" style="height:4mm;width:99mm;">
        <span style="float:left">  Discounted unearned premiums attributable to title insurance</span>
          <!--Dotted Line -->
				<div class="styDotLn" style="float:right;padding-right:1mm;">...</div>
           
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">2c</div>
							<div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleE/PriorTYDiscountedUnrndPremAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;;"/>
						</div>
					</div>
					<!-- Schedule E Line 2d-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4.25mm;">d</div>
							<div class="styLNDesc" style="height:4mm;width:99mm;">
         <span style="float:left"> Enter 80% of all other unearned premiums (see instructions)</span>
          <!--Dotted Line -->
				<div class="styDotLn" style="float:right;padding-right:1mm;">...</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">2d</div>
							<div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleE/PriorTYOthUnearnedPremPctAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;;"/>
						</div>
					</div>
					<!-- Schedule E Line 2e-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4.25mm;">e</div>
							<div class="styLNDesc" style="height:4mm;">
          <span style="float:left">  Total. Add lines 2a through 2d</span>
          <!--Dotted Line -->
		<div class="styDotLn" style="float:right;padding-right:1mm;">.......................</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">2e</div>
							<div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleE/PriorTYUnearnedPremiumsAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule E Line 3-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">3</div>
							<div class="styLNDesc" style="height:4mm;">
								<span style="float:left"> <b>Total.</b> Add lines 1 and 2e</span>
          <!--Dotted Line -->
			<div class="styDotLn" style="float:right;padding-right:1mm;">.......................</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">3</div>
							<div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleE/TotNetPremWrttnAndUnrndPremAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule E Line 4-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">4</div>
							<div class="styLNDesc" style="height:4mm;">
          Unearned premiums on outstanding business at the end of the current tax year:
        </div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;;"/>
						</div>
					</div>
					<!-- Schedule E Line 4a line 1-->
					<div style="width:187mm;">
						<div style=" float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4.25mm;">a</div>
							<div class="styLNDesc" style="height:4mm;">
          Enter 100% of life insurance reserves included in unearned premiums 
        </div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;;"/>
						</div>
					</div>
					<!-- Schedule E Line 4a line 2-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4.25mm;"/>
							<div class="styLNDesc" style="height:4mm;width:99mm;">
        (section 832(b)(7)(A)) and unearned premiums of section 833
            <span style="float:left"> organizations (see instructions)</span>
          <!--Dotted Line -->
							<div class="styDotLn" style="float:right;padding-right:1mm;">.............</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8.5mm;padding-top:4.5mm;">4a</div>
							<div class="styLNAmountBox" style="width:32mm;height:8.5mm;padding-top:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleE/CurrTYLifeInsuranceReservesAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:8.5mm;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="width:32mm;height:8.5mm;"/>
						</div>
					</div>
					<!-- Schedule E Line 4b-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4.25mm;">b</div>
							<div class="styLNDesc" style="height:4mm;width:99mm;font-size:6pt;">
          <span style="float:left">Enter 90% of unearned premiums attributable to insuring certain securities</span>
          <!--Dotted Line -->
			<div class="styDotLn" style="float:right;padding-right:1mm;">.....</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">4b</div>
							<div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleE/CurrTYUnearnedPremiumsPctAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;"/>
						</div>
					</div>
					<!-- Schedule E Line 4c-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4.25mm;">c</div>
							<div class="styLNDesc" style="height:4mm;width:99mm;">
         <span style="float:left"> Discounted unearned premiums attributable to title insurance</span>
          <!--Dotted Line -->
				<div class="styDotLn" style="float:right;padding-right:1mm;">.....</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">4c</div>
							<div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleE/CurrTYDiscountedUnrndPremAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;"/>
						</div>
					</div>
					<!-- Schedule E Line 4d-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4.25mm;">d</div>
							<div class="styLNDesc" style="height:4mm;width:99mm;">
         <span style="float:left"> Enter 80% of all other unearned premiums (see instructions)</span>
          <!--Dotted Line -->
					<div class="styDotLn" style="float:right;padding-right:1mm;">.....</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">4d</div>
							<div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleE/CurrTYOthUnearnedPremPctAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;"/>
						</div>
					</div>
					<!-- Schedule E Line 4e-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4.25mm;">e</div>
							<div class="styLNDesc" style="height:4mm;">
								<span style="float:left"> <b>Total.</b> Add lines 4a through 4d</span>
          <!--Dotted Line -->
		<div class="styDotLn" style="float:right;padding-right:1mm;">........................</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">4e</div>
							<div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleE/CurrTYUnearnedPremiumsAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule E Line 5-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">5</div>
							<div class="styLNDesc" style="height:4mm;">
          <span style="float:left"> Subtract line 4e from line 3</span>
          <!--Dotted Line -->
		<div class="styDotLn" style="float:right;padding-right:1mm;">........................</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">5</div>
							<div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleE/NetTotNetPremWrttnUnrndPremAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule E Line 6-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">6</div>
							<div class="styLNDesc" style="height:4mm;">
         <span style="float:left"> Transitional adjustments under section 832(b)(7)(D) (see instructions)</span>
          <!--Dotted Line -->
		<div class="styDotLn" style="float:right;padding-right:1mm;">..........</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">6</div>
							<div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleE/TrnstAdjUnderSect832b7DAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule E Line 7-->
					<div class="styBB" style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">7</div>
							<div class="styLNDesc" style="height:4mm;">
								<span style="float:left"><b>Premiums earned.</b> Add lines 5 and 6. Enter here and on Schedule A, line 1</span>
          <!--Dotted Line -->
						<div class="styDotLn" style="float:right;padding-right:1mm;">..........</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;">7</div>
							<div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleE/PremiumsEarnedAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- BEGIN Schedule F Title -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="width:23mm;border-bottom:1px solid black;">Schedule F</div>
						<div class="styPartDesc" style="width:164mm;border-top:1px solid black;">Losses Incurred?Section 832 
    <span class="styNormalText">(see instructions)</span>
						</div>
					</div>
					<!-- END Schedule F Title -->
					<!-- Schedule F Line 1-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">1</div>
							<div class="styLNDesc" style="height:4mm;">
         <span style="float:left"> Losses paid during the tax year (attach statement)
          <!-- Form to Form Link (Push Pin) -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleF/LossesPaidAmt"/>
								</xsl:call-template></span>
								<!--Dotted Line -->
	<div class="styDotLn" style="float:right;padding-right:1mm;">................</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">1</div>
							<div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleF/LossesPaidAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule F Line 2-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">2</div>
							<div class="styLNDesc" style="height:4mm;">
          Balance outstanding at the end of the current tax year for:
        </div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;"/>
						</div>
					</div>
					<!-- Schedule F Line 2a -->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4.25mm;">a</div>
							<div class="styLNDesc" style="height:4mm;width:99mm;">
          <span style="float:left">Unpaid losses on life insurance contracts</span>
          <!--Dotted Line -->
			<div class="styDotLn" style="float:right;padding-right:1mm;">..........</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">2a</div>
							<div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleF/CurrTYUnpaidLossesAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;"/>
						</div>
					</div>
					<!-- Schedule F Line 2b-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4.25mm;">b</div>
							<div class="styLNDesc" style="height:4mm;width:99mm;">
         <span style="float:left"> Discounted unpaid losses</span>
          <!--Dotted Line -->
			<div class="styDotLn" style="float:right;padding-right:1mm;">..............</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">2b</div>
							<div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleF/CurrTYDiscountedUnpaidLossAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;"/>
						</div>
					</div>
					<!-- Schedule F Line 2c-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4.25mm;">c</div>
							<div class="styLNDesc" style="height:4mm;">
								<span style="float:left"><b>Total.</b> Add lines 2a and 2b</span>
          <!--Dotted Line -->
				<div class="styDotLn" style="float:right;padding-right:1mm;">........................</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">2c</div>
							<div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleF/CurrTYTotalUnpaidLossesAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule F Line 3-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">3</div>
							<div class="styLNDesc" style="height:4mm;">
          <span style="float:left">Add lines 1 and 2c</span>
          <!--Dotted Line -->
			<div class="styDotLn" style="float:right;padding-right:1mm;">............................</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">3</div>
							<div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleF/TotalLossesAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule F Line 4-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">4</div>
							<div class="styLNDesc" style="height:4mm;">
          Balance outstanding at the end of the preceding tax year for:
        </div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;"/>
						</div>
					</div>
					<!-- Schedule F Line 4a -->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4.25mm;">a</div>
							<div class="styLNDesc" style="height:4mm;width:99mm;">
          <span style="float:left">Unpaid losses on life insurance contracts</span>
          <!--Dotted Line -->
				<div class="styDotLn" style="float:right;padding-right:1mm;">..........</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">4a</div>
							<div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleF/PriorTYUnpaidLossesAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;"/>
						</div>
					</div>
					<!-- Schedule F Line 4b-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4.25mm;">b</div>
							<div class="styLNDesc" style="height:4mm;width:99mm;">
          <span style="float:left">Discounted unpaid losses</span>
          <!--Dotted Line -->
		<div class="styDotLn" style="float:right;padding-right:1mm;">...............</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">4b</div>
							<div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleF/PriorTYDiscountedUnpaidLossAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;"/>
						</div>
					</div>
					<!-- Schedule F Line 4c-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4.25mm;">c</div>
							<div class="styLNDesc" style="height:4mm;">
								<span style="float:left"><b>Total.</b> Add lines 4a and 4b</span>
          <!--Dotted Line -->
				<div class="styDotLn" style="float:right;padding-right:1mm;">.........................</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">4c</div>
							<div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleF/PriorTYTotalUnpaidLossesAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule F Line 5-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">5</div>
							<div class="styLNDesc" style="height:4mm;">
          <span style="float:left">Subtract line 4c from line 3</span>
          <!--Dotted Line -->
			<div class="styDotLn" style="float:right;padding-right:1mm;">.........................</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">5</div>
							<div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleF/NetTotalLossesAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule F Line 6-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">6</div>
							<div class="styLNDesc" style="height:4mm;">
          <span style="float:left">Estimated salvage and reinsurance recoverable at the end of the preceding tax year</span>
          <!--Dotted Line -->
				<div class="styDotLn" style="float:right;padding-right:1mm;">.......</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">6</div>
							<div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleF/EstSalvageReinsEndPriorTYAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule F Line 7-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">7</div>
							<div class="styLNDesc" style="height:4mm;">
          <span style="float:left">Estimated salvage and reinsurance recoverable at the end of the current tax year</span>
          <!--Dotted Line -->
		<div class="styDotLn" style="float:right;padding-right:1mm;">.......</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">7</div>
							<div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleF/EstSalvageReinsEndCurrTYAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule F Line 8-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">8</div>
							<div class="styLNDesc" style="height:4mm;">
          <span style="float:left">Losses incurred (line 5 plus line 6 less line 7)</span>
          <!--Dotted Line -->
			<div class="styDotLn" style="float:right;padding-right:1mm;">...................</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">8</div>
							<div class="styLNAmountBox" style="width:32mm;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleF/LossesIncurredAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule F Line 9-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">9</div>
							<div class="styLNDesc" style="height:4mm;width:99mm;">
          <span style="float:left">Tax-exempt interest subject to section 832(b)(5)(B)</span>
          <!--Dotted Line -->
			<div class="styDotLn" style="float:right;padding-right:1mm;">......</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">9</div>
							<div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleF/TaxExemptIntSubjSect832b5BAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;"/>
						</div>
					</div>
					<!-- Schedule F Line 10 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:8mm;">10</div>
							<div class="styLNDesc" style="height:8mm;width:99mm;">
          Dividends-received deduction subject to section 832(b)(5)(B) (Schedule 
          <span style="float:left">C, line 24)</span>
          <!--Dotted Line -->
			<div class="styDotLn" style="float:right;padding-right:1mm;">.....................</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8.5mm;padding-top:4mm;">10</div>
							<div class="styLNAmountBox" style="width:32mm;height:8.5mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleF/DivRcvdDeductionSect832b5BAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:8.5mm;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="width:32mm;height:8.5mm;"/>
						</div>
					</div>
					<!-- Schedule F Line 11-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:8mm;">11</div>
							<div class="styLNDesc" style="height:8mm;width:99mm;">
          The increase in policy cash value of section 264(f) policies as defined in 
          <span style="float:left">section 805(a)(4)(F)</span>
          <!--Dotted Line -->
		<div class="styDotLn" style="float:right;padding-right:1mm;">................</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8.5mm;padding-top:4mm;">11</div>
							<div class="styLNAmountBox" style="width:32mm;height:8.5mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleF/IncrPolicyCashValueSect264fAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:8.5mm;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="width:32mm;height:8.5mm;"/>
						</div>
					</div>
					<!-- Schedule F Line 12-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;">12</div>
							<div class="styLNDesc" style="height:4mm;">
								<span style="float:left"><b>Total.</b> Add lines 9, 10, and 11</span>
          <!--Dotted Line -->
		<div class="styDotLn" style="float:right;padding-right:1mm;">.......................</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">12</div>
							<div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleF/TotalInterestDivPoliciesAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule F Line 13-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;">13</div>
							<div class="styLNDesc" style="height:4mm;">
          <span style="float:left">Reduction of deduction under section 832(b)(5)(B). Multiply line 12 by .15</span>
          <!--Dotted Line -->
		<div class="styDotLn" style="float:right;padding-right:1mm;">.........</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">13</div>
							<div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleF/ReductionOfDedSect832b5BAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule F Line 14-->
					<div class="styBB" style="width:187mm;border-bottom:2px solid black;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:8mm;">14</div>
							<div class="styLNDesc" style="height:8mm;">
								<b>Losses incurred deductible under section 832(c)(4).</b>  Subtract line 13 from line 8. Enter here and on
								 <span style="float:left">Schedule A, line 26</span>
          <!--Dotted Line -->
			<div class="styDotLn" style="float:right;padding-right:1mm;">...........................</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBoxNBB" style="height:8mm;padding-top:4mm;">14</div>
							<div class="styLNAmountBoxNBB" style="width:32mm;height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleF/LossesIncurdDedUndSect832c4Amt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Page Break and Footer for Page 5-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;float:none;">
						<div style="float:left;"/>
						<div style="float:right;">
							<span style="width:40px;"/>  
          Form <span class="styBoldText" style="font-size:8pt;">1120-PC</span> (2013)
     </div>
					</div>
					<!-- END Page Break and Footer for Page 5-->
					<!--Begin Page 6 -->
					<!-- Page 6 Header -->
					<div class="styBB" style="width:187mm;padding-top:.5mm;float:none;">
						<div style="float:left;">Form 1120-PC (2013)<span style="width:146mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">6</span>
						</div>
					</div>
					<!-- END Page 6 Header -->
					<!-- BEGIN Schedule G Title  -->
					<div class="styBB" style="width:187mm;height:auto;">
						<div class="styPartName" style="width:23mm;border-bottom:1px solid black;">Schedule G</div>
						<div class="styPartDesc" style="width:164mm;border-top:1px solid black;">Other Capital Losses 
      <span class="styNormalText">(see instructions)</span>
						</div>
						<div class="styPartDesc" style="height:4mm;font-weight:bold;padding-left:26mm;height:auto;">
      (Capital assets sold or exchanged to meet abnormal insurance losses and to pay dividends and similar
    distributions to policyholders.)
    </div>
					</div>
					<!-- END Schedule G Title  -->
					<!-- Schedule G Line 1-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">1</div>
							<div class="styLNDesc" style="height:4mm;">
          <span style="float:left">Dividends and similar distributions paid to policyholders</span>
          <!--Dotted Line -->
			<div class="styDotLn" style="float:right;padding-right:1mm;">...............</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">1</div>
							<div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleG/DividendsAndSimilarDistriPdAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule G Line 2-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">2</div>
							<div class="styLNDesc" style="height:4mm;">
          <span style="float:left">Losses paid</span>
          <!--Dotted Line -->
			<div class="styDotLn" style="float:right;padding-right:1mm;">.............................</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">2</div>
							<div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleG/LossesPaidAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule G Line 3-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">3</div>
							<div class="styLNDesc" style="height:4mm;">
          <span style="float:left">Expenses paid</span>
          <!--Dotted Line -->
		<div class="styDotLn" style="float:right;padding-right:1mm;">.............................</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">3</div>
							<div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleG/ExpensesPaidAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule G Line 4-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">4</div>
							<div class="styLNDesc" style="height:4mm;">
          <span style="float:left">Total. Add lines 1, 2, and 3</span>
          <!--Dotted Line -->
				<div class="styDotLn" style="float:right;padding-right:1mm;">.........................</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">4</div>
							<div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleG/TotalDistributionPaidAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule G Line 4 NOTE-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;"/>
							<div class="styLNDesc" style="height:4mm;">
								<b>Note. Adjust lines 5 through 8 to cash method if necessary.</b>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;;"/>
						</div>
					</div>
					<!-- Schedule G Line 5 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">5</div>
							<div class="styLNDesc" style="height:4mm;width:99mm;">
          <span style="float:left">Interest received</span>
          <!--Dotted Line -->
		<div class="styDotLn" style="float:right;padding-right:1mm;">.................</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">5</div>
							<div class="styLNAmountBox" style="width:32mm;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleG/InterestReceivedAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;"/>
						</div>
					</div>
					<!-- Schedule G Line 6-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">6</div>
							<div class="styLNDesc" style="height:4mm;width:99mm;">
          <span style="float:left">Dividends-received (Schedule C, line 14)</span>
          <!--Dotted Line -->
		<div class="styDotLn" style="float:right;padding-right:1mm;">...........</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">6</div>
							<div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleG/TotalDividendsReceivedAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;"/>
						</div>
					</div>
					<!-- Schedule G Line 7-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:12mm;padding-left:2.25mm;">7</div>
							<div class="styLNDesc" style="height:12mm;width:99mm;">
          Gross rents, gross royalties, lease income, etc., and gross income from a trade
      or business other than an insurance business including income from 
          <span style="float:left">Form 4797 (include gains for invested assets only)</span>
          <!--Dotted Line -->
			<div class="styDotLn" style="float:right;padding-right:1mm;">......</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:12.5mm;padding-top:8mm;">7</div>
							<div class="styLNAmountBox" style="width:32mm;height:12.5mm;padding-top:8mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleG/GrossIncomeFromTradeOrBusAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:12.5mm;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="width:32mm;height:12.5mm;"/>
						</div>
					</div>
					<!-- Schedule G Line 8-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">8</div>
							<div class="styLNDesc" style="height:4mm;width:99mm;">
          <span style="float:left">Net premiums received</span>
          <!--Dotted Line -->
			<div class="styDotLn" style="float:right;padding-right:1mm;">................</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">8</div>
							<div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleG/NetPremiumsReceivedAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;"/>
						</div>
					</div>
					<!-- Schedule G Line 9-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">9</div>
							<div class="styLNDesc" style="height:4mm;">
								<span style="float:left"><b>Total.</b> Add lines 5 through 8</span>
          <!--Dotted Line -->
		<div class="styDotLn" style="float:right;padding-right:1mm;">........................</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">9</div>
							<div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleG/TotalIncomeReceivedAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule G Line 10-->
					<div class="styBB" style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;">10</div>
							<div class="styLNDesc" style="height:4mm;">
          <span style="float:left">Limitation on gross receipts from sales of capital assets. Line 4 less line 9. If zero or less, enter -0-</span>
          <!--Dotted Line -->
								<div class="styDotLn" style="float:right;padding-right:1mm;">..</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;">10</div>
							<div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleG/GrossReceiptsLimitationAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule G Line 11 Table Begin-->
					<div class="styBB" style="width:187mm;">
						<!--Schedule G, Other Capital Losses Table (OCLT) and Toggle Button set begin -->
						<div style="width:7mm;text-align:right;float:right;clear:none;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleG/CapitalAssetDetail"/>
								<xsl:with-param name="containerHeight" select="6"/>
								<xsl:with-param name="header-height" select="4"/>
								<xsl:with-param name="containerID" select=" 'OCLT' "/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN OCLT TABLE   -->
					<!-- Begin Column table heading A, B, C, D, E, F, G -->
					<div class="styTableContainer" id="OCLT" style="width:187mm;">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0">
							<thead class="styTableThead" style="border-color: black; font-size: 7pt;">
								<tr>
									<th class="styTableCellHeader" style="width:42mm;" rowspan="2" colspan="2" scope="col">
                    (a) <span class="styNormalText" style="display:inline;">Description of capital <br/>asset</span>
									</th>
									<th class="styTableCellHeader" style="width:15mm;" rowspan="2" scope="col">
                    (b) <span class="styNormalText" style="display:inline;">Date<br/>acquired</span>
									</th>
									<th class="styTableCellHeader" style="width: 26mm;" scope="col">(c) <span class="styNormalText" style="display:inline;">Gross<br/>sales price</span>
									</th>
									<th class="styTableCellHeader" style="width: 26mm;" scope="col">(d) <span class="styNormalText" style="display:inline;">Cost or <br/>other basis</span>
									</th>
									<th class="styTableCellHeader" style="width: 26mm;" scope="col">(e) <span class="styNormalText" style="display:inline;">Expense<br/>of sale</span>
									</th>
									<th class="styTableCellHeader" style="width: 26mm;" scope="col">(f) <span class="styNormalText" style="display:inline;">Depreciation allowed <br/>(or allowable)</span>
									</th>
									<th class="styTableCellHeader" style="width: 26mm;border-right-width: 0px;" scope="col">(g) <span class="styNormalText" style="display:inline;">Loss<br/>((d) plus (e) less <br/>the sum of (c) and (f))</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
							<!-- start here I -->
								<!--Table repeating row begin -->
								<xsl:for-each select="$Form1120PCData//IRS1120PCScheduleG/CapitalAssetDetail">
									<xsl:if test="($Print != $Separated) or (count($Form1120PCData//IRS1120PCScheduleG/CapitalAssetDetail) &lt;=6)">
										<tr style="height:4mm;">
											<td class="styTableCell" valign="top" style="border-color: black; width: 4mm;text-align:center;border-right-width:0px;">
												<span class="styBoldText">11
                <!--<xsl:number value="position()"/>-->
												</span>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color: black;width: 38mm; text-align: left;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AssetDesc/BusinessNameLine1"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="GroupMemberNamePartII/BusinessNameLine2"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="GroupMemberEIN"/>
												</xsl:call-template>
												<xsl:if test="$Form1120PCData//IRS1120PCScheduleG/CapitalAssetDetail/EINMissingReason!=' '">
													<span style="font-weight:normal;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form1120PCData//IRS1120PCScheduleG/CapitalAssetDetail/EINMissingReason"/>
														</xsl:call-template>
													</span>
												</xsl:if>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AssetDesc"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color: black; width: 15mm;text-align:center; ">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="AcquiredDt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color: black; width: 26mm;  text-align: right;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GrossSalesPriceAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color: black;  width: 26mm; text-align: right;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color: black;  width: 26mm; text-align: right;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="SaleExpenseAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color: black;  width: 26mm; text-align: right;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DepreciationAllowedAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color: black; width: 26mm; text-align: right;border-right-width: 0px; ">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="LossAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
								<!-- Schedule G Table repeating blank row begin -->
								<xsl:if test="count($Form1120PCData/IRS1120PCScheduleG/CapitalAssetDetail) &lt; 1 or ((count($Form1120PCData/IRS1120PCScheduleG/CapitalAssetDetail) &gt;6) and ($Print = $Separated))">
									<tr style="height:4mm;">
										<td class="styTableCell" valign="top" style="border-color: black; width: 8mm;text-align:center; border-right-width:0px;">
											<span class="styBoldText">11</span>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="border-color: black;width: 34mm; text-align: left;">
											<xsl:if test="((count($Form1120PCData/IRS1120PCScheduleG/CapitalAssetDetail) &gt;6) and ($Print = $Separated))">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleG/CapitalAssetDetail"/>
												</xsl:call-template>
											</xsl:if>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="border-color: black; width: 15mm; text-align: left; ">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="border-color: black; width: 26mm;  text-align: center;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="border-color: black; width: 26mm; text-align: center;border-right-width: 0px; ">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1120PCData/IRS1120PCScheduleG/CapitalAssetDetail) &lt; 2 or ((count($Form1120PCData/IRS1120PCScheduleG/CapitalAssetDetail) &gt;6) and ($Print = $Separated))">
									<tr style="height:4mm;">
										<td class="styTableCell" valign="top" style="border-color: black; width: 4mm;text-align:center; border-right-width:0px;">
											<!--<span class="styBoldText">2</span>-->
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="border-color: black;width: 38mm; text-align: left;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="border-color: black; width: 15mm; text-align: left; ">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="border-color: black; width: 26mm;  text-align: center;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="border-color: black; width: 26mm; text-align: center;border-right-width: 0px; ">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1120PCData/IRS1120PCScheduleG/CapitalAssetDetail) &lt; 3 or ((count($Form1120PCData/IRS1120PCScheduleG/CapitalAssetDetail) &gt;6) and ($Print = $Separated))">
									<tr style="height:4mm;">
										<td class="styTableCell" valign="top" style="border-color: black; width: 4mm;text-align:center;border-right-width:0px;">
											<!--<span class="styBoldText">3</span>-->
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="border-color: black;width: 38mm; text-align: left;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="border-color: black; width: 15mm; text-align: left; ">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="border-color: black; width: 26mm;  text-align: center;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="border-color: black; width: 26mm; text-align: center;border-right-width: 0px; ">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1120PCData/IRS1120PCScheduleG/CapitalAssetDetail) &lt; 4 or ((count($Form1120PCData/IRS1120PCScheduleG/CapitalAssetDetail) &gt;6) and ($Print = $Separated))">
									<tr style="height:4mm;">
										<td class="styTableCell" valign="top" style="border-color: black; width: 4mm;text-align:center; border-right-width:0px;">
											<!--<span class="styBoldText">4</span>-->
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="border-color: black;width: 38mm; text-align: left;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="border-color: black; width: 15mm; text-align: left; ">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="border-color: black; width: 26mm;  text-align: center;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="border-color: black; width: 26mm; text-align: center;border-right-width: 0px; ">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1120PCData/IRS1120PCScheduleG/CapitalAssetDetail) &lt; 5 or ((count($Form1120PCData/IRS1120PCScheduleG/CapitalAssetDetail) &gt;6) and ($Print = $Separated))">
									<tr style="height:4mm;">
										<td class="styTableCell" valign="top" style="border-color: black; width: 4mm;text-align:center; border-right-width:0px;">
											<!--<span class="styBoldText">5</span>-->
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="border-color: black;width: 38mm; text-align: left;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="border-color: black; width: 15mm; text-align: left; ">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="border-color: black; width: 26mm;  text-align: center;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="border-color: black; width: 26mm; text-align: center;border-right-width: 0px; ">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1120PCData/IRS1120PCScheduleG/CapitalAssetDetail) &lt; 6 or ((count($Form1120PCData/IRS1120PCScheduleG/CapitalAssetDetail) &gt;6) and ($Print = $Separated))">
									<tr style="height:4mm;">
										<td class="styTableCell" valign="top" style="border-color: black; width: 4mm;text-align:center; border-right-width:0px;">
											<!--<span class="styBoldText">6</span>-->
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="border-color: black;width: 38mm; text-align: left;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="border-color: black; width: 15mm; text-align: left; ">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="border-color: black; width: 26mm;  text-align: center;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="border-color: black; width: 26mm; text-align: center;border-right-width: 0px; ">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Part II Table initiate Toggle Button Begin -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleG/CapitalAssetDetail"/>
						<xsl:with-param name="containerHeight" select="6"/>
						<xsl:with-param name="header-height" select="4"/>
						<xsl:with-param name="containerID" select=" 'OCLT' "/>
					</xsl:call-template>
					<!--   END Part II TABLE   -->
					<!-- Schedule G Line 12-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:17mm;">12</div>
							<div class="styLNDesc" style="width:50.5mm;height:17mm;">
          Totals&#8212;column (c) must not be more than line 10. (Enter amount from
      column (g) in Schedule A, line 28, or Schedule B, line 15, whichever applies)
        <!--Dotted Line -->
								<span class="styBoldText">
							<!-- 		<span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
             <span style="width:16px"></span>.
              <span style="width:16px"></span>.-->
								</span>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNAmountBoxNBB" style="width:24.5mm;height:17mm;font-size:6pt;padding-top:14mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleG/TotalGrossSalesPriceAmt"/>
								</xsl:call-template>
							</div>
							<!--<div style="float:right;clear:none;">-->
							<div class="styLNAmountBoxNBB" style="width:75mm;height:17mm;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="width:29mm;height:17mm;font-size:6pt;padding-top:14mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleG/TotalLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- BEGIN Schedule H Title  -->
					<div class="styBB" style="width:187mm;border-top:1px solid black;">
						<div class="styPartName" style="width:23mm;border-bottom:1px solid black;">Schedule H</div>
						<div class="styPartDesc" style="width:164mm;border-top:1px solid black;">Special Deduction And Ending
						 Adjusted Surplus for Section 833 Organizations 
                     <div class="styNormalText">(see instructions)</div>
						</div>
					</div>
					<!-- END Schedule H Title -->
					<!-- Schedule H Line 1-->
					<!--Schdule H Line 1-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:8mm;padding-left:4mm;">1</div>
							<div class="styLNDesc" style="height:8mm;">
          Health care claims incurred during the tax year and liabilities incurred during the tax year under cost
             <span style="float:left"> -plus contracts</span>
          <!--Dotted Line -->
<div class="styDotLn" style="float:right;padding-right:1mm;">...........................</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8.5mm;padding-top:4mm;">1</div>
							<div class="styLNAmountBox" style="width:32mm;height:8.5mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleH/HealthCareClaimsAndLiabAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule H Line 2-->
					<div style="width:187mm;">
						<div style=" float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:8mm;padding-left:4mm;">2</div>
							<div class="styLNDesc" style="height:8mm;">
          Expenses incurred during the tax year in connection with the administration, adjustment, or 
           <span style="float:left">settlement of health care claims or in connection with the administration of cost-plus contracts</span>
          <!--Dotted Line -->
					<div class="styDotLn" style="float:right;padding-right:1mm;">...</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:8.5mm;padding-top:4mm;">2</div>
							<div class="styLNAmountBox" style="width:32mm;height:8.5mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleH/ExpensesIncurredAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule H Line 3-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">3</div>
							<div class="styLNDesc" style="height:4mm;">
								<span style="float:left"><b>Total.</b> Add lines 1 and 2</span>
          <!--Dotted Line -->
						<div class="styDotLn" style="float:right;padding-right:1mm;">..........................</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">3</div>
							<div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleH/TotalClaimsLiabExpensesAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule H Line 4-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">4</div>
							<div class="styLNDesc" style="height:4mm;">
          <span style="float:left">Multiply line 3 by .25</span>
          <!--Dotted Line -->
								<div class="styDotLn" style="float:right;padding-right:1mm;">...........................</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4mm;">4</div>
							<div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleH/TotalClaimsLiabExpensesPctAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule H Line 5-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">5</div>
							<div class="styLNDesc" style="height:4mm;">
          <span style="float:left">Beginning adjusted surplus</span>
          <!--Dotted Line -->
							<div class="styDotLn" style="float:right;padding-right:1mm;">........................</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">5</div>
							<div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleH/BeginningAdjustedSurplusAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule H Line 6-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:8mm;padding-left:4mm;">6</div>
							<div class="styLNDesc" style="height:8mm;">
								<b>Special deduction.</b> If you checked "No" on line 14 of Schedule I, enter -0- here, you cannot take the special deduction.  All others subtract line 5 from line 4. If zero or less, enter -0-. Enter amount here and 
								<span style="float:left">on Schedule A, line 34a. (See instructions for limitation.)</span>
          <!--Dotted Line -->
							<div class="styDotLn" style="float:right;padding-right:1mm;">...............</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:10.5mm;padding-top:6mm;">6</div>
							<div class="styLNAmountBox" style="width:32mm;height:10.5mm;padding-top:6mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleH/SpecialDeductionSect833OrgAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule H Line 7-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:4mm;">7</div>
							<div class="styLNDesc" style="height:4mm;">
          <span style="float:left">Net operating loss deduction (Schedule A, line 36b)</span>
          <!--Dotted Line -->
								<div class="styDotLn" style="float:right;padding-right:1mm;">..................</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">7</div>
							<div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleH/NetOperatingLossDeductionAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule H Line 8-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:4mm;">8</div>
							<div class="styLNDesc" style="height:4mm;">
          Net exempt income:
        </div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;"/>
						</div>
					</div>
					<!-- Schedule H Line 8a-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:5mm;">a</div>
							<div class="styLNDesc" style="height:4mm;">
          <span style="float:left">Adjusted tax-exempt income</span>
          <!--Dotted Line -->
						<div class="styDotLn" style="float:right;padding-right:1mm;">........................</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">8a</div>
							<div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleH/AdjustedTaxExemptIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule H Line 8b-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:5mm;">b</div>
							<div class="styLNDesc" style="height:4mm;">
          <span style="float:left">Adjusted dividends-received deduction</span>
          <!--Dotted Line -->
							<div class="styDotLn" style="float:right;padding-right:1mm;">.....................</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">8b</div>
							<div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleH/AdjustedDividendsRcvdDedAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule H Line 9-->
					<div style="width:187mm;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:4mm;">9</div>
							<div class="styLNDesc" style="height:4mm;">
         <span style="float:left"> Taxable income (Schedule A, line 37)</span>
          <!--Dotted Line -->
								<div class="styDotLn" style="float:right;padding-right:1mm;">......................</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBox" style="height:4.5mm;">9</div>
							<div class="styLNAmountBox" style="width:32mm;height:4.5mm;;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleH/TaxableIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Schedule H Line 10-->
					<div class="styBB" style="width:187mm;border-bottom:2px solid black;">
						<div style="float:left;clear:none:">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.25mm;">10</div>
							<div class="styLNDesc" style="height:4mm;">
								<span style="float:left"><b>Ending adjusted surplus.</b> Add lines 5 through 9</span>
          <!--Dotted Line -->
							<div class="styDotLn" style="float:right;padding-right:1mm;">..................</div>
							</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;">10</div>
							<div class="styLNAmountBoxNBB" style="width:32mm;height:4.5mm;;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleH/EndingAdjustedSurplusAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Page Break and Footer for Page 6-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;float:none;">
						<div style="float:left;"/>
						<div style="float:right;">
							<span style="width:40px;"/>  
          Form <span class="styBoldText" style="font-size:8pt;">1120-PC</span> (2013)
     </div>
					</div>
					<!-- END Page Break and Footer for Page 6-->
					<!--Begin Page 7 -->
					<!-- Page 7 Header -->
					<div class="styBB" style="width:187mm;padding-top:.5mm;float:none;">
						<div style="float:left;">Form 1120-PC (2013)<span style="width:146mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">7</span>
						</div>
					</div>
					<!-- END Page 7 Header -->
					<!-- BEGIN Schedule I Title -->
					<div class="styBB" style="width:187mm;border-top:1px solid black;">
						<div class="styPartName" style="width:23mm;">Schedule I</div>
						<div class="styPartDesc" style="width:164mm;">
       Other Information  <span class="styNormalText">(see instructions)</span>
						</div>
					</div>
					<!--br style="page-break-after:always;"/-->
					<!-- BEGIN Line Items -->
					<table class="styTable" style="width:187mm;clear:both;float:none;">
						<tr>
							<!--BEGIN Schedule I Left Side-->
							<td class="styGenericDiv" style="width:93mm;">
								<div class="styGenericDiv" style="width:93mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm;">1</div>
									<div class="styLNDesc" style="width:72mm;height:4.5mm;">Check method of accounting:</div>
									<div class="styIRS1120PCLNYesNoBox">Yes</div>
									<div class="styIRS1120PCLNYesNoBoxRB">No</div>
								</div>
								<!-- line 1 a, b, and c -->
								<div class="styGenericDiv" style="width:93mm;">
									<div class="styLNLeftLtrBox" style="height:4.5mm;"/>
									<div class="styLNDesc" style="width:42mm;height:4.5mm;">
										<span class="styBoldText">a</span>
										<span style="width:3px;"/>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/MethodOfAccountingCashInd"/>
												<xsl:with-param name="BackupName">IRS1120PCScheduleIMethodOfAccountingCash</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/MethodOfAccountingCashInd"/>
												<xsl:with-param name="BackupName">IRS1120PCScheduleIMethodOfAccountingCash</xsl:with-param>
											</xsl:call-template>
            Cash
          </label>
										<span style="width:6px;"/>
									</div>
									<div class="styIRS1120PCBBText" style="width:30mm;border-bottom:none;"/>
									<div class="styGenericDiv" style="width:.4mm;"/>
									<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
									<div class="styShadingCellRB" style="width:6mm;height:4.5mm;"/>
								</div>
								<div class="styGenericDiv" style="width:93mm;">
									<div class="styLNLeftLtrBox" style="height:4.5mm;"/>
									<div class="styLNDesc" style="width:42mm;height:4.5mm;">
										<span class="styBoldText">b</span>
										<span style="width:3px;"/>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/MethodOfAccountingAccrualInd"/>
												<xsl:with-param name="BackupName">IRS1120PCScheduleIMethodOfAccountingAccrual</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/MethodOfAccountingAccrualInd"/>
												<xsl:with-param name="BackupName">IRS1120PCScheduleIMethodOfAccountingAccrual</xsl:with-param>
											</xsl:call-template>
            Accrual
          </label>
										<span style="width:6px;"/>
									</div>
									<div class="styIRS1120PCBBText" style="width:30mm;border-bottom:none;"/>
									<div class="styGenericDiv" style="width:.4mm;"/>
									<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
									<div class="styShadingCellRB" style="width:6mm;height:4.5mm;"/>
								</div>
								<div class="styGenericDiv" style="width:93mm;">
									<div class="styLNLeftLtrBox" style="height:4.5mm;"/>
									<div class="styLNDesc" style="width:272px;height:4.5mm;background-color:none;">
										<span class="styBoldText">c</span>
										<span style="width:3px;"/>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/MethodOfAccountingOtherInd"/>
												<xsl:with-param name="BackupName">IRS1120PCScheduleIMethodOfAccountingOther</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/MethodOfAccountingOtherInd"/>
												<xsl:with-param name="BackupName">IRS1120PCScheduleIMethodOfAccountingOther</xsl:with-param>
											</xsl:call-template>
            Other (specify)
          </label>
										<span style="width:40mm;background-color:none;">
											<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
											<span style="width:3px;"/>
											<span style="width:30mm;font-size:6pt;border-bottom:1px solid black;background-color:none;">
												<span style="width:1mm;"/>
												<!--EXCEPTION: the value of this pen and ink image will not be display at the Additional data section becz the text is being display on the line inside the form -->
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/MethodOfAccountingOtherInd/@methodOfAccountingOtherDesc"/>
												</xsl:call-template>
											</span>
										</span>
									</div>
									<!-- <div class="styIRS1120PCBBText" style="width:29.3mm;border-bottom:none;"/> -->
									<div class="styGenericDiv" style="width:.4mm;"/>
									<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
									<div class="styShadingCellRB" style="width:6mm;height:4.5mm;"/>
								</div>
								<div class="styGenericDiv" style="width:93mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm;">2</div>
									<div class="styLNDesc" style="width:72mm;height:4.5mm;">Check box for kind of company:</div>
									<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
									<div class="styShadingCellRB" style="width:6mm;height:4.5mm;"/>
								</div>
								<!-- line 2 a and b -->
								<div class="styGenericDiv" style="width:93mm;">
									<div class="styLNLeftLtrBox" style="height:4.5mm;"/>
									<div class="styLNDesc" style="width:42mm;height:4.5mm;">
										<span class="styBoldText">a</span>
										<span style="width:3px;"/>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/MutualCompanyInd"/>
												<xsl:with-param name="BackupName">IRS1120PCScheduleIMutualCompany</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/MutualCompanyInd"/>
												<xsl:with-param name="BackupName">IRS1120PCScheduleIMutualCompany</xsl:with-param>
											</xsl:call-template>
            Mutual
          </label>
										<span style="width:6px;"/>
									</div>
									<div class="styIRS1120PCBBText" style="width:30mm;border-bottom:none;"/>
									<div class="styGenericDiv" style="width:.4mm;"/>
									<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
									<div class="styShadingCellRB" style="width:6mm;height:4.5mm;"/>
								</div>
								<div class="styGenericDiv" style="width:93mm;">
									<div class="styLNLeftLtrBox" style="height:4.5mm;"/>
									<div class="styLNDesc" style="width:42mm;height:4.5mm;">
										<span class="styBoldText">b</span>
										<span style="width:3px;"/>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/StockCompanyInd"/>
												<xsl:with-param name="BackupName">IRS1120PCScheduleIStockCompany</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/StockCompanyInd"/>
												<xsl:with-param name="BackupName">IRS1120PCScheduleIStockCompany</xsl:with-param>
											</xsl:call-template>
            Stock
          </label>
										<span style="width:6px;"/>
									</div>
									<div class="styIRS1120PCBBText" style="width:30mm;border-bottom:none;"/>
									<div class="styGenericDiv" style="width:.4mm;"/>
									<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
									<div class="styShadingCellRB" style="width:6mm;height:4.5mm;"/>
								</div>
								<!-- Sch I line 3 -->
								<div class="styGenericDiv" style="width:93mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm;">3</div>
									<div class="styLNDesc" style="width:72mm;height:15mm;">
										<span class="stySmallText">At the end of the tax year, did the corporation own,
directly or indirectly, 50% or more of the voting stock of a domestic corporation? (For rules of attribution, see section 267(c).)
          <span class="styBoldText">
												<!--	<span style="width:16px"/>.
												<span style="width:16px"/>.-->
											</span>
											<br/>
											
											If "Yes," attach a statement showing:
  <!--Form to Form Link -->
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/Own50PctOrMoreVotingStkDomInd"/>
											</xsl:call-template>
											<div style="width:60mm">
												<b>(a)</b> name and employer identification number (EIN);</div>
											<b>(b)</b> percentage owned; and <b>(c)</b> taxable income or
                                                             (loss) before NOL and special deductions of such
                                                             corporation for the tax year ending with or within
                                                             your tax year.
                                               </span>
									</div>
									<div class="styShadingCell" style="width:6mm;height:6mm;"/>
									<div class="styShadingCell" style="width:6mm;height:6mm;border-right-width:1px"/>
									<div class="styIRS1120PCLNYesNoBox" style="height:3mm;">
										<span style="font-weight:normal;">
											<xsl:call-template name="PopulateYesBoxText">
												<xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/Own50PctOrMoreVotingStkDomInd"/>
											</xsl:call-template>
										</span>
									</div>
									<div class="styIRS1120PCLNYesNoBoxRB" style="height:3mm;">
										<span style="font-weight:normal;">
											<xsl:call-template name="PopulateNoBoxText">
												<xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/Own50PctOrMoreVotingStkDomInd"/>
											</xsl:call-template>
										</span>
									</div>
									<div class="styShadingCell" style="width:6mm;height:13mm;"/>
									<div class="styShadingCell" style="width:6mm;height:13mm;border-right-width:1px"/>
								</div>
								<!-- Line 4 -->
								<div class="styGenericDiv" style="width:93mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm;">4</div>
									<div class="styLNDesc" style="width:72mm;height:9mm;padding-bottom:0px;padding-top:0px;">
        Is the corporation a subsidiary in an affiliated group or a parent-subsidiary controlled group? 
          <span class="styBoldText">
											<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
             <span style="width:16px"/>.
             <span style="width:16px"/>.
              <span style="width:16px"/>.
             <span style="width:16px"/>.
       </span>
										
          If "Yes," enter name and EIN of the parent corporation
          <span style="width:70mm;background-color:none;">
											<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
											<span style="width:3px;"/>
											<span style="width:67mm;font-size:6pt;border-bottom:1px solid black;background-color:none;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/ParentCorporationName/BusinessNameLine1"/>
												</xsl:call-template>
											</span>
											<span style="width:70mm;font-size:6pt;border-bottom:1px solid black;background-color:none;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/ParentCorporationName/BusinessNameLine2"/>
												</xsl:call-template>
											</span>
											<span style="width:70mm;font-size:6pt;border-bottom:1px solid black;background-color:none;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/PrntCorporationNameControlTxt"/>
												</xsl:call-template>
												<span style="width: 5px"/>
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/ParentCorporationEIN"/>
												</xsl:call-template>
												<span style="width: 5px"/>
												<!--</xsl:if>-->
												<xsl:if test="$Form1120PCData/MissingEINReasonCd !=' '">
													<span style="font-weight:normal;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/MissingEINReasonCd"/>
														</xsl:call-template>
													</span>
												</xsl:if>
					
											</span>
										</span>
									</div>
									<!--div class="styGenericDiv"-->
										<div class="styShadingCell" style="width:6mm;height:1mm;"/>
										<div class="styShadingCellRB" style="width:6mm;height:1mm;"/>
										<div class="styIRS1120PCLNYesNoBox" style="height:3mm;">
											<span style="font-weight:normal;">
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/ControlledGroupMemberInd"/>
												</xsl:call-template>
											</span>
										</div>
										<div class="styIRS1120PCLNYesNoBoxRB" style="height:3mm;">
											<span style="font-weight:normal;">
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/ControlledGroupMemberInd"/>
												</xsl:call-template>
											</span>
										</div>
										<div class="styShadingCell" style="width:6mm;height:18mm;"/>
										<div class="styShadingCellRB" style="width:6mm;height:18mm;"/>
									<!--/div-->
								</div>
								<!-- Line 5 -->
								<div class="styGenericDiv" style="width:93mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:0mm;padding-bottom:0mm;">5</div>
									<div class="styLNDesc" style="width:72mm;padding-top:0mm;padding-bottom:0mm;height:10mm;">
										<span class="stySmallText">
       At the end of the tax year, did any individual, partnership, corporation, estate, or trust own, directly or indirectly, 50% or more of the corporation’s voting
                         <span style="float:left"> stock? (For rules of attribution, see section 267(c).)
          <xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/Own50PercentOrMoreVotingStkInd"/>
											</xsl:call-template></span>
							<div class="styDotLn" style="float:right;padding-right:1mm;">..</div>
										</span>
									</div>
									<!--div class="styLNDesc" style="width:24mm;"-->
										<div class="styShadingCell" style="width:6mm;height:8mm;"/>
										<div class="styShadingCellRB" style="width:6mm;height:8mm;"/>
										<div class="styIRS1120PCLNYesNoBox">
											<span style="font-weight:normal;">
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/Own50PercentOrMoreVotingStkInd"/>
												</xsl:call-template>
											</span>
										</div>
										<div class="styIRS1120PCLNYesNoBoxRB">
											<span style="font-weight:normal;">
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/Own50PercentOrMoreVotingStkInd"/>
												</xsl:call-template>
											</span>
										</div>
									<!--/div-->
								</div>
								<!-- line 5 sub -->
								<div class="styGenericDiv" style="width:93mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:0mm;padding-bottom:0mm;"/>
									<div class="styLNDesc" style="width:72mm;padding-top:0mm;padding-bottom:0mm;">
										<span class="stySmallText">
											If "Yes," attach a statement showing name and identifying number. (Do not include any information already entered in <b>4</b> above.)
											 <br/>
											<span style="width:70mm;background-color:none;">
      Enter percentage owned          
      <span style="width:1mm;background-color:none;"/>
												<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
												<span style="width:3px;background-color:none;"/>
												<span style="width:28mm;font-size:6pt;border-bottom:1px solid black;background-color:none;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/VotingStockOwnedPct"/>
													</xsl:call-template>
												</span>
											</span>
										</span>
									</div>
									<div class="styShadingCell" style="width:6mm;height:14mm;"/>
									<div class="styShadingCellRB" style="width:6mm;height:14mm;"/>
								</div>
								<!-- Line 6 -->
								<div class="styGenericDiv" style="width:93mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:0mm;padding-bottom:0mm;">6</div>
									<div class="styLNDesc" style="width:72mm;padding-top:0mm;padding-bottom:0mm;height:12mm;">
                             At any time during the tax year, did one foreign  person own, directly or indirectly, at least 25% of:
                              <b>(a)</b> the total voting power of all classes of stock of  the corporation entitled to vote, or <b>(b)</b> the total value
                            <span style="float:left">of all classes of stock of the corporation? If "Yes,"  enter:</span>  
                            <div class="styDotLn" style="float:right;padding-right:1mm;">...</div>
									</div>
									<!--div class="styGenericDiv"-->
										<div class="styShadingCell" style="width:6mm;height:10.5mm;"/>
										<div class="styShadingCellRB" style="width:6mm;height:10.5mm;"/>
										<div class="styIRS1120PCLNYesNoBox">
											<span style="font-weight:normal;">
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/FrgnOwn25PctTotVotingPowerInd"/>
												</xsl:call-template>
											</span>
										</div>
										<div class="styIRS1120PCLNYesNoBoxRB">
											<span style="font-weight:normal;">
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/FrgnOwn25PctTotVotingPowerInd"/>
												</xsl:call-template>
											</span>
										</div>
									<!--/div-->
								</div>
								<!-- Line 6 sub 1 -->
								<div class="styGenericDiv" style="width:93mm;">
									<div class="styLNLeftLtrBox" style="height:4.5mm;"/>
									<div class="styLNDesc" style="width:72mm;height:4.5mm;">
										<b>(a)</b> Percentage owned
          <span style="width:3px;"/>
										<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
										<span style="width:6px;"/>
										<span style="width:15mm;border-bottom:1px solid black;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/VotingStockForeignOwnedPct"/>
											</xsl:call-template>
										</span> and <b>(b)</b> Owner's<br/>
          country
        <span style="width:3px;"/>
										<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
										<span style="width:6px;"/>
										<span style="width:50mm;border-bottom:1px solid black;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/ForeignOwnStockCountryCd"/>
											</xsl:call-template>
										</span>
									</div>
									<div class="styShadingCell" style="width:6mm;height:7.5mm;border-bottom-width:1px;"/>
									<div class="styShadingCell" style="width:6mm;height:7.5mm;border-bottom-width:1px;;border-right-width:1px;"/>
								</div>
							</td>
							<!--END Schedule M Left Side-->
							<!--BEGIN Schedule M Right Side-->
							<!--Line 6c -->
							<td class="styGenericDiv" style="width:93mm;vertical-align:top;float:none;">
								<div class="styGenericDiv" style="width:93mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm;"/>
									<div class="styLNDesc" style="width:72mm;height:4.5mm;height:16mm;">
										<br/>
										<br/>
										<b>(c)</b> The corporation may have to file <b>Form 5472,</b>
    Information Return of a 25% Foreign-Owned U.S.
    Corporation or a Foreign Corporation Engaged in
    a U.S. Trade or Business. Enter number of Forms
    5472 attached
      <!--Dotted Line-->
										<span style="width:3px;"/>
										<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
										<span style="width:6px;"/>
										<span style="width:40mm;border-bottom:1px solid black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/TotalForm5472FiledCnt"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/TotalForm5472FiledCnt"/>
										</xsl:call-template>
									</div>
									<!--div class="styGenericDiv"-->
										<div class="styIRS1120PCLNYesNoBox">Yes</div>
										<div class="styIRS1120PCLNYesNoBox">No</div>
										<div class="styShadingCell" style="width:6mm;height:14mm;"/>
										<div class="styShadingCell" style="width:6mm;height:14mm;"/>
									<!--/div-->
								</div>
								<!-- line 7 -->
								<div class="styGenericDiv" style="width:93mm;float:right;clear:none;">
									<div class="styLNLeftNumBoxSD" style="height:4.5mm;padding-top:2mm;padding-bottom:0mm;">7</div>
									<div class="styLNDesc" style="width:72mm;padding-top:2mm;padding-bottom:0mm;height:8mm;">
          Has the corporation elected to use its own payout
    pattern for discounting unpaid losses and unpaid
    loss adjustment expenses?<br/>
									</div>
									<!--div class="styGenericDiv"-->
										<div class="styShadingCell" style="width:6mm;height:3.5mm;"/>
										<div class="styShadingCell" style="width:6mm;height:3.5mm;"/>
										<div class="styIRS1120PCLNYesNoBox">
											<span style="font-weight:normal;">
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/ElectedOwnPayoutPatternInd"/>
												</xsl:call-template>
											</span>
										</div>
										<div class="styIRS1120PCLNYesNoBox">
											<span style="font-weight:normal;">
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/ElectedOwnPayoutPatternInd"/>
												</xsl:call-template>
											</span>
										</div>
									<!--/div-->
								</div>
								<!-- Line 8a -->
								<div class="styGenericDiv" style="width:93mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.5mm">8a</div>
									<div class="styLNDesc" style="width:72mm;height:4.5mm;">Enter the total unpaid losses shown on the
          corporation's annual statement:</div>
									<div class="styShadingCell" style="width:6mm;height:6.5mm;"/>
									<div class="styShadingCellRB" style="width:6mm;height:6.5mm;border-right-width:0px"/>
								</div>
								<div class="styGenericDiv" style="width:93mm;height:4.5mm;">
									<div class="styLNLeftLtrBox" style="height:4.5mm;padding-left:4mm">(1)</div>
									<div class="styLNDesc" style="width:31mm;height:4.5mm;padding-left:1mm">
          for the current tax year: $ 
        </div>
									<div class="styIRS1120PCBBText" style="width:41mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/UnpaidLossesForCurrentYearAmt"/>
										</xsl:call-template>
									</div>
									<div class="styGenericDiv" style="width:1mm;"/>
									<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
									<div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px"/>
								</div>
								<div class="styGenericDiv" style="width:93mm;height:4.5mm;">
									<div class="styLNLeftLtrBox" style="height:4.5mm;padding-left:4mm">(2)</div>
									<div class="styLNDesc" style="width:31mm;height:4.5mm;padding-left:1mm">
          for the previous tax year: $ 
        </div>
									<div class="styIRS1120PCBBText" style="width:41mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/UnpaidLossesForPreviousYearAmt"/>
										</xsl:call-template>
									</div>
									<div class="styGenericDiv" style="width:1mm;"/>
									<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
									<div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px"/>
								</div>
								<!-- Line 8b -->
								<div class="styGenericDiv" style="width:93mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm">b</div>
									<div class="styLNDesc" style="width:72mm;height:4.5mm;">Enter the total unpaid loss adjustment expenses
                          shown on the corporation's annual statement:
         </div>
									<div class="styShadingCell" style="width:6mm;height:6.5mm;"/>
									<div class="styShadingCellRB" style="width:6mm;height:6.5mm;border-right-width:0px"/>
								</div>
								<div class="styGenericDiv" style="width:93mm;height:4.5mm;">
									<div class="styLNLeftLtrBox" style="height:4.5mm;padding-left:4mm">(1)</div>
									<div class="styLNDesc" style="width:31mm;height:4.5mm;padding-left:1mm">
          for the current tax year: $ 
        </div>
									<div class="styIRS1120PCBBText" style="width:41mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/TotalUnpaidLossForCurrentYrAmt"/>
										</xsl:call-template>
									</div>
									<div class="styGenericDiv" style="width:1mm;"/>
									<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
									<div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px"/>
								</div>
								<div class="styGenericDiv" style="width:93mm;height:4.5mm;">
									<div class="styLNLeftLtrBox" style="height:4.5mm;padding-left:4mm">(2)</div>
									<div class="styLNDesc" style="width:31mm;height:4.5mm;padding-left:1mm">
          for the previous tax year: $ 
        </div>
									<div class="styIRS1120PCBBText" style="width:41mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/TotalUnpaidLossForPrevYrAmt"/>
										</xsl:call-template>
									</div>
									<div class="styGenericDiv" style="width:1mm;"/>
									<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
									<div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px"/>
								</div>
								<!-- line 9 -->
								<div class="styGenericDiv" style="width:93mm;">
									<div class="styLNLeftNumBoxSD" style="height:4.5mm;padding-top:0mm;padding-bottom:0mm;">9</div>
									<div class="styLNDesc" style="width:72mm;padding-top:0mm;padding-bottom:0mm;">
                                     <span style="float:left;"> Does the corporation discount any of the loss reserves shown on?</span>
                                     <span style="float:left;"> its annual statement?</span>
                                   <div class="styDotLn" style="float:right;padding-right:1mm;">............</div>
										<br/>
									</div>
									<!--div class="styGenericDiv" style="float:none;"-->
										<div class="styShadingCell" style="width:6mm;height:2.5mm;"/>
										<div class="styShadingCell" style="width:6mm;height:2.5mm;"/>
										<div class="styIRS1120PCLNYesNoBox">
											<span style="font-weight:normal;">
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/DiscountsLossReservesInd"/>
												</xsl:call-template>
											</span>
										</div>
										<div class="styIRS1120PCLNYesNoBox">
											<span style="font-weight:normal;">
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/DiscountsLossReservesInd"/>
												</xsl:call-template>
											</span>
										</div>
									<!--/div-->
								</div>
								<!-- line 10 -->
								<div class="styGenericDiv" style="width:93mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm;">10</div>
									<div class="styLNDesc" style="width:72mm;height:4.5mm;">
                                                               Enter the amount of tax-exempt interest received or
                                                          accrued during the tax year
                                                            <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/> $
                                                            <span style="width:30mm;border-bottom:1px solid black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/TaxExemptInterestAmt"/>
											</xsl:call-template>
										</span>
									</div>
									<div class="styShadingCell" style="width:6mm;height:7mm;border-bottom-width:0px;"/>
									<div class="styShadingCell" style="width:6mm;height:7mm;border-bottom-width:0px;"/>
								</div>
								<!-- Line 11 -->
								<div class="styGenericDiv" style="width:93mm;">
									<div class="styLNLeftNumBox" style="height:7mm;">11</div>
									<div class="styLNDesc" style="width:72mm;height:7mm;font-size:6pt;">
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/NOLForegoCarrybackInd"/>
												<xsl:with-param name="BackupName">IRS1120ScheduleINOLForegoCarryback</xsl:with-param>
											</xsl:call-template>
            If the corporation has an NOL for the tax year
        and is electing to forgo the carryback period,
    check here
                  <!--Dotted Line-->
											<span class="styBoldText">
												<span style="width:16px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
       </span>
											<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
										</label>
										<span style="width:2px;"/>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/NOLForegoCarrybackInd"/>
												<xsl:with-param name="BackupName">IRS1120ScheduleINOLForegoCarryback</xsl:with-param>
											</xsl:call-template>
										</input>
									</div>
									<div class="styShadingCell" style="width:6mm;height:8mm;"/>
									<div class="styShadingCell" style="width:6mm;height:8mm;"/>
								</div>
								<!-- Line 12 - sub -->
								<div class="styGenericDiv" style="width:93mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm;"/>
									<div class="styLNDesc" style="width:72mm;height:5mm;">
        If the corporation is filing a consolidated return,
    the statement required by Regulations section 1.1502-21(b)(3) must be attached or the election will not be valid.
    <span style="width:5px;"/>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/NOLForegoCarrybackInd"/>
										</xsl:call-template>
									</div>
									<div class="styShadingCell" style="width:6mm;height:10mm;"/>
									<div class="styShadingCell" style="width:6mm;height:10mm;"/>
								</div>
								<!-- Line 12 -->
								<div class="styGenericDiv" style="width:93mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm;">12</div>
									<div class="styLNDesc" style="width:72mm;height:4.5mm;">
        Enter the available NOL carryover from prior tax
    years. (Do not reduce it by any deduction on
    line 36b, Schedule A.)   <br/>
										<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/> $
        <span style="width:25mm;border-bottom:1px solid black;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/NOLCarryoverFromPriorYearAmt"/>
											</xsl:call-template>
										</span>
									</div>
									<div class="styShadingCell" style="width:6mm;height:9.25mm;border-bottom-width:1px;"/>
									<div class="styShadingCell" style="width:6mm;height:9.25mm;border-bottom-width:1px;"/>
								</div>
								<div class="styGenericDiv" style="width:93mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm;">13</div>
									<div class="styLNDesc" style="width:72mm;height:10mm;">
                              Is the corporation required to file Schedule UTP (Form 1120), Uncertain Tax Position Statement (see instructions)? If "Yes,"
                               <span style="float:left">complete and attach Schedule UTP</span>
                                    <div class="styDotLn" style="float:right;padding-right:1mm;">........</div>
									</div>
									<div class="styIRS1120PCLNYesNoBox">
										<span style="font-weight:normal;">
											<xsl:call-template name="PopulateYesBoxText">
												<xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/UncertainTaxPositionStmtInd"/>
											</xsl:call-template>
										</span>
									</div>
									<div class="styIRS1120PCLNYesNoBoxRB" style="border-right-width:0px;">
										<span style="font-weight:normal;">
											<xsl:call-template name="PopulateNoBoxText">
												<xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/UncertainTaxPositionStmtInd"/>
											</xsl:call-template>
										</span>
									</div>
									<div class="styShadingCell" style="width:6mm;height:6.25mm;border-bottom-width:1px;"/>
									<div class="styShadingCell" style="width:6mm;height:6.25mm;border-bottom-width:1px;"/>
								</div>
								<div class="styGenericDiv" style="width:93mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm;">14</div>
									<div class="styLNDesc" style="width:72mm;height:4.5mm;height:10mm;">
	                                 If the corporation is a Blue Cross or Blue Shield organization described in section 833(c)(2), or other organization described in
	                                  section 833(c)(3), did it meet the medical loss ratio (MLR) 
	                                  <span style="float:left">requirements of Section 833(c)(5)?</span>
	                                 <div class="styDotLn" style="float:right;padding-right:1mm;">.......</div>
									</div>
									<div class="styIRS1120PCLNYesNoBox">
										<span style="font-weight:normal;">
											<xsl:call-template name="PopulateYesBoxText">
												<xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/MedicalLossRtRqrSect833c5Ind"/>
											</xsl:call-template>
										</span>
									</div>
									<div class="styIRS1120PCLNYesNoBoxRB" style="border-right-width:0px;">
										<span style="font-weight:normal;">
											<xsl:call-template name="PopulateNoBoxText">
												<xsl:with-param name="TargetNode" select="$Form1120PCScheduleI/MedicalLossRtRqrSect833c5Ind"/>
											</xsl:call-template>
										</span>
									</div>
									<div class="styShadingCell" style="width:6mm;height:6.25mm;border-bottom-width:1px;"/>
									<div class="styShadingCell" style="width:6mm;height:6.25mm;border-bottom-width:1px;"/>
								</div>
							</td>
							<!--END Schedule I Right Side-->
						</tr>
					</table>
					<!-- END Schedule I Line Items -->
					<!-- Page Break and Footer for Page 7-->
					<div class="pageEnd" style="width:187mm;border-top: 2px solid black;float:none;">
						<div style="float:left;"/>
						<div style="float:right;">
							<span style="width:40px;"/>  
          Form <span class="styBoldText" style="font-size:8pt;">1120-PC</span> (2013)
     </div>
					</div>
					<!-- END Page Break and Footer for Page 7-->
					<!--Begin Page 8 -->
					<!-- Page 8 Header -->
					<div class="styBB" style="width:187mm;padding-top:.5mm;float:none;">
						<div style="float:left;">Form 1120-PC (2013)<span style="width:146mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">8</span>
						</div>
					</div>
					<!-- END Page 8 Header -->
					<!-- BEGIN Schedule L Title -->
					<div class="styBB" style="width:187mm;float:none;">
						<div class="styPartName" style="width:28mm;">Schedule L</div>
						<div class="styPartDesc" style="width:158mm;height:">
      Balance Sheets per Books <span class="styNormalText">(All filers are required to complete this schedule.)</span>
						</div>
					</div>
					<!-- END Schedule L Title -->
					<!-- BEGIN Schedule L Title -->
					<div style="width:187mm;">
						<div class="styGenericDiv" style="width:58mm;border-left-width:0px;height:4mm;"/>
						<div class="styLNAmountBox" style="text-align:center;border-bottom-width:1px;width:64mm;height:4mm;">Beginning of tax year</div>
						<div class="styLNAmountBox" style="text-align:center;border-bottom-width:1px;width:64mm;height:4mm;">End of tax year</div>
					</div>
					<!-- END Schedule L Title -->
					<!-- BEGIN Schedule L Line Items -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;border-top:1px solid white;border-bottom-width:0px;"/>
						<div class="styGenericDiv" style="width:50mm;height:4.5mm;text-align:center;font-weight:bold;border-top-width:0px;">Assets</div>
						<div class="styLNAmountBox" style="height:4.5mm;text-align:center;font-weight:bold;">(a)</div>
						<div class="styLNAmountBox" style="height:4.5mm;text-align:center;font-weight:bold;">(b)</div>
						<div class="styLNAmountBox" style="height:4.5mm;text-align:center;font-weight:bold;">(c)</div>
						<div class="styLNAmountBox" style="height:4.5mm;text-align:center;font-weight:bold;">(d)</div>
					</div>
					<!-- Schedule L Line 1-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4.5mm;">1</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;">
						<span style="float:left">Cash</span>
        <!--Dotted Line-->
		<div class="styDotLn" style="float:right;padding-right:1mm;">.........</div>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/CashBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/CashEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule L Line 2a-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;padding-left:2.5mm;">2a</div>
						<div class="styLNDesc" style="width:50mm;height:5mm;">Trade notes and accounts receivable</div>
						<div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/TradeNotesAccountsRcvblBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/TradeNotesAccountsRcvblEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
					</div>
					<!-- Schedule L Line 2b-->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;padding-left:4.5mm;">b</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;"><span style="float:left">Less allowance for bad debts</span>
        <!--Dotted Line-->
				<div class="styDotLn" style="float:right;padding-right:1mm;">..</div>
						</div>
						<div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/BadDebtAllowanceBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/NetTradeNotesAcctRcvblBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/BadDebtAllowanceEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/NetTradeNotesAcctRcvblEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule L Line 3-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4.5mm;">3</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;"><span style="float:left">Inventories</span>
        <!--Dotted Line-->
		<div class="styDotLn" style="float:right;padding-right:1mm;">.......</div>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/InventoriesBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/InventoriesEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule L Line 4-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4.5mm;">4</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;"><span style="float:left">U.S. government obligations</span>
        <!--Dotted Line-->
				<div class="styDotLn" style="float:right;padding-right:1mm;">..</div>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/USGovernmentObligationsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/USGovernmentObligationsEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule L Line 5-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4.5mm;">5</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;font-size:6pt;padding-top:1mm;">
							<span>Tax-exempt securities (see instructions)</span>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/TaxExemptSecuritiesBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/TaxExemptSecuritiesEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule L Line 6-->
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
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/OtherCurrentAssetsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="height:5.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/OtherCurrentAssetsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5.5mm;"/>
						<div class="styLNFormLinkBox" style="height:5.5mm;">
							<!-- Form to Form Link -->
							<span style="width:2px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/OtherCurrentAssetsEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="height:5.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/OtherCurrentAssetsEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule L Line 7-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4.5mm;">7</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;"><span style="float:left">Loans to shareholders</span>
        <!--Dotted Line-->
						<div class="styDotLn" style="float:right;padding-right:1mm;">....</div>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/LoansToShareholdersBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/LoansToShareholdersEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule L Line 8-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:4.5mm;">8</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;"><span style="float:left">Mortgage and real estate loans</span>
        <!--Dotted Line-->
			<div class="styDotLn" style="float:right;padding-right:1mm;">..</div>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/MortgageRealEstateLoansBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-size:8pt;font-family:arial;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/MortgageRealEstateLoansEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule L Line 9-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="height:5.5mm;">9</div>
						<div class="styLNDesc" style="width:50mm;height:5.5mm;font-size:6pt;"><span style="float:left">Other investments
        (attach statement)</span>
         <!--Dotted Line-->
			<div class="styDotLn" style="float:right;padding-right:1mm;">..</div>
      </div>
						<div class="styShadingCell" style="height:5.5mm;"/>
						<div class="styLNFormLinkBox" style="height:5.5mm;">
							<!-- Form to Form Link -->
							<span style="width:2px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/OtherInvestmentsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="height:5.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/OtherInvestmentsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5.5mm;font-family:arial;font-size:8pt;"/>
						<div class="styLNFormLinkBox" style="height:5.5mm;">
							<!-- Form to Form Link -->
							<span style="width:2px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/OtherInvestmentsEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="height:5.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/OtherInvestmentsEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule L Line 10a-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">10a</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;padding-top:1mm;">
							<span class="stySmallText">Buildings and other depreciable assets</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/BuildingOtherDeprecAstBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/BuildingOtherDeprecAstEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
					</div>
					<!-- Schedule L Line 10b-->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBoxDD" style="height:4.5mm;">b</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;"><span style="float:left">Less accumulated depreciation</span>
        <!--Dotted Line-->
				<div class="styDotLn" style="float:right;padding-right:1mm;">..</div>
						</div>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/AccumulatedDepreciationBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/NetDepreciableAssetsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/AccumulatedDepreciationEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/NetDepreciableAssetsEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule L Line 11a-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">11a</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;"><span style="float:left">Depletable assets</span>
        <!--Dotted Line-->
		<div class="styDotLn" style="float:right;padding-right:1mm;">......</div>
						</div>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/DepletableAssetsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/DepletableAssetsEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
					</div>
					<!-- Schedule L Line 11b-->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBoxDD" style="height:4.5mm;">b</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;"><span style="float:left">Less accumulated depletion</span>
        <!--Dotted Line-->
			<div class="styDotLn" style="float:right;padding-right:1mm;">..</div>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/AccumulatedDepletionBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/NetDepletableAssetsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/AccumulatedDepletionEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/NetDepletableAssetsEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule L Line 12-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">12</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;"><span style="float:left">Land (net of any amortization)</span>
        <!--Dotted Line-->
					<div class="styDotLn" style="float:right;padding-right:1mm;">..</div>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/LandBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/LandEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule L Line 13a-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">13a</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;">Intangible assets (amortizable only)</div>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/IntangibleAssetsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/IntangibleAssetsEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
					</div>
					<!-- Schedule L Line 13b-->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBoxDD" style="height:4.5mm;">b</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;"><span style="float:left">Less accumulated amortization</span>
        <!--Dotted Line-->
				<div class="styDotLn" style="float:right;padding-right:1mm;">..</div>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/AccumulatedAmortizationBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/NetIntangibleAssetsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/AccumulatedAmortizationEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/NetIntangibleAssetsEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule L Line 14-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5.5mm;">14</div>
						<div class="styLNDesc" style="width:50mm;height:5.5mm;"><span style="float:left">Other assets
        (attach statement)</span>
        <!--Dotted Line-->
							<div class="styDotLn" style="float:right;padding-right:1mm;">..</div>
						</div>
						<div class="styShadingCell" style="height:5.5mm;"/>
						<div class="styLNFormLinkBox" style="height:5.5mm;">
							<!-- Form to Form Link -->
							<span style="width:2px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/OtherAssetsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="height:5.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/OtherAssetsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5.5mm;"/>
						<div class="styLNFormLinkBox" style="height:5.5mm;">
							<!-- Form to Form Link -->
							<span style="width:2px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/OtherAssetsEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="height:5.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/OtherAssetsEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule L Line 15-->
					<div class="styBB" style="width:187mm;border-bottom:2px solid black;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">15</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;"><span style="float:left">Total assets</span>
        <!--Dotted Line-->
				<div class="styDotLn" style="float:right;padding-right:1mm;">........</div>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBoxNBB" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/TotalAssetsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBoxNBB" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/TotalAssetsEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule L Liabilities and Shareholders Line-->
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
					<!-- Schedule L Line 16-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">16</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;"><span style="float:left">Accounts payable</span>
        <!--Dotted Line-->
		<div class="styDotLn" style="float:right;padding-right:1mm;">......</div>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/AccountsPayableBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/AccountsPayableEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule L Line 17-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:7mm;">17</div>
						<div class="styLNDesc" style="width:50mm;height:7mm;">
							<span>Mortgages, notes, bonds payable in less than 1 year</span>
						</div>
						<div class="styShadingCell" style="height:7.5mm;"/>
						<div class="styLNAmountBox" style="height:7.5mm;padding-top:3mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/ShortTermPayableBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:7.5mm;"/>
						<div class="styLNAmountBox" style="height:7.5mm;padding-top:3mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/ShortTermPayableEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule L Line 18-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:7mm;">18</div>
						<div class="styLNDesc" style="width:50mm;height:7mm;">
							<span>Insurance liabilities (see instructions)</span>
						</div>
						<div class="styShadingCell" style="height:7.5mm;"/>
						<div class="styLNAmountBox" style="height:7.5mm;padding-top:3mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/InsuranceLiabilitiesBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:7.5mm;"/>
						<div class="styLNAmountBox" style="height:7.5mm;padding-top:3mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/InsuranceLiabilitiesEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule L Line 19-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5.5mm;">19</div>
						<div class="styLNDesc" style="width:50mm;height:5.5mm;font-size:6pt;padding-top:1mm;">
							<span>Other current liabilities (attach statement)</span>
						</div>
						<div class="styShadingCell" style="height:5.5mm;"/>
						<div class="styLNFormLinkBox" style="height:5.5mm;">
							<!-- Form to Form Link -->
							<span style="width:2px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/OtherCurrentLiabilitiesBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="height:5.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/OtherCurrentLiabilitiesBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5.5mm;"/>
						<div class="styLNFormLinkBox" style="height:5.5mm;">
							<!-- Form to Form Link -->
							<span style="width:2px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/OtherCurrentLiabilitiesEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="height:5.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/OtherCurrentLiabilitiesEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule L Line 20-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">20</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;"><span style="float:left">Loans from shareholders</span>
        <!--Dotted Line-->
						<div class="styDotLn" style="float:right;padding-right:1mm;">....</div>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/LoansFromShareholdersBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/LoansFromShareholdersEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule L Line 21-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:7mm;">21</div>
						<div class="styLNDesc" style="width:50mm;height:7mm;">
							<span>Mortgages, notes, bonds payable in 1 year or more</span>
						</div>
						<div class="styShadingCell" style="height:7.5mm;"/>
						<div class="styLNAmountBox" style="height:7.5mm;padding-top:3mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/LongTermPayableBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:7.5mm;"/>
						<div class="styLNAmountBox" style="height:7.5mm;padding-top:3mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/LongTermPayableEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule L Line 22-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5.5mm;">22</div>
						<div class="styLNDesc" style="width:50mm;height:5.5mm;">Other liabilities
        (attach statement)
      </div>
						<div class="styShadingCell" style="height:5.5mm;"/>
						<div class="styLNFormLinkBox" style="height:5.5mm;">
							<!-- Form to Form Link -->
							<span style="width:2px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/OtherLiabilitiesBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="height:5.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/OtherLiabilitiesBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5.5mm;"/>
						<div class="styLNFormLinkBox" style="height:5.5mm;">
							<!-- Form to Form Link -->
							<span style="width:2px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/OtherLiabilitiesEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="height:5.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/OtherLiabilitiesEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule L Line 23-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">23</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;">
							<span style="width:20mm;" class="styLNDesc">Capital stock: </span>
							<span style="width:30mm;" class="styLNDesc">
								<span class="styBoldText">a</span> Preferred stock
        </span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/CapitalPreferredStockBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/CapitalPreferredStockEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;"/>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;">
							<span style="width:20mm;" class="styLNDesc"/>
							<span style="width:28mm;" class="styLNDesc">
								<span class="styBoldText">b</span> Common stock
        </span>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/CapitalCommonStockBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/CapitalStockBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/CapitalCommonStockEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/CapitalStockEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule L Line 24-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">24</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;"><span style="float:left">Additional paid-in capital</span>
        <!--Dotted Line-->
			<div class="styDotLn" style="float:right;padding-right:1mm;">...</div>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/AdditionalPaidInCapitalBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/AdditionalPaidInCapitalEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule L Line 25-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:7mm;">25</div>
						<div class="styLNDesc" style="width:50mm;height:7mm;">
							<span>Retained earnings&#8212;Appropriated (attach statement)</span>
						</div>
						<div class="styShadingCell" style="height:7.5mm;"/>
						<div class="styLNFormLinkBox" style="height:7.5mm;padding-top:1.5mm;padding-top:3mm;">
							<!-- Form to Form Link -->
							<span style="width:2px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/RetainedEarningsApprBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="height:7.5mm;padding-top:3mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/RetainedEarningsApprBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:7.5mm;"/>
						<div class="styLNFormLinkBox" style="height:7.5mm;padding-top:1.5mm;padding-top:3mm;">
							<!-- Form to Form Link -->
							<span style="width:2px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/RetainedEarningsApprEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="height:7.5mm;padding-top:3mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/RetainedEarningsApprEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule L Line 26-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">26</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;">
        Retained earnings&#8212;Unappropriated
      </div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/RetainedEarningsUnapprBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/RetainedEarningsUnapprEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule L Line 27-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:7mm;">27</div>
						<div class="styLNDesc" style="width:50mm;height:7mm;">
							<span>Adjustments to shareholders' equity (attach statement)</span>
						</div>
						<div class="styShadingCell" style="height:7.5mm;"/>
						<div class="styLNFormLinkBox" style="height:7.5mm;padding-top:1.5mm;padding-top:3mm;">
							<!-- Form to Form Link -->
							<span style="width:2px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/AdjustmentToShrEqtyBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="height:7.5mm;padding-top:3mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/AdjustmentToShrEqtyBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:7.5mm;"/>
						<div class="styLNFormLinkBox" style="height:7.5mm;padding-top:1.5mm;padding-top:3mm;">
							<!-- Form to Form Link -->
							<span style="width:2px;"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/AdjustmentToShrEqtyEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxFormLink" style="height:7.5mm;padding-top:3mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/AdjustmentToShrEqtyEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule L Line 28-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">28</div>
						<div class="styLNDesc" style="width:50mm;height:4.5mm;"><span style="float:left">Less cost of treasury stock</span>
        <!--Dotted Line-->
					<div class="styDotLn" style="float:right;padding-right:1mm;">...</div>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/CostOfTreasuryStockBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:5mm;"/>
						<div class="styLNAmountBox" style="height:5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/CostOfTreasuryStockEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule L Line 29-->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">29</div>
						<div class="styGenericDiv" style="width:50mm;height:4.5mm;padding-top:1mm;">
							<span class="stySmallText">Total liabilities and shareholders' equity</span>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/TotalLiabilitiesShrEqtyBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styShadingCell" style="height:4.5mm;"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm;font-family:arial;font-size:8pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1120PCScheduleL/TotalLiabilitiesShrEqtyEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END Schedule L Line Items -->
					<br style="page-break-after:always;float:none;" class="pageEnd"/>
					<div class="pageEnd" style="float:none;clear:none;" />
					<!-- BEGIN Schedule M-1 Title -->
					<div class="styBB" style="width:187mm;border-top:1px solid black;float:none;">
						<div class="styPartName" style="width:28mm;">Schedule M-1</div>
						<div class="styPartDesc" style="width:158mm;">Reconciliation of Income (Loss) per Books with Income (Loss) per Return</div>
						<div class="styPartDesc" style="width:158mm;padding-left:31mm;font-size:6pt;">Note: <span class="styNormalText">Schedule M-3 required instead of Schedule M-1 if total assets are $10 million or more–See instructions.</span>
						</div>
					</div>
					<!-- END Schedule M-1 Title -->
					<!-- BEGIN Schedule M-1 Line Items -->
					<div style="width:187mm;clear:both;height:auto;float:none;" class="styBB">
						<!-- BEGIN Left Side Table of Schedule M-1-->
						<table class="styTable" style="width:93mm;float:left;clear:none;font-size:7pt;height:auto;" cellspacing="0">
							<tr style="width:93mm;">
								<td class="styLNLeftNumBox" style="height:4.5mm;">1</td>
								<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2"><span style="float:left">Net income (loss) per books</span>
              <!--Dotted Line-->
					<div class="styDotLn" style="float:right;padding-right:1mm;">...</div>
								</td>
								<td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;width:31.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCScheduleM1/NetIncomeLossPerBooksAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="height:4.5mm;">2</td>
								<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2"><span style="float:left">Federal income tax per books</span>
              <!--Dotted Line-->
				<div class="styDotLn" style="float:right;padding-right:1mm;">...</div>
								</td>
								<td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;width:31.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCScheduleM1/FederalIncomeTaxPerBooksAmt"/>
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
								<td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;width:31.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCScheduleM1/ExcessCapLossesOverCapGainsAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="height:4.5mm;">4</td>
								<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">Income subject to tax not recorded </td>
								<td class="styLNAmountBox" style="border-right-width:1px;border-bottom:0px;width:31.5mm;height:4.5mm;">
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="height:4.5mm;"/>
								<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">
									<div class="styGenericDiv" style="width:37mm;">on books this year (itemize)
              </div>
									<span style="width:8mm;border-bottom:solid 1px;text-align:center;"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120PCScheduleM1/TotalTaxableIncmNotRecOnBksAmt"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" style="border-right-width:1px;width:31.5mm;height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCScheduleM1/TotalTaxableIncmNotRecOnBksAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="height:4.5mm;">5</td>
								<td class="styGenericDiv" style="width:52mm;height:4.5mm;font-size:6pt;" colspan="2">Expenses recorded on books this year
                  <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120PCScheduleM1/TotalExpensesNotDeductedAmt"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" style="border-right-width:1px;border-bottom:0px;width:31.5mm;height:4.5mm;">
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="height:4.5mm;"/>
								<td class="styGenericDiv" style="width:52mm;height:4.5mm;font-size:6pt;" colspan="2">not deducted on this return (itemize)</td>
								<td class="styLNAmountBox" style=";border-right-width:1px;width:31.5mm;border-bottom:0px;height:4.5mm;">
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="height:4.5mm;">
									<span style="width:3mm;"/>a</td>
								<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">
									<div class="styGenericDiv" style="width:20mm;font-size:6.5pt;">Depreciation<span style="width:1mm;"/>$
              </div>
									<span style="width:28mm;border-bottom:solid 1px;text-align:right;font-size:6pt;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1120PCScheduleM1/DepreciationExpensesAmt"/>
										</xsl:call-template>
									</span>
									<span style="width:1px;"/>
								</td>
								<td class="styLNAmountBox" style="border-right-width:1px;border-bottom:0px;width:31.5mm;height:4.5mm;">
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="height:4.5mm;vertical-align:top;">
									<span style="width:3mm;"/>b</td>
								<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">
									<div class="styGenericDiv" style="width:28mm;font-size:6pt;">Charitable contributions $<span style="width:.5mm;"/>
									</div>
									<span style="width:22mm;border-bottom:solid 1px;text-align:right;font-size:6pt;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1120PCScheduleM1/CharitableContriExpnssAmt"/>
										</xsl:call-template>
									</span>
									<span style="width:1px;"/>
								</td>
								<td class="styLNAmountBox" style="border-right-width:1px;border-bottom:0px;width:31.5mm;height:4.5mm;">
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="vertical-align:top;">
									<span style="width:3mm;"/>c</td>
								<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">
									<div class="styGenericDiv" style="width:38mm;">Travel and entertainment 
                      <span style="width:1mm;"/>$
                      </div>
									<span style="width:11mm;border-bottom:solid 1px;text-align:right;"/>
									<span style="width:1px;"/>
								</td>
								<td class="styLNAmountBox" style="border-right-width:1px;border-bottom-width: 0px;width:31.5mm;height:4.5mm;">
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="vertical-align:top;">
									<span style="width:3mm;"/>
								</td>
								<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">
									<div class="styGenericDiv" style="width:50mm;border-bottom:solid 1px;text-align:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1120PCScheduleM1/TravelEntertainmentAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</div>
								</td>
								<td class="styLNAmountBox" style="border-right-width:1px;border-bottom-width: 2px;width:31.5mm;height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCScheduleM1/TotalExpensesNotDeductedAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="height:4.5mm;">6</td>
								<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2"><span style="float:left">Add lines 1 through 5</span>
                       <!--Dotted Line-->
						<div class="styDotLn" style="float:right;padding-right:1mm;">.....</div>
								</td>
								<td class="styLNAmountBoxNBB" style="height:4.5mm;width:31.5mm;border-right-width:1px;height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCScheduleM1/IncomeExpensesSubtotalAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
						</table>
						<!-- END Left Side table of Schedule M-1-->
						<!-- BEGIN Right Side table of Schedule M-1-->
						<table class="styTable" style="width:94mm;float:left;clear:none;font-size:7pt;" cellspacing="0">
							<tr style="width:94mm;">
								<td class="styLNLeftNumBoxSD" style="height:4.5mm;">7</td>
								<td class="styGenericDiv" style="width:53mm;float:left;clear:none;" colspan="2">Income recorded on books this year 
                  <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120PCScheduleM1/TotIncmRecordedNotIncludedAmt"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;border-bottom-width: 0px;">
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="height:4.5mm;"/>
								<td class="styGenericDiv" style="width:53mm;" colspan="2">not included in this return (itemize)</td>
								<td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;border-bottom:0px;">
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="height:4.5mm;">
									<span style="width:3mm;"/>a</td>
								<td class="styGenericDiv" style="width:53mm;" colspan="2">
									<div class="styGenericDiv" style="width:31mm;">Tax-exempt interest<span style="width:1mm;"/>$
              </div>
									<span style="width:20mm;border-bottom:solid 1px;text-align:right;"/>
									<span style="width:1px;"/>
								</td>
								<td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;border-bottom:0px;">
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="height:4.5mm;">
									<span style="width:3mm;"/>
								</td>
								<td class="styGenericDiv" style="width:53mm;height:4.5mm;" colspan="2">
									<span style="width:52mm;border-bottom:solid 1px;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1120PCScheduleM1/TaxExemptInterestAmt"/>
										</xsl:call-template>
									</span>
									<span style="width:1px;"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120PCScheduleM1/TaxExemptInterestAmt"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCScheduleM1/TotIncmRecordedNotIncludedAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBoxSD" style="height:4.5mm;">8</td>
								<td class="styGenericDiv" style="width:53mm;height:4.5mm;" colspan="2">Deductions in this tax return not 
                  <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120PCScheduleM1/TotalDeductionsNotChargedAmt"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;border-bottom:0px;">
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="height:4.5mm;"/>
								<td class="styGenericDiv" style="width:53mm;height:6mm;" colspan="2">charged
against book income this year (itemize)</td>
								<td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;border-bottom:0px;height:6mm;">
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="height:4.5mm;">
									<span style="width:3mm;"/>a</td>
								<td class="styGenericDiv" style="width:53mm;height:4.5mm;" colspan="2">
									<div class="styGenericDiv" style="width:20mm;">Depreciation<span style="width:1mm;"/>$
              </div>
									<span style="width:31mm;text-align:right;border-bottom:solid 1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1120PCScheduleM1/DepreciationDeductionAmt"/>
										</xsl:call-template>
									</span>
									<span style="width:1px;"/>
								</td>
								<td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;border-bottom:0px;">
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="height:4.5mm;">
									<span style="width:3mm;"/>b</td>
								<td class="styGenericDiv" style="width:53mm;height:4.5mm;" colspan="2">
									<div class="styGenericDiv" style="width:28mm;font-size:6pt;">Charitable contributions $<span style="width:.5mm;"/>
									</div>
									<span style="width:23mm;border-bottom:solid 1px;text-align:right;font-size:6pt;"/>
									<span style="width:1px;"/>
								</td>
								<td class="styLNAmountBox" style="width:31.5mm;border-bottom:0px;height:4.5mm;">
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="height:4.5mm;">
									<span style="width:3mm;"/>
								</td>
								<td class="styGenericDiv" style="width:53mm;height:4.5mm;" colspan="2">
									<span style="width:47mm;border-bottom:solid 1px;text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1120PCScheduleM1/CharitableContributionsDedAmt"/>
										</xsl:call-template>
									</span>
									<span style="width:1px;"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120PCScheduleM1/CharitableContributionsDedAmt"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;text-align:right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCScheduleM1/TotalDeductionsNotChargedAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBoxSD" style="height:4.5mm;">9</td>
								<td class="styGenericDiv" style="width:53mm;height:4.5mm;" colspan="2"><span style="float:left">Add lines 7 and 8</span>
            <!--Dotted Line-->
			<div class="styDotLn" style="float:right;padding-right:1mm;">......</div>
								</td>
								<td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;border-bottom-width: 2px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCScheduleM1/IncomeDeductionsSubtotalAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="height:7mm;padding-bottom:2.5mm;">10</td>
								<td class="styGenericDiv" style="width:53mm;height:7mm;font-size:6pt;padding-top:1mm;" colspan="2">Income (Schedule A, line 35 or Schedule B, line 19, if applicable)-line 6 less line 9</td>
								<td class="styLNAmountBox" style="height:7mm;width:31.5mm;border-bottom-width: 0px; padding-top:3.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCScheduleM1/IncomeAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
						</table>
						<!-- END Right Side Table of Schedule M-1-->
					</div>
					<!--br style="page-break-after:always;"/-->
					<!-- BEGIN Schedule M-2 Title -->
					<div class="styBB" style="width:187mm;float:none;">
						<div class="styPartName" style="width:28mm;">Schedule M-2</div>
						<div class="styPartDesc" style="width:158mm;height:">
      Analysis of Unappropriated Retained Earnings per Books
      (line 26, Schedule L)
    </div>
					</div>
					<!-- END Schedule M-2 Title -->
					<!-- BEGIN Schedule M-2 Line Items -->
					<div style="width:187mm;clear:both;height:auto;float:none;" class="styBB">
						<!-- BEGIN Left Side Table of Schedule M-2-->
						<table class="styTable" style="width:93mm;float:left;clear:none;font-size:7pt;" cellspacing="0">
							<tr>
								<td class="styLNLeftNumBox" style="height:4.5mm;">1</td>
								<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2"><span style="float:left">Balance at beginning of year</span>
            <!--Dotted Line-->
				<div class="styDotLn" style="float:right;padding-right:1mm;">...</div>
								</td>
								<td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;border-right-width:1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCScheduleM2/BeginningYearBalanceAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="height:4.5mm;">2</td>
								<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2"><span style="float:left">Net income (loss) per books</span>
            <!--Dotted Line-->
			<div class="styDotLn" style="float:right;padding-right:1mm;">...</div>
								</td>
								<td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;border-right-width:1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCScheduleM2/NetIncomeLossPerBooksAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="height:4.5mm;">3</td>
								<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">
									<div class="styGenericDiv" style="width:35mm;">Other increases (itemize)
          </div>
									<span style="width:16mm;border-bottom:solid 1px;text-align:center;"/>
								</td>
								<td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;border-bottom:0px;border-right-width:1px;">
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="height:4.5mm;"/>
								<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">
									<span style="width:52mm;border-bottom:solid 1px;text-align:center;"/>
								</td>
								<td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;border-bottom:0px;border-right-width:1px;">
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="height:4.5mm;"/>
								<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2">
									<span style="width:47mm;border-bottom:solid 1px;text-align:center;"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form1120PCScheduleM2/TotalOtherIncreasesAmt"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;border-right-width:1px;border-bottom-width: 2px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCScheduleM2/TotalOtherIncreasesAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="height:4.5mm;">4</td>
								<td class="styGenericDiv" style="width:52mm;height:4.5mm;" colspan="2"><span style="float:left">Add lines 1, 2, and 3</span>
            <!--Dotted Line-->
			<div class="styDotLn" style="float:right;padding-right:1mm;">.....</div>
								</td>
								<td class="styLNAmountBoxNBB" style="height:4.5mm;width:31.5mm;border-right-width:1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCScheduleM2/BalanceIncomeOtherIncreasesAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
						</table>
						<!-- END Left Side Table of Schedule M-2-->
						<!-- BEGIN Right Side Table of Schedule M-2-->
						<table class="styTable" style="width:94mm;float:left;clear:none;font-size:7pt;" cellspacing="0">
							<tr style="width:94mm;">
								<td class="styLNLeftNumBoxSD" style="height:4.5mm;">5</td>
								<td class="styGenericDiv" style="width:20mm;height:4.5mm;">
            Distributions:
          </td>
								<td class="styGenericDiv" style="width:33mm;height:4.5mm;">
									<span class="styBoldText">a</span>
									<span style="width:4px"/>Cash
            <!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
								</td>
								<td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCScheduleM2/CashDistributionAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="height:4.5mm;"/>
								<td class="styGenericDiv" style="width:20mm;height:4.5mm;"/>
								<td class="styGenericDiv" style="width:33mm;height:4.5mm;">
									<span class="styBoldText">b</span>
									<span style="width:4px"/>Stock
            <!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
								</td>
								<td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCScheduleM2/StockDistributionAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBox" style="height:4.5mm;"/>
								<td class="styGenericDiv" style="width:20mm;height:4.5mm;"/>
								<td class="styGenericDiv" style="width:33mm;height:4.5mm;">
									<span class="styBoldText">c</span>
									<span style="width:4px"/>Property
            <!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
								</td>
								<td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCScheduleM2/PropertyDistributionAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBoxSD" style="height:2.5mm;">6</td>
								<td class="styGenericDiv" style="width:53mm;height:4.5mm;" colspan="2">
									<div class="styGenericDiv" style="width:40mm;padding-bottom:.5mm">Other decreases (itemize)
									<!--<span style="width:4mm;border-bottom:solid 1px;text-align:center;"/>-->
									
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form1120PCScheduleM2/TotalOtherDecreasesAmt"/>
										</xsl:call-template>
									</div>
								</td>
								<td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCScheduleM2/TotalOtherDecreasesAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBoxSD" style="height:4.5mm;">7</td>
								<td class="styGenericDiv" style="width:53mm;height:4.5mm;" colspan="2">Add lines 5 and 6
           
									<span class="styBoldText">
										<span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
              <span style="width:16px"/>.
            </span>
								</td>
								<td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;border-bottom-width: 2px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCScheduleM2/DistributionsOtherDecreasesAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
							<tr>
								<td class="styLNLeftNumBoxSD" style="height:4.5mm;">8</td>
								<td class="styGenericDiv" style="width:53mm;height:4.5mm;font-size:6pt;" colspan="2">Balance at end of year (line 4 less line 7)</td>
								<td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;border-bottom-width: 0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120PCScheduleM2/EndYearBalanceAmt"/>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
							</tr>
						</table>
						<!-- END Right Side Table of Schedule M-2-->
					</div>
					<!-- END Schedule M-2 Line Items -->
					<!-- Page Break and Footer for Page 8-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;float:none;">
						<div style="float:left;"/>
						<div style="float:right;">
							<span style="width:40px;"/>  
                       Form <span class="styBoldText" style="font-size:8pt;">1120-PC</span> (2013)
                </div>
					</div>
					<!-- END Page Break and Footer for Page 8-->
					<!--BEGIN Left Over Table -->
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
							<xsl:with-param name="TargetNode" select="$Form1120PCData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<!--<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Return Software ID</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$RtnHdrData/SoftwareId"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>-->
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Return Software Version</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$RtnHdrData/SoftwareVersion"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Form 1120PC, Top Left Box -SUPPORTING STATEMENT TO CONSOLIDATED RETURN</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120PCData/@suprtStmtConsolidatedReturnCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Form 1120PC, Top Left Box -Top Left Header - SECTION 301.9100-2</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120PCData/@filedPursuantToSect30191002Cd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Form 1120PC, top right Box D - Section 953D Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120PCData/Section953dElectionInd/@section953dCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Form 1120PC, top right Box D - Section 953D Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120PCData/Section953dElectionInd/@section953dAmt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 4 - Section 1291 Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120PCData/IncomeTaxAmt/@section1291Cd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 4 - Section 1291 Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120PCData/IncomeTaxAmt/@section1291Amt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 4 - Section 197 Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120PCData/IncomeTaxAmt/@section197Cd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 4 - Section 197 Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120PCData/IncomeTaxAmt/@section197Amt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Schedule A Line 13 - Other Income Item</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleA/OtherIncomeAmt/@otherIncomeDesc"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 14i - Backup Withholding Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120PCData/OtherCreditsPaymentsAmt/@backupWithholdingTypeCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 14i - Backup Withholding Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120PCData/OtherCreditsPaymentsAmt/@backupWithholdingAmt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Schedule B Line 8 - PAL Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/GrossInvestmentIncomeAmt/@protectionAgainstLossCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Schedule B Line 8 - PAL Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120PCData/IRS1120PCScheduleB/GrossInvestmentIncomeAmt/@protectionAgainstLossIncmAmt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- END Additional table and begin Left Over Table -->
					<!-- Schedule G Line 11 Table Begin-->
					<xsl:if test="($Print = $Separated) and (count($Form1120PCData/IRS1120PCScheduleG/CapitalAssetDetail)  &gt;=6)">
						<span class="styRepeatingDataTitle">Form 1120PC, Schedule G  Line 11:</span>
						<table class="styDepTbl" style="font-size:6pt;" cellspacing="0">
							<thead class="styTableThead" style="border-color: black; font-size: 7pt;">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:42mm;" rowspan="2" colspan="2" scope="col">(a) <span class="styNormalText">Description of capital <br/>asset</span>
									</th>
									<th class="styDepTblCell" style="width:15mm;" rowspan="2" scope="col">(b) <span class="styNormalText">Date<br/>acquired</span>
									</th>
									<th class="styDepTblCell" style="width: 26mm;" scope="col">(c) <span class="styNormalText">Gross<br/>sales price</span>
									</th>
									<th class="styDepTblCell" style="width: 26mm;" scope="col">(d) <span class="styNormalText">Cost or <br/>other basis</span>
									</th>
									<th class="styDepTblCell" style="width: 26mm;" scope="col">(e) <span class="styNormalText">Expense<br/>of sale</span>
									</th>
									<th class="styDepTblCell" style="width: 26mm;" scope="col">(f) <span class="styNormalText">Depreciation allowed <br/>(or allowable)</span>
									</th>
									<th class="styDepTblCell" style="width: 26mm;border-right-width: 0px;" scope="col">(g) <span class="styNormalText">Loss<br/>((d) plus (e) less <br/>the sum of (c) and (f))</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!-- Begin Separated Repeating data table -->
								<xsl:for-each select="$Form1120PCData//IRS1120PCScheduleG/CapitalAssetDetail">
									<tr style="font-size: 6pt;border-color:black;">
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<!-- First Row -->
										<td class="styTableCell" valign="top" style="border-color: black; width: 4mm;text-align:center;border-right-width:0px;">
											<span class="styBoldText">11
          <!--<xsl:number value="position()"/>-->
											</span>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="border-color: black;width: 38mm; text-align: left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="AssetDesc/BusinessNameLine1"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="GroupMemberNamePartII/BusinessNameLine2"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="GroupMemberEIN"/>
											</xsl:call-template>
											<xsl:if test="$Form1120PCData//IRS1120PCScheduleG/CapitalAssetDetail/EINMissingReason!=' '">
												<span style="font-weight:normal;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form1120PCData//IRS1120PCScheduleG/CapitalAssetDetail/EINMissingReason"/>
													</xsl:call-template>
												</span>
											</xsl:if>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="AssetDesc"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="border-color: black; width: 15mm;text-align:center; ">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="AcquiredDt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="border-color: black; width: 26mm;  text-align: right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GrossSalesPriceAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="border-color: black;  width: 26mm; text-align: right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="border-color: black;  width: 26mm; text-align: right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SaleExpenseAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="border-color: black;  width: 26mm; text-align: right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DepreciationAllowedAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="border-color: black; width: 26mm; text-align: right;border-right-width: 0px; ">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="LossAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
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