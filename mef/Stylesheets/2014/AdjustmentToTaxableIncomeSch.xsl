<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
    
  <xsl:include href="PopulateTemplate.xsl"/>
   <xsl:include href="AddHeader.xsl"/>
   <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>  

  <xsl:param name="DependencyData" select="$RtnDoc/AdjustmentToTaxableIncomeSch"/>

  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>  
  </xsl:param>

<!-- Template to display PropertyDepreciated Info table-->

<!-- DepreciationAmountsInfo is a counter for the inner loop; add 1 to account for additional row in the outer loop -->
<xsl:template name="AdjustmentToTaxableIncomeTemp1">
    <table id="AdjustmentToTaxableIncomeTbl" class="styDepTbl" style="font-size:7pt;">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
          <th class="styDepTblCell" scope="col" style="width:17mm;text-align:center">Year</th>
          <th class="styDepTblCell" scope="col" style="width:70mm;text-align:center">Name of Property depreciated under the forecast method to which this form applies</th>
          <th class="styDepTblCell" scope="col" style="width:50mm;text-align:center">1.  Column A: Amount  of depreciation previously deducted based on estimated future income          </th>
          <th class="styDepTblCell" scope="col" style="width:50mm;text-align:center">2.  Column B: Amount of depreciation allowable for prior year</th>
          
        </tr>
       </thead>
        <tfoot/>
        <tbody>
        <xsl:for-each select="$DependencyData/PropertyDepreciatedInfo">  
          <tr>
            <!-- Set row background color -->
            <xsl:attribute name="class">
              <xsl:choose>
                 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
            <td class="styDepTblCell" scope="col" style="text-align:center;font-size: 7pt;width:17mm;">
              <xsl:attribute name="rowspan">
              <xsl:value-of select="count(DepreciationAmountsInfo)"/>
              </xsl:attribute>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="Yr"/>
              </xsl:call-template>
            </td>
            <xsl:if test="count(DepreciationAmountsInfo)=0 or count(DepreciationAmountsInfo)=1">
              <td class="styDepTblCell" scope="col" style="text-align:left;font-size: 7pt;width:70mm;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="DepreciationAmountsInfo/PropertyDesc"/>
                  </xsl:call-template>
                </td>
                <td class="styDepTblCell" scope="col" style="text-align:right;font-size: 7pt; width: 50mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="DepreciationAmountsInfo/DeprecDeductedForPYColmAAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styDepTblCell" scope="col" style="text-align:right;font-size: 7pt; width: 50mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="DepreciationAmountsInfo/DeprecAllowableForPYColmBAmt"/>
                  </xsl:call-template>
                </td>
            </xsl:if>
            
            <xsl:if test="count(DepreciationAmountsInfo)&gt; 1">
              
                <td class="styDepTblRow1Cell" scope="col" style="text-align:left;font-size: 7pt;width:70mm;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="DepreciationAmountsInfo/PropertyDesc"/>
                  </xsl:call-template>
                </td>
                <td class="styDepTblRow1Cell" scope="col" style="text-align:right;font-size: 7pt; width: 50mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="DepreciationAmountsInfo/DeprecDeductedForPYColmAAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styDepTblRow1Cell" scope="col" style="text-align:right;font-size: 7pt; width: 50mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="DepreciationAmountsInfo/DeprecAllowableForPYColmBAmt"/>
                  </xsl:call-template>
                </td>
            </xsl:if>

            </tr>
            
          
                            
          <xsl:for-each select="DepreciationAmountsInfo">        
            <xsl:if test="position() &gt; 1">
              <tr>
                <!-- Set row background color -->
                <xsl:attribute name="class">
                  <xsl:choose>
                     <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                     <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                  </xsl:choose>
                </xsl:attribute>
                <td class="styDepTblCell" scope="col" style="text-align:left;font-size: 7pt;width:70mm;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="PropertyDesc"/>
                  </xsl:call-template>
                </td>
                <td class="styDepTblCell" scope="col" style="text-align:right;font-size: 7pt; width: 50mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="DeprecDeductedForPYColmAAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styDepTblCell" scope="col" style="text-align:right;font-size: 7pt; width: 50mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="DeprecAllowableForPYColmBAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
            </xsl:if>
          </xsl:for-each>
          <tr class="styDepTblHdr">
            <td class="styDepTblCell" colspan="2" style="text-align:left;font-size: 7pt;font-weight:bold;width:87mm">
            Total amount
            </td>
            <td class="styDepTblCell" style="text-align:right;width:50mm">
              
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="WhiteFont">true</xsl:with-param>
                <xsl:with-param name="TargetNode" select="TotalPropertyDeprecColmAAmt"/>
              </xsl:call-template>          
            </td>
            
            <td class="styDepTblCell" style="text-align:right;width:50mm;">
              
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="WhiteFont">true</xsl:with-param>
                <xsl:with-param name="TargetNode" select="TotalPropertyDeprecColmBAmt"/>
              </xsl:call-template>          
            </td>
      </tr>
            
      <tr class="styDepTblHdr">
            <td class="styDepTblCell" colspan="2" style="text-align:left;font-size: 7pt;font-weight:bold; width:87mm;">
              Net of all property depreciation for year
            </td>

            <td class="styDepTblCell" colspan="2" style="text-align:right;font-size: 7pt;width:100mm;">
              
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="WhiteFont">true</xsl:with-param>
                <xsl:with-param name="TargetNode" select="NetTotPropertyDeprecForPYAmt"/>
              </xsl:call-template>          
            </td>                                      
        </tr>
        
        </xsl:for-each>
      </tbody>
    </table>
