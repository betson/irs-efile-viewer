<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
  <!ENTITY mdash "&#8212;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl" />
	<xsl:include href="AddHeader.xsl" />
	<xsl:include href="CommonPathRef.xsl" />
	<xsl:include href="AddOnTable.xsl" />
	<xsl:include href="IRS5471ScheduleRStyle.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS5471ScheduleR" />
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge" />
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)" />
					</xsl:call-template>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache" />
				<meta http-equiv="Cache-Control" content="no-cache" />
				<meta http-equiv="Expires" content="0" />
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private" />
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
				<meta name="Description" content="IRS Schedule Q Form 5471" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS5471ScheduleRStyle" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form5471ScheduleR">
					<xsl:call-template name="DocumentHeader" />
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDiv">
						<div class="styFNBox" style="width:30mm;height:18mm;">
							<span class="styFN" style="font-size:9pt;">SCHEDULE R<br />(Form 5471)</span> 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData" />
							</xsl:call-template>
							<br />
							(December 2020)<br />
							<span class="styAgency" style="padding-top:1mm;">
								Department of the Treasury
								<br />
								Internal Revenue Service
							</span>
						</div>
						<div class="styFTBox" style="width:127mm;height:18mm;">
							<span class="styFMT" style="font-size:11pt;padding-top:1mm;">
								Distributions From a Foreign Corporation
							</span>
							<br /><br />
							<span style="font-weight:bold;">
								&#9658;Attach to Form 5471.
							</span>
							<br />
							<span style="font-weight:bold;">
								&#9658;Go to
								<span style="font-style:italic">www.irs.gov/Form5471</span>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:30mm;height:18mm;">
							<div class="styOMB" style="font-size:6pt;border:none;padding-top:8mm;">OMB No. 1545-0123</div>
						</div>
					</div>
					<!-- Filer information section -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styNameBox" style="width:150.2mm;">
							Name of person filing Form 5471 <br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template><br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:36mm;padding-left:1mm;font-weight:normal;">
							<strong>Identifying number</strong> <br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styNameBox" style="width:110.2mm;height:9mm;">
							Name of foreign corporation <br />
							<xsl:choose>
								<xsl:when test="$FormData/PersonNm">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PersonNm"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/BusinessName/BusinessNameLine1Txt"/>
									</xsl:call-template><br />
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/BusinessName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="styNameBox" style="width:30mm;height:9mm;padding-left:2px;">
							EIN (if any) <br />
							<xsl:choose>
								<xsl:when test="$FormData/MissingEINReasonCd">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/MissingEINReasonCd"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:when test="$FormData/SSN">
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$FormData/SSN"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$FormData/EIN"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="styEINBox" style="width:46mm;height:9mm;padding-left:1mm;font-weight:normal;word-wrap:break-all">
							<strong>Reference ID number</strong> (see instructions)<br />
							<xsl:choose>
								<xsl:when test="count($FormData/ForeignEntityIdentificationGrp) &gt; 1">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="TargetNode" select="$FormData/ForeignEntityIdentificationGrp"/>
										<xsl:with-param name="Desc">Entity Information - Foreign Entity Identification</xsl:with-param>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<xsl:variable name="ShouldSep" select="($Print = $Separated) and (count($FormData/DistributionsFromFrgnCorpGrp) &gt; 24)"/>
					<div class="styTableContainerNBB" id="Page1Table">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:10mm;">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:93mm;">
										(a) Description of distribution
									</th>
									<th class="styTableCellHeader" scope="col" style="width:24mm;">
										(b) <br /> Date of distribution
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;">
										(c) Amount of distribution in foreign corporation's functional currency
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;border-right-width:0px;">
										(d) Amount of E&amp;P distribution in foreign corporation's functional currency
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($ShouldSep)">
									<xsl:for-each select="$FormData/DistributionsFromFrgnCorpGrp">
										<tr style="vertical-align:top;">
											<td class="styTableCellAmtInherit" style="font-weight:bold;padding-right:2px;">
												<br />
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RowId"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DistributionDesc"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="DistributionDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DistributionFuncCurAmt"/>
													<xsl:with-param name="MaxSize" select="17"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DistributionFromEPFuncCurAmt"/>
													<xsl:with-param name="MaxSize" select="17"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="(count($FormData/DistributionsFromFrgnCorpGrp) &lt; 24) or $ShouldSep">
									<xsl:call-template name="SchRExtraRows">
										<xsl:with-param name="LineNumber" select="count($FormData/DistributionsFromFrgnCorpGrp) + 1"/>
										<xsl:with-param name="SepMessage" select="$ShouldSep"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;font-weight:bold;">
						For Paperwork Reduction Act Notice, see instructions. 
						<span style="margin-left:15mm;font-weight:normal;">Cat. No. 73415F</span>
						<span style="float:right;">Schedule R (Form 5471) (12-2020)</span>
					</div>
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
						   Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- Reference ID Number -->
					<xsl:if test="(count($FormData/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum) &gt; 1)">
						<br />
						<br />
						<table class="styDepTbl" style="font-size:7pt">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="text-align:left">
										Reference ID number (see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/ForeignEntityIdentificationGrp">
									<tr>
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styDepTblCell" style="text-align:left;">
											<span style="font-size:7pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
												</xsl:call-template>
											</span>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="$ShouldSep">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Distributions from Foreign Corporations</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:10mm;">&nbsp;</th>
									<th class="styDepTblCell" scope="col" style="width:93mm;">
										(a) Description of distribution
									</th>
									<th class="styDepTblCell" scope="col" style="width:24mm;">
										(b) <br /> Date of distribution
									</th>
									<th class="styDepTblCell" scope="col" style="width:30mm;">
										(c) Amount of distribution in foreign corporation's functional currency
									</th>
									<th class="styDepTblCell" scope="col" style="width:30mm;border-right-width:0px;">
										(d) Amount of E&amp;P distribution in foreign corporation's functional currency
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/DistributionsFromFrgnCorpGrp">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellAmtInherit" style="font-weight:bold;padding-right:2px;">
											<br />
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RowId"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit" style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DistributionDesc"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="DistributionDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DistributionFuncCurAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DistributionFromEPFuncCurAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<br/>
				</form>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="SchRExtraRows">
		<xsl:param name="LineNumber"/>
		<xsl:param name="SepMessage" select="false()"/>
		<xsl:param name="MaxLine" select="24"/>
		<tr style="vertical-align:bottom;">
			<td class="styTableCellAmtInherit" style="font-weight:bold;padding-right:2px;">
				<br />
				<xsl:choose>
					<xsl:when test="$SepMessage">1</xsl:when>
					<xsl:otherwise><xsl:value-of select="$LineNumber"/></xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellTextInherit" style="">
				<xsl:choose>
					<xsl:when test="$SepMessage">
						See Additional Data Table
					</xsl:when>
					<xsl:otherwise>&nbsp;</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellCtrInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:choose>
			<xsl:when test="$SepMessage">
				<xsl:call-template name="SchRExtraRows">
					<xsl:with-param name="LineNumber" select="2"/>
					<xsl:with-param name="SepMessage" select="false()"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$LineNumber &lt; $MaxLine">
				<xsl:call-template name="SchRExtraRows">
				<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
