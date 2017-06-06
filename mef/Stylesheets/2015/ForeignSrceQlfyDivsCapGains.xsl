<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
	<xsl:strip-space elements="*"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:param name="DependencyData" select="$RtnDoc/ForeignSrceQlfyDivsCapGains"/>
	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName">
			<xsl:with-param name="TargetNode" select="$DependencyData"/>
		</xsl:call-template>
	</xsl:param>
	<!--   Common - Foreign Source Qualify Dividends Capital Gains Loss   -->
	<xsl:template name="DependencyTemplate">
		<span class="styRepeatingDataTitle">Passive Foreign Source Qualified Dividends</span>
		<table id="DDSTbl" class="styDepTbl">
			<tr class="styDepTblHdr">
				<th class="styDepTblCell" scope="col" style="text-align:center;width:119mm;">Explanation of Foreign Source Income</th>
				<th class="styDepTblCell" scope="col" style="text-align:center;width:67mm;">Foreign Source Income Amount</th>
			</tr>
			<xsl:for-each select="$DependencyData/PassiveFrgnSourceQlfyDivGrp">
				<tr>
					<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
					<td class="styDepTblCell" style="text-align:left;width:119mm;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="ShortExplanationTxt"/>
						</xsl:call-template>
					</td>
					<td class="styDepTblCell" style="text-align:right;width:67mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="ForeignSourceIncomeAmt"/>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:for-each>
		</table>
		<br/>
		<span class="styRepeatingDataTitle">Passive Foreign Source Capital Gains (Losses)</span>
		<table id="DDSTbl" class="styDepTbl">
			<tr class="styDepTblHdr">
				<th class="styDepTblCell" scope="col" style="text-align:center;width:119mm;">Explanation of Foreign Source Income</th>
				<th class="styDepTblCell" scope="col" style="text-align:center;width:67mm;">Foreign Source Income Amount</th>
			</tr>
			<xsl:for-each select="$DependencyData/PassiveFrgnSourceCGLsGrp">
				<tr>
					<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
					<td class="styDepTblCell" style="text-align:left;width:119mm;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="ShortExplanationTxt"/>
						</xsl:call-template>
					</td>
					<td class="styDepTblCell" style="text-align:right;width:67mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="ForeignSourceIncomeAmt"/>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:for-each>
		</table>
		<br/>
		<span class="styRepeatingDataTitle">General Foreign Source Qualified Dividends</span>
		<table id="DDSTbl" class="styDepTbl">
			<tr class="styDepTblHdr">
				<th class="styDepTblCell" scope="col" style="text-align:center;width:119mm;">Explanation of Foreign Source Income</th>
				<th class="styDepTblCell" scope="col" style="text-align:center;width:67mm;">Foreign Source Income Amount</th>
			</tr>
			<xsl:for-each select="$DependencyData/GeneralFrgnSourceQlfyDivGrp">
				<tr>
					<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
					<td class="styDepTblCell" style="text-align:left;width:119mm;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="ShortExplanationTxt"/>
						</xsl:call-template>
					</td>
					<td class="styDepTblCell" style="text-align:right;width:67mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="ForeignSourceIncomeAmt"/>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:for-each>
		</table>
		<br/>
		<span class="styRepeatingDataTitle">General Foreign Source Capital Gains (Losses)</span>
		<table id="DDSTbl" class="styDepTbl">
			<tr class="styDepTblHdr">
				<th class="styDepTblCell" scope="col" style="text-align:center;width:119mm;">Explanation of Foreign Source Income</th>
				<th class="styDepTblCell" scope="col" style="text-align:center;width:67mm;">Foreign Source Income Amount</th>
			</tr>
			<xsl:for-each select="$DependencyData/GeneralFrgnSourceCGLsGrp">
				<tr>
					<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
					<td class="styDepTblCell" style="text-align:left;width:119mm;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="ShortExplanationTxt"/>
						</xsl:call-template>
					</td>
					<td class="styDepTblCell" style="text-align:right;width:67mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="ForeignSourceIncomeAmt"/>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:for-each>
		</table>
		<br/>
		<span class="styRepeatingDataTitle">Section 901(j) Foreign Source Qualified Dividends</span>
		<table id="DDSTbl" class="styDepTbl">
			<tr class="styDepTblHdr">
				<th class="styDepTblCell" scope="col" style="text-align:center;width:119mm;">Explanation of Foreign Source Income</th>
				<th class="styDepTblCell" scope="col" style="text-align:center;width:67mm;">Foreign Source Income Amount</th>
			</tr>
			<xsl:for-each select="$DependencyData/Sect901jFrgnSourceQlfyDivGrp">
				<tr>
					<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
					<td class="styDepTblCell" style="text-align:left;width:119mm;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="ShortExplanationTxt"/>
						</xsl:call-template>
					</td>
					<td class="styDepTblCell" style="text-align:right;width:67mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="ForeignSourceIncomeAmt"/>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:for-each>
		</table>
		<br/>
		<span class="styRepeatingDataTitle">Section 901(j) Foreign Source Capital Gains (Losses)</span>
		<table id="DDSTbl" class="styDepTbl">
			<tr class="styDepTblHdr">
				<th class="styDepTblCell" scope="col" style="text-align:center;width:119mm;">Explanation of Foreign Source Income</th>
				<th class="styDepTblCell" scope="col" style="text-align:center;width:67mm;">Foreign Source Income Amount</th>
			</tr>
			<xsl:for-each select="$DependencyData/Sect901jFrgnSourceCGLsGrp">
				<tr>
					<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
					<td class="styDepTblCell" style="text-align:left;width:119mm;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="ShortExplanationTxt"/>
						</xsl:call-template>
					</td>
					<td class="styDepTblCell" style="text-align:right;width:67mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="ForeignSourceIncomeAmt"/>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:for-each>
		</table>
		<br/>
		<span class="styRepeatingDataTitle">Treaty Re-Sourced Foreign Source Qualified Dividends</span>
		<table id="DDSTbl" class="styDepTbl">
			<tr class="styDepTblHdr">
				<th class="styDepTblCell" scope="col" style="text-align:center;width:119mm;">Explanation of Foreign Source Income</th>
				<th class="styDepTblCell" scope="col" style="text-align:center;width:67mm;">Foreign Source Income Amount</th>
			</tr>
			<xsl:for-each select="$DependencyData/TreatyFrgnSourceQlfyDivGrp">
				<tr>
					<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
					<td class="styDepTblCell" style="text-align:left;width:119mm;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="ShortExplanationTxt"/>
						</xsl:call-template>
					</td>
					<td class="styDepTblCell" style="text-align:right;width:67mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="ForeignSourceIncomeAmt"/>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:for-each>
		</table>
		<br/>
		<span class="styRepeatingDataTitle">Treaty Re-Sourced Foreign Source Capital Gains (Losses)</span>
		<table id="DDSTbl" class="styDepTbl">
			<tr class="styDepTblHdr">
				<th class="styDepTblCell" scope="col" style="text-align:center;width:119mm;">Explanation of Foreign Source Income</th>
				<th class="styDepTblCell" scope="col" style="text-align:center;width:67mm;">Foreign Source Income Amount</th>
			</tr>
			<xsl:for-each select="$DependencyData/TreatyFrgnSourceCGLsGrp">
				<tr>
					<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
					<td class="styDepTblCell" style="text-align:left;width:119mm;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="ShortExplanationTxt"/>
						</xsl:call-template>
					</td>
					<td class="styDepTblCell" style="text-align:right;width:67mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="ForeignSourceIncomeAmt"/>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:for-each>
		</table>
		<br/>
		<span class="styRepeatingDataTitle">Lump Sum Distribution Special Averaging Treatment Foreign Source Qualified Dividends</span>
		<table id="DDSTbl" class="styDepTbl">
			<tr class="styDepTblHdr">
				<th class="styDepTblCell" scope="col" style="text-align:center;width:119mm;">Explanation of Foreign Source Income</th>
				<th class="styDepTblCell" scope="col" style="text-align:center;width:67mm;">Foreign Source Income Amount</th>
			</tr>
			<xsl:for-each select="$DependencyData/LumpSumFrgnSourceQlfyDivGrp">
				<tr>
					<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
					<td class="styDepTblCell" style="text-align:left;width:119mm;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="ShortExplanationTxt"/>
						</xsl:call-template>
					</td>
					<td class="styDepTblCell" style="text-align:right;width:67mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="ForeignSourceIncomeAmt"/>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:for-each>
		</table>
		<br/>
		<span class="styRepeatingDataTitle">Lump Sum Distribution Special Averaging Treatment Foreign Source Capital Gains (Losses)</span>
		<table id="DDSTbl" class="styDepTbl">
			<tr class="styDepTblHdr">
				<th class="styDepTblCell" scope="col" style="text-align:center;width:119mm;">Explanation of Foreign Source Income</th>
				<th class="styDepTblCell" scope="col" style="text-align:center;width:67mm;">Foreign Source Income Amount</th>
			</tr>
			<xsl:for-each select="$DependencyData/LumpSumFrgnSourceCGLsGrp">
				<tr>
					<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
					<td class="styDepTblCell" style="text-align:left;width:119mm;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="ShortExplanationTxt"/>
						</xsl:call-template>
					</td>
					<td class="styDepTblCell" style="text-align:right;width:67mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="ForeignSourceIncomeAmt"/>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
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
						<!--Generic CSS Styles are located in the template called below -->
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesDep"/>
			</head>
			<body class="styBodyClass">
				<xsl:call-template name="DocumentHeaderDependency"/>
				<div class="styDepTitleLine">
					<span class="styDepTitle">
						<xsl:value-of select="$depDocTitle"/>&nbsp;            
				   </span>
				</div>
				<!--Adding template for left over data  -->
				<xsl:call-template name="PopulateDepCommonLeftover">
					<xsl:with-param name="TargetNode" select="$DependencyData"/>
				</xsl:call-template>
				<br/>
				<xsl:call-template name="DependencyTemplate"/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>