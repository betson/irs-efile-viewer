<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
  <xsl:strip-space elements="*"/>   
  <xsl:include href="AddHeader.xsl"/>  
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>  
  <xsl:include href="AddOnTable.xsl"/>   
  <xsl:param name="FormData" select="$RtnDoc/OtherCostsUnderGoodsSoldSch"/>
    <!--8873 - Display Name - Other Costs under Cost of Goods Sold Schedule-->   
  <xsl:param name="depDocTitle">  
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$FormData"/></xsl:call-template>  
  </xsl:param>
  <xsl:template name="ShowTable">
    <table id="DataTbl" class="styDepTbl">
      <tr class="styDepTblHdr">
        <th class="styDepTblCell" scope="col" nowrap="nowrap" style="width:62mm;">Type of Additional Section 263A Costs</th>
        <th class="styDepTblCell" scope="col" nowrap="nowrap" style="width:62mm">Amount of Foreign Trade<br/> Income Additional Section<br/>263A Costs, Line 17E (A)</th>
        <th class="styDepTblCell" scope="col" nowrap="nowrap" style="width:63mm" >Amount of Foreign Sales<br/> and Leasing Income Additional<br/> Sections 263A Costs, Line 17E(B)</th>                                  
      </tr>      
      <xsl:for-each select="$FormData/OtherCostsInfoGrp">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
          <td class="styDepTblCell" style="text-align:left">            
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="TypeOfAddnlSectionCostsTxt"/></xsl:call-template>             
          </td>                      
          <td class="styDepTblCell" style="text-align:right">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="ForeignTradeIncomeAmt"/></xsl:call-template>             
          </td>
          <td class="styDepTblCell" style="text-align:right">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="ForeignSalesAndLeasingIncmAmt"/></xsl:call-template>             
          </td>                              
        </tr>
      </xsl:for-each>
      <tr class="styDepTblHdr">
        <td class="styDepTblCell" style="text-align:left; font-weight: bold">
          Total
        </td>
        <td class="styDepTblCell" style="text-align:right;">
          <xsl:call-template name="PopulateAmount"><xsl:with-param name="WhiteFont">true</xsl:with-param><xsl:with-param name="TargetNode" select="$FormData/TotalAmountOfForeignTrdIncmAmt"/></xsl:call-template>             
        </td>
        <td class="styDepTblCell" style="text-align:right;">
          <xsl:call-template name="PopulateAmount"><xsl:with-param name="WhiteFont">true</xsl:with-param><xsl:with-param name="TargetNode" select="$FormData/TotFrgnSalesAndLeasingIncmAmt"/></xsl:call-template>             
        </td>
      </tr>
    </table>
  </xsl:template> 
  <!-- Main template -->
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
         <title><xsl:value-of select="$depDocTitle"/></title>
         <!-- No Browser Caching -->
         <meta http-equiv="Pragma" content="no-cache"/>
         <meta http-equiv="Cache-Control" content="no-cache"/>
         <meta http-equiv="Expires" content="0"/>
         <!-- No Proxy Caching -->
         <meta http-equiv="Cache-Control" content="private"/>
         <!-- Define Character Set -->
         <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
         <meta name="Author" content="Michelle Hayden - haydenm@us.ibm.com"/>
        <meta name="Description" content="{$depDocTitle}"/>      
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <!--Generic CSS Styles are located in the template called below -->
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
      <xsl:call-template name="GlobalStylesDep"/>
</head>
         <body class="styBodyClass">    
        <xsl:call-template name="DocumentHeaderDependency"/>  
        <div class="styDepTitleLine">
          <div class="styDepTitle" style="width: 130mm;">
            <xsl:value-of select="$depDocTitle"/>            
          </div>
        </div>        
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$FormData"/></xsl:call-template><br/>               
        <xsl:call-template name="ShowTable"/>          
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>