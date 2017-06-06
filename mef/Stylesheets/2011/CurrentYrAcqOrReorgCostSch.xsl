<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  <xsl:include href="PopulateTemplate.xsl"/>
   <xsl:include href="AddHeader.xsl"/>
   <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  
  <xsl:param name="CCSData" select="$RtnDoc/CurrentYrAcqOrReorgCostSch" />
  
  <!-- Template to display Current Year Acquisition or Reorganization Costs Schedule-->  
  
  <xsl:template name="ShowCYAORC">
    <table id="CYAORCTbl" class="styDepTblLandscape">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">          
           <th class="styDepTblCell" scope="col" style="width:120mm;">Description </th>        
           <th class="styDepTblCell" scope="col" style="width:34mm;">Income (Loss) Per Income Statement Amount </th>  
           <th class="styDepTblCell" scope="col" style="width:34mm;">Temporary Difference Amount </th>        
           <th class="styDepTblCell" scope="col" style="width:34mm;">Permanent Difference Amount </th>        
           <th class="styDepTblCell" scope="col" style="width:34mm;">Income (Loss) Per Tax Return Amount </th>  
        </tr>
      </thead>
        <tfoot></tfoot>
        
       <tbody>    
        <xsl:for-each select="$CCSData/CurrentYrAcqOrReorgCostInfo">  
          <tr>
            <xsl:attribute name="class">
              <xsl:choose>
                 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>            
                  
            <td class="styDepTblCell" style="text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="Description" />
              </xsl:call-template>
            </td>
            
            <td class="styDepTblCell" style="text-align:right;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="IncomeLossPerIncomeStmtAmount" />
                </xsl:call-template>
            </td>
            
            <td class="styDepTblCell" style="text-align:right;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="IncomeLossPerIncomeStmtAmount" />
                </xsl:call-template>
              
            </td>
            
            <td class="styDepTblCell" style="text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="PermanentDifferenceAmount" />
              </xsl:call-template>
            </td>
 
            <td class="styDepTblCell" style="text-align:right;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="IncomeLossPerTaxReturnAmount" />
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
          <span class="styDepTitle" style="width:152mm">
            <xsl:value-of select="$depDocTitle" />        
          </span>
        </div>
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftoverLandscape"><xsl:with-param name="TargetNode" select="$CCSData" /></xsl:call-template>        
        <xsl:call-template name="ShowCYAORC" />          
        <br/>                      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







