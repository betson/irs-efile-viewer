<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
    
  <xsl:include href="PopulateTemplate.xsl"/>
   <xsl:include href="AddHeader.xsl"/>
   <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>  

  <xsl:param name="DepData" select="$RtnDoc/SepCurrencyPoolsMethodSch" />

  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DepData" /></xsl:call-template>  
  </xsl:param>

<!-- Template to display Retained earnings-appropriated schedule Data -->

<!-- count($DependencyData/RetainedEarnings/RetainedEarningLineItem) is rowcount for inner loop; so add 1 to account for additional row in outer loop -->
<xsl:template name="ShowTable">
    <table id="TableDisplay1" class="styDepTbl">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
          <th class="styDepTblCell" scope="col" style="width:48mm;">Currency. Specify:</th>
          <th class="styDepTblCell" scope="col" style="width:46mm;">U.S. Assets. Enter the corporation's U.S. assets, using the methodology in Regs. sec. 1.882-5(e)(1)(i)</th>
          <th class="styDepTblCell" scope="col" style="width:46mm;">Enter the percentage from line 6e (in Step 2)</th>
          <th class="styDepTblCell" scope="col" style="width:47mm;">U.S.-Connected Liabilities. Multiply line 16a by line 17a, or, if a liability reduction election is made, see instructions</th>
        </tr>
       </thead>
        <tfoot></tfoot>
        <tbody>
        <xsl:for-each select="$DepData/OtherCurrency">  
          <tr>
            <!-- Set row background color -->
            <xsl:attribute name="class">
              <xsl:choose>
                 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
            <td class="styDepTblCell" scope="col"  style="text-align:left;font-size: 7pt;">
               <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="Currency" />
                </xsl:call-template>
            </td>
            <td class="styDepTblCell" scope="col"  style="text-align:right;font-size: 7pt;">
               <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="USAssets" />
                </xsl:call-template>
            </td>
            <td class="styDepTblCell" scope="col"  style="text-align:center;font-size: 7pt;">
               <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="RatioFromStep2" />
                </xsl:call-template>
            </td>            
            <td class="styDepTblCell" scope="col"  style="text-align:right;font-size: 7pt;">
               <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="Step3USConnectedLiabilities" />
                </xsl:call-template>
            </td>							
          </tr>
        </xsl:for-each>
          <tr class="styDepTblHdr">
	     <th class="styDepTblCell" scope="col" style="width:48mm;">Enter the total interest expense paid or accrued for the tax year with respect to the foreign corporation's worldwide liabilities denominated in that foreign currency (enter in functional currency)</th>
            <th class="styDepTblCell" scope="col" style="width:46mm;">Enter the corporation's average worldwide liabilities (whether interest bearing or not) denominated in that foreign currency (enter in functional currency)</th>
            <th class="styDepTblCell" scope="col" style="width:46mm;">Borrowing rate: Divide line 18a by line 18b</th>
            <th class="styDepTblCell" scope="col" style="width:47mm;">Interest expense allocation by separate currency pool. Multiply line 17b by line 18c</th>
	   </tr>
	   <xsl:for-each select="$DepData/OtherCurrency">  
          <tr>
            <!-- Set row background color -->
            <xsl:attribute name="class">
              <xsl:choose>
                 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
            <td class="styDepTblCell" scope="col"  style="text-align:right;font-size: 7pt;">
               <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="InterestExpenseInFuncCurrency" />
                </xsl:call-template>
            </td>
            <td class="styDepTblCell" scope="col"  style="text-align:right;font-size: 7pt;">
               <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="LiabilitiesInFuncCurrency" />
                </xsl:call-template>
            </td>
            <td class="styDepTblCell" scope="col"  style="text-align:center;font-size: 7pt;">
               <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="BorrowingRate" />
                </xsl:call-template>
            </td>            
            <td class="styDepTblCell" scope="col"  style="text-align:right;font-size: 7pt;">
               <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="InterestExpenseAllocation" />
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
         <meta name="Author" content="Ravi Venigalla" />
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
        <xsl:call-template name="DocumentHeaderDependency"></xsl:call-template>            
          <div class="styDepTitleLine">
            <span class="styDepTitle">
              <span style="width:63mm;">
                <xsl:value-of select="$depDocTitle" />
              </span>
            </span>
          </div>

        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DepData" /></xsl:call-template>
        
        <!-- Transform Retained Earnings Appr Schedule -->
        <xsl:call-template name="ShowTable" />
        
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
