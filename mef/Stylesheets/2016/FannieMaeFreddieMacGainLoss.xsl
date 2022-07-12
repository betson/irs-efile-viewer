<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by James Ganzy on 09/27/2012 --><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="DependencyData" select="$RtnDoc/FannieMaeFreddieMacGainLoss"/>
	<!-- Partnership Income (IRS1065ScheduleK1) Dependency - Fannie Mae Freddie Mac Gain Loss -->
	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName">
		  <xsl:with-param name="TargetNode" select="$DependencyData"/>
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
			<xsl:call-template name="DocumentHeaderDependency"/>  
			<div class="styDepTitleLine">
			    <span class="styDepTitle">
					<span class="styDepTitle" style="width:120mm;">
						<span style="padding-right:1.5mm;">TY</span>
						<xsl:call-template name="PopulateReturnHeaderTaxYear"/>
						<span style="padding-left:1.5mm;">Fannie Mae Freddie Mac Gain Loss</span>
					</span>    
			    </span>
			</div>
			<xsl:call-template name="PopulateDepCommonLeftover">
				<xsl:with-param name="TargetNode" select="$DependencyData"/>
			</xsl:call-template>
				<table id="ILSTbl" class="styDepTbl" style="font-size: 8pt">
				    <thead class="styTableThead">
						<tr class="styDepTblHdr">
							<th class="styDepTblCell" scope="col" style="text-align:center;">Qualified Preferred Stock of the Fannie Mae and the Freddie Mac</th>
							<th class="styDepTblCell" scope="col" style="text-align:center;">Gain or Loss on the Sale or Exchange</th>
							<th class="styDepTblCell" scope="col" style="text-align:center;">Date Stock was Acquired</th>
							<th class="styDepTblCell" scope="col" style="text-align:center;">Date Stock was Sold or Exchanged</th>
						</tr>
				    </thead>
				  <tfoot/>
					<tbody>
						<xsl:for-each select="$DependencyData/FannieMaeFreddieMacInfoGrp">
						  <!-- set row background -->
						  <tr>
							<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
							<!-- Qualified Preferred Stock of the Fannie Mae and the Freddie Mac - Column 1-->
							<td class="styDepTblCell" style="width:110mm; text-align:left;">
							  <xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="StockTypeDesc"/>
							  </xsl:call-template>
							</td>
							<!-- Gain or Loss on the Sale or Exchange of the Qualified Preferred Stock - Column 2 -->
							<td class="styDepTblCell" style="width:30mm; text-align:right;padding-top:3mm;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="GainOrLossAmt"/>
							  </xsl:call-template>
							</td>
							<!-- Date That the Stock was Acquired by the Partnership - Column 3 -->
							<td class="styDepTblCell" style="width:20mm; text-align:center;padding-top:3mm;">
							  <xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="AcquisitionDt"/>
							  </xsl:call-template>
							</td>
							<!-- Date Stock was Sold or Exchanged by the Partnership - Column 4 -->
							<td class="styDepTblCell" style="width:20mm; text-align:center;padding-top:3mm">
							  <xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="SoldOrExchangeDt"/>
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