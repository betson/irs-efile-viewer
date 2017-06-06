<?xml version="1.0" encoding="UTF-8"?>
<!--Created by Doug peterson 6-26-2006--><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
    
  <xsl:include href="PopulateTemplate.xsl"/>
   <xsl:include href="AddHeader.xsl"/>
   <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  
  <xsl:param name="DependencyData" select="$RtnDoc/OtherItemsAndAmountsStatement"/>
  
  <!-- Template to display table items -->
  
  <xsl:template name="ShowDependencyData">
  
    <!-- Itemized Other Income Schedule Data -->
    <table id="DependencyDataTbl" class="styDepTbl">
    <!--  <thead class="styTableThead">
      <tr class="styDepTblHdr">         
         <th class="styDepTblCell" scope="col">Statement</th>         
         
                                                                                 
      </tr>
      </thead>-->
        <tfoot/>
        
       <tbody>
      <xsl:for-each select="$DependencyData/Item">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
                              
       <td class="styDepTblCell" style="text-align:left">      		
          <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Fuel Tax Credit Information:</div>
          <div style="float:left;clear:none;width:118mm;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="./FuelTaxCreditInformationTxt"/>
            </xsl:call-template>
          </div>
        </div>
        <br/>
         <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Lookback interest - completed long term contracts:</div>
          <div style="float:left;clear:none;width:118mm;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="./LkbckIntIncmCompLTCntrctsTxt"/>
            </xsl:call-template>
          </div>
        </div>
        <br/>
        <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Lookback interest - income forecast method:</div>
          <div style="float:left;clear:none;width:118mm;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="./LookbackIntIncmForecastMthdTxt"/>
            </xsl:call-template>
          </div>
        </div>
        <br/>
        <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Dispositions of property with section 179 deductions:</div>
          <div style="float:left;clear:none;width:118mm;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="./DispositionsPropSectionDedTxt"/>
            </xsl:call-template>
          </div>
        </div>
        <br/>
        <div class="styTopSectionLine" style="width:150mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Recapture of section 179 deduction:</div>
          <div style="float:left;clear:none;width:49mm;text-align:right;"><br/>
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="./Section179RecaptureAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <br/>
	
	<div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Special basis adjustments:</div>
          <div style="float:left;clear:none;width:118mm;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="./SpecialBasisAdjustmentsTxt"/>
            </xsl:call-template>
          </div>
        </div>
        <br/>
        <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Section 453(l)(3) information:</div>
          <div style="float:left;clear:none;width:118mm;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="./Section453l3InformationTxt"/>
            </xsl:call-template>
          </div>
        </div>
        <br/>
        <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Section 453A information:</div>
          <div style="float:left;clear:none;width:118mm;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="./Section453AInformationTxt"/>
            </xsl:call-template>
          </div>
        </div>
        <br/>
        <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Section 1260(b) information:</div>
          <div style="float:left;clear:none;width:118mm;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="./Section1260bInformationTxt"/>
            </xsl:call-template>
          </div>
        </div>
        <br/>
        <div class="styTopSectionLine" style="width:150mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Interest allocable to production expenditures:</div>
          <div style="float:left;clear:none;width:49mm;text-align:right"><br/>
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="./InterestAllocableProdExpendAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <br/>
        <div class="styTopSectionLine" style="width:150mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">CCF nonqualified withdrawal:</div>
          <div style="float:left;clear:none;width:49mm;text-align:right">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="./CCFNonqualifiedWithdrawalAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <br/>
        <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Information needed to figure depletion - oil and gas:</div>
          <div style="float:left;clear:none;width:118mm;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="./InfoNeededDpltnOilGasTxt"/>
            </xsl:call-template>
          </div>
        </div>
        <br/>
        <div class="styTopSectionLine" style="width:150mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Amortization of reforestation costs:</div>
          <div style="float:left;clear:none;width:49mm;text-align:right"><br/>
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="./AmortizationRforCostsAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <br/>
        <div class="styTopSectionLine" style="width:150mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Unrelated business taxable income:</div>
          <div style="float:left;clear:none;width:49mm;text-align:right"><br/>
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="./UnrelatedBusinessTaxblIncmAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <br/>
	
	<div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Other information:</div>
          <div style="float:left;clear:none;width:118mm;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="./OtherInformationTxt"/>
            </xsl:call-template>
          </div>
        </div>
        <br/>
	</td>
      </tr>
      </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>
  
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>  
  </xsl:param>
  
  <!-- Main template -->
  <xsl:template match="/">
    <html>
      <head>
          <title><xsl:value-of select="$depDocTitle"/></title>

         <!-- No Browser Caching -->
         <meta http-equiv="Pragma" content="no-cache"/>
         <meta http-equiv="Cache-Control" content="no-cache"/>
         <meta http-equiv="Expires" content="0"/>
         
         <!-- No Proxy Caching -->
         <meta http-equiv="Cache-Control" content="private"/>
         
         <!-- Define Character Set -->
         <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
         <meta name="Author" content="Jason Iozzo"/>
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
        <xsl:call-template name="DocumentHeaderDependency"/>
          
        <div class="styDepTitleLine">
          <span class="styDepTitle" style="width:60mm;">
            <xsl:value-of select="$depDocTitle"/>        
          </span>
        </div>
        
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>        
                
        <xsl:call-template name="ShowDependencyData"/>          
        <br/>                      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>