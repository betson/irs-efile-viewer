<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="PopulateTemplate.xsl"/>
   <xsl:include href="AddHeader.xsl"/>
   <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:param name="CCSData" select="$RtnDoc/DiscountingUnpaidLossSchedule"/> 
  <!--  -1120PC Schedule M3 displays as -  Discounting of Unpaid Loss Schedule - -->  
  <xsl:template name="ShowDUL">
    <table id="DULTbl" class="styDepTblLandscape" style="text-align:center;">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">          
           <th class="styDepTblCell" style="width:111mm;" scope="col">Description </th>        
           <th class="styDepTblCell" style="width:36mm;" scope="col">Income (Loss) Per Income Statement Amount </th>  
           <th class="styDepTblCell" style="width:36mm;" scope="col">Temporary Difference Amount </th>        
           <th class="styDepTblCell" style="width:36mm;" scope="col">Permanent Difference Amount </th>        
           <th class="styDepTblCell" style="width:36mm;" scope="col">Income (Loss) Per Tax Return Amount </th>  
        </tr>
      </thead>
        <tfoot/> 
       <tbody>    
        <xsl:for-each select="$CCSData/DiscountingUnpaidLossesGrp">  
          <tr>
            <xsl:attribute name="class">
              <xsl:choose>
                 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>            
            <td class="styDepTblCell" style="width:111mm;text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="Desc"/>
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" style="width:36mm;text-align:right;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
            </td>  
            <td class="styDepTblCell" style="width:36mm;text-align:right;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="TemporaryDifferenceAmt"/>
                </xsl:call-template> 
            </td>
            <td class="styDepTblCell" style="width:36mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="PermanentDifferenceAmt"/>
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" style="width:36mm;text-align:right;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="IncomeLossPerTaxReturnAmt"/>
                </xsl:call-template>
            </td>
          </tr>      
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$CCSData"/></xsl:call-template>  
  </xsl:param>
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
         <meta name="Author" content="Ravi Venigalla"/>
         <meta name="Desc" content="{$depDocTitle}"/> 
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
        <xsl:call-template name="DocumentHeaderDependencyLandscape"/>    
         <div class="styDepTitleLine">
        <span class="styDepTitle"  style="padding-right:2mm;">
            <xsl:value-of select="$depDocTitle"/>
          </span>        
      </div>
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftoverLandscape"><xsl:with-param name="TargetNode" select="$CCSData"/></xsl:call-template>        
        <xsl:call-template name="ShowDUL"/>          
        <br/>                      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>