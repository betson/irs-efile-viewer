<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>

<xsl:output method="html" indent="yes" />
<xsl:strip-space elements="*" />

  <xsl:param name="DependencyData" select="$RtnDoc/ExceptionExplanationStatement" />
 
  <xsl:param name="depDocTitle">
  <xsl:call-template name="PopulateDisplayName">
        <xsl:with-param name="TargetNode" select="$DependencyData" />
  </xsl:call-template>  
  </xsl:param>
  
  <xsl:template name="ExceptionExplanationStatementTemp">
  
    <table id="GeneralDependencyTbl" class="styDepTbl">
      <tr class="styDepTblHdr">
         <th class="styDepTblCell" style="width:34mm;">Fuel Type</th>
         <th class="styDepTblCell" style="width:30mm;">Type of Use</th>
         <th class="styDepTblCell" style="width:32mm;">Rate</th>
         <th class="styDepTblCell" style="width:17mm;">Number of Gallons</th>
         <th class="styDepTblCell" style="width:32mm;">Amount of Refund</th>
         <th class="styDepTblCell" style="width:42mm;">Refund Statement</th>
      </tr>
      <xsl:for-each select="$DependencyData/Item">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>          
          <td class="styDepTblCell" style="text-align:left;font-size:7pt">
             <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="FuelType" />
             </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="text-align:center;font-size:7pt">
             <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="TypeOfUse" />
             </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="Rate" />
             </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="NumberOfGallons" />
             </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="AmountOfRefund" />
             </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="text-align:left;font-size:7pt">
             <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="RefundStatement" />
             </xsl:call-template>
          </td>
        </tr>
      </xsl:for-each>
      <tr class="styDepTblHdr">
        <td colspan="2" class="styDepTblCell" style="width:64mm;text-align:left;font-weight:bold;border-top-width:2px">Total Number of Gallons</td>
        <td colspan="4" class="styDepTblCell" style="width:123mm;text-align:right;border-top-width:2px">
          <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="WhiteFont">true</xsl:with-param>
            <xsl:with-param name="TargetNode" select="$DependencyData/NumberOfGallonsTotal" />
          </xsl:call-template>
        </td>
      </tr>
      <tr class="styDepTblHdr">
        <td colspan="2" class="styDepTblCell" style="width:64mm;text-align:left;font-weight:bold">Total Tax Amount</td>
        <td colspan="4" class="styDepTblCell" style="width:123mm;text-align:right">
          <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="WhiteFont">true</xsl:with-param>
            <xsl:with-param name="TargetNode" select="$DependencyData/TaxAmountCalculationTotal" />
          </xsl:call-template>
        </td>
      </tr>
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
         <meta name="Author" content="Jason Goltermann" />
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
        <xsl:call-template name="DocumentHeaderDependency">
        </xsl:call-template>
          <div class="styDepTitleLine">
            <span class="styDepTitle">
              <span style="width:359px;">
                <xsl:value-of select="$depDocTitle" />
              </span>
            </span>
          </div>
          <div class="styTopSectionLine" >
             <xsl:call-template name="SetFormLinkInline">
                 <xsl:with-param name="TargetNode" select="$DependencyData"/> 
             </xsl:call-template>
         </div>  
        <xsl:call-template name="PopulateDepCommonLeftover">
                <xsl:with-param name="TargetNode" select="$DependencyData" />
                               <xsl:with-param name="NoGap" select="'true'" />
        </xsl:call-template>
          <xsl:call-template name="ExceptionExplanationStatementTemp" />
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>