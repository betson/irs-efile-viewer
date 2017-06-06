<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>
<xsl:output method="html" indent="yes" />
<xsl:strip-space elements="*" />
  <xsl:param name="DependencyData" select="$RtnDoc/InstallmentMethodSchedule" />
  <xsl:param name="depDocTitle">
  <xsl:call-template name="PopulateDisplayName">
  <xsl:with-param name="TargetNode" select="$DependencyData" />
  </xsl:call-template>  
  </xsl:param>
  <xsl:template name="InstallmentMethodScheduleTemp">
      <table id="GrossReceiptsInstalSalesSchTbl" class="styDepTbl">              
<!--Current Year-->
<thead class="styTableThead">
        <tr  class="styDepTblRow2">
        <th class="styDepTblCell" scope="col" colspan="1"  style="width:70mm;">
          </th>
          <th class="styDepTblCell" scope="col" colspan="1" style="width:34mm;">
            Current Year 
          </th>
          <th class="styDepTblCell" scope="col" colspan="1" style="width:34mm;">
            1st Prior Year
          </th>
          <th class="styDepTblCell" scope="col" colspan="1"  style="width:34mm;">
            2nd Prior Year
          </th>
           <th class="styDepTblCell" scope="col" colspan="1" style="width:34mm;">
           3rd Prior Year
          </th>
        </tr>
        	</thead>
			<tfoot/>
				<tbody>
				<!--  Gross Sales Amount-->
        <tr  class="styDepTblRow1">
         <td class="styDepTblCell" style="text-align:left;width:55mm;" >
             Gross Sales Amount
          </td>
        <td class="styDepTblCell" style="text-align:right;" >
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$DependencyData/CurrentYearAmts/GrossSalesAmt" />
              </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="text-align:right;width:35mm;" >
            
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$DependencyData/PriorYear1Amts/GrossSalesAmt" />
              </xsl:call-template>
            
          </td>
          
           <td class="styDepTblCell" style="text-align:right;width:35mm;" >
           
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$DependencyData/PriorYear2Amts/GrossSalesAmt" />
              </xsl:call-template>
           
          </td>
          <td class="styDepTblCell" style="text-align:right;width:35mm;" >
           
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$DependencyData/PriorYear3Amts/GrossSalesAmt" />
              </xsl:call-template>
           
          </td>
        </tr>     
        <!--Cost of Goods Sold Amount-->
        <tr  class="styDepTblRow2">
        <td class="styDepTblCell" style="text-align:left;width:55mm;" >
           Cost of Goods Sold Amount
          </td>
        <td class="styDepTblCell" style="text-align:right;width:35mm;" >
           
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$DependencyData/CurrentYearAmts/CostOfGoodsSoldAmt" />
              </xsl:call-template>
           
          </td>
          <td class="styDepTblCell" style="text-align:right;width:35mm;" >
            
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$DependencyData/PriorYear1Amts/CostOfGoodsSoldAmt" />
              </xsl:call-template>
            
          </td>
           <td class="styDepTblCell" style="text-align:right;width:35mm;" >
          
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$DependencyData/PriorYear2Amts/CostOfGoodsSoldAmt" />
              </xsl:call-template>
            
          </td>
          <td class="styDepTblCell" style="text-align:right;width:35mm;" >
           
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$DependencyData/PriorYear3Amts/CostOfGoodsSoldAmt" />
              </xsl:call-template>
           
          </td>
        </tr>
        <!--Gross Profit Amount-->
        <tr  class="styDepTblRow2">
         <td class="styDepTblCell" style="text-align:left;" >
            
           Gross Profit Amount
           
          </td>
        <td class="styDepTblCell" style="text-align:right;width:35mm;" >
          
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$DependencyData/CurrentYearAmts/GrossProfitAmt" />
              </xsl:call-template>
           
          </td>
          <td class="styDepTblCell" style="text-align:right;width:35mm;" >
           
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$DependencyData/PriorYear1Amts/GrossProfitAmt" />
              </xsl:call-template>
           
          </td>
           <td class="styDepTblCell" style="text-align:right;width:35mm;" >
          
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$DependencyData/PriorYear2Amts/GrossProfitAmt" />
              </xsl:call-template>
          
          </td>
          <td class="styDepTblCell" style="text-align:right;width:35mm;" >
           
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$DependencyData/PriorYear3Amts/GrossProfitAmt" />
              </xsl:call-template>
           
          </td>
        </tr>        
