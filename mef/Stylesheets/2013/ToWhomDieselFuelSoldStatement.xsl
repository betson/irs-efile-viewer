<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>  
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:param name="DependencyData" select="$RtnDoc/ToWhomDieselFuelSoldStatement"/>
  <!-- Form 4136 displays as - To Whom Diesel Fuel Sold Statement - -->
  <xsl:template name="DependencyTemplate">  
    <table id="TWDFTbl" class="styDepTbl">
      <thead class="styDepTableThead">
        <tr class="styDepTblHdr">           
           <th class="styDepTblCell" scope="col" style="width:50mm;">Name</th>
           <th class="styDepTblCell" scope="col" style="width:34mm;">TIN</th>
           <th class="styDepTblCell" scope="col" style="width:36mm;">Gallons Bought</th>
        </tr>
      </thead>
      <tfoot/>
      <tbody>
        <xsl:for-each select="$DependencyData/DieselFuelBuyer">
          <tr>
            <xsl:attribute name="class">
            <xsl:choose>
               <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
               <xsl:otherwise>styDepTblRow2</xsl:otherwise>
            </xsl:choose>
            </xsl:attribute>                  
            <td class="styDepTblCell" style="width:50mm;text-align:left">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1"/>
              </xsl:call-template>
              <xsl:if test="BusinessName/BusinessNameLine2  != ' ' ">
                <br/>
                <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2"/>
                </xsl:call-template>
              </xsl:if>
            </td>
            <td class="styDepTblCell" style="text-align:center; width: 34mm;">
              <xsl:choose>
                <xsl:when test="EIN">
                  <xsl:call-template name="PopulateEIN">
					<xsl:with-param name="TargetNode" select="EIN"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:when test="SSN">
                  <xsl:call-template name="PopulateSSN">
                    <xsl:with-param name="TargetNode" select="SSN"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
                  </xsl:call-template>
				</xsl:otherwise>
			  </xsl:choose>
            </td>
            <td class="styDepTblCell" style="text-align:right; width: 36mm;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="GallonsBoughtQty"/></xsl:call-template></td>
          </tr>
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>
  <!-- Main template -->
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>  
  </xsl:param>  
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
        <span class="styDepTitle"  style="padding-right:2mm;">
            <xsl:value-of select="$depDocTitle"/>
          </span>        
      </div>
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>
        <span style="height:5px;"/>
        <xsl:call-template name="DependencyTemplate"/>
        <br/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>