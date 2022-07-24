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
	<xsl:include href="IRS5471ScheduleI1Style.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS5471ScheduleI1" />
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
				<meta name="Description" content="IRS Form 5471 Schedule I1" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS5471ScheduleI1Style" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form5471ScheduleI1">
					<xsl:call-template name="DocumentHeader" />
					<!-- Header -->		
					<div class="styStdDiv">
						<div class="styFNBox" style="width:29mm;height:19mm;border-right-width:2px;">
							<div class="styFormNumber" style="font-size:10pt;">SCHEDULE I-1
								<br/>
								(Form 5471)
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData" />
								</xsl:call-template>
							</div>
							<div class="" style="padding-top:.5mm;font-size:7pt;">(Rev. December 2021)</div>
							<div class="styAgency" style="padding-top:.5mm;">Department of the Treasury
								<br/>Internal Revenue Service
							</div>
						</div>
						<div class="styFTBox" style="width:129mm;height:19mm;">
							<span class="styFMT" style="font-size:11pt;">Information for Global Intangible Low-Taxed Income</span>
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
							<div class="styOMB" style="padding-top:8mm;border-bottom-width:0px;">OMB No. 1545-0123</div>
						</div>
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
									<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
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
					<!-- Category Section -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="styLNDesc" style="">
							Separate Category (Enter code &mdash; see instructions.)
							<span class="sty5471SchI1DotLn">.................</span>
						</div>
						<div class="styLNRightNumBox" style="border-left-width:0px;border-bottom-width:0px;">
							&#9658;
						</div>
						<div class="styLNAmountBoxNBB" style="border-left-width:0px;text-align:center;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/SeparateCategoryCd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- TH line -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="styLNLeftNumBox"></div>
						<div class="styLNDesc" style="width:84mm;height:8mm;padding-top:2mm;">&nbsp;</div>
						<div class="styLNRightNumBox" style="border-left-width:0px;height:8mm;"></div>
						<div class="sty5471SchI1LNAmountBox" style="height:8mm;text-align:center;padding-top:1mm;">
							Functional <br />Currency
						</div>
						<div class="sty5471SchI1LNAmountBoxRT" style="height:8mm;text-align:center;padding-top:1mm;">
							Conversion <br />Rate
						</div>
						<div class="sty5471SchI1LNAmountBoxAmt" style="height:8mm;text-align:center;padding-top:2.5mm;">
							U.S. Dollars
						</div>
					</div>
					<!-- Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="width:84mm;height:6.5mm;" >
							Gross income (see instructions if cost of good sold exceed gross receipts)
							<span class="sty5471SchI1DotLn">..................</span>
						</div>
						<div class="styLNRightNumBox" style="height:6.5mm;padding-top:3mm;">1</div>
						<div class="sty5471SchI1LNAmountBox" style="height:6.5mm; padding-top:3mm;" > 
							
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/GrossIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchI1LNAmountBoxRT" style="background-color:lightgrey;border-bottom-width:0px;height:6.5mm;">
							&nbsp;
						</div>
						<div class="sty5471SchI1LNAmountBoxAmt" style="background-color:lightgrey;border-bottom-width:0px;height:6.5mm;">
							&nbsp;
						</div>
					</div>
					<!-- Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="height:6.5mm;">2</div>
						<div class="styLNDesc" style="width:84mm;height:6.5mm;">
							Exclusions (see instructions if cost of good sold exceed gross receipts)
							
						</div>
						<div class="styLNRightNumBox" style="background-color:lightgrey;border-bottom-width:0px;height:6.5mm;"></div>
						<div class="sty5471SchI1LNAmountBox" style="background-color:lightgrey;border-bottom-width:0px;height:6.5mm;">
							&nbsp;
						</div>
						<div class="sty5471SchI1LNAmountBoxRT" style="background-color:lightgrey;border-bottom-width:0px;height:6.5mm;">
							&nbsp;
						</div>
						<div class="sty5471SchI1LNAmountBoxAmt" style="background-color:lightgrey;border-bottom-width:0px;height:6.5mm;">
							&nbsp;
						</div>
					</div>
					<!-- Line 2a -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBox" style="padding-left:4.2mm;">a</div>
						<div class="styLNDesc" style="width:47mm;">
							Effectively connected income
							<span class="sty5471SchI1DotLn">..</span>
						</div>
						<div class="styLNRightNumBox">2a</div>
						<div class="sty5471SchI1LNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ECIAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="background-color:lightgrey;border-bottom-width:0px;"></div>
						<div class="sty5471SchI1LNAmountBox" style="background-color:lightgrey;border-bottom-width:0px;">
							&nbsp;
						</div>
						<div class="sty5471SchI1LNAmountBoxRT" style="background-color:lightgrey;border-bottom-width:0px;">
							&nbsp;
						</div>
						<div class="sty5471SchI1LNAmountBoxAmt" style="background-color:lightgrey;border-bottom-width:0px;">
							&nbsp;
						</div>
					</div>
					<!-- Line 2b -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBox" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="width:47mm;">
							Subpart F income
							<span class="sty5471SchI1DotLn">.....</span>
						</div>
						<div class="styLNRightNumBox">2b</div>
						<div class="sty5471SchI1LNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SubpartFIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="background-color:lightgrey;border-bottom-width:0px;"></div>
						<div class="sty5471SchI1LNAmountBox" style="background-color:lightgrey;border-bottom-width:0px;">
							&nbsp;
						</div>
						<div class="sty5471SchI1LNAmountBoxRT" style="background-color:lightgrey;border-bottom-width:0px;">
							&nbsp;
						</div>
						<div class="sty5471SchI1LNAmountBoxAmt" style="background-color:lightgrey;border-bottom-width:0px;">
							&nbsp;
						</div>
					</div>
					<!-- Line 2c -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBox" style="padding-left:4.2mm;">c</div>
						<div class="styLNDesc" style="height:7.2mm;width:47mm;">
							High-tax exception income per section 954(b)(4)
							<span class="sty5471SchI1DotLn">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.2mm;"><br />2c</div>
						<div class="sty5471SchI1LNAmountBox" style="height:7.2mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/HighTaxExceptionIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:7.2mm;background-color:lightgrey;border-bottom-width:0px;"></div>
						<div class="sty5471SchI1LNAmountBox" style="height:7.2mm;background-color:lightgrey;border-bottom-width:0px;">
							&nbsp;
						</div>
						<div class="sty5471SchI1LNAmountBoxRT" style="height:7.2mm;background-color:lightgrey;border-bottom-width:0px;">
							&nbsp;
						</div>
						<div class="sty5471SchI1LNAmountBoxAmt" style="height:7.2mm;background-color:lightgrey;border-bottom-width:0px;">
							&nbsp;
						</div>
					</div>
					<!-- Line 2d -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBox" style="padding-left:4.2mm;">d</div>
						<div class="styLNDesc" style="width:47mm;">
							Related party dividends
							<span class="sty5471SchI1DotLn">....</span>
						</div>
						<div class="styLNRightNumBox">2d</div>
						<div class="sty5471SchI1LNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/RelatedPartyDividendsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="background-color:lightgrey;border-bottom-width:0px;"></div>
						<div class="sty5471SchI1LNAmountBox" style="background-color:lightgrey;border-bottom-width:0px;">
							&nbsp;
						</div>
						<div class="sty5471SchI1LNAmountBoxRT" style="background-color:lightgrey;border-bottom-width:0px;">
							&nbsp;
						</div>
						<div class="sty5471SchI1LNAmountBoxAmt" style="background-color:lightgrey;border-bottom-width:0px;">
							&nbsp;
						</div>
					</div>
					<!-- Line 2e -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBox" style="padding-left:4.2mm;">e</div>
						<div class="styLNDesc" style="width:47mm;">
							Foreign oil and gas extraction income
						</div>
						<div class="styLNRightNumBox">2e</div>
						<div class="sty5471SchI1LNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FrgnOilGasExtractionIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="background-color:lightgrey;border-bottom-width:0px;"></div>
						<div class="sty5471SchI1LNAmountBox" style="background-color:lightgrey;border-bottom-width:0px;">
							&nbsp;
						</div>
						<div class="sty5471SchI1LNAmountBoxRT" style="background-color:lightgrey;border-bottom-width:0px;">
							&nbsp;
						</div>
						<div class="sty5471SchI1LNAmountBoxAmt" style="background-color:lightgrey;border-bottom-width:0px;">
							&nbsp;
						</div>
					</div>
					<!-- Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="width:84mm;">
							Total exclusions (combine lines 2a through 2e)
							<span class="sty5471SchI1DotLn">.....</span>
						</div>
						<div class="styLNRightNumBox">3</div>
						<div class="sty5471SchI1LNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalIncomeExclusionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchI1LNAmountBoxRT" style="background-color:lightgrey;border-bottom-width:0px;">
							&nbsp;
						</div>
						<div class="sty5471SchI1LNAmountBoxAmt" style="background-color:lightgrey;border-bottom-width:0px;">
							&nbsp;
						</div>
					</div>
					<!-- Line 4 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc" style="width:84mm; height:6.5mm;">
							Gross income less total exclusions (line 1 minus line 3) (see instructions)
							<span class="sty5471SchI1DotLn">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:6.5mm;padding-top:3mm;">4</div>
						<div class="sty5471SchI1LNAmountBox" style="height:6.5mm;padding-top:3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/GrossIncomeLessTotIncmExclAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchI1LNAmountBoxRT" style="background-color:lightgrey;border-bottom-width:0px;height:6.5mm;">
							&nbsp;
						</div>
						<div class="sty5471SchI1LNAmountBoxAmt" style="background-color:lightgrey;border-bottom-width:0px;height:6.5mm;">
							&nbsp;
						</div>
					</div>
					<!-- Line 5 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc" style="width:84mm;">
							Deductions property allocable to amount on line 4
							<span class="sty5471SchI1DotLn">....</span>
						</div>
						<div class="styLNRightNumBox">5</div>
						<div class="sty5471SchI1LNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AllocableDeductionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchI1LNAmountBoxRT" style="background-color:lightgrey;">
							&nbsp;
						</div>
						<div class="sty5471SchI1LNAmountBoxAmt" style="background-color:lightgrey;">
							&nbsp;
						</div>
					</div>
					<!-- Line 6 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc" style="width:84mm;">
							Tested income (loss) (line 4 minus line 5) (see instructions)
							<span class="sty5471SchI1DotLn">..</span>
						</div>
						<div class="styLNRightNumBox">6</div>
						<div class="sty5471SchI1LNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TestedIncomeLossGrp/FunctionalCurrencyAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchI1LNAmountBoxRT" style="font-size:6pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TestedIncomeLossGrp/ConversionRt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchI1LNAmountBoxAmt" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TestedIncomeLossGrp/USDollarAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 7 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc" style="width:84mm;">
							Tested foreign income taxes
							<span class="sty5471SchI1DotLn">...........</span>
						</div>
						<div class="styLNRightNumBox">7</div>
						<div class="sty5471SchI1LNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TestedForeignIncomeTaxesGrp/FunctionalCurrencyAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchI1LNAmountBoxRT" style="font-size:6pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TestedForeignIncomeTaxesGrp/ConversionRt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchI1LNAmountBoxAmt" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TestedForeignIncomeTaxesGrp/USDollarAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 8 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="styLNDesc" style="width:84mm;">
							Qualified business asset investment (QBAI)
							<span class="sty5471SchI1DotLn">.......</span>
						</div>
						<div class="styLNRightNumBox">8</div>
						<div class="sty5471SchI1LNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ProRataShareQBAIGrp/FunctionalCurrencyAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchI1LNAmountBoxRT" style="font-size:6pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ProRataShareQBAIGrp/ConversionRt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchI1LNAmountBoxAmt" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ProRataShareQBAIGrp/USDollarAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 9a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">9a</div>
						<div class="styLNDesc" style="width:47mm;">
							Interest expense included in line 5
						</div>
						<div class="styLNRightNumBox">9a</div>
						<div class="sty5471SchI1LNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/InterestExpenseAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="background-color:lightgrey;border-bottom-width:0px;"></div>
						<div class="sty5471SchI1LNAmountBox" style="background-color:lightgrey;border-bottom-width:0px;">
							&nbsp;
						</div>
						<div class="sty5471SchI1LNAmountBoxRT" style="background-color:lightgrey;border-bottom-width:0px;">
							&nbsp;
						</div>
						<div class="sty5471SchI1LNAmountBoxAmt" style="background-color:lightgrey;border-bottom-width:0px;">
							&nbsp;
						</div>
					</div>
					<!-- Line 9b -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBox" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="width:47mm;">
							Qualified interest expense
							<span class="sty5471SchI1DotLn">...</span>
						</div>
						<div class="styLNRightNumBox">9b</div>
						<div class="sty5471SchI1LNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QualifiedInterestExpenseAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="background-color:lightgrey;border-bottom-width:0px;"></div>
						<div class="sty5471SchI1LNAmountBox" style="background-color:lightgrey;border-bottom-width:0px;">
							&nbsp;
						</div>
						<div class="sty5471SchI1LNAmountBoxRT" style="background-color:lightgrey;border-bottom-width:0px;">
							&nbsp;
						</div>
						<div class="sty5471SchI1LNAmountBoxAmt" style="background-color:lightgrey;border-bottom-width:0px;">
							&nbsp;
						</div>
					</div>
					<!-- Line 9c -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBox" style="padding-left:4.2mm;">c</div>
						<div class="styLNDesc" style="width:47mm;">
							Tested loss QBAI amount
							<span class="sty5471SchI1DotLn">...</span>
						</div>
						<div class="styLNRightNumBox">9c</div>
						<div class="sty5471SchI1LNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TestedLossQBAIAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="background-color:lightgrey;border-bottom-width:0px;"></div>
						<div class="sty5471SchI1LNAmountBox" style="background-color:lightgrey;border-bottom-width:0px;">
							&nbsp;
						</div>
						<div class="sty5471SchI1LNAmountBoxRT" style="background-color:lightgrey;border-bottom-width:0px;">
							&nbsp;
						</div>
						<div class="sty5471SchI1LNAmountBoxAmt" style="background-color:lightgrey;border-bottom-width:0px;">
							&nbsp;
						</div>
					</div>
					<!-- Line 9d -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBox" style="padding-left:4.2mm;">d</div>
						<div class="styLNDesc" style="width:84mm;height:7mm;">
							Tested interest expense (line 9a minus the sum of line 9b and <br /> line 9c). If zero or less, enter -0-
							<span class="sty5471SchI1DotLn">.........</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br />9d</div>
						<div class="sty5471SchI1LNAmountBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TestedInterestExpenseGrp/FunctionalCurrencyAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchI1LNAmountBoxRT" style="height:7mm;padding-top:0.6mm;"><br />
							<span style="display:inline;font-size:6pt;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TestedInterestExpenseGrp/ConversionRt"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="sty5471SchI1LNAmountBoxAmt" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TestedInterestExpenseGrp/USDollarAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 10a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">10a</div>
						<div class="styLNDesc" style="width:47mm;">
							Interest income included in line 4
							<!--<span class="sty5471SchI1DotLn">......</span>-->
						</div>
						<div class="styLNRightNumBox">10a</div>
						<div class="sty5471SchI1LNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/InterestIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="background-color:lightgrey;border-bottom-width:0px;"></div>
						<div class="sty5471SchI1LNAmountBox" style="background-color:lightgrey;border-bottom-width:0px;">
							&nbsp;
						</div>
						<div class="sty5471SchI1LNAmountBoxRT" style="background-color:lightgrey;border-bottom-width:0px;">
							&nbsp;
						</div>
						<div class="sty5471SchI1LNAmountBoxAmt" style="background-color:lightgrey;border-bottom-width:0px;">
							&nbsp;
						</div>
					</div>
					<!-- Line 10b -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBox" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="width:47mm;">
							Qualified interest income
							<span class="sty5471SchI1DotLn">...</span>
						</div>
						<div class="styLNRightNumBox">10b</div>
						<div class="sty5471SchI1LNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QualifiedInterestIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="background-color:lightgrey;border-bottom-width:0px;"></div>
						<div class="sty5471SchI1LNAmountBox" style="background-color:lightgrey;border-bottom-width:0px;">
							&nbsp;
						</div>
						<div class="sty5471SchI1LNAmountBoxRT" style="background-color:lightgrey;border-bottom-width:0px;">
							&nbsp;
						</div>
						<div class="sty5471SchI1LNAmountBoxAmt" style="background-color:lightgrey;border-bottom-width:0px;">
							&nbsp;
						</div>
					</div>
					<!-- Line 10c -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBox" style="padding-left:4.2mm;">c</div>
						<div class="styLNDesc" style="width:84mm;height:7mm;">
							Tested interest income (line 10a minus line 10b) <br />
							If zero or less, enter -0-
							<span class="sty5471SchI1DotLn">............</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;border-bottom-width:0px;"><br />10c</div>
						<div class="sty5471SchI1LNAmountBox" style="height:7mm;border-bottom-width:0px;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TestedInterestIncomeGrp/FunctionalCurrencyAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchI1LNAmountBoxRT" style="height:7mm;padding-top:0.5mm;border-bottom-width:0px;"><br />
							<span style="display:inline;font-size:6pt;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TestedInterestIncomeGrp/ConversionRt"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="sty5471SchI1LNAmountBoxAmt" style="height:7mm;border-bottom-width:0px;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TestedInterestIncomeGrp/USDollarAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Form footer-->
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Paperwork Reduction Act Notice, see instructions.</span>
						<span style="margin-left:20mm;font-size:6.5pt;">Cat. No. 71400M</span>
						<span style="float:right;font-weight:bold;font-size:6.5pt;">Schedule I-1 (Form 5471) (Rev. 12-2021)</span>
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
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Separate Category - Sanctioned Country Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SanctionedCountryCd"/>
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
