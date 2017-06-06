<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>

<xsl:output method="html" indent="yes" />
<xsl:strip-space elements="*" />
  
  <xsl:param name="DependencyData" select="$RtnDoc/GrossReceiptsInstalSalesSch" />

  <xsl:param name="depDocTitle">
  <xsl:call-template name="PopulateDisplayName">
  <xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>  
  </xsl:param>
  
  <xsl:template name="GrossReceiptsInstalSalesSchTemp">
      <xsl:for-each select="$DependencyData/GrossReceiptsInstalSalesInfo">
      <table id="GrossReceiptsInstalSalesSchTbl" class="styDepTbl">  
<!-- Item No. -->
    <tr class="styDepTblRow1">
      <th class="styDepTblCell" scope="row"  style="width:40%;text-align:right;">Item No.</th>
      <td class="styDepTblCell" style="text-align:right;" ><xsl:value-of select="position()" /></td>
    </tr>
    
<!--Corporation name-->
        <tr  class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
          <xsl:if test="CorporationName">
            Corporation Name
           </xsl:if> 
           <xsl:if test="PersonName">
            Person Name
           </xsl:if> 
          </th>
          <td class="styDepTblCell" style="text-align:left;" >
             <xsl:if test="CorporationName">
               <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine1" />
              </xsl:call-template>
              <br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine2" />
              </xsl:call-template>
             </xsl:if>
                <xsl:if test="PersonName">
               <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="PersonName" />
              </xsl:call-template>
              </xsl:if>
          </td>
        </tr> 
          
<!--Corporation EIN-->
     <xsl:if test="CorporationEIN!=' '">
        <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">        
            Corporation EIN
            <td class="styDepTblCell" style="text-align:center;" >
            <span style="width:44mm;">
                        <xsl:call-template name="PopulateEIN">
                          <xsl:with-param name="TargetNode" select="CorporationEIN" />
                      </xsl:call-template>
              </span>
            </td>  
          </th>
          </tr>
          </xsl:if> 
          
        <xsl:if test="SSN!=' '">
        <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">        
            SSN
            <td class="styDepTblCell" style="text-align:center;" >
            <span style="width:44mm;">
                        <xsl:call-template name="PopulateSSN">
                          <xsl:with-param name="TargetNode" select="SSN" />
                      </xsl:call-template>
              </span>
            </td>  
          </th>
          </tr>
          </xsl:if> 
          
           <xsl:if test="AppliedForEINReasonCD!=' '">
        <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">        
            Applied For EIN Reason CD
            <td class="styDepTblCell" style="text-align:center;" >
            <span style="width:44mm;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="AppliedForEINReasonCD" />
                      </xsl:call-template>
              </span>
            </td>  
          </th>
          </tr>
          </xsl:if> 
          
        <xsl:if test="MissingEINReason!=' '">
        <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">        
            Missing EIN Reason
            <td class="styDepTblCell" style="text-align:center;" >
            <span style="width:44mm;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="MissingEINReason" />
                      </xsl:call-template>
              </span>
            </td>  
          </th>
          </tr>
          </xsl:if> 
<!--Current Year-->
        <tr  class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Current Year Gross Sales
          </th>
          <td class="styDepTblCell" style="text-align:right;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="CurrentYear/GrossSales" />
              </xsl:call-template>
            </span>
          </td>
        </tr>
        <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Current Year Cost of Goods Sold
          </th>
          <td class="styDepTblCell" style="text-align:right;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="CurrentYear/CostOfGoodsSold" />
              </xsl:call-template>
            </span>
          </td>
        </tr>      
        <tr  class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Current Year Gross Profits
          </th>
          <td class="styDepTblCell" style="text-align:right;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="CurrentYear/GrossProfits" />
              </xsl:call-template>
            </span>
          </td>
        </tr>
        <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Current Year Percentage of Gross Profits to Gross Sales
          </th>
          <td class="styDepTblCell" style="text-align:right;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="CurrentYear/PctGrossProftToGrossSales" />
              </xsl:call-template>
            </span>
          </td>
        </tr>
        <tr  class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Current Year Amount Collected
          </th>
          <td class="styDepTblCell" style="text-align:right;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="CurrentYear/AmountCollected" />
              </xsl:call-template>
            </span>
          </td>
        </tr>
        <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Current Year Gross Profit on the Amount Collected
          </th>
          <td class="styDepTblCell" style="text-align:right;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="CurrentYear/GrossProfitOnAmountCollected" />
              </xsl:call-template>
            </span>
          </td>
        </tr>        

