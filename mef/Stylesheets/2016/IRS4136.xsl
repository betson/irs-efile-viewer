<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS4136Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="IRS4136Data" select="$RtnDoc/IRS4136"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($IRS4136Data)"/>
					</xsl:call-template>
				</title>
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<meta http-equiv="Cache-Control" content="private"/>
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 4136"/>
				<META name="GENERATOR" content="IBM WebSphere Studio"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS4136Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm;">
				<form name="IRS4136">
					<div class="styGenericDiv" style="width:187mm;">
						<xsl:call-template name="DocumentHeader"/>
					</div>
					<!--    BEGIN FORM HEADER   -->
					<div class="styBB" style="width:187mm;height:21mm;border-bottom-width:2px;">
						<div class="styFNBox" style="width:29mm;height:21mm;border-right-width:2px;">
							<span>Form <span style="width: 4px"/>
							</span>
							<span class="styFormNumber">4136</span>
							<br/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$IRS4136Data"/>
							</xsl:call-template>
							<span style="width:1mm"/>
							<div style="padding-top:2mm;width:29mm;">
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service (99)</span>
							</div>
						</div>
						<div class="styGenericDiv" style="width:128mm;height:21mm;text-align:center;font-weight:bold;">
							<div class="styMainTitle" style="font-size:16pt;padding-top:1mm;">Credit for Federal Tax Paid on Fuels</div>
							<div class="styFBT" style="height:4mm;padding-top:6mm;">
								<img src="{$ImagePath}/4136_Bullet.gif" alt="Bullet"/> 
								Information about Form 4136 and its separate instructions is at
								<a style="text-decoration:none;color:black;" href="http://www.irs.gov/form4136" title="Link to irs.gov Form 4136">
									<i>www.irs.gov/form4136</i>
								</a>.
							</div>
						</div>
						<div class="styTYBox" style="width:29mm;height: 21mm;border-left-width:2px;">
							<div class="styOMB">OMB No. 1545-0162</div>
							<div class="styTY">20<span class="styTYColor">16</span>
							</div>
							<div class="styTYBox" style="border:none;padding-left: 2mm; text-align: left;">Attachment<br/>Sequence No. <b>23</b>
							</div>
						</div>
					</div>
					<!--   END FORM HEADER -->
					<!--   BEGIN TAXPAYER INFO   -->
					<div style="width:187mm;">
						<div class="styNameBox" style="width:140mm;height:10mm;font-size:7pt;">
						Name (as shown on your income tax return)<br/>
							<span style="font-family: verdana, arial, sans-serif;font-size: 7pt; font-weight: normal;">
								<xsl:choose>
									<!-- Name from 1120/990/1065 Return Header -->
									<xsl:when test="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine2Txt"/>
										</xsl:call-template>
									</xsl:when>
									<!-- Name from 1040 Return Header -->
									<xsl:when test="$RtnHdrData/Filer/PrimaryNameControlTxt">
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
										</xsl:call-template>
									</xsl:when>
									<!-- Name from 1041 Return Header -->
									<xsl:when test="$RtnHdrData/Filer/EstateOrTrustName">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine2Txt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="$RtnHdrData/Filer/NationalMortgageAssocCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NationalMortgageAssocCd"/>
										</xsl:call-template>
									</xsl:when>
								</xsl:choose>
							</span>
						</div>
						<div class="styEINBox" style="width:47mm;padding-left: 2mm;font-size:7pt;font-weight:bold;">Taxpayer identification number
							<div style="padding-top:3mm;font-weight:normal;">
								<xsl:choose>
									<xsl:when test="$RtnHdrData/Filer/EIN">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">EIN</xsl:with-param>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</div>
					</div>
					<!--   END TAXPAYER INFO   -->
					<!-- Name and Identifying number END-->
					<div class="styIRS4136CautionHdr" style="padding-left:1.5mm;border-top-width:2px;">
						<span class="styIRS4136CautionHdrTitle" style="padding-left:2mm;padding-right:1mm;">Caution.</span>
						<span style="width:160mm;float:left;font-size:7.75pt;padding-right:1mm;padding-bottom:1mm;">
        Claimant has the name and address of the person who sold the fuel to the claimant and the dates of purchase. 
         For claims on lines 1c and 2b (type of use 13 or 14), 3d, 4c, and 5, claimant has not waived the right to 
         make the claim. For claims on lines 1c and 2b (type of use 13 or 14), claimant certifies that a certificate has 
         not been provided to the credit card issuer. 
						</span>
					</div>
					<!--   END NOTE HEADER   -->
					<!-- ============================================================================= -->
					<!--  LINE 1 -->
					<!-- ============================================================================= -->
					<div class="styIRS4136NumLine" style="padding-top:2mm;">
						1<span style="width:6mm"/>Nontaxable Use of Gasoline
						<span style="width:10mm"/> Note. 
						<span style="font-weight:normal"> CRN is credit reference number.</span>
					</div>
					<div class="styTableContainer" id="NGctn">
						<xsl:variable name="RowCount1a" select="count($IRS4136Data/OtherNontaxableUseOfGasoline)"/>
						<table class="styIRS4136Table" cellspacing="0">
							<xsl:call-template name="TableHeaderWithBraces"/>
							<tfoot/>
							<tbody>
								<!-- ============================================================================= -->
								<!--  Row 1a -->
								<!-- ============================================================================= -->
								<tr>
									<td class="styIRS4136LetterCell">a</td>
									<td class="styIRS4136TableCellLine">Off-highway business use</td>
									<td class="styIRS4136TableCellA" style="background-color:lightgrey;"/>
									<td class="styIRS4136TableCellB">$ .183</td>
									<td class="styIRS4136TableCellCwithBraces">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/OffHwyBusUseGasolineGalsQty"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136Braces" rowspan="3">
										<xsl:choose>
											<xsl:when test="$RowCount1a &lt;2">
												<xsl:attribute name="style">border-bottom-width: 1px</xsl:attribute>
											</xsl:when>
											<xsl:when test="$Print = $Separated">
												<xsl:attribute name="style">border-bottom-width: 1px</xsl:attribute>
											</xsl:when>
											<xsl:otherwise>
												<xsl:attribute name="style">border-bottom-width: 0px</xsl:attribute>
											</xsl:otherwise>
										</xsl:choose>
										<img src="{$ImagePath}/4136_Bracket_L6.gif" alt="bracket" height="42mm;"/>
									</td>
									<td class="styIRS4136TableCellD">
										<xsl:choose>
											<xsl:when test="$RowCount1a &lt;2">
												<xsl:attribute name="rowspan">3</xsl:attribute>
											</xsl:when>
											<xsl:when test="$Print = $Separated">
												<xsl:attribute name="rowspan">3</xsl:attribute>
											</xsl:when>
											<xsl:otherwise>
												<xsl:attribute name="rowspan"><xsl:value-of select="$RowCount1a + 2"/></xsl:attribute>
											</xsl:otherwise>
										</xsl:choose>
										<span style="float:left;">$</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/NontaxableUseOfGasolineCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellE" style="vertical-align:middle;">
										<xsl:choose>
											<xsl:when test="$RowCount1a &lt; 2">
												<xsl:attribute name="rowspan"><xsl:number value="3"/></xsl:attribute>
											</xsl:when>
											<xsl:when test="$Print = $Separated">
												<xsl:attribute name="rowspan">3</xsl:attribute>
											</xsl:when>
											<xsl:otherwise>
												<xsl:attribute name="rowspan"><xsl:value-of select="$RowCount1a + 2"/></xsl:attribute>
											</xsl:otherwise>
										</xsl:choose>362
									</td>
								</tr>
								<!-- ============================================================================= -->
								<!--  Row 1b -->
								<!-- ============================================================================= -->
								<tr>
									<td class="styIRS4136LetterCell">b</td>
									<td class="styIRS4136TableCellLine">Use on a farm for farming purposes</td>
									<td class="styIRS4136TableCellA" style="background-color:lightgrey;"/>
									<td class="styIRS4136TableCellB">.183</td>
									<td class="styIRS4136TableCellCwithBraces">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/FarmingPurposesGasolineGalsQty"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- ============================================================================= -->
								<!--  Row 1c -->
								<!-- ============================================================================= -->
								<xsl:if test="$RowCount1a = 0 or (($RowCount1a &gt;1) and ($Print = $Separated))">
									<tr>
										<td class="styIRS4136LetterCell">c</td>
										<td class="styIRS4136TableCellLine">Other nontaxable use (see <b>Caution</b> above line 1)</td>
										<td class="styIRS4136TableCellA"/>
										<td class="styIRS4136TableCellB">.183</td>
										<td class="styIRS4136TableCellCwithBraces">
											<xsl:if test="($RowCount1a &gt;1) and ($Print = $Separated)">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$IRS4136Data/AviationNontxUseGasGalsQty"/>
													<xsl:with-param name="ShortMessage" select=" 'true' "/>
												</xsl:call-template>
											</xsl:if>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="($RowCount1a &lt;=1)  or  ($Print != $Separated)">
									<xsl:for-each select="$IRS4136Data/OtherNontaxableUseOfGasoline">
										<tr>
											<xsl:if test="position()=1">
												<td class="styIRS4136LetterCell">
													<xsl:attribute name="rowspan"><xsl:value-of select="$RowCount1a"/></xsl:attribute>c
												</td>
												<td class="styIRS4136TableCellLine" style="vertical-align:top;">
													<xsl:attribute name="rowspan"><xsl:value-of select="$RowCount1a"/></xsl:attribute>
                Other nontaxable use (see <b>Caution </b>above line 1)   
              </td>
											</xsl:if>
											<td class="styIRS4136TableCellA">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
												</xsl:call-template>
											</td>
											<td class="styIRS4136TableCellB">.183</td>
											<td class="styIRS4136TableCellCwithBraces">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="GallonsQty"/>
												</xsl:call-template>
											</td>
											<xsl:if test="position()=$RowCount1a">
												<td class="styIRS4136Braces"/>
											</xsl:if>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- ============================================================================= -->
								<!--  Row 1d -->
								<!-- ============================================================================= -->
								<tr>
									<td class="styIRS4136LetterCell">d</td>
									<td class="styIRS4136TableCellLine" style="border-bottom:0;">Exported</td>
									<td class="styIRS4136TableCellA" style="border-bottom:0;background-color:lightgrey;"/>
									<td class="styIRS4136TableCellB" style="border-bottom:0;">.184</td>
									<td class="styIRS4136TableCellCwithBraces" style="border-bottom:0;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/ExportedNontxUseGasGalsQty"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136Braces" style="border-bottom:0;"/>
									<td class="styIRS4136TableCellD" style="border-bottom:0;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/ExportedNontxUseOfGasCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellE" style="border-bottom:0;">411</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- ============================================================================= -->
					<!--  LINE 2 -->
					<!-- ============================================================================= -->
					<div class="styIRS4136NumLine">2<span style="width:6mm"/>Nontaxable Use of Aviation Gasoline</div>
					<div class="styTableContainer" id="AGctn">
						<table class="styIRS4136Table" cellspacing="0">
							<xsl:call-template name="TableHeaderNoBraces"/>
							<tfoot/>
							<tbody>
								<!-- ============================================================================= -->
								<!--  Row 2a -->
								<!-- ============================================================================= -->
								<tr>
									<td class="styIRS4136LetterCell">a</td>
									<td class="styIRS4136TableCellLine">Use in commercial aviation (other than foreign trade)</td>
									<td class="styIRS4136TableCellA" style="background-color:lightgrey;"/>
									<td class="styIRS4136TableCellB">$ .15</td>
									<td class="styIRS4136TableCellC">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/AviationGasolineGallonsQty"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellD">
										<span style="float:left;">$</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/AviationGasolineCreditAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellE">354</td>
								</tr>
								<!-- ============================================================================= -->
								<!--  Row 2b -->
								<!-- ============================================================================= -->
								<xsl:variable name="RowCount2b" select="count($IRS4136Data/AviationNontxUseGasGalsQty)"/>
								<xsl:call-template name="PopulateSubRows">
									<xsl:with-param name="RowLetter" select="'b'"/>
									<xsl:with-param name="RowLabel" select="''"/>
									<xsl:with-param name="NonTXRowCount" select="$RowCount2b"/>
									<xsl:with-param name="BusNonTXRowCount" select="0"/>
									<xsl:with-param name="NonTXRowDataNode" select="$IRS4136Data/AviationNontxUseGasGalsQty"/>
									<xsl:with-param name="BusNonTXRowDataNode" select="''"/>
									<xsl:with-param name="ColBRate" select="'.193'"/>
									<xsl:with-param name="ColDAmt" select="$IRS4136Data/AviationNontxGasCrAmt"/>
									<xsl:with-param name="ColECrn" select="324"/>
								</xsl:call-template>
								<!-- ============================================================================= -->
								<!--  Row 2c -->
								<!-- ============================================================================= -->
								<tr>
									<td class="styIRS4136LetterCell">c</td>
									<td class="styIRS4136TableCellLine">Exported</td>
									<td class="styIRS4136TableCellA" style="background-color:lightgrey;"/>
									<td class="styIRS4136TableCellB">.194</td>
									<td class="styIRS4136TableCellC">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/ExpNontxAviationGasGalsQty"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellD">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/ExpNontxAviationGasCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellE">412</td>
								</tr>
								<!-- ============================================================================= -->
								<!--  Row 2d -->
								<!-- ============================================================================= -->
								<tr>
									<td class="styIRS4136LetterCell">d</td>
									<td class="styIRS4136TableCellLine" style="border-bottom:0;">LUST tax on aviation fuels used in foreign trade</td>
									<td class="styIRS4136TableCellA" style="border-bottom:0;background-color:lightgrey;"/>
									<td class="styIRS4136TableCellB" style="border-bottom:0;">.001</td>
									<td class="styIRS4136TableCellC" style="border-bottom:0;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/LUSTTxAvnFuelFrgnTradeGalsQty"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellD" style="border-bottom:0;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/LUSTTxAvnFuelFrgnTradeCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellE" style="border-bottom:0;">433</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- ============================================================================= -->
					<!--  LINE 3 -->
					<!-- ============================================================================= -->
					<div class="styIRS4136NumLine">3<span style="width:6mm"/>Nontaxable Use of Undyed Diesel Fuel</div>
					<div class="styIRS4136DescLine">Claimant certifies that the diesel fuel did not contain visible evidence of dye.<br/>
						<b>Exception.</b> If any of the diesel fuel included in this claim <b>did</b> contain visible evidence of dye, attach an explanation and check here
						<img src="{$ImagePath}/4136_Bullet.gif" alt="Bullet"/>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$IRS4136Data/UndyedDieselUseExceptionInd"/>
						</xsl:call-template>
						<div style="float:right;padding-right:.5mm;">
							<input alt="UndyedDieselUseExceptionInd" type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS4136Data/UndyedDieselUseExceptionInd"/>
									<xsl:with-param name="backupName">UndyedDieselUseException</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$IRS4136Data/UndyedDieselUseExceptionInd"/>
									<xsl:with-param name="BackupName">UndyedDieselUseException</xsl:with-param>
								</xsl:call-template>
							</label>
						</div>
					</div>
					<div style="width:187mm;float:left;clear:left;" id="UDctn">
						<table class="styIRS4136Table" cellspacing="0">
							<xsl:call-template name="TableHeaderWithBraces"/>
							<tfoot/>
							<tbody>
								<!-- ============================================================================= -->
								<!--  Row 3a -->
								<!-- ============================================================================= -->
								<xsl:variable name="RowCount3a" select="count($IRS4136Data/NontaxableUseOfUndyedDiesel)"/>
								<xsl:if test="$RowCount3a = 0 or (($RowCount3a &gt; 1) and ($Print = $Separated))">
									<tr>
										<td class="styIRS4136LetterCell">a</td>
										<td class="styIRS4136TableCellLine">Nontaxable use</td>
										<td class="styIRS4136TableCellA"/>
										<td class="styIRS4136TableCellB" style="padding-left:4mm;">$ .243</td>
										<td class="styIRS4136TableCellC">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$IRS4136Data/NontaxableUseOfUndyedDiesel"/>
												<xsl:with-param name="ShortMessage" select=" 'true' "/>
											</xsl:call-template>
										</td>
										<td class="styIRS4136Braces" rowspan="2">
											<img src="{$ImagePath}/4136_Bracket_L2L3L4.gif" alt="bracket"/>
										</td>
										<td class="styIRS4136TableCellD" style="border-bottom:0;"/>
										<td class="styIRS4136TableCellE" style="border-bottom:0;"/>
									</tr>
								</xsl:if>
								<xsl:if test="($Print != $Separated) or ($RowCount3a &lt;= 1) ">
									<xsl:for-each select="$IRS4136Data/NontaxableUseOfUndyedDiesel">
										<tr>
											<xsl:if test="position()=1">
												<td class="styIRS4136LetterCell">
													<xsl:attribute name="rowspan"><xsl:value-of select="$RowCount3a"/></xsl:attribute>a
												</td>
												<td class="styIRS4136TableCellLine" style="vertical-align:top;">
													<xsl:attribute name="rowspan"><xsl:value-of select="$RowCount3a"/></xsl:attribute>Nontaxable use
                                             </td>
											</xsl:if>
											<td class="styIRS4136TableCellA">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
												</xsl:call-template>
											</td>
											<td class="styIRS4136TableCellB">
												<xsl:if test="position()=1">$</xsl:if> .243</td>
											<td class="styIRS4136TableCellC">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="GallonsQty"/>
												</xsl:call-template>
											</td>
											<xsl:if test="position()=1">
												<td class="styIRS4136Braces" rowspan="2">
													<xsl:choose>
														<xsl:when test="$RowCount3a &lt;2">
															<xsl:attribute name="style">border-bottom-width: 1px</xsl:attribute>
														</xsl:when>
														<xsl:when test="$Print = $Separated">
															<xsl:attribute name="style">border-bottom-width: 1px</xsl:attribute>
														</xsl:when>
														<xsl:otherwise>
															<xsl:attribute name="style">border-bottom-width: 0px</xsl:attribute>
														</xsl:otherwise>
													</xsl:choose>
													<img src="{$ImagePath}/4136_Bracket_L2L3L4.gif" alt="bracket"/>
												</td>
											</xsl:if>
											<xsl:if test="position()=1">
												<td class="styIRS4136TableCellD" style="border-bottom:0;vertical-align:bottom;">
													<xsl:attribute name="rowspan"><xsl:value-of select="$RowCount3a"/></xsl:attribute>
												</td>
												<td class="styIRS4136TableCellE" style="border-bottom:0;vertical-align:bottom;"/>
											</xsl:if>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- ============================================================================= -->
								<!--  Row 3b -->
								<!-- ============================================================================= -->
								<tr>
									<td class="styIRS4136LetterCell">b</td>
									<td class="styIRS4136TableCellLine">Use on a farm for farming purposes</td>
									<td class="styIRS4136TableCellA" style="background-color:lightgrey;"/>
									<td class="styIRS4136TableCellB">.243</td>
									<td class="styIRS4136TableCellC">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/FarmPrpsUndyedDslFuelGalsQty"/>
										</xsl:call-template>
									</td>
									<xsl:if test="($RowCount3a &gt; 2) and ($Print != $Separated)">
										<td class="styIRS4136Braces"/>
									</xsl:if>
									<td class="styIRS4136TableCellD">
										<span style="float:left;">$</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/FarmPrpsUndyedDslFuelCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellE">360</td>
								</tr>
								<!-- ============================================================================= -->
								<!--  Row 3c -->
								<!-- ============================================================================= -->
								<tr>
									<td class="styIRS4136LetterCell">c</td>
									<td class="styIRS4136TableCellLine">Use in trains</td>
									<td class="styIRS4136TableCellA" style="background-color:lightgrey;"/>
									<td class="styIRS4136TableCellB">.243</td>
									<td class="styIRS4136TableCellCwithBraces">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/TrainUseOfUndyedDieselGalsQty"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136Braces"/>
									<td class="styIRS4136TableCellD">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/TrainUseOfUndyedDieselCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellE">353</td>
								</tr>
								<!-- ============================================================================= -->
								<!--  Row 3d -->
								<!-- ============================================================================= -->
								<tr>
									<td class="styIRS4136LetterCell">d</td>
									<td class="styIRS4136TableCellLine">Use in certain intercity and local buses (see <b>Caution</b>   above line 1)</td>
									<td class="styIRS4136TableCellA" style="background-color:lightgrey;"/>
									<td class="styIRS4136TableCellB">.17</td>
									<td class="styIRS4136TableCellCwithBraces" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BusUseOfUndyedDieselGalsQty"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136Braces"/>
									<td class="styIRS4136TableCellD" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BusUseOfUndyedDieselCreditAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellE" style="vertical-align:bottom;">350</td>
								</tr>
								<!-- ============================================================================= -->
								<!--  Row 3e -->
								<!-- ============================================================================= -->
								<tr>
									<td class="styIRS4136LetterCell" style="border-bottom:1px solid black;">e</td>
									<td class="styIRS4136TableCellLine">Exported</td>
									<td class="styIRS4136TableCellA" style="background-color:lightgrey;"/>
									<td class="styIRS4136TableCellB">.244</td>
									<td class="styIRS4136TableCellCwithBraces">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/ExpUndyedDieselFuelGalsQty"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136Braces"/>
									<td class="styIRS4136TableCellD">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/ExpUndyedDieselFuelCreditAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellE">413</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- ============================================================================= -->
					<!--  LINE 4 -->
					<!-- ============================================================================= -->
					<div class="styIRS4136NumLine">
						4<span style="width:6mm"/>Nontaxable Use of Undyed Kerosene (Other Than Kerosene Used in Aviation)
					</div>
					<div class="styIRS4136DescLine">Claimant certifies that the kerosene did not contain visible evidence of dye.<br/>
						<b>Exception.</b> If any of the kerosene included in this claim <b>did</b> contain visible evidence of dye, attach an explanation and check here
						<img src="{$ImagePath}/4136_Bullet.gif" alt="Bullet"/>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$IRS4136Data/UndyedKeroseneUseExceptionInd"/>
						</xsl:call-template>
						<div style="float:right;padding-right:.5mm;">
							<input alt="UndyedDieselUseExceptionInd" type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS4136Data/UndyedKeroseneUseExceptionInd"/>
									<xsl:with-param name="backupName">UndyedKeroseneUseException</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$IRS4136Data/UndyedKeroseneUseExceptionInd"/>
									<xsl:with-param name="BackupName">UndyedKeroseneUseException</xsl:with-param>
								</xsl:call-template>
							</label>
						</div>
					</div>
					<div style="width:187mm;float:left;clear:left;border-bottom:2px solid black;" id="UDctn">
						<table class="styIRS4136Table" cellspacing="0">
							<xsl:call-template name="TableHeaderWithBraces"/>
							<tfoot/>
							<tbody>
								<!-- ============================================================================= -->
								<!--  Row 4a -->
								<!-- ============================================================================= -->
								<xsl:variable name="RowCount4a" select="count($IRS4136Data/NontaxableUseOfUndyedKerosene)"/>
								<xsl:if test="$RowCount4a = 0 or (($RowCount4a &gt; 1) and ($Print = $Separated))">
									<tr>
										<td class="styIRS4136LetterCell">a</td>
										<td class="styIRS4136TableCellLine">Nontaxable use taxed at $.244</td>
										<td class="styIRS4136TableCellA"/>
										<td class="styIRS4136TableCellB">$ .243</td>
										<td class="styIRS4136TableCellC">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$IRS4136Data/NontaxableUseOfUndyedDiesel"/>
												<xsl:with-param name="ShortMessage" select=" 'true' "/>
											</xsl:call-template>
										</td>
										<td class="styIRS4136Braces" rowspan="2">
											<img src="{$ImagePath}/4136_Bracket_L2L3L4.gif" alt="bracket"/>
										</td>
										<td class="styIRS4136TableCellD" style="border-bottom:0;"/>
										<td class="styIRS4136TableCellE" style="border-bottom:0;"/>
									</tr>
								</xsl:if>
								<xsl:if test="($Print != $Separated) or ($RowCount4a&lt;= 1) ">
									<xsl:for-each select="$IRS4136Data/NontaxableUseOfUndyedKerosene">
										<tr>
											<xsl:if test="position()=1">
												<td class="styIRS4136LetterCell">
													<xsl:attribute name="rowspan"><xsl:value-of select="$RowCount4a"/></xsl:attribute>a
												</td>
												<td class="styIRS4136TableCellLine" style="vertical-align:top;">
													<xsl:attribute name="rowspan"><xsl:value-of select="$RowCount4a"/></xsl:attribute>
													Nontaxable use taxed at $.244
												</td>
											</xsl:if>
											<td class="styIRS4136TableCellA">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
												</xsl:call-template>
											</td>
											<td class="styIRS4136TableCellB">
												<xsl:if test="position()=1">$ </xsl:if>.243</td>
											<td class="styIRS4136TableCellC">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="GallonsQty"/>
												</xsl:call-template>
											</td>
											<xsl:if test="position()=1">
												<td class="styIRS4136Braces" rowspan="2">
													<xsl:choose>
														<xsl:when test="$RowCount4a &lt;2">
															<xsl:attribute name="style">border-bottom-width: 1px</xsl:attribute>
														</xsl:when>
														<xsl:when test="$Print = $Separated">
															<xsl:attribute name="style">border-bottom-width: 1px</xsl:attribute>
														</xsl:when>
														<xsl:otherwise>
															<xsl:attribute name="style">border-bottom-width: 0px</xsl:attribute>
														</xsl:otherwise>
													</xsl:choose>
													<img src="{$ImagePath}/4136_Bracket_L2L3L4.gif" alt="bracket"/>
												</td>
											</xsl:if>
											<xsl:if test="position()=1">
												<td class="styIRS4136TableCellD" style="border-bottom:0;">
													<xsl:attribute name="rowspan"><xsl:value-of select="$RowCount4a"/></xsl:attribute>
												</td>
												<td class="styIRS4136TableCellE" style="border-bottom:0;"/>
											</xsl:if>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- ============================================================================= -->
								<!--  Row 4b -->
								<!-- ============================================================================= -->
								<tr>
									<td class="styIRS4136LetterCell">b</td>
									<td class="styIRS4136TableCellLine">Use on a farm for farming purposes</td>
									<td class="styIRS4136TableCellA" style="background-color:lightgrey;"/>
									<td class="styIRS4136TableCellB">.243</td>
									<td class="styIRS4136TableCellC">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/FarmPrpsUndyedKeroseneGalsQty"/>
										</xsl:call-template>
									</td>
									<xsl:if test="($RowCount4a &gt; 2) and ($Print != $Separated)">
										<td class="styIRS4136Braces"/>
									</xsl:if>
									<td class="styIRS4136TableCellD">
										<span style="float:left;">$</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/FarmPrpsUndyedKeroseneCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellE">346</td>
								</tr>
								<!-- ============================================================================= -->
								<!--  Row 4c -->
								<!-- ============================================================================= -->
								<tr>
									<td class="styIRS4136LetterCell">c</td>
									<td class="styIRS4136TableCellLine">Use in certain intercity and local buses (see <b>Caution </b> above line 1)</td>
									<td class="styIRS4136TableCellA" style="background-color:lightgrey;"/>
									<td class="styIRS4136TableCellB">.17</td>
									<td class="styIRS4136TableCellCwithBraces" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BusUseOfUndyedKeroseneGalsQty"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136Braces"/>
									<td class="styIRS4136TableCellD" style="vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BusUseOfUndyedKeroseneCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellE" style="vertical-align:bottom;">347</td>
								</tr>
								<!-- ============================================================================= -->
								<!--  Row 4d -->
								<!-- ============================================================================= -->
								<tr>
									<td class="styIRS4136LetterCell">d</td>
									<td class="styIRS4136TableCellLine">Exported</td>
									<td class="styIRS4136TableCellA" style="background-color:lightgrey;"/>
									<td class="styIRS4136TableCellB">.244</td>
									<td class="styIRS4136TableCellCwithBraces">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/ExportedUndyedKeroseneGalsQty"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136Braces"/>
									<td class="styIRS4136TableCellD">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/ExportedUndyedKeroseneCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellE">414</td>
								</tr>
								<!-- ============================================================================= -->
								<!--  Row 4e -->
								<!-- ============================================================================= -->
								<xsl:variable name="RowCount4e" select="count($IRS4136Data/NontxUseUndyedKrsnTxdAt044)"/>
								<xsl:if test="$RowCount4e = 0 or (($RowCount4e &gt; 1) and ($Print = $Separated))">
									<tr>
										<td class="styIRS4136LetterCell">e</td>
										<td class="styIRS4136TableCellLine">Nontaxable use taxed at $.044</td>
										<td class="styIRS4136TableCellA"/>
										<td class="styIRS4136TableCellB">.043</td>
										<td class="styIRS4136TableCellCwithBraces">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxUseUndyedKrsnTxdAt044"/>
												<xsl:with-param name="ShortMessage" select=" 'true' "/>
											</xsl:call-template>
										</td>
										<td class="styIRS4136Braces"/>
										<td class="styIRS4136TableCellD">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxUseUndyedKrsnTxd044CrAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS4136TableCellE">377</td>
									</tr>
								</xsl:if>
								<xsl:if test="($Print != $Separated) or ($RowCount4e &lt;= 1) ">
									<xsl:for-each select="$IRS4136Data/NontxUseUndyedKrsnTxdAt044">
										<tr>
											<xsl:if test="position()=1">
												<td class="styIRS4136LetterCell">
													<xsl:attribute name="rowspan"><xsl:value-of select="$RowCount4e"/></xsl:attribute>e
												</td>
												<td class="styIRS4136TableCellLine" style="vertical-align:top;">
													<xsl:attribute name="rowspan"><xsl:value-of select="$RowCount4e"/></xsl:attribute>
													Nontaxable use taxed at $.044
												</td>
											</xsl:if>
											<td class="styIRS4136TableCellA">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
												</xsl:call-template>
											</td>
											<td class="styIRS4136TableCellB">.043</td>
											<td class="styIRS4136TableCellCwithBraces">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="GallonsQty"/>
												</xsl:call-template>
											</td>
											<td class="styIRS4136Braces"/>
											<xsl:if test="position()=1">
												<td class="styIRS4136TableCellD">
													<xsl:attribute name="rowspan"><xsl:value-of select="$RowCount4e"/></xsl:attribute>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxUseUndyedKrsnTxd044CrAmt"/>
													</xsl:call-template>
												</td>
												<td class="styIRS4136TableCellE">
													<xsl:attribute name="rowspan"><xsl:value-of select="$RowCount4e"/></xsl:attribute>377
												</td>
											</xsl:if>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- ============================================================================= -->
								<!--  Row 4f -->
								<!-- ============================================================================= -->
								<xsl:variable name="RowCount4f" select="count($IRS4136Data/NontxUseUndyedKrsnTxd219)"/>
								<xsl:if test="$RowCount4f = 0 or (($RowCount4f&gt; 1) and ($Print = $Separated))">
									<tr>
										<td class="styIRS4136LetterCell">f</td>
										<td class="styIRS4136TableCellLine" style="border-bottom:0;">Nontaxable use taxed at $.219</td>
										<td class="styIRS4136TableCellA" style="border-bottom:0;"/>
										<td class="styIRS4136TableCellB" style="border-bottom:0;">.218</td>
										<td class="styIRS4136TableCellCwithBraces" style="border-bottom:0;">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxUseUndyedKrsnTxd219"/>
												<xsl:with-param name="ShortMessage" select=" 'true' "/>
											</xsl:call-template>
										</td>
										<td class="styIRS4136Braces" style="border-bottom:0;"/>
										<td class="styIRS4136TableCellD" style="border-bottom:0;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxUseUndyedKrsnTxd219CrAmt"/>
											</xsl:call-template>
										</td>
										<td class="styIRS4136TableCellE" style="border-bottom:0;">369</td>
									</tr>
								</xsl:if>
								<xsl:if test="($Print != $Separated) or ($RowCount4f &lt;= 1) ">
									<xsl:for-each select="$IRS4136Data/NontxUseUndyedKrsnTxd219">
										<tr>
											<xsl:if test="position()=1">
												<td class="styIRS4136LetterCell">
													<xsl:attribute name="rowspan"><xsl:value-of select="$RowCount4f"/></xsl:attribute>f
												</td>
												<td class="styIRS4136TableCellLine" style="vertical-align:top;border-bottom:0;">
													<xsl:attribute name="rowspan"><xsl:value-of select="$RowCount4f"/></xsl:attribute>
													Nontaxable use taxed at $.219
												</td>
											</xsl:if>
											<td class="styIRS4136TableCellA">
												<xsl:if test="position()=last()">
													<xsl:attribute name="style">border-bottom:0;</xsl:attribute>
												</xsl:if>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
												</xsl:call-template>
											</td>
											<td class="styIRS4136TableCellB">
												<xsl:if test="position()=last()">
													<xsl:attribute name="style">border-bottom:0;</xsl:attribute>
												</xsl:if>.218
											 </td>
											<td class="styIRS4136TableCellCwithBraces">
												<xsl:if test="position()=last()">
													<xsl:attribute name="style">border-bottom:0;text-align:center;</xsl:attribute>
												</xsl:if>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="GallonsQty"/>
												</xsl:call-template>
											</td>
											<td class="styIRS4136Braces">
												<xsl:if test="position()=last()">
													<xsl:attribute name="style">border-bottom:0;</xsl:attribute>
												</xsl:if>
											</td>
											<xsl:if test="position()=1">
												<td class="styIRS4136TableCellD" style="border-bottom:0;">
													<xsl:attribute name="rowspan"><xsl:value-of select="$RowCount4f"/></xsl:attribute>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$IRS4136Data/NontxUseUndyedKrsnTxd219CrAmt"/>
													</xsl:call-template>
												</td>
												<td class="styIRS4136TableCellE" style="border-bottom:0;">
													<xsl:attribute name="rowspan"><xsl:value-of select="$RowCount4f"/></xsl:attribute>369
												</td>
											</xsl:if>
										</tr>
									</xsl:for-each>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- ============================================================================= -->
					<!--  PAGE 1 FOOTER -->
					<!-- ============================================================================= -->
					<div style="width:187mm;">
						<div style="float: left; clear: none;">
							<span class="styBoldText">For Paperwork Reduction Act Notice, see the separate instructions.</span>
						</div>
						<div style="float:right">Cat. No. 12625R
							<span style="width:70px"/>Form <span class="styBoldText" style="font-size: 8pt">4136</span> (2016)
						</div>
					</div>
					<!-- ============================================================================= -->
					<!--  PAGE 2 HEADER -->
					<!-- ============================================================================= -->
					<p style="page-break-before: always">
						<div class="styBB" style="width:187mm;border-bottom:2px solid black;">
							<div style="float: left; clear: none">Form 4136 (2016)</div>
							<div style="float:right"> Page <span class="styBoldText" style="font-size: 8pt">2</span>
							</div>
						</div>
					</p>
					<!-- ============================================================================= -->
					<!--  LINE 5 -->
					<!-- ============================================================================= -->
					<div class="styIRS4136NumLine" style="padding-top:2mm;">
						5<span style="width:6mm"/>Kerosene Used in Aviation 
						<span style="font-weight:normal">(see </span> Caution <span style="font-weight:normal"> above line 1)</span>
					</div>
					<div style="width:187mm;float:left;clear:left;" class="styBB" id="UVctn">
						<table class="styIRS4136Table" cellspacing="0">
							<xsl:call-template name="TableHeaderNoBraces"/>
							<tfoot/>
							<tbody>
								<!-- ============================================================================= -->
								<!--  Row 5a -->
								<!-- ============================================================================= -->
								<tr>
									<td class="styIRS4136LetterCell">a</td>
									<td class="styIRS4136TableCellLine">Kerosene used in commercial aviation (other than foreign trade) taxed at $.244</td>
									<td class="styIRS4136TableCellA" style="background-color:lightgrey;"/>
									<td class="styIRS4136TableCellB">$ .200</td>
									<td class="styIRS4136TableCellC">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/KeroseneUsedInAvnTxd244GalsQty"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellD">
										<span style="float:left;">$</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/KeroseneUsedInAvnTxd244CrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellE">417</td>
								</tr>
								<!-- ============================================================================= -->
								<!--  Row 5b -->
								<!-- ============================================================================= -->
								<tr>
									<td class="styIRS4136LetterCell">b</td>
									<td class="styIRS4136TableCellLine">
										Kerosene used in commercial aviation (other than foreign trade) taxed at $.219
									</td>
									<td class="styIRS4136TableCellA" style="background-color:lightgrey;"/>
									<td class="styIRS4136TableCellB">.175</td>
									<td class="styIRS4136TableCellC">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/KeroseneUsedInAvnTxd219GalsQty"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellD">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/KeroseneUsedInAvnTxd219CrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellE">355</td>
								</tr>
								<!-- ============================================================================= -->
								<!--  Row 5c -->
								<!-- ============================================================================= -->
								<xsl:variable name="RowCount5c" select="count($IRS4136Data/NonTxKrsnUsedInAvnTxd244)"/>
								<xsl:call-template name="PopulateSubRows">
									<xsl:with-param name="RowLetter" select="'c'"/>
									<xsl:with-param name="RowLabel" select="'Nontaxable use (other than use by state or local government) taxed at $.244'"/>
									<xsl:with-param name="NonTXRowCount" select="$RowCount5c"/>
									<xsl:with-param name="BusNonTXRowCount" select="0"/>
									<xsl:with-param name="NonTXRowDataNode" select="$IRS4136Data/NonTxKrsnUsedInAvnTxd244"/>
									<xsl:with-param name="BusNonTXRowDataNode" select="''"/>
									<xsl:with-param name="ColBRate" select="'.243'"/>
									<xsl:with-param name="ColDAmt" select="$IRS4136Data/NonTxKrsnUsedInAvnTxd244CrAmt"/>
									<xsl:with-param name="ColECrn" select="346"/>
								</xsl:call-template>
								<!-- ============================================================================= -->
								<!--  Row 5d -->
								<!-- ============================================================================= -->
								<xsl:call-template name="PopulateSubRows">
									<xsl:with-param name="RowLetter" select="'d'"/>
									<xsl:with-param name="RowLabel" select="'Nontaxable use (other than use by state or local government) taxed at $.219'"/>
									<xsl:with-param name="NonTXRowCount" select="count($IRS4136Data/NonTxKrsnUsedInAvnTxd219)"/>
									<xsl:with-param name="BusNonTXRowCount" select="0"/>
									<xsl:with-param name="NonTXRowDataNode" select="$IRS4136Data/NonTxKrsnUsedInAvnTxd219"/>
									<xsl:with-param name="BusNonTXRowDataNode" select="''"/>
									<xsl:with-param name="ColBRate" select="'.218'"/>
									<xsl:with-param name="ColDAmt" select="$IRS4136Data/NonTxKrsnUsedInAvnTxd219CrAmt"/>
									<xsl:with-param name="ColECrn" select="369"/>
								</xsl:call-template>
								<!-- ============================================================================= -->
								<!--  Row 5e -->
								<!-- ============================================================================= -->
								<tr>
									<td class="styIRS4136LetterCell">e</td>
									<td class="styIRS4136TableCellLine" style="border-bottom:0;">LUST tax on aviation fuels used in foreign trade</td>
									<td class="styIRS4136TableCellA" style="border-bottom:0;background-color:lightgrey;"/>
									<td class="styIRS4136TableCellB" style="border-bottom:0;">.001</td>
									<td class="styIRS4136TableCellC" style="border-bottom:0;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/LUSTTxKrsnAvnFrgnTrdGalsQty"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellD" style="border-bottom:0;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/LUSTTxKrsnAvnFrgnTrdCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellE" style="border-bottom:0;">433</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="styIRS4136NumLine" style="height:20mm;border-bottom:0;"/>
					<!-- ============================================================================= -->
					<!--  LINE 6 -->
					<!-- ============================================================================= -->
					<div class="styIRS4136NumLine">
						6<span style="width:6mm"/>Sales by Registered Ultimate Vendors of Undyed Diesel Fuel
