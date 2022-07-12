<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>

  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />

  <xsl:param name="DependencyData" select="$RtnDoc/ForeignTaxSchedule" />

  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" />
    </xsl:call-template>  
  </xsl:param>  
  
  <xsl:template name="ForeignTaxScheduleTemp">
    <!-- First horizontal table with columns A through H -->
    <table id="ForeignTaxScheduleTbl" class="styDepTblLandscape" style="font-size: 7pt">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
          <th class="styDepTblCell"  scope="col">Name of Foreign Country or U.S. Possession</th>
          <th class="styDepTblCell"  scope="col">Gross Income from All Sources</th>
          <th class="styDepTblCell"  scope="col">Gross Income Sourced at Shareholder Level</th>
          <th class="styDepTblCell"  scope="col">Foreign Gross Income Sourced at Corporate Level - Passive</th>
          <th class="styDepTblCell"  scope="col">Foreign Gross Income Sourced at Corporate Level - General Category</th>
          <th class="styDepTblCell"  scope="col">Foreign Gross Income Sourced at Corporate Level - Other</th>
        
        </tr>
      </thead>
      <xsl:for-each select="$DependencyData/ForeignTaxInfo">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
            <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
            <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
        <td class="styDepTblCell" style="text-align:left;width:60mm" >
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossession" />
          </xsl:call-template>
        </td>
        <td class="styDepTblCell" style="text-align:right;width:31mm" >
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="GrossIncomeFromAllSources" />
          </xsl:call-template>
        </td>
        <td class="styDepTblCell" style="text-align:right;" >
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="GrossIncmSrcdAtShareholderLvl" />
          </xsl:call-template>
              <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="GrossIncmSrcdAtShareholderLvl" />
               </xsl:call-template>

        </td>
        <td class="styDepTblCell" style="text-align:right;" >
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="ForeignGroIncmSrcdCorpLvlPssv" />
          </xsl:call-template>
        </td>
        <td class="styDepTblCell" style="text-align:right;" >
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="ForeignGrossIncmSrcdCorpLvlGC" />
          </xsl:call-template>
        </td>
        <td class="styDepTblCell" style="text-align:right;" >
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="ForeignGrossIncmSrcdCorpLvlOT" />
          </xsl:call-template>
          <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="ForeignGrossIncmSrcdCorpLvlOT" />
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
          <th class="styDepTblCell"  scope="col">Deductions Allocated and Apportioned at Shareholder Level - Interest Expense</th>
          <th class="styDepTblCell"  scope="col">Deductions Allocated and Apportioned at Shareholder Level - Other</th>
          <th class="styDepTblCell"  scope="col">Deductions Allocated and Apportioned at Corporate Level to Foreign Source Income - Passive</th>
          <th class="styDepTblCell"  scope="col">Deductions Allocated and Apportioned at Corporate Level to Foreign Source Income - General Category</th>
          <th class="styDepTblCell"  scope="col">Deductions Allocated and Apportioned at Corporate Level to Foreign Source Income - Other</th>
          <th class="styDepTblCell"  scope="col">Foreign Taxes - Paid</th>
        
        
        </tr>
      </thead>
      <xsl:for-each select="$DependencyData/ForeignTaxInfo">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
            <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
            <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
          
             <td class="styDepTblCell" style="text-align:right;" >
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="DedAllocAndApprtnShrLvlIntExp" />
          </xsl:call-template>
        </td>
          
                <td class="styDepTblCell" style="text-align:right;width:31mm" >
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="DedAllocAndApprtnShrLvlOther" />
          </xsl:call-template>
        </td>

     
        <td class="styDepTblCell" style="text-align:right;width:35mm" >
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="DedAllocAndApprtnCorpLvlPssv" />
          </xsl:call-template>
        </td>
        <td class="styDepTblCell" style="text-align:right;width:35mm" >
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="DedAllocAndApprtnAtCorpLvlGC" />
          </xsl:call-template>
        </td>
        <td class="styDepTblCell" style="text-align:right;width:35mm;" >
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="DedAllocAndApprtnCorpLvlOT" />
          </xsl:call-template>
          <xsl:call-template name="SetFormLinkInline">
               <xsl:with-param name="TargetNode" select="DedAllocAndApprtnCorpLvlOT" />
           </xsl:call-template>
        </td>
        <td class="styDepTblCell" style="text-align:right;width:35mm" >
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="ForeignTaxesPaid" />
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
                <th class="styDepTblCell"  scope="col">Foreign Taxes - Accrued</th>
                <th class="styDepTblCell"  scope="col">Reduction in Taxes Available for Credit</th>
                <th class="styDepTblCell"  scope="col">Foreign Trading Gross Receipts</th>
                <th class="styDepTblCell"  scope="col">Extraterritorial Income Exclusion</th>
                <th class="styDepTblCell"  scope="col">Other Foreign Transaction Amount</th>
              </tr>
            </thead>
            <xsl:for-each select="$DependencyData/ForeignTaxInfo">
              <tr>
                <xsl:attribute name="class">
                <xsl:choose>
                  <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                  <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                </xsl:choose>
                </xsl:attribute>

                <td class="styDepTblCell" style="text-align:right;" >
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="ForeignTaxesAccrued" />
                  </xsl:call-template>
                </td>

                <td class="styDepTblCell" style="text-align:right;" >
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="TaxReductionAvailableForCredit" />
                  </xsl:call-template>
                  
                  <xsl:call-template name="SetFormLinkInline">
                         <xsl:with-param name="TargetNode" select="TaxReductionAvailableForCredit" />
                         </xsl:call-template>
                </td>
                <td class="styDepTblCell" style="text-align:right;" >
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="ForeignTradingGrossReceipts" />
                  </xsl:call-template>
                </td>
                <td class="styDepTblCell" style="text-align:right;" >
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="ExtraterritorialIncmExclusion" />
                  </xsl:call-template>
                </td>
                <td class="styDepTblCell" style="text-align:right;" >
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="OtherForeignTransactionAmount" />
                  </xsl:call-template>
                </td>
              </tr>
            </xsl:for-each>
        </table>
  </xsl:template>  
  
  <!-- Main templates -->
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
         <meta name="Author" content="Beju Ekperigin :: beju@us.ibm.com" />
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
              <span style="width:67mm;">
                <xsl:value-of select="$depDocTitle" />
              </span>
            </span>
          </div>        
          <xsl:call-template name="PopulateDepCommonLeftoverLandscape">
            <xsl:with-param name="TargetNode" select="$DependencyData" />
          </xsl:call-template>          
          <xsl:call-template name="ForeignTaxScheduleTemp" />
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
