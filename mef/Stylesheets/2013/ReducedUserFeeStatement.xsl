<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:param name="Form3115Deps41Data" select="$RtnDoc/ReducedUserFeeStatement"/>
	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName">
			<xsl:with-param name="TargetNode" select="$Form3115Deps41Data"/>
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
				<meta name="Author" content="Jessica Lee - jesslee@us.ibm.com"/>
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
					<div class="styDepTitle" style="width:85mm">
						<xsl:value-of select="$depDocTitle"/>
						<!--TY 2003 Reduced User Fee Statement-->
					</div>
				</div>
				<xsl:call-template name="PopulateDepCommonLeftover">
					<xsl:with-param name="TargetNode" select="$Form3115Deps41Data"/>
				</xsl:call-template>
				<table class="styDepTbl" style="margin-top:4mm; font-size:8pt; font-family:Verdana">
					<thead class="styTableThead">
						<tr class="styDepTblHdr">
							<th class="styDepTblCell" scope="col">
                 Under Section 15.07 of Rev. Proc. 99-1?
              </th>
							<th class="styDepTblCell" scope="col">
                 Taxpayer Business/Person Name, TIN
              </th>
							<th class="styDepTblCell" scope="col">
                 Amount of User Fee Submitted
              </th>
							<th class="styDepTblCell" scope="col">       
                Member of Consolidated Group Business/Person Name, TIN
              </th>
							<th class="styDepTblCell" scope="col">
                 Section 481(a) Adjustment
               </th>
							<th class="styDepTblCell" scope="col">                 
                Number of Years Present Method Used
              </th>
						</tr>
					</thead>
					<tfoot/>
					<tbody>
						<xsl:for-each select="$Form3115Deps41Data/ReducedUserFeeInfo">
							<tr>
								<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
								<td class="styDepTblCell" style="width:20mm;text-align:middle;">
									<xsl:call-template name="PopulateYesBoxText">
										<xsl:with-param name="TargetNode" select="Section1507RevProc991Ind"/>
									</xsl:call-template>
									<xsl:call-template name="PopulateNoBoxText">
										<xsl:with-param name="TargetNode" select="Section1507RevProc991Ind"/>
									</xsl:call-template>
								</td>
								<td class="styDepTblCell" style="width:40mm;text-align:left;">
									<xsl:choose>
										<xsl:when test="Taxpayer/BusinessName">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="Taxpayer/BusinessName/BusinessNameLine1"/>
											</xsl:call-template>
											<xsl:if test="normalize-space(Taxpayer/BusinessName/BusinessNameLine2)!=''">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="Taxpayer/BusinessName/BusinessNameLine2"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="Taxpayer/PersonNm"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
									<br/>
									<br/>
									<!-- MissingSSNEIN Test Added -->
									<xsl:choose>
										<xsl:when test="Taxpayer/EIN">
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="Taxpayer/EIN"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:when test="Taxpayer/SSN">
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="Taxpayer/SSN"/>
											</xsl:call-template>
											<br/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="Taxpayer/MissingSSNEINReasonCd"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</td>
								<td class="styDepTblCell" style="width:30mm;text-align:right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="UserFeeSubmittedAmt"/>
									</xsl:call-template>
								</td>
								<td class="styDepTblCell" style="width:40mm;text-align:left;">
									<xsl:choose>
										<xsl:when test="MemberOfConsolidatedGrp/BusinessName">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="MemberOfConsolidatedGrp/BusinessName/BusinessNameLine1"/>
											</xsl:call-template>
											<xsl:if test="normalize-space(MemberOfConsolidatedGrp/BusinessName/BusinessNameLine2)!=''">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="MemberOfConsolidatedGrp/BusinessName/BusinessNameLine2"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="MemberOfConsolidatedGrp/PersonNm"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
									<br/>
									<br/>
									<xsl:choose>
										<xsl:when test="MemberOfConsolidatedGrp/EIN">
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="MemberOfConsolidatedGrp/EIN"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:when test="MemberOfConsolidatedGrp/SSN">
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="MemberOfConsolidatedGrp/SSN"/>
											</xsl:call-template>
											<br/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="MemberOfConsolidatedGrp/MissingSSNEINReasonCd"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</td>
								<td class="styDepTblCell" style="width:30mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="Section481aAdjustmentAmt"/>
									</xsl:call-template>
								</td>
								<td class="styDepTblCell" style="width:25mm;">
									<xsl:call-template name="PopulateYear">
										<xsl:with-param name="TargetNode" select="PresentMethodUsedYearCnt"/>
									</xsl:call-template>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
