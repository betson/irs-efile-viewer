<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" /> 

	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>

	<xsl:param name="DependencyData" select="$RtnDoc/PropertyIncmTreatECIStmt" />

	<xsl:template name="ShowDependencyData">
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left;">Making the Choice Code:</div>
			<div style="width:440px;font-size:10pt;float:left;">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$DependencyData/MakeChoiceCd"/>
				</xsl:call-template>
			</div>
		</div>
		<xsl:for-each select="$DependencyData/PropertyIncmTreatECIGrp">
		<br />
		<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
			<thead>
				<tr class="styDepTblHdr">
					<th class="styDepTblCell" scope="col" style="width:68mm;">Property Income Treated as ECI group <xsl:value-of select="position()"/></th>
					<th class="styDepTblCell" scope="col" style="width:92mm;">Description / Amount</th>
				</tr>
			</thead>
			<tbody>
				<tr style="border-color:black;height:4mm;">
					<xsl:attribute name="class">styDepTblRow2</xsl:attribute>
					<td class="styDepTblCell" style="width:68mm;font-weight:bold;font-size:8pt;text-align:left;">
						IRC Section 871(d) OR Tax Treaty
					</td>
					<td class="styDepTblCell" style="width:92mm;font-size:7pt;text-align:left;">
						<xsl:choose>
							<xsl:when test="IRCSection871dCd">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="IRCSection871dCd"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="TaxTreatyTxt"/>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
				<tr class="styDepTblRow1" style="border-color:black;height:4mm;">
					<td class="styDepTblCell" style="width:68mm;font-weight:bold;font-size:8pt;text-align:left;">
						Real Property or Interest in the United States
					</td>
					<td class="styDepTblCell" style="width:92mm;font-size:7pt;text-align:left;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="PropertyDesc"/>
						</xsl:call-template>
					</td>
				</tr>
				<tr style="border-color:black;height:4mm;">
					<xsl:attribute name="class">styDepTblRow2</xsl:attribute>
					<td class="styDepTblCell" style="width:68mm;font-weight:bold;font-size:8pt;text-align:left;">
						Extent Of Ownership Of Property
					</td>
					<td class="styDepTblCell" style="width:92mm;font-size:7pt;text-align:left;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="ExtentOwnershipPropDesc"/>
						</xsl:call-template>
					</td>
				</tr>
				<tr class="styDepTblRow1" style="border-color:black;height:4mm;">
					<td class="styDepTblCell" style="width:68mm;font-weight:bold;font-size:8pt;text-align:left;">
						Location Of Property
					</td>
					<td class="styDepTblCell" style="width:92mm;font-size:7pt;text-align:left;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="PropertyLocationTxt"/>
						</xsl:call-template>
					</td>
				</tr>
				<tr style="border-color:black;height:4mm;">
					<xsl:attribute name="class">styDepTblRow2</xsl:attribute>
					<td class="styDepTblCell" style="width:68mm;font-weight:bold;font-size:8pt;text-align:left;">
						Improvements to Property Description
					</td>
					<td class="styDepTblCell" style="width:92mm;font-size:7pt;text-align:left;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="PropertyImprovementDesc"/>
						</xsl:call-template>
					</td>
				</tr>
				<tr class="styDepTblRow1" style="border-color:black;height:4mm;">
					<td class="styDepTblCell" style="width:68mm;font-weight:bold;font-size:8pt;text-align:left;">
						Property Ownership Dates
					</td>
					<td class="styDepTblCell" style="width:92mm;font-size:7pt;text-align:left;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="PropertyOwnershipDateDesc"/>
						</xsl:call-template>
					</td>
				</tr>
				<tr style="border-color:black;height:4mm;">
					<xsl:attribute name="class">styDepTblRow2</xsl:attribute>
					<td class="styDepTblCell" style="width:68mm;font-weight:bold;font-size:8pt;text-align:left;">
						Income from Property
					</td>
					<td class="styDepTblCell" style="width:92mm;font-size:7pt;text-align:right;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="IncomeAmt"/>
						</xsl:call-template>
					</td>
				</tr>
				<tr class="styDepTblRow1" style="border-color:black;height:4mm;">
					<td class="styDepTblCell" style="width:68mm;font-weight:bold;font-size:8pt;text-align:left;">
						Previous Choices and Revocations
					</td>
					<td class="styDepTblCell" style="width:92mm;font-size:7pt;text-align:left;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="TxblYrRevocationOrElectionDesc"/>
						</xsl:call-template>
					</td>
				</tr>
				<tr style="border-color:black;height:4mm;">
					<xsl:attribute name="class">styDepTblRow2</xsl:attribute>
					<td class="styDepTblCell" style="width:68mm;font-weight:bold;font-size:8pt;text-align:left;">
						Additional Explanation
					</td>
					<td class="styDepTblCell" style="width:92mm;font-size:7pt;text-align:left;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="AdditionalExplanationTxt"/>
						</xsl:call-template>
					</td>
				</tr>
			</tbody>
		</table>
		</xsl:for-each>
		<br />
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left;">Income From Property Total:</div>
			<div style="width:440px;font-size:10pt;float:left;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$DependencyData/TotalIncomeAmt"/>
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
