<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>

  <xsl:param name="DependencyData" select="$RtnDoc/AmortzImprOfGdwillAndOthersSch" />
  
  <!-- Main template -->
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName">
          <xsl:with-param name="TargetNode" select="$DependencyData" />
    </xsl:call-template>  
  </xsl:param>
 

  <!-- Template to display Amortization, Impairment of Goodwill, Insurance in Force, and Ceding Commissions Schedule -->
  <xsl:template name="AmortzImprOfGdwillAndOthersSch">
    <table  class="styDepTbl" style="font-size:6pt;">
      <thead class="styDepTableThead">
        <tr class="styDepTblHdr">
           <th class="styDepTblCell" scope="col" style="width:80mm;">Description</th>
            <th class="styDepTblCell" scope="col" style="width:35mm;">Income (Loss) per Income Statement Amount</th>
           <th class="styDepTblCell" scope="col" style="width:24mm;">Temporary Difference Amount</th>
           <th class="styDepTblCell" scope="col" style="width:24mm;">Permanent Difference Amount</th>
           <th class="styDepTblCell" scope="col" style="width:24mm;">Income (Loss) per Tax Return Amount</th>
        </tr>
      </thead>
      <tfoot></tfoot>
      <tbody>
        <xsl:for-each select="$DependencyData/AmortzImprGdwillAndOthersInfo">
          <tr>
          <!-- Assign alternate rows the different colors -->
            <xsl:attribute name="class">
              <xsl:choose>
                 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
            <!-- Column 1 -->
            <td class="styDepTblCell" style="text-align:left;width:80mm">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="Description" />
              </xsl:call-template>
          </td>
           
            <!-- Column 2 -->
            <td class="styDepTblCell" style="text-align:right;width:35mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="IncomeLossPerIncomeStmtAmount" />
              </xsl:call-template>          
            </td>
            <!-- Column 3 -->
            <td class="styDepTblCell" style="text-align:right;width:24mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TemporaryDifferenceAmount" />
              </xsl:call-template>          
            </td>
            <!-- Column 4 -->
            <td class="styDepTblCell" style="text-align:right;width:24mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="PermanentDifferenceAmount" />
              </xsl:call-template>          
            </td>
            <!-- Column 5 -->
            <td class="styDepTblCell" style="text-align:right;width:24mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="IncomeLossPerTaxReturnAmount" />
              </xsl:call-template>          
            </td>
          </tr>
        </xsl:for-each>
       
      </tbody>
    </table>
  </xsl:template>
  
   <!-- Main template -->
  <xsl:template match="/" >
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
         <meta name="Author" content="Donna Hoffmeister" />
         <meta name="Description" content="{$depDocTitle}" />
         <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js"></script>
        <xsl:call-template name="InitJS"></xsl:call-template>
        
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="AddOnStyle"></xsl:call-template>    
          </xsl:if>
        </style>
      <xsl:call-template name="GlobalStylesDep"/>
    </head>    
    <body class="styBodyClass">
      <xsl:call-template name="DocumentHeaderDependency" />  
      <div class="styDepTitleLine">
          <span class="styDepTitle">
            <span style="width:93mm;"><xsl:value-of select="$depDocTitle" /></span>        
          </span>
        </div>
           <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftover">
              <xsl:with-param name="TargetNode" select="$DependencyData" />
        </xsl:call-template>      
        <xsl:call-template name="AmortzImprOfGdwillAndOthersSch" />
        
      </body>
    </html>
  </xsl:template>
  
</xsl:stylesheet>







