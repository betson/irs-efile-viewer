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
	<xsl:include href="IRS8038CPScheduleAStyle.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS8038CPScheduleA" />
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
				<meta name="Description" content="IRS Form 8038CP Schedule A" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<!--<xsl:if test="not($Print) or $Print=''">-->
						<xsl:call-template name="AddOnStyle" />
						<xsl:call-template name="IRS8038CPScheduleAStyle" />
					<!--</xsl:if>-->
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form8038CPScheduleA">
					<xsl:call-template name="DocumentHeader" />
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDiv">
						<div class="styFNBox" style="width:30mm;height:22.5mm;">
							<span class="styFN" style="font-size:12pt;font-family:Arial;">SCHEDULE A</span> <br /> 
							<span class="styFN" style="font-size:11pt;font-family:Arial;">(Form 8038-CP)</span> 
							<br />
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData" />
							</xsl:call-template>
							<br />
							(January 2022)
							<br />
							<span class="styAgency">
								Department of the Treasury
								<br />
								Internal Revenue Service
							</span>
						</div>
						<div class="styFTBox" style="width:127mm;height:22.5mm;">
							<span class="styFMT" style="font-size:12pt;padding-top:0.5mm;padding-bottom:2mm;">Specified Tax Credit Bonds Interest Limit Computation</span>
							<br />
							<span style="font-weight:bold;">
								&#9658;Complete for Form 8038-CP, Line 17c Bond Types 102, 103, 104 and 105.
							</span>
							<br />
							<span style="font-weight:bold;">
								&#9658;Attach to Form 8038-CP.
							</span><br />
							<span style="font-weight:bold;">
								&#9658;Go to
								<span style="font-style:italic">www.irs.gov/Form8038CP</span>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:30mm;height:22.5mm;">
							<div class="styOMB" style="padding-top:8mm;border:none;">OMB No. 1545-0047 </div>
						</div>
					</div>
					<!-- Filer information section -->
					<div class="styStdDiv" style="border-top:2px solid black;">
						<div class="styNameBox" style="width:135mm;min-height:7mm;">Issuer's Name
							<br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template> 
							<xsl:if test="$RtnHdrData/Filer//BusinessNameLine2Txt">
								<br />
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styEINBox" style="width:52mm;padding-left:0.5mm;font-weight:normal;">
							&nbsp;<strong>Employer identification number (EIN)</strong>
							<br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styNameBox" style="width:135mm;min-height:7mm;">Date of issue (MM/DD/YYYY)
							<br />
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/BondIssueDt"/>
							</xsl:call-template> 
						</div>
						<div class="styEINBox" style="width:52mm;padding-left:0.5mm;font-weight:normal;">
							&nbsp;Report number (from line 10 of Form 8038-CP)
							<br />
							<span style="border:1px solid black;width:16mm;text-align:center;margin-left:16mm;margin-top:1px;border-bottom-width:0px;font-size:7pt;padding:0.5mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/ReportNum"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<div class="styStdDiv" style="padding:1mm;">
						Complete the eligible interest computation using the table below. Complete the following table 
						for each maturity of bonds outstanding on the Line 18 interest payment date. 
						If more lines are needed, use the additional table on the back. This schedule is to be used when 
						claiming a credit under section 6431 for specified tax credit bonds (new clean renewable energy bonds, 
						qualified energy conservation bonds, qualified zone academy bonds 
						and qualified school construction bonds).
					</div>
					<xsl:variable name="shouldSeparate" select="($Print = $Separated) and (count($FormData/EligibleInterestComputationGrp) &gt; 25)"/>
					
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div style="float:right;width:5mm;height:4mm;text-align:right;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/EligibleInterestComputationGrp"/>
								<xsl:with-param name="containerID" select="'EligibleInterestComputationTbl'"/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerHeight" select="25"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 4 table -->
					<div class="styTableContainerNBB" id="EligibleInterestComputationTbl">
						<xsl:call-template name="SetInitialState" />
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr style="">
									<th class="styTableCellHeader" scope="col" style="min-width:20mm;width:35mm;font-weight:normal;padding-top:0.5mm;">
										<span style="font-weight:bold;">(a)</span><br /> Bond Maturity Date
									</th>
									<th class="styTableCellHeader" scope="col" style="width:38mm;font-weight:normal;padding-top:0.5mm;">
										<span style="font-weight:bold;">(b)</span><br /> Interest paid on bond maturity on Line 18 interest payment date
									</th>
									<th class="styTableCellHeader" scope="col" style="width:38mm;font-weight:normal;padding-top:0.5mm;">
										<span style="font-weight:bold;">(c)</span><br /> Interest paid on bond maturity on Line 18 interest payment date calculated using the Line 19b applicable credit rate
									</th>
									<th class="styTableCellHeader" scope="col" style="width:38mm;font-weight:normal;padding-top:0.5mm;">
										<span style="font-weight:bold;">(d)</span><br /> For new clean renewable energy bonds and qualfied energy conservation bonds, multiply column (c) by 70% (0.70) 
										<br />(Skip this column for qualified zone academy bonds and qualified school construction bonds)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:38mm;font-weight:normal;border-right-width:0px;padding-top:0.5mm;">
										<span style="font-weight:bold;">(e)</span><br /> For new clean renewable energy bonds and qualified energy conservation bonds, enter the smaller of column (b) or (d). 
										For qualified zone academy bonds and qualified school construction bonds, enter the smaller of column (b) or (c).
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparate)">
									<xsl:for-each select="$FormData/EligibleInterestComputationGrp">
										<tr style="vertical-align:top;">
											<td class="styTableCellCtrInherit" style="">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="BondMaturityDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="IntPdBondMaturityPymtDtAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="IntPdBondMaturityCalcPymtDtAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="IntPdBondMaturityCalc70PctAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="SmallerInterestPaidOrCalcAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparate or (count($FormData/EligibleInterestComputationGrp) &lt; 25)">
									<xsl:call-template name="FillTable5Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/EligibleInterestComputationGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparate"/>
										<xsl:with-param name="MaxLine" select="25"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:if test="not($shouldSeparate)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/EligibleInterestComputationGrp"/>
							<xsl:with-param name="containerID" select="'EligibleInterestComputationTbl'"/>
							<xsl:with-param name="headerHeight" select="1"/>
							<xsl:with-param name="containerHeight" select="25"/>
						</xsl:call-template>
					</xsl:if>
					<!-- Line 1 total -->
					<div class="styStdIBDiv" style="">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="width:132.85mm;">
							Total. Add amounts in column (e) above
							<span class="sty8038CPSchADotLn">....................</span>
						</div>
						<div class="styLNRightNumBox">1</div>
						<div class="styLNAmountBox" style="width:38mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalEligibleInterestCmptAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2 total -->
					<div class="styStdIBDiv" style="">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc" style="width:132.85mm;">
							Amount from page 2, line 4 (if any)
							<span class="sty8038CPSchADotLn">.....................</span>
						</div>
						<div class="styLNRightNumBox">2</div>
						<div class="styLNAmountBox" style="width:38mm;">&nbsp;</div>
					</div>
					<!-- Line 3 total -->
					<div class="styStdIBDiv" style="">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="width:132.85mm;">
							Add amounts on line 1 and line 2. Enter on Form 8038-CP, line 19c
							<span class="sty8038CPSchADotLn">...........</span>
						</div>
						<div class="styLNRightNumBoxNBB">3</div>
						<div class="styLNAmountBoxNBB" style="width:38mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalEligibleInterestCmptAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:1px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Paperwork Reduction Act Notice, see separate instructions.</span>
						<span style="margin-left:17mm;">Cat. No. 74912N</span>
						<span style="float:right;font-weight:bold;">Schedule A (Form 8038-CP) (1-2022)</span>
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
					<xsl:if test="$shouldSeparate">
						<br /><br />
						<span class="styRepeatingDataTitle">Specified Tax Credit Bonds Interest Limit Computation</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:187mm;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="min-width:20mm;width:35mm;font-weight:normal;padding-top:0.5mm;">
										<span style="font-weight:bold;">(a)</span><br /> Bond Maturity Date
									</th>
									<th class="styDepTblCell" scope="col" style="width:38mm;font-weight:normal;padding-top:0.5mm;">
										<span style="font-weight:bold;">(b)</span><br /> Interest paid on bond maturity on Line 18 interest payment date
									</th>
									<th class="styDepTblCell" scope="col" style="width:38mm;font-weight:normal;padding-top:0.5mm;">
										<span style="font-weight:bold;">(c)</span><br /> Interest paid on bond maturity on Line 18 interest payment date calculated using the Line 19b applicable credit rate
									</th>
									<th class="styDepTblCell" scope="col" style="width:38mm;font-weight:normal;padding-top:0.5mm;">
										<span style="font-weight:bold;">(d)</span><br /> For new clean renewable energy bonds and qualfied energy conservation bonds, multiply column (c) by 70% (0.70) 
										<br />(Skip this column for qualified zone academy bonds and qualified school construction bonds)
									</th>
									<th class="styDepTblCell" scope="col" style="width:38mm;font-weight:normal;border-right-width:0px;padding-top:0.5mm;">
										<span style="font-weight:bold;">(e)</span><br /> For new clean renewable energy bonds and qualified energy conservation bonds, enter the smaller of column (b) or (d). 
										For qualified zone academy bonds and qualified school construction bonds, enter the smaller of column (b) or (c).
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/EligibleInterestComputationGrp">
									<tr style="border-color:black;vertical-align:top;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellCtrInherit" style="">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="BondMaturityDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="IntPdBondMaturityPymtDtAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="IntPdBondMaturityCalcPymtDtAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="IntPdBondMaturityCalc70PctAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SmallerInterestPaidOrCalcAmt"/>
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
	<xsl:template name="FillTable5Cols">
		<xsl:param name="LineNumber"/>
		<xsl:param name="SepMessage" select="false()"/>
		<xsl:param name="MaxLine" select="25"/>
		<tr style="vertical-align:bottom;">
			<td class="styTableCellCtrInherit">
				<xsl:if test="$SepMessage">See additional data</xsl:if>
				&nbsp;
			</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:choose>
			<xsl:when test="$SepMessage">
				<xsl:call-template name="FillTable5Cols">
					<xsl:with-param name="LineNumber" select="2"/>
					<xsl:with-param name="SepMessage" select="false()"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$LineNumber &lt; $MaxLine">
				<xsl:call-template name="FillTable5Cols">
					<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
