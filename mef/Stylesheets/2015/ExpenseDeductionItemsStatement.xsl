<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by James Ganzy on 09/27/2012 --><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="DependencyData" select="$RtnDoc/ExpenseDeductionItemsStatement"/>
	<!-- Partnership Income (IRS1065ScheduleM3) Dependency - Expense/Deduction Items Statement -->
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
			<meta name="ShortExplanationTxt" content="{$depDocTitle}"/>
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
					<span class="styDepTitle" style="width:120mm;">
						<span style="padding-right:1.5mm;">TY</span>
						<xsl:call-template name="PopulateReturnHeaderTaxYear"/>
						<span style="padding-left:1.5mm;">Expense or Deduction Items Statement</span>
					</span>    
				</div>
				<xsl:call-template name="PopulateDepCommonLeftoverLandscape">
				  <xsl:with-param name="TargetNode" select="$DependencyData"/>
				</xsl:call-template>
				<table id="ILSTbl" class="styDepTblLandscape" style="font-size: 8pt">
				    <thead class="styTableThead">
						<tr class="styDepTblHdr">
							<th class="styDepTblCell" scope="col" style="text-align:center;">Description</th>
							<th class="styDepTblCell" scope="col" style="text-align:center;">Expense Per Income Statement</th>
							<th class="styDepTblCell" scope="col" style="text-align:center;">Temporary Difference Amount</th>
							<th class="styDepTblCell" scope="col" style="text-align:center;">Permanent Difference Amount</th>
							<th class="styDepTblCell" scope="col" style="text-align:center;">Deduction Per Tax Return</th>
						</tr>
				    </thead>
				  <tfoot/>
					<tbody>
						<xsl:for-each select="$DependencyData/ExpenseDeductionItemsStmtGrp">
						  <!-- set row background -->
						  <tr>
							<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
							<!-- Description - Column 1-->
							<td class="styDepTblCell" style="width:106mm; text-align:left;">
							  <xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="Desc"/>
							  </xsl:call-template>
							</td>
							<!-- Expense Per Income Statement - Column 2 -->
							<td class="styDepTblCell" style="width:36mm; text-align:right;padding-top:3mm;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="ExpensePerIncomeStmtAmt"/>
							  </xsl:call-template>
							</td>
							<!-- Temporary Difference Amount - Column 3 -->
							<td class="styDepTblCell" style="width:36mm; text-align:right;padding-top:3mm;">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="TemporaryDifferenceAmt"/>
							  </xsl:call-template>
							</td>
							<!-- Permanent Difference Amount - Column 4 -->
							<td class="styDepTblCell" style="width:36mm; text-align:right;padding-top:3mm">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="PermanentDifferenceAmt"/>
							  </xsl:call-template>
							</td>
							<!-- Deduction Per Tax Return - Column 5 -->
							<td class="styDepTblCell" style="width:36mm; text-align:right;padding-top:3mm">
							  <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="DeductionPerTaxReturnAmt"/>
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