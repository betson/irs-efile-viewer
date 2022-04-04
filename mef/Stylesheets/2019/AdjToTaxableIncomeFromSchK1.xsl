<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="AddHeader.xsl"/>  
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>  
  <xsl:include href="AddOnTable.xsl"/>   
  <xsl:param name="FormData" select="$RtnDoc/AdjToTaxableIncomeFromSchK1"/>
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$FormData"/></xsl:call-template>  
  </xsl:param>  
  <!--  - Form 8866 displays as - Adjustment to Taxable Income From Multiple Schedules K-1 Statement -  -->
  <xsl:template name="ShowATI">
    <!-- Adjustment to Taxable Income From Multiple Schedules K-1 info Data -->
    <table id="ATITbl" class="styDepTbl">
      <tr class="styDepTblHdr">
        <th class="styDepTblCell" style="width:35mm;" scope="col">1.  Recomputation Year</th>
        <th class="styDepTblCell" style="width:115mm;" scope="col">2.  Name of Entity</th>
        <th class="styDepTblCell" style="width:36mm;" scope="col">3. Amount of Net Change to Depreciation Under the Income Forecast Method</th>                          
        </tr>      
      <xsl:for-each select="$FormData/TaxableIncomeAdjustmentTxt">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
          <td class="styDepTblCell" style="width:35mm;text-align:center;">            
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="RecomputationYr"/></xsl:call-template>             
          </td>                      
          <td class="styDepTblCell" style="width:115mm;text-align:left; ">
            <xsl:if test="EntityName/BusinessNameLine1Txt !=''">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="EntityName/BusinessNameLine1Txt"/>
                </xsl:call-template>
                <xsl:if test="EntityName/BusinessNameLine2Txt !=''">
                <br/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="EntityName/BusinessNameLine2Txt"/>
                  </xsl:call-template>
                </xsl:if>
              </xsl:if>
          </td>
          <td class="styDepTblCell" style="width:36mm;text-align:right;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="NetChangeToDepreciationAmt"/></xsl:call-template>             
          </td>                              
        </tr>
      </xsl:for-each>
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
         <meta name="Author" content="Polina Zhuravlev"/>
        <meta name="Description" content="{$depDocTitle}"/>  
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <!--Generic CSS Styles are located in the template called below -->
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
      <xsl:call-template name="GlobalStylesDep"/>
</head>
      <body class="styBodyClass">    
        <xsl:call-template name="DocumentHeaderDependency"/>  
         <div class="styDepTitleLine">
        <span class="styDepTitle"  style="padding-right:2mm;">
            <xsl:value-of select="$depDocTitle"/>
          </span>        
      </div>   
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$FormData"/></xsl:call-template><br/>   
        <xsl:call-template name="ShowATI"/>          
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>