<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  
  <xsl:param name="DependencyData" select="$RtnDoc/AmortizationSchedule"/>

  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName">
      <xsl:with-param name="TargetNode" select="$DependencyData"/>
    </xsl:call-template>  
  </xsl:param>  

  <xsl:template name="AmortizationScheduleTemp">
    <table id="AmortizationScheduleTbl" class="styDepTblLandscape" style="font-size: 6pt">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
          <th class="styDepTblCell" scope="col" style="width:70mm;">Description of Amortized Expenses</th>
          <th class="styDepTblCell" scope="col" style="width:22mm;">Date Acquired, Completed, or Expended</th>
          <th class="styDepTblCell" scope="col" style="width:22mm;">Amount Amortized</th>
          <th class="styDepTblCell" scope="col" style="width:22mm;">Deduction for Prior Years</th>
          <th class="styDepTblCell" scope="col" style="width:32mm;">Amortization Method</th>
          <th class="styDepTblCell" scope="col" style="width:22mm;">Current Year Amortization</th>
          <th class="styDepTblCell" scope="col" style="width:22mm;">Net Investment Income</th>
          <th class="styDepTblCell" scope="col" style="width:22mm;">Adjusted Net Income</th>          
          <th class="styDepTblCell" scope="col" style="width:22mm;">Total Amount of Amortization</th>
        </tr>
      </thead>
      <xsl:for-each select="$DependencyData/AmortizationScheduleDetail">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
            <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
            <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
          
          <td class="styDepTblCell" style="text-align:left;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="AmortizedExpensesDesc"/>
            </xsl:call-template>
          </td>
          
          <td class="styDepTblCell" style="text-align:cente;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="AcquiredCompletedOrExpendedDt"/>
            </xsl:call-template>
          </td>          
          <td class="styDepTblCell" style="text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="AmortizedAmt"/>
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="DeductionForPriorYearsAmt"/>
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="MaxSize" select="11"/>
              <xsl:with-param name="TargetNode" select="AmortizationPeriodRt"/>
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="CurrentYearAmortizationAmt"/>
            </xsl:call-template>
          </td>
          
          <td class="styDepTblCell" style="text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="NetInvestmentIncomeAmt"/>
            </xsl:call-template>
          </td> 
          <td class="styDepTblCell" style="text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="AdjustedNetIncomeAmt"/>
            </xsl:call-template>
          </td>            
           
          <td class="styDepTblCell" style="text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="TotalAmortizationAmt"/>
            </xsl:call-template>
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
      <!-- No Proxy Caching   -->
      <meta http-equiv="Cache-Control" content="private"/>
      <!-- Define Character Set   -->
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
      <meta name="Author" content="Beju Ekperigin"/>
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
    <!-- NameDisplay - IRS990PF - Amortization Schedule -->
    <body class="styBodyClass">  
      <xsl:call-template name="DocumentHeaderDependencyLandscape"/> 
      <div class="styDepTitleLineLandscape">
        <span class="styDepTitle">
          <span style="padding-right:5mm;"><xsl:value-of select="$depDocTitle"/></span>
        </span>
      </div>
      <xsl:call-template name="PopulateDepCommonLeftoverLandscape">
        <xsl:with-param name="TargetNode" select="$DependencyData"/>
      </xsl:call-template>      
      <xsl:call-template name="AmortizationScheduleTemp"/>
    </body>
    </html>
  </xsl:template>
</xsl:stylesheet>