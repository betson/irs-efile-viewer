<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>

  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />

  <xsl:param name="DependencyData" select="$RtnDoc/EquityBasedCompensationSch" />

  <xsl:param name="depDocTitle">
  <xsl:call-template name="PopulateDisplayName">
  <xsl:with-param name="TargetNode" select="$DependencyData" />
  </xsl:call-template>  
  </xsl:param>
  
 
  
  <!-- Template to display OthIncomeLossItemsWithDiffSch table-->
<xsl:template name="EquityBasedCompensationSchTemp">
    <table id="EquityBasedCompensationSch" class="styDepTbl">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
           <th class="styDepTblCell" scope="col">Description</th>
           <th class="styDepTblCell"  scope="col">Income (Loss) per Income Statement Amount</th>
           <th class="styDepTblCell"  scope="col">Temporary Difference Amount</th>
           <th class="styDepTblCell"  scope="col">Permanent Difference Amount</th>
           <th class="styDepTblCell"  scope="col">Income (Loss) per Tax Return Amount</th>


        </tr>
      </thead>
      <xsl:for-each select="$DependencyData/EquityBasedCompensationInfo">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
          <td class="styDepTblCell" style="text-align:left;width:60mm" >
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="Description" />
            </xsl:call-template>
            </td>
          <td class="styDepTblCell" style="text-align:right;width:34mm" >
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IncomeLossPerIncomeStmtAmount" />
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="text-align:right;width:34mm" >
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="TemporaryDifferenceAmount" />
            </xsl:call-template>
          </td>
        <td class="styDepTblCell" style="text-align:right;width:34mm" >
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="PermanentDifferenceAmount" />
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="text-align:right;width:34mm" >
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IncomeLossPerTaxReturnAmount" />
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
         <meta name="Author" content="Trin Xue" />
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
      <xsl:call-template name="DocumentHeaderDependencyLandscape"></xsl:call-template>
    
        <div class="styDepTitleLineLandscape">
          <span class="styDepTitle">
            <span style="width:90mm;">
              <xsl:value-of select="$depDocTitle" />
            </span>
          </span>
        </div>
        
        <xsl:call-template name="PopulateDepCommonLeftoverLandscape"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>                
        <!--The xsl: choose code block below enables this stylesheet to display data from more then one schema version -->
               
                       <xsl:call-template name="EquityBasedCompensationSchTemp" />
                    <br/>                      
           
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>

