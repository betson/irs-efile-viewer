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
	<xsl:include href="IRS5471ScheduleEStyle.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS5471ScheduleE" />
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
				<meta name="Description" content="IRS Form 5471 Schedule E" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS5471ScheduleEStyle" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form5471ScheduleE">
					<xsl:call-template name="DocumentHeaderLandscape" />
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDivLS">
						<div class="styFNBox" style="width:35mm;height:18mm;">
							<div class="styFormNumber" style="font-size:10pt;">SCHEDULE E
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
							<span class="styFMT" style="font-size:12pt;padding-top:1mm;">Income, War Profits, and Excess Profits Taxes Paid or Accrued</span>
							<br /><br />
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
								<xsl:when test="$FormData/MissingEINReasonCd">
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
							<span class="sty5471SchEDotLn">...................................&#9658;</span>
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
							<span class="sty5471SchEDotLn">...................&#9658;</span>
						</div>
						<div class="styLNDesc" style="width:40mm;text-align:center;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/SanctionedCountryCd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part I -->
					<div class="styStdDivLS" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc" style="width:200mm;">
							Taxes for Which a Foreign Tax Credit Is Allowed
						</div>
						<div style="float:right;width:10mm;height:4mm;text-align:right;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/TxsForeignTaxCrAllowedGrp"/>
								<xsl:with-param name="containerID" select=" 'Part1Table' "/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerHeight" select="7"/>
							</xsl:call-template>
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/TxsForeignTaxCrAllowedGrp"/>
								<xsl:with-param name="containerID" select=" 'Part2Table' "/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerHeight" select="7"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Table 1 -->
					<xsl:variable name="shouldSeparateP1" select="($Print = $Separated) and (count($FormData/TxsForeignTaxCrAllowedGrp) &gt; 7)"/>
					<div class="styStdDivLS" style="" id="Part1Table">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:8mm;"> </th>
									<th class="styTableCellHeader" scope="col" style="min-width:32mm;width:94mm;font-weight:normal;">
										<span style="font-weight:bold;">(a) </span> <br /> Name of Payor Entity
									</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;">
										<span style="font-weight:bold;">(b) </span> <br />
										EIN or Reference ID Number of Payor Entity
									</th>
									<th class="styTableCellHeader" scope="col" style="width:38mm;font-weight:normal;font-family:Arial;">
										<span style="font-weight:bold;font-family:Verdana;">(c) </span> <br /> 
										Country or U.S. Possession <br /> to Which Tax Is Paid <br /> (Enter Code&mdash;see instructions. Use a separate line for each.)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:44mm;font-weight:normal;">
										<span style="font-weight:bold;">(d) </span> <br /> 
										Foreign Tax Year of Foreign Corporation to Which Tax Relates <br /> (Year/Month/Day)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:44mm;font-weight:normal;border-right-width:0px;">
										<span style="font-weight:bold;">(e) </span> <br /> 
										U.S. Tax Year of Foreign Corporation to Which Tax Relates <br /> (Year/Month/Day)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateP1)">
									<xsl:for-each select="$FormData/TxsForeignTaxCrAllowedGrp">
										<tr style="vertical-align:top;">
											<td class="styTableCellTextInherit" style="padding-left:2.5mm;font-weight:bold;">
												<xsl:if test="position() &lt;= 7">
													<xsl:value-of select="position()"/>
												</xsl:if>
											</td>
											<td class="styTableCellTextInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PayorName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="PayorName/BusinessNameLine2Txt"><br />
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PayorName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:choose>
													<xsl:when test="MissingEINReasonCd">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="PayorEIN"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="Desc">Part I, row <xsl:value-of select="position()"/> - Foreign Entity Reference IDs</xsl:with-param>
													<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossessionCd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignTaxYearEndDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="USTaxYearEndDt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateP1 or count($FormData/TxsForeignTaxCrAllowedGrp) &lt; 1">
									<tr style="vertical-align:top;">
										<td class="styTableCellTextInherit" style="padding-left:2.5mm;font-weight:bold;">1</td>
										<td class="styTableCellTextInherit" style="">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/TxsForeignTaxCrAllowedGrp"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$shouldSeparateP1 or count($FormData/TxsForeignTaxCrAllowedGrp) &lt; 7">
									<xsl:call-template name="FillTable1Cols">
										<xsl:with-param name="LineNumber" select="2 + count($FormData/TxsForeignTaxCrAllowedGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateP1"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Table 2 -->
					<div class="styStdDivLS" style="" id="Part2Table">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:8mm;"> </th>
									<th class="styTableCellHeader" scope="col" style="width:36mm;font-weight:normal;">
										<span style="font-weight:bold;">(f) </span> <br />
										Income Subject to Tax <br /> in the Foreign Jurisdiction <br /> (see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="min-width:32mm;width:78mm;font-weight:normal;">
										<span style="font-weight:bold;">(g) </span> <br /> 
										Tax Paid or Accrued <br /> (in local currency in which <br /> the tax is payable)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:46mm;font-weight:normal;">
										<span style="font-weight:bold;">(h) </span> <br /> 
										Conversion Rate to U.S. Dollars
									</th>
									<th class="styTableCellHeader" scope="col" style="width:44mm;font-weight:normal;">
										<span style="font-weight:bold;">(i) </span> <br /> 
										In U.S. Dollars <br /> (divide column (g) by column (h))
									</th>
									<th class="styTableCellHeader" scope="col" style="width:44mm;font-weight:normal;border-right-width:0px;">
										<span style="font-weight:bold;">(j) </span> <br /> 
										In Functional Currency <br /> of Foreign Corporation
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateP1)">
									<xsl:for-each select="$FormData/TxsForeignTaxCrAllowedGrp">
										<tr style="vertical-align:top;;">
											<td class="styTableCellTextInherit" style="padding-left:2.5mm;font-weight:bold;">
												<xsl:if test="position() &lt;= 7">
													<xsl:value-of select="position()"/>
												</xsl:if>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ForeignTaxableIncomeAmount"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
												<span style="float:left;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="CurrencyTxt"/>
													</xsl:call-template>
												</span>
												<span style="float:right;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TaxInForeignCurrencyAmt"/>
														<xsl:with-param name="MaxSize" select="17"/>
													</xsl:call-template>
												</span>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ConversionRt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxInUSDollarsAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxInFunctionalCurrencyAmt"/>
													<xsl:with-param name="MaxSize" select="17"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateP1 or count($FormData/TxsForeignTaxCrAllowedGrp) &lt; 1">
									<tr style="vertical-align:top;">
										<td class="styTableCellTextInherit" style="padding-left:2.5mm;font-weight:bold;">1</td>
										<td class="styTableCellTextInherit" style="">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/TxsForeignTaxCrAllowedGrp"/>
												<xsl:with-param name="ShortMessage" select="true()"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$shouldSeparateP1 or count($FormData/TxsForeignTaxCrAllowedGrp) &lt; 7">
									<xsl:call-template name="FillTable1Cols">
										<xsl:with-param name="LineNumber" select="2 + count($FormData/TxsForeignTaxCrAllowedGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateP1"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:if test="not($shouldSeparateP1)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/TxsForeignTaxCrAllowedGrp"/>
							<xsl:with-param name="containerID" select=" 'Part1Table' "/>
							<xsl:with-param name="headerHeight" select="1"/>
							<xsl:with-param name="containerHeight" select="7"/>
						</xsl:call-template>
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/TxsForeignTaxCrAllowedGrp"/>
							<xsl:with-param name="containerID" select=" 'Part2Table' "/>
							<xsl:with-param name="headerHeight" select="1"/>
							<xsl:with-param name="containerHeight" select="7"/>
						</xsl:call-template>
					</xsl:if>
					<!-- Part 1, Line 8 -->
					<div class="styStdDivLS" style="">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="styLNDesc" style="width:159.85mm;">
							Total (combine lines 1 through 7 of column (i)). Report amount on Schedule E-1, line 4
							<span class="sty5471SchEDotLn">..........&#9658;</span>
						</div>
						<div class="styLNAmountBox" style="width:44mm;padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalTaxInUSDollarsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:44mm;background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Part 1, Line 9 -->
					<div class="styStdDivLS" style="">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc" style="width:203.85mm;">
							Total (combine lines 1 through 7 of column (j)). See instructions for Schedule H, line 2g
							<span class="sty5471SchEDotLn">.....................&#9658;</span>
						</div>
						<div class="styLNAmountBoxNBB" style="width:44mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalTaxInFunctionalCurAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part II -->
					<div class="styStdDivLS" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc" style="width:200mm;">
							Election
						</div>
					</div>
					<div class="styStdDivLS">
						<div class="styLNDesc" style="width:256mm;float:none;">
							For tax years beginning after December 31, 2004, has an election been made under section 986(a)(1)(D) to translate taxes using the exchange rate on the date of payment?
						</div>
						<div class="styLNDesc" style="width:256mm;height:auto;float:none;padding-left:8mm;">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/Section986a1DElectionInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkboxNM">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Section986a1DElectionInd"/>
									<xsl:with-param name="BackupName">F5471SchESec986a1Election</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1mm;"/>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$FormData/Section986a1DElectionInd"/>
									<xsl:with-param name="BackupName">F5471SchESec986a1Election</xsl:with-param>
								</xsl:call-template>Yes
							</label>
							<span style="width:6mm;"/>
							<input type="checkbox" class="styCkboxNM">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Section986a1DElectionInd"/>
									<xsl:with-param name="BackupName">F5471SchESec986a1Election</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1mm;"/>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$FormData/Section986a1DElectionInd"/>
									<xsl:with-param name="BackupName">F5471SchESec986a1Election</xsl:with-param>
								</xsl:call-template>No
							</label>
							<span style="width:6mm;"/>
							If "Yes," state date of election &#9658; 
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/Section986a1DElectionDt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part III -->
					<div class="styStdDivLS" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc" style="width:200mm;">
							Taxes for Which a Foreign Tax Credit Is Disallowed <span style="font-weight:normal;"> (Enter in functional currency of foreign corporation.)</span>
						</div>
						<div style="float:right;height:4mm;width:5mm;text-align:right;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/TxsForeignTaxCrDisallowedGrp"/>
								<xsl:with-param name="containerID" select=" 'Part3Table' "/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerHeight" select="2"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Table 3 -->
					<xsl:variable name="shouldSeparateP3" select="($Print = $Separated) and (count($FormData/TxsForeignTaxCrDisallowedGrp) &gt; 2)"/>
					<div class="styStdDivLS" style="" id="Part3Table">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:8mm;"> </th>
									<th class="styTableCellHeader" scope="col" style="min-width:32mm;width:49mm;font-weight:normal;">
										<span style="font-weight:bold;">(a) </span> <br /> Name of Payor Entity
									</th>
									<th class="styTableCellHeader" scope="col" style="width:24mm;font-weight:normal;">
										<span style="font-weight:bold;">(b) </span> <br />
										EIN or Reference ID Number of Payor Entity
									</th>
									<th class="styTableCellHeader" scope="col" style="width:29mm;font-weight:normal;">
										<span style="font-weight:bold;">(c) </span> <br /> Section 901(j)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;">
										<span style="font-weight:bold;">(d) </span> <br /> Section 901(k) and (l)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:29mm;font-weight:normal;">
										<span style="font-weight:bold;">(e) </span> <br /> Section 901(m)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:29mm;font-weight:normal;">
										<span style="font-weight:bold;">(f) </span> <br /> U.S. Taxes
									</th>
									<th class="styTableCellHeader" scope="col" style="width:29mm;font-weight:normal;">
										<span style="font-weight:bold;">(g) </span> <br /> Other
									</th>
									<th class="styTableCellHeader" scope="col" style="width:29mm;font-weight:normal;border-right-width:0px;">
										<span style="font-weight:bold;">(h) </span> <br /> Total
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateP3)">
									<xsl:for-each select="$FormData/TxsForeignTaxCrDisallowedGrp">
										<tr style="vertical-align:top;;">
											<td class="styTableCellTextInherit" style="padding-left:2.5mm;font-weight:bold;">
												<xsl:if test="position() &lt; 3">
													<xsl:value-of select="position()"/>
												</xsl:if>
											</td>
											<td class="styTableCellTextInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PayorName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="PayorName/BusinessNameLine2Txt"><br />
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PayorName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:choose>
													<xsl:when test="MissingEINReasonCd">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="PayorEIN"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="Desc">Part III, row <xsl:value-of select="position()"/> - Foreign Entity Reference IDs</xsl:with-param>
													<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Section901jTaxAmt"/>
													<xsl:with-param name="MaxSize" select="17"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Section901kSection901lTaxAmt"/>
													<xsl:with-param name="MaxSize" select="17"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="Section901mTaxAmt"/>
													<xsl:with-param name="MaxSize" select="17"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="USTaxesAmt"/>
													<xsl:with-param name="MaxSize" select="17"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="OtherTaxAmt"/>
													<xsl:with-param name="MaxSize" select="17"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalTaxAmt"/>
													<xsl:with-param name="MaxSize" select="17"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateP3 or count($FormData/TxsForeignTaxCrDisallowedGrp) &lt; 1">
									<tr style="vertical-align:top;">
										<td class="styTableCellTextInherit" style="padding-left:2.5mm;font-weight:bold;">1</td>
										<td class="styTableCellTextInherit" style="">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/TxsForeignTaxCrDisallowedGrp"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$shouldSeparateP3 or count($FormData/TxsForeignTaxCrDisallowedGrp) &lt; 2">
									<tr style="vertical-align:top;">
										<td class="styTableCellTextInherit" style="padding-left:2.5mm;font-weight:bold;">2</td>
										<td class="styTableCellTextInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:if test="not($shouldSeparateP3)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/TxsForeignTaxCrDisallowedGrp"/>
							<xsl:with-param name="containerID" select=" 'Part3Table' "/>
							<xsl:with-param name="headerHeight" select="1"/>
							<xsl:with-param name="containerHeight" select="2"/>
						</xsl:call-template>
					</xsl:if>
					<!-- Part 3, Line 3 -->
					<div class="styStdDivLS" style="">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="width:218.85mm;">
							In functional currency (combine lines 1 and 2)
							<span class="sty5471SchEDotLn">......................................&#9658;</span>
						</div>
						<div class="styLNAmountBox" style="width:29mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FuncCurDsallwFrgnTotalTaxAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3, Line 4 -->
					<div class="styStdDivLS" style="">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc" style="width:218.85mm;">
							In U.S. dollars (translated at the average exchange rate, as defined in section 989(b)(3) and related regulations (see instructions))
							<span class="sty5471SchEDotLn">...........&#9658;</span>
						</div>
						<div class="styLNAmountBoxNBB" style="width:29mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/USdollarDsallwFrgnTotalTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Page footer-->
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Paperwork Reduction Act Notice, see instructions.</span>
						<span style="margin-left:60mm;font-size:6.5pt;">Cat. No. 73197A</span>
						<span style="float:right;font-weight:bold;font-size:6.5pt;">Schedule E (Form 5471) (12-2019)</span>
					</div>
					<div class="styStdDivLS" style="border-bottom:2px solid black;">
						Schedule E (Form 5471) (12-2019)
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span></span>
					</div>
					<div class="styStdDivLS">
						<div class="styPartName" style="width:30mm;">Schedule E-1</div>
						<div class="styPartDesc" style="width:225mm;">Taxes Paid, Accrued, or Deemed Paid on Accumulated Earnings and Profits (E&amp;P) of Foreign Corporation</div>
					</div>
					<!-- Sch E-1 cols (a)-(di) -->
					<div class="styStdDivLS" style="border-top:1px solid black;">
						<div class="sty5471SchEHeaderBox" style="width:132mm;border-left:none;min-height:0px;height:20mm;font-family:verdana;font-size:8pt;text-align:left;padding-left:2mm;">
							<br />
							<strong>IMPORTANT: </strong> 
							<span style="font-style:italic;display:inline;">Enter amounts in <br /> U.S. dollars unless otherwise noted <br /> (see instructions).</span>
						</div>
						<div class="sty5471SchEHeaderBox" style="width:124mm;font-weight:bold;min-height:0px;height:4mm;font-size:8pt;">
							Taxes related to:
						</div>
						<div class="sty5471SchEHeaderBox" style="height:16mm;">
							<strong style="font-size:8pt;font-family:Arial;">(a)</strong><br />
							Post-2017 E&amp;P Not <br /> Previously Taxed <br /> (post-2017 section <br />959(c)(3) balance)
						</div>
						<div class="sty5471SchEHeaderBox" style="height:16mm;">
							<strong style="font-size:8pt;">(b)</strong><br />
							Post-1986 Undistributed <br /> Earnings (post-1986 <br /> and pre-2018 <br /> section 959(c)(3) balance)
						</div>
						<div class="sty5471SchEHeaderBox" style="height:16mm;">
							<strong style="font-size:8pt;font-family:Arial;">(c)</strong><br />
							Pre-1987 E&amp;P Not <br /> Previously Taxed (pre-1987 <br /> section 959(c)(3) balance) <br /> (in functional currency)
						</div>
						<div class="sty5471SchEHeaderBox" style="height:16mm;">
							<strong style="font-size:8pt;font-family:Arial;">(d)</strong><br />
							Hovering Deficit and <br /> Suspended Taxes
						</div>
					</div>
					<!-- Line 1a -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;">1a</div>
						<div class="sty5471SchEDescBox">
							Balance at beginning of year (as reported in prior year Schedule E-1)
							<span class="sty5471SchEDotLn">........</span>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPost2017EPNotPrevTaxedGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPost1986UndistrEarnGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPre1987EPNotPrevTaxedGrp/BeginningYearBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCHoveringDfctDedSspndTaxGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 1b -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;padding-left:4.2mm;">b</div>
						<div class="sty5471SchEDescBox">
							Beginning balance adjustments (attach statement)
							<span class="sty5471SchEDotLn">..............</span>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPost2017EPNotPrevTaxedGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPost1986UndistrEarnGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPre1987EPNotPrevTaxedGrp/BeginningBalanceAdjustmentAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCHoveringDfctDedSspndTaxGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 1c -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;padding-left:4.2mm;">c</div>
						<div class="sty5471SchEDescBox">
							Adjusted beginning balance (combine lines 1a and 1b)
							<span class="sty5471SchEDotLn">.............</span>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPost2017EPNotPrevTaxedGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPost1986UndistrEarnGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPre1987EPNotPrevTaxedGrp/AdjustedBeginningBalanceAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCHoveringDfctDedSspndTaxGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;">2</div>
						<div class="sty5471SchEDescBox">
							Adjustment for redetermination of prior year U.S. tax liability
							<span class="sty5471SchEDotLn">...........</span>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPost2017EPNotPrevTaxedGrp/AdjustedForeignTaxCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPost1986UndistrEarnGrp/AdjustedForeignTaxCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPre1987EPNotPrevTaxedGrp/AdjustedForeignTaxCreditAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCHoveringDfctDedSspndTaxGrp/AdjustedForeignTaxCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3a -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;">3a</div>
						<div class="sty5471SchEDescBox">
							Taxes unsuspended under anti-splitter rules
							<span class="sty5471SchEDotLn">................</span>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPost2017EPNotPrevTaxedGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPost1986UndistrEarnGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPre1987EPNotPrevTaxedGrp/ReductionTxsUnsuspendedRuleAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCHoveringDfctDedSspndTaxGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3b -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;padding-left:4.2mm;">b</div>
						<div class="sty5471SchEDescBox">
							Taxes suspended under anti-splitter rules
							<span class="sty5471SchEDotLn">.................</span>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPost2017EPNotPrevTaxedGrp/DsallwDedTxsSuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPost1986UndistrEarnGrp/DsallwDedTxsSuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPre1987EPNotPrevTaxedGrp/DsallwDedTxsSuspendedRuleAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCHoveringDfctDedSspndTaxGrp/DsallwDedTxsSuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 4 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;">4</div>
						<div class="sty5471SchEDescBox">
							Taxes reported on Schedule E, Part I, line 8, column (i)
							<span class="sty5471SchEDotLn">.............</span>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPost2017EPNotPrevTaxedGrp/TotalTaxInUSDollarsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPost1986UndistrEarnGrp/TotalTaxInUSDollarsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPre1987EPNotPrevTaxedGrp/TotalTaxInUSDollarsAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCHoveringDfctDedSspndTaxGrp/TotalTaxInUSDollarsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5a -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;">5a</div>
						<div class="sty5471SchEDescBox">
							Taxes carried over in nonrecognition transactions
							<span class="sty5471SchEDotLn">..............</span>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPost2017EPNotPrevTaxedGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPost1986UndistrEarnGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPre1987EPNotPrevTaxedGrp/EPCyovNonrecognitionTransAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCHoveringDfctDedSspndTaxGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5b -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;padding-left:4.2mm;">b</div>
						<div class="sty5471SchEDescBox">
							Taxes reclassified as related to hovering deficit after nonrecognition transaction
							<span class="sty5471SchEDotLn">.....</span>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPost2017EPNotPrevTaxedGrp/ReclsEPNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPost1986UndistrEarnGrp/ReclsEPNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPre1987EPNotPrevTaxedGrp/ReclsEPNonrecognitionTransAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCHoveringDfctDedSspndTaxGrp/ReclsEPNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 6 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;">6</div>
						<div class="sty5471SchEDescBox">
							Other adjustments (attach statement)
							<span class="sty5471SchEDotLn">..................</span>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPost2017EPNotPrevTaxedGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPost1986UndistrEarnGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPre1987EPNotPrevTaxedGrp/TotalOtherAdjustmentsAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCHoveringDfctDedSspndTaxGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 7 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;">7</div>
						<div class="sty5471SchEDescBox">
							Taxes paid or accrued on accumulated E&amp;P (combine lines 1c through 6)
							<span class="sty5471SchEDotLn">.......</span>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPost2017EPNotPrevTaxedGrp/TotalCurrentAccumulatedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPost1986UndistrEarnGrp/TotalCurrentAccumulatedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPre1987EPNotPrevTaxedGrp/TotalCurrentAccumulatedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCHoveringDfctDedSspndTaxGrp/TotalCurrentAccumulatedEPAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 8 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;">8</div>
						<div class="sty5471SchEDescBox">
							Taxes deemed paid with respect to inclusions under section 951(a)(1) (see instructions)
							<span class="sty5471SchEDotLn">..</span>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPost2017EPNotPrevTaxedGrp/TxDeemedPd951a1InclsnAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPost1986UndistrEarnGrp/TxDeemedPd951a1InclsnAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPre1987EPNotPrevTaxedGrp/TxDeemedPd951a1InclsnAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCHoveringDfctDedSspndTaxGrp/TxDeemedPd951a1InclsnAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 9 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;">9</div>
						<div class="sty5471SchEDescBox">
							Taxes deemed paid with respect to inclusions under section 951A (see instructions)
							<span class="sty5471SchEDotLn">....</span>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPost2017EPNotPrevTaxedGrp/TxDeemedPd951AInclsnAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPost1986UndistrEarnGrp/TxDeemedPd951AInclsnAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPre1987EPNotPrevTaxedGrp/TxDeemedPd951AInclsnAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCHoveringDfctDedSspndTaxGrp/TxDeemedPd951AInclsnAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 10 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:8mm;border-bottom:1px solid black;">10</div>
						<div class="sty5471SchEDescBox">
							Taxes deemed paid with respect to actual distributions
							<span class="sty5471SchEDotLn">.............</span>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPost2017EPNotPrevTaxedGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPost1986UndistrEarnGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPre1987EPNotPrevTaxedGrp/ActualDistributionAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCHoveringDfctDedSspndTaxGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 11 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:8mm;border-bottom:1px solid black;">11</div>
						<div class="sty5471SchEDescBox">
							Taxes on amounts reclassified to section 959(c)(1) E&amp;P from section 959(c)(2) E&amp;P
							<span class="sty5471SchEDotLn">....</span>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPost2017EPNotPrevTaxedGrp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPost1986UndistrEarnGrp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPre1987EPNotPrevTaxedGrp/EarnInvstUSPropReclassifiedAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCHoveringDfctDedSspndTaxGrp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 12 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:8mm;border-bottom:1px solid black;">12</div>
						<div class="sty5471SchEDescBox">
							Other (attach statement)
							<span class="sty5471SchEDotLn">......................</span>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPost2017EPNotPrevTaxedGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPost1986UndistrEarnGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPre1987EPNotPrevTaxedGrp/OtherAdjustmentsTotalAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCHoveringDfctDedSspndTaxGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 13 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:8mm;border-bottom:1px solid black;">13</div>
						<div class="sty5471SchEDescBox">
							Taxes related to hovering deficit offset of undistributed post-transaction E&amp;P
							<span class="sty5471SchEDotLn">......</span>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPost2017EPNotPrevTaxedGrp/DeficitOffstPostTransEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPost1986UndistrEarnGrp/DeficitOffstPostTransEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPre1987EPNotPrevTaxedGrp/DeficitOffstPostTransEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCHoveringDfctDedSspndTaxGrp/DeficitOffstPostTransEPAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 14 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:8mm;border-bottom:1px solid black;">14</div>
						<div class="sty5471SchEDescBox">
							Balance at beginning of next year (combine lines 7 through 13)
							<span class="sty5471SchEDotLn">..........</span>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPost2017EPNotPrevTaxedGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPost1986UndistrEarnGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCPre1987EPNotPrevTaxedGrp/BalanceBeginningNextYearAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCHoveringDfctDedSspndTaxGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
					</div>
					
					<!-- Sch E-1 cols (e)(i)-(e)(viii) -->
					<div class="styStdDivLS" style="text-align:center;border-bottom:1px solid black;padding:0.5mm;">
						<strong>(e) Taxes related to previously taxed E&amp;P </strong> (see instructions)
					</div>
					<div class="styStdDivLS">
						<div class="sty5471SchEHeaderBox" style="width:8mm;border-left:none;">&nbsp;</div>
						<div class="sty5471SchEHeaderBox" style="">
							<strong style="font-size:8pt;">(i)</strong><br />
							Section 965(a) Inclusion <br /> (section 959(c)(1)(A))
						</div>
						<div class="sty5471SchEHeaderBox" style="">
							<strong style="font-size:8pt;">(ii)</strong><br />
							Section 965(b)(4)(A) <br /> (section 959(c)(1)(A))
						</div>
						<div class="sty5471SchEHeaderBox" style="font-family:Arial Narrow;">
							<strong style="font-size:8pt;font-family:Arial;">(iii)</strong><br />
							Earnings Invested in U.S. <br /> Property (section 959(c)(1)(A))
						</div>
						<div class="sty5471SchEHeaderBox" style="">
							<strong style="font-size:8pt;">(iv)</strong><br />
							Section 951A Inclusion <br /> (section 959(c)(1)(A))
						</div>
						<div class="sty5471SchEHeaderBox" style="font-family:Arial Narrow;">
							<strong style="font-size:8pt;font-family:Arial;">(v)</strong><br />
							Section 245A(e)(2) Inclusion <br /> (section 959(c)(1)(A))
						</div>
						<div class="sty5471SchEHeaderBox" style="">
							<strong style="font-size:8pt;">(vi)</strong><br />
							Section 959(e) <br /> (section 959(c)(1)(A))
						</div>
						<div class="sty5471SchEHeaderBox" style="font-family:Arial Narrow;">
							<strong style="font-size:8pt;font-family:Arial;">(vii)</strong><br />
							Section 964(e)(4) Inclusion <br /> (section 959(c)(1)(A))
						</div>
						<div class="sty5471SchEHeaderBox" style="font-family:Arial Narrow;">
							<strong style="font-size:8pt;font-family:Arial;">(viii)</strong><br />
							Section 951(a)(1)(A) Inclusion <br /> (section 959(c)(1)(A))
						</div>
					</div>
					<!-- Line 1a -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;">1a</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965aInclusionEPGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965b4AEPGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCErnInvstUSPropSect959c1AGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection951AInclusionEPGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect245Ae2Sect959c1AGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection959eSect959c1AGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection964e4Sect959c1AGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect951a1ASect959c1AGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 1b -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;padding-left:4.2mm;">b</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965aInclusionEPGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965b4AEPGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCErnInvstUSPropSect959c1AGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection951AInclusionEPGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect245Ae2Sect959c1AGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection959eSect959c1AGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection964e4Sect959c1AGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect951a1ASect959c1AGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 1c -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;padding-left:4.2mm;">c</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965aInclusionEPGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965b4AEPGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCErnInvstUSPropSect959c1AGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection951AInclusionEPGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect245Ae2Sect959c1AGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection959eSect959c1AGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection964e4Sect959c1AGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect951a1ASect959c1AGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;">2</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965aInclusionEPGrp/AdjustedForeignTaxCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965b4AEPGrp/AdjustedForeignTaxCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCErnInvstUSPropSect959c1AGrp/AdjustedForeignTaxCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection951AInclusionEPGrp/AdjustedForeignTaxCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect245Ae2Sect959c1AGrp/AdjustedForeignTaxCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection959eSect959c1AGrp/AdjustedForeignTaxCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection964e4Sect959c1AGrp/AdjustedForeignTaxCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect951a1ASect959c1AGrp/AdjustedForeignTaxCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3a -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;">3a</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965aInclusionEPGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965b4AEPGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCErnInvstUSPropSect959c1AGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection951AInclusionEPGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect245Ae2Sect959c1AGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection959eSect959c1AGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection964e4Sect959c1AGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect951a1ASect959c1AGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3b -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;padding-left:4.2mm;">b</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965aInclusionEPGrp/DsallwDedTxsSuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965b4AEPGrp/DsallwDedTxsSuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCErnInvstUSPropSect959c1AGrp/DsallwDedTxsSuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection951AInclusionEPGrp/DsallwDedTxsSuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect245Ae2Sect959c1AGrp/DsallwDedTxsSuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection959eSect959c1AGrp/DsallwDedTxsSuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection964e4Sect959c1AGrp/DsallwDedTxsSuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect951a1ASect959c1AGrp/DsallwDedTxsSuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 4 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;">4</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965aInclusionEPGrp/TotalTaxInUSDollarsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965b4AEPGrp/TotalTaxInUSDollarsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCErnInvstUSPropSect959c1AGrp/TotalTaxInUSDollarsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection951AInclusionEPGrp/TotalTaxInUSDollarsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect245Ae2Sect959c1AGrp/TotalTaxInUSDollarsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection959eSect959c1AGrp/TotalTaxInUSDollarsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection964e4Sect959c1AGrp/TotalTaxInUSDollarsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect951a1ASect959c1AGrp/TotalTaxInUSDollarsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5a -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;">5a</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965aInclusionEPGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965b4AEPGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCErnInvstUSPropSect959c1AGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection951AInclusionEPGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect245Ae2Sect959c1AGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection959eSect959c1AGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection964e4Sect959c1AGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect951a1ASect959c1AGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5b -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;padding-left:4.2mm;">b</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965aInclusionEPGrp/ReclsEPNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965b4AEPGrp/ReclsEPNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCErnInvstUSPropSect959c1AGrp/ReclsEPNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection951AInclusionEPGrp/ReclsEPNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect245Ae2Sect959c1AGrp/ReclsEPNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection959eSect959c1AGrp/ReclsEPNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection964e4Sect959c1AGrp/ReclsEPNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect951a1ASect959c1AGrp/ReclsEPNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 6 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;">6</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965aInclusionEPGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965b4AEPGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCErnInvstUSPropSect959c1AGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection951AInclusionEPGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect245Ae2Sect959c1AGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection959eSect959c1AGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection964e4Sect959c1AGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect951a1ASect959c1AGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 7 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;">7</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965aInclusionEPGrp/TotalCurrentAccumulatedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965b4AEPGrp/TotalCurrentAccumulatedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCErnInvstUSPropSect959c1AGrp/TotalCurrentAccumulatedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection951AInclusionEPGrp/TotalCurrentAccumulatedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect245Ae2Sect959c1AGrp/TotalCurrentAccumulatedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection959eSect959c1AGrp/TotalCurrentAccumulatedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection964e4Sect959c1AGrp/TotalCurrentAccumulatedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect951a1ASect959c1AGrp/TotalCurrentAccumulatedEPAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 8 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;">8</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965aInclusionEPGrp/TxDeemedPd951a1InclsnAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965b4AEPGrp/TxDeemedPd951a1InclsnAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCErnInvstUSPropSect959c1AGrp/TxDeemedPd951a1InclsnAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection951AInclusionEPGrp/TxDeemedPd951a1InclsnAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect245Ae2Sect959c1AGrp/TxDeemedPd951a1InclsnAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection959eSect959c1AGrp/TxDeemedPd951a1InclsnAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection964e4Sect959c1AGrp/TxDeemedPd951a1InclsnAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect951a1ASect959c1AGrp/TxDeemedPd951a1InclsnAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 9 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;">9</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965aInclusionEPGrp/TxDeemedPd951AInclsnAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965b4AEPGrp/TxDeemedPd951AInclsnAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCErnInvstUSPropSect959c1AGrp/TxDeemedPd951AInclsnAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection951AInclusionEPGrp/TxDeemedPd951AInclsnAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect245Ae2Sect959c1AGrp/TxDeemedPd951AInclsnAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection959eSect959c1AGrp/TxDeemedPd951AInclsnAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection964e4Sect959c1AGrp/TxDeemedPd951AInclsnAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect951a1ASect959c1AGrp/TxDeemedPd951AInclsnAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 10 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:8mm;border-bottom:1px solid black;">10</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965aInclusionEPGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965b4AEPGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCErnInvstUSPropSect959c1AGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection951AInclusionEPGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect245Ae2Sect959c1AGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection959eSect959c1AGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection964e4Sect959c1AGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect951a1ASect959c1AGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 11 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:8mm;border-bottom:1px solid black;">11</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965aInclusionEPGrp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965b4AEPGrp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCErnInvstUSPropSect959c1AGrp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection951AInclusionEPGrp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect245Ae2Sect959c1AGrp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection959eSect959c1AGrp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection964e4Sect959c1AGrp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect951a1ASect959c1AGrp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 12 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:8mm;border-bottom:1px solid black;">12</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965aInclusionEPGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965b4AEPGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCErnInvstUSPropSect959c1AGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection951AInclusionEPGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect245Ae2Sect959c1AGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection959eSect959c1AGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection964e4Sect959c1AGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect951a1ASect959c1AGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 13 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:8mm;border-bottom:1px solid black;">13</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965aInclusionEPGrp/DeficitOffstPostTransEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965b4AEPGrp/DeficitOffstPostTransEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCErnInvstUSPropSect959c1AGrp/DeficitOffstPostTransEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection951AInclusionEPGrp/DeficitOffstPostTransEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect245Ae2Sect959c1AGrp/DeficitOffstPostTransEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection959eSect959c1AGrp/DeficitOffstPostTransEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection964e4Sect959c1AGrp/DeficitOffstPostTransEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect951a1ASect959c1AGrp/DeficitOffstPostTransEPAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 14 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:8mm;border-bottom:1px solid black;">14</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965aInclusionEPGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965b4AEPGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCErnInvstUSPropSect959c1AGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection951AInclusionEPGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect245Ae2Sect959c1AGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection959eSect959c1AGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection964e4Sect959c1AGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect951a1ASect959c1AGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Form footer-->
					<div class="styStdDivLS pageEnd" style="border-top:1px solid black;">
						<span style="float:right;font-weight:bold;font-size:6.5pt;">Schedule E (Form 5471) (12-2019)</span>
					</div>
					<div class="styStdDivLS" style="border-bottom:2px solid black;">
						Schedule E (Form 5471) (12-2019)
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">3</span></span>
					</div>
					<div class="styStdDivLS">
						<div class="styPartName" style="width:30mm;">Schedule E-1</div>
						<div class="styPartDesc" style="width:225mm;">
							Taxes Paid, Accrued, or Deemed Paid on Accumulated Earnings and Profits (E&amp;P) of Foreign Corporation
							<span style="font-weight:normal;font-style:italic;"> (continued)</span>
						</div>
					</div>
					<!-- Sch E-1 cols (e)(ix)-(e)(xvi) -->
					<div class="styStdDivLS" style="text-align:center;border-bottom:1px solid black;padding:0.5mm;border-top:1px solid black;">
						<strong>(e) Taxes related to previously taxed E&amp;P </strong> (see instructions)
					</div>
					<div class="styStdDivLS">
						<div class="sty5471SchEHeaderBox" style="width:8mm;border-left:none;min-height:13mm;">&nbsp;</div>
						<div class="sty5471SchEHeaderBox" style="min-height:13mm;">
							<strong style="font-size:8pt;">(ix)</strong><br />
							Earnings invested in <br />Excess Passive Assets <br /> (section 959(c)(1)(B))
						</div>
						<div class="sty5471SchEHeaderBox" style="min-height:13mm;">
							<strong style="font-size:8pt;">(x)</strong><br />
							Section 965(a) Inclusion <br /> (section 959(c)(2))
						</div>
						<div class="sty5471SchEHeaderBox" style="min-height:13mm;">
							<strong style="font-size:8pt;font-family:Arial;">(xi)</strong><br />
							Section 965(b)(4)(A) <br /> (section 959(c)(2))
						</div>
						<div class="sty5471SchEHeaderBox" style="min-height:13mm;">
							<strong style="font-size:8pt;">(xii)</strong><br />
							Section 951A Inclusion <br /> (section 959(c)(2))
						</div>
						<div class="sty5471SchEHeaderBox" style="min-height:13mm;">
							<strong style="font-size:8pt;font-family:Arial;">(xiii)</strong><br />
							Section 245A(e)(2) <br /> Inclusion <br /> (section 959(c)(2))
						</div>
						<div class="sty5471SchEHeaderBox" style="min-height:13mm;">
							<strong style="font-size:8pt;">(xiv)</strong><br />
							Section 959(e) <br /> (section 959(c)(2))
						</div>
						<div class="sty5471SchEHeaderBox" style="min-height:13mm;">
							<strong style="font-size:8pt;font-family:Arial;">(xv)</strong><br />
							Section 964(e)(4) <br /> Inclusion <br /> (section 959(c)(2))
						</div>
						<div class="sty5471SchEHeaderBox" style="min-height:13mm;">
							<strong style="font-size:8pt;font-family:Arial;">(xvi)</strong><br />
							Section 951(a)(1)(A) <br /> Inclusion <br /> (section 959(c)(2))
						</div>
					</div>
					<!-- Line 1a -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;">1a</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEarnInvstExcessPssvAssetGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSct965aInclsnSect959c2Grp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect965b4ASection959c2Grp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection951AInclusionGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection245Ae2Sect959c2Grp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection959eSect959c2Grp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection964e4Sect959c2Grp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection951a1ASect959c2Grp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 1b -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;padding-left:4.2mm;">b</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEarnInvstExcessPssvAssetGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSct965aInclsnSect959c2Grp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect965b4ASection959c2Grp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection951AInclusionGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection245Ae2Sect959c2Grp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection959eSect959c2Grp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection964e4Sect959c2Grp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection951a1ASect959c2Grp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 1c -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;padding-left:4.2mm;">c</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEarnInvstExcessPssvAssetGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSct965aInclsnSect959c2Grp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect965b4ASection959c2Grp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection951AInclusionGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection245Ae2Sect959c2Grp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection959eSect959c2Grp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection964e4Sect959c2Grp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection951a1ASect959c2Grp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;">2</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEarnInvstExcessPssvAssetGrp/AdjustedForeignTaxCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSct965aInclsnSect959c2Grp/AdjustedForeignTaxCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect965b4ASection959c2Grp/AdjustedForeignTaxCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection951AInclusionGrp/AdjustedForeignTaxCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection245Ae2Sect959c2Grp/AdjustedForeignTaxCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection959eSect959c2Grp/AdjustedForeignTaxCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection964e4Sect959c2Grp/AdjustedForeignTaxCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection951a1ASect959c2Grp/AdjustedForeignTaxCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3a -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;">3a</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEarnInvstExcessPssvAssetGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSct965aInclsnSect959c2Grp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect965b4ASection959c2Grp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection951AInclusionGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection245Ae2Sect959c2Grp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection959eSect959c2Grp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection964e4Sect959c2Grp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection951a1ASect959c2Grp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3b -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;padding-left:4.2mm;">b</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEarnInvstExcessPssvAssetGrp/DsallwDedTxsSuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSct965aInclsnSect959c2Grp/DsallwDedTxsSuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect965b4ASection959c2Grp/DsallwDedTxsSuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection951AInclusionGrp/DsallwDedTxsSuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection245Ae2Sect959c2Grp/DsallwDedTxsSuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection959eSect959c2Grp/DsallwDedTxsSuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection964e4Sect959c2Grp/DsallwDedTxsSuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection951a1ASect959c2Grp/DsallwDedTxsSuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 4 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;">4</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEarnInvstExcessPssvAssetGrp/TotalTaxInUSDollarsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSct965aInclsnSect959c2Grp/TotalTaxInUSDollarsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect965b4ASection959c2Grp/TotalTaxInUSDollarsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection951AInclusionGrp/TotalTaxInUSDollarsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection245Ae2Sect959c2Grp/TotalTaxInUSDollarsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection959eSect959c2Grp/TotalTaxInUSDollarsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection964e4Sect959c2Grp/TotalTaxInUSDollarsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection951a1ASect959c2Grp/TotalTaxInUSDollarsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5a -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;">5a</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEarnInvstExcessPssvAssetGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSct965aInclsnSect959c2Grp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect965b4ASection959c2Grp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection951AInclusionGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection245Ae2Sect959c2Grp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection959eSect959c2Grp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection964e4Sect959c2Grp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection951a1ASect959c2Grp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5b -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;padding-left:4.2mm;">b</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEarnInvstExcessPssvAssetGrp/ReclsEPNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSct965aInclsnSect959c2Grp/ReclsEPNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect965b4ASection959c2Grp/ReclsEPNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection951AInclusionGrp/ReclsEPNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection245Ae2Sect959c2Grp/ReclsEPNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection959eSect959c2Grp/ReclsEPNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection964e4Sect959c2Grp/ReclsEPNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection951a1ASect959c2Grp/ReclsEPNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 6 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;">6</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEarnInvstExcessPssvAssetGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSct965aInclsnSect959c2Grp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect965b4ASection959c2Grp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection951AInclusionGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection245Ae2Sect959c2Grp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection959eSect959c2Grp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection964e4Sect959c2Grp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection951a1ASect959c2Grp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 7 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;">7</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEarnInvstExcessPssvAssetGrp/TotalCurrentAccumulatedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSct965aInclsnSect959c2Grp/TotalCurrentAccumulatedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect965b4ASection959c2Grp/TotalCurrentAccumulatedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection951AInclusionGrp/TotalCurrentAccumulatedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection245Ae2Sect959c2Grp/TotalCurrentAccumulatedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection959eSect959c2Grp/TotalCurrentAccumulatedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection964e4Sect959c2Grp/TotalCurrentAccumulatedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection951a1ASect959c2Grp/TotalCurrentAccumulatedEPAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 8 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;">8</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEarnInvstExcessPssvAssetGrp/TxDeemedPd951a1InclsnAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSct965aInclsnSect959c2Grp/TxDeemedPd951a1InclsnAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect965b4ASection959c2Grp/TxDeemedPd951a1InclsnAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection951AInclusionGrp/TxDeemedPd951a1InclsnAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection245Ae2Sect959c2Grp/TxDeemedPd951a1InclsnAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection959eSect959c2Grp/TxDeemedPd951a1InclsnAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection964e4Sect959c2Grp/TxDeemedPd951a1InclsnAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection951a1ASect959c2Grp/TxDeemedPd951a1InclsnAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 9 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;">9</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEarnInvstExcessPssvAssetGrp/TxDeemedPd951AInclsnAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSct965aInclsnSect959c2Grp/TxDeemedPd951AInclsnAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect965b4ASection959c2Grp/TxDeemedPd951AInclsnAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection951AInclusionGrp/TxDeemedPd951AInclsnAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection245Ae2Sect959c2Grp/TxDeemedPd951AInclsnAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection959eSect959c2Grp/TxDeemedPd951AInclsnAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection964e4Sect959c2Grp/TxDeemedPd951AInclsnAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection951a1ASect959c2Grp/TxDeemedPd951AInclsnAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 10 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:8mm;border-bottom:1px solid black;">10</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEarnInvstExcessPssvAssetGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSct965aInclsnSect959c2Grp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect965b4ASection959c2Grp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection951AInclusionGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection245Ae2Sect959c2Grp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection959eSect959c2Grp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection964e4Sect959c2Grp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection951a1ASect959c2Grp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 11 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:8mm;border-bottom:1px solid black;">11</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEarnInvstExcessPssvAssetGrp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSct965aInclsnSect959c2Grp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect965b4ASection959c2Grp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection951AInclusionGrp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection245Ae2Sect959c2Grp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection959eSect959c2Grp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection964e4Sect959c2Grp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection951a1ASect959c2Grp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 12 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:8mm;border-bottom:1px solid black;">12</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEarnInvstExcessPssvAssetGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSct965aInclsnSect959c2Grp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect965b4ASection959c2Grp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection951AInclusionGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection245Ae2Sect959c2Grp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection959eSect959c2Grp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection964e4Sect959c2Grp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection951a1ASect959c2Grp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 13 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:8mm;border-bottom:1px solid black;">13</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEarnInvstExcessPssvAssetGrp/DeficitOffstPostTransEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSct965aInclsnSect959c2Grp/DeficitOffstPostTransEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect965b4ASection959c2Grp/DeficitOffstPostTransEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection951AInclusionGrp/DeficitOffstPostTransEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection245Ae2Sect959c2Grp/DeficitOffstPostTransEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection959eSect959c2Grp/DeficitOffstPostTransEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection964e4Sect959c2Grp/DeficitOffstPostTransEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection951a1ASect959c2Grp/DeficitOffstPostTransEPAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 14 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:8mm;border-bottom:1px solid black;">14</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEarnInvstExcessPssvAssetGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSct965aInclsnSect959c2Grp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSect965b4ASection959c2Grp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection951AInclusionGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection245Ae2Sect959c2Grp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection959eSect959c2Grp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection964e4Sect959c2Grp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCEPSection951a1ASect959c2Grp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:1px solid black;">
						<span style="float:right;font-weight:bold;font-size:6.5pt;">Schedule E (Form 5471) (12-2019)</span>
					</div>
					<!-- Additional Data title bar and button -->
					<div class="styLeftOverTitleLineLandscape" id="LeftoverData">
						<div class="styLeftOverTitle">
							Additional Data        
						</div>
						<div class="styLeftOverButtonContainerLandscape">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data table -->
					<table class="styLeftOverTblLandscape">
						<xsl:call-template name="PopulateCommonLeftoverLandscape">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<br />
					<!-- Reference ID Numbers -->
					<xsl:if test="string-length($FormData/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum) &gt; 30 or
					 (count($FormData/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum) &gt; 1)">
						 <span class="styRepeatingDataTitle">
							 <br />
						</span>
						<table class="styDepTbl" style="font-size:7pt">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="text-align:left">
										Header - Foreign Corporation Reference ID number
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
					<xsl:for-each select="$FormData/TxsForeignTaxCrAllowedGrp">
						<xsl:if test="ForeignEntityIdentificationGrp">
							<br /><br />
							<span class="styRepeatingDataTitle">
								Part I, row <xsl:value-of select="position()"/> - Foreign Entity Reference IDs
							</span>
							<table class="styDepTbl" style="font-size:7pt">
								<thead class="styTableHead">
									<tr class="styDepTblHdr">
										<th class="styDepTblCell" style="text-align:left">
											Reference ID number
										</th>
									</tr>
								</thead>
								<tbody>
									<xsl:for-each select="ForeignEntityIdentificationGrp">
										<tr>
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
					</xsl:for-each>
					<xsl:for-each select="$FormData/TxsForeignTaxCrDisallowedGrp">
						<xsl:if test="ForeignEntityIdentificationGrp">
							<br /><br />
							<span class="styRepeatingDataTitle">
								Part III, row <xsl:value-of select="position()"/> - Foreign Entity Reference IDs
							</span>
							<table class="styDepTbl" style="font-size:7pt">
								<thead class="styTableHead">
									<tr class="styDepTblHdr">
										<th class="styDepTblCell" style="text-align:left">
											Reference ID number
										</th>
									</tr>
								</thead>
								<tbody>
									<xsl:for-each select="ForeignEntityIdentificationGrp">
										<tr>
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
					</xsl:for-each>
					<!-- Part 1 separated tables -->
					<xsl:if test="$shouldSeparateP1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part I - Taxes for Which a Foreign Tax Credit Is Allowed</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:256mm;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:8mm;"> </th>
									<th class="styDepTblCell" scope="col" style="min-width:32mm;width:94mm;font-weight:normal;">
										<span style="font-weight:bold;">(a) </span> <br /> Name of Payor Entity
									</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;">
										<span style="font-weight:bold;">(b) </span> <br />
										EIN or Reference ID Number of Payor Entity
									</th>
									<th class="styDepTblCell" scope="col" style="width:38mm;font-weight:normal;font-family:Arial;">
										<span style="font-weight:bold;font-family:Verdana;">(c) </span> <br /> 
										Country or U.S. Possession <br /> to Which Tax Is Paid <br /> (Enter Code&mdash;see instructions. Use a separate line for each.)
									</th>
									<th class="styDepTblCell" scope="col" style="width:44mm;font-weight:normal;">
										<span style="font-weight:bold;">(d) </span> <br /> 
										Foreign Tax Year of Foreign Corporation to Which Tax Relates <br /> (Year/Month/Day)
									</th>
									<th class="styDepTblCell" scope="col" style="width:44mm;font-weight:normal;">
										<span style="font-weight:bold;">(e) </span> <br /> 
										U.S. Tax Year of Foreign Corporation to Which Tax Relates <br /> (Year/Month/Day)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/TxsForeignTaxCrAllowedGrp">
									<tr style="border-color:black;vertical-align:top;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit" style="padding-left:2.5mm;font-weight:bold;">
											<xsl:if test="position() &lt;= 7">
												<xsl:value-of select="position()"/>
											</xsl:if>
										</td>
										<td class="styTableCellTextInherit" style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PayorName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="PayorName/BusinessNameLine2Txt"><br />
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PayorName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:choose>
												<xsl:when test="MissingEINReasonCd">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="PayorEIN"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Part I, row <xsl:value-of select="position()"/> - Foreign Entity Reference IDs</xsl:with-param>
												<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossessionCd"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignTaxYearEndDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="USTaxYearEndDt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:256mm;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:8mm;"> </th>
									<th class="styDepTblCell" scope="col" style="width:36mm;font-weight:normal;">
										<span style="font-weight:bold;">(f) </span> <br />
										Income Subject to Tax <br /> in the Foreign Jurisdiction <br /> (see instructions)
									</th>
									<th class="styDepTblCell" scope="col" style="min-width:32mm;width:78mm;font-weight:normal;">
										<span style="font-weight:bold;">(g) </span> <br /> 
										Tax Paid or Accrued <br /> (in local currency in which <br /> the tax is payable)
									</th>
									<th class="styDepTblCell" scope="col" style="width:46mm;font-weight:normal;">
										<span style="font-weight:bold;">(h) </span> <br /> 
										Conversion Rate to U.S. Dollars
									</th>
									<th class="styDepTblCell" scope="col" style="width:44mm;font-weight:normal;">
										<span style="font-weight:bold;">(i) </span> <br /> 
										In U.S. Dollars <br /> (divide column (g) by column (h))
									</th>
									<th class="styDepTblCell" scope="col" style="width:44mm;font-weight:normal;">
										<span style="font-weight:bold;">(j) </span> <br /> 
										In Functional Currency <br /> of Foreign Corporation
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/TxsForeignTaxCrAllowedGrp">
									<tr style="border-color:black;vertical-align:top;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit" style="padding-left:2.5mm;font-weight:bold;">
											<xsl:if test="position() &lt;= 7">
												<xsl:value-of select="position()"/>
											</xsl:if>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ForeignTaxableIncomeAmount"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">
											<span style="float:left;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CurrencyTxt"/>
												</xsl:call-template>
											</span>
											<span style="float:right;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxInForeignCurrencyAmt"/>
													<xsl:with-param name="MaxSize" select="17"/>
												</xsl:call-template>
											</span>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ConversionRt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxInUSDollarsAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TaxInFunctionalCurrencyAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Part 3 separated table -->
					<xsl:if test="$shouldSeparateP3">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part III - Taxes for Which a Foreign Tax Credit Is Disallowed</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:256mm;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:8mm;"> </th>
									<th class="styDepTblCell" scope="col" style="min-width:32mm;width:49mm;font-weight:normal;">
										<span style="font-weight:bold;">(a) </span> <br /> Name of Payor Entity
									</th>
									<th class="styDepTblCell" scope="col" style="width:24mm;font-weight:normal;">
										<span style="font-weight:bold;">(b) </span> <br />
										EIN or Reference ID Number of Payor Entity
									</th>
									<th class="styDepTblCell" scope="col" style="width:29mm;font-weight:normal;">
										<span style="font-weight:bold;">(c) </span> <br /> Section 901(j)
									</th>
									<th class="styDepTblCell" scope="col" style="width:30mm;font-weight:normal;">
										<span style="font-weight:bold;">(d) </span> <br /> Section 901(k) and (l)
									</th>
									<th class="styDepTblCell" scope="col" style="width:29mm;font-weight:normal;">
										<span style="font-weight:bold;">(e) </span> <br /> Section 901(m)
									</th>
									<th class="styDepTblCell" scope="col" style="width:29mm;font-weight:normal;">
										<span style="font-weight:bold;">(f) </span> <br /> U.S. Taxes
									</th>
									<th class="styDepTblCell" scope="col" style="width:29mm;font-weight:normal;">
										<span style="font-weight:bold;">(g) </span> <br /> Other
									</th>
									<th class="styDepTblCell" scope="col" style="width:29mm;font-weight:normal;">
										<span style="font-weight:bold;">(h) </span> <br /> Total
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/TxsForeignTaxCrDisallowedGrp">
									<tr style="border-color:black;vertical-align:top;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit" style="padding-left:2.5mm;font-weight:bold;">
											<xsl:if test="position() &lt; 3">
												<xsl:value-of select="position()"/>
											</xsl:if>
										</td>
										<td class="styTableCellTextInherit" style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PayorName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="PayorName/BusinessNameLine2Txt"><br />
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PayorName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:choose>
												<xsl:when test="MissingEINReasonCd">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="PayorEIN"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Part III, row <xsl:value-of select="position()"/> - Foreign Entity Reference IDs</xsl:with-param>
												<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Section901jTaxAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Section901kSection901lTaxAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Section901mTaxAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="USTaxesAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="OtherTaxAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalTaxAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<br /><br />
				</form>
			</body>
		</html>
	</xsl:template>	
	<xsl:template name="FillTable1Cols">
		<xsl:param name="LineNumber"/>
		<xsl:param name="SepMessage" select="false()"/>
		<xsl:param name="MaxLine" select="7"/>
		<tr>
			<td class="styTableCellTextInherit" style="padding-left:2.5mm;font-weight:bold;">
				<xsl:choose>
					<xsl:when test="$SepMessage">
						2
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$LineNumber"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:choose>
			<xsl:when test="$SepMessage">
				<xsl:call-template name="FillTable1Cols">
					<xsl:with-param name="LineNumber" select="3"/>
					<xsl:with-param name="SepMessage" select="false()"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$LineNumber &lt; $MaxLine">
				<xsl:call-template name="FillTable1Cols">
				<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
