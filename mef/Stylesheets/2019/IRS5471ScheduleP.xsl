<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
  <!ENTITY ndash "&#8211;">
  <!ENTITY mdash "&#8212;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl" />
	<xsl:include href="AddHeader.xsl" />
	<xsl:include href="CommonPathRef.xsl" />
	<xsl:include href="AddOnTable.xsl" />
	<xsl:include href="IRS5471SchedulePStyle.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS5471ScheduleP" />
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
				<meta name="Description" content="IRS Form 5471 Schedule P" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS5471SchedulePStyle" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form5471ScheduleP">
					<xsl:call-template name="DocumentHeaderLandscape" />
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDivLS">
						<div class="styFNBox" style="width:35mm;height:18mm;">
							<div class="styFormNumber" style="font-size:10pt;">SCHEDULE P
								<br/>
								(Form 5471)
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData" />
								</xsl:call-template>
							</div>
							<div class="" style="padding-top:.5mm;font-size:7pt;">(Rev. December 2019)</div>
							<div class="styAgency" style="padding-top:.5mm;">Department of the Treasury
								<br/>Internal Revenue Service
							</div>
						</div>
						<div class="styFTBox" style="width:186mm;height:18mm;">
							<span class="styFMT" style="font-size:11pt;padding-top:1mm;padding-bottom:0.5mm;">Previously Taxed Earnings and Profits of U.S. Shareholder<br /> of Certain Foreign Corporations</span>
							<br />
							<span style="font-weight:bold;">
								&#9658;Attach to Form 5471
							</span><br />
							<span style="font-weight:bold;">
								&#9658;Go to
								<span style="font-style:italic">www.irs.gov/Form5471</span>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:33mm;height:18mm;">
							<div class="styOMB" style="font-size:6pt;border:none;padding-top:8mm;">OMB No. 1545-0123</div>
						</div>
					</div>
					<!-- Filer information section -->
					<div class="styStdDivLS" style="border-top:2px solid black;">
						<div class="styNameBox" style="width:200mm;">Name of person filing Form 5471
							<br />
							<xsl:call-template name="PopulateFilerName">
								<xsl:with-param name="TargetNode" select="$FormData" />
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:56mm;padding-left:0.5mm;font-weight:normal;">
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
									<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<div class="styStdDivLS" style="border-top:1px solid black;">
						<div class="styNameBox" style="width:145mm;">
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
						<div class="styEINBox" style="height:7.75mm;width:55mm;padding-left:0.5mm;font-weight:normal;border-right:1px solid black;">
							EIN (if any)
							<br />
							<xsl:choose>
								<xsl:when test="$FormData/ForeignCorpMissingEINReasonCd">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ForeignCorpMissingEINReasonCd" />
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$FormData/ForeignCorporationEIN" />
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="styNameBox" style="height:7.75mm;width:56mm;padding-left:0.5mm;font-weight:normal;border-right:0px solid black;">
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
					<!-- Line a -->
					<div class="styStdDivLS" style="border-top:1px solid black;">
						<div class="styLNLeftNumBoxSD" style="width:6mm;">a</div>
						<div class="styLNDesc" style="width:210mm;">
							Separate Category (Enter code&mdash;see instructions.)
							<span class="sty5471SchPDotLn">...................................&#9658;</span>
						</div>
						<div class="styLNDesc" style="width:40mm;border-bottom:1px solid black;text-align:center;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/SeparateCategoryCd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line b -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:6mm;">b</div>
						<div class="styLNDesc" style="width:210mm;">
							If code 901j is entered on line a, enter the country code for the sanctioned country (see instructions)
							<span class="sty5471SchPDotLn">...................&#9658;</span>
						</div>
						<div class="styLNDesc" style="width:40mm;text-align:center;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/SanctionedCountryCd"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDivLS" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc" style="font-weight:normal;">
							<strong>Previously Taxed E&amp;P in Functional Currency </strong> (see instructions)
						</div>
					</div>
					<!-- Table header -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:25mm;border-bottom:1px solid black;"><br /></div>
						<div class="sty5471SchPHeaderBox" style="width:75mm;padding-top:8mm;">&nbsp;</div>
						<div class="sty5471SchPHeaderBox">
							<strong>(a)</strong><br />
							Section 965(a) <br /> Inclusion (section <br />959(c)(1)(A))
						</div>
						<div class="sty5471SchPHeaderBox">
							<strong>(b)</strong><br />
							Section <br />965(b)(4)(A) <br />(section <br />959(c)(1)(A))
						</div>
						<div class="sty5471SchPHeaderBox">
							<strong>(c)</strong><br />
							Earnings <br />Invested in <br />U.S. Property <br />(section <br />959(c)(1)(A))
						</div>
						<div class="sty5471SchPHeaderBox">
							<strong>(d)</strong><br />
							Section 951A <br /> Inclusion (section <br />959(c)(1)(A))
						</div>
						<div class="sty5471SchPHeaderBox">
							<strong>(e)</strong><br />
							Section <br /> 245A(e)(2) <br /> Inclusion (section <br />959(c)(1)(A))
						</div>
						<div class="sty5471SchPHeaderBox">
							<strong>(f)</strong><br />
							Section 959(e) <br /> (section <br />959(c)(1)(A))
						</div>
						<div class="sty5471SchPHeaderBox">
							<strong>(g)</strong><br />
							Section 964(e)(4) <br /> Inclusion (section <br />959(c)(1)(A))
						</div>
					</div>
					<!-- Line 1a -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">1a</div>
						<div class="sty5471SchPDescBox">
							Balance at beginning of year (see instructions)
							<span class="sty5471SchPDotLn">...</span>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965aInclusionEPGrp/BeginningYearBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965b4AEPGrp/BeginningYearBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEarnInvstUSPropSect959c1AGrp/BeginningYearBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection951AInclusionEPGrp/BeginningYearBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSect245Ae2Sect959c1AGrp/BeginningYearBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection959eSect959c1AGrp/BeginningYearBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection964e4Sect959c1AGrp/BeginningYearBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 1b -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">1b</div>
						<div class="sty5471SchPDescBox">
							Beginning balance adjustments (attach statement)
							<span class="sty5471SchPDotLn">..</span>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965aInclusionEPGrp/BeginningBalanceAdjustmentAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965b4AEPGrp/BeginningBalanceAdjustmentAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEarnInvstUSPropSect959c1AGrp/BeginningBalanceAdjustmentAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection951AInclusionEPGrp/BeginningBalanceAdjustmentAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSect245Ae2Sect959c1AGrp/BeginningBalanceAdjustmentAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection959eSect959c1AGrp/BeginningBalanceAdjustmentAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection964e4Sect959c1AGrp/BeginningBalanceAdjustmentAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 1c -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">1c</div>
						<div class="sty5471SchPDescBox">
							Adjusted beginning balance (combine lines 1a and 1b)
							<span class="sty5471SchPDotLn">.</span>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965aInclusionEPGrp/AdjustedBeginningBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965b4AEPGrp/AdjustedBeginningBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEarnInvstUSPropSect959c1AGrp/AdjustedBeginningBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection951AInclusionEPGrp/AdjustedBeginningBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSect245Ae2Sect959c1AGrp/AdjustedBeginningBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection959eSect959c1AGrp/AdjustedBeginningBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection964e4Sect959c1AGrp/AdjustedBeginningBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">2</div>
						<div class="sty5471SchPDescBox">
							Reduction for taxes unsuspended under anti-splitter rules
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965aInclusionEPGrp/ReductionTxsUnsuspendedRuleAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965b4AEPGrp/ReductionTxsUnsuspendedRuleAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEarnInvstUSPropSect959c1AGrp/ReductionTxsUnsuspendedRuleAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection951AInclusionEPGrp/ReductionTxsUnsuspendedRuleAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSect245Ae2Sect959c1AGrp/ReductionTxsUnsuspendedRuleAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection959eSect959c1AGrp/ReductionTxsUnsuspendedRuleAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection964e4Sect959c1AGrp/ReductionTxsUnsuspendedRuleAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">3</div>
						<div class="sty5471SchPDescBox">
							Previously taxed E&amp;P attributable to distributions of previously taxed E&amp;P from lower-tier foreign corporation
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965aInclusionEPGrp/AttrblDistriPrevTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965b4AEPGrp/AttrblDistriPrevTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEarnInvstUSPropSect959c1AGrp/AttrblDistriPrevTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection951AInclusionEPGrp/AttrblDistriPrevTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSect245Ae2Sect959c1AGrp/AttrblDistriPrevTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection959eSect959c1AGrp/AttrblDistriPrevTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection964e4Sect959c1AGrp/AttrblDistriPrevTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 4 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">4</div>
						<div class="sty5471SchPDescBox">
							E&amp;P carried over in nonrecognition transaction
							<span class="sty5471SchPDotLn">...</span>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965aInclusionEPGrp/EPCyovNonrecognitionTransAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965b4AEPGrp/EPCyovNonrecognitionTransAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEarnInvstUSPropSect959c1AGrp/EPCyovNonrecognitionTransAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection951AInclusionEPGrp/EPCyovNonrecognitionTransAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSect245Ae2Sect959c1AGrp/EPCyovNonrecognitionTransAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection959eSect959c1AGrp/EPCyovNonrecognitionTransAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection964e4Sect959c1AGrp/EPCyovNonrecognitionTransAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">5</div>
						<div class="sty5471SchPDescBox">
							Other adjustments (attach statement)
							<span class="sty5471SchPDotLn">......</span>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965aInclusionEPGrp/TotalOtherAdjustmentsAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965b4AEPGrp/TotalOtherAdjustmentsAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEarnInvstUSPropSect959c1AGrp/TotalOtherAdjustmentsAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection951AInclusionEPGrp/TotalOtherAdjustmentsAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSect245Ae2Sect959c1AGrp/TotalOtherAdjustmentsAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection959eSect959c1AGrp/TotalOtherAdjustmentsAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection964e4Sect959c1AGrp/TotalOtherAdjustmentsAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 6 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">6</div>
						<div class="sty5471SchPDescBox">
							Total previously taxed E&amp;P (combine lines 1c through 5)
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965aInclusionEPGrp/TotalPreviouslyTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965b4AEPGrp/TotalPreviouslyTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEarnInvstUSPropSect959c1AGrp/TotalPreviouslyTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection951AInclusionEPGrp/TotalPreviouslyTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSect245Ae2Sect959c1AGrp/TotalPreviouslyTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection959eSect959c1AGrp/TotalPreviouslyTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection964e4Sect959c1AGrp/TotalPreviouslyTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 7 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">7</div>
						<div class="sty5471SchPDescBox">
							Amounts reclassified to section 959(c)(2) E&amp;P from section 959(c)(3) E&amp;P
							<span class="sty5471SchPDotLn">...........</span>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965aInclusionEPGrp/ReclassifiedSect959c2EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965b4AEPGrp/ReclassifiedSect959c2EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEarnInvstUSPropSect959c1AGrp/ReclassifiedSect959c2EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection951AInclusionEPGrp/ReclassifiedSect959c2EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSect245Ae2Sect959c1AGrp/ReclassifiedSect959c2EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection959eSect959c1AGrp/ReclassifiedSect959c2EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection964e4Sect959c1AGrp/ReclassifiedSect959c2EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 8 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">8</div>
						<div class="sty5471SchPDescBox">
							Actual distributions of previously taxed E&amp;P
							<span class="sty5471SchPDotLn">....</span>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965aInclusionEPGrp/ActualDistributionAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965b4AEPGrp/ActualDistributionAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEarnInvstUSPropSect959c1AGrp/ActualDistributionAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection951AInclusionEPGrp/ActualDistributionAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSect245Ae2Sect959c1AGrp/ActualDistributionAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection959eSect959c1AGrp/ActualDistributionAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection964e4Sect959c1AGrp/ActualDistributionAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 9 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">9</div>
						<div class="sty5471SchPDescBox">
							Amounts reclassified to section 959(c)(1) E&amp;P from section 959(c)(2) E&amp;P
							<span class="sty5471SchPDotLn">...........</span>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965aInclusionEPGrp/ReclassifiedSect959c1EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965b4AEPGrp/ReclassifiedSect959c1EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEarnInvstUSPropSect959c1AGrp/ReclassifiedSect959c1EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection951AInclusionEPGrp/ReclassifiedSect959c1EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSect245Ae2Sect959c1AGrp/ReclassifiedSect959c1EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection959eSect959c1AGrp/ReclassifiedSect959c1EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection964e4Sect959c1AGrp/ReclassifiedSect959c1EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 10 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:10mm;border-bottom:1px solid black;">10</div>
						<div class="sty5471SchPDescBox" style="height:10mm;">
							Amounts included as earnings invested in U.S. property and reclassified to section 959(c)(1) E&amp;P (see instructions)
							<span class="sty5471SchPDotLn">..............</span>
						</div>
						<div class="sty5471SchPLNAmountBox" style="height:10mm;"><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965aInclusionEPGrp/EarnInvstUSPropReclassifiedAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox" style="height:10mm;"><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965b4AEPGrp/EarnInvstUSPropReclassifiedAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox" style="height:10mm;"><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEarnInvstUSPropSect959c1AGrp/EarnInvstUSPropReclassifiedAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox" style="height:10mm;"><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection951AInclusionEPGrp/EarnInvstUSPropReclassifiedAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox" style="height:10mm;"><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSect245Ae2Sect959c1AGrp/EarnInvstUSPropReclassifiedAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox" style="height:10mm;"><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection959eSect959c1AGrp/EarnInvstUSPropReclassifiedAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox" style="height:10mm;"><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection964e4Sect959c1AGrp/EarnInvstUSPropReclassifiedAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 11 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">11</div>
						<div class="sty5471SchPDescBox">
							Other adjustments (attach statement)
							<span class="sty5471SchPDotLn">......</span>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965aInclusionEPGrp/OtherAdjustmentsTotalAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965b4AEPGrp/OtherAdjustmentsTotalAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEarnInvstUSPropSect959c1AGrp/OtherAdjustmentsTotalAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection951AInclusionEPGrp/OtherAdjustmentsTotalAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSect245Ae2Sect959c1AGrp/OtherAdjustmentsTotalAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection959eSect959c1AGrp/OtherAdjustmentsTotalAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection964e4Sect959c1AGrp/OtherAdjustmentsTotalAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 12 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">12</div>
						<div class="sty5471SchPDescBox">
							Balance at beginning of next year (combine lines 6 through 11)
							<span class="sty5471SchPDotLn">..............</span>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965aInclusionEPGrp/BalanceBeginningNextYearAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965b4AEPGrp/BalanceBeginningNextYearAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEarnInvstUSPropSect959c1AGrp/BalanceBeginningNextYearAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection951AInclusionEPGrp/BalanceBeginningNextYearAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSect245Ae2Sect959c1AGrp/BalanceBeginningNextYearAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection959eSect959c1AGrp/BalanceBeginningNextYearAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection964e4Sect959c1AGrp/BalanceBeginningNextYearAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Page footer-->
					<div class="styStdDivLS pageEnd" style="border-top:1px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Paperwork Reduction Act Notice, see instructions.</span>
						<span style="margin-left:60mm;font-size:6.5pt;">Cat. No. 49203F</span>
						<span style="float:right;font-weight:bold;font-size:6.5pt;">Schedule P (Form 5471) (Rev. 12-2019)</span>
					</div>
					<div class="styStdDivLS" style="border-bottom:2px solid black;">
						Schedule P (Form 5471) (Rev. 12-2019)
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span></span>
					</div>
					<div class="styStdDivLS" style="border-bottom:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc" style="font-weight:normal;">
							<strong>Previously Taxed E&amp;P in Functional Currency </strong> (see instructions) <span style="font-style:italic;"> (continued)</span>
						</div>
					</div>
					<!-- Table header latter columns -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:25mm;border-bottom:1px solid black;"><br /></div>
						<div class="sty5471SchPHeaderBox">
							<strong>(h)</strong><br />
							Section <br /> 951(a)(1)(A) <br /> Inclusion <br />(section <br />959(c)(1)(A))
						</div>
						<div class="sty5471SchPHeaderBox">
							<strong>(i)</strong><br />
							Earnings <br />Invested in <br />Excess Passive <br />Assets (section <br />959(c)(1)(B))
						</div>
						<div class="sty5471SchPHeaderBox">
							<strong>(j)</strong><br />
							Section 965(a) <br /> Inclusion <br />(section <br />959(c)(2))
						</div>
						<div class="sty5471SchPHeaderBox">
							<strong>(k)</strong><br />
							Section <br />965(b)(4)(A) <br />(section <br />959(c)(2))
						</div>
						<div class="sty5471SchPHeaderBox">
							<strong>(l)</strong><br />
							Section 951A <br />Inclusion <br />(section <br />959(c)(2))
						</div>
						<div class="sty5471SchPHeaderBox">
							<strong>(m)</strong><br />
							Section <br /> 245A(e)(2) <br /> Inclusion <br />(section <br />959(c)(2))
						</div>
						<div class="sty5471SchPHeaderBox">
							<strong>(n)</strong><br />
							Section 959(e) <br />(section <br />959(c)(2))
						</div>
						<div class="sty5471SchPHeaderBox">
							<strong>(o)</strong><br />
							Section <br />964(e)(4) <br /> Inclusion <br />(section <br />959(c)(2))
						</div>
						<div class="sty5471SchPHeaderBox">
							<strong>(p)</strong><br />
							Section <br /> 951(a)(1)(A) <br /> Inclusion <br />(section <br />959(c)(2))
						</div>
						<div class="sty5471SchPHeaderBox">
							<strong>(q)</strong><br />Total
						</div>
					</div>
					<!-- Line 1a -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">1a</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSect951a1ASect959c1AGrp/BeginningYearBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEarnInvstExcessPassiveAstGrp/BeginningYearBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSect965aInclsnSect959c2Grp/BeginningYearBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection965b4ASect959c2Grp/BeginningYearBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection951AInclusionGrp/BeginningYearBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection245Ae2Sect959c2Grp/BeginningYearBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection959eSect959c2Grp/BeginningYearBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection964e4Sect959c2Grp/BeginningYearBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection951a1ASect959c2Grp/BeginningYearBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCTotalSection964AEPGrp/BeginningYearBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 1b -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">1b</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSect951a1ASect959c1AGrp/BeginningBalanceAdjustmentAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEarnInvstExcessPassiveAstGrp/BeginningBalanceAdjustmentAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSect965aInclsnSect959c2Grp/BeginningBalanceAdjustmentAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection965b4ASect959c2Grp/BeginningBalanceAdjustmentAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection951AInclusionGrp/BeginningBalanceAdjustmentAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection245Ae2Sect959c2Grp/BeginningBalanceAdjustmentAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection959eSect959c2Grp/BeginningBalanceAdjustmentAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection964e4Sect959c2Grp/BeginningBalanceAdjustmentAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection951a1ASect959c2Grp/BeginningBalanceAdjustmentAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCTotalSection964AEPGrp/BeginningBalanceAdjustmentAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 1c -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">1c</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSect951a1ASect959c1AGrp/AdjustedBeginningBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEarnInvstExcessPassiveAstGrp/AdjustedBeginningBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSect965aInclsnSect959c2Grp/AdjustedBeginningBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection965b4ASect959c2Grp/AdjustedBeginningBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection951AInclusionGrp/AdjustedBeginningBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection245Ae2Sect959c2Grp/AdjustedBeginningBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection959eSect959c2Grp/AdjustedBeginningBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection964e4Sect959c2Grp/AdjustedBeginningBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection951a1ASect959c2Grp/AdjustedBeginningBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCTotalSection964AEPGrp/AdjustedBeginningBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">2</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSect951a1ASect959c1AGrp/ReductionTxsUnsuspendedRuleAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEarnInvstExcessPassiveAstGrp/ReductionTxsUnsuspendedRuleAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSect965aInclsnSect959c2Grp/ReductionTxsUnsuspendedRuleAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection965b4ASect959c2Grp/ReductionTxsUnsuspendedRuleAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection951AInclusionGrp/ReductionTxsUnsuspendedRuleAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection245Ae2Sect959c2Grp/ReductionTxsUnsuspendedRuleAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection959eSect959c2Grp/ReductionTxsUnsuspendedRuleAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection964e4Sect959c2Grp/ReductionTxsUnsuspendedRuleAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection951a1ASect959c2Grp/ReductionTxsUnsuspendedRuleAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCTotalSection964AEPGrp/ReductionTxsUnsuspendedRuleAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">3</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSect951a1ASect959c1AGrp/AttrblDistriPrevTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEarnInvstExcessPassiveAstGrp/AttrblDistriPrevTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSect965aInclsnSect959c2Grp/AttrblDistriPrevTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection965b4ASect959c2Grp/AttrblDistriPrevTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection951AInclusionGrp/AttrblDistriPrevTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection245Ae2Sect959c2Grp/AttrblDistriPrevTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection959eSect959c2Grp/AttrblDistriPrevTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection964e4Sect959c2Grp/AttrblDistriPrevTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection951a1ASect959c2Grp/AttrblDistriPrevTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCTotalSection964AEPGrp/AttrblDistriPrevTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 4 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">4</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSect951a1ASect959c1AGrp/EPCyovNonrecognitionTransAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEarnInvstExcessPassiveAstGrp/EPCyovNonrecognitionTransAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSect965aInclsnSect959c2Grp/EPCyovNonrecognitionTransAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection965b4ASect959c2Grp/EPCyovNonrecognitionTransAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection951AInclusionGrp/EPCyovNonrecognitionTransAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection245Ae2Sect959c2Grp/EPCyovNonrecognitionTransAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection959eSect959c2Grp/EPCyovNonrecognitionTransAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection964e4Sect959c2Grp/EPCyovNonrecognitionTransAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection951a1ASect959c2Grp/EPCyovNonrecognitionTransAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCTotalSection964AEPGrp/EPCyovNonrecognitionTransAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">5</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSect951a1ASect959c1AGrp/TotalOtherAdjustmentsAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEarnInvstExcessPassiveAstGrp/TotalOtherAdjustmentsAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSect965aInclsnSect959c2Grp/TotalOtherAdjustmentsAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection965b4ASect959c2Grp/TotalOtherAdjustmentsAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection951AInclusionGrp/TotalOtherAdjustmentsAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection245Ae2Sect959c2Grp/TotalOtherAdjustmentsAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection959eSect959c2Grp/TotalOtherAdjustmentsAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection964e4Sect959c2Grp/TotalOtherAdjustmentsAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection951a1ASect959c2Grp/TotalOtherAdjustmentsAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCTotalSection964AEPGrp/TotalOtherAdjustmentsAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 6 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">6</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSect951a1ASect959c1AGrp/TotalPreviouslyTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEarnInvstExcessPassiveAstGrp/TotalPreviouslyTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSect965aInclsnSect959c2Grp/TotalPreviouslyTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection965b4ASect959c2Grp/TotalPreviouslyTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection951AInclusionGrp/TotalPreviouslyTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection245Ae2Sect959c2Grp/TotalPreviouslyTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection959eSect959c2Grp/TotalPreviouslyTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection964e4Sect959c2Grp/TotalPreviouslyTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection951a1ASect959c2Grp/TotalPreviouslyTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCTotalSection964AEPGrp/TotalPreviouslyTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 7 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">7</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSect951a1ASect959c1AGrp/ReclassifiedSect959c2EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEarnInvstExcessPassiveAstGrp/ReclassifiedSect959c2EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSect965aInclsnSect959c2Grp/ReclassifiedSect959c2EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection965b4ASect959c2Grp/ReclassifiedSect959c2EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection951AInclusionGrp/ReclassifiedSect959c2EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection245Ae2Sect959c2Grp/ReclassifiedSect959c2EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection959eSect959c2Grp/ReclassifiedSect959c2EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection964e4Sect959c2Grp/ReclassifiedSect959c2EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection951a1ASect959c2Grp/ReclassifiedSect959c2EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCTotalSection964AEPGrp/ReclassifiedSect959c2EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 8 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">8</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSect951a1ASect959c1AGrp/ActualDistributionAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEarnInvstExcessPassiveAstGrp/ActualDistributionAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSect965aInclsnSect959c2Grp/ActualDistributionAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection965b4ASect959c2Grp/ActualDistributionAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection951AInclusionGrp/ActualDistributionAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection245Ae2Sect959c2Grp/ActualDistributionAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection959eSect959c2Grp/ActualDistributionAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection964e4Sect959c2Grp/ActualDistributionAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection951a1ASect959c2Grp/ActualDistributionAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCTotalSection964AEPGrp/ActualDistributionAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 9 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">9</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSect951a1ASect959c1AGrp/ReclassifiedSect959c1EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEarnInvstExcessPassiveAstGrp/ReclassifiedSect959c1EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSect965aInclsnSect959c2Grp/ReclassifiedSect959c1EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection965b4ASect959c2Grp/ReclassifiedSect959c1EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection951AInclusionGrp/ReclassifiedSect959c1EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection245Ae2Sect959c2Grp/ReclassifiedSect959c1EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection959eSect959c2Grp/ReclassifiedSect959c1EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection964e4Sect959c2Grp/ReclassifiedSect959c1EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection951a1ASect959c2Grp/ReclassifiedSect959c1EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCTotalSection964AEPGrp/ReclassifiedSect959c1EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 10 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">10</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSect951a1ASect959c1AGrp/EarnInvstUSPropReclassifiedAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEarnInvstExcessPassiveAstGrp/EarnInvstUSPropReclassifiedAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSect965aInclsnSect959c2Grp/EarnInvstUSPropReclassifiedAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection965b4ASect959c2Grp/EarnInvstUSPropReclassifiedAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection951AInclusionGrp/EarnInvstUSPropReclassifiedAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection245Ae2Sect959c2Grp/EarnInvstUSPropReclassifiedAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection959eSect959c2Grp/EarnInvstUSPropReclassifiedAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection964e4Sect959c2Grp/EarnInvstUSPropReclassifiedAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection951a1ASect959c2Grp/EarnInvstUSPropReclassifiedAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCTotalSection964AEPGrp/EarnInvstUSPropReclassifiedAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 11 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">11</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSect951a1ASect959c1AGrp/OtherAdjustmentsTotalAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEarnInvstExcessPassiveAstGrp/OtherAdjustmentsTotalAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSect965aInclsnSect959c2Grp/OtherAdjustmentsTotalAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection965b4ASect959c2Grp/OtherAdjustmentsTotalAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection951AInclusionGrp/OtherAdjustmentsTotalAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection245Ae2Sect959c2Grp/OtherAdjustmentsTotalAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection959eSect959c2Grp/OtherAdjustmentsTotalAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection964e4Sect959c2Grp/OtherAdjustmentsTotalAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection951a1ASect959c2Grp/OtherAdjustmentsTotalAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCTotalSection964AEPGrp/OtherAdjustmentsTotalAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 12 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">12</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSect951a1ASect959c1AGrp/BalanceBeginningNextYearAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEarnInvstExcessPassiveAstGrp/BalanceBeginningNextYearAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSect965aInclsnSect959c2Grp/BalanceBeginningNextYearAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection965b4ASect959c2Grp/BalanceBeginningNextYearAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection951AInclusionGrp/BalanceBeginningNextYearAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection245Ae2Sect959c2Grp/BalanceBeginningNextYearAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection959eSect959c2Grp/BalanceBeginningNextYearAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection964e4Sect959c2Grp/BalanceBeginningNextYearAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCEPSection951a1ASect959c2Grp/BalanceBeginningNextYearAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCTotalSection964AEPGrp/BalanceBeginningNextYearAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Form footer-->
					<div class="styStdDivLS pageEnd" style="border-top:1px solid black;">
						<span style="float:right;font-weight:bold;font-size:6.5pt;">Schedule P (Form 5471) (Rev. 12-2019)</span>
					</div>
					<div class="styStdDivLS" style="border-bottom:2px solid black;">
						Schedule P (Form 5471) (Rev. 12-2019)
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">3</span></span>
					</div>
					<div class="styStdDivLS" style="border-bottom:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc" style="font-weight:normal;">
							<strong>Previously Taxed E&amp;P in U.S. Dollars </strong> (see instructions)
						</div>
					</div>
					<!-- Table header -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:25mm;border-bottom:1px solid black;"><br /></div>
						<div class="sty5471SchPHeaderBox" style="width:75mm;padding-top:8mm;">&nbsp;</div>
						<div class="sty5471SchPHeaderBox">
							<strong>(a)</strong><br />
							Section 965(a) <br /> Inclusion (section <br />959(c)(1)(A))
						</div>
						<div class="sty5471SchPHeaderBox">
							<strong>(b)</strong><br />
							Section <br />965(b)(4)(A) <br />(section <br />959(c)(1)(A))
						</div>
						<div class="sty5471SchPHeaderBox">
							<strong>(c)</strong><br />
							Earnings <br />Invested in <br />U.S. Property <br />(section <br />959(c)(1)(A))
						</div>
						<div class="sty5471SchPHeaderBox">
							<strong>(d)</strong><br />
							Section 951A <br /> Inclusion (section <br />959(c)(1)(A))
						</div>
						<div class="sty5471SchPHeaderBox">
							<strong>(e)</strong><br />
							Section <br /> 245A(e)(2) <br /> Inclusion (section <br />959(c)(1)(A))
						</div>
						<div class="sty5471SchPHeaderBox">
							<strong>(f)</strong><br />
							Section 959(e) <br /> (section <br />959(c)(1)(A))
						</div>
						<div class="sty5471SchPHeaderBox">
							<strong>(g)</strong><br />
							Section 964(e)(4) <br /> Inclusion (section <br />959(c)(1)(A))
						</div>
					</div>
					<!-- Line 1a -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">1a</div>
						<div class="sty5471SchPDescBox">
							Balance at beginning of year (see instructions)
							<span class="sty5471SchPDotLn">...</span>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965aInclusionEPGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965b4AEPGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEarnInvstUSPropSect959c1AGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection951AInclusionEPGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSect245Ae2Sect959c1AGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection959eSect959c1AGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection964e4Sect959c1AGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 1b -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">1b</div>
						<div class="sty5471SchPDescBox">
							Beginning balance adjustments (attach statement)
							<span class="sty5471SchPDotLn">..</span>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965aInclusionEPGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965b4AEPGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEarnInvstUSPropSect959c1AGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection951AInclusionEPGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSect245Ae2Sect959c1AGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection959eSect959c1AGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection964e4Sect959c1AGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 1c -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">1c</div>
						<div class="sty5471SchPDescBox">
							Adjusted beginning balance (combine lines 1a and 1b)
							<span class="sty5471SchPDotLn">.</span>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965aInclusionEPGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965b4AEPGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEarnInvstUSPropSect959c1AGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection951AInclusionEPGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSect245Ae2Sect959c1AGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection959eSect959c1AGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection964e4Sect959c1AGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">2</div>
						<div class="sty5471SchPDescBox">
							Reduction for taxes unsuspended under anti-splitter rules
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965aInclusionEPGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965b4AEPGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEarnInvstUSPropSect959c1AGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection951AInclusionEPGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSect245Ae2Sect959c1AGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection959eSect959c1AGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection964e4Sect959c1AGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">3</div>
						<div class="sty5471SchPDescBox">
							Previously taxed E&amp;P attributable to distributions of previously taxed E&amp;P from lower-tier foreign corporation
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965aInclusionEPGrp/AttrblDistriPrevTaxedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965b4AEPGrp/AttrblDistriPrevTaxedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEarnInvstUSPropSect959c1AGrp/AttrblDistriPrevTaxedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection951AInclusionEPGrp/AttrblDistriPrevTaxedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSect245Ae2Sect959c1AGrp/AttrblDistriPrevTaxedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection959eSect959c1AGrp/AttrblDistriPrevTaxedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection964e4Sect959c1AGrp/AttrblDistriPrevTaxedEPAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 4 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">4</div>
						<div class="sty5471SchPDescBox">
							E&amp;P carried over in nonrecognition transaction
							<span class="sty5471SchPDotLn">...</span>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965aInclusionEPGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965b4AEPGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEarnInvstUSPropSect959c1AGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection951AInclusionEPGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSect245Ae2Sect959c1AGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection959eSect959c1AGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection964e4Sect959c1AGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">5</div>
						<div class="sty5471SchPDescBox">
							Other adjustments (attach statement)
							<span class="sty5471SchPDotLn">......</span>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965aInclusionEPGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965b4AEPGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEarnInvstUSPropSect959c1AGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection951AInclusionEPGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSect245Ae2Sect959c1AGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection959eSect959c1AGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection964e4Sect959c1AGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 6 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">6</div>
						<div class="sty5471SchPDescBox">
							Total previously taxed E&amp;P (combine lines 1c through 5)
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965aInclusionEPGrp/TotalPreviouslyTaxedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965b4AEPGrp/TotalPreviouslyTaxedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEarnInvstUSPropSect959c1AGrp/TotalPreviouslyTaxedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection951AInclusionEPGrp/TotalPreviouslyTaxedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSect245Ae2Sect959c1AGrp/TotalPreviouslyTaxedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection959eSect959c1AGrp/TotalPreviouslyTaxedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection964e4Sect959c1AGrp/TotalPreviouslyTaxedEPAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 7 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">7</div>
						<div class="sty5471SchPDescBox">
							Amounts reclassified to section 959(c)(2) E&amp;P from section 959(c)(3) E&amp;P
							<span class="sty5471SchPDotLn">...........</span>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965aInclusionEPGrp/ReclassifiedSect959c2EPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965b4AEPGrp/ReclassifiedSect959c2EPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEarnInvstUSPropSect959c1AGrp/ReclassifiedSect959c2EPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection951AInclusionEPGrp/ReclassifiedSect959c2EPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSect245Ae2Sect959c1AGrp/ReclassifiedSect959c2EPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection959eSect959c1AGrp/ReclassifiedSect959c2EPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection964e4Sect959c1AGrp/ReclassifiedSect959c2EPAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 8 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">8</div>
						<div class="sty5471SchPDescBox">
							Actual distributions of previously taxed E&amp;P
							<span class="sty5471SchPDotLn">....</span>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965aInclusionEPGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965b4AEPGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEarnInvstUSPropSect959c1AGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection951AInclusionEPGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSect245Ae2Sect959c1AGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection959eSect959c1AGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection964e4Sect959c1AGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 9 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">9</div>
						<div class="sty5471SchPDescBox">
							Amounts reclassified to section 959(c)(1) E&amp;P from section 959(c)(2) E&amp;P
							<span class="sty5471SchPDotLn">...........</span>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965aInclusionEPGrp/ReclassifiedSect959c1EPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965b4AEPGrp/ReclassifiedSect959c1EPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEarnInvstUSPropSect959c1AGrp/ReclassifiedSect959c1EPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection951AInclusionEPGrp/ReclassifiedSect959c1EPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSect245Ae2Sect959c1AGrp/ReclassifiedSect959c1EPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection959eSect959c1AGrp/ReclassifiedSect959c1EPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection964e4Sect959c1AGrp/ReclassifiedSect959c1EPAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 10 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:10mm;border-bottom:1px solid black;">10</div>
						<div class="sty5471SchPDescBox" style="height:10mm;">
							Amounts included as earnings invested in U.S. property and reclassified to section 959(c)(1) E&amp;P (see instructions)
							<span class="sty5471SchPDotLn">..............</span>
						</div>
						<div class="sty5471SchPLNAmountBox" style="height:10mm;"><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965aInclusionEPGrp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox" style="height:10mm;"><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965b4AEPGrp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox" style="height:10mm;"><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEarnInvstUSPropSect959c1AGrp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox" style="height:10mm;"><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection951AInclusionEPGrp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox" style="height:10mm;"><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSect245Ae2Sect959c1AGrp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox" style="height:10mm;"><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection959eSect959c1AGrp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox" style="height:10mm;"><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection964e4Sect959c1AGrp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 11 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">11</div>
						<div class="sty5471SchPDescBox">
							Other adjustments (attach statement)
							<span class="sty5471SchPDotLn">......</span>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965aInclusionEPGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965b4AEPGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEarnInvstUSPropSect959c1AGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection951AInclusionEPGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSect245Ae2Sect959c1AGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection959eSect959c1AGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection964e4Sect959c1AGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 12 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">12</div>
						<div class="sty5471SchPDescBox">
							Balance at beginning of next year (combine lines 6 through 11)
							<span class="sty5471SchPDotLn">..............</span>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965aInclusionEPGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965b4AEPGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEarnInvstUSPropSect959c1AGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection951AInclusionEPGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSect245Ae2Sect959c1AGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection959eSect959c1AGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection964e4Sect959c1AGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:1px solid black;">
						<span style="float:right;font-weight:bold;font-size:6.5pt;">Schedule P (Form 5471) (Rev. 12-2019)</span>
					</div>
					<div class="styStdDivLS" style="border-bottom:2px solid black;">
						Schedule P (Form 5471) (Rev. 12-2019)
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">4</span></span>
					</div>
					<div class="styStdDivLS" style="border-bottom:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc" style="font-weight:normal;">
							<strong>Previously Taxed E&amp;P in U.S. Dollars </strong> (see instructions) <span style="font-style:italic;"> (continued)</span>
						</div>
					</div>
					<!-- Table header latter columns -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:25mm;border-bottom:1px solid black;"><br /></div>
						<div class="sty5471SchPHeaderBox">
							<strong>(h)</strong><br />
							Section <br /> 951(a)(1)(A) <br /> Inclusion <br />(section <br />959(c)(1)(A))
						</div>
						<div class="sty5471SchPHeaderBox">
							<strong>(i)</strong><br />
							Earnings <br />Invested in <br />Excess Passive <br />Assets (section <br />959(c)(1)(B))
						</div>
						<div class="sty5471SchPHeaderBox">
							<strong>(j)</strong><br />
							Section 965(a) <br /> Inclusion <br />(section <br />959(c)(2))
						</div>
						<div class="sty5471SchPHeaderBox">
							<strong>(k)</strong><br />
							Section <br />965(b)(4)(A) <br />(section <br />959(c)(2))
						</div>
						<div class="sty5471SchPHeaderBox">
							<strong>(l)</strong><br />
							Section 951A <br />Inclusion <br />(section <br />959(c)(2))
						</div>
						<div class="sty5471SchPHeaderBox">
							<strong>(m)</strong><br />
							Section <br /> 245A(e)(2) <br /> Inclusion <br />(section <br />959(c)(2))
						</div>
						<div class="sty5471SchPHeaderBox">
							<strong>(n)</strong><br />
							Section 959(e) <br />(section <br />959(c)(2))
						</div>
						<div class="sty5471SchPHeaderBox">
							<strong>(o)</strong><br />
							Section <br />964(e)(4) <br /> Inclusion <br />(section <br />959(c)(2))
						</div>
						<div class="sty5471SchPHeaderBox">
							<strong>(p)</strong><br />
							Section <br /> 951(a)(1)(A) <br /> Inclusion <br />(section <br />959(c)(2))
						</div>
						<div class="sty5471SchPHeaderBox">
							<strong>(q)</strong><br />Total
						</div>
					</div>
					<!-- Line 1a -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">1a</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSect951a1ASect959c1AGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEarnInvstExcessPassiveAstGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSect965aInclsnSect959c2Grp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection965b4ASect959c2Grp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection951AInclusionGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection245Ae2Sect959c2Grp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection959eSect959c2Grp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection964e4Sect959c2Grp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection951a1ASect959c2Grp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USTotalSection964AEPGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 1b -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">1b</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSect951a1ASect959c1AGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEarnInvstExcessPassiveAstGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSect965aInclsnSect959c2Grp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection965b4ASect959c2Grp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection951AInclusionGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection245Ae2Sect959c2Grp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection959eSect959c2Grp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection964e4Sect959c2Grp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection951a1ASect959c2Grp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USTotalSection964AEPGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 1c -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">1c</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSect951a1ASect959c1AGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEarnInvstExcessPassiveAstGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSect965aInclsnSect959c2Grp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection965b4ASect959c2Grp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection951AInclusionGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection245Ae2Sect959c2Grp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection959eSect959c2Grp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection964e4Sect959c2Grp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection951a1ASect959c2Grp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USTotalSection964AEPGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">2</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSect951a1ASect959c1AGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEarnInvstExcessPassiveAstGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSect965aInclsnSect959c2Grp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection965b4ASect959c2Grp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection951AInclusionGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection245Ae2Sect959c2Grp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection959eSect959c2Grp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection964e4Sect959c2Grp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection951a1ASect959c2Grp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USTotalSection964AEPGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">3</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSect951a1ASect959c1AGrp/AttrblDistriPrevTaxedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEarnInvstExcessPassiveAstGrp/AttrblDistriPrevTaxedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSect965aInclsnSect959c2Grp/AttrblDistriPrevTaxedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection965b4ASect959c2Grp/AttrblDistriPrevTaxedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection951AInclusionGrp/AttrblDistriPrevTaxedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection245Ae2Sect959c2Grp/AttrblDistriPrevTaxedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection959eSect959c2Grp/AttrblDistriPrevTaxedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection964e4Sect959c2Grp/AttrblDistriPrevTaxedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection951a1ASect959c2Grp/AttrblDistriPrevTaxedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USTotalSection964AEPGrp/AttrblDistriPrevTaxedEPAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 4 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">4</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSect951a1ASect959c1AGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEarnInvstExcessPassiveAstGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSect965aInclsnSect959c2Grp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection965b4ASect959c2Grp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection951AInclusionGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection245Ae2Sect959c2Grp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection959eSect959c2Grp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection964e4Sect959c2Grp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection951a1ASect959c2Grp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USTotalSection964AEPGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">5</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSect951a1ASect959c1AGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEarnInvstExcessPassiveAstGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSect965aInclsnSect959c2Grp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection965b4ASect959c2Grp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection951AInclusionGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection245Ae2Sect959c2Grp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection959eSect959c2Grp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection964e4Sect959c2Grp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection951a1ASect959c2Grp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USTotalSection964AEPGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 6 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">6</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSect951a1ASect959c1AGrp/TotalPreviouslyTaxedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEarnInvstExcessPassiveAstGrp/TotalPreviouslyTaxedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSect965aInclsnSect959c2Grp/TotalPreviouslyTaxedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection965b4ASect959c2Grp/TotalPreviouslyTaxedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection951AInclusionGrp/TotalPreviouslyTaxedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection245Ae2Sect959c2Grp/TotalPreviouslyTaxedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection959eSect959c2Grp/TotalPreviouslyTaxedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection964e4Sect959c2Grp/TotalPreviouslyTaxedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection951a1ASect959c2Grp/TotalPreviouslyTaxedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USTotalSection964AEPGrp/TotalPreviouslyTaxedEPAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 7 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">7</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSect951a1ASect959c1AGrp/ReclassifiedSect959c2EPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEarnInvstExcessPassiveAstGrp/ReclassifiedSect959c2EPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSect965aInclsnSect959c2Grp/ReclassifiedSect959c2EPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection965b4ASect959c2Grp/ReclassifiedSect959c2EPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection951AInclusionGrp/ReclassifiedSect959c2EPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection245Ae2Sect959c2Grp/ReclassifiedSect959c2EPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection959eSect959c2Grp/ReclassifiedSect959c2EPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection964e4Sect959c2Grp/ReclassifiedSect959c2EPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection951a1ASect959c2Grp/ReclassifiedSect959c2EPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USTotalSection964AEPGrp/ReclassifiedSect959c2EPAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 8 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">8</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSect951a1ASect959c1AGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEarnInvstExcessPassiveAstGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSect965aInclsnSect959c2Grp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection965b4ASect959c2Grp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection951AInclusionGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection245Ae2Sect959c2Grp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection959eSect959c2Grp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection964e4Sect959c2Grp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection951a1ASect959c2Grp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USTotalSection964AEPGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 9 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">9</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSect951a1ASect959c1AGrp/ReclassifiedSect959c1EPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEarnInvstExcessPassiveAstGrp/ReclassifiedSect959c1EPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSect965aInclsnSect959c2Grp/ReclassifiedSect959c1EPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection965b4ASect959c2Grp/ReclassifiedSect959c1EPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection951AInclusionGrp/ReclassifiedSect959c1EPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection245Ae2Sect959c2Grp/ReclassifiedSect959c1EPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection959eSect959c2Grp/ReclassifiedSect959c1EPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection964e4Sect959c2Grp/ReclassifiedSect959c1EPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection951a1ASect959c2Grp/ReclassifiedSect959c1EPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USTotalSection964AEPGrp/ReclassifiedSect959c1EPAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 10 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">10</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSect951a1ASect959c1AGrp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEarnInvstExcessPassiveAstGrp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSect965aInclsnSect959c2Grp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection965b4ASect959c2Grp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection951AInclusionGrp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection245Ae2Sect959c2Grp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection959eSect959c2Grp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection964e4Sect959c2Grp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection951a1ASect959c2Grp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USTotalSection964AEPGrp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 11 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">11</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSect951a1ASect959c1AGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEarnInvstExcessPassiveAstGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSect965aInclsnSect959c2Grp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection965b4ASect959c2Grp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection951AInclusionGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection245Ae2Sect959c2Grp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection959eSect959c2Grp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection964e4Sect959c2Grp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection951a1ASect959c2Grp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USTotalSection964AEPGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 12 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">12</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSect951a1ASect959c1AGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEarnInvstExcessPassiveAstGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSect965aInclsnSect959c2Grp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection965b4ASect959c2Grp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection951AInclusionGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection245Ae2Sect959c2Grp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection959eSect959c2Grp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection964e4Sect959c2Grp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USEPSection951a1ASect959c2Grp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USTotalSection964AEPGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:1px solid black;">
						<span style="float:right;font-weight:bold;font-size:6.5pt;">Schedule P (Form 5471) (Rev. 12-2019)</span>
					</div>
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
				</form>
			</body>
		</html>
	</xsl:template>	
</xsl:stylesheet>
