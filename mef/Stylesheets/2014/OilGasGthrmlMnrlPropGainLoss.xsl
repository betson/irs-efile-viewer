<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by James Ganzy on 08/28/2012 --><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="DependencyData" select="$RtnDoc/OilGasGthrmlMnrlPropGainLoss"/>
	<!-- Partnership Income (IRS1065ScheduleK1) Dependency - Oil, Gas, And Geothermal Mineral Properties Gain Or Loss -->
	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName">
		  <xsl:with-param name="TargetNode" select="$DependencyData"/>
		</xsl:call-template>
	</xsl:param>
    <!-- Main template -->
    <xsl:template match="/">
		<html>
		  <head>
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
			<meta name="Author" content="Trin Xue"/>
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
				<xsl:call-template name="DocumentHeaderDependencyLandscape"/>
				<div class="styDepTitleLineLandscape">
					<span class="styDepTitle" style="width:150mm;">
						<span style="padding-right:1.5mm;">TY</span>
						<xsl:call-template name="PopulateReturnHeaderTaxYear"/>
						<span style="padding-left:1.5mm;">Oil, Gas, And Geothermal Mineral Properties Gain Or Loss</span>
					</span>    
				</div>
				<xsl:call-template name="PopulateDepCommonLeftoverLandscape">
				  <xsl:with-param name="TargetNode" select="$DependencyData"/>
				</xsl:call-template>
				<table id="ILSTbl" class="styDepTblLandscape" style="font-size: 8pt">
				    <thead class="styTableThead">
						<tr class="styDepTblHdr">
							<th class="styDepTblCell" scope="col" style="text-align:center;">Description Of Property</th>
							<th class="styDepTblCell" scope="col" style="text-align:center;">Amount Realized From Disposition</th>
							<th class="styDepTblCell" scope="col" style="text-align:center;">Adjusted Basis in the Property</th>
							<th class="styDepTblCell" scope="col" style="text-align:center;">Total Intangible Drilling Cost</th>
							<th class="styDepTblCell" scope="col" style="text-align:center;">Development Cost</th>
							<th class="styDepTblCell" scope="col" style="text-align:center;">Total Mining Exploration Costs Expenditures</th>
						</tr>
				    </thead>
				  <tfoot/>
					<tbody>
						<xsl:for-each select="$DependencyData/GeothermalPropertiesInfoGrp">
						  <!-- set row background -->
						  <tr>
							<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
							<!-- Description Of Property (Oil, Gas, Geothermal or Other Mineral Properties) - Column 1-->
							<td class="styDepTblCell" style="width:106mm; text-align:left;">
							  <xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="PropertyDesc"/>
							  </xsl:call-template>
							</td>
							<!-- Partner's Share Of Amount Realized From Disposition - Column 2 -->
							<td class="stydepTblCell" style="width:30mm; text-align:right;padding-top:3mm;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="RealizedFromDisposSharedAmt"/>
							  </xsl:call-template>
							</td>
							<!-- Partner's Share of the Partnership's Adjusted Basis in the Property - Column 3 -->
							<td class="stydepTblCell" style="width:30mm; text-align:right;padding-top:3mm;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="PartnershipsAdjBasisSharedAmt"/>
							  </xsl:call-template>
							</td>
							<!-- Partner's Share of the Total Intangible Drilling Cost - Column 4 -->
							<td class="stydepTblCell" style="width:30mm; text-align:right;padding-top:3mm">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="TotIntngblDrllngCostsSharedAmt"/>
							  </xsl:call-template>
							</td>
							<!-- Partner's Share of the Development Cost - Column 5 -->
							<td class="stydepTblCell" style="width:30mm; text-align:right;padding-top:3mm">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="TotalDevelopmentCostsSharedAmt"/>
							  </xsl:call-template>
							</td>
							<!-- Partner's Share of the Total Mining Exploration Costs (Section 59(e) Expenditures - Column 6 -->
							<td class="stydepTblCell" style="width:30mm; text-align:right;padding-top:3mm">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="TotMiningExplrtnCostSharedAmt"/>
							  </xsl:call-template>
							</td>
						  </tr>
						</xsl:for-each>
					</tbody>
				</table>
			</body>
		   <br/>
		</html>
    </xsl:template>
</xsl:stylesheet>