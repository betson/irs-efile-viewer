<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="PopulateTemplate.xsl"/>
   <xsl:include href="AddHeader.xsl"/>
   <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  
  <xsl:param name="CCSData" select="$RtnDoc/FiscallyTransparentIncomeSch"/>
  
  <!-- 1120F- Fiscally Transparent income Schedule -->  
  
  <xsl:template name="ShowCYAORC">
    <table id="CYAORCTbl" class="styDepTblLandscape">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">          
           <th class="styDepTblCell" scope="col" style="width:120mm;">Item Of Income</th>        
           <th class="styDepTblCell" scope="col" style="width:34mm;">Gross Amount </th>  
           <th class="styDepTblCell" scope="col" style="width:34mm;">Rate Of Tax</th>        
           <th class="styDepTblCell" scope="col" style="width:34mm;">Amount Of Tax </th>        
           <th class="styDepTblCell" scope="col" style="width:34mm;">Amount Of US Tax Paid </th>  
        </tr>
      </thead>
        <tfoot/>
        
       <tbody>    
        <xsl:for-each select="$CCSData/FiscallyTransparentIncomeGrp">  
          <tr>
            <xsl:attribute name="class">
              <xsl:choose>
                 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>            
                  
            <td class="styDepTblCell" style="text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ItemIncomeTxt"/>
              </xsl:call-template>
            </td>
            
            <td class="styDepTblCell" style="text-align:right;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="GrossAmt"/>
                </xsl:call-template>
            </td>
            
            <td class="styDepTblCell" style="text-align:right;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="TaxRt"/>
                </xsl:call-template>
              
            </td>
            
            <td class="styDepTblCell" style="text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TaxAmt"/>
              </xsl:call-template>
            </td>
 
            <td class="styDepTblCell" style="text-align:right;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="TotalTaxAmt"/>
                </xsl:call-template>
            </td>
          </tr>      
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>

  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$CCSData"/></xsl:call-template>  
  </xsl:param>
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
         <meta name="Author" content="Ravi Venigalla"/>
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
        <div class="styDepTitleLineLandscape ">
          <span class="styDepTitle" style="width:110mm">
            <xsl:value-of select="$depDocTitle"/>        
          </span>
        </div>
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftoverLandscape"><xsl:with-param name="TargetNode" select="$CCSData"/></xsl:call-template>        
        <xsl:call-template name="ShowCYAORC"/>          
        <br/>                      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>