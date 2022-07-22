<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  
  <xsl:param name="DependencyData" select="$RtnDoc/AmortizationSchedule" />

  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName">
      <xsl:with-param name="TargetNode" select="$DependencyData" />
    </xsl:call-template>  
  </xsl:param>  

  <xsl:template name="AmortizationScheduleTemp">
    <table id="AmortizationScheduleTbl" class="styDepTblLandscape" style="font-size: 6pt">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
          <th class="styDepTblCell"  scope="col" style="width:70mm;">Description of Amortized Expenses</th>
          <th class="styDepTblCell"  scope="col" style="width:22mm;">Date Acquired, Completed, or Expended</th>
          <th class="styDepTblCell"  scope="col" style="width:22mm;">Amount Amortized</th>
          <th class="styDepTblCell"  scope="col" style="width:22mm;">Deduction for Prior Years</th>
          <th class="styDepTblCell"  scope="col" style="width:32mm;">Amortization Method</th>
          <th class="styDepTblCell"  scope="col" style="width:22mm;">Current Year Amortization</th>
          <th class="styDepTblCell"  scope="col" style="width:22mm;">Net Investment Income</th>
          <th class="styDepTblCell"  scope="col" style="width:22mm;">Adjusted Net Income</th>          
          <th class="styDepTblCell"  scope="col" style="width:22mm;">Total Amount of Amortization</th>
        </tr>
      </thead>
      <xsl:for-each select="$DependencyData/Amortization">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
            <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
            <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
          
          <td class="styDepTblCell" style="text-align:left;" >
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="DescriptionOfAmortizedExpenses" />
            </xsl:call-template>
          </td>
          
          <td class="styDepTblCell" style="text-align:cente;" >
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="DateAcquiredCompletedExpended" />
            </xsl:call-template>
          </td>          
          <td class="styDepTblCell" style="text-align:right;" >
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="AmountAmortized" />
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="text-align:right;" >
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="DeductionForPriorYears" />
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="text-align:right;" >
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="MaxSize" select="11" />
              <xsl:with-param name="TargetNode" select="AmortizationPeriod" />
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="text-align:right;" >
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="CurrentYearAmortization" />
            </xsl:call-template>
          </td>
          
          <td class="styDepTblCell" style="text-align:right;" >
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="NetInvestmentIncome" />
            </xsl:call-template>
          </td> 
          <td class="styDepTblCell" style="text-align:right;" >
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="AdjustedNetIncome" />
            </xsl:call-template>
          </td>            
           
          <td class="styDepTblCell" style="text-align:right;" >
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="TotalAmountOfAmortization" />
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
      <!-- No Proxy Caching   -->
      <meta http-equiv="Cache-Control" content="private" />
      <!-- Define Character Set   -->
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
      <meta name="Author" content="Beju Ekperigin" />
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
          <span style="width:72mm;"><xsl:value-of select="$depDocTitle" /></span>
        </span>
      </div>
      <xsl:call-template name="PopulateDepCommonLeftoverLandscape">
        <xsl:with-param name="TargetNode" select="$DependencyData" />
      </xsl:call-template>      
      <xsl:call-template name="AmortizationScheduleTemp" />
    </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
