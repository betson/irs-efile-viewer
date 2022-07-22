<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>

  <xsl:param name="DependencyData" select="$RtnDoc/NonMonyLessFullCnsdrTransStmt"/>
  
  <xsl:template name="DependencyTemplate">
  
  <xsl:for-each select="$DependencyData/NonMonetaryLessFullCnsdrTrans">  
    <table id="NMLTTbl" class="styDepTbl" style="font-size:6.5pt;">
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="width:40%;text-align:right;">
          Item No.
        </th>
        <td class="styDepTblCell" style="text-align:center;"><xsl:value-of select="position()"/></td>
      </tr>      
      <tr class="styDepTblRow2">
      <!--  <xsl:if test="count(PropTrnsfrFrCorpToFrgnRltdPrty) &gt;1 " >
          <xsl:attribute name="class">styDepTblRow1</xsl:attribute>
        </xsl:if>  -->      
        <th class="styDepTblCell" scope="row" style="text-align:right;width:40%;">
          <xsl:attribute name="rowspan"><xsl:value-of select="count(PropTrnsfrCorpFrgnRltdPrtyDesc)"/></xsl:attribute>
          Description of Property Transferred from Reporting Corporation to Foreign Related Party
          <!--span class="styDepTableCellPad"></span-->
        </th>
        <td class="styDepTblCell" style="text-align:left;">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="PropTrnsfrCorpFrgnRltdPrtyDesc[1]"/>                        </xsl:call-template>
        </td>
      </tr>
      <xsl:for-each select="PropTrnsfrCorpFrgnRltdPrtyDesc">
        <xsl:if test="position() &gt; 1">
          <tr class="styDepTblRow2">
          <td class="styDepTblCell" style="text-align:left;">
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="."/></xsl:call-template>
            </td>
          </tr>
        </xsl:if>
      </xsl:for-each>
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          <xsl:attribute name="rowspan">
            <xsl:value-of select="count(PropTrnsfrFrgnRltdPrtyCorpDesc)"/>
          </xsl:attribute>
          Description of Property Transferred from Foreign Related Party to Reporting Corporation  
          <!--span class="styDepTableCellPad"></span-->
        </th>
        <td class="styDepTblCell" style="text-align:left;">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="PropTrnsfrFrgnRltdPrtyCorpDesc[1]"/>
          </xsl:call-template>
        </td>
      </tr>
      <xsl:for-each select="PropTrnsfrFrgnRltdPrtyCorpDesc">
        <xsl:if test="position() &gt; 1">
          <tr class="styDepTblRow1">
            <td class="styDepTblCell" style="text-align:left;">
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="."/></xsl:call-template>
            </td>
          </tr>
        </xsl:if>
      </xsl:for-each>
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          <xsl:attribute name="rowspan">
            <xsl:value-of select="count(SrvcPerfCorpFrgnRltdPrtyDesc)"/>
          </xsl:attribute>
          Description of Services Performed by Reporting Corporation for Foreign Related Party  
          <span class="styDepTableCellPad"/>
        </th>
        <td class="styDepTblCell" style="text-align:left;">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="SrvcPerfCorpFrgnRltdPrtyDesc[1]"/>
          </xsl:call-template>
        </td>
      </tr>
      <xsl:for-each select="SrvcPerfCorpFrgnRltdPrtyDesc">
        <xsl:if test="position() &gt; 1">
          <tr class="styDepTblRow2">
            <td class="styDepTblCell" style="text-align:left;">
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="."/></xsl:call-template>
            </td>
          </tr>
        </xsl:if>
      </xsl:for-each>
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          <xsl:attribute name="rowspan">
            <xsl:value-of select="count(SrvcPerfFrgnRltdPrtyCorpDesc)"/>
          </xsl:attribute>
          Description of Services Performed by Foreign Related Party for Reporting Corporation
        </th>
        <td class="styDepTblCell" style="text-align:left;">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="SrvcPerfFrgnRltdPrtyCorpDesc[1]"/>
          </xsl:call-template>
        </td>
      </tr>
      <xsl:for-each select="SrvcPerfFrgnRltdPrtyCorpDesc">
        <xsl:if test="position() &gt; 1">
          <tr class="styDepTblRow1">
            <td class="styDepTblCell" style="text-align:left;">
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="."/></xsl:call-template>
            </td>
          </tr>
        </xsl:if>
      </xsl:for-each>
      
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Reasonable Estimate of Fair Market Value of Property and Services Exchanged
        </th>
        <td class="styDepTblCell" style="text-align:left">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="EstimatedVlExchPropAndSrvcAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>    
    </table>
    <br/>
  </xsl:for-each>
  </xsl:template>
  
  <xsl:template name="GetClass">
    <xsl:attribute name="class">
      <xsl:choose>
         <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
         <xsl:otherwise>styDepTblRow2</xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
  </xsl:template>
  
  
  
  
  
  
  <!-- Main template -->
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>  
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
         <meta name="Description" content="{$depDocTitle}"/>
         <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js"/>
        <xsl:call-template name="InitJS"/>

        
        <style type="text/css">
        </style>
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
            <span style="width:95mm;"><xsl:value-of select="$depDocTitle"/></span>    
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>
        <span style="height:5px;"/>
        <!-- Transform Itemized Other Income Schedule -->
        <xsl:call-template name="DependencyTemplate"/>
        
        <br/>
      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>