</xsl:template>

<!--Other Adjustments Table-->

<xsl:template name="AdjustmentToTaxableIncomeTemp2">
    <table id="AdjToTaxableIncomeTbl" class="styDepTbl" style="font-size:7pt;">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
          <th class="styDepTblCell" scope="col" style="width:17mm;text-align:center">Year</th>
          <th class="styDepTblCell" scope="col" style="width:70mm;text-align:center">Type of Adjustment</th>
          <th class="styDepTblCell" scope="col" style="width:50mm;text-align:center">a.  Column A: Amount of Any other Adjustments resulting from a change in depreciation of depreciation previously deducted          </th>
          <th class="styDepTblCell" scope="col" style="width:50mm;text-align:center">b.  Column B: Amount of Any other Adjustments resulting from a change in depreciation of depreciation allowable for prior year</th>
          
        </tr>
       </thead>
        <tfoot/>
        <tbody>
        <xsl:for-each select="$DependencyData/OtherAdjustmentsInfo">  
          <tr>
            <!-- Set row background color -->
            <xsl:attribute name="class">
              <xsl:choose>
                 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
            <td class="styDepTblCell" scope="col" style="text-align:center;font-size: 7pt;width:17mm;">
              <xsl:attribute name="rowspan">
              <xsl:value-of select="count(OtherAdjAmountsInfo)"/>
              </xsl:attribute>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="Yr"/>
              </xsl:call-template>
            </td>
            <xsl:if test="count(OtherAdjAmountsInfo)=0 or count(OtherAdjAmountsInfo)=1">
              <td class="styDepTblCell" scope="col" style="text-align:left;font-size: 7pt;width:70mm;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="OtherAdjAmountsInfo/AdjustmentTypeDesc"/>
                  </xsl:call-template>
                </td>
                <td class="styDepTblCell" scope="col" style="text-align:right;font-size: 7pt; width: 50mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="OtherAdjAmountsInfo/OthAdjChgPrevDeductedColmAAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styDepTblCell" scope="col" style="text-align:right;font-size: 7pt; width: 50mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="OtherAdjAmountsInfo/OthAdjChgPrevAllowableColmBAmt"/>
                  </xsl:call-template>
                </td>

            </xsl:if>
            
            <xsl:if test="count(OtherAdjAmountsInfo) &gt; 1">
              
                <td class="styDepTblRow1Cell" scope="col" style="text-align:left;font-size: 7pt;width:70mm;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="OtherAdjAmountsInfo/AdjustmentTypeDesc"/>
                  </xsl:call-template>
                </td>
                <td class="styDepTblRow1Cell" scope="col" style="text-align:right;font-size: 7pt; width: 50mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="OtherAdjAmountsInfo/OthAdjChgPrevDeductedColmAAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styDepTblRow1Cell" scope="col" style="text-align:right;font-size: 7pt; width: 50mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="OtherAdjAmountsInfo/OthAdjChgPrevAllowableColmBAmt"/>
                  </xsl:call-template>
                </td>
              </xsl:if>
              </tr>

            
            
                                    
          <xsl:for-each select="OtherAdjAmountsInfo">        
            <xsl:if test="position() &gt; 1">
              <tr>
                <!-- Set row background color -->
                <xsl:attribute name="class">
                  <xsl:choose>
                     <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                     <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                  </xsl:choose>
                </xsl:attribute>
                <td class="styDepTblCell" scope="col" style="text-align:left;font-size: 7pt;width:70mm;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="AdjustmentTypeDesc"/>
                  </xsl:call-template>
                </td>
                <td class="styDepTblCell" scope="col" style="text-align:right;font-size: 7pt; width: 50mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="OthAdjChgPrevDeductedColmAAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styDepTblCell" scope="col" style="text-align:right;font-size: 7pt; width: 50mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="OthAdjChgPrevAllowableColmBAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
            </xsl:if>
          </xsl:for-each>
          <tr class="styDepTblHdr">
            <td class="styDepTblCell" colspan="2" style="text-align:left;font-size: 7pt;font-weight:bold;width:87mm">
            Total of All Other Adjustments for year
            </td>
            <td class="styDepTblCell" style="text-align:right;width:50mm">
              
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="WhiteFont">true</xsl:with-param>
                <xsl:with-param name="TargetNode" select="TotalOtherAdjustmentColmAAmt"/>
              </xsl:call-template>          
            </td>
            
            <td class="styDepTblCell" style="text-align:right;width:50mm;">
              
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="WhiteFont">true</xsl:with-param>
                <xsl:with-param name="TargetNode" select="TotalOtherAdjustmentColmBAmt"/>
              </xsl:call-template>          
            </td>
      </tr>
            
      <tr class="styDepTblHdr">
            <td class="styDepTblCell" colspan="2" style="text-align:left;font-size: 7pt;font-weight:bold; width:87mm;">
              Net of all other adjustment for year
            </td>

            <td class="styDepTblCell" colspan="2" style="text-align:right;font-size: 7pt;width:100mm;">
              
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="WhiteFont">true</xsl:with-param>
                <xsl:with-param name="TargetNode" select="NetTotOtherAdjustmentsForPYAmt"/>
              </xsl:call-template>          
            </td>                                      
        </tr>
        
        </xsl:for-each>
      </tbody>
    </table>
