<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>    
  <xsl:include href="AddOnTable.xsl"/>
  
  <xsl:param name="DependencyData" select="$RtnDoc/InvestmentInSubsidiariesStmt"/>
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>  
  </xsl:param>  
  
  
  <xsl:template name="DependencyTemplate">
    
    <table id="IISSTbl" class="styDepTbl" style="margin-top:4mm; font-size:8pt; font-family:Arial">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
           <!--th class="styDepTblCell" scope="col">Item No.</th-->
           <th class="styDepTblCell" scope="col">Description</th>
           <th class="styDepTblCell" scope="col">Beginning Amount</th>   
           <th class="styDepTblCell" scope="col">Ending Amount</th>      
        </tr>
      </thead>  
      <tfoot/>
      <tbody>    
      <xsl:for-each select="$DependencyData/InvestmentInSubsidiariesItem">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
          <!--td class="styDepTblCell" valign="top">
            <xsl:value-of select="position()" />
          </td-->          
          <td class="styDepTblCell" valign="top" align="left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="Desc"/></xsl:call-template>     
          </td>
          <td class="styDepTblCell" valign="top" align="right" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="BeginningAmt"/></xsl:call-template>     
          </td>    
          <td class="styDepTblCell" valign="top" align="right" nowrap="nowrap">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="EndingAmt"/></xsl:call-template>     
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
           <!--Investment in Subsidiaries Statement-->
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
          <div class="styDepTitle" style="width:110mm">
            <!--TY 2003 Investment in Subsidiaries Statement-->
            <xsl:value-of select="$depDocTitle"/>
          </div>
        </div>        
        
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>    
                        
        <xsl:call-template name="DependencyTemplate"/>          
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>