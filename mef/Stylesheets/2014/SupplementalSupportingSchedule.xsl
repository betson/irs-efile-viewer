<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:param name="DependencyData" select="$RtnDoc/SupplementalSupportingSchedule"/>
  <!-- 1120 Common - Supplemental Supporting Schedule -->
  <!-- Main template begin -->
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName">
    		<xsl:with-param name="TargetNode" select="$DependencyData"/>
    </xsl:call-template>  
  </xsl:param>
  <!-- Main template end-->
  <xsl:template match="/">
    <html>
      <head>
        <title><xsl:value-of select="$depDocTitle"/></title>
        <!-- No Browser Caching -->
        <meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Cache-Control" content="no-cache"/>
        <meta http-equiv="Expires" content="0"/>
        <!-- No Proxy Caching -->
        <meta http-equiv="Cache-Control" content="private"/>
        <!-- Define Character Set -->
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>        
        <meta name="Description" content="{$depDocTitle}"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
        </style>
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
          <span class="styDepTitle">
            <span style="width:100mm;"><xsl:value-of select="$depDocTitle"/></span>
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>
					<div class="styTopSectionLine" style="width:187mm;">
						<div style="float:left;clear:none;"><span class="styTopSectionLineLbl">Name:</span></div>
						<div style="float:left;clear:none;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$DependencyData/BusinessName/BusinessNameLine1"/>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateText">          
								<xsl:with-param name="TargetNode" select="$DependencyData/BusinessName/BusinessNameLine2"/>
							</xsl:call-template>
						</div>
					</div>
					 <div class="styTopSectionLine" style="width:187mm;">
						<div style="float:left;clear:none;"><span class="styTopSectionLineLbl">EIN:</span></div>
						<div style="float:left;clear:none;">
							<xsl:choose>
                <xsl:when test="$DependencyData/EIN">
                  <xsl:call-template name="PopulateEIN">
                    <xsl:with-param name="TargetNode" select="$DependencyData/EIN"/>
                  </xsl:call-template>
								</xsl:when>
							  <xsl:otherwise>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$DependencyData/MissingEINReasonCd"/>
                  </xsl:call-template>
                </xsl:otherwise>
							</xsl:choose>
          </div>
        </div>
				<div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;"><span class="styTopSectionLineLbl">Line Number:</span></div>
          <div style="float:left;clear:none;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/LineNum"/>
            </xsl:call-template>
          </div>
        </div>
				<!--table begin -->      
    	   <table id="ExplanationAndAmountTbl" class="styDepTbl">
        	<thead class="styTableThead">
        		<tr class="styDepTblHdr">
           		<th class="styDepTblCell" scope="col" style="width:150mm;">Explanation</th>
           		<th class="styDepTblCell" scope="col" style="width:37mm;">Amount</th>
        		</tr>
					</thead>
					<xsl:for-each select="$DependencyData/ExplanationAndAmountsGrp">
						<tr>
          		<xsl:attribute name="class">
          			<xsl:choose>
             			<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             			<xsl:otherwise>styDepTblRow2</xsl:otherwise>
         				 </xsl:choose>
         			</xsl:attribute>
         			<td class="styDepTblCell" style="text-align:left;">
            		<xsl:call-template name="PopulateText">          
									<xsl:with-param name="TargetNode" select="ShortExplanationTxt"/>
           			</xsl:call-template>
         			</td>      
          		<td class="styDepTblCell" style="text-align:right;">
            		<xsl:call-template name="PopulateAmount">          
                 	<xsl:with-param name="TargetNode" select="Amt"/>
            		</xsl:call-template>
          		</td>          
						</tr>
					</xsl:for-each>
				</table>
				<br/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>