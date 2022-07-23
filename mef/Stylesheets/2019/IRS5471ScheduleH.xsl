<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl" />
	<xsl:include href="AddHeader.xsl" />
	<xsl:include href="CommonPathRef.xsl" />
	<xsl:include href="AddOnTable.xsl" />
	<xsl:include href="IRS5471ScheduleHStyle.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS5471ScheduleH" />
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge" />
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)" />
					</xsl:call-template>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache" />
				<meta http-equiv="Cache-Control" content="no-cache" />
				<meta http-equiv="Expires" content="0" />
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private" />
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
				<meta name="Description" content="IRS Form 5471 Schedule H" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS5471ScheduleHStyle" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form5471ScheduleH">
					<xsl:call-template name="DocumentHeader" />
					<!-- Header -->		
					<div class="styStdDiv">
						<div class="styFNBox" style="width:29mm;height:19mm;border-right-width:2px;">
							<div class="styFormNumber" style="font-size:10pt;">SCHEDULE H
								<br/>
								(Form 5471)
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData" />
								</xsl:call-template>
							</div>
							<div class="" style="padding-top:.5mm;font-size:7pt;">(September 2018)</div>
							<div class="styAgency" style="padding-top:.5mm;">Department of the Treasury
								<br/>Internal Revenue Service
							</div>
						</div>
						<div class="styFTBox" style="width:129mm;height:19mm;">
							<span class="styFMT" style="font-size:11pt;">Current Earnings and Profits</span>
							<br />
							<br />
							<span style="font-weight:bold;">
								&#9658;Attach to Form 5471.
							</span><br />
							<span style="font-weight:bold;">
								&#9658;Go to
								<span style="font-style:italic">www.irs.gov/Form5471</span>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:28mm;height:19mm;border-left-width:2px;">  
							<div class="styOMB" style="padding-top:8mm;border-bottom-width:0px;">OMB No. 1545-0704</div>
						</div>
						<!-- Filer information section -->
						<div class="styStdDiv" style="border-top:2px solid black;">
							<div class="styNameBox" style="width:135mm;">Name of person filing Form 5471
								<br />
								<xsl:call-template name="PopulateFilerName">
									<xsl:with-param name="TargetNode" select="$FormData" />
								</xsl:call-template>
							</div>
							<div class="styEINBox" style="width:52mm;padding-left:0.5mm;font-weight:normal;">
								<strong>Identifying number</strong>
									<br />
									<xsl:choose>
										<!-- SSN -->
										<xsl:when test="$FormData/SSN">
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="$FormData/SSN" />
											</xsl:call-template>
										</xsl:when>
										<!-- EIN -->
										<xsl:when test="$FormData/EIN">
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="$FormData/EIN" />
											</xsl:call-template>
										</xsl:when>
										<!-- Missing EIN Reason Code -->
										<xsl:when test="$FormData/MissingEINReasonCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/MissingEINReasonCd" />
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<!-- If data is not present on the form, then populate using data from Return Header instead -->
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
											</xsl:call-template>
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">EIN</xsl:with-param>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
							</div>
						</div>
						<div class="styStdDiv" style="border-top:1px solid black;">
							<div class="styNameBox" style="width:110mm;">
								Name of foreign corporation
								<br />			
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/ForeignCorporationName/BusinessNameLine1Txt" />
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/ForeignCorporationName/BusinessNameLine2Txt" />
								</xsl:call-template>
							</div>
							<div class="styEINBox" style="height:7.75mm;width:25mm;padding-left:0.5mm;font-weight:normal;border-right:1px solid black;">
								EIN (if any)
								<br />
								<xsl:choose>
									<xsl:when test="$FormData/ForeignCorporationEIN">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="$FormData/ForeignCorporationEIN" />
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="$FormData/ForeignCorpMissingEINReasonCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/ForeignCorpMissingEINReasonCd" />
										</xsl:call-template>
									</xsl:when>
								</xsl:choose>
							</div>
							<div class="styNameBox" style="height:7.75mm;width:52mm;padding-left:0.5mm;font-weight:normal;border-right:0px solid black;">
								<strong>Reference ID number</strong> (see instructions)
								<br />
								 <xsl:choose>
									 <xsl:when test="string-length($FormData/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum) &gt; 30 or 
									 (count($FormData/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum) &gt; 1)">
											  -See Add'l Data-
									</xsl:when>
									<xsl:otherwise>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum" />
											</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</div>
						<!-- End of header -->
						<!-- Begin body -->
						<div class="styStdDiv" style="border-top:1px solid black;">
							<!-- Line a -->
							<div style="float:left;clear;none;">
								<div class="styLNLeftLtrBox" style="">a</div>
								<div class="styLNDesc">
									Separate Category (Enter code - see instructions.)
									<span class="sty5471SchHDotLn">.................</span>
								</div>
								<div class="styLNRightNumBox" style="border-left-width:0px;border-right-width:0px;border-top-width:0px;border-bottom-width:0px;">
									<img src="{$ImagePath}/1120_Bullet_Md.gif" alt="MediumBullet" />
								</div>
								<div style="float:right;clear:none;">
									<span style="border-color:black;border-style:solid;border-left-width:0px;border-right-width:0px;border-top-width:0px;border-bottom-width:1px;width:33mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/SeparateCategoryCd"/>
										</xsl:call-template>
									</span>	
								</div>
							</div>
							<!-- Line b -->
							<div style="float:left;clear;none;">
								<div class="styLNLeftLtrBox">b</div>
								<div class="styLNDesc">
									If code 901j is entered on line a, enter the country code for the sanctioned country (see instructions)
								</div>
								<div class="styLNRightNumBox" style="border-left-width:0px;border-right-width:0px;border-top-width:0px;border-bottom-width:0px;">
									<img src="{$ImagePath}/1120_Bullet_Md.gif" alt="MediumBullet" />
								</div>
								<div style="float:right;clear:none;">
									<span style="border-color:black;border-style:solid;border-right-width:0px;border-left-width:0px; border-top-width:0px;border-bottom-width:0px;width:33mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/SanctionedCountryCd" />
										</xsl:call-template>
									</span>	
								</div>
							</div>
						</div>
						<div class="styStdDiv" style="border-top:1px solid black;">
							<br />
							<span style="font-weight:bold;">IMPORTANT:</span><span style="font-style:italic;">&#160;Enter the amounts on lines 1 through 5c in <span style="font-weight:bold;">functional</span> currency.</span>
							<br />
							<br />
						</div>
						<!-- Line 1 -->
						<div class="styStdDiv" style="border-top:1px solid black;">
							<div class="styLNLeftNumBoxSD">1</div>
							<div class="styLNDesc" style="width:139mm;">
								Current year net income or (loss) per foreign books of account
								<span class="sty5471SchHDotLn">............</span>
							</div>
							<div class="styLNRightNumBox">1</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ForeignCYNetIncomePerBooksAmt" />
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 2 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD">2</div>
							<div class="styLNDesc" style="width:81mm;">
								Net adjustments made to line 1 to determine current<br />
								earnings and profits according to U.S. financial and tax<br />
								accounting standards (see instructions):
							</div>
							<div class="styLNAmountBox" style="border-top-width:1px;height:10.25mm;text-align:center;width:29mm;">
								<br />
								<br />
								Net Additions
							</div>
							<div class="styLNAmountBox" style="border-top-width:1px;height:10.25mm;text-align:center;width:29mm;">
								<br />
								<br />
								Net Subtractions
							</div>
							<div class="styLNAmountBox" style="background-color:lightgrey;border-bottom-width:0px;height:10.25mm;width:40mm;" />
						</div>
						<!-- Line 2a -->
						<div class="styStdDiv">
							<div class="styLNLeftLtrBox" style="padding-left:4.2mm;">a</div>
							<div class="styLNDesc" style="width:73mm;">
								Capital gains or losses
								<span class="sty5471SchHDotLn">..........</span>
							</div>
							<div class="styLNRightNumBox" style="border-top-width:1px">2a</div>
							<div class="sty5471SchHLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CapitalGainOrLossNetAddnAmt" />
								</xsl:call-template>
							</div>
							<div class="sty5471SchHLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CapitalGainOrLossNetSbtrctnAmt" />
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="background-color:lightgrey;border-bottom-width:0px;width:40mm;" />
						</div>
						<!-- Line 2b -->
						<div class="styStdDiv">
							<div class="styLNLeftLtrBox" style="padding-left:4.2mm;">b</div>
							<div class="styLNDesc" style="width:73mm;">
								Depreciation and amortization
								<span class="sty5471SchHDotLn">........</span>
							</div>
							<div class="styLNRightNumBox">2b</div>
							<div class="sty5471SchHLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/DeprecAndAmortzNetAddnAmt" />
								</xsl:call-template>
							</div>
							<div class="sty5471SchHLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/DeprecAndAmortzNetSbtrctnAmt" />
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="background-color:lightgrey;border-bottom-width:0px;width:40mm;" />
						</div>
						<!-- Line 2c -->
						<div class="styStdDiv">
							<div class="styLNLeftLtrBox" style="padding-left:4.2mm;">c</div>
							<div class="styLNDesc" style="width:73mm;">
								Depletion
								<span class="sty5471SchHDotLn">...............</span>
							</div>
							<div class="styLNRightNumBox">2c</div>
							<div class="sty5471SchHLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/DepletionNetAddnAmt" />
								</xsl:call-template>
							</div>
							<div class="sty5471SchHLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/DepletionNetSbtrctnAmt" />
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="background-color:lightgrey;border-bottom-width:0px;width:40mm;" />
						</div>
						<!-- Line 2d -->
						<div class="styStdDiv">
							<div class="styLNLeftLtrBox" style="padding-left:4.2mm;">d</div>
							<div class="styLNDesc" style="width:73mm;">
								Investment or incentive allowance
								<span class="sty5471SchHDotLn">.......</span>
							</div>
							<div class="styLNRightNumBox">2d</div>
							<div class="sty5471SchHLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/InvstIncntvAllwncNetAddnAmt" />
								</xsl:call-template>
							</div>
							<div class="sty5471SchHLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/InvstIncntvAllwncNetSbtrctnAmt" />
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="background-color:lightgrey;border-bottom-width:0px;width:40mm;" />
						</div>
						<!-- Line 2e -->
						<div class="styStdDiv">
							<div class="styLNLeftLtrBox" style="padding-left:4.2mm;">e</div>
							<div class="styLNDesc" style="width:73mm;">
								Charges to statutory reserves
								<span class="sty5471SchHDotLn">........</span>
							</div>
							<div class="styLNRightNumBox">2e</div>
							<div class="sty5471SchHLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ChrgsStryReservesNetAddnAmt" />
								</xsl:call-template>
							</div>
							<div class="sty5471SchHLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ChrgsStryReservesNetSbtrctnAmt" />
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="background-color:lightgrey;border-bottom-width:0px;width:40mm;" />
						</div>
						<!-- Line 2f -->
						<div class="styStdDiv">
							<div class="styLNLeftLtrBox" style="padding-left:4.2mm;">f</div>
							<div class="styLNDesc" style="width:73mm;">
								Inventory adjustments
								<span class="sty5471SchHDotLn">..........</span>
							</div>
							<div class="styLNRightNumBox">2f</div>
							<div class="sty5471SchHLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/InventoryAdjNetAddnAmt" />
								</xsl:call-template>
							</div>
							<div class="sty5471SchHLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/InventoryAdjNetSbtrctnAmt" />
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="background-color:lightgrey;border-bottom-width:0px;width:40mm;" />
						</div>
						<!-- Line 2g -->
						<div class="styStdDiv">
							<div class="styLNLeftLtrBox" style="padding-left:4.2mm;">g</div>
							<div class="styLNDesc" style="width:73mm;">
								Income taxes (see Schedule E, Part I, line 9, column (j))
							</div>
							<div class="styLNRightNumBox">2g</div>
							<div class="sty5471SchHLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxesNetAddnAmt" />
								</xsl:call-template>
							</div>
							<div class="sty5471SchHLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxesNetSbtrctnAmt" />
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="background-color:lightgrey;border-bottom-width:0px;width:40mm;" />
						</div>
						<!-- Line 2h -->
						<div class="styStdDiv">
							<div class="styLNLeftLtrBox" style="padding-left:4.2mm;">h</div>
							<div class="styLNDesc" style="width:73mm;">
								Foreign currency gains or losses
								<span class="sty5471SchHDotLn">.......</span>
							</div>
							<div class="styLNRightNumBox">2h</div>
							<div class="sty5471SchHLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/FrgnCurrencyGainLossAddnAmt" />
								</xsl:call-template>
							</div>
							<div class="sty5471SchHLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/FrgnCurrencyGainLossSbtrctnAmt" />
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="background-color:lightgrey;border-bottom-width:0px;width:40mm;" />
						</div>
						<!-- Line 2i -->
						<div class="styStdDiv">
							<div class="styLNLeftLtrBox" style="padding-left:4.2mm;">i</div>
							<div class="styLNDesc" style="width:73mm;">
								Other (attach statement)
								<!-- Form to Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/OtherAdjustmentsNetAddnAmt" />
								</xsl:call-template>
								<!-- Form to Form Link -->
								<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/OtherAdjustmentsNetSbtrctnAmt" />
								</xsl:call-template>
								<span class="sty5471SchHDotLn">........</span>
							</div>
							<div class="styLNRightNumBox">2i</div>
							<div class="sty5471SchHLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OtherAdjustmentsNetAddnAmt" />
								</xsl:call-template>
							</div>
							<div class="sty5471SchHLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OtherAdjustmentsNetSbtrctnAmt" />
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="background-color:lightgrey;border-bottom-width:0px;width:40mm;" />
						</div>
						<!-- Line 3 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD">3</div>
							<div class="styLNDesc" style="width:73mm;">
								Total net additions
								<span class="sty5471SchHDotLn">............</span>
							</div>
							<div class="styLNRightNumBox">3</div>
							<div class="sty5471SchHLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalNetAdditionsAmt" />
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="background-color:lightgrey;border-bottom-width:1px;width:29mm;" />
							<div class="styLNAmountBox" style="background-color:lightgrey;border-bottom-width:0px;width:40mm;" />
						</div>
						<!-- Line 4 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD">4</div>
							<div class="styLNDesc" style="width:73mm;">
								Total net subtractions
								<span class="sty5471SchHDotLn">...........</span>
							</div>
							<div class="styLNRightNumBox">4</div>
							<div class="styLNAmountBox" style="background-color:lightgrey;border-bottom-width:1px;width:29mm;" />
							<div class="sty5471SchHLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalNetSubtractionsAmt" />
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="background-color:lightgrey;border-bottom-width:1px;width:40mm;" />
						</div>
						<!-- Line 5a -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD">5a</div>
							<div class="styLNDesc" style="width:139mm;">
								Current earnings and profits (line 1 plus line 3 minus line 4)
								<span class="sty5471SchHDotLn">.............</span>
							</div>
							<div class="styLNRightNumBox">5a</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CurrentEarningsAndProfitsAmt" />
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 5b -->
						<div class="styStdDiv">
							<div class="styLNLeftLtrBox" style="padding-left:4.2mm;">b</div>
							<div class="styLNDesc" style="width:139mm;">
								DASTM gain or (loss) for foreign corporations that use DASTM (see instructions)
								<span class="sty5471SchHDotLn">......</span>
							</div>
							<div class="styLNRightNumBox">5b</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/DASTMGainOrLossAmt" />
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 5c -->
						<div class="styStdDiv">
							<div class="styLNLeftLtrBox" style="padding-left:4.2mm;">c</div>
							<div class="styLNDesc" style="width:139mm;">
								Combine lines 5a and 5b
								<span class="sty5471SchHDotLn">.........................</span>
							</div>
							<div class="styLNRightNumBox">5c</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/EarningAndPrftPlusDASTMGainAmt" />
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 5d -->
						<div class="styStdDiv">
							<div class="styLNLeftLtrBox" style="padding-left:4.2mm;">d</div>
							<div class="styLNDesc" style="width:139mm;height:7mm;">
								Current earnings and profits in U.S. dollars (line 5c translated at the average exchange rate, as<br />
								defined in section 989(b)(3) and the related regulations (see instructions))
								<span class="sty5471SchHDotLn">.........</span>
							</div>
							<div class="styLNRightNumBox" style="height:7mm;"><br />5d</div>
							<div class="styLNAmountBox" style="height:7mm;"><br />
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CurrEarnAndPrftInUSDollarsAmt" />
								</xsl:call-template>
							</div>
						</div>
						<!-- Enter exchange rate used for line 5d -->
						<div class="styStdDiv">
							<div class="styLNDesc" style="width:118mm;text-align:right;">Enter exchange rate used for line 5d&#160;&#9658;&#160;</div>
							<div class="styLNAmountBox" style="width:29mm;border-bottom-width:0px;border-top-width:1px;padding-right:0.5mm;font-family:Arial;font-size:6.5pt;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/ExchangeRt" />
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="background-color:lightgrey;border-bottom-width:0px;width:40mm;" />
						</div>
						<!-- End body -->
						<!-- Form footer-->
						<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
							<span style="font-weight:bold;font-family:Arial;">For Paperwork Reduction Act Notice, see instructions.</span>
							<span style="margin-left:20mm;font-size:6.5pt;">Cat. No. 71399W</span>
							<span style="float:right;font-weight:bold;font-size:6.5pt;">Schedule H (Form 5471) (9-2018)</span>
						</div>
						<!-- End form footer -->
						
						<!-- Additional Data title bar and button -->
						<div class="styLeftOverTitleLine" id="LeftoverData">
							<div class="styLeftOverTitle">
								Additional Data        
							</div>
							<div class="styLeftOverButtonContainer">
								<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
							</div>
						</div>
						<!-- Additional Data table -->
						<table class="styLeftOverTbl">
							<xsl:call-template name="PopulateCommonLeftover">
								<xsl:with-param name="TargetNode" select="$FormData"/>
								<xsl:with-param name="DescWidth" select="100"/>
							</xsl:call-template>
						</table>
						<!-- Reference ID Number -->
						<xsl:if test="string-length($FormData/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum) &gt; 30 or
						 (count($FormData/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum) &gt; 1)">
							 <span class="styRepeatingDataTitle">
								 <br />
							</span>
							<table class="styDepTbl" style="font-size:7pt">
								<thead class="styTableHead">
									<tr class="styDepTblHdr">
										<th class="styDepTblCell" style="text-align:left">
											Reference ID number (see instructions)
										</th>
									</tr>
								</thead>
								<tbody>
									<xsl:for-each select="$FormData/ForeignEntityIdentificationGrp">
										<tr>
											<!-- Alternate background colors -->
											<xsl:attribute name="class">
												<xsl:choose>
													<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
													<xsl:otherwise>styDepTblRow2</xsl:otherwise>
												</xsl:choose>
											</xsl:attribute>
											<td class="styDepTblCell" style="text-align:left;">
												<span style="font-size:7pt;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
													</xsl:call-template>
												</span>
												<br />
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</xsl:if>
					</div>
				</form>
			</body>
		</html>
	</xsl:template>	
</xsl:stylesheet>
