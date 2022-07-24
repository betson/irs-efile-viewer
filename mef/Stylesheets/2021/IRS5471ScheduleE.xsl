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
							<div class="" style="padding-top:.5mm;font-size:7pt;">(Rev. December 2021)</div>
							<div class="styAgency" style="padding-top:.5mm;">Department of the Treasury
								<br/>Internal Revenue Service
							</div>
						</div>
						<div class="styFTBox" style="width:186mm;height:18mm;">
							<span class="styFMT" style="font-size:12pt;padding-top:1mm;">Income, War Profits, and Excess Profits Taxes Paid or Accrued</span>
							<br /><br />
							<span style="font-weight:bold;">
								&#9658;Attach to Form 5471.
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
						<div class="styLNDesc" style="width:40mm;border-bottom:1px solid black;text-align:center;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/SanctionedCountryCd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line c -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:6mm;">c</div>
						<div class="styLNDesc" style="width:210mm;">
							If one of the RBT codes is entered on line a, enter the country code for the treaty country (see instructions)
							<span class="sty5471SchEDotLn">.................&#9658;</span>
						</div>
						<div class="styLNDesc" style="width:40mm;text-align:center;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/TreatyCountryCd"/>
							</xsl:call-template>
						</div>
					</div>

					<!-- Part I -->
					<div class="styStdDivLS" style="border-bottom:0px solid black;border-top:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc" style="width:200mm;">
							Taxes for Which a Foreign Tax Credit Is Allowed
						</div>
					</div>
					<div class="styStdDivLS" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartDesc" style="width:200mm;">
							Section 1 — Taxes Paid or Accrued Directly by Foreign Corporation
						</div>
						<div style="float:right;width:10mm;height:4mm;text-align:right;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/TxsForeignTaxCrAllowedGrp"/>
								<xsl:with-param name="containerID" select=" 'Part1Table' "/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerHeight" select="4"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Table 1 -->
					<xsl:variable name="shouldSeparateP1" select="($Print = $Separated) and (count($FormData/TxsForeignTaxCrAllowedGrp) &gt; 4)"/>
					<div class="styStdDivLS" style="" id="Part1Table">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:8mm;"> </th>
									<th class="styTableCellHeader" scope="col" style="min-width:32mm;width:94mm;font-weight:normal;">
										<span style="font-weight:bold;">(a) </span> <br /> Name of Payor Entity
									</th>
									<th class="styTableCellHeader" scope="col" style="width:26mm;font-weight:normal;vertical-align:top">
										<span style="font-weight:bold;">(b) </span> <br />
										EIN or Reference<br /> ID Number<br /> of Payor Entity
									</th>
									<th class="styTableCellHeader" scope="col" style="width:8mm;font-weight:normal;font-family:Arial;vertical-align:top">
										<span style="font-weight:bold;font-family:Verdana;">(c) </span> <br /> 
										   Unsuspended<br />Taxes
									</th>
									<th class="styTableCellHeader" scope="col" style="width:36mm;font-weight:normal;font-family:Arial;vertical-align:top">
										<span style="font-weight:bold;font-family:Verdana;">(d) </span> <br /> 
										Country or U.S. Possession <br /> to Which Tax Is Paid <br /> (Enter Code&mdash;see instructions.<br /> Use a separate line for each.)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:42mm;font-weight:normal;vertical-align:top">
										<span style="font-weight:bold;">(e) </span> <br /> 
										Foreign Tax Year of Payor<br /> Entity to Which Tax Relates <br /> (Year/Month/Day)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:42mm;font-weight:normal;border-right-width:0px;vertical-align:top">
										<span style="font-weight:bold;">(f) </span> <br /> 
										U.S. Tax Year of Payor Entity<br /> to Which Tax Relates <br /> (Year/Month/Day)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateP1)">
									<xsl:for-each select="$FormData/TxsForeignTaxCrAllowedGrp">
										<tr style="vertical-align:top;">
											<td class="styTableCellTextInherit" style="padding-left:2.5mm;font-weight:bold;">
												<xsl:if test="position() &lt;= 4">
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
													<xsl:when test="PayorEIN">
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="PayorEIN"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>

											<td class="styTableCellCtrInherit" style="text-align:center">
												<span>
												  <input type="checkbox" class="styCkboxNM">
													<xsl:call-template name="PopulateCheckbox">
													  <xsl:with-param name="TargetNode" select="UnsuspendedTaxesInd"/>
													  <xsl:with-param name="BackupName">Unsuspended Taxes Indicator</xsl:with-param>    
													</xsl:call-template>
												  </input>
												</span>
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
								<xsl:if test="($Print = $Separated) and (count($FormData/TxsForeignTaxCrAllowedGrp) &gt; 4)">
									<tr style="vertical-align:top;">
										<td class="styTableCellTextInherit" style="padding-left:2.5mm;font-weight:bold;">1</td>
										<td class="styTableCellTextInherit" style="">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/TxsForeignTaxCrAllowedGrp"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellCtrInherit">
										   <input type="checkbox" class="styCkboxNM"/>
										</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
									<xsl:call-template name="FillTable1Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/TxsForeignTaxCrAllowedGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateP1"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="count($FormData/TxsForeignTaxCrAllowedGrp) &lt; 5">
									<xsl:call-template name="FillTable1Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/TxsForeignTaxCrAllowedGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateP1"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Table 2 -->
					<xsl:if test="(not($Print) or $Print = '') and (count($FormData/TxsForeignTaxCrAllowedGrp) &gt; 4)">
						<div style="width:256mm;text-align:right;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/TxsForeignTaxCrAllowedGrp"/>
								<xsl:with-param name="containerID" select=" 'Part2Table' "/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerHeight" select="4"/>
							</xsl:call-template>
						</div>
					</xsl:if>
					<div class="styStdDivLS" style="" id="Part2Table">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse; ">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:8mm;"> </th>
									<th class="styTableCellHeader" scope="col" style="width:36mm;font-weight:normal;vertical-align:top">
										<span style="font-weight:bold;vertical-align:top">(g) </span> <br />
										Income Subject to Tax <br /> in the Foreign Jurisdiction <br /> (see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;vertical-align:top">
										<span style="font-weight:bold;">(h) </span> <br /> 
										If taxes are paid on <br />U.S. source income <br /> check box
									</th>
									<th class="styTableCellHeader" scope="col" style="width:36mm;font-weight:normal;vertical-align:top">
										<span style="font-weight:bold;">(i) </span> <br /> 
										Local Currency in <br />Which Tax Is Payable <br /> (enter code - see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:34mm;font-weight:normal;vertical-align:top">
										<span style="font-weight:bold;">(j) </span> <br /> 
										Tax Paid or Accrued <br />(in local currency in which the tax is payable)  
									</th>
									<th class="styTableCellHeader" scope="col" style="width:34mm;font-weight:normal;vertical-align:top">
										<span style="font-weight:bold;">(k) </span> <br /> 
										Conversion Rate to <br /> U.S. Dollars 
									</th>
									<th class="styTableCellHeader" scope="col" style="width:42mm;font-weight:normal;vertical-align:top">
										<span style="font-weight:bold;">(l) </span> <br /> 
										In U.S. Dollars <br /> divide column (j) by column (k)) 
									</th>
									<th class="styTableCellHeader" scope="col" style="width:42mm;font-weight:normal;border-right-width:0px;vertical-align:top">
										<span style="font-weight:bold;">(m) </span> <br /> 
										In Functional Currency <br /> of Foreign Corporation
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateP1)">
									<xsl:for-each select="$FormData/TxsForeignTaxCrAllowedGrp">
										<tr style="vertical-align:top;;">
											<td class="styTableCellTextInherit" style="padding-left:2.5mm;font-weight:bold;">
												<xsl:if test="position() &lt;= 4">
													<xsl:value-of select="position()"/>
												</xsl:if>
											</td>
											<td class="styTableCellAmtInherit">
												<span style="float:right;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="ForeignTaxableIncomeAmount"/>
													</xsl:call-template>
												</span>
											</td>
											<td class="styTableCellCtrInherit" style="text-align:center">
												<span>
												  <input type="checkbox" class="styCkboxNM">
													<xsl:call-template name="PopulateCheckbox">
													  <xsl:with-param name="TargetNode" select="TaxPaidUSSourceIncomeInd"/>
													  <xsl:with-param name="BackupName">Tax Paid US Source Income Indicator</xsl:with-param>    
													</xsl:call-template>
												  </input>
												</span>
											</td>
											<td class="styTableCellCtrInherit">
												<span>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="LocalCurrencyCd"/>
													</xsl:call-template>
												</span>
											</td>
											<td class="styTableCellCtrInherit">
												<span style="float:right;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TaxInForeignCurrencyAmt"/>
														<xsl:with-param name="MaxSize" select="17"/>
													</xsl:call-template>
												</span>
											</td>
											<td class="styTableCellAmtInherit">
												<span style="float:right;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ConversionRt"/>
													</xsl:call-template>
												</span>
											</td>
											<td class="styTableCellAmtInherit">
												<span style="float:right;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TaxInUSDollarsAmt"/>
													</xsl:call-template>
												</span>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<span style="float:right;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TaxInFunctionalCurrencyAmt"/>
														<xsl:with-param name="MaxSize" select="17"/>
													</xsl:call-template>
												</span>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="($Print = $Separated) and count($FormData/TxsForeignTaxCrAllowedGrp) &gt; 4">
									<tr style="vertical-align:top;">
										<td class="styTableCellTextInherit" style="padding-left:2.5mm;font-weight:bold;">1</td>
										<td class="styTableCellTextInherit" style="">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/TxsForeignTaxCrAllowedGrp"/>
												<xsl:with-param name="ShortMessage" select="true()"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">
										   <input type="checkbox" class="styCkboxNM"/>
										</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
									<xsl:call-template name="FillTable2Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/TxsForeignTaxCrAllowedGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateP1"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="count($FormData/TxsForeignTaxCrAllowedGrp) &lt; 5">
									<xsl:call-template name="FillTable2Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/TxsForeignTaxCrAllowedGrp)"/>
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
							<xsl:with-param name="containerHeight" select="4"/>
						</xsl:call-template>
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/TxsForeignTaxCrAllowedGrp"/>
							<xsl:with-param name="containerID" select=" 'Part2Table' "/>
							<xsl:with-param name="headerHeight" select="1"/>
							<xsl:with-param name="containerHeight" select="4"/>
						</xsl:call-template>
					</xsl:if>
					<!-- Part 1, Line 5 -->
					<div class="styStdDivLS" style="">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc" style="width:166mm;">
							Total (combine lines 1 through 4 of column (l)). Also report amount on Schedule E-1, line 4
							<span class="sty5471SchEDotLn">...........&#9658;</span>
						</div>
						<div class="styLNAmountBox" style="width:40.8mm;padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalTaxInUSDollarsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width:41mm;background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Part 1, Line 6 -->
					<div class="styStdDivLS" style="">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc" style="width:206.8mm;">
							Total (combine lines 1 through 4 of column (m)).
							<span class="sty5471SchEDotLn">..................................&#9658;</span>
						</div>
						<div class="styLNAmountBoxNBB" style="width:41mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalTaxInFunctionalCurAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDivLS" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartDesc" style="width:200mm;">
							Section 2 — Taxes Deemed Paid by Foreign Corporation
						</div>
						<div style="float:right;width:10mm;height:4mm;text-align:right;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/TxsForeignTaxCrAllowedGrp"/>
								<xsl:with-param name="containerID" select=" 'Part21Table' "/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerHeight" select="4"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Table 2-1 -->
					<xsl:variable name="shouldSeparateP21" select="($Print = $Separated) and (count($FormData/TaxesDeemedPaidSection960bGrp) &gt; 4)"/>
					<div class="styStdDivLS" style="" id="Part21Table">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:8mm;"> </th>
									<th class="styTableCellHeader" scope="col" style="min-width:32mm;width:94mm;font-weight:normal;">
										<span style="font-weight:bold;">(a) </span> <br/> Name of Lower-Tier Distributing<br/>Foreign Corporation
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;vertical-align:top">
										<span style="font-weight:bold;">(b) </span> <br/>
										EIN or Reference ID Number of Lower-Tier Distributing Foreign Corporation
									</th>
									<th class="styTableCellHeader" scope="col" style="width:64mm;font-weight:normal;font-family:Arial;vertical-align:top">
										<span style="font-weight:bold;font-family:Verdana;">(c) </span> <br /> 
										Country or U.S. Possession <br /> to Which Tax Is Paid <br /> (Enter Code&mdash;see instructions. Use a separate line for each.)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;vertical-align:top">
										<span style="font-weight:bold;">(d) </span> <br /> 
										PTEP Group <br /> (enter code)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;border-right-width:0px;vertical-align:top">
										<span style="font-weight:bold;">(e) </span> <br /> 
										Annual PTEP Account <br /> (enter year)
									</th>
									<!--<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;border-right-width:0px;border-bottom-width:0px;background-color:lightgrey;">
									</th>-->
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateP21)">
									<xsl:for-each select="$FormData/TaxesDeemedPaidSection960bGrp">
										<tr style="vertical-align:top;">
											<td class="styTableCellTextInherit" style="padding-left:2.5mm;font-weight:bold;">
												<xsl:if test="position() &lt;= 4">
													<xsl:value-of select="position()"/>
												</xsl:if>
											</td>
											<td class="styTableCellTextInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DistributingForeignCorpName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="PayorName/BusinessNameLine2Txt"><br />
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DistributingForeignCorpName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:choose>
													<xsl:when test="DistributingForeignCorpEIN">
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="DistributingForeignCorpEIN"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossessionCd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PTEPGroupCd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateYear">
													<xsl:with-param name="TargetNode" select="AnnualPTEPAccountYr"/>
												</xsl:call-template>
											</td>
											<!--<td class="styTableCellCtrInherit" style="border-right-width:0px;border-bottom-width:0px;background-color:lightgrey;">
											</td>-->
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="($Print = $Separated) and count($FormData/TaxesDeemedPaidSection960bGrp) &gt; 4">
									<tr style="vertical-align:top;">
										<td class="styTableCellTextInherit" style="padding-left:2.5mm;font-weight:bold;">1</td>
										<td class="styTableCellTextInherit" style="">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/TaxesDeemedPaidSection960bGrp"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
									<xsl:call-template name="FillTable3Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/TxsForeignTaxCrAllowedGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateP1"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="count($FormData/TaxesDeemedPaidSection960bGrp) &lt; 5">
									<xsl:call-template name="FillTable3Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/TaxesDeemedPaidSection960bGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateP21"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Table 2-2 -->
					<xsl:if test="(not($Print) or $Print = '') and (count($FormData/TaxesDeemedPaidSection960bGrp) &gt; 4)">
						<div style="width:256mm;text-align:right;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/TaxesDeemedPaidSection960bGrp"/>
								<xsl:with-param name="containerID" select=" 'Part22Table' "/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerHeight" select="4"/>
							</xsl:call-template>
						</div>
					</xsl:if>
					<div class="styStdDivLS" style="" id="Part22Table">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse; ">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:8mm;"> </th>
									<th class="styTableCellHeader" scope="col" style="width:62mm;font-weight:normal;vertical-align:top">
										<span style="font-weight:bold;vertical-align:top">(f) </span> <br />
										PTEP Distributed <br /> (enter amount in functional currency)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:62mm;font-weight:normal;vertical-align:top">
										<span style="font-weight:bold;">(g) </span> <br /> 
										Total Amount of PTEP in the PTEP Group <br />(in functional currency)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:62mm;font-weight:normal;vertical-align:top">
										<span style="font-weight:bold;">(h) </span> <br /> 
										Total Amount of the PTEP Group Taxes With Respect to PTEP (USD)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:62mm;font-weight:normal;border-right-width:0px;vertical-align:top">
										<span style="font-weight:bold;">(i) </span> <br /> 
										Foreign Income Taxes Properly Attributabe to PTEP and not Previously Deemed Paid <br />
										 ((column (f)/column (g)) x column (h)) (USD)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateP21)">
									<xsl:for-each select="$FormData/TaxesDeemedPaidSection960bGrp">
										<tr style="vertical-align:top;;">
											<td class="styTableCellTextInherit" style="padding-left:2.5mm;font-weight:bold;">
												<xsl:if test="position() &lt;= 4">
													<xsl:value-of select="position()"/>
												</xsl:if>
											</td>
											<td class="styTableCellAmtInherit">
												<span style="float:right;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="DistributionPrevTxdIncmAmt"/>
													</xsl:call-template>
												</span>
											</td>
											<td class="styTableCellAmtInherit">
												<span style="float:right;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TotalPTEPInPTEPGrpAmt"/>
													</xsl:call-template>
												</span>
											</td>
											<td class="styTableCellAmtInherit">
												<span style="float:right;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TotPTEPGrpTxsRespectPTEPGrpAmt"/>
													</xsl:call-template>
												</span>
											</td>
											<td class="styTableCellCtrInherit" style="border-right-width:0px;">
												<span style="float:right;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="FrgnIncmPTEPNotPrevDmdPdAmt"/>
													</xsl:call-template>
												</span>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="($Print = $Separated) and count($FormData/TaxesDeemedPaidSection960bGrp) &gt; 4">
									<tr style="vertical-align:top;">
										<td class="styTableCellTextInherit" style="padding-left:2.5mm;font-weight:bold;">1</td>
										<td class="styTableCellTextInherit" style="">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/TaxesDeemedPaidSection960bGrp"/>
												<xsl:with-param name="ShortMessage" select="true()"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
									<xsl:call-template name="FillTable4Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/TxsForeignTaxCrAllowedGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateP1"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="count($FormData/TaxesDeemedPaidSection960bGrp) &lt; 5">
									<xsl:call-template name="FillTable4Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/TaxesDeemedPaidSection960bGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateP21"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:if test="not($shouldSeparateP21)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/TaxesDeemedPaidSection960bGrp"/>
							<xsl:with-param name="containerID" select=" 'Part21Table' "/>
							<xsl:with-param name="headerHeight" select="1"/>
							<xsl:with-param name="containerHeight" select="4"/>
						</xsl:call-template>
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/TaxesDeemedPaidSection960bGrp"/>
							<xsl:with-param name="containerID" select=" 'Part22Table' "/>
							<xsl:with-param name="headerHeight" select="1"/>
							<xsl:with-param name="containerHeight" select="4"/>
						</xsl:call-template>
					</xsl:if>
					<!-- Part 1, Section 2, Line 5 -->
					<div class="styStdDivLS" style="">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc" style="width:185.85mm;">
							Total (combine lines 1 through 4 of column (i)). Also report amount on Schedule E-1, line 6
							<span class="sty5471SchEDotLn">................&#9658;</span>
						</div>
						<div class="styLNAmountBoxNBB" style="width:62mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalTaxDeemedPdSection960bAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Page footer-->
					<div class="styStdDivLS pageEnd" style="border-top:1px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Paperwork Reduction Act Notice, see instructions.</span>
						<span style="margin-left:60mm;font-size:6.5pt;">Cat. No. 71397A</span>
						<span style="float:right;font-weight:bold;font-size:6.5pt;">Schedule E (Form 5471) (Rev. 12-2021)</span>
					</div>
					<div class="styStdDivLS" style="border-bottom:1px solid black;">
						Schedule E (Form 5471) (Rev. 12-2021)
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span></span>
					</div>

					<div class="styStdDivLS">
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
						<div class="styLNDesc" style="width:40mm;border-bottom:1px solid black;text-align:center;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/SanctionedCountryCd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line c -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:6mm;">c</div>
						<div class="styLNDesc" style="width:210mm;">
							If one of the RBT codes is entered on line a, enter the country code for the treaty country (see instructions)
							<span class="sty5471SchEDotLn">.................&#9658;</span>
						</div>
						<div class="styLNDesc" style="width:40mm;text-align:center;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/TreatyCountryCd"/>
							</xsl:call-template>
						</div>
					</div>



					<!-- Part II -->
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
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
							<input type="checkbox" class="styCkboxNM" alt="Section 986 a 1 D Election Yes Box">
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
							<input type="checkbox" class="styCkboxNM" alt="Section 986 a 1 D Election No Box">
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
									<th class="styTableCellHeader" scope="col" style="width:24mm;font-weight:normal;vertical-align:top">
										<span style="font-weight:bold;">(b) </span> <br />
										EIN or Reference ID Number of Payor Entity
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;font-weight:normal;vertical-align:top">
										<span style="font-weight:bold;">(c) </span> <br /> Section 901(j)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;font-weight:normal;vertical-align:top">
										<span style="font-weight:bold;">(d) </span> <br /> Section 901(k) and (l)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;font-weight:normal;vertical-align:top">
										<span style="font-weight:bold;">(e) </span> <br /> Section 901(m)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;font-weight:normal;vertical-align:top">
										<span style="font-weight:bold;">(f) </span> <br /> U.S. Taxes
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;font-weight:normal;vertical-align:top">
										<span style="font-weight:bold;">(g) </span> <br /> Suspended Taxes
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;font-weight:normal;vertical-align:top">
										<span style="font-weight:bold;">(h) </span> <br /> Other
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;font-weight:normal;border-right-width:0px;vertical-align:top">
										<span style="font-weight:bold;">(i) </span> <br /> Total
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
													<xsl:when test="PayorEIN">
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="PayorEIN"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
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
													<xsl:with-param name="TargetNode" select="SuspendedTaxesAmt"/>
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
								<xsl:if test="($Print = $Separated) and count($FormData/TxsForeignTaxCrDisallowedGrp) &gt; 2">
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
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
									<tr style="vertical-align:top;">
										<td class="styTableCellTextInherit" style="padding-left:2.5mm;font-weight:bold;">2</td>
										<td class="styTableCellTextInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($FormData/TxsForeignTaxCrDisallowedGrp) &lt; 2">
									<tr style="vertical-align:top;">
										<td class="styTableCellTextInherit" style="padding-left:2.5mm;font-weight:bold;">2</td>
										<td class="styTableCellTextInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
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
							In functional currency (combine lines 1 and 2).
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
					<div class="styStdDivLS" style="border-top:1px solid black;">
						<div class="styPartName" style="width:30mm;">Schedule E-1</div>
						<div class="styPartDesc" style="width:225mm;">Taxes Paid, Accrued, or Deemed Paid on Accumulated Earnings and Profits (E&amp;P) of Foreign Corporation</div>
					</div>
					<!-- Sch E-1 cols (a)-(di) -->
					<div class="styStdDivLS" style="border-top:1px solid black;">
						<div class="sty5471SchEHeaderBox" style="width:132mm;border-left:none;min-height:0px;height:14mm;font-family:verdana;font-size:8pt;text-align:left;padding-left:2mm;">
							<br />
							<strong>IMPORTANT: </strong> 
							<span style="font-style:italic;display:inline;">Enter amounts in U.S. dollars</span>
						</div>
						<div class="sty5471SchEHeaderBox" style="width:124mm;font-weight:bold;min-height:0px;height:4mm;font-size:8pt;">
							Taxes related to:
						</div>
						<div class="sty5471SchEHeaderBox" style="height:6mm;">
							<strong style="font-size:8pt;font-family:Arial;">(a)</strong><br />
							Subpart F Income
						</div>
						<div class="sty5471SchEHeaderBox" style="height:6mm;">
							<strong style="font-size:8pt;">(b)</strong><br />
							Tested Income
						</div>
						<div class="sty5471SchEHeaderBox" style="height:6mm;">
							<strong style="font-size:8pt;font-family:Arial;">(c)</strong><br />
							Residual Income
						</div>
						<div class="sty5471SchEHeaderBox" style="height:6mm;">
							<strong style="font-size:8pt;font-family:Arial;">(d)</strong><br />
							Suspended Taxes
						</div>
					</div>
					<!-- Line 1a -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;">1a</div>
						<div class="sty5471SchEDescBox">
							Balance at beginning of year (as reported in prior year Schedule E-1)
							<span class="sty5471SchEDotLn">........</span>
						</div>
						<div class="sty5471SchELNDescBox">-0-</div>
						<div class="sty5471SchELNDescBox">-0-</div>
						<div class="sty5471SchELNDescBox">-0-</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Frm5471SchESuspendedTaxesGrp/BeginningYearBalanceAmt"/>
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
						<div class="sty5471SchELNAmountBox" style="background-color:lightgrey"/>							
						<div class="sty5471SchELNAmountBox" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Frm5471SchESuspendedTaxesGrp/BeginningBalanceAdjustmentAmt"/>
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
						<div class="sty5471SchELNAmountBox" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Frm5471SchESuspendedTaxesGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;">2</div>
						<div class="sty5471SchEDescBox">
							Adjustment for foreign tax redetermination
							<span class="sty5471SchEDotLn">.................</span>
						</div>
						<div class="sty5471SchELNAmountBox" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Frm5471SchESuspendedTaxesGrp/AdjustedForeignTaxCreditAmt"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/Frm5471SchESubpartFIncomeGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Frm5471SchETestedIncomeGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Frm5471SchEResidualIncomeGrp/ReductionTxsUnsuspendedRuleAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Frm5471SchESuspendedTaxesGrp/ReductionTxsUnsuspendedRuleAmt"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/Frm5471SchESubpartFIncomeGrp/DsallwDedTxsSuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Frm5471SchETestedIncomeGrp/DsallwDedTxsSuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Frm5471SchEResidualIncomeGrp/DsallwDedTxsSuspendedRuleAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Frm5471SchESuspendedTaxesGrp/DsallwDedTxsSuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 4 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;">4</div>
						<div class="sty5471SchEDescBox">
							Taxes reported on Schedule E, Part I, Section 1, line 5, column (l)
							<span class="sty5471SchEDotLn">.........</span>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Frm5471SchESubpartFIncomeGrp/TotalTaxInUSDollarsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Frm5471SchETestedIncomeGrp/TotalTaxInUSDollarsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Frm5471SchEResidualIncomeGrp/TotalTaxInUSDollarsAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Frm5471SchESuspendedTaxesGrp/TotalTaxInUSDollarsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;">5</div>
						<div class="sty5471SchEDescBox">
							Taxes carried over in nonrecognition transactions
							<span class="sty5471SchEDotLn">..............</span>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Frm5471SchESubpartFIncomeGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Frm5471SchETestedIncomeGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Frm5471SchEResidualIncomeGrp/EPCyovNonrecognitionTransAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Frm5471SchESuspendedTaxesGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 6 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;">6</div>
						<div class="sty5471SchEDescBox">
							Taxes reported on Schedule E, Part I, Section 2, line 5, column (i)
							<span class="sty5471SchEDotLn">.........</span>
						</div>
						<div class="sty5471SchELNAmountBox" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox" style="background-color:lightgrey"/>
					</div>
					<!-- Line 7 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;">7</div>
						<div class="sty5471SchEDescBox">
							Other adjustments (attach statement)
							<span class="sty5471SchEDotLn">..................</span>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Frm5471SchESubpartFIncomeGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Frm5471SchETestedIncomeGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Frm5471SchEResidualIncomeGrp/TotalOtherAdjustmentsAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Frm5471SchESuspendedTaxesGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 8 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;">8</div>
						<div class="sty5471SchEDescBox">
							Taxes paid or accrued on current income/E&amp;P or accumulated E&amp;P (combine lines 1c through 7)
							<span class="sty5471SchEDotLn"></span>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Frm5471SchESubpartFIncomeGrp/TotalCurrentAccumulatedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Frm5471SchETestedIncomeGrp/TotalCurrentAccumulatedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Frm5471SchEResidualIncomeGrp/TotalCurrentAccumulatedEPAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Frm5471SchESuspendedTaxesGrp/TotalCurrentAccumulatedEPAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 9 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;">9</div>
						<div class="sty5471SchEDescBox">
							Taxes deemed paid with respect to inclusions (see instructions)
							<span class="sty5471SchEDotLn">..........</span>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Frm5471SchESubpartFIncomeGrp/TaxesDeemedPaidAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Frm5471SchETestedIncomeGrp/TaxesDeemedPaidAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox" style="background-color:lightgrey"/>
					</div>
					<!-- Line 10 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:8mm;border-bottom:1px solid black;">10</div>
						<div class="sty5471SchEDescBox">
							Taxes deemed paid with respect to actual distributions
							<span class="sty5471SchEDotLn">.............</span>
						</div>
						<div class="sty5471SchELNAmountBox" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Frm5471SchESuspendedTaxesGrp/ActualDistributionAmt"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/Frm5471SchESubpartFIncomeGrp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Frm5471SchETestedIncomeGrp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Frm5471SchEResidualIncomeGrp/EarnInvstUSPropReclassifiedAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Frm5471SchESuspendedTaxesGrp/EarnInvstUSPropReclassifiedAmt"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/Frm5471SchESubpartFIncomeGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Frm5471SchETestedIncomeGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Frm5471SchEResidualIncomeGrp/OtherAdjustmentsTotalAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Frm5471SchESuspendedTaxesGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 13 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:8mm;border-bottom:1px solid black;">13</div>
						<div class="sty5471SchEDescBox">
							Balance of taxes paid or accrued (combine lines 8 through 12 in columns (a), (b), and (c))
							<span class="sty5471SchEDotLn">..</span>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Frm5471SchESubpartFIncomeGrp/BalanceTxsPaidOrAccruedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Frm5471SchETestedIncomeGrp/BalanceTxsPaidOrAccruedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Frm5471SchEResidualIncomeGrp/BalanceTxsPaidOrAccruedAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox" style="background-color:lightgrey"/>
					</div>
					<!-- Line 14 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:8mm;border-bottom:1px solid black;">14</div>
						<div class="sty5471SchEDescBox">
							Reserved for future use
							<span class="sty5471SchEDotLn">.......................</span>
						</div>
						<div class="sty5471SchELNAmountBox" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox" style="background-color:lightgrey"/>
					</div>
					<!-- Line 15 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:8mm;border-bottom:1px solid black;">15</div>
						<div class="sty5471SchEDescBox">
							Reduction for other taxes not deemed paid
							<span class="sty5471SchEDotLn">.................</span>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Frm5471SchESubpartFIncomeGrp/RedOtherTxsNotDeemedPdAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Frm5471SchETestedIncomeGrp/RedOtherTxsNotDeemedPdAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Frm5471SchEResidualIncomeGrp/RedOtherTxsNotDeemedPdAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox" style="background-color:lightgrey">
						</div>
					</div>					
					<!-- Line 16 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:8mm;border-bottom:1px solid black;height:13mm;">16</div>
						<div class="sty5471SchEDescBox" style="height:13mm;">
							Balance of taxes paid or accrued at the beginning of the next year. Line 16,columns (a), (b), and (c),
							must always equal zero. So, if necessary, enter negative amounts on line 15 of
							columns (a), (b), and (c) in amounts sufficient to reduce line 13, columns (a), (b), and (c), to zero. For the
							remaining columns, combine lines 8 through 12
							<span class="sty5471SchEDotLn">...........</span>
						</div>
						<div class="sty5471SchELNDescBox" style="height:13mm;padding-top:9.5mm;">-0-</div>
						<div class="sty5471SchELNDescBox" style="height:13mm;padding-top:9.5mm;">-0-</div>
						<div class="sty5471SchELNDescBox" style="height:13mm;padding-top:9.5mm;">-0-</div>
						<div class="sty5471SchELNAmountBox" style="height:13mm;padding-top:9.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Frm5471SchESuspendedTaxesGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Form footer-->
					<div class="styStdDivLS pageEnd">
						<span style="float:right;font-weight:bold;font-size:6.5pt;">Schedule E (Form 5471) (Rev. 12-2021)</span>
					</div>
					<div class="styStdDivLS" style="border-bottom:1px solid black;">
						Schedule E (Form 5471) (Rev. 12-2021)
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">3</span></span>
					</div>

					<div class="styStdDivLS">
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
						<div class="styLNDesc" style="width:40mm;border-bottom:1px solid black;text-align:center;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/SanctionedCountryCd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line c -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:6mm;">c</div>
						<div class="styLNDesc" style="width:210mm;">
							If one of the RBT codes is entered on line a, enter the country code for the treaty country (see instructions)
							<span class="sty5471SchEDotLn">.................&#9658;</span>
						</div>
						<div class="styLNDesc" style="width:40mm;text-align:center;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/TreatyCountryCd"/>
							</xsl:call-template>
						</div>
					</div>



					<div class="styStdDivLS" style="border-top:1px solid black;">
						<div class="styPartName" style="width:30mm;">Schedule E-1</div>
						<div class="styPartDesc" style="width:225mm;">
							Taxes Paid, Accrued, or Deemed Paid on Accumulated Earnings and Profits (E&amp;P) of Foreign Corporation
							<span style="font-weight:normal;font-style:italic;"> (continued)</span>
						</div>
					</div>
					<!-- Sch E-1 cols (e)(i)-(e)(x) -->
					<div class="styStdDivLS" style="text-align:center;border-bottom:1px solid black;border-top:1px solid black;padding:0.5mm;">
						<strong>(e) Taxes related to previously taxed E&amp;P </strong> (see instructions)
					</div>
					<div class="styStdDivLS">
						<div class="sty5471SchEHeaderBox2" style="width:8mm;border-left:none;">&nbsp;</div>
						<div class="sty5471SchEHeaderBox2" style="">
							<strong style="font-size:8pt;">(i)</strong><br />
							Reclassified section 965(a) PTEP
						</div>
						<div class="sty5471SchEHeaderBox2" style="">
							<strong style="font-size:8pt;">(ii)</strong><br />
							Reclassified section 965(b) PTEP 
						</div>
						<div class="sty5471SchEHeaderBox2" style="font-family:Arial Narrow;">
							<strong style="font-size:8pt;font-family:Arial;">(iii)</strong><br />
							General section 959(c)(1) PTEP
						</div>
						<div class="sty5471SchEHeaderBox2" style="">
							<strong style="font-size:8pt;">(iv)</strong><br />
							Reclassified section 951A PTEP
						</div>
						<div class="sty5471SchEHeaderBox2" style="font-family:Arial Narrow;">
							<strong style="font-size:8pt;font-family:Arial;">(v)</strong><br />
							Reclassified section 245A(d) PTEP
						</div>
						<div class="sty5471SchEHeaderBox2" style="">
							<strong style="font-size:8pt;">(vi)</strong><br />
							Section 965(a) PTEP
						</div>
						<div class="sty5471SchEHeaderBox2" style="font-family:Arial Narrow;">
							<strong style="font-size:8pt;font-family:Arial;">(vii)</strong><br />
							Section 965(b) PTEP
						</div>
						<div class="sty5471SchEHeaderBox2" style="font-family:Arial Narrow;">
							<strong style="font-size:8pt;font-family:Arial;">(viii)</strong><br />
							Section 951A PTEP
						</div>
						<div class="sty5471SchEHeaderBox2" style="font-family:Arial Narrow;">
							<strong style="font-size:8pt;font-family:Arial;">(ix)</strong><br />
							Section 245A(d) PTEP
						</div>
						<div class="sty5471SchEHeaderBox2" style="font-family:Arial Narrow;">
							<strong style="font-size:8pt;font-family:Arial;">(x)</strong><br />
							Section 951(a)(1)(A) PTEP
						</div>
					</div>
					<!-- Line 1a -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;">1a</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclassifiedSect965aPTEPGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclassifiedSect965bPTEPGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCGeneralSection959c1PTEPGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclassifiedSect951APTEPGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclsSect245AdPTEPGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965aPTEPGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965bPTEPGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection951APTEPGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection245AdPTEPGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection951a1APTEPGrp/BeginningYearBalanceAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 1b -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;padding-left:4.2mm;">b</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclassifiedSect965aPTEPGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclassifiedSect965bPTEPGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCGeneralSection959c1PTEPGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclassifiedSect951APTEPGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclsSect245AdPTEPGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965aPTEPGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965bPTEPGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection951APTEPGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection245AdPTEPGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection951a1APTEPGrp/BeginningBalanceAdjustmentAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 1c -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;padding-left:4.2mm;">c</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclassifiedSect965aPTEPGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclassifiedSect965bPTEPGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCGeneralSection959c1PTEPGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclassifiedSect951APTEPGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclsSect245AdPTEPGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965aPTEPGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965bPTEPGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection951APTEPGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection245AdPTEPGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection951a1APTEPGrp/AdjustedBeginningBalanceAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;">2</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclassifiedSect965aPTEPGrp/AdjustedForeignTaxCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclassifiedSect965bPTEPGrp/AdjustedForeignTaxCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCGeneralSection959c1PTEPGrp/AdjustedForeignTaxCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclassifiedSect951APTEPGrp/AdjustedForeignTaxCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclsSect245AdPTEPGrp/AdjustedForeignTaxCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965aPTEPGrp/AdjustedForeignTaxCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965bPTEPGrp/AdjustedForeignTaxCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection951APTEPGrp/AdjustedForeignTaxCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection245AdPTEPGrp/AdjustedForeignTaxCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection951a1APTEPGrp/AdjustedForeignTaxCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3a -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;">3a</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclassifiedSect965aPTEPGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclassifiedSect965bPTEPGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCGeneralSection959c1PTEPGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclassifiedSect951APTEPGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclsSect245AdPTEPGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965aPTEPGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965bPTEPGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection951APTEPGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection245AdPTEPGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection951a1APTEPGrp/ReductionTxsUnsuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3b -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;padding-left:4.2mm;">b</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclassifiedSect965aPTEPGrp/DsallwDedTxsSuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclassifiedSect965bPTEPGrp/DsallwDedTxsSuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCGeneralSection959c1PTEPGrp/DsallwDedTxsSuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclassifiedSect951APTEPGrp/DsallwDedTxsSuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclsSect245AdPTEPGrp/DsallwDedTxsSuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965aPTEPGrp/DsallwDedTxsSuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965bPTEPGrp/DsallwDedTxsSuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection951APTEPGrp/DsallwDedTxsSuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection245AdPTEPGrp/DsallwDedTxsSuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection951a1APTEPGrp/DsallwDedTxsSuspendedRuleAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 4 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;">4</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclassifiedSect965aPTEPGrp/TotalTaxInUSDollarsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclassifiedSect965bPTEPGrp/TotalTaxInUSDollarsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCGeneralSection959c1PTEPGrp/TotalTaxInUSDollarsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclassifiedSect951APTEPGrp/TotalTaxInUSDollarsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclsSect245AdPTEPGrp/TotalTaxInUSDollarsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965aPTEPGrp/TotalTaxInUSDollarsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965bPTEPGrp/TotalTaxInUSDollarsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection951APTEPGrp/TotalTaxInUSDollarsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection245AdPTEPGrp/TotalTaxInUSDollarsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection951a1APTEPGrp/TotalTaxInUSDollarsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;">5</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclassifiedSect965aPTEPGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclassifiedSect965bPTEPGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCGeneralSection959c1PTEPGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclassifiedSect951APTEPGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclsSect245AdPTEPGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965aPTEPGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965bPTEPGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection951APTEPGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection245AdPTEPGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection951a1APTEPGrp/EPCyovNonrecognitionTransAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 6 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;">6</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclassifiedSect965aPTEPGrp/TotalTaxDeemedPdSection960bAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclassifiedSect965bPTEPGrp/TotalTaxDeemedPdSection960bAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCGeneralSection959c1PTEPGrp/TotalTaxDeemedPdSection960bAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclassifiedSect951APTEPGrp/TotalTaxDeemedPdSection960bAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclsSect245AdPTEPGrp/TotalTaxDeemedPdSection960bAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965aPTEPGrp/TotalTaxDeemedPdSection960bAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965bPTEPGrp/TotalTaxDeemedPdSection960bAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection951APTEPGrp/TotalTaxDeemedPdSection960bAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection245AdPTEPGrp/TotalTaxDeemedPdSection960bAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection951a1APTEPGrp/TotalTaxDeemedPdSection960bAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 7 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;">7</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclassifiedSect965aPTEPGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclassifiedSect965bPTEPGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCGeneralSection959c1PTEPGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclassifiedSect951APTEPGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclsSect245AdPTEPGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965aPTEPGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965bPTEPGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection951APTEPGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection245AdPTEPGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection951a1APTEPGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 8 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;">8</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclassifiedSect965aPTEPGrp/TotalCurrentAccumulatedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclassifiedSect965bPTEPGrp/TotalCurrentAccumulatedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCGeneralSection959c1PTEPGrp/TotalCurrentAccumulatedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclassifiedSect951APTEPGrp/TotalCurrentAccumulatedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclsSect245AdPTEPGrp/TotalCurrentAccumulatedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965aPTEPGrp/TotalCurrentAccumulatedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965bPTEPGrp/TotalCurrentAccumulatedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection951APTEPGrp/TotalCurrentAccumulatedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection245AdPTEPGrp/TotalCurrentAccumulatedEPAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection951a1APTEPGrp/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 9 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="width:8mm;border-bottom:1px solid black;">9</div>
						<div class="sty5471SchELNAmountBox2" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox2" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox2" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox2" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox2" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox2" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox2" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox2" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox2" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox2" style="background-color:lightgrey"/>
					</div>
					<!-- Line 10 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:8mm;border-bottom:1px solid black;">10</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclassifiedSect965aPTEPGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclassifiedSect965bPTEPGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCGeneralSection959c1PTEPGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclassifiedSect951APTEPGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclsSect245AdPTEPGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965aPTEPGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965bPTEPGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection951APTEPGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection245AdPTEPGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection951a1APTEPGrp/ActualDistributionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 11 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:8mm;border-bottom:1px solid black;">11</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclassifiedSect965aPTEPGrp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclassifiedSect965bPTEPGrp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCGeneralSection959c1PTEPGrp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclassifiedSect951APTEPGrp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclsSect245AdPTEPGrp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965aPTEPGrp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965bPTEPGrp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection951APTEPGrp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection245AdPTEPGrp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection951a1APTEPGrp/EarnInvstUSPropReclassifiedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 12 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:8mm;border-bottom:1px solid black;">12</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclassifiedSect965aPTEPGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclassifiedSect965bPTEPGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCGeneralSection959c1PTEPGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclassifiedSect951APTEPGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclsSect245AdPTEPGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965aPTEPGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965bPTEPGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection951APTEPGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection245AdPTEPGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection951a1APTEPGrp/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 13 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:8mm;border-bottom:1px solid black;">13</div>
						<div class="sty5471SchELNAmountBox2" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox2" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox2" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox2" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox2" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox2" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox2" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox2" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox2" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox2" style="background-color:lightgrey"/>
					</div>
					<!-- Line 14 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:8mm;border-bottom:1px solid black;">14</div>
						<div class="sty5471SchELNAmountBox2" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox2" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox2" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox2" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox2" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox2" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox2" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox2" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox2" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox2" style="background-color:lightgrey"/>
					</div>
					<!-- Line 15 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:8mm;border-bottom:1px solid black;">15</div>
						<div class="sty5471SchELNAmountBox2" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox2" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox2" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox2" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox2" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox2" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox2" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox2" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox2" style="background-color:lightgrey"/>
						<div class="sty5471SchELNAmountBox2" style="background-color:lightgrey"/>
					</div>
					<!-- Line 16 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="width:8mm;border-bottom:1px solid black;">16</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclassifiedSect965aPTEPGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclassifiedSect965bPTEPGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCGeneralSection959c1PTEPGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclassifiedSect951APTEPGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCReclsSect245AdPTEPGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965aPTEPGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection965bPTEPGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection951APTEPGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection245AdPTEPGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty5471SchELNAmountBox2">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CFCSection951a1APTEPGrp/BalanceBeginningNextYearAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Form footer-->
					<div class="styStdDivLS pageEnd" style="">
						<span style="float:right;font-weight:bold;font-size:6.5pt;">Schedule E (Form 5471) (Rev. 12-2021)</span>
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
					<!--<xsl:for-each select="$FormData/TxsForeignTaxCrAllowedGrp">
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
					</xsl:for-each>-->
					<!--<xsl:for-each select="$FormData/TxsForeignTaxCrDisallowedGrp">
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
					</xsl:for-each>-->
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
									<th class="styDepTblCell" scope="col" style="width:26mm;font-weight:normal;">
										<span style="font-weight:bold;">(b) </span> <br />
										EIN or Reference<br /> ID Number<br /> of Payor Entity
									</th>
									<th class="styDepTblCell" scope="col" style="width:8mm;font-weight:normal;">
										<span style="font-weight:bold;">(c) </span> <br />
										Unsuspended Taxes
									</th>
									<th class="styDepTblCell" scope="col" style="width:36mm;font-weight:normal;font-family:Arial;">
										<span style="font-weight:bold;font-family:Verdana;">(d) </span> <br /> 
										Country or U.S. Possession <br /> to Which Tax Is Paid <br /> (Enter Code&mdash;see instructions.<br /> Use a separate line for each.)
									</th>
									<th class="styDepTblCell" scope="col" style="width:42mm;font-weight:normal;">
										<span style="font-weight:bold;">(e) </span> <br /> 
										Foreign Tax Year of Payor<br /> Entity to Which Tax Relates <br /> (Year/Month/Day)
									</th>
									<th class="styDepTblCell" scope="col" style="width:42mm;font-weight:normal;">
										<span style="font-weight:bold;">(f) </span> <br /> 
										U.S. Tax Year of Payor Entity<br /> to Which Tax Relates <br /> (Year/Month/Day)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/TxsForeignTaxCrAllowedGrp">
									<tr style="border-color:black;vertical-align:top;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit" style="padding-left:2.5mm;font-weight:bold;">
											<xsl:if test="position() &lt;= 4">
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
													<xsl:when test="PayorEIN">
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="PayorEIN"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
														</xsl:call-template>
													</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellAmtInherit" style="text-align:center">
											<span>
												<input type="checkbox" class="styCkboxNM">
													<xsl:call-template name="PopulateCheckbox">
													  <xsl:with-param name="TargetNode" select="UnsuspendedTaxesInd"/>
													  <xsl:with-param name="BackupName">Unsuspended Taxes Indicator</xsl:with-param>    
													</xsl:call-template>
												</input>
											</span>
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
						</table> <br /> 
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:256mm;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:8mm;"> </th>
									<th class="styTableCellHeader" scope="col" style="width:36mm;font-weight:normal;vertical-align:top">
										<span style="font-weight:bold;vertical-align:top">(g) </span> <br />
										Income Subject to Tax <br /> in the Foreign Jurisdiction <br /> (see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;vertical-align:top">
										<span style="font-weight:bold;">(h) </span> <br /> 
										If taxes are paid on <br />U.S. source income <br /> check box
									</th>
									<th class="styTableCellHeader" scope="col" style="width:36mm;font-weight:normal;vertical-align:top">
										<span style="font-weight:bold;">(i) </span> <br /> 
										Local Currency in <br />Which Tax Is Payable <br /> (enter code - see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:34mm;font-weight:normal;vertical-align:top">
										<span style="font-weight:bold;">(j) </span> <br /> 
										Tax Paid or Accrued <br />(in local currency in which the tax is payable)  
									</th>
									<th class="styTableCellHeader" scope="col" style="width:34mm;font-weight:normal;vertical-align:top">
										<span style="font-weight:bold;">(k) </span> <br /> 
										Conversion Rate to <br /> U.S. Dollars 
									</th>
									<th class="styTableCellHeader" scope="col" style="width:34mm;font-weight:normal;vertical-align:top">
										<span style="font-weight:bold;">(l) </span> <br /> 
										In U.S. Dollars <br /> divide column (j) by column (k)) 
									</th>
									<th class="styTableCellHeader" scope="col" style="width:44mm;font-weight:normal;border-right-width:0px;vertical-align:top">
										<span style="font-weight:bold;">(m) </span> <br /> 
										In Functional Currency <br /> of Foreign Corporation
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/TxsForeignTaxCrAllowedGrp">
									<tr style="border-color:black;vertical-align:top;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit" style="padding-left:2.5mm;font-weight:bold;">
											<xsl:if test="position() &lt;= 4">
												<xsl:value-of select="position()"/>
											</xsl:if>
										</td>
										<td class="styTableCellAmtInherit">
											<span style="float:right;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ForeignTaxableIncomeAmount"/>
												</xsl:call-template>
											</span>
										</td>
										<td class="styTableCellAmtInherit" style="text-align:center">
											<span>
											  <input type="checkbox" class="styCkboxNM">
												<xsl:call-template name="PopulateCheckbox">
												  <xsl:with-param name="TargetNode" select="TaxPaidUSSourceIncomeInd"/>
												  <xsl:with-param name="BackupName">Tax Paid US Source Income Indicator</xsl:with-param>    
												</xsl:call-template>
											  </input>
											</span>
										</td>
										<td class="styTableCellAmtInherit" style="text-align:center">
											<span>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="LocalCurrencyCd"/>
												</xsl:call-template>
											</span>
										</td>
										<td class="styTableCellCtrInherit">
											<span style="float:right;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxInForeignCurrencyAmt"/>
													<xsl:with-param name="MaxSize" select="17"/>
												</xsl:call-template>
											</span>
										</td>
										<td class="styTableCellAmtInherit">
											<span style="float:right;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ConversionRt"/>
												</xsl:call-template>
											</span>
										</td>
										<td class="styTableCellAmtInherit">
											<span style="float:right;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxInUSDollarsAmt"/>
												</xsl:call-template>
											</span>
										</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">
											<span style="float:right;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TaxInFunctionalCurrencyAmt"/>
													<xsl:with-param name="MaxSize" select="17"/>
												</xsl:call-template>
											</span>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>


<!-- Part 1 Section 2 separated tables -->
					<xsl:if test="$shouldSeparateP21">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Section 2 — Taxes Deemed Paid by Foreign Corporation</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:256mm;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:8mm;"> </th>
									<th class="styTableCellHeader" scope="col" style="min-width:32mm;width:94mm;font-weight:normal;">
										<span style="font-weight:bold;">(a) </span> <br/> Name of Lower-Tier Distributing<br/>Foreign Corporation
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;vertical-align:top">
										<span style="font-weight:bold;">(b) </span> <br/>
										EIN or Reference ID Number of Lower-Tier Distributing Foreign Corporation
									</th>
									<th class="styTableCellHeader" scope="col" style="width:64mm;font-weight:normal;font-family:Arial;vertical-align:top">
										<span style="font-weight:bold;font-family:Verdana;">(c) </span> <br /> 
										Country or U.S. Possession <br /> to Which Tax Is Paid <br /> (Enter Code&mdash;see instructions. Use a separate line for each.)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;vertical-align:top">
										<span style="font-weight:bold;">(d) </span> <br /> 
										PTEP Group <br /> (enter code)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;vertical-align:top">
										<span style="font-weight:bold;">(e) </span> <br /> 
										Annual PTEP Account <br /> (enter year)
									</th>
									<!--<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;border-right-width:0px;border-bottom-width:0px;background-color:lightgrey;">
									</th>-->
								</tr>
							</thead>
							<tbody>
									<xsl:for-each select="$FormData/TaxesDeemedPaidSection960bGrp">
										<tr style="border-color:black;vertical-align:top;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit" style="padding-left:2.5mm;font-weight:bold;">
											<xsl:if test="position() &lt;= 4">
												<xsl:value-of select="position()"/>
											</xsl:if>
										</td>
											<td class="styTableCellTextInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DistributingForeignCorpName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="PayorName/BusinessNameLine2Txt"><br />
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DistributingForeignCorpName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:choose>
													<xsl:when test="DistributingForeignCorpEIN">
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="DistributingForeignCorpEIN"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossessionCd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PTEPGroupCd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateYear">
													<xsl:with-param name="TargetNode" select="AnnualPTEPAccountYr"/>
												</xsl:call-template>
											</td>
											<!--<td class="styTableCellCtrInherit" style="border-right-width:0px;border-bottom-width:0px;background-color:lightgrey;">
											</td>-->
										</tr>
									</xsl:for-each>
							</tbody>
						</table> <br /> 
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:256mm;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styTableCellHeader" scope="col" style="width:8mm;"> </th>
									<th class="styTableCellHeader" scope="col" style="width:62mm;font-weight:normal;vertical-align:top">
										<span style="font-weight:bold;vertical-align:top">(f) </span> <br />
										PTEP Distributed <br /> (enter amount in functional currency)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:62mm;font-weight:normal;vertical-align:top">
										<span style="font-weight:bold;">(g) </span> <br /> 
										Total Amount of PTEP in the PTEP Group <br />(in functional currency)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:62mm;font-weight:normal;vertical-align:top">
										<span style="font-weight:bold;">(h) </span> <br /> 
										Total Amount of the PTEP Group Taxes With Respect to PTEP (USD)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:62mm;font-weight:normal;border-right-width:0px;vertical-align:top">
										<span style="font-weight:bold;">(i) </span> <br /> 
										Foreign Income Taxes Properly Attributabe to PTEP and not Previously Deemed Paid <br />
										 ((column (f)/column (g)) x column (h)) (USD)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/TaxesDeemedPaidSection960bGrp">
									<tr style="border-color:black;vertical-align:top;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit" style="padding-left:2.5mm;font-weight:bold;">
											<xsl:if test="position() &lt;= 4">
												<xsl:value-of select="position()"/>
											</xsl:if>
										</td>
										<td class="styTableCellAmtInherit">
												<span style="float:right;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="DistributionPrevTxdIncmAmt"/>
													</xsl:call-template>
												</span>
											</td>
											<td class="styTableCellAmtInherit">
												<span style="float:right;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TotalPTEPInPTEPGrpAmt"/>
													</xsl:call-template>
												</span>
											</td>
											<td class="styTableCellAmtInherit">
												<span style="float:right;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TotPTEPGrpTxsRespectPTEPGrpAmt"/>
													</xsl:call-template>
												</span>
											</td>
											<td class="styTableCellCtrInherit" style="border-right-width:0px;">
												<span style="float:right;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="FrgnIncmPTEPNotPrevDmdPdAmt"/>
													</xsl:call-template>
												</span>
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
						<span class="styRepeatingDataTitle">Part III - Taxes for Which a Foreign Tax Credit Is Disallowed <span style="font-weight:normal;"> (Enter in functional currency of foreign corporation.)</span></span>
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
									<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;">
										<span style="font-weight:bold;">(c) </span> <br /> Section 901(j)
									</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;">
										<span style="font-weight:bold;">(d) </span> <br /> Section 901(k) and (l)
									</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;">
										<span style="font-weight:bold;">(e) </span> <br /> Section 901(m)
									</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;">
										<span style="font-weight:bold;">(f) </span> <br /> U.S. Taxes
									</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;">
										<span style="font-weight:bold;">(g) </span> <br /> Suspended Taxes
									</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;">
										<span style="font-weight:bold;">(h) </span> <br /> Other
									</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;">
										<span style="font-weight:bold;">(i) </span> <br /> Total
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
		<xsl:param name="MaxLine" select="4"/>
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
			<td class="styTableCellCtrInherit">
			   <input type="checkbox" class="styCkboxNM"/>
			</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
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
	<xsl:template name="FillTable2Cols">
		<xsl:param name="LineNumber"/>
		<xsl:param name="SepMessage" select="false()"/>
		<xsl:param name="MaxLine" select="4"/>
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
			<td class="styTableCellCtrInherit">
			   <input type="checkbox" class="styCkboxNM"/>
			</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:choose>
			<xsl:when test="$SepMessage">
				<xsl:call-template name="FillTable2Cols">
					<xsl:with-param name="LineNumber" select="3"/>
					<xsl:with-param name="SepMessage" select="false()"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$LineNumber &lt; $MaxLine">
				<xsl:call-template name="FillTable2Cols">
				<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="FillTable3Cols">
		<xsl:param name="LineNumber"/>
		<xsl:param name="SepMessage" select="false()"/>
		<xsl:param name="MaxLine" select="4"/>
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
				<xsl:call-template name="FillTable3Cols">
					<xsl:with-param name="LineNumber" select="3"/>
					<xsl:with-param name="SepMessage" select="false()"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$LineNumber &lt; $MaxLine">
				<xsl:call-template name="FillTable3Cols">
				<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="FillTable4Cols">
		<xsl:param name="LineNumber"/>
		<xsl:param name="SepMessage" select="false()"/>
		<xsl:param name="MaxLine" select="4"/>
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
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:choose>
			<xsl:when test="$SepMessage">
				<xsl:call-template name="FillTable4Cols">
					<xsl:with-param name="LineNumber" select="3"/>
					<xsl:with-param name="SepMessage" select="false()"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$LineNumber &lt; $MaxLine">
				<xsl:call-template name="FillTable4Cols">
				<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
