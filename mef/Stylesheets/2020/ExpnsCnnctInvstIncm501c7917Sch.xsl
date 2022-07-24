<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" /> 

	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>

	<xsl:param name="DependencyData" select="$RtnDoc/ExpnsCnnctInvstIncm501c7917Sch" />

	<xsl:template name="ShowDependencyData">
		<!-- Add stylesheet dependency code here -->
		<div class="styStdDiv" style="font-weight:bold;padding-top:2mm;font-size:8pt;">
			Expenses Directly Connected to Investment Income of 501(c)(7)(9) or (19)
		</div>
		<table id="INOLDTbl" class="styDepTbl" style="font-size:6pt;">
			<thead class="styTableThead">
				<tr class="styDepTblHdr">           
					<th class="styDepTblCell" scope="col" style="width:30mm;">Investment income line number from Schedule A</th>
					<th class="styDepTblCell" scope="col" style="width:33mm;">Investment income description</th>
					<th class="styDepTblCell" scope="col" style="width:33mm;">Expense Descriptions</th>
					<th class="styDepTblCell" scope="col" style="width:25mm;">Expense Amounts</th>
					<th class="styDepTblCell" scope="col" style="width:25mm;">Investment total amount</th>
					<th class="styDepTblCell" scope="col" style="width:16mm;">Percent allocable to investment</th>
					<th class="styDepTblCell" scope="col" style="width:25mm;">Expenses directly connected to investment income</th>
				</tr>
			</thead>
			<tbody>
				<xsl:for-each select="$DependencyData/ExpnsCnnctInvstIncm501c7917Grp">
					<xsl:variable name="spanCount">
						<xsl:choose>
							<xsl:when test="count(ExpenseDescriptionGrp) = 0"><xsl:value-of select="1"/></xsl:when>
							<xsl:otherwise><xsl:value-of select="count(ExpenseDescriptionGrp)"/></xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="pos" select="position()"/>
					<tr>
						<xsl:attribute name="class">
							<xsl:choose>
								<xsl:when test="$pos mod 2 = 1">styDepTblRow1</xsl:when>
								<xsl:otherwise>styDepTblRow2</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
						<td class="styDepTblCell" style="text-align:left;">
							<xsl:attribute name="rowSpan"><xsl:value-of select="$spanCount"/></xsl:attribute>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="LineNum"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:left;">
							<xsl:attribute name="rowSpan"><xsl:value-of select="$spanCount"/></xsl:attribute>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="InvestmentIncomeDesc"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="ExpenseDescriptionGrp[1]/Desc"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="ExpenseDescriptionGrp[1]/Amt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:right;">
							<xsl:attribute name="rowSpan"><xsl:value-of select="$spanCount"/></xsl:attribute>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="TotalInvestmentAmt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:right;">
							<xsl:attribute name="rowSpan"><xsl:value-of select="$spanCount"/></xsl:attribute>
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="AllocableInvestmentPct"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:right;">
							<xsl:attribute name="rowSpan"><xsl:value-of select="$spanCount"/></xsl:attribute>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="ExpenseInvestmentIncomeAmt"/>
							</xsl:call-template>
						</td>
					</tr>
					<xsl:for-each select="ExpenseDescriptionGrp[position() &gt; 1]">
						<tr>
							<xsl:attribute name="class">
								<xsl:choose>
									<xsl:when test="$pos mod 2 = 1">styDepTblRow1</xsl:when>
									<xsl:otherwise>styDepTblRow2</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
							<td class="styDepTblCell" style="text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="Desc"/>
								</xsl:call-template>
							</td>
							<td class="styDepTblCell" style="text-align:right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="Amt"/>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:for-each>
				</xsl:for-each>
			</tbody>
		</table>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left">
				Total expenses directly connected to investment income:
			</div>
			<div class="styExplanationLine" style="float:left"><br />
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$DependencyData/TotExpenseInvestmentIncomeAmt"/>
				</xsl:call-template>
			</div>
		</div>
	</xsl:template>

	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>
	</xsl:param>

	<!-- Main template -->
	<xsl:template match="/">
		<html>
			<head>
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
					<span class="styDepTitle" style="">
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
