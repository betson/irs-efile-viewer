<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS944Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!-- Defines the stage of the data, e.g. original or latest -->
	<xsl:param name="FormData" select="$RtnDoc/IRS944"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)"/>
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
				<meta name="Description" content="IRS Form 944"/>
				<xsl:call-template name="GlobalStylesForm"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS944Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
			</head>
			<body class="styBodyClass" style="width:187mm">
				<form name="IRS944" style="font-family:arial;">
					<xsl:call-template name="DocumentHeader"/>
					<!--  Begin Header-->
                    <div class="styBB" style="width:187mm;border-bottom-width:0px;">
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData"/>
						</xsl:call-template>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$RtnDoc/FinalPayrollInfoStatement"/>
						</xsl:call-template>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$RtnDoc/TransferOfBusinessStatement"/>
						</xsl:call-template>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$RtnDoc/GeneralDependencySmall"/>
						</xsl:call-template>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$RtnDoc/BinaryAttachment"/>
						</xsl:call-template>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$RtnDoc/IRS945A"/>
						</xsl:call-template>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$RtnDoc/IRS941ScheduleD"/>
						</xsl:call-template>
						<br/>
						<div class="styFNBox" style="width:43mm;height:10mm;border:0px;">Form
							<span class="styFormNumber" style="font-size:15pt;">944 for 2015: </span>
						</div>
						<div class="styFTBox" style="width:100mm;text-align:left;height:10mm;">
							<div class="styMainTitle" style="font-size:12pt;padding-top:1mm;">
								Employer’s ANNUAL Federal Tax Return
							</div>
							<div class="styFST" style="height:4mm;">
								<span class="styAgency" style="font-weight:normal">Department of the Treasury — Internal Revenue Service</span>
							</div>
						</div>
						<div class="styTYBox" style="width:43.7mm;height:10mm;border:0px;">
							<div class="styOMB" style="height:10mm;font-size:7pt;text-align:right;border:0px;padding-top:6mm;padding-right:2mm;">OMB No. 1545-2007</div>
						</div>					
						<div class="styBB" style=" width:131mm;height:62mm;float:left;border:black solid 1px;padding-top:2mm;padding-left:1mm;padding-right:2mm;">
							<div style="width:128mm;padding-top:0mm;">
								<span style="float:left;padding-top:3mm;"><b>Employer identification number (EIN)</b></span>
								<span class="styLNCtrNumBox" style="width:80mm;border-top-width:1px;padding-top:1mm;float:right;height:6.3mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">EIN</xsl:with-param>
										<xsl:with-param name="EINChanged">true</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
							<!-- 5/13/2015 AM: Adjusted Filer name height from 7mm to 12mm per Defect 43014 --> 
							<div style="width:128mm;padding-bottom:2mm;padding-top:2mm;">
								<span style="float:left;padding-top:4mm;"><b>Name</b><i> (not your trade name)</i></span>
								<span class="styLNCtrNumBox" style="width:95mm;border-top-width:1px;float:right;height:12mm;text-align:left;padding-left:1mm;">
									<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
										</xsl:call-template><br/>
									<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine2Txt"/>
										</xsl:call-template>
								</span>
							</div>
							<div style="width:128mm;padding-bottom:2mm;">
								<span style="float:left;padding-top:4mm;"><b>Trade name</b><i> (if any)</i></span>
								<span class="styLNCtrNumBox" style="width:104mm;border-top-width:1px;float:right;height:7mm;text-align:left;padding-left:1mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/TradeName/BusinessNameLine1Txt"/>
									</xsl:call-template><br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/TradeName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</span>
							</div>
							<div style="width:128mm;padding-bottom:0mm;">
								<span style="width:20mm;height:15mm;float:left;padding-top:2mm;font-weight:bold;">Address</span>
								<span class="styLNCtrNumBox" style="width:108mm;height:6mm;float:right;border-top-width:1px;padding-top:1mm;padding-left:1mm;text-align:left;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
									</xsl:call-template>&nbsp;
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
									</xsl:call-template>
								</span>
								<span style="width:108mm;font-size:6pt;padding-left:3mm;">
									Number<span style="width:16mm"/>Street<span style="width:50mm;"/>Suite or room number
								</span>
								<span class="styLNCtrNumBox" style="width:66mm;border-top-width:1px;padding-top:1mm;height:6mm;text-align:left;padding-left:1mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
									</xsl:call-template>
								</span>
								<span class="styLNCtrNumBox" style="width:2.5mm;float:left;border:none"/>
								<span class="styLNCtrNumBox" style="width:13mm;border-top-width:1px;padding-top:1mm;height:6mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">StateAbbreviationCd</xsl:with-param>
									</xsl:call-template>
								</span>
								<span class="styLNCtrNumBox" style="width:2.5mm;float:left;border:none"/>
								<span class="styLNCtrNumBox" style="width:24mm;border-top-width:1px;padding-top:1mm;height:6mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">ZIPCd</xsl:with-param>
									</xsl:call-template>
								</span>
								<span style="width:128mm;font-size:6pt;padding-left:21mm;">
									<span style="width:66mm;">City</span>
									<span style="width:13mm;text-align:center;">State</span>
									<span style="width:24mm;text-align:center;">ZIP code</span>
								</span>
								<!-- 9/23/2015 AM: Per Defect 44870, adjusted foreign address fields heights from 6mm to 7mm. -->
								<span style="width:128mm;padding-left:20mm;">
								<span class="styLNCtrNumBox" style="width:52mm;height:7mm;border-top-width:1px;padding-top:1mm;text-align:left;padding-left:1mm;word-wrap:break-word;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
									</xsl:call-template>
								</span>
								<span class="styLNCtrNumBox" style="width:2.5mm;float:left;border:none"/>
								<span class="styLNCtrNumBox" style="width:29mm;border-top-width:1px;padding-top:1mm;height:7mm;word-wrap:break-word;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
									</xsl:call-template>
								</span>
								<span class="styLNCtrNumBox" style="width:2.5mm;float:left;border:none"/>
								<span class="styLNCtrNumBox" style="width:22mm;border-top-width:1px;padding-top:1mm;height:7mm;word-wrap:break-word;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
									</xsl:call-template>
								</span>
								</span>
								<span style="width:128mm;font-size:6pt;padding-left:20mm;">
									<span style="width:53mm;padding-left:1mm;">Foreign country name</span>
									<span style="width:29.5mm;text-align:center;">Foreign province/county</span>
									<span style="width:24mm;text-align:center;">Foreign postal code</span>
								</span>
							</div>
						</div>
						<div style="float:right;padding-right:2mm;">
							<div class="styBB" style="width:51mm;height:30mm;border-left-width:1px;border-right-width:1px;border-top-width:1px;padding-left:1mm;padding-top:2mm;">
								<div class="styPartName" style="width:48.5mm;text-align:left;padding-left:1mm;font-size:9pt;">Who Must File Form 944</div>
								<div style="width:48.5mm;float:none;clear:both;padding-left:1mm;font-size:8pt;line-height:120%;">
									You must file annual Form 944<br/>instead of filing quarterly Forms 941<br/><b>only if the IRS 
									notified you in<br/>writing.</b><br/>Instructions and prior-year forms are<br/>available at
									<a style="text-decoration:none;color:black;" href="http://www.irs.gov/form944" title="Link to IRS.gov"><i>www.irs.gov/form944</i>.</a>
								</div>
							</div>
						</div>
					</div>
					<div class="styLNDesc" style="width:187mm;font-size:9pt;">
						<b>Read the separate instructions before you complete Form 944. Type or print within the boxes.</b>
					</div>
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:13mm;text-align:center;height:8mm;padding-top:2mm;font-size:9pt;">Part 1:</div>
						<div class="styPartDesc" style="width:173.9mm;text-align:left;height:8mm;padding-left:2mm;font-size:9pt;">Answer these questions for this year. 
							Employers in American Samoa, Guam, the Commonwealth of the Northern Mariana Islands, the U.S. Virgin Islands, and Puerto Rico can skip lines 1 and 2.</div>
					</div>
					<div style="width:187mm;padding-left:0mm;padding-top:2mm;padding-bottom:0px;">
						<!--Line 1-->
						<div style="width:187mm;height:8mm;font-size:8pt;">
							<span style="float:left;padding-top:2mm;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;">1</div>
								<div class="styLNDesc" style="width:130mm;padding-left:1mm;font-weight:bold;">
									<span style="float:left;">Wages, tips, and other compensation </span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">..................</span>								
								</div>
							</span>
							<span style="float:right">
								<div class="styIRS944RightNumBox">1</div>
								<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/WagesAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 2-->
						<div style="width:187mm;height:8mm;font-size:8pt;">
							<span style="float:left;padding-top:2mm;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;">2</div>
								<div class="styLNDesc" style="width:130mm;padding-left:1mm;font-weight:bold;">
									<span style="float:left;">Federal income tax withheld from wages, tips, and other compensation </span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>								
								</div>
							</span>
							<span style="float:right;">
								<div class="styIRS944RightNumBox">2</div>
								<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FederalIncomeTaxWithheldAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 3-->
						<div style="width:187mm;height:8mm;font-size:8pt;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;">3</div>
							<div class="styLNDesc" style="width:130mm;padding-left:1mm;font-weight:bold;">
								If no wages, tips, and other compensation are subject to social security or Medicare tax
							</div>
							<div class="styIRS944RightNumBox" style="padding-top:0.5mm;">3</div>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/WagesNotSubjToSSMedcrTaxInd"/>
									<xsl:with-param name="BackupName">944WagesNotSubjToSSMedcrTaxInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/WagesNotSubjToSSMedcrTaxInd"/>
									<xsl:with-param name="BackupName">944WagesNotSubjToSSMedcrTaxInd</xsl:with-param>
								</xsl:call-template>
								<b><span style="width:1mm;"/>Check and go to line 5.</b><br/>
							</label>
						</div>
						<!--Line 4 Header-->
						<div style="width:187mm;font-size:8pt;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;">4</div>
							<div class="styLNDesc" style="width:136mm;padding-left:1mm;font-weight:bold;">
								Taxable social security and Medicare wages and tips:
							</div>
							<div class="styLNDesc" style="width:187mm;font-style:italic;">
								<span style="width:67.5mm;"/><span style="width:35mm;text-align:center;">Column 1</span>
								<span style="width:14mm;"/><span style="width:35mm;text-align:center;">Column 2</span>
							</div>
						</div>
						<!--Line 4a-->
						<div style="width:187mm;height:8mm;font-size:8pt;">
							<div class="styLNLeftNumBoxSD" style="width:9mm;"/>
							<div style="width:5.5mm;float:left;font-weight:bold;padding-top:2mm;">4a</div>
							<div class="styLNDesc" style="width:53mm;font-weight:bold;padding-top:2mm;">Taxable social security wages </div>
							<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SocialSecurityWageAndTaxGrp/SocialSecurityTaxCashWagesAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="width:14mm;text-align:center;padding-top:2mm;">x .124 = </div>
							<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SocialSecurityWageAndTaxGrp/SocialSecurityTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 4b-->
						<div style="width:187mm;height:8mm;font-size:8pt;">
							<div class="styLNLeftNumBoxSD" style="width:9mm;"/>
							<div style="width:5.5mm;float:left;font-weight:bold;padding-top:2mm;">4b</div>
							<div class="styLNDesc" style="width:53mm;font-weight:bold;padding-top:2mm;">Taxable social security tips </div>
							<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SocialSecurityTipsAndTaxGrp/TaxableSocSecTipsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="width:14mm;text-align:center;padding-top:2mm;">x .124 = </div>
							<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SocialSecurityTipsAndTaxGrp/TaxOnSocialSecurityTipsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 4c-->
						<div style="width:187mm;height:8mm;font-size:8pt;">
							<div class="styLNLeftNumBoxSD" style="width:9mm;"/>
							<div style="width:5.5mm;float:left;font-weight:bold;padding-top:2mm;">4c</div>
							<div class="styLNDesc" style="width:53mm;font-weight:bold;padding-top:2mm;">Taxable Medicare wages &amp; tips </div>
							<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/MedicareWageTipsAndTaxGrp/TaxableMedicareWagesTipsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="width:14mm;text-align:center;padding-top:2mm;">x .029 = </div>
							<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/MedicareWageTipsAndTaxGrp/TaxOnMedicareWagesTipsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 4d-->
						<div style="width:187mm;font-size:8pt;padding-bottom:2mm;">
							<div class="styLNLeftNumBoxSD" style="width:9mm;"/>
							<div style="width:5.5mm;float:left;font-weight:bold;">4d</div>
							<div class="styLNDesc" style="width:53mm;font-weight:bold;float:left;padding-top:0mm;">Taxable wages &amp; tips subject to<br/>
								Additional Medicare Tax<br/><span style="float:left;"> withholding </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:2mm;">........</span>							
							</div>
							<div style="float:left;padding-top:4mm;">
								<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AddnlMedicareWageTipsAndTaxGrp/TxblWageTipsSubjAddnlMedcrAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="width:14mm;text-align:center;padding-top:2mm;">x .009 = </div>
								<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AddnlMedicareWageTipsAndTaxGrp/TaxOnWageTipsSubjAddnlMedcrAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Line 4e-->
						<div style="width:187mm;height:8mm;font-size:8pt;">
							<span style="float:left;padding-top:2mm;">
								<div class="styLNLeftNumBoxSD" style="width:9mm;"/>
								<div style="width:5.5mm;float:left;font-weight:bold;">4e</div>
								<div class="styLNDesc" style="width:123mm;font-weight:bold;padding-top:0mm;">
									<span style="float:left;">Add Column 2 from lines 4a, 4b, 4c and 4d </span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>								
								</div>
							</span>
							<span style="float:right;">
								<div class="styIRS944RightNumBox">4e</div>
								<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalSSMdcrTaxAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 5-->
						<div style="width:187mm;height:8mm;font-size:8pt;">
							<span style="float:left;padding-top:2mm;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;">5</div>
								<div class="styLNDesc" style="width:130mm;padding-left:1mm;">
									<span style="float:left;"><b>Total taxes before adjustments</b>. Add lines 2 and 4e </span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>								
								</div>
							</span>
							<span style="float:right;">
								<div class="styIRS944RightNumBox">5</div>
								<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalTaxBeforeAdjustmentAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 6-->
						<div style="width:187mm;height:8mm;font-size:8pt;">
							<span style="float:left;padding-top:2mm;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;">6</div>
								<div class="styLNDesc" style="width:130mm;padding-left:1mm;">
									<span style="float:left;"><b>Current year’s adjustments</b> (see instructions) </span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">................</span>								
								</div>
							</span>
							<span style="float:right;">
								<div class="styIRS944RightNumBox">6</div>
								<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<!-- 12/23/2014 AM: Per KISAM IM01960276, choose statement added to properly display negative numbers and cents only -->
									<xsl:choose>
										<xsl:when test="starts-with($FormData/CurrentYearAdjustmentAmt,'-') or starts-with($FormData/CurrentYearAdjustmentAmt,'.')">
											<span style="color:darkblue;">
												<xsl:call-template name="PlaceCommas">
													<xsl:with-param name="TargetNode" select="$FormData/CurrentYearAdjustmentAmt"/>
												</xsl:call-template>
											</span>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/CurrentYearAdjustmentAmt"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</div>
							</span>
						</div>
						<!--Line 7-->
						<div style="width:187mm;height:8mm;font-size:8pt;">
							<span style="float:left;padding-top:2mm;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;">7</div>
								<div class="styLNDesc" style="width:130mm;padding-left:1mm;">
									<span style="float:left;"><b>Total taxes after adjustments.</b> Combine lines 5 and 6 </span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>								
								</div>
							</span>
							<span style="float:right;">
								<div class="styIRS944RightNumBox">7</div>
								<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalTaxAfterAdjustmentAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 8-->
						<div style="width:187mm;height:10mm;font-size:8pt;">
							<span style="float:left;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;">8</div>
								<div class="styLNDesc" style="width:130mm;padding-left:1mm;font-weight:bold;">
									Total deposits for this year, including overpayment applied from a prior year and
									<span style="float:left;">overpayments applied from Form 944-X, 944-X (PR), 944-X (SP), 941-X, or 941-X (PR) </span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>								
								</div>
							</span>
							<span style="float:right;padding-top:2mm;">
								<div class="styIRS944RightNumBox">8</div>
								<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalTaxDepositAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!-- 7/14/14 AM: Lines 9a,9b, and 10 shaded and reserved based on UWR 111271-->
						<!--Line 9a-->
						<div style="width:187mm;height:8mm;font-size:8pt;background-color:darkgray">
							<span style="float:left;padding-top:2mm;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;">9a</div>
								<div class="styLNDesc" style="width:130mm;padding-left:1mm;">
									<span style="float:left;"><b>Reserved</b></span>
								</div>
							</span>
						</div>
						<!--Line 9b-->
						<div style="width:187mm;height:8mm;font-size:8pt;background-color:darkgray">
							<span style="float:left;padding-top:2mm;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;">9b</div>
								<div class="styLNDesc" style="width:130mm;padding-left:1mm;">
									<span style="float:left;"><b>Reserved</b></span>
								</div>
							</span>
						</div>
						<!--Line 10-->
						<div style="width:187mm;height:8mm;font-size:8pt;background-color:darkgray">
							<span style="float:left;padding-top:2mm;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;">10</div>
								<div class="styLNDesc" style="width:130mm;padding-left:1mm;">
									<span style="float:left;"><b>Reserved</b></span>
								</div>
							</span>
						</div>
						<!--Line 11-->
						<div style="width:187mm;height:8mm;font-size:8pt;">
							<span style="float:left;padding-top:2mm;">
								<div class="styLNLeftNumBox" style="width:8mm;">11</div>
								<div class="styLNDesc" style="width:130mm;padding-left:1mm;">
									<span style="float:left;"><b>Balance due.</b> If line 7 is more than line 8, enter the difference and see instructions </span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>								
								</div>
							</span>
							<span style="float:right;">
								<div class="styIRS944RightNumBox">11</div>
								<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/BalanceDueAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 12-->
						<div style="width:187mm;height:8mm;">
							<div class="styLNLeftNumBox" style="width:8mm;font-size:8pt;padding-top:2.5mm;">12</div>
							<div class="styLNDesc" style="width:73mm;padding-left:1mm;padding-top:2.8mm;">
								<b>Overpayment.</b> If line 8 is more than line 7, enter the difference
							</div>
							<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/OverpaidAmt"/>
								</xsl:call-template>
							</div>
							<div style="padding-top:2.6mm;float:left;">
								<div class="styLNDesc" style="width:15mm;text-align:center;">Check one: </div>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/ApplyOverpaymentNextReturnInd"/>
										<xsl:with-param name="BackupName">944ApplyOverpaymentNextReturnInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/ApplyOverpaymentNextReturnInd"/>
										<xsl:with-param name="BackupName">944ApplyOverpaymentNextReturnInd</xsl:with-param>
									</xsl:call-template>
									<span style="font-size:6pt;padding-left:1mm;padding-right:1mm;">Apply to next return.</span>
								</label>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/RefundOverpaymentInd"/>
										<xsl:with-param name="BackupName">944RefundOverpaymentInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/RefundOverpaymentInd"/>
										<xsl:with-param name="BackupName">944RefundOverpaymentInd</xsl:with-param>
									</xsl:call-template>
									<span style="font-size:6pt;padding-left:1mm;">Send a refund.</span>
								</label>
							</div>
						</div>
						<div style="width:187mm;font-size:8pt;">
							<span style="float:left;">
								<div class="styLNLeftNumBox" style="width:8mm;"/>
								<div class="styLNDesc" style="width:130mm;padding-left:1mm;font-weight:bold;">
									<img src="{$ImagePath}/944_Bullet.gif" alt="Bullet Image"/>
									You MUST complete both pages of Form 944 and SIGN it.
								</div>
							</span>
							<span style="float:right;">
								<div style="width:30mm;text-align:right;padding-bottom:0mm;">
									<img src="{$ImagePath}/944_Next.gif" alt="Next Page Arrow Image"/>
								</div>
							</span>
						</div>					
					</div>
					<!-- Page boundary -->
					<div class="pageEnd" style="width:187mm;border-top-width:1px;padding-top:0mm;">
						<span style="float:left;clear:none;font-weight:bold;font-size:8pt;">For Privacy Act and Paperwork Reduction Act Notice, see the back of the 
						Payment Voucher.</span>
						<span style="float:left;clear:none;margin-left:10mm;padding-top:0.5mm;">Cat. No. 39316N</span>
						<span style="float:right;clear:none;">Form <span class="styBoldText" style="font-size:9pt;">944</span> (2015)</span>
					</div>
					<p style="page-break-before: always"/>
					<!--Begin Page 2-->
					<div style="width:187mm;">
						<!--Name Shown on return-->
						<div class="styBB" style="width:187mm;font-size:7pt;border-top-width:2px;">
							<div class="styFNBox" style="width:126mm; height:8.5mm;">
								<b>Name</b><i> (not your trade name)</i><br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
								</xsl:call-template><br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
								</xsl:call-template>
								<div style="line-height:100%; font-family:verdana;font-size:7pt"/>
							</div>
							<b>Employer identification number (EIN)</b><br/>
							<div style="text-align:left;padding-top:2.5mm;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--Part 2-->
					<div class="styBB" style="width:187mm;">			
						<div class="styPartName" style="width:13mm;text-align:center;height:6mm;padding-top:1mm;font-size:9pt;">Part 2:</div>
						<div class="styPartDesc" style="width:173.9mm;text-align:left;height:6mm;padding-top:1mm;padding-left:2mm;font-size:9pt;">
						Tell us about your deposit schedule and tax liability for this year.</div>
					</div>
					<!--Line 13-->
					<div style="width:187mm;padding-bottom:1mm;padding-top:1mm;font-size:8pt;">
						<div class="styLNLeftNumBox" style="width:8mm;">13</div>
						<div class="styLNDesc" style="width:20mm;height:13mm;padding-left:1mm;"><b>Check one:</b></div>
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/AnnualDepositorInd"/>
								<xsl:with-param name="BackupName">944AnnualDepositorInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<label style="padding-left:3mm;width:155mm;vertical-align:top;">
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/AnnualDepositorInd"/>
								<xsl:with-param name="BackupName">944AnnualDepositorInd</xsl:with-param>
							</xsl:call-template>
							<span style="width:150mm;padding-top:1mm"><b>Line 7 is less than $2,500. Go to Part 3.</b></span>
						</label>
						<br/><br/>
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/MonthlyDepositorInd"/>
								<xsl:with-param name="BackupName">944MonthlyDepositorInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<label style="padding-left:3mm;width:155mm;vertical-align:top;">
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/MonthlyDepositorInd"/>
								<xsl:with-param name="BackupName">944MonthlyDepositorInd</xsl:with-param>
							</xsl:call-template>
							<span style="width:150mm;font-size:7pt;padding-top:1mm"><b>Line 7 is $2,500 or more. Enter your tax liability for each month. If 
								you are a semiweekly depositor or you accumulate $100,000 or more of liability on any day during a deposit 
								period, you must complete Form 945-A instead of the boxes below.</b></span>
						</label>
					</div>
					<!--13a-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="width:8mm;float:left;"/>
						<div style="float:right;">
							<div style="width:40mm;float:left;">
								<div class="styLNDesc" style="width:40mm;padding-left:8mm;text-align:center;padding-top:1mm;padding-bottom:0mm;">Jan.</div>
								<div class="styIRS944RightNumBox" style="float:left;width:9mm;padding-top:2.8mm;">13a</div>
								<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;float:left;padding-top:1.5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd='JANUARY']/TaxLiabilityAmt"/>
									</xsl:call-template>
								</div>
								<!--13b-->			
								<div class="styLNDesc" style="width:40mm;padding-left:8mm;text-align:center;padding-top:1mm;padding-bottom:0mm;">Feb.</div>
								<div class="styIRS944RightNumBox" style="float:left;width:9mm;padding-top:2.8mm;">13b</div>
								<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;float:left;padding-top:1.5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd='FEBRUARY']/TaxLiabilityAmt"/>
									</xsl:call-template>
								</div>
								<!--13c-->			
								<div class="styLNDesc" style="width:40mm;padding-left:8mm;text-align:center;padding-top:1mm;padding-bottom:0mm;">Mar.</div>
								<div class="styIRS944RightNumBox" style="float:left;width:9mm;padding-top:2.8mm;">13c</div>
								<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;float:left;padding-top:1.5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd='MARCH']/TaxLiabilityAmt"/>
									</xsl:call-template>
								</div>	
							</div>
							<!--13d-->
							<div style="width:40mm;float:left;">
								<div class="styLNDesc" style="width:40mm;padding-left:8mm;text-align:center;padding-top:1mm;padding-bottom:0mm;">Apr.</div>
								<div class="styIRS944RightNumBox" style="float:left;width:9mm;padding-top:2.8mm;">13d</div>
								<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;float:left;padding-top:1.5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd='APRIL']/TaxLiabilityAmt"/>
									</xsl:call-template>
								</div>
								<!--13e-->
								<div class="styLNDesc" style="width:40mm;padding-left:8mm;text-align:center;padding-top:1mm;padding-bottom:0mm;">May</div>
								<div class="styIRS944RightNumBox" style="float:left;width:9mm;padding-top:2.8mm;">13e</div>
								<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;float:left;padding-top:1.5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd='MAY']/TaxLiabilityAmt"/>
									</xsl:call-template>
								</div>
								<!--13f-->
								<div class="styLNDesc" style="width:40mm;padding-left:8mm;text-align:center;padding-top:1mm;padding-bottom:0mm;">Jun.</div>
								<div class="styIRS944RightNumBox" style="float:left;width:9mm;padding-top:2.8mm;">13f</div>
								<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;float:left;padding-top:1.5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd='JUNE']/TaxLiabilityAmt"/>
									</xsl:call-template>
								</div>	
							</div>
							<!--13g-->
							<div style="width:40mm;float:left;">
								<div class="styLNDesc" style="width:40mm;padding-left:8mm;text-align:center;padding-top:1mm;padding-bottom:0mm;">Jul.</div>
								<div class="styIRS944RightNumBox" style="float:left;width:9mm;padding-top:2.8mm;">13g</div>
								<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;float:left;padding-top:1.5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd='JULY']/TaxLiabilityAmt"/>
									</xsl:call-template>
								</div>
								<!--13h-->
								<div class="styLNDesc" style="width:40mm;padding-left:8mm;text-align:center;padding-top:1mm;padding-bottom:0mm;">Aug.</div>
								<div class="styIRS944RightNumBox" style="float:left;width:9mm;padding-top:2.8mm;">13h</div>
								<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;float:left;padding-top:1.5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd='AUGUST']/TaxLiabilityAmt"/>
									</xsl:call-template>
								</div>
								<!--13i-->
								<div class="styLNDesc" style="width:40mm;padding-left:8mm;text-align:center;padding-top:1mm;padding-bottom:0mm;">Sep.</div>
								<div class="styIRS944RightNumBox" style="float:left;width:9mm;padding-top:2.8mm;">13i</div>
								<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;float:left;padding-top:1.5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd='SEPTEMBER']/TaxLiabilityAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!--13j-->
							<div style="width:40mm;float:left;">
								<div class="styLNDesc" style="width:40mm;padding-left:10mm;text-align:center;padding-top:1mm;padding-bottom:0mm;">Oct.</div>
								<div class="styIRS944RightNumBox" style="float:left;width:9mm;padding-top:2.8mm;">13j</div>
								<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;float:right;padding-top:1.5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd='OCTOBER']/TaxLiabilityAmt"/>
									</xsl:call-template>
								</div>
								<!--13k-->
								<div class="styLNDesc" style="width:40mm;padding-left:10mm;text-align:center;padding-top:1mm;padding-bottom:0mm;">Nov.</div>
								<div class="styIRS944RightNumBox" style="float:left;width:9mm;padding-top:2.8mm;">13k</div>
								<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;float:right;padding-top:1.5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd='NOVEMBER']/TaxLiabilityAmt"/>
									</xsl:call-template>
								</div>
								<!--13l-->
								<div class="styLNDesc" style="width:40mm;padding-left:10mm;text-align:center;padding-top:1mm;padding-bottom:0mm;">Dec.</div>
								<div class="styIRS944RightNumBox" style="float:left;width:9mm;padding-top:2.8mm;">13l</div>
								<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;float:right;padding-top:1.5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd='DECEMBER']/TaxLiabilityAmt"/>
									</xsl:call-template>
								</div>	
							</div>
						</div>
					</div>
					<!--Total Liability for year-->
					<div style="width:187mm;font-size:8pt;padding-top:2mm;padding-bottom:2mm;">
						<span style="float:left;">
							<div class="styLNLeftNumBox" style="width:28mm;"/>
							<div class="styLNDesc" style="width:105mm;padding-left:1mm;font-weight:bold;padding-top:2.4mm;">
								Total liability for year. Add lines 13a through 13l. Total must equal line 7.
							</div>
						</span>
						<span style="float:right;">
							<div class="styIRS944RightNumBox" style="width:10mm;padding-right:2mm;padding-top:2.4mm;">13m</div>
							<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalTaxLiabilityAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
					<!--Part 3-->
					<div class="styBB" style="width:187mm;border-top-width:1px;">	
						<div class="styPartName" style="width:13mm;text-align:center;height:6mm;padding-top:1mm;font-size:9pt;">Part 3:</div>
						<div class="styPartDesc" style="width:173.9mm;text-align:left;height:6mm;padding-top:1mm;padding-left:2mm;font-size:9pt;">
							Tell us about your business. If question 14 does NOT apply to your business, leave it blank.</div>
					</div>
					<!--Line 14-->
					<div style="width:187mm;padding-bottom:2mm;font-size:8pt;">
						<div class="styLNLeftNumBox" style="width:8mm;">14</div>
						<div class="styLNDesc" style="width:179mm;padding-left:1mm;font-weight:bold;">
							If your business has closed or you stopped paying wages...
						</div>
					</div>
					<div style="width:187mm;padding-left:9mm;font-size:8pt;padding-bottom:2mm;">
						<div style="width:76mm;float:left;padding-top:2mm;">
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/BusinessClosedGrp/FutureFilingNotRequiredInd"/>
									<xsl:with-param name="BackupName">944FutureFilingNotRequiredInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label style="width:70mm;">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/BusinessClosedGrp/FutureFilingNotRequiredInd"/>
									<xsl:with-param name="BackupName">944FutureFilingNotRequiredInd</xsl:with-param>
								</xsl:call-template>
								<span style="width:1mm;"/>Check here, and enter the final date you paid wages.
							</label>
						</div>
						<div class="styLNCtrNumBox" style="width:31mm;border-top-width:1px;height:6mm;padding-top:1mm;">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/BusinessClosedGrp/FinalWagesPaidDt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Part 4-->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:13mm;text-align:center;height:6mm;padding-top:1mm;font-size:9pt;">Part 4:</div>
						<div class="styPartDesc" style="width:173.9mm;text-align:left;height:6mm;padding-top:1mm;padding-left:2mm;font-size:9pt;">
							May we speak with your third-party designee?</div>
					</div>
					<div class="styLNDesc" style="width:187mm;height:auto;padding-left:9mm;padding-right:6mm;font-size:8pt;">
						<b>Do you want to allow an employee, a paid tax preparer, or another person to discuss this return with the IRS?</b> 
						See the instructions for details.
					</div>
					<div style="width:187mm;float:none;clear:both;padding-bottom:2mm;font-size:8pt;">
						<div style="width:21mm;padding-top:.7mm;padding-left:8mm;float:left;">
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/DiscussWithThirdPartyYesInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/DiscussWithThirdPartyYesInd"/>
										<xsl:with-param name="BackupName">944DiscussWithThirdPartyYesInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						<label>
							<xsl:call-template name="PopulateLabelYes">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/DiscussWithThirdPartyYesInd"/>
								<xsl:with-param name="BackupName">944DiscussWithThirdPartyYesInd</xsl:with-param>
							</xsl:call-template>Yes.
						</label>
						<br/><br/><br/><br/><br/>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyNoInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyNoInd"/>
									<xsl:with-param name="BackupName">944DiscussWithThirdPartyNoInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
						<label>
							<xsl:call-template name="PopulateLabelNo">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyNoInd"/>
								<xsl:with-param name="BackupName">944DiscussWithThirdPartyNoInd</xsl:with-param>
							</xsl:call-template>No.
						</label>
					</div>
						<div style="width:166mm;float:right;font-size:8pt;">
							<div style="width:166mm;height:6mm;">
								<div class="styLNDesc" style="width:50mm;height:6mm;float:left;padding-top:2mm;">Designee’s name and phone number </div>
								<div class="styLNCtrNumBox" style="width:54mm;height:6mm;border-top-width:1px;float:left;padding-top:1mm;text-align:left;padding-left:1mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneeNm"/>
									</xsl:call-template>
								</div>
								<span class="styLNCtrNumBox" style="width:10mm;border:none"/>
								<div class="styLNCtrNumBox" style="width:52mm;border-top-width:1px;height:6mm;padding-top:1mm;word-wrap:break-word;">
									<xsl:if test="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneePhoneNum">
										<xsl:call-template name="PopulatePhoneNumber">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneePhoneNum"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneeFrgnPhoneNum">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneeFrgnPhoneNum"/>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
							<div style="width:166mm;padding-top:5mm;">
								<div class="styLNDesc" style="width:105mm;padding-top:2mm;">
									Select a 5-digit Personal Identification Number (PIN) to use when talking to IRS.
								</div>
								<div style="float:left;">
									<div class="styLNCtrNumBox" style="width:36mm;border-top-width:1px;height:5mm;float:left;">
										<xsl:call-template name="PopulatePin">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneePIN"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--Part 5-->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:13mm;text-align:center;height:6mm;padding-top:1mm;font-size:9pt;">Part 5:</div>
						<div class="styPartDesc" style="width:173.9mm;text-align:left;height:6mm;padding-top:1mm;padding-left:2mm;font-size:9pt;">Sign Here.
							You MUST complete both pages of Form 944 and SIGN it.</div>
					</div>
					<div class="styLNDesc" style="width:187mm;height:10mm;padding-left:2mm;padding-right:2mm;font-size:7pt;padding-top:2mm;">
						Under penalties of perjury, I declare that I have examined this return, including accompanying schedules and 
						statements, and to the best of my knowledge and belief, it is true, correct, and complete. Declaration of preparer (other 
						than taxpayer) is based on all information of which preparer has any knowledge.
					</div>
					<div style="width:187mm;float:none;clear:both;">
						<div style="width:13mm;float:left;padding-bottom:0px;">
							<img src="{$ImagePath}/944_Signature.GIF" alt="Signature Image"/>
						</div>
						<div style="width:20mm;padding-top:3mm;font-weight:bold;font-size:10pt;float:left;">Sign your name here </div>
						<div class="styLNCtrNumBox" style="width:75mm;height:14mm;border-top-width:1px;float:left;word-wrap:break-word;padding-top:1mm;text-align:left;padding-left:1mm;padding-right:1mm;">
							<xsl:if test="$RtnHdrData/ReportingAgentPINGrp/PIN">
								<xsl:call-template name="PopulatePin">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/ReportingAgentPINGrp/PIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/PractitionerPINGrp/TaxpayerPIN">
								<xsl:call-template name="PopulatePin">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/TaxpayerPIN"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div style="width:78mm;float:left;font-size:8pt;padding-left:10mm;padding-top:0mm;padding-right:3mm;">
							<div style="width:15mm;height:8mm;float:left;padding-top:0mm;">Print your name here</div>
							<div style="height:9mm;float:right;">
								<div class="styLNCtrNumBox" style="width:50mm;border-top-width:1px;height:8mm;float:right;text-align:left;padding-left:1mm;">
									<xsl:if test="$RtnHdrData/SignatureDocumentGrp/PersonNm">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/PersonNm"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PractitionerPINGrp/TaxpayerNm">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/TaxpayerNm"/>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
							<div style="width:15mm;float:left;padding-top:0mm;">Print your title here</div>
							<div style="float:right;">
								<div class="styLNCtrNumBox" style="width:50mm;border-top-width:1px;height:8mm;padding-top:1mm;float:right;text-align:left;padding-left:1mm;">
									<xsl:if test="$RtnHdrData/SignatureDocumentGrp/PartnershipAuthorizationCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/PartnershipAuthorizationCd"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/SignatureDocumentGrp/CorporationAuthorizationCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/CorporationAuthorizationCd"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/SignatureDocumentGrp/ExemptOrgAuthorizationCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/ExemptOrgAuthorizationCd"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/SignatureDocumentGrp/EstateAuthorizationCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/EstateAuthorizationCd"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/SignatureDocumentGrp/IndividualAuthorizationCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/IndividualAuthorizationCd"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PractitionerPINGrp/Title">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/Title"/>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;padding-bottom:2mm;padding-top:1mm;padding-right:3mm;float:none;clear:both;">
						<div class="styLNDesc" style="width:33mm;text-align:right;padding-right:2mm;font-size:8pt;padding-top:2mm;">Date </div>
						<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:6mm;padding-top:1mm;">
							<xsl:if test="$RtnHdrData/SignatureDocumentGrp/SignatureDt">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/SignatureDt"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/PractitionerPINGrp/TaxpayerSignatureDt">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/TaxpayerSignatureDt"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNCtrNumBox" style="width:38mm;border-top-width:1px;height:6mm;padding-top:1mm;float:right;word-wrap:break-word;">
							<xsl:if test="$RtnHdrData/SignatureDocumentGrp/DaytimePhoneNum">
								<xsl:call-template name="PopulatePhoneNumber">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/DaytimePhoneNum"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/SignatureDocumentGrp/DaytimeForeignPhoneNum">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/DaytimeForeignPhoneNum"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNDesc" style="width:28.6mm;font-size:8pt;padding-top:2mm;float:right;">Best daytime phone </div>
					</div>
					<!--Paid Preparer Section-->
					<div style="width:187mm;padding-bottom:4mm;">
						<div class="styLNDesc" style="width:46mm;font-size:9pt;font-weight:bold;float:left;padding-left:2mm;">Paid Preparer Use Only </div>
						<div class="styLNDesc" style="width:52mm;float:right;font-size:9pt;">Check if you are self-employed
							<span style="width:2px;"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
									<xsl:with-param name="BackupName">944SelfEmployedInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
									<xsl:with-param name="BackupName">944SelfEmployedInd</xsl:with-param>
								</xsl:call-template>
							</label>
						</div>
					</div>
					<!--Preparer Name and PTIN-->
					<div style="width:187mm;padding-bottom:2mm;padding-right:3mm;font-size:8pt;">
						<div class="styLNDesc" style="width:32mm;height:6mm;padding-left:2mm;padding-right:1mm;padding-top:1mm;">Preparer's name </div>
						<div class="styLNCtrNumBox" style="width:90mm;border-top-width:1px;height:6mm;padding-top:1mm;text-align:left;padding-left:1mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerPersonNm"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:20mm;height:6mm;padding-top:1mm;padding-left:8mm;">PTIN </div>
						<div class="styLNCtrNumBox" style="width:41mm;border-top-width:1px;height:6mm;padding-top:1mm;float:right;">
							<xsl:choose>
								<xsl:when test="$RtnHdrData/PaidPreparerInformationGrp/PTIN">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PTIN"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerSSN"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<!--Preparer Signature and Date-->
					<div style="width:187mm;padding-bottom:2mm;font-size:8pt;">
						<div class="styLNDesc" style="width:32mm;height:6mm;padding-top:1mm;padding-left:2mm;padding-right:1mm;">Preparer's signature </div>
						<div class="styLNCtrNumBox" style="width:90mm;border-top-width:1px;height:6mm;word-wrap:break-word;padding-top:1mm;text-align:left;padding-right:1mm;padding-left:1mm;">
						</div>
						<div class="styLNDesc" style="width:21.1mm;height:6mm;padding-top:1mm;padding-left:8mm;">Date </div>
						<div class="styLNCtrNumBox" style="width:25mm;border-top-width:1px;height:6mm;padding-top:1mm;">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SignatureDt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- 5/13/2015 AM: Adjusted Firm name height from 8mm to 14mm per Defect 43014 --> 
					<!--Preparer Business Name and EIN-->
					<div style="width:187mm;font-size:8pt;padding-bottom:2mm;padding-right:3mm;">
						<div class="styLNDesc" style="width:32mm;padding-left:2mm;padding-right:1mm;padding-top:0mm;">Firm's name (or yours if self-employed) </div>
						<div class="styLNCtrNumBox" style="width:90mm;height:14mm;border-top-width:1px;text-align:left;padding-left:1mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmName/BusinessNameLine1Txt"/>
							</xsl:call-template><br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:20mm;height:6mm;padding-top:1mm;padding-left:8mm;">EIN </div>
						<div class="styLNCtrNumBox" style="width:41mm;height:6mm;border-top-width:1px;padding-top:1mm;float:right;">
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmEIN">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmEIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/MissingEINReasonCd">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/MissingEINReasonCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
					</div>
					<!--Preparer Address and Phone Number-->
					<div style="width:187mm;padding-bottom:2mm;padding-right:3mm;font-size:8pt;">
						<div class="styLNDesc" style="width:32mm;height:6mm;padding-top:4mm;padding-left:2mm;padding-right:1mm;">Address </div>
						<div class="styLNCtrNumBox" style="width:90mm;height:8mm;border-top-width:1px;text-align:left;padding-left:1mm;">
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/AddressLine1Txt"/>
								</xsl:call-template><br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/AddressLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/AddressLine1Txt"/>
								</xsl:call-template><br/>
							</xsl:if>
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/AddressLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNDesc" style="width:20mm;height:6mm;padding-top:1mm;padding-left:8mm;">Phone </div>
						<div class="styLNCtrNumBox" style="width:41mm;height:8mm;border-top-width:1px;padding-top:1mm;float:right;word-wrap:break-word;">
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PhoneNum">
								<xsl:call-template name="PopulatePhoneNumber">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PhoneNum"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/ForeignPhoneNum">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/ForeignPhoneNum"/>
								</xsl:call-template>
							</xsl:if>
						</div>
					</div>
					<!--Preparer Foreign Address/Phone Number vs. US Address/Phone Number-->
					<div class="styBB" style="width:187mm;padding-bottom:4mm;border-bottom-width:2px;font-size:8pt;padding-right:3mm;">
						<xsl:choose>
							<xsl:when test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
								<div class="styLNDesc" style="width:32mm;height:6mm;padding-top:1mm;padding-left:2mm;padding-right:1mm;">City </div>
								<div class="styLNCtrNumBox" style="width:40mm;border-top-width:1px;height:8mm;padding-top:1mm;text-align:left;padding-left:1mm;word-wrap:break-word;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/CityNm"/>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="width:12mm;height:6mm;padding-top:1mm;text-align:center;">Prov./St. </div>
								<div class="styLNCtrNumBox" style="width:16mm;border-top-width:1px;height:8mm;padding-top:1mm;word-wrap:break-word;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/ProvinceOrStateNm"/>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="width:12mm;height:6mm;padding-top:1mm;text-align:center;">Country </div>
								<div class="styLNCtrNumBox" style="width:10mm;border-top-width:1px;height:8mm;padding-top:2mm;word-wrap:break-word;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/CountryCd"/>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="width:20mm;height:6mm;padding-top:1mm;padding-left:8mm;">P. Code </div>
								<div class="styLNCtrNumBox" style="width:41mm;border-top-width:1px;height:8mm;padding-top:1mm;float:right;word-wrap:break-word;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/ForeignPostalCd"/>
									</xsl:call-template>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<div class="styLNDesc" style="width:32mm;height:6mm;padding-top:1mm;padding-left:2mm;padding-right:1mm;">City </div>
								<div class="styLNCtrNumBox" style="width:65mm;border-top-width:1px;height:8mm;padding-top:1mm;text-align:left;padding-left:1mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/CityNm"/>
									</xsl:call-template>						
								</div>
								<div class="styLNDesc" style="width:15mm;height:6mm;padding-top:1mm;padding-left:5mm;">State </div>
								<div class="styLNCtrNumBox" style="width:10mm;border-top-width:1px;height:8mm;padding-top:1mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/StateAbbreviationCd"/>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="width:20mm;height:6mm;padding-top:1mm;padding-left:8mm;">ZIP code </div>
								<div class="styLNCtrNumBox" style="width:41mm;border-top-width:1px;height:8mm;padding-top:1mm;float:right;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/ZIPCd"/>
									</xsl:call-template>				
								</div>
							</xsl:otherwise>
						</xsl:choose>
					</div>		
					<!--Page Footer-->
					<div class="pageEnd" style="width:187mm;">
						<span style="float:left;clear:none;">Page <span class="styBoldText" style="font-size:9pt;">2</span></span>
						<span style="float:right;clear:none;">Form <span class="styBoldText" style="font-size:9pt;">944</span> (2015)</span>
					</div>
					<!--END Page Footer-->
					<!-- BEGIN Left Over Table -->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">Additional Data </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>		
</xsl:stylesheet>
