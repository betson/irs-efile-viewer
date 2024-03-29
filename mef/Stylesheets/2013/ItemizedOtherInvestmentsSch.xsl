<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>

<xsl:output method="html" indent="yes"/>
<xsl:strip-space elements="*"/>

  <xsl:param name="DependencyData" select="$RtnDoc/ItemizedOtherInvestmentsSch"/>

  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>  
  </xsl:param>
  
  <xsl:template name="ItemizedOtherInvestmentsSchTemp">
    <table id="ItemizedOtherInvestmentsSchTbl" class="styDepTbl">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
          <th class="styDepTblCell" scope="col">Corporation Name</th>
          <th class="styDepTblCell" scope="col">Corporation EIN</th>
          <th class="styDepTblCell" scope="col">Other Investments Description</th>
          <th class="styDepTblCell" scope="col">Beginning Amount</th>
          <th class="styDepTblCell" scope="col">Ending Amount</th>
        </tr>
       </thead>
        <tfoot/>
        <tbody>
        <xsl:for-each select="$DependencyData/ItemizedOtherInvestment">  
          <tr>
            <!-- Set row background color -->
            <xsl:attribute name="class">
              <xsl:choose>
                 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
            <td class="styDepTblCell" scope="col" style="text-align:left;font-size: 7pt;width:35mm;">
              <xsl:attribute name="rowspan">
                <xsl:value-of select="count(OtherInvestmentsLineItemGrp)"/>
              </xsl:attribute>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine1"/>
              </xsl:call-template>
              <xsl:if test="CorporationName/BusinessNameLine2">
                <br/>
                <xsl:call-template name="PopulateText">          
                  <xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine2"/>
                </xsl:call-template>
              </xsl:if>
            </td>
              <td class="styDepTblCell" scope="col" style="text-align:center;font-size: 7pt;width:20mm;">
                <xsl:attribute name="rowspan">
                  <xsl:value-of select="count(OtherInvestmentsLineItemGrp)"/>
                </xsl:attribute>
                <xsl:if test="CorporationEIN">
                       <xsl:call-template name="PopulateEIN">
                       <xsl:with-param name="TargetNode" select="CorporationEIN"/>
                      </xsl:call-template>       
                </xsl:if>  
                <xsl:if test="MissingEINReasonCd">
                       <xsl:call-template name="PopulateText">
                       <xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
                      </xsl:call-template>       
                </xsl:if>   
              </td>

            <xsl:for-each select="OtherInvestmentsLineItemGrp">
              <xsl:if test="position() = 1">                            
              <td class="styDepTblRow1Cell" scope="col" style="text-align:left;font-size: 7pt;width:60mm;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="Desc"/>
                </xsl:call-template>
              </td>
              <td class="styDepTblRow1Cell" scope="col" style="text-align:right;font-size: 7pt; width: 30mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="BeginningAmt"/>
                </xsl:call-template>
              </td>
              <td class="styDepTblRow1Cell" scope="col" style="text-align:right;font-size: 7pt; width: 30mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="EndingAmt"/>
                </xsl:call-template>
              </td>
              </xsl:if>
            </xsl:for-each>                                      
          </tr>
                                          
          <xsl:for-each select="OtherInvestmentsLineItemGrp">        
            <xsl:if test="position() &gt; 1">
              <tr>
                <!-- Set row background color -->
                <xsl:attribute name="class">
                  <xsl:choose>
                     <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                     <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                  </xsl:choose>
                </xsl:attribute>
                <td class="styDepTblCell" scope="col" style="text-align:left;font-size: 7pt;width:60mm;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="Desc"/>
                  </xsl:call-template>
                </td>
                <td class="styDepTblCell" scope="col" style="text-align:right;font-size: 7pt; width: 30mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="BeginningAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styDepTblCell" scope="col" style="text-align:right;font-size: 7pt; width: 30mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="EndingAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
            </xsl:if>
          </xsl:for-each>
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
         <meta name="Author" content="Venkata Boggavarapu :: boggav@us.ibm.com"/>
         <meta name="Desc" content="{$depDocTitle}"/>
         
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
            <span class="styDepTitle">
              <span style="width:107mm;">
                <xsl:value-of select="$depDocTitle"/>
              </span>
            </span>
          </div>        
          <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>
          <xsl:call-template name="ItemizedOtherInvestmentsSchTemp"/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>