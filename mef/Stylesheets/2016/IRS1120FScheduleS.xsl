<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1120FScheduleSStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!-- Defines the stage of the data, e.g. original or latest   -->
	<xsl:param name="Form1120FScheduleSData" select="$RtnDoc/IRS1120FScheduleS"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form1120FScheduleSData)"/>
					</xsl:call-template>
				</title>
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<meta http-equiv="Cache-Control" content="private"/>
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 1120F Schedule S"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<!-- This form exist on MEF as of Tax Year 2008 for Processing Year 2009 -->
					<!-- HINTs: Part II Line 8 data will display at the end of the form whether it is in-line print or seprated print -->
					<!-- Updated 05/21/2014 (WT) UWR 101606 for R9.5_D2 -->
					<!-- Updated 06/11/2014 (WT) UWR 112660 for R9.5_D3 -->
					<!--$PRINT STATEMENT -->
					 <xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1120FScheduleSStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm;">
				<form name="IRS1120F ScheduleS">
					<!--   BEGIN WARNING LINE  -->
					<xsl:call-template name="DocumentHeader"/>
					<!--   END WARNING LINE   -->
					<!--   BEGIN FORM HEADER  -->
					<div class="sty1120ScheduleHBB" style="width:187mm;height:24mm;border-bottom-width:2px;">
						<div class="sty1120ScheduleHFN" style="width:29mm;height:24mm;border-right-width:2px;">
							<div class="styFormNumber" style="width:29mm;font-size:9pt;">SCHEDULE S
								<br/>
								<span style="font-size:9pt;">(Form 1120-F)</span>
								<br/>
								<!--General Dependency Push Pin-->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData"/>
								</xsl:call-template>
								<br/><br/>
								<span style="font-size:6pt;font-weight: normal;">Department of the Treasury</span>
								<br/>
							</div>
							<div style="font-size:6pt;">Internal Revenue Service </div>
						</div>
						<div class="sty1120ScheduleHFTBox" style="width:121mm;height:24mm;">
							<div class="styMainTitle" style="padding-left:2mm">
							 Exclusion of Income From the International Operation of Ships or Aircraft Under Section 883
							</div>
							<div class="sty1120ScheduleHFST">
							<br/>
								<img src="{$ImagePath}/1120SchH_Bullet.gif" width="6" height="9" alt="Bullet"/>
								 Attach to Form 1120-F<br/>
								<img src="{$ImagePath}/1120SchH_Bullet.gif" width="6" height="9" alt="Bullet"/>
								 Information about Schedule S (Form 1120-F) and its separate instructions is at
								 <a style="text-decoration:none;color:black;" href="http://www.irs.gov/form1120F" title="Link to IRS.gov">
								 <i>www.irs.gov/form1120F</i></a>.
							</div>
						</div>
						<!-- Tax Year Box -->
						<div class="styTYBox" style="width:37mm;height:24mm;border-left-width:2px;">
							<!-- OMB No. -->
							<div class="styOMB" style="text-align:center;">OMB No. 1545-0123</div>
							<!-- Tax Year -->
							<div class="styTY" style="text-align:center;padding-top: 4.5mm">
								20<span class="styTYColor">16</span>
							</div>
						</div>
					</div>
					<!--   END FORM HEADER   -->
					<!--   BEGIN TAXPAYER INFO   -->
					<div class="styBB" style="width:187mm;height:10mm;float:left;clear:left;">
						<div class="styNameBox" style="width:135mm;height:10mm;font-size:7pt;font-weight:normal;">
							Name of corporation
							<br/>
							<span>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<div class="styEINBox" style="width:51mm;height:10mm;padding-left:2mm;font-size:7pt;font-weight:bold;">
							  Employer identification number
							<br/>
							<br/>
							<span style="width:25mm;text-align:left; font-weight:normal;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="EINChanged">true</xsl:with-param>
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!--   END TAXPAYER INFO   -->
					<!-- BEGIN PART I -->
					<div class="styBB" style="width:187mm;border-top-width:0px;">
						<div class="styPartName" style="width:23mm;">Part I </div>
						<div class="styPartDesc" style="width:164mm;">Qualified Foreign Corporation </div>
					</div>
					<!--   END PART I HEADER   -->
					<!-- Line 1a-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">1a</div>
						<div class="styLNDesc" style="width:121mm;">
						  Enter the name of the qualified foreign country in which the foreign corporation was organized
						  <img src="{$ImagePath}/1120SchH_Bullet.gif" width="6" height="9" alt="Bullet"/>
							<span style="width:3mm;"/>
						</div>
						<div class="styUnderlineAmount" style="width:58mm;text-align:left">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/ForeignCountryCd"/>
							</xsl:call-template>
						</div>						
					</div>
					<!--Line 1b  -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="padding-left:4mm;">b</div>
						<div class="styLNDesc" style="width:178mm;height:6mm;">
						   <span class="styText">
							Check one (and only one) of the following boxes to indicate the type of equivalent exemption granted by the foreign country listed on line 1a above:
						   </span>
						</div>
					</div>
					<!--Domestic law checked box -->
					<div style="width:187mm;">
						<!--<div class="styLNLeftNumBoxSD" style="padding-left:0mm;background-color:plum;"/>-->
						<div class="styLNDesc" style="padding-left:7mm;width:178mm;">
							<input type="checkbox" alt="DomesticLaw" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/DomesticLawInd"/>
									<xsl:with-param name="BackupName">IRS1120FSchSDomesticLaw</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/DomesticLawInd"/>
									<xsl:with-param name="BackupName">IRS1120FSchSDomesticLaw</xsl:with-param>
								</xsl:call-template>            
								Domestic law
						   </label>
						</div>
					</div>
					<!-- Exchange of notes checked box -->
					<div style="width:187mm;">
						<!--<div class="styLNLeftNumBoxSD"/>-->
						<div class="styLNDesc" style="padding-left:7mm;width:178mm;">
							<input type="checkbox" alt="ExchangeOfNotes" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/ExchangeOfNotesInd"/>
									<xsl:with-param name="BackupName">IRS1120FSchSExchangeOfNotes</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/ExchangeOfNotesInd"/>
									<xsl:with-param name="BackupName">IRS1120FSchSExchangeOfNotes</xsl:with-param>
								</xsl:call-template> 
								Exchange of notes
						  </label>
						</div>
					</div>
					<!-- Income Tax Convention checked box -->
					<div style="width:187mm;">
						<!--<div class="styLNLeftNumBoxSD"/>-->
						<div class="styLNDesc" style="padding-left:7mm;width:178mm;">
							<input type="checkbox" alt="IncomeTaxConvention" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/IncomeTaxConventionInd"/>
									<xsl:with-param name="BackupName">IRS1120FSchSIncomeTaxConvention</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/IncomeTaxConventionInd"/>
									<xsl:with-param name="BackupName">IRS1120FSchSIncomeTaxConvention</xsl:with-param>
								</xsl:call-template>             
								Income tax convention
							 </label>
						</div>
					</div>
					<!--  Line 1c  -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="padding-left:4mm;">c</div>
						<div class="styLNDesc" style="width:179mm;height:8mm;">
							<span class="styText">
							 Enter the applicable authority (i.e., the specific provision) of the equivalent exemption type indicated on line 1b (see instructions)
							</span>
							<span style="width:1mm;"/>
							<img src="{$ImagePath}/1120SchH_Bullet.gif" width="6" height="9" alt="Bullet"/>
							<br/>
							<div class="styUnderlineAmount" style="width:179mm;text-align:left">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/ApplicableAuthorityTxt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--   BEGIN LINE 2   -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc" style="width:179mm;">
							<span class="styText"> 
                              Enter the gross income in each of the following categories of qualified income for which the exemption is being claimed:
							 </span>
							<span style="width:1mm"/>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD"/>
						<div class="styLNDesc" style="width:179mm;height:8mm;">
							<span class="styText">
								<b>Note.</b> If an amount is not readily determinable, enter a reasonable estimate. If an estimate is used on any of the lines below,
                            </span>                            
                            <br/>
                            <div style="float:left;padding-right:1mm;padding-top:1mm;"> check here</div>
							<img src="{$ImagePath}/1120SchH_Bullet.gif" width="6" height="9" alt="Bullet"/>
							<input type="checkbox" alt="EstimateUsed" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/EstimateUsedInd"/>
									<xsl:with-param name="BackupName">IRS1120FSchSEstimateUsed</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/EstimateUsedInd"/>
									<xsl:with-param name="BackupName">IRS1120FSchSEstimateUsed</xsl:with-param>
								</xsl:call-template>             
							 </label>
						</div>
					</div>
					<!-- Line 2a -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="padding-left:4mm;">a</div>
						<div class="styLNDesc" style="width:136mm;">
							<span style="float:left;">Income from the carriage of passengers and cargo </span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>
						</div>
						<div class="styLNRightNumBox">2a</div>
						<div class="styLNAmountBox" style="width:35mm;">
							<xsl:choose>
								<xsl:when test="normalize-space($Form1120FScheduleSData/IncmCarriagePassengersCargoAmt)">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/IncmCarriagePassengersCargoAmt"/>
									</xsl:call-template>
									<span style="width: 2px"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/IncmCarriagePassengerCargoAmt"/>
									</xsl:call-template>
									<span style="width: 2px"/>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<!-- Line 2b -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="padding-left:4mm;">b</div>
						<div class="styLNDesc" style="width:136mm;">
							<span style="float:left;">Time or voyage (full) charter income of a ship or wet lease income of an aircraft </span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
						</div>
						<div class="styLNRightNumBox">2b</div>
						<div class="styLNAmountBox" style="width:35mm;">
							<xsl:choose>
								<xsl:when test="normalize-space($Form1120FScheduleSData/IncomeShipOrLeaseOfAircraftAmt)">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/IncomeShipOrLeaseOfAircraftAmt"/>
									</xsl:call-template>
									<span style="width: 2px"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/IncomeShipOrAircraftAmt"/>
									</xsl:call-template>
									<span style="width: 2px"/>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<!-- Line 2c -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="padding-left:4mm">c</div>
						<div class="styLNDesc" style="width:136mm;">
							<span style="float:left;">Bareboat charter income of a ship or dry lease income of an aircraft </span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
						</div>
						<div class="styLNRightNumBox">2c</div>
						<div class="styLNAmountBox" style="width:35mm;">
							<xsl:choose>
								<xsl:when test="normalize-space($Form1120FScheduleSData/CharterIncomeShipOrAircraftAmt)">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/CharterIncomeShipOrAircraftAmt"/>
									</xsl:call-template>
									<span style="width: 2px"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/CharterIncomeShipOrArcrftAmt"/>
									</xsl:call-template>
									<span style="width: 2px"/>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<!-- Line 2d -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="padding-left:4mm">d</div>
						<div class="styLNDesc" style="width:136mm;">
							<span style="float:left;">Incidental bareboat charter income of a ship or incidental dry lease income of an aircraft </span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
						</div>
						<div class="styLNRightNumBox">2d</div>
						<div class="styLNAmountBox" style="width:35mm;">
							<xsl:choose>
								<xsl:when test="normalize-space($Form1120FScheduleSData/IncdtlCharterOrDryLsIncmAmt)">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/IncdtlCharterOrDryLsIncmAmt"/>
									</xsl:call-template>
									<span style="width: 2px"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/IncdtlCharterOrDryLsIncmFAmt"/>
									</xsl:call-template>
									<span style="width: 2px"/>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<!-- Line 2e -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="padding-left:4mm">e</div>
						<div class="styLNDesc" style="width:136mm;">
							<span style="float:left;">Incidental container-related income </span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">......................</span>
						</div>
						<div class="styLNRightNumBox">2e</div>
						<div class="styLNAmountBox" style="width:35mm;">
							<xsl:choose>
								<xsl:when test="normalize-space($Form1120FScheduleSData/IncdtlContainerRltdIncmAmt)">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/IncdtlContainerRltdIncmAmt"/>
									</xsl:call-template>
									<span style="width: 2px"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/IncdtlContainerRelatedIncmAmt"/>
									</xsl:call-template>
									<span style="width: 2px"/>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<!-- Line 2f -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="padding-left:4mm">f</div>
						<div class="styLNDesc" style="width:136mm;">
						  Income incidental to the international operation of ships or aircraft other than incidental income 
						 <span style="float:left;">included on lines 2d and 2e above </span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">......................</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">2f</div>
						<div class="styLNAmountBox" style="width:35mm;height:8mm;padding-top:4mm;">
							<xsl:choose>
								<xsl:when test="normalize-space($Form1120FScheduleSData/IncmIncdtlIntntlShipsArcrftAmt)">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/IncmIncdtlIntntlShipsArcrftAmt"/>
									</xsl:call-template>
									<span style="width: 2px"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/IncmIncdtlIntntlShipArcrftFAmt"/>
									</xsl:call-template>
									<span style="width: 2px"/>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<!-- Line 2g -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="padding-left:4mm">g</div>
						<div class="styLNDesc" style="width:136mm;">
						  Capital gains derived by a qualified foreign corporation engaged in the international operation of
						  ships or aircraft from the sale, exchange or other disposition of a ship, aircraft, container or
						  related equipment or other moveable property used by that qualified foreign corporation in the
						  international operation of ships or aircraft 
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">...............................</span>
						</div>
						<div class="styLNRightNumBox" style="height:14mm;padding-top:10mm">2g</div>
						<div class="styLNAmountBox" style="width:35mm;height:14mm;padding-top:10mm;">
							<xsl:choose>
								<xsl:when test="normalize-space($Form1120FScheduleSData/CapitalGainsAmt)">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/CapitalGainsAmt"/>
									</xsl:call-template>
									<span style="width: 2px"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/ForeignCorpCapitalGainsAmt"/>
									</xsl:call-template>
									<span style="width: 2px"/>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<!-- Line 2h -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="padding-left:4mm">h</div>
						<div class="styLNDesc" style="width:136mm;">
						  Income from participation in a pool, partnership, strategic alliance, joint operating agreement,
						  code-sharing arrangement, international operating agency, or other joint venture described in
						  Regulations 
						    <span style="float:left;">section 1.883-1(e)(2) </span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">..........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:6mm">2h</div>
						<div class="styLNAmountBox" style="width:35mm;height:11mm;padding-top:6mm;">
							<xsl:choose>
								<xsl:when test="normalize-space($Form1120FScheduleSData/IncomeFromJointVentureAmt)">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/IncomeFromJointVentureAmt"/>
									</xsl:call-template>
									<span style="width: 2px"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/ForeignCorpJointVentureIncmAmt"/>
									</xsl:call-template>
									<span style="width: 2px"/>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<!-- STOCK OWNERSHIP TEST -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD"/>
						<div class="styLNDesc" style="width:179mm;font-size:8pt;padding-top:0mm;">
							<b>Stock ownership test of Regulations section 1.883-1(c)(2): </b>
						</div>
					</div>
					<!--    Line 3  -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="width:179mm;height:6mm;">
							<span class="styText">Check one (and only one) of the following boxes to indicate the test under
							  which the stock ownership test of Regulations section 1.883-1(c)(2) was satisfied:
							</span>
						</div>
					</div>
					<!--Publicly-Traded Test Checked-box -->
					<div style="width:187mm;">
						<!--<div class="styLNLeftNumBoxSD"/>-->
						<div class="styLNDesc" style="padding-left:7mm;width:179mm;">
							<input type="checkbox" alt="PubliclyTradedTest" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/PubliclyTradedTestInd"/>
									<xsl:with-param name="BackupName">IRS1120FSchSPubliclyTradedTest</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/PubliclyTradedTestInd"/>
									<xsl:with-param name="BackupName">IRS1120FSchSPubliclyTradedTest</xsl:with-param>
								</xsl:call-template>            
								 The publicly-traded test of Regulations section 1.883-2(a). 
								<b>Complete Part II.</b>
							</label>
						</div>
					</div>
					<!--CFC Stock Ownership Test Checked-box -->
					<div style="width:187mm;">
						<!--<div class="styLNLeftNumBoxSD"/>-->
						<div class="styLNDesc" style="padding-left:7mm;width:179mm;">
							<input type="checkbox" alt="CFCStockOwnershipTest" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/CFCStockOwnershipTestInd"/>
									<xsl:with-param name="BackupName">IRS1120FSchSCFCStockOwnershipTest</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/CFCStockOwnershipTestInd"/>
									<xsl:with-param name="BackupName">IRS1120FSchSCFCStockOwnershipTest</xsl:with-param>
								</xsl:call-template> 
								 The CFC stock ownership test of Regulations section 1.883-3(a). 
								<b>Complete Part III.</b>
							</label>
						</div>
					</div>
					<!-- Qualified Shareholder Stock Ownership Test -->
					<div style="width:187mm;">
						<!--<div class="styLNLeftNumBoxSD"/>-->
						<div class="styLNDesc" style="padding-left:7mm;width:179mm;height:5mm;">
							<input type="checkbox" alt="CFCQualifiedShrStockOwnershipTest" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/QualifiedShrStkOwnrTestInd"/>
									<xsl:with-param name="BackupName">IRS1120FSchSCFCQualifiedShrStockOwnershipTest</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/QualifiedShrStkOwnrTestInd"/>
									<xsl:with-param name="BackupName">IRS1120FSchSCFCQualifiedShrStockOwnershipTest</xsl:with-param>
								</xsl:call-template>             
									The qualified shareholder stock ownership test of Regulations section 1.883-4(a). 
									<b>Complete Part IV.</b>
							</label>
						</div>
					</div>
					<!--   BEGIN LINE 4   -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc" style="width:170mm;">
							<span class="styText">Check the box if any of the shares of the foreign corporation's
							 stock or the stock of any direct, indirect, or constructive 
							</span>
							<span style="float:left;">shareholder are issued in bearer form </span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.............................</span>
						</div>
						<div style="width:8mm;float:right;padding-top:2.5mm;">
							<input type="checkbox" alt="AnyShrFrgnStkIssdInBearerForm" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/AnyShrFrgnStkIssdBearerFormInd"/>
									<xsl:with-param name="BackupName">IRS1120FSchSAnyShrFrgnStkIssdInBearerForm</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/AnyShrFrgnStkIssdBearerFormInd"/>
									<xsl:with-param name="BackupName">IRS1120FSchSAnyShrFrgnStkIssdInBearerForm</xsl:with-param>
								</xsl:call-template>             
							</label>
						</div>
					</div>
					<!--   BEGIN LINE 5   -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc" style="width:170mm;">
							<span class="styText">If the box on line 4 is checked:</span>
						</div>
					</div>
					<!-- Line 5a -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="padding-left:4mm">a</div>
						<div class="styLNDesc" style="width:170mm;">
						  <span class="styLNDesc" style="width:170mm;">
							  Check the box on this line 5a if none of the bearer 
							  shares (other than bearer shares maintained in a dematerialized or immobilized 
							  book-entry system) were relied on to satisfy any of the stock ownership tests 
							  described in Regulations section 1.883-1(c)(2) 
						  </span>
					<!--Dotted Line-->
						  <span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
						</div>
						<div style="width:8mm;float:right;padding-top:3mm;">
							<input type="checkbox" alt="NoBearerSharesReliedOn" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/NoBearerSharesReliedInd"/>
									<xsl:with-param name="BackupName">IRS1120FSchSNoBearerSharesReliedOn</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/NoBearerSharesReliedInd"/>
									<xsl:with-param name="BackupName">IRS1120FSchSNoBearerSharesReliedOn</xsl:with-param>
								</xsl:call-template>             
							</label>							
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" style="padding-left:4mm">b</div>
						<div class="styLNDesc" style="width:170mm;">
							<!-- Line 5b -->
							<span class="styLNDesc" style="width:170mm;">
							   Check the box on this line 5b if any of the bearer 
							   shares were maintained in a dematerialized or immobilized 
							   book-entry system <span style="float:left;"> and were relied on to satisfy any of the stock ownership tests 
							   described in Regulations section 1.883-1(c)(2)</span>
							</span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
						</div>
						<div style="width:8mm;float:right;padding-top:4mm;">
							<input type="checkbox" alt="BearerSharesMaintainedReliedOn" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/BearerSharesMaintReliedInd"/>                            
									<xsl:with-param name="BackupName">IRS1120FSchSBearerSharesMaintainedReliedOn</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/BearerSharesMaintReliedInd"/>
									<xsl:with-param name="BackupName">IRS1120FSchSBearerSharesMaintainedReliedOn</xsl:with-param>
								</xsl:call-template>             
							</label>
						</div>
					</div>
					<!-- BEGIN PART II -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:23mm;">Part II</div>
						<div class="styPartDesc" style="width:164mm;">
						  Stock Ownership Test for Publicly-Traded Corporations
						</div>
					</div>
					<!--   END PART II HEADER   -->
					<!-- Line 6-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc" style="width:88mm;">
						  Enter the name of the country in which the stock is primarily traded
						  <img src="{$ImagePath}/1120SchH_Bullet.gif" width="6" height="9" alt="Bullet"/>
						</div>
						<div class="styUnderlineAmount" style="width:91mm;text-align:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/StockTradedCountryCd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 7-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc" style="width:92mm;">
						  Enter the name of the securities market(s) on which the stock is listed
						  <img src="{$ImagePath}/1120SchH_Bullet.gif" width="6" height="9" alt="Bullet"/>
						</div>
						<div class="styUnderlineAmount" style="width:87mm;text-align:left">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/StockListedSecurityMarketNm"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  Line 8   -->
					<!-- HINTs: Part II Line 8 data will display at the end of the form whether it is in-line print or seprated print -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="styLNDesc" style="width:179mm;height:auto;">
							<span class="styText">
								Enter a description of each class of stock relied on to meet the "regularly traded test" of Regulations section 1.883-2(d) (see  
							</span>
							<span style="width:55mm;float:left;">instructions for description requirements) 
							<img src="{$ImagePath}/1120SchH_Bullet.gif" width="6" height="9" alt="Bullet"/>
							</span>
							<xsl:if test="($Print = $Separated) or (count($Form1120FScheduleSData/ClassStockInformationDsc) &gt;1) ">
								<span class="styUnderlineAmount" style="width:124mm;float:right;text-align:left;">See Additional Data Table
								</span>
							</xsl:if>
							<xsl:if test="($Print != $Separated) and (count($Form1120FScheduleSData/ClassStockInformationDsc) &lt;2) ">
							<span class="styUnderlineAmount" style="width:124mm;float:right;text-align:left;">
							<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/ClassStockInformationDsc"/>
								</xsl:call-template>
							</span></xsl:if>
						</div>
					</div>
					<!--   Line 9   -->
					<div style="width:187mm;">
					   <div class="styLNLeftNumBoxSD">9</div>
						  <div class="styLNDesc" style="width:179mm;height:8mm;">
							  Do one or more 5% shareholders (see instructions for definition) own in the aggregate 50% or more of the vote and value of the 
							  <span style="width:131mm;float:left;">
							  outstanding shares of any class of stock for more than half the number of days during the tax year?
							   </span>
							<!--Dotted Line-->
							<span class="styBoldText" style="width:47mm;float:right;padding-right:1mm;">
								<span class="styDotLn">..</span>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/ShareholdersVoteInd"/>
										 <xsl:with-param name="BackupName">IRS1120FSchSShareholdersVote</xsl:with-param>
									</xsl:call-template>          
										Yes           
									</label>
								<span style="width:8px;"/>
								<input type="checkbox" alt="ShareholdersVote" class="styCkbox" name="Checkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/ShareholdersVoteInd"/>
										<xsl:with-param name="BackupName">IRS1120FSchSShareholdersVote</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:8mm;"/>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/ShareholdersVoteInd"/>
										<xsl:with-param name="BackupName">IRS1120FSchSShareholdersVote</xsl:with-param>
									</xsl:call-template>            
										No            
									</label>
								<span style="width:8px;"/>
								<input type="checkbox" alt="ShareholdersVote" class="styCkbox" name="Checkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/ShareholdersVoteInd"/>
										<xsl:with-param name="BackupName">IRS1120FSchSShareholdersVote</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
					</div>
					<div style="width:187mm;">
					   <div class="styLNLeftNumBoxSD"/>
						<div class="styLNDesc" style="width:179mm;padding-top:0mm;">
						   If "Yes," complete line 10.
						</div>
					</div>
					<div style="width:187mm;">
					  <div class="styLNLeftNumBoxSD"/>
						<div class="styLNDesc" style="width:179mm;">
						    If "No," skip line 10. 
						</div>
					  </div>
					<div class="styTBB" style="width:187mm;"/>
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:left;">
							<span class="styBoldText">For Paperwork Reduction Act Notice, see the Instructions for Form 1120-F. </span>
							<span style="width:3mm;"/>Cat. No. 50766D 
                      </div>
						<div style="float:right;">
							<span style="width:2px;"/>
							<span class="styBoldText" style="font-size:6pt;">
								<b>Schedule S (Form 1120-F) 2016</b>
							</span>
						</div>
					</div>
					<p style="page-break-before: always"/>
					<!-- END Page Break and Footer-->
					<!--Begin Page 2 -->
					<!-- Page Header -->
					<div class="styTBB" style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNDesc" style="width:94mm;">Schedule S (Form 1120-F) 2016</div>
						</div>
						<div style="float:right;clear:none;">
							<div class="styLNDesc" style="width:93mm;text-align:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
							</div>
						</div>
					</div>
					<!-- END Page Header -->
					<!--  Line 10   -->
					<div style="width:187mm;">
					  <div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc" style="width:178mm;">
							<span class="styText">
								For each class of stock relied on to meet the "regularly traded test" of Regulations section 1.883-2(d), indicate:
							 </span>
						</div>
					</div>
					<!--   Line 10a(i) Row 1  -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:4mm;">a</div>
						<div class="styLNDesc" style="width:179mm;">
							<b>(i)</b>
							<span style="width:2mm;"/>
							<span class="styText">
								The days during the tax year of the corporation in which the class of stock was closely held, without regard to the exception in 
							</span>
						</div>
					</div>
					<!--Line 10a (i) Row 2 -->
					<div style="width:187mm;">
					  <div style="float:left;clear:none;">
						<div class="styLNLeftNumBox"/>
						  <div class="styLNLeftNumBox" style="width:5.5mm;"/>
							<div class="styLNDesc" style="width:54mm;">Regulations section 1.883-2(d)(3)(ii) 
									<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/DaysFrgnCorpStkCloselyHeldCnt"/>
								</xsl:call-template>
								<span style="width:1mm;"/>
								<img src="{$ImagePath}/1120SchH_Bullet.gif" width="6" height="9" alt="Bullet"/>
								<span style="width:2mm"/>
							</div>
							<div style="float:right;clear:none;">
								<span class="styUnderlineAmount" style="width:118mm;text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/DaysFrgnCorpStkCloselyHeldCnt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
					</div>
					<!--   Line 10a(ii) Row 1  -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:4mm;"/>
						<div class="styLNDesc" style="width:179mm;">
							<b>(ii)</b>
							<span style="width:1mm;"/>
							<span class="styText">
							  The total percentage of the vote and value of the class of stock that is owned by 5% shareholders during such days
							</span>
						</div>
					</div>
					<!--Line 10a(ii) Row 2 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNLeftNumBox" style="width:5mm;"/>
							<div class="styLNDesc" style="width:6mm;">
								<span style="width:1mm"/>
								<img src="{$ImagePath}/1120SchH_Bullet.gif" width="6" height="9" alt="Bullet"/>
								<span style="width:2mm"/>
							</div>
							<div style="float:right;clear:none;">
							  <xsl:if test="not($Form1120FScheduleSData/TotalPctOfValueStockOwnedRt) =''">
								<span class="styUnderlineAmount" style="width:25mm;text-align:left;">
									<xsl:call-template name="PopulatePercent">
										<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/TotalPctOfValueStockOwnedRt"/>
									</xsl:call-template>
								</span>
							  </xsl:if>
							  <xsl:if test="($Form1120FScheduleSData/TotalPctOfValueStockOwnedRt) =''">
								<span class="styUnderlineAmount">
								%
								</span>
							  </xsl:if>
							</div>
						</div>
					</div>
					<!--    Line 10b  -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
						<div class="styLNDesc" style="width:179mm;height:10mm;">
							<span class="styText">For all qualified shareholders on which the corporation intends to rely to satisfy the closely-held
							 exception test of Regulations section 1.883-2(d)(3)(ii), and who own stock in the closely-held block (directly, indirectly, or by 
							 applying the attribution rules of Regulations section 1.883-4(c)), enter:</span>
							<span style="width:1mm"/>
						</div>
					</div>
					<!--Line 10b(i) Row  -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNLeftNumBox" style="width:5.5mm;;padding-left:0px;font-weight:bold;">(i)</div>
							<div class="styLNDesc" style="width:118mm;">
								The total number of qualified shareholders, as defined in Regulations section 1.883-4(b)(1)
							<span style="width:1mm"/>
								<img src="{$ImagePath}/1120SchH_Bullet.gif" width="6" height="9" alt="Bullet"/>
								<span style="width:2mm"/>
							</div>
							<div style="float:right;clear:none;">
								<span class="styUnderlineAmount" style="width:54mm;text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/TotalQualifiedShareholdersCnt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
					</div>
					<!--   Line 10b(ii) Row 1  -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:4mm;"/>
						<div class="styLNDesc" style="width:179mm;">
							<b>(ii)</b>
							<span style="width:1mm;"/>
							<span class="styText">
								The total percentage of the value of the shares of the class of stock owned, directly or indirectly, by such qualified shareholders 
							</span>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styGenericDiv" style="height:6mm;padding-left:14mm;">by country of residence (see instructions): </div>
						<!--Toggle Button for Line 10b(ii) Table -->
						<div style="width:7mm;text-align:right;float:right;clear:none;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/TotalPctOfValueSharesOwnedRt"/>
								<xsl:with-param name="containerHeight" select="5"/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerID" select=" 'TPctn' "/>
							</xsl:call-template>
						</div>
					</div>
					<!--<div class="styTableContainer" id="TPctn" style="width:187mm;border-bottom:0px;">
						<xsl:call-template name="SetInitialState"/>-->
					<div id="TPctn" style="width:187mm;border-bottom:0px;">
                        <xsl:attribute name="class">
							<xsl:choose>
								<xsl:when test="($Print = $Separated)">styGenericDiv</xsl:when><xsl:otherwise>styTableContainer</xsl:otherwise>
							</xsl:choose>
                        </xsl:attribute>
						<table class="styTable" cellspacing="0">
							<thead class="styTableCellHeader" style="border-color: black; font-size: 8pt;border-bottom:0px;">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:29mm;border-left-width:0px;border-right:0px;border-top:0px;border-bottom:0px;"/>
									<th class="styTableCellHeader" scope="col" style="width:56mm;border-left-width:0px;border-right:0px;border-top:0px;border-bottom:0px;font-weight:normal">
									  Country code (see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:29mm;border-left-width:0px;border-right:0px;border-top:0px;border-bottom:0px;"/>
									<th class="styTableCellHeader;" scope="col" style="width:44mm;border-left-width:0px;border-right:0px;border-top:0px;border-bottom:0px;font-weight:normal;text-align:center;">
                      Percentage
									</th>
									<th class="styTableCellHeader" scope="col" style="width:29mm;border-left-width:0px;border-right:0px;border-top:0px;border-bottom:0px;"/>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
							<!-- Display all rows if the Print parameter is not Separated. If the Print parameter is Separated, but the number of 
							  elements is less than the container height, then also display all rows. -->
								<xsl:if test="($Print != $Separated) or (count($Form1120FScheduleSData/TotalPctOfValueSharesOwnedRt) &lt;= 5) ">
									<xsl:for-each select="$Form1120FScheduleSData/TotalPctOfValueSharesOwnedRt">
										<tr>
											<xsl:attribute name="class"/>
											<td class="styTableCell" style="width:29mm;border-left-width:0px;border-right:0px;border-top:0px;border-bottom:0px;"/>
											<td class="styUnderlineAmount" style="width:56mm;font-size:8pt;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CountryOfOperationCd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width:29mm;border-left-width:0px;border-right:0px;border-top:0px;border-bottom:0px;"/>
											<td class="styUnderlineAmount" style="width:44mm;font-size:8pt;text-align:right;" nowrap="yes">
											  <!--EXCEPTION/WARNING: Tester expected data to display % sign, column header indicate percentage therefore, data do not required to display percent sign unless PDF display % then the % sign must be display--> 
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="Pct"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width:29mm;border-left-width:0px;border-right:0px;border-top:0px;border-bottom:0px;"/>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!--  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->
								<!-- Display blank filler row 1. If the Print parameter is Separated and the number of elements exceeds the
								  container height, then display a mesage in the first row directing the user to the additional data table -->
								<xsl:if test="count($Form1120FScheduleSData/TotalPctOfValueSharesOwnedRt) &lt; 1 or                                        (($Print = $Separated) and (count($Form1120FScheduleSData/TotalPctOfValueSharesOwnedRt)&gt;5)) ">
									<tr>
										<xsl:attribute name="class"/>
										<td class="styTableCell" style="width:29mm;border-left-width:0px;border-right:0px;border-top:0px;border-bottom:0px;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styUnderlineAmount" style="width:56mm;font-size:8pt;text-align:center;">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/TotalOutstandingSharesOwnedPct"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="width:29mm;border-left-width:0px;border-right:0px;border-top:0px;border-bottom:0px;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styUnderlineAmount" style="width:44mm;font-size:8pt;text-align:right;" nowrap="yes">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:29mm;border-left-width:0px;border-right:0px;border-top:0px;border-bottom:0px;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<!--  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->
								<!-- Display blank filler row 2. If the Print parameter is Separated and the number of elements exceeds the
									 container height, then display a mesage in the first row directing the user to the additional data table -->
								<xsl:if test="count($Form1120FScheduleSData/TotalPctOfValueSharesOwnedRt) &lt; 2 or                                      (($Print = $Separated) and (count($Form1120FScheduleSData/TotalPctOfValueSharesOwnedRt)&gt;5)) ">
									<tr>
										<xsl:attribute name="class"/>
										<td class="styTableCell" style="width:29mm;border-left-width:0px;border-right:0px;border-top:0px;border-bottom:0px;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styUnderlineAmount" style="width:56mm;font-size:8pt;text-align:center;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:29mm;border-left-width:0px;border-right:0px;border-top:0px;border-bottom:0px;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styUnderlineAmount" style="width:44mm;font-size:8pt;text-align:right;" nowrap="yes">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:29mm;border-left-width:0px;border-right:0px;border-top:0px;border-bottom:0px;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<!--  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->
								<!-- Display blank filler row 3. If the Print parameter is Separated and the number of elements exceeds the -->
								<!-- container height, then display a mesage in the first row directing the user to the additional data table -->
								<xsl:if test="count($Form1120FScheduleSData/TotalPctOfValueSharesOwnedRt) &lt; 3 or                                      (($Print = $Separated) and (count($Form1120FScheduleSData/TotalPctOfValueSharesOwnedRt)&gt;5)) ">
									<tr>
										<xsl:attribute name="class"/>
										<td class="styTableCell" style="width:29mm;border-left-width:0px;border-right:0px;border-top:0px;border-bottom:0px;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styUnderlineAmount" style="width:56mm;font-size:8pt;text-align:center;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:29mm;border-left-width:0px;border-right:0px;border-top:0px;border-bottom:0px;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styUnderlineAmount" style="width:44mm;font-size:8pt;text-align:right;" nowrap="yes">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:29mm;border-left-width:0px;border-right:0px;border-top:0px;border-bottom:0px;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<!--  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->
								<!-- Display blank filler row 4. If the Print parameter is Separated and the number of elements exceeds the -->
								<!-- container height, then display a mesage in the first row directing the user to the additional data table -->
								<xsl:if test="count($Form1120FScheduleSData/TotalPctOfValueSharesOwnedRt) &lt; 4 or                                      (($Print = $Separated) and (count($Form1120FScheduleSData/TotalPctOfValueSharesOwnedRt)&gt;5)) ">
									<tr>
										<xsl:attribute name="class"/>
										<td class="styTableCell" style="width:29mm;border-left-width:0px;border-right:0px;border-top:0px;border-bottom:0px;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styUnderlineAmount" style="width:56mm;font-size:8pt;text-align:center;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:29mm;border-left-width:0px;border-right:0px;border-top:0px;border-bottom:0px;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styUnderlineAmount" style="width:44mm;font-size:8pt;text-align:right;" nowrap="yes">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:29mm;border-left-width:0px;border-right:0px;border-top:0px;border-bottom:0px;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<!--  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->
								<!-- Display blank filler row 5. If the Print parameter is Separated and the number of elements exceeds the -->
								<!-- container height, then display a mesage in the first row directing the user to the additional data table -->
								<xsl:if test="count($Form1120FScheduleSData/TotalPctOfValueSharesOwnedRt) &lt; 5 or                                      (($Print = $Separated) and (count($Form1120FScheduleSData/TotalPctOfValueSharesOwnedRt)&gt;5)) ">
									<tr>
										<xsl:attribute name="class"/>
										<td class="styTableCell" style="width:29mm;border-left-width:0px;border-right:0px;border-top:0px;border-bottom:0px;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styUnderlineAmount" style="width:56mm;font-size:8pt;text-align:center;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:29mm;border-left-width:0px;border-right:0px;border-top:0px;border-bottom:0px;">
											<span class="styTableCellPad"/>
										</td>
										<td class="styUnderlineAmount" style="width:44mm;font-size:8pt;text-align:right;" nowrap="yes">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:29mm;border-left-width:0px;border-right:0px;border-top:0px;border-bottom:0px;">
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:if>
								<!--  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
							</tbody>
						</table>
					</div>				
					<!-- Toggle button bottom -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/TotalPctOfValueSharesOwnedRt"/>
						<xsl:with-param name="containerHeight" select="5"/>
						<xsl:with-param name="headerHeight" select="1"/>
						<xsl:with-param name="containerID" select=" 'TPctn' "/>
					</xsl:call-template>
					<div style="width:187mm"/>
					<!--  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
					<!--   Line 10b(iii) Row 1  -->
					<div style="width:187mm;border-top-width:0px;">
						<div class="styLNLeftNumBox" style="padding-left:4mm;"/>
						<div class="styLNDesc" style="width:179mm;height:5mm;padding-top:2mm;">
							<b>(iii)</b>
							<span style="width:1mm;"/>							
							 The days during the tax year of the corporation that such qualified 
							 shareholders owned, directly or indirectly, their shares in the 							
						</div>
					</div>
					<!--Line 10b(iii) Row 2 -->
					<div style="width:187mm;">
						<div style="float:left;clear:none;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNLeftNumBox" style="width:7mm;"/>
							<div class="styLNDesc" style="width:37mm;">closely-held block of stock
								<span style="width:1mm"/>
								<img src="{$ImagePath}/1120SchH_Bullet.gif" width="6" height="9" alt="Bullet"/>
								<span style="width:2mm"/>
							</div>
							<div style="float:right;clear:none;">
								<span class="styUnderlineAmount" style="width:135mm;text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/DaysShareholdersOwnedStockCnt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;height:2mm;"/>
					<!-- BEGIN PART III -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="width:23mm;">Part III</div>
						<div class="styPartDesc" style="width:164mm;">Stock Ownership Test for Controlled Foreign Corporations (CFC)</div>
					</div>
					<!--   END PART III HEADER   -->
					<!--    Line 11a   -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">11a</div>
						<div class="styLNDesc" style="width:179mm;height:8mm;">
							<span class="styText">Enter the percentage of the value of all outstanding shares of the CFC that is
							  owned by all "qualified U.S. persons" identified in the qualified ownership statements required 
							  under Regulations section 1.883-3(c)(2), applying the attribution of ownership rules of
						    </span>
						</div>
						<div class="styLNDesc" style="width:54mm;padding-left:8mm;margin-top:-0.5mm;">Regulations section 1.883-3(b)(4) 
                          <img src="{$ImagePath}/1120SchH_Bullet.gif" width="6" height="9" alt="Bullet"/>
						</div>
						<div style="width:35mm;text-align:left;margin-top:-0.5mm;">
							<xsl:if test="not($Form1120FScheduleSData/ValueSharesOwnedUSPersonsPct) =''">
								<span class="styUnderlineAmount" style="width:25mm;text-align:left;">
									<xsl:call-template name="PopulatePercent">
										<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/ValueSharesOwnedUSPersonsPct"/>
									</xsl:call-template>
								</span>
							</xsl:if>
							<xsl:if test="($Form1120FScheduleSData/ValueSharesOwnedUSPersonsPct) =''">
								<!--<span class="styUnderlineAmount">-->
								%
								<!--</span>-->
							</xsl:if>
						</div> 
					</div>
					<!-- Line 11b  -->
					<div style="width:187mm;margin-top:2.5mm;">
						<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
						<div class="styLNDesc" style="width:179mm;">
							<span class="styText">Enter the percentage of the value of all outstanding shares of the CFC that is
								owned by the "qualified U.S. persons" referred to on line
							</span>
						</div>
						<div class="styLNDesc" style="width:129mm;padding-left:8mm;margin-top:-0.5mm;">
							11a above as bearer shares maintained in a dematerialized or immobilized book-entry system 
						  <img src="{$ImagePath}/1120SchH_Bullet.gif" width="6" height="9" alt="Bullet"/>
						</div>
						<div style="width:35mm;text-align:left;margin-top:-0.5mm;">
							<xsl:if test="not($Form1120FScheduleSData/ValueSharesOwnedQlfyUSPrsnPct) =''">
								<span class="styUnderlineAmount" style="width:25mm;text-align:left;">
									<xsl:call-template name="PopulatePercent">
										<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/ValueSharesOwnedQlfyUSPrsnPct"/>
									</xsl:call-template>
								</span>
							</xsl:if>
							<xsl:if test="($Form1120FScheduleSData/ValueSharesOwnedQlfyUSPrsnPct) =''">
								<!--<span class="styUnderlineAmount">-->
								%
								<!--</span>-->
							</xsl:if>
						</div> 
					</div>
					<!-- Line 12 Row 1-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">12</div>
						<div class="styLNDesc" style="width:179mm;">
						  Enter the period during which such qualified U.S. persons held such stock (see instructions)
						  <img src="{$ImagePath}/1120SchH_Bullet.gif" width="6" height="9" alt="Bullet"/>
						</div>
					</div>
					<!-- Line 12 Row 2-->
					<div style="width:187mm;">
						<span class="styUnderlineAmount" style="padding-left:8mm;height:auto;width:187mm;text-align:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/USPersonsHeldStockPeriodTxt"/>
							</xsl:call-template>
						</span>
					</div>
					<!-- Line 13 Row 1-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">13</div>
						<div class="styLNDesc" style="width:179mm;">
						  Enter the period during which the foreign corporation was a CFC (see instructions)
						  <img src="{$ImagePath}/1120SchH_Bullet.gif" width="6" height="9" alt="Bullet"/>
						</div>
					</div>
					<!-- Line 13 Row 2-->
					<div style="width:187mm;">
						<span class="styUnderlineAmount" style="height:auto;width:187mm;text-align:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/FrgnCorporationWasCFCPrdTxt"/>
							</xsl:call-template>
						</span>
					</div>
					<!--  Line 14  -->
					<div style="width:187mm;height:6mm;padding-top:1.5mm;">
						<div class="styLNLeftNumBox">14</div>
						<div class="styLNDesc" style="width:148mm;">
							<span style="float:left;">Is the CFC directly held by qualified U.S. persons? </span>
							<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:1mm;">....................</span>
						</div>
						<div class="styLNDesc" style="width:15mm;text-align:left;font-size:9pt;">
							<span>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/CFCDirectlyHeldUSPersonsInd"/>
										<xsl:with-param name="BackupName">IRS1120FSchSCFCDirectlyHeldUSPersons</xsl:with-param>
									</xsl:call-template>          
									Yes           
								</label>
								<span style="width:8px:"/>
								<input type="checkbox" alt="CFCDirectlyHeldUSPersons" class="styCkbox" name="Checkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/CFCDirectlyHeldUSPersonsInd"/>
										<xsl:with-param name="BackupName">IRS1120FSchSCFCDirectlyHeldUSPersons</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
						<div class="styLNDesc" style="width:15mm;text-align:left;font-size:9pt;">
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/CFCDirectlyHeldUSPersonsInd"/>
									<xsl:with-param name="BackupName">IRS1120FSchSCFCDirectlyHeldUSPersons</xsl:with-param>
								</xsl:call-template>            
								  No            
							  </label>
							<span style="width:8px"/>
							<input type="checkbox" alt="CFCDirectlyHeldUSPersons" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/CFCDirectlyHeldUSPersonsInd"/>
									<xsl:with-param name="BackupName">IRS1120FSchSCFCDirectlyHeldUSPersons</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<div class="styBB" style="width:187mm;height:2mm;"/>
					<!-- BEGIN PART IV -->
					<div class="styBB" style="width:187mm;">
					  <div class="styPartName" style="width:23mm;">Part IV</div>
						<div class="styPartDesc" style="width:164mm;">Qualified Shareholder Stock Ownership Test</div>
					</div>
					<!--   END PART IV HEADER   -->
					<!--   BEGIN LINE 15   -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">15</div>
						<div class="styLNDesc" style="width:179mm;height:8mm;">
							<span class="styLNDesc" style="width:168mm;height:8mm;">
								Check the box if more than 50% of the value of the outstanding shares of the corporation is owned (or treated as owned
								by reason of Regulations section 1.883-4(c)) by qualified shareholders for each category	of income for which the exemption is claimed
								<span class="styDotLn" style="float:none;padding-left:2mm;padding-right:1mm;">...</span>
							</span>
							<!--Dotted Line-->
							<input type="checkbox" alt="MoreThan50PctValueOutstdShares" class="styCkbox" style="height:8mm;padding-top:8mm;" name="Checkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/ShrOwnMorevalueOfOutstdShrInd"/>
									<xsl:with-param name="BackupName">IRS1120SchSMoreThan50PctValueOutstdShares</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/ShrOwnMorevalueOfOutstdShrInd"/>
									<xsl:with-param name="BackupName">IRS1120SchSMoreThan50PctValueOutstdShares</xsl:with-param>
								</xsl:call-template>           
							 </label>
						</div>
					</div>
					<!--   BEGIN LINE 16   -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">16</div>
						<div class="styLNDesc" style="width:179mm;">
							<span class="styText">With respect to all qualified 
							shareholders relied on to satisfy the 50% ownership test 
							of Regulations section 1.883-4(a):
						  </span>
						</div>
					</div>
					<!--    Line 16a   -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:4mm">a</div>
						<div class="styLNDesc" style="width:179mm;">
							<div style="float:left;">
								<span class="styText" style="width:127mm;">Enter the total number of such qualified shareholders as defined in Regulations section 1.883-4(b)(1)
								</span>								
								<img src="{$ImagePath}/1120SchH_Bullet.gif" width="6" height="9" alt="Bullet"/>
							</div>
							<div style="width:42mm;padding-right:1mm;">
								<span class="styUnderlineAmount" style="width:40mm;float:right;text-align:left;margin-top:-1mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/TotQualifiedShrRegs18834b1Cnt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
					</div>
					<!--    Line 16b   -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
						<div class="styLNDesc" style="width:179mm;height:10mm;">
							<span class="styText" style="width:172mm;float:left;clear:none;">
								Enter the total percentage of the value of the outstanding shares owned, applying the attribution rules of Regulations section 1.883-4(c), by such qualified shareholders by country of residence or organization, whichever is applicable:
							</span>
							<span style="width:7mm;padding-top:0mm;text-align:right;float:right;clear:none;">
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/OutstandingSharesOwnedPct"/>
									<xsl:with-param name="containerHeight" select="5"/>
									<xsl:with-param name="headerHeight" select="1"/>
									<xsl:with-param name="containerID" select=" 'TPctn2' "/>
								</xsl:call-template>
							</span>
						</div>
						
						<!--<div class="styTableContainer" id="TPctn2" style="width:187mm;border-bottom:0px;">
							<xsl:call-template name="SetInitialState"/>-->
							
						<div id="TPctn2" style="width:187mm;border-bottom:0px;">
                            <xsl:attribute name="class">
								<xsl:choose>
									<xsl:when test="($Print = $Separated)">styGenericDiv</xsl:when><xsl:otherwise>styTableContainer</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>	
							
							<table class="styTable" cellspacing="0">
								<thead class="styTableThead">
									<tr>
										<th class="styTableCellHeader" scope="col" style="width:29mm;border-left-width:0px;border-right:0px;border-top:0px;border-bottom:0px;"/>
										<th class="styTableCellHeader" scope="col" style="border-left-width:0px;width:56mm;               border-right:0px;border-top:0px;border-bottom:0px;font-size:8pt;font-weight:normal;">
                     Country code (see instructions)
										</th>
										<th class="styTableCellHeader" scope="col" style="width:29mm;border-left-width:0px;border-right:0px;                                 border-top:0px;border-bottom:0px;"/>
										<th class="styTableCellHeader" scope="col" style="width:44mm;border-left-width:0px;border-right:0px;border-top:0px;border-bottom:0px;font-size:8pt;font-weight:normal">
                      Percentage
										</th>
										<th class="styTableCellHeader" scope="col" style="width:29mm;border-left-width:0px;border-right:0px;border-top:0px;border-bottom:0px;"/>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<!-- Display all rows if the Print parameter is not Separated. If the Print parameter is Separated, but the number of -->
									<!-- elements is less than the container height, then also display all rows. -->
									<xsl:if test="($Print != $Separated) or                   (count($Form1120FScheduleSData/TotalOutstandingSharesOwnedPct) &gt;= 5) ">
										<xsl:for-each select="$Form1120FScheduleSData/OutstandingSharesOwnedPct">
											<tr>
												<xsl:attribute name="class"/>
												<td class="styTableCell" style="width:29m;border-left-width:0px;border-right:0px;border-top:0px;border-bottom:0px;"/>
												<td class="styUnderlineAmount" style="width:56mm;font-size:8pt;text-align:center;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="CountryOfOperationCd"/>
													</xsl:call-template>
												</td>
												<td class="styTableCell" style="width:29mm;border-left-width:0px;border-right:0px;border-top:0px;border-bottom:0px;"/>
												<td class="styUnderlineAmount" style="width:44mm;text-align:right;font-size:8pt;" nowrap="yes">
													<xsl:call-template name="PopulatePercent">
														<xsl:with-param name="TargetNode" select="Pct"/>
													</xsl:call-template>
												</td>
												<td class="styTableCell" style="width:29mm;border-left-width:0px;border-right:0px;border-top:0px;border-bottom:0px;"/>
											</tr>
										</xsl:for-each>
									</xsl:if>
									<!-- Display blank filler row 1. If the Print parameter is Separated and the number of elements exceeds the -->
									<!-- container height, then display a mesage in the first row directing the user to the additional data table -->
									<xsl:if test="count($Form1120FScheduleSData/TotalOutstandingSharesOwnedPct) &lt; 1 or                               (($Print = $Separated) and (count($Form1120FScheduleSData/OutstandingSharesOwnedPct)&gt;5)) ">
										<tr>
											<xsl:attribute name="class"/>
											<td class="styTableCell" style="width:29mm;border-left-width:0px;border-right:0px;border-top:0px;border-bottom:0px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styUnderlineAmount" style="width:56mm;font-size:8pt;text-align:center;">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/TotalOutstandingSharesOwnedPct"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width:29mm;border-left-width:0px;border-right:0px;border-top:0px;border-bottom:0px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styUnderlineAmount" style="width:44mm;font-size:8pt;text-align:right;" nowrap="yes">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:29mm;border-left-width:0px;border-right:0px;border-top:0px;border-bottom:0px;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
									<!-- Display blank filler row 2. If the Print parameter is Separated and the number of elements exceeds the -->
									<!-- container height, then display a mesage in the first row directing the user to the additional data table -->
									<xsl:if test="count($Form1120FScheduleSData/OutstandingSharesOwnedPct) &lt; 2 or                                      (($Print = $Separated) and (count($Form1120FScheduleSData/OutstandingSharesOwnedPct)&gt;5)) ">
										<tr>
											<xsl:attribute name="class"/>
											<td class="styTableCell" style="width:29mm;border-left-width:0px;border-right:0px;border-top:0px;border-bottom:0px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styUnderlineAmount" style="width:56mm;font-size:8pt;text-align:center;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:29mm;border-left-width:0px;border-right:0px;border-top:0px;border-bottom:0px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styUnderlineAmount" style="width:44mm;font-size:8pt;text-align:right;" nowrap="yes">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:29mm;border-left-width:0px;border-right:0px;border-top:0px;border-bottom:0px;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
									<!-- Display blank filler row 3. If the Print parameter is Separated and the number of elements exceeds the -->
									<!-- container height, then display a mesage in the first row directing the user to the additional data table -->
									<xsl:if test="count($Form1120FScheduleSData/OutstandingSharesOwnedPct) &lt; 3 or                                      (($Print = $Separated) and (count($Form1120FScheduleSData/OutstandingSharesOwnedPct)&gt;5)) ">
										<tr>
											<xsl:attribute name="class"/>
											<td class="styTableCell" style="width:29mm;border-left-width:0px;border-right:0px;border-top:0px;border-bottom:0px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styUnderlineAmount" style="width:56mm;font-size:8pt;text-align:center;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:29mm;border-left-width:0px;border-right:0px;border-top:0px;border-bottom:0px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styUnderlineAmount" style="width:44mm;font-size:8pt;text-align:right;" nowrap="yes">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:29mm;border-left-width:0px;border-right:0px;border-top:0px;border-bottom:0px;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
									<!-- Display blank filler row 4. If the Print parameter is Separated and the number of elements exceeds the -->
									<!-- container height, then display a mesage in the first row directing the user to the additional data table -->
									<xsl:if test="count($Form1120FScheduleSData/OutstandingSharesOwnedPct) &lt; 4 or                                      (($Print = $Separated) and (count($Form1120FScheduleSData/OutstandingSharesOwnedPct)&gt;5)) ">
										<tr>
											<xsl:attribute name="class"/>
											<td class="styTableCell" style="width:29mm;border-left-width:0px;border-right:0px;border-top:0px;border-bottom:0px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styUnderlineAmount" style="width:56mm;font-size:8pt;text-align:center;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:29mm;border-left-width:0px;border-right:0px;border-top:0px;border-bottom:0px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styUnderlineAmount" style="width:44mm;font-size:8pt;text-align:right;" nowrap="yes">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:29mm;border-left-width:0px;border-right:0px;border-top:0px;border-bottom:0px;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
									<!-- Display blank filler row 5. If the Print parameter is Separated and the number of elements exceeds the -->
									<!-- container height, then display a mesage in the first row directing the user to the additional data table -->
									<xsl:if test="count($Form1120FScheduleSData/OutstandingSharesOwnedPct) &lt; 5 or                                      (($Print = $Separated) and (count($Form1120FScheduleSData/OutstandingSharesOwnedPct)&gt;5)) ">
										<tr>
											<xsl:attribute name="class"/>
											<td class="styTableCell" style="width:29mm;border-left-width:0px;border-right:0px;border-top:0px;border-bottom:0px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styUnderlineAmount" style="width:56mm;font-size:8pt;text-align:center;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:29mm;border-left-width:0px;border-right:0px;border-top:0px;border-bottom:0px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styUnderlineAmount" style="width:44mm;font-size:8pt;text-align:right;" nowrap="yes">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:29mm;border-left-width:0px;border-right:0px;border-top:0px;border-bottom:0px;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
								</tbody>
							</table>
							<div style="width:60mm;margin-left:101mm;font-size:3.0mm">
								<div class="styLNDesc" style="width:13.5mm;">Total</div>
								<span class="styUnderlineAmount" style="border-bottom-width:0px;padding-left:2mm;width:44mm;text-align:right;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/TotalOutstandingSharesOwnedPct"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
					</div>
					<!--Toggle Button end -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/OutstandingSharesOwnedPct"/>
						<xsl:with-param name="containerHeight" select="5"/>
						<xsl:with-param name="headerHeight" select="1"/>
						<xsl:with-param name="containerID" select=" 'TPctn2' "/>
					</xsl:call-template>
					<div style="width:187mm"/>
					<br/>
					<!-- Line 16c -->
					<div style="width:187mm;height:12mm;padding-top:6mm;">
						<div class="styLNLeftNumBox" style="padding-left:4mm;">c</div>
						<div class="styLNDesc" style="width:179mm;">
							<span class="styText">
					         Enter the percentage of the value of the outstanding shares that is owned by the qualified shareholders as bearer shares mantained 
							</span>
						</div>
						<div class="styLNDesc" style="width:79mm;padding-left:8mm;margin-top:-0.5mm;">
						  in a dematerialized or immobilized book-entry system
						  <img src="{$ImagePath}/1120SchH_Bullet.gif" width="6" height="9" alt="Bullet"/>
						</div>
						<div style="width:35mm;text-align:left;margin-top:-0.5mm;">
							<xsl:if test="not($Form1120FScheduleSData/OutstandingSharesMaintainedPct) =''">
								<span class="styUnderlineAmount" style="width:25mm;text-align:left;">
									<xsl:call-template name="PopulatePercent">
										<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/OutstandingSharesMaintainedPct"/>
									</xsl:call-template>
								</span>
							</xsl:if>
							<xsl:if test="($Form1120FScheduleSData/OutstandingSharesMaintainedPct) =''">
								<!--<span class="styUnderlineAmount">-->
								%
								<!--</span>-->
							 </xsl:if>
						</div>
					    <span style="width:25mm;"/>
					</div>
					<div style="width:187mm"/>
					<!-- Line 16d Row 1-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:4mm">d</div>
						<div class="styLNDesc" style="width:179mm;">
						  Enter the period during the tax year of the foreign corporation that such stock was held by qualified shareholders
						  <img src="{$ImagePath}/1120SchH_Bullet.gif" width="6" height="9" alt="Bullet"/>
						</div>
					</div>
					<!-- Line 16d Row 2-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc">
							<span class="styUnderlineAmount" style="width:179mm;text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/StockHeldShareholderPrd"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<div style="width:187mm;height:2mm;"/>
					<!--   BEGIN FORM FOOTER  -->
					<div class="sty1120ScheduleHFormFooter">
						<!-- Page Break and Footer-->
						<div class="pageEnd" style="width:187mm;padding-top:1mm;">
							<div style="float:left;">
								<span class="styBoldText"/>
								<span style="width:3mm;"/>
							</div>
							<div style="float:right;">
								<span style="width:2px;"/>
								<span class="styBoldText" style="font-size:6pt;">
									<b>Schedule S (Form 1120-F) 2016</b>
								</span>
							</div>
						</div>
						<!-- END Page Break and Footer-->
					</div>
					<p style="page-break-before: always"/>
					<!--Page End-->
					<!--<br class="pageEnd"/>-->
					<!-- BEGIN Left Over Table -->
					<!-- ADDITIONAL DATA Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">Additional Data </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form1120FScheduleSData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
          <xsl:if test="($Print = $Separated) or (count($Form1120FScheduleSData/ClassStockInformationDsc) &gt;1) "><br/>
            <span class="styRepeatingDataTitle">1120F Schedule S Part II, Line 8 - Enter a description of each class of stock relied on to meet the "regularly traded test" of Regulations section 1.883-2(d) (see instructions for description requirements </span>
            <table class="styDepTbl" style="font-size: 7pt; ">
              <thead class="styTableThead">
                <tr class="styDepTblHdr">
                  <th class="styDepTblCell" style="font-weight:normal;" scope="col">Class Stock Description</th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <xsl:for-each select="$Form1120FScheduleSData/ClassStockInformationDsc">
                  <tr>
                    <xsl:attribute name="class">
						<xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise>
						</xsl:choose>
                    </xsl:attribute>
                    <td class="styDepTblCell" style="text-align:left;width:180mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="StockClassDesc"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
           <!-- <xsl:call-template name="SetInitialDynamicTableHeight">
              <xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/TotalPctOfValueSharesOwnedRt"/>
              <xsl:with-param name="containerHeight" select="5"/>
              <xsl:with-param name="headerHeight" select="1"/>
              <xsl:with-param name="containerID" select=" 'TPctn' "/>
            </xsl:call-template>
            <br/>-->
          </xsl:if>
          <!-- END Left Over Table -->
          <!-- Additional Data Table for Separated Data from Part II Line 10b(ii) -->
          <xsl:if test="($Print = $Separated) and (count($Form1120FScheduleSData/TotalPctOfValueSharesOwnedRt) &gt; 5) ">
            <span class="styRepeatingDataTitle">1120F Schedule S Part II, Line 10b(ii) - The total percentage of the value of the shares of the class of stock owned.
             </span>
            <table class="styDepTbl" style="font-size: 7pt; ">
              <thead class="styTableThead">
                <tr class="styDepTblHdr">
                  <th class="styDepTblCell" style="font-weight:normal;" scope="col">Country code (see instructions) </th>
                  <th class="styDepTblCell" style="font-weight:normal;" scope="col">Percentage </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <xsl:for-each select="$Form1120FScheduleSData/TotalPctOfValueSharesOwnedRt">
                  <tr>
                    <xsl:attribute name="class">
						<xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise>
						</xsl:choose>
                    </xsl:attribute>
                    <td class="styDepTblCell" style="text-align:center;width:56mm">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="CountryOfOperationCd"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styDepTblCell" style="text-align:right;width:100mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="Pct"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
            <!--<xsl:call-template name="SetInitialDynamicTableHeight">
              <xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/TotalPctOfValueSharesOwnedRt"/>
              <xsl:with-param name="containerHeight" select="5"/>
              <xsl:with-param name="headerHeight" select="1"/>
              <xsl:with-param name="containerID" select=" 'TPctn' "/>
            </xsl:call-template>
            <br/>-->
          </xsl:if>
            <!-- Additional Data Table for Separated Data from 16b-->
          <xsl:if test="($Print = $Separated) and (count($Form1120FScheduleSData/TotalPctOfValueSharesOwnedRt) &gt; 5) ">
            <span class="styRepeatingDataTitle"> 
              1120F Schedule S Part IV, Line 16b  - The total percentage of the value outstanding shares owned. 
            </span>
            <table class="styDepTbl" style="font-size: 7pt; ">
            <thead class="styTableThead">
              <tr class="styDepTblHdr">
                <th class="styDepTblCell" style="font-weight:normal;" scope="col">Country code (see instructions) </th>
                <th class="styDepTblCell" style="font-weight:normal;" scope="col">Percentage </th>
              </tr>
            </thead>
            <tfoot/>
            <tbody>
            <xsl:for-each select="$Form1120FScheduleSData/OutstandingSharesOwnedPct">
                <tr>
                  <xsl:attribute name="class">
					  <xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise>
					  </xsl:choose>
                  </xsl:attribute>
                  <td class="styDepTblCell" style="text-align:center;width:56mm">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="CountryOfOperationCd"/>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styDepTblCell" style="text-align:right;width:100mm;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="Pct"/>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
              </xsl:for-each>
            </tbody>
          </table>
            <!--<xsl:call-template name="SetInitialDynamicTableHeight">
              <xsl:with-param name="TargetNode" select="$Form1120FScheduleSData/TotalPctOfValueSharesOwnedRt"/>
              <xsl:with-param name="containerHeight" select="5"/>
              <xsl:with-param name="headerHeight" select="2"/>
              <xsl:with-param name="containerID" select=" 'TPctn' "/>
            </xsl:call-template>
            <br/>-->
          </xsl:if>
					<!-- END Left Over Table -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>