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
							<div class="" style="padding-top:.5mm;font-size:7pt;">(Rev. December 2020)</div>
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
						<div class="styLNLeftNumBox" style="width:6mm;height:15mm;border-bottom:1px solid black;"><br /></div>
						<div class="sty5471SchPHeaderBox" style="width:75mm;padding-top:8mm">&nbsp;</div>
						<div class="sty5471SchPHeaderBox">
							<strong>(a)</strong><br />
							Reclassified section 965(a) <br /> PTEP 
						</div>
						<div class="sty5471SchPHeaderBox">
							<strong>(b)</strong><br />
							Reclassified section 965(b)<br />PTEP
						</div>
						<div class="sty5471SchPHeaderBox">
							<strong>(c)</strong><br />
							General section <br />959(c)(1) <br />PTEP
						</div>
						<div class="sty5471SchPHeaderBox">
							<strong>(d)</strong><br />
							Reclassifed section 951A <br /> PTEP <br />
						</div>
						<div class="sty5471SchPHeaderBox">
							<strong>(e)</strong><br />
							Reclassified section <br /> 245A(d) <br /> PTEP 
						</div>
						<div class="sty5471SchPHeaderBox">
							<strong>(f)</strong><br />
							Section 965(a) <br /> PTEP
						</div>
						<div class="sty5471SchPHeaderBox">
							<strong>(g)</strong><br />
							Section 965(b)<br /> PTEP
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
							<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect965aPTEPGrp/BeginningYearBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect965bPTEPGrp/BeginningYearBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
					    	   <xsl:with-param name="TargetNode" select="$FormData/FCGeneralSection959c1PTEPGrp/BeginningYearBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
					    		<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect951APTEPGrp/BeginningYearBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
							  <xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect245AdPTEPGrp/BeginningYearBalanceAmt"/>
							  <xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965aPTEPGrp/BeginningYearBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965bPTEPGrp/BeginningYearBalanceAmt"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect965aPTEPGrp/BeginningBalanceAdjustmentAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect965bPTEPGrp/BeginningBalanceAdjustmentAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCGeneralSection959c1PTEPGrp/BeginningBalanceAdjustmentAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect951APTEPGrp/BeginningBalanceAdjustmentAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect245AdPTEPGrp/BeginningBalanceAdjustmentAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965aPTEPGrp/BeginningBalanceAdjustmentAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965bPTEPGrp/BeginningBalanceAdjustmentAmt"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect965aPTEPGrp/AdjustedBeginningBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect965bPTEPGrp/AdjustedBeginningBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCGeneralSection959c1PTEPGrp/AdjustedBeginningBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect951APTEPGrp/AdjustedBeginningBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect245AdPTEPGrp/AdjustedBeginningBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965aPTEPGrp/AdjustedBeginningBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965bPTEPGrp/AdjustedBeginningBalanceAmt"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect965aPTEPGrp/ReductionTxsUnsuspendedRuleAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect965bPTEPGrp/ReductionTxsUnsuspendedRuleAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCGeneralSection959c1PTEPGrp/ReductionTxsUnsuspendedRuleAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect951APTEPGrp/ReductionTxsUnsuspendedRuleAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect245AdPTEPGrp/ReductionTxsUnsuspendedRuleAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965aPTEPGrp/ReductionTxsUnsuspendedRuleAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965bPTEPGrp/ReductionTxsUnsuspendedRuleAmt"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect965aPTEPGrp/AttrblDistriPrevTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect965bPTEPGrp/AttrblDistriPrevTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCGeneralSection959c1PTEPGrp/AttrblDistriPrevTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect951APTEPGrp/AttrblDistriPrevTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect245AdPTEPGrp/AttrblDistriPrevTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965aPTEPGrp/AttrblDistriPrevTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965bPTEPGrp/AttrblDistriPrevTaxedEPAmt"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect965aPTEPGrp/EPCyovNonrecognitionTransAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect965bPTEPGrp/EPCyovNonrecognitionTransAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCGeneralSection959c1PTEPGrp/EPCyovNonrecognitionTransAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect951APTEPGrp/EPCyovNonrecognitionTransAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect245AdPTEPGrp/EPCyovNonrecognitionTransAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965aPTEPGrp/EPCyovNonrecognitionTransAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965bPTEPGrp/EPCyovNonrecognitionTransAmt"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect965aPTEPGrp/TotalOtherAdjustmentsAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect965bPTEPGrp/TotalOtherAdjustmentsAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCGeneralSection959c1PTEPGrp/TotalOtherAdjustmentsAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect951APTEPGrp/TotalOtherAdjustmentsAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect245AdPTEPGrp/TotalOtherAdjustmentsAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965aPTEPGrp/TotalOtherAdjustmentsAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965bPTEPGrp/TotalOtherAdjustmentsAmt"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect965aPTEPGrp/TotalPreviouslyTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect965bPTEPGrp/TotalPreviouslyTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCGeneralSection959c1PTEPGrp/TotalPreviouslyTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect951APTEPGrp/TotalPreviouslyTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect245AdPTEPGrp/TotalPreviouslyTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965aPTEPGrp/TotalPreviouslyTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965bPTEPGrp/TotalPreviouslyTaxedEPAmt"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect965aPTEPGrp/ReclassifiedSect959c2EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect965bPTEPGrp/ReclassifiedSect959c2EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCGeneralSection959c1PTEPGrp/ReclassifiedSect959c2EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect951APTEPGrp/ReclassifiedSect959c2EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect245AdPTEPGrp/ReclassifiedSect959c2EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965aPTEPGrp/ReclassifiedSect959c2EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965bPTEPGrp/ReclassifiedSect959c2EPAmt"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect965aPTEPGrp/ActualDistributionAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect965bPTEPGrp/ActualDistributionAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCGeneralSection959c1PTEPGrp/ActualDistributionAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect951APTEPGrp/ActualDistributionAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect245AdPTEPGrp/ActualDistributionAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965aPTEPGrp/ActualDistributionAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965bPTEPGrp/ActualDistributionAmt"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect965aPTEPGrp/ReclassifiedSect959c1EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect965bPTEPGrp/ReclassifiedSect959c1EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCGeneralSection959c1PTEPGrp/ReclassifiedSect959c1EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect951APTEPGrp/ReclassifiedSect959c1EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect245AdPTEPGrp/ReclassifiedSect959c1EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965aPTEPGrp/ReclassifiedSect959c1EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965bPTEPGrp/ReclassifiedSect959c1EPAmt"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect965aPTEPGrp/EarnInvstUSPropReclassifiedAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox" style="height:10mm;"><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect965bPTEPGrp/EarnInvstUSPropReclassifiedAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox" style="height:10mm;"><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCGeneralSection959c1PTEPGrp/EarnInvstUSPropReclassifiedAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox" style="height:10mm;"><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect951APTEPGrp/EarnInvstUSPropReclassifiedAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox" style="height:10mm;"><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect245AdPTEPGrp/EarnInvstUSPropReclassifiedAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox" style="height:10mm;"><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965aPTEPGrp/EarnInvstUSPropReclassifiedAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox" style="height:10mm;"><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965bPTEPGrp/EarnInvstUSPropReclassifiedAmt"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect965aPTEPGrp/OtherAdjustmentsTotalAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect965bPTEPGrp/OtherAdjustmentsTotalAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCGeneralSection959c1PTEPGrp/OtherAdjustmentsTotalAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect951APTEPGrp/OtherAdjustmentsTotalAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect245AdPTEPGrp/OtherAdjustmentsTotalAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965aPTEPGrp/OtherAdjustmentsTotalAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965bPTEPGrp/OtherAdjustmentsTotalAmt"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect965aPTEPGrp/BalanceBeginningNextYearAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect965bPTEPGrp/BalanceBeginningNextYearAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCGeneralSection959c1PTEPGrp/BalanceBeginningNextYearAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect951APTEPGrp/BalanceBeginningNextYearAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCReclassifiedSect245AdPTEPGrp/BalanceBeginningNextYearAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965aPTEPGrp/BalanceBeginningNextYearAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection965bPTEPGrp/BalanceBeginningNextYearAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Page footer-->
					<div class="styStdDivLS pageEnd" style="border-top:1px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Paperwork Reduction Act Notice, see instructions.</span>
						<span style="margin-left:60mm;font-size:6.5pt;">Cat. No. 49203F</span>
						<span style="float:right;font-weight:bold;font-size:6.5pt;">Schedule P (Form 5471) (Rev. 12-2020)</span>
					</div>
					<div class="styStdDivLS" style="border-bottom:2px solid black;">
						Schedule P (Form 5471) (Rev. 12-2020)
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
						<div class="styLNLeftNumBox" style="width:6mm;height:15mm;border-bottom:1px solid black;"><br /></div>
						<div class="sty5471SchPHeaderBox">
							<strong>(h)</strong><br />
							Section <br /> 951(a) <br /> PTEP
						</div>
						<div class="sty5471SchPHeaderBox">
							<strong>(i)</strong><br />
							Section 245A(d) <br />PTEP
						</div>
						<div class="sty5471SchPHeaderBox">
							<strong>(j)</strong><br />
							Section 951(a)(1)(A) <br /> PTEP
						</div>
						<div class="sty5471SchPHeaderBox" style="border-right-width: 1px">
							<strong>(k)</strong><br />
							Total <br/>
						</div>
						
					</div>
					<!-- Line 1a -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">1a</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection951APTEPGrp/BeginningYearBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection245AdPTEPGrp/BeginningYearBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection951a1APTEPGrp/BeginningYearBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox" style="border-right-width: 1px"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCTotalPTEPGrp/BeginningYearBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						
						
					</div>
					<!-- Line 1b -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">1b</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection951APTEPGrp/BeginningBalanceAdjustmentAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection245AdPTEPGrp/BeginningBalanceAdjustmentAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection951a1APTEPGrp/BeginningBalanceAdjustmentAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox" style="border-right-width: 1px"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCTotalPTEPGrp/BeginningBalanceAdjustmentAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						
					</div>
					<!-- Line 1c -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">1c</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection951APTEPGrp/AdjustedBeginningBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection245AdPTEPGrp/AdjustedBeginningBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection951a1APTEPGrp/AdjustedBeginningBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox" style="border-right-width: 1px"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCTotalPTEPGrp/AdjustedBeginningBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
					
					
					</div>
					<!-- Line 2 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">2</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection951APTEPGrp/ReductionTxsUnsuspendedRuleAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection245AdPTEPGrp/ReductionTxsUnsuspendedRuleAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection951a1APTEPGrp/ReductionTxsUnsuspendedRuleAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox" style="border-right-width: 1px"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCTotalPTEPGrp/ReductionTxsUnsuspendedRuleAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						
					</div>
					<!-- Line 3 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">3</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection951APTEPGrp/AttrblDistriPrevTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection245AdPTEPGrp/AttrblDistriPrevTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection951a1APTEPGrp/AttrblDistriPrevTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox" style="border-right-width: 1px"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCTotalPTEPGrp/AttrblDistriPrevTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 4 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">4</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection951APTEPGrp/EPCyovNonrecognitionTransAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection245AdPTEPGrp/EPCyovNonrecognitionTransAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection951a1APTEPGrp/EPCyovNonrecognitionTransAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox" style="border-right-width: 1px"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCTotalPTEPGrp/EPCyovNonrecognitionTransAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						
					</div>
					<!-- Line 5 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">5</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection951APTEPGrp/TotalOtherAdjustmentsAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection245AdPTEPGrp/TotalOtherAdjustmentsAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection951a1APTEPGrp/TotalOtherAdjustmentsAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox" style="border-right-width: 1px"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCTotalPTEPGrp/TotalOtherAdjustmentsAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 6 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">6</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection951APTEPGrp/TotalPreviouslyTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection245AdPTEPGrp/TotalPreviouslyTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection951a1APTEPGrp/TotalPreviouslyTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox" style="border-right-width: 1px"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCTotalPTEPGrp/TotalPreviouslyTaxedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						
					</div>
					<!-- Line 7 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">7</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection951APTEPGrp/ReclassifiedSect959c2EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection245AdPTEPGrp/ReclassifiedSect959c2EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection951a1APTEPGrp/ReclassifiedSect959c2EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox" style="border-right-width: 1px"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCTotalPTEPGrp/ReclassifiedSect959c2EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>						
					</div>
					<!-- Line 8 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">8</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection951APTEPGrp/ActualDistributionAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection245AdPTEPGrp/ActualDistributionAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection951a1APTEPGrp/ActualDistributionAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox" style="border-right-width: 1px"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCTotalPTEPGrp/ActualDistributionAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						
					</div>
					<!-- Line 9 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">9</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection951APTEPGrp/ReclassifiedSect959c1EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection245AdPTEPGrp/ReclassifiedSect959c1EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection951a1APTEPGrp/ReclassifiedSect959c1EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox" style="border-right-width: 1px"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCTotalPTEPGrp/ReclassifiedSect959c1EPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						
					</div>
					<!-- Line 10 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">10</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection951APTEPGrp/EarnInvstUSPropReclassifiedAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection245AdPTEPGrp/EarnInvstUSPropReclassifiedAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection951a1APTEPGrp/EarnInvstUSPropReclassifiedAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox" style="border-right-width: 1px"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCTotalPTEPGrp/EarnInvstUSPropReclassifiedAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
							
					</div>
					<!-- Line 11 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">11</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection951APTEPGrp/OtherAdjustmentsTotalAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection245AdPTEPGrp/OtherAdjustmentsTotalAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection951a1APTEPGrp/OtherAdjustmentsTotalAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox" style="border-right-width: 1px"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCTotalPTEPGrp/OtherAdjustmentsTotalAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
					
					</div>
					<!-- Line 12 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">12</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection951APTEPGrp/BalanceBeginningNextYearAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection245AdPTEPGrp/BalanceBeginningNextYearAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCSection951a1APTEPGrp/BalanceBeginningNextYearAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox" style="border-right-width: 1px"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FCTotalPTEPGrp/BalanceBeginningNextYearAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Form footer-->
					<div class="styStdDivLS pageEnd" style="border-top:1px solid black;">
						<span style="float:right;font-weight:bold;font-size:6.5pt;">Schedule P (Form 5471) (Rev. 12-2020)</span>
					</div>
					<div class="styStdDivLS" style="border-bottom:2px solid black;">
						Schedule P (Form 5471) (Rev. 12-2020)
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">3</span></span>
					</div>
					<div class="styStdDivLS" style="border-bottom:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc" style="font-weight:normal;">
							<strong>Previously Taxed E&amp;P in U.S. Dollars </strong> 
						</div>
					</div>
					<!-- Table header -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:15mm;border-bottom:1px solid black;"><br /></div>
						<div class="sty5471SchPHeaderBox" style="width:75mm;padding-top:8mm;">&nbsp;</div>
						<div class="sty5471SchPHeaderBox">
							<strong>(a)</strong><br />
							Reclassified section 965(a) <br /> PTEP
						</div>
						<div class="sty5471SchPHeaderBox">
							<strong>(b)</strong><br />
							Reclassified section 965(b)<br />PTEP
						</div>
						<div class="sty5471SchPHeaderBox">
							<strong>(c)</strong><br />
							General section 959(c)(1)<br />PTEP
						</div>
						<div class="sty5471SchPHeaderBox">
							<strong>(d)</strong><br />
							Reclassified section 951A <br /> PTEP
						</div>
						<div class="sty5471SchPHeaderBox">
							<strong>(e)</strong><br />
							Reclassifed section 245A(d) <br /> PTEP
						</div>
						<div class="sty5471SchPHeaderBox">
							<strong>(f)</strong><br />
							Section 965(a) <br /> PTEP
						</div>
						<div class="sty5471SchPHeaderBox">
							<strong>(g)</strong><br />
							Section 965(b) <br /> PTEP
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
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect965aPTEPGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect965bPTEPGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USGeneralSection959c1PTEPGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect951APTEPGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect245AdPTEPGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965aPTEPGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965aPTEPGrp/BeginningYearBalanceAmt"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect965aPTEPGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect965bPTEPGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USGeneralSection959c1PTEPGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect951APTEPGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect245AdPTEPGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965aPTEPGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965aPTEPGrp/BeginningBalanceAdjustmentAmt"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect965aPTEPGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect965bPTEPGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USGeneralSection959c1PTEPGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect951APTEPGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect245AdPTEPGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965aPTEPGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965aPTEPGrp/AdjustedBeginningBalanceAmt"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect965aPTEPGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect965bPTEPGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USGeneralSection959c1PTEPGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect951APTEPGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect245AdPTEPGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965aPTEPGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965aPTEPGrp/ReductionTxsUnsuspendedRuleAmt"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect965aPTEPGrp/AttrblDistriPrevTaxedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect965bPTEPGrp/AttrblDistriPrevTaxedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USGeneralSection959c1PTEPGrp/AttrblDistriPrevTaxedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect951APTEPGrp/AttrblDistriPrevTaxedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect245AdPTEPGrp/AttrblDistriPrevTaxedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965aPTEPGrp/AttrblDistriPrevTaxedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965aPTEPGrp/AttrblDistriPrevTaxedEPAmt"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect965aPTEPGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect965bPTEPGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USGeneralSection959c1PTEPGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect951APTEPGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect245AdPTEPGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965aPTEPGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965aPTEPGrp/EPCyovNonrecognitionTransAmt"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect965aPTEPGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect965bPTEPGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USGeneralSection959c1PTEPGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect951APTEPGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect245AdPTEPGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965aPTEPGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965aPTEPGrp/TotalOtherAdjustmentsAmt"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect965aPTEPGrp/TotalPreviouslyTaxedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect965bPTEPGrp/TotalPreviouslyTaxedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USGeneralSection959c1PTEPGrp/TotalPreviouslyTaxedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect951APTEPGrp/TotalPreviouslyTaxedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect245AdPTEPGrp/TotalPreviouslyTaxedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965aPTEPGrp/TotalPreviouslyTaxedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965aPTEPGrp/TotalPreviouslyTaxedEPAmt"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect965aPTEPGrp/ReclassifiedSect959c2EPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect965bPTEPGrp/ReclassifiedSect959c2EPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USGeneralSection959c1PTEPGrp/ReclassifiedSect959c2EPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect951APTEPGrp/ReclassifiedSect959c2EPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect245AdPTEPGrp/ReclassifiedSect959c2EPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965aPTEPGrp/ReclassifiedSect959c2EPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965aPTEPGrp/ReclassifiedSect959c2EPAmt"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect965aPTEPGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect965bPTEPGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USGeneralSection959c1PTEPGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect951APTEPGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect245AdPTEPGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965aPTEPGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965aPTEPGrp/ActualDistributionAmt"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect965aPTEPGrp/ReclassifiedSect959c1EPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect965bPTEPGrp/ReclassifiedSect959c1EPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USGeneralSection959c1PTEPGrp/ReclassifiedSect959c1EPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect951APTEPGrp/ReclassifiedSect959c1EPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect245AdPTEPGrp/ReclassifiedSect959c1EPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965aPTEPGrp/ReclassifiedSect959c1EPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965aPTEPGrp/ReclassifiedSect959c1EPAmt"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect965aPTEPGrp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox" style="height:10mm;"><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect965bPTEPGrp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox" style="height:10mm;"><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USGeneralSection959c1PTEPGrp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox" style="height:10mm;"><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect951APTEPGrp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox" style="height:10mm;"><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect245AdPTEPGrp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox" style="height:10mm;"><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965aPTEPGrp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox" style="height:10mm;"><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965aPTEPGrp/EarnInvstUSPropReclassifiedAmt"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect965aPTEPGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect965bPTEPGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USGeneralSection959c1PTEPGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect951APTEPGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect245AdPTEPGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965aPTEPGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965aPTEPGrp/OtherAdjustmentsTotalAmt"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect965aPTEPGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect965bPTEPGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USGeneralSection959c1PTEPGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect951APTEPGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USReclassifiedSect245AdPTEPGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965aPTEPGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection965aPTEPGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:1px solid black;">
						<span style="float:right;font-weight:bold;font-size:6.5pt;">Schedule P (Form 5471) (Rev. 12-2020)</span>
					</div>
					<div class="styStdDivLS" style="border-bottom:2px solid black;">
						Schedule P (Form 5471) (Rev. 12-2020)
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">4</span></span>
					</div>
					<div class="styStdDivLS" style="border-bottom:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc" style="font-weight:normal;">
							<strong>Previously Taxed E&amp;P in U.S. Dollars </strong> <span style="font-style:italic;"> (continued)</span>
						</div>
					</div>
					<!-- Table header latter columns -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:15mm;border-bottom:1px solid black;"><br /></div>
						<div class="sty5471SchPHeaderBox">
							<strong>(h)</strong><br />
							Section 951(a) <br /> PTEP
						</div>
						<div class="sty5471SchPHeaderBox">
							<strong>(i)</strong><br />
							Section 245A(d) <br />PTEP
						</div>
						<div class="sty5471SchPHeaderBox">
							<strong>(j)</strong><br />
							Section 951(a)(1)(A) <br /> PTEP
            			</div>
						<div class="sty5471SchPHeaderBox"  style="border-right-width: 1px">
							<strong>(k)</strong><br />
							Total <br />
						</div>
						
					</div>
					<!-- Line 1a -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">1a</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection951APTEPGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection245AdPTEPGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection951a1APTEPGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox" style="border-right-width: 1px"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USTotalPTEPGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
						
					</div>
					<!-- Line 1b -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">1b</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection951APTEPGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection245AdPTEPGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection951a1APTEPGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox" style="border-right-width: 1px"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USTotalPTEPGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
					
					</div>
					<!-- Line 1c -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">1c</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection951APTEPGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection245AdPTEPGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection951a1APTEPGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox" style="border-right-width: 1px"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USTotalPTEPGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
					
					</div>
					<!-- Line 2 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">2</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection951APTEPGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection245AdPTEPGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection951a1APTEPGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox" style="border-right-width: 1px"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USTotalPTEPGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						
					</div>
					<!-- Line 3 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">3</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection951APTEPGrp/AttrblDistriPrevTaxedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection245AdPTEPGrp/AttrblDistriPrevTaxedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection951a1APTEPGrp/AttrblDistriPrevTaxedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox" style="border-right-width: 1px"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USTotalPTEPGrp/AttrblDistriPrevTaxedEPAmt"/>
							</xsl:call-template>
						</div>
						
					</div>
					<!-- Line 4 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">4</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection951APTEPGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection245AdPTEPGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection951a1APTEPGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox" style="border-right-width: 1px"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USTotalPTEPGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>						
					</div>
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">5</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection951APTEPGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection245AdPTEPGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection951a1APTEPGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"  style="border-right-width: 1px"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USTotalPTEPGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 6 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">6</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection951APTEPGrp/TotalPreviouslyTaxedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection245AdPTEPGrp/TotalPreviouslyTaxedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection951a1APTEPGrp/TotalPreviouslyTaxedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox" style="border-right-width: 1px"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USTotalPTEPGrp/TotalPreviouslyTaxedEPAmt"/>
							</xsl:call-template>
						</div>					
					</div>
					<!-- Line 7 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">7</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection951APTEPGrp/ReclassifiedSect959c2EPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection245AdPTEPGrp/ReclassifiedSect959c2EPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection951a1APTEPGrp/ReclassifiedSect959c2EPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox" style="border-right-width: 1px"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USTotalPTEPGrp/ReclassifiedSect959c2EPAmt"/>
							</xsl:call-template>
						</div>						
					</div>
					<!-- Line 8 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">8</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection951APTEPGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection245AdPTEPGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection951a1APTEPGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"  style="border-right-width: 1px"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USTotalPTEPGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>					
					</div>
					<!-- Line 9 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">9</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection951APTEPGrp/ReclassifiedSect959c1EPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection245AdPTEPGrp/ReclassifiedSect959c1EPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection951a1APTEPGrp/ReclassifiedSect959c1EPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"  style="border-right-width: 1px"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USTotalPTEPGrp/ReclassifiedSect959c1EPAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 10 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">10</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection951APTEPGrp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection245AdPTEPGrp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection951a1APTEPGrp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"  style="border-right-width: 1px"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USTotalPTEPGrp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>						
					</div>
						<!-- Line 11 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">11</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection951APTEPGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection245AdPTEPGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection951a1APTEPGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"  style="border-right-width: 1px"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USTotalPTEPGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 12 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:6mm;height:7mm;border-bottom:1px solid black;">12</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection951APTEPGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection245AdPTEPGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USSection951a1APTEPGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchPLNAmountBox"  style="border-right-width: 1px"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USTotalPTEPGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>						
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:1px solid black;">
						<span style="float:right;font-weight:bold;font-size:6.5pt;">Schedule P (Form 5471) (Rev. 12-2020)</span>
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