<!--Gross Profits to Gross Sales Percentage-->
        <tr  class="styDepTblRow2">
         <td class="styDepTblCell" style="text-align:left;" >
            
         Gross Profits to Gross Sales Percentage
           
          </td>
        <td class="styDepTblCell" style="text-align:right;width:35mm;" >
           
              <xsl:call-template name="PopulatePercent">
                <xsl:with-param name="TargetNode" select="$DependencyData/CurrentYearAmts/GrossProfitsToGrossSalesPct" />
              </xsl:call-template>
            
          </td>
          <td class="styDepTblCell" style="text-align:right;width:35mm;" >
           
              <xsl:call-template name="PopulatePercent">
                <xsl:with-param name="TargetNode" select="$DependencyData/PriorYear1Amts/GrossProfitsToGrossSalesPct" />
              </xsl:call-template>
            
          </td>
           <td class="styDepTblCell" style="text-align:right;width:35mm;" >
            
              <xsl:call-template name="PopulatePercent">
                <xsl:with-param name="TargetNode" select="$DependencyData/PriorYear2Amts/GrossProfitsToGrossSalesPct" />
              </xsl:call-template>
           
          </td>
          <td class="styDepTblCell" style="text-align:right;width:35mm;" >
           
              <xsl:call-template name="PopulatePercent">
                <xsl:with-param name="TargetNode" select="$DependencyData/PriorYear3Amts/GrossProfitsToGrossSalesPct" />
              </xsl:call-template>
           
          </td>
            </tr>   
            <!--   Collected Amount-->
        <tr  class="styDepTblRow1">
           <td class="styDepTblCell" style="text-align:left;" >
           
         Collected Amount
           
          </td>
        <td class="styDepTblCell" style="text-align:right;width:35mm;" >
           
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$DependencyData/CurrentYearAmts/CollectedAmt" />
              </xsl:call-template>
           
          </td>
          <td class="styDepTblCell" style="text-align:right;width:35mm;" >
           
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$DependencyData/PriorYear1Amts/CollectedAmt" />
              </xsl:call-template>
           
          </td>
           <td class="styDepTblCell" style="text-align:right;width:35mm;" >
           
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$DependencyData/PriorYear2Amts/CollectedAmt" />
              </xsl:call-template>
           
          </td>
          <td class="styDepTblCell" style="text-align:right;width:35mm;" >
           
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$DependencyData/PriorYear3Amts/CollectedAmt" />
              </xsl:call-template>
          
          </td>
        </tr>  
        <!--Gross Profit on Collected Amount-->
        <tr  class="styDepTblRow2">
    <td class="styDepTblCell" style="text-align:left;" >
            
        Gross Profit on Collected Amount
            
          </td>
        <td class="styDepTblCell" style="text-align:right;width:35mm;" >
            
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$DependencyData/CurrentYearAmts/GrossProfitOnCollectedAmt" />
              </xsl:call-template>
           
          </td>
          <td class="styDepTblCell" style="text-align:right;width:35mm;" >
          
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$DependencyData/PriorYear1Amts/GrossProfitOnCollectedAmt" />
              </xsl:call-template>
           
          </td>
           <td class="styDepTblCell" style="text-align:right;width:35mm;" >
          
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$DependencyData/PriorYear2Amts/GrossProfitOnCollectedAmt" />
              </xsl:call-template>
          
          </td>
          <td class="styDepTblCell" style="text-align:right;width:35mm;" >
           
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$DependencyData/PriorYear3Amts/GrossProfitOnCollectedAmt" />
              </xsl:call-template>
           
          </td>
        </tr>
        </tbody>      
      </table>
      <br/>
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
         <meta name="Author" content="Venkata Boggavarapu" />
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
      <body class="styBodyClass" >
      <xsl:call-template name="DocumentHeaderDependency"></xsl:call-template>
        <div class="styDepTitleLine">
          <span class="styDepTitle">
            <span style="width:187mm;"><xsl:value-of select="$depDocTitle" /></span>
          </span>
        </div>  
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>          
        <xsl:call-template name="InstallmentMethodScheduleTemp" />
        <br/>                      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







