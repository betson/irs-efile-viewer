<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">  
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="DependencyData" select="$RtnDoc/PartnershipInterestSchedule"/>
  <!-- Common form displays as - Partnership Interest Schedule -->
  <xsl:param name="depDocTitle">
  <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template> 
  </xsl:param>
  <xsl:template name="PartnershipInterestScheduleTable">
    <table id="PartnershipInterestScheduleTable" class="styDepTblLandscape" style="font-size: 7pt">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
          <th class="styDepTblCell" scope="col" style="text-align:center;width:66mm;">Name</th>
          <th class="styDepTblCell" scope="col" style="text-align:center;width:24mm;">EIN</th>
          <th class="styDepTblCell" scope="col" style="text-align:center;width:20mm;">EOY Profit-Sharing Percentage</th>
          <th class="styDepTblCell" scope="col" style="text-align:center;width:21mm;">EOY Loss-Sharing Percentage</th>
          <th class="styDepTblCell" scope="col" style="text-align:center;width:33mm;">Income (Loss) per Income Statement Amount</th>
          <th class="styDepTblCell" scope="col" style="text-align:center;width:33mm;">Temporary Difference Amount</th>
          <th class="styDepTblCell" scope="col" style="text-align:center;width:33mm;">Permanent Difference Amount</th>
          <th class="styDepTblCell" scope="col" style="text-align:center;width:33mm;">Income (Loss) per Tax Return Amount</th>                                                           
        </tr>
      </thead>
      <tfoot/>
      <tbody>
				<xsl:for-each select="$DependencyData/PartnershipInterestItemGrp">
        <!-- set row background -->
					<tr>
						<xsl:attribute name="class">
							<xsl:choose>
								<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
								<xsl:otherwise>styDepTblRow2</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
						<!-- Name -->
						<td class="styDepTblCell" style="text-align:left;;width:66mm;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1"/>
              </xsl:call-template>            
              <xsl:if test="BusinessName/BusinessNameLine2 != ''">
                <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2"/>
                </xsl:call-template>
              </xsl:if>
            </td>
						<!-- EIN -->
						<td class="styDepTblCell" style="width:24m; text-align:center;padding-top:5mm;">
							<xsl:if test="BusinessName">
								<xsl:call-template name="PopulateEIN">
                  <xsl:with-param name="TargetNode" select="EIN"/>
                </xsl:call-template>
							</xsl:if>
							<xsl:if test="MissingEINReasonCd">
								<xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
                </xsl:call-template>
							</xsl:if>
						</td>
						<!-- EOYProfitSharingPercentage -->
						<td class="styDepTblCell" style="width:20mm;padding-top:5mm;">
							<xsl:call-template name="PopulatePercent">
                <xsl:with-param name="TargetNode" select="EOYProfitSharingPct"/>
              </xsl:call-template>
						</td>      
						<!-- EOYLossSharingPercentage -->
						<td class="styDepTblCell" style="width:21mm;padding-top:5mm;">
							<xsl:call-template name="PopulatePercent">
                <xsl:with-param name="TargetNode" select="EOYLossSharingPct"/>
              </xsl:call-template>
						</td>       
						<!-- IncomeLossPerIncomeStmtAmount -->
						<td class="styDepTblCell" style="width:31mm; text-align:right;padding-top:5mm;">
							<xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="IncomeLossPerIncomeStmtAmt"/>
              </xsl:call-template>
						</td>       
						<!-- TemporaryDifferenceAmount -->
						<td class="styDepTblCell" style="width:31mm; text-align:right;padding-top:5mm;">
							<xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TemporaryDifferenceAmt"/>
              </xsl:call-template>
						</td>       
						<!-- PermanentDifferenceAmount -->
						<td class="styDepTblCell" style="width:31mm; text-align:right;padding-top:5mm;">
							<xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="PermanentDifferenceAmt"/>
              </xsl:call-template>
						</td>       
						<!-- IncomeLossPerTaxReturnAmount -->
						<td class="styDepTblCell" style="width:31mm; text-align:right;padding-top:5mm;">
							<xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="IncomeLossPerTaxReturnAmt"/>
              </xsl:call-template>
						</td>                                                             
					</tr>
				</xsl:for-each>
      </tbody>
    </table>
  </xsl:template>  
  <!-- Main template -->
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <title><xsl:value-of select="$depDocTitle"/></title>
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
      <body class="styBodyClass" style="width:187mm;">
				<xsl:call-template name="DocumentHeaderDependencyLandscape"/>
				 <div class="styDepTitleLine">
				<span class="styDepTitle"  style="padding-right:2mm;">
				<xsl:value-of select="$depDocTitle"/>
				  </span>        
				  </div>
				<xsl:call-template name="PopulateDepCommonLeftoverLandscape"><xsl:with-param name="TargetNode" select="$DependencyData"/>
				</xsl:call-template>              
				<xsl:call-template name="PartnershipInterestScheduleTable"/>    
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>