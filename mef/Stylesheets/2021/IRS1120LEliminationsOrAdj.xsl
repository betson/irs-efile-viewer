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
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
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
			<body class="styBodyClass"  style="width:187mm">
				<form name="Form1120LEliminationsOrAdj">
				<!-- ******************************************************************************************************* -->				
				<!-- ************* Replace  $Form1120LDat a  with   $RtnDoc/IRS1120LEliminationsOrAdj ******** -->
				<!-- ******************************************************************************************************* -->
				<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:33.3mm;height:21mm;">
                         Form <span class="styFormNumber" style="font-size:20pt">1120-L</span>
							<br/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj"/>
							</xsl:call-template>
							<span style="width:1mm"/>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Form 1120L, Top Left Margin - Supporting Statement to Consolidated Return</xsl:with-param>
								<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/@suprtStmtToCnsldtReturnInd"/>
							</xsl:call-template>
							<br/>
							<br/>
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:120mm;height:21mm;">
							<div class="styMainTitle" style="height:8mm;">U.S. Life Insurance Company Income Tax Return</div>
							<div style="height:5mm;font-size:7pt;margin-left:2mm;text-align:center;">
								For calendar year 2021 or tax year beginning
								<span style="width: 18mm;border-bottom:1px solid black;">
									<!-- No need to send the parameters -->
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/TaxYearBeginDt"/>
									</xsl:call-template>
								</span>, and ending 
								<span style="width: 18mm;border-bottom:1px solid black;">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/TaxYearEndDt"/>
									</xsl:call-template>
								</span>
								<br/>
								<br/>
								<br/>
								<div class="styFST" style="width:125mm;float:left;clear:none;">
									<img src="{$ImagePath}/1120_Bullet_Md.gif" alt="right pointing arrow"/>
									Go to  			
									<a style="text-decoration:none;color:black;" href="http://www.irs.gov/form1120l" title="Link to IRS.gov">
										<i>www.irs.gov/Form1120L</i>
									</a> for instructions and the latest information.
								</div>
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;height:21mm;">
							<div class="styOMB" style="height:4mm;">OMB No. 1545-0123</div>
							<div class="styTY" style="height:11mm;padding-top:3mm;">20<span class="styTYColor">21</span>
							</div>
						</div>
					</div>
					<!-- Header Line A 1 -->
					<div style="width:187mm;float:left;clear:left;">
						<div style="width:33.3mm;height:3mm;float:left;clear:left">
							<div class="styComType" style="width:33.3mm;border-bottom-width: 0px;padding-top:2mm;border-right-width: 1px;">
								<div class="styBoldText" style="height:3mm;width:4mm;float:left;clear:none;">A</div>
								<div class="styGenericDiv" style="height:3mm;width:26mm">Check if:</div>
							</div>
							<div class="styComType" style="width:33.3mm;border-bottom:0px;border-right-width: 1px;">
								<div class="styBoldText" style="height:7mm;width:4mm;float:left;clear:none;padding-top:2mm;">1</div>
								<div class="styGenericDiv" style="height:7mm;width:24mm;padding-top:2mm;">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/ConsolidatedReturnInd"/>
											<xsl:with-param name="BackupName">IRS1120L Consolidated Return</xsl:with-param>
										</xsl:call-template>Consolidated return (attach Form 851)
										<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/ConsolidatedReturnInd"/>
										</xsl:call-template>
									</label>
								</div>
								<div class="styGenericDiv" style="height:7mm;padding-top:2mm;">
									<!--<input type="checkbox" alt="Consolidated return (attached Form 851) checkbox" class="styCkbox">-->
									 <input type="checkbox" alt="Consolidated Return (attach form 851) click the attachment graphic consolidated return 	check box checked  " class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/ConsolidatedReturnInd"/>
											<xsl:with-param name="BackupName">IRS1120L Consolidated Return</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
							</div>
							<br/>
							<br/>
							<!-- Header Line A 2  -->
							<div class="styComType" style="width:33.3mm;border-bottom:0px;border-right-width: 1px;">
								<div class="styBoldText" style="height:7mm;width:4mm;float:left;clear:none;padding-top:2mm;">2</div>
								<div class="styGenericDiv" style="height:7mm;width:24mm;padding-top:2mm;">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/LifeNonlifeConsolidatedRetInd"/>
											<xsl:with-param name="BackupName">IRS1120L Life-Nonlife Consolidated Return</xsl:with-param>
										</xsl:call-template>Life-nonlife consolidated return
									</label>
								</div>
								<div class="styGenericDiv" style="height:7mm;padding-top:2mm;">
									<!--<input type="checkbox" alt="Life-nonlife consolidated return checkbox" class="styCkbox">-->
									<input type="checkbox" alt="Life nonlife Consolidated return  Life nonlife Consolidated return check box checked
 " class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/LifeNonlifeConsolidatedRetInd"/>
											<xsl:with-param name="BackupName">IRS1120L Life-Nonlife Consolidated Return</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
							</div>
							<br/>
							<br/>
							<!-- Header Line A 3 -->
							<div class="styComType" style="width:33.3mm;border-bottom:1px solid black;border-right-width: 1px;height:10.3mm">
								<div class="styBoldText" style="height:10mm;width:4mm;float:left;clear:none;padding-top:2mm;">3</div>
								<div class="styGenericDiv" style="height:10mm;width:24mm;padding-top:2mm;">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/ScheduleM3Form1120LInd"/>
											<xsl:with-param name="BackupName">IRS1120L ScheduleM3 Required</xsl:with-param>
										</xsl:call-template>Schedule M-3 (Form 1120-L) attached
									    <xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/ScheduleM3Form1120LInd"/>
										</xsl:call-template>
									</label>
								</div>
								<div class="styGenericDiv" style="height:10mm;padding-top:2mm;">
									<!--<input type="checkbox" alt="ScheduleM3 (form 1120-L) checkbox" class="styCkbox">-->
									<input type="checkbox" alt="Schedule M3 (Form 1120L) click the attachment graphic schedule M-3 check box checked
" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/ScheduleM3Form1120LInd"/>
											<xsl:with-param name="BackupName">IRS1120L ScheduleM3 Required</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
							</div>
						</div>
						<!-- return header Name box -->
						<div class="styLblNameAddr" style="width:105mm;height:auto;border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
							<div class="styUseLbl" style="width:9mm;height:26.5mm;border-right-width:0px;padding-top:8mm;padding-left:1mm">
							  Please<br/> print<br/> or<br/> type</div>
							<div class="styNameAddr" style="width:95.5mm;height:9mm;border-left-width:1px;padding-left:2mm;">
								Name<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/BusinessName/BusinessNameLine1Txt"/>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/BusinessName/BusinessNameLine2Txt"/>
								</xsl:call-template>
							</div>
							<!-- return header Adress box -->
							<div class="styNameAddr" style="width:95.5mm;height:10mm;border-left-width:1px;padding-left:2mm;">
								Number, street, and room or suite no. If a P.O. box, see instructions.<br/>
								<!-- Address -->
								<!-- USA Address -->
								<xsl:choose>
								<xsl:when test="  $RtnDoc/IRS1120LEliminationsOrAdj/USAddress/AddressLine1Txt!=''">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/USAddress/AddressLine1Txt"/>
									</xsl:call-template>
									<br/>
								<!--</xsl:when>-->
								<!--<xsl:if test="  $RtnDoc/IRS1120LEliminationsOrAdj/USAddress/AddressLine1Txt!=''">-->
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/USAddress/AddressLine2Txt"/>
									</xsl:call-template>
									<br/>
								</xsl:when>
								<xsl:otherwise>
								<!-- Foreign Address -->
								<!--<xsl:if test="  $RtnDoc/IRS1120LEliminationsOrAdj/ForeignAddress/AddressLine1Txt!=''">-->
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/ForeignAddress/AddressLine1Txt"/>
									</xsl:call-template>
									<span class="styTableCellPad"/>
								<!--</xsl:if>-->
								<!--<xsl:if test="  $RtnDoc/IRS1120LEliminationsOrAdj/ForeignAddress/AddressLine2Txt!=''">-->
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/ForeignAddress/AddressLine2Txt"/>
									</xsl:call-template>
									<span class="styTableCellPad"/>
								<!--</xsl:if>-->
								</xsl:otherwise>
							</xsl:choose>
							</div>
							<div class="styNameAddr" style="border-bottom-width:0px;width:95.5mm;border-left-width:1px;padding-left:2mm;height:10mm;">
								City or town, state or province, country, and ZIP or foreign postal code
								<!-- USA Address -->
								<xsl:choose>
								<xsl:when test="  $RtnDoc/IRS1120LEliminationsOrAdj/USAddress/CityNm!=''">
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/USAddress/CityNm"/>
									</xsl:call-template>
									<span class="styTableCellPad"/>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/USAddress/StateAbbreviationCd"/>
									</xsl:call-template>
									<span class="styTableCellPad"/>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/USAddress/ZIPCd"/>
									</xsl:call-template>
									<span class="styTableCellPad"/>
								</xsl:when>
								<xsl:otherwise>
								<!-- Foreign Address -->
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/ForeignAddress/CityNm"/>
									</xsl:call-template>
									<span class="styTableCellPad"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/ForeignAddress/ProvinceOrStateNm"/>
									</xsl:call-template>
									<span class="styTableCellPad"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/ForeignAddress/ForeignPostalCd"/>
									</xsl:call-template>
									<span class="styTableCellPad"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/ForeignAddress/CountryCd"/>
									</xsl:call-template>
									<span class="styTableCellPad"/>
								</xsl:otherwise>
								</xsl:choose>
							</div>
						</div>
						<!-- EIN B Line -->
						<!-- Since this is a main form, we must check for and display an updated EIN.  
								To do this, we use the EINChanged parameter PopulateReturnHeaderFiler.-->
						<div class="styEINDateAssets" style="width:46mm;height:8.5mm;">
							<span class="styBoldText" style="padding-right:1.5mm">B</span>
							<b> Employer identification number</b>
							<br/>
							<br/>
							<span style="padding-left:15mm">
								<xsl:if test="  $RtnDoc/IRS1120LEliminationsOrAdj/CorporationEIN !=' '">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/CorporationEIN"/>
									</xsl:call-template>
									<span style="width: 2px"/>
								</xsl:if>
								<xsl:if test="  $RtnDoc/IRS1120LEliminationsOrAdj/MissingEINReasonCd!=' '">
									<span style="font-weight:normal;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/MissingEINReasonCd"/>
										</xsl:call-template>
									</span>
								</xsl:if>
							</span>
						</div>
						<!-- Header C Date incorparated -->
						<div class="styEINDateAssets" style="width:46mm;height:9.5mm;">
							<span class="styBoldText" style="padding-right:2mm">C </span>Date incorporated<br/>
							<br/>
							<span class="styEINFld" style="padding-left:15mm;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/IncorporationDt"/>
								</xsl:call-template>
							</span>
						</div>
						<!-- Header D Date incorparated -->
						<div class="styEINDateAssets" style="width:46mm;height:8.75mm;border-bottom-width:0px">
							<span class="styBoldText" style="padding-right:1mm">D </span>Check applicable box if an election <br/>
							<span style="padding-left:1mm">  has been made under section(s):</span>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Line D - Section953D Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/Section953dElectionInd/@section953dCd"/>
								<xsl:with-param name="Style">padding-left:4mm;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Line D - Section953D Amount</xsl:with-param>
								<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/Section953dElectionInd/@section953dAmt"/>
								<xsl:with-param name="Style">padding-left:4mm;</xsl:with-param>
							</xsl:call-template>
							<br/><br/><br/>
								<span style="padding-left:.5mm"/>
						<input type="checkbox" alt="Election Made Under Section 953C3C" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/Section953c3CElectionInd"/>
								<xsl:with-param name="BackupName">IRS1120L Election Made Under Section953C3C</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/Section953c3CElectionInd"/>
								<xsl:with-param name="BackupName">IRS1120L Election Made Under Section953C3C</xsl:with-param>
							</xsl:call-template>953(c)(3)(C)
						</label>
						<span style="padding-left:2mm"/>
						<input type="checkbox" alt="Election Made Under Section 953D" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/Section953dElectionInd"/>
								<xsl:with-param name="BackupName">IRS1120L Election Made UnderS ection953D</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/Section953dElectionInd"/>
								<xsl:with-param name="BackupName">IRS1120L Election Made Under Section953D</xsl:with-param>
							</xsl:call-template>953(d)
					    </label>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/Section953dElectionInd"/>
						</xsl:call-template>
					</div>
					</div>
					<!-- Header E -->
					<div class="styBB" style="width:187mm;border-right-width:0px">
						<div class="styBB" style="border-right-width:1px;border-bottom-width:0px;">
							<!-- E 1 -->
							<div class="styGenericDiv" style="width:138mm;height:5mm;">
								<div class="styBoldText" style="float:left;clear:none;padding-right:2mm;padding-top:1.5mm;">E</div>
								  Check if: <span style="width:3mm;"/>
								<span class="styBoldText">(1)</span>
								<span style="width:3px;"/>
								<input type="checkbox" alt="Final Return" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/FinalReturn"/>
										<xsl:with-param name="BackupName">IRS1120L Final Return</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/FinalReturn"/>
										<xsl:with-param name="BackupName">IRS1120L Final Return</xsl:with-param>
									</xsl:call-template>Final return
								</label>
								<!-- E 2 -->
								<span style="width:4px"/>
								<span class="styBoldText">(2)</span>
								<span style="width:3px;"/>
								<input type="checkbox" alt="Name Change" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/NameChange"/>
										<xsl:with-param name="BackupName">IRS1120L Name Change</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/NameChange"/>
										<xsl:with-param name="BackupName">IRS1120L Name Change</xsl:with-param>
									</xsl:call-template>Name change
							    </label>
								<!-- E 3 -->
								<span style="width:4px"/>
								<span class="styBoldText">(3)</span>
								<span style="width:3px;"/>
								<input type="checkbox" alt="Address Change" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/AddressChangeInd"/>
										<xsl:with-param name="BackupName">IRS1120L Address Change Ind</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/AddressChangeInd"/>
										<xsl:with-param name="BackupName">IRS1120L Address Change Ind</xsl:with-param>
									</xsl:call-template>Address change
							    </label>
								<!--E 4 -->
								<span style="width:4px"/>
								<span class="styBoldText">(4)</span>
								<span style="width:3px;"/>
								<input type="checkbox" alt="Amended Return" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/AmendedReturn"/>
										<xsl:with-param name="BackupName">IRS1120L Amended Return</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/AmendedReturn"/>
										<xsl:with-param name="BackupName">IRS1120L Amended Return</xsl:with-param>
									</xsl:call-template>Amended return  <span style="width:2px;hight:1mm"/>
								</label>
							</div>
						</div>
						</div>
					<!--BEGIN Main Form 46 Section-->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS1120VTImageBox" style="height:41.0mm;width:19px;padding-top:14mm;">
							<img src="{$ImagePath}/1120L_Income.gif" alt="Vertical Income"/>
						</div>
						<div style="width:000mm;float:right;clear:none;">
						</div>
						<!-- line 1 -->
						<div class="styLNLeftNumBox" style="height:4mm;padding-left: 3.5mm">1</div>
						<div class="styLNDesc" style="height:4mm;width:133mm;padding-left:1mm">
							<span style="float: left; clear: none;">Gross premiums, etc., less return premiums, etc. Enter balance</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:2mm;">............</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-left:1.5mm">1</div>
						<div class="styLNAmountBox" style="height:4mm;width:32.9mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/GrossPremiumsAmt"/>
							</xsl:call-template>
						</div>
						<!-- line 2 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">2</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span style="float: left; clear: none;">Net decrease, if any, in reserves (Schedule F, line 12)</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:2mm;">..............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;;padding-left:1.5mm">2</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/NetDecreaseInReservesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line3a -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">3a</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span style="float: left; clear: none;">Decrease in reserves under section 807(f)</span>
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;padding-right:2mm;">...................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;padding-left:1.5mm">3a</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select=" $RtnDoc/IRS1120LEliminationsOrAdj/DecrReservesUnderSect807fAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line3b  -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 4.0mm"> b</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span style="float: left; clear: none;">Income from Reserve Transition Relief (see instructions)</span>
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;padding-right:2mm;">..............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;padding-left:1.5mm">3b</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select=" $RtnDoc/IRS1120LEliminationsOrAdj/RsrvTransitionReliefIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line 4 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4.5mm;padding-left: 2.25mm">4</div>
							<div class="styLNDesc" style="width:132mm;height:4.5mm;">
								<span style="float: left; clear: none;">Investment income (Schedule B, line 6) (see instructions)</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:2mm;">..............</span>
							</div>
							<div class="styLNRightNumBox" style="height:5mm;padding-left:1.5mm">4</div>
							<div class="styLNAmountBox" style="height:5mm;width:32.9mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/InvestmentIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line 5 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">5</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span style="float: left; clear: none;">Capital gain net income (Schedule D (Form 1120)</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:2mm;">................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;padding-left:1.5mm">5</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/CapitalGainNetIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line 6 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">6</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span style="float: left; clear: none;">
									Reserved for future use
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/SpecialLossDscntAcctIncomeAmt"/>
									</xsl:call-template>
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:2mm;">.........................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;padding-left:1.5mm">6</div>
					     	<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm;background-color:lightgrey;">
							</div>
						</div>
						<!-- line 7 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">7</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span style="float: left; clear: none;">Other income (attach statement)
									<span style="width:2px;"/>
									<!-- Form to Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/OtherIncomeAmt"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 7 - other Income Item</xsl:with-param>
										<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/OtherIncomeAmt/@otherIncomeDesc"/>
										<xsl:with-param name="Style">padding-left:4mm;</xsl:with-param>
									</xsl:call-template>
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:2mm;">....................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;padding-left:1.5mm">7</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/OtherIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line 8 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:5mm;padding-left: 2.25mm">8</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span style="float: left; clear: none;">Life insurance company gross income. Add lines 1 through 7</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:2mm;">.............</span>
							</div>
							<div class="styLNRightNumBox" style="height:5mm;border-bottom-width:0px;padding-top:1mm;padding-left:1.5mm">8</div>
							<div class="styLNAmountBox" style="height:5mm;border-bottom-width:0px;width:32.9mm;padding-top:1mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/LifeInsuranceGrossIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--END Main Form Income Section-->
					<!--BEGIN Main Form Deduction Section-->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS1120VTImageBox" style="height:90mm;width:19px;padding-top:15mm;">
							<img src="{$ImagePath}/1120L_Deductions.gif" alt="Vertical Deductions (See instructions for limitations on deductions.)"/>
						</div>
						<!-- line 9 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.5mm">9</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span style="float: left; clear: none;">Death benefits, etc.</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:2mm;">.........................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;padding-left:1.5mm">9</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/DeathBenefitsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line 10 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">10</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span style="float: left; clear: none;">Net increase, if any, in reserves (Schedule F, line 12)</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:2mm;">..............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">10</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/NetIncreaseInReservesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line 11a -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">11a</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span style="float: left; clear: none;">Increase in reserves under section 807(f)</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:2mm;">...................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">11a</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/IncrReservesUnderSect807fAmt"/>
								</xsl:call-template>
							</div>
						</div>
							<!-- line 11b -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left:4.5mm"> b</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span style="float: left; clear: none;">Deduction from Transition Relief (see instructions)</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:2mm;">................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">11b</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/TransitionReliefDeductionAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line 12 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">12</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span style="float: left; clear: none;">Deductible policyholder dividends under section 808</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:2mm;">..............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">12</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/DeductiblePolicyholderDivAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line 13 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">13</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span style="float: left; clear: none;">Assumption by another person of liabilities under insurance, etc., contracts
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:2mm;">........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">13</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/LiabilitesAssumptionAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line 14 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">14</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span style="float: left; clear: none;">Dividends reimbursable by taxpayer</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:2mm;">....................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">14</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/ReimbursableDividendsAmt"/>
								</xsl:call-template>
							</div>
						</div>
					<!-- line 15a -->
						<div style="width:181mm;float:right;clear:none;">
						<div class="styLNLeftNumBox" style="height:4mm;">15a</div>
						<div class="styLNDesc" style="width:18mm;height:4mm;">Interest
						<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="right pointing arrow"/>
						<xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/InterestDeductionAmt"/>
						</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:30mm;height:4.5mm;border-top-width:1px; border-bottom-width:1px;border-left-width:1px; border-right-width: 1px;">
						<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/InterestDeductionAmt"/>
						</xsl:call-template>
						</div>
						<!-- line 15b -->
						<div class="styLNLeftNumBox" style="height:4mm;width:5.3mm;">b</div>
						<div class="styLNDesc" style="width:47mm;height:4mm;">Less tax-exempt interest expense
						 </div>
						<div class="styLNAmountBox" style="width:29.9mm;height:4.5mm;border-top-width:1px;border-bottom-width:1px;border-left-width:1px; border-right-width: 1px;">
						<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/TaxExemptInterestExpenseAmt"/>
						</xsl:call-template>
						</div>
						<!-- line 15c -->
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:1.8mm;width:.2mm;  font-weight:bold;">
						<span style="font-weight=normal"/>
						<span style="padding-left:1mm"/>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;border-bottom-width:0px;width:8mm;"/>
						<div class="styLNAmountBox" style="height:5mm;width:32.9mm;border-bottom-width:0px"/>
						</div>
						<!-- ************************************************************************************************** -->
						<!-- line 15a -->
						<div style="width:181mm;float:right;clear:none;">
						<!-- line 15c -->
						<div class="styLNLeftNumBox" style="height:4mm;;padding-left:4mm">c</div>
						<div class="styLNDesc" style="width:132mm;height:4mm;">
						<span style="float: left; clear: none;">Bal
						<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="right pointing arrow"/>
						</span>
						<!--Dotted Line-->
						<span class="styDotLn" style="float:right;padding-right:2mm;">..............................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">15c</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm">
						<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/InterestBalanceAmt"/>
						</xsl:call-template>
						</div>
						</div>
					<!-- ************************************************************************************************** -->
						<!-- line 16 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4.4mm;">16</div>
							<div class="styLNDesc" style="width:132mm;height:4.5mm;">
						<span style="float: left; clear: none;"> Deductible policy acquisition expenses (Schedule G, line 20)</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:2mm;">.............</span>
							</div>
							<div class="styLNRightNumBox" style="height:5mm;">16</div>
							<div class="styLNAmountBox" style="height:5mm;width:32.9mm">
								<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/DedPolicyAcquisitionExpnssAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line 17 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">17</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span style="float: left; clear: none;">Reserved for future use
								<!-- Form to Form Link-->
									<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/SpecialLossDscntAcctDedAmt"/>
									</xsl:call-template>
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:2mm;">........................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">17</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm;background-color:lightgrey;">
							</div>
						</div>
						<!-- line 18 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4.5mm;">18</div>
							<div class="styLNDesc" style="width:132mm;height:4.4mm;">
								<span style="float: left; clear: none;">Other deductions (see instructions) (attach statement)
								<!-- Form to Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/OtherDeductionsAmt"/>
									</xsl:call-template>
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:2mm;">..............</span>
							</div>
							<div class="styLNRightNumBox" style="height:5mm;">18</div>
							<div class="styLNAmountBox" style="height:5mm;width:32.9mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/OtherDeductionsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line 19 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">19</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span style="float: left; clear: none;">Add lines 9 through 18 </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:2mm;">.........................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">19</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/PartialTotalDeductionsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line 20 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">20</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span style="float: left; clear: none;">
									<b>Subtotal. </b> Subtract line 19 from line 8
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:2mm;">....................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">20</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/DeductionsSubtotalAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line 21a -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">21a</div>
							<div class="styLNDesc" style="width:91mm;height:4mm;">
							  Dividends-received and other special deductions (Schedule A, line 22)
								<span style="width:2px;"/>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;">21a</div>
							<div class="styLNAmountBox" style="height:4mm;width:33mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/DividendsReceivedDeductionAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;background-color:lightgrey;border-bottom-width:1px"/>
							<div class="styLNAmountBox" style="height:4mm;width:32.9mm;background-color:lightgrey;border-bottom-width:1px"/>
						</div>
						<!-- line 21b -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftLtrBox" style="height:5mm;">
								<span style="width:4px;"/>
							</div>
							<div class="styLNDesc" style="width:91mm;height:8mm;">
								<b>Plus: b. </b>Net operating loss deduction (see instructions) (attach statement)
								<!-- Form to Form Link  -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/NetOperatingLossDeductionAmt"/>
								</xsl:call-template>
								<span class="styDotLn" style="float:right;padding-right:2mm;">................</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">21b</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:8mm;width:33mm;padding-top:4mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/NetOperatingLossDeductionAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">21c</div>
							<div class="styLNAmountBox" style="border-bottom-width:1px;height:8mm;width:32.9mm;padding-top:4mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/TotalDivReceivedAndOprLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line 22 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">22</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span style="float: left; clear: none;">Gain or (loss) from operations. Subtract line 21c from line 20</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:2mm;">............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">22</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/GainOrLossFromOperationsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line 23 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">23</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span style="float: left; clear: none;">Life insurance company taxable income (LICTI).  Enter line 22 here</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:2mm;">...........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">23</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/LifeInsuranceCoTxblIncmAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line 24 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">24</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								Phased inclusion of balance of policyholders surplus account (see instructions)
								<span style="width:2px;"/>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:2mm;">......</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;border-bottom-width:0px;">24</div>
							<div class="styLNAmountBox" style="height:4mm;border-bottom-width:0px;width:32.9mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/PhasedInclsnPlcyhldrSurplusAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--END Main Form Deductions Section-->
					<!--BEGIN Main Form Tax and Payment Section-->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS1120VTImageBox" style="height:79.5mm;width:19px;padding-top:7mm;">
							<img src="{$ImagePath}/1120L_TaxRefundableCreditAndPayment.gif" alt="Vertical Tax, Refundable Credits, and Payments"/>
						</div>
						<!-- line 25 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">25</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span style="float: left; clear: none;">
									<b>Taxable income. </b>Add lines 23 and 24 (see instructions)</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:2mm;">.............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">25</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/TaxableIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--line 26 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">26</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span style="float: left; clear: none;">
									<b>Total tax.</b> (Schedule K, line 10)
								</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:2mm;">......................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">26</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/TotalTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line 27 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">27</div>
							<div class="styLNDesc" style="width:132mm;height:4mm;">
								<span style="float: left; clear: none;">Reserved for future use</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:2mm;">........................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">27</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm;background-color:lightgrey;">
								<!--<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/NetSection965TaxLiabPaidAmt"/>
								</xsl:call-template>-->
							</div>
						</div>
						<!-- line 28a -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">28a</div>
							<div class="styLNDesc" style="width:56mm;height:4mm;font-size:7pt;">2020 overpayment credited to 2021
							<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:2mm;">..</span>
								</div>
							<div class="styLNRightNumBox" style="height:5mm;padding-top:1mm">28a</div>
							<div class="styLNAmountBox" style="width:28.3mm;height:5mm;padding-top:1.5mm;border-right-width:1px;font-size:6pt;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/PriorYearOverpaymentCreditAmt"/>
								</xsl:call-template>
							</div>
							<div class="styShadingCell" style="width:39.7mm;height:5mm;border-left-width:0px;"/>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:5mm;"/>
							<div class="styLNAmountBoxNBB" style="height:5mm;background-color:lightgrey;"/>
						</div>
						<!-- line 28b -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftLtrBox" style="height:5mm;">&#160;&#160;b</div>
							<div class="styLNDesc" style="width:56mm;height:5mm;font-size:7pt;">
								Reserved for future use
								<span style="width:2px;"/>
								<span class="styDotLn" style="float:right;padding-right:2mm;">.....</span>								
								<!--<span style="letter-spacing:4mm;font-weight:bold">.....</span>-->
							</div>
							<div class="styLNRightNumBox" style="height:5mm;padding-top:1mm">28b</div>
							<div class="styLNAmountBox" style="height:5mm;border-right-width:1px;width:28.3mm;font-size:6pt;padding-top:1.5mm;background-color:lightgrey;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/PriorYearEstimatedTaxPymtAmt"/>
								</xsl:call-template>
							</div>
							<div class="styShadingCell" style="width:39.7mm;height:5mm;border-left-width:0px;"/>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:5mm;"/>
							<div class="styLNAmountBoxNBB" style="height:5mm;background-color:lightgrey;"/>
						</div>
						<!-- line 28c -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftLtrBox" style="height:4mm;">&#160;&#160;c</div>
							<div class="styLNDesc" style="width:56mm;height:4mm;font-size:7pt;">
								2021 estimated tax payments
								<span style="width:2px;"/>
								<span style="letter-spacing:4mm;font-weight:bold">...</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm">28c</div>
							<div class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;width:28.3mm;font-size:6pt;padding-top:1mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/EstimatedTaxPaymentsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styShadingCell" style="width:39.7mm;height:4.5mm;border-left-width:0px;"/>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"/>
							<div class="styLNAmountBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
						</div>
						<!-- line 28d -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftLtrBox" style="height:5m;">&#160;&#160;d</div>
							<div class="styLNDesc" style="width:56mm;height:5mm;font-size:7pt;">Less 2021 refund applied for on Form 4466
							</div>
							<div class="styLNRightNumBox" style="height:5mm;">28d</div>
							<div class="styLNAmountBox" style="width:28mm;height:5mm;border-right-width:0px;font-size:6pt;">(
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="   $RtnDoc/IRS1120LEliminationsOrAdj/OverpaymentOfEstimatedTaxAmt"/>
								</xsl:call-template>)
							</div>
							<!-- line 28e -->
							<div class="styLNRightNumBox" style="height:5mm;">28e</div>
							<div class="styLNAmountBox" style="width:32mm;height:5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="   $RtnDoc/IRS1120LEliminationsOrAdj/TotOvpmtCrAndEstTxPaymentsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:5mm;"/>
							<div class="styLNAmountBoxNBB" style="height:5mm;background-color:lightgrey;"/>
						</div>
						<!-- line 28f -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftLtrBox" style="height:4mm;">&#160;&#160;f</div>
							<div class="styLNDesc" style="width:92mm;height:4mm;">
								<span style="float: left; clear: none;">Tax deposited with Form 7004</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">28f</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/TaxPaidForm7004Amt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"/>
							<div class="styLNAmountBoxNBB" style="height:4.5mm;border-left-width:1px;background-color:lightgrey;"/>
						</div>
						<br class="pageEnd"/>
					<!-- line 28g 1-->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftLtrBox" style="height:4.5mm;">&#160;&#160;g</div>
							<div class="styLNDesc" style="width:45mm;height:4.5mm;">
								Credits <span style="width:7.3mm;"/>
								<span style="font-weight:bold">(1)</span> Form 2439 
							</div>
							<div class="styUnderlineAmount">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/TotalUndistributedLTCapGainAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="display:inline;float:left;clear:none;width:15mm">
							</div>
							<div style="width:12mm;display:inline;float:left;clear:none;">
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 32f(1) - Backup Withholding Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/TotalUndistributedLTCapGainAmt/@backupWithholdingAmt"/>
									<xsl:with-param name="Style">padding-left:2mm;</xsl:with-param>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;width:8.2mm;border-right: 1px solid black"/>
							<div class="styLNAmountBoxNBB" style="width:31.8mm;border-left-width:0px;">
								<span style="padding-right:1mm">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 28G - Ozone Depleting Chemical Indicator</xsl:with-param>
										<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/TotalCreditsAmt/@ozoneDepletingChemicalCd"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"/>
							<div class="styLNAmountBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
							<!-- line 28g 2-->
							<div style="width:181mm;float:right;clear:none;height:4.5mm">
								<div class="styLNDesc" style="width:25mm;"/>
								<div class="styLNDesc" style="width:28mm;height:4.5mm;">
									<span style="font-weight:bold;">(2)</span> Form 4136
								</div>
								<div class="styUnderlineAmount">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/TotalFuelTaxCreditAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="height:6mm;font-weight:bold;width:15mm;">
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;padding-top:1mm">28g</div>
								<div class="styLNAmountBox" style="height:4.5mm;padding-top:0mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/TotalCreditsAmt"/>
									</xsl:call-template>
									<span style="width:1mm;"/>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width: 0px"/>
								<div class="styLNAmountBox" style="height:4.5mm; border-bottom-width: 0px;border-left-width:1px;background-color:lightgrey;"/>
							</div>
						</div>
						<!-- line 28h -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftLtrBox" style="height:5mm;">&#160;&#160;h</div>
							<div class="styLNDesc" style="width:92mm;height:5mm;">
								U.S. income tax paid or withheld at source (attach Form 1042-S)
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/IncomeTaxPaidOrWithheldAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:5mm;">28h</div>
							<div class="styLNAmountBox" style="height:5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/IncomeTaxPaidOrWithheldAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:5mm;background-color:lightgrey;border-top-width:0px"/>
							<div class="styLNAmountBox" style="height:5mm;background-color:lightgrey;border-bottom-width:0px;">
							</div>
						</div>
						<!-- line 28i -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftLtrBox" style="height:5mm;">&#160;&#160;i</div>
							<div class="styLNDesc" style="width:92mm;height:5mm;">
								Reserved for future use 
								<span class="styDotLn" style="float:right;padding-right:2mm;">..............</span>
							</div>
							<div class="styLNRightNumBox" style="height:5mm;">28i</div>
							<div class="styLNAmountBox" style="height:5mm; background-color:lightgrey;">
								<!--<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/NetSection965TaxLiabilityAmt"/>
								</xsl:call-template>-->
							</div>
							<div class="styLNRightNumBoxNBB" style="height:5mm;border-bottom-width:0px; background-color:lightgrey;border-top-width:0px"/>
							<div class="styLNAmountBox" style="height:5mm;background-color:lightgrey;border-bottom-width:0px;">
							</div>
						</div>
						<!-- line 28J and 28K-->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftLtrBox" style="height:5mm;padding-top:1mm;">&#160;&#160;j</div>
							<div class="styLNDesc" style="width:92mm;height:5mm;padding-top:1mm;">
								<span style="float: left; clear: none;">Reserved for future use
								</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">..............</span>
							</div>
							<div class="styLNRightNumBox" style="height:5mm;padding-top:1mm">28j</div>
							<div class="styLNAmountBox" style="height:5mm;padding-top:1mm;background-color:lightgrey;">
							</div>
							<div class="styLNRightNumBoxNBB" style="height:5mm;border-bottom-width:1px;padding-top:1mm">28k</div>
							<div class="styLNAmountBox" style="width:32.9mm;height:5mm;padding-top:1mm">
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 28k - backup Withholding Indicator</xsl:with-param>
									<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/TotalPaymentsAmt/@backupWithholdingTypeCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Line 28k - backup Withholding Amount</xsl:with-param>
								<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/TotalPaymentsAmt/@backupWithholdingAmt"/>
								</xsl:call-template>
								<span style="font-size:6pt;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/TotalPaymentsAmt"/>
								</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- line 29 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:6mm;padding-top:2mm;">29</div>
							<div class="styLNDesc" style="width:132mm;height:6mm;">Estimated tax penalty. Check if Form 2220 is attached
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/Form2220AttachedInd"/>
										<xsl:with-param name="BackupName">IRS1120L Form2220 Attached</xsl:with-param>
									</xsl:call-template>									 
									<span style="width:2px;"/>
								</label>
								<!--Dotted Line-->
								<span style="letter-spacing:4.5mm;font-weight:bold">........</span>
								<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="right pointing arrow"/>
								<span style="width:8px"/>
								<input type="checkbox" alt="Form2220 Attached" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/Form2220AttachedInd"/>
										<xsl:with-param name="BackupName">IRS1120L Form2220 Attached</xsl:with-param>
									</xsl:call-template>
								</input>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/Form2220AttachedInd"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;padding-right:1mm;padding-top:1.5mm;">29</div>
							<div class="styLNAmountBox" style="height:6mm;width:32.9mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/EsPenaltyAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line 30 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4.5mm;">30</div>
							<div class="styLNDesc" style="width:132mm;height:4.5mm;">
								<span style="float: left; clear: none;">
									<b>Amount owed. </b> If line 28k is smaller than the total of lines 26 and 29, enter amount owed</span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:2mm;">...</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;padding-right:1mm">30</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/BalanceDueAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line 31 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4.5mm;">31</div>
							<div class="styLNDesc" style="width:132mm;height:4.5mm;">
								<span style="float: left; clear: none;">
									<b>Overpayment. </b> If line 28k is larger than the total of lines 26 and 29, enter amount overpaid</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">...</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;padding-right:1mm">31</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:32.9mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/OverpaymentSection/OverpaymentAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- line 32 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4.5mm;">32</div>
							<div class="styLNDesc" style="width:79mm;height:4.5mm">
								<span style="font-size:6pt;">Enter amount from line 31: </span>
								<span class="styBoldText"> Credited to 2022 estimated tax</span>
								<span style="width:1px"/>
								<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="right pointing arrow"/>
							</div>
							<div class="styGenericDiv" style="width:32mm;height:4.5mm;padding-top:1mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$RtnDoc/IRS1120LEliminationsOrAdj/OverpaymentSection /AppliedToEsTaxAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="width:21mm;height:4.5mm;font-size:6pt;">
								<span class="styBoldText">Refunded</span>
								<span style="width:2px"/>
								<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="right pointing arrow"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/OverpaymentSection/RefundAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;padding-right:1mm">32</div>
							<div class="styLNAmountBoxNBB" style="height:4.5mm;;width:32.9mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/OverpaymentSection/RefundAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--END Main Form Tax and Payment Section-->
					<br class="pageEnd"/>
					<!-- BEGIN Signature Section -->
					<!-- Implementing the signature section as a table -->
					<table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:6pt;clear:all;">
						<tr>
							<td rowspan="3" style="width:10mm;font-size: 11pt;font-weight:bold;border-right:1px solid black;border-bottom:1px solid black;">Sign Here</td>
							<td colspan="6" style="padding-left:1mm;padding-bottom:1mm;">Under penalties of perjury, I declare that I have examined this return, including accompanying schedules and statements, and to the best of my knowledge and belief, it is true, correct, and complete. Declaration of preparer (other than taxpayer) is based on all information of which preparer has any knowledge. </td>
						</tr>
						<tr>
							<td rowspan="2" style="border-bottom:1px solid black;padding-left:1mm;">
								<img src="{$ImagePath}/1120_Bullet_Lg.gif" alt="right pointing arrow"/>
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
								<img src="{$ImagePath}/1120_Bullet_Lg.gif" alt="right pointing arrow"/>
							</td>
							<td style="width:60mm;border-bottom:1px solid black;vertical-align:bottom;">
								<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">Title</xsl:with-param>
								</xsl:call-template>
							</td>
							<td rowspan="2" style="width:40mm;border-bottom:1px solid black;padding-bottom:1mm;">
								<div class="styGenericDiv" style="width:2px;"/>
								<div style="border-right:3px solid black;border-left:3px solid black;border-bottom:3px solid black;border-top:3px solid black;float:right;padding-left:1mm;" class="styGenericDiv">		
May the IRS discuss this return<br/> with the preparer shown below?. <br/>See instructions.
<input class="styCkbox" alt="May IRS Discuss Return With Prep Yes" type="checkbox" name="Checkbox" id="dummyidyes" style="width:3mm;">
										<xsl:call-template name="PopulateReturnHeaderOfficer">
											<xsl:with-param name="TargetNode">AuthorizeThirdPartyYesCheckbox</xsl:with-param>
											<xsl:with-param name="BackupName">May IRS Discuss Return With Prep</xsl:with-param>
										</xsl:call-template>
									</input>
									<label for="dummyidyes">
										<xsl:call-template name="PopulateReturnHeaderOfficer">
											<xsl:with-param name="TargetNode">AuthorizeThirdPartyYesLabel</xsl:with-param>
											<xsl:with-param name="BackupName">May IRS Discuss Return With Prep</xsl:with-param>
										</xsl:call-template>Yes
									</label>
									<input class="styCkbox" alt="May IRS Discuss Return With Prep No" type="checkbox" name="Checkbox" id="dummyidno" style="width:2.5mm;">
										<xsl:call-template name="PopulateReturnHeaderOfficer">
											<xsl:with-param name="TargetNode">AuthorizeThirdPartyNoCheckbox</xsl:with-param>
											<xsl:with-param name="BackupName">May IRS Discuss Return With Prep</xsl:with-param>
										</xsl:call-template>
									</input>
									<label for="dummyidno">
										<xsl:call-template name="PopulateReturnHeaderOfficer">
											<xsl:with-param name="TargetNode">AuthorizeThirdPartyNoLabel</xsl:with-param>
											<xsl:with-param name="BackupName">May IRS Discuss Return With Prep</xsl:with-param>
										</xsl:call-template>No
									</label>
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
					<!--  *********************************************************************************************************************************  -->
					<!-- BEGIN PREPARER SIGNATURE SECTION -->
					<!-- paid preparer -->
					<div class="styBB" style="width:187mm;font-size:6pt;">
						<div style="width:23mm;height:15mm;padding-top:4mm;padding-bottom:4mm;float:left;clear:none;">
							<span class="styMainTitle" style="font-size:11pt;">
									Paid
									Preparer
									Use Only
									</span>
						</div>
						<div style="width:164mm;float:left;clear:none;">
							<div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
								<div class="styLNDesc" style="height:8mm;width:46.5mm;padding-top:0mm;border-right:1px solid black;border-left:1px solid black;padding-left:1mm;">
								  Print/Type preparer's name<br/>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PreparerPersonGrp/PreparerPersonNm"/>
										<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpPreparerPersonName</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="height:8mm;width:46.5mm;padding-top:0mm;border-right:1px solid black;padding-left:1mm;">
								Preparer's signature
							</div>
								<div class="styLNDesc" style="height:8mm;width:15mm;border-right:1px solid black;padding-top:0mm;padding-left:1mm;">Date <br/>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">DatePrepared</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpDatePrepared</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="height:8mm;width:18mm;border-right:1px solid black;padding-top:0mm;vertical-align:top;padding-bottom:0mm;padding-left:1mm;">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PreparerPersonGrp/SelfEmployedInd"/>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpSelfEmployed</xsl:with-param>
										</xsl:call-template>
										Check 
										<input class="styCkbox" alt="Preparer Person Grp Self Employed" type="checkbox" style="width:4mm;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PreparerPersonGrp/SelfEmployedInd"/>
												<xsl:with-param name="BackupName">$RtnHdr Data Preparer PersonGrpSelfEmployed</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:4.5px;"/>if<br/>self-employed
									</label>
								</div>
								<div class="styLNDesc" style="height:6mm;width:26mm;padding-top:0mm;padding-left:1mm;">PTIN
                				<br/>
									<span style="width:6mm;"/>
									<xsl:choose>
									<xsl:when test="$RtnHdrData/PreparerPersonGrp/SSN">
										<xsl:call-template name="PopulateReturnHeaderPreparer">
											<xsl:with-param name="TargetNode">SSN</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpSSN</xsl:with-param>
										</xsl:call-template>
									</xsl:when>
									 <xsl:otherwise>
									<!--<xsl:if test="$RtnHdrData/PreparerPersonGrp/PTIN">-->
										<xsl:call-template name="PopulateReturnHeaderPreparer">
											<xsl:with-param name="TargetNode">PTIN</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpPTIN</xsl:with-param>
										</xsl:call-template>
									<!--</xsl:if>-->
									 </xsl:otherwise>
                                  </xsl:choose>
								</div>
							</div>
							<div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
								<div class="styLNDesc" style="height:6mm;width:126mm;border-right:1px solid black;border-left:1px solid black;padding-left:1mm;">
									<span class="styGenericDiv" style="">Firm's name 
									<span style="width:2.2mm;"/>
										<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="right pointing arrow"/>
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
									<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="right pointing arrow"/>
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
								<div class="styLNDesc" style="width:126mm;border-right:1px solid black;border-left:1px solid black;padding-left:1mm;height:11mm;">
									<div class="styGenericDiv" style="padding-right:.5mm;">Firm's address 
									<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="right pointing arrow"/>
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
										<xsl:if test="(($RtnHdrData/PreparerFirmGrp/PreparerUSAddress!='') and ($Location='RET'))">
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
										<xsl:if test="(($RtnHdrData/PreparerFirmGrp/PreparerForeignAddress!='') and ($Location='RET'))">
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpForeignAddressCity</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpForeignProvinceOrState</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpForeignPostalCd</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
												<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPreparerPersonGrpFirmGrpForeignCountry</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</div>
								</div>
								<div class="styLNDesc" style="width:32mm;padding-left:1mm;height:11mm;"> Phone no. 
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
					<div class="pageEnd" style="width:187mm;padding-top:1mm;clear:all;float:none;">
						<div style="float:left;">
							<span class="styBoldText">For Paperwork Reduction Act Notice, see separate instructions.</span>
							<span style="width:13mm;"/>                        
							  Cat. No. 11480E 
						</div>
						<div style="float:right;">
							<span style="width:40px;"/>  
						 Form <span class="styBoldText" style="font-size:8pt;">1120-L</span> (2021)
						</div>
					</div>
					<!--div class="pageEnd" /-->
					<!-- END Page Break and Footer-->
					<!--Begin Page 2 -->
					<!-- Page Header -->
					<div class="styBB" style="width:187mm;padding-top:.5mm;float:none;">
						<div style="float:left;">Form 1120-L (2021)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
						</div>
					</div>
					<!-- END Page Header -->
					<!-- BEGIN Schedule A Title -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="width:23mm;">Schedule A</div>
						<div class="styPartDesc" style="width:164mm;">Dividends, Inclusions, Dividends-Received Deduction, and Other Special Deductions
							<span class="styNormalText">(see instructions)</span>
						</div>
					</div>
					<!-- END Schedule A Title -->
					<!-- BEGIN Schedule A Table -->
					<div style="width:187mm;">
						<table class="styTable" style="font-size:7pt;border-bottom:1px solid black;width:187mm;height:auto;" cellspacing="0">
							<thead>
								<tr scope="col">
									<th scope="col" class="styBB" colspan="2" style="width:85mm;border-bottom-width:0px;float:none;clear:none;">
										<div class="styPartDesc" style="width:84mm;text-align:center;">Dividends subject to proration
										</div>
									</th>
									<th class="styBB" style="width:11mm;height:4mm;border-right-width:1px;float:none;clear:none;">
										<span style="width:1px;font-weight:bold;"/>
									</th>
									<th scope="col" class="styLNAmountBox" style="width:45mm;height:8mm;text-align:center;font-size:7pt; padding-top:1mm;font-weight:normal;border-left-width:0px;float:none;clear:none;">
										<b>(a)</b> Dividends and inclusions
									</th>
									<th scope="col" class="styIRS1120LNPercentBox" style="height:8mm;font-size:7pt;float:none;clear:none; padding-top:0mm;font-weight:normal;width:15mm;padding-left:4mm;">
										<b>(b)</b>%
									</th>
									<th scope="col" class="styLNAmountBox" style="width:40mm;height:8mm;text-align:center;font-size:7pt;  padding-top:1mm;font-weight:normal;" colspan="2">
										<b>(c)</b>Deductions <br/>(<b>(a)</b> times <b>(b)</b>)
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody valign="top">
								<!-- SCH A line 1 -->
								<tr>
									<td class="styLNLeftNumBox" style="height:4mm;padding-left:3mm;width:5mm;float:none;clear:none;">1</td>
									<td class="styLNDesc" style="width:65mm;height:5mm;display:inline;text-align:left;float:none;clear:none">
									   Dividends from less-than-20%-owned domestic corporations (other than debt-financed stock)
										<span class="styDotLn" style="float:right;padding-right:2mm;">........</span>
									</td>
									<td class="styBB" style="width:4mm;height:4mm;vertical-align:bottom;border-left-width:1px;text-align:center;float:none;clear:none">
										<span style="width:1px;font-weight:bold">1</span>
									</td>
									<td class="styLNAmountBox" style="width:35mm;height:4mm;vertical-align:bottom;float:none;clear:none">
										<span style="width:1px;"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/DomCorpBelow20OwnDivRcvdAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS1120LNPercentBox" style="height:7mm;vertical-align:bottom;padding-left:3mm;width:15mm;padding-top:3mm;float:none;clear:none">50</td>
									<td class="styLNAmountBox" style="width:40mm;height:7mm;vertical-align:bottom;padding-top:3mm">
										<span style="width:1px;"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/DomCorpBelow20OwnDeductionAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- SCH A line 2 -->
								<tr>
									<td class="styLNLeftNumBox" style="height:7mm;padding-left:3mm;float:none;clear:none;">2</td>
									<td class="styLNDesc" style="width:86mm;height:7mm;;float:none;clear:none;">
									 Dividends from 20%-or-more-owned domestic corporations (other than debt-financed stock)
									<!--Dotted Line-->
										<span class="styDotLn" style="float:right;padding-right:2mm;">........</span>
									</td>
									<td class="styBB" style="width:10mm;height:7mm;vertical-align:bottom;border-left-width:1px;text-align:center;float:none;clear:none;">
										<span style="width:1px;font-weight:bold">2</span>
									</td>
									<td class="styLNAmountBox" style="width:40mm;height:7mm;vertical-align:bottom;;float:none;clear:none;">
										<span style="width:1px;"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/DomCorp20OrMoreOwnDivRcvdAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS1120LNPercentBox" style="height:7mm;vertical-align:bottom;padding-left:3mm;float:none;clear:none;">65</td>
									<td class="styLNAmountBox" style="width:40mm;height:7mm;vertical-align:bottom;float:none;clear:none;" colspan="2">
										<span style="width:1px;"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/DomCorp20OrMoreOwnDeductionAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- SCH A line 3 -->
								<tr>
									<td class="styLNLeftNumBox" style="height:5mm;padding-left:3mm;float:none;clear:none;">3</td>
									<td class="styLNDesc" style="width:84mm;height:5mm;float:none;clear:none;">
										Dividends on certain debt-financed stock of domestic and foreign corporations
										<!--Dotted Line-->
										<span class="styDotLn" style="float:right;padding-right:2mm;">..........</span>
									</td>
									<td class="styBB" style="width:10mm;height:5mm;vertical-align:bottom;border-left-width:1px;text-align:center;float:none;clear:none;">
										<span style="width:1px;font-weight:bold;">3</span>
									</td>
									<td class="styLNAmountBox" style="width:40mm;height:5mm;vertical-align:bottom;float:none;clear:none;">
										<span style="width:1px;"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/DebtFincdStockCorpDivRcvdAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS1120LNPercentBox" style="height:5mm;vertical-align:bottom; font-size:6pt;padding-left:4mm;float:none;clear:none;">
										see instructions
									</td>
									<td class="styLNAmountBox" style="width:40mm;vertical-align:bottom;float:none;clear:none;" colspan="2">
										<span style="width:1px;"/>
										<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/DebtFincdStockCorpDeductionAmt"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/DebtFincdStockCorpDeductionAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- SCH A line 4 -->
								<tr>
									<td class="styLNLeftNumBox" style="height:4mm;padding-left:3mm;float:none;clear:none;">4</td>
									<td class="styLNDesc" style="width:84mm;height:5mm;;float:none;clear:none;">
										Dividends on certain preferred stock of less-than-20%-owned public utilities
										<!-- Dotted Line-->
										<span class="styDotLn" style="float:right;padding-right:2mm;">.............</span>
									</td>
									<td class="styBB" style="width:10mm;height:5mm;border-left-width:1px;text-align:center;float:none;clear:none;">
										<span style="width:1px;font-weight:bold;padding-top:3mm;">4</span>
									</td>
									<td class="styLNAmountBox" style="width:40mm;height:5mm;;float:none;clear:none;padding-top:3mm;">
										<span style="width:1px;"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/PubUtilityBelow20DivRcvdAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS1120LNPercentBox" style="height:5mm;padding-left:3mm;padding-top:3mm;float:none;clear:none;">23.3</td>
									<td class="styLNAmountBox" style="width:40mm;height:5mm;;float:none;clear:none;padding-top:3mm;" colspan="2">
										<span style="width:1px;"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/PubUtilityBelow20DedAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--SCH A  line 5 -->
								<tr>
									<td class="styLNLeftNumBox" style="height:4mm;padding-left:3mm;float:none;clear:none;">5</td>
									<td class="styLNDesc" style="width:84mm;height:4mm;;float:none;clear:none;">
										Dividends on certain preferred stock of 20%-or-more-owned public utilities
										<span class="styDotLn" style="float:right;padding-right:2mm;">.............</span>
									</td>
									<td class="styBB" style="width:10mm;height:4mm;border-left-width:1px;text-align:center;float:none;clear:none;">
										<span style="width:1px;font-weight:bold;padding-top:3mm;">5</span>
									</td>
									<td class="styLNAmountBox" style="width:40mm;height:4mm;;float:none;clear:none;padding-top:3mm;">
										<span style="width:1px;"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/PubUtility20OrMoreDivRcvdAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS1120LNPercentBox" style="height:4mm;padding-left:3mm;padding-top:3mm;float:none;clear:none;">26.7</td>
									<td class="styLNAmountBox" style="width:40mm;height:4mm;;float:none;clear:none;padding-top:3mm;" colspan="2">
										<span style="width:1px;"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/PubUtility20OrMoreDedAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- SCH A line 6 -->
								<tr>
									<td class="styLNLeftNumBox" style="height:4mm;padding-left:3mm;float:none;clear:none;">6</td>
									<td class="styLNDesc" style="width:84mm;height:4mm;;float:none;clear:none;">
										Dividends from less-than-20%-owned foreign corporations and certain foreign sales corporations (FSCs)
										<!--Dotted Line-->
										<span class="styDotLn" style="float:right;padding-right:2mm;">....</span>
									</td>
									<td class="styBB" style="width:10mm;height4mm;border-left-width:1px;text-align:center;vertical-align:bottom;float:none;clear:none;">
										<span style="width:1px;font-weight:bold;">6</span>
									</td>
									<td class="styLNAmountBox" style="width:40mm;height:4mm;vertical-align:bottom;float:none;clear:none;">
										<span style="width:1px;"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/FrgnCorpBelow20OwnDivRcvdAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS1120LNPercentBox" style="height:4mm;padding-left:3mm;vertical-align:bottom;float:none;clear:none;">50</td>
									<td class="styLNAmountBox" style="width:40mm;height:4mm;vertical-align:bottom;float:none;clear:none;" colspan="2">
										<span style="width:1px;"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/FrgnCorpBelow20OwnDeductionAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- SCH A line 7 -->
								<tr>
									<td class="styLNLeftNumBox" style="height:4mm;padding-left:3mm;float:none;clear:none;">7</td>
									<td class="styLNDesc" style="width:84mm;height:4mm;float:none;clear:none;">
									Dividends from 20%-or-more-owned foreign corporations and certain FSCs
										<!--Dotted Line-->
										<span class="styDotLn" style="float:right;padding-right:2mm;">.............</span>
									</td>
									<td class="styBB" style="width:10mm;height:4mm;vertical-align:bottom;border-left-width:1px;text-align:center;float:none;clear:none;">
										<span style="width:1px;font-weight:bold">7</span>
									</td>
									<td class="styLNAmountBox" style="width:40mm;height:4mm;vertical-align:bottom;float:none;clear:none;">
										<span style="width:1px;"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/FrgnCorp20OrMoreOwnDivRcvdAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS1120LNPercentBox" style="height:4mm;vertical-align:bottom;padding-left:3mm;float:none;clear:none;">65</td>
									<td class="styLNAmountBox" style="width:40mm;height:4mm;vertical-align:bottom;float:none;clear:none;" colspan="2">
										<span style="width:1px;"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/FrgnCorp20OrMoreOwnDedAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- SCH A line 8 -->
								<tr>
									<td class="styLNLeftNumBox" style="height:4mm;padding-left:3mm;float:none;clear:none;">8</td>
									<td class="styLNDesc" style="width:84mm;height:4mm;font-size:7pt;float:none;clear:none;">
									 Dividends from wholly-owned foreign subsidiaries and certain FSCs
									<span class="styDotLn" style="float:right;padding-right:2mm;">................</span>
									</td>
									<td class="styBB" style="width:10mm;height:4mm;vertical-align:bottom;border-left-width:1px;text-align:center;float:none;clear:none;">
										<span style="width:1px;font-weight:bold">8</span>
									</td>
									<td class="styLNAmountBox" style="width:40mm;height:4mm;vertical-align:bottom;float:none;clear:none;">
										<span style="width:1px;"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/WhollyOwnFrgnSbsdryDivRcvdAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS1120LNPercentBox" style="height:4mm;vertical-align:bottom;padding-left:3mm;float:none;clear:none;">100</td>
									<td class="styLNAmountBox" style="width:40mm;height:4mm;vertical-align:bottom;float:none;clear:none;" colspan="2">
										<span style="width:1px;"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/WhollyOwnFrgnSbsdryDedAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- SCH A line 9 -->
								<tr>
									<td class="styLNLeftNumBox" style="height:4mm;padding-left:3mm;float:none;clear:none;">9</td>
									<td class="styLNDesc" style="width:84mm;height:4mm;font-size:7pt;float:none;clear:none;">
										<span style="float: left; clear: none;">Dividends from certain affiliated companies</span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">.....</span>
									</td>
									<td class="styBB" style="width:10mm;height:4mm;vertical-align:bottom;border-left-width:1px;text-align:center;float:none;clear:none;">
										<span style="width:1px;font-weight:bold">9</span>
									</td>
									<td class="styLNAmountBox" style="width:40mm;height:4mm;vertical-align:bottom;float:none;clear:none;">
										<span style="width:1px;"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/CertainAffltCompanyDivRcvdAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS1120LNPercentBox" style="height:4mm;vertical-align:bottom;padding-left:3mm;float:none;clear:none;">100</td>
									<td class="styLNAmountBox" style="width:40mm;height:4mm;vertical-align:bottom;float:none;clear:none;" colspan="2">
										<span style="width:1px;"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/CertainAffltCompanyDedAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- SCH A line 10 -->
								<tr>
									<td class="styLNLeftNumBox" style="height:4mm;float:none;clear:none;">10</td>
									<td class="styLNDesc" style="width:84mm;height:4mm;float:none;clear:none;">
										<span style="float: left; clear: none;">Gross dividends-received deduction. Add lines 1 through 9
										<!--<span style="float: left; clear: none;"> through 9</span>-->
										<!--Dotted Line-->
										<!--<span class="styDotLn" style="float:right;padding-right:2mm;">.</span>-->
										</span>
									</td>
									<td class="styBB" style="width:10mm;height:4mm;vertical-align:bottom;border-left-width:1px;text-align:center;float:none;clear:none;">
										<span style="width:1px;font-weight:bold;padding-right:3mm">10</span>
									</td>
									<td class="styBB" style="width:40mm;height:4mm;border-left-width:1px;border-bottom-width: 0px;background-color:lightgrey;float:none;clear:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styIRS1120LNPercentBox" style="border-bottom-width: 0px;float:none;clear:none;height:4mm;vertical-align:bottom;background-color:lightgrey">
										<span style="width:1px;"/>
									</td>
									<td class="styLNAmountBox" style="width:40mm;height:4mm;vertical-align:bottom;float:none;clear:none;" colspan="2">
										<span style="width:1px;"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/GrossDividendsReceivedDedAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- SCH A line 11 -->
								<tr>
									<td class="styLNLeftNumBox" style="height:4mm;float:none;clear:none;">11</td>
									<td class="styLNDesc" style="width:84mm;height:4mm;float:none;clear:none;">
										<span style="float: left; clear: none;">Company share percentage
										</span>
										<!--Dotted Line-->
										<span class="styDotLn" style="float:right;padding-right:2mm;">........</span>
									</td>
									<td class="styBB" style="width:10mm;height:4mm;vertical-align:bottom;border-left-width:1px;  float:none;clear:none;text-align:center;border-bottom-width: 1px;">
										<span style="width:1px;font-weight:bold;height:4mm;padding-right:3mm">11</span>
									</td>
									<td class="styBB" style="width:40mm;height:4mm;border-left-width:1px;background-color:lightgrey;  float:none;clear:none;border-bottom-width: 0px;">
										<span style="width:1px;"/>
									</td>
									<td class="styIRS1120LNPercentBox" style="height:4mm;vertical-align:bottom;background-color:lightgrey;border-bottom-width: 0px;float:none;clear:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styLNAmountBox" style="width:40mm;height:4mm;vertical-align:bottom;float:none;clear:none;font-size:6.0pt;text-align:center;" colspan="2">
										0.7
									</td>
								</tr>
								<!-- SCH A line 12 -->
								<tr>
									<td class="styLNLeftNumBox" style="height:4mm;float:none;clear:none;">12</td>
									<td class="styLNDesc" style="width:84mm;height:4mm;float:none;clear:none;">
										<span style="float: left; clear: none;">Prorated amount. Line 10 times line 11 </span>
										<!--Dotted Line-->
										<span class="styDotLn" style="float:right;padding-right:2mm;">......</span>
									</td>
									<td class="styBB" style="width:10mm;height:4mm;vertical-align:bottom;border-left-width:1px;text-align:center;float:none;clear:none;">
										<span style="width:1px;font-weight:bold;padding-right:3mm">12</span>
									</td>
									<td class="styBB" style="width:40mm;height:4mm;border-left-width:1px;background-color:lightgrey;float:none;clear:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styIRS1120LNPercentBox" style="height:4mm;vertical-align:bottom;background-color:lightgrey;float:none;clear:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styLNAmountBox" style="width:40mm;height:4mm;vertical-align:bottom;float:none;clear:none;" colspan="2">
										<span style="width:1px;"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/ProratedAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- SCH A line header -->
								<tr>
									<td class="styLNLeftNumBox" style="height:4mm;float:none;clear:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styLNDesc" style="width:84mm;height:4mm;text-align:center;font-size:9pt;float:none;clear:none;padding-top: 2mm;">
										<span class="styBoldText">Dividends not subject to proration </span>
									</td>
									<td class="styBB" style="width:10mm;height:7mm;vertical-align:bottom;border-left-width:1px;text-align:center;border-bottom-width:0px;float:none;clear:none;">
										<div style="width:10mm;float:none;clear:none"/>
									</td>
									<td class="styLNAmountBox" style="width:30mm;height:7mm;vertical-align:bottom;border-bottom-width:0px;float:none;clear:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styLNAmountBox" style="width:40mm;height:7mm;border-bottom-width:0px;float:none;clear:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styLNAmountBox" style="width:40mm;height:7mm;vertical-align:bottom;;border-bottom-width:0px;float:none;clear:none;" colspan="2">
										<span style="width:1px;"/>
									</td>
								</tr>
								<!-- SCH A line 13 -->
								<tr>
									<td class="styLNLeftNumBox" style="height:5mm;padding-top: 4.5mm;float:none;clear:none;">13</td>
									<td class="styLNDesc" style="width:84mm;height:5mm;padding-top: 5mm;float:none;clear:none;">
										<span style="float: left; clear: none;">Affiliated company dividends</span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">.........</span>
									</td>
									<td class="styBB" style="width:10mm;height:7mm;vertical-align:bottom;float:none;clear:none; border-left-width:1px;text-align:center">
										<span style="width:1px;font-weight:bold;padding-right:3mm">13</span>
									</td>
									<td class="styLNAmountBox" style="width:40mm;height:7mm;vertical-align:bottom;float:none;clear:none;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/AffiliatedCompanyDivRcvdAmt"/>
										</xsl:call-template>
										<br/>
										<span style="width:1px;"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/AffiliatedCompanyDivRcvdAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS1120LNPercentBox" style="height:5mm;padding-top:4mm; padding-bottom: 0mm;padding-left:3mm;font-size:6pt;text-align:center;float:none;clear:none;">see instructions
									</td>
									<td class="styLNAmountBox" style="width:40mm;height:4mm;vertical-align:bottom;float:none;clear:none;" colspan="2">
										<span style="width:1px;"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/AffiliatedCompanyDivDedAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- SCH A line 14 -->
								<tr>
									<td class="styLNLeftNumBox" style="height:7mm;float:none;clear:none;">14</td>
									<td class="styLNDesc" style="width:84mm;height:7mm;float:none;clear:none;">
										Foreign-source portion of dividends received from a specified 10%-owned foreign corporation (excluding hybrid dividends)
										<!--Dotted Line-->
										<span style="float: left; clear: none;">(see instructions)</span>
										<!-- No Dotted Line-->
										<span class="styDotLn" style="float:right;padding-right:2mm;">...........</span>
									</td>
									<td class="styBB" style="width:10mm;height:4mm;vertical-align:bottom;border-left-width:1px;text-align:center;float:none;clear:none;">
										<span style="width:1px;font-weight:bold;padding-right:3mm;">14</span>
									</td>
									<td class="styLNAmountBox" style="width:40mm;height:4mm;vertical-align:bottom;float:none;clear:none;">
										<span style="width:1px;"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/FrgnSrceDiv10PctOwnDivRcvdAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS1120LNPercentBox" style="height:4mm;vertical-align:bottom;padding-left:3mm;float:none;clear:none;">100</td>
									<td class="styLNAmountBox" style="width:40mm;height:4mm;vertical-align:bottom;float:none;clear:none;" colspan="2">
										<span style="width:1px;"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/FrgnSrceDiv10PctOwnDedAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- SCH A line 15 -->
								<tr>
									<td class="styLNLeftNumBox" style="height:7mm;float:none;clear:none;">15</td>
									<td class="styLNDesc" style="width:84mm;height:7mm;float:none;clear:none;">
										Dividends from foreign corporations not included on line 3, 6, 
										<!--Dotted Line-->
										<span style="float: left; clear: none;">7, 8, or 14(including hybrid dividends)</span>
										<!-- No Dotted Line-->
										<span class="styDotLn" style="float:right;padding-right:2mm;">.......</span>
									</td>
									<td class="styBB" style="width:10mm;height:4mm;vertical-align:bottom;border-left-width:1px;text-align:center;float:none;clear:none;">
										<span style="width:1px;font-weight:bold;padding-right:3mm;">15</span>
									</td>
									<td class="styLNAmountBox" style="width:40mm;height:4mm;vertical-align:bottom;float:none;clear:none;">
										<span style="width:1px;"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/OtherDivForeignCorpTotRcvdAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS1120LNPercentBox" style="border-bottom-width: 1px;height:7mm;vertical-align:bottom;background-color:lightgrey;float:none;clear:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styLNAmountBox" style="width:40mm;height:7mm;vertical-align:bottom;border-bottom-width:1px;background-color:lightgrey;float:none;clear:none;" colspan="2">
										<span style="width:1px;"/>
									</td>
								</tr>
								<!-- SCH A line 16 -->
								<tr>
									<td class="styLNLeftNumBox" style="height:4mm;float:none;clear:none;">16</td>
									<td class="styLNDesc" style="width:84mm;height:4mm;float:none;clear:none;">
										<span style="float: left; clear: none;">Reserved for future use</span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">...........</span>
									</td>
									<td class="styBB" style="width:10mm;vertical-align:bottom;  float:none;clear:none; border-left-width:1px;text-align:center">
										<span style="width:1px;font-weight:bold;padding-right:3mm">16</span>
									</td>
									<td class="styLNAmountBox" style="width:40mm;vertical-align:bottom;float:none;clear:none;background-color:lightgrey;">
										<span style="width:1px;"/>
										<!--<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/Section965aInclusionRcvdAmt"/>
										</xsl:call-template>-->
									</td>
									<td class="styIRS1120LNPercentBox" style="height:4mm;padding-bottom: 0mm;padding-left:3mm;font-size:6pt;text-align:center;float:none;clear:none;background-color:lightgrey;"><!--see instructions-->
										<!--<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/Section965aInclusionPct"/>
										</xsl:call-template>-->
									</td>
									<td class="styLNAmountBox" style="width:40mm;height:4mm;vertical-align:bottom;float:none;clear:none;background-color:lightgrey;" colspan="2">
										<span style="width:1px;"/>
										<!--<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/Section965cDeductionAmt"/>
										</xsl:call-template>-->
									</td>
								</tr>
								<!-- SCH A line 17a -->
								<tr>
									<td class="styLNLeftNumBox" style="height:7mm;float:none;clear:none;">17a</td>
									<td class="styLNDesc" style="width:84mm;height:7mm;float:none;clear:none;">
										Subpart F inclusions derived from the sale by a controlled foreign corporation (CFC) of the stock of a lower-tier foreign corporation treated as a dividend (attach Form(s) 5471) 
										<!--Dotted Line-->
										<span style="float: left; clear: none;">(see instructions)</span>
										<!-- No Dotted Line-->
										<span class="styDotLn" style="float:right;padding-right:2mm;">...........</span>
									</td>
									<td class="styBB" style="width:10mm;height:4mm;vertical-align:bottom;border-left-width:1px;text-align:center;float:none;clear:none;">
										<span style="width:1px;font-weight:bold;padding-right:3mm;">17a</span>
									</td>
									<td class="styLNAmountBox" style="width:40mm;height:4mm;vertical-align:bottom;float:none;clear:none;">
										<span style="width:1px;"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/SubpartFLowTierCFCRcvdAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS1120LNPercentBox" style="border-bottom-width: 1px;height:7mm;vertical-align:bottom;float:none;clear:none;">
										100
									</td>
									<td class="styLNAmountBox" style="width:40mm;height:7mm;vertical-align:bottom;border-bottom-width:1px;float:none;clear:none;" colspan="2">
									<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/SubpartFLowTierCFCDedAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/SubpartFLowTierCFCDedAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- SCH A line 17b -->
								<tr>
									<td class="styLNLeftNumBox" style="height:7mm;float:none;clear:none;padding-left:4mm;">b</td>
									<td class="styLNDesc" style="width:84mm;height:7mm;float:none;clear:none;">
										Subpart F inclusions derived from hybrid dividends of tiered
										<!--Dotted Line-->
										<span style="float: left; clear: none;">corporations (attach Form(s) 5471) (see instructions)</span>
										<!-- No Dotted Line-->
										<span class="styDotLn" style="float:right;padding-right:2mm;">..</span>
									</td>
									<td class="styBB" style="width:10mm;height:4mm;vertical-align:bottom;border-left-width:1px;text-align:center;float:none;clear:none;">
										<span style="width:1px;font-weight:bold;padding-right:3mm;">17b</span>
									</td>
									<td class="styLNAmountBox" style="width:40mm;height:4mm;vertical-align:bottom;float:none;clear:none;">
									<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/SubpartFHybridDivRcvdAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/SubpartFHybridDivRcvdAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS1120LNPercentBox" style="border-bottom-width:1px;height:7mm;vertical-align:bottom;background-color:lightgrey;float:none;clear:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styLNAmountBox" style="width:40mm;height:7mm;vertical-align:bottom;border-bottom-width:1px;float:none;clear:none;background-color:lightgrey;" colspan="2">
										<span style="width:1px;"/>
									</td>
								</tr>
								<!-- SCH A line 17c -->
								<tr>
									<td class="styLNLeftNumBox" style="height:7mm;float:none;clear:none;padding-left:4mm;">c</td>
									<td class="styLNDesc" style="width:84mm;height:7mm;float:none;clear:none;">
										Other inclusions from CFCs under subpart F not included on line 17a, 17b, or 18 (attach Form(s) 5471) (see instructions)										
										<!-- No Dotted Line-->	
									</td>
									<td class="styBB" style="width:10mm;height:4mm;vertical-align:bottom;border-left-width:1px;text-align:center;float:none;clear:none;">
										<span style="width:1px;font-weight:bold;padding-right:3mm;">17c</span>
									</td>
									<td class="styLNAmountBox" style="width:40mm;height:4mm;vertical-align:bottom;float:none;clear:none;">
									<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/OtherSubpartFNotIncludedAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/OtherSubpartFNotIncludedAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS1120LNPercentBox" style="border-bottom-width: 1px;height:7mm;vertical-align:bottom;float:none;clear:none;background-color:lightgrey;">
										<span style="width:1px;"/>
									</td>
									<td class="styLNAmountBox" style="width:40mm;height:7mm;vertical-align:bottom;border-bottom-width:1px;float:none;clear:none;background-color:lightgrey;" colspan="2">
										<span style="width:1px;"/>
									</td>
								</tr>
								<!-- SCH A line 18 -->
								<tr>
									<td class="styLNLeftNumBox" style="height:7mm;float:none;clear:none;">18</td>
									<td class="styLNDesc" style="width:84mm;height:7mm;float:none;clear:none;">
										Global intangible low-taxed income (GILTI) (attach Form(s) 
										<!--Dotted Line-->
										<span style="float: left; clear: none;">5471 and 8992)</span>
										<!-- No Dotted Line-->
										<span class="styDotLn" style="float:right;padding-right:2mm;">.............</span>
									</td>
									<td class="styBB" style="width:10mm;height:4mm;vertical-align:bottom;border-left-width:1px;text-align:center;float:none;clear:none;">
										<span style="width:1px;font-weight:bold;padding-right:3mm;">18</span>
									</td>
									<td class="styLNAmountBox" style="width:40mm;height:4mm;vertical-align:bottom;float:none;clear:none;">
									<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/GILTIReceivedAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/GILTIReceivedAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS1120LNPercentBox" style="border-bottom-width: 1px;height:7mm;vertical-align:bottom;background-color:lightgrey;float:none;clear:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styLNAmountBox" style="width:40mm;height:7mm;vertical-align:bottom;border-bottom-width:1px;background-color:lightgrey;float:none;clear:none;" colspan="2">
										<span style="width:1px;"/>
									</td>
								</tr>								
								<!-- SCH A line 19 -->
								<tr>
									<td class="styLNLeftNumBox" style="height:4mm;float:none;clear:none;">19</td>
									<td class="styLNDesc" style="width:84mm;height:4mm;float:none;clear:none;">
										<span style="float: left; clear: none;">Other corporate dividends </span>
										<!-- No Dotted Line-->
										<span class="styDotLn" style="float:right;padding-right:2mm;">..........</span>
									</td>
									<td class="styBB" style="width:10mm;height:4mm;vertical-align:bottom;border-left-width:1px;text-align:center;float:none;clear:none;">
										<span style="width:1px;font-weight:bold;padding-right:3mm">19</span>
									</td>
									<td class="styBB" style="width:40mm;height:4mm;border-left-width:1px;  border-bottom-width: 1px;vertical-align:bottom;text-align:right;float:none;clear:none;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/OtherDividendsTotRcvdAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS1120LNPercentBox" style="border-bottom-width: 0px;height:4mm;vertical-align:bottom;background-color:lightgrey;float:none;clear:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styLNAmountBox" style="width:40mm;height:4mm;vertical-align:bottom;  background-color:lightgrey;border-bottom-width:0px;float:none;clear:none;" colspan="2">
										<span style="width:1px;"/>
									</td>
								</tr>
								<!-- SCH A line 20 -->
								<tr>
									<td class="styLNLeftNumBox" style="height:7mm;float:none;clear:none;">20</td>
									<td class="styLNDesc" style="width:84mm;height:7mm;float:none;clear:none;">
										<span style="float: left; clear: none;">
											<span class="styBoldText">Total dividends and inclusions.  </span>
											  Add lines 1 through 19, </span>
										<!--Dotted Line-->
										<span style="float: left; clear: none;">column (a). Enter here and on Schedule B, line 2 </span>
										<!-- No Dotted Line-->
										<span class="styDotLn" style="float:right;padding-right:2mm;">...</span>
									</td>
									<td class="styBB" style="width:10mm;height:7mm;vertical-align:bottom;border-left-width:1px;text-align:center;float:none;clear:none;">
										<span style="width:1px;font-weight:bold;padding-right:3mm">20</span>
									</td>
									<td class="styBB" style="width:40mm;height:7mm;border-left-width:1px; vertical-align:bottom;border-bottom-width: 1px;padding-top:4mm;text-align:right;float:none;clear:none;">
										<span style="width:1px;"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/TotDividendsInclusionsRcvdAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS1120LNPercentBox" style="border-bottom-width: 1px;height:7mm;vertical-align:bottom;background-color:lightgrey;float:none;clear:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styLNAmountBox" style="width:40mm;height:7mm;vertical-align:bottom;background-color:lightgrey;float:none;clear:none;" colspan="2">
										<span style="width:1px;"/>
									</td>
								</tr>
								<!-- SCH A line 21 -->
								<tr>
									<td class="styLNLeftNumBox" style="height:4mm;float:none;clear:none;">21</td>
									<td class="styLNDesc" style="width:84mm;height:4mm;float:none;clear:none;">
										<span style="float: left; clear: none;">Section 250 deduction (attach Form 8993) </span>
										<!-- No Dotted Line-->
										<span class="styDotLn" style="float:right;padding-right:2mm;">....</span>
									</td>
									<td class="styBB" style="width:10mm;height:4mm;vertical-align:bottom;border-left-width:1px;text-align:center;float:none;clear:none;">
										<span style="width:1px;font-weight:bold;padding-right:3mm">21</span>
									</td>
									<td class="styBB" style="width:40mm;height:4mm;border-left-width:1px;  border-bottom-width: 1px;vertical-align:bottom;text-align:right;float:none;clear:none;background-color:lightgrey;">
									</td>
									<td class="styIRS1120LNPercentBox" style="border-bottom-width: 1px;height:4mm;vertical-align:bottom;background-color:lightgrey;float:none;clear:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styLNAmountBox" style="width:40mm;height:4mm;vertical-align:bottom;border-bottom-width:1px;float:none;clear:none;" colspan="2">									<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/Section250DeductionAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/Section250DeductionAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- SCH A line 22 -->
								<tr>
									<td class="styLNLeftNumBox" style="height:7mm;float:none;clear:none;border-bottom: 1px solid black;">22</td>
									<td class="styLNDesc" style="width:84mm;height:7mm;float:none;clear:none;border-bottom: 1px solid black;">
										<span class="styBoldText">Total deductions.</span> 
										Add lines 12, 13, 14, 17a, and 21, column (c).  Enter here and on page 1, line 21a
										<!-- Dotted Line-->
										<span class="styDotLn" style="float:right;padding-right:2mm;">......</span>
									</td>
									<td class="styBB" style="width:10mm;height:7mm;vertical-align:bottom;border-left-width:1px;text-align:center;border-bottom-width: 1px;float:none;clear:none;">
										<span style="width:1px;font-weight:bold;padding-right:3mm">22</span>
									</td>
									<td class="styBB" style="width:40mm;height:7mm;border-left-width:1px;border-bottom-width: 1px;background-color:lightgrey;float:none;clear:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styIRS1120LNPercentBox" style="border-bottom-width: 1px;height:7mm;vertical-align:bottom;background-color:lightgrey;float:none;clear:none;">
										<span style="width:1px;"/>
									</td>
									<td class="styLNAmountBox" style="width:40mm;height:7mm;vertical-align:bottom;border-bottom-width:1px;float:none;clear:none;" colspan="2">
										<span style="width:1px;"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS1120LScheduleA/DividendsReceivedDeductionAmt"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- BEGIN Schedule B Title -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="width:23mm;">Schedule B</div>
						<div class="styPartDesc" style="width:164mm;">Investment Income<span class="styNormalText">(see instructions)</span>
						</div>
					</div>
					<!-- END Schedule B Title -->
					<!-- SCH B line 1 -->
					<div style="width:187mm;clear:all;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:3mm">1</div>
						<div class="styLNDesc" style="height:4mm;">
							<span style="float: left; clear: none;">Interest (excluding tax-exempt interest)
							<!-- Form to Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS1120LScheduleB/TaxableInterestAmt"/>
								</xsl:call-template>
							</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:2mm;">....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">1</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleB/TaxableInterestAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCH B line 2 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:3mm">2</div>
						<div class="styLNDesc" style="height:4mm;">
							<span style="float: left; clear: none;">Total dividends and inclusions (Schedule A, line 20, column (a))</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:2mm;">............</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">2</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleB/TotDividendsInclusionsRcvdAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCH B line 3 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:3mm">3</div>
						<div class="styLNDesc" style="height:4mm;">
							<span style="float: left; clear: none;">Rents</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:2mm;">................................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">3</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleB/GrossRentsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCH B line 4 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:3mm">4</div>
						<div class="styLNDesc" style="height:4mm;">
							<span style="float: left; clear: none;">Royalties</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:2mm;">...............................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">4</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleB/GrossRoyaltiesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCH B line 5 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:3mm">5</div>
						<div class="styLNDesc" style="height:4mm;">
							<span style="float: left; clear: none;">Leases, terminations, etc.</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:2mm;">.........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">5</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleB/GrossIncomeFromLeasesTermAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCH B line 6 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;padding-left:3mm">6</div>
						<div class="styLNDesc" style="height:5mm;">
							<span style="float: left; clear: none;">Investment income. Add lines 1 through 5. Enter here and on page 1, line 4</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:2mm;">..........</span>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;border-bottom-width:0px;">6</div>
						<div class="styLNAmountBox" style="height:5mm;border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleB/InvestmentIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;clear:all;float:none;">
						<div style="float:left;"/>
						<div style="float:right;">
							<span style="width:40px;"/>  
							Form <span class="styBoldText" style="font-size:8pt;">1120-L</span> (2021)
						</div>
					</div>
					<!-- END Page Break and Footer-->
					<!--Begin Page 3 -->
					<!-- Page Header -->
					<div class="styBB" style="width:187mm;padding-top:.5mm;clear:all;float:none">
						<div style="float:left;">Form 1120-L (2021)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">3</span>
						</div>
					</div>
					<!-- END Page Header -->
					<!-- BEGIN Schedule F Title -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="width:23mm;">Schedule F</div>
						<div class="styPartDesc" style="width:164mm;height:auto;">Increase (Decrease) in Reserves<span class="styNormalText">(section 807) </span>
						 <span class="styNormalText">(see instructions)</span>
						</div>
					</div>
					<!-- - table header  -->
					<div style="width:187mm;clear:all;">
						<div class="styLNLeftNumBox" style="height:4.5mm;"/>
						<div class="styLNDesc" style="width:99mm;height:4.5mm;"/>
						<div class="styLNRightNumBox" style="height:4.5mm;border-left-width:0px"/>
						<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;width:40mm;text-align:center;">
							<b>(a)</b>Beginning of tax year</div>
						<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:1px;text-align:center">
							<b>(b)</b> End of tax year
						</div>
					</div>
					<!-- SCH F line 1 -->
					<div style="width:187mm;clear:all;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm">1 </div>
						<div class="styLNDesc" style="width:99mm;height:4.5mm;">
							<span style="float: left; clear: none;">Life insurance reserves</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">1 </div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;width:40mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/LifeInsuranceReservesBOYAmt"/>
							</xsl:call-template>
						</div>
						<!--<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:1px"/>-->
						<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/LifeInsuranceReservesEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCH F line 2 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm">2 </div>
						<div class="styLNDesc" style="width:99mm;height:4.5mm;">
							<span style="float: left; clear: none;">Unearned premiums and unpaid losses</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">............</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">2 </div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;width:40mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/UnearnedPremUnpaidLossesBOYAmt"/>
							</xsl:call-template>
						</div>
						<!--<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:1px"/>-->
						<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/UnearnedPremUnpaidLossesEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCH F line 3 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm">3 </div>
						<div class="styLNDesc" style="width:99mm;height:4.5mm;">
							<span style="float: left; clear: none;">Supplementary contracts</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">3 </div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;width:40mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/SupplementaryContractsBOYAmt"/>
							</xsl:call-template>
						</div>
					<!--	<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:1px"/>-->
						<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/SupplementaryContractsEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCH F line 4 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm">4 </div>
						<div class="styLNDesc" style="width:99mm;height:4.5mm;">
							<span style="float: left; clear: none;">Dividend accumulations and other amounts</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">..........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">4 </div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;width:40mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/DividendAccumulationsBOYAmt"/>
							</xsl:call-template>
						</div>
						<!--<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:1px"/>-->
						<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/DividendAccumulationsEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCH F line 5 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm">5 </div>
						<div class="styLNDesc" style="width:99mm;height:4.5mm;">
							<span style="float: left; clear: none;">Advance premiums</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">..................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">5 </div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;width:40mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/AdvancePremiumsBOYAmt"/>
							</xsl:call-template>
						</div>
						<!--<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:1px"/>-->
						<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/AdvancePremiumsEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCH F line 6 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm">6 </div>
						<div class="styLNDesc" style="width:99mm;height:4.5mm;">
							<span style="float: left; clear: none;">Special contingency reserves</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">..............</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">6 </div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;width:40mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/SpecialContingencyBOYAmt"/>
							</xsl:call-template>
						</div>
						<!--<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:1px"/>-->
						<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/SpecialContingencyEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCH F line 7 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm">7 </div>
						<div class="styLNDesc" style="width:99mm;height:4.5mm;">Add lines 1 through 6
							<span class="styDotLn" style="float:right;padding-right:2mm;">.................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">7 </div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;width:40mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/TotalReservesBOYAmt"/>
							</xsl:call-template>
						</div>
						<!--<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:1px"/>-->
						<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/TotalReservesEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCH F line 8-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:3mm">8 </div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">
							Increase (decrease) in reserves under section 807.  Subtract line 7, column (a) from line 7, column (b)
							<span class="styDotLn" style="float:right;padding-right:2mm;">..</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.5mm;">8</div>
						<div class="styLNAmountBoxNBB" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/ReservesIncrDecreaseSect807Amt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCH F line 9 -->
							<!-- SCH F line 9 -->
					<!-- Part II line 9a -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;padding-left:3mm">9a</div>
						<div class="styLNDesc" style="width:99mm;height:5mm;">
						Tax-exempt interest
							<span class="styDotLn" style="float:right;padding-right:2mm;">.................</span>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;padding-top:1mm;border-bottom-width:1px;">9a</div>
						<div class="styLNAmountBox" style="width:32mm;border-bottom-width:1px;height:5mm;border-bottom-width:1px;padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/TaxExemptInterestAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;background-color:lightgrey;border-bottom-width:0px;border-top-width:1px;"/>
						<div class="styLNAmountBox" style="height:5mm;background-color:lightgrey;border-bottom-width:0px;border-top-width:1px;"/>
					</div>
				<!-- Part II line 9b -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:7mm;padding-left:5.0mm">b</div>
						<div class="styLNDesc" style="width:99mm;height:7mm;">
						 Increase in policy cash value of section 264(f) policies as defined in section 805(a)(4)(F)
							<span class="styDotLn" style="float:right;padding-right:2mm;">...................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;padding-top:3mm;border-bottom-width:1px;">9b</div>
						<div class="styLNAmountBox" style="width:32mm;border-bottom-width:1px;height:7mm;border-bottom-width:1px;padding-top:3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/IncrPolicyCashValueSect264fAmt"/>
							</xsl:call-template>
						</div>
							<div class="styLNRightNumBox" style="height:7mm;background-color:lightgrey;border-bottom-width:0px;border-top-width:0px;"/>
						<div class="styLNAmountBox" style="height:7mm;background-color:lightgrey;border-bottom-width:0px;border-top-width:0px;"/>
					</div>
		<!-- Part II line 9c -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:6mm;padding-left:5.0mm">c</div>
						<div class="styLNDesc" style="width:99mm;height:6mm;">
						Add lines 9a and 9b
							<span class="styDotLn" style="float:right;padding-right:2mm;">.................</span>
						</div>
						<div class="styLNRightNumBox" style="height:6mm;padding-top:2mm;border-bottom-width:1px;">9c</div>
						<div class="styLNAmountBox" style="width:32mm;border-bottom-width:1px;height:6mm;border-bottom-width:1px;padding-top:2mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/TaxExemptInterestIncrInPlcyAmt"/>
							</xsl:call-template>
						</div>
							<div class="styLNRightNumBox" style="height:6mm;background-color:lightgrey;border-bottom-width:0px;border-top-width:0px;"/>
						<div class="styLNAmountBox" style="height:6mm;background-color:lightgrey;border-bottom-width:0px;border-top-width:0px;"/>
					</div>
					<div style="width:187mm;">
						<xsl:choose>
							<xsl:when test="string-length($IRS1120LScheduleF/InvestmentIncomeRt) &gt; 15">
									<div class="styLNLeftNumBox" style="height:4.5mm;">10</div>
									<div class="styLNDesc" style="width:139mm;height:4mm;">
										<span class="styBoldText">Policyholders share percentage </span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">......................</span>
									</div>
									<div class="styLNRightNumBox" style="height:4.5mm;border-top-width:0px;border-bottom-width:1px;">10</div>
									<div class="styLNAmountBox" style="height:4.5mm;border-top-width:0px;border-bottom-width:1px;font-size:5.5pt;">30%
								</div>
							</xsl:when>
							<xsl:otherwise>
								<div style="width:187mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm;">10</div>
									<div class="styLNDesc" style="width:139mm;height:4mm;">
										<span class="styBoldText">Policyholders share percentage </span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">......................</span>
									</div>
									<div class="styLNRightNumBox" style="height:4.5mm;border-top-width:0px;border-bottom-width:1px;">10</div>
									<div class="styLNAmountBox" style="height:4.5mm;border-top-width:0px;border-bottom-width:1px;">30%
									</div>
								</div>
							</xsl:otherwise>
						</xsl:choose>
					</div>
					<!-- SCH F line 11 -->
					<div style="width:187mm;clear:all;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">11</div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">
							Policyholders share of tax-exempt interest and the increase in policy cash value of section 264(f)
							<span style="float: left; clear: none;">policies as defined in section 805(a)(4)(F). Multiply line 9c by line 10</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">............</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">11</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:4mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/ShrTxExmptIntIncrInPlcyAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCH F line 12 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">12</div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">
							<span class="styBoldText">Net increase (decrease) in reserves. </span>
								Subtract line 11 from line 8. If an increase, enter here and on 
							<span style="float: left; clear: none;">page 1, line 10. If a decrease, enter here and on page 1 line 2</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">..............</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:8mm;padding-top:4mm">12</div>
						<div class="styLNAmountBoxNBB" style="height:8mm;padding-top:4mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleF/NetIncrDecrInReservesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN Schedule G Title -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="width:23mm;">Schedule G</div>
						<div class="styPartDesc" style="width:164mm;">Policy Acquisition Expenses 
							<span style="font-weight: normal">(section 848) (see instructions)</span>
						</div>
					</div>
					<!-- SCH G header line -->
					<div style="width:187mm;clear:all;">
						<div class="styLNLeftNumBox" style="height:4.5mm;"/>
						<div class="styLNDesc" style="width:75mm;height:4mm;"/>
						<div class="styLNRightNumBoxNBB" style="height:8mm;padding-top:4mm;border-left-width:0px;border-bottom-width:1px;"/>
						<div class="styLNAmountBox" style="height:8mm;width:32mm;text-align:center;border-bottom-width:1px">
							<span class="styBoldText">(a) </span> Annuity</div>
						<div class="styLNAmountBox" style="height:8mm;width:32mm;text-align:center;border-bottom-width:1px">
							<span class="styBoldText">(b) </span> Group life<br/> insurance</div>
						<div class="styLNAmountBox" style="height:8mm;width:32mm;text-align:center;border-bottom-width:1px">
							<span class="styBoldText">(c) </span> Other </div>
					</div>
					<!-- SCH G line 1 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm">1</div>
						<div class="styLNDesc" style="width:75mm;height:4mm;">
							<span style="float: left; clear: none;">Gross premiums and other consideration</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">1</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:32mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/GrossPremiumsAnnuityAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:32mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/GrossPremiumsGroupLifeInsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:32mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/GrossPremiumsOtherAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCH G line 2 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm">2</div>
						<div class="styLNDesc" style="width:75mm;height:4mm;">
							<span style="float: left; clear: none;">Return premiums and premiums and other consideration </span>
							<span style="float: left; clear: none;">incurred for reinsurance</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">..........</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">2</div>
						<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:4mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/ReturnPremiumsAnnuityAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:4mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/ReturnPremiumsGroupLifeInsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:4mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/ReturnPremiumsOtherAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCH G line 3 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm">3</div>
						<div class="styLNDesc" style="width:75mm;height:4mm;">
							<span style="float: left; clear: none;"><b>Net premiums.</b> Subtract line 2 from line 1</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">....</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">3</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:32mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/NetPremiumsAnnuityAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:32mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/NetPremiumsGroupLifeInsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:32mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/NetPremiumsOtherAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCH G line 4 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm">4</div>
						<div class="styLNDesc" style="width:75mm;height:4mm;">
							<span style="float: left; clear: none;">Net premium percentage (see instructions) </span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">....</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">4</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:32mm;font-size:6pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/NetPremiumAnnuityPct"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:32mm;font-size:6pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/NetPremiumGroupLifeInsPct"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:32mm;font-size:6pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/NetPremiumOtherPct"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCH G line 5 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm">5</div>
						<div class="styLNDesc" style="width:75mm;height:4mm;">
							<span style="float: left; clear: none;">Multiply line 3 by line 4</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">..........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">5</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:32mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/AdjNetPremiumsAnnuityAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:32mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/AdjNetPremiumsGroupLifeInsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:32mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/AdjNetPremiumsOtherAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCH G line 6 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;padding-left:3mm">6 </div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">
							<span style="float: left; clear: none;">Combine line 5, columns (a), (b), and (c), and enter here. If zero or less, enter -0- on lines 7 and 8</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">..</span>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;">6</div>
						<div class="styLNAmountBox" style="height:5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/NegativeCapitalizationAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCH G line 7 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;padding-left:3mm">7 </div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">
							<span style="float: left; clear: none;">Unused balance of negative capitalization amount from prior years</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">............</span>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;">7</div>
						<div class="styLNAmountBox" style="height:5mm;">(
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/UnsdBalNegCapitalizationPYAmt"/>
							</xsl:call-template>)
						</div>
					</div>
					<!-- SCH F line 8 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;padding-left:3mm">8 </div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">
							<span style="float: left; clear: none;">Combine lines 6 and 7. If zero or less, enter -0-
							</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">..................</span>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;">8</div>
						<div class="styLNAmountBox" style="height:5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/TotalNegativeCapitalizationAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCH G line 9 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;padding-left:3mm">9 </div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">
							<span style="float: left; clear: none;">General deductions (attach statement)
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/GeneralDeductionsAmt"/>
								</xsl:call-template>
							</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;">9</div>
						<div class="styLNAmountBox" style="height:5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/GeneralDeductionsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCH G line 10 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">10</div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">
							<span style="float: left; clear: none;">Enter the lesser of line 8 or line 9</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">.......................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">10</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/SmallerAmt"/>
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
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/DeductibleGeneralDeductionsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCH G line 12-1 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;">12</div>
						<div class="styLNDesc" style="width:139mm;height:5mm;">
							<span style="float: left; clear: none;">If the amount on line 6 is negative, enter it as a positive amount. If the amount on line 6 is positive,
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="height:5mm;border-bottom-width:0px">
						</div>
					</div>
					<!-- SCH G line 12-2 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;"/>
						<div class="styLNDesc" style="width:139mm;height:5mm;">
							<span style="float: left; clear: none;">enter -0-</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">..............................</span>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;padding-top:1mm">12</div>
						<div class="styLNAmountBox" style="height:5mm;;padding-top:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/AdjNegativeCapitalizationAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCH G line 13 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;">13 </div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">
							<span style="float: left; clear: none;">Unamortized specified policy acquisition expenses from prior years</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">............</span>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;">13</div>
						<div class="styLNAmountBox" style="height:5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/UnamortzSpcfdPlcyAcqExpnssAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCH G line 14 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">14</div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">
							<span style="float: left; clear: none;">Deductible negative capitalization amount. Enter the lesser of line 12 or line 13</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">14</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/DedNegativeCapitalizationAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCH G line 15a -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:8mm;">15a </div>
						<div class="styLNDesc" style="width:99mm;height:8mm;">
							Tentative 60-month specified policy acquisition expenses. Enter amount 
							<span style="float: left; clear: none;">from line 10, but not more than $5 million</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">..........</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">15a </div>
						<div class="styLNAmountBox" style="width:40mm;border-bottom-width:1px;height:8mm;padding-top:4mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/Tentative60MonthSpcfdPlcyAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:8mm;background-color:lightgrey;;border-bottom-width:0px"/>
					</div>
					<!-- SCH G line 15b -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;padding-left:4mm">b </div>
						<div class="styLNDesc" style="width:99mm;height:5mm;">
							<span style="float: left; clear: none;">Limitation</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">.....................</span>
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
							<span style="float: left; clear: none;">Phase-out amount. Subtract line 15b from line 10. If zero or less,</span>
							<span style="float: left; clear: none;">enter -0-</span>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;padding-top:1mm">16 </div>
						<div class="styLNAmountBox" style="width:40mm;border-bottom-width:1px;height:5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/PhaseOutAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:5mm;background-color:lightgrey;border-bottom-width:0px"/>
					</div>
					<!-- SCH G line 17a -1-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">17a </div>
						<div class="styLNDesc" style="width:99mm;height:4mm;">
							<span style="float: left; clear: none;">Current year 60-month specified policy acquisition expenses. Subtract</span>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;border-bottom-width:0px"> </div>
						<div class="styLNAmountBox" style="width:40mm;border-bottom-width:0px;height:5mm">
						</div>
						<div class="styLNAmountBox" style="height:5mm;background-color:lightgrey;border-bottom-width:0px"/>
					</div>
					<!-- SCH G line 17a-2 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;"> </div>
						<div class="styLNDesc" style="width:99mm;height:4.5mm;">
							<span style="float: left; clear: none;">line 16 from line 15a. If zero or less, enter -0-</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">.........</span>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;">17a </div>
						<div class="styLNAmountBox" style="width:40mm;border-bottom-width:1px;height:5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/CurrentYear60MonthSpcfdPlcyAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:5mm;background-color:lightgrey;border-bottom-width:0px"/>
					</div>
					<!-- SCH G line 17b -->
					<!-- SCH G line 17b -->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:5mm">
							<span style="width:4px;padding-top:2mm"/>b</div>
						<div class="styLNDesc" style="width:139mm;height:6mm;">
							Enter 10% (0.10) of line 17a
							<span style="letter-spacing:4mm;font-weight:bold">....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:6mm;padding-top:2mm">17b</div>
						<div class="styLNAmountBox" style="height:6mm;padding-top:2mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/CY60MonthSpcfdPlcyPctAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCH G line 18a -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:8mm;">18a </div>
						<div class="styLNDesc" style="width:99mm;height:8mm;">
							Current year 180-month specified policy acquisition expenses. Subtract line 17a from line 10
							<span style="letter-spacing:4mm;font-weight:bold">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">18a </div>
						<div class="styLNAmountBox" style="width:40mm;border-bottom-width:1px;height:8mm;padding-top:4mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/CYMonthSpcfdPolicyAcquisAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:8mm;background-color:lightgrey;;border-bottom-width:0px"/>
					</div>
					<!-- SCH G line 18b -->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:5mm;">
							<span style="width:4px;padding-top:1mm;"/>b</div>
						<div class="styLNDesc" style="width:139mm;height:5mm;padding-top:1mm">
							<span style="float: left; clear: none;">Enter 3.34% (0.0334) of line 18a</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">.......................</span>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;padding-top:1mm">18b</div>
						<div class="styLNAmountBox" style="height:5mm;padding-top:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/CYMonthSpcfdPolicyAcquisPctAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCH G line 19-1 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;">19 </div>
						<div class="styLNDesc" style="width:139mm;height:5mm;">
							<span style="float: left; clear: none;">Enter the applicable amount of amortization from specified policy acquisition expenses capitalized in </span>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="height:5mm;border-bottom-width:0px">
						</div>
					</div>
					<!-- SCH G line 19-2 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;"/>
						<div class="styLNDesc" style="width:139mm;height:5mm;">
							<span style="float: left; clear: none;">prior years and deductible this year. Attach statement 
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/AmortzSpcfdPlcyAcqExpnssAmt"/>
								</xsl:call-template>
							</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;padding-top:1mm">19</div>
						<div class="styLNAmountBox" style="height:5mm;padding-top:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/AmortzSpcfdPlcyAcqExpnssAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCH G line 20 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;">20 </div>
						<div class="styLNDesc" style="width:139mm;height:5mm;">
							<span style="float: left; clear: none;">
								<b>Deductible policy acquisition expenses.</b> Add lines 14, 17b, 18b, and 19. Enter here and on page 1,</span>
							<span style="float: left; clear: none;">line 16</span>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;border-bottom-width:0px">20</div>
						<div class="styLNAmountBox" style="height:5mm;border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleG/DedPolicyAcquisitionExpnssAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;clear:all;float:none;">
						<div style="float:left;"/>
						<div style="float:right;">
							<span style="width:40px;"/>Form <span class="styBoldText" style="font-size:8pt;">1120-L</span> (2021)
						</div>
					</div>
					<!-- END Page Break and Footer-->
					<!--Begin Page 4 -->
					<!-- Page Header -->
					<div class="styBB" style="width:187mm;padding-top:.5mm;clear:all;float:none;">
						<div style="float:left;">Form 1120-L (2021)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">4</span>
						</div>
					</div>
					<!-- BEGIN Schedule K Title -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="width:23mm;">Schedule K</div>
						<div class="styPartDesc" style="width:164mm;">Tax Computation
							<span class="styNormalText"> (see instructions)</span>
						</div>
					</div>
					<!-- SCH K line 1 -->
					<div style="width:187mm;clear:all;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:3mm;padding-top:2mm">1</div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">
							Check if the corporation is a member of a controlled group (attach Schedule O (Form 1120))
							<span style="letter-spacing:4mm;font-weight:bold">.</span>
							<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="right pointing arrow"/>
							<span style="width:4px"/>
							<input type="checkbox" alt="Member Of Controlled Group" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/MemberOfControlledGroupInd"/>
									<xsl:with-param name="BackupName">Member Of ControlledGroup</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/MemberOfControlledGroupInd"/>
									<xsl:with-param name="BackupName">Member Of ControlledGroup</xsl:with-param>
								</xsl:call-template>
								<span style="width:2px;"/>
								<!-- Form to Form Link  -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/MemberOfControlledGroupInd"/>
								</xsl:call-template>
							</label>							
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;background-color:lightgrey"/>
					</div>
					<!-- SCH K line 2 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:3mm">2</div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">
							<span style="float: left; clear: none;">Income tax
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Schedule K Line 2 - differential Rate316 Indicator</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/IncomeTaxAmt/@differentialRate316Cd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Schedule K Line 2 - differential Rate316 Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/IncomeTaxAmt/@differentialRate316Amt"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Schedule K Line 2 - section 1291 Indicator</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/IncomeTaxAmt/@section1291Cd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Schedule K Line 2 - section 1291 Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/IncomeTaxAmt/@section1291Amt"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Schedule K Line 2 - section1291 Interest Indicator</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/IncomeTaxAmt/@section1291InterestCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Schedule K Line 2 - section 1291 Interest Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/IncomeTaxAmt/@section1291InterestAmt"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Schedule K Line 2 - section197 Indicator</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/IncomeTaxAmt/@section197Cd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Schedule K Line 2 - section197 Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/IncomeTaxAmt/@section197Amt"/>
								</xsl:call-template>
								
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Schedule K Line 02 - form 8978 Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/IncomeTaxAmt/@form8978Cd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Schedule K Line 02 - form 8978 Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/IncomeTaxAmt/@form8978Amt"/>
								</xsl:call-template>
							</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">.....................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:5mm;border-bottom-width:1px;">2</div>
						<div class="styLNAmountBoxNBB" style="height:5mm;border-bottom-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/IncomeTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCH K line 3 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:3mm">3</div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">
							<span style="float: left; clear: none;">Base erosion minimum tax amount (attach Form 8991)		
								<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/BaseErosionMinimumTaxAmt"/>
								</xsl:call-template>
							</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">...............</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:5mm;border-bottom-width:1px;">3</div>
						<div class="styLNAmountBoxNBB" style="height:5mm;border-bottom-width:1px;">
						<!-- Form to Form Link -->
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/BaseErosionMinimumTaxAmt"/>
						</xsl:call-template>
							<span style="width:1px;"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/BaseErosionMinimumTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCH K line 4 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:3mm">4</div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">
							<span style="float: left; clear: none;">Add lines 2 and 3</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">............................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;border-bottom-width:1px;">4</div>
						<div class="styLNAmountBoxNBB" style="height:4mm;border-bottom-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/IncomeTaxPlusBaseErosionTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCH K line 5a -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm">5a </div>
						<div class="styLNDesc" style="width:99mm;height:4mm;">
							<span style="float: left; clear: none;">Foreign tax credit (attach Form 1118)
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/ForeignTaxCreditAmt"/>
								</xsl:call-template>
							</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">...........</span>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;padding-top:1mm">5a </div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;height:5mm;;padding-top:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/ForeignTaxCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="height:5mm;border-bottom-width:0px"/>
					</div>
					<!-- SCH K line 5b -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:5mm">b </div>
						<div class="styLNDesc" style="width:99mm;height:4mm;">
							<span style="float: left; clear: none;">Credit from Form 8834 (attach Form 8834) 
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/QlfyElecMotorVehCrAmt"/>
								</xsl:call-template>
							</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">.........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">5b </div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/QlfyElecMotorVehCrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px"/>
					</div>
					<!-- SCH K line 5c -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;padding-left:5mm">c </div>
						<div class="styLNDesc" style="width:99mm;height:5mm;">
							<span style="float: left; clear: none;">General business credit (attach Form 3800)
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/CYGenBusinessCreditAllowedAmt"/>
								</xsl:call-template>
							</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">.........</span>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;">5c </div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;height:5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/CYGenBusinessCreditAllowedAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="height:5mm;border-bottom-width:0px"/>
					</div>
					<!-- SCH K line 5d -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;padding-left:5mm">d </div>
						<div class="styLNDesc" style="width:99mm;height:5mm;">
							<span style="float: left; clear: none;">Credit for prior year minimum tax (attach Form 8827)
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/CurrentYearMinimumTaxCreditAmt"/>
								</xsl:call-template>
							</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">......</span>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;">5d </div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;height:5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/CurrentYearMinimumTaxCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="height:5mm;border-bottom-width:0px"/>
					</div>
					<!-- SCH K line 5e -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:5mm">e </div>
						<div class="styLNDesc" style="width:99mm;height:4mm;">
							<span style="float: left; clear: none;">Bond credits from Form 8912
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/CurrentYearAllowableCreditAmt"/>
								</xsl:call-template>
							</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">.............</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">5e </div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/CurrentYearAllowableCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px"/>
					</div>
					<!-- SCH K line 6 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:3mm">6</div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">
							<span style="float: left; clear: none;">
								<b>Total credits. </b> Add lines 5a through 5e </span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">.....................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;border-bottom-width:1px;">6</div>
						<div class="styLNAmountBoxNBB" style="height:4mm;border-bottom-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/TotalCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCH K line 7 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:3mm">7</div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">
							<span style="float: left; clear: none;">Subtract line 6 from line 4</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">.........................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;border-bottom-width:1px;">7</div>
						<div class="styLNAmountBoxNBB" style="height:4mm;border-bottom-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/TaxLessCreditsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCH K line 8 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:3mm">8</div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">
							<span style="float: left; clear: none;">Foreign corporations tax on income not effectively connected with U.S. business
								<!-- Form to Form Link   -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/ForeignCorporationTaxOnIncmAmt"/>
								</xsl:call-template>
							</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">......</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;border-bottom-width:1px;">8</div>
						<div class="styLNAmountBoxNBB" style="height:4mm;border-bottom-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/ForeignCorporationTaxOnIncmAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule K line 9 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:3mm;padding-top:2mm">9</div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">Other taxes. Check if from: 
							<span style="width:8px"/>
							<input type="checkbox" alt="Form4255 Attached" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/Form4255Ind"/>
									<xsl:with-param name="BackupName">IRS1120LForm4255Attached</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/Form4255Ind"/>
									<xsl:with-param name="BackupName">IRS1120LForm4255Attached</xsl:with-param>
								</xsl:call-template>Form 4255
								<span style="width:2px;"/>
							</label>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/Form4255Ind"/>
							</xsl:call-template>
							<span style="width:8px"/>
							<input type="checkbox" alt="Form8611 Attached" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/Form8611Ind"/>
									<xsl:with-param name="BackupName">IRS1120LForm8611Attached</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/Form8611Ind"/>
									<xsl:with-param name="BackupName">IRS1120LForm8611Attached</xsl:with-param>
								</xsl:call-template>Form 8611
								<span style="width:2px;"/>
							</label>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/Form8611Ind"/>
							</xsl:call-template>
							<span style="width:8px"/>
							<input type="checkbox" alt="Form Other Attached" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/OtherInd"/>
									<xsl:with-param name="BackupName">IRS1120LFormOtherAttached</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/OtherInd"/>
									<xsl:with-param name="BackupName">IRS1120LFormOtherAttached</xsl:with-param>
								</xsl:call-template>Other (attach statement)
								<span style="width:2px;"/>
							</label>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/OtherInd"/>
							</xsl:call-template>
							<span style="width=3mm"/>
							<b>.</b>
							<span style="width=3mm"/>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">9</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/OtherTaxesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- SCH K line 10 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:1mm">10</div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">
							<span style="float: left; clear: none;">
								<b>Total tax. </b>
								Add lines 7 through 9. Enter here and on page 1, line 26 
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/TotalTaxAmt"/>
								</xsl:call-template>
							</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">...........</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.5mm;">10</div>
						<div class="styLNAmountBoxNBB" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/TotalTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN Schedule L Title -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="width:23mm;">Schedule L</div>
						<div class="styPartDesc" style="width:164mm;">
							Part I Total Assets <span class="styNormalText">(see instructions)</span>
						</div>
					</div>
					<!-- Schedule L head line -->
					<div style="width:187mm;clear:all;">
						<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm"/>
						<div class="styLNDesc" style="width:107mm;height:8mm;padding-top:4mm"/>
						<div class="styLNAmountBox" style="width:40mm;height:8mm;;border-bottom-width:1px; border-left-width:1px;text-align:center;padding-top:2mm">
							<b>(a)</b> Beginning of tax year</div>
							<div class="styLNAmountBox" style="height:8mm;border-bottom-width:1px;padding-top:2mm; text-align:center">
								<b>(b)</b> End of tax year
							</div>
					</div>
					<!-- Schedule L line 1 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:3mm">1 </div>
						<div class="styLNDesc" style="width:107mm;height:4mm;">
							<span style="float: left; clear: none;">Real property</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">.....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;border-bottom-width:1px">1</div>
						<div class="styLNAmountBox" style="height:4mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/RealPropertyBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/RealPropertyEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule L line 2 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:3mm">2 </div>
						<div class="styLNDesc" style="width:107mm;height:4mm">
							<span style="float: left; clear: none;">Stocks</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">.......................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;border-bottom-width:1px">2</div>
						<div class="styLNAmountBox" style="height:4mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/StocksBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4mmborder-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/StocksEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule L line 3 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:3mm">3 </div>
						<div class="styLNDesc" style="width:107mm;height:4mm">
							<span style="float: left; clear: none;">Proportionate share of partnership and trust assets</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">.........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;border-bottom-width:1px">3</div>
						<div class="styLNAmountBox" style="height:4mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/ProportionateShareAssetsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/ProportionateShareAssetsEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule L line 4 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:3mm">4 </div>
						<div class="styLNDesc" style="width:107mm;height:4mm;">
							<span style="float: left; clear: none;">Other assets (attach statement)</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;border-bottom-width:1px;">4</div>
						<div class="styLNAmountBox" style="height:5mm;border-bottom-width:1px">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/OtherAssetsBOYAmt"/>
							</xsl:call-template>
							<span style="width:1mm"/>
							<span style="font-size:6pt">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/OtherAssetsBOYAmt"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;border-bottom-width:1px;padding-top:1mm">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/OtherAssetsEOYAmt"/>
							</xsl:call-template>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/OtherAssetsEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule L line 5 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:3mm">5 </div>
						<div class="styLNDesc" style="width:107mm;height:4mm">
							<span style="float: left; clear: none;">
								<b>Total assets.</b> Add lines 1 through 4</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">.............</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;border-bottom-width:0px">5</div>
						<div class="styLNAmountBox" style="height:4mm;border-bottom-width:0px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/CorporationTotalAssetsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-bottom-width:0px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/CorporationTotalAssetsEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN Schedule L Part II Title1 -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartDesc" style="width:187mm;padding-left:26mm;height:10mm;">
						   Part II Total Assets and Total Insurance Liabilities 
							<span class="styNormalText">  (section 842(b)(2)(B)(i)) (see instructions)</span>
							<br/><span class="styNormalText">
  <b>Note: </b>The information provided in Part II should conform with the “Assets” and “Liabilities, Surplus, and Other Funds” sections of the NAIC Annual Statement.			</span>
						</div>
					</div>
					<!-- BEGIN Schedule L Part II Title II -->
					<!-- Schedule L head line -->
					<div style="width:187mm;clear:all;">
						<div class="styLNDesc" style="width:115mm;height:8mm;"></div>
						<div class="styLNAmountBox" style="width:40mm;height:8mm;border-bottom-width:1px; border-left-width:1px;text-align:center;padding-top:2mm">
							<b>(a)</b> Beginning of tax year</div>
						<div class="styLNAmountBox" style="height:8mm;border-bottom-width:1px;padding-top:2mm; text-align:center">
							<b>(b)</b> End of tax year
						</div>
					</div>
					<!-- Schedule L line 1 -->
					<div style="width:187mm;clear:all;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:3mm">1 </div>
						<div class="styLNDesc" style="width:107mm;height:4mm">
							<span style="float: left; clear: none;">Subtotals for assets </span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">...................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;border-bottom-width:1px">1</div>
						<div class="styLNAmountBox" style="height:4mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/SubtotalsForAssetsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/SubtotalsForAssetsEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule L line 2 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:3mm">2 </div>
						<div class="styLNDesc" style="width:107mm;height:4mm">
							<span style="float: left; clear: none;">
								<b>Total assets.</b></span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">.....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;border-bottom-width:1px">2</div>
						<div class="styLNAmountBox" style="height:4mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/TotalAssetsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/TotalAssetsEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule L line 3 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:3mm">3 </div>
						<div class="styLNDesc" style="width:107mm;height:4mm">
							<span style="float: left; clear: none;">Reserve for life policies and contracts</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">..............</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;border-bottom-width:1px">3</div>
						<div class="styLNAmountBox" style="height:4mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/RsrvLifePoliciesCntrctBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/RsrvLifePoliciesCntrctEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule L line 4 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:3mm">4 </div>
						<div class="styLNDesc" style="width:107mm;height:5mm">
							<span style="float: left; clear: none;">Reserve for accident and health policies</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">.............</span>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;border-bottom-width:1px;">4</div>
						<div class="styLNAmountBox" style="height:5mm;border-bottom-width:1px;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/RsrvAccidentHlthPoliciesBOYAmt"/>
							</xsl:call-template>
							<span style="width:1mm"/>
							<span style="font-size:6pt">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/RsrvAccidentHlthPoliciesBOYAmt"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/RsrvAccidentHlthPoliciesEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule L line 5 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:3mm">5 </div>
						<div class="styLNDesc" style="width:107mm;height:4mm">
							<span style="float: left; clear: none;">Liability for deposit-type contracts 
							</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;border-bottom-width:1px">5</div>
						<div class="styLNAmountBox" style="height:4mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/LiabilityDepTypCntrctBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/LiabilityDepTypCntrctEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule L line 6 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:3mm">6 </div>
						<div class="styLNDesc" style="width:107mm;height:4mm">
							<span style="float: left; clear: none;">Life policy and contract claims</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;border-bottom-width:1px">6 </div>
						<div class="styLNAmountBox" style="height:4mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/LifePolicyAndCntrctClmsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/LifePolicyAndCntrctClmsEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule L line 7 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:3mm">7 </div>
						<div class="styLNDesc" style="width:107mm;height:4mm">
							<span style="float: left; clear: none;">Accident and health policy and contract claims </span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">...........</span>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;border-bottom-width:1px">7</div>
						<div class="styLNAmountBox" style="height:5mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/AccidentHlthPlcyClaimsBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:5mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/AccidentHlthPlcyClaimsEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule L line 8 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:3mm">8 </div>
						<div class="styLNDesc" style="width:107mm;height:4mm">
							<span style="float: left; clear: none;">Policyholder’s dividend and coupon accumulations </span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">..........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;border-bottom-width:1px">8 </div>
						<div class="styLNAmountBox" style="height:4mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/PlcyhldrDivAndCpnAccumBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/PlcyhldrDivAndCpnAccumEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule L line 9 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:3mm">9 </div>
						<div class="styLNDesc" style="width:107mm;height:4mm">
							Premiums and annuity considerations received in advance less discount 
							<span class="styDotLn" style="float:right;padding-right:2mm;">...</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;border-bottom-width:1px">9 </div>
						<div class="styLNAmountBox" style="height:4mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/PremiumsAndAnnuityCnsdrBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/PremiumsAndAnnuityCnsdrEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule L line 10 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm">10 </div>
						<div class="styLNDesc" style="width:107mm;height:4mm">
							<span style="float: left; clear: none;">Surrender values on canceled policies</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">.............</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;border-bottom-width:1px">10</div>
						<div class="styLNAmountBox" style="height:4mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/SurrenderValuesBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/SurrenderValuesEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule L line 11 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm">11 </div>
						<div class="styLNDesc" style="width:107mm;height:4mm">
							<span style="float: left; clear: none;">Part of other amounts payable on reinsurance assumed </span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;border-bottom-width:1px">11 </div>
						<div class="styLNAmountBox" style="height:4mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/PartOfOtherAmountsPyblBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/PartOfOtherAmountsPyblEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule L line 12 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:8mm">12 </div>
						<div class="styLNDesc" style="width:107mm;height:8mm">
							<span style="float: left; clear: none;">Part of aggregate write-ins for liabilities. (Only include items or amounts includible in 
							</span>
							<span style="float: left; clear: none;">“total insurance liabilities on U.S. business" as defined in section 842(b)(2)(B)(i)) </span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;border-bottom-width:1px;padding-top:4mm">12 </div>
						<div class="styLNAmountBox" style="height:8mm;border-bottom-width:1px;padding-top:4mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/AggrgtWriteinsForLiabBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:8mm;border-bottom-width:1px;padding-top:4mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/AggrgtWriteinsForLiabEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule L line 13 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">13 </div>
						<div class="styLNDesc" style="width:107mm;height:4mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
							<span style="float: left; clear: none;">Separate accounts statement </span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;border-bottom-width:1px">13</div>
						<div class="styLNAmountBox" style="height:4mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/SeparateAccountsStmtBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/SeparateAccountsStmtEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule L line 14 -->
					<div class="styBB" style="width:187mm;border-bottom-width:2px">
						<div class="styLNLeftNumBox" style="height:4mm">14 </div>
						<div class="styLNDesc" style="width:107mm;height:4mm">
							<span style="float: left; clear: none;">
								<b>Total insurance liabilities. </b>Add lines 3 through 13</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">..........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;border-bottom-width:0px">14 </div>
						<div class="styLNAmountBox" style="height:4mm;border-bottom-width:0px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/TotalInsuranceLiabBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4mm;border-bottom-width:0px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS1120LScheduleL/TotalInsuranceLiabEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;clear:all;float:none;">
						<div style="float:left;"/>
						<div style="float:right;">
							<span style="width:40px;"/>Form <span class="styBoldText" style="font-size:8pt;">1120-L</span> (2021)
						</div>
					</div>
					<!-- END Page Break and Footer-->
					<!--Begin Page 5 -->
					<!-- Page Header -->
					<div class="styBB" style="width:187mm;padding-top:.5mm;float:none;float:none;">
						<div style="float:left;">Form 1120-L (2021)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">5</span>
						</div>
					</div>
					<div style="width:187mm;clear:both;float:none;" class="styTBB">
						<!-- BEGIN Schedule M Title -->
						<div class="styBB" style="width:187mm;">
							<div class="styPartName" style="width:23mm;">Schedule M</div>
							<div class="styPartDesc" style="width:164mm;">
								Other Information  <span class="styNormalText">(see instructions)</span>
							</div>
						</div>
						<!-- BEGIN Line Items -->
						<table class="styTable" style="width:187mm;clear:both;float:none;">
							<tr>
								<!--BEGIN Schedule M Left Side-->
								<td class="styGenericDiv" style="width:93mm;vertical-align:top;">
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:4.5mm;">1</div>
										<div class="styLNDesc" style="width:72mm;height:4.5mm;">Check accounting method:</div>
										<div class="styIRS1120LNYesNoBox">Yes</div>
										<div class="styIRS1120LNYesNoBoxRB">No</div>
									</div>
									<!-- line 1 a and b -->
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftLtrBox" style="height:4.5mm;"/>
										<!-- Line 1 A -->
										<div class="styLNDesc" style="width:47mm;height:4.5mm;">
											<span class="styBoldText">a</span>
											<span style="width:3px;"/>
											<input type="checkbox" alt="ScheduleM Method Of Accounting Accrual" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/MethodOfAccountingAccrualInd"/>
													<xsl:with-param name="BackupName">IRS1120L ScheduleM Method Of Accounting Accrual</xsl:with-param>
												</xsl:call-template>
											</input>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/MethodOfAccountingAccrualInd"/>
													<xsl:with-param name="BackupName">IRS1120L ScheduleM Method Of Accounting Accrual</xsl:with-param>
												</xsl:call-template>
												Accrual
											</label>
											<!-- Line 1 B -->
											<span style="width:6px;"/>
											<span class="styBoldText">b</span>
											<span style="width:3px;"/>
											<input type="checkbox" alt="ScheduleM Method Of Accounting Other" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/MethodOfAccountingOtherInd"/>
													<xsl:with-param name="BackupName">IRS1120L ScheduleM Method Of Accounting Other</xsl:with-param>
												</xsl:call-template>
											</input>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/MethodOfAccountingOtherInd"/>
													<xsl:with-param name="BackupName">IRS1120L ScheduleM Method Of Accounting Other</xsl:with-param>
												</xsl:call-template>
												Other (specify)
											</label>
											<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="right pointing arrow"/>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Schedule M Line 1b - Method Of Accounting Other</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/MethodOfAccountingOtherInd/@methodOfAccountingOtherDesc"/>
											</xsl:call-template>
										</div>
										<div class="styIRS1120BBText" style="width:25mm;padding-left:1mm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/MethodOfAccountingOtherInd/@methodOfAccountingOtherDesc"/>
											</xsl:call-template>
										</div>
										<!--div class="styGenericDiv" style="width:.4mm;"/-->
										<div class="styShadingCell" style="width:6mm;height:8mm;"/>
										<div class="styShadingCellRB" style="width:6mm;height:8mm;"/>
									</div>
									<!-- Sch M line 2 -->
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:4mm;">2</div>
										<div class="styLNDesc" style="width:72mm;height:4mm;">Check if the corporation is a:</div>
										<div class="styShadingCell" style="width:6mm;height:4mm;"/>
										<div class="styShadingCellRB" style="width:6mm;height:4mm;"/>
									</div>
									<!-- line 2 a -->
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:4.5mm;"/>
										<div class="styLNDesc" style="width:72mm;height:4.5mm;">
											<span class="styBoldText">a</span>
											<span style="width:3px;"/>
											<input type="checkbox" alt="ScheduleM Legal Reserve Company" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/LegalReserveCompanyInd"/>
													<xsl:with-param name="BackupName">IRS1120L ScheduleM Legal Reserve Company</xsl:with-param>
												</xsl:call-template>
											</input>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/LegalReserveCompanyInd"/>
													<xsl:with-param name="BackupName">IRS1120LScheduleM Legal Reserve Company</xsl:with-param>
												</xsl:call-template>
													Legal reserve company if checked:<br/>
												<span style="padding-left:2mm">Kind of company:</span>
											</label>
										</div>
										<div class="styShadingCell" style="width:6mm;height:7mm;"/>
										<div class="styShadingCellRB" style="width:6mm;height:7mm;"/>
									</div>
									<!-- line 2    1 and 2 -->
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:4.5mm;"/>
										<div class="styLNDesc" style="width:72mm;height:4.5mm;padding-left:2mm">
											<span class="styBoldText">(1)</span>
											<span style="width:3px;"/>
											<input type="checkbox" alt="ScheduleM Stock Company" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/StockCompanyInd"/>
													<xsl:with-param name="BackupName">IRS1120LS cheduleM Stock Company</xsl:with-param>
												</xsl:call-template>
											</input>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/StockCompanyInd"/>
													<xsl:with-param name="BackupName">IRS1120L ScheduleM Stock Company</xsl:with-param>
												</xsl:call-template>
													Stock
											</label>
											<span style="width:6px;"/>
											<span class="styBoldText">(2)</span>
											<span style="width:3px;"/>
											<input type="checkbox" alt="ScheduleM Mutual Company" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/MutualCompanyInd"/>
													<xsl:with-param name="BackupName">IRS1120L ScheduleM Mutual Company</xsl:with-param>
												</xsl:call-template>
											</input>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/MutualCompanyInd"/>
													<xsl:with-param name="BackupName">IRS1120L ScheduleM Mutual Company</xsl:with-param>
												</xsl:call-template>
													Mutual<br/>Principal business:
											</label>
										</div>
										<div class="styGenericDiv" style="width:12mm;">
											<div class="styShadingCell" style="width:6mm;height:7mm;"/>
											<div class="styShadingCellRB" style="width:6mm;height:7mm;"/>
										</div>
									</div>
									<!-- line 2 a1 -->
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:4.5mm;"/>
										<div class="styLNDesc" style="width:72mm;height:4.5mm;">
											<span class="styBoldText" style="padding-left:2mm">(1)</span>
											<span style="width:3px;"/>
											<input type="checkbox" alt="ScheduleM Life Insurance Business" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/LifeInsuranceBusinessInd"/>
													<xsl:with-param name="BackupName">IRS1120L ScheduleM Life Insurance Business</xsl:with-param>
												</xsl:call-template>
											</input>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/LifeInsuranceBusinessInd"/>
													<xsl:with-param name="BackupName">IRS1120L ScheduleM Life Insurance Business</xsl:with-param>
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
											<input type="checkbox" alt="Health And Accident Ins Bus Ind" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/ HealthAndAccidentInsBusInd"/>
													<xsl:with-param name="BackupName">IRS1120L ScheduleM Health And AccidentIns Bus Ind</xsl:with-param>
												</xsl:call-template>
											</input>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/HealthAndAccidentInsBusInd"/>
													<xsl:with-param name="BackupName">IRS1120LScheduleM Health And AccidentI ns BusI nd</xsl:with-param>
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
											<input type="checkbox" alt="Fraternal Assessment Association" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/FraternalOrAssessmentAssocInd"/>
													<xsl:with-param name="BackupName">IRS1120LS cheduleM Fraternal Assessment Association</xsl:with-param>
												</xsl:call-template>
											</input>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/FraternalOrAssessmentAssocInd"/>
													<xsl:with-param name="BackupName">IRS1120LScheduleMFraternal Assessment Association</xsl:with-param>
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
											<input type="checkbox" alt="Burial Or Other Insurance Company" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/BurialOrOtherInsuranceCoInd"/>
													<xsl:with-param name="BackupName">IRS1120LScheduleM Burial Or OtherInsurance Company</xsl:with-param>
												</xsl:call-template>
											</input>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/BurialOrOtherInsuranceCoInd"/>
													<xsl:with-param name="BackupName">IRS1120L ScheduleM Burial Or OtherInsurance Company</xsl:with-param>
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
											<span class="stySmallText">Enter the percentage that the total of the corporation’s life insurance reserves (section 816 (b)) plus unearned premiums and unpaid losses (whether or not ascertained) on noncancelable life, health 
or accident policies not included in life insurance reserves bears to the corporation’s total reserves (section 816 (c))
												<!-- Form to Form Link  -->
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/TotalCorpLifeInsuranceRsrvPct"/>
												</xsl:call-template>
												<span style="width:3px;"/>
												<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="right pointing arrow"/>
												<span style="width:3px;"/>
												<span style="width:25.5mm;font-size:6pt;border-bottom:1px solid black;text-align:right">
													<xsl:call-template name="PopulatePercent">
														<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/TotalCorpLifeInsuranceRsrvPct"/>
														<xsl:with-param name="MaxSize" select="4"/>
													</xsl:call-template>
												</span>
												<br/>Attach a statement showing the computation.<br/>
											</span>
										</div>
										<div class="styShadingCell" style="width:6mm;height:20mm;"/>
										<div class="styShadingCell" style="width:6mm;height:20mm;border-right-width:1px"/>
									</div>
									<!-- Line 4 -->
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:4.5mm;">4</div>
										<div class="styLNDesc" style="width:72mm;height:4.5mm;padding-bottom:0px;padding-top:0px;">
											Does the corporation have any variable annuity contracts outstanding?
											<span style="letter-spacing:4mm;font-weight:bold">............</span>
											<br/>
										</div>
										<div class="styGenericDiv" style="width:12mm;">
											<div class="styShadingCell" style="width:6mm;height:1mm;"/>
											<div class="styShadingCellRB" style="width:6mm;height:1mm;"/>
											<div class="styIRS1120LNYesNoBox" style="height:6mm;">
												<span style="font-weight:normal;">
													<xsl:call-template name="PopulateYesBoxText">
														<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/ VariableAnnuityContractsInd"/>
														<xsl:with-param name="BackupName">VariableAnnuityContractsYes</xsl:with-param>
													</xsl:call-template>
												</span>
											</div>
											<div class="styIRS1120LNYesNoBoxRB" style="height:6mm;">
												<span style="font-weight:normal;">
													<xsl:call-template name="PopulateNoBoxText">
														<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/VariableAnnuityContractsInd"/>
														<xsl:with-param name="BackupName">VariableAnnuityContractsNo</xsl:with-param>
													</xsl:call-template>
												</span>
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
													<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/CorpOwn50PctOrMoreVotingStkInd"/>
												</xsl:call-template>
											</span>
										</div>
										<div class="styGenericDiv" style="width:12mm;">
											<div class="styShadingCell" style="width:6mm;height:5mm;"/>
											<div class="styShadingCellRB" style="width:6mm;height:5mm;"/>
											<div class="styIRS1120LNYesNoBox">
												<span style="font-weight:normal;">
													<xsl:call-template name="PopulateYesBoxText">
														<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/CorpOwn50PctOrMoreVotingStkInd"/>
													</xsl:call-template>
												</span>
											</div>
											<div class="styIRS1120LNYesNoBoxRB">
												<span style="font-weight:normal;">
													<xsl:call-template name="PopulateNoBoxText">
														<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/CorpOwn50PctOrMoreVotingStkInd"/>
													</xsl:call-template>
												</span>
											</div>
										</div>
									</div>
									<!-- line 5 sub -->
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:0mm;padding-bottom:0mm;"/>
										<div class="styLNDesc" style="width:72mm;padding-top:0mm;padding-bottom:0mm;">
											<span class="stySmallText">If "Yes," attach a statement showing <span class="styBoldText">
												(a)  </span>name and employer identification number
												(EIN),  <span class="styBoldText">(b)  </span>percentage owned, and  <span class="styBoldText">
												<span style="width:0.5px;"/>
												(c)  </span>taxable income or (loss) before NOL and special deductions of such 
												corporation for the tax year ending with or within your tax year.
											</span>
										</div>
										<div class="styShadingCell" style="width:6mm;height:12mm;"/>
										<div class="styShadingCellRB" style="width:6mm;height:12mm;"/>
									</div>
									<!-- Line 6 -->
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:0mm;padding-bottom:0mm;">6</div>
										<div class="styLNDesc" style="width:72mm;padding-top:0mm;padding-bottom:0mm;">
											Is the corporation a subsidiary in an affiliated group or a parent-subsidiary controlled group? 
											<span style="letter-spacing:4mm;font-weight:bold">........</span>
										</div>
										<div class="styGenericDiv" style="width:12mm;">
											<div class="styShadingCell" style="width:6mm;height:2mm;"/>
											<div class="styShadingCellRB" style="width:6mm;height:2mm;"/>
											<div class="styIRS1120LNYesNoBox">
												<span style="font-weight:normal;">
													<xsl:call-template name="PopulateYesBoxText">
														<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/ControlledGroupMemberInd"/>
														<xsl:with-param name="BackupName">ControlledGroupMemberYes</xsl:with-param>
													</xsl:call-template>
												</span>
											</div>
											<div class="styIRS1120LNYesNoBoxRB">
												<span style="font-weight:normal;">
													<xsl:call-template name="PopulateNoBoxText">
														<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/ControlledGroupMemberInd"/>
														<xsl:with-param name="BackupName">ControlledGroupMemberNo</xsl:with-param>
													</xsl:call-template>
												</span>
											</div>
										</div>
									</div>
									<!-- Line 6 sub 1 -->
									<div class="styGenericDiv" style="width:92mm;">
										<div class="styLNLeftLtrBox" style="height:4.5mm;"/>
										<div class="styLNDesc" style="width:72mm;height:4.5mm;">
											If "Yes," enter name and EIN of the parent corporation.
											<span style="width:3px;"/>
											<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="right pointing arrow"/>
											<span style="width:6px;"/>
											<span style="width:70mm;border-bottom:1px solid black;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/ParentCorporationName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/ParentCorporationName/BusinessNameLine2Txt"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/PrntCorporationNameControlTxt"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/ParentCorporationEIN"/>
												</xsl:call-template>
												<br/>
												<xsl:if test="$IRS1120LScheduleM/MissingEINReasonCd!=' '">
													<span style="font-weight:normal;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/MissingEINReasonCd"/>
														</xsl:call-template>
													</span>
												</xsl:if>
											</span>
										</div>
										<div class="styShadingCell" style="width:6mm;height:19mm;border-bottom-width:0px;"/>
										<div class="styShadingCell" style="width:6mm;height:19mm;border-bottom-width:0px;border-right-width:1px;"/>
									</div>
									<!-- Line 7 -->
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:0mm;padding-bottom:0mm;">7</div>
										<div class="styLNDesc" style="width:72mm;padding-top:0mm;padding-bottom:0mm;">
											At the end of the tax year, did any individual, partnership, corporation, estate, or trust own, directly or indirectly,
											50% or more of the corporation’s voting stock? (For rules of attribution, see section 267(c).) 
											<span style="letter-spacing:4mm;font-weight:bold">.........</span><br/>
											If "Yes," complete <span class="styBoldText">a</span> and <span class="styBoldText">b</span> below.
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/Own50PercentOrMoreVotingStkInd"/>
											</xsl:call-template>
										</div>
										<div class="styGenericDiv" style="width:12mm;">
											<div class="styShadingCell" style="width:6mm;height:8mm;"/>
											<div class="styShadingCellRB" style="width:6mm;height:8mm;"/>
											<div class="styIRS1120LNYesNoBox">
												<span style="font-weight:normal;">
													<xsl:call-template name="PopulateYesBoxText">
														<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/Own50PercentOrMoreVotingStkInd"/>
														<xsl:with-param name="BackupName">Own50PercentCorpVotingStockYes</xsl:with-param>
													</xsl:call-template>
												</span>
											</div>
											<div class="styIRS1120LNYesNoBoxRB">
												<span style="font-weight:normal;">
													<xsl:call-template name="PopulateNoBoxText">
														<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/Own50PercentOrMoreVotingStkInd"/>
														<xsl:with-param name="BackupName">Own50PercentCorpVotingStockNo</xsl:with-param>
													</xsl:call-template>
												</span>
											</div>
										</div>
									</div>
									<!-- Line 7a-->
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftLtrBox" style="height:4.5mm;">a</div>
										<div class="styLNDesc" style="width:72mm;height:4.5mm;">
											<span class="stySmallText">Attach a statement showing name and identifying number.
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
											<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="right pointing arrow"/>
											<span style="width:6px;"/>
											<span style="width:25mm;border-bottom:1px solid black;text-align:right">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/VotingStockOwnedPct"/>
												</xsl:call-template>
											</span>
										</div>
										<div class="styShadingCell" style="width:6mm;height:4.5mm;border-bottom-width:0mm"/>
										<div class="styShadingCell" style="width:6mm;height:4.5mm;border-right-width:1px;border-bottom-width:0mm"/>
									</div>
									<!--Line 8 -->
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:0mm;padding-bottom:0mm;">8</div>
										<div class="styLNDesc" style="width:72mm;height:4.5mm;">
											At any time during the year, did one foreign person own, 
											directly or indirectly, at least 25% of <span class="styBoldText">(a)</span>
											the total voting power of all classes of stock of the corporation entitled to vote or 
											<span class="styBoldText">(b)</span> the total value of all classes of stock of the corporation?
											<!--Dotted Line-->
											<span style="letter-spacing:4mm;font-weight:bold">....</span>
										</div>
										<div class="styGenericDiv" style="width:12mm;">
											<div class="styShadingCell" style="width:6mm;height:6mm;"/>
											<div class="styShadingCellRB" style="width:6mm;height:6mm;"/>
											<div class="styIRS1120LNYesNoBox">
												<span style="font-weight:normal;">
													<xsl:call-template name="PopulateYesBoxText">
														<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/FrgnOwn25PctTotVotingPowerInd"/>
														<xsl:with-param name="BackupName">ForeignOwn25PercentStockYes</xsl:with-param>
													</xsl:call-template>
												</span>
											</div>
											<div class="styIRS1120LNYesNoBox" style="border-right-width:1px;">
												<span style="font-weight:normal;">
													<xsl:call-template name="PopulateNoBoxText">
														<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/FrgnOwn25PctTotVotingPowerInd"/>
														<xsl:with-param name="BackupName">ForeignOwn25PercentStockNo</xsl:with-param>
													</xsl:call-template>
												</span>
											</div>
										</div>
									</div>
									<!-- line 8a-->
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:6mm;"/>
										<div class="styLNDesc" style="width:72mm;height:6mm;">
											If "Yes," enter:<br/>
											<span class="styBoldText">a </span>
											<span style="width:3px;"/>
												Percentage owned and
											<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="right pointing arrow"/>
											<span style="width:6px;"/>
											<span style="width:20mm;border-bottom:1px solid black;text-align:right">
											<xsl:call-template name="PopulatePercent">
												<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/VotingStockForeignOwnedPct"/>
											</xsl:call-template>
											</span>
										</div>
										<div class="styShadingCell" style="width:6mm;height:6mm;"/>
										<div class="styShadingCellRB" style="width:6mm;height:6mm;"/>
									</div>
									<!-- line 8b -->
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:6mm;"/>
										<div class="styLNDesc" style="width:72mm;height:6mm;">
											<span class="styBoldText">b</span>
											<span style="width:3px;"/>
											Owner's country
											<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="right pointing arrow"/>
											<span style="width:6px;"/>
											<span style="width:20mm;border-bottom:1px solid black;text-align:right">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/ForeignOwnStockCountryCd"/>
												</xsl:call-template>
											</span>
										</div>
										<div class="styShadingCell" style="width:6mm;height:6mm;"/>
										<div class="styShadingCellRB" style="width:6mm;height:6mm;"/>
									</div>
								</td>
								<!--END Schedule M Left Side-->
								<!--BEGIN Schedule M Right Side-->
								<td class="styGenericDiv" style="width:92mm;vertical-align:top;">
									<!-- Line 8c-->
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:0mm;padding-bottom:0mm;padding-left:3mm">8c</div>
										<div class="styLNDesc" style="width:72mm;height:4.5mm;">
											<span class="stySmallText">The corporation may have to file <span class="styBoldText">Form 5472,
												</span> Information Return of a 25% Foreign-Owned U.S. Corporation or a Foreign Corporation 
												Engaged in a U.S. Trade or Business. <br/>Enter number of Forms 5472 attached. 
												<!-- Form to Form Link   -->
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/TotalForm5472FiledCnt"/>
												</xsl:call-template>
												<span style="width:3px;"/>
												<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="right pointing arrow"/>
												<span style="width:3px;"/>
												<span style="width:27mm;font-size:6pt;border-bottom:1px solid black;text-align:right;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/TotalForm5472FiledCnt"/>
														<xsl:with-param name="MaxSize" select="4"/>
													</xsl:call-template>
												</span>
											</span>
										</div>
										<div class="styGenericDiv" style="width:12mm;">
											<div class="styIRS1120LNYesNoBox">Yes</div>
											<div class="styIRS1120LNYesNoBox">No</div>
											<div class="styShadingCell" style="width:6mm;height:10mm;"/>
											<div class="styShadingCell" style="width:6mm;height:10mm;"/>
										</div>
									</div>
									<!-- line 9 -->
									<div class="styGenericDiv" style="width:92mm;">
										<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:0mm;padding-bottom:0mm;padding-left:3mm">9</div>
										<div class="styLNDesc" style="width:72mm;padding-top:0mm;padding-bottom:0mm;">
											Does the corporation discount any of the loss reserves shown on its annual statement?
											<!--Dotted Line-->
											<span style="letter-spacing:4mm;font-weight:bold">..........</span>
										</div>
										<div class="styGenericDiv" style="width:12mm;">
											<div class="styShadingCell" style="width:6mm;height:2.5mm;"/>
											<div class="styShadingCell" style="width:6mm;height:2.5mm;"/>
											<div class="styIRS1120LNYesNoBox">
												<span style="font-weight:normal;">
													<xsl:call-template name="PopulateYesBoxText">
														<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/DiscountsLossReservesInd"/>
														<xsl:with-param name="BackupName">DiscountsLossReservesYes</xsl:with-param>
													</xsl:call-template>
												</span>
											</div>
											<div class="styIRS1120LNYesNoBox">
												<span style="font-weight:normal;">
													<xsl:call-template name="PopulateNoBoxText">
														<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/DiscountsLossReservesInd"/>
														<xsl:with-param name="BackupName">DiscountsLossReservesNo</xsl:with-param>
													</xsl:call-template>
												</span>
											</div>
										</div>
									</div>
									<!-- Line 10a -->
									<div class="styGenericDiv" style="width:92mm;">
										<div class="styLNLeftNumBox" style="height:4.5mm;">10a</div>
										<div class="styLNDesc" style="width:72mm;height:4.5mm;">Enter the total unpaid losses shown on the corporation’s annual statement:
										</div>
										<div class="styShadingCell" style="width:6mm;height:6.5mm;"/>
										<div class="styShadingCellRB" style="width:6mm;height:6.5mm;border-right-width:0px"/>
									</div>
									<div class="styGenericDiv" style="width:93mm;height:4.5mm;">
										<div class="styLNLeftLtrBox" style="height:4.5mm;padding-left:8mm;width:12mm;">(1)</div>
										<div class="styLNDesc" style="width:31mm;height:4.5mm;padding-left:1mm">
											For the current year: <span style="width:4px;"/>$ 
										</div>
										<div class="styIRS1120BBText" style="width:37mm;text-align:right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/UnpaidLossesForCurrentYearAmt"/>
											</xsl:call-template>
										</div>
										<div class="styGenericDiv" style="width:1mm;"/>
										<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
										<div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px"/>
									</div>
									<div class="styGenericDiv" style="width:93mm;height:4.5mm;">
										<div class="styLNLeftLtrBox" style="height:4.5mm;padding-left:8mm;width:12mm;">(2)</div>
										<div class="styLNDesc" style="width:31mm;height:4.5mm;padding-left:1mm">
												For the previous year: $ 
										</div>
										<div class="styIRS1120BBText" style="width:37mm;text-align:right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/UnpaidLossesForPreviousYearAmt"/>
											</xsl:call-template>
										</div>
										<div class="styGenericDiv" style="width:1mm;"/>
										<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
										<div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px"/>
									</div>
									<!-- Line 10b -->
									<div class="styGenericDiv" style="width:92mm;">
										<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4.5mm">  b</div>
										<div class="styLNDesc" style="width:72mm;height:4.5mm;">Enter the total unpaid loss adjustment expenses
shown on the corporation’s annual statement:
										</div>
										<div class="styShadingCell" style="width:6mm;height:6.5mm;"/>
										<div class="styShadingCellRB" style="width:6mm;height:6.5mm;border-right-width:0px"/>
									</div>
									<div class="styGenericDiv" style="width:92mm;height:4.5mm;">
										<div class="styLNLeftLtrBox" style="height:4.5mm;padding-left:8mm;width:12mm;">(1)</div>
										<div class="styLNDesc" style="width:31mm;height:4.5mm;padding-left:1mm;">
										For the current year: <span style="width:4px;"/>$ 
										</div>
										<div class="styIRS1120BBText" style="width:37mm;text-align:right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/TotalUnpaidLossForCurrentYrAmt"/>
											</xsl:call-template>
										</div>
										<div class="styGenericDiv" style="width:1mm;"/>
										<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
										<div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px"/>
									</div>
									<div class="styGenericDiv" style="width:92mm;height:4.5mm;">
										<div class="styLNLeftLtrBox" style="height:4.5mm;padding-left:8mm;width:12mm;">(2)</div>
										<div class="styLNDesc" style="width:31mm;height:4.5mm;padding-left:1mm">
										For the previous year: $ 
										</div>
										<div class="styIRS1120BBText" style="width:37mm;text-align:right">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/TotalUnpaidLossForPrevYrAmt"/>
											</xsl:call-template>
										</div>
										<div class="styGenericDiv" style="width:1mm;"/>
										<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
										<div class="styShadingCellRB" style="width:6mm;height:4.5mm;border-right-width:0px"/>
									</div>
									<!-- Line 11 sub -->
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:4.5mm;">11</div>
										<div class="styLNDesc" style="width:72mm;height:4.5mm;">
											Enter the available net operating loss carryover from prior tax years. (Do not reduce it by any deduction on page 1, line 21b.)
										<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="right pointing arrow"/>
											<br/> $
											<span style="width:25mm;border-bottom:1px solid black;text-align:right">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/NOLCarryoverFromPriorYearAmt"/>
												</xsl:call-template>
											</span>
										</div>
										<div class="styGenericDiv">
											<div class="styShadingCell" style="width:6mm;height:10mm;"/>
											<div class="styShadingCell" style="width:6mm;height:10mm;"/>
										</div>
									</div>
										<!-- Line 12a  -->
										<div class="styGenericDiv" style="width:92mm;">
											<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:0mm; padding-bottom:0mm;">12a</div>
											<div class="styLNDesc" style="width:72mm;padding-top:0mm;padding-bottom:0mm;">
											Enter the corporation’s state of domicile
											<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="right pointing arrow"/>
												<span style="width:15mm;border-bottom:1px solid black;text-align:left">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/CorporationStateOfDomicileCd"/>
													</xsl:call-template>
												</span>
											</div>
											<div class="styGenericDiv" style="width:12mm;">
												<div class="styShadingCell" style="width:6mm;height:5mm;"/>
												<div class="styShadingCell" style="width:6mm;height:5mm;"/>
											</div>
										</div>
										<!-- Line 12b1 -->
										<div class="styGenericDiv" style="width:92mm;">
											<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:0mm; padding-bottom:0mm;padding-left:5mm">b</div>
											<div class="styLNDesc" style="width:72mm;padding-top:0mm;padding-bottom:0mm;">
												Was the annual statement used to prepare the tax return filed with the state of domicile?
											</div>
											<div class="styGenericDiv" style="width:12mm;">
												<div class="styShadingCell" style="width:6mm;height:3mm;"/>
												<div class="styShadingCell" style="width:6mm;height:3mm;"/>
												<div class="styIRS1120LNYesNoBox">
													<span style="font-weight:normal;">
														<xsl:call-template name="PopulateYesBoxText">
															<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/AnnualStmtUsedToPrepTxRetInd"/>
															<xsl:with-param name="BackupName">AnnualStmtFiledInLine14aStateYes</xsl:with-param>
														</xsl:call-template>
													</span>
												</div>
												<div class="styIRS1120LNYesNoBox">
													<span style="font-weight:normal;">
														<xsl:call-template name="PopulateNoBoxText">
															<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/AnnualStmtUsedToPrepTxRetInd"/>
															<xsl:with-param name="BackupName">AnnualStmtFiledInLine14aStateNo</xsl:with-param>
														</xsl:call-template>
													</span>
												</div>
											</div>
										</div>
										<!-- Line 12b2 -->
										<div class="styGenericDiv" style="width:93mm;">
											<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:0mm; padding-bottom:0mm;padding-left:5mm"/>
											<div class="styLNDesc" style="width:72mm;padding-top:0mm;padding-bottom:0mm;">
												If "No," complete<b> c</b> below.
											</div>
											<div class="styGenericDiv" style="width:12mm;">
												<div class="styShadingCell" style="width:6mm;height:5mm;"/>
												<div class="styShadingCell" style="width:6mm;height:5mm;"/>
											</div>
										</div>
										<!-- Line 12c -->
										<div class="styGenericDiv" style="width:92mm;">
											<div class="styLNLeftNumBox" style="height:4.5mm;padding-top:0mm; padding-bottom:0mm;padding-left:5mm">c</div>
											<div class="styLNDesc" style="width:72mm;padding-top:0mm;padding-bottom:0mm;">
												Enter the state where the annual statement used to prepare the tax return was filed.
												<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="right pointing arrow"/>
												<span style="width:15mm;border-bottom:1px solid black;text-align:left">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/AnnlStmtUsedToPrepTxRetStFldCd"/>
													</xsl:call-template>
												</span>
											</div>
											<div class="styGenericDiv" style="width:12mm;">
												<div class="styShadingCell" style="width:6mm;height:9mm;"/>
												<div class="styShadingCell" style="width:6mm;height:9mm;"/>
											</div>
										</div>
									<!-- Line 13 -->
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:6mm;padding-top:0mm;padding-bottom:0mm;">13</div>
										<div class="styLNDesc" style="width:72mm;padding-top:0mm;padding-bottom:0mm;">
											Is the corporation required to file Schedule UTP (Form 1120), Uncertain Tax Position Statement?  See instructions. 
											<!--Dotted Line-->
											<span style="letter-spacing:4mm;font-weight:bold">...</span>
										</div>
										<div class="styGenericDiv" style="width:12mm;">
											<div class="styShadingCell" style="width:6mm;height:4mm;"/>
											<div class="styShadingCell" style="width:6mm;height:4mm;"/>
											<div class="styIRS1120LNYesNoBox">
												<span style="font-weight:normal;">
													<xsl:call-template name="PopulateYesBoxText">
														<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/UncertainTaxPositionStmtInd"/>
														<xsl:with-param name="BackupName">UncertainTaxPositionStatementYes</xsl:with-param>
													</xsl:call-template>
												</span>
											</div>
											<div class="styIRS1120LNYesNoBox">
												<span style="font-weight:normal;">
													<xsl:call-template name="PopulateNoBoxText">
														<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/UncertainTaxPositionStmtInd"/>
														<xsl:with-param name="BackupName">UncertainTaxPositionStatementNo</xsl:with-param>
													</xsl:call-template>
												</span>
											</div>
										</div>
									</div>
									<div class="styGenericDiv" style="width:92mm;">
										<div class="styLNLeftNumBox" style="height:4mm;padding-top:0mm;padding-bottom:0mm;"/>
										<div class="styLNDesc" style="width:72mm;padding-top:0mm;padding-bottom:0mm;">
											If "Yes," complete and attach Schedule UTP.
										</div>
										<div class="styGenericDiv" style="width:12mm;">
											<div class="styShadingCell" style="width:6mm;height:4mm;"/>
											<div class="styShadingCell" style="width:6mm;height:4mm;"/>
										</div>
									</div>
									<!-- Line 14 -->
									<!--Form 1120-L Sch M Line 14 should be Boolean. We will post it as a known issue and add the fix to a TY20/PY21 UWR.-->
									<div class="styGenericDiv" style="width:92mm;">
										<div class="styLNLeftNumBox" style="height:4mm;padding-top:0mm;padding-bottom:0mm;">14</div>
										<div class="styLNDesc" style="width:72mm;padding-top:0mm;padding-bottom:0mm;">
											Does the corporation have gross receipts of at least $500 million in any of the three preceding tax years? (See section 59A(e)(2) and (3).)
											<!--Dotted Line-->
											<span style="letter-spacing:4mm;font-weight:bold">.............</span>
										</div>
										<div class="styGenericDiv" style="width:12mm;">
											<div class="styShadingCell" style="width:6mm;height:4mm;"/>
											<div class="styShadingCell" style="width:6mm;height:4mm;"/>
											<div class="styIRS1120LNYesNoBox">
												<span style="font-weight:normal;">
													<xsl:call-template name="PopulateYesBoxText">
														<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/GrossReceiptsLast3YearsInd"/>
														<xsl:with-param name="BackupName">GrossReceiptsLast3YearsIndYes</xsl:with-param>
													</xsl:call-template>
												</span>
											</div>
											<div class="styIRS1120LNYesNoBox">
												<span style="font-weight:normal;">
													<xsl:call-template name="PopulateNoBoxText">
														<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/GrossReceiptsLast3YearsInd"/>
														<xsl:with-param name="BackupName">GrossReceiptsLast3YearsIndNo</xsl:with-param>
													</xsl:call-template>
												</span>
											</div>
										</div>
									</div>
									<div class="styGenericDiv" style="width:92mm;">
										<div class="styLNLeftNumBox" style="height:4mm;padding-top:0mm;padding-bottom:0mm;"/>
										<div class="styLNDesc" style="width:72mm;padding-top:0mm;padding-bottom:0mm;">
											If "Yes", complete and attach Form 8991.
											<!-- Form to Form Link   -->
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/GrossReceiptsLast3YearsInd"/>
											</xsl:call-template>
										</div>
										<div class="styGenericDiv" style="width:12mm;">
											<div class="styShadingCell" style="width:6mm;height:4mm;"/>
											<div class="styShadingCell" style="width:6mm;height:4mm;"/>
										</div>
									</div>									
									<!-- Line 15 -->
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:4.5mm;">15</div>
										<div class="styLNDesc" style="width:72mm;height:4.5mm;">
											During the tax year, did the corporation pay or accrue any interest or royalty for which the deduction is not allowed under section 267A? See instructions
											<!--Dotted Line-->
											<span style="letter-spacing:4mm;font-weight:bold">.........</span>
										</div>
										<div class="styGenericDiv" style="width:12mm;">
											<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
											<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
											<div class="styIRS1120LNYesNoBox">
												<span style="font-weight:normal;">
													<xsl:call-template name="PopulateYesBoxText">
														<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/NondedIntRoyaltyUndSect267AInd"/>
														<xsl:with-param name="BackupName">UncertainTaxPositionStatementYes</xsl:with-param>
													</xsl:call-template>
												</span>
											</div>
											<div class="styIRS1120LNYesNoBox">
												<span style="font-weight:normal;">
													<xsl:call-template name="PopulateNoBoxText">
														<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/NondedIntRoyaltyUndSect267AInd"/>
														<xsl:with-param name="BackupName">UncertainTaxPositionStatementNo</xsl:with-param>
													</xsl:call-template>
												</span>
											</div>
										</div>
									</div>
									<div class="styGenericDiv" style="width:92mm;">
										<div class="styLNLeftNumBox" style="height:4mm;padding-top:0mm;padding-bottom:0mm;"/>
										<div class="styLNDesc" style="width:72mm;padding-top:0mm;padding-bottom:0mm;">
										  If “Yes,” enter the total amount of the disallowed deductions  
											<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="right pointing arrow"/><br/>$
												<span style="width:25mm;border-bottom:1px solid black;text-align:right">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/NondedIntRoyaltyUndSect267AAmt"/>
												</xsl:call-template>
											</span>
										</div>
										<div class="styGenericDiv" style="width:12mm;">
											<div class="styShadingCell" style="width:6mm;height:6mm;"/>
											<div class="styShadingCell" style="width:6mm;height:6mm;"/>
										</div>
									</div>
									<!-- Line 16 -->
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:4mm;padding-top:0mm;padding-bottom:0mm;">16</div>
										<div class="styLNDesc" style="width:72mm;padding-top:0mm;padding-bottom:0mm;">
											Did the corporation have an election under section 163(j) for any real property trade or business or any farming business in effect during the tax year?  See instructions.
											<!--Dotted Line-->
											<span style="letter-spacing:4mm;font-weight:bold">......</span>
										</div>
										<div class="styGenericDiv" style="width:12mm;">
											<div class="styShadingCell" style="width:6mm;height:5mm;"/>
											<div class="styShadingCell" style="width:6mm;height:5mm;"/>
											<div class="styIRS1120LNYesNoBox">
												<span style="font-weight:normal;">
													<xsl:call-template name="PopulateYesBoxText">
														<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/Section163jElectionInd"/>
														<xsl:with-param name="BackupName">UncertainTaxPositionStatementYes</xsl:with-param>
													</xsl:call-template>
												</span>
											</div>
											<div class="styIRS1120LNYesNoBox">
												<span style="font-weight:normal;">
													<xsl:call-template name="PopulateNoBoxText">
														<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/Section163jElectionInd"/>
														<xsl:with-param name="BackupName">UncertainTaxPositionStatementNo</xsl:with-param>
													</xsl:call-template>
												</span>
											</div>
										</div>
									</div>									
									<!-- Line 17 -->
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:4mm;padding-top:0mm;padding-bottom:0mm;">17</div>
										<div class="styLNDesc" style="width:72mm;padding-top:0mm;padding-bottom:0mm;">
											Is the corporation required to file Form 8990, Limitation on Business Interest Expense IRC 163(j), to calculate the amount of deductible business interest? See instructions.
											<!-- Form to Form Link   -->
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/Form8990RequiredInd"/>
											</xsl:call-template>
											<!--Dotted Line-->
											<span style="letter-spacing:4mm;font-weight:bold">...</span>
										</div>
										<div class="styGenericDiv" style="width:12mm;">
											<div class="styShadingCell" style="width:6mm;height:5mm;border-bottom-width:0mm;"/>
											<div class="styShadingCell" style="width:6mm;height:5mm;border-bottom-width:0mm;"/>
											<div class="styIRS1120LNYesNoBox">
												<span style="font-weight:normal;">
													<xsl:call-template name="PopulateYesBoxText">
														<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/Form8990RequiredInd"/>
														<xsl:with-param name="BackupName">UncertainTaxPositionStatementYes</xsl:with-param>
													</xsl:call-template>
												</span>
											</div>
											<div class="styIRS1120LNYesNoBox">
												<span style="font-weight:normal;">
													<xsl:call-template name="PopulateNoBoxText">
														<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/Form8990RequiredInd"/>
														<xsl:with-param name="BackupName">UncertainTaxPositionStatementNo</xsl:with-param>
													</xsl:call-template>
												</span>
											</div>
										</div>
									</div>
								</td>
								<!--END Schedule M Right Side-->
							</tr>
						</table>
						<!-- END Schedule M Line Items -->
					</div>
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;clear:all;float:none;">
						<div style="float:right;">
							<span style="width:80px;"/>  
Form <span class="styBoldText" style="font-size:8pt;">1120-L</span> (2021)
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
							<xsl:with-param name="Desc">Form 1120L, Top Left Margin - Supporting Statement to Consolidated Return 
</xsl:with-param>
							<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/@suprtStmtToCnsldtReturnInd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Form 1120, Top Left Margin - Section 1291 Interest Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/@section1291InterestAmt"/>
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
							<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/Section953dElectionInd/@section953dCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line D - SECTION 953(D) Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/Section953dElectionInd/@section953dAmt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 7 - Other Income Item</xsl:with-param>
							<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/OtherIncomeAmt/@otherIncomeDesc"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 9 - Form 4684 Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/NetGainLoss/@form4684Indicator"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 30 - CCF Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/TaxableIncomeAmt/@cCFIndicator"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 28g - ODCIndicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/TotalCreditsAmt/@ozoneDepletingChemicalCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 28k - backupWithholdingIndicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/TotalPaymentsAmt/@backupWithholdingTypeCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 28k - backupWithholdingAmount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/TotalPaymentsAmt/@backupWithholdingAmt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 30 - CCF Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/TaxableIncomeAmt/@cCFAmount"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 32b - Beneficiary Of Trust Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/EstimatedTaxPaymentsAmt/@beneficiaryOfTrustIndicator"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 32b - Beneficiary Of Trust Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/EstimatedTaxPaymentsAmt/@beneficiaryOfTrustAmount"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 32b - Form 8816 Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/EstimatedTaxPaymentsAmt/@f8816Indicator"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 32b - Form 8816 Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/EstimatedTaxPaymentsAmt/@f8816Amount"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 32b - Section 847 Deduction Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/EstimatedTaxPaymentsAmt/@section847DeductionIndicator"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 32f(1) - Backup Withholding Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/TotalUndistributedLTCapGainAmt/@backupWithholdingTypeCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 32f(1) - Backup Withholding Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/TotalUndistributedLTCapGainAmt/@backupWithholdingAmt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 32f(2) - Ozone Depleting Chemicals Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="  $RtnDoc/IRS1120LEliminationsOrAdj/TotalFuelTaxCreditAmt/@ozoneDepletingChemicalsInd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Schedule K Line 02 - differential Rate 316 Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/IncomeTaxAmt/@differentialRate316Cd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Schedule K Line 02 - differential Rate316 Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/IncomeTaxAmt/@differentialRate316Amt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Schedule K Line 02 - section1291 Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/IncomeTaxAmt/@section1291Cd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Schedule K Line 02 - section1291 Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/IncomeTaxAmt/@section1291Amt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Schedule K Line 02 - section1291 Interest Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/IncomeTaxAmt/@section1291InterestCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Schedule K Line 02 - section1291 Interest Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/IncomeTaxAmt/@section1291InterestAmt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Schedule K Line 02 - section197 Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/IncomeTaxAmt/@section197Cd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Schedule K Line 02 - section197 Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/IncomeTaxAmt/@section197Amt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Schedule K Line 02 - form 8978 Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/IncomeTaxAmt/@form8978Cd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Schedule K Line 02 - form 8978 Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$IRS1120LScheduleK/IncomeTaxAmt/@form8978Amt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
							<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Schedule K Line 4 - Parent Corporation Name Control</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1120ScheduleK/PrntCorporationNameControlTxt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Schedule M Line 1b - Method Of Accounting Other</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$IRS1120LScheduleM/MethodOfAccountingOtherInd/@methodOfAccountingOtherDesc"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- ****************************END Left Over Table *******************************-->
					<!-- Begin Separated Repeating data table  -->
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
