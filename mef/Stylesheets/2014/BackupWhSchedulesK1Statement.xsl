<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="DependencyData" select="$RtnDoc/BackupWhSchedulesK1Statement"/>
	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName">
			<xsl:with-param name="TargetNode" select="$DependencyData"/>
		</xsl:call-template>
	</xsl:param>
	<xsl:template name="BackupWhSchedulesK1StatementTemp">
		<table id="BackupWhSchedulesK1StatementTemp" class="styDepTblLandscape" style="font-size: 7pt">
			<thead class="styTableThead">
				<tr class="styDepTblHdr">
					<th class="styDepTblCell" scope="col" style="text-align:center">EIN</th>
					<th class="styDepTblCell" scope="col" style="text-align:center">Business Name</th>
					<th class="styDepTblCell" scope="col" style="text-align:center">In Care Of Name</th>
					<th class="styDepTblCell" scope="col" style="text-align:center">Employee address</th>
					<th class="styDepTblCell" scope="col" style="text-align:center">Schedule K-1 Credits Code for backup withholding reporting</th>
					<th class="styDepTblCell" scope="col" style="text-align:center">Amount</th>
					<th class="styDepTblCell" scope="col" style="text-align:center">Description</th>
				</tr>
			</thead>
			<tfoot/>
			<tbody>
				<xsl:for-each select="$DependencyData/BackupWhSchedulesK1StmtGrp">
					<!-- set row background -->
					<tr style="page-break-inside:avoid;">
						<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
						<!--EIN  -->
						<td class="styDepTblCell" style="width:21mm; text-align:center">
							<span style="width:21mm;text-align:center;">
								<xsl:choose>
									<xsl:when test="normalize-space(EIN)">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="EIN"/>
										</xsl:call-template>
										<span style="width: 2px;"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
										</xsl:call-template>
										<span style="width: 2px;"/>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</td>
						<!--Business Name-->
						<td class="styDepTblCell" style="width:45mm; text-align:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						</td>
						<!--In Care of Name-->
						<td class="styDepTblCell" style="width:33mm; text-align:left">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="InCareOfNm"/>
							</xsl:call-template>
						</td>
						<!-- Employee Address -->
						<td class="styDepTblCell" style="text-align:left;">
							<xsl:choose>
								<xsl:when test="USAddress">
									<xsl:call-template name="PopulateUSAddressTemplate">
										<xsl:with-param name="TargetNode" select="USAddress"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateForeignAddressTemplate">
										<xsl:with-param name="TargetNode" select="ForeignAddress"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</td>
						<!-- Schedule K-1 Credits Code for backup withholding reporting -->
						<td class="styDepTblCell" style="width:25mm; text-align:left">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="SchK1CreditsCd"/>
							</xsl:call-template>
						</td>
						<!-- Amount -->
						<td class="styDepTblCell" style="width:30mm; text-align:left">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="Amt"/>
							</xsl:call-template>
						</td>
						<!-- Description -->
						<td class="styDepTblCell" style="width:50mm; text-align:left">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="Desc"/>
							</xsl:call-template>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
      <tr class="styDepTblHdr">
        <td class="styDepTblCell" colspan="6" style="text-align:left; font-weight: bold">Total Amount</td>
        <td class="styDepTblCell" style="text-align:right;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="WhiteFont">true</xsl:with-param>
            <xsl:with-param name="TargetNode" select="$DependencyData/TotalAmt" />
          </xsl:call-template>             
        </td>
      </tr>
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
					<span class="styDepTitle">
						<span style="width:135mm;">
							<xsl:value-of select="$depDocTitle"/>
						</span>
					</span>
				</div>
				<xsl:call-template name="PopulateDepCommonLeftoverLandscape">
					<xsl:with-param name="TargetNode" select="$DependencyData"/>
				</xsl:call-template>
				<xsl:call-template name="BackupWhSchedulesK1StatementTemp"/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
