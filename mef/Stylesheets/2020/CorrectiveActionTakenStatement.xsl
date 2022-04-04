<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" /> 

	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>

	<xsl:param name="DependencyData" select="$RtnDoc/CorrectiveActionTakenStatement" />

	<xsl:template name="ShowDependencyData">
		<!-- Add stylesheet dependency code here -->
		<xsl:choose>
			<xsl:when test="$DependencyData/CorrectiveActionTakenSchAGrp">
				<xsl:call-template name="PopStandardTable">
					<xsl:with-param name="TargetNode" select="$DependencyData/CorrectiveActionTakenSchAGrp"/>
					<xsl:with-param name="TitleText">Corrections for Schedule A</xsl:with-param>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$DependencyData/CorrectiveActionTakenSchBGrp">
				<xsl:call-template name="PopSchBTable">
					<xsl:with-param name="TargetNode" select="$DependencyData/CorrectiveActionTakenSchBGrp"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$DependencyData/CorrectiveActionTakenSchCGrp">
				<xsl:call-template name="PopStandardTable">
					<xsl:with-param name="TargetNode" select="$DependencyData/CorrectiveActionTakenSchCGrp"/>
					<xsl:with-param name="TitleText">Corrections for Schedule C</xsl:with-param>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$DependencyData/CorrectiveActionTakenSchDGrp">
				<xsl:call-template name="PopStandardTable">
					<xsl:with-param name="TargetNode" select="$DependencyData/CorrectiveActionTakenSchDGrp"/>
					<xsl:with-param name="TitleText">Corrections for Schedule D</xsl:with-param>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$DependencyData/CorrectiveActionTakenSchEGrp">
				<xsl:call-template name="PopStandardTable">
					<xsl:with-param name="TargetNode" select="$DependencyData/CorrectiveActionTakenSchEGrp"/>
					<xsl:with-param name="TitleText">Corrections for Schedule E</xsl:with-param>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$DependencyData/CorrectiveActionTakenSchFGrp">
				<xsl:call-template name="PopStandardTable">
					<xsl:with-param name="TargetNode" select="$DependencyData/CorrectiveActionTakenSchFGrp/CorrectiveActionTakenGrp"/>
					<xsl:with-param name="TitleText">Corrections for Schedule F (2 tables)</xsl:with-param>
				</xsl:call-template>
				<xsl:call-template name="PopSchFTable">
					<xsl:with-param name="TargetNode" select="$DependencyData/CorrectiveActionTakenSchFGrp"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$DependencyData/CorrectiveActionTakenSchIGrp">
				<xsl:call-template name="PopStandardTable">
					<xsl:with-param name="TargetNode" select="$DependencyData/CorrectiveActionTakenSchIGrp"/>
					<xsl:with-param name="TitleText">Corrections for Schedule I</xsl:with-param>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$DependencyData/NoCorrectionMadeGrp">
				<xsl:call-template name="PopNoneTable">
					<xsl:with-param name="TargetNode" select="$DependencyData/NoCorrectionMadeGrp"/>
					<xsl:with-param name="TitleText">No Corrections Made - All Schedules (2 tables)</xsl:with-param>
				</xsl:call-template>
			</xsl:when>
		</xsl:choose>
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
	<xsl:template name="PopStandardTable">
		<xsl:param name="TargetNode" select="/.."/>
		<xsl:param name="TitleText" select="'No data'"/>
		<div style="width:187mm;display:block;padding:1mm;text-align:center;font-weight:bold;font-size:10pt;"><xsl:value-of select="$TitleText"/></div>
		<div style="width:187mm;display:block;">
			<table id="INOLDTbl" class="styDepTbl" style="font-size:7pt;">
				<thead class="styTableThead">
					<tr class="styDepTblHdr">
						<th class="styDepTblCell" scope="col" style="width:5mm;">#</th>
						<th class="styDepTblCell" scope="col" style="width:42mm;">Schedule and Part Reference</th>
						<th class="styDepTblCell" scope="col" style="width:41mm;">Act, Investment, Item, or Transaction Line Number</th>
						<th class="styDepTblCell" scope="col" style="width:42mm;">Act, Investment, Item, or Transaction Line Description</th>
						<th class="styDepTblCell" scope="col" style="width:42mm;">Corrective Action Description</th>
						<th class="styDepTblCell" scope="col" style="width:20mm;">Date of Correction</th>
					</tr>
				</thead>
				<tbody>
					<xsl:for-each select="$TargetNode">
						<tr>
							<xsl:attribute name="class">
								<xsl:choose>
									<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
									<xsl:otherwise>styDepTblRow2</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
							<td class="styDepTblCell" style="text-align:center;"><xsl:value-of select="position()"/></td>
							<td class="styDepTblCell" style="text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="ScheduleAndPartReferenceDesc"/>
								</xsl:call-template>
							</td>
							<td class="styDepTblCell" style="text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="LineNum"/>
								</xsl:call-template>
							</td>
							<td class="styDepTblCell" style="text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="ActOrTransactionDesc"/>
								</xsl:call-template>
							</td>
							<td class="styDepTblCell" style="text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="CorrectiveActionDesc"/>
								</xsl:call-template>
							</td>
							<td class="styDepTblCell" style="text-align:center;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="CorrectionDt"/>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:for-each>
				</tbody>
			</table>
		</div>
	</xsl:template>
	<xsl:template name="PopSchBTable">
		<xsl:param name="TargetNode" select="/.."/>
		<div style="width:187mm;display:block;padding:1mm;text-align:center;font-weight:bold;font-size:10pt;">Corrections for Schedule B</div>
		<div style="width:187mm;display:block;">
			<table id="INOLDTbl" class="styDepTbl" style="font-size:7pt;">
				<thead class="styTableThead">
					<tr class="styDepTblHdr">
						<th class="styDepTblCell" scope="col" style="width:100mm;">Corrective Action Description</th>
						<th class="styDepTblCell" scope="col" style="width:20mm;">Date of Correction</th>
						<th class="styDepTblCell" scope="col" style="width:67mm;">Section 4942(h)(2) election made on Form 990-PF</th>
					</tr>
				</thead>
				<tbody>
					<xsl:for-each select="$TargetNode">
						<tr>
							<xsl:attribute name="class">
								<xsl:choose>
									<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
									<xsl:otherwise>styDepTblRow2</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
							<td class="styDepTblCell" style="text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="CorrectiveActionDesc"/>
								</xsl:call-template>
							</td>
							<td class="styDepTblCell" style="text-align:center;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="CorrectionDt"/>
								</xsl:call-template>
							</td>
							<td class="styDepTblCell" style="text-align:center;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="Section4942h2ElectionInd"/>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:for-each>
				</tbody>
			</table>
		</div>
	</xsl:template>
	<xsl:template name="PopSchFTable">
		<xsl:param name="TargetNode" select="/.."/>
		<div style="width:187mm;display:block;">
			<table id="INOLDTbl2" class="styDepTbl" style="font-size:7pt;">
				<thead class="styTableThead">
					<tr class="styDepTblHdr">
						<th class="styDepTblCell" scope="col" style="width:5mm;">#</th>
						<th class="styDepTblCell" scope="col" style="width:30mm;">Political Expenditure Recovered</th>
						<th class="styDepTblCell" scope="col" style="width:152mm;">Safeguard Implemented to Prevent Future Political Expenditures</th>
					</tr>
				</thead>
				<tbody>
					<xsl:for-each select="$TargetNode">
						<tr>
							<xsl:attribute name="class">
								<xsl:choose>
									<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
									<xsl:otherwise>styDepTblRow2</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
							<td class="styDepTblCell" style="text-align:center;"><xsl:value-of select="position()"/></td>
							<td class="styDepTblCell" style="text-align:right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="PoliticalExpenditureRecoverAmt"/>
								</xsl:call-template>
							</td>
							<td class="styDepTblCell" style="text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="SafegrdPrvtFutPltclExpendDesc"/>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:for-each>
				</tbody>
			</table>
		</div>
	</xsl:template>
	<xsl:template name="PopNoneTable">
		<xsl:param name="TargetNode" select="/.."/>
		<xsl:param name="TitleText" select="'No data'"/>
		<div style="width:187mm;display:block;padding:1mm;text-align:center;font-weight:bold;font-size:10pt;"><xsl:value-of select="$TitleText"/></div>
		<div style="width:187mm;display:block;">
			<table id="INOLDTbl" class="styDepTbl" style="font-size:7pt;">
				<thead class="styTableThead">
					<tr class="styDepTblHdr">
						<th class="styDepTblCell" scope="col" style="width:7mm;">#</th>
						<th class="styDepTblCell" scope="col" style="width:30mm;">Schedule and Part Reference</th>
						<th class="styDepTblCell" scope="col" style="width:30mm;">Act, Investment, Item, or Transaction Line Number</th>
						<th class="styDepTblCell" scope="col" style="width:30mm;">Act, Investment, Item, or Transaction Line Description</th>
						<th class="styDepTblCell" scope="col" style="width:90mm;">Correction Not Made Explanation</th>
					</tr>
				</thead>
				<tbody>
					<xsl:for-each select="$TargetNode">
						<tr>
							<xsl:attribute name="class">
								<xsl:choose>
									<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
									<xsl:otherwise>styDepTblRow2</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
							<td class="styDepTblCell" style="text-align:center;"><xsl:value-of select="position()"/></td>
							<td class="styDepTblCell" style="text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="ScheduleAndPartReferenceDesc"/>
								</xsl:call-template>
							</td>
							<td class="styDepTblCell" style="text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="LineNum"/>
								</xsl:call-template>
							</td>
							<td class="styDepTblCell" style="text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="ActOrTransactionDesc"/>
								</xsl:call-template>
							</td>
							<td class="styDepTblCell" style="text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="NoCorrectionMadeExplnTxt"/>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:for-each>
				</tbody>
			</table>
			</div>
			<div style="width:187mm;display:block;">
			<table id="INOLDTbl2" class="styDepTbl" style="font-size:7pt;">
				<thead class="styTableThead">
					<tr class="styDepTblHdr">
						<th class="styDepTblCell" scope="col" style="width:7mm;">#</th>
						<th class="styDepTblCell" scope="col" style="width:180mm;">Steps Being Taken to Make the Correction</th>
					</tr>
				</thead>
				<tbody>
					<xsl:for-each select="$TargetNode">
						<tr>
							<xsl:attribute name="class">
								<xsl:choose>
									<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
									<xsl:otherwise>styDepTblRow2</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
							<td class="styDepTblCell" style="text-align:center;"><xsl:value-of select="position()"/></td>
							<td class="styDepTblCell" style="text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="CorrectiveActionStepsTakenDesc"/>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:for-each>
				</tbody>
			</table>
		</div>
	</xsl:template>
</xsl:stylesheet>
