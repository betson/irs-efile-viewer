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
	<xsl:include href="IRS8992Style.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS8992" />
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
				<meta name="Description" content="IRS Form 8992" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8992Style" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form8992">
					<xsl:call-template name="DocumentHeader" />
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDiv">
						<div class="styFNBox" style="width:30mm;height:22.5mm;">
							Form <span class="styFN" style="font-size:18pt;">8992</span> 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData" />
							</xsl:call-template>
							<br /><br />
							(Rev. January 2020)<br />
							<br />
							<span class="styAgency">
								Department of the Treasury
								<br />
								Internal Revenue Service
							</span>
						</div>
						<div class="styFTBox" style="width:127mm;height:22.5mm;">
							<span class="styFMT" style="font-size:11pt;padding-top:1mm;padding-bottom:2mm;">U.S. Shareholder Calculation of Global Intangible <br />
							Low-Taxed Income (GILTI)</span>
							<br /><br /><br />
							<span style="font-weight:bold;">
								&#9658;Go to
								<span style="font-style:italic">www.irs.gov/Form8992</span>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:30mm;height:22.5mm;">
							<div class="styOMB" style="height:auto;font-size:6pt;padding-top:4mm;padding-bottom:4mm;">OMB No. 1545-0123</div>
							<div style="margin-left:0mm;text-align:left;font-size:7pt;padding-top:2mm;">
								Attachment<br/>Sequence No. 
								<span class="styBoldText" style="font-size:9pt;">992</span>
							</div>
						</div>
					</div>
					<!-- Filer information section -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styNameBox" style="width:135mm;">
							Name of person filing this return <br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template><br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:52mm;padding-left:1mm;font-weight:normal;">
							<span style="font-weight:bold;padding-right:1mm;">A</span> Identifying number <br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styNameBox" style="width:135mm;">
							Name of U.S. shareholder <br />
							<xsl:choose>
								<xsl:when test="$FormData/ShareholderBusinessName">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ShareholderBusinessName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<xsl:if test="$FormData/ShareholderBusinessName/BusinessNameLine2Txt">
										<br />
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/ShareholderBusinessName/BusinessNameLine2Txt"/>
										</xsl:call-template>
									</xsl:if>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ShareholderPersonNm"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="styEINBox" style="width:52mm;padding-left:1mm;font-weight:normal;">
							<span style="font-weight:bold;padding-right:1mm;">B</span> Identifying number <br />
							<xsl:choose>
								<xsl:when test="$FormData/EIN">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$FormData/EIN"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:when test="$FormData/MissingEINReasonCd">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/MissingEINReasonCd"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$FormData/SSN"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<!-- Part 1 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc" style="width:167mm;">
							Net Controlled Foreign Corporation (CFC) Tested Income
						</div>
					</div>
					<!-- Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc">
							Sum of Pro Rata Share of Net Tested Income. Enter total from Schedule A, line 1, column (e)
							<span class="sty8992DotLn">.....</span>
						</div>
						<div class="styLNRightNumBox">1</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotProRataShrCFCTestedIncmAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc">
							Sum of Pro Rata Share of Net Tested Loss. Enter total from Schedule A, line 1, column (f)
							<span class="sty8992DotLn">......</span>
						</div>
						<div class="styLNRightNumBox">2</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$FormData/TotProRataShrNetTestedLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc">
							Net CFC Tested Income. Combine line 1 and line 2. If zero or negative, stop here
							<span class="sty8992DotLn">........</span>
						</div>
						<div class="styLNRightNumBoxNBB">3</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetCFCTestedIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2 -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc" style="width:167mm;">
							Calculation of Global Intangible Low-Taxed Income (GILTI)
						</div>
					</div>
					<!-- Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc">
							Net CFC Tested Income. Enter amount from Part I, line 3
							<span class="sty8992DotLn">...............</span>
						</div>
						<div class="styLNRightNumBox">1</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetCFCTestedIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc">
							Deemed Tangible Income Return (DTIR). Multiply the total from Schedule A, line 1, column (g) by 10% (0.10)
							<!--<span class="sty8992DotLn">.</span>-->
						</div>
						<div class="styLNRightNumBox">2</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DeemedTangibleIncomeReturnAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3a</div>
						<div class="styLNDesc" style="width:98mm;height:7mm;">
							Sum of Pro Rata Share of Tested Interest Expense. Enter total from <br /> Schedule A, line 1, column (j)
							<span class="sty8992DotLn">..............</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br />3a</div>
						<div class="styLNAmountBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotProRataShrTestedIntExpnsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;"></div>
						<div class="styLNAmountBoxNBB" style="height:7mm;"></div>
					</div>
					<!-- Line 3b -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBox" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="width:98mm;height:7mm;">
							Sum of Pro Rata Share of Tested Interest Income. Enter total from <br /> Schedule A, line 1, column (i)
							<span class="sty8992DotLn">..............</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br />3b</div>
						<div class="styLNAmountBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotProRataShrTestedIntIncmAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;"></div>
						<div class="styLNAmountBoxNBB" style="height:7mm;"></div>
					</div>
					<!-- Line 3c -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBox" style="padding-left:4.2mm;">c</div>
						<div class="styLNDesc">
							Specified Interest Expense. Subtract line 3b from line 3a. If zero or less, enter -0- 
							<span class="sty8992DotLn">........</span>
						</div>
						<div class="styLNRightNumBox">3c</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SpecifiedInterestExpenseAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 4 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc">
							Net DTIR. Subtract line 3c from line 2. If zero or less, enter -0-
							<span class="sty8992DotLn">..............</span>
						</div>
						<div class="styLNRightNumBox">4</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetDTIRAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc">
							GILTI. Subtract line 4 from line 1
							<span class="sty8992DotLn">.......................</span>
						</div>
						<div class="styLNRightNumBoxNBB">5</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/GILTIReceivedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Paperwork Reduction Act Notice, see separate instructions.</span>
						<span style="margin-left:25mm;">Cat. No. 37816Y</span>
						<span style="float:right;">Form <strong>8992</strong> (Rev. 1-2020)</span>
					</div>
					<!-- Page 2 -->
					<div class="styStdDivLS" style="border-bottom:2px solid black;">
						Form 8992 (Rev. 1-2020)
						<div style="float:right;">Page <strong>2</strong></div>
					</div>
					<!-- Sch A -->
					<div class="styStdDivLS" style="border-bottom:1px solid black;">
						<div class="styPartName" style="width:20mm;">Schedule A</div>
						<div class="styPartDesc" style="width:235mm;">
							Schedule A for U.S. Shareholder Calculation of Global Intangible Low-Taxed Income (GILTI)
						</div>
					</div>
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styNameBox" style="width:180mm;">
							Name of person filing this form <br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template><br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:52mm;padding-left:1mm;font-weight:normal;">
							<span style="font-weight:bold;padding-right:1mm;">A</span> Identifying number <br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<div class="styStdDivLS" style="border-bottom:1px solid black;">
						<div class="styNameBox" style="width:180mm;">
							Name of U.S. shareholder <br />
							<xsl:choose>
								<xsl:when test="$FormData/ShareholderBusinessName">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ShareholderBusinessName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<xsl:if test="$FormData/ShareholderBusinessName/BusinessNameLine2Txt">
										<br />
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/ShareholderBusinessName/BusinessNameLine2Txt"/>
										</xsl:call-template>
									</xsl:if>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ShareholderPersonNm"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="styEINBox" style="width:52mm;padding-left:1mm;font-weight:normal;">
							<span style="font-weight:bold;padding-right:1mm;">B</span> Identifying number <br />
							<xsl:choose>
								<xsl:when test="$FormData/EIN">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$FormData/EIN"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:when test="$FormData/MissingEINReasonCd">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/MissingEINReasonCd"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$FormData/SSN"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<div class="styStdDivLS" style="border-bottom:1px solid black;">
						<div style="width:55mm;float:left;">&nbsp;</div>
						<div style="width:150mm;border-right:1px solid black;text-align:center;float:left;">
							<strong>Calculations for Net Tested Income</strong><br />(see instructions)
						</div>
						<div style="width:46mm;text-align:center;font-weight:bold;float:left;">
							GILTI Allocated to Tested <br /> Income CFCs
						</div>
						<div style="width:5mm;float:left;text-align:right;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/USShrCalcGILTIGrp"/>
								<xsl:with-param name="containerID" select=" 'SchATable' "/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerHeight" select="10"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Table 1, cols (a)-(e) -->
					<xsl:variable name="shouldSeparate" select="($Print = $Separated) and (count($FormData/USShrCalcGILTIGrp) &gt; 10)"/>
					<div class="styStdDivLS" style="" id="SchATable">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="min-width:22mm;width:30.4mm;font-weight:normal;">
										<span style="font-weight:bold;">(a) </span> <br /> Name of CFC
									</th>
									<th class="styTableCellHeader" scope="col" style="width:14mm;font-weight:normal;">
										<span style="font-weight:bold;">(b) </span> <br />
										EIN or <br /> Reference ID
									</th>
									<th class="styTableCellHeader" scope="col" style="width:21.5mm;font-weight:normal;">
										<span style="font-weight:bold;">(c) </span> <br />
										Tested Income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:23.3mm;min-width:23.3mm;font-weight:normal;">
										<span style="font-weight:bold;">(d) </span> <br />
										Tested Loss
									</th>
									<th class="styTableCellHeader" scope="col" style="width:21.5mm;font-weight:normal;">
										<span style="font-weight:bold;">(e) </span> <br />
										Pro Rata Share <br /> of Tested <br /> Income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:23.3mm;min-width:23.3mm;font-weight:normal;">
										<span style="font-weight:bold;">(f) </span> <br />
										Pro Rata Share <br /> of Tested <br /> Loss
									</th>
									<th class="styTableCellHeader" scope="col" style="width:21.4mm;font-weight:normal;">
										<span style="font-weight:bold;">(g) </span> <br />
										Pro Rata Share <br /> of Qualified <br /> Business Asset <br /> Investment <br /> (QBAI)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:23.3mm;min-width:23.3mm;font-weight:normal;">
										<span style="font-weight:bold;">(h) </span> <br />
										Pro Rata Share <br /> of Tested <br /> Loss QBAI <br /> Amount
									</th>
									<th class="styTableCellHeader" scope="col" style="width:21.5mm;font-weight:normal;">
										<span style="font-weight:bold;">(i) </span> <br />
										Pro Rata Share <br /> of Tested <br /> Interest <br /> Income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:21.5mm;font-weight:normal;">
										<span style="font-weight:bold;">(j) </span> <br />
										Pro Rata Share <br /> of Tested <br /> Interest <br /> Expense
									</th>
									<th class="styTableCellHeader" scope="col" style="width:12.5mm;font-weight:normal;">
										<span style="font-weight:bold;">(k) </span> <br /> <span style="font-family:Arial;">
										GILTI <br /> Allocation <br /> Ratio <br /> (Divide <br /> Col. (e) by <br /> Col. (e), <br /> Line 1 <br /> Total)</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:21.5mm;font-weight:normal;border-right-width:0px;">
										<span style="font-weight:bold;">(l) </span> <br />
										GILTI Allocated to Tested Income CFCs (Multiply Form 8992, Part II, Line 5, by Col. (k))
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparate)">
									<xsl:for-each select="$FormData/USShrCalcGILTIGrp">
										<tr style="vertical-align:top;font-size:6pt;">
											<td class="styTableCellTextInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CFCName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="CFCName/BusinessNameLine2Txt"><br />
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="CFCName/BusinessNameLine2Txt"/>
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
															<xsl:with-param name="TargetNode" select="EIN"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="Desc">Schedule A, row <xsl:value-of select="position()"/> - Foreign Entity Reference IDs</xsl:with-param>
													<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="NetTestedIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateNegativeNumber">
													<xsl:with-param name="TargetNode" select="NetTestedLossAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ProRataShareCFCTestedIncmAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateNegativeNumber">
													<xsl:with-param name="TargetNode" select="ProRataShrNetTestedLossAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ProRataShareQBAIAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateNegativeNumber">
													<xsl:with-param name="TargetNode" select="ProRataShrTestedLossQBAIAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ProRataShrTestedIntIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ProRataShrTestedIntExpenseAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GILTIAllocationRt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GILTIAllocTestedIncmCFCAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparate or count($FormData/USShrCalcGILTIGrp) &lt; 1">
									<tr style="vertical-align:top;">
										<td class="styTableCellTextInherit" style="">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/USShrCalcGILTIGrp"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">(<span style="width:20mm;"/>)</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">(<span style="width:20mm;"/>)</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">(<span style="width:20mm;"/>)</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$shouldSeparate or count($FormData/USShrCalcGILTIGrp) &lt; 10">
									<xsl:call-template name="FillTableCols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/USShrCalcGILTIGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparate"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:if test="not($shouldSeparate)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/USShrCalcGILTIGrp"/>
							<xsl:with-param name="containerID" select=" 'SchATable' "/>
							<xsl:with-param name="headerHeight" select="1"/>
							<xsl:with-param name="containerHeight" select="10"/>
						</xsl:call-template>
					</xsl:if>
					<div class="styStdDivLS" style="font-size:6pt;">
						<div class="styLNDesc" style="width:44.3mm;font-size:7pt;">
							<strong>1. </strong> Totals (see instructions)
							<span class="sty8992DotLn">..</span>
						</div>
						<div class="styLNAmountBoxNBB" style="width:21.49mm;padding-right:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalNetTestedIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:23.3mm;padding-right:1px;">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$FormData/TotalNetTestedLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:21.50mm;padding-right:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotProRataShrCFCTestedIncmAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:23.29mm;padding-right:1px;">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$FormData/TotProRataShrNetTestedLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:21.45mm;padding-right:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalProRataShareQBAIAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:23.30mm;padding-right:1px;">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$FormData/TotProRataShrTestedLossQBAIAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:21.5mm;padding-right:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotProRataShrTestedIntIncmAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:21.4mm;padding-right:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotProRataShrTestedIntExpnsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:12.6mm;padding-right:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalGILTIAllocationRt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:21.5mm;padding-right:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotGILTIAllocTestedIncmCFCAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDivLS" style="font-weight:bold;border-top:1px solid black;">
						Totals on line 1 should include the totals from any continuation sheets.
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;">
						<span style="float:right;">Form <strong>8992</strong> (Rev. 1-2020)</span>
					</div>
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLineLandscape" id="LeftoverData">
						<div class="styLeftOverTitle">
						   Additional Data        
						</div>
						<div class="styLeftOverButtonContainerLandscape">
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
					<!-- Sch A separated table -->
					<xsl:if test="$shouldSeparate">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Schedule A - U.S. Shareholder Calculation of Global Intangible Low-Taxed Income (GILTI)</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:256mm;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="min-width:24mm;width:30.4mm;font-weight:normal;">
										<span style="font-weight:bold;">(a) </span> <br /> Name of CFC
									</th>
									<th class="styDepTblCell" scope="col" style="width:14mm;font-weight:normal;">
										<span style="font-weight:bold;">(b) </span> <br />
										EIN or <br /> Reference ID
									</th>
									<th class="styDepTblCell" scope="col" style="width:21.5mm;font-weight:normal;">
										<span style="font-weight:bold;">(c) </span> <br />
										Tested Income
									</th>
									<th class="styDepTblCell" scope="col" style="width:23.3mm;min-width:23.3mm;font-weight:normal;">
										<span style="font-weight:bold;">(d) </span> <br />
										Tested Loss
									</th>
									<th class="styDepTblCell" scope="col" style="width:21.5mm;font-weight:normal;">
										<span style="font-weight:bold;">(e) </span> <br />
										Pro Rata Share <br /> of Tested <br /> Income
									</th>
									<th class="styDepTblCell" scope="col" style="width:23.3mm;min-width:23.3mm;font-weight:normal;">
										<span style="font-weight:bold;">(f) </span> <br />
										Pro Rata Share <br /> of Tested <br /> Loss
									</th>
									<th class="styDepTblCell" scope="col" style="width:21.4mm;font-weight:normal;">
										<span style="font-weight:bold;">(g) </span> <br />
										Pro Rata Share <br /> of Qualified <br /> Business Asset <br /> Investment <br /> (QBAI)
									</th>
									<th class="styDepTblCell" scope="col" style="width:23.3mm;min-width:23.3mm;font-weight:normal;">
										<span style="font-weight:bold;">(h) </span> <br />
										Pro Rata Share <br /> of Tested <br /> Loss QBAI <br /> Amount
									</th>
									<th class="styDepTblCell" scope="col" style="width:21.5mm;font-weight:normal;">
										<span style="font-weight:bold;">(i) </span> <br />
										Pro Rata Share <br /> of Tested <br /> Interest <br /> Income
									</th>
									<th class="styDepTblCell" scope="col" style="width:21.5mm;font-weight:normal;">
										<span style="font-weight:bold;">(j) </span> <br />
										Pro Rata Share <br /> of Tested <br /> Interest <br /> Expense
									</th>
									<th class="styDepTblCell" scope="col" style="width:12.5mm;font-weight:normal;">
										<span style="font-weight:bold;">(k) </span> <br /> <span style="font-family:Arial;">
										GILTI <br /> Allocation <br /> Ratio <br /> (Divide <br /> Col. (e) by <br /> Col. (e), <br /> Line 1 <br /> Total)</span>
									</th>
									<th class="styDepTblCell" scope="col" style="width:21.5mm;font-weight:normal;">
										<span style="font-weight:bold;">(l) </span> <br />
										GILTI Allocated to Tested Income CFCs (Multiply Form 8992, Part II, Line 5, by Col. (k))
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/USShrCalcGILTIGrp">
									<tr style="border-color:black;font-size:6pt;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit" style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CFCName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="CFCName/BusinessNameLine2Txt"><br />
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CFCName/BusinessNameLine2Txt"/>
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
														<xsl:with-param name="TargetNode" select="EIN"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Schedule A, row <xsl:value-of select="position()"/> - Foreign Entity Reference IDs</xsl:with-param>
												<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="NetTestedIncomeAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateNegativeNumber">
												<xsl:with-param name="TargetNode" select="NetTestedLossAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ProRataShareCFCTestedIncmAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateNegativeNumber">
												<xsl:with-param name="TargetNode" select="ProRataShrNetTestedLossAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ProRataShareQBAIAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateNegativeNumber">
												<xsl:with-param name="TargetNode" select="ProRataShrTestedLossQBAIAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ProRataShrTestedIntIncomeAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ProRataShrTestedIntExpenseAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GILTIAllocationRt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GILTIAllocTestedIncmCFCAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:for-each select="$FormData/USShrCalcGILTIGrp">
						<xsl:if test="ForeignEntityIdentificationGrp">
							<br /><br />
							<span class="styRepeatingDataTitle">Schedule A, row <xsl:value-of select="position()"/> - Foreign Entity Reference IDs</span><br />
							<table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:100mm;">
								<tbody>
									<xsl:for-each select="ForeignEntityIdentificationGrp">
										<tr style="border-color:black;">
											<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
											<td class="styTableCell" style="text-align:left;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</xsl:if>
					</xsl:for-each>
					<br/>
				</form>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="FillTableCols">
		<xsl:param name="LineNumber"/>
		<xsl:param name="SepMessage" select="false()"/>
		<xsl:param name="MaxLine" select="10"/>
		<tr>
			<td class="styTableCellTextInherit">&nbsp;</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">(<span style="width:20mm;"/>)</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">(<span style="width:20mm;"/>)</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">(<span style="width:20mm;"/>)</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:choose>
			<xsl:when test="$SepMessage">
				<xsl:call-template name="FillTableCols">
					<xsl:with-param name="LineNumber" select="3"/>
					<xsl:with-param name="SepMessage" select="false()"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$LineNumber &lt; $MaxLine">
				<xsl:call-template name="FillTableCols">
				<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
