<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
  <!ENTITY mdash "&#8212;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl" />
	<xsl:include href="AddHeader.xsl" />
	<xsl:include href="CommonPathRef.xsl" />
	<xsl:include href="AddOnTable.xsl" />
	<xsl:include href="IRS965ScheduleEStyle.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS965ScheduleE" />
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
				<meta name="Description" content="IRS Form 965 Schedule E" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS965ScheduleEStyle" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form1040NR">
					<xsl:call-template name="DocumentHeaderLandscape" />
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDivLS">
						<div class="styFNBox" style="width:33mm;height:22.5mm;">
							<span class="styFN" style="font-size:9pt;">SCHEDULE E<br />
							(Form 965)</span> <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData" />
							</xsl:call-template>
							<br />
							
							<br />
							(January 2019)<br />
							<br />
							<span class="styAgency">
								Department of the Treasury
								<br />
								Internal Revenue Service
							</span>
						</div>
						<div class="styFTBox" style="width:190mm;height:22.5mm;">
							<span class="styFMT" style="font-size:12pt;padding-top:1mm;">U.S. Shareholder's Aggregate Foreign Cash Position &mdash; Detail</span>
							<br /><br />
							<span style="font-weight:bold;">
								&#9658;Attach to Form 965.
							</span><br />
							<span style="font-weight:bold;">
								&#9658;Go to
								<span style="font-style:italic">www.irs.gov/Form965</span>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:31mm;height:22.5mm;">
							<div class="styOMB" style="font-size:6pt;border:none;padding-top:8mm;">OMB No. XXXX-XXXX</div>
						</div>
					</div>
					<!-- Filer information section -->
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styNameBox" style="width:189mm;">
							Name of Taxpayer<br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template><br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:65mm;padding-left:0.5mm;font-weight:normal;">
							<strong>Taxpayer identification number</strong><br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<div class="styStdDivLS" style="border-bottom:1px solid black;padding-bottom:0.5mm;">
						Enter amounts in U.S. Dollars.
					</div>
					<!-- Table 1, cols (a)-(e) -->
					<div class="styStdDivLS" style="">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:8mm;font-weight:normal;"> </th>
									<th class="styTableCellHeader" scope="col" style="min-width:66mm;width:82mm;font-weight:normal;">
										Name of Specified Foreign Corporation
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(a)</span><br />
										EIN or Reference ID <br />
										Number of the <br />
										Foreign Corporation <br />
										(see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:45mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(b)(1)</span><br />
										Cash Position Other Than <br />
										Derivative Financial Instruments <br />
										and Hedging Transactions
									</th>
									<th class="styTableCellHeader" scope="col" style="width:45mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(b)(2)</span><br />
										Cash Position From <br />
										Derivative Financial Instruments <br />
										and Hedging Transactions
									</th>
									<th class="styTableCellHeader" scope="col" style="width:46mm;font-weight:normal;vertical-align:top;border-right-width:0px;">
										<span style="font-weight:bold;">(b)(3)</span><br />
										Cash Position at Close of the Last Taxable Year Prior to the Year Referenced in Column (c)(3) <br />
										(add columns (b)(1) and (b)(2))
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/USShrAggrgtFrgnCashPositionDtl">
									<tr style="height:7.5mm;vertical-align:top;">
										<td class="styTableCellCtrInherit" style="font-weight:bold;vertical-align:bottom;">
											<xsl:if test="position() &lt;= 15">
												<xsl:number value="position()"/>
											</xsl:if>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignCorporationName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="ForeignCorporationName/BusinessNameLine2Txt">
												<br />
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignCorporationName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:choose>
												<xsl:when test="ForeignEntityReferenceIdNum">
													<xsl:attribute name="style">word-break:break-all;</xsl:attribute>
													<xsl:attribute name="class">styTableCellTextInherit</xsl:attribute>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="EIN"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CashPosNotHedgeTransPYAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CashPosHedgeTransPYAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CashPositionAtClosePYAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:if test="count($FormData/USShrAggrgtFrgnCashPositionDtl) &lt; 15">
									<xsl:call-template name="FillTable1Rows">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/USShrAggrgtFrgnCashPositionDtl)"/>
									</xsl:call-template>
								</xsl:if>
								<tr style="height:8mm;vertical-align:bottom;">
									<td class="styTableCellCtrInherit" style="font-weight:bold;">16</td>
									<td class="styTableCellTextInherit" style="font-weight:bold;">
										Total (lines 1-15)
										<span class="sty965sEDotLn">.............</span>
									</td>
									<td class="styTableCellCtrInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotCashPosNotHedgeTransPYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotCashPosHedgeTransPYAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotCashPositionAtClosePYAmt"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="styStdDivLS pageEnd">
						<span style="font-weight:bold;">For Disclosure, Privacy Act, and Paperwork Reduction Act Notice, see separate instructions.</span>
						<span style="margin-left:25mm;">Cat. No. 71327C</span>
						<span style="float:right;font-weight:bold;">Schedule E (Form 965) (1-2019)</span>
					</div>
					<!-- Page 2 -->
					<div class="styStdDivLS" style="border-bottom:2px solid black;">
						Schedule E (Form 965) (1-2019)
						<div style="float:right;">Page <strong>2</strong></div>
					</div>
					<!-- Table 2, cols (f)-(k) -->
					<div class="styStdDivLS" style="">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:8mm;font-weight:normal;"> </th>
									<th class="styTableCellHeader" scope="col" style="min-width:40mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(c)(1)</span><br />
										Cash Position Other Than <br />
										Derivative Financial <br /> 
										Instruments and <br /> 
										Hedging Transactions
									</th>
									<th class="styTableCellHeader" scope="col" style="min-width:40mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(c)(2)</span><br />
										Cash Position From <br />
										Derivative Financial <br /> 
										Instruments and <br />
										Hedging Transactions
									</th>
									<th class="styTableCellHeader" scope="col" style="min-width:40mm;width:44mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(c)(3)</span><br />
										Cash Position at Close of the <br /> Last Taxable Year Which Ends <br /> Before November 2, 2017 <br />
										(add columns (c)(1) and (c)(2))
									</th>
									<th class="styTableCellHeader" scope="col" style="min-width:40mm;width:40mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(d)(1)</span><br />
										Cash Position Other Than <br />
										Derivative Financial <br /> 
										Instruments and <br />
										Hedging Transactions
									</th>
									<th class="styTableCellHeader" scope="col" style="min-width:40mm;width:40mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(d)(2)</span><br />
										Cash Position From <br />
										Derivative Financial <br /> 
										Instruments and <br />
										Hedging Transactions
									</th>
									<th class="styTableCellHeader" scope="col" style="min-width:40mm;width:44mm;font-weight:normal;vertical-align:top;border-right-width:0px;">
										<span style="font-weight:bold;">(d)(3)</span><br />
										Cash Position at Close of the <br /> Last Taxable Year Beginning <br /> Before January 1, 2018 <br />
										(add columns (d)(1) and (d)(2))
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/USShrAggrgtFrgnCashPositionDtl">
									<tr style="height:7.5mm;vertical-align:top;">
										<td class="styTableCellCtrInherit" style="font-weight:bold;vertical-align:bottom;">
											<xsl:if test="position() &lt;= 15">
												<xsl:number value="position()"/>
											</xsl:if>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CashPosNotHedgeTransBfrNovAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CashPosHedgeTransBfrNovAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CashPositionAtCloseBfrNovAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CashPosNotHedgeTransBfrJanAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CashPosHedgeTransBfrJanAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CashPositionAtCloseBfrJanAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:if test="count($FormData/USShrAggrgtFrgnCashPositionDtl) &lt; 15">
									<xsl:call-template name="FillTable2Rows">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/USShrAggrgtFrgnCashPositionDtl)"/>
									</xsl:call-template>
								</xsl:if>
								<tr style="height:8mm;vertical-align:bottom;">
									<td class="styTableCellCtrInherit" style="font-weight:bold;">16</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotCashPosNotHedgeTransNovAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotCashPosHedgeTransNovAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotCashPositionAtCloseNovAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotCashPosNotHedgeTransJanAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotCashPosHedgeTransJanAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotCashPositionAtCloseJanAmt"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:1px solid black;">
						<span style="float:right;font-weight:bold;">Schedule E (Form 965) (1-2019)</span>
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
					<table class="styLeftOverTblLandscape">
						<xsl:call-template name="PopulateCommonLeftoverLandscape">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<br/>
				</form>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="FillTable1Rows">
		<xsl:param name="LineNumber"/>
		<xsl:param name="MaxLine" select="15"/>
		<tr style="height:8mm;vertical-align:bottom;">
			<td class="styTableCellCtrInherit" style="font-weight:bold;"><xsl:number value="$LineNumber"/></td>
			<td class="styTableCellTextInherit">&nbsp;</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:if test="$LineNumber &lt; $MaxLine">
			<xsl:call-template name="FillTable1Rows">
				<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
				<xsl:with-param name="MaxLine" select="$MaxLine"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="FillTable2Rows">
		<xsl:param name="LineNumber"/>
		<xsl:param name="MaxLine" select="15"/>
		<tr style="height:8mm;vertical-align:bottom;">
			<td class="styTableCellCtrInherit" style="font-weight:bold;"><xsl:number value="$LineNumber"/></td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:if test="$LineNumber &lt; $MaxLine">
			<xsl:call-template name="FillTable2Rows">
				<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
				<xsl:with-param name="MaxLine" select="$MaxLine"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