<!--First Preceding Year-->
        <tr  class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            First Preceding Year Gross Sales
          </th>
          <td class="styDepTblCell" style="text-align:right;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="FirstPrecedingYear/GrossSales" />
              </xsl:call-template>
            </span>
          </td>
        </tr>
        <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            First Preceding Year Cost of Goods Sold
          </th>
          <td class="styDepTblCell" style="text-align:right;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="FirstPrecedingYear/CostOfGoodsSold" />
              </xsl:call-template>
            </span>
          </td>
        </tr>      
        <tr  class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            First Preceding Year Gross Profits
          </th>
          <td class="styDepTblCell" style="text-align:right;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="FirstPrecedingYear/GrossProfits" />
              </xsl:call-template>
            </span>
          </td>
        </tr>
        <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            First Preceding Year Percentage of Gross Profits to Gross Sales
          </th>
          <td class="styDepTblCell" style="text-align:right;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="FirstPrecedingYear/PctGrossProftToGrossSales" />
              </xsl:call-template>
            </span>
          </td>
        </tr>
        <tr  class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            First Preceding Year Amount Collected
          </th>
          <td class="styDepTblCell" style="text-align:right;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="FirstPrecedingYear/AmountCollected" />
              </xsl:call-template>
            </span>
          </td>
        </tr>
        <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            First Preceding Year Gross Profit on the Amount Collected
          </th>
          <td class="styDepTblCell" style="text-align:right;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="FirstPrecedingYear/GrossProfitOnAmountCollected" />
              </xsl:call-template>
            </span>
          </td>
        </tr>        

<!--Second Preceding Year-->
        <tr  class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Second Preceding Year Gross Sales
          </th>
          <td class="styDepTblCell" style="text-align:right;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="SecondPrecedingYear/GrossSales" />
              </xsl:call-template>
            </span>
          </td>
        </tr>
        <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Second Preceding Year Cost of Goods Sold
          </th>
          <td class="styDepTblCell" style="text-align:right;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="SecondPrecedingYear/CostOfGoodsSold" />
              </xsl:call-template>
            </span>
          </td>
        </tr>      
        <tr  class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Second Preceding Year Gross Profits
          </th>
          <td class="styDepTblCell" style="text-align:right;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="SecondPrecedingYear/GrossProfits" />
              </xsl:call-template>
            </span>
          </td>
        </tr>
        <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Second Preceding Year Percentage of Gross Profits to Gross Sales
          </th>
          <td class="styDepTblCell" style="text-align:right;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="SecondPrecedingYear/PctGrossProftToGrossSales" />
              </xsl:call-template>
            </span>
          </td>
        </tr>
        <tr  class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Second Preceding Year Amount Collected
          </th>
          <td class="styDepTblCell" style="text-align:right;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="SecondPrecedingYear/AmountCollected" />
              </xsl:call-template>
            </span>
          </td>
        </tr>
        <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Second Preceding Year Gross Profit on the Amount Collected
          </th>
          <td class="styDepTblCell" style="text-align:right;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="SecondPrecedingYear/GrossProfitOnAmountCollected" />
              </xsl:call-template>
            </span>
          </td>
        </tr>
<!--Third Preceding Year-->
        <tr  class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Third Preceding Year Gross Sales
          </th>
          <td class="styDepTblCell" style="text-align:right;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="ThirdPrecedingYear/GrossSales" />
              </xsl:call-template>
            </span>
          </td>
        </tr>
        <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Third Preceding Year Cost of Goods Sold
          </th>
          <td class="styDepTblCell" style="text-align:right;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="ThirdPrecedingYear/CostOfGoodsSold" />
              </xsl:call-template>
            </span>
          </td>
        </tr>      
        <tr  class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Third Preceding Year Gross Profits
          </th>
          <td class="styDepTblCell" style="text-align:right;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="ThirdPrecedingYear/GrossProfits" />
              </xsl:call-template>
            </span>
          </td>
        </tr>
        <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Third Preceding Year Percentage of Gross Profits to Gross Sales
          </th>
          <td class="styDepTblCell" style="text-align:right;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ThirdPrecedingYear/PctGrossProftToGrossSales" />
              </xsl:call-template>
            </span>
          </td>
        </tr>
        <tr  class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Third Preceding Year Amount Collected
          </th>
          <td class="styDepTblCell" style="text-align:right;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="ThirdPrecedingYear/AmountCollected" />
              </xsl:call-template>
            </span>
          </td>
        </tr>
        <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Third Preceding Year Gross Profit on the Amount Collected
          </th>
          <td class="styDepTblCell" style="text-align:right;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="ThirdPrecedingYear/GrossProfitOnAmountCollected" />
              </xsl:call-template>
            </span>
          </td>
        </tr>        
      </table>
      <br/>
      </xsl:for-each>        
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
            <span style="width:90mm;"><xsl:value-of select="$depDocTitle" /></span>
          </span>
        </div>  
            
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>          
        <xsl:call-template name="GrossReceiptsInstalSalesSchTemp" />
        <br/>                      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







