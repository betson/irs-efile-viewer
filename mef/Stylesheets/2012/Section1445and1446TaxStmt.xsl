<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:output method="html" indent="yes" />
<xsl:strip-space elements="*" />
  <xsl:param name="DependencyData" select="$RtnDoc/Section1445and1446TaxStmt" />
  <!-- Schema Location:1120F  Section 1445 and 1446 Tax Statement-->
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>  
  </xsl:param>  
  <xsl:template name="Section1445and1446TaxStmtTemp">
    <table id="Section1445and1446TaxStmtTbl" class="styDepTbl">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
           <th class="styDepTblCell"  scope="col" style="width:93mm;">Excludable Amount From Chapter Three Withholding Computation</th>
           <th class="styDepTblCell"  scope="col" style="width:94mm;">Explanation of Excludable Amounts From Chapter Three Withholding Computation</th>
        </tr>
      </thead>
      <xsl:for-each select="$DependencyData/ExcludableInfo">
        <tr>
          <xsl:attribute name="class">
			<xsl:choose>
			   <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
			   <xsl:otherwise>styDepTblRow2</xsl:otherwise>
			</xsl:choose>
          </xsl:attribute>
        <td class="styDepTblCell" style="width: 93mm;text-align:right;" >
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="ExcludableAmounts" />
            </xsl:call-template>
        </td>
        <td class="styDepTblCell" style="width: 94mm; text-align:left;" >
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="ExplanationExcludableAmounts" />
          </xsl:call-template>
        </td>        
        </tr>
      </xsl:for-each>
    </table>
  </xsl:template>    
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
      <body class="styBodyClass">
        <xsl:call-template name="DocumentHeaderDependency"></xsl:call-template>    
          <div class="styDepTitleLine">
            <span class="styDepTitle">
              <span style="width:108mm;">
                <xsl:value-of select="$depDocTitle" />
              </span>
            </span>
          </div>               
          <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>
          <div class="styTopSectionLine" style="width:187mm;">
			    <div style="float:left;clear:none;">
				    <span class="styTopSectionLineLbl">Tax on ECI per the Tax Return:</span>
			    </div>
			    <div style="float:left;clear:none;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$DependencyData/TaxOnECI"/>
					</xsl:call-template>
			    </div>
        </div>
        <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;"><span class="styTopSectionLineLbl">Refigured Taxable Income:</span></div>
			  <div style="float:left;clear:none;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$DependencyData/RefiguredTaxableIncome"/>
					</xsl:call-template>
			  </div>
        </div>
        <xsl:call-template name="Section1445and1446TaxStmtTemp" />      
        <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;"><span class="styTopSectionLineLbl">Refigured Tax on ECI:</span></div>
			  <div style="float:left;clear:none;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$DependencyData/RefiguredTaxOnECI"/>
					</xsl:call-template>
			  </div>
        </div>  
        <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;"><span class="styTopSectionLineLbl">Calculated Section 1445 and 1446 Tax:</span></div>
			  <div style="float:left;clear:none;padding-top:2mm;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$DependencyData/Calculated1445And1446Tax"/>
					</xsl:call-template>
			  </div>
        </div>  
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