<span style="float:right;width:70mm;">
						 Registration No.
  <img src="{$ImagePath}/4136_Bullet.gif" alt="Bullet"/>
							<span style="width:4px;"/>
							<span style="font-weight:normal">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$IRS4136Data/UndyedDieselRegistrationNum"/>
								</xsl:call-template>
							</span>
						</span>
					</div>
					<div class="styIRS4136DescLine" style="border-bottom:0;">Claimant certifies that it sold the diesel fuel at a tax-excluded price, repaid the amount of tax
					 to the buyer, or has obtained the written consent of the buyer to make the claim. Claimant certifies that the diesel fuel did not
					 contain visible evidence of dye. <br/>
						<b>Exception.</b> If any of the diesel fuel included in this claim <b> did </b> contain visible evidence of dye, attach an explanation
					  and check here <img src="{$ImagePath}/4136_Bullet.gif" alt="Bullet"/>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$IRS4136Data/SalesUndyedDieselExceptionInd"/>
						</xsl:call-template>
						<span style="float:right;padding-right:1mm;">
							<input alt="UndyedDieselUseExceptionInd" type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS4136Data/SalesUndyedDieselExceptionInd"/>
									<xsl:with-param name="backupName">UndyedDieselSalesException</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$IRS4136Data/SalesUndyedDieselExceptionInd"/>
									<xsl:with-param name="BackupName">UndyedDieselSalesException</xsl:with-param>
								</xsl:call-template>
							</label>
						</span>
					</div>
					<div style="border-top:1px solid black;width:187mm;float:left;clear:left;" id="UVctn">
						<table class="styIRS4136Table" cellspacing="0">
							<xsl:call-template name="NoColATableHeaderNoBraces"/>
							<tfoot/>
							<tbody>
								<!-- ============================================================================= -->
								<!--  Row 6a -->
								<!-- ============================================================================= -->
								<tr>
									<td class="styIRS4136LetterCell">a</td>
									<td class="styIRS4136TableCellLine" style="width:98mm;">Use by a state or local government</td>
									<td class="styIRS4136TableCellB">$ .243</td>
									<td class="styIRS4136TableCellC">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/SlsUndyedDslStLclGovtGalsQty"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellD">
										<span style="float:left;">$</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/SlsUndyedDslUseStLclGovtCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellE">360</td>
								</tr>
								<!-- ============================================================================= -->
								<!--  Row 6b -->
								<!-- ============================================================================= -->
								<tr>
									<td class="styIRS4136LetterCell" style="border-bottom-width:1px;">b</td>
									<td class="styIRS4136TableCellLine" style="width:98mm;">Use in certain intercity and local buses</td>
									<td class="styIRS4136TableCellB"> .17</td>
									<td class="styIRS4136TableCellC">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/SlsUndyedDieselUseBusGalsQty"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellD">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/SlsUndyedDieselUseBusCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellE">350</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="styIRS4136NumLine" style="height:20mm;border-bottom:0;"/>
					<!-- ============================================================================= -->
					<!--  LINE 7 -->
					<!-- ============================================================================= -->
					<div class="styIRS4136NumLine">
						7<span style="width:6mm"/>Sales by Registered Ultimate Vendors of Undyed Kerosene (Other <br/>
						<span style="width:8mm"/>Than Kerosene For Use in Aviation) <span style="float:right;width:70mm;">
						 Registration No. <img src="{$ImagePath}/4136_Bullet.gif" alt="Bullet"/>
							<span style="width:4px;"/>
							<span style="font-weight:normal">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$IRS4136Data/UndyedKeroseneRegistrationNum"/>
								</xsl:call-template>
							</span>
						</span>
					</div>
					<div class="styIRS4136DescLine">Claimant certifies that it sold the kerosene at a tax-excluded price,
					 repaid the amount of tax to the buyer, or has obtained the written consent of the buyer to make the claim. Claimant certifies that
					 the kerosene did not contain visible evidence of dye. <br/>
						<b>Exception.</b> If any of the kerosene included in this claim <b> did </b> contain visible evidence of dye, attach an explanation
					  and check here <img src="{$ImagePath}/4136_Bullet.gif" alt="Bullet"/>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$IRS4136Data/SlsUndyedKeroseneExceptionInd"/>
						</xsl:call-template>
						<span style="float:right;padding-right:1mm;">
							<input alt="SlsUndyedKeroseneExceptionInd" type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS4136Data/SlsUndyedKeroseneExceptionInd"/>
									<xsl:with-param name="backupName">SlsUndyedKeroseneExceptionInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$IRS4136Data/SlsUndyedKeroseneExceptionInd"/>
									<xsl:with-param name="BackupName">SlsUndyedKeroseneExceptionInd</xsl:with-param>
								</xsl:call-template>
							</label>
						</span>
					</div>
					<div style="width:187mm;float:left;clear:left;" id="UVctn">
						<table class="styIRS4136Table" style="width:187mm;" cellspacing="0">
							<xsl:call-template name="NoColATableHeaderWithBraces"/>
							<tfoot/>
							<tbody>
								<!-- ============================================================================= -->
								<!--  Row 7a -->
								<!-- ============================================================================= -->
								<tr>
									<td class="styIRS4136LetterCell">a</td>
									<td class="styIRS4136TableCellLine" style="width:98mm;">Use by a state or local government</td>
									<td class="styIRS4136TableCellB">$ .243</td>
									<td class="styIRS4136TableCellCwithBraces">
										<span style="float:left;">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$IRS4136Data/SlsUndyedKrsnStLclGovtGalsQty"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/SlsUndyedKrsnStLclGovtGalsQty"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136Braces" rowspan="2">
										<img src="{$ImagePath}/4136_Bracket_L2L3L4.gif" alt="bracket"/>
									</td>
									<td class="styIRS4136TableCellD" rowspan="2">
										<span style="float:left;">$</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/SlsUndyedKrsnBlockPumpCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellE" rowspan="2">346</td>
								</tr>
								<!-- ============================================================================= -->
								<!--  Row 7b -->
								<!-- ============================================================================= -->
								<tr>
									<td class="styIRS4136LetterCell">b</td>
									<td class="styIRS4136TableCellLine" style="width:98mm;">Sales from a blocked pump</td>
									<td class="styIRS4136TableCellB">.243</td>
									<td class="styIRS4136TableCellCwithBraces" style="padding-left:4mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/SlsUndyedKrsnBlockPumpGalsQty"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- ============================================================================= -->
								<!--  Row 7c -->
								<!-- ============================================================================= -->
								<tr>
									<td class="styIRS4136LetterCell" style="border-bottom:1px solid black;">c</td>
									<td class="styIRS4136TableCellLine" style="width:98mm;">Use in certain intercity and local buses</td>
									<td class="styIRS4136TableCellB">.17</td>
									<td class="styIRS4136TableCellCwithBraces" style="padding-left:4mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/SlsUndyedKrsnUseBusGalsQty"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136Braces"/>
									<td class="styIRS4136TableCellD">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/SlsUndyedKrsnUseBusCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellE">347</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="styIRS4136NumLine" style="height:20mm;border-bottom:0;"/>
					<!-- ============================================================================= -->
					<!--  LINE 8 -->
					<!-- ============================================================================= -->
					<div class="styIRS4136NumLine">
						8<span style="width:6mm"/>
						<span style="font-size:7.5pt;">Sales by Registered Ultimate Vendors of Kerosene For Use in Aviation</span>
						<span style="float:right;width:70mm;">Registration No.<img src="{$ImagePath}/4136_Bullet.gif" alt="Bullet"/>
							<span style="width:4px;"/>
							<span style="font-weight:normal">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$IRS4136Data/KeroseneForAvnRegistrationNum"/>
								</xsl:call-template>
							</span>
						</span>
					</div>
					<div class="styIRS4136DescLine">
					Claimant sold the kerosene for use in aviation at a tax-excluded price and has not collected the amount of tax from the buyer,
					repaid the amount of tax to the buyer, or has obtained the written consent of the buyer to make the claim. See the instructions
					for additional information to be submitted.
					</div>
					<div class="styBB" style="width:187mm;float:left;clear:left;" id="8bFctn">
						<table class="styIRS4136Table" cellspacing="0">
							<xsl:call-template name="TableHeaderNoBraces"/>
							<tfoot/>
							<tbody>
								<!-- ============================================================================= -->
								<!--  Row 8a -->
								<!-- ============================================================================= -->
								<tr>
									<td class="styIRS4136LetterCell">a</td>
									<td class="styIRS4136TableCellLine">Use in commercial aviation (other than foreign trade) taxed at $.219</td>
									<td class="styIRS4136TableCellA" style="background-color:lightgrey;"/>
									<td class="styIRS4136TableCellB">$ .175</td>
									<td class="styIRS4136TableCellC">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/SlsKrsnUsedInAvnTxd219GalsQty"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellD">
										<span style="float:left;">$</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/SlsKrsnUsedInAvnTxd219CrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellE">355</td>
								</tr>
								<!-- ============================================================================= -->
								<!--  Row 8b -->
								<!-- ============================================================================= -->
								<tr>
									<td class="styIRS4136LetterCell">b</td>
									<td class="styIRS4136TableCellLine">Use in commercial aviation (other than foreign trade) taxed at $.244</td>
									<td class="styIRS4136TableCellA" style="background-color:lightgrey;"/>
									<td class="styIRS4136TableCellB">.200</td>
									<td class="styIRS4136TableCellC">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/SlsKrsnUsedInAvnTxd244GalsQty"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellD">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/SlsKrsnUsedInAvnTxd244CrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellE">417</td>
								</tr>
								<!-- ============================================================================= -->
								<!--  Row 8c -->
								<!-- ============================================================================= -->
								<tr>
									<td class="styIRS4136LetterCell">c</td>
									<td class="styIRS4136TableCellLine">Nonexempt use in noncommercial aviation</td>
									<td class="styIRS4136TableCellA" style="background-color:lightgrey;"/>
									<td class="styIRS4136TableCellB">.025</td>
									<td class="styIRS4136TableCellC">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/SlsKrsnNnxmptUseInAvnGalsQty"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellD">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/SlsKrsnNnxmptUseInAvnCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellE">418</td>
								</tr>
								<!-- ============================================================================= -->
								<!--  Row 8d -->
								<!-- ============================================================================= -->
								<xsl:variable name="RowCount8d" select="count($IRS4136Data/OtherNontaxableUseTaxedAt244)"/>
								<xsl:call-template name="PopulateSubRows">
									<xsl:with-param name="RowLetter" select="'d'"/>
									<xsl:with-param name="RowLabel" select="'Other nontaxable uses taxed at $.244'"/>
									<xsl:with-param name="NonTXRowCount" select="$RowCount8d"/>
									<xsl:with-param name="BusNonTXRowCount" select="0"/>
									<xsl:with-param name="NonTXRowDataNode" select="$IRS4136Data/OtherNontaxableUseTaxedAt244"/>
									<xsl:with-param name="BusNonTXRowDataNode" select="''"/>
									<xsl:with-param name="ColBRate" select="'.243'"/>
									<xsl:with-param name="ColDAmt" select="$IRS4136Data/SlsKrsnOthNontxTxd244CrAmt"/>
									<xsl:with-param name="ColECrn" select="346"/>
								</xsl:call-template>
								<!-- ============================================================================= -->
								<!--  Row 8e -->
								<!-- ============================================================================= -->
								<xsl:variable name="RowCount8e" select="count($IRS4136Data/OtherNontaxableUseTaxedAt219)"/>
								<xsl:call-template name="PopulateSubRows">
									<xsl:with-param name="RowLetter" select="'e'"/>
									<xsl:with-param name="RowLabel" select="'Other nontaxable uses taxed at $.219'"/>
									<xsl:with-param name="NonTXRowCount" select="count($IRS4136Data/OtherNontaxableUseTaxedAt219)"/>
									<xsl:with-param name="BusNonTXRowCount" select="0"/>
									<xsl:with-param name="NonTXRowDataNode" select="$IRS4136Data/OtherNontaxableUseTaxedAt219"/>
									<xsl:with-param name="BusNonTXRowDataNode" select="''"/>
									<xsl:with-param name="ColBRate" select="'.218'"/>
									<xsl:with-param name="ColDAmt" select="$IRS4136Data/SlsKrsnOthNontxTxd219CrAmt"/>
									<xsl:with-param name="ColECrn" select="369"/>
								</xsl:call-template>
								<!-- ============================================================================= -->
								<!--  Row 8f -->
								<!-- ============================================================================= -->
								<tr>
									<td class="styIRS4136LetterCell">f</td>
									<td class="styIRS4136TableCellLine" style="border-bottom:0;">
										LUST tax on aviation fuels used in foreign trade
									</td>
									<td class="styIRS4136TableCellA" style="background-color:lightgrey;border-bottom:0;"/>
									<td class="styIRS4136TableCellB" style="border-bottom:0;">.001</td>
									<td class="styIRS4136TableCellC" style="border-bottom:0;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/LUSTTxSlsKrsnAvnFrgnTrdGalsQty"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellD" style="border-bottom:0;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/LUSTTxSlsKrsnAvnFrgnTrdCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellE" style="border-bottom:0;">433</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- ============================================================================= -->
					<!--  PAGE 2 FOOTER -->
					<!-- ============================================================================= -->
					<div style="width:187mm;">
						<div style="float: left; clear: none;">
							<span class="styBoldText"/>
						</div>
						<div style="float:right">
							<span style="width:70px"/>Form <span class="styBoldText" style="font-size: 8pt">4136</span> (2016)</div>
					</div>
					<!-- ============================================================================= -->
					<!--  PAGE 3 HEADER -->
					<!-- ============================================================================= -->
					<p style="page-break-before:always"/>
					<div class="styBB" style="width:187mm; border-bottom:2px solid black;">
						<div style="float: left; clear: none">Form 4136 (2016)</div>
						<div style="float:right">Page <span class="styBoldText" style="font-size: 8pt">3</span>
						</div>
					</div>
					<!-- ============================================================================= -->
					<!--  LINE 9 -->
					<!-- ============================================================================= -->
					<div class="styIRS4136NumLine" style="padding-top:2mm;">
						9<span style="width:6mm"/>Reserved
						<span style="float:right;width:70mm;">Registration No.<img src="{$ImagePath}/4136_Bullet.gif" alt="Bullet"/>
						</span>
					</div>
					<div class="styIRS4136DescLine" style="height:8mm;"/>
					<div style="width:187mm;float:left;clear:left;" id="UVctn">
						<table class="styIRS4136Table" cellspacing="0">
							<xsl:call-template name="NoColATableHeaderNoBraces">
								<xsl:with-param name="ColCHeader" select="'(c) Gallons of alcohol'"/>
							</xsl:call-template>
							<tfoot/>
							<tbody>
								<!-- ============================================================================= -->
								<!--  Row 9a -->
								<!-- ============================================================================= -->
								<tr>
									<td class="styIRS4136LetterCell">a</td>
									<td class="styIRS4136TableCellLine">Reserved</td>
									<td class="styIRS4136TableCellB" style="background-color:lightgrey;width:13mm;"/>
									<td class="styIRS4136TableCellC" style="background-color:lightgrey;"/>
									<td class="styIRS4136TableCellD" style="background-color:lightgrey;"/>
									<td class="styIRS4136TableCellE" style="background-color:lightgrey;"/>
								</tr>
								<!-- ============================================================================= -->
								<!--  Row 9b -->
								<!-- ============================================================================= -->
								<tr>
									<td class="styIRS4136LetterCell" style="border-bottom-width:1px;">b</td>
									<td class="styIRS4136TableCellLine">Reserved</td>
									<td class="styIRS4136TableCellB" style="background-color:lightgrey;"/>
									<td class="styIRS4136TableCellC" style="background-color:lightgrey;"/>
									<td class="styIRS4136TableCellD" style="background-color:lightgrey;"/>
									<td class="styIRS4136TableCellE" style="background-color:lightgrey;"/>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- ============================================================================= -->
					<!--  LINE 10 -->
					<!-- ============================================================================= -->
					<div class="styIRS4136NumLine" style="padding-left:1mm;">
						10<span style="width:5mm"/>Biodiesel or Renewable Diesel Mixture Credit
						<span style="float:right;width:70mm;">Registration No.<img src="{$ImagePath}/4136_Bullet.gif" alt="Bullet"/>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$IRS4136Data/BiodieselRnwblRegistrationNum"/>
						</xsl:call-template>
							<span style="font-weight:normal">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$IRS4136Data/BiodieselRnwblRegistrationNum"/>
								</xsl:call-template>
							</span>
						</span>
					</div>
					<div class="styBB" style="width:177mm;margin-left:10mm;padding-bottom:2mm;">
					<b>Biodiesel mixtures.  </b> Claimant produced a mixture by mixing biodiesel with diesel fuel. The biodiesel used to produce
					the mixture met ASTM D6751 and met EPA's registration requirements for fuels and fuel additives. The mixture was
					sold by the claimant to any person for use as a fuel or was used as a fuel by the claimant. Claimant has attached 
					the Certificate for Biodiesel and, if applicable, the Statement of Biodiesel Reseller. <b>  Renewable diesel mixtures.  </b> Claimant 
					produced a mixture by mixing renewable diesel with liquid fuel (other than renewable diesel). The renewable diesel used
					to produce the renewable diesel mixture was derived from biomass process, met EPA's registration requirements for fuels 
					and fuel additives, and met ASTM D975, D396, or other equivalent standard approved by the IRS. The mixture was sold by 
					the claimant to any person for use as a fuel or was used as a fuel by the claimant. Claimant has attached the Certificate 
					for Biodiesel and, if applicable, the Statement of Biodiesel Reseller, both of which have been edited as discussed in the 
					Instructions for Form 4136. See the instructions for line 10 for information about renewable diesel used in aviation.
					</div>
					<div style="width:187mm;float:left;clear:left;" id="UVctn">
						<table class="styIRS4136Table" cellspacing="0">
							<xsl:call-template name="NoColATableHeaderNoBraces">
								<xsl:with-param name="ColCHeader" select="'(c) Gallons of biodiesel or renewable diesel'"/>
							</xsl:call-template>
							<tfoot/>
							<tbody>
								<!-- ============================================================================= -->
								<!--  Row 10a -->
								<!-- ============================================================================= -->
								<tr>
									<td class="styIRS4136LetterCell">a</td>
									<td class="styIRS4136TableCellLine">Biodiesel (other than agri-biodiesel) mixtures</td>
									<td class="styIRS4136TableCellB">$ 1.00</td>
									<td class="styIRS4136TableCellC">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BiodieselMixtureGallonsQty"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellD">
										<span style="float:left;">$</span>

										<span style="float:left;">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$IRS4136Data/BiodieselMixtureCreditAmt"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BiodieselMixtureCreditAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellE">388</td>
								</tr>
								<!-- ============================================================================= -->
								<!--  Row 10b -->
								<!-- ============================================================================= -->
								<tr>
									<td class="styIRS4136LetterCell">b</td>
									<td class="styIRS4136TableCellLine">Agri-biodiesel mixtures</td>
									<td class="styIRS4136TableCellB">$ 1.00</td>
									<td class="styIRS4136TableCellC">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/AgriBiodieselMixtureGallonsQty"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellD">
										<span style="float:left;">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$IRS4136Data/AgriBiodieselMixtureCreditAmt"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/AgriBiodieselMixtureCreditAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellE">390</td>
								</tr>
								<!-- ============================================================================= -->
								<!--  Row 10c -->
								<!-- ============================================================================= -->
								<tr>
									<td class="styIRS4136LetterCell" style="border-bottom-width:1px;">c</td>
									<td class="styIRS4136TableCellLine">Renewable diesel mixtures</td>
									<td class="styIRS4136TableCellB">$ 1.00</td>
									<td class="styIRS4136TableCellC">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/RenewableDieselMixtureGalsQty"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellD">
										<span style="float:left;">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$IRS4136Data/RenewableDieselMixtureCrAmt"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/RenewableDieselMixtureCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellE">307</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- ============================================================================= -->
					<!--  LINE 11 -->
					<!-- ============================================================================= -->
					<div style="width:187mm;height:2mm;padding-left:6mm;"/>
					<div class="styIRS4136NumLine" style="padding-left:1mm;">
						11<span style="width:5mm"/>Nontaxable Use of Alternative Fuel
					</div>
					<div class="styIRS4136DescLine" style="border-bottom:0;padding-top:4mm;padding-bottom:1mm;font-size:8pt;">
						<b>Caution.</b> There is a reduced credit rate for use in certain intercity and local buses (type of use 5) (see instructions). </div>
					<div class="styTableContainer" style="border-top:1px solid black;overflow-y: hidden;height:auto;width:187mm;float:left;clear:left;border-bottom:0;" id="11ctn">
						<table class="styIRS4136Table" cellspacing="0">
							<xsl:call-template name="TableHeaderNoBraces">
								<xsl:with-param name="ColCHeader" select="'(c) Gallons, or gasoline or diesel gallon equivalents'"/>
							</xsl:call-template>
							<tfoot/>
							<tbody>
								<!-- ============================================================================= -->
								<!--  Row 11a -->
								<!-- ============================================================================= -->
								<xsl:variable name="RowCount11a" select="count($IRS4136Data/NontxLiquifiedPetroleumGas) + count($IRS4136Data/BusNontxLiquifiedPetroleumGas)"/>
								<xsl:call-template name="PopulateSubRows">
									<xsl:with-param name="RowLetter" select="'a'"/>
									<xsl:with-param name="RowLabel" select="'Liquefied petroleum gas (LPG)'"/>
									<xsl:with-param name="NonTXRowCount" select="count($IRS4136Data/NontxLiquifiedPetroleumGas)"/>
									<xsl:with-param name="BusNonTXRowCount" select="count($IRS4136Data/BusNontxLiquifiedPetroleumGas)"/>
									<xsl:with-param name="NonTXRowDataNode" select="$IRS4136Data/NontxLiquifiedPetroleumGas"/>
									<xsl:with-param name="BusNonTXRowDataNode" select="$IRS4136Data/BusNontxLiquifiedPetroleumGas"/>
									<xsl:with-param name="ColBRate" select="'.183'"/>
									<xsl:with-param name="ColDAmt" select="$IRS4136Data/NontxLiquefiedPtrlmGasCrAmt"/>
									<xsl:with-param name="ColECrn" select="419"/>
								</xsl:call-template>
								<!-- ============================================================================= -->
								<!--  Row 11b -->
								<!-- ============================================================================= -->
								<xsl:variable name="RowCount11b" select="count($IRS4136Data/NontxPSeriesFuels) + count($IRS4136Data/BusNontxPSeriesFuels)"/>
								<xsl:call-template name="PopulateSubRows">
									<xsl:with-param name="RowLetter" select="'b'"/>
									<xsl:with-param name="RowLabel" select="'&quot;P Series&quot; fuels'"/>
									<xsl:with-param name="NonTXRowCount" select="count($IRS4136Data/NontxPSeriesFuels)"/>
									<xsl:with-param name="BusNonTXRowCount" select="count($IRS4136Data/BusNontxPSeriesFuels)"/>
									<xsl:with-param name="NonTXRowDataNode" select="$IRS4136Data/NontxPSeriesFuels"/>
									<xsl:with-param name="BusNonTXRowDataNode" select="$IRS4136Data/BusNontxPSeriesFuels"/>
									<xsl:with-param name="ColBRate" select="'.183'"/>
									<xsl:with-param name="ColDAmt" select="$IRS4136Data/NontxPSeriesFuelsCreditAmt"/>
									<xsl:with-param name="ColECrn" select="420"/>
								</xsl:call-template>
								<!-- ============================================================================= -->
								<!--  Row 11c -->
								<!-- ============================================================================= -->
								<xsl:variable name="RowCount11c" select="count($IRS4136Data/NontxCompressedNaturalGas) + count($IRS4136Data/BusNontxCompressedNaturalGas)"/>
								<xsl:call-template name="PopulateSubRows">
									<xsl:with-param name="RowLetter" select="'c'"/>
									<xsl:with-param name="RowLabel" select="'Compressed natural gas (CNG)'"/>
									<xsl:with-param name="NonTXRowCount" select="count($IRS4136Data/NontxCompressedNaturalGas)"/>
									<xsl:with-param name="BusNonTXRowCount" select="count($IRS4136Data/BusNontxCompressedNaturalGas)"/>
									<xsl:with-param name="NonTXRowDataNode" select="$IRS4136Data/NontxCompressedNaturalGas"/>
									<xsl:with-param name="BusNonTXRowDataNode" select="$IRS4136Data/BusNontxCompressedNaturalGas"/>
									<xsl:with-param name="ColBRate" select="'.183'"/>
									<xsl:with-param name="ColDAmt" select="$IRS4136Data/NontxCompressedNaturalGasCrAmt"/>
									<xsl:with-param name="ColECrn" select="421"/>
								</xsl:call-template>
								<!-- ============================================================================= -->
								<!--  Row 11d -->
								<!-- ============================================================================= -->
								<xsl:variable name="RowCount11d" select="count($IRS4136Data/NontxLiquifiedHydrogen) + count($IRS4136Data/BusNontxLiquifiedHydrogen)"/>
								<xsl:call-template name="PopulateSubRows">
									<xsl:with-param name="RowLetter" select="'d'"/>
									<xsl:with-param name="RowLabel" select="'Liquefied hydrogen'"/>
									<xsl:with-param name="NonTXRowCount" select="count($IRS4136Data/NontxLiquifiedHydrogen)"/>
									<xsl:with-param name="BusNonTXRowCount" select="count($IRS4136Data/BusNontxLiquifiedHydrogen)"/>
									<xsl:with-param name="NonTXRowDataNode" select="$IRS4136Data/NontxLiquifiedHydrogen"/>
									<xsl:with-param name="BusNonTXRowDataNode" select="$IRS4136Data/BusNontxLiquifiedHydrogen"/>
									<xsl:with-param name="ColBRate" select="'.183'"/>
									<xsl:with-param name="ColDAmt" select="$IRS4136Data/NontxLiquefiedHydrogenCrAmt"/>
									<xsl:with-param name="ColECrn" select="422"/>
								</xsl:call-template>
								<!-- ============================================================================= -->
								<!--  Row 11e -->
								<!-- ============================================================================= -->
								<xsl:variable name="RowCount11e" select="count($IRS4136Data/NontxLiqfdFuelDerivedFromCoal) + count($IRS4136Data/BusNontxLiqfdFuelDerFromCoal)"/>
								<xsl:call-template name="PopulateSubRows">
									<xsl:with-param name="RowLetter" select="'e'"/>
									<xsl:with-param name="RowLabel" select="'Fischer&#8211;Tropsch process liquid fuel from coal (including peat)'"/>
									<xsl:with-param name="NonTXRowCount" select="count($IRS4136Data/NontxLiqfdFuelDerivedFromCoal)"/>
									<xsl:with-param name="BusNonTXRowCount" select="count($IRS4136Data/BusNontxLiqfdFuelDerFromCoal)"/>
									<xsl:with-param name="NonTXRowDataNode" select="$IRS4136Data/NontxLiqfdFuelDerivedFromCoal"/>
									<xsl:with-param name="BusNonTXRowDataNode" select="$IRS4136Data/BusNontxLiqfdFuelDerFromCoal"/>
									<xsl:with-param name="ColBRate" select="'.243'"/>
									<xsl:with-param name="ColDAmt" select="$IRS4136Data/NontxLiqfdFuelDerFromCoalCrAmt"/>
									<xsl:with-param name="ColECrn" select="423"/>
								</xsl:call-template>
								<!-- ============================================================================= -->
								<!--  Row 11f -->
								<!-- ============================================================================= -->
								<xsl:variable name="RowCount11f" select="count($IRS4136Data/NontaxLiqFuelDerFromBiomass) + count($IRS4136Data/BusNontxLiqFuelDerFromBiomass)"/>
								<xsl:call-template name="PopulateSubRows">
									<xsl:with-param name="RowLetter" select="'f'"/>
									<xsl:with-param name="RowLabel" select="'Liquid fuel derived from biomass'"/>
									<xsl:with-param name="NonTXRowCount" select="count($IRS4136Data/NontaxLiqFuelDerFromBiomass)"/>
									<xsl:with-param name="BusNonTXRowCount" select="count($IRS4136Data/BusNontxLiqFuelDerFromBiomass)"/>
									<xsl:with-param name="NonTXRowDataNode" select="$IRS4136Data/NontaxLiqFuelDerFromBiomass"/>
									<xsl:with-param name="BusNonTXRowDataNode" select="$IRS4136Data/BusNontxLiqFuelDerFromBiomass"/>
									<xsl:with-param name="ColBRate" select="'.243'"/>
									<xsl:with-param name="ColDAmt" select="$IRS4136Data/NontxLiqFuelDerBiomassCrAmt"/>
									<xsl:with-param name="ColECrn" select="424"/>
								</xsl:call-template>
								<!-- ============================================================================= -->
								<!--  Row 11g -->
								<!-- ============================================================================= -->
								<xsl:variable name="RowCount11g" select="count($IRS4136Data/NontxLiquefiedNaturalGas) + count($IRS4136Data/BusNontxLiquefiedNaturalGas)"/>
								<xsl:call-template name="PopulateSubRows">
									<xsl:with-param name="RowLetter" select="'g'"/>
									<xsl:with-param name="RowLabel" select="'Liquefied natural gas (LNG)'"/>
									<xsl:with-param name="NonTXRowCount" select="count($IRS4136Data/NontxLiquefiedNaturalGas)"/>
									<xsl:with-param name="BusNonTXRowCount" select="count($IRS4136Data/BusNontxLiquefiedNaturalGas)"/>
									<xsl:with-param name="NonTXRowDataNode" select="$IRS4136Data/NontxLiquefiedNaturalGas"/>
									<xsl:with-param name="BusNonTXRowDataNode" select="$IRS4136Data/BusNontxLiquefiedNaturalGas"/>
									<xsl:with-param name="ColBRate" select="'.243'"/>
									<xsl:with-param name="ColDAmt" select="$IRS4136Data/NontxLiquefiedNaturalGasCrAmt"/>
									<xsl:with-param name="ColECrn" select="425"/>
								</xsl:call-template>
								<!-- ============================================================================= -->
								<!--  Row 11h -->
								<!-- ============================================================================= -->
								<xsl:variable name="RowCount11h" select="count($IRS4136Data/NontxLiquefiedGasBiomass) + count($IRS4136Data/BusNontxLiquefiedGasDerBiomass)"/>
								<xsl:call-template name="PopulateSubRows">
									<xsl:with-param name="RowLetter" select="'h'"/>
									<xsl:with-param name="RowLabel" select="'Liquefied gas derived from biomass'"/>
									<xsl:with-param name="NonTXRowCount" select="count($IRS4136Data/NontxLiquefiedGasBiomass)"/>
									<xsl:with-param name="BusNonTXRowCount" select="count($IRS4136Data/BusNontxLiquefiedGasDerBiomass)"/>
									<xsl:with-param name="NonTXRowDataNode" select="$IRS4136Data/NontxLiquefiedGasBiomass"/>
									<xsl:with-param name="BusNonTXRowDataNode" select="$IRS4136Data/BusNontxLiquefiedGasDerBiomass"/>
									<xsl:with-param name="ColBRate" select="'.183'"/>
									<xsl:with-param name="ColDAmt" select="$IRS4136Data/NontxLiquefiedGasBiomassCrAmt"/>
									<xsl:with-param name="ColECrn" select="435"/>
								</xsl:call-template>
								<!-- ============================================================================= -->
							</tbody>
						</table>
					</div>
					<!-- ============================================================================= -->
					<!--  LINE 12 -->
					<!-- ============================================================================= -->
					<div class="styNumLine" style="padding-left:1mm;font-size:8pt;width:187mm;font-weight:bold;border-bottom:1px solid black;padding-top:6mm;padding-bottom:2mm;">
						12<span style="width:5mm"/>Alternative Fuel Credit
						<span style="float:right;width:70mm;">Registration No.<img src="{$ImagePath}/4136_Bullet.gif" alt="Bullet"/>
							<span style="width:4px;"/>
							<span style="font-weight:normal">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$IRS4136Data/AlternativeFuelRegistrationNum"/>
								</xsl:call-template>
							</span>
						</span>
					</div>
					<div style="width:187mm;float:left;clear:left;border-bottom:1px solid black;" id="UVctn">
						<table class="styIRS4136Table" cellspacing="0">
							<xsl:call-template name="NoColATableHeaderNoBraces">
								<xsl:with-param name="ColCHeader" select="'(c) Gallons, or gasoline or diesel gallon equivalents'"/>
							</xsl:call-template>
							<tfoot/>
							<tbody>
								<!-- ============================================================================= -->
								<!--  Row 12a -->
								<!-- ============================================================================= -->
								<tr>
									<td class="styIRS4136LetterCell">a</td>
									<td class="styIRS4136TableCellLine">Liquefied petroleum gas (LPG)</td>
									<td class="styIRS4136TableCellB">$ .50</td>
									<td class="styIRS4136TableCellC">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/LiquefiedPetroleumGasGalsQty"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellD">
										<span style="float:left;">$
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$IRS4136Data/LiquefiedPetroleumGasCrAmt"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/LiquefiedPetroleumGasCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellE">426</td>
								</tr>
								<!-- ============================================================================= -->
								<!--  Row 12b -->
								<!-- ============================================================================= -->
								<tr>
									<td class="styIRS4136LetterCell">b</td>
									<td class="styIRS4136TableCellLine">&quot;P Series&quot; fuels</td>
									<td class="styIRS4136TableCellB">.50</td>
									<td class="styIRS4136TableCellC">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/PSeriesFuelsGallonsQty"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellD">
										<span style="float:left;">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$IRS4136Data/PSeriesFuelsCreditAmt"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/PSeriesFuelsCreditAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellE">427</td>
								</tr>
								<!-- ============================================================================= -->
								<!--  Row 12c -->
								<!-- ============================================================================= -->
								<tr>
									<td class="styIRS4136LetterCell">c</td>
									<td class="styIRS4136TableCellLine">Compressed natural gas (CNG)</td>
									<td class="styIRS4136TableCellB">.50</td>
									<td class="styIRS4136TableCellC">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/CompressedNaturalGasGalsQty"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellD">
										<span style="float:left;">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$IRS4136Data/CompressedNaturalGasCreditAmt"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/CompressedNaturalGasCreditAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellE">428</td>
								</tr>
								<!-- ============================================================================= -->
								<!--  Row 12d -->
								<!-- ============================================================================= -->
								<tr>
									<td class="styIRS4136LetterCell">d</td>
									<td class="styIRS4136TableCellLine">Liquefied hydrogen</td>
									<td class="styIRS4136TableCellB">.50</td>
									<td class="styIRS4136TableCellC">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/LiquefiedHydrogenGallonsQty"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellD">
										<span style="float:left;">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$IRS4136Data/LiquefiedHydrogenCreditAmt"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/LiquefiedHydrogenCreditAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellE">429</td>
								</tr>
								<!-- ============================================================================= -->
								<!--  Row 12e -->
								<!-- ============================================================================= -->
								<tr>
									<td class="styIRS4136LetterCell">e</td>
									<td class="styIRS4136TableCellLine">Fischer&#8211;Tropsch process liquid fuel from coal (including peat)</td>
									<td class="styIRS4136TableCellB">.50</td>
									<td class="styIRS4136TableCellC">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/LiquidFuelDerFromCoalGalsQty"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellD">
										<span style="float:left;">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$IRS4136Data/LiquidFuelDerFromCoalCreditAmt"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/LiquidFuelDerFromCoalCreditAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellE">430</td>
								</tr>
								<!-- ============================================================================= -->
								<!--  Row 12f -->
								<!-- ============================================================================= -->
								<tr>
									<td class="styIRS4136LetterCell">f</td>
									<td class="styIRS4136TableCellLine">Liquid fuel derived from biomass</td>
									<td class="styIRS4136TableCellB">.50</td>
									<td class="styIRS4136TableCellC">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/LiquidFuelDerBiomassGalsQty"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellD">
										<span style="float:left;">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$IRS4136Data/LiquidFuelDerBiomassCrAmt"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/LiquidFuelDerBiomassCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellE">431</td>
								</tr>
								<!-- ============================================================================= -->
								<!--  Row 12g -->
								<!-- ============================================================================= -->
								<tr>
									<td class="styIRS4136LetterCell">g</td>
									<td class="styIRS4136TableCellLine">Liquefied natural gas (LNG)</td>
									<td class="styIRS4136TableCellB">.50</td>
									<td class="styIRS4136TableCellC">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/LiquefiedNaturalGasGallonsQty"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellD">
										<span style="float:left;">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$IRS4136Data/LiquefiedNaturalGasCreditAmt"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/LiquefiedNaturalGasCreditAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellE">432</td>
								</tr>
								<!-- ============================================================================= -->
								<!--  Row 12h -->
								<!-- ============================================================================= -->
								<tr>
									<td class="styIRS4136LetterCell">h</td>
									<td class="styIRS4136TableCellLine">Liquefied gas derived from biomass</td>
									<td class="styIRS4136TableCellB">.50</td>
									<td class="styIRS4136TableCellC">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/LiquefiedGasDerBiomassGalsQty"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellD">
										<span style="float:left;">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$IRS4136Data/LiquefiedGasDerBiomassCrAmt"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/LiquefiedGasDerBiomassCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellE">436</td>
								</tr>
								<!-- ============================================================================= -->
								<!--  Row 12i -->
								<!-- ============================================================================= -->
								<tr>
									<td class="styIRS4136LetterCell" style="border-bottom-width:1px;">i</td>
									<td class="styIRS4136TableCellLine">Compressed gas derived from biomass</td>
									<td class="styIRS4136TableCellB">.50</td>
									<td class="styIRS4136TableCellC">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/CompressedGasBiomassGGEQty"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellD">
										<span style="float:left;">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$IRS4136Data/CompressedGasBiomassCreditAmt"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/CompressedGasBiomassCreditAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellE">437</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- ============================================================================= -->
					<!--  PAGE 3 FOOTER -->
					<!-- ============================================================================= -->
					<div style="width:187mm;">
						<div style="float: left; clear: none;padding-left:8mm">
							<span class="styBoldText"/>
						</div>
						<div style="float:right">
							<span style="width:70px"/>Form <span class="styBoldText" style="font-size: 8pt">4136</span> (2016)
						</div>
					</div>
					<!-- ============================================================================= -->
					<!--  PAGE 4 HEADER -->
					<!-- ============================================================================= -->
					<p style="page-break-before:always"/>
					<div class="styBB" style="width:187mm; border-bottom-width:2px;">
						<div style="float: left; clear: none">Form 4136 (2016)</div>
						<div style="float:right">Page <span class="styBoldText" style="font-size: 8pt">4</span>
						</div>
					</div>
					<!-- ============================================================================= -->
					<!--  LINE 13 -->
					<!-- ============================================================================= -->
					<div class="styIRS4136NumLine" style="padding-left:1mm;">
						13<span style="width:5mm"/>Registered Credit Card Issuers
						<span style="float:right;width:70mm;">Registration No. <img src="{$ImagePath}/4136_Bullet.gif" alt="Bullet"/>
							<span style="width:4px;"/>
							<span style="font-weight:normal">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$IRS4136Data/CreditCardIssrRegistrationNum"/>
								</xsl:call-template>
							</span>
						</span>
					</div>
					<div style="width:187mm;float:left;clear:left;" id="UVctn">
						<table class="styIRS4136Table" cellspacing="0">
							<xsl:call-template name="NoColATableHeaderNoBraces"/>
							<tfoot/>
							<tbody>
								<!-- ============================================================================= -->
								<!--  Row 13a -->
								<!-- ============================================================================= -->
								<tr>
									<td class="styIRS4136LetterCell">a</td>
									<td class="styIRS4136TableCellLine">Diesel fuel sold for the exclusive use of a state or local government</td>
									<td class="styIRS4136TableCellB">$ .243</td>
									<td class="styIRS4136TableCellC">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/DslFuelSoldStLocalGovtGalsQty"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellD">
										<span style="float:left;">$</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/DslFuelSoldStLocalGovtCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellE">360</td>
								</tr>
								<!-- ============================================================================= -->
								<!--  Row 13b -->
								<!-- ============================================================================= -->
								<tr>
									<td class="styIRS4136LetterCell">b</td>
									<td class="styIRS4136TableCellLine">Kerosene sold for the exclusive use of a state or local government</td>
									<td class="styIRS4136TableCellB">.243</td>
									<td class="styIRS4136TableCellC">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/KrsnFuelSoldStLocalGovtGalsQty"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellD">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/KrsnFuelSoldStLocalGovtCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellE">346</td>
								</tr>
								<!-- ============================================================================= -->
								<!--  Row 13c -->
								<!-- ============================================================================= -->
								<tr>
									<td class="styIRS4136LetterCell" style="height:6mm;border-bottom:1px solid black;">
										<b>c</b>
									</td>
									<td class="styIRS4136TableCellLine">
                  Kerosene for use in aviation sold for the exclusive use of a state or local government taxed at $.219
									</td>
									<td class="styIRS4136TableCellB">.218</td>
									<td class="styIRS4136TableCellC">
										<span style="float:left;">
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Form 4136 line 13c(c),  AviationKeroseneGallons/@keroseneTaxRateCd</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$IRS4136Data/KrsnAvnSoldStLocalGovtGalsQty/@keroseneTaxRateCd"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/KrsnAvnSoldStLocalGovtGalsQty"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellD">
										<span style="float:left;">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$IRS4136Data/KrsnAvnSoldStLocalGovtCrAmt"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/KrsnAvnSoldStLocalGovtCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellE">369</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- ============================================================================= -->
					<!--  LINE 14 -->
					<!-- ============================================================================= -->
					<xsl:variable name="Line14aCount" select="count($IRS4136Data/NontxUseDieselWaterEmulsion)"/>
					<div class="styIRS4136NumLine" style="padding-left:1mm;">
						14<span style="width:5mm"/>Nontaxable Use of a Diesel-Water Fuel Emulsion
					</div>
					<div class="styIRS4136DescLine" style="border-bottom:0;font-size:8pt;">
						<b>Caution. </b> There is a reduced credit rate for use in certain intercity and local buses (type of use 5) (see instructions).</div>
					<div class="styTableContainer" id="14ctn" style="border-top-width:1px;border-bottom-width:1px;">
						<table class="styTable" cellspacing="0">
							<xsl:call-template name="TableHeaderNoBraces"/>
							<tfoot/>
							<tbody>
								<!-- ============================================================================= -->
								<!--  Row 14a -->
								<!-- ============================================================================= -->
								<xsl:variable name="RowCount14a" select="count($IRS4136Data/NontxUseDieselWaterEmulsion) + count($IRS4136Data/BusNontxUseDieselWtrEmulsion)"/>
								<xsl:call-template name="PopulateSubRows">
									<xsl:with-param name="RowLetter" select="'a'"/>
									<xsl:with-param name="RowLabel" select="'Nontaxable use'"/>
									<xsl:with-param name="NonTXRowCount" select="count($IRS4136Data/NontxUseDieselWaterEmulsion)"/>
									<xsl:with-param name="BusNonTXRowCount" select="count($IRS4136Data/BusNontxUseDieselWtrEmulsion)"/>
									<xsl:with-param name="NonTXRowDataNode" select="$IRS4136Data/NontxUseDieselWaterEmulsion"/>
									<xsl:with-param name="BusNonTXRowDataNode" select="$IRS4136Data/BusNontxUseDieselWtrEmulsion"/>
									<xsl:with-param name="ColBRate" select="'.197'"/>
									<xsl:with-param name="ColDAmt" select="$IRS4136Data/NontxUseDieselWtrEmulsionCrAmt"/>
									<xsl:with-param name="ColECrn" select="309"/>
								</xsl:call-template>
								<!-- ============================================================================= -->
								<!--  Row 14b -->
								<!-- ============================================================================= -->
								<tr>
									<td class="styIRS4136LetterCell">b</td>
									<td class="styIRS4136TableCellLine" style="border-bottom:0;">
										Exported
									</td>
									<td class="styIRS4136TableCellA" style="background-color:lightgrey;border-bottom:0;"/>
									<td class="styIRS4136TableCellB" style="border-bottom:0;">.198</td>
									<td class="styIRS4136TableCellC" style="border-bottom:0;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/ExpNontxUseDslWtrEmulsionQty"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellD" style="border-bottom:0;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/ExpNontxUseDslWtrEmulsionCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellE" style="border-bottom:0;">306</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- ============================================================================= -->
					<!--  LINE15 -->
					<!-- ============================================================================= -->
					<div class="styIRS4136NumLine" style="padding-left:1mm;">
						15<span style="width:5mm"/>Diesel-Water Fuel Emulsion Blending
						<span style="float:right;width:70mm;">Registration No. <img src="{$ImagePath}/4136_Bullet.gif" alt="Bullet"/>
							<span style="width:4px;"/>
							<span style="font-weight:normal">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$IRS4136Data/DieselWtrBlndgRegistrationNum"/>
								</xsl:call-template>
							</span>
						</span>
					</div>
					<div style="width:187mm;float:left;clear:left;" id="UVctn">
						<table class="styIRS4136Table" cellspacing="0">
							<xsl:call-template name="NoColATableHeaderNoBraces"/>
							<tfoot/>
							<tbody>
								<!-- ============================================================================= -->
								<!--  Row 15a -->
								<!-- ============================================================================= -->
								<tr>
									<td class="styIRS4136LetterCell" style="border-bottom-width:1px;"/>
									<td class="styIRS4136TableCellLine">Blender credit</td>
									<td class="styIRS4136TableCellB">$ .046</td>
									<td class="styIRS4136TableCellC">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BlndrCrUseDslWtrEmulsionQty"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellD">
										<span style="float:left;">
											$<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$IRS4136Data/BlndrCrUseDslWtrEmulsionCrAmt"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/BlndrCrUseDslWtrEmulsionCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellE">310</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- ============================================================================= -->
					<!--  LINE 16 -->
					<!-- ============================================================================= -->
					<div class="styIRS4136NumLine" style="padding-left:1mm;">
						16<span style="width:5mm"/>Exported Dyed Fuels and Exported Gasoline Blendstocks
					</div>
					<div style="width:187mm;float:left;clear:left;" id="UVctn">
						<table class="styIRS4136Table" cellspacing="0">
							<xsl:call-template name="NoColATableHeaderNoBraces"/>
							<tfoot/>
							<tbody>
								<!-- ============================================================================= -->
								<!--  Row 16a -->
								<!-- ============================================================================= -->
								<tr>
									<td class="styIRS4136LetterCell">a</td>
									<td class="styIRS4136TableCellLine">Exported dyed diesel fuel and exported gasoline blendstocks taxed at $.001</td>
									<td class="styIRS4136TableCellB">$ .001</td>
									<td class="styIRS4136TableCellC">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/ExportedDyedDieselFuelGalsQty"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellD">
										<span style="float:left;">$</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/ExportedDyedDieselFuelCrAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellE">415</td>
								</tr>
								<!-- ============================================================================= -->
								<!--  Row 16b -->
								<!-- ============================================================================= -->
								<tr>
									<td class="styIRS4136LetterCell" style="border-bottom-width:1px;">b</td>
									<td class="styIRS4136TableCellLine">Exported dyed kerosene</td>
									<td class="styIRS4136TableCellB">.001</td>
									<td class="styIRS4136TableCellC">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/ExportedDyedKeroseneGallonsQty"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellD">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS4136Data/ExportedDyedKeroseneCreditAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRS4136TableCellE">416</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div style="width:187mm;padding-top:10mm;"/>
					<!-- ============================================================================= -->
					<!--  LINE 17 -->
					<!-- ============================================================================= -->
					<div class="styBB" style="width:187mm;font-size:7pt;float:none;clear:both;border-top-width:1px;">
						<div class="styGenericDiv" style="width:6mm;height:10mm;font-weight:bold;padding-left:1mm;padding-top:3px; font-size:8pt;">17
      </div>
						<div class="styGenericDiv" style="width:131mm;height:10mm;padding-left:5px;padding-top:3px;">
							<b>Total income tax credit claimed. </b>Add lines 1 through 16, column (d). Enter here and on Form 1040, line 72; Form 1120, Schedule J, line 19b; Form 1120S, line 23c; Form 1041, line 24g; or the proper line of other returns.
        <span style="padding-left:2mm">
								<img src="{$ImagePath}/4136_Bullet.gif" alt="Bullet"/>
							</span>
						</div>
						<div class="styGenericDiv" style="width:8mm;height:10mm;font-weight: bold;text-align:center;padding-top:7mm;border-left:1px solid black;">17
            </div>
						<div class="styGenericDiv" style="width:30mm;height:10mm;padding-top:7mm;text-align:right;padding-right:1mm;border-left:1px solid black;">
							<span style="float:left;">$</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS4136Data/TotalFuelTaxCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="styGenericDiv" style="width:12mm;height:10mm;border-left:1px solid black;background-color:lightgrey;">
							<span style="width:1px;"/>
						</div>
					</div>
					<!-- ============================================================================= -->
					<!--  PAGE 4 FOOTER -->
					<!-- ============================================================================= -->
					<div class="pageEnd" style="width:187mm;padding-top:.5mm;">
						<div style="float:right">
							<span style="width:80px"/>Form <span class="styBoldText">4136</span> (2016)</div>
					</div>
					<!-- ============================================================================= -->
					<!--  LEFTOVER DATA -->
					<!-- ============================================================================= -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">Additional Data </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$IRS4136Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc"> Line 13c(c) keroseneTaxRateCd</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$IRS4136Data/KrsnAvnSoldStLocalGovtGalsQty/@keroseneTaxRateCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- ============================================================================= -->
					<!--  SRD Row 1c -->
					<!-- ============================================================================= -->
					<xsl:variable name="RowCount1c" select="count($IRS4136Data/OtherNontaxableUseOfGasoline)"/>
					<xsl:if test="($Print = $Separated) and  ($RowCount1c &gt; 1) ">
						<div style="page-break-inside:avoid;">
							<span class="styRepeatingDataTitle">Form 4136, Line 1 - Nontaxable Use of Gasoline</span>
							<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
								<xsl:call-template name="DepTableThead"/>
								<tfoot/>
								<tbody>
									<xsl:call-template name="PopulateSeparateTable">
										<xsl:with-param name="RowLetter" select="'c'"/>
										<xsl:with-param name="NonTXRowCount" select="count($IRS4136Data/OtherNontaxableUseOfGasoline)"/>
										<xsl:with-param name="BusNonTXRowCount" select="0"/>
										<xsl:with-param name="NonTXRowDataNode" select="$IRS4136Data/OtherNontaxableUseOfGasoline"/>
										<xsl:with-param name="BusNonTXRowDataNode" select="''"/>
										<xsl:with-param name="ColBRate" select="'.183'"/>
										<xsl:with-param name="ColDAmt" select="$IRS4136Data/NontaxableUseOfGasolineCrAmt"/>
										<xsl:with-param name="ColECrn" select="362"/>
									</xsl:call-template>
								</tbody>
							</table>
							<br/>
						</div>
					</xsl:if>
					<!-- ============================================================================= -->
					<!--  SRD Row 2b -->
					<!-- ============================================================================= -->
					<xsl:if test="($Print = $Separated) and (count($IRS4136Data/AviationNontxUseGasGalsQty) &gt; 1)">
						<div style="page-break-inside:avoid;">
							<span class="styRepeatingDataTitle">Form 4136, Line 2 - Nontaxable Use of Aviation Gasoline</span>
							<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
								<xsl:call-template name="DepTableThead"/>
								<tfoot/>
								<tbody>
									<xsl:call-template name="PopulateSeparateTable">
										<xsl:with-param name="RowLetter" select="'b'"/>
										<xsl:with-param name="NonTXRowCount" select="count($IRS4136Data/AviationNontxUseGasGalsQty)"/>
										<xsl:with-param name="BusNonTXRowCount" select="0"/>
										<xsl:with-param name="NonTXRowDataNode" select="$IRS4136Data/AviationNontxUseGasGalsQty"/>
										<xsl:with-param name="BusNonTXRowDataNode" select="''"/>
										<xsl:with-param name="ColBRate" select="'.193'"/>
										<xsl:with-param name="ColDAmt" select="$IRS4136Data/AviationNontxGasCrAmt"/>
										<xsl:with-param name="ColECrn" select="324"/>
									</xsl:call-template>
								</tbody>
							</table>
							<br/>
						</div>
					</xsl:if>
					<!-- ============================================================================= -->
					<!--  SRD Row 3a -->
					<!-- ============================================================================= -->
					<xsl:if test="($Print = $Separated) and (count($IRS4136Data/NontaxableUseOfUndyedDiesel) &gt; 1)">
						<div style="page-break-inside:avoid;">
							<span class="styRepeatingDataTitle">Form 4136, Line 3 - Nontaxable Use of Undyed Diesel Fuel</span>
							<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
								<xsl:call-template name="DepTableThead"/>
								<tfoot/>
								<tbody>
									<xsl:call-template name="PopulateSeparateTable">
										<xsl:with-param name="RowLetter" select="'a'"/>
										<xsl:with-param name="RowLabel" select="'Nontaxable use'"/>
										<xsl:with-param name="NonTXRowCount" select="count($IRS4136Data/NontaxableUseOfUndyedDiesel)"/>
										<xsl:with-param name="BusNonTXRowCount" select="0"/>
										<xsl:with-param name="NonTXRowDataNode" select="$IRS4136Data/NontaxableUseOfUndyedDiesel"/>
										<xsl:with-param name="BusNonTXRowDataNode" select="''"/>
										<xsl:with-param name="ColBRate" select="'.243'"/>
										<xsl:with-param name="ColDAmt"/>
										<xsl:with-param name="ColECrn"/>
									</xsl:call-template>
								</tbody>
							</table>
							<br/>
						</div>
					</xsl:if>
					<!-- ============================================================================= -->
					<!--  SRD Row 4a -->
					<!-- ============================================================================= -->
					<xsl:if test="($Print = $Separated) and (count($IRS4136Data/NontaxableUseOfUndyedKerosene) &gt; 1)">
						<div style="page-break-inside:avoid;">
							<span class="styRepeatingDataTitle">Form 4136, Line 4 - Nontaxable Use of Undyed Kerosene (Other Than Kerosene Used in Aviation)</span>
							<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
								<xsl:call-template name="DepTableThead"/>
								<tfoot/>
								<tbody>
									<xsl:call-template name="PopulateSeparateTable">
										<xsl:with-param name="RowLetter" select="'a'"/>
										<xsl:with-param name="RowLabel" select="'Nontaxable use taxed at $.244'"/>
										<xsl:with-param name="NonTXRowCount" select="count($IRS4136Data/NontaxableUseOfUndyedKerosene)"/>
										<xsl:with-param name="BusNonTXRowCount" select="0"/>
										<xsl:with-param name="NonTXRowDataNode" select="$IRS4136Data/NontaxableUseOfUndyedKerosene"/>
										<xsl:with-param name="BusNonTXRowDataNode" select="''"/>
										<xsl:with-param name="ColBRate" select="'.243'"/>
										<xsl:with-param name="ColDAmt"/>
										<xsl:with-param name="ColECrn"/>
									</xsl:call-template>
								</tbody>
							</table>
							<br/>
						</div>
					</xsl:if>
					<!-- ============================================================================= -->
					<!--  SRD Row 4e -->
					<!-- ============================================================================= -->
					<xsl:if test="($Print = $Separated) and (count($IRS4136Data/NontxUseUndyedKrsnTxdAt044) &gt; 1)">
						<div style="page-break-inside:avoid;">
							<span class="styRepeatingDataTitle">Form 4136, Line 4 - Nontaxable Use of Undyed Kerosene (Other Than Kerosene Used in Aviation)</span>
							<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
								<xsl:call-template name="DepTableThead"/>
								<tfoot/>
								<tbody>
									<xsl:call-template name="PopulateSeparateTable">
										<xsl:with-param name="RowLetter" select="'e'"/>
										<xsl:with-param name="RowLabel" select="'Nontaxable use taxed at $.044'"/>
										<xsl:with-param name="NonTXRowCount" select="count($IRS4136Data/NontxUseUndyedKrsnTxdAt044)"/>
										<xsl:with-param name="BusNonTXRowCount" select="0"/>
										<xsl:with-param name="NonTXRowDataNode" select="$IRS4136Data/NontxUseUndyedKrsnTxdAt044"/>
										<xsl:with-param name="BusNonTXRowDataNode" select="''"/>
										<xsl:with-param name="ColBRate" select="'.043'"/>
										<xsl:with-param name="ColDAmt" select="$IRS4136Data/NontxUseUndyedKrsnTxd044CrAmt"/>
										<xsl:with-param name="ColECrn" select="377"/>
									</xsl:call-template>
								</tbody>
							</table>
							<br/>
						</div>
					</xsl:if>
					<!-- ============================================================================= -->
					<!--  SRD Row 4f -->
					<!-- ============================================================================= -->
					<xsl:if test="($Print = $Separated) and (count($IRS4136Data/NontxUseUndyedKrsnTxd219) &gt; 1)">
						<div style="page-break-inside:avoid;">
							<span class="styRepeatingDataTitle">Form 4136, Line 4 - Nontaxable Use of Undyed Kerosene (Other Than Kerosene Used in Aviation)</span>
							<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
								<xsl:call-template name="DepTableThead"/>
								<tfoot/>
								<tbody>
									<xsl:call-template name="PopulateSeparateTable">
										<xsl:with-param name="RowLetter" select="'f'"/>
										<xsl:with-param name="RowLabel" select="'Nontaxable use taxed at $.219'"/>
										<xsl:with-param name="NonTXRowCount" select="count($IRS4136Data/NontxUseUndyedKrsnTxd219)"/>
										<xsl:with-param name="BusNonTXRowCount" select="0"/>
										<xsl:with-param name="NonTXRowDataNode" select="$IRS4136Data/NontxUseUndyedKrsnTxd219"/>
										<xsl:with-param name="BusNonTXRowDataNode" select="''"/>
										<xsl:with-param name="ColBRate" select="'.218'"/>
										<xsl:with-param name="ColDAmt" select="$IRS4136Data/NontxUseUndyedKrsnTxd219CrAmt"/>
										<xsl:with-param name="ColECrn" select="369"/>
									</xsl:call-template>
								</tbody>
							</table>
							<br/>
						</div>
					</xsl:if>
					<!-- ============================================================================= -->
					<!--  SRD Row 5c -->
					<!-- ============================================================================= -->
					<xsl:if test="($Print = $Separated) and (count($IRS4136Data/NonTxKrsnUsedInAvnTxd244) &gt; 1)">
						<div style="page-break-inside:avoid;">
							<span class="styRepeatingDataTitle">Form 4136, Line 5 - Kerosene Used in Aviation</span>
							<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
								<xsl:call-template name="DepTableThead"/>
								<tfoot/>
								<tbody>
									<xsl:call-template name="PopulateSeparateTable">
										<xsl:with-param name="RowLetter" select="'c'"/>
										<xsl:with-param name="RowLabel" select="'Nontaxable use (Other than use by state or local government) taxed at $.244'"/>
										<xsl:with-param name="NonTXRowCount" select="count($IRS4136Data/NonTxKrsnUsedInAvnTxd244)"/>
										<xsl:with-param name="BusNonTXRowCount" select="0"/>
										<xsl:with-param name="NonTXRowDataNode" select="$IRS4136Data/NonTxKrsnUsedInAvnTxd244"/>
										<xsl:with-param name="BusNonTXRowDataNode" select="''"/>
										<xsl:with-param name="ColBRate" select="'.243'"/>
										<xsl:with-param name="ColDAmt" select="$IRS4136Data/NonTxKrsnUsedInAvnTxd244CrAmt"/>
										<xsl:with-param name="ColECrn" select="346"/>
									</xsl:call-template>
								</tbody>
							</table>
							<br/>
						</div>
					</xsl:if>
					<!-- ============================================================================= -->
					<!--  SRD Row 5d -->
					<!-- ============================================================================= -->
					<xsl:if test="($Print = $Separated) and (count($IRS4136Data/NonTxKrsnUsedInAvnTxd219) &gt; 1)">
						<div style="page-break-inside:avoid;">
							<span class="styRepeatingDataTitle">Form 4136, Line 5 - Kerosene Used in Aviation</span>
							<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
								<xsl:call-template name="DepTableThead"/>
								<tfoot/>
								<tbody>
									<xsl:call-template name="PopulateSeparateTable">
										<xsl:with-param name="RowLetter" select="'d'"/>
										<xsl:with-param name="RowLabel" select="'Nontaxable use (Other than use by state or local government) taxed at $.219'"/>
										<xsl:with-param name="NonTXRowCount" select="count($IRS4136Data/NonTxKrsnUsedInAvnTxd219)"/>
										<xsl:with-param name="BusNonTXRowCount" select="0"/>
										<xsl:with-param name="NonTXRowDataNode" select="$IRS4136Data/NonTxKrsnUsedInAvnTxd219"/>
										<xsl:with-param name="BusNonTXRowDataNode" select="''"/>
										<xsl:with-param name="ColBRate" select="'.218'"/>
										<xsl:with-param name="ColDAmt" select="$IRS4136Data/NonTxKrsnUsedInAvnTxd219CrAmt"/>
										<xsl:with-param name="ColECrn" select="369"/>
									</xsl:call-template>
								</tbody>
							</table>
							<br/>
						</div>
					</xsl:if>
					<!-- ============================================================================= -->
					<!--  SRD Row 8d -->
					<!-- ============================================================================= -->
					<xsl:if test="($Print = $Separated) and (count($IRS4136Data/OtherNontaxableUseTaxedAt244) &gt; 1)">
						<div style="page-break-inside:avoid;">
							<span class="styRepeatingDataTitle">Form 4136, Line 8 - Sales by Registered Ultimate Vendors of Kerosene For Use in Aviation</span>
							<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
								<xsl:call-template name="DepTableThead"/>
								<tfoot/>
								<tbody>
									<xsl:call-template name="PopulateSeparateTable">
										<xsl:with-param name="RowLetter" select="'d'"/>
										<xsl:with-param name="RowLabel" select="'Other nontaxable uses taxed at $.244'"/>
										<xsl:with-param name="NonTXRowCount" select="count($IRS4136Data/OtherNontaxableUseTaxedAt244)"/>
										<xsl:with-param name="BusNonTXRowCount" select="0"/>
										<xsl:with-param name="NonTXRowDataNode" select="$IRS4136Data/OtherNontaxableUseTaxedAt244"/>
										<xsl:with-param name="BusNonTXRowDataNode" select="''"/>
										<xsl:with-param name="ColBRate" select="'.243'"/>
										<xsl:with-param name="ColDAmt" select="$IRS4136Data/SlsKrsnOthNontxTxd244CrAmt"/>
										<xsl:with-param name="ColECrn" select="346"/>
									</xsl:call-template>
								</tbody>
							</table>
							<br/>
						</div>
					</xsl:if>
					<!-- ============================================================================= -->
					<!--  SRD Row 8e -->
					<!-- ============================================================================= -->
					<xsl:if test="($Print = $Separated) and (count($IRS4136Data/OtherNontaxableUseTaxedAt219) &gt; 1)">
						<div style="page-break-inside:avoid;">
							<span class="styRepeatingDataTitle">Form 4136, Line 8 - Sales by Registered Ultimate Vendors of Kerosene For Use in Aviation</span>
							<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
								<xsl:call-template name="DepTableThead"/>
								<tfoot/>
								<tbody>
									<xsl:call-template name="PopulateSeparateTable">
										<xsl:with-param name="RowLetter" select="'e'"/>
										<xsl:with-param name="RowLabel" select="'Other nontaxable uses taxed at $.219'"/>
										<xsl:with-param name="NonTXRowCount" select="count($IRS4136Data/OtherNontaxableUseTaxedAt219)"/>
										<xsl:with-param name="BusNonTXRowCount" select="0"/>
										<xsl:with-param name="NonTXRowDataNode" select="$IRS4136Data/OtherNontaxableUseTaxedAt219"/>
										<xsl:with-param name="BusNonTXRowDataNode" select="''"/>
										<xsl:with-param name="ColBRate" select="'.218'"/>
										<xsl:with-param name="ColDAmt" select="$IRS4136Data/SlsKrsnOthNontxTxd219CrAmt"/>
										<xsl:with-param name="ColECrn" select="369"/>
									</xsl:call-template>
								</tbody>
							</table>
							<br/>
						</div>
					</xsl:if>
					<!-- ============================================================================= -->
					<!--  SRD Row 11a -->
					<!-- ============================================================================= -->
					<xsl:if test="(count($IRS4136Data/NontxLiquifiedPetroleumGas) + count($IRS4136Data/BusNontxLiquifiedPetroleumGas) &gt;1) and ($Print = $Separated)">
						<div style="page-break-inside:avoid;">
							<span class="styRepeatingDataTitle">Form 4136, Line 11 - Nontaxable Use of Alternative Fuel</span>
							<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
								<xsl:call-template name="DepTableThead">
								<xsl:with-param name="ColCHeader" select="'(c) Gallons, or gasoline or diesel gallon equivalents'"/>
								</xsl:call-template>
								<tfoot/>
								<tbody>
									<xsl:call-template name="PopulateSeparateTable">
										<xsl:with-param name="RowLetter" select="'a'"/>
										<xsl:with-param name="RowLabel" select="'Liquefied petroleum gas (LPG)'"/>
										<xsl:with-param name="NonTXRowCount" select="count($IRS4136Data/NontxLiquifiedPetroleumGas)"/>
										<xsl:with-param name="BusNonTXRowCount" select="count($IRS4136Data/BusNontxLiquifiedPetroleumGas)"/>
										<xsl:with-param name="NonTXRowDataNode" select="$IRS4136Data/NontxLiquifiedPetroleumGas"/>
										<xsl:with-param name="BusNonTXRowDataNode" select="$IRS4136Data/BusNontxLiquifiedPetroleumGas"/>
										<xsl:with-param name="ColBRate" select="'.183'"/>
										<xsl:with-param name="ColDAmt" select="$IRS4136Data/NontxLiquefiedPtrlmGasCrAmt"/>
										<xsl:with-param name="ColECrn" select="419"/>
									</xsl:call-template>
								</tbody>
							</table>
							<br/>
						</div>
					</xsl:if>
					<!-- ============================================================================= -->
					<!--  SRD Row 11b -->
					<!-- ============================================================================= -->
					<xsl:if test="(count($IRS4136Data/NontxPSeriesFuels) + count($IRS4136Data/BusNontxPSeriesFuels) &gt;1) and ($Print = $Separated)">
						<div style="page-break-inside:avoid;">
							<span class="styRepeatingDataTitle">Form 4136, Line 11 - Nontaxable Use of Alternative Fuel</span>
							<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
								<xsl:call-template name="DepTableThead">
								<xsl:with-param name="ColCHeader" select="'(c) Gallons, or gasoline or diesel gallon equivalents'"/>
								</xsl:call-template>
								<tfoot/>
								<tbody>
									<xsl:call-template name="PopulateSeparateTable">
										<xsl:with-param name="RowLetter" select="'b'"/>
										<xsl:with-param name="RowLabel" select="'&quot;P Series&quot; fuels'"/>
										<xsl:with-param name="NonTXRowCount" select="count($IRS4136Data/NontxPSeriesFuels)"/>
										<xsl:with-param name="BusNonTXRowCount" select="count($IRS4136Data/BusNontxPSeriesFuels)"/>
										<xsl:with-param name="NonTXRowDataNode" select="$IRS4136Data/NontxPSeriesFuels"/>
										<xsl:with-param name="BusNonTXRowDataNode" select="$IRS4136Data/BusNontxPSeriesFuels"/>
										<xsl:with-param name="ColBRate" select="'.183'"/>
										<xsl:with-param name="ColDAmt" select="$IRS4136Data/NontxPSeriesFuelsCreditAmt"/>
										<xsl:with-param name="ColECrn" select="420"/>
									</xsl:call-template>
								</tbody>
							</table>
							<br/>
						</div>
					</xsl:if>
					<!-- ============================================================================= -->
					<!--  SRD Row 11c -->
					<!-- ============================================================================= -->
					<xsl:if test="(count($IRS4136Data/NontxCompressedNaturalGas) + count($IRS4136Data/BusNontxCompressedNaturalGas) &gt;1) and ($Print = $Separated)">
						<div style="page-break-inside:avoid;">
							<span class="styRepeatingDataTitle">Form 4136, Line 11 - Nontaxable Use of Alternative Fuel</span>
							<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
								<xsl:call-template name="DepTableThead">
								<xsl:with-param name="ColCHeader" select="'(c) Gallons, or gasoline or diesel gallon equivalents'"/>
								</xsl:call-template>
								<tfoot/>
								<tbody>
									<xsl:call-template name="PopulateSeparateTable">
										<xsl:with-param name="RowLetter" select="'c'"/>
										<xsl:with-param name="RowLabel" select="'Compressed natural gas (CNG)'"/>
										<xsl:with-param name="NonTXRowCount" select="count($IRS4136Data/NontxCompressedNaturalGas)"/>
										<xsl:with-param name="BusNonTXRowCount" select="count($IRS4136Data/BusNontxCompressedNaturalGas)"/>
										<xsl:with-param name="NonTXRowDataNode" select="$IRS4136Data/NontxCompressedNaturalGas"/>
										<xsl:with-param name="BusNonTXRowDataNode" select="$IRS4136Data/BusNontxCompressedNaturalGas"/>
										<xsl:with-param name="ColBRate" select="'.183'"/>
										<xsl:with-param name="ColDAmt" select="$IRS4136Data/NontxCompressedNaturalGasCrAmt"/>
										<xsl:with-param name="ColECrn" select="421"/>
									</xsl:call-template>
								</tbody>
							</table>
							<br/>
						</div>
					</xsl:if>
					<!-- ============================================================================= -->
					<!--  SRD Row 11d -->
					<!-- ============================================================================= -->
					<xsl:if test="(count($IRS4136Data/NontxLiquifiedHydrogen) + count($IRS4136Data/BusNontxLiquifiedHydrogen) &gt;1) and ($Print = $Separated)">
						<div style="page-break-inside:avoid;">
							<span class="styRepeatingDataTitle">Form 4136, Line 11 - Nontaxable Use of Alternative Fuel</span>
							<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
								<xsl:call-template name="DepTableThead">
								<xsl:with-param name="ColCHeader" select="'(c) Gallons, or gasoline or diesel gallon equivalents'"/>
								</xsl:call-template>
								<tfoot/>
								<tbody>
									<xsl:call-template name="PopulateSeparateTable">
										<xsl:with-param name="RowLetter" select="'d'"/>
										<xsl:with-param name="RowLabel" select="'Liquefied hydrogen'"/>
										<xsl:with-param name="NonTXRowCount" select="count($IRS4136Data/NontxLiquifiedHydrogen)"/>
										<xsl:with-param name="BusNonTXRowCount" select="count($IRS4136Data/BusNontxLiquifiedHydrogen)"/>
										<xsl:with-param name="NonTXRowDataNode" select="$IRS4136Data/NontxLiquifiedHydrogen"/>
										<xsl:with-param name="BusNonTXRowDataNode" select="$IRS4136Data/BusNontxLiquifiedHydrogen"/>
										<xsl:with-param name="ColBRate" select="'.183'"/>
										<xsl:with-param name="ColDAmt" select="$IRS4136Data/NontxLiquefiedHydrogenCrAmt"/>
										<xsl:with-param name="ColECrn" select="422"/>
									</xsl:call-template>
								</tbody>
							</table>
							<br/>
						</div>
					</xsl:if>
					<!-- ============================================================================= -->
					<!--  SRD Row 11e -->
					<!-- ============================================================================= -->
					<xsl:if test="(count($IRS4136Data/NontxLiqfdFuelDerivedFromCoal) + count($IRS4136Data/BusNontxLiqfdFuelDerFromCoal) &gt;1) and ($Print = $Separated)">
						<div style="page-break-inside:avoid;">
							<span class="styRepeatingDataTitle">Form 4136, Line 11 - Nontaxable Use of Alternative Fuel</span>
							<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
								<xsl:call-template name="DepTableThead">
								<xsl:with-param name="ColCHeader" select="'(c) Gallons, or gasoline or diesel gallon equivalents'"/>
								</xsl:call-template>
								<tfoot/>
								<tbody>
									<xsl:call-template name="PopulateSeparateTable">
										<xsl:with-param name="RowLetter" select="'e'"/>
										<xsl:with-param name="RowLabel" select="'Fischer&#8211;Tropsch process liquid fuel from coal (including peat)'"/>
										<xsl:with-param name="NonTXRowCount" select="count($IRS4136Data/NontxLiqfdFuelDerivedFromCoal)"/>
										<xsl:with-param name="BusNonTXRowCount" select="count($IRS4136Data/BusNontxLiqfdFuelDerFromCoal)"/>
										<xsl:with-param name="NonTXRowDataNode" select="$IRS4136Data/NontxLiqfdFuelDerivedFromCoal"/>
										<xsl:with-param name="BusNonTXRowDataNode" select="$IRS4136Data/BusNontxLiqfdFuelDerFromCoal"/>
										<xsl:with-param name="ColBRate" select="'.243'"/>
										<xsl:with-param name="ColDAmt" select="$IRS4136Data/NontxLiqfdFuelDerFromCoalCrAmt"/>
										<xsl:with-param name="ColECrn" select="423"/>
									</xsl:call-template>
								</tbody>
							</table>
							<br/>
						</div>
					</xsl:if>
					<!-- ============================================================================= -->
					<!--  SRD Row 11f -->
					<!-- ============================================================================= -->
					<xsl:if test="(count($IRS4136Data/NontaxLiqFuelDerFromBiomass) + count($IRS4136Data/BusNontxLiqFuelDerFromBiomass) &gt;1) and ($Print = $Separated)">
						<div style="page-break-inside:avoid;">
							<span class="styRepeatingDataTitle">Form 4136, Line 11 - Nontaxable Use of Alternative Fuel</span>
							<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
								<xsl:call-template name="DepTableThead">
								<xsl:with-param name="ColCHeader" select="'(c) Gallons, or gasoline or diesel gallon equivalents'"/>
								</xsl:call-template>
								<tfoot/>
								<tbody>
									<xsl:call-template name="PopulateSeparateTable">
										<xsl:with-param name="RowLetter" select="'f'"/>
										<xsl:with-param name="RowLabel" select="'Liquid fuel derived from biomass'"/>
										<xsl:with-param name="NonTXRowCount" select="count($IRS4136Data/NontaxLiqFuelDerFromBiomass)"/>
										<xsl:with-param name="BusNonTXRowCount" select="count($IRS4136Data/BusNontxLiqFuelDerFromBiomass)"/>
										<xsl:with-param name="NonTXRowDataNode" select="$IRS4136Data/NontaxLiqFuelDerFromBiomass"/>
										<xsl:with-param name="BusNonTXRowDataNode" select="$IRS4136Data/BusNontxLiqFuelDerFromBiomass"/>
										<xsl:with-param name="ColBRate" select="'.243'"/>
										<xsl:with-param name="ColDAmt" select="$IRS4136Data/NontxLiqFuelDerBiomassCrAmt"/>
										<xsl:with-param name="ColECrn" select="424"/>
									</xsl:call-template>
								</tbody>
							</table>
							<br/>
						</div>
					</xsl:if>
					<!-- ============================================================================= -->
					<!--  SRD Row 11g -->
					<!-- ============================================================================= -->
					<xsl:if test="(count($IRS4136Data/NontxLiquefiedNaturalGas) + count($IRS4136Data/BusNontxLiquefiedNaturalGas) &gt;1) and ($Print = $Separated)">
						<div style="page-break-inside:avoid;">
							<span class="styRepeatingDataTitle">Form 4136, Line 11 - Nontaxable Use of Alternative Fuel</span>
							<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
								<xsl:call-template name="DepTableThead">
								<xsl:with-param name="ColCHeader" select="'(c) Gallons, or gasoline or diesel gallon equivalents'"/>
								</xsl:call-template>
								<tfoot/>
								<tbody>
									<xsl:call-template name="PopulateSeparateTable">
										<xsl:with-param name="RowLetter" select="'g'"/>
										<xsl:with-param name="RowLabel" select="'Liquefied natural gas (LNG)'"/>
										<xsl:with-param name="NonTXRowCount" select="count($IRS4136Data/NontxLiquefiedNaturalGas)"/>
										<xsl:with-param name="BusNonTXRowCount" select="count($IRS4136Data/BusNontxLiquefiedNaturalGas)"/>
										<xsl:with-param name="NonTXRowDataNode" select="$IRS4136Data/NontxLiquefiedNaturalGas"/>
										<xsl:with-param name="BusNonTXRowDataNode" select="$IRS4136Data/BusNontxLiquefiedNaturalGas"/>
										<xsl:with-param name="ColBRate" select="'.243'"/>
										<xsl:with-param name="ColDAmt" select="$IRS4136Data/NontxLiquefiedNaturalGasCrAmt"/>
										<xsl:with-param name="ColECrn" select="425"/>
									</xsl:call-template>
								</tbody>
							</table>
							<br/>
						</div>
					</xsl:if>
					<!-- ============================================================================= -->
					<!--  SRD Row 11h -->
					<!-- ============================================================================= -->
					<xsl:if test="(count($IRS4136Data/NontaxLiqFuelDerFromBiomass) + count($IRS4136Data/BusNontxLiqFuelDerFromBiomass) &gt;1) and ($Print = $Separated)">
						<div style="page-break-inside:avoid;">
							<span class="styRepeatingDataTitle">Form 4136, Line 11 - Nontaxable Use of Alternative Fuel</span>
							<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
								<xsl:call-template name="DepTableThead">
								<xsl:with-param name="ColCHeader" select="'(c) Gallons, or gasoline or diesel gallon equivalents'"/>
								</xsl:call-template>
								<tfoot/>
								<tbody>
									<xsl:call-template name="PopulateSeparateTable">
										<xsl:with-param name="RowLetter" select="'h'"/>
										<xsl:with-param name="RowLabel" select="'Liquified gas derived from biomass'"/>
										<xsl:with-param name="NonTXRowCount" select="count($IRS4136Data/NontaxLiqFuelDerFromBiomass)"/>
										<xsl:with-param name="BusNonTXRowCount" select="count($IRS4136Data/BusNontxLiqFuelDerFromBiomass)"/>
										<xsl:with-param name="NonTXRowDataNode" select="$IRS4136Data/NontaxLiqFuelDerFromBiomass"/>
										<xsl:with-param name="BusNonTXRowDataNode" select="$IRS4136Data/BusNontxLiqFuelDerFromBiomass"/>
										<xsl:with-param name="ColBRate" select="'.183'"/>
										<xsl:with-param name="ColDAmt" select="$IRS4136Data/NontxLiquefiedGasBiomassCrAmt"/>
										<xsl:with-param name="ColECrn" select="435"/>
									</xsl:call-template>
								</tbody>
							</table>
							<br/>
						</div>
					</xsl:if>
					<!-- ============================================================================= -->
					<!--  SRD Row 14a -->
					<!-- ============================================================================= -->
					<xsl:if test="(count($IRS4136Data/NontxUseDieselWaterEmulsion) + count($IRS4136Data/BusNontxUseDieselWtrEmulsion) &gt;1) and ($Print = $Separated)">
						<div style="page-break-inside:avoid;">
							<span class="styRepeatingDataTitle">Form 4136, Line 14 - Nontaxable Use of Diesel-Water Fuel Emuision</span>
							<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
								<xsl:call-template name="DepTableThead"/>
								<tfoot/>
								<tbody>
									<xsl:call-template name="PopulateSeparateTable">
										<xsl:with-param name="RowLetter" select="'a'"/>
										<xsl:with-param name="RowLabel" select="'Nontaxable use'"/>
										<xsl:with-param name="NonTXRowCount" select="count($IRS4136Data/NontxUseDieselWaterEmulsion)"/>
										<xsl:with-param name="BusNonTXRowCount" select="count($IRS4136Data/BusNontxUseDieselWtrEmulsion)"/>
										<xsl:with-param name="NonTXRowDataNode" select="$IRS4136Data/NontxUseDieselWaterEmulsion"/>
										<xsl:with-param name="BusNonTXRowDataNode" select="$IRS4136Data/BusNontxUseDieselWtrEmulsion"/>
										<xsl:with-param name="ColBRate" select="'.197'"/>
										<xsl:with-param name="ColDAmt" select="$IRS4136Data/NontxUseDieselWtrEmulsionCrAmt"/>
										<xsl:with-param name="ColECrn" select="309"/>
									</xsl:call-template>
								</tbody>
							</table>
							<br/>
						</div>
					</xsl:if>
				</form>
			</body>
		</html>
	</xsl:template>
	<!-- ============================================================================= -->
	<xsl:template name="TableHeaderNoBraces">
		<xsl:param name="ColCHeader"/>
		<thead class="styIRS4136TableThead">
			<tr>
				<th class="styIRS4136LetterCell" scope="col"/>
				<th class="styIRS4136TableCellLine" style="border-bottom-width:0px;" scope="col"/>
				<th class="styIRS4136TableCellA" scope="col" style="vertical-align:top;">
					<b>(a) Type of use</b>
				</th>
				<th class="styIRS4136TableCellB" style="text-align:center;padding-right:0;vertical-align:top;" scope="col">
					<b>(b) Rate</b>
				</th>
				<th class="styIRS4136TableCellC" style="vertical-align:top;" scope="col">
					<b>
						<xsl:choose>
							<xsl:when test="$ColCHeader">
								<xsl:value-of select="$ColCHeader"/>
							</xsl:when>
							<xsl:otherwise>(c) Gallons</xsl:otherwise>
						</xsl:choose>
					</b>
				</th>
				<th class="styIRS4136TableCellD" style="text-align: center;vertical-align:top;" scope="col">
					<b>(d) Amount of credit</b>
				</th>
				<th class="styIRS4136TableCellE" style="vertical-align:top;" scope="col">
					<b>(e) CRN</b>
				</th>
			</tr>
		</thead>
	</xsl:template>
	<!-- ============================================================================= -->
	<xsl:template name="TableHeaderWithBraces">
		<thead class="styIRS4136TableThead">
			<tr>
				<th class="styIRS4136LetterCell" scope="col"/>
				<th class="styIRS4136TableCellLine" style="border-bottom-width:0px" scope="col"/>
				<th class="styIRS4136TableCellA" scope="col">
					<b>(a) Type of use</b>
				</th>
				<th class="styIRS4136TableCellB" style="text-align:center;padding-right:0;" scope="col">
					<b>(b) Rate</b>
				</th>
				<th class="styIRS4136TableCellCwithBraces" style="text-align: center;border-right-width:0;" scope="col">
					<b>(c) Gallons</b>
				</th>
				<th class="styIRS4136Braces" scope="col"/>
				<th class="styIRS4136TableCellD" style="text-align: center;" scope="col">
					<b>(d) Amount of credit</b>
				</th>
				<th class="styIRS4136TableCellE" scope="col">
					<b>(e) CRN</b>
				</th>
			</tr>
		</thead>
	</xsl:template>
	<!-- ============================================================================= -->
	<xsl:template name="NoColATableHeaderNoBraces">
		<xsl:param name="ColCHeader"/>
		<thead class="styIRS4136TableThead">
			<tr>
				<th class="styIRS4136LetterCell" scope="col"/>
				<th class="styIRS4136TableCellLine" style="border-bottom-width:0px;width:98mm;" scope="col"/>
				<th class="styIRS4136TableCellB" style="text-align:center;padding-right:0;vertical-align:top;" scope="col">
					<b>(b) Rate</b>
				</th>
				<th class="styIRS4136TableCellC" style="vertical-align:top;" scope="col">
					<b>
						<xsl:choose>
							<xsl:when test="$ColCHeader">
								<xsl:value-of select="$ColCHeader"/>
							</xsl:when>
							<xsl:otherwise>(c) Gallons</xsl:otherwise>
						</xsl:choose>
					</b>
				</th>
				<th class="styIRS4136TableCellD" style="text-align: center;vertical-align:top;" scope="col">
					<b>(d) Amount of credit</b>
				</th>
				<th class="styIRS4136TableCellE" style="vertical-align:top;" scope="col">
					<b>(e) CRN</b>
				</th>
			</tr>
		</thead>
	</xsl:template>
	<!-- ============================================================================= -->
	<xsl:template name="NoColATableHeaderWithBraces">
		<thead class="styIRS4136TableThead">
			<tr>
				<th class="styIRS4136LetterCell" scope="col"/>
				<th class="styIRS4136TableCellLine" style="border-bottom-width:0px;width:98mm;" scope="col"/>
				<th class="styIRS4136TableCellB" style="text-align:center;padding-right:0;" scope="col">
					<b>(b) Rate</b>
				</th>
				<th class="styIRS4136TableCellCwithBraces" style="text-align: center;border-right-width:0;" scope="col">
					<b>(c) Gallons</b>
				</th>
				<th class="styIRS4136Braces" scope="col"/>
				<th class="styIRS4136TableCellD" style="text-align: center;" scope="col">
					<b>(d) Amount of credit</b>
				</th>
				<th class="styIRS4136TableCellE" scope="col">
					<b>(e) CRN</b>
				</th>
			</tr>
		</thead>
	</xsl:template>
	<!-- ============================================================================= -->
	<xsl:template name="DepTableThead">
		<xsl:param name="ColCHeader"/>
		<thead class="styTableThead">
			<tr class="styDepTblHdr">
				<th class="styDepTblCell" style="width:10mm;height:4mm;border-right-width:0px;" scope="col"/>
				<th class="styDepTblCell" style="width:75mm;border-left-width:0px;" scope="col"/>
				<th class="styDepTblCell" style="width:23mm;" scope="col">
					<b>(a) Type of use</b>
				</th>
				<th class="styDepTblCell" style="width:13mm;" scope="col">
					<b>(b) Rate</b>
				</th>
				<th class="styDepTblCell" style="width:24mm;border-right-width:0px;" scope="col">
					<b>
						<xsl:choose>
							<xsl:when test="$ColCHeader">
								<xsl:value-of select="$ColCHeader"/>
							</xsl:when>
							<xsl:otherwise>(c) Gallons</xsl:otherwise>
						</xsl:choose>
					</b>
				</th>
				<th class="styDepTblCell" style="width:30mm;" scope="col">
					<b>(d) Amount of credit</b>
				</th>
				<th class="styDepTblCell" style="width:12mm;" scope="col">
					<b>(e) CRN</b>
				</th>
			</tr>
		</thead>
	</xsl:template>
	<!-- ============================================================================= -->
	<xsl:template name="PopulateSubRows">
		<xsl:param name="RowLetter"/>
		<xsl:param name="RowLabel"/>
		<xsl:param name="NonTXRowCount"/>
		<xsl:param name="BusNonTXRowCount"/>
		<xsl:param name="NonTXRowDataNode"/>
		<xsl:param name="BusNonTXRowDataNode"/>
		<xsl:param name="ColBRate"/>
		<xsl:param name="ColDAmt"/>
		<xsl:param name="ColECrn"/>
		<xsl:choose>
			<xsl:when test="(($NonTXRowCount + $BusNonTXRowCount) = 0) or ((($NonTXRowCount + $BusNonTXRowCount) &gt; 1) and ($Print = $Separated))">
				<tr>
					<td class="styIRS4136LetterCell">
						<xsl:if test="($RowLetter = 'h')">
							<xsl:attribute name="style">border-bottom:1px solid black;</xsl:attribute>
						</xsl:if>
						<xsl:value-of select="$RowLetter"/>
					</td>
					<td class="styIRS4136TableCellLine" style="vertical-align:top;">
						<xsl:choose>
							<xsl:when test="$RowLabel">
								<xsl:value-of select="$RowLabel"/>
							</xsl:when>
							<xsl:otherwise>	Other nontaxable use (see <b>Caution</b> above line 1)</xsl:otherwise>
						</xsl:choose>
					</td>
					<td class="styIRS4136TableCellA">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
						</xsl:call-template>
					</td>
					<td class="styIRS4136TableCellB">
						<xsl:if test="($RowLetter = 1)">$</xsl:if>
								<xsl:value-of select="$ColBRate"/>
					</td>
					<td class="styIRS4136TableCellC">
						<xsl:choose>
							<xsl:when test="((($NonTXRowCount + $BusNonTXRowCount) &gt; 1) and ($Print = $Separated))">
								<xsl:call-template name="PopulateAdditionalDataTableMessage">
									<xsl:with-param name="TargetNode" select="$ColDAmt"/>
									<xsl:with-param name="ShortMessage" select=" 'true' "/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="GallonsQty"/>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</td>
					<td class="styIRS4136TableCellD">
						<xsl:if test="($RowLetter = 1)">
							<span style="float:left;">$</span>
						</xsl:if>
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$ColDAmt"/>
						</xsl:call-template>
					</td>
					<td class="styIRS4136TableCellE">
						<xsl:value-of select="$ColECrn"/>
					</td>
				</tr>
			</xsl:when>
			<xsl:otherwise>
				<xsl:for-each select="$NonTXRowDataNode">
					<tr>
						<xsl:if test="position()=1">
							<td class="styIRS4136LetterCell" style="vertical-align:top;">
								<xsl:if test="($RowLetter = 8)">
									<xsl:attribute name="style">border-bottom:1px solid black;</xsl:attribute>
								</xsl:if>
								<xsl:attribute name="rowspan"><xsl:value-of select="$NonTXRowCount + $BusNonTXRowCount"/></xsl:attribute>
								<xsl:value-of select="$RowLetter"/>
							</td>
						</xsl:if>
						<xsl:if test="position()=1">
							<td class="styIRS4136TableCellLine" style="vertical-align:top;">
								<xsl:attribute name="rowspan"><xsl:value-of select="$NonTXRowCount + $BusNonTXRowCount"/></xsl:attribute>
								<xsl:choose>
									<xsl:when test="$RowLabel">
										<xsl:value-of select="$RowLabel"/>
									</xsl:when>
									<xsl:otherwise>	Other nontaxable use (see <b>Caution</b> above line 1)</xsl:otherwise>
								</xsl:choose>
							</td>
						</xsl:if>
						<td class="styIRS4136TableCellA">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
							</xsl:call-template>
						</td>
						<td class="styIRS4136TableCellB">
							<xsl:if test="(position()=1) and ($RowLetter = 1)">$</xsl:if>
								<xsl:value-of select="$ColBRate"/>
						</td>
						<td class="styIRS4136TableCellC">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="GallonsQty"/>
							</xsl:call-template>
						</td>
						<td class="styIRS4136TableCellD" style="border-bottom:0;">
							<xsl:if test="(position()=last()) and ($BusNonTXRowCount = 0)">
								<xsl:attribute name="style">bottom-border-width:1px;</xsl:attribute>
								<xsl:if test="($RowLetter = 1)">
									<span style="float:left;">$</span>
								</xsl:if>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$ColDAmt"/>
								</xsl:call-template>
							</xsl:if>
						</td>
						<td class="styIRS4136TableCellE" style="border-bottom:0;">
							<xsl:if test="(position()=last()) and ($BusNonTXRowCount = 0)">
								<xsl:attribute name="style">bottom-border-width:1px;</xsl:attribute>
								<xsl:value-of select="$ColECrn"/>
							</xsl:if>
						</td>
					</tr>
				</xsl:for-each>
				<xsl:if test="$BusNonTXRowCount &gt; 0">
					<tr>
						<xsl:if test="$NonTXRowCount = 0">
							<td class="styIRS4136LetterCell" style="border-bottom:0;">
								<xsl:if test="($RowLetter = 8)">
									<xsl:attribute name="style">border-bottom:1px solid black;</xsl:attribute>
								</xsl:if>
								<xsl:value-of select="$RowLetter"/>
							</td>
							<td class="styIRS4136TableCellLine" style="vertical-align:top;border-bottom-width:1px;">
								<xsl:value-of select="$RowLabel"/>
							</td>
						</xsl:if>
						<td class="styIRS4136TableCellA">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$BusNonTXRowDataNode/FuelTaxLocalBusCd"/>
							</xsl:call-template>
							<span style="width:1mm"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$BusNonTXRowDataNode/NontaxableUseOfFuelTypeCd"/>
							</xsl:call-template>
						</td>
						<td class="styIRS4136TableCellB">
							<xsl:if test="($NonTXRowCount =0)">$</xsl:if>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$BusNonTXRowDataNode/CreditRt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS4136TableCellC">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$BusNonTXRowDataNode/GallonsQty"/>
							</xsl:call-template>
						</td>
						<td class="styIRS4136TableCellD" style="bottom-border-width:1px;">
							<xsl:if test="($RowLetter = 1)">
								<span style="float:left;">$</span>
							</xsl:if>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$ColDAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRS4136TableCellE" style="bottom-border-width:1px;">
							<xsl:value-of select="$ColECrn"/>
						</td>
					</tr>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- ============================================================================= -->
	<xsl:template name="PopulateSeparateTable">
		<xsl:param name="RowLetter"/>
		<xsl:param name="RowLabel"/>
		<xsl:param name="NonTXRowCount"/>
		<xsl:param name="BusNonTXRowCount"/>
		<xsl:param name="NonTXRowDataNode"/>
		<xsl:param name="BusNonTXRowDataNode"/>
		<xsl:param name="ColBRate"/>
		<xsl:param name="ColDAmt"/>
		<xsl:param name="ColECrn"/>
		<xsl:for-each select="$NonTXRowDataNode">
			<tr>
				<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
				<xsl:if test="position()=1">
					<td class="styIRS4136LetterCell">
						<xsl:attribute name="rowspan"><xsl:value-of select="$NonTXRowCount + $BusNonTXRowCount"/></xsl:attribute>
						<xsl:value-of select="$RowLetter"/>
					</td>
					<td class="styIRS4136TableCellLine" style="vertical-align:top;">
						<xsl:attribute name="rowspan"><xsl:value-of select="$NonTXRowCount + $BusNonTXRowCount"/></xsl:attribute>
						<xsl:choose>
							<xsl:when test="RowLabel">
								<xsl:value-of select="$RowLabel"/>
							</xsl:when>
							<xsl:otherwise>
	Other nontaxable use (see <b>Caution</b> above line 1)
	</xsl:otherwise>
						</xsl:choose>
					</td>
				</xsl:if>
				<td class="styIRS4136TableCellA">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
					</xsl:call-template>
				</td>
				<td class="styIRS4136TableCellB">
					<xsl:if test="position()=1">$</xsl:if>
						<xsl:value-of select="$ColBRate"/>
				</td>
				<td class="styIRS4136TableCellC">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="GallonsQty"/>
					</xsl:call-template>
				</td>
				<xsl:if test="position()=1">
					<td class="styIRS4136TableCellD">
						<xsl:attribute name="rowspan"><xsl:value-of select="$NonTXRowCount + $BusNonTXRowCount"/></xsl:attribute>
						<xsl:if test="$ColDAmt !=''">
							<span style="float:left;">$</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$ColDAmt"/>
							</xsl:call-template>
						</xsl:if>
					</td>
					<td class="styIRS4136TableCellE">
						<xsl:attribute name="rowspan"><xsl:value-of select="$NonTXRowCount + $BusNonTXRowCount"/></xsl:attribute>
						<xsl:if test="$ColECrn = '362'">
							<xsl:attribute name="style">vertical-align:middle;</xsl:attribute>
						</xsl:if>
						<xsl:if test="$ColECrn !=''">
							<xsl:value-of select="$ColECrn"/>
						</xsl:if>
					</td>
				</xsl:if>
			</tr>
		</xsl:for-each>
		<xsl:if test="$BusNonTXRowCount &gt;0">
			<tr>
				<xsl:attribute name="class"><xsl:choose><xsl:when test="($NonTXRowCount + $BusNonTXRowCount) mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
				<td class="styIRS4136TableCellA">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$BusNonTXRowDataNode/FuelTaxLocalBusCd"/>
					</xsl:call-template>
					<span style="width:1mm"/>
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$BusNonTXRowDataNode/NontaxableUseOfFuelTypeCd"/>
					</xsl:call-template>
				</td>
				<td class="styIRS4136TableCellB">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$BusNonTXRowDataNode/CreditRt"/>
					</xsl:call-template>
				</td>
				<td class="styIRS4136TableCellC">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$BusNonTXRowDataNode/GallonsQty"/>
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
