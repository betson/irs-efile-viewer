<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>

  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>

  <xsl:param name="DependencyData" select="$RtnDoc/ForeignTaxSchedule"/>

  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData"/>
    </xsl:call-template>  
  </xsl:param>  
  
  <xsl:template name="ForeignTaxScheduleTemp">
    <!-- First horizontal table with columns A through H -->
    <table id="ForeignTaxScheduleTbl" class="styDepTblLandscape" style="font-size: 7pt">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
          <th class="styDepTblCell" scope="col">Name of Foreign Country or U.S. Possession</th>
          <th class="styDepTblCell" scope="col">Gross Income from All Sources</th>
          <th class="styDepTblCell" scope="col">Gross Income Sourced at Shareholder Level</th>
          <th class="styDepTblCell" scope="col">Foreign Gross Income Sourced at Corporate Level - Passive</th>
          <th class="styDepTblCell" scope="col">Foreign Gross Income Sourced at Corporate Level - General Category</th>
          <th class="styDepTblCell" scope="col">Foreign Gross Income Sourced at Corporate Level - Other</th>
        
        </tr>
      </thead>
      <xsl:for-each select="$DependencyData/ForeignTaxInformationTyp">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
            <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
            <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
        <td class="styDepTblCell" style="text-align:center;width:60mm">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossessionCd"/>
          </xsl:call-template>
        </td>
        <td class="styDepTblCell" style="text-align:right;width:31mm">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="GrossIncomeFromAllSourcesAmt"/>
          </xsl:call-template>
        </td>
        <td class="styDepTblCell" style="text-align:right;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="GrossIncmSrcdAtShrLvlAmt"/>
          </xsl:call-template>
              <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="GrossIncmSrcdAtShrLvlAmt"/>
               </xsl:call-template>

        </td>
        <td class="styDepTblCell" style="text-align:right;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="FrgnGroIncmSrcdCorpLvlPssvAmt"/>
          </xsl:call-template>
        </td>
        <td class="styDepTblCell" style="text-align:right;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="FrgnGroIncmSrcdCorpLvlGenAmt"/>
          </xsl:call-template>
        </td>
        <td class="styDepTblCell" style="text-align:right;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="FrgnGroIncmSrcdCorpLvlOtherAmt"/>
          </xsl:call-template>
          <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="FrgnGroIncmSrcdCorpLvlOtherAmt"/>
          </xsl:call-template>
        </td>
        
        </tr>
      </xsl:for-each>
    </table>
    
    <br/><br/>
    
    <!--Second horizontal table with columns I through N -->
    <table id="ForeignTaxScheduleTbl" class="styDepTblLandscape" style="font-size: 7pt">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
          <th class="styDepTblCell" scope="col">Deductions Allocated and Apportioned at Shareholder Level - Interest Expense</th>
          <th class="styDepTblCell" scope="col">Deductions Allocated and Apportioned at Shareholder Level - Other</th>
          <th class="styDepTblCell" scope="col">Deductions Allocated and Apportioned at Corporate Level to Foreign Source Income - Passive</th>
          <th class="styDepTblCell" scope="col">Deductions Allocated and Apportioned at Corporate Level to Foreign Source Income - General Category</th>
          <th class="styDepTblCell" scope="col">Deductions Allocated and Apportioned at Corporate Level to Foreign Source Income - Other</th>
          <th class="styDepTblCell" scope="col">Foreign Taxes - Paid</th>
        
        
        </tr>
      </thead>
      <xsl:for-each select="$DependencyData/ForeignTaxInformationTyp">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
            <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
            <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
          
             <td class="styDepTblCell" style="text-align:right;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="DedAllocApprtnShrLvlIntExpAmt"/>
          </xsl:call-template>
        </td>
          
                <td class="styDepTblCell" style="text-align:right;width:31mm">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="DedAllocApprtnShrLvlOtherAmt"/>
          </xsl:call-template>
        </td>

     
        <td class="styDepTblCell" style="text-align:right;width:35mm">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="DedAllocApprtnShrLvlPssvAmt"/>
          </xsl:call-template>
        </td>
        <td class="styDepTblCell" style="text-align:right;width:35mm">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="DedAllocApprtnCorpLvlGenCatAmt"/>
          </xsl:call-template>
        </td>
        <td class="styDepTblCell" style="text-align:right;width:35mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="DedAllocApprtnCorpLvlOtherAmt"/>
          </xsl:call-template>
          <xsl:call-template name="SetFormLinkInline">
               <xsl:with-param name="TargetNode" select="DedAllocApprtnCorpLvlOtherAmt"/>
           </xsl:call-template>
        </td>
        <td class="styDepTblCell" style="text-align:right;width:35mm">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="ForeignTaxesPaidAmt"/>
          </xsl:call-template>
        </td>
       
       
        </tr>
      </xsl:for-each>
    </table>
    
       
      <!--Third horizontal table with columns I through N -->
      <br/><br/>
     
          <table id="ForeignTaxScheduleTbl" class="styDepTblLandscape" style="font-size: 7pt">
            <thead class="styTableThead">
              <tr class="styDepTblHdr">
                <th class="styDepTblCell" scope="col">Foreign Taxes - Accrued</th>
                <th class="styDepTblCell" scope="col">Reduction in Taxes Available for Credit</th>
                <th class="styDepTblCell" scope="col">Foreign Trading Gross Receipts</th>
                <th class="styDepTblCell" scope="col">Extraterritorial Income Exclusion</th>
                <th class="styDepTblCell" scope="col">Other Foreign Transaction Amount</th>
              </tr>
            </thead>
            <xsl:for-each select="$DependencyData/ForeignTaxInformationTyp">
              <tr>
                <xsl:attribute name="class">
                <xsl:choose>
                  <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                  <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                </xsl:choose>
                </xsl:attribute>

                <td class="styDepTblCell" style="text-align:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="ForeignTaxesAccruedAmt"/>
                  </xsl:call-template>
                </td>

                <td class="styDepTblCell" style="text-align:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="TaxReductionAvailableForCrAmt"/>
                  </xsl:call-template>
                  
                  <xsl:call-template name="SetFormLinkInline">
                         <xsl:with-param name="TargetNode" select="TaxReductionAvailableForCrAmt"/>
                         </xsl:call-template>
                </td>
                <td class="styDepTblCell" style="text-align:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="ForeignTradingGrossReceiptsAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styDepTblCell" style="text-align:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="ExtraterritorialIncmExclAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styDepTblCell" style="text-align:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="ForeignTransactionOthAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
            </xsl:for-each>
        </table>
  </xsl:template>  
  
  <!-- Main templates -->
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
         <meta name="Author" content="Beju Ekperigin :: beju@us.ibm.com"/>
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
          <div class="styDepTitleLineLandscape">
            <span class="styDepTitle">
              <span style="width:67mm;">
                <xsl:value-of select="$depDocTitle"/>
              </span>
            </span>
          </div>        
          <xsl:call-template name="PopulateDepCommonLeftoverLandscape">
            <xsl:with-param name="TargetNode" select="$DependencyData"/>
          </xsl:call-template>          
          <xsl:call-template name="ForeignTaxScheduleTemp"/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>