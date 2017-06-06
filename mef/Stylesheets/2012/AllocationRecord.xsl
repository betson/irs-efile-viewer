<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  <xsl:param name="DependencyData" select="$RtnDoc/AllocationRecord/AllocationInformationGrp" />
  <xsl:param name="depDocTitle">
  <xsl:call-template name="PopulateDisplayName">
  <xsl:with-param name="TargetNode" select="$DependencyData" />
  </xsl:call-template>  
  </xsl:param>
             <!--Total Allocation Group  -->  
    <xsl:template name="TotalAllocationGrpTemp">
    <table id="TotalAllocationGrpTbl" class="styDepTbl">
 <span class="styRepeatingDataTitle">Total Allocation Group</span>   
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
           <th class="styDepTblCell"  scope="col" style="text-align:center">Wages Amount</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Taxable Interest Amount</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Ordinary Dividends Amount</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">State Local Income Tax Refund Amount</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Captial Gain Loss Amount</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Taxable Pensions Amount</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Rental Real EST Amount</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Total Other Income Amount</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Total Income Amount</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Overpaid Amount</th>
        </tr>
      </thead>
      <tfoot></tfoot>
      <tbody>
       <xsl:for-each select="$DependencyData/TotalAllocationGrp">
        <!-- set row background -->
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
          <!--Total Allocation Group Wages Amount --> 
          <td class="styDepTblCell" style="width:35mm;text-align:right;font-size:7pt;">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="WagesAmt" />
                <xsl:with-param name="BackupName">TotalAllocationGrpWagesAmt</xsl:with-param>
             </xsl:call-template>          
          </td>
          <!--Total Allocation Group Taxable Interest Amount --> 
          <td class="styDepTblCell" style="width:35mm;text-align:right;font-size:7pt;">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TaxableInterestAmt" />
                <xsl:with-param name="BackupName">TotalAllocationGrpTaxableInterestAmt</xsl:with-param>
             </xsl:call-template>          
          </td>
          <!--Total Allocation Group Ordinary Dividends Amount --> 
          <td class="styDepTblCell" style="width:35mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="OrdinaryDividendsAmt" />
                <xsl:with-param name="BackupName">TotalAllocationGrpOrdinaryDividendsAmt</xsl:with-param>
             </xsl:call-template>          
          </td>
          <!--Total Allocation Group State Local Income Tax Refund Amount --> 
          <td class="styDepTblCell" style="width:35mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="StateLocalIncomeTaxRefundAmt" />
                <xsl:with-param name="BackupName">TotalAllocationGrpStateLocalIncomeTaxRefundAmt</xsl:with-param>
             </xsl:call-template>          
          </td>
           <!--Total Allocation Group Captial Gain Loss Amount --> 
          <td class="styDepTblCell" style="width:35mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="CaptialGainLossAmt" />
                <xsl:with-param name="BackupName">TotalAllocationGrpCaptialGainLossAmt</xsl:with-param>
             </xsl:call-template>          
          </td>
           <!--Total Allocation Group Taxable Pensions Amount --> 
          <td class="styDepTblCell" style="width:35mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TaxablePensionsAmt" />
                <xsl:with-param name="BackupName">TotalAllocationGrpTaxablePensionsAmt</xsl:with-param>
             </xsl:call-template>          
          </td>
           <!--Total Allocation Group Rental Real EST Amount --> 
          <td class="styDepTblCell" style="width:35mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="RentalRealESTAmt" />
                <xsl:with-param name="BackupName">TotalAllocationGrpRentalRealESTAmt</xsl:with-param>
             </xsl:call-template>          
          </td>
           <!--Total Allocation Group Total Other Income Amount --> 
         <td class="styDepTblCell" style="width:35mm;text-align:right;font-size:7pt"> 
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TotalOtherIncomeAmt" />
                <xsl:with-param name="BackupName">TotalAllocationGrpTotalOtherIncomeAmt</xsl:with-param>
             </xsl:call-template>          
          </td>
           <!--Total Allocation Group Total Income Amount --> 
          <td class="styDepTblCell" style="width:35mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TotalIncomeAmt" />
                <xsl:with-param name="BackupName">TotalAllocationGrpTotalIncomeAmt</xsl:with-param>
             </xsl:call-template>          
          </td>
           <!--Total Allocation Group Overpaid Amount --> 
          <td class="styDepTblCell" style="width:35mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="OverpaidAmt" />
                <xsl:with-param name="BackupName">TotalAllocationGrpOverpaidAmt</xsl:with-param>
             </xsl:call-template>          
          </td>
        </tr>
      </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>  
                <!--Husband Allocation Group  -->  
  <xsl:template name="HusbandAllocationGrpTemp">
    <table id="HusbandAllocationGrpTbl" class="styDepTbl">
 <span class="styRepeatingDataTitle">Husband Allocation Group</span>   
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
           <th class="styDepTblCell"  scope="col" style="text-align:center">Wages Amount</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Taxable Interest Amount</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Ordinary Dividends Amount</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">State Local Income Tax Refund Amount</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Captial Gain Loss Amount</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Taxable Pensions Amount</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Rental Real EST Amount</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Total Other Income Amount</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Total Income Amount</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Overpaid Amount</th>
        </tr>
      </thead>
      <tfoot></tfoot>
      <tbody>
       <xsl:for-each select="$DependencyData/HusbandAllocationGrp">
        <!-- set row background -->
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
          <!--Total Allocation Group Wages Amount --> 
          <td class="styDepTblCell" style="width:35mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="WagesAmt" />
                <xsl:with-param name="BackupName">HusbandAllocationGrpWagesAmt</xsl:with-param>
             </xsl:call-template>          
          </td>
          <!--Total Allocation Group Taxable Interest Amount --> 
          <td class="styDepTblCell" style="width:35mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TaxableInterestAmt" />
                <xsl:with-param name="BackupName">HusbandAllocationGrpTaxableInterestAmt</xsl:with-param>
             </xsl:call-template>          
          </td>
          <!--Total Allocation Group Ordinary Dividends Amount --> 
          <td class="styDepTblCell" style="width:35mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="OrdinaryDividendsAmt" />
                <xsl:with-param name="BackupName">HusbandAllocationGrpOrdinaryDividendsAmt</xsl:with-param>
             </xsl:call-template>          
          </td>
          <!--Total Allocation Group State Local Income Tax Refund Amount --> 
          <td class="styDepTblCell" style="width:35mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="StateLocalIncomeTaxRefundAmt" />
                <xsl:with-param name="BackupName">HusbandAllocationGrpStateLocalIncomeTaxRefundAmt</xsl:with-param>
             </xsl:call-template>          
          </td>
           <!--Total Allocation Group Captial Gain Loss Amount --> 
          <td class="styDepTblCell" style="width:35mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="CaptialGainLossAmt" />
                <xsl:with-param name="BackupName">HusbandAllocationGrpCaptialGainLossAmt</xsl:with-param>
             </xsl:call-template>          
          </td>
           <!--Total Allocation Group Taxable Pensions Amount --> 
          <td class="styDepTblCell" style="width:35mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TaxablePensionsAmt" />
                <xsl:with-param name="BackupName">HusbandAllocationGrpTaxablePensionsAmt</xsl:with-param>
             </xsl:call-template>          
          </td>
           <!--Total Allocation Group Rental Real EST Amount --> 
          <td class="styDepTblCell" style="width:35mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="RentalRealESTAmt" />
                <xsl:with-param name="BackupName">HusbandAllocationGrpRentalRealESTAmt</xsl:with-param>
             </xsl:call-template>          
          </td>
           <!--Total Allocation Group Total Other Income Amount --> 
          <td class="styDepTblCell" style="width:35mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TotalOtherIncomeAmt" />
                <xsl:with-param name="BackupName">HusbandAllocationGrpTotalOtherIncomeAmt</xsl:with-param>
             </xsl:call-template>          
          </td>
           <!--Total Allocation Group Total Income Amount --> 
          <td class="styDepTblCell" style="width:35mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TotalIncomeAmt" />
                <xsl:with-param name="BackupName">HusbandAllocationGrpTotalIncomeAmt</xsl:with-param>
             </xsl:call-template>          
          </td>
           <!--Total Allocation Group Overpaid Amount --> 
          <td class="styDepTblCell" style="width:35mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="OverpaidAmt" />
                <xsl:with-param name="BackupName">HusbandAllocationGrpOverpaidAmt</xsl:with-param>
             </xsl:call-template>          
          </td>
        </tr>
      </xsl:for-each>
      </tbody>
    </table>
  </xsl:template> 
                  <!--Wife Allocation Group  -->  
  <xsl:template name="WifeAllocationGrpTemp">
    <table id="WifeAllocationGrpTbl" class="styDepTbl">
 <span class="styRepeatingDataTitle">Wife Allocation Group</span>   
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
           <th class="styDepTblCell"  scope="col" style="text-align:center">Wages Amount</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Taxable Interest Amount</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Ordinary Dividends Amount</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">State Local Income Tax Refund Amount</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Captial Gain Loss Amount</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Taxable Pensions Amount</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Rental Real EST Amount</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Total Other Income Amount</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Total Income Amount</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Overpaid Amount</th>
        </tr>
      </thead>
      <tfoot></tfoot>
      <tbody>
       <xsl:for-each select="$DependencyData/WifeAllocationGrp">
        <!-- set row background -->
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
          <!--Total Allocation Group Wages Amount --> 
          <td class="styDepTblCell" style="width:35mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="WagesAmt" />
                <xsl:with-param name="BackupName">WifeAllocationGrpWagesAmt</xsl:with-param>
             </xsl:call-template>          
          </td>
          <!--Total Allocation Group Taxable Interest Amount --> 
          <td class="styDepTblCell" style="width:35mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TaxableInterestAmt" />
                <xsl:with-param name="BackupName">WifeAllocationGrpTaxableInterestAmt</xsl:with-param>
             </xsl:call-template>          
          </td>
          <!--Total Allocation Group Ordinary Dividends Amount --> 
          <td class="styDepTblCell" style="width:35mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="OrdinaryDividendsAmt" />
                <xsl:with-param name="BackupName">HWifeAllocationGrpOrdinaryDividendsAmt</xsl:with-param>
             </xsl:call-template>          
          </td>
          <!--Total Allocation Group State Local Income Tax Refund Amount --> 
          <td class="styDepTblCell" style="width:35mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="StateLocalIncomeTaxRefundAmt" />
                <xsl:with-param name="BackupName">WifeAllocationGrpStateLocalIncomeTaxRefundAmt</xsl:with-param>
             </xsl:call-template>          
          </td>
           <!--Total Allocation Group Captial Gain Loss Amount --> 
          <td class="styDepTblCell" style="width:35mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="CaptialGainLossAmt" />
                <xsl:with-param name="BackupName">WifeAllocationGrpCaptialGainLossAmt</xsl:with-param>
             </xsl:call-template>          
          </td>
           <!--Total Allocation Group Taxable Pensions Amount --> 
          <td class="styDepTblCell" style="width:35mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TaxablePensionsAmt" />
                <xsl:with-param name="BackupName">WifeAllocationGrpTaxablePensionsAmt</xsl:with-param>
             </xsl:call-template>          
          </td>
           <!--Total Allocation Group Rental Real EST Amount --> 
          <td class="styDepTblCell" style="width:35mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="RentalRealESTAmt" />
                <xsl:with-param name="BackupName">WifeAllocationGrpRentalRealESTAmt</xsl:with-param>
             </xsl:call-template>          
          </td>
           <!--Total Allocation Group Total Other Income Amount --> 
          <td class="styDepTblCell" style="width:35mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TotalOtherIncomeAmt" />
                <xsl:with-param name="BackupName">WifeAllocationGrpTotalOtherIncomeAmt</xsl:with-param>
             </xsl:call-template>          
          </td>
           <!--Total Allocation Group Total Income Amount --> 
          <td class="styDepTblCell" style="width:35mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TotalIncomeAmt" />
                <xsl:with-param name="BackupName">WifeAllocationGrpTotalIncomeAmt</xsl:with-param>
             </xsl:call-template>          
          </td>
           <!--Total Allocation Group Overpaid Amount --> 
          <td class="styDepTblCell" style="width:35mm;text-align:right;font-size:7pt">
             <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="OverpaidAmt" />
                <xsl:with-param name="BackupName">WifeAllocationGrpOverpaidAmt</xsl:with-param>
             </xsl:call-template>          
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
      <xsl:call-template name="DocumentHeaderDependency">
      </xsl:call-template>
    
        <div class="styDepTitleLine">
          <span class="styDepTitle">
            <span style="width:187mm;">
              <xsl:value-of select="$depDocTitle" />
            </span>
          </span>
        </div>
        
        <xsl:call-template name="PopulateDepCommonLeftover">
        <xsl:with-param name="TargetNode" select="$DependencyData" />
        </xsl:call-template><br/>                
        <xsl:call-template name="TotalAllocationGrpTemp" /><br/>
        <xsl:call-template name="HusbandAllocationGrpTemp" /><br/> 
        <xsl:call-template name="WifeAllocationGrpTemp" /> 
        
              
         
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>

