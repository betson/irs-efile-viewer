<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" /> 

	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>

	<xsl:param name="DependencyData" select="$RtnDoc/TxCmptUndCanadaTrtyArtXXVStmt" />

	<xsl:template name="ShowDependencyData">
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left;">Spouse Name:</div>
			<div style="width:440px;font-size:10pt;float:left;">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$DependencyData/SpouseName/PersonFirstNm"/>
				</xsl:call-template>
				<span style="width:12px;"/>
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$DependencyData/SpouseName/PersonLastNm"/>
				</xsl:call-template>
			</div>
		</div>
		<br />
		<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
			<thead>
				<tr class="styDepTblHdr">
					<th class="styDepTblCell" scope="col" style="width:91.5mm;">Filer Worldwide Income Group</th>
					<th class="styDepTblCell" scope="col" style="width:91.5mm;">Amount</th>
				</tr>
			</thead>
			<tbody>
				<xsl:for-each select="$DependencyData/FilerWorldwideIncomeGrp/IncomeTypeAndAmt">
					<tr style="border-color:black;height:4mm;">
						<xsl:attribute name="class">styDepTblRow2</xsl:attribute>
						<td class="styDepTblCell" style="width:91.5mm;text-align:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="Desc"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="width:91.5mm;text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="Amt"/>
							</xsl:call-template>
						</td>
					</tr>
				</xsl:for-each>
				<tr class="styDepTblRow1" style="border-color:black;height:4mm;">
					<td class="styDepTblCell" style="width:91.5mm;font-weight:bold;font-size:8pt;text-align:left;">
						Total Income
					</td>
					<td class="styDepTblCell" style="width:91.5mm;text-align:right;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$DependencyData/FilerWorldwideIncomeGrp/TotalIncomeAmt"/>
						</xsl:call-template>
					</td>
				</tr>
				<xsl:for-each select="$DependencyData/FilerWorldwideIncomeGrp/DeductionsOrCreditsTypeAndAmt">
					<tr style="border-color:black;height:4mm;">
						<xsl:attribute name="class">styDepTblRow2</xsl:attribute>
						<td class="styDepTblCell" style="width:91.5mm;text-align:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="Desc"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="width:91.5mm;text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="Amt"/>
							</xsl:call-template>
						</td>
					</tr>
				</xsl:for-each>
				<tr class="styDepTblRow1" style="border-color:black;height:4mm;">
					<td class="styDepTblCell" style="width:91.5mm;font-weight:bold;font-size:8pt;text-align:left;">
						Total Deduction
					</td>
					<td class="styDepTblCell" style="width:91.5mm;text-align:right;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$DependencyData/FilerWorldwideIncomeGrp/TotalDeductionAmt"/>
						</xsl:call-template>
					</td>
				</tr>
				<tr class="styDepTblRow1" style="border-color:black;height:4mm;">
					<td class="styDepTblCell" style="width:91.5mm;font-weight:bold;font-size:8pt;text-align:left;">
						Total Taxable Income
					</td>
					<td class="styDepTblCell" style="width:91.5mm;text-align:right;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$DependencyData/FilerWorldwideIncomeGrp/TotalTaxableIncomeAmt"/>
						</xsl:call-template>
					</td>
				</tr>
			</tbody>
		</table>
		<br /><br />
		<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
			<thead>
				<tr class="styDepTblHdr">
					<th class="styDepTblCell" scope="col" style="width:91.5mm;">Spouse Worldwide Income Group</th>
					<th class="styDepTblCell" scope="col" style="width:91.5mm;">Amount</th>
				</tr>
			</thead>
			<tbody>
				<xsl:for-each select="$DependencyData/SpouseWorldwideIncomeGrp/IncomeTypeAndAmt">
					<tr style="border-color:black;height:4mm;">
						<xsl:attribute name="class">styDepTblRow2</xsl:attribute>
						<td class="styDepTblCell" style="width:91.5mm;text-align:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="Desc"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="width:91.5mm;text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="Amt"/>
							</xsl:call-template>
						</td>
					</tr>
				</xsl:for-each>
				<tr class="styDepTblRow1" style="border-color:black;height:4mm;">
					<td class="styDepTblCell" style="width:91.5mm;font-weight:bold;font-size:8pt;text-align:left;">
						Total Income
					</td>
					<td class="styDepTblCell" style="width:91.5mm;text-align:right;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$DependencyData/SpouseWorldwideIncomeGrp/TotalIncomeAmt"/>
						</xsl:call-template>
					</td>
				</tr>
				<xsl:for-each select="$DependencyData/SpouseWorldwideIncomeGrp/DeductionsOrCreditsTypeAndAmt">
					<tr style="border-color:black;height:4mm;">
						<xsl:attribute name="class">styDepTblRow2</xsl:attribute>
						<td class="styDepTblCell" style="width:91.5mm;text-align:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="Desc"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="width:91.5mm;text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="Amt"/>
							</xsl:call-template>
						</td>
					</tr>
				</xsl:for-each>
				<tr class="styDepTblRow1" style="border-color:black;height:4mm;">
					<td class="styDepTblCell" style="width:91.5mm;font-weight:bold;font-size:8pt;text-align:left;">
						Total Deduction
					</td>
					<td class="styDepTblCell" style="width:91.5mm;text-align:right;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$DependencyData/SpouseWorldwideIncomeGrp/TotalDeductionAmt"/>
						</xsl:call-template>
					</td>
				</tr>
				<tr class="styDepTblRow1" style="border-color:black;height:4mm;">
					<td class="styDepTblCell" style="width:91.5mm;font-weight:bold;font-size:8pt;text-align:left;">
						Total Taxable Income
					</td>
					<td class="styDepTblCell" style="width:91.5mm;text-align:right;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$DependencyData/SpouseWorldwideIncomeGrp/TotalTaxableIncomeAmt"/>
						</xsl:call-template>
					</td>
				</tr>
			</tbody>
		</table>
		<br />
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left;">Total Filer and Spouse Worldwide Taxable Income Amount:</div>
			<div style="width:440px;font-size:10pt;float:left;"><br /><br />
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$DependencyData/TotFlrSpsWorldwideTxblIncmAmt"/>
				</xsl:call-template>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left;">Additional Explanation:</div>
			<div style="width:440px;font-size:10pt;float:left;">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$DependencyData/AdditionalExplanationTxt"/>
				</xsl:call-template>
			</div>
		</div>
	</xsl:template>

	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>
	</xsl:param>

	<!-- Main template -->
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title><xsl:value-of select="$depDocTitle" /></title>

				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache" />
				<meta http-equiv="Cache-Control" content="no-cache" />
				<meta http-equiv="Expires" content="0" />
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private" />
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
				<meta name="Description" content= "{$depDocTitle}" />

				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
				<xsl:call-template name="InitJS"></xsl:call-template>

				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="AddOnStyle"></xsl:call-template>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesDep"/>
			</head>
			<body class="styBodyClass" >
				<xsl:call-template name="DocumentHeaderDependency"></xsl:call-template>
				<div class="styDepTitleLine">
					<span class="styDepTitle">
						<xsl:value-of select="$depDocTitle" />
					</span>
				</div>
				<!--Adding template for left over data  -->
				<xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>
				<xsl:call-template name="ShowDependencyData" />
				<br/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
