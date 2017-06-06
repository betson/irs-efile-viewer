<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>    
  <xsl:include href="PopulateTemplate.xsl"/>
   <xsl:include href="AddHeader.xsl"/>
   <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>  
  <xsl:param name="DepData" select="$RtnDoc/SepCurrencyPoolsMethodSch"/>
  <!-- 1120 F SchI-Separate Currency Pools Method Schedule -->
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DepData"/></xsl:call-template>  
  </xsl:param>
	<xsl:template name="ShowTable">
    <table id="TableDisplay1" class="styDepTbl">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
          <th class="styDepTblCell" scope="col" style="width:44mm;">Currency. Specify:</th>
          <th class="styDepTblCell" scope="col" style="width:46mm;">U.S. Assets. Enter the Corporation's U.S. Assets, Using The Methodology in Regs. sec. 1.882-5(e)(1)(i)</th>
          <th class="styDepTblCell" scope="col" style="width:50mm;">Enter the Percentage from line 6e (in Step 2)</th>
          <th class="styDepTblCell" scope="col" style="width:47mm;">U.S.-Connected Liabilities. Multiply Line 16a by Line 17a, or, if a Liability Reduction Election is Made, See Instructions</th>
        </tr>
       </thead>
        <tfoot/>
        <tbody>
        <xsl:for-each select="$DepData/OtherCurrencyGrp">  
          <tr>
            <!-- Set row background color -->
            <xsl:attribute name="class">
              <xsl:choose>
                 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
            <td class="styDepTblCell" scope="col" style="text-align:left;font-size: 7pt;width:44m;">
               <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="CurrencyTxt"/>
                </xsl:call-template>
            </td>
            <td class="styDepTblCell" scope="col" style="text-align:right;font-size: 7pt;">
               <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="USAssetsAmt"/>
                </xsl:call-template>
            </td>
            <td class="styDepTblCell" scope="col" style="text-align:right;font-size:7pt;width:50mm;">
               <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="ApplicableRt"/>
                </xsl:call-template>
            </td>            
            <td class="styDepTblCell" scope="col" style="text-align:right;font-size: 7pt;">
               <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="Step3USConnectedLiabilitiesAmt"/>
                </xsl:call-template>
            </td>							
          </tr>
        </xsl:for-each>
          <tr class="styDepTblHdr">
	     <th class="styDepTblCell" scope="col" style="width:44mm;">Enter the total interest expense paid or accrued for the tax year with respect to the foreign corporation's worldwide liabilities denominated in that foreign currency (enter in functional currency)</th>
            <th class="styDepTblCell" scope="col" style="width:46mm;">Enter the corporation's average worldwide liabilities (whether interest bearing or not) denominated in that foreign currency (enter in functional currency)</th>
            <th class="styDepTblCell" scope="col" style="width:50mm;">Borrowing rate: Divide line 18a by line 18b</th>
            <th class="styDepTblCell" scope="col" style="width:47mm;">Interest expense allocation by separate currency pool. Multiply line 17b by line 18c</th>
	   </tr>
	   <xsl:for-each select="$DepData/OtherCurrencyGrp">  
          <tr>
            <!-- Set row background color -->
            <xsl:attribute name="class">
              <xsl:choose>
                 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
            <td class="styDepTblCell" scope="col" style="text-align:right;font-size: 7pt;width:44m;">
               <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="InterestExpenseFuncCurAmt"/>
                </xsl:call-template>
            </td>
            <td class="styDepTblCell" scope="col" style="text-align:right;font-size: 7pt;">
               <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="LiabilitiesFunctionalCurAmt"/>
                </xsl:call-template>
            </td>
            <td class="styDepTblCell" scope="col" style="text-align:right;font-size: 7pt;width:50mm;">
               <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="BorrowingRt"/>
                </xsl:call-template>
            </td>            
            <td class="styDepTblCell" scope="col" style="text-align:right;font-size: 7pt;">
               <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="InterestExpenseAllocationAmt"/>
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
         <title><xsl:value-of select="$depDocTitle"/></title>
         <!-- No Browser Caching -->
         <meta http-equiv="Pragma" content="no-cache"/>
         <meta http-equiv="Cache-Control" content="no-cache"/>
         <meta http-equiv="Expires" content="0"/>
         <!-- No Proxy Caching -->
         <meta http-equiv="Cache-Control" content="private"/>
         <!-- Define Character Set -->
         <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
         <meta name="Author" content="Ravi Venigalla"/>
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
              <span style="width:118mm;">
                <xsl:value-of select="$depDocTitle"/>
              </span>
            </span>
          </div>
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DepData"/></xsl:call-template>
        <xsl:call-template name="ShowTable"/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>