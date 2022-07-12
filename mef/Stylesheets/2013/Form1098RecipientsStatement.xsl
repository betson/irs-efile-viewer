<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="DependencyData" select="$RtnDoc//Form1098RecipientsStatement"/>
  <!-- Schema Location: 1040 Schedule F - Form 1098 Recipients Statement-->
  <xsl:param name="depDocTitle">
  <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>  
  </xsl:param>
    <xsl:template name="Form1098RecipientsStmtTemp">
    <table id="Form1098RecipientsStmtTbl" class="styDepTbl">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
          <th class="styDepTblCell" scope="col" style="width:93mm;">Name</th>
          <th class="styDepTblCell" scope="col" style="width:94mm;">Address</th>
        </tr>
      </thead>
      <xsl:for-each select="$DependencyData/FormRecipientGrp">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>          
          <xsl:choose>
             <xsl:when test="BusinessName/BusinessNameLine1">
          <td class="styDepTblCell" style="width:93mm;text-align:left;font-size:9pt;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1"/>
            </xsl:call-template>
            <xsl:if test="BusinessName/BusinessNameLine2 != ''">
              <br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2"/>
              </xsl:call-template>
            </xsl:if>          
          </td>
          </xsl:when>
          <xsl:when test="PersonNm">
          <td class="styDepTblCell" style="width:93mm;text-align:left;font-size:9pt;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="PersonNm"/>
            </xsl:call-template>
            </td>
          </xsl:when>
          </xsl:choose>
          <td class="styDepTblCell" nowrap="nowrap" style="width:94mm;text-align:left">
            <xsl:choose>
              <xsl:when test="USAddress">
                <xsl:call-template name="PopulateUSAddressTemplate"><xsl:with-param name="TargetNode" select="USAddress"/></xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="PopulateForeignAddressTemplate"><xsl:with-param name="TargetNode" select="ForeignAddress"/></xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>    
          </td>
        </tr>
      </xsl:for-each>
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
         <meta name="Author" content="Alex Hurtt:: ahurtt@us.ibm.com"/>
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
            <span style="width:100mm;">
              <xsl:value-of select="$depDocTitle"/>
            </span>
          </span>
        </div>        
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>                
        <xsl:call-template name="Form1098RecipientsStmtTemp"/>    
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>