<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:param name="FormData" select="$RtnDoc/Form8854ComputationStatement"/>
	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName">
			<xsl:with-param name="TargetNode" select="$FormData"/>
		</xsl:call-template>
	</xsl:param>
	<!-- Main template -->
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:value-of select="$depDocTitle"/>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="{$depDocTitle}"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesDep"/>
			</head>
			<body class="styBodyClass">
				<xsl:call-template name="DocumentHeaderDependency"/>
				<div class="styDepTitleLine">
					<div class="styDepTitle" style="">
						<xsl:value-of select="$depDocTitle"/>
					</div>
				</div>
				<xsl:call-template name="PopulateDepCommonLeftover">
					<xsl:with-param name="TargetNode" select="$FormData"/>
				</xsl:call-template>
						<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
						<table class="styDepTbl" cellspacing="0">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="text-align:center;font-size: 7pt; width:40mm;" scope="col">
										Property Description
									</th>
									<th class="styDepTblCell" style="text-align:center;font-size: 7pt; width:26mm;" scope="col">
										Cost Or Other Basis Amount
									</th>
									<th class="styDepTblCell" style="text-align:center;font-size: 7pt; width:26mm;" scope="col">
										Fair Market Value On Day Before Expatriation Amount
									</th>
									<th class="styDepTblCell" style="text-align:center;font-size: 7pt; width:26mm;" scope="col">
										Gain Or Loss Amount
									</th>
									<th class="styDepTblCell" style="text-align:center;font-size: 7pt; width:26mm;" scope="col">
										Exclusion Calculation Amount
									</th>
									<th class="styDepTblCell" style="text-align:center;font-size: 7pt; width:26mm;" scope="col">
										Gain After Allocation Exclusion Amount
									</th>
									<th class="styDepTblCell" style="text-align:center;font-size: 7pt; width:26mm;" scope="col">
										Total Built-In Gain Amount
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$FormData/GainAfterAllocationExclGrp">
									<tr style="border-color:black;vertical-align:top;">
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="width:40mm;font-size: 7pt; text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PropertyDesc"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width:26mm;font-size: 6pt; text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width:26mm;font-size: 6pt; text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="FairMarketValueDayBfrExptrtAmt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width:26mm;font-size: 6pt; text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GainOrLossAmt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width:26mm;font-size: 6pt; text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ExclusionCalculationAmt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width:26mm;font-size: 6pt; text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GainAfterAllocationExclAmt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="width:26mm;font-size: 6pt; text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalBuiltInGainAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
