<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  
  <xsl:param name="DependencyData" select="$RtnDoc/DepreciationSchedule"/>

  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName">
      <xsl:with-param name="TargetNode" select="$DependencyData"/>
    </xsl:call-template>  
  </xsl:param>  

  <xsl:template name="DepreciationScheduleTemp">
    <table id="DepreciationScheduleTbl" class="styDepTblLandscape" style="font-size: 6pt">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
          <th class="styDepTblCell" scope="col">Description of Property</th>
          <th class="styDepTblCell" scope="col">Date Acquired</th>
          <th class="styDepTblCell" scope="col">Cost or Other Basis</th>
          <th class="styDepTblCell" scope="col">Prior Years' Depreciation</th>
          <th class="styDepTblCell" scope="col">Computation Method</th>
          <th class="styDepTblCell" scope="col">Rate / <br/>Life (# of years)</th>
          <th class="styDepTblCell" scope="col">Current Year's Depreciation Expense</th>          
          <th class="styDepTblCell" scope="col">Net Investment Income</th> 
          <th class="styDepTblCell" scope="col">Adjusted Net Income</th>                  
          <th class="styDepTblCell" scope="col">Cost of Goods Sold Not Included</th>
        </tr>
      </thead>
      
      <xsl:for-each select="$DependencyData/DepreciationPropertyGrp">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
            <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
            <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
          <td class="styDepTblCell" style="text-align:left;width:27mm;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="PropertyDesc"/>
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="text-align:center;width:15mm ">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="AcquiredDt"/>
            </xsl:call-template>
          </td>          
          <td class="styDepTblCell" style="text-align:right;width:22mm">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="text-align:right;width:22mm">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="PriorYearDepreciationAmt"/>
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="text-align:left;width:27mm;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="ComputationMethodTxt"/>
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="text-align:right;width:34mm;">
            <xsl:choose>
              <xsl:when test="Rt">
                <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="Rt"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="MaxSize" select="3"/>
                  <xsl:with-param name="TargetNode" select="LifeRt"/>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </td>
          
          <td class="styDepTblCell" style="text-align:right;width:22mm">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="CurrentYearExpenseAmt"/>
            </xsl:call-template>
          </td>          
          <td class="styDepTblCell" style="text-align:right;width:22mm">
            <xsl:call-template name="PopulateAmount">
               <xsl:with-param name="TargetNode" select="NetInvestmentIncomeAmt"/>
            </xsl:call-template>             
          </td>          
          <td class="styDepTblCell" style="text-align:right;width:22mm">
            <xsl:call-template name="PopulateAmount">
               <xsl:with-param name="TargetNode" select="AdjustedNetIncomeAmt"/>
            </xsl:call-template>
         </td>          
          <td class="styDepTblCell" style="text-align:right;width:22mm">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="CostOfGoodsSoldNotIncludedAmt"/>
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
      <!-- No Proxy Caching -->
      <meta http-equiv="Cache-Control" content="private"/>
      <!-- Define Character Set -->
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
    <!-- NameDisplay - IRS990PF - Depreciation Schedule -->
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
      <xsl:call-template name="DepreciationScheduleTemp"/>
    </body>
    </html>
  </xsl:template>
</xsl:stylesheet>