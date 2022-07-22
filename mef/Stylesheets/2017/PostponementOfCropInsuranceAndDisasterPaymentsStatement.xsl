<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:param name="FormData" select="$RtnDoc/PostponementCropInsDsstrStmt"/>
	<!-- Template to display Destruction or damage of crop(s) info-->
	<xsl:template name="ShowDestructionOrDamageOfCropsInfo">
		<table id="DODOCITbl" class="styDepTbl" style="font-size:7pt;width:187mm;table-layout:fixed;">
			<thead class="styTableThead">
				<tr class="styDepTblHdr">
					<th class="styDepTblCell" scope="col" style="width:20mm;">Date of Destruction or Damage</th>
					<th class="styDepTblCell" scope="col" style="width:85mm;">Cause of Destruction or Damage</th>
					<th class="styDepTblCell" scope="col" style="width:80mm;">Description of Destroyed or Damaged Crop</th>
				</tr>
			</thead>
			<tfoot/>
			<tbody>
				<xsl:for-each select="$FormData/DestructionOrDamageOfCropsInfo">
					<tr>
						<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
						<td class="styDepTblCell" style="text-align:center;width:20mm;">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="DateOfDestructionOrDamage"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:left;width:85mm;padding:0px 0px 0px 0px;">
							<div style="padding:0px 3px 0px 3px;border-width:0px 0px 0px 0px;width:85mm;height:auto;word-wrap:break-word;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="CauseOfDestructionOrDamage"/>
								</xsl:call-template>
							</div>
						</td>
						<td class="styDepTblCell" style="text-align:left;width:80mm;padding:0px 0px 0px 0px;">
							<div style="padding:0px 3px 0px 3px;border-width:0px 0px 0px 0px;width:80mm;height:auto;word-wrap:break-word;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="DescOfDestroyedOrDamagedCrop"/>
								</xsl:call-template>
							</div>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	<!-- Template to display Insurance payments for crop info-->
	<xsl:template name="ShowInsurancePaymentsForCropInfo">
		<table id="IPFCITbl" class="styDepTbl" style="font-size:7pt;width:187mm;table-layout:fixed;">
			<thead class="styTableThead">
				<tr class="styDepTblHdr">
					<th class="styDepTblCell" scope="col" style="width:65mm;">Description of Destroyed or Damaged Crop</th>
					<th class="styDepTblCell" scope="col" style="width:20mm;">Insurance Payment Date</th>
					<th class="styDepTblCell" scope="col" style="width:30mm;">Insurance Payment Amount</th>
					<th class="styDepTblCell" scope="col" style="width:65mm;">Description of Destroyed or Damaged Crop</th>
				</tr>
			</thead>
			<tfoot/>
			<tbody>
				<xsl:for-each select="$FormData/InsurancePaymentsForCropInfo">
					<tr>
						<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
						<td class="styDepTblCell" style="text-align:left;width:65mm;padding:0px 0px 0px 0px;">
							<div style="padding:0px 3px 0px 3px;border-width:0px 0px 0px 0px;width:65mm;height:auto;word-wrap:break-word;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="DescOfDestroyedOrDamagedCrop"/>
								</xsl:call-template>
							</div>
						</td>
						<td class="styDepTblCell" style="text-align:center;width:20mm;">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="InsurancePayment/Date"/>
							</xsl:call-template>
						</td>			
						<td class="styDepTblCell" style="text-align:center;width:30mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="InsurancePayment/Amt"/>
								</xsl:call-template>
						</td>			
						<td class="styDepTblCell" style="text-align:left;width:65mm;padding:0px 0px 0px 0px;">
							<div style="padding:0px 3px 0px 3px;border-width:0px 0px 0px 0px;width:65mm;height:auto;word-wrap:break-word;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="InsuranceCarrierName/BusinessNameLine1Txt"/>
								</xsl:call-template>
								<xsl:if test="InsuranceCarrierName/BusinessNameLine2Txt">
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="InsuranceCarrierName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</xsl:if>
							</div>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
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
					<div class="styDepTitle" style="width:92mm">
						<xsl:value-of select="$depDocTitle"/>
					</div>
				</div>
				<xsl:call-template name="PopulateDepCommonLeftover">
					<xsl:with-param name="TargetNode" select="$FormData"/>
				</xsl:call-template>
				<!-- (Name) ////////////////////////////////////////////////////////////////// -->
				<xsl:if test="$FormData/Name">
					<div class="styTopSectionLine">
						<div class="styTopSectionLineLbl" style="float:left">
							<b>Name: </b>
						</div>
						<div class="styExplanationLine" style="float:left">
							<div style="padding:0px 0px 0px 0px;border-width:0px 0px 0px 0px;width:100%;height:auto;word-wrap:break-word;text-align:left;float">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/Name/BusinessNameLine1Txt"/>
								</xsl:call-template>
								<xsl:if test="$FormData/Name/BusinessNameLine2Txt">
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/Name/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</xsl:if>
							</div>
						</div>
					</div>
				</xsl:if>
				<!-- (Address) ////////////////////////////////////////////////////////////// -->
				<xsl:if test="$FormData/Address">
					<div class="styTopSectionLine">
						<div class="styTopSectionLineLbl" style="float:left">
							<b>Address: </b>
						</div>
						<div class="styExplanationLine" style="float:left">
							<div style="padding:0px 0px 0px 0px;border-width:0px 0px 0px 0px;width:100%;height:auto;word-wrap:break-word;text-align:left;float">
								<xsl:call-template name="PopulateUSAddressTemplate">
									<xsl:with-param name="TargetNode" select="$FormData/Address"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
				</xsl:if>
				<!-- (Sect451dChoiceStatement) /////////////////////////////////// -->
				<xsl:if test="$FormData/Sect451dChoiceStatement">
					<div class="styTopSectionLine">
						<div class="styTopSectionLineLbl" style="float:left">
							<b>Section 451(d) Choice Statement: </b>
						</div>
						<div class="styExplanationLine" style="float:left">
							<div style="padding:0px 0px 0px 0px;border-width:0px 0px 0px 0px;width:100%;height:auto;word-wrap:break-word;text-align:left;float">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/Sect451dChoiceStatement"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
				</xsl:if>
				<!-- (NormalBusPracticeStatement) /////////////////////////////////// -->
				<xsl:if test="$FormData/NormalBusPracticeStatement">
					<div class="styTopSectionLine">
						<div class="styTopSectionLineLbl" style="float:left">
							<b>Normal Bus Practice Statement: </b>
						</div>
						<div class="styExplanationLine" style="float:left">
							<div style="padding:0px 0px 0px 0px;border-width:0px 0px 0px 0px;width:100%;height:auto;word-wrap:break-word;text-align:left;float">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/NormalBusPracticeStatement"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
				</xsl:if>
				<!-- (DestructionOrDamageOfCropsInfo) ///////////////////////////// -->
				<xsl:if test="$FormData/DestructionOrDamageOfCropsInfo">
					<br/>
					<xsl:call-template name="ShowDestructionOrDamageOfCropsInfo"/>
				</xsl:if>
				<!-- (InsurancePaymentsForCropInfo) ///////////////////////////// -->
				<xsl:if test="$FormData/InsurancePaymentsForCropInfo">
					<br/>
					<xsl:call-template name="ShowInsurancePaymentsForCropInfo"/>
				</xsl:if>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
