<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="DependencyData" select="$RtnDoc/OthClStockMeetRegTradTestSch"/>
	<!--HINTS - Display name is Other Class of Stock Meeting Regularly Traded Test Schedule - 1120F Schedule S -->
	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName">
			<xsl:with-param name="TargetNode" select="$DependencyData"/>
		</xsl:call-template>
	</xsl:param>
	<xsl:template name="OthClStockMeetRegTradTestSchTemp">
		<table id="GeneralDependencyTbl" class="styDepTblLandscape" style="font-size: 8pt" cellspacing="0">
			<tr class="styDepTblHdr">
				<th class="styDepTblCell" style="width:59mm;text-align:center;vertical-align:middle;" scope="col">Description of Each Class of Stock</th>
				<th class="styDepTblCell" style="width:22mm;text-align:center;vertical-align:middle;" scope="col">Days During The Tax Year in Which The Stock Was Closely Held</th>
				<th class="styDepTblCell" style="width:32mm;text-align:center;vertical-align:middle;" scope="col">Total Percentage of The Vote and Value of The Class of Stock That Is Owned By 5% Shareholders</th>
				<th class="styDepTblCell" style="width:32mm;text-align:center;vertical-align:middle;" scope="col">Total Number of Qualified Shareholders</th>
				<th class="styDepTblCell" style="width:16mm;text-align:center;vertical-align:middle;" scope="col">Country Code</th>
				<th class="styDepTblCell" style="width:36mm;text-align:center;vertical-align:middle;" scope="col">Percentage</th>
				<th class="styDepTblCell" style="width:22mm;text-align:center;vertical-align:middle;" scope="col">Days Shareholders Owned, Directly or Indirectly, Shares of Stock</th>
			</tr>
			<tfoot/>
			<tbody>
				<xsl:for-each select="$DependencyData/OtherClassStockInformationGrp">
					<tr>
						<!--Set row alternate background color -->
						<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
						<!--Column 1 - Description Of Each Class Of Stock -->
						<td class="styDepTblCell" style="width:59mm;text-align:left;vertical-align:middle;font-size:7pt">
							<!--Allow row to expand by column -->
							<xsl:attribute name="rowspan"><xsl:value-of select="count(TotalPctValueSharesOwnedGrp)"/></xsl:attribute>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="StockClassDesc"/>
							</xsl:call-template>
							<span class="styTablecellpad"/>
						</td>
						<!--Column 2 - Days During The Tax Year In Which The Stock Was Closely Held -->
						<td class="styDepTblCell" style="width:22mm;text-align:right;vertical-align:middle;font-size:7pt">
							<!--Allow row to expand by column -->
							<xsl:attribute name="rowspan"><xsl:value-of select="count(TotalPctValueSharesOwnedGrp)"/></xsl:attribute>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="DaysStockCloselyHeldCnt"/>
							</xsl:call-template>
							<span class="styTablecellpad"/>
						</td>
						<!--Column 3 - Total Percentage Of The Vote And Value Of The Class of Stock That Is Owned by 5% Shareholders -->
						<td class="styDepTblCell" style="width:32mm;text-align:right;vertical-align:middle;font-size:7pt">
							<!--Allow row to expand by column -->
							<xsl:attribute name="rowspan"><xsl:value-of select="count(TotalPctValueSharesOwnedGrp)"/></xsl:attribute>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="TotalPctAndValueStockOwnedRt"/>
							</xsl:call-template>
							<span class="styTablecellpad"/>
						</td>
						<!--Column 4 -  Total Number Of Qualified Shareholders -->
						<td class="styDepTblCell" style="width:32mm;text-align:left;vertical-align:middle;font-size:7pt">
							<!--Allow row to expand by column -->
							<xsl:attribute name="rowspan"><xsl:value-of select="count(TotalPctValueSharesOwnedGrp)"/></xsl:attribute>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="TotalQualifiedShareholdersCnt"/>
							</xsl:call-template>
							<span class="styTablecellpad"/>
						</td>
						<!--TEST 1-->
						<xsl:if test="count(TotalPctValueSharesOwnedGrp)=0 or count(TotalPctValueSharesOwnedGrp)=1">
							<!--Begin repeated within row for Column 5 and 6 -->
							<!--Column 5 - Country Code -->
							<td class="styDepTblCell" style="width:16mm;text-align:center;font-size:7pt">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="TotalPctValueSharesOwnedGrp/CountryOfOperationCd"/>
								</xsl:call-template>
								<span class="styTablecellpad"/>
							</td>
							<!--Column 6 - Percentage -->
							<td class="styDepTblCell" style="width:36mm;text-align:right;font-size:7pt">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="TotalPctValueSharesOwnedGrp/Pct"/>
								</xsl:call-template>
								<span class="styTablecellpad"/>
							</td>
							<!-- End repeated within row for Column 5 and 6 -->
						</xsl:if>
						<!--TEST 2-->
						<xsl:if test="count(TotalPctValueSharesOwnedGrp)&gt;1">
							<!--Begin repeated within row for Column 5 and 6 -->
							<!--Column 5 - Country Code -->
							<td class="styDepTblCell" style="width:16mm;text-align:center;font-size:7pt">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="TotalPctValueSharesOwnedGrp/CountryOfOperationCd"/>
								</xsl:call-template>
								<span class="styTablecellpad"/>
							</td>
							<!--Column 6 - Percentage -->
							<td class="styDepTblCell" style="width:36mm;text-align:right;font-size:7pt">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="TotalPctValueSharesOwnedGrp/Pct"/>
								</xsl:call-template>
								<span class="styTablecellpad"/>
							</td>
							<!-- End repeated within row for Column 5 and 6 -->
						</xsl:if>
						<!--Column 7 - Days shareholders owned, directly or indirectly, shares of stock -->
						<td class="styDepTblCell" style="width:22mm;text-align:right;vertical-align:middle;font-size:7pt">
							<!--Allow row to expand by column-->
							<xsl:attribute name="rowspan"><xsl:value-of select="count(TotalPctValueSharesOwnedGrp)"/></xsl:attribute>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="DaysShareholdersOwnedStockCnt"/>
							</xsl:call-template>
							<span class="styTablecellpad"/>
						</td>
					</tr>
					<xsl:for-each select="TotalPctValueSharesOwnedGrp">
						<xsl:if test="position() &gt;1">
							<tr>
								<!--Set row alternate background color -->
								<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
								<!--Begin repeated within row for Column 5 and 6 -->
								<!--Column 5 - Country Code -->
								<td class="styDepTblCell" style="width:16mm;text-align:center;font-size:7pt">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="CountryOfOperationCd"/>
									</xsl:call-template>
									<span class="styTablecellpad"/>
								</td>
								<!--Column 6 - Percentage -->
								<td class="styDepTblCell" style="width:36mm;text-align:right;font-size:7pt">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="Pct"/>
									</xsl:call-template>
									<span class="styTablecellpad"/>
								</td>
								<!-- End repeated within row for Column 5 and 6 -->
							</tr>
						</xsl:if>
					</xsl:for-each>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	<!-- Main template -->
	<xsl:template match="/">
		<html>
			<head>
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
				<meta name="Author" content="Dependency Creator v1.0"/>
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
						<span style="width:158mm;">
							<xsl:value-of select="$depDocTitle"/>
						</span>
					</span>
				</div>
				<!--Add space after the header line
        <div class="styTopSectionLine">
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$DependencyData"/>
          </xsl:call-template>
        </div>-->
				<xsl:call-template name="PopulateDepCommonLeftoverLandscape">
					<xsl:with-param name="TargetNode" select="$DependencyData"/>
					<xsl:with-param name="NoGap" select="'true'"/>
				</xsl:call-template>
				<xsl:call-template name="OthClStockMeetRegTradTestSchTemp"/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
