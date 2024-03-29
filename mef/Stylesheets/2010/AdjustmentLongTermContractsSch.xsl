<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>

  <xsl:param name="AdjustmentLongTermContractsSchData" select="$RtnDoc/AdjustmentLongTermContractsSch" />
  <!-- Template to display Itemized Other Income Schedule -->
  <xsl:template name="ShowAdjustmentLongTermContractsSch">
    <!-- Itemized Other Income Schedule Data -->
    <table id="AdjustmentLongTermContractsSchTbl" class="styDepTblLandscape">
      <thead class="styDepTableThead">
        <tr class="styDepTblHdr">
           <th class="styDepTblCell" scope="col" style="font-size: 7pt;">a. Contract number</th>
           <th class="styDepTblCell" scope="col" style="font-size: 7pt;">b. Job name</th>
           <th class="styDepTblCell" scope="col" style="font-size: 7pt;">c. Other identifying information</th>
           <th class="styDepTblCell" scope="col" style="font-size: 7pt;">Year identifier</th>
           <th class="styDepTblCell" scope="col" style="font-size: 7pt;">a. Income previously reported based on estimated contract price and costs</th>
           <th class="styDepTblCell" scope="col" style="font-size: 7pt;">b. Income allocable to each prior year based on actual contract price and costs</th>
           <th class="styDepTblCell" scope="col" style="font-size: 7pt;">c. Other adjustments</th>
           <th class="styDepTblCell" scope="col" style="font-size: 7pt;">d. Net adjustment to income from long-term contracts</th>
        </tr>
      </thead>
      <tfoot></tfoot>
      <tbody>
        <xsl:for-each select="$AdjustmentLongTermContractsSchData/Schedule">  
          <tr>
            <!-- Set row background color -->
            <xsl:attribute name="class">
              <xsl:choose>
                 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
            <td class="styDepTblCell" scope="col"  style="text-align:left;font-size: 7pt; width: 35mm;">
              <xsl:attribute name="rowspan">
              <xsl:value-of select="count(PYLongTermContract)"/>
              </xsl:attribute>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ContractNumber" />
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" scope="col"  style="text-align:left;font-size: 7pt;">
              <xsl:attribute name="rowspan">
              <xsl:value-of select="count(PYLongTermContract)"/>
              </xsl:attribute>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="JobName" />
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" scope="col"  style="text-align:left;font-size: 7pt;">
              <xsl:attribute name="rowspan">
              <xsl:value-of select="count(PYLongTermContract)"/>
              </xsl:attribute>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="OtherIdentifyingInformation" />
              </xsl:call-template>
            </td>
            <!-- Test for no data or only one instance of data - if, then fill the cell with the proper color -->
            <xsl:if test="count(PYLongTermContract)=0 or count (PYLongTermContract)=1">
              <td class="styDepTblCell" scope="col"  style="text-align:center;font-size: 7pt; width: 15mm;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="PYLongTermContract/Year" />
                </xsl:call-template>
              </td>
              <td class="styDepTblCell" scope="col"  style="text-align:right;font-size: 7pt; width: 30mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="PYLongTermContract/YearlyInfo/PYIncmPrevRptBasedOnEstimated" />
                </xsl:call-template>
              </td>
              <td class="styDepTblCell" scope="col"  style="text-align:right;font-size: 7pt; width: 30mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="PYLongTermContract/YearlyInfo/IncomeAllocablePYActual" />
                </xsl:call-template>
              </td>
              <td class="styDepTblCell" scope="col"  style="text-align:right;font-size: 7pt; width: 30mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="PYLongTermContract/YearlyInfo/PriorYearOtherAdjustments" />
                </xsl:call-template>
              </td>
              <td class="styDepTblCell" scope="col"  style="text-align:right;font-size: 7pt; width: 30mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="PYLongTermContract/YearlyInfo/PYNetAdjustmentToIncome" />
                </xsl:call-template>
              </td>
            </xsl:if>
            <!-- If there is more than one set of data, show the first set with Row 1 background -->
            <xsl:if test="count(PYLongTermContract)&gt;1">              
              <td class="styDepTblRow1Cell" scope="col"  style="text-align:center;font-size: 7pt; width: 15mm;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="PYLongTermContract/Year" />
                </xsl:call-template>
              </td>
              <td class="styDepTblRow1Cell" scope="col"  style="text-align:right;font-size: 7pt; width: 30mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="PYLongTermContract/YearlyInfo/PYIncmPrevRptBasedOnEstimated" />
                </xsl:call-template>
              </td>
              <td class="styDepTblRow1Cell" scope="col"  style="text-align:right;font-size: 7pt; width: 30mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="PYLongTermContract/YearlyInfo/IncomeAllocablePYActual" />
                </xsl:call-template>
              </td>
              <td class="styDepTblRow1Cell" scope="col"  style="text-align:right;font-size: 7pt; width: 30mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="PYLongTermContract/YearlyInfo/PriorYearOtherAdjustments" />
                </xsl:call-template>
              </td>
              <td class="styDepTblRow1Cell" scope="col"  style="text-align:right;font-size: 7pt; width: 30mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="PYLongTermContract/YearlyInfo/PYNetAdjustmentToIncome" />
                </xsl:call-template>
              </td>
            </xsl:if>
          </tr>
          <!-- For Each remaining set of data, make rows with alternating bgcolors -->                                
          <xsl:for-each select="PYLongTermContract">        
            <xsl:if test="position() &gt; 1">
              <tr>
                <!-- Set row background color -->
                <xsl:attribute name="class">
                  <xsl:choose>
                     <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                     <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                  </xsl:choose>
                </xsl:attribute>
                <td class="styDepTblCell" scope="col"  style="text-align:center;font-size: 7pt; width: 15mm;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="Year" />
                  </xsl:call-template>
                </td>
                <td class="styDepTblCell" scope="col"  style="text-align:right;font-size: 7pt; width: 30mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="YearlyInfo/PYIncmPrevRptBasedOnEstimated" />
                  </xsl:call-template>
                </td>
                <td class="styDepTblCell" scope="col"  style="text-align:right;font-size: 7pt; width: 30mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="YearlyInfo/IncomeAllocablePYActual" />
                  </xsl:call-template>
                </td>
                <td class="styDepTblCell" scope="col"  style="text-align:right;font-size: 7pt; width: 30mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="YearlyInfo/PriorYearOtherAdjustments" />
                  </xsl:call-template>
                </td>
                <td class="styDepTblCell" scope="col"  style="text-align:right;font-size: 7pt; width: 30mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="PYNetAdjustmentToIncome" />
                  </xsl:call-template>
                </td>
              </tr>
            </xsl:if>
          </xsl:for-each> <!-- End of For Each remaining set of data, make rows with alternating bgcolors -->
        </xsl:for-each> <!-- End of For Each schedule -->
      </tbody>
    </table>
  </xsl:template>
  
  <!-- Main template -->
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$AdjustmentLongTermContractsSchData" /></xsl:call-template>  
  </xsl:param>
  <!-- Main template -->
  <xsl:template match="/" >
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
        <meta name="Author" content="Chris Sinderson" />
        <meta name="Description" content="{$depDocTitle}" />
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js"></script>
        <xsl:call-template name="InitJS"></xsl:call-template>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="AddOnStyle"></xsl:call-template>    
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesDep"/>
      </head>
      <body class="styBodyClass">
        <xsl:call-template name="DocumentHeaderDependencyLandscape" />  
        <div class="styDepTitleLineLandscape">
          <span class="styDepTitle">
            <span style="width:70mm;"><xsl:value-of select="$depDocTitle" /></span>    
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftoverLandscape"><xsl:with-param name="TargetNode" select="$AdjustmentLongTermContractsSchData"/></xsl:call-template>
        <span style="height:5px;"></span>
        <!-- Transform Itemized Other Income Schedule -->
        <xsl:call-template name="ShowAdjustmentLongTermContractsSch" />
        <br/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
