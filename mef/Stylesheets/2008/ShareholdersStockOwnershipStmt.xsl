<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <!--Display Dependency Root Name from Schema -->
  <xsl:param name="CCSData" select="$RtnDoc/ShareholdersStockOwnershipStmt" />
  <!-- HINTS Dependency Title - Shareholder's Stock Ownership Statement - 8621-->  
  <xsl:template name="ShowPIS">
    <table id="PISTbl" class="styDepTblLandscape" style="text-align:center;">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">          
           <th class="styDepTblCell" scope="col" style="width:67mm;">Class of Stock Owned by the Shareholder at the Beginning of its Tax Year </th>        
           <th class="styDepTblCell" scope="col" style="width:66mm;">Number of Shares Owned by the Shareholder During its Tax Year</th>  
           <th class="styDepTblCell" scope="col" style="width:66mm;">Changes to the Number of Shares </th>        
           <th class="styDepTblCell" scope="col" style="width:25mm;">Date of Changes</th>        
           <th class="styDepTblCell" scope="col" style="width:32mm;">Number of Shares</th>
        </tr>
      </thead>
        <tfoot></tfoot>
       <tbody>    
        <xsl:for-each select="$CCSData/StockOwnershipInfo">  
          <tr>
            <xsl:attribute name="class">
              <xsl:choose>
                 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>            
            <!--Column 1-->
            <td class="styDepTblCell" style="width:67mm;text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ClassOfStockOwndShrhldrAtBegYr" />
              </xsl:call-template>
            </td>
            <!-- Column 2 -->
            <td class="styDepTblCell" style="width:66mm;text-align:left;">
              <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="NumberOfSharesOwnedAtBegYR" />
            </xsl:call-template>
            </td>
            <!--Column 3 -->
            <td class="styDepTblCell" style="width:66mm;text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ChangeToNumberOfSharesOwned" />
              </xsl:call-template>
            </td>
           <!-- Column 4 -->
            <td class="styDepTblCell" style="width:25mm;text-align:center;">
                <xsl:call-template name="PopulateMonthDayYear">
                  <xsl:with-param name="TargetNode" select="DateOfChanges" />
                </xsl:call-template>
            </td>
            <!-- Column 6 -->
            <td class="styDepTblCell" style="width:32mm;text-align:center;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="NumberOfSharesAtEndYr" />
                </xsl:call-template>
            </td>
          </tr>      
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$CCSData" /></xsl:call-template>  
  </xsl:param>
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
      <body class="styBodyClass" >
        <xsl:call-template name="DocumentHeaderDependencyLandscape"></xsl:call-template>    
        <div class="styDepTitleLineLandscape ">
          <span class="styDepTitle" style="width:122mm">
            <xsl:value-of select="$depDocTitle" />        
          </span>
        </div>
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftoverLandscape"><xsl:with-param name="TargetNode" select="$CCSData" /></xsl:call-template>        
        <xsl:call-template name="ShowPIS" />          
        <br/>                      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







