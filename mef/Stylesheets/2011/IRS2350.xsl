<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS2350Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!-- Defines the stage of the data, e.g. original or latest -->
	<xsl:param name="FormData" select="$RtnDoc/IRS2350"/>
	<xsl:template match="/">
		<html>
			<head>
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
				<meta name="Description" content="IRS Form 2350"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS2350Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form2350">
					<!--xsl:value-of select='$PageWatermark'/-->
					<!-- BEGIN WARNING LINE -->
					<xsl:call-template name="DocumentHeader"/>
					<!-- END WARNING LINE -->
					<!-- Begin Form Number and Name -->
					<div class="styBB" style="width:187mm;border-bottom-width:2px;">
						<div class="styFNBox" style="width:28mm;height:20mm;">
            Form<span class="styFormNumber"> 2350</span><br/>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData"/>
						</xsl:call-template>
							<div class="styAgency" style="padding-top:1mm;">Department of the Treasury<br/>Internal Revenue Service</div>
						</div>
						<div class="styFTBox" style="width:128mm;height:20mm;">
							<div class="styMainTitle" style="height:8mm;padding-top:2mm;">Application for Extension of Time<br/>
To File U.S. Income Tax Return</div>
							<div class="styFST" style="height:5mm;font-size:6.5pt;">
							For U.S. Citizens and Resident Aliens Abroad Who Expect To Qualify for Special Tax Treatment<br/>
								<img src="{$ImagePath}/1310_Bullet.gif" width="9" height="9" alt="bullet image"/>See instructions on page 3.
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;height:20mm;">
							<div class="styOMB" style="height:1mm;">OMB No. 1545-0074</div>
							<div class="styTY">20<span class="styTYColor">11</span></div>
						</div>
					</div>
					<!-- End Form Number and Name section -->
					<div class="styBB" style="width:187mm;">
						<div style="position:relative;top:0;left:0;height:58mm;width:15mm;float:left;font-weight:bold;font-size:7pt;padding:0mm 0mm;">
							<div style="position:absolute;padding-top:1mm;">Please<br/>print<br/>or<br/>type.</div>
							<div style="position:absolute;bottom:1mm;">File by<br/>the due<br/>date for<br/>filing<br/>your<br/>return.</div>
						</div>
						<div style="width:171mm;float:left;border-left:1px solid black;border-bottom:1px solid black;padding-left:2mm;">
							<div class="styNameBox" style="width:62mm;height:12mm;font-size:7pt;">
								<div>Your first name and initial</div>
								<span>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimaryName"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styNameBox" style="width:59mm;height:12mm;font-size:7pt;padding-left:2mm;">
								<div>Last name</div>
								<!-- No element definition exists in schema for this input field -->
							</div>
							<div class="styEINBox" style="width:47mm;height:12mm;padding-left:2mm;font-size:7pt;">
								<div style="font-weight:bold;">Your social security number</div>
								<span style="width:35mm;text-align:center;font-weight:normal;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
										<xsl:with-param name="EINChanged">true</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<div style="width:171mm;float:left;border-left:1px solid black;border-bottom:1px solid black;padding-left:2mm;">
							<div class="styNameBox" style="width:62mm;height:12mm;font-size:7pt;">
								<div>If a joint return, spouse's first name and initial</div>
								<span>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SpouseName"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styNameBox" style="width:59mm;height:12mm;font-size:7pt;padding-left:2mm;">
								<div>Last name</div>
								<!-- No element definition exists in schema for this input field -->
							</div>
							<div class="styEINBox" style="width:47mm;height:12mm;padding-left:2mm;font-size:7pt;">
								<div style="font-weight:bold;">Spouse's social security number</div>
								<span style="width:35mm;text-align:center;font-weight:normal;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">SpouseSSN</xsl:with-param>
										<xsl:with-param name="EINChanged">true</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<div style="width:171mm;float:left;border-left:1px solid black;">
							<div class="styNameBox" style="width:123mm;height:12mm;font-size:7pt;border-bottom:1px solid black;padding-left:2mm;">
								<div>Home address (number and street). If you have a P.O. Box, see instructions.</div>
								<span>
									<xsl:choose>
										<xsl:when test="$RtnHdrData/Filer/ForeignAddress">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1"/>
											</xsl:call-template><br/>
											<xsl:if test="$RtnHdrData/Filer/ForeignAddress/AddressLine2">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine2"/>
											</xsl:call-template>
											</xsl:if>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1"/>
											</xsl:call-template><br/>
											<xsl:if test="$RtnHdrData/Filer/USAddress/AddressLine2">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine2"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:otherwise>
									</xsl:choose>
								</span>
							</div>
							<div class="styNameBox" style="width:47.5mm;height:12mm;border-right:none;background-color:lightgrey;"/>
						</div>
						<div style="width:171mm;float:left;border-left:1px solid black;">
							<div class="styNameBox" style="width:123mm;height:12mm;font-size:7pt;padding-left:2mm;border-bottom:1px solid black">
								<div>City,town, or post office, state, and ZIP code. If you have a foreign address, enter only
								the city name on this line; then complete the spaces below (see instructions).</div>
								<span>
								<xsl:choose>
								<xsl:when test="$RtnHdrData/Filer/ForeignAddress">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/City"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateCityStateInfo">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress"/>
									</xsl:call-template>
								</xsl:otherwise>
								</xsl:choose>	
								</span>
							</div>
							<div class="styNameBox" style="width:47.5mm;height:12mm;border-right:none;background-color:lightgrey;"/>
						</div>
						<div style="width:171mm;float:left;border-left:1px solid black;">
							<div class="styNameBox" style="width:123mm;height:12mm;font-size:7pt;padding-left:2mm;">
								<div class="styNameBox" style="width:50mm;font-size:7pt;height:12mm;padding-left:1mm">
								<span>
									Foreign country name<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">Country</xsl:with-param>
										<xsl:with-param name="MainForm">true</xsl:with-param>
									</xsl:call-template>
								</span>
								</div>
								<div class="styNameBox" style="width:40mm;height:12mm;font-size:7pt;padding-left:1mm">
									Foreign province/county<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">ProvinceOrState</xsl:with-param>
									</xsl:call-template>
								</div>        
								 <div class="styNameBox" style="width:30mm;height:12mm;font-size:7pt;border-right-width:0;padding-left:1mm">
									
									<span style="font-family:arial;">Foreign postal code</span><br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">PostalCode</xsl:with-param>
									</xsl:call-template>
									
								 </div>
							</div>
							<div class="styNameBox" style="width:47.5mm;height:12mm;border-right:none;background-color:lightgrey;"/>
						</div>
						</div>
						<div class="styBB" style="width:187mm;padding:1mm 0mm;text-align:center;">
							<div class="styPartDesc">Please fill in the Return Label at the bottom of this page.</div>
						</div>
						<div style="width:187mm;margin-top:3mm;">
							<div style="float:left;width:5mm;font-weight:bold;text-align:right;">1</div>
							<div style="float:left;width:4mm;font-weight:bold;"/>
							<div style="float:right;width:177mm;">
								I request an extension of time until <span style="width:25mm;text-align:center;border-bottom:1px dashed black;"><xsl:if test="$FormData/RequestedFilingExtensionDt">
								<xsl:call-template name="PopulateMonth">
									<xsl:with-param name="TargetNode" select="$FormData/RequestedFilingExtensionDt"/>
								</xsl:call-template>-<xsl:call-template name="PopulateDay">
									<xsl:with-param name="TargetNode" select="$FormData/RequestedFilingExtensionDt"/>
								</xsl:call-template>-<xsl:call-template name="PopulateYear">
									<xsl:with-param name="TargetNode" select="$FormData/RequestedFilingExtensionDt"/>
								</xsl:call-template>
								</xsl:if></span>
								to file my income tax return for the calendar year 2010, or other tax year ending <span style="width:25mm;text-align:center;border-bottom:1px dashed black;"><xsl:if test="$FormData/RequestedOtherTaxYrExtensionDt">
								<xsl:call-template name="PopulateMonth">
									<xsl:with-param name="TargetNode" select="$FormData/RequestedOtherTaxYrExtensionDt"/>
								</xsl:call-template>-<xsl:call-template name="PopulateDay">
									<xsl:with-param name="TargetNode" select="$FormData/RequestedOtherTaxYrExtensionDt"/>
								</xsl:call-template>-<xsl:call-template name="PopulateYear">
									<xsl:with-param name="TargetNode" select="$FormData/RequestedOtherTaxYrExtensionDt"/>
								</xsl:call-template>
								</xsl:if></span>
								, because my tax home is in a foreign country and <b>I expect to qualify for special tax treatment by meeting the "bona fide residence test" or the "physical presence test"</b> (see instructions).
							</div>
						</div>
						<div style="width:187mm;margin-top:1mm;">
							<div style="float:left;width:5mm;font-weight:bold;text-align:right;">2</div>
							<div style="float:left;width:4mm;font-weight:bold;"/>
							<div style="float:right;width:177mm;">
								Were you previously granted an extension of time to file for this tax year?<span style="letter-spacing:3mm;">................</span>
								<input type="checkbox" style="height:3.5mm;">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/FilingExtensionPrevGrantedInd"/>
										<xsl:with-param name="BackupName">IRS2350FilingExtensionPrevGrantedInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/FilingExtensionPrevGrantedInd"/>
										<xsl:with-param name="BackupName">IRS2350FilingExtensionPrevGrantedInd</xsl:with-param>
									</xsl:call-template>
									<b>Yes</b>
								</label>
								<input type="checkbox" style="height:3.5mm;">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/FilingExtensionPrevGrantedInd"/>
										<xsl:with-param name="BackupName">IRS2350FilingExtensionPrevGrantedInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/FilingExtensionPrevGrantedInd"/>
										<xsl:with-param name="BackupName">IRS2350FilingExtensionPrevGrantedInd</xsl:with-param>
									</xsl:call-template>
									<b>No</b>
								</label>
							</div>
						</div>
						<div style="width:187mm;margin-top:1mm;">
							<div style="float:left;width:5mm;font-weight:bold;text-align:right;">3</div>
							<div style="float:left;width:4mm;font-weight:bold;"/>
							<div style="float:right;width:177mm;">
								Will you need additional time to allocate moving expenses?<span style="letter-spacing:3mm;">.....................</span>
								<input type="checkbox" style="height:3.5mm;">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/AdnlTimeToAllocateMoveExpnsInd"/>
										<xsl:with-param name="BackupName">IRS2350AdnlTimeToAllocateMoveExpnsInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/AdnlTimeToAllocateMoveExpnsInd"/>
										<xsl:with-param name="BackupName">IRS2350AdnlTimeToAllocateMoveExpnsInd</xsl:with-param>
									</xsl:call-template>
									<b>Yes</b>
								</label>
								<input type="checkbox" style="height:3.5mm;">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/AdnlTimeToAllocateMoveExpnsInd"/>
										<xsl:with-param name="BackupName">IRS2350AdnlTimeToAllocateMoveExpnsInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/AdnlTimeToAllocateMoveExpnsInd"/>
										<xsl:with-param name="BackupName">IRS2350AdnlTimeToAllocateMoveExpnsInd</xsl:with-param>
									</xsl:call-template>
									<b>No</b>
								</label>
							</div>
						</div>
						<div style="width:187mm;margin-top:1mm;">
							<div style="float:left;width:5mm;font-weight:bold;text-align:right;">4</div>
							<div style="float:left;width:4mm;font-weight:bold;">a</div>
							<div style="float:right;width:177mm;">
								Date you first arrived in the foreign country <span style="width:25mm;text-align:center;border-bottom:1px dashed black;">
								<xsl:call-template name="PopulateMonth">
									<xsl:with-param name="TargetNode" select="$FormData/ForeignCountryFirstArrivalDt"/>
								</xsl:call-template>-<xsl:call-template name="PopulateDay">
									<xsl:with-param name="TargetNode" select="$FormData/ForeignCountryFirstArrivalDt"/>
								</xsl:call-template>-<xsl:call-template name="PopulateYear">
									<xsl:with-param name="TargetNode" select="$FormData/ForeignCountryFirstArrivalDt"/>
								</xsl:call-template>
								</span>
							</div>
						</div>
						<div style="width:187mm;margin-top:1mm;">
							<div style="float:left;width:5mm;font-weight:bold;text-align:right;"/>
							<div style="float:left;width:4mm;font-weight:bold;">b</div>
							<div style="float:right;width:177mm;">
								Date qualifying period begins  <span style="width:25mm;text-align:center;border-bottom:1px dashed black;">
								<xsl:call-template name="PopulateMonth">
									<xsl:with-param name="TargetNode" select="$FormData/QualifyingResidentPeriodBegDt"/>
								</xsl:call-template>-<xsl:call-template name="PopulateDay">
									<xsl:with-param name="TargetNode" select="$FormData/QualifyingResidentPeriodBegDt"/>
								</xsl:call-template>-<xsl:call-template name="PopulateYear">
									<xsl:with-param name="TargetNode" select="$FormData/QualifyingResidentPeriodBegDt"/>
								</xsl:call-template>
								</span>
								; ends <span style="width:25mm;text-align:center;border-bottom:1px dashed black;">
								<xsl:call-template name="PopulateMonth">
									<xsl:with-param name="TargetNode" select="$FormData/QualifyingResidentPeriodEndDt"/>
								</xsl:call-template>-<xsl:call-template name="PopulateDay">
									<xsl:with-param name="TargetNode" select="$FormData/QualifyingResidentPeriodEndDt"/>
								</xsl:call-template>-<xsl:call-template name="PopulateYear">
									<xsl:with-param name="TargetNode" select="$FormData/QualifyingResidentPeriodEndDt"/>
								</xsl:call-template>
								</span>
							</div>
						</div>
						<div style="width:187mm;margin-top:1mm;">
							<div style="float:left;width:5mm;font-weight:bold;text-align:right;"/>
							<div style="float:left;width:4mm;font-weight:bold;">c</div>
							<div style="float:right;width:177mm;">
								Your foreign home address 
								<span style="border-bottom:1px dotted black;width:137mm">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/ForeignAddress/AddressLine1"/>
								</xsl:call-template>
								<xsl:if test="$FormData/ForeignAddress/AddressLine2"><br/></xsl:if>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/ForeignAddress/AddressLine2"/>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateCityStateInfo">
									<xsl:with-param name="TargetNode"/>
									<xsl:with-param name="ForeignAddressTargetNode" select="$FormData/ForeignAddress"/>
								</xsl:call-template>
								<span style="width:7px;"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/ForeignAddress/Country"/>
								</xsl:call-template>
								</span>
							</div>
						</div>
						<div style="width:187mm;margin-top:1mm;">
							<div style="float:left;width:5mm;font-weight:bold;text-align:right;"/>
							<div style="float:left;width:4mm;font-weight:bold;">d</div>
							<div style="float:right;width:177mm;">
								Date you expect to return to the United States <span style="width:25mm;text-align:center;border-bottom:1px dashed black;">
								<xsl:call-template name="PopulateMonth">
									<xsl:with-param name="TargetNode" select="$FormData/ExpectedUSReturnDt"/>
								</xsl:call-template>-<xsl:call-template name="PopulateDay">
									<xsl:with-param name="TargetNode" select="$FormData/ExpectedUSReturnDt"/>
								</xsl:call-template>-<xsl:call-template name="PopulateYear">
									<xsl:with-param name="TargetNode" select="$FormData/ExpectedUSReturnDt"/>
								</xsl:call-template>
								</span>
							</div>
						</div>
						<div style="width:187mm;margin-top:1mm;">
							<div style="float:left;width:5mm;font-weight:bold;text-align:right;"/>
							<div style="float:left;width:4mm;font-weight:bold;"/>
							<div style="float:right;width:177mm;">
								<b>Note. </b> <i>This is not an extension of time to pay tax. Full payment is required to avoid interest and late payment charges.</i>
							</div>
						</div>
						<div style="width:187mm;margin-top:1mm;">
							<div style="float:left;width:5mm;font-weight:bold;text-align:right;">5</div>
							<div style="float:left;width:4mm;font-weight:bold;"/>
							<div class="styLNDesc" style="width:127mm;float:left">
								Enter the amount of income tax paid with this form
								<span style="letter-spacing:3mm;font-weight:bold;">...............</span>
								<img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet" style="margin:0mm 1mm;"/>
							</div>
							<div class="styLNRightNumBoxNBB" style="border-left:1px solid black;">
								5
							</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:none;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ExtsnRequestIncomeTaxPaidAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;border-top:1px solid black;padding:1mm 0mm;text-align:center;">
							<div class="styPartDesc">Signature and Verification</div>
						</div>
						<div style="width:187mm;font-size:7pt;height:16mm;">
							Under penalties of perjury, I declare that I have examined this form, including accompanying schedules and statements, and to the best of my knowledge and belief, it is
	true, correct, and complete; and, if prepared by someone other than the taxpayer, that I am authorized to prepare this form.
						</div>
						<div style="width:187mm;font-size:8pt;">
						<div style="float:left;">Signature of taxpayer <img src="{$ImagePath}/1310_Bullet.gif" width="9" height="9" alt="bullet image"/>
						
						<span style="width:95mm;margin-left:4px;border-bottom:1px solid black">
								<xsl:text> </xsl:text><xsl:call-template name="PopulatePin">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PrimarySignature" />
								</xsl:call-template>
								
							</span>
							</div>
							<div style="float:right;" >Date <img src="{$ImagePath}/1310_Bullet.gif" width="9" height="9" alt="bullet image"/>
							<span style="width:35mm;border-bottom:1px solid black;margin-left:4px;">
							<xsl:if test="$RtnHdrData/PrimarySignatureDate">
							<xsl:call-template name="PopulateMonth">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PrimarySignatureDate" />
							</xsl:call-template>-<xsl:call-template name="PopulateDay">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PrimarySignatureDate" />
							</xsl:call-template>-<xsl:call-template name="PopulateYear">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PrimarySignatureDate" />
							</xsl:call-template></xsl:if>
							</span>
							</div>
						</div>

						<div style="width:187mm;font-size:8pt;margin-top:5mm;margin-bottom:2mm;">
						<div style="float:left;">Signature of spouse <img src="{$ImagePath}/1310_Bullet.gif" width="9" height="9" alt="bullet image"/>
						
						<span style="width:95mm;border-bottom:1px solid black;margin-left:2mm;">
							<xsl:text> </xsl:text><xsl:call-template name="PopulatePin">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/SpouseSignature" />
							</xsl:call-template>
						</span>
						</div>
						<div style="float:right;" >Date <img src="{$ImagePath}/1310_Bullet.gif" width="9" height="9" alt="bullet image"/>
							<span style="width:35mm;margin-left:4px;border-bottom:1px solid black">
						<xsl:if test="$RtnHdrData/SpouseSignatureDate">
						<xsl:call-template name="PopulateMonth">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/SpouseSignatureDate" />
						</xsl:call-template>-<xsl:call-template name="PopulateDay">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/SpouseSignatureDate" />
						</xsl:call-template>-<xsl:call-template name="PopulateYear">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/SpouseSignatureDate" />
						</xsl:call-template></xsl:if>
						</span>
							</div>
						</div>
						<div style="width:187mm;font-size:8pt;border-bottom:1px solid black">
							<div style="float:left;">
							Signature of preparer<br/>other than taxpayer <img src="{$ImagePath}/1310_Bullet.gif" width="9" height="9" alt="bullet image"/>
								<span style="width:4px;"/><xsl:text> </xsl:text>
								<xsl:call-template name="PopulatePin">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/AgentSignature" />
								</xsl:call-template>
							</div>
							<div style="float:right;width:46.5mm;">
							<br/>
							Date <img src="{$ImagePath}/1310_Bullet.gif" width="9" height="9" alt="bullet image"/>
							<span style="width:35mm;margin-left:4px;">
							<xsl:if test="$RtnHdrData/AgentSignatureDate">
							<xsl:call-template name="PopulateMonth">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/AgentSignatureDate" />
							</xsl:call-template>-<xsl:call-template name="PopulateDay">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/AgentSignatureDate" />
							</xsl:call-template>-<xsl:call-template name="PopulateYear">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/AgentSignatureDate" />
							</xsl:call-template></xsl:if>
							</span>
							</div>
						</div>
						<div class="styBB" style="width:187mm;padding:1mm 0mm;">
	Please fill in the <b>Return Label</b> below. The IRS will complete the <b>Notice to Applicant</b> and return it to you. If you want it sent to another address or to an
	agent acting for you, enter the other address and add the agent's name.					
						</div>
						<div class="pageEnd" style="width:187mm;"/>
						<div class="styBB" style="width:187mm;border-bottom:1px dashed;text-align:center;">
							<div class="styPartDesc"></div>
						</div>
						<div class="styGenericDiv" style="width:187mm;text-align:right;">
							<b>(Do not detach)</b>
						</div>
				<!-- notice to applicant section -->
				<div class="styBB" style="width:187mm;">
					<div style="position:relative;top:0;left:0;height:36mm;width:14mm;float:left;font-weight:bold;font-size:7pt;padding:1mm 0mm;">
						<div style="position:absolute;top:1mm;text-align:center"><br/>Notice to<br/>Applicant.</div>
						<div style="position:absolute;bottom:1mm;text-align:center">To Be<br/>Completed<br/>by the IRS<br/><br/></div>
					</div>
					<div style="width:172mm;border-left:1px solid black;padding-left:2mm;padding-top:1mm;">
						<span style="width:1mm;"/>
						<input type="checkbox" class="styCkbox" title="approved application"></input>
						<span style="width:2mm;"/>
						We <b>have</b> approved your application.
					</div>
					<div style="width:172mm;border-left:1px solid black;padding-left:2mm;padding-top:1mm;">
						<span style="width:1mm;"/>
						<input type="checkbox" class="styCkbox" title="granted a 45-day grace period"></input>
						<span style="width:2mm;"/>
						We <b>have not</b> approved your application.<br/>
						<span style="width:7mm;"/>However, we have granted a 45-day grace period to _ __  _ __  _ __  _ __  _ __  _ __ _. This grace period is<br/>
						<span style="width:7mm;"/>considered a valid extension of time for elections otherwise required to be made on a timely return.
					</div>
					<div style="width:172mm;border-left:1px solid black;padding-left:2mm;padding-top:1mm;">
						<span style="width:1mm;"/>
						<input type="checkbox" class="styCkbox" title="Not granting a 45-day grace period"></input>
						<span style="width:2mm;"/>
						We <b>have not</b> approved your application.  After considering the above information, we cannot grant your<br/>
						<span style="width:7mm;"/>request for an extension of time to file. We are not granting a 45-day grace period.
					</div>
					<div style="width:172mm;border-left:1px solid black;padding-left:2mm;padding-top:1mm;">
						<span style="width:1mm;"/>
						<input type="checkbox" class="styCkbox" title="filed after the due date"></input>
						<span style="width:2mm;"/>
						We cannot consider your application because it was filed after the due date of your return.
					</div>
					<div style="width:172mm;border-left:1px solid black;padding-left:2mm;padding-top:1mm;">
						<span style="width:1mm;"/>
						<input type="checkbox" class="styCkbox" title="Other"></input>
						<span style="width:2mm;"/>
						Other  _ __  _ __  _ __  _ __  _ __  _ __ __ __  _ __  _ __  _ __  _ __  _ __ __ __  _ __  _ __  _ __  _ __  _ __ _
					</div>
					<div style="width:172mm;border-left:1px solid black;padding-left:2mm;padding-top:1mm;">
						_________________________________________________________________<span style="width:3mm;"/>_________________________________
					</div>
					<div style="width:172mm;border-left:1px solid black;padding-left:2mm;">
						<span style="width:52mm;"/>Director<span style="width:62mm;"/>Date
					</div>
				</div>
				<!-- return label section -->
				<div class="styBB" style="width:187mm;">
					<div class="styGenericDiv" style="height:36mm;width:8mm;font-weight:bold;padding:2mm 2px;">
						<img alt="return label" src="{$ImagePath}/2350_ReturnLabel.gif" width="30" height="105"/>
					</div>
					<div class="styGenericDiv" style="width:178mm;border-left:1px solid black;">
						<div class="styNameBox" style="width:118mm;height:12mm;font-size:7pt;border-bottom:1px solid black;padding-left:2mm;">
							<div style="font-family:Arial;"><b>Taxpayer's Name</b> (and agent's name, if applicable). If a joint return, also give spouse's name.</div>
							<span>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimaryName"/>
								</xsl:call-template>
							</span>
							<span style="width:17px"/>
							<span>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SpouseName"/>
								</xsl:call-template>
							</span>
							<span style="width:17px"/>
							<span>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/AgentName"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styNameBox" style="width:59.5mm;height:12mm;border-right:1px solid black;background-color:lightgrey;"/>
					</div>
					<div class="styGenericDiv" style="width:178mm;border-left:1px solid black;">
						<div class="styNameBox" style="width:118mm;height:12mm;font-size:7pt;border-bottom:1px solid black;padding-left:2mm;">
							<div>Number and street (include suite, room, or apt. no.) or P.O. box number</div>
							<xsl:choose>
								<xsl:when test="$RtnHdrData/Filer/USAddress">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1"/>
									</xsl:call-template>
									<xsl:if test="$RtnHdrData/Filer/USAddress/AddressLine2">
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine2"/>
										</xsl:call-template>
									</xsl:if>
								</xsl:when>
								<xsl:otherwise>
									<span>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1"/>
										</xsl:call-template>
										<xsl:if test="$RtnHdrData/Filer/ForeignAddress/AddressLine2">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine2"/>
											</xsl:call-template>
										</xsl:if>
									</span>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="styNameBox" style="width:59.5mm;height:12mm;border-right:1px solid black;border-bottom:1px solid black;background-color:lightgrey;"/>
					</div>
					<div class="styGenericDiv" style="width:178mm;border-left:1px solid black;">
						<div class="styNameBox" style="width:118mm;height:12mm;font-size:7pt;padding-left:2mm;">
							<div>City or town, province or state, and country (including postal or ZIP code)</div>
							<xsl:call-template name="PopulateCityStateInfo">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress"/>
								<xsl:with-param name="ForeignAddressTargetNode" select="$RtnHdrData/Filer/ForeignAddress"/>
							</xsl:call-template>
							<xsl:if test="$RtnHdrData/Filer/ForeignAddress/Country">
								<span style="width:7px;"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/Country"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styNameBox"  style="width:59.5mm;border-right:none;font-size:6pt;text-align:center;"/>
						<div style="vertical-align:text-top;text-align:center">Agents:<br/>
							Always include taxpayer's name on Return Label.
						</div>
					</div>
				</div>
				
				<!-- capturing the page bottom info -->
				<div class="pageEnd" style="width:187mm; font-size:7pt; border-top:1 solid black; padding-top:0.5mm">
					<div style="float:left; font-size:8pt">
						<b>For Privacy Act and Paperwork Reduction Act Notice, see page 4.</b>
					</div>
					<div style="float:right">
					Cat. No. 11780H
					<span style="width:15mm"/>
					Form <b style="font-size:9pt">2350</b> (2011)
					</div>
				</div>
				<!--</div>-->
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
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
