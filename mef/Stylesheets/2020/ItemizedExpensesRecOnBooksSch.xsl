<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="DependencyData" select="$RtnDoc/ItemizedExpensesRecOnBooksSch"/>
  <!-- 1120 Common Itemized Expenses Recorded on Books Schedule -->
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData"/>
    </xsl:call-template>  
  </xsl:param>  
    <xsl:template name="ItemizedExpensesRecOnBooksSchTemp">
    <table id="ItemizedExpensesRecOnBooksSchTbl" class="styDepTbl">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
           <th class="styDepTblCell" scope="col" style="width:60mm;">Corporation Name</th>
           <th class="styDepTblCell" scope="col" style="width:23mm;">Corporation EIN</th>
           <th class="styDepTblCell" scope="col" style="width:70mm;">Description</th>
           <th class="styDepTblCell" scope="col" style="width:34mm;">Amount</th>
        </tr>
      </thead>
      <xsl:for-each select="$DependencyData/ItemizedExpensesRecOnBooksGrp">
        <tr style="font-size:7pt;">
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
        <td class="styDepTblCell" style="width:60mm;text-align:left;">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine1Txt"/>
          </xsl:call-template>
          <br/>
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine2Txt"/>
          </xsl:call-template>          
        </td>
        <td class="styDepTblCell" style="width:23mm;text-align:center;">
          <xsl:if test="CorporationEIN">
               <xsl:call-template name="PopulateEIN">
               <xsl:with-param name="TargetNode" select="CorporationEIN"/>
               </xsl:call-template>
            </xsl:if>
          <xsl:if test="MissingEINReasonCd">
               <xsl:call-template name="PopulateText">
               <xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
               </xsl:call-template>
            </xsl:if>
        </td>
        <td class="styDepTblCell" style="width:70mm;text-align:left;">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="Desc"/>
          </xsl:call-template>
        </td>
        <td class="styDepTblCell" style="width:34mm;text-align:right;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="Amt"/>
          </xsl:call-template>
        </td>
        </tr>
      </xsl:for-each>
      <tr class="styDepTblHdr">
        <td class="styDepTblCell" colspan="3" style="text-align:left; font-weight: bold">Total</td>
        <td class="styDepTblCell" style="text-align:right;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="WhiteFont">true</xsl:with-param>
            <xsl:with-param name="TargetNode" select="$DependencyData/TotalAmt"/>
          </xsl:call-template>             
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
         <meta name="Author" content="Beju Ekperigin :: beju@us.ibm.com"/>
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
        <xsl:call-template name="DocumentHeaderDependency"/>          
          <div class="styDepTitleLine">
            <span class="styDepTitle">
              <span style="width:125mm;">
                <xsl:value-of select="$depDocTitle"/>
              </span>
            </span>
          </div>        
          <xsl:call-template name="PopulateDepCommonLeftover">
            <xsl:with-param name="TargetNode" select="$DependencyData"/>
          </xsl:call-template>          
          <xsl:call-template name="ItemizedExpensesRecOnBooksSchTemp"/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>