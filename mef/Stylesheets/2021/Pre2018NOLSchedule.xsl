<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" /> 

	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>

	<xsl:param name="DependencyData" select="$RtnDoc/Pre2018NOLSchedule" />

	<xsl:template name="ShowDependencyData">
		<!-- Add stylesheet dependency code here -->
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left">
				Pre-2018 NOL carried forward from prior year:
			</div>
			<div class="styExplanationLine" style="float:left"><br />
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$DependencyData/NOLCarryoverFromPriorYearAmt"/>
				</xsl:call-template>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left">
				Pre-2018 NOL Included in NOL deduction:
			</div>
			<div class="styExplanationLine" style="float:left"><br />
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$DependencyData/SpcfdYrNOLIncldNOLDedAmt"/>
				</xsl:call-template>
			</div>
		</div>
		<div class="styStdDiv" style="padding-top:1mm;font-weight:bold;padding-bottom:0.5;">
			Pre-2018 NOL Activities Included on Schedule A
		</div>
		<table id="INOLDTbl" class="styDepTbl" style="font-size:7pt;">
			<thead class="styTableThead">
				<tr class="styDepTblHdr">           
					<th class="styDepTblCell" scope="col" style="width:21mm;">Activity code</th>
					<th class="styDepTblCell" scope="col" style="width:30mm;">Post-2017 Carried Over to Subsequent Tax Years</th>
				</tr>
			</thead>
			<tbody>
				<xsl:for-each select="$DependencyData/Pre2018NOLIncldSchANOLGrp">
					<tr>
						<xsl:attribute name="class">
							<xsl:choose>
								<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
								<xsl:otherwise>styDepTblRow2</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
						<td class="styDepTblCell" style="text-align:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="PrincipalBusinessActivityCd"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="ActivityAmt"/>
							</xsl:call-template>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left">
				Total Pre-2018 NOL Activities Included on Schedule A:
			</div>
			<div class="styExplanationLine" style="float:left"><br />
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$DependencyData/TotalSpcfdYrNOLIncldSchANOLAmt"/>
				</xsl:call-template>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left">
				Total Pre-2018 NOLs Applied:
			</div>
			<div class="styExplanationLine" style="float:left">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$DependencyData/TotalSpcfdYrNOLAppliedAmt"/>
				</xsl:call-template>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left">
				Balance remaining after total Pre-2018 applied:
			</div>
			<div class="styExplanationLine" style="float:left"><br />
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$DependencyData/TotalSpcfdYrAppliedBalanceAmt"/>
				</xsl:call-template>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left">
				Pre-2018 NOL Expiring Current Year:
			</div>
			<div class="styExplanationLine" style="float:left"><br />
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$DependencyData/SpcfdYrNOLExpiringCYAmt"/>
				</xsl:call-template>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left">
				Pre-2018 Carried Over to Subsequent Tax Years:
			</div>
			<div class="styExplanationLine" style="float:left"><br />
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$DependencyData/SpcfdYrNOLCyovSubsequentYrAmt"/>
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
