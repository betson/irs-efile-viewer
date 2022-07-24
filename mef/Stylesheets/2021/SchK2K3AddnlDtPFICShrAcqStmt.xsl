<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" /> 

	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>

	<xsl:param name="DependencyData" select="$RtnDoc/SchK2K3AddnlDtPFICShrAcqStmt" />

	<xsl:template name="ShowDependencyData">
		<!-- Add stylesheet dependency code here -->
		<!--Added Header Elements start here-->
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left">
				<br></br>
				Partnership or Corporation EIN:
			</div>
			<div class="styExplanationLine" style="float:left"><br />
			<xsl:choose>
				<xsl:when test="$DependencyData/PartnershipEIN">
					<xsl:call-template name="PopulateEIN">
						<xsl:with-param name="TargetNode" select="$DependencyData/PartnershipEIN"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="PopulateEIN">
						<xsl:with-param name="TargetNode" select="$DependencyData/CorporationEIN"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
				
			</div>
		</div>
		
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left">
				Name of Partnership or Corporation:
			</div>
			<div class="styExplanationLine" style="float:left"><br />
				<xsl:choose>
					<xsl:when test="$DependencyData/PartnershipName">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/PartnershipName/BusinessNameLine1Txt"/>
						</xsl:call-template>
						<xsl:if test="$DependencyData/PartnershipName/BusinessNameLine2Txt">
							<br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$DependencyData/PartnershipName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						</xsl:if>
					</xsl:when>
					
					<xsl:otherwise>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/CorporationName/BusinessNameLine1Txt"/>
						</xsl:call-template>
						<xsl:if test="$DependencyData/CorporationName/BusinessNameLine2Txt">
							<br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$DependencyData/CorporationName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						</xsl:if>
					</xsl:otherwise>
				</xsl:choose>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left">
				<br></br>
				Partner or Shareholder TIN:
			</div>
			<div class="styExplanationLine" style="float:left"><br />
				<xsl:choose>
					<xsl:when test="$DependencyData/PartnerEIN">
							<xsl:call-template name="PopulateEIN">
								<xsl:with-param name="TargetNode" select="$DependencyData/PartnerEIN"/>
							</xsl:call-template>
					</xsl:when>
					<xsl:when test="$DependencyData/PartnerSSN">
							<xsl:call-template name="PopulateSSN">
								<xsl:with-param name="TargetNode" select="$DependencyData/PartnerSSN"/>
							</xsl:call-template>
					</xsl:when>
					<xsl:when test="$DependencyData/ShareholderEIN">
							<xsl:call-template name="PopulateEIN">
								<xsl:with-param name="TargetNode" select="$DependencyData/ShareholderEIN"/>
							</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateSSN">
								<xsl:with-param name="TargetNode" select="$DependencyData/ShareholderSSN"/>
							</xsl:call-template>
					</xsl:otherwise>
					
				</xsl:choose>
				
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left">
			<br></br>
				Name of Partner or Shareholder:
			</div>
			<div class="styExplanationLine" style="float:left"><br />
				<xsl:choose>
					<xsl:when test="$DependencyData/PartnerName">
							
						<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$DependencyData/PartnerName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$DependencyData/PartnerName/BusinessNameLine2Txt"/>
							</xsl:call-template>
					
					</xsl:when>
					<xsl:when test="$DependencyData/ShareholderName">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$DependencyData/ShareholderName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$DependencyData/ShareholderName/BusinessNameLine2Txt"/>
							</xsl:call-template>
					</xsl:when>
					<xsl:when test="$DependencyData/PartnerPersonNm">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$DependencyData/PartnerPersonNm"/>
							</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$DependencyData/ShareholderPersonNm"/>
							</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
				
				
			</div>
		</div>
		
		<!--End of header--><br />
		<span style="font-weight:bold;font-size:10pt;">Section 1</span><br />
		<table id="INOLDTbl" class="styDepTbl" style="font-size:7pt;">
			<thead class="styTableThead">
			<tr class="styDepTblHdr">
					<th class="styDepTblCell" scope="col" colspan="2" style="width:150mm;">General Information</th>
					<th class="styDepTblCell" scope="col" colspan="1" style="width:37mm;">Annual Information</th>
					
				</tr>
				<tr class="styDepTblHdr">
					<th class="styDepTblCell" scope="col" style="width:90mm;">(a)</th>
					<th class="styDepTblCell" scope="col" style="width:60mm;">(b)</th>
					<th class="styDepTblCell" scope="col" style="width:37mm;">(g)</th>
				</tr>
				<tr class="styDepTblHdr">           
					<th class="styDepTblCell" scope="col" style="width:90mm;">Name of PFIC</th>
					<th class="styDepTblCell" scope="col" style="width:60mm;">EIN or reference ID number</th>
					<th class="styDepTblCell" scope="col" style="width:37mm;">Dates PFIC shares acquired during tax year (if applicable)</th>
					
				</tr>
			</thead>
			<tbody>
				<xsl:for-each select="$DependencyData/PFICShrAcqGeneralInfoGrp">
					<tr>
						<xsl:attribute name="class">
							<xsl:choose>
								<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
								<xsl:otherwise>styDepTblRow2</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
						<td class="styDepTblCell" style="text-align:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="PFICOrQEFName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="PFICOrQEFName/BusinessNameLine2Txt"/>
							</xsl:call-template>	
								
						</td>
						<td class="styDepTblCell" style="text-align:center;word-break:break-all;">
							<xsl:choose>
								<xsl:when test="ForeignEntityIdentificationGrp">
									<xsl:for-each select="ForeignEntityIdentificationGrp">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
									</xsl:call-template>
									<xsl:if test="position() != last()"><br /></xsl:if>
								</xsl:for-each>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="PFICOrQEFEIN"/>
									</xsl:call-template>
								</xsl:otherwise>
								
							</xsl:choose>
							
						
							
						</td>
						<td class="styDepTblCell" style="text-align:center;">
							<xsl:for-each select="SharesAcquiredDt">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
								<br></br>
							</xsl:for-each>
							
						</td>
						
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
		
		<br/>
		<span style="font-weight:bold;font-size:10pt;">Section 2</span><br />
		<table id="INOLDTbl" class="styDepTbl" style="font-size:6pt;width:256mm;">
			<thead class="styTableThead">
			
				<tr class="styDepTblHdr">
					<th class="styDepTblCell" scope="col" colspan="2" style="width:78mm;">General Information</th>
					<th class="styDepTblCell" scope="col" colspan="9" style="width:178mm;">Section 1291 and Other Information</th>
				</tr>
				<tr class="styDepTblHdr">           
					<th class="styDepTblCell" scope="col" style="width:57mm;"><strong>(a)</strong><br />Name of PFIC</th>
					<th class="styDepTblCell" scope="col" style="width:21mm;"><strong>(b)</strong><br />EIN or reference ID number</th>
					<th class="styDepTblCell" scope="col" style="width:16mm;"><strong>(g)</strong><br />Dates PFIC shares were acquired</th>
					<th class="styDepTblCell" scope="col" style="width:22mm;"><strong>(h)</strong><br />Amount of cash and fair market value of property distributed by PFIC during the current tax year (if applicable)</th>
					<th class="styDepTblCell" scope="col" style="width:15mm;"><strong>(i)</strong><br />Dates of distribution</th>
					<th class="styDepTblCell" scope="col" style="width:22mm;"><strong>(j)</strong><br />Total creditable foreign taxes attributable to distribution by PFIC</th>
					<th class="styDepTblCell" scope="col" style="width:22mm;"><strong>(k)</strong><br />Total distributions from PFIC in preceding 3 tax years</th>
					<th class="styDepTblCell" scope="col" style="width:15mm;"><strong>(l)</strong><br />Dates PFIC shares disposed of during tax year (if applicable)</th>
					<th class="styDepTblCell" scope="col" style="width:22mm;"><strong>(m)</strong><br />Amount realized on disposition of PFIC shares</th>
					<th class="styDepTblCell" scope="col" style="width:22mm;"><strong>(n)</strong><br />Tax basis of PFIC shares on date of disposition</th>
					<th class="styDepTblCell" scope="col" style="width:22mm;"><strong>(o)</strong><br />Gain or (loss) on disposition of PFIC shares</th>
				</tr>
			</thead>
			<tbody>
				<xsl:for-each select="$DependencyData/PFICShrAcqAdditionalInfoGrp">
					<xsl:variable name="outerPos" select="position()"/>
					<xsl:for-each select="PFICSharesInformationGrp">
						<tr>
							<xsl:attribute name="class">
								<xsl:choose>
									<xsl:when test="(position()) mod 2 = 1">styDepTblRow1</xsl:when>
									<xsl:otherwise>styDepTblRow2</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
							<xsl:choose>
								<xsl:when test="position() = 1">
									<td class="styDepTblCell" style="text-align:left;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$DependencyData/PFICShrAcqAdditionalInfoGrp[$outerPos]/PFICOrQEFName/BusinessNameLine1Txt"/>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$DependencyData/PFICShrAcqAdditionalInfoGrp[$outerPos]/PFICOrQEFName/BusinessNameLine2Txt"/>
										</xsl:call-template>
									</td>
									<td class="styDepTblCell" style="text-align:center;word-break:break-all;">
										<xsl:choose>
											<xsl:when test="$DependencyData/PFICShrAcqAdditionalInfoGrp[$outerPos]/ForeignEntityIdentificationGrp">
												<xsl:for-each select="$DependencyData/PFICShrAcqAdditionalInfoGrp[$outerPos]/ForeignEntityIdentificationGrp">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
												</xsl:call-template>
												<xsl:if test="position() != last()"><br /></xsl:if>
												</xsl:for-each>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="$DependencyData/PFICShrAcqAdditionalInfoGrp[$outerPos]/PFICOrQEFEIN"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td class="styDepTblCell" style="text-align:center;background-color:darkgrey;">&#160;</td>
									<td class="styDepTblCell" style="text-align:center;background-color:darkgrey;">&#160;</td>
								</xsl:otherwise>
							</xsl:choose>
							<td class="styDepTblCell" style="text-align:center;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="SharesAcquiredDt"/>
								</xsl:call-template>
							</td>
							<td class="styDepTblCell" style="text-align:right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="PFICCashDistributedPropFMVAmt"/>
								</xsl:call-template>
							</td>
							<td class="styDepTblCell" style="text-align:center;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="DistributionDt"/>
								</xsl:call-template>
							</td>
							<td class="styDepTblCell" style="text-align:right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="TotPFICCrdblFrgnTxsDistriAmt"/>
								</xsl:call-template>
							</td>
							<td class="styDepTblCell" style="text-align:right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="TotPFICDistriPrec3TaxYearsAmt"/>
								</xsl:call-template>
							</td>
							<td class="styDepTblCell" style="text-align:center;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="DispositionDt"/>
								</xsl:call-template>
							</td>
							<td class="styDepTblCell" style="text-align:right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="PFICSharesDisposRealizedAmt"/>
								</xsl:call-template>
							</td>
							<td class="styDepTblCell" style="text-align:right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="PFICSharesTaxBasisAmt"/>
								</xsl:call-template>
							</td>
							<td class="styDepTblCell" style="text-align:right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="PFICSharesDisposGainLossAmt"/>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:for-each>
					<xsl:if test="count(PFICSharesInformationGrp) &lt; 1">
						<tr>
							<xsl:attribute name="class">
								<xsl:choose>
									<xsl:when test="(position()) mod 2 = 1">styDepTblRow1</xsl:when>
									<xsl:otherwise>styDepTblRow2</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
							<td class="styDepTblCell" style="text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="PFICOrQEFName/BusinessNameLine1Txt"/>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="PFICOrQEFName/BusinessNameLine2Txt"/>
								</xsl:call-template>
							</td>
							<td class="styDepTblCell" style="text-align:center;word-break:break-all;">
								<xsl:choose>
									<xsl:when test="ForeignEntityIdentificationGrp">
										<xsl:for-each select="ForeignEntityIdentificationGrp">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
										</xsl:call-template>
										<xsl:if test="position() != last()"><br /></xsl:if>
										</xsl:for-each>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="PFICOrQEFEIN"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</td>
							<td class="styDepTblCell" style="text-align:center;">&#160;</td>
							<td class="styDepTblCell" style="text-align:center;">&#160;</td>
							<td class="styDepTblCell" style="text-align:center;">&#160;</td>
							<td class="styDepTblCell" style="text-align:center;">&#160;</td>
							<td class="styDepTblCell" style="text-align:center;">&#160;</td>
							<td class="styDepTblCell" style="text-align:center;">&#160;</td>
							<td class="styDepTblCell" style="text-align:center;">&#160;</td>
							<td class="styDepTblCell" style="text-align:center;">&#160;</td>
							<td class="styDepTblCell" style="text-align:center;">&#160;</td>
						</tr>
					</xsl:if>
				</xsl:for-each>
			</tbody>
		</table>
		
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
					<!--<xsl:if test="not($Print) or $Print=''"> -->
						<xsl:call-template name="AddOnStyle"></xsl:call-template>
					<!-- </xsl:if> -->
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
