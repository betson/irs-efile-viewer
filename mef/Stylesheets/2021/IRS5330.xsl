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
	<xsl:include href="IRS5330Style.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS5330" />
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
				<meta name="Description" content="IRS Form 5330" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS5330Style" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form5330">
					<xsl:call-template name="DocumentHeader" />
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDiv">
						<div class="styFNBox" style="width:29mm;height:20.3mm;">
							Form <span class="styFN" style="font-size:18pt;">5330</span> 
							<br />
							(Rev. December 2021)<br />
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData" />
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="TargetNode" select="$FormData/SpecialConditionDesc"/>
								<xsl:with-param name="Desc">Top Left Header - Special Condition Description</xsl:with-param>
							</xsl:call-template>
							<br />
							<span class="styAgency">
								Department of the Treasury <br />
								Internal Revenue Service
							</span>
						</div>
						<div class="styFTBox" style="width:130mm;height:20.3mm;">
							<span class="styFMT" style="font-size:11pt;padding-top:0.2mm;padding-bottom:0.5mm;">
								Return of Excise Taxes Related to Employee Benefit Plans
							</span><br />
							<span style="font-weight:bold;font-size:8pt;font-family:Arial;">
								(under sections 4965, 4971, 4972, 4973(a)(3), 4975, 4976, 4977, 4978, 4979, <br />
								4979A, 4980, and 4980F of the Internal Revenue Code)
							</span><br /><br />
							<span style="font-weight:bold;">
								&#9658;Go to
								<span style="font-style:italic">www.irs.gov/Form5330</span>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:28mm;height:20.3mm;padding-top:8mm;">
							<div class="styOMB" style="height:auto;font-size:6pt;border:none;">OMB No. 1545-0575</div>
						</div>
					</div>
					<div class="styStdDiv" style="padding-top:2px;padding-bottom:2px;border-top:2px solid black;border-bottom:1px solid black;">
						Filer tax year beginning 
						<span style="width:49mm;text-align:center;border-bottom:1px solid black;">
						<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
						</span>
						and ending 
						<span style="width:49mm;text-align:center;border-bottom:1px solid black;">
						<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
						</span>
					</div>
					<!-- Filer information section -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styGenericDiv" style="width:135mm;border-right:1px solid black;">
							<div class="styLNLeftNumBox" style="width:5.6mm;">A</div>
							<div class="sty5330HeaderCell" style="height:10.5mm;width:129mm;border-left:none;">
								Name of filer (see instructions)
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/InCareOfNm"/>
									<xsl:with-param name="Desc">Header - In Care Of Name</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessNameControlTxt"/>
									<xsl:with-param name="Desc">Header - Business Name Control</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimaryNameControlTxt"/>
									<xsl:with-param name="Desc">Header - Primary Name Control</xsl:with-param>
								</xsl:call-template>
								<br />
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
								</xsl:call-template>
								<br />
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
								</xsl:call-template>
							</div>
							<div class="styLNLeftNumBox" style="width:5.6mm;">&nbsp;</div>
							<div class="sty5330HeaderCell" style="height:10mm;width:129mm;border-left:none;">
								<span>Number, street, and room or suite no. (If a P.O. box or foreign address, see instructions.)</span>
								<br />
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
								</xsl:call-template>
								<br />
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
								</xsl:call-template>
							</div>
							<div class="styLNLeftNumBox" style="width:5.6mm;">&nbsp;</div>
							<div class="sty5330HeaderCell" style="min-height:7mm;width:129mm;border-bottom-width:0px;height:auto;border-left:none;">
								<span>City or town, state or province, country, and ZIP or foreign postal code</span>
								<br />
								<span style="display:inline;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
									</xsl:call-template>
									<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
										<span style="width:7px;"/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
											<xsl:with-param name="MainForm" select="true()"/>
										</xsl:call-template>
									</xsl:if>
								</span>
							</div>
						</div>
						<div class="styGenericDiv" style="width:52mm;">
							<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;">B</div>
							<div class="styEINBox" style="width:48mm;height:10.5mm;padding-left:1mm;font-weight:bold;;border-bottom:none;font-size:inherit;">
								Filer's identifying number <br />(Enter either the EIN or SSN, but not both. See instructions.)
							</div>
							<div class="styLNLeftNumBox" style="width:4mm;height:10mm;padding-left:none;border-bottom:1px solid black;">&nbsp;</div>
							<div class="sty5330HeaderCell" style="width:48mm;height:10mm;border-left:none;">
								Employer identification number (EIN)<br />
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
									<xsl:with-param name="EINChanged" select="true()"/>
								</xsl:call-template>
							</div>
							<div class="styLNLeftNumBox" style="width:4mm;padding-left:none;">&nbsp;</div>
							<div class="sty5330HeaderCell" style="width:48mm;height:7mm;border-bottom:none;border-left:none;">
								Social security number (SSN) <br />
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">SSN</xsl:with-param>
									<xsl:with-param name="EINChanged" select="true()"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styGenericDiv" style="width:135mm;border-right:1px solid black;">
							<div class="styLNLeftNumBox" style="width:5.6mm;height:7mm;border-bottom:1px solid black;">C</div>
							<div class="sty5330HeaderCell" style="height:7mm;width:129mm;border-left:none;">
								<span>Name of plan</span>
								<br />
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/PlanNameTxt"/>
								</xsl:call-template>
							</div>
							<div class="styLNLeftNumBox" style="width:5.6mm;">D</div>
							<div class="sty5330HeaderCell" style="min-height:7mm;width:129mm;border-bottom-width:0px;height:auto;border-left:none;">
								<span>Name and address of plan sponsor</span>
								<br />
								<span style="display:inline;font-size:6pt;">
									<xsl:choose>
										<xsl:when test="$FormData/PlanSponsorPersonNm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/PlanSponsorPersonNm"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/PlanSponsorBusinessName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="$FormData/PlanSponsorBusinessName/BusinessNameLine2Txt">
												<br />
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/PlanSponsorBusinessName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:otherwise>
									</xsl:choose>
									<br />
									<xsl:choose>
										<xsl:when test="$FormData/PlanSponsorForeignAddress">
											<xsl:call-template name="PopulateForeignAddressTemplate">
												<xsl:with-param name="TargetNode" select="$FormData/PlanSponsorForeignAddress"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateUSAddressTemplate">
												<xsl:with-param name="TargetNode" select="$FormData/PlanSponsorUSAddress"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</span>
							</div>
						</div>
						<div class="styGenericDiv" style="width:52mm;">
							<div class="styLNLeftNumBox" style="height:7mm;width:4mm;padding-left:1mm;border-bottom:1px solid black;">E</div>
							<div class="sty5330HeaderCell" style="width:48mm;height:7mm;border-left:none;">
								Plan sponsor's EIN <br />
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="$FormData/PlanSponsorEIN"/>
								</xsl:call-template>
							</div>
							<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;">F</div>
							<div class="sty5330HeaderCell" style="width:48mm;height:7mm;border-left:none;border-bottom:none;">
								Plan year ending (MM/DD/YYYY)<br />
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/PlanYearEndDt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="styGenericDiv" style="width:52mm;float:right;">
							<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;">G</div>
							<div class="sty5330HeaderCell" style="width:48mm;height:7mm;border-left:none;border-bottom:none;">
								Plan number<br />
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/PlanNum"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styGenericDiv" style="width:135mm;border-right:1px solid black;">
							<div class="styLNLeftNumBox" style="width:5.6mm;">H</div>
							<div class="sty5330HeaderCell" style="height:7mm;width:129mm;border-bottom-width:0px;border-left:none;">
								If this is an <strong>amended return</strong>, check here
								<span class="sty5330DotLn" style="float:none;padding-right:none;padding-left:4px;">...............&#9658;</span>
								<input type="checkbox" class="styCkboxNM" style="" alt="Amended Return">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/AmendedReturnInd"/>
										<xsl:with-param name="BackupName">F5330AmendedReturnInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/AmendedReturnInd"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					
					<!-- Part 1 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;padding-top:1mm;padding-bottom:1mm;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc" style="height:auto;">
							Taxes.
							<span style="display:inline;font-weight:normal;">
								You can only complete one section of Part I for each Form 5330 filed. See instructions.
							</span>
						</div>
					</div>
					<!-- Section A -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="sty5330Desc" style="width:138.2mm;font-weight:bold;padding-left:2mm;font-size:8pt;padding-top:1.5mm;">
							Section A. Taxes that are reported by the last day of the 7th month after the end of the tax year 
							of the employer (or other person who must file the return)
						</div>
						<div class="sty5330NumBox" style="padding-top:0px;padding-bottom:0px;border-bottom:none;border-right-width:1px;">FOR IRS USE ONLY</div>
						<div class="styLNRightNumBoxNBB" style="border-left:none;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="border-left:none;">&nbsp;</div>
					</div>
					<!-- Part 1, Section A, Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="sty5330Desc" style="">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="sty5330Desc" style="">
							Section 4972 tax on nondeductible contributions to qualified plans (from Schedule A, line 12)
							<span class="sty5330DotLn">...</span>
						</div>
						<div class="sty5330NumBox">161</div>
						<div class="styLNRightNumBox" style="">1</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionATaxesReportedGrp/TaxNondedContriQlfyPlnsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Section A, Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="sty5330Desc" style="">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="sty5330Desc" style="">
							Section 4973(a)(3) tax on excess contributions to section 403(b)(7)(A) custodial accounts (from Schedule B, line 12)
							<span class="sty5330DotLn">.........................</span>
						</div>
						<div class="sty5330NumBox" style="height:7.3mm;"><br />164</div>
						<div class="styLNRightNumBox" style="height:7.3mm;"><br />2</div>
						<div class="styLNAmountBox" style="height:7.3mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionATaxesReportedGrp/TxExcessContriCustodialAcctAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Section A, Line 3a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="sty5330Desc" style="">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3a</div>
						<div class="sty5330Desc" style="">
							Section 4975(a) tax on prohibited transactions (from Schedule C, line 3)
							<span class="sty5330DotLn">.........</span>
						</div>
						<div class="sty5330NumBox">159</div>
						<div class="styLNRightNumBox" style="">3a</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionATaxesReportedGrp/IRS5330ScheduleC/TotProhibitedTransactionTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Section A, Line 3b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="sty5330Desc" style="">
							Section 4975(b) tax on failure to correct prohibited transactions
							<span class="sty5330DotLn">............</span>
						</div>
						<div class="sty5330NumBox">224</div>
						<div class="styLNRightNumBox" style="">3b</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionATaxesReportedGrp/FailCorrectProhibTransTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Section A, Line 4 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="sty5330Desc" style="">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="sty5330Desc" style="">
							Section 4976 tax on disqualified benefits for funded welfare plans
							<span class="sty5330DotLn">...........</span>
						</div>
						<div class="sty5330NumBox">200</div>
						<div class="styLNRightNumBox" style="">4</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionATaxesReportedGrp/DsqlfyBnftFnddWlfrPlnsTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Section A, Line 5a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="sty5330Desc" style="">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">5a</div>
						<div class="sty5330Desc" style="">
							Section 4978 tax on ESOP dispositions
							<span class="sty5330DotLn">....................</span>
						</div>
						<div class="sty5330NumBox">209</div>
						<div class="styLNRightNumBox" style="">5a</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionATaxesReportedGrp/ESOPDispositionTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Section A, Line 3b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="sty5330Desc" style="">
							The tax on line 5a is a result of the application of: 
							<input type="checkbox" class="styCkboxNM" style="margin-left:6mm;" alt="ESOP Disposition Tax from section 644 G">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/SectionATaxesReportedGrp/ESOPDisposTaxFromSect664gInd"/>
									<xsl:with-param name="BackupName">F5330SecAESOPDisposTaxFromSect664gInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Sec. 644(g)
							<input type="checkbox" class="styCkboxNM" style="margin-left:6mm;" alt="ESOP Disposition Tax from Section 1042">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/SectionATaxesReportedGrp/ESOPDisposTaxFromSect1042Ind"/>
									<xsl:with-param name="BackupName">F5330SecAESOPDisposTaxFromSect1042Ind</xsl:with-param>
								</xsl:call-template>
							</input>
							Sec. 1042
						</div>
						<div class="sty5330NumBox" style="height:4.5mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">5b</div>
						<div class="styLNAmountBox" style="height:4.5mm;background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Part 1, Section A, Line 6 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="sty5330Desc" style="">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="sty5330Desc" style="">
							Section 4979A tax on certain prohibited allocations of qualified ESOP securities or ownership of synthetic equity
							<span class="sty5330DotLn">..........................</span>
						</div>
						<div class="sty5330NumBox" style="height:7.3mm;"><br />203</div>
						<div class="styLNRightNumBox" style="height:7.3mm;"><br />6</div>
						<div class="styLNAmountBox" style="height:7.3mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionATaxesReportedGrp/ProhibAllocnESOPSecEqtyTxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Section A, Line 7 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="sty5330Desc" style="">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="sty5330Desc" style="">
							<strong>Total Section A taxes. </strong> 
							Add lines 1 through 6. Enter here and on Part II, line 17
							<span class="sty5330DotLn" style="margin-right:-6px;">.....&#9658;</span>
						</div>
						<div class="sty5330NumBox" style="border-bottom-width:0px;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="">7</div>
						<div class="styLNAmountBoxNBB" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionATaxesReportedGrp/TotalTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Section B -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:2px solid black;font-weight:bold;font-size:8pt;padding:0.5mm 0mm 0.5mm 3mm;">
						Section B. Taxes that are reported by the 15th day of the 10th month after the last day of the plan year
					</div>
					<!-- Part 1, Section B, Line 8a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">8a</div>
						<div class="sty5330Desc" style="">
							Section 4971(a) tax on failure to meet minimum funding standards (from Schedule D, line 2)
							<span class="sty5330DotLn">..</span>
						</div>
						<div class="sty5330NumBox">163</div>
						<div class="styLNRightNumBox" style="">8a</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionBTaxesReportedGrp/IRS5330ScheduleD/FailureToMeetMFSTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Section B, Line 8b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="sty5330Desc" style="">
							Section 4971(b) tax for failure to correct minimum funding standards
							<span class="sty5330DotLn">..........</span>
						</div>
						<div class="sty5330NumBox">225</div>
						<div class="styLNRightNumBox" style="">8b</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionBTaxesReportedGrp/FailureToCorrectMFSTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="sty5330Desc" style="">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
					</div>
					<!-- Part 1, Section B, Line 9a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">9a</div>
						<div class="sty5330Desc" style="">
							Section 4971(f)(1) tax on failure to pay liquidity shortfall (from Schedule E, line 4)
							<span class="sty5330DotLn">......</span>
						</div>
						<div class="sty5330NumBox">226</div>
						<div class="styLNRightNumBox" style="">9a</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionBTaxesReportedGrp/IRS5330ScheduleE/FTPLiquidityShortfallTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Section B, Line 9b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="sty5330Desc" style="">
							Section 4971(f)(2) tax for failure to correct liquidity shortfall
							<span class="sty5330DotLn">.............</span>
						</div>
						<div class="sty5330NumBox">227</div>
						<div class="styLNRightNumBox" style="">9b</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionBTaxesReportedGrp/FailCorrectLiquidityShrtTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="sty5330Desc" style="">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
					</div>
					<!-- Part 1, Section B, Line 10 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">10a</div>
						<div class="sty5330Desc" style="">
							Section 4971(g)(2) tax on failure to comply with a funding improvement or rehabilitation plan (see instructions)
							<span class="sty5330DotLn">............................</span>
						</div>
						<div class="sty5330NumBox" style="height:7.3mm;"><br />450</div>
						<div class="styLNRightNumBox" style="height:7.3mm;"><br />10a</div>
						<div class="styLNAmountBox" style="height:7.3mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionBTaxesReportedGrp/FailCmplyFndngImprvRehbltTxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">b</div>
						<div class="sty5330Desc" style="">
							Section 4971(g)(3) tax on failure to meet requirements for plans in endangered or critical status <br /> 
							(from Schedule F, line 1c)
							<span class="sty5330DotLn">........................</span>
						</div>
						<div class="sty5330NumBox" style="height:7.3mm;"><br />451</div>
						<div class="styLNRightNumBox" style="height:7.3mm;"><br />10b</div>
						<div class="styLNAmountBox" style="height:7.3mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionBTaxesReportedGrp/IRS5330ScheduleF/FailureMeetRqrEndngrCrtclTxGrp/FailMeetRqrPlnEndngrCrtclTxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
						<div class="sty5330Desc" style="">
							Section 4971(g)(4) tax on failure to adopt rehabilitation plan (from Schedule F, line 2d)
							<span class="sty5330DotLn">....</span>
						</div>
						<div class="sty5330NumBox" style="border-bottom-width:0px;">452</div>
						<div class="styLNRightNumBoxNBB" style="">10c</div>
						<div class="styLNAmountBoxNBB" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionBTaxesReportedGrp/IRS5330ScheduleF/FailureAdoptRehbltPlanTxGrp/FailureToAdoptRehbltPlanTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Section B1 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:2px solid black;font-weight:bold;font-size:8pt;padding:0.5mm 0mm 0.5mm 3mm;">
						Section B1. Tax that is reported by the last day of the 7th month after the end of the calendar year in which 
						the excess fringe benefits were paid to the employer's employees
					</div>
					<!-- Part 1, Section B, Line 11 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">11</div>
						<div class="sty5330Desc" style="">
							Section 4977 tax on excess fringe benefits (from Schedule G, line 4)
							<span class="sty5330DotLn">..........</span>
						</div>
						<div class="sty5330NumBox">201</div>
						<div class="styLNRightNumBox" style="">11</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionB1TaxReportedGrp/ExcessFringeBenefitsTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="sty5330Desc" style="">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
					</div>
					<!-- Part 1, Section B, Line 12 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">12</div>
						<div class="sty5330Desc" style="">
							<strong>Total Section B taxes. </strong> 
							Add lines 8a through 11. Enter here and on Part II, line 17
							<span class="sty5330DotLn" style="margin-right:-6px;">.....&#9658;</span>
						</div>
						<div class="sty5330NumBox" style="border-bottom-width:0px;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="">12</div>
						<div class="styLNAmountBoxNBB" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalSectionBTaxesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Section C -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:2px solid black;font-weight:bold;font-size:8pt;padding:0.5mm 0mm 0.5mm 3mm;">
						Section C. Tax that is reported by the last day of the 15th month after the end of the plan year
					</div>
					<!-- Part 1, Section C, Line 13 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">13</div>
						<div class="sty5330Desc" style="">
							Section 4979 tax on excess contributions to certain plans (from Schedule H, Line 2). Enter here <br /> and on Part II, line 17
							<span class="sty5330DotLn" style="margin-right:-6px;">........................&#9658;</span>
						</div>
						<div class="sty5330NumBox" style="height:7.3mm;border-bottom-width:0px;"><br />205</div>
						<div class="styLNRightNumBoxNBB" style="height:7.3mm;"><br />13</div>
						<div class="styLNAmountBoxNBB" style="height:7.3mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionCTaxReportedGrp/ExcessContributionCrtnPlnTxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Privacy Act and Paperwork Reduction Act Notice, see instructions.</span>
						<span style="margin-left:20mm;">Cat. No. 11870M</span>
						<span style="float:right;">Form <strong>5330</strong> (Rev. 12-2021)</span>
					</div>
					<!-- Page 2 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						Form 5330 (Rev. 12-2021)
						<div style="float:right;">Page <strong>2</strong></div>
					</div>
					<div class="styStdDiv" style="padding:2px 0px;">
						Name of filer: 
						<span style="width:115mm;">
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<xsl:if test="$RtnHdrData/Filer//BusinessNameLine2Txt">
								<br />
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						</span>
						Filer's identifying number: 
						<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
					</div>
					<!-- Section D -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:2px solid black;font-weight:bold;font-size:8pt;padding:0.5mm 0mm 0.5mm 3mm;">
						Section D. Tax that is reported by the last day of the month following the month in which the reversion occurred
					</div>
					<!-- Part 1, Section D, Line 14 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">14</div>
						<div class="sty5330Desc" style="">
							Section 4980 tax on reversion of qualified plan assets to an employer (from Schedule I, Line 3). <br /> Enter here and on Part II, line 17
							<span class="sty5330DotLn" style="margin-right:-6px;">....................&#9658;</span>
						</div>
						<div class="sty5330NumBox" style="height:7.3mm;border-bottom-width:0px;"><br />204</div>
						<div class="styLNRightNumBoxNBB" style="height:7.3mm;"><br />14</div>
						<div class="styLNAmountBoxNBB" style="height:7.3mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionDTaxReportedGrp/ReversionQlfyPlanAstEmplrTxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Section E -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:2px solid black;font-weight:bold;font-size:8pt;padding:0.5mm 0mm 0.5mm 3mm;">
						Section E. Tax that is reported by the last day of the month following the month in which the failure occurred
					</div>
					<!-- Part 1, Section E, Line 15 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">15</div>
						<div class="sty5330Desc" style="">
							Section 4980F tax on failure to provide notice of significant reduction in future accruals (from Schedule J, Line 5). Enter here and on Part II, line 17
							<span class="sty5330DotLn" style="margin-right:-6px;">.................&#9658;</span>
						</div>
						<div class="sty5330NumBox" style="height:7.3mm;border-bottom-width:0px;"><br />228</div>
						<div class="styLNRightNumBoxNBB" style="height:7.3mm;"><br />15</div>
						<div class="styLNAmountBoxNBB" style="height:7.3mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionETaxReportedGrp/FailProvideNtcRedFutAccrTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Section F -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:2px solid black;font-weight:bold;font-size:8pt;padding:0.5mm 0mm 0.5mm 3mm;">
						Section F. Taxes reported on or before the 15th day of the 5th month following the close of the entity manager's taxable 
						year during which the plan became a party to a prohibited tax shelter transaction
					</div>
					<!-- Part 1, Section F, Line 16 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">16</div>
						<div class="sty5330Desc" style="">
							Section 4965 tax on prohibitied tax shelter transactions for entity managers (from Schedule K, Line 2). Enter here and on Part II, line 17
							<span class="sty5330DotLn" style="margin-right:-6px;">....................&#9658;</span>
						</div>
						<div class="sty5330NumBox" style="height:7.3mm;border-bottom-width:0px;"><br />237</div>
						<div class="styLNRightNumBoxNBB" style="height:7.3mm;"><br />16</div>
						<div class="styLNAmountBoxNBB" style="height:7.3mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionFTaxesReportedGrp/TotProhibitedTaxShelterTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:2px solid black;padding-top:1mm;padding-bottom:1mm;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc" style="">Tax Due</div>
					</div>
					<!-- Part 2, Line 17 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">17</div>
						<div class="styLNDesc">
							Enter the amount from Part I, line 7, 12, 13, 14, 15, or 16 (whichever is applicable)
							<span class="sty5330DotLn">.......</span>
						</div>
						<div class="styLNRightNumBox">17</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Part 2, Line 18 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">18</div>
						<div class="styLNDesc">
							Enter the amount of tax paid with Form 5558 or any other tax paid prior to filing this return
							<span class="sty5330DotLn">.....</span>
						</div>
						<div class="styLNRightNumBox">18</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Part 2, Line 19 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">19</div>
						<div class="styLNDesc">
							<strong>Tax Due. </strong> 
							Subtract line 18 from line 17. If the result is greater than zero, enter here
							<span class="sty5330DotLn" style="margin-right:-6px;">......&#9658;</span>
						</div>
						<div class="styLNRightNumBoxNBB">19</div>
						<div class="styLNAmountBoxNBB">
							<xsl:choose>
								<xsl:when test="$FormData/TaxDueAmt">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxDueAmt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/OverpaymentAmt"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					
					<!-- Sign Here -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:2px solid black;">
						<div class="styGenericDiv" style="width:13mm;height:22.5mm;font-size:12pt;font-weight:bold;padding-top:6mm;border-right:1px solid black;">
							Sign Here
						</div>
						<div class="styGenericDiv" style="width:174mm;font-size:6pt;padding:0.5mm;margin-bottom:4mm;">
							Under penalties of perjury, I declare that I have examined this return, including accompanying schedules and statements, 
							and to the best of my knowledge and belief, it is true, correct, and complete. Declaration of preparer (other than 
							taxpayer) is based on all information of which preparer has any knowledge.<br />
						</div>
						<div class="styGenericDiv" style="width:174mm;">
							<div class="styGenericDiv" style="width:6mm;height:12mm;padding-left:1mm;">
								<img alt="Right arrow" src="{$ImagePath}/1040_Bullet_Lg.gif" height="30" width="10" style="margin-top:3px;"/>
							</div>
							<div class="styGenericDiv" style="width:72mm;">
								<span style="width:100%;height:8mm;border-bottom:1px solid black;vertical-align:bottom;">
									<br />
									<xsl:call-template name="PopulateReturnHeaderOfficer">
										<xsl:with-param name="TargetNode">PersonNm</xsl:with-param>
									</xsl:call-template>
								</span>
								<span>Your signature</span>
							</div>
							<div class="styGenericDiv" style="width:6mm;height:12mm;padding-left:1mm;">
								<img alt="Right arrow" src="{$ImagePath}/1040_Bullet_Lg.gif" height="30" width="10" style="margin-top:3px;"/>
							</div>
							<div class="styGenericDiv" style="width:42mm;">
								<span style="width:100%;height:8mm;border-bottom:1px solid black;">
									<br />&nbsp;
								</span>
								<span>Telephone number</span>
							</div>
							<div class="styGenericDiv" style="width:6mm;height:12mm;padding-left:1mm;">
								<img alt="Right arrow" src="{$ImagePath}/1040_Bullet_Lg.gif" height="30" width="10" style="margin-top:3px;"/>
							</div>
							<div class="styGenericDiv" style="width:42mm;">
								<span style="width:100%;height:8mm;border-bottom:1px solid black;">
									<br />
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/BusinessOfficerGrp/SignatureDt"/>
									</xsl:call-template>
								</span>
								<span>Date</span>
							</div>
						</div>
					</div>
					<!-- Implementing the preparer section in table -->
					<div class="styStdDiv" style="font-size:6pt;">
            <div style="width:22.75mm;padding-top:4mm;float:left;clear:none;height:auto;">
              <span class="styMainTitle" style="font-size:11pt;height:auto;">
                  Paid
                  Preparer
                  Use Only
                  </span>
            </div>
            <div style="width:164mm;float:left;clear:none;">
              <div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
                <div class="styLNDesc" style="height:7.5mm;width:46.8mm;padding-top:0mm;border-right:1px solid black;border-left:1px solid black;padding-left:1mm;">
									Print/Type preparer's name<br/>
									<xsl:call-template name="PopulateReturnHeaderPreparer">
                    <xsl:with-param name="TargetNode">PreparerPersonNm</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styLNDesc" style="height:7.5mm;width:46.5mm;padding-top:0mm;border-right:1px solid black;padding-left:1mm;">
                Preparer's signature<br/>
              </div>
                <div class="styLNDesc" style="height:7.5mm;width:15mm;border-right:1px solid black;padding-top:0mm;padding-left:1mm;">Date <br/>
                  <xsl:call-template name="PopulateReturnHeaderPreparer">
                    <xsl:with-param name="TargetNode">DatePrepared</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styLNDesc" style="height:7.5mm;width:18mm;border-right:1px solid black;border-left:1px ;padding-top:.5mm;padding-bottom:0mm;padding-left:1mm;">
                  <label>
                    <xsl:call-template name="PopulateReturnHeaderPreparer">
											<xsl:with-param name="TargetNode">SelfEmployedLabel</xsl:with-param>
											<xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
										</xsl:call-template>
                    Check 
                  <input type="checkbox" class="styCkboxNM" alt="Self Employed Checkbox">
                      <xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">SelfEmployedCheckbox</xsl:with-param>
										<xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
									</xsl:call-template>
                    </input>
                    <span style="width:4px;"/>if<br/>self-employed
                  </label>
                </div>
                <div class="styLNDesc" style="height:7.5mm;width:16mm;padding-top:0mm;padding-left:1mm;">PTIN
                  <br/>
                  <xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">SSN</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">PTIN</xsl:with-param>
									</xsl:call-template>
                </div>
              </div>
              <div style="width:164mm;float:left;clear:none;border-bottom:1px ">
                <div class="styLNDesc" style="height:auto;width:108.5mm;border-right:1px solid black; border-left:1px solid black;padding-left:1mm;border-bottom:1px solid black;">
                  <span class="styGenericDiv" style="">Firm's name 
                  <span style="width:2.2mm;"/>
                    <img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
                    <span style="width:4px;"/>
                  </span>
                  <div class="styGenericDiv" style="padding-right:.5mm;">
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
										</xsl:call-template>
                  </div>
                </div>
                <div class="styLNDesc" style="height:auto;width:42mm;padding-left:1mm;border-bottom:0px solid black;">Firm's EIN
                <img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
                  <span style="width:4px;"/>
                  <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
                </div>
              </div>
              <div style="width:164mm;float:left;clear:none;">
                <div class="styLNDesc" style="height:auto;width:108.5mm;border-right:1px solid black;border-left:1px solid black;padding-left:1mm;">
                  <div class="styGenericDiv" style="padding-right:.5mm;">Firm's address 
                  <img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
                  </div>
                  <div class="styGenericDiv" style="padding-right:.5mm;">
                    <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
										</xsl:call-template>
                  </div>
                </div>
                <div class="styLNDesc" style="width:55mm;padding-left:1mm;height:auto;border-top:1px solid black;word-break:break-all;"> Phone no. 
									<xsl:choose>
										<xsl:when test="$RtnHdrData/PreparerPersonGrp/ForeignPhoneNum">
											<xsl:call-template name="PopulateReturnHeaderPreparer">
												<xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateReturnHeaderPreparer">
												<xsl:with-param name="TargetNode">Phone</xsl:with-param>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
                </div>
              </div>
            </div>
          </div>
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="float:right;">Form <strong>5330</strong> (Rev. 12-2021)</span>
					</div>
					<!-- Page 3 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						Form 5330 (Rev. 12-2021)
						<div style="float:right;">Page <strong>3</strong></div>
					</div>
					<div class="styStdDiv" style="padding:2px 0px;">
						Name of filer: 
						<span style="width:115mm;">
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<xsl:if test="$RtnHdrData/Filer//BusinessNameLine2Txt">
								<br />
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						</span>
						Filer's identifying number: 
						<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
					</div>
					<!-- Schedule A -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:2px solid black;font-weight:bold;font-size:8pt;padding:0.5mm 0mm;">
						Schedule A. Tax on Nondeductible Employer Contributions to Qualified Employer Plans (Section 4972) <br />
						Reported by the last day of the 7th month after the end of the tax year of the employer (or other person who must file the return)
					</div>
					<!-- Schedule A, Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="height:7.2mm;">
							Total contributions for your tax year to your qualified employer plan (under section 401(a), 403(a), <br />408(k), or 408(p))
							<span class="sty5330DotLn">............................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.2mm;"><br />1</div>
						<div class="styLNAmountBox" style="height:7.2mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionATaxesReportedGrp/TotalContributionsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Schedule A, Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc">
							Amount allowable as a deduction under section 404
							<span class="sty5330DotLn">..................</span>
						</div>
						<div class="styLNRightNumBox">2</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionATaxesReportedGrp/AllowableDeductionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Schedule A, Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc">
							Subtract line 2 from line 1
							<span class="sty5330DotLn">..........................</span>
						</div>
						<div class="styLNRightNumBox">3</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionATaxesReportedGrp/NondeductibleContributionsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule A, Line 4 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc" style="height:7.2mm;width:103mm;">
							Enter amount of any prior year nondeductible contributions made for years beginning after 12/31/86
							<span class="sty5330DotLn" style="padding-right:5px;">.................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.2mm;width:7mm;"><br />4</div>
						<div class="styLNAmountBox" style="width:28mm;height:7.2mm;padding-right:0.5mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionATaxesReportedGrp/PYNondedContriAftrSpcfdDtAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.2mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:7.2mm;">&nbsp;</div>
					</div>
					<!-- Schedule A, Line 5 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc" style="height:7.2mm;width:103mm;">
							Amount of any prior year nondeductible contributions made for years beginning after 12/31/86 returned to you in this tax year for any prior tax year
							<span class="sty5330DotLn" style="padding-right:5px;">...</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.2mm;width:7mm;"><br />5</div>
						<div class="styLNAmountBox" style="width:28mm;height:7.2mm;padding-right:0.5mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionATaxesReportedGrp/PYNondedContriRetCurrYrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.2mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:7.2mm;">&nbsp;</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="styLNDesc" style="width:103mm;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="width:7mm;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="width:28mm;padding-right:0.5mm;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
					</div>
					<!-- Schedule A, Line 6 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc" style="width:103mm;">
							Subtract line 5 from line 4
							<span class="sty5330DotLn" style="padding-right:5px;">................</span>
						</div>
						<div class="styLNRightNumBox" style="width:7mm;">6</div>
						<div class="styLNAmountBox" style="width:28mm;padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionATaxesReportedGrp/NondedContriRetMinusPaidAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="styLNDesc" style="width:103mm;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="width:7mm;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="width:28mm;padding-right:0.5mm;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
					</div>
					<!-- Schedule A, Line 7 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc" style="width:103mm;">
							Amount of line 6 carried forward and deductible in this tax year
							<span class="sty5330DotLn" style="padding-right:5px;">.....</span>
						</div>
						<div class="styLNRightNumBox" style="width:7mm;">7</div>
						<div class="styLNAmountBox" style="width:28mm;padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionATaxesReportedGrp/NondedContriRetMinusPdCyovAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Schedule A, Line 8 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="styLNDesc">
							Subtract line 7 from line 6
							<span class="sty5330DotLn">.........................</span>
						</div>
						<div class="styLNRightNumBox">8</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionATaxesReportedGrp/NondedContriRetCyovMinusPdAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Schedule A, Line 9 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc">
							Tentative taxable excess contributions. Add lines 3 and 8
							<span class="sty5330DotLn">................</span>
						</div>
						<div class="styLNRightNumBox">9</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionATaxesReportedGrp/TentativeTaxableExContriAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Schedule A, Line 10 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc">
							Nondeductible section 4972(c)(6) or (7) contributions exempt from excise tax
							<span class="sty5330DotLn">.........</span>
						</div>
						<div class="styLNRightNumBox">10</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionATaxesReportedGrp/NondedContriExemptExciseTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Schedule A, Line 11 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">11</div>
						<div class="styLNDesc">
							Taxable excess contributions. Subtract line 10 from line 9
							<span class="sty5330DotLn">................</span>
						</div>
						<div class="styLNRightNumBox">11</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionATaxesReportedGrp/TaxableExcessContributionsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Schedule A, Line 12 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">12</div>
						<div class="styLNDesc">
							Multiply line 11 by 10%. Enter here and on Part I, line 1
							<span class="sty5330DotLn" style="margin-right:-6px;">...............&#9658;</span>
						</div>
						<div class="styLNRightNumBoxNBB">12</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionATaxesReportedGrp/TaxNondedContriQlfyPlnsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule B -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:2px solid black;font-weight:bold;font-size:8pt;padding:0.5mm 0mm;">
						Schedule B. Tax on Excess Contributions to Section 403(b)(7)(A) Custodial Accounts (Section 4973(a)(3)) <br />
						Reported by the last day of the 7th month after the end of the tax year of the employer (or other person who must file the return)
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Schedule B, Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc">
							Total amount contributed for current year less rollovers. See instructions
							<span class="sty5330DotLn">...........</span>
						</div>
						<div class="styLNRightNumBox">1</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionATaxesReportedGrp/TotalContriCYLessRolloverAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Schedule B, Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc">
							Amount excludable from gross income under section 403(b). See instructions
							<span class="sty5330DotLn">..........</span>
						</div>
						<div class="styLNRightNumBox">2</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionATaxesReportedGrp/ExcludableGrossIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Schedule B, Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc">
							Current year excess contributions. Subtract line 2 from line 1. If zero or less, enter -0-
							<span class="sty5330DotLn">.......</span>
						</div>
						<div class="styLNRightNumBox">3</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionATaxesReportedGrp/CurrentYearExcessContriAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Schedule B, Line 4 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc">
							Prior year excess contributions not previously eliminated. If zero, go to line 8
							<span class="sty5330DotLn">..........</span>
						</div>
						<div class="styLNRightNumBox">4</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionATaxesReportedGrp/PYExContriNotPrevEliminatedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Schedule B, Line 5 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc">
							Contribution credit. If line 2 is more than line 1, enter the excess. Otherwise, enter -0-
							<span class="sty5330DotLn">.......</span>
						</div>
						<div class="styLNRightNumBox">5</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionATaxesReportedGrp/ContributionCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Schedule B, Line 6 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc" style="height:7.2mm;">
							Total of all prior years' distributions out of the account included in your gross income under section 72(e)
							<br /> and not previously used to reduce excess contributions
							<span class="sty5330DotLn">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.2mm;"><br />6</div>
						<div class="styLNAmountBox" style="height:7.2mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionATaxesReportedGrp/TotalAllPYDistributionsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Schedule B, Line 7 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc">
							Adjusted prior years' excess contributions. Subtract the total of lines 5 and 6 from line 4
							<span class="sty5330DotLn">......</span>
						</div>
						<div class="styLNRightNumBox">7</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionATaxesReportedGrp/AdjustedPriorYearExContriAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Schedule B, Line 8 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="styLNDesc">
							Taxable excess contributions. Add lines 3 and 7
							<span class="sty5330DotLn">...................</span>
						</div>
						<div class="styLNRightNumBox">8</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionATaxesReportedGrp/TxblExContriCustodialAcctAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Schedule B, Line 9 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc">
							Multiply line 8 by 6%
							<span class="sty5330DotLn">...........................</span>
						</div>
						<div class="styLNRightNumBox">9</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionATaxesReportedGrp/TxblExcessContributionsTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Schedule B, Line 10 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc">
							Enter the value of your account as of the last day of the year
							<span class="sty5330DotLn">..............</span>
						</div>
						<div class="styLNRightNumBox">10</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionATaxesReportedGrp/AccountValueEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Schedule B, Line 11 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">11</div>
						<div class="styLNDesc">
							Multiply line 10 by 6%
							<span class="sty5330DotLn">...........................</span>
						</div>
						<div class="styLNRightNumBox">11</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionATaxesReportedGrp/AccountValueEOYTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Schedule B, Line 12 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">12</div>
						<div class="styLNDesc">
							<strong>Excess contributions tax. </strong> 
							Enter the lesser of line 9 or line 11 here and on Part I, line 2
							<span class="sty5330DotLn" style="margin-right:-6px;">.....&#9658;</span>
						</div>
						<div class="styLNRightNumBoxNBB">12</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionATaxesReportedGrp/TxExcessContriCustodialAcctAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="float:right;">Form <strong>5330</strong> (Rev. 12-2021)</span>
					</div>
					<!-- Page 4 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						Form 5330 (Rev. 12-2021)
						<div style="float:right;">Page <strong>4</strong></div>
					</div>
					<div class="styStdDiv" style="padding:2px 0px;">
						Name of filer: 
						<span style="width:115mm;">
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<xsl:if test="$RtnHdrData/Filer//BusinessNameLine2Txt">
								<br />
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						</span>
						Filer's identifying number: 
						<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
					</div>
					<!-- Schedule C -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:2px solid black;font-weight:bold;font-size:8pt;padding:0.5mm 0mm;">
						Schedule C. Tax on Prohibited Transactions (Section 4975) <span style="font-weight:normal;font-style:italic;">(see instructions)</span> 
						Reported by the last day of the 7th month after the end of the tax year of the employer (or other person who must file the return)
					</div>
					<!-- Schedule C, Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="width:179mm;height:auto;">
							Is the excise tax a result of a prohibited transaction that was (box "a" or box "b" must be checked): <br />
							<span style="width:8mm;padding-left:4mm;font-weight:bold;">a</span>
							<input type="checkbox" class="styCkboxNM" style="" alt="Discrete Prohibited Transaction">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/SectionATaxesReportedGrp/IRS5330ScheduleC/DiscreteProhibitedTransInd"/>
									<xsl:with-param name="BackupName">F5330SecASchCDiscreteProhibitedTransInd</xsl:with-param>
								</xsl:call-template>
							</input>
							discrete
							<span style="width:8mm;padding-left:4mm;font-weight:bold;margin-left:20mm;">b</span>
							<input type="checkbox" class="styCkboxNM" style="" alt="Other Than Discrete Prohibited Transaction">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/SectionATaxesReportedGrp/IRS5330ScheduleC/OthThanDiscreteProhibTransInd"/>
									<xsl:with-param name="BackupName">F5330SecASchCOthThanDiscreteProhibTransInd</xsl:with-param>
								</xsl:call-template>
							</input>
							other than discrete (a lease or loan)
						</div>
					</div>
					<!-- Schedule C, Line 2 -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc" style="width:179mm;height:auto;">
							Complete the table below to disclose the prohibited transactions and figure the initial tax. See instructions.
						</div>
					</div>
					<!-- Schedule C Line 2 table -->
					<xsl:variable name="shouldSeparateSCL2" select="($Print = $Separated) and (count($FormData/SectionATaxesReportedGrp/IRS5330ScheduleC/ProhibitedTransactionGrp) &gt; 12)"/>
					<div class="styStdDiv" style="" id="SchCLine2Table">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:16mm;font-weight:normal;">
										<strong>(a)</strong> <br /> Transaction <br /> number
									</th>
									<th class="styTableCellHeader" scope="col" style="width:24mm;font-weight:normal;">
										<strong>(b)</strong>
										Date <br /> of transaction (see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:79mm;font-weight:normal;">
										<strong>(c)</strong>
										Description of prohibited transaction
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(d)</strong> Amount involved in prohibited transaction (see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:36mm;font-weight:normal;border-right-width:0px;">
										<strong>(e)</strong> Initial tax on prohibited transaction (multiply each transaction in column (d) by <br /> 
										the appropriate rate <br /> (see instructions))
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateSCL2)">
									<xsl:for-each select="$FormData/SectionATaxesReportedGrp/IRS5330ScheduleC/ProhibitedTransactionGrp">
										<tr style="height:10mm;vertical-align:bottom;">
											<td class="styTableCellCtrInherit" style="font-weight:bold;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TransactionNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="TransactionDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TransactionDesc"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TransactionAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right:none;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxImposedAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateSCL2 or count($FormData/SectionATaxesReportedGrp/IRS5330ScheduleC/ProhibitedTransactionGrp) &lt; 5">
									<xsl:call-template name="FillTable5ColsX">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/SectionATaxesReportedGrp/IRS5330ScheduleC/ProhibitedTransactionGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateSCL2"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Schedule C, Line 3 -->
					<div class="styStdIBDiv" style="padding-top:3.5mm;border-bottom:1px solid black;">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="width:146mm;">
							Add amounts in column (e); enter here and on Part I, line 3a
							<span class="sty5330DotLn" style="margin-right:-6px;">................&#9658;</span>
						</div>
						<div class="styLNAmountBoxNBB" style="border-left-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionATaxesReportedGrp/IRS5330ScheduleC/TotProhibitedTransactionTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule C, Line 4 -->
					<div class="styStdIBDiv" style="">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc" style="width:152mm;height:auto;">
							Have you corrected all of the prohibited transactions that you are reporting on this return? If "Yes," <br />
							complete Schedule C, line 5, on the next page. If "No," attach statement. See instructions.
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/SectionATaxesReportedGrp/IRS5330ScheduleC/CorrectedProhibitedTransInd"/>
							</xsl:call-template>
							<span class="sty5330DotLn" style="margin-right:-6px;">.......&#9658;</span>
						</div>
						<div class="styGenericDiv" style="width:26mm;text-align:center;padding-top:3.5mm;font-weight:bold;">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/SectionATaxesReportedGrp/IRS5330ScheduleC/CorrectedProhibitedTransInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkboxNM" style="" alt="Corrected All Prohibited Transactions Yes">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/SectionATaxesReportedGrp/IRS5330ScheduleC/CorrectedProhibitedTransInd"/>
									<xsl:with-param name="BackupName">F5330SCCorrectedProhibitedTransInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Yes
							<input type="checkbox" class="styCkboxNM" style="margin-left:6mm;" alt="Corrected All Prohibited Transactions No">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/SectionATaxesReportedGrp/IRS5330ScheduleC/CorrectedProhibitedTransInd"/>
									<xsl:with-param name="BackupName">F5330SCCorrectedProhibitedTransInd</xsl:with-param>
								</xsl:call-template>
							</input>
							No
						</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="float:right;">Form <strong>5330</strong> (Rev. 12-2021)</span>
					</div>
					<!-- Page 5 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						Form 5330 (Rev. 12-2021)
						<div style="float:right;">Page <strong>5</strong></div>
					</div>
					<div class="styStdDiv" style="padding:2px 0px;">
						Name of filer: 
						<span style="width:115mm;">
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<xsl:if test="$RtnHdrData/Filer//BusinessNameLine2Txt">
								<br />
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						</span>
						Filer's identifying number: 
						<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
					</div>
					<!-- Schedule C -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:2px solid black;font-weight:bold;font-size:8pt;padding:0.5mm 0mm;">
						Schedule C. Tax on Prohibited Transactions (Section 4975) 
						Reported by the last day of the 7th month after the end of the tax year of the employer (or other person who must file the return)
						<span style="font-weight:normal;font-style:italic;">(continued)</span>
					</div>
					<!-- Schedule C, Line 5 -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc" style="width:179mm;height:auto;">
							Complete the table below, if applicable, of other participating disqualified persons and descriptions of correction. See instructions.
						</div>
					</div>
					<!-- Table 1, cols (a)-(c) -->
					<xsl:variable name="shouldSeparateSCL5" select="($Print = $Separated) and (count($FormData/SectionATaxesReportedGrp/IRS5330ScheduleC/DsqlfyPrsnProhibTransCorrGrp) &gt; 12)"/>
					<div class="styStdDiv" style="" id="SchCLine5Table">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr style="height:13mm;">
									<th class="styTableCellHeader" scope="col" style="width:16mm;font-weight:normal;">
										<strong>(a)</strong> <br /> Item no. <br/> from line 2
									</th>
									<th class="styTableCellHeader" scope="col" style="width:66mm;font-weight:normal;">
										<strong>(b)</strong> <br />
										Name and address of <br /> disqualified person
									</th>
									<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(c)</strong> <br />
										EIN or SSN
									</th>
									<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(d)</strong> <br />
										Date of <br /> correction
									</th>
									<th class="styTableCellHeader" scope="col" style="width:65mm;font-weight:normal;border-right-width:0px;">
										<strong>(e)</strong> <br /> Description of correction
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateSCL5)">
									<xsl:for-each select="$FormData/SectionATaxesReportedGrp/IRS5330ScheduleC/DsqlfyPrsnProhibTransCorrGrp">
										<tr style="height:10.5mm;vertical-align:bottom;">
											<td class="styTableCellCtrInherit" style="font-weight:bold;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TransactionNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PersonNm"/>
												</xsl:call-template>
												<span style="width:100%;height:1mm;border-top:1px dashed black;"/>
												<xsl:choose>
													<xsl:when test="ForeignAddress">
														<xsl:call-template name="PopulateForeignAddressTemplate">
															<xsl:with-param name="TargetNode" select="ForeignAddress"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateUSAddressTemplate">
															<xsl:with-param name="TargetNode" select="USAddress"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:choose>
													<xsl:when test="SSN">
														<xsl:call-template name="PopulateSSN">
															<xsl:with-param name="TargetNode" select="SSN"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="EIN"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="CorrectionDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit" style="border-right:none;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CorrectionDesc"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateSCL5 or count($FormData/SectionATaxesReportedGrp/IRS5330ScheduleC/DsqlfyPrsnProhibTransCorrGrp) &lt; 12">
									<xsl:call-template name="FillTable5ColsX">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/SectionATaxesReportedGrp/IRS5330ScheduleC/DsqlfyPrsnProhibTransCorrGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateSCL5"/>
										<xsl:with-param name="ABlank" select="true()"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Schedule D -->
					<div class="styStdIBDiv" style="border-bottom:1px solid black;border-top:1px solid black;font-weight:bold;font-size:8pt;padding:0.5mm 0mm;">
						Schedule D. Tax on Failure To Meet Minimum Funding Standards (Section 4971(a)) 
						Reported by the 15th day of the 10th month after the last day of the plan year
					</div>
					<!-- Schedule D, Line 1 -->
					<div class="styStdIBDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="height:auto;">
							Aggregate unpaid required contributions (accumulated funding deficiency for multiemployer plans). <br /> See instructions 
							<span class="sty5330DotLn">.............................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.2mm;"><br />1</div>
						<div class="styLNAmountBox" style="height:7.2mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionBTaxesReportedGrp/IRS5330ScheduleD/AggregateUnpaidRqrContriAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule D, Line 2 -->
					<div class="styStdIBDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc">
							Multiply line 1 by 10% (5% for multiemployer plans). Enter here and on Part I, line 8a
							<span class="sty5330DotLn" style="margin-right:-6px;">......&#9658;</span>
						</div>
						<div class="styLNRightNumBoxNBB">2</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionBTaxesReportedGrp/IRS5330ScheduleD/FailureToMeetMFSTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="float:right;">Form <strong>5330</strong> (Rev. 12-2021)</span>
					</div>
					<!-- Page 6 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						Form 5330 (Rev. 12-2021)
						<div style="float:right;">Page <strong>6</strong></div>
					</div>
					<div class="styStdDiv" style="padding:2px 0px;">
						Name of filer: 
						<span style="width:115mm;">
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<xsl:if test="$RtnHdrData/Filer//BusinessNameLine2Txt">
								<br />
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						</span>
						Filer's identifying number: 
						<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
					</div>
					<!-- Schedule E -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:2px solid black;font-weight:bold;font-size:8pt;padding:0.5mm 0mm;">
						Schedule E. Tax on Failure To Pay Liquidity Shortfall (Section 4971(f)(1)) 
						Reported by the 15th day of the 10th month after the last day of the plan year
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc" style="width:48mm;">&nbsp;</div>
						<div class="styLNRightNumBox" style="width:6mm;height:12mm;border-left-width:0px;">&nbsp;</div>
						<div class="styLNAmountBox" style="width:25mm;height:12mm;padding-top:4mm;text-align:center;">(a) 1st Quarter</div>
						<div class="styLNAmountBox" style="width:25mm;height:12mm;padding-top:4mm;text-align:center;">(b) 2nd Quarter</div>
						<div class="styLNAmountBox" style="width:25mm;height:12mm;padding-top:4mm;text-align:center;">(c) 3rd Quarter</div>
						<div class="styLNAmountBox" style="width:25mm;height:12mm;padding-top:4mm;text-align:center;">(d) 4th Quarter</div>
						<div class="styLNAmountBox" style="width:25mm;height:12mm;padding-top:1mm;text-align:center;">(e) Total <br /> (add cols. a-d <br /> for line 3)</div>
					</div>
					<!-- Schedule E, Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="width:48mm;">
							Amount of shortfall
							<span class="sty5330DotLn">.....</span>
						</div>
						<div class="styLNRightNumBox" style="width:6mm;">1</div>
						<div class="styLNAmountBox" style="width:25mm;padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionBTaxesReportedGrp/IRS5330ScheduleE/FTPShortfallAmtGrp/FirstQuarterAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:25mm;padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionBTaxesReportedGrp/IRS5330ScheduleE/FTPShortfallAmtGrp/SecondQuarterAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:25mm;padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionBTaxesReportedGrp/IRS5330ScheduleE/FTPShortfallAmtGrp/ThirdQuarterAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:25mm;padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionBTaxesReportedGrp/IRS5330ScheduleE/FTPShortfallAmtGrp/FourthQuarterAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:25mm;background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Schedule E, Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc" style="width:48mm;">
							Shortfall paid by the due date
							<span class="sty5330DotLn">..</span>
						</div>
						<div class="styLNRightNumBox" style="width:6mm;">2</div>
						<div class="styLNAmountBox" style="width:25mm;padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionBTaxesReportedGrp/IRS5330ScheduleE/FTPShortfallPdByDueDtAmtGrp/FirstQuarterAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:25mm;padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionBTaxesReportedGrp/IRS5330ScheduleE/FTPShortfallPdByDueDtAmtGrp/SecondQuarterAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:25mm;padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionBTaxesReportedGrp/IRS5330ScheduleE/FTPShortfallPdByDueDtAmtGrp/ThirdQuarterAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:25mm;padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionBTaxesReportedGrp/IRS5330ScheduleE/FTPShortfallPdByDueDtAmtGrp/FourthQuarterAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:25mm;background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Schedule E, Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="width:48mm;">
							Net shortfall amount
							<span class="sty5330DotLn">.....</span>
						</div>
						<div class="styLNRightNumBox" style="width:6mm;">3</div>
						<div class="styLNAmountBox" style="width:25mm;padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionBTaxesReportedGrp/IRS5330ScheduleE/FTPNetShortfallAmtGrp/FirstQuarterAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:25mm;padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionBTaxesReportedGrp/IRS5330ScheduleE/FTPNetShortfallAmtGrp/SecondQuarterAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:25mm;padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionBTaxesReportedGrp/IRS5330ScheduleE/FTPNetShortfallAmtGrp/ThirdQuarterAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:25mm;padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionBTaxesReportedGrp/IRS5330ScheduleE/FTPNetShortfallAmtGrp/FourthQuarterAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:25mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionBTaxesReportedGrp/IRS5330ScheduleE/TotalNetShortfallAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule E, Line 4 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc" style="width:146mm;">
							Multiply line 3, column (e), by 10%. Enter here and on Part I, line 9a
							<span class="sty5330DotLn" style="margin-right:-6px;">.............&#9658;</span>
						</div>
						<div class="styLNRightNumBoxNBB">4</div>
						<div class="styLNAmountBoxNBB" style="width:25mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionBTaxesReportedGrp/IRS5330ScheduleE/FTPLiquidityShortfallTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule F -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:2px solid black;font-weight:bold;font-size:8pt;padding:0.5mm 0mm;">
						Schedule F. Tax on Multiemployer Plans in Endangered or Critical Status (Sections 4971(g)(3) and 4971(g)(4))
						Reported by the 15th day of the 10th month after the last day of the plan year
					</div>
					<!-- Schedule F, Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc">
							Section 4971(g)(3) tax on failure to meet requirements for plans in endangered or critical status.
						</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Schedule F, Line 1a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">a</div>
						<div class="styLNDesc">
							Enter the amount of contributions necessary to meet the applicable benchmarks or requirements
							<span class="sty5330DotLn">...</span>
						</div>
						<div class="styLNRightNumBox">1a</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionBTaxesReportedGrp/IRS5330ScheduleF/FailureMeetRqrEndngrCrtclTxGrp/ContriMeetBenchmarkOrRqrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule F, Line 1b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc">
							Enter the amount of the accumulated funding deficiency
							<span class="sty5330DotLn">................</span>
						</div>
						<div class="styLNRightNumBox">1b</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionBTaxesReportedGrp/IRS5330ScheduleF/FailureMeetRqrEndngrCrtclTxGrp/AccumulatedFundingDefnAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule F, Line 1c -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
						<div class="styLNDesc">
							Enter the greater of line 1a or line 1b here and on Part I, line 10b
							<span class="sty5330DotLn" style="margin-right:-6px;">............&#9658;</span>
						</div>
						<div class="styLNRightNumBox">1c</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionBTaxesReportedGrp/IRS5330ScheduleF/FailureMeetRqrEndngrCrtclTxGrp/FailMeetRqrPlnEndngrCrtclTxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule F, Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc">
							Section 4971(g)(4) tax on failure to adopt rehabilitation plan.
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Schedule F, Line 2a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">a</div>
						<div class="styLNDesc" style="height:auto;">
							Enter the amount of the excise tax on the accumulated funding deficiency under section 4971(a)(2) from <br /> Schedule D, line 2
							<span class="sty5330DotLn">............................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.2mm;"><br />2a</div>
						<div class="styLNAmountBox" style="height:7.2mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionBTaxesReportedGrp/IRS5330ScheduleD/FailureToMeetMFSTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule F, Line 2b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="height:auto;">
							Enter the number of days during the tax year which are included in the period beginning on the first <br />day 
							following the close of the 240-day period and ending on the day the rehabilitation plan is <br />adopted &#9658;
							<span style="width:40mm;min-height:3mm;border-bottom:1px solid black;text-align:center;margin-left:3mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/SectionBTaxesReportedGrp/IRS5330ScheduleF/FailureAdoptRehbltPlanTxGrp/DaysOver240PlanAdoptedCnt"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:10.4mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBox" style="height:10.4mm;">&nbsp;</div>
					</div>
					<!-- Schedule F, Line 2c -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
						<div class="styLNDesc">
							Multiply line 2b by $1,100
							<span class="sty5330DotLn">..........................</span>
						</div>
						<div class="styLNRightNumBox">2c</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionBTaxesReportedGrp/IRS5330ScheduleF/FailureAdoptRehbltPlanTxGrp/DaysOver240PlanAdoptedTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule F, Line 2d -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">d</div>
						<div class="styLNDesc">
							Enter the greater of line 2a or line 2c here and on Part I, line 10c
							<span class="sty5330DotLn" style="margin-right:-6px;">............&#9658;</span>
						</div>
						<div class="styLNRightNumBoxNBB">2d</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionBTaxesReportedGrp/IRS5330ScheduleF/FailureAdoptRehbltPlanTxGrp/FailureToAdoptRehbltPlanTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule G -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:2px solid black;font-weight:bold;font-size:8pt;padding:0.5mm 0mm;">
						Schedule G. Tax on Excess Fringe Benefits (Section 4977) 
						Reported by the last day of the 7th month after the end of the calendar year in which the excess fringe benefits were paid to the employer's employees
					</div>
					<!-- Schedule G, Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="height:auto;">
							Did you make an election to be taxed under section 4977? 
							<span class="sty5330DotLn" style="float:none;text-align:left;padding-left:1mm;">.........</span>
							<span style="font-weight:bold;">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/SectionB1TaxReportedGrp/Section4977ElectionInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkboxNM" style="" alt="Section 4977 Election Yes">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/SectionB1TaxReportedGrp/Section4977ElectionInd"/>
										<xsl:with-param name="BackupName">F5330SGSection4977ElectionInd</xsl:with-param>
									</xsl:call-template>
								</input>
								Yes
								<input type="checkbox" class="styCkboxNM" style="margin-left:6mm;" alt="Section 4977 Election No">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/SectionB1TaxReportedGrp/Section4977ElectionInd"/>
										<xsl:with-param name="BackupName">F5330SGSection4977ElectionInd</xsl:with-param>
									</xsl:call-template>
								</input>
								No
							</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:4.5mm;">&nbsp;</div>
					</div>
					<!-- Schedule G, Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc">
							If "Yes," enter the calendar year (YYYY) in which the excess fringe benefits were paid &#9658;
							<span style="width:20mm;min-height:3mm;border-bottom:1px solid black;text-align:center;">
								<xsl:call-template name="PopulateYear">
									<xsl:with-param name="TargetNode" select="$FormData/SectionB1TaxReportedGrp/ExcessFringeBenefitsPaidYr"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Schedule G, Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc">
							If line 1 is "Yes," enter the excess fringe benefits on this line. See instructions
							<span class="sty5330DotLn">.........</span>
						</div>
						<div class="styLNRightNumBox" style="">3</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionB1TaxReportedGrp/ExcessFringeBenefitsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule G, Line 4 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc">
							Enter 30% of line 3 here and on Part I, line 11
							<span class="sty5330DotLn" style="margin-right:-6px;">..................&#9658;</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="">4</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionB1TaxReportedGrp/ExcessFringeBenefitsTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule H -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:2px solid black;font-weight:bold;font-size:8pt;padding:0.5mm 0mm;">
						Schedule H. Tax on Excess Contributions to Certain Plans (Section 4979) 
						Reported by the last day of the 15th month after the end of the plan year
					</div>
					<!-- Schedule H, Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="height:auto;">
							Enter the amount of an excess contribution under a cash or deferred arrangement that is part of a plan <br />
							qualified under section 401(a), 403(a), 403(b), 408(k), or 501(c)(18) or excess aggregate contributions
							<span class="sty5330DotLn">.</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.2mm;"><br />1</div>
						<div class="styLNAmountBox" style="height:7.2mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionCTaxReportedGrp/ExContriCashOrDefrdArrngmAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule H, Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc">
							Multiply line 1 by 10% and enter here and on Part I, line 13
							<span class="sty5330DotLn" style="margin-right:-6px;">..............&#9658;</span>
						</div>
						<div class="styLNRightNumBoxNBB">2</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionCTaxReportedGrp/ExcessContributionCrtnPlnTxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule I -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:2px solid black;font-weight:bold;font-size:8pt;padding:0.5mm 0mm;">
						Schedule I. Tax on Reversion of Qualified Plan Assets to an Employer (Section 4980)
						Reported by the last day of the month following the month in which the reversion occurred
					</div>
					<!-- Schedule I, Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="height:auto;">
							Date reversion occurred 
							<span class="sty5330DotLn" style="float:none;text-align:left;padding-left:1.5mm;">...........&#9658;</span>
							MM 
							<span style="width:10mm;min-height:3mm;border-bottom:1px solid black;margin-right:3mm;text-align:center;">
								<xsl:call-template name="PopulateMonth">
									<xsl:with-param name="TargetNode" select="$FormData/SectionDTaxReportedGrp/ReversionDt"/>
								</xsl:call-template>
							</span>
							DD 
							<span style="width:10mm;min-height:3mm;border-bottom:1px solid black;margin-right:3mm;text-align:center;">
								<xsl:call-template name="PopulateDay">
									<xsl:with-param name="TargetNode" select="$FormData/SectionDTaxReportedGrp/ReversionDt"/>
								</xsl:call-template>
							</span>
							YY
							<span style="width:10mm;min-height:3mm;border-bottom:1px solid black;text-align:center;">
								<xsl:call-template name="PopulateYear">
									<xsl:with-param name="TargetNode" select="$FormData/SectionDTaxReportedGrp/ReversionDt"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.4mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:4.4mm;">&nbsp;</div>
					</div>
					<!-- Schedule I, Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2a</div>
						<div class="styLNDesc" style="height:auto;">
							Employer reversion amount 
							<span style="width:32mm;min-height:3mm;border-bottom:1px solid black;margin-right:11mm;text-align:right;margin-left:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SectionDTaxReportedGrp/EmployerReversionAmt"/>
								</xsl:call-template>
							</span>
							<span style="width:8mm;min-height:3mm;text-align:center;font-weight:bold;padding-left:4.2mm;">b</span>
							Excise tax rate
							<span style="width:20mm;min-height:3mm;border-bottom:1px solid black;text-align:center;margin-left:1mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/SectionDTaxReportedGrp/ExciseTaxPct"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.3mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:4.3mm;">&nbsp;</div>
					</div>
					<!-- Schedule I, Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc">
							Multiply line 2a by line 2b and enter the amount here and on Part I, line 14
							<span class="sty5330DotLn" style="margin-right:-6px;">.........&#9658;</span>
						</div>
						<div class="styLNRightNumBox">3</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionDTaxReportedGrp/ReversionQlfyPlanAstEmplrTxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule I, Line 4 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc" style="height:auto;min-height:10mm;width:178mm;">
							Explain below why you qualify for a rate other than 50%: <br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/SectionDTaxReportedGrp/ExcsTxOtherThan50PctExplnTxt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule J -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:2px solid black;font-weight:bold;font-size:8pt;padding:0.5mm 0mm;">
						Schedule J. Tax on Failure To Provide Notice of Significant Reduction in Future Accruals (Section 4980F) 
						Reported by the last day of the month following the month in which the failure occurred
					</div>
					<!-- Schedule J, Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="height:auto;">
							Enter the number of applicable individuals who were not provided ERISA section 204(h) notice &#9658;
							<span style="width:14mm;min-height:3mm;border-bottom:1px solid black;text-align:center;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/SectionETaxReportedGrp/NotProvERISASect204hNoticeCnt"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.3mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:4.3mm;">&nbsp;</div>
					</div>
					<!-- Schedule J, Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc" style="height:auto;">
							Enter the effective date of the amendment
							<span class="sty5330DotLn" style="float:none;text-align:left;padding-left:1.5mm;">.....&#9658;</span>
							MM 
							<span style="width:10mm;min-height:3mm;border-bottom:1px solid black;margin-right:3mm;text-align:center;">
								<xsl:call-template name="PopulateMonth">
									<xsl:with-param name="TargetNode" select="$FormData/SectionETaxReportedGrp/AmendmentEffectiveDt"/>
								</xsl:call-template>
							</span>
							DD 
							<span style="width:10mm;min-height:3mm;border-bottom:1px solid black;margin-right:3mm;text-align:center;">
								<xsl:call-template name="PopulateDay">
									<xsl:with-param name="TargetNode" select="$FormData/SectionETaxReportedGrp/AmendmentEffectiveDt"/>
								</xsl:call-template>
							</span>
							YY
							<span style="width:10mm;min-height:3mm;border-bottom:1px solid black;text-align:center;">
								<xsl:call-template name="PopulateYear">
									<xsl:with-param name="TargetNode" select="$FormData/SectionETaxReportedGrp/AmendmentEffectiveDt"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.3mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:4.3mm;">&nbsp;</div>
					</div>
					<!-- Schedule J, Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="height:auto;">
							Enter the number of days in the noncompliance period &#9658;
							<span style="width:32mm;min-height:3mm;border-bottom:1px solid black;text-align:center;margin-left:1mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/SectionETaxReportedGrp/DaysNoncompliancePrdCnt"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.3mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:4.3mm;">&nbsp;</div>
					</div>
					<!-- Schedule J, Line 4 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc">
							Enter the total number of failures to provide ERISA section 204(h) notice. See instructions
							<span class="sty5330DotLn">.....</span>
						</div>
						<div class="styLNRightNumBox">4</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/SectionETaxReportedGrp/TotERISASect204hNtcFailureCnt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule J, Line 5 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc">
							Multiply line 4 by $100. Enter here and on Part I, line 15
							<span class="sty5330DotLn" style="margin-right:-6px;">...............&#9658;</span>
						</div>
						<div class="styLNRightNumBox">5</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionETaxReportedGrp/FailProvideNtcRedFutAccrTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule J, Line 6 -->
					<div class="styStdIBDiv">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc" style="height:auto;min-height:10mm;width:178mm;">
							Provide a brief description of the failure, and of the correction, if any: <br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/SectionETaxReportedGrp/FailProvNtcRedFutAccrTaxDesc"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule K -->
					<div class="styStdIBDiv" style="border-bottom:1px solid black;border-top:2px solid black;font-weight:bold;font-size:8pt;padding:0.5mm 0mm;">
						Schedule K. Tax on Prohibited Tax Shelter Transactions (Section 4965) 
						Reported on or before the 15th day of the 5th month following the close of the entity manager's tax year during which 
						the plan became a party to a prohibited tax shelter transation
					</div>
					<!-- Schedule K, Line 1 -->
					<div class="styStdIBDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="height:auto;">
							Enter the number of prohibited tax shelter transactions you caused the same plan to be a <br /> party to &#9658;
							<span style="width:40mm;min-height:3mm;border-bottom:1px solid black;padding-right:2px;text-align:right;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/SectionFTaxesReportedGrp/ProhibitedTaxShelterTransCnt"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.2mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:7.2mm;">&nbsp;</div>
					</div>
					<!-- Schedule K, Line 2 -->
					<div class="styStdIBDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc">
							Multiply line 1 by $20,000. Enter the result here and on Part I, line 16
							<span class="sty5330DotLn" style="margin-right:-6px;">...........&#9658;</span>
						</div>
						<div class="styLNRightNumBoxNBB">2</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SectionFTaxesReportedGrp/TotProhibitedTaxShelterTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="float:right;">Form <strong>5330</strong> (Rev. 12-2021)</span>
					</div>
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
						<xsl:for-each select="$FormData/SpecialConditionDesc">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="TargetNode" select="."/>
								<xsl:with-param name="Desc">Top Left Header - Special Condition Description <xsl:value-of select="position()"/></xsl:with-param>
							</xsl:call-template>
						</xsl:for-each>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/InCareOfNm"/>
							<xsl:with-param name="Desc">Header - In Care Of Name</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessNameControlTxt"/>
							<xsl:with-param name="Desc">Header - Business Name Control</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimaryNameControlTxt"/>
							<xsl:with-param name="Desc">Header - Primary Name Control</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/OtherInd/@otherReturnDesc"/>
							<xsl:with-param name="Desc">Header - Other Return Type Description</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/ExchangeRateDesc"/>
							<xsl:with-param name="Desc">Line A - Exchange Rate Description</xsl:with-param>
						</xsl:call-template>
					</table>
					<!-- Sch C, Line 2 separated table -->
					<xsl:if test="$shouldSeparateSCL2">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Schedule C, Line 2 - Prohibited transactions</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:16mm;font-weight:normal;">
										<strong>(a)</strong> <br /> Transaction <br /> number
									</th>
									<th class="styDepTblCell" scope="col" style="width:24mm;font-weight:normal;">
										<strong>(b)</strong>
										Date <br /> of transaction (see instructions)
									</th>
									<th class="styDepTblCell" scope="col" style="width:79mm;font-weight:normal;">
										<strong>(c)</strong>
										Description of prohibited transaction
									</th>
									<th class="styDepTblCell" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(d)</strong> Amount involved in prohibited transaction (see instructions)
									</th>
									<th class="styDepTblCell" scope="col" style="width:36mm;font-weight:normal;border-right-width:0px;">
										<strong>(e)</strong> Initial tax on prohibited transaction (multiply each transaction in column (d) by <br /> 
										the appropriate rate <br /> (see instructions))
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/SectionATaxesReportedGrp/IRS5330ScheduleC/ProhibitedTransactionGrp">
									<tr style="height:4mm;vertical-align:top;border-color:black;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TransactionNum"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="TransactionDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TransactionDesc"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TransactionAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-right:none;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxImposedAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Sch C, Line 5 separated table -->
					<xsl:if test="$shouldSeparateSCL5">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Schedule C, Line 5 - Participating Disqualified Persons and Descriptions of Correction</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:16mm;font-weight:normal;">
										<strong>(a)</strong> <br /> Item no. <br/> from line 2
									</th>
									<th class="styDepTblCell" scope="col" style="width:66mm;font-weight:normal;">
										<strong>(b)</strong> <br />
										Name and address of <br /> disqualified person
									</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(c)</strong> <br />
										EIN or SSN
									</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(d)</strong> <br />
										Date of <br /> correction
									</th>
									<th class="styDepTblCell" scope="col" style="width:65mm;font-weight:normal;border-right-width:0px;">
										<strong>(e)</strong> <br /> Description of correction
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/SectionATaxesReportedGrp/IRS5330ScheduleC/DsqlfyPrsnProhibTransCorrGrp">
									<tr style="height:8mm;vertical-align:top;border-color:black;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TransactionNum"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PersonNm"/>
											</xsl:call-template>
											<span style="width:100%;height:1mm;border-top:1px dashed black;"/>
											<xsl:choose>
												<xsl:when test="ForeignAddress">
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="ForeignAddress"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="USAddress"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:choose>
												<xsl:when test="SSN">
													<xsl:call-template name="PopulateSSN">
														<xsl:with-param name="TargetNode" select="SSN"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="EIN"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="CorrectionDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit" style="border-right:none;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CorrectionDesc"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<br/>
				</form>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="FillTable5ColsX">
		<xsl:param name="LineNumber"/>
		<xsl:param name="SepMessage" select="false()"/>
		<xsl:param name="MaxLine" select="12"/>
		<xsl:param name="ABlank" select="false()"/>
		<tr style="height:10mm;vertical-align:bottom;">
			<td class="styTableCellCtrInherit" style="font-style:italic;">
				<xsl:choose>
					<xsl:when test="$ABlank">&nbsp;</xsl:when>
					<xsl:when test="$SepMessage">(i)</xsl:when>
					<xsl:otherwise>(<xsl:number value="$LineNumber" format="i"/>)</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellCtrInherit">
				<xsl:choose>
					<xsl:when test="$SepMessage">
						See Add'l Data
					</xsl:when>
					<xsl:otherwise>&nbsp;</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellTextInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:choose>
			<xsl:when test="$SepMessage">
				<xsl:call-template name="FillTable5ColsX">
					<xsl:with-param name="LineNumber" select="2"/>
					<xsl:with-param name="SepMessage" select="false()"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
					<xsl:with-param name="ABlank" select="$ABlank"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$LineNumber &lt; $MaxLine">
				<xsl:call-template name="FillTable5ColsX">
					<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
					<xsl:with-param name="ABlank" select="$ABlank"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