</xsl:template>

<!--Net Adjustment Table-->
  <xsl:template name="AdjustmentToTaxableIncomeTemp3">
  
  
    <table id="AdTTI" class="styDepTbl" style="font-size:7pt;">
      <tr class="styDepTblHdr">
        <th class="styDepTblCell" scope="col" style="width:67mm">Year</th>
        <th class="styDepTblCell" scope="col" style="width:120mm">Net of all property depreciation and all other adjustment for aplicable year</th>
                                        
      </tr>      
      <xsl:for-each select="$DependencyData/NetAdjustmentsInfo">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
          <td class="styDepTblCell" style="text-align:center;width:67mm;">            
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="Yr"/></xsl:call-template>             
          </td>                      
          <td class="styDepTblCell" style="text-align:right; width:120mm;">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="NetOfAllPropAndOtherAdjForPY"/></xsl:call-template>             
          </td>
                                      
        </tr>
      </xsl:for-each>
    </table>
  </xsl:template>

  
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
         <meta name="Author" content="Polina Zhuravlev"/>
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
          <span class="styDepTitle">
            <span style="width:58mm;"><xsl:value-of select="$depDocTitle"/></span>      
          </span>
        </div>


        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>
        
        <!-- Transform Retained Earnings Appr Schedule -->
        <xsl:call-template name="AdjustmentToTaxableIncomeTemp1"/>
        <br/>
        <br/>
        


        <xsl:call-template name="AdjustmentToTaxableIncomeTemp2"/>
        <br/>
        <br/>
        

        <xsl:call-template name="AdjustmentToTaxableIncomeTemp3"/>
        

      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>