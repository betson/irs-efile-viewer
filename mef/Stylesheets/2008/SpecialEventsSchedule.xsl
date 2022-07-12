<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
  <xsl:strip-space elements="*" />
  
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>    
  <xsl:include href="AddOnTable.xsl"/>

  <xsl:param name="DependencyData" select="$RtnDoc/SpecialEventsSchedule" />
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>  
  </xsl:param>
    
  
  <xsl:template name="DependencyTemplate">
    
    <table id="SESCTbl" class="styDepTbl" style="margin-top:4mm; font-size:8pt; font-family:Arial">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
          <!--th class="styDepTblCell" scope="col">Item No.</th-->
          <th class="styDepTblCell" scope="col">Event Name</th>
          <th class="styDepTblCell" scope="col">Gross Receipts</th>  
          <th class="styDepTblCell" scope="col">Contributions</th>
          <th class="styDepTblCell" scope="col">Gross Revenue</th>  
          <th class="styDepTblCell" scope="col">Direct Expense</th>
          <th class="styDepTblCell" scope="col">Net Income (Loss)</th>                                
        </tr>    
      </thead>  
      <tfoot></tfoot>
      <tbody>        
      <xsl:for-each select="$DependencyData/SpecialEvent">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
          <!--td class="styDepTblCell" valign="top">
            <xsl:value-of select="position()" />
          </td-->    
          <td class="styDepTblCell" align="left" valign="top">          
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="EventName" /></xsl:call-template>             
          </td>              
          <td class="styDepTblCell" align="right" valign="top" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="GrossReceipts" /></xsl:call-template>             
          </td>  
          <td class="styDepTblCell" align="right" valign="top" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="Contributions" /></xsl:call-template>             
          </td>  
          <td class="styDepTblCell" align="right" valign="top" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="GrossRevenue" /></xsl:call-template>             
          </td>  
          <td class="styDepTblCell" align="right" valign="top" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="DirectExpense" /></xsl:call-template>             
          </td>  
          <td class="styDepTblCell" align="right" valign="top" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="NetIncomeLoss" /></xsl:call-template>             
          </td>  
        </tr>
      </xsl:for-each>
      </tbody>    
    </table>
  </xsl:template>
  
  
  <!-- Main template -->
  <xsl:template match="/">
    <html>
      <head>
         <title>
           <!--Special Events Schedule-->
          <xsl:value-of select="$depDocTitle" />
        </title>
         <!-- No Browser Caching -->
         <meta http-equiv="Pragma" content="no-cache" />
         <meta http-equiv="Cache-Control" content="no-cache" />
         <meta http-equiv="Expires" content="0" />
         <!-- No Proxy Caching -->
         <meta http-equiv="Cache-Control" content="private" />
         <!-- Define Character Set -->
         <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />         
         <meta name="Description" content="{$depDocTitle}" />  
        
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
          <div class="styDepTitle" style="width:80mm">
            <!--TY 2003 Special Events Schedule-->
            <xsl:value-of select="$depDocTitle" />
          </div>
        </div>      
          
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>    
                    
        <xsl:call-template name="DependencyTemplate" />          
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







