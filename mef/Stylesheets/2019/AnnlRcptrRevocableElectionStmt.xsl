<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>  
  <xsl:include href="AddOnTable.xsl"/>
  
  <xsl:param name="DependencyData" select="$RtnDoc/AnnlRcptrRevocableElectionStmt"/>
  
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>  
  </xsl:param>
    
  <xsl:template name="DependencyTemplate">    
    <table id="ARRETbl" class="styDepTbl" style="margin-top:4mm; font-size:8pt; font-family:Arial">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
           <!--th class="styDepTblCell" scope="col" rowspan="3">Annual Recapture Revocable Info</th-->
           <th class="styDepTblCell" scope="col" rowspan="3">Category of Recapture of Overall Foreign Losses</th>
           <th class="styDepTblCell" scope="col" colspan="2" rowspan="2">Separate Limitation Income Category that is treated as U.S. source income</th>         
           <th class="styDepTblCell" scope="col" colspan="4">Balance in the Overall Foreign Loss Account that is recaptured</th>             
        </tr>
        <tr class="styDepTblHdr">
          <th class="styDepTblCell" scope="col" colspan="2">Before Recapture</th>
          <th class="styDepTblCell" scope="col" colspan="2">After Recapture</th>            
        </tr>      
        <tr class="styDepTblHdr">
          <th class="styDepTblCell" scope="col">Percentage</th>         
          <th class="styDepTblCell" scope="col">Amount</th>
          <th class="styDepTblCell" scope="col">Percentage</th>         
          <th class="styDepTblCell" scope="col">Amount</th>      
          <th class="styDepTblCell" scope="col">Percentage</th>         
          <th class="styDepTblCell" scope="col">Amount</th>
        </tr>
      </thead>  
      <tfoot/>
      <tbody>    
      <xsl:for-each select="$DependencyData/AnnualRecaptureRevocableInfo">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
          <!--td class="styDepTblCell" style="text-align:center;">
            <xsl:value-of select="position()"/>
          </td-->          
          <td class="styDepTblCell" style="text-align:left" align="left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="RecaptureCategoryDesc"/></xsl:call-template>    
          </td>
          <td class="styDepTblCell" align="right" nowrap="nowrap">
            <xsl:call-template name="PopulatePercent"><xsl:with-param name="TargetNode" select="SeparateLimitationIncomeRt"/></xsl:call-template>            
          </td>          
          <td class="styDepTblCell" align="right" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="SeparateLimitationIncomeAmt"/></xsl:call-template>      
          </td>          
          <td class="styDepTblCell" align="right" nowrap="nowrap">
            <xsl:call-template name="PopulatePercent"><xsl:with-param name="TargetNode" select="BalanceBeforeRecaptureRt"/></xsl:call-template>  
          </td>
          <td class="styDepTblCell" align="right" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="BalanceBeforeRecaptureAmt"/></xsl:call-template>      
          </td>          
          <td class="styDepTblCell" align="right" nowrap="nowrap">
            <xsl:call-template name="PopulatePercent"><xsl:with-param name="TargetNode" select="BalanceAfterRecaptureRt"/></xsl:call-template>  
          </td>
          <td class="styDepTblCell" align="right" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="BalanceAfterRecaptureAmt"/></xsl:call-template>      
          </td>          
        </tr>
      </xsl:for-each>
      </tbody>    
    </table>
  </xsl:template>
  
  
  <!-- Main template -->
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
         <title>
           <!--Annual Recapture Revocable Election Statement-->
          <xsl:value-of select="$depDocTitle"/>
        </title>
         <!-- No Browser Caching -->
         <meta http-equiv="Pragma" content="no-cache"/>
         <meta http-equiv="Cache-Control" content="no-cache"/>
         <meta http-equiv="Expires" content="0"/>
         <!-- No Proxy Caching -->
         <meta http-equiv="Cache-Control" content="private"/>
         <!-- Define Character Set -->
         <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>         
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
          <div class="styDepTitle" style="padding:right;5mm">
            <xsl:value-of select="$depDocTitle"/>
            <!--TY 2003 Annual Recapture Revocable Election Statement-->
          </div>
        </div>            
        
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>                            
        
        <xsl:call-template name="DependencyTemplate"/>          
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>