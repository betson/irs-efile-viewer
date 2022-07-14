<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS5695Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form5695Data" select="$RtnDoc/IRS5695"/>

	<xsl:template match="/">
		<html lang="EN-US">
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form5695Data)"/>
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
				<meta name="Description" content="IRS Form 5695"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS5695Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="IRS5695" style="font-family:arial;">
					<!--  Begin Header section 1 -->
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;border-bottom-width:2px;">
						<div class="styFNBox" style="width:31mm;height:22mm;border-right-width:2px;padding-top:.5mm;">
							<div style="padding-top:1mm;">
								Form<span class="styFormNumber">  5695</span>
							</div>
							<!--General Dependency Push Pin-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form5695Data"/>
							</xsl:call-template>
							<br/>
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:123.5mm;">
							<!--  Main Title >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
							<div class="styMainTitle" style="height:8mm;">
								Residential Energy Credit
							</div>
							<div class="styGenericDiv" style="height:5mm;font-size:7pt;margin-left:2mm;text-align:center;">
								<span style="text-align:center;">
									<div style="width:100%;height:5mm;padding-left:5px;">
											<br/>
											<img src="{$ImagePath}/5695_Bullet_Sm.gif" alt="SmallBullet"/> 
											Information about Form 5695 and its instructions is at <i>www.irs.gov/form5695</i>.
											<br/>
											<img src="{$ImagePath}/5695_Bullet_Sm.gif" alt="SmallBullet"/> 
											Attach to Form 1040 or Form 1040NR.
									</div>
								</span>
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;border-left-width:2px;float:right">
							<div class="styOMB" style="height:2mm;font-size:7pt;">OMB No. 1545-0074</div>
							<div class="styTY">20<span class="styTYColor">12</span>
							</div>
							<div style="margin-left:3mm;text-align:left;font-size:7pt;">
								Attachment<br/>Sequence No. 
								<span class="styBoldText" style="font-size:9pt;">158</span>
							</div>
						</div>
					</div>
					<!--  End Header section 1 -->
					<!-- Begin Names and Identifying number section -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:137mm;height:8mm;font-weight:normal;font-size:7pt;">
							Name(s) shown on return<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">Name</xsl:with-param>
							</xsl:call-template>
						</div>
						<div style="height:8mm;width:50mm;height:4mm;padding:0px 0px 0px 2mm;font-size:7pt;" class="styEINBox">
							Your social security number
							<br/>
							<span style="font-weight:normal;text-align:center;width:100%">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- End Names and Identifying number section -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part I																								 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					
					<!-- Body -->
						<div class="styIRS5695LineItem" style="height:8mm;border-bottom-width:1px;border-color:black;">
							<div class="styIRS5695LNDesc" style="width:100%;height:auto;padding-left:0px;padding-top:2mm;">
								<b>Note.</b>
								<span class="styItalicText"> Skip lines 1 through 11 if you only have a <b>credit carryforward from 2011.</b></span>
							</div>
						</div>

						<!-- (1) ////////////////////////////////////////////////////-->
						<div class="styIRS5695LineItem" style="">
						<div class="styGenericDiv" style="padding-left:1.2mm;width:7.5mm;font-weight:bold;font-size:8pt;height:6mm">1</div>
							<div class="styIRS5695CleanDiv" style="width:144mm;height:auto;">
								<div class="styIRS5695LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5695LNDesc" style="padding-left:2.5mm;width:auto;height:100%;">
										Qualified solar electric property costs
										<!--Dotted Line-->
											<span class="styBoldText">.
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
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;padding-top:2mm">1</div>
							<div class="styLNAmountBox" style="height:6mm;border-left-width:0;width:26mm;padding-bottom:0;padding-top:2mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/SolarElecPropCostAmt"/>
									<xsl:with-param name="BackupName">IRS5695SolarElecPropCostAmt</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						<!-- (2) ////////////////////////////////////////////////////-->

						<div class="styIRS5695LineItem" style="">
						<div class="styGenericDiv" style="padding-left:1.2mm;width:7.5mm;font-weight:bold;font-size:8pt;height:6mm">2</div>
							<div class="styIRS5695CleanDiv" style="width:144mm;height:auto;">
								<div class="styIRS5695LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5695LNDesc" style="padding-left:2.5mm;width:auto;height:100%;">
										Qualified solar water heating property costs
										<!--Dotted Line-->
											<span class="styBoldText">.
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
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;padding-top:2mm">2</div>
							<div class="styLNAmountBox" style="height:6mm;border-left-width:0;width:26mm;padding-bottom:0;padding-top:2mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/SolarWaterHtPropCostAmt"/>
									<xsl:with-param name="BackupName">IRS5695SolarWaterHtPropCostAmt</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						<!-- (3) ////////////////////////////////////////////////////-->
						<div class="styIRS5695LineItem" style="">
						<div class="styGenericDiv" style="padding-left:1.2mm;width:7.5mm;font-weight:bold;font-size:8pt;height:6mm">3</div>
							<div class="styIRS5695CleanDiv" style="width:144mm;height:auto;">
								<div class="styIRS5695LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5695LNDesc" style="padding-left:2.5mm;width:auto;height:100%;">
										Qualified small wind energy property costs
										<!--Dotted Line-->
											<span class="styBoldText">.
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
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;padding-top:2mm">3</div>
							<div class="styLNAmountBox" style="height:6mm;border-left-width:0;width:26mm;padding-bottom:0;padding-top:2mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/SmallWindPropCostAmt"/>
									<xsl:with-param name="BackupName">IRS5695SmallWindPropCostAmt</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						<!-- (4) ////////////////////////////////////////////////////-->

						<div class="styIRS5695LineItem" style="">
						<div class="styGenericDiv" style="padding-left:1.2mm;width:7.5mm;font-weight:bold;font-size:8pt;height:6mm">4</div>
							<div class="styIRS5695CleanDiv" style="width:144mm;height:auto;">
								<div class="styIRS5695LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5695LNDesc" style="padding-left:2.5mm;width:auto;height:100%;">
										Qualified geothermal heat pump property costs
										<!--Dotted Line-->
											<span class="styBoldText">.
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
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;padding-top:2mm">4</div>
							<div class="styLNAmountBox" style="height:6mm;border-left-width:0;width:26mm;padding-bottom:0;padding-top:2mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/GeothrmlHtPumpPropCostAmt"/>
									<xsl:with-param name="BackupName">IRS5695GeothrmlHtPumpPropCostAmt</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						<!-- (5) ////////////////////////////////////////////////////-->
						<div class="styIRS5695LineItem" style="">
						<div class="styGenericDiv" style="padding-left:1.2mm;width:7.5mm;font-weight:bold;font-size:8pt;height:6mm">5</div>
							<div class="styIRS5695CleanDiv" style="width:144mm;height:auto;">
								<div class="styIRS5695LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5695LNDesc" style="padding-left:2.5mm;width:auto;height:100%;">
										Add lines 1 through 4
										<!--Dotted Line-->
											<span class="styBoldText">.
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
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;padding-top:2mm">5</div>
							<div class="styLNAmountBox" style="height:6mm;border-left-width:0;width:26mm;padding-bottom:0;padding-top:2mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/TotalEnergyCreditsAmt"/>
									<xsl:with-param name="BackupName">IRS5695TotalEnergyCreditsAmt</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						
						<!-- (6) ////////////////////////////////////////////////////-->
						<div class="styIRS5695LineItem" style="">
						<div class="styGenericDiv" style="padding-left:1.2mm;width:7.5mm;font-weight:bold;font-size:8pt;height:6mm">6</div>
							<div class="styIRS5695CleanDiv" style="width:144mm;height:auto;">
								<div class="styIRS5695LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5695LNDesc" style="padding-left:2.5mm;width:auto;height:100%;">
										Multiply line 5 by 30% (.30)
										<!--Dotted Line-->
											<span class="styBoldText">.
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
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;padding-top:2mm">6</div>
							<div class="styLNAmountBox" style="height:6mm;border-left-width:0;width:26mm;padding-bottom:0;padding-top:2mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/GeothrmlHtPumpPropStdPctCrAmt"/>
									<xsl:with-param name="BackupName">IRS5695GeothrmlHtPumpPropStdPctCrAmt</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						<!-- (7a) ////////////////////////////////////////////////////-->
						<div class="styIRS5695LineItem" style="">
						<div class="styGenericDiv" style="padding-left:1.2mm;width:7.5mm;font-weight:bold;font-size:8pt;padding-top:1mm">7a</div>
							<div class="styIRS5695CleanDiv" style="width:144mm;height:auto;padding-top:1mm;">
								<div class="styIRS5695LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5695LNDesc" style="padding-left:2.5mm;width:auto;height:100%;">
										Qualified fuel cell property. Was the qualified fuel cell property installed on or in connection with your main home located 
										in the United States? (See instructions)
										<!--Dotted Line-->
											<span class="styBoldText">.
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
												<img src="{$ImagePath}/5695_Bullet_Sm.gif" alt="SmallBullet"/>
											</span>
										</div>
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:10mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;padding-top:6mm">7a</div>
							<div class="styLNAmountBox" style="height:10mm;border-left-width:0;width:26mm;padding-top:6mm;padding-bottom:0;">
								<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEnergyPropCrGrp/HomeLocatedInUSA"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form5695Data/QlfyFuelCellPropertyInUSInd"/>
											<xsl:with-param name="BackupName">IRS5695QlfyFuelCellPropertyInUSInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:3px;"/>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form5695Data/QlfyFuelCellPropertyInUSInd"/>
										<xsl:with-param name="BackupName">IRS5695QlfyFuelCellPropertyInUSInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText">Yes</span>
								</label>
								<span style="width:5mm;"/>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form5695Data/QlfyFuelCellPropertyInUSInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form5695Data/QlfyFuelCellPropertyInUSInd"/>
											<xsl:with-param name="BackupName">IRS5695QlfyFuelCellPropertyInUSInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:3px;"/>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form5695Data/QlfyFuelCellPropertyInUSInd"/>
										<xsl:with-param name="BackupName">IRS5695QlfyFuelCellPropertyInUSInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText">No</span>
								</label>
							</div>
						</div>
						
						<!-- Caution -->
						<div class="styIRS5695LineItem" >
						<div class="styGenericDiv" style="padding-left:1.2mm;width:7.5mm;font-weight:bold;font-size:8pt;padding-top:3mm"></div>
							<div class="styIRS5695CleanDiv" style="width:144mm;height:auto;padding-top:3mm;">
								<div class="styIRS5695LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5695LNDesc" style="padding-left:2.5mm;width:auto;height:100%;">
										<b>Caution.</b> If you checked the "No" box, you cannot take a credit for qualified fuel cell property. Skip lines 7b through 11.
										</div>
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:12mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;border-bottom-width:0px;background-color:lightgrey"/>
							<div class="styLNAmountBox" style="height:12mm;border-left-width:0;width:26mm;padding-top:7.5mm;border-bottom-width:0px">

							</div>
						</div>
						
						<!-- (7b) /////////////////////////////////////////////////// -->
						<div class="styIRS5695LineItem">
						<div class="styGenericDiv" style="padding-left:2.3mm;width:7.5mm;font-weight:bold;font-size:8pt;padding-top:3mm">b</div>
							<div class="styIRS5695CleanDiv" style="width:144mm;height:auto;padding-top:3mm;">
								<div class="styIRS5695LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5695LNDesc" style="padding-left:2.5mm;width:auto;height:100%;">
										Print the complete address of the main home where you installed the fuel cell property.

										</div>
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:12mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;border-bottom-width:0;background-color:lightgrey"/>
							<div class="styLNAmountBox" style="height:12mm;border-left-width:0;width:26mm;border-bottom-width:0;padding-top:7.5mm;padding-bottom:0">

							</div>
						</div>
						<!-- Address////////////////////////////////////////////////////-->
						<div class="styIRS5695LineItem" style="height:22mm;">
							<div class="styGenericDiv" style="padding-left:1.2mm;font-weight:bold;font-size:8pt;width:7.5mm;padding-top:3mm;"/>
							<div class="styGenericDiv" style="width:144mm;padding-left:2.5mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form5695Data/QlfyFuelCellPropertyHmAddress/AddressLine1"/>
								</xsl:call-template>
								<xsl:if test="$Form5695Data/QlfyFuelCellPropertyHmAddress/AddressLine2 !=''">
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form5695Data/QlfyFuelCellPropertyHmAddress/AddressLine2"/>
									</xsl:call-template>
								</xsl:if>
								<div class="styGenericDiv" style="width:110mm;border-top:1px solid black;margin-top:.5mm;height:8.5mm;">
									Number and street<span style="width:80mm"/>Unit No. <br/>
									<xsl:call-template name="PopulateCityStateInfo">
									<xsl:with-param name="TargetNode" select="$Form5695Data/QlfyFuelCellPropertyHmAddress"/>
								</xsl:call-template>
								</div>
								<div class="styGenericDiv" style="width:110mm;border-top:1px solid black;margin-top:1mm">
									City, State, ZIP code
								</div>
							</div>	
							<div class="styGenericDiv" style="background-color:lightgrey;border-left:1px solid black;border-right:1px solid black;height:26mm;width:8.3mm"/>
							<div class="styGenericDiv" style="width:27mm;height:24mm"/>
						</div>						

						<!-- (8) ////////////////////////////////////////////////////-->
						<div class="styIRS5695LineItem" style="">
						<div class="styGenericDiv" style="padding-left:1.2mm;width:7.5mm;font-weight:bold;font-size:8pt;height:6mm">8</div>
							<div class="styIRS5695CleanDiv" style="width:109.8mm;height:auto;">
								<div class="styIRS5695LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5695LNDesc" style="padding-left:2.5mm;width:auto;height:100%;">
										Qualified fuel cell property costs
										<!--Dotted Line-->
											<span class="styBoldText">.
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
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;">8</div>
							<div class="styLNAmountBox" style="height:6mm;border-left-width:0;width:26mm;padding-bottom:0;padding-top:2mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/FuelCellPropCostAmt"/>
									<xsl:with-param name="BackupName">IRS5695FuelCellPropCostAmt</xsl:with-param>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;background-color:lightgrey"/>

						</div>
						<!-- (9) ////////////////////////////////////////////////////-->
						<div class="styIRS5695LineItem" style="">
						<div class="styGenericDiv" style="padding-left:1.2mm;width:7.5mm;font-weight:bold;font-size:8pt;height:6mm">9</div>
							<div class="styIRS5695CleanDiv" style="width:109.8mm;height:auto;">
								<div class="styIRS5695LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5695LNDesc" style="padding-left:2.5mm;width:auto;height:100%;">
										Multiply line 8 by 30% (.30)
										<!--Dotted Line-->
											<span class="styBoldText">.
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
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;">9</div>
							<div class="styLNAmountBox" style="height:6mm;border-left-width:0;width:26mm;padding-bottom:0;padding-top:2mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/FuelCellPropStdPctCrAmt"/>
									<xsl:with-param name="BackupName">IRS5695FuelCellPropStdPctCrAmt</xsl:with-param>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;background-color:lightgrey"/>

						</div>
						
						<!-- (10) ////////////////////////////////////////////////////-->
						
						<div class="styIRS5695LineItem" style="">
						<div class="styGenericDiv" style="padding-left:1.2mm;width:7.5mm;font-weight:bold;font-size:8pt;height:6mm">10</div>
							<div class="styIRS5695CleanDiv" style="width:109.8mm;height:auto;">
								<div class="styIRS5695LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5695LNDesc" style="padding-left:2.5mm;width:auto;height:100%;">
										Kilowatt capacity of property on line 8 above<span style="width:3px;"/>
										<img src="{$ImagePath}/5695_Bullet_Sm.gif" alt="SmallBullet"/>
										<span style="height:4mm;font-size:6pt;width:28mm;border-width:0px 0px 1px 0px;border-style:solid;border-color:black;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form5695Data/FuelCellPropKWCapNum"/>
											</xsl:call-template>
										</span>
										x $1,000
										</div>
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;">10</div>
							<div class="styLNAmountBox" style="height:6mm;border-left-width:0;width:26mm;padding-bottom:0;padding-top:2mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/FuelCellPropKWCapAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;background-color:lightgrey"/>

						</div>
						
						<!-- (11) ////////////////////////////////////////////////////-->
						<div class="styIRS5695LineItem">
						<div class="styGenericDiv" style="padding-left:1.2mm;width:7.5mm;font-weight:bold;font-size:8pt;height:6mm">11</div>
							<div class="styIRS5695CleanDiv" style="width:144mm;height:auto;">
								<div class="styIRS5695LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5695LNDesc" style="padding-left:2.5mm;width:auto;height:100%;">
										Enter the smaller of line 9 or line 10
										<!--Dotted Line-->
											<span class="styBoldText">.
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
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;padding-top:2mm">11</div>
							<div class="styLNAmountBox" style="height:6mm;border-left-width:0;width:26mm;padding-bottom:0;padding-top:2mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/FuelCellPropAllwblCostAmt"/>
									<xsl:with-param name="BackupName">IRS5695FuelCellPropAllwblCostAmt</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						<!-- (12) ////////////////////////////////////////////////////-->
						<div class="styIRS5695LineItem" style="">
						<div class="styGenericDiv" style="padding-left:1.2mm;width:7.5mm;font-weight:bold;font-size:8pt;height:6mm">12</div>
							<div class="styIRS5695CleanDiv" style="width:144mm;height:auto;">
								<div class="styIRS5695LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5695LNDesc" style="padding-left:2.5mm;width:auto;height:100%;">
										Credit carryforward from 2011. Enter the amount, if any, from your 2011 Form 5695, line 32
										<!--Dotted Line-->
											<span class="styBoldText">.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												
												
											</span>
										</div>
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;padding-top:2mm">12</div>
							<div class="styLNAmountBox" style="height:6mm;border-left-width:0;width:26mm;padding-bottom:0;padding-top:2mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/PYCarryfwdEnergyEffPropertyAmt"/>
									<xsl:with-param name="BackupName">IRS5695PYCarryfwdEnergyEffPropertyAmt</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						<!-- (13) ////////////////////////////////////////////////////-->
						<div class="styIRS5695LineItem" style="">
						<div class="styGenericDiv" style="padding-left:1.2mm;width:7.5mm;font-weight:bold;font-size:8pt;height:6mm">13</div>
							<div class="styIRS5695CleanDiv" style="width:144mm;height:auto;">
								<div class="styIRS5695LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5695LNDesc" style="padding-left:2.5mm;width:auto;height:100%;">
										Add lines 6, 11, and 12
										<!--Dotted Line-->
											<span class="styBoldText">.
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
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;padding-top:2mm">13</div>
							<div class="styLNAmountBox" style="height:6mm;border-left-width:0;width:26mm;padding-bottom:0;padding-top:2mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/TotalOfEnergyCreditsAmt"/>
									<xsl:with-param name="BackupName">IRS5695TotalOfEnergyCreditsAmt</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						
						<!-- (14) ////////////////////////////////////////////////////-->
						<div class="styIRS5695LineItem" style="">
						<div class="styGenericDiv" style="padding-left:1.2mm;width:7.5mm;font-weight:bold;font-size:8pt;height:6mm">14</div>
							<div class="styIRS5695CleanDiv" style="width:109.8mm;height:auto;">
								<div class="styIRS5695LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5695LNDesc" style="padding-left:2.5mm;width:auto;height:100%;">
										Enter the amount from Form 1040, line 46, or Form 1040NR, line 44
										<!--Dotted Line-->
											<span class="styBoldText">.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
											</span>
										</div>
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;">14</div>
							<div class="styLNAmountBox" style="height:6mm;border-left-width:0;width:26mm;padding-bottom:0;padding-top:2mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/TotalTxBeforeCrAndOtherTxsAmt"/>
									<xsl:with-param name="BackupName">IRS5695TotalTxBeforeCrAndOtherTxsAmt</xsl:with-param>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;background-color:lightgrey"/>

						</div>
						
						<!-- (15) ////////////////////////////////////////////////////-->
						<div class="styIRS5695LineItem" style="">
						<div class="styGenericDiv" style="padding-left:1.2mm;width:7.5mm;font-weight:bold;font-size:8pt;height:6mm">15</div>
							<div class="styIRS5695CleanDiv" style="width:109.8mm;height:auto;">
								<div class="styIRS5695LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
										<div class="styIRS5695LNDesc" style="width:94%;height:13mm;">
										<b>1040 filers:</b> Enter the total, if any, of your credits from Form 1040,<br/>
										lines 47 through 50; line 12 of the Line 11
										worksheet in Pub. 972<br/> (see instructions); Form 8396, line 9; Form 8839, line 12;<br/>
										Form 8859, line 9; Form 8834, line 23; Form 8910, line 22;<br/>
										Form 8936, line 15; and Schedule R, line 22.
									</div>
									<div class="styIRS5695CleanDiv" style="width:6%;height:26mm;float:right;">
										<img src="{$ImagePath}/5695_Bracket_Lg.gif" alt="Large Bracket"/>
									</div>
									<div class="styIRS5695LNDesc" style="width:94%;height:13mm;padding-top:2mm;">
										<b>1040NR filers:</b> Enter the amount, if any, from Form 1040NR, lines<br/>
										45 through 47; line 12 of the Line 11
										worksheet in Pub. 972 <br/>(see instructions); Form 8396, line 9; Form 8839, line 12;<br/>
										Form 8859, line 9; Form 8834, line 23; Form 8910, line 22; and<br/>
										Form 8936, line 15.
									</div>
								</div>
							</div>
							<div class="styLNRightNumBox" style="margin-top:16.5mm;height:6mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;">15</div>
							<div class="styLNAmountBox" style="height:6mm;border-left-width:0;margin-top:16.5mm;width:26mm;padding-bottom:0;padding-top:2mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/OtherCreditsAmt"/>
									<xsl:with-param name="BackupName">IRS5695OtherCreditsAmt</xsl:with-param>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:42.5mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;background-color:lightgrey"/>

						</div>
						<!-- (16) ////////////////////////////////////////////////////-->
							<div class="styIRS5695LineItem" style="">
						<div class="styGenericDiv" style="padding-left:1.2mm;width:7.5mm;font-weight:bold;font-size:8pt;height:6mm">16</div>
							<div class="styIRS5695CleanDiv" style="width:144mm;height:auto;">
								<div class="styIRS5695LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5695LNDesc" style="padding-left:2.5mm;width:auto;height:100%;">
										Subtract line 15 from line 14. If zero or less, enter -0- here and on line 17
										<!--Dotted Line-->
											<span class="styBoldText">.
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
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;padding-top:2mm">16</div>
							<div class="styLNAmountBox" style="height:6mm;border-left-width:0;width:26mm;padding-bottom:0;padding-top:2mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/TaxLessCreditsAmt"/>
									<xsl:with-param name="BackupName">IRS5695TaxLessCreditsAmt</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						<!-- (17) ////////////////////////////////////////////////////-->
						<div class="styIRS5695LineItem" style="">
						<div class="styGenericDiv" style="padding-left:1.2mm;width:7.5mm;font-weight:bold;font-size:8pt;height:6mm">17</div>
							<div class="styIRS5695CleanDiv" style="width:144mm;height:auto;">
								<div class="styIRS5695LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5695LNDesc" style="padding-left:2.5mm;width:auto;height:100%;">
										<b>Residential energy credit.</b> Enter the smaller of line 13 or line 16. Also include<br/> this amount on Form 1040, line 52, or Form 1040NR, line 49
										<!--Dotted Line-->
											<span class="styBoldText">.
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
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:9mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;padding-top:5mm">17</div>
							<div class="styLNAmountBox" style="height:9mm;border-left-width:0;width:26mm;padding-bottom:0;padding-top:5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/ResidentialEnergyCreditAmt"/>
									<xsl:with-param name="BackupName">IRS5695ResidentialEnergyCreditAmt</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						
						<!-- (18) ////////////////////////////////////////////////////-->
						<div class="styIRS5695LineItem" style="border-bottom:1px solid black">
						<div class="styGenericDiv" style="padding-left:1.2mm;width:7.5mm;font-weight:bold;font-size:8pt;height:6mm">18</div>
							<div class="styIRS5695CleanDiv" style="width:109.8mm;height:auto;">
								<div class="styIRS5695LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5695LNDesc" style="width:auto;height:100%;">
										Credit carryforward to 2013. If line 17 is less than line 13, subtract line<br/>
										17 from line 13
										<!--Dotted Line-->
											<span class="styBoldText">.
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
								</div>
							</div>
							<div class="styLNRightNumBox" style="border-bottom-width:0px;height:9mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;padding-top:5mm">18</div>
							<div class="styLNAmountBox" style="border-bottom-width:0px;height:9mm;border-left-width:0;width:26mm;padding-bottom:0;padding-top:5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/CarryfwdEnergyEffPropertyCrAmt"/>
									<xsl:with-param name="BackupName">$Form5695DataCarryfwdEnergyEffPropertyCrAmt</xsl:with-param>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="border-bottom-width:0px;height:9mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;background-color:lightgrey"/>

						</div>
						
					
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<b>For Paperwork Reduction Act Notice, see your tax return instructions.</b>
						<span style="width:118px;"/>
						Cat. No. 13540P
						<span style="width:120px;"/>
						Form<span class="styBoldText" style="font-size:7pt;"> 5695 </span>(2012)
					</div>
					<!-- END Page Break and Footer-->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData" style="padding-top:5mm;">
						<div class="styLeftOverTitle">
							Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<xsl:variable name="TableWidth">120</xsl:variable>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form5695Data"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						
						<xsl:if test="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/MaximumResidentialEnergyCrAmt/@marriedTPMoreThanOneHomeCd">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Part I - Line 9 - Married Tax Period More Than One Home Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/MaximumResidentialEnergyCrAmt/@marriedTPMoreThanOneHomeCd"/>
								<xsl:with-param name="DescWidth" select="$TableWidth"/>
							</xsl:call-template>
						</xsl:if>
						
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
