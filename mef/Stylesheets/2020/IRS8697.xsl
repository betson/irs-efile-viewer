<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<!-- 07-08-2011 - Changes made per UWR 40218 - Jeremy Nichols -->
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8697Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form8697Data" select="$RtnDoc/IRS8697"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form8697Data)"/>
					</xsl:call-template>
				</title>
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<meta http-equiv="Cache-Control" content="private"/>
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 8697"/>
				<META name="GENERATOR" content="IBM WebSphere Studio"/>
				<xsl:call-template name="GlobalStylesForm"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<!--<xsl:if test="not($Print) or $Print='' ">-->
						<xsl:call-template name="IRS8697Style"/>
						<xsl:call-template name="AddOnStyle"/>
					<!--</xsl:if>-->
				</style>
			</head>
			<body class="styBodyClass">
				<form name="Form8697">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Header Box -->
					<div class="styTBB" style="width:187mm;height:22mm;border-bottom-width: 1px;">
						<!-- Form No., etc.-->
						<div class="styFNBox" style="float:left;width:32mm;height:22mm;">
							<div style="padding-top:1mm;">
									Form
								<span style="width=2mm;"/>
								<span class="styFormNumber">8697</span>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form8697Data"/>
								</xsl:call-template>
								<br/>
							</div>
							<div style="padding-top:1.5mm; font-size:6pt;">(Rev. November 2018)</div>
							<div style="padding-top:1mm;">
								<span class="styAgency" style="font-size:6pt;width:30mm;">Department of the Treasury</span>
								<span class="styAgency" style="font-size:6pt;">Internal Revenue Service</span>
							</div>
						</div>
						<!-- Form title in header -->
						<div class="styFTBox" style="width:125mm;height:22mm;border-right: 1px solid black">
							<div class="styMainTitle">Interest Computation Under the Look-Back<br/> Method for Completed Long-Term Contracts</div>
							<div class="styFBT" style="padding-top:3mm;">
								<img src="{$ImagePath}/8697_Bullet_Md.gif" alt="bullet image pointing to right" width="8"/>
									Go to 
									<a href="http://www.irs.gov/form8697" title="Link to IRS.gov">
										<i>www.irs.gov/Form8697</i>
									</a>
									for instructions and the latest information. 
							</div>
						</div>
						<div style="float:left; font-size:7pt; width:30mm; padding-top:3.5mm; text-align:center; border-bottom:1px solid black; height:11mm">
						  OMB No. 1545-1031
						</div>
						<div style="float:left; font-size:7pt; padding-top:2mm; padding-left:4mm">
						  Attachment<br/>Sequence No. <b style="font-size:9pt">97</b>
						</div>						
					</div>
					<!-- End Header -->
					<!-- Tax year begining and ending -->
					<div class="styBB" style="width:187mm;border-top-width:1px;font-size:8pt;">
						  For the filing year  
						<span style="width:1mm;"/>
						<span style="width:23mm;">
							<xsl:call-template name="PopulateReturnHeaderTaxYear"/>
						</span>
						  beginning
						  <span style="width:1mm;"/>
						<span style="width:25mm;">
							<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
						</span>  
						, and ending
						<span style="width:1mm;"/>
						<span style="width:25mm;">
							<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
						</span>
						. See instructions.
					</div>
					<!-- End Tax Year Beginning and Ending -->
					<!-- Name and identifying number -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" rowspan="3" style="width:27mm;text-align:center;font-size:7pt;height:29.5mm;font-weight:bold;border-top-width:0px;">
							<span style="height:4mm;padding-top:8mm;"/>
							  Type <br/>or <br/>Print
						</div>						
						<div class="styNameBox" style="font-size:7pt;width:104mm;height:9.5mm;">
						   <span style="width:3px;"/>Name
							<div style="float:left;font-size:6pt;width:104mm;height:7mm;padding-top:1.5mm;font-family:verdana;">
								<xsl:choose>
									<!-- This process changed 170509 by gdy per UWR 194393 -->
									<xsl:when test="$Form8697Data/PersonNm">
										<br/>
										<span style="width:3px;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8697Data/PersonNm"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="$Form8697Data/BusinessName/BusinessNameLine1Txt">
										<span style="width:3px;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8697Data/BusinessName/BusinessNameLine1Txt"/>
										</xsl:call-template>
										<br/>
										<span style="width:3px;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form8697Data/BusinessName/BusinessNameLine2Txt"/>
												</xsl:call-template>
									</xsl:when>			
									<!--Business Name from F1120 Return Header-->
									<xsl:when test="$RtnHdrData/Filer/BusinessName">
										<span style="width:3px;"/>
									  <xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
									  </xsl:call-template>
									  <br/>
									  <span style="width:3px;"/>
									  <xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
									  </xsl:call-template>
									</xsl:when>
									<!--Individual Name from F1040/NR Return Header-->
									<xsl:when test="$RtnHdrData/Filer/NameLine1Txt">
										<br/>
										<span style="width:3px;"/>
									  <xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">NameLine1Txt</xsl:with-param>
									  </xsl:call-template>
									</xsl:when>
									<!--Business Name from F1041 Return Header-->
									<xsl:when test="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt">
										<span style="width:3px;"/>
									  <xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
									  </xsl:call-template>
									  <br/>
										<span style="width:3px;"/>
									  <xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
									  </xsl:call-template>            
									</xsl:when>
									<!--National Morgage Association Code from F1041 Return Header-->
									<xsl:when test="$RtnHdrData/Filer/NationalMortgageAssocCd">
										<br/>
										  <xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">NationalMortgageAssocCd</xsl:with-param>
										  </xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</div>
												
						<div class="styEINBox" style="font-size:7pt;font-weight:bold;width:55mm;height:9.5mm;border-bottom-width:2px;border-top-width:2px;
							border-right-width:2px;border-left-width:2px;">
							<span style="width:3px;"/>A Identifying number
							<div style="float:left;width:55mm;height:7mm;font-weight:normal;text-align:left;padding-top:3.5mm;padding-left:1mm;">
								<xsl:choose>
									<!-- This process changed 170509 by gdy per UWR 194393 -->
									<xsl:when test="$Form8697Data/EIN">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="$Form8697Data/EIN"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="$Form8697Data/SSN">
										<xsl:call-template name="PopulateSSN">
											<xsl:with-param name="TargetNode" select="$Form8697Data/SSN"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="$Form8697Data/MissingEINReasonCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8697Data/MissingEINReasonCd"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="$RtnHdrData/Filer/PrimarySSN">
										 <xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
										 </xsl:call-template>
									</xsl:when>
									<xsl:when test="$RtnHdrData/Filer/SSN">
										 <xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">SSN</xsl:with-param>
										 </xsl:call-template>
								    </xsl:when>
									<xsl:when test="$RtnHdrData/Filer/EIN">
										 <xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">EIN</xsl:with-param>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="$RtnHdrData/Filer/MissingEINReasonCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/MissingEINReasonCd"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</div>	
												
						<!-- Street Address -->						
						<div style="width:104mm;height:10mm;float:left;">
							<div class="styNameBox" style="font-size:7pt;width:104mm;height:10mm;border-bottom-width:1px;border-top-width:1px;">
								<span style="width:3px;"/>
								<span style="font-family:Arial;">Number, street, and apt., room, or suite no. If a P.O. box, see instructions.</span>
								<div style="float:left;font-size:7pt;width:104mm;">
									<span style="width:3px;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8697Data/USAddress/AddressLine1Txt"/>
									</xsl:call-template>
									<xsl:if test="$Form8697Data/USAddress/StateAbbreviationCd!=''">
										<div style="float:left;font-size:7pt;width:104mm;">
											<span style="width:3px;"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form8697Data/USAddress/AddressLine2Txt"/>
											</xsl:call-template>
										</div>
									</xsl:if>
								</div>
							</div>
							<div class="styNameBox" style="float:left;font-size:7pt;width:104mm;height:10mm;">
								<span style="width:3px;"/>City or town, state, and ZIP code
								<div style="float:left;font-size:7pt;width:104mm;height:7mm;padding-top:3.5mm;">
									<span style="width:3px;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8697Data/USAddress/CityNm"/>
									</xsl:call-template>
									<xsl:if test="$Form8697Data/USAddress/StateAbbreviationCd!=''">,
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8697Data/USAddress/StateAbbreviationCd"/>
										</xsl:call-template>,
									</xsl:if>
									<xsl:if test="$Form8697Data/USAddress/ZIPCd!=''">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8697Data/USAddress/ZIPCd"/>
										</xsl:call-template>
									</xsl:if>
								</div>						
								<!-- Taxpayer type is choice element -->
							</div>							
						</div>
						<div class="styEINBox" rowspan="2" 
								style="text-align:center;font-face:Arial;font-size:7pt;font-weight:normal;width:55mm;height:20mm;border-top: 1px solid black;">
								<span style="width:2px;"/>
								<span style="font-weight:bold;float:left">B</span>
								<span style="font-size:6pt;padding-left:1mm">Check applicable box to show type of taxpayer:</span>
							<span style="width:55mm;height:5mm;font-weight:normal;text-align:left;">
								
								<!--Corporation Checkbox -->
								<span style="width:3mm;"/>
								<input type="checkbox" alt="Corporation" class="styCkbox" style="width:4mm;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8697Data/CorporationInd"/>
										<xsl:with-param name="BackupName">IRS8697Corporation</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8697Data/CorporationInd"/>
										<xsl:with-param name="BackupName">IRS8697Corporation</xsl:with-param>
									</xsl:call-template>
									<span style="vertical-align:bottom;">Corporation</span>
								</label>
								<span style="width:3mm;"/>
								<!--S Corporation Checkbox -->
								<input type="checkbox" alt="SCorporation" class="styCkbox" style="width:4mm;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8697Data/SCorporationInd"/>
										<xsl:with-param name="BackupName">IRS8697SCorporation</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8697Data/SCorporationInd"/>
										<xsl:with-param name="BackupName">IRS8697SCorporation</xsl:with-param>
									</xsl:call-template>
									<span style="vertical-align:bottom;">S corporation</span>
								</label>
							</span>
							<div style="width:55mm;font-weight:normal;text-align:left;padding-top:0.5mm;">
								<span style="width:3mm;"/>
								<!--Individual Checkbox -->
								<input type="checkbox" alt="Individual" class="styCkbox" style="width:4mm;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8697Data/IndividualInd"/>
										<xsl:with-param name="BackupName">IRS8697Individual</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8697Data/IndividualInd"/>
										<xsl:with-param name="BackupName">IRS8697Individual</xsl:with-param>
									</xsl:call-template>
									<span style="vertical-align:bottom;">Individual</span>
								</label>
								<span style="width:5mm;"/>
								<!--Partnership Checkbox -->
								<input type="checkbox" alt="Partnership" class="styCkbox" style="width:5mm;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8697Data/PartnershipInd"/>
										<xsl:with-param name="BackupName">IRS8697Partnership</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8697Data/PartnershipInd"/>
										<xsl:with-param name="BackupName">IRS8697Partnership</xsl:with-param>
									</xsl:call-template>
									<span style="vertical-align:bottom;">Partnership</span>
									<span style="width:1mm;"/>
								</label>
							</div>
							<div style="width:55mm;font-weight:normal;text-align:left;padding-top:0.5mm;">
								<span style="width:3mm;"/>
								<!-- Estate or Trust Checkbox -->
								<input type="checkbox" alt="EstateOrTrust" class="styCkbox" style="width:4mm;margin-left:none;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8697Data/EstateOrTrustInd"/>
										<xsl:with-param name="BackupName">IRS8697EstateOrTrust</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8697Data/EstateOrTrustInd"/>
										<xsl:with-param name="BackupName">IRS8697EstateOrTrust</xsl:with-param>
									</xsl:call-template>
									<span style="vertical-align:bottom;">Estate or trust</span>
								</label>
							</div>
						</div>
					</div>
					<!-- Line C -->
					<div style="width:187mm;height:6mm">
						<div class="styLNLeftNumBox" style="width:5mm;heigh:4mm;">C</div>
						<div class="styLNDesc" style="width:180mm;padding-top:0mm;font-size:6pt;">
						  If you were an owner of an interest in a pass-through entity (such as a partnership or an S corporation)
						  that holds one or more long-term contracts to which this interest computation relates, enter the name 
						  and employer identification number of the entity. Attach a schedule if there is more than one such entity.
						  <!--<span style="width:20mm;float:right;"/>-->
						</div>
					</div>
					<xsl:variable name="part4Count" select="1"/>
					<div class="styBB" style="width:187mm;" id="TPctn">
						<xsl:call-template name="SetInitialState"/>
						<table cellspacing="0" style="font-size:7pt;" name="TYTable" id="TYTable">
							<tr>
								<th class="styTableCell" rowspan="1" style="width:4mm;float:left;border:none;">
									<span style="width:1px;"/>
								</th>
								<th class="styTableCell" rowspan="1" 
									style="width:130mm;text-align:left;border-color:black;border-right-width:1px;border-bottom:none;font-weight:normal;">Name of entity <br/>
								</th>
								<th class="styTableCell" rowspan="1" style="width:50mm;text-align:center;border-color:black;border-bottom:none;border-right:none;">
									<span style="font-weight:bold;">Employer identification number<br/>
									</span>
								</th>
							</tr>
							<tr>
								<td class="styTableCell" style="width:4mm;float:left;border:none;">
									<span style="width:1px;"/>
								</td>
								<td class="styTableCell" 
								style="margin-left:2mm;width:139mm;border-color:black;border-left:none;border-right-width:1px;text-align:left;
									border-bottom:none;font-size:6pt;font-family:verdana;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8697Data/PassThroughEntityName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8697Data/PassThroughEntityName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" 
								style="width:44mm;border-color:black;text-align:left;padding-left:1mm;border-left:none;border-right:none;border-bottom:none;">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$Form8697Data/PassThroughEntityEIN"/>
									</xsl:call-template>
									<xsl:if test="$Form8697Data/MissingEINEntityReasonCd!=' '">
										<span style="font-weight:normal;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form8697Data/MissingEINEntityReasonCd"/>
											</xsl:call-template>
										</span>
									</xsl:if>
								</td>
							</tr>
						</table>
					</div>
			
					<!-- Part I title -->
					<div style="width:187mm;height:8mm;border-style:solid;border-bottom-width:1px;border-top-width:0px;           
					border-right-width:0px;border-left-width:0px;padding-top:2mm;float:none;clear:both;">
						<span class="styPartName" style="height:4mm">Part I</span>
						<span style="width 50mm;" class="styPartDesc">Regular Method 
						<span style="font-weight:normal"> (see instructions)</span>
						</span>
					</div>
					<xsl:variable name="PriorYearCount" select="count($Form8697Data/RegularMethodRedetermYrGrp/AdjTaxableIncomeLookBackAmt)"/>
					<xsl:variable name="FilingYearCount">
						<xsl:value-of select="count($Form8697Data/RegularMethodFilingYrGrp/TaxableIncomeOrLossAmt)"/>
					</xsl:variable>
					<xsl:variable name="FilingYearExists">
						<xsl:choose>
							<xsl:when test="$FilingYearCount &gt; '0'">
								<xsl:value-of select="true()"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="false()"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:choose>
						<xsl:when test="($PriorYearCount  &gt; '2') and ($Print = $Separated)">
							<table style="width:187mm; " id="TP1ctn">
								<xsl:call-template name="SetInitialState"/>
								<table cellspacing="0" style="width:187mm;border-top-width:0px;font-size:7pt;border-style: solid; border-color: black;
								         border-bottom-width:0px;border-left-width:0px;border-right-width: 0px;page-break-inside: avoid">
									<tr>
										<th class="styTableCell" rowspan="1" style="width:7mm;text-align:center;border-color:black;border-right:none;border-bottom:none;">
											<span style="width:1px;"/>
										</th>
										<th class="styTableCell" rowspan="1" style="width:80mm;text-align:left;border-color:black;border-bottom:none;">
											<span style="width:1px;"/>
										</th>
										<th class="styTableCell" rowspan="1" 
											style="width:29mm;height:7mm;text-align:center;font-weight:normal;border-top-width:0px;border-color:black;">
										          Filing Year
										</th>
										<th class="styTableCell" colspan="2" style="width:67mm;text-align:center;font-weight:normal;border-top-width:0px;border-color:black;">
												  Redetermination Years
										</th>
										<th class="styTableCell" rowspan="1" 
										style="width:29mm;text-align:center;border-top-width:0px;border-color:black;border-right:none;border-bottom:none;">
											<span style="float:left;width:1px;"/>
										</th>
									</tr>
									<tr style="height:30mm">
										<th class="styTableCell" rowspan="2" 
										style="width:7mm;text-align:center;vertical-align:top;font-weight:bold;border-color:black;border-right:none;border-bottom:none;">1</th>
										<th class="styForm8697TableCellDescription" rowspan="2" style="font-weight:normal;">
										  Taxable income or loss for the prior years shown on tax
										  return (or as previously adjusted) before net operating loss
										  or capital loss carrybacks (other than carrybacks that must
										  be taken into account to properly compute interest under section 460) 
										  (see instructions). If you were required to file Form 8697 for an earlier year, enter adjusted
										  taxable income for the prior years from line 3, Form 8697,
										  for the most recent filing year that affects the prior years.  
										  <span style="width:2mm;"/>
											<!--<span style="letter-spacing:4mm;">........</span>-->
										</th>
										<td class="styTableCell" rowspan="1" style="width:29mm;text-align:center;font-weight:bold;border-color:black;">
											<span style="text-align:center;width:29mm;font-weight:normal">Year ended</span>
											<span style="float:left;clear:all;width:29mm;font-weight:normal">mo
												<span class="styFixedUnderline" style="width:5mm;float:none;padding-bottom:0;">
													<xsl:for-each select="$Form8697Data/RegularMethodFilingYrGrp/TaxableIncomeOrLossAmt">
														 <span class="styFixedUnderline" style="width:5mm;float:none;padding-bottom:0;">
															<xsl:call-template name="PopulateMonth">
																<xsl:with-param name="TargetNode" select="../YearEndedDt"/>
															</xsl:call-template>
														</span>	
													</xsl:for-each>
												</span>												
												<span style="width:1mm;"/>yr.
											    <span class="styFixedUnderline" style="width:8mm;float:none;padding-bottom:0mm;">
													<xsl:for-each select="$Form8697Data/RegularMethodFilingYrGrp/TaxableIncomeOrLossAmt">
														<span class="styFixedUnderline" style="width:8mm;float:none;padding-bottom:0;">
															<xsl:call-template name="PopulateYear">
																<xsl:with-param name="TargetNode" select="../YearEndedDt"/>
															</xsl:call-template>
														</span>
													</xsl:for-each>
												</span>
											</span>	
										</td>
										<td class="styTableCell" rowspan="1" style="width:29mm;text-align:center;font-weight:bold;border-color:black;">
											(a)											
											<span style="text-align:center;width:29mm;font-weight:normal">Year ended</span>
											<span style="float:left;clear:all;width:29mm;font-weight:normal">mo
											<span class="styFixedUnderline" style="width:5mm;float:none;padding-bottom:0;">
												</span>
												<span style="width:1mm;"/>yr.
												<span class="styFixedUnderline" style="width:8mm;float:none;padding-bottom:0;">
												</span>
											</span>
										</td>
										<td class="styTableCell" rowspan="1" style="width:29mm;text-align:center;font-weight:bold;border-color:black;">
										(b)
										<span style="text-align:center;width:29mm;font-weight:normal">Year ended</span>
											<span style="float:left;clear:all;width:29mm;font-weight:normal">mo
												<span class="styFixedUnderline" style="width:5mm;float:none;padding-bottom:0;">
													<span style="width:2mm;"/>
												</span>
												<span style="width:1mm;"/>yr.
												<span class="styFixedUnderline" style="width:8mm;float:none;padding-bottom:0;">
													<span style="width:2mm;"/>
												</span>
											</span>
										</td>
										<td class="styTableCell" rowspan="1" style="width:29mm;text-align:center;border-color:black;border-right:none">
											<span style="font-weight:bold;">
												(c)
											</span>
											<br/>
											<span style="text-align:center;width:20mm;">Totals</span>
											<span style="float:left;clear:all;width:29mm;font-weight:normal">
												(Add columns (a)
											</span>
											<span style="float:left;clear:all;width:29mm;font-weight:normal">
												and (b).)
											</span>
										</td>
									</tr>
									<tr>
										<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
											<xsl:choose>
												<xsl:when test="$FilingYearExists = 'true'">
													<xsl:for-each select="$Form8697Data/RegularMethodFilingYrGrp/TaxableIncomeOrLossAmt">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="../TaxableIncomeOrLossAmt"/>
														</xsl:call-template>
													</xsl:for-each>
												</xsl:when>
												<xsl:otherwise>
													<span style="width:2mm;"/>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp/TaxableIncomeOrLossAmt"/>
												<xsl:with-param name="ShortMessage" select="'true'"/>
											</xsl:call-template>
											<span style="width:2mm;"/>
										</td>
										<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
											<span style="width:2mm;"/>
										</td>
										<td class="styForm8697TableCellEmptyGray" rowspan="1">
											<span style="width:1mm;"/>
										</td>
									</tr>
									<tr style="height:34mm">
										<td class="styForm8697TableCellNumber" rowspan="1">2</td>
										<td class="styForm8697TableCellDescription" rowspan="1">
										  Adjustment to income to reflect the difference between:
										  <span style="font-weight:bold;">(a)</span> the amount of income required to be allocated for
										  post-February 1986 contracts completed or adjusted
										  during the tax year based on the <span style="font-weight:bold;">actual</span> contract price and
										  costs, and <span style="font-weight:bold;">(b)</span> the amount of income reported for such
										  contracts based on <span style="font-weight:bold;">estimated</span> contract price and costs.
										  See instructions and attach a schedule listing
										  each separate contract, unless you were an owner of an
										  interest in a pass-through entity reporting this amount from
										  Schedule K-1 or a similar statement.
										  <!-- Form Link to Additional Data -->
											<!-- Form Link has been removed here and placed in each individual cell.  As the push pin is hiding some characters when tested with maximum digits 
												placed a break next to it,as the space is already scarce -->
											<span style="width:2mm;"/><!--
											<span style="letter-spacing:4mm;">.</span>-->
										</td>
										<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
											<xsl:choose>
												<xsl:when test="$FilingYearExists = 'true'">
													<xsl:for-each select="$Form8697Data/RegularMethodFilingYrGrp/IncomeAdjustmentAmt">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="../IncomeAdjustmentAmt"/>
														</xsl:call-template>
													</xsl:for-each>
												</xsl:when>
												<xsl:otherwise>
													<span style="width:2mm;"/>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<xsl:for-each select="$Form8697Data/RegularMethodRedetermYrGrp/IncomeAdjustmentAmt">
											<xsl:if test="position() &lt;= 2 ">
												<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
													<span style="width:2mm;"/>
												</td>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="$PriorYearCount &lt; '1'">
											<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
												<span style="width:2mm;"/>
											</td>
										</xsl:if>
										<xsl:if test="$PriorYearCount &lt; '2'">
											<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
												<span style="width:2mm;"/>
											</td>
										</xsl:if>
										<td class="styForm8697TableCell" rowspan="1" style="border-right:0px;border-top:1px;border-color:black;border-style:solid;">
											<span style="width:1mm;"/>
										</td>
									</tr>
									<!-- Part 1 - Line 3 -->
									<tr>
										<td class="styForm8697TableCellNumber" rowspan="1">3</td>
										<td class="styForm8697TableCellDescription" rowspan="1">
										  Adjusted taxable income for look-back purposes. Combine lines 1 and 2.  If line 3 is a negative amount, see instructions.
										</td>
										<td class="styForm8697TableCell" rowspan="1">
											<xsl:choose>
												<xsl:when test="$FilingYearExists = 'true'">
													<xsl:for-each select="$Form8697Data/RegularMethodFilingYrGrp/AdjTaxableIncomeLookBackAmt">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="../AdjTaxableIncomeLookBackAmt"/>
														</xsl:call-template>
													</xsl:for-each>
												</xsl:when>
												<xsl:otherwise>
													<span style="width:2mm;"/>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styForm8697TableCell" rowspan="1">
											<span style="width:2mm;"/>
										</td>
										<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
											<span style="width:2mm;"/>
										</td>
										<td class="styForm8697TableCellEmptyGray" rowspan="1">
											<span style="width:1px;"/>
										</td>
									</tr>
									<!-- Part 1 - Line 4 -->
									<tr>
										<td class="styForm8697TableCellNumber" rowspan="1">4</td>
										<td class="styForm8697TableCellDescription" rowspan="1">
										  Income tax liability on line 3 amount using tax rates in effect
										  for the prior years (see instructions)
										  <span style="width:2mm;"/>
											<span style="letter-spacing:4mm;">...</span>
										</td>
										<td class="styForm8697TableCell" rowspan="1">
											<xsl:choose>
												<xsl:when test="$FilingYearExists = 'true'">
													<xsl:for-each select="$Form8697Data/RegularMethodFilingYrGrp/TaxLiabilityAmt">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="../TaxLiabilityAmt"/>
														</xsl:call-template>
													</xsl:for-each>
												</xsl:when>
												<xsl:otherwise>
													<span style="width:2mm;"/>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styForm8697TableCell" rowspan="1">
											<span style="width:2mm;"/>
										</td>
										<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
											<span style="width:2mm;"/>
										</td>
										<td class="styForm8697TableCellEmptyGray" rowspan="1">
											<span style="width:1px;"/>
										</td>
									</tr>
									<!-- Part 1 - Line 5 -->
									<tr>
										<td class="styForm8697TableCellNumber" rowspan="1">5</td>
										<td class="styForm8697TableCellDescription" rowspan="1">
										  Income tax liability shown on return (or as previously
										  adjusted) for the prior years (see instructions).
										  If you were required to file Form 8697 for an earlier year,
										  enter the amount required to be reported on line 4, Form
										  8697, for the most recent filing year that affects the prior
										  years <span style="width:2mm;"/>
											<span style="letter-spacing:4mm;">...</span>
										</td>
										<td class="styForm8697TableCellEmptyGray" rowspan="1" style="border-right:1px;border-color:black;border-style:solid;">
											<span style="width:1px;"/>
										</td>
										<td class="styForm8697TableCell" rowspan="1">
											<span style="width:2mm;"/>
										</td>
										<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
											<span style="width:2mm;"/>
										</td>
										<td class="styForm8697TableCellEmptyGray" rowspan="1">
											<span style="width:1px;"/>
										</td>
									</tr>
									<!-- Part 1 - Line 6 -->
									<tr>
										<td class="styForm8697TableCellNumber" rowspan="1">6</td>
										<td class="styForm8697TableCellDescription" rowspan="1">
										  Increase or decrease in tax for the prior years on which
										  interest is due (or is to be refunded). Subtract line 5 from
										  line 4.<span style="width:4mm;"/><!--
											<span style="letter-spacing:4mm;">.</span>-->
										</td>
										<td class="styForm8697TableCellEmptyGray" rowspan="1" style="border-right:1px;border-color:black;border-style:solid;">
											<span style="width:1px;"/>
										</td>
										<td class="styForm8697TableCell" rowspan="1">
											<span style="width:2mm;"/>
										</td>
										<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
											<span style="width:2mm;"/>
										</td>
										<td class="styTableCell" rowspan="1" style="width:29mm;background-color:lightgrey;border-right:none;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<!-- Part 1 - Line 7 -->
									<tr>
										<td class="styForm8697TableCellNumber" rowspan="1">7</td>
										<td class="styForm8697TableCellDescription" rowspan="1">
										  Interest due on increase, if any, shown on line 6 (see instructions)<span style="width:4mm;"/>
											<span style="letter-spacing:4mm;">.</span>
										</td>
										<td class="styForm8697TableCellEmptyGray" rowspan="1" style="border-right:1px;border-color:black;border-style:solid;">
											<span style="width:1px;"/>
										</td>
										<td class="styForm8697TableCell" rowspan="1">
											<span style="width:2mm;"/>
										</td>
										<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
											<span style="width:2mm;"/>
										</td>
										<td class="styForm8697TableCell" rowspan="1" style="border-right:none;">
											<span style="width:1mm;"/>
										</td>
									</tr>
									<tr>
										<td class="styForm8697TableCellNumber" rowspan="1">8</td>
										<td class="styForm8697TableCellDescription" rowspan="1">
										  Interest to be refunded on decrease, if any, shown on
										  line 6 (see instructions)
										  <span style="width:2mm;"/><!--
											<span style="letter-spacing:4mm;">........</span>-->
										</td>
										<td class="styForm8697TableCellEmptyGray" rowspan="1" 
										style="border-right:1px;border-bottom:1px;border-color:black;border-style:solid;">
											<span style="width:1px;"/>
										</td>
										<td class="styForm8697TableCell" rowspan="1">
											<span style="width:2mm;"/>
										</td>
										<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
											<span style="width:2mm;"/>
										</td>
										<td class="styForm8697TableCell" rowspan="1" style="border-right:none;">
											<span style="width:1mm;"/>
										</td>
									</tr>
								</table>
							</table>
						</xsl:when>
						<xsl:when test="($PriorYearCount  &gt; '2') and ($Print != $Separated)">
							<!--Determine how many times to repeat Part I table-->
							<xsl:variable name="Part1Count" select="count($Form8697Data/RegularMethodRedetermYrGrp)"/>
							<xsl:variable name="Part1PreMax">
								<xsl:choose>
									<xsl:when test="$Part1Count mod 2 = 0">
										<xsl:value-of select="$Part1Count div 2"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="ceiling($Part1Count div 2)"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:call-template name="part1Table">
								<xsl:with-param name="Part1Max">
									<xsl:choose>
										<!-- Check to see if there are exactly two records -->
										<xsl:when test="$Part1PreMax = 0">
											<xsl:value-of select="1"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="$Part1PreMax"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:with-param>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<table style="width:187mm;" id="TP1ctn">
								<xsl:call-template name="SetInitialState"/>
								<table cellspacing="0" style="width:187mm;border-top-width:0px;font-size:7pt;border-style: solid; border-color: black;
								border-bottom-width:0px;border-left-width:0px;border-right-width: 0px;page-break-inside: avoid">
									<tr>
										<th class="styTableCell" rowspan="1" style="width:7mm;text-align:center;border-color:black;border-right:none;border-bottom:none;">
											<span style="width:1px;"/>
										</th>
										<th class="styTableCell" rowspan="1" style="width:80mm;text-align:left;border-color:black;border-bottom:none;">
											<span style="width:1px;"/>
										</th>
										<th class="styTableCell" rowspan="1" 
											style="width:29mm;height:7mm;text-align:center;font-weight:normal;border-top-width:0px;border-color:black;">
										     Filing Year
										</th>
										<th class="styTableCell" colspan="2" style="width:67mm;text-align:center;font-weight:normal;border-top-width:0px;border-color:black;">
											 Redetermination Years
										</th>
										<th class="styTableCell" rowspan="1" 
										style="width:29mm;text-align:center;border-top-width:0px;border-color:black;border-right:none;border-bottom:none;">
											<span style="float:left;width:1px;"/>
										</th>
									</tr>
									<tr style="height:30mm">
										<th class="styTableCell" rowspan="2" 
										style="width:7mm;text-align:center;vertical-align:top;font-weight:bold;border-color:black;border-right:none;border-bottom:none;">1</th>
										<th class="styForm8697TableCellDescription" rowspan="2" style="font-weight:normal;">
										  Taxable income or loss for the prior years shown on tax
										  return (or as previously adjusted) before net operating loss
										  or capital loss carrybacks (other than carrybacks that must
										  be taken into account to properly compute interest under
										  section 460) (see instructions). If you were
										  required to file Form 8697 for an earlier year, enter adjusted
										  taxable income for the prior years from line 3, Form 8697,
										  for the most recent filing year that affects the prior years.  
											<span style="width:2mm;"/>
											<!--<span style="letter-spacing:4mm;">........</span>-->
										</th>
										<td class="styTableCell" rowspan="1" style="width:29mm;text-align:center;font-weight:bold;border-color:black;">
											<span style="text-align:center;width:29mm;font-weight:normal">Year ended</span>
											<span style="float:left;clear:all;width:29mm;font-weight:normal">mo
												<span class="styFixedUnderline" style="width:5mm;float:none;padding-bottom:0;">
													<xsl:for-each select="$Form8697Data/RegularMethodFilingYrGrp/TaxableIncomeOrLossAmt">
														 <span class="styFixedUnderline" style="width:5mm;float:none;padding-bottom:0;">
															<xsl:call-template name="PopulateMonth">
																<xsl:with-param name="TargetNode" select="../YearEndedDt"/>
															</xsl:call-template>
														</span>	
													</xsl:for-each>
												</span>
												<span style="width:1mm;"/>yr.
												<span class="styFixedUnderline" style="width:8mm;float:none;padding-bottom:0;">
													<xsl:for-each select="$Form8697Data/RegularMethodFilingYrGrp/TaxableIncomeOrLossAmt">
															<xsl:call-template name="PopulateYear">
																<xsl:with-param name="TargetNode" select="../YearEndedDt"/>
															</xsl:call-template>
													</xsl:for-each>
												</span>
											</span>
										</td>
										<xsl:for-each select="$Form8697Data/RegularMethodRedetermYrGrp/TaxableIncomeOrLossAmt">
											<xsl:if test="position() &lt;= 2 ">
												<td class="styTableCell" rowspan="1" style="width:29mm;text-align:center;font-weight:bold;border-color:black;">
												<!--				(a)   -->
												<xsl:variable name="pos" select="position()"/>
												<xsl:if test="$pos = 0"/>
											   (<xsl:number value="$pos" format="a"/>)
												<span style="width:2px"/>										
												<span style="text-align:center;width:29mm;font-weight:normal">Year ended</span>
													<span style="float:left;clear:all;width:29mm;font-weight:normal">mo
															<span class="styFixedUnderline" style="width:5mm;float:none;padding-bottom:0;">
																<xsl:call-template name="PopulateMonth">
																	<xsl:with-param name="TargetNode" select="../YearEndedDt"/>
																</xsl:call-template>
															</span>
																<span style="width:1mm;"/>yr.
															<span class="styFixedUnderline" style="width:8mm;float:none;padding-bottom:0;">
																<xsl:call-template name="PopulateYear">
																	<xsl:with-param name="TargetNode" select="../YearEndedDt"/>
																</xsl:call-template>
															</span>
													</span>
												</td>
											</xsl:if>
										</xsl:for-each> 
										<xsl:if test="$PriorYearCount &lt; '1'">
											<td class="styTableCell" rowspan="1" style="width:29mm;text-align:center;font-weight:bold;border-color:black;">
												(a)
												<span style="text-align:center;width:29mm;font-weight:normal">Year ended</span>
													<span style="float:left;clear:all;width:29mm;font-weight:normal">mo
														<span class="styFixedUnderline" style="width:5mm;float:none;padding-bottom:0;">
															<span style="width:2mm;"/>
														</span>
														<span style="width:1mm;"/>yr.
														<span class="styFixedUnderline" style="width:8mm;float:none;padding-bottom:0;">
															<span style="width:2mm;"/>
														</span>
													</span>
											</td>
										</xsl:if> 
										<xsl:if test="$PriorYearCount &lt; '2'">
											<td class="styTableCell" rowspan="1" style="width:29mm;text-align:center;font-weight:bold;border-color:black;">
												<xsl:if test="$PriorYearCount &lt;= 1">(b)</xsl:if>
												<span style="text-align:center;width:29mm;font-weight:normal">Year ended</span>
												<span style="float:left;clear:all;width:29mm;font-weight:normal">mo
													<span class="styFixedUnderline" style="width:5mm;float:none;padding-bottom:0;">
														<span style="width:2mm;"/>
													</span>
													<span style="width:1mm;"/>yr.
													<span class="styFixedUnderline" style="width:8mm;float:none;padding-bottom:0;">
														<span style="width:2mm;"/>
													</span>
												</span>
											</td>
										</xsl:if>  
										<td class="styTableCell" rowspan="1" style="width:29mm;text-align:center;border-color:black;border-right:none">
											<span style="font-weight:bold;">
												<!--<xsl:if test="$index &lt;= 1">-->(c)<!--</xsl:if>-->
											</span>
											<br/>
											<span style="text-align:center;width:20mm;">Totals</span>
											<span style="float:left;clear:all;width:29mm;font-weight:normal">
												(Add columns (a)
											</span>
											<span style="float:left;clear:all;width:29mm;font-weight:normal">
												and (b).)
											</span>
										</td>
									</tr>
									<tr>
										<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
											<xsl:choose>
												<xsl:when test="$FilingYearExists = 'true'">
													<xsl:for-each select="$Form8697Data/RegularMethodFilingYrGrp/TaxableIncomeOrLossAmt">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="../TaxableIncomeOrLossAmt"/>
														</xsl:call-template>
													</xsl:for-each>
												</xsl:when>
												<xsl:otherwise>
													<span style="width:2mm;"/>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<xsl:for-each select="$Form8697Data/RegularMethodRedetermYrGrp/TaxableIncomeOrLossAmt">
											<xsl:if test="position() &lt;= 2 ">
												<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="../TaxableIncomeOrLossAmt"/>
													</xsl:call-template>
												</td>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="$PriorYearCount &lt; '1'">
											<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
												<span style="width:2mm;"/>
											</td>
										</xsl:if>
										<xsl:if test="$PriorYearCount &lt; '2'">
											<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
												<span style="width:2mm;"/>
											</td>
										</xsl:if>  
										<td class="styForm8697TableCellEmptyGray" rowspan="1">
											<span style="width:1mm;"/>
										</td>
									</tr>
									<tr style="height:34mm">
										<td class="styForm8697TableCellNumber" rowspan="1">2</td>
										<td class="styForm8697TableCellDescription" rowspan="1">
											  Adjustment to income to reflect the difference between:
											  <span style="font-weight:bold;">(a)</span> the amount of income required to be allocated for
											  post-February 1986 contracts completed or adjusted
											  during the tax year based on the <span style="font-weight:bold;">actual</span> contract price and
											  costs, and <span style="font-weight:bold;">(b)</span> the amount of income reported for such
											  contracts based on <span style="font-weight:bold;">estimated</span> contract price and costs.
											  See instructions and attach a schedule listing
											  each separate contract, unless you were an owner of an
											  interest in a pass-through entity reporting this amount from
											  Schedule K-1 or a similar statement.  
											  <!-- Form Link to Additional Data -->
											<!-- Form Link has been removed here and placed in each individual cell.  As the push pin is hiding some characters when tested with maximum digits 
													placed a break next to it,as the space is already scarce -->
											<span style="width:2mm;"/>
											<!--<span style="letter-spacing:4mm;">.</span>-->
										</td>
										<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
											<xsl:choose>
												<xsl:when test="$FilingYearExists = 'true'">
													<xsl:for-each select="$Form8697Data/RegularMethodFilingYrGrp/IncomeAdjustmentAmt">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="../IncomeAdjustmentAmt"/>
														</xsl:call-template>
													</xsl:for-each>
												</xsl:when>
												<xsl:otherwise>
													<span style="width:2mm;"/>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<xsl:for-each select="$Form8697Data/RegularMethodRedetermYrGrp/IncomeAdjustmentAmt">
											<xsl:if test="position() &lt;= 2 ">
												<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
													<div style="text-align:left;">
														<xsl:call-template name="SetFormLinkInline">
															<xsl:with-param name="TargetNode" select="../IncomeAdjustmentAmt"/>
														</xsl:call-template>
													</div>
													<br/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="../IncomeAdjustmentAmt"/>
													</xsl:call-template>
												</td>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="$PriorYearCount &lt; '1'">
											<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
												<span style="width:2mm;"/>
											</td>
										</xsl:if>
										<xsl:if test="$PriorYearCount &lt; '2'">
											<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
												<span style="width:2mm;"/>
											</td>  
										</xsl:if>  
										<td class="styForm8697TableCell" rowspan="1" style="border-right:0px;border-top:1px;border-color:black;border-style:solid;">
											<xsl:choose>
												<xsl:when test="$PriorYearCount  &lt;= '2'">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8697Data/TotLookBackRegularMethodGrp/TotalAdjustmentToIncomeAmt"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<span style="width:1mm;"/>
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
									<!-- Part 1 - Line 3 -->
									<tr>
										<td class="styForm8697TableCellNumber" rowspan="1">3</td>
										<td class="styForm8697TableCellDescription" rowspan="1">
											  Adjusted taxable income for look-back purposes. Combine lines 1 and 2.  If line 3 is a negative amount, see instructions.
										</td>
										<td class="styForm8697TableCell" rowspan="1">
											<xsl:choose>
												<xsl:when test="$FilingYearExists = 'true'">
													<xsl:for-each select="$Form8697Data/RegularMethodFilingYrGrp/AdjTaxableIncomeLookBackAmt">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="../AdjTaxableIncomeLookBackAmt"/>
														</xsl:call-template>
													</xsl:for-each>
												</xsl:when>
												<xsl:otherwise>
													<span style="width:2mm;"/>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<xsl:for-each select="$Form8697Data/RegularMethodRedetermYrGrp/AdjTaxableIncomeLookBackAmt">
											<xsl:if test="position() &lt;= 2 ">
												<td class="styForm8697TableCell" rowspan="1">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="../AdjTaxableIncomeLookBackAmt"/>
													</xsl:call-template>
												</td>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="$PriorYearCount &lt; '1'">
											<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
												<span style="width:2mm;"/>
											</td>
										</xsl:if>
										<xsl:if test="$PriorYearCount &lt; '2'">
											<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
												<span style="width:2mm;"/>
											</td>
										</xsl:if>  
										<td class="styForm8697TableCellEmptyGray" rowspan="1">
											<span style="width:1px;"/>
										</td>
									</tr>
									<!-- Part 1 - Line 4 -->
									<tr>
										<td class="styForm8697TableCellNumber" rowspan="1">4</td>
										<td class="styForm8697TableCellDescription" rowspan="1">
											  Income tax liability on line 3 amount using tax rates in effect
											  for the prior years (see instructions)
											  <span style="width:2mm;"/>
											<span style="letter-spacing:4mm;">...</span>
										</td>
										<td class="styForm8697TableCell" rowspan="1">
											<xsl:choose>
												<xsl:when test="$FilingYearExists = 'true'">
													<xsl:for-each select="$Form8697Data/RegularMethodFilingYrGrp/TaxLiabilityAmt">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="../TaxLiabilityAmt"/>
														</xsl:call-template>
													</xsl:for-each>
												</xsl:when>
												<xsl:otherwise>
													<span style="width:2mm;"/>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<xsl:for-each select="$Form8697Data/RegularMethodRedetermYrGrp/TaxLiabilityAmt">
											<xsl:if test="position() &lt;= 2 ">
												<td class="styForm8697TableCell" rowspan="1">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="../TaxLiabilityAmt"/>
													</xsl:call-template>
												</td>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="$PriorYearCount &lt; '1'">
											<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
												<span style="width:2mm;"/>
											</td>
										</xsl:if>
										<xsl:if test="$PriorYearCount &lt; '2'">
											<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
												<span style="width:2mm;"/>
											</td>
										</xsl:if>  
										<td class="styForm8697TableCellEmptyGray" rowspan="1">
											<span style="width:1px;"/>
										</td>
									</tr>
									<!-- Part 1 - Line 5 -->
									<tr>
										<td class="styForm8697TableCellNumber" rowspan="1">5</td>
										<td class="styForm8697TableCellDescription" rowspan="1">
											  Income tax liability shown on return (or as previously
											  adjusted) for the prior years (see instructions).
											  If you were required to file Form 8697 for an earlier year,
											  enter the amount required to be reported on line 4, Form
											  8697, for the most recent filing year that affects the prior
											  years <span style="width:2mm;"/>
											<span style="letter-spacing:4mm;">...</span>
										</td>
										<td class="styForm8697TableCellEmptyGray" rowspan="1" style="border-right:1px;border-color:black;border-style:solid;">
											<span style="width:1px;"/>
										</td>
										<xsl:for-each select="$Form8697Data/RegularMethodRedetermYrGrp/FederalIncomeTaxLiabilityAmt">
											<xsl:if test="position() &lt;= 2 ">
												<td class="styForm8697TableCell" rowspan="1">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="../FederalIncomeTaxLiabilityAmt"/>
													</xsl:call-template>
												</td>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="$PriorYearCount &lt; '1'">
											<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
												<span style="width:2mm;"/>
											</td>
										</xsl:if>
										<xsl:if test="$PriorYearCount &lt; '2'">
											<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
												<span style="width:2mm;"/>
											</td>
										</xsl:if>  
										<td class="styForm8697TableCellEmptyGray" rowspan="1">
											<span style="width:1px;"/>
										</td>
									</tr>
									<!-- Part 1 - Line 6 -->
									<tr>
										<td class="styForm8697TableCellNumber" rowspan="1">6</td>
										<td class="styForm8697TableCellDescription" rowspan="1">
											  Increase or decrease in tax for the prior years on which
											  interest is due (or is to be refunded). Subtract line 5 from
											  line 4.<span style="width:4mm;"/>
											<!--<span style="letter-spacing:4mm;">.</span>-->
										</td>
										<td class="styForm8697TableCellEmptyGray" rowspan="1" style="border-right:1px;border-color:black;border-style:solid;">
											<span style="width:1px;"/>
										</td>
										<xsl:for-each select="$Form8697Data/RegularMethodRedetermYrGrp/IncreaseOrDecreaseInTxForPYAmt">
											<xsl:if test="position() &lt;= 2 ">
												<td class="styForm8697TableCell" rowspan="1">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="../IncreaseOrDecreaseInTxForPYAmt"/>
													</xsl:call-template>
												</td>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="$PriorYearCount &lt; '1'">
											<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
												<span style="width:2mm;"/>
											</td>
										</xsl:if>
										<xsl:if test="$PriorYearCount &lt; '2'">
											<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
												<span style="width:2mm;"/>
											</td>
										</xsl:if>  
										<td class="styTableCell" rowspan="1" style="width:29mm;background-color:lightgrey;border-right:none;">
											<span style="width:1px;"/>
										</td>
									</tr>
									<!-- Part 1 - Line 7 -->
									<tr>
										<td class="styForm8697TableCellNumber" rowspan="1">7</td>
										<td class="styForm8697TableCellDescription" rowspan="1">
											  Interest due on increase, if any, shown on line 6 (see instructions)
											<span style="letter-spacing:4mm;">.....</span>
										</td>
										<td class="styForm8697TableCellEmptyGray" rowspan="1" style="border-right:1px;border-color:black;border-style:solid;">
											<span style="width:1px;"/>
										</td>
										<xsl:for-each select="$Form8697Data/RegularMethodRedetermYrGrp/InterestDueOnIncreaseAmt">
											<xsl:if test="position() &lt;= 2 ">
												<td class="styForm8697TableCell" rowspan="1">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="../InterestDueOnIncreaseAmt"/>
													</xsl:call-template>
												</td>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="$PriorYearCount &lt; '1'">
											<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
												<span style="width:2mm;"/>
											</td>
										</xsl:if>
										<xsl:if test="$PriorYearCount &lt; '2'">
											<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
												<span style="width:2mm;"/>
											</td>
										</xsl:if>  
										<td class="styForm8697TableCell" rowspan="1" style="border-right:none;">
											<xsl:choose>
												<xsl:when test="$PriorYearCount  &lt;= '2'">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" 
															select="$Form8697Data/TotLookBackRegularMethodGrp/TotalInterestDueOnIncreaseAmt"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<span style="width:1mm;"/>
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
									<!-- Part I - Line 8  -->
									<tr>
										<td class="styForm8697TableCellNumber" rowspan="1">8</td>
										<td class="styForm8697TableCellDescription" rowspan="1">
											  Interest to be refunded on decrease, if any, shown on line 6 (see instructions)
											  <span style="letter-spacing:4mm;">..</span>
										</td>
										<td class="styForm8697TableCellEmptyGray" rowspan="1" 
											style="border-right:1px;border-bottom:1px;border-color:black;border-style:solid;">
											<span style="width:1px;"/>
										</td>
										<xsl:for-each select="$Form8697Data/RegularMethodRedetermYrGrp/InterestToBeRefundedOnDecrAmt">
											<xsl:if test="position() &lt;= 2 ">
												<td class="styForm8697TableCell" rowspan="1">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="../InterestToBeRefundedOnDecrAmt"/>
													</xsl:call-template>
												</td>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="$PriorYearCount &lt; '1'">
											<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
												<span style="width:2mm;"/>
											</td>
										</xsl:if>
										<xsl:if test="$PriorYearCount &lt; '2'">
											<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
												<span style="width:2mm;"/>
											</td>
										</xsl:if>  
										<td class="styForm8697TableCell" rowspan="1" style="border-right:none;">
											<xsl:choose>
												<xsl:when test="$PriorYearCount  &lt;= '2'">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" 
															select="$Form8697Data/TotLookBackRegularMethodGrp/TotalInterestToBeRefundedAmt"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<span style="width:1mm;"/>
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
								</table>
							</table>
						</xsl:otherwise>
					</xsl:choose>
	
					<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
					<!-- END PAGE 2 -->
					<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
					<!-- Line 9 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="width:5mm;padding-left:1.5mm;">9</div>
						<div class="styLNDesc" style="width:152mm;height:4mm;padding-left:1mm;">
							Net amount of <span style="font-weight:bold;">interest to be refunded to you.</span>
							If line 8, column (c), exceeds line 7, column (c), enter the excess. File
							Form 8697 separately; 
							<span style="font-weight:bold;">do not</span>
							attach it to your tax return (see instructions)
							<span style="width:5mm;"/>
							<span style="letter-spacing:4mm;">..........</span>
						</div>
						<div class="styLNAmountBox" style="border-top-width:0px;width:29.5mm;height:7mm;"/>
					</div>
					<!-- Line 10 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;width:5mm;padding-left:.5mm;">10</div>
						<div class="styLNDesc" style="width:152mm;height:4mm;padding-left:1mm;">
							  Net amount of <span style="font-weight:bold;">interest you owe.</span> If line 7, column (c), exceeds line 8, column (c), 
							  enter the excess. Attach  Form 8697 to your tax return. See instructions for where to include this amount on your return
							  <span style="width:2mm;"/>
							<span style="letter-spacing:4mm;">........</span>
						</div>
						<div class="styLNAmountBox" style="border-top-width:0px;border-bottom:none;width:30mm;height:7.5mm;">
							<span style="width:30mm;"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/TotLookBackRegularMethodGrp/NetAmtOfInterestOwedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Footer line -->
					<div style="  clear:both;width:187mm;">
						<span style="font-weight:bold;">For Privacy Act and Paperwork Reduction Act Notice, see instructions.</span>
						<span style="width:4mm;"/>
						Cat. No. 64598V
						<span style="width:4mm;"/>
						Form 
						<span style="font-size:9pt;font-weight:bold;">8697</span> (Rev. 11-2018)
					</div>
					<div class="pageEnd"/>
					<div style="page-break-after:always"/>
				
					<!-- End Footer Line -->
					<!-- Header -->
					<div class="styBB" style="width:187mm;">
						<div style="float:left;">Form 8697 (Rev. 11-2018)<span style="width:130mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:7pt;">2</span>
						</div>
					</div>
					<!-- End of Header -->
					<!-- Part II title -->
					<div style="width:187mm;height:8mm;border-style:solid;border-bottom-width:1px;border-top-width:0px;           
						border-right-width:0px;border-left-width:0px;padding-top:2mm;float:left;">
						<span class="styPartName" style="height:4mm;">Part II</span>
						<span style="width:100mm; height: 2mm;" class="styPartDesc">Simplified Marginal Impact Method 
						<span style="font-weight:normal"> (see instructions)</span>
						</span>
					</div>
					<!-- Display all repeating elements when the Print parameter is not Separated. If the Print parameter is Separated, -->
					<!-- but the number of elements is less than the container size, then also display all elements -->
					<xsl:if test="($Print != $Separated) or (count($Form8697Data/SimplifiedMethodComputation) &lt;= 3)">
						<!--Determine how many times to repeat Part II table-->
						<xsl:variable name="Part2Count" select="count($Form8697Data/SimplifiedMethodComputation)"/>
						<xsl:variable name="Part2PreMax">
							<xsl:choose>
								<xsl:when test="$Part2Count mod 3 = 0">
									<xsl:value-of select="$Part2Count div 3"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="ceiling($Part2Count div 3)"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:call-template name="part2Table">
							<xsl:with-param name="Part2Max">
								<xsl:choose>
									<!-- Check to see if there are exactly three records -->
									<xsl:when test="$Part2PreMax = 0">
										<xsl:value-of select="1"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="$Part2PreMax"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:if>
					<!-- When the Print parameter is Separated and there are more elements than the container size, then display a -->
					<!-- blank section and direct the user to the addtional data table -->
					<xsl:if test="($Print = $Separated) and (count($Form8697Data/SimplifiedMethodComputation) &gt; 3)">
						<xsl:call-template name="part2Table">
							<xsl:with-param name="index" select="0"/>
							<xsl:with-param name="Part2Max" select="0"/>
						</xsl:call-template>
					</xsl:if>
					<!-- Line 10 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;width:5mm;padding-left:0mm;">10</div>
						<div class="styLNDesc" style="width:152mm;height:4mm;">
							  Net amount of <span style="font-weight:bold;">interest to be refunded to you.</span> If line 9, column (d), exceeds line 8, column (d), 
							  enter the excess. File Form 8697 separately; <span style="font-weight:bold;">do not</span> attach it to your tax return (see instructions)
							  <span style="width:px;"/>
							<span style="letter-spacing:4mm;">......</span>
						</div>
						<div class="styLNAmountBox" style="border-top-width:0px;width:30mm;height:7.5mm;">
							<span style="width:1px;"/>
						<!--<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/TotLookBackSmplfdMthdGrp/TotalInterestToBeRefunded"/>
							</xsl:call-template>	-->						
						</div>
					</div>
					<!-- Line 11 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;width:5mm;padding-left:0mm;">11</div>
						<div class="styLNDesc" style="width:152mm;height:4mm;">      
							  Net amount of <span style="font-weight:bold;">interest you owe.</span> If line 8, column (d), exceeds line 9, column (d), enter the 
							  excess. Attach Form 8697 to your tax return. See instructions for where to include this amount on your return<span style="width:2mm;"/>
							<span style="letter-spacing:4mm;">...</span>
						</div>
						<div class="styLNAmountBox" style="border-top-width:0px;border-bottom:none;width:30mm;height:7.5mm;">
							<span style="width:30mm;"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/TotLookBackSmplfdMthdGrp/NetAmtOfInterestOwedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="pageEnd"/>
					<div style="page-break-after:always"/>
					<!-- Begin Signature Section -->
					<!-- Implementing the Signature Section in table -->
					<div class="styBB" style="width:187mm;">
						<span style="font-size: 9pt">
							<b>Signature(s)</b> Complete this section <b>only</b> if this form is being filed separately.</span>
					</div>
					<table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:6pt;clear:both;page-break-inside: avoid">
						<tr>
							<td rowspan="3" style="width:18mm;font-size: 11pt;font-weight:bold;border-right:1px solid black;border-bottom:1px solid black;">Sign Here</td>
							<td colspan="4" style="padding-left:1mm;padding-bottom:1mm;">Under penalties of perjury, I declare that I have examined this form, including
							 accompanying schedules and statements, and to the best of my	knowledge and belief, it is true, correct, and complete. Declaration of preparer 
							 (other than taxpayer) is based on all information of which preparer has any knowledge. </td>
						</tr>
						<tr>
							<td rowspan="2" style="border-bottom:1px solid black;padding-left:1mm;">
								<img src="{$ImagePath}/8697_Bullet_Lg.gif" alt="Big Right Arrow"/>
							</td>
							<td style="width:103mm;border-bottom:1px solid black;vertical-align:bottom;">
							  Your signature<br/>
								<!--<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">TaxpayerPIN</xsl:with-param>
								</xsl:call-template>-->
								<span style="width:1px;"/>
							</td>
							<td style="width:53mm;border-top:0px; border-right:0px; border-left:1px; border-bottom:1px; border-style:solid;
								 border-color:black;vertical-align:bottom;">
							  Date<br/>
								<!--<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
								</xsl:call-template>-->
							</td>
						</tr>
						<tr>
							<td style="width:103mm;border-bottom:1px solid black;vertical-align:bottom;">
							  Spouse's signature.  If a joint return, both must sign.<br/>
								<!--<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">TaxpayerPIN</xsl:with-param>
								</xsl:call-template>-->
								<span style="width:1px;"/>
							</td>
							<td style="width:53mm;border-top:0px; border-right:0px; border-left:1px; border-bottom:1px; border-style:solid; 
								border-color:black;vertical-align:bottom;">
							  Date<br/>
								<!--<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
								</xsl:call-template>-->
							</td>
						</tr>
					</table>
					<!-- End Signature Section -->
					<!-- BEGIN PREPARER SIGNATURE SECTION -->
					<!-- Implementing the Preparer section in table -->
					<!--Signature data rem'd out per KISAM IM01072583 on 200508gdy-->
					<table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:6pt;border-color:black;border-bottom:1px solid 
						black;page-break-inside: avoid">
						<tr>
							<!--row 1-->
							<td rowspan="3" 
							style="width:22mm;font-size:14pt;font-weight:bold;font-family:'arial narrow';border-right:1px solid black;border-bottom:1px 
								solid black;text-align:left;">
									Paid Preparer Use Only</td>
							<td style="width:43mm;border-right:1px solid black;border-bottom:1px solid black;padding-left:1mm;">Print/Type preparer's name
							<br/>
								<!--<xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">Name</xsl:with-param>
								</xsl:call-template>-->
							</td>
							<td style="width:55mm;border-right:1px solid black;border-bottom:1px solid black;padding-left:1mm;">Preparer's signature
							<br/>
								<span style="width:2px;"/>
							</td>
							<td style="width:24mm;border-right:1px solid black;border-bottom:1px solid black;padding-left:1mm;">
								Date <br/>
								<span style="text-align:center; padding-left:7mm;">
									<!--<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">DatePrepared</xsl:with-param>
									</xsl:call-template>-->
								</span>
							</td>
							<td style="width:19mm;border-right:1px solid black;border-bottom:1px solid black;padding-left:1mm;vertical-align:bottom;padding-bottom:.5mm;">
								<nobr>
									<label for="dummyid1">
										<!--<xsl:call-template name="PopulateReturnHeaderPreparer">
											<xsl:with-param name="TargetNode">SelfEmployedLabel</xsl:with-param>
											<xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
										</xsl:call-template>-->Check  
									</label>
								</nobr>
								<input class="styCkbox" type="checkbox" id="dummyid1" style="width:4mm;">
									<!--<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">SelfEmployedCheckbox</xsl:with-param>
										<xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
									</xsl:call-template>-->
								</input>
								if <br/> self-employed
							</td>
							<td style="width:35mm;border-bottom:1px solid black;padding-left:1mm;">PTIN
								<br/>
								<span style="text-align:center;padding-left:10mm;">
									<!--<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">SSN</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">PTIN</xsl:with-param>
									</xsl:call-template>-->
								</span>
							</td>
						</tr>
						<tr>
							<!--row 2-->
							<td rowspan="1" colspan="4" style="border-bottom:1px solid black;border-right:1px solid black;padding-left:.5mm;">Firm's name
								<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
								<!--<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
								</xsl:call-template>-->
								<br/>
								<span style="padding-left:16mm;">
									<!--<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
										<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
									</xsl:call-template>-->
								</span>
							</td>
							<td style="border-bottom:1px solid black;padding-left:1mm;">Firm's EIN
								<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
								<!--<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">MissingEINReason</xsl:with-param>
								</xsl:call-template>-->
							</td>
						</tr>
						<tr>
							<!--row 3-->
							<td rowspan="1" colspan="4" style="border-bottom:1px solid black;border-right:1px solid black;padding-left:.5mm;">Firm's address
								<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
								<!--<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
								</xsl:call-template>-->
								<br/>
								<span style="padding-left:18mm;">
									<!--<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
										<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
									</xsl:call-template>-->
								</span>
								<br/>
								<span style="padding-left:18mm;">
									<!--<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
										<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
									</xsl:call-template>-->
								</span>
								<br/>
								<span style="padding-left:18mm;">
									<!--<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
										<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
									</xsl:call-template>-->
								</span>
							</td>
							<td style="border-bottom:1px solid black;padding-left:1mm;"> Phone no. 
								<!--<xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">Phone</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
								</xsl:call-template>-->
							</td>
						</tr>
					</table>
					<!-- END PREPARER SIGNATURE SECTION -->
					<!-- Footer line -->
					<div style="  clear:both;width:187mm;text-align:center;">
						<div style="float:right;" class="styGenericDiv">Form
					       <span class="styBoldText" style="font-size:8pt;">8697</span> (Rev. 11-2018)
						</div>
					</div>
					<!-- End Footer Line -->
					<!--<br class="pageEnd"/>-->
					<div class="pageEnd"/>
					<div style="page-break-after:always"/>
					<!-- BEGIN Left Over Table -->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
							Additional Data
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form8697Data"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
					<!-- Call to Create Part I Separated Additional Data Table -->
							<!-- 1611 - 1638 Added 170922gdy for testing how to get the separated to act like the Inline print mode. -->
							<!--Determine how many times to repeat Part 1 Separated Additional Data Table -->
						<xsl:if test="($Print = $Separated) and (count($Form8697Data/RegularMethodRedetermYrGrp) &gt; 2) ">
							<xsl:variable name="Pt1AddlTblCnt" select="count($Form8697Data/RegularMethodRedetermYrGrp)"/>
							<xsl:variable name="Pt1AddlTblPreMax">
								<xsl:choose>
									<xsl:when test="$Pt1AddlTblCnt mod 2 = 0">
										<xsl:value-of select="$Pt1AddlTblCnt div 2"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="ceiling($Pt1AddlTblCnt div 2)"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:call-template name="Pt1AddlTbl">
								<xsl:with-param name="Pt1AddlTblMax">
									<xsl:choose>
										<!-- Check to see if there are exactly two records -->
										<xsl:when test="$Pt1AddlTblPreMax = 0">
											<xsl:value-of select="1"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="$Pt1AddlTblPreMax"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:with-param>
							</xsl:call-template>
							<div class="pageEnd" style="page-break-after:always"/>
						</xsl:if>
					<!-- End of Call to Create Part I Separated Additional Data Table -->
					<!-- Part II Separated Additional Data Table for Separated Data -->
					<xsl:if test="($Print = $Separated) and (count($Form8697Data/SimplifiedMethodComputation) &gt; 3)">
						<span class="styRepeatingDataTitle">
							<br/>Form 8697, Part II - Simplified Marginal Impact Method:
						</span>
						<xsl:for-each select="$Form8697Data/SimplifiedMethodComputation">
							<xsl:variable name="pos" select="position()"/>
							<xsl:if test="$pos mod 3 = 1">
								<table class="styDepTbl" style="font-size:7pt;page-break-inside: avoid">
									<thead class="styTableThead">
										<tr class="styDepTblHdr">
											<th class="styDepTblCell" rowspan="1" style="width:4mm;border-right:none;">
												<span style="width:1px;"/>
											</th>
											<th class="styDepTblCell" rowspan="1" style="width:67mm;border-left:none">
												<span style="width:1px;"/>
											</th>
											<th class="styDepTblCell" colspan="3" style="width:87mm;text-align:center;">
												Date of each prior year to which interest <br/>computation relates:
											</th>
											<th class="styDepTblCell" colspan="1" style="width:29mm;">
												<span style="float:left;width:1px;"/>
											</th>
										</tr>
									</thead>
									<tfoot/>
									<tbody>
										<!-- Line 1 -->
										<tr class="styDepTblRow1" style="height:30mm">
											<td class="styDepTblCell" rowspan="2" style="width:4mm;text-align:center;font-weight:bold;border-right:none;">1</td>
											<td class="styDepTblCell" rowspan="2" style="width:67mm;text-align:left;border-left:none;">
												Adjustment to regular taxable income to reflect the
												difference between: <span style="font-weight:bold;">(a)</span> the amount of such income required
												to be allocated for post-February 1986 contracts
												completed or adjusted during the tax year based on <span style="font-weight:bold;">actual</span>
												contract price and costs, and <span style="font-weight:bold;">(b)</span> the amount of such
												income reported for such contracts based on <span style="font-weight:bold;">estimated</span>
												contract price and costs. See instructions
												and attach a schedule listing each separate contract,
												unless you were an owner of an interest in a pass-through
												entity reporting this amount from Schedule K-1 or a similar
												statement.
												<span style="width:6px;"/>
												<!--<span style="letter-spacing:4mm;">........</span>-->
											</td>
											<td class="styDepTblCell" style="width:29mm;text-align:center;font-weight:bold;">
												(<xsl:number value="$pos" format="a"/>)<span style="width:2px"/>
												<span style="text-align:center;width:29mm;font-weight:normal">Year ended</span>
												<span style="float:left;clear:all;width:29mm;font-weight:normal">mo
													<span class="styFixedUnderline" style="width:5mm;float:none;padding-bottom:0;">
														  	<xsl:call-template name="PopulateMonth">
																<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$pos]/YearEndedDt"/>
															</xsl:call-template>
													</span>
													<span style="width:1mm;"/>yr.
													<span class="styFixedUnderline" style="width:8mm;float:none;padding-bottom:0;">
														<xsl:call-template name="PopulateYear">
															<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$pos]/YearEndedDt"/>
														</xsl:call-template>
													</span>
												</span>
											</td>
											<td class="styDepTblCell" style="width:29mm;text-align:center;font-weight:bold;">
												(<xsl:number value="$pos+1" format="a"/>)<span style="width:2px"/>
												<span style="text-align:center;width:29mm;font-weight:normal">Year ended</span>
												<span style="float:left;clear:all;width:29mm;font-weight:normal">mo
													<span class="styFixedUnderline" style="width:5mm;float:none;padding-bottom:0;">
														<xsl:call-template name="PopulateMonth">
															<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$pos + 1]/YearEndedDt"/>
														</xsl:call-template>
													</span>
														<span style="width:1mm;"/>yr.
													<span class="styFixedUnderline" style="width:8mm;float:none;padding-bottom:0;">
														<xsl:call-template name="PopulateYear">
															<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$pos + 1]/YearEndedDt"/>
														</xsl:call-template>
													</span>
												</span>
											</td>
											<td class="styDepTblCell" style="width:29mm;text-align:center;font-weight:bold;">
												(<xsl:number value="$pos+2" format="a"/>)<span style="width:2px"/>
												<span style="text-align:center;width:29mm;font-weight:normal">Year ended</span>
												<span style="float:left;clear:all;width:29mm;font-weight:normal">mo
													<span class="styFixedUnderline" style="width:5mm;float:none;padding-bottom:0;">
														<xsl:call-template name="PopulateMonth">
															<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$pos + 2]/YearEndedDt"/>
														</xsl:call-template>
													</span>
													<span style="width:1mm;"/>yr.
													<span class="styFixedUnderline" style="width:8mm;float:none;padding-bottom:0;">
														<xsl:call-template name="PopulateYear">
															<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$pos + 2]/YearEndedDt"/>
														</xsl:call-template>
													</span>
												</span>
											</td>
											<td class="styDepTblCell" style="width:29mm;text-align:center;">
												<xsl:if test="$pos = 1">
													<span style="text-align:center;width:20mm;">Totals</span>
													<span style="float:left;clear:all;width:29mm;font-weight:normal">(Add columns (a),</span>
													<span style="float:left;clear:all;width:29mm;font-weight:normal">(b), and (c).)</span>
												</xsl:if>
											</td>
										</tr>
										<tr class="styDepTblRow1">
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<div style="text-align:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" 
															select="$Form8697Data/SimplifiedMethodComputation[$pos]/RegularTaxableIncomeAdjAmt"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
														select="$Form8697Data/SimplifiedMethodComputation[$pos]/RegularTaxableIncomeAdjAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<div style="text-align:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" 
															select="$Form8697Data/SimplifiedMethodComputation[$pos + 1]/RegularTaxableIncomeAdjAmt"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
														select="$Form8697Data/SimplifiedMethodComputation[$pos + 1]/RegularTaxableIncomeAdjAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<div style="text-align:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" 
															select="$Form8697Data/SimplifiedMethodComputation[$pos + 2]/RegularTaxableIncomeAdjAmt"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
														select="$Form8697Data/SimplifiedMethodComputation[$pos + 2]/RegularTaxableIncomeAdjAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="background-color:lightgrey;width:29mm;border-bottom:none"/>
										</tr>
										<!-- Line 2 -->
										<tr class="styDepTblRow2">
											<td class="styDepTblCell" style="width:4mm;text-align:center;font-weight:bold;border-right:none;">2</td>
											<td class="styDepTblCell" style="width:67mm;text-align:left;border-left:none;">
												Increase or decrease in regular tax for prior years. Multiply
												line 1 in each column by the applicable regular tax rate (see instructions)
												<!--<span style="letter-spacing:4mm;">....</span>-->
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
													select="$Form8697Data/SimplifiedMethodComputation[$pos]/PriorYearRegTaxIncrOrDecrAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
														select="$Form8697Data/SimplifiedMethodComputation[$pos + 1]/PriorYearRegTaxIncrOrDecrAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
														select="$Form8697Data/SimplifiedMethodComputation[$pos + 2]/PriorYearRegTaxIncrOrDecrAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="background-color:lightgrey;width:29mm;border-top:none;border-bottom:none"/>
										</tr>
										<!-- Line 3 -->
										<tr class="styDepTblRow1">
											<td class="styDepTblCell" style="width:4mm;text-align:center;font-weight:bold;border-right:none;padding-top:10.5mm;">3</td>
											<td class="styDepTblCell" style="width:67mm;text-align:left;border-left:none;">
												<span style="font-weight:bold;">Note.</span>
												<span style="width:1mm;"/>
												For prior years beginning before 1987, skip lines 3 and 4 and enter on line 5 the amount from line 2.
												<br/>Adjustment to alternative minimum taxable income to
												reflect the difference between: <span style="font-weight:bold;">(a)</span> the amount of such
												income required to be allocated for post-February 1986
												contracts completed or adjusted during the tax year based
												on <span style="font-weight:bold;">actual</span> contract price and costs, and <span style="font-weight:bold;">(b)</span> 
												the amount of such income reported for such contracts based on
												<span style="font-weight:bold;">estimated</span> contract price and costs. See instructions and attach a schedule 
												listing each separate contract, unless you were an owner of an interest in a pass-through entity reporting this amount 
												from Schedule K-1 or a similar statement 
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<div style="text-align:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" 
															select="$Form8697Data/SimplifiedMethodComputation[$pos]/AltMinTaxableIncomeAdjAmt"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$pos]/AltMinTaxableIncomeAdjAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<div style="text-align:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" 
															select="$Form8697Data/SimplifiedMethodComputation[$pos + 1]/AltMinTaxableIncomeAdjAmt"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
														select="$Form8697Data/SimplifiedMethodComputation[$pos + 1]/AltMinTaxableIncomeAdjAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<div style="text-align:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" 
															select="$Form8697Data/SimplifiedMethodComputation[$pos + 2]/AltMinTaxableIncomeAdjAmt"/>
													</xsl:call-template>
												</div>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
													select="$Form8697Data/SimplifiedMethodComputation[$pos + 2]/AltMinTaxableIncomeAdjAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="background-color:lightgrey;width:29mm;border-top:none;border-bottom:none"/>
										</tr>
										<!-- Line 4 -->
										<tr class="styDepTblRow2">
											<td class="styDepTblCell" style="width:4mm;text-align:center;font-weight:bold;border-right:none;padding-top:10.5mm;">4</td>
											<td class="styDepTblCell" style="width:67mm;text-align:left;border-left:none;">
												<span style="font-weight:bold;">Note.</span>
												<span style="width:1mm;"/>
												For tax years beginning after 2017, the alternative minimum tax for corporations has been repealed.
												<br/>
												Increase or decrease in alternative minimum tax (AMT) for
												prior years. Multiply line 3 in each column by the applicable
												AMT rate (see instructions).
												<span style="width:2mm;"/>
												<!--<span style="letter-spacing:4mm;">......</span>-->
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$pos]/PriorYearAMTIncrOrDecrAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
														select="$Form8697Data/SimplifiedMethodComputation[$pos + 1]/PriorYearAMTIncrOrDecrAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
														select="$Form8697Data/SimplifiedMethodComputation[$pos + 2]/PriorYearAMTIncrOrDecrAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="background-color:lightgrey;width:29mm;border-top:none;border-bottom:none"/>
										</tr>
										<!-- Part II Line 5 -->
										<tr class="styDepTblRow1">
											<td class="styDepTblCell" style="width:4mm;text-align:center;font-weight:bold;border-right:none;">5</td>
											<td class="styDepTblCell" style="width:67mm;text-align:left;border-left:none;">          
												Enter the <span style="font-weight:bold;">larger</span> of line 2 or line 4. See instructions if either amount is negative.
												<span style="width:2mm;"/>
												<!--<span style="letter-spacing:4mm;">.....</span>-->
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
													select="$Form8697Data/SimplifiedMethodComputation[$pos]/AdjustmentToTaxableIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
														select="$Form8697Data/SimplifiedMethodComputation[$pos + 1]/AdjustmentToTaxableIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
														select="$Form8697Data/SimplifiedMethodComputation[$pos + 2]/AdjustmentToTaxableIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="background-color:lightgrey;width:29mm;border-top:none;border-bottom:none"/>
										</tr>
										<!-- Line 6 -->
										<tr class="styDepTblRow2">
											<td class="styDepTblCell" style="width:4mm;text-align:center;font-weight:bold;border-right:none;padding-top:7.5mm">6</td>
											<td class="styDepTblCell" style="width:67mm;text-align:left;border-left:none;">
												<span style="font-weight:bold;">Pass-through entities:</span>
												<span style="width:2px;"/>
												<i>Skip line 6 and enter on line 7 the amount from line 5.</i>
												<br/>
												Overpayment ceiling. For each column in which line 5 is a
												negative number, enter your total tax liability for the prior
												year, as adjusted for past applications of the look-back
												method and after net operating loss, capital loss, net
												section 1256 contracts loss, and credit carryovers and
												carrybacks to that year. For each column in which line 5 is
												a positive number, leave line 6 blank and enter on line 7
												the amount from line 5
												<span style="letter-spacing:4mm;">...</span>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$pos]/OverpaymentCeilingAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$pos + 1]/OverpaymentCeilingAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$pos + 2]/OverpaymentCeilingAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="background-color:lightgrey;width:29mm;border-top:none;border-bottom:none"/>
										</tr>
										<!-- Line 7 -->
										<tr class="styDepTblRow1">
											<td class="styDepTblCell" style="width:4mm;text-align:center;font-weight:bold;border-right:none;">7</td>
											<td class="styDepTblCell" style="width:67mm;text-align:left;border-left:none;">
												Increase or decrease in tax for the prior years on which
												interest is due (or is to be refunded). Enter the amount from
												line 5 or line 6, whichever is smaller. Treat both numbers
												as positive when making this comparison, but enter the
												amount as a negative number.
												<span style="width:2mm;"/>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
														select="$Form8697Data/SimplifiedMethodComputation[$pos]/IncreaseOrDecreaseInTxForPYAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
														select="$Form8697Data/SimplifiedMethodComputation[$pos + 1]/IncreaseOrDecreaseInTxForPYAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
														select="$Form8697Data/SimplifiedMethodComputation[$pos + 2]/IncreaseOrDecreaseInTxForPYAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="background-color:lightgrey;width:29mm;border-top:none"/>
										</tr>
										<!-- Line 8 -->
										<tr class="styDepTblRow2">
											<td class="styDepTblCell" style="width:4mm;text-align:center;font-weight:bold;border-right:none;">8</td>
											<td class="styDepTblCell" style="width:67mm;text-align:left;border-left:none;">
												Interest due on increase, if any, shown on line 7 (see instructions)<span style="width:2mm;"/>
												<span style="letter-spacing:4mm;">...</span>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$pos]/InterestDueOnIncreaseAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
													select="$Form8697Data/SimplifiedMethodComputation[$pos + 1]/InterestDueOnIncreaseAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
													select="$Form8697Data/SimplifiedMethodComputation[$pos + 2]/InterestDueOnIncreaseAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<span style="width:1mm;"/>
												<!-- If this is the first Part II Table, then display the total amounts in the (d) column -->
												<xsl:if test="$pos = 1">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8697Data/TotLookBackSmplfdMthGrp/TotalInterestDueOnIncreaseAmt"/>
													</xsl:call-template>
												</xsl:if>
											</td>
										</tr>
										<!-- Line 9 -->
										<tr class="styDepTblRow1">
											<td class="styDepTblCell" style="width:4mm;text-align:center;font-weight:bold;border-right:none;">9</td>
											<td class="styDepTblCell" style="width:67mm;text-align:left;border-left:none;">
												Interest to be refunded on decrease, if any, shown on
												line 7 (see instructions)<span style="width:px;"/>
												<!--<span style="letter-spacing:4mm;">.......</span>-->
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
													select="$Form8697Data/SimplifiedMethodComputation[$pos]/InterestToBeRefundedOnDecrAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
														select="$Form8697Data/SimplifiedMethodComputation[$pos + 1]/InterestToBeRefundedOnDecrAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" 
														select="$Form8697Data/SimplifiedMethodComputation[$pos + 2]/InterestToBeRefundedOnDecrAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="text-align:right;vertical-align:bottom;width:29mm">
												<span style="width:1mm;"/>
												<!-- If this is the first Part II Table, then display the amounts in the (d) column -->
												<xsl:if test="$pos = 1">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$Form8697Data/TotLookBackSmplfdMthdGrp/TotalInterestToBeRefundedAmt"/>
													</xsl:call-template>
												</xsl:if>
											</td>
										</tr>
									</tbody>
								</table>
								<br/>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>
					<!-- End of Part II separated data -->
				</form>
			</body>
		</html>
	</xsl:template>
	<!-- Part I Separated Additional Data Table -->
	<xsl:template name="Pt1AddlTbl">
		<xsl:param name="index" select="1"/>
		<xsl:param name="Pt1AddlTblMax"/>
		<xsl:if test="$index &lt;= $Pt1AddlTblMax">
						<span class="styRepeatingDataTitle">
							<br/>Form 8697, Part I - Regular Method:
						</span>
			<table class="styDepTbl" style="width:187mm;" id="TP1ctn">
				<xsl:call-template name="SetInitialState"/>
				<table class="styDepTbl" cellspacing="0" style="width:187mm;border-top-width:1px;font-size:7pt;border-style: solid; border-color: black;
                   border-bottom-width:0px;border-left-width:0px;border-right-width: 1px;page-break-inside: avoid">
									<thead class="styTableThead">
										<tr class="styDepTblHdr">
											<th class="styDepTblCell" rowspan="1" scope="col" style="width:7mm;border-right:none;">
												<span style="width:1px;"/>
											</th>
											<th class="styDepTblCell" rowspan="1" scope="col" style="width:80mm;border-left:none;">
												<span style="width:1px;"/>
											</th>
											<th class="styDepTblCell" colspan="1" scope="col" style="width:29mm;text-align:center;">
											  Filing Year
											</th>
											<th class="styDepTblCell" colspan="2" scope="col" style="width:67mm;">
												Redetermination Years
											</th>
											<th class="styDepTblCell" rowspan="1" scope="col" style="width:29mm;border-left:none;">
												<span style="width:1px;"/>
											</th>
										</tr>
									</thead>
					<!-- Part 1 Line 1 Dates -->
					<tr class="styDepTblRow1" style="height:34mm">
						<td class="styDepTblCell" rowspan="2" style="width:4mm;text-align:center;font-weight:bold;border-right:none;">1</td>
						<td class="styDepTblCell" rowspan="2" style="width:67mm;text-align:left;border-left:none;">
							Taxable income or loss for the prior years shown on tax
							return (or as previously adjusted) before net operating loss
							or capital loss carrybacks (other than carrybacks that must
							be taken into account to properly compute interest under
							section 460) (see instructions). If you were
							required to file Form 8697 for an earlier year, enter adjusted
							taxable income for the prior years from line 3, Form 8697,
							for the most recent filing year that affects the prior years.
						</td>
						<td class="styTableCell" rowspan="1" style="width:29mm;text-align:center;font-weight:bold;border-color:black">
							<span style="text-align:center;width:29mm;font-weight:normal">Year ended</span>
							<span style="float:left;clear:all;width:29mm;font-weight:normal">mo
						    <span class="styFixedUnderline" style="width:5mm;float:none;padding-bottom:0;">
								<!-- Rem'd out 20171031 to force Separated Mode to look like Inline Mode. gdy -->
								<!--<xsl:if test="$index=1">
									<xsl:call-template name="PopulateMonth">
										<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodFilingYrGrp/YearEndedDt"/>
									</xsl:call-template>
									--><!--<xsl:choose>
										<xsl:when test="substring($Form8697Data/RegularMethodFilingYrGrp/YearEndedDt,6,7)=''"/>
										<xsl:otherwise>
											<xsl:value-of select="substring($Form8697Data/RegularMethodFilingYrGrp/YearEndedDt,6,7)"/>
										</xsl:otherwise>
									</xsl:choose>--><!--
								</xsl:if>-->
								</span>
								<span style="width:1mm;"/>yr.
								<span class="styFixedUnderline" style="width:8mm;float:none;padding-bottom:0;">
								<!-- Rem'd out 20171031 to force Separated Mode to look like Inline Mode. gdy -->
								<!--<xsl:if test="$index=1">	
									<xsl:call-template name="PopulateYear">
										<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodFilingYrGrp/YearEndedDt"/>
									</xsl:call-template>
								--><!--	<xsl:choose>
										<xsl:when test="substring($Form8697Data/RegularMethodFilingYrGrp/YearEndedDt,1,4)=''"/>
										<xsl:otherwise>
											<xsl:value-of select="substring($Form8697Data/RegularMethodFilingYrGrp/YearEndedDt,1,4)"/>
										</xsl:otherwise>
									</xsl:choose>--><!--
								</xsl:if >-->
								</span>
							</span>
						</td>
						<td class="styTableCell" rowspan="1" style="width:29mm;text-align:center;font-weight:bold;border-color:black">
							<xsl:if test="$index &lt;= 1">(a)</xsl:if>
							<span style="text-align:center;width:29mm;font-weight:normal">Year ended</span>
							<span style="float:left;clear:all;width:29mm;font-weight:normal">mo
								<span class="styFixedUnderline" style="width:5mm;float:none;padding-bottom:0;">
									<xsl:call-template name="PopulateMonth">
										<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*2-1]/YearEndedDt"/>
									</xsl:call-template>
								</span>
								<span style="width:1mm;"/>yr.
								<span class="styFixedUnderline" style="width:8mm;float:none;padding-bottom:0;">
									<xsl:call-template name="PopulateYear">
										<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*2-1]/YearEndedDt"/>
									</xsl:call-template>
								</span>
							</span>
						</td>
						<td class="styTableCell" rowspan="1" style="width:29mm;text-align:center;font-weight:bold;border-color:black;">
							<xsl:if test="$index &lt;= 1">(b)</xsl:if>
							<span style="text-align:center;width:29mm;font-weight:normal">Year ended</span>
							<span style="float:left;clear:all;width:29mm;font-weight:normal">mo
								<span class="styFixedUnderline" style="width:5mm;float:none;padding-bottom:0;">
									<xsl:call-template name="PopulateMonth">
										<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*2]/YearEndedDt"/>
									</xsl:call-template>
								</span>
								<span style="width:1mm;"/>yr.
								<span class="styFixedUnderline" style="width:8mm;float:none;padding-bottom:0;">
									<xsl:call-template name="PopulateYear">
										<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*2]/YearEndedDt"/>
									</xsl:call-template>
								</span>
							</span>
						</td>
						<td class="styTableCell" rowspan="1" style="width:29mm;text-align:center;border-color:black;border-right:none">
							<span style="font-weight:bold;">
								<xsl:if test="$index &lt;= 1">(c)</xsl:if>
							</span>
							<br/>
							<span style="text-align:center;width:20mm;">Totals</span>
							<span style="float:left;clear:all;width:29mm;font-weight:normal">
								(Add columns (a)
							</span>
							<span style="float:left;clear:all;width:29mm;font-weight:normal">
								and (b).)
							</span>
						</td>
					</tr>
					<!-- Part 1 Line 1 Amounts -->
					<tr class="styDepTblRow1" style="">
						<!-- Rem'd out 20171031 to force Separated Mode to look like Inline Mode. gdy -->
						<!--<xsl:choose>
							<xsl:when test="$index=1">
								<td class="styDepTblCell" rowspan="1" nowrap="nowrap;">
									<xsl:if test="$index=0 and $Pt1AddlTblMax=0">
										<xsl:call-template name="PopulateAdditionalDataTableMessage">
											<xsl:with-param name="TargetNode" select="$Form8697Data/TaxableIncomeOrLossAmt"/>
											<xsl:with-param name="ShortMessage" select="'true'"/>
										</xsl:call-template>
									</xsl:if>	
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodFilingYrGrp/TaxableIncomeOrLossAmt"/>
										</xsl:call-template>
								</td>
							</xsl:when>
							<xsl:otherwise>
									<td class="styForm8697TableCellEmptyGray" rowspan="1" style="border-right:1px;border-color:black;border-style:solid;">
										<span style="width:1px;"/>	
									</td>
							</xsl:otherwise>
						</xsl:choose>-->
						<td class="styForm8697TableCellEmptyGray" rowspan="1" style="border-right:1px;border-color:black;border-style:solid;">
							<span style="width:1px;"/>	
						</td>
						<td class="styDepTblCell " rowspan="1" nowrap="nowrap;" style="border-right:1px;border-color:black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*2-1]/TaxableIncomeOrLossAmt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" rowspan="1" nowrap="nowrap;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*2]/TaxableIncomeOrLossAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCellEmptyGray" rowspan="1">
							<span style="width:1mm;"/>
						</td>
					</tr>
					<!-- Part 1 Line 2 Amounts -->
					<tr class="styDepTblRow2" style="height:34mm">
						<td class="styDepTblCell" style="width:4mm;text-align:center;font-weight:bold;border-right:none;">2</td>
						<td class="styDepTblCell" style="width:67mm;text-align:left;border-left:none;">
							Adjustment to income to reflect the difference between:
							<span style="font-weight:bold;">(a)</span> the amount of income required to be allocated for
							post-February 1986 contracts completed or adjusted
							during the tax year based on the <span style="font-weight:bold;">actual</span> contract price and
							costs, and <span style="font-weight:bold;">(b)</span> the amount of income reported for such
							contracts based on <span style="font-weight:bold;">estimated</span> contract price and costs.
							See instructions and attach a schedule listing each separate contract, unless you were an owner of an
							interest in a pass-through entity reporting this amount from Schedule K-1 or a similar statement.
							<!-- Form Link to Additional Data -->
							<!-- Form Link has been removed here and placed in each individual cell.  As the push pin is hiding some characters when tested 
								with maximum digits placed a break next to it,as the space is already scarce -->
							<!--<span style="width:2mm;"/>-->
							<!--<span style="letter-spacing:4mm;">.</span>-->
						</td>
						<!-- Rem'd out 20171031 to force Separated Mode to look like Inline Mode. gdy -->
						<!--<xsl:choose >
							<xsl:when test="$index=1">
								<td class="styDepTblCell" rowspan="1" nowrap="nowrap;" style="vertical-align:bottom;text-align:right;width:29mm">
									<div style= "text-align:left">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp/IncomeAdjustmentAmt"/>
										</xsl:call-template>
									</div>
									<br/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp/IncomeAdjustmentAmt"/>
									</xsl:call-template>
								</td>
							</xsl:when>
							<xsl:otherwise>
								<td class="styForm8697TableCellEmptyGray" rowspan="1" style="border-right:1px;border-color:black;border-style:solid;">
									<span style="width:1px;"/>	
								</td>				
							</xsl:otherwise>
						</xsl:choose>-->
						<td class="styForm8697TableCellEmptyGray" rowspan="1" style="border-right:1px;border-color:black;border-style:solid;">
							<span style="width:1px;"/>	
						</td>			
					
						<td class="styDepTblCell" rowspan="1" nowrap="nowrap;" style="vertical-align:bottom;text-align:right;width:29mm">
							<div style="text-align:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*2-1]/IncomeAdjustmentAmt"/>
								</xsl:call-template>
							</div>
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*2-1]/IncomeAdjustmentAmt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" rowspan="1" nowrap="nowrap;" style="vertical-align:bottom;text-align:right;width:29mm">
							<div style="text-align:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*2]/IncomeAdjustmentAmt"/>
								</xsl:call-template>
							</div>
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*2]/IncomeAdjustmentAmt"/>
							</xsl:call-template>
						</td>
						
					<xsl:choose>
						<xsl:when test="$index = $Pt1AddlTblMax">
						<td class="styForm8697TableCell" rowspan="1" style="border-right:0px;border-top:1px;border-color:black;border-style:solid">
							
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8697Data/TotLookBackRegularMethodGrp/TotalAdjustmentToIncomeAmt"/>
									</xsl:call-template>
						</td>
						</xsl:when>
						<xsl:otherwise>
							<td class="styForm8697TableCellEmptyGray" rowspan="1" style="border-right:0px;border-color:black;border-style:solid;">
									<span style="width:1px;"/>	
								</td>			
						</xsl:otherwise>
					</xsl:choose>
				</tr>
					<!-- Part 1 - Line 3 -->
					<tr class="styDepTblRow1">
						<td class="styDepTblCell" style="width:4mm;text-align:center;font-weight:bold;border-right:none;">3</td>
						<td class="styDepTblCell" style="width:67mm;text-align:left;border-left:none;">
						  Adjusted taxable income for look-back purposes. Combine lines 1 and 2.  If line 3 is a negative amount, see instructions.
						</td>
						<!-- Rem'd out 20171031 to force Separated Mode to look like Inline Mode. gdy -->
						<!--<xsl:choose>
							<xsl:when test="$index=1">
								<td class="styDepTblCell" rowspan="1" style="text-align:right;vertical-align:bottom;width:29mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodFilingYrGrp/AdjTaxableIncomeLookBackAmt"/>
										</xsl:call-template>
								</td>
							</xsl:when>
							<xsl:otherwise>
								<td class="styForm8697TableCellEmptyGray" rowspan="1" style="border-right:1px;border-color:black;border-style:solid;">
									<span style="width:1px;"/>	
								</td>				
							</xsl:otherwise>
						</xsl:choose>-->
						<td class="styForm8697TableCellEmptyGray" rowspan="1" style="border-right:1px;border-color:black;border-style:solid;">
							<span style="width:1px;"/>	
						</td>
						
						<td class="styDepTblCell" rowspan="1" style="text-align:right;vertical-align:bottom;width:29mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*2-1]/AdjTaxableIncomeLookBackAmt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" rowspan="1" style="text-align:right;vertical-align:bottom;width:29mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*2]/AdjTaxableIncomeLookBackAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCellEmptyGray" rowspan="1">
							<span style="width:1px;"/>
						</td>
					</tr>
					<!-- Part 1 - Line 4 -->
					<tr class="styDepTblRow2">
						<td class="styDepTblCell" style="width:4mm;text-align:center;font-weight:bold;border-right:none;">4</td>
						<td class="styDepTblCell" style="width:67mm;text-align:left;border-left:none;">
							  Income tax liability on line 3 amount using tax rates in effect
							  for the prior years (see instructions)
							  <span style="width:2mm;"/>
							<span style="letter-spacing:4mm;">...</span>
						</td>
						<!-- Rem'd out 20171031 to force Separated Mode to look like Inline Mode. gdy -->
						<!--<xsl:choose>
							<xsl:when test="$index=1">
									<td class="styDepTblCell" rowspan="1" style="text-align:right;vertical-align:bottom;width:29mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodFilingYrGrp/TaxLiabilityAmt"/>
										</xsl:call-template>
									</td>
							</xsl:when>
							<xsl:otherwise>
								<td class="styForm8697TableCellEmptyGray" rowspan="1" style="border-right:1px;border-color:black;border-style:solid;">
								<span style="width:1px;"/>
							</td>
							</xsl:otherwise>
						</xsl:choose>-->
						<td class="styForm8697TableCellEmptyGray" rowspan="1" style="border-right:1px;border-color:black;border-style:solid;">
							<span style="width:1px;"/>
						</td>
						
						<td class="styDepTblCell" rowspan="1" style="text-align:right;vertical-align:bottom;width:29mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*2-1]/TaxLiabilityAmt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" rowspan="1" style="text-align:right;vertical-align:bottom;width:29mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*2]/TaxLiabilityAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCellEmptyGray" rowspan="1">
							<span style="width:1px;"/>
						</td>
					</tr>
					<!-- Part 1 - Line 5 -->
					<tr class="styDepTblRow1">
						<td class="styDepTblCell" style="width:4mm;text-align:center;font-weight:bold;border-right:none;">5</td>
						<td class="styDepTblCell" style="width:67mm;text-align:left;border-left:none;">
							  Income tax liability shown on return (or as previously
							  adjusted) for the prior years (see instructions).
							  If you were required to file Form 8697 for an earlier year,
							  enter the amount required to be reported on line 4, Form
							  8697, for the most recent filing year that affects the prior
							  years <span style="width:2mm;"/>
							<span style="letter-spacing:4mm;">........</span>
						</td>
						<td class="styForm8697TableCellEmptyGray" rowspan="1" style="border-right:1px;border-color:black;border-style:solid;">
							<span style="width:1px;"/>
						</td>
						<td class="styDepTblCell" rowspan="1" style="text-align:right;vertical-align:bottom;width:29mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*2-1]/FederalIncomeTaxLiabilityAmt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" rowspan="1" style="text-align:right;vertical-align:bottom;width:29mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*2]/FederalIncomeTaxLiabilityAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCellEmptyGray" rowspan="1">
							<span style="width:1px;"/>
						</td>
					</tr>
					<!-- Part 1 - Line 6 -->
					<tr class="styDepTblRow2">
						<td class="styDepTblCell" style="width:4mm;text-align:center;font-weight:bold;border-right:none;">6</td>
						<td class="styDepTblCell" style="width:67mm;text-align:left;border-left:none;">
							  Increase or decrease in tax for the prior years on which
							  interest is due (or is to be refunded). Subtract line 5 from
							  line 4.
							  <span style="width:4mm;"/>
							<span style="letter-spacing:4mm;">.</span>
						</td>
						<td class="styForm8697TableCellEmptyGray" rowspan="1" style="text-align:right;vertical-align:bottom;width:29mm">
							<span style="width:1px;"/>
						</td>
						<td class="styDepTblCell" rowspan="1" style="text-align:right;vertical-align:bottom;width:29mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*2-1]/IncreaseOrDecreaseInTxForPYAmt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" rowspan="1" style="text-align:right;vertical-align:bottom;width:29mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*2]/IncreaseOrDecreaseInTxForPYAmt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" rowspan="1" style="width:29mm;background-color:lightgrey;border-right:none;">
							<span style="width:1px;"/>
						</td>
					</tr>
					<!-- Part 1 - Line 7 -->
					<tr class="styDepTblRow1">
						<td class="styDepTblCell" style="width:4mm;text-align:center;font-weight:bold;border-right:none;">7</td>
						<td class="styDepTblCell" style="width:67mm;text-align:left;border-left:none;">
							  Interest due on increase, if any, shown on line 6 (see instructions)
							  <span style="width:4mm;"/>
							<span style="letter-spacing:4mm;">.</span>
						</td>
						<td class="styForm8697TableCellEmptyGray" rowspan="1" style="border-right:1px;border-color:black;border-style:solid;">
							<span style="width:1px;"/>
						</td>
						<td class="styDepTblCell" rowspan="1" style="text-align:right;vertical-align:bottom;width:29mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*2-1]/InterestDueOnIncreaseAmt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" rowspan="1" style="text-align:right;vertical-align:bottom;width:29mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*2]/InterestDueOnIncreaseAmt"/>
							</xsl:call-template>
						</td>
							<xsl:choose>
								<xsl:when test="$index = $Pt1AddlTblMax">	
								<td class="styDepTblCell" rowspan="1" style="border-right:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8697Data/TotLookBackRegularMethodGrp/TotalInterestDueOnIncreaseAmt"/>
									</xsl:call-template>
								</td>
								</xsl:when>
								<xsl:otherwise>
									<td class="styForm8697TableCellEmptyGray" rowspan="1" style="border-right:1px;border-color:black;">
									<span style="width:1px;"/>	
								</td>	
								</xsl:otherwise>
							</xsl:choose>
					</tr>
					<!-- Part 1 - Line 8 -->
					<tr class="styDepTblRow2">
						<td class="styDepTblCell" style="width:4mm;text-align:center;font-weight:bold;border-right:none;">8</td>
						<td class="styDepTblCell" style="width:67mm;text-align:left;border-left:none;">
							  Interest to be refunded on decrease, if any, shown on
							  line 6 (see instructions)
							  <span style="width:2mm;"/>
							<!--<span style="letter-spacing:4mm;">........</span>-->
						</td>
						<td class="styForm8697TableCellEmptyGray" rowspan="1" style="border-right:1px;border-bottom:1px;border-color:black;border-style:solid;">
							<span style="width:1px;"/>
						</td>
						<td class="styDepTblCell" rowspan="1" style="text-align:right;vertical-align:bottom;width:29mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*2-1]/InterestToBeRefundedOnDecrAmt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" rowspan="1" style="text-align:right;vertical-align:bottom;width:29mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*2]/InterestToBeRefundedOnDecrAmt"/>
							</xsl:call-template>
						</td>
						<xsl:choose>
							<xsl:when test="$index = $Pt1AddlTblMax">						
							<td class="styDepTblCell" rowspan="1" style="border-right:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8697Data/TotLookBackRegularMethodGrp/TotalInterestToBeRefundedAmt"/>
									</xsl:call-template>
							</td>		
							</xsl:when>
							<xsl:otherwise>
									<td class="styForm8697TableCellEmptyGray" rowspan="1" style="border-right:0px;border-bottom:1px;border-color:black;border-style:solid;">
									<span style="width:1px;"/>	
									</td>	
							</xsl:otherwise>
						</xsl:choose>
					</tr>
				</table>
				<xsl:if test="$index != $Pt1AddlTblMax">
				<!--<xsl:choose>
						<xsl:when test="$index = 1">					
							<div class="pageEnd" style="page-break-after:always"/>
						</xsl:when>
						<xsl:otherwise>
							<div class="pageEnd" style="page-break-after:always"/>
						</xsl:otherwise>
					</xsl:choose>-->
					<div class="pageEnd" style="page-break-after:always"/>
					<br/>
					<!--<div style="width:187mm;">
						<span style="width:64mm;float:left;clear:none;"/>
						<span style="width:123.5mm;float:right;clear:none;border-bottom:1px solid black"/>
					</div>-->
				</xsl:if>
				<xsl:call-template name="Pt1AddlTbl">
					<xsl:with-param name="index" select="$index+1"/>
					<xsl:with-param name="Pt1AddlTblMax" select="$Pt1AddlTblMax"/>
				</xsl:call-template>
			</table>
					  <!--<div class="pageEnd"/>
					<div style="page-break-after:always"/>-->
		</xsl:if>
	</xsl:template>
	<!--Part I recurring table -->
	<xsl:template name="part1Table">
		<xsl:param name="index" select="1"/>
		<xsl:param name="Part1Max"/>
		<xsl:if test="$index &lt;= $Part1Max">
			<table style="width:187mm;" id="TP1ctn">
				<xsl:call-template name="SetInitialState"/>
				<table cellspacing="0" 
				style="width:187mm;border-top-width:0px;font-size:7pt;border-style: solid; border-color: black; border-bottom-width:0px;border-left-width:0px;
				border-right-width: 0px;page-break-inside: avoid;">
					<tr>
						<th class="styTableCell" rowspan="1" style="width:7mm;text-align:center;border-color:black;border-right:none;border-bottom:none;">
							<span style="width:1px;"/>
						</th>
						<th class="styTableCell" rowspan="1" style="width:80mm;text-align:left;border-color:black;border-bottom:none;">
							<span style="width:1px;"/>
						</th>
						<th class="styTableCell" rowspan="1" style="width:29mm;height:7mm;text-align:center;font-weight:normal;border-top-width:0px;border-color:black;">
						  Filing Year
						</th>
						<th class="styTableCell" colspan="2" style="width:67mm;text-align:center;font-weight:normal;border-top-width:0px;border-color:black;">
						  Redetermination Years
						</th>
						<th class="styTableCell" rowspan="1" 
							style="width:29mm;text-align:center;border-top-width:0px;border-color:black;border-right:none;border-bottom:none;">
							<!--<span style="float:left;width:1px;"/>-->
						</th>
					</tr>
					<!-- Part 1 - Line 1 Years -->
					<tr style="height:30mm">
						<th class="styTableCell" rowspan="2" 
						style="width:7mm;text-align:center;vertical-align:top;font-weight:bold;border-color:black;border-right:none;border-bottom:none;">1</th>
						<th class="styForm8697TableCellDescription" rowspan="2" style="font-weight:normal;">
						 Taxable income or loss for the prior years shown on tax
						  return (or as previously adjusted) before net operating loss
						  or capital loss carrybacks (other than carrybacks that must
						  be taken into account to properly compute interest under
						  section 460) (see instructions). If you were
						  required to file Form 8697 for an earlier year, enter adjusted
						  taxable income for the prior years from line 3, Form 8697,
						  for the most recent filing year that affects the prior years.  
							<span style="width:2mm;"/>
							<span style="letter-spacing:4mm;">...</span>
						</th>
						<td class="styTableCell" rowspan="1" style="width:29mm;text-align:center;font-weight:bold;border-color:black;">
							<span style="text-align:center;width:29mm;font-weight:normal">Year ended</span>
							<span style="float:left;clear:all;width:29mm;font-weight:normal">mo
						    <span class="styFixedUnderline" style="width:5mm;float:none;padding-bottom:0;">
								<xsl:if test="$index=1">
									<xsl:call-template name="PopulateMonth">
										<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodFilingYrGrp/YearEndedDt"/>
									</xsl:call-template>
									<!--<xsl:choose>
										<xsl:when test="substring($Form8697Data/RegularMethodFilingYrGrp/YearEndedDt,6,7)=''"/>
										<xsl:otherwise>
											<xsl:value-of select="substring($Form8697Data/RegularMethodFilingYrGrp/YearEndedDt,6,7)"/>
										</xsl:otherwise>
									</xsl:choose>-->
								</xsl:if>
								</span>
								<span style="width:1mm;"/>yr.
								<span class="styFixedUnderline" style="width:8mm;float:none;padding-bottom:0;">
								<xsl:if test="$index=1">	
									<xsl:call-template name="PopulateYear">
										<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodFilingYrGrp/YearEndedDt"/>
									</xsl:call-template>
								<!--	<xsl:choose>
										<xsl:when test="substring($Form8697Data/RegularMethodFilingYrGrp/YearEndedDt,1,4)=''"/>
										<xsl:otherwise>
											<xsl:value-of select="substring($Form8697Data/RegularMethodFilingYrGrp/YearEndedDt,1,4)"/>
										</xsl:otherwise>
									</xsl:choose>-->
								</xsl:if >
								</span>
							</span>
						</td>
						<td class="styTableCell" rowspan="1" style="width:29mm;text-align:center;font-weight:bold;border-color:black;">
							<xsl:if test="$index &lt;= 1">(a)</xsl:if>
							<span style="text-align:center;width:29mm;font-weight:normal">Year ended</span>
							<span style="float:left;clear:all;width:29mm;font-weight:normal">mo
								<span class="styFixedUnderline" style="width:5mm;float:none;padding-bottom:0;">
									<xsl:call-template name="PopulateMonth">
										<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*2-1]/YearEndedDt"/>
									</xsl:call-template>
								</span>
								<span style="width:1mm;"/>yr.
								<span class="styFixedUnderline" style="width:8mm;float:none;padding-bottom:0;">
									<xsl:call-template name="PopulateYear">
										<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*2-1]/YearEndedDt"/>
									</xsl:call-template>
								</span>
							</span>
						</td>
						<td class="styTableCell" rowspan="1" style="width:29mm;text-align:center;font-weight:bold;border-color:black;">
							<xsl:if test="$index &lt;= 1">(b)</xsl:if>
							<span style="text-align:center;width:29mm;font-weight:normal">Year ended</span>
							<span style="float:left;clear:all;width:29mm;font-weight:normal">mo
								<span class="styFixedUnderline" style="width:5mm;float:none;padding-bottom:0;">
									<xsl:call-template name="PopulateMonth">
										<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*2]/YearEndedDt"/>
									</xsl:call-template>
								</span>
								<span style="width:1mm;"/>yr.
								<span class="styFixedUnderline" style="width:8mm;float:none;padding-bottom:0;">
									<xsl:call-template name="PopulateYear">
										<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*2]/YearEndedDt"/>
									</xsl:call-template>
								</span>
							</span>
						</td>
						<td class="styTableCell" rowspan="1" style="width:29mm;text-align:center;border-color:black;border-right:none">
							<span style="font-weight:bold;">
								<xsl:if test="$index &lt;= 1">(c)</xsl:if>
							</span>
							<br/>
							<span style="text-align:center;width:20mm;">Totals</span>
							<span style="float:left;clear:all;width:29mm;font-weight:normal">
								(Add columns (a)
							</span>
							<span style="float:left;clear:all;width:29mm;font-weight:normal">
								and (b).)
							</span>
						</td>
					</tr>
					<tr>
					<!-- Part 1 - Line 1 Amounts -->
					<xsl:choose>
						<xsl:when test="$index=1">
							<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
								<xsl:if test="$index=0 and $Part1Max=0">
									<xsl:call-template name="PopulateAdditionalDataTableMessage">
										<xsl:with-param name="TargetNode" select="$Form8697Data/TaxableIncomeOrLossAmt"/>
										<xsl:with-param name="ShortMessage" select="'true'"/>
									</xsl:call-template>
								</xsl:if>	
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodFilingYrGrp/TaxableIncomeOrLossAmt"/>
									</xsl:call-template>
							</td>
						</xsl:when>
						<xsl:otherwise>
								<td class="styForm8697TableCellEmptyGray" rowspan="1" style="border-right:1px;border-color:black;border-style:solid;">
									<span style="width:1px;"/>	
								</td>
						</xsl:otherwise>
					</xsl:choose>
						<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*2-1]/TaxableIncomeOrLossAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*2]/TaxableIncomeOrLossAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCellEmptyGray" rowspan="1">
							<span style="width:1mm;"/>
						</td>
					</tr>
					<!-- Part 1 - Line 2 -->
					<tr style="height:34mm">
						<td class="styForm8697TableCellNumber" rowspan="1">2</td>
						<td class="styForm8697TableCellDescription" rowspan="1">
							  Adjustment to income to reflect the difference between:
							  <span style="font-weight:bold;">(a)</span> the amount of income required to be allocated for
							  post-February 1986 contracts completed or adjusted
							  during the tax year based on the <span style="font-weight:bold;">actual</span> contract price and
							  costs, and <span style="font-weight:bold;">(b)</span> the amount of income reported for such
							  contracts based on <span style="font-weight:bold;">estimated</span> contract price and costs.
							  See instructions and attach a schedule listing each separate contract, unless you were an owner of an
							  interest in a pass-through entity reporting this amount from Schedule K-1 or a similar statement.
							<!-- Form Link to Additional Data -->
							<!-- Form Link has been removed here and placed in each individual cell.  As the push pin is hiding some characters when tested 
								with maximum digits placed a break next to it,as the space is already scarce -->
							<span style="width:2mm;"/>
							<!--<span style="letter-spacing:4mm;">.</span>-->
						</td>
						<xsl:choose >
							<xsl:when test="$index=1">
								<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
									<div style="text-align:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodFilingYrGrp/IncomeAdjustmentAmt"/>
										</xsl:call-template>
									</div>
									<br/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodFilingYrGrp/IncomeAdjustmentAmt"/>
									</xsl:call-template>
								</td>
							</xsl:when>
							<xsl:otherwise>
								<td class="styForm8697TableCellEmptyGray" rowspan="1" style="border-right:1px;border-color:black;border-style:solid;">
									<span style="width:1px;"/>	
								</td>				
							</xsl:otherwise>
						</xsl:choose>
					
						<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
							<div style="text-align:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*2-1]/IncomeAdjustmentAmt"/>
								</xsl:call-template>
							</div>
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*2-1]/IncomeAdjustmentAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap;">
							<div style="text-align:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*2]/IncomeAdjustmentAmt"/>
								</xsl:call-template>
							</div>
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*2]/IncomeAdjustmentAmt"/>
							</xsl:call-template>
						</td>
						
					<xsl:choose>
						<xsl:when test="$index = $Part1Max">
						<td class="styForm8697TableCell" rowspan="1" style="border-right:0px;border-top:1px;border-color:black;border-style:solid;">
							
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8697Data/TotLookBackRegularMethodGrp/TotalAdjustmentToIncomeAmt"/>
									</xsl:call-template>
						</td>
						</xsl:when>
						<xsl:otherwise>
							<td class="styForm8697TableCellEmptyGray" rowspan="1" style="border-right:0px;border-color:black;border-style:solid;">
									<span style="width:1px;"/>	
								</td>			
						</xsl:otherwise>
					</xsl:choose>
				</tr>
					<!-- Part 1 - Line 3 -->
					<tr>
						<td class="styForm8697TableCellNumber" rowspan="1">3</td>
						<td class="styForm8697TableCellDescription" rowspan="1">
						  Adjusted taxable income for look-back purposes. Combine lines 1 and 2.  If line 3 is a negative amount, see instructions.
						</td>
					<xsl:choose>
						<xsl:when test="$index=1">
							<td class="styForm8697TableCell" rowspan="1">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodFilingYrGrp/AdjTaxableIncomeLookBackAmt"/>
									</xsl:call-template>
							</td>
						</xsl:when>
						<xsl:otherwise>
							<td class="styForm8697TableCellEmptyGray" rowspan="1" style="border-right:1px;border-color:black;border-style:solid;">
								<span style="width:1px;"/>	
							</td>				
						</xsl:otherwise>
					</xsl:choose>
						
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*2-1]/AdjTaxableIncomeLookBackAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*2]/AdjTaxableIncomeLookBackAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCellEmptyGray" rowspan="1">
							<span style="width:1px;"/>
						</td>
					</tr>
					<!-- Part 1 - Line 4 -->
					<tr>
						<td class="styForm8697TableCellNumber" rowspan="1">4</td>
						<td class="styForm8697TableCellDescription" rowspan="1">
							  Income tax liability on line 3 amount using tax rates in effect
							  for the prior years (see instructions)
							  <span style="width:2mm;"/>
							<span style="letter-spacing:4mm;">...</span>
						</td>
					<xsl:choose>
						<xsl:when test="$index=1">
								<td class="styForm8697TableCell" rowspan="1">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodFilingYrGrp/TaxLiabilityAmt"/>
									</xsl:call-template>
								</td>
						</xsl:when>
						<xsl:otherwise>
							<td class="styForm8697TableCellEmptyGray" rowspan="1" style="border-right:1px;border-color:black;border-style:solid;">
							<span style="width:1px;"/>
						</td>
						</xsl:otherwise>
					</xsl:choose>
						
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*2-1]/TaxLiabilityAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*2]/TaxLiabilityAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCellEmptyGray" rowspan="1">
							<span style="width:1px;"/>
						</td>
					</tr>
					<!-- Part 1 - Line 5 -->
					<tr>
						<td class="styForm8697TableCellNumber" rowspan="1">5</td>
						<td class="styForm8697TableCellDescription" rowspan="1">
							  Income tax liability shown on return (or as previously
							  adjusted) for the prior years (see instructions).
							  If you were required to file Form 8697 for an earlier year,
							  enter the amount required to be reported on line 4, Form
							  8697, for the most recent filing year that affects the prior
							  years <span style="width:2mm;"/>
							<span style="letter-spacing:4mm;">...</span>
						</td>
						<td class="styForm8697TableCellEmptyGray" rowspan="1" style="border-right:1px;border-color:black;border-style:solid;">
							<span style="width:1px;"/>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*2-1]/FederalIncomeTaxLiabilityAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*2]/FederalIncomeTaxLiabilityAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCellEmptyGray" rowspan="1">
							<span style="width:1px;"/>
						</td>
					</tr>
					<!-- Part 1 - Line 6 -->
					<tr>
						<td class="styForm8697TableCellNumber" rowspan="1">6</td>
						<td class="styForm8697TableCellDescription" rowspan="1">
							  Increase or decrease in tax for the prior years on which
							  interest is due (or is to be refunded). Subtract line 5 from
							  line 4.
							  <span style="width:4mm;"/>
							<!--<span style="letter-spacing:4mm;">.</span>-->
						</td>
						<td class="styForm8697TableCellEmptyGray" rowspan="1" style="border-right:1px;border-color:black;border-style:solid;">
							<span style="width:1px;"/>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*2-1]/IncreaseOrDecreaseInTxForPYAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*2]/IncreaseOrDecreaseInTxForPYAmt"/>
							</xsl:call-template>
						</td>
						<td class="styTableCell" rowspan="1" style="width:29mm;background-color:lightgrey;border-right:none;">
							<span style="width:1px;"/>
						</td>
					</tr>
					<!-- Part 1 - Line 7 -->
					<tr>
						<td class="styForm8697TableCellNumber" rowspan="1">7</td>
						<td class="styForm8697TableCellDescription" rowspan="1">
							  Interest due on increase, if any, shown on line 6 (see instructions)
							  <span style="width:4mm;"/>
							<span style="letter-spacing:4mm;">.</span>
						</td>
						<td class="styForm8697TableCellEmptyGray" rowspan="1" style="border-right:1px;border-color:black;border-style:solid;">
							<span style="width:1px;"/>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*2-1]/InterestDueOnIncreaseAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*2]/InterestDueOnIncreaseAmt"/>
							</xsl:call-template>
						</td>
							<xsl:choose>
								<xsl:when test="$index = $Part1Max">	
								<td class="styForm8697TableCell" rowspan="1" style="border-right:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8697Data/TotLookBackRegularMethodGrp/TotalInterestDueOnIncreaseAmt"/>
									</xsl:call-template>
								</td>
								</xsl:when>
								<xsl:otherwise>
									<td class="styForm8697TableCellEmptyGray" rowspan="1" style="border-right:1px;border-color:black;">
									<span style="width:1px;"/>	
								</td>	
								</xsl:otherwise>
							</xsl:choose>
					</tr>
					<tr>
					<!-- Part 1 - Line 8 -->
						<td class="styForm8697TableCellNumber" rowspan="1">8</td>
						<td class="styForm8697TableCellDescription" rowspan="1" style="border-bottom:1px;border-color:black;border-style:solid;">
							  Interest to be refunded on decrease, if any, shown on
							  line 6 (see instructions)
							  <span style="width:2mm;"/>
							<span style="letter-spacing:4mm;">..</span>
						</td>
						<td class="styForm8697TableCellEmptyGray" rowspan="1" style="border-right:1px;border-bottom:1px;border-color:black;border-style:solid;">
							<span style="width:1px;"/>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*2-1]/InterestToBeRefundedOnDecrAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/RegularMethodRedetermYrGrp[$index*2]/InterestToBeRefundedOnDecrAmt"/>
							</xsl:call-template>
						</td>
						<xsl:choose>
							<xsl:when test="$index = $Part1Max">						
							<td class="styForm8697TableCell" rowspan="1" style="border-right:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8697Data/TotLookBackRegularMethodGrp/TotalInterestToBeRefundedAmt"/>
									</xsl:call-template>
							</td>		
							</xsl:when>
							<xsl:otherwise>
									<td class="styForm8697TableCellEmptyGray" rowspan="1" style="border-right:0px;border-bottom:1px;border-color:black;border-style:solid;">
									<span style="width:1px;"/>	
									</td>	
							</xsl:otherwise>
						</xsl:choose>
					</tr>
				</table>
				<xsl:if test="$index != $Part1Max">
				<!--<xsl:choose>
						<xsl:when test="$index = 1">					
							<div class="pageEnd" style="page-break-after:always"/>
						</xsl:when>
						<xsl:otherwise>
							<div class="pageEnd" style="page-break-after:always"/>
						</xsl:otherwise>
					</xsl:choose>-->
					<div class="pageEnd" style="page-break-after:always"/>
					<br/>
					<div style="width:187mm;">
						<span style="width:64mm;float:left;clear:none;"/>
						<span style="width:123.5mm;float:right;clear:none;border-bottom:1px solid black;"/>
					</div>
				</xsl:if>
				<xsl:call-template name="part1Table">
					<xsl:with-param name="index" select="$index+1"/>
					<xsl:with-param name="Part1Max" select="$Part1Max"/>
				</xsl:call-template>
			</table>
		</xsl:if>
	</xsl:template>
	<!--Part II recurring table -->
	<xsl:template name="part2Table">
		<xsl:param name="index" select="1"/>
		<xsl:param name="Part2Max"/>
		<xsl:if test="$index &lt;= $Part2Max">
			<table style="width:187mm;" id="TP2ctn">
				<xsl:call-template name="SetInitialState"/>
				<table cellspacing="0" 
				style="width:187mm;border-top-width:0px;font-size:7pt;border-style: solid; border-color: black;border-bottom-width:0px;border-left-width:0px;
				border-right-width: 0px;page-break-inside: avoid; " name="TYTable" id="TYTable">				
					<tr>
						<th class="styTableCell" rowspan="1" style="width:7mm;text-align:center;border-color:black;border-right:none;border-bottom:none;">
							<span style="width:1px;"/>
						</th>
						<th class="styTableCell" rowspan="1" style="width:80mm;text-align:left;border-color:black;border-bottom:none;">
							<span style="width:1px;"/>
						</th>
						<th class="styTableCell" colspan="3" style="width:96mm;text-align:center;font-weight:normal;border-top-width:0px;border-color:black;">
							<span style="width:12mm;"/>Date of each prior year to which interest <br/>
							<span style="width:15mm;"/>computation relates:</th>
						<th class="styTableCell" rowspan="1" 
							style="width:29mm;text-align:center;border-color:black;border-right:none;border-top-width:0px;border-bottom:none;">
							<span style="float:left;width:1px;"/>
						</th>
					</tr>	
					<tr style="height:30mm">
						<th class="styTableCell" rowspan="2" 
							style="width:7mm;text-align:left;vertical-align:top;font-weight:bold;border-color:black;border-right:none;border-bottom:none;padding-left:1.5mm;">1
						</th>
						<th class="styTableCell" rowspan="2" 
							style="width:80mm;text-align:left;font-weight:normal;border-color:black;border-bottom:none;padding-right:1mm;">
						  Adjustment to regular taxable income to reflect the
						  difference between: <span style="font-weight:bold;">(a)</span> the amount of such income required
						  to be allocated for post-February 1986 contracts
						  completed or adjusted during the tax year based on <span style="font-weight:bold;">actual</span>
						  contract price and costs, and <span style="font-weight:bold;">(b)</span> the amount of such
						  income reported for such contracts based on <span style="font-weight:bold;">estimated</span>
						  contract price and costs. See instructions and attach a schedule listing each separate contract,
						  unless you were an owner of an interest in a pass-through entity reporting this amount from Schedule K-1 or a similar
						  statement           
							  <!-- Form Link to Additional Data -->
							<!-- Form Link has been removed here and placed in each individual cell.  As the push pin is hiding some characters when tested with maximum digits placed a 
									break next to it,as the space is already scarce -->
							<span style="width:6px;"/>
							<span style="letter-spacing:4mm;">........</span>
						</th>
						<td class="styTableCell" rowspan="1" style="width:29mm;text-align:center;font-weight:bold;border-color:black;">
							<xsl:if test="$index = 1">(a)</xsl:if>
							<span style="text-align:center;width:29mm;font-weight:normal">Year ended</span>
							<span style="float:left;clear:all;width:29mm;font-weight:normal">mo
								<span class="styFixedUnderline" style="width:5mm;float:none;padding-bottom:0;">
									<xsl:call-template name="PopulateMonth">
										<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3-2]/YearEndedDt"/>
									</xsl:call-template>
								</span>
								<span style="width:1mm;"/>yr.
								<span class="styFixedUnderline" style="width:8mm;float:none;padding-bottom:0;">
									<xsl:call-template name="PopulateYear">
										<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3-2]/YearEndedDt"/>
									</xsl:call-template>
								</span>
							</span>							
						</td>
						<td class="styTableCell" rowspan="1" style="width:29mm;text-align:center;font-weight:bold;border-color:black;">
							<xsl:if test="$index = 1">(b)</xsl:if>
							<span style="text-align:center;width:29mm;font-weight:normal">Year ended</span>
							<span style="float:left;clear:all;width:29mm;font-weight:normal">mo
								<span class="styFixedUnderline" style="width:5mm;float:none;padding-bottom:0;">
									<xsl:call-template name="PopulateMonth">
										<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3-1]/YearEndedDt"/>
									</xsl:call-template>
								</span>
								<span style="width:1mm;"/>yr.
								<span class="styFixedUnderline" style="width:8mm;float:none;padding-bottom:0;">
									<xsl:call-template name="PopulateYear">
										<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3-1]/YearEndedDt"/>
									</xsl:call-template>
								</span>
							</span>
						</td>
						<td class="styTableCell" rowspan="1" style="width:29mm;text-align:center;font-weight:bold;border-color:black;">
							<xsl:if test="$index = 1">(c)</xsl:if>
							<span style="text-align:center;width:29mm;font-weight:normal">Year ended</span>
							<span style="float:left;clear:all;width:29mm;font-weight:normal">mo
								<span class="styFixedUnderline" style="width:5mm;float:none;padding-bottom:0;">
										<xsl:call-template name="PopulateMonth">
											<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3]/YearEndedDt"/>
										</xsl:call-template>
								</span>
								<span style="width:1mm;"/>yr.
								<span class="styFixedUnderline" style="width:8mm;float:none;padding-bottom:0;">
									<xsl:call-template name="PopulateYear">
										<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3]/YearEndedDt"/>
									</xsl:call-template>
								</span>
							</span>
						</td>
						<td class="styTableCell" rowspan="1" style="width:29mm;text-align:center;font-weight:bold;border-color:black;border-right:none">
							<xsl:if test="$index = 1">(d)</xsl:if>
							<span style="text-align:center;font-weight:bold;width:29mm;">Totals</span>
							<span style="float:left;clear:all;width:29mm;font-weight:normal">
								(Add columns (a),
							</span>
							<span style="float:left;clear:all;width:29mm;font-weight:normal">
								(b), and (c).)
							</span>
						</td>
					</tr>
					<tr>
						<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap">
							<xsl:choose>
								<xsl:when test="$index=0 and $Part2Max=0">
									<xsl:call-template name="PopulateAdditionalDataTableMessage">
										<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation"/>
										<xsl:with-param name="ShortMessage" select="'true'"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<div style="text-align:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" 
												select="$Form8697Data/SimplifiedMethodComputation[$index*3-2]/RegularTaxableIncomeAdjAmt"/>
										</xsl:call-template>
									</div>
									<br/>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3-2]/RegularTaxableIncomeAdjAmt"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</td>
						<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap">
							<div style="text-align:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3-1]/RegularTaxableIncomeAdjAmt"/>
								</xsl:call-template>
							</div>
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3-1]/RegularTaxableIncomeAdjAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1" nowrap="nowrap">
							<div style="text-align:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3]/RegularTaxableIncomeAdjAmt"/>
								</xsl:call-template>
							</div>
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3]/RegularTaxableIncomeAdjAmt"/>
							</xsl:call-template>
						</td>
						<td class="styTableCell" rowspan="1" style="width:29mm;background-color:lightgrey;border-right:none;border-bottom:none;">
							<span style="width:1mm;"/>
						</td>
					</tr>
					<tr>
						<td class="styTableCell" rowspan="1" 
							style="width:7mm;text-align:left;vertical-align:top;font-weight:bold;border-color:black;border-right:none;border-bottom:none;padding-left:1.5mm;">2
						</td>
						<td class="styTableCell" rowspan="1" style="width:80mm;text-align:left;border-color:black;border-bottom:none;padding-right:1mm;">
							  Increase or decrease in regular tax for prior years. Multiply line 1 in each column by the applicable regular tax rate 
							  (see instructions).
							  <span style="width:2mm;"/>
							<!--<span style="letter-spacing:4mm;">.........</span>-->
							<span style="width:2px;"/>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3-2]/PriorYearRegTaxIncrOrDecrAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3-1]/PriorYearRegTaxIncrOrDecrAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3]/PriorYearRegTaxIncrOrDecrAmt"/>
							</xsl:call-template>
						</td>
						<td class="styTableCell" rowspan="1" style="width:29mm;background-color:lightgrey;border-right:none;border-bottom:none;">
							<span style="width:1px;"/>
						</td>
					</tr>
					<!-- Part 2 - Line 3 -->
					<tr>
						<td class="styTableCell" rowspan="1" 
							style="width:7mm;text-align:left;vertical-align:top;font-weight:bold;border-color:black;border-right:none;border-bottom:none;padding-top:9.5mm;
							padding-left:1.5mm;">3
						</td>
						<td class="styTableCell" rowspan="1" style="width:80mm;text-align:left;border-color:black;border-bottom:none;padding-right:1mm;">
							<span style="font-weight:bold;">Note.</span>
							<span style="width:1mm;"/>
								<span style="width:50mm;">For prior years beginning before 1987,</span>
								<span style="width:60mm;"> skip lines 3
								  and 4 and enter on line 5 the amount from line 2.</span>
							<br/>
							Adjustment to alternative minimum taxable income to
								  reflect the difference between: <span style="font-weight:bold;">(a)</span> the amount of such
								  income required to be allocated for post-February 1986
								  contracts completed or adjusted during the tax year based
								  on <span style="font-weight:bold;">actual</span> contract price and costs, and <span style="font-weight:bold;">(b)</span> the amount of
								  such income reported for such contracts based on
								  <span style="font-weight:bold;">estimated</span> contract price and costs. See instructions and attach a schedule listing each separate
								  contract, unless you were an owner of an interest in a
								  pass-through entity reporting this amount from Schedule
								  K-1 or a similar statement
								  <!-- Form Link to Additional Data -->
							<!-- Form Link has been removed here and placed in each individual cell.  As the push pin is hiding some characters when tested with maximum digits placed a 
								break next to it,as the space is already scarce -->
							<span style="width:2mm;"/>
							<span style="letter-spacing:4mm;">..</span>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<div style="text-align:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3-2]/AltMinTaxableIncomeAdjAmt"/>
								</xsl:call-template>
							</div>
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3-2]/AltMinTaxableIncomeAdjAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<div style="text-align:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3-1]/AltMinTaxableIncomeAdjAmt"/>
								</xsl:call-template>
							</div>
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3-1]/AltMinTaxableIncomeAdjAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<div style="text-align:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3]/AltMinTaxableIncomeAdjAmt"/>
								</xsl:call-template>
							</div>
							<br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3]/AltMinTaxableIncomeAdjAmt"/>
							</xsl:call-template>
						</td>
						<td class="styTableCell" rowspan="1" style="width:29mm;background-color:lightgrey;border-right:none;border-bottom:none;">
							<span style="width:1px;"/>
						</td>
					</tr>
					<tr>
						<td class="styTableCell" rowspan="1" 
							style="width:7mm;text-align:left;vertical-align:top;font-weight:bold;border-color:black;border-right:none;border-bottom:none;padding-top:9.5mm;
							padding-left:1.5mm;">4
						</td>
						<td class="styTableCell" rowspan="1" style="width:80mm;text-align:left;border-color:black;border-bottom:none;padding-right:1mm;">
							<span style="font-weight:bold;">Note.</span>
							<span style="width:1mm;"/>
								<span style="width:50mm;">For tax years beginning after 2017,</span>
								<span style="width:60mm;"> The alternative minimum tax for corporations has been repealed.</span>
							<br/>
							  Increase or decrease in alternative minimum tax (AMT) for
							  prior years. Multiply line 3 in each column by the applicable
							  AMT rate (see instructions).<span style="width:2mm;"/>
							<span style="letter-spacing:4mm;">.....</span>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3-2]/PriorYearAMTIncrOrDecrAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3-1]/PriorYearAMTIncrOrDecrAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3]/PriorYearAMTIncrOrDecrAmt"/>
							</xsl:call-template>
						</td>
						<td class="styTableCell" rowspan="1" style="width:29mm;background-color:lightgrey;border-right:none;border-bottom:none;">
							<span style="width:1px;"/>
						</td>
					</tr>
					<tr>
						<td class="styTableCell" rowspan="1" 
							style="width:7mm;text-align:left;vertical-align:top;font-weight:bold;border-color:black;border-right:none;border-bottom:none;padding-left:1.5mm;">5
						</td>
						<td class="styTableCell" rowspan="1" style="width:80mm;text-align:left;border-color:black;border-bottom:none;padding-right:1mm;">          
							  Enter the <span style="font-weight:bold;">larger</span> of line 2 or line 4. See instructions if either amount is negative.
							  <span style="width:2mm;"/>
							<!--<span style="letter-spacing:4mm;">..</span>-->
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3-2]/AdjustmentToTaxableIncomeAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3-1]/AdjustmentToTaxableIncomeAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3]/AdjustmentToTaxableIncomeAmt"/>
							</xsl:call-template>
						</td>
						<td class="styTableCell" rowspan="1" style="width:29mm;background-color:lightgrey;border-right:none;border-bottom:none;">
							<span style="width:1px;"/>
						</td>
					</tr>
					<tr>
						<td class="styTableCell" rowspan="1" 
							style="width:7mm;text-align:left;vertical-align:top;font-weight:bold;border-color:black;border-right:none;border-bottom:none;
								padding-top:6.5mm;padding-left:1.5mm;">6<span style="width:3mm;"/>
						</td>
						<td class="styTableCell" rowspan="1" style="width:80mm;text-align:left;border-color:black;border-bottom:none;padding-right:1mm;">
							<span style="font-weight:bold;">Pass-through entities:</span>
							<span style="padding-left:.5mm;">
								<i>
									Skip line 6 and enter
								</i>
							</span>
							<span style="width:60mm;">
								<i>
								  on line 7 the amount from line 5.
								</i>
							</span>
							<br/>
							  Overpayment ceiling. For each column in which line 5 is a
							  negative number, enter your total tax liability for the prior
							  year, as adjusted for past applications of the look-back
							  method and after net operating loss, capital loss, net
							  section 1256 contracts loss, and credit carryovers and
							  carrybacks to that year. For each column in which line 5 is
							  a positive number, leave line 6 blank and enter on line 7
							  the amount from line 5<span style="width:2mm;"/>
							<!--<span style="letter-spacing:4mm;">..</span>-->
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3-2]/OverpaymentCeilingAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3-1]/OverpaymentCeilingAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3]/OverpaymentCeilingAmt"/>
							</xsl:call-template>
						</td>
						<td class="styTableCell" rowspan="1" style="width:29mm;background-color:lightgrey;border-right:none;border-bottom:none;">
							<span style="width:1px;"/>
						</td>
					</tr>
					<!-- Part II Line 7 -->
					<tr>
						<td class="styTableCell" rowspan="1" 
							style="width:7mm;text-align:left;vertical-align:top;font-weight:bold;border-color:black;border-right:none;border-bottom:none;padding-left:1.5mm;">7
						</td>
						<td class="styTableCell" rowspan="1" style="width:80mm;text-align:left;border-color:black;border-bottom:none;padding-right:1mm;">
						  Increase or decrease in tax for the prior years on which
						  interest is due (or is to be refunded). Enter the amount from
						  line 5 or line 6, whichever is smaller. Treat both numbers
						  as positive when making this comparison, but enter the
						  amount as a negative number .
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3-2]/IncreaseOrDecreaseInTxForPYAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3-1]/IncreaseOrDecreaseInTxForPYAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3]/IncreaseOrDecreaseInTxForPYAmt"/>
							</xsl:call-template>
						</td>
						<td class="styTableCell" rowspan="1" style="width:29mm;background-color:lightgrey;border-right:none;">
							<span style="width:1px;"/>
						</td>
					</tr>
					<tr>
						<td class="styTableCell" rowspan="1" 
							style="width:7mm;text-align:left;vertical-align:top;font-weight:bold;border-color:black;border-right:none;border-bottom:none;padding-left:1.5mm;">8
						</td>
						<td class="styTableCell" rowspan="1" style="width:80mm;text-align:left;border-color:black;border-bottom:none;padding-right:1mm;">
							  Interest due on increase, if any, shown on line 7 (see instructions)<span style="width:2mm;"/>
							<span style="letter-spacing:4mm;">...</span>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3-2]/InterestDueOnIncreaseAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3-1]/InterestDueOnIncreaseAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3]/InterestDueOnIncreaseAmt"/>
							</xsl:call-template>
						</td>
						<td class="styTableCell" rowspan="1" 
							style="width:29mm;text-align:right;border-color:black;border-right:none;vertical-align:bottom;padding-bottom:1mm;">
							<xsl:choose>
								<xsl:when test="($index = $Part2Max) and (($Print != $Separated) or (count($Form8697Data/SimplifiedMethodComputation) &lt;= 3))">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8697Data/TotLookBackSmplfdMthdGrp/TotalInterestDueOnIncreaseAmt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<span style="width:1mm;"/>
								</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
					<tr>
						<td class="styTableCell" rowspan="1" 
							style="width:7mm;text-align:left;vertical-align:top;font-weight:bold;border-color:black;border-right:none;border-bottom:none;padding-left:1.5mm;">9
						</td>
						<td class="styTableCell" rowspan="1" 
							style="width:80mm;text-align:left;border-color:black;border-bottom-width:1px;padding-right:1mm;">
							  Interest to be refunded on decrease, if any, shown on
							  line 7 (see instructions)<span style="width:px;"/>
							<span style="letter-spacing:4mm;">..</span>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3-2]/InterestToBeRefundedOnDecrAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3-1]/InterestToBeRefundedOnDecrAmt"/>
							</xsl:call-template>
						</td>
						<td class="styForm8697TableCell" rowspan="1">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8697Data/SimplifiedMethodComputation[$index*3]/InterestToBeRefundedOnDecrAmt"/>
							</xsl:call-template>
						</td>
						<td class="styTableCell" rowspan="1" 
							style="width:29mm;text-align:right;border-color:black;border-right:none;vertical-align:bottom;padding-bottom:1mm;">
							<xsl:choose>
								<xsl:when test="($index = $Part2Max) and (($Print != $Separated) or (count($Form8697Data/SimplifiedMethodComputation) &lt;= 3))">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form8697Data/TotLookBackSmplfdMthdGrp/TotalInterestToBeRefundedAmt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<span style="width:1mm;"/>
								</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
				</table>
				<xsl:if test="$index != $Part2Max">
					<div class="pageEnd"/>
					<div  style="width:187mm;">
						<span style="width:66mm;float:left;clear:none;"/>
						<span style="width:119mm;float:right;clear:none;border-style:solid;border-top-width:0px;border-right-width:0px;             
							border-left-width:0px;border-bottom-width:1px;border-color:black;"/>
					</div>
				</xsl:if>
				<xsl:call-template name="part2Table">
					<xsl:with-param name="index" select="$index+1"/>
					<xsl:with-param name="Part2Max" select="$Part2Max"/>
				</xsl:call-template>
			</table>
		</xsl:if>
	</xsl:template>
	<xsl:template match="a">
		<xsl:value-of select="."/>
		<xsl:if test="string(number(.))='NaN'"> 
			is not a number
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>