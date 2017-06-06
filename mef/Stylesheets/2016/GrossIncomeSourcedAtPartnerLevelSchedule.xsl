<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  <xsl:include href="PopulateTemplate.xsl"/>
  
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>

  <xsl:param name="DependencyData" select="$RtnDoc/GrossIncmSourcedAtPrtnrLvlSch" />
  <!-- Template to display Itemized Other Income Schedule -->
  <xsl:template name="DependencyTemplate">
    <xsl:param name="TargetNode" /> 
    <xsl:param name="ColName"/>
    <!-- Itemized Other Income Schedule Data -->
    <!-- style="font-size:6.5pt;"-->
    <table id="GISPTbl" class="styDepTblLandscape">
      <thead class="styDepTableThead">
        <tr class="styDepTblHdr">
          <th scope="col" colspan="4" class="styDepTblCell">
            <xsl:value-of select="$ColName" />
          </th>
        </tr>
        <tr class="styDepTblHdr">
           <!--th class="styDepTblCell" scope="col">Item No.</th-->
           <th class="styDepTblCell" scope="col" style="width:148mm">Description</th>
           <th class="styDepTblCell" scope="col" style="width:36mm">Amount</th>
           <th class="styDepTblCell" scope="col" style="width:36mm">Gains</th>
           <th class="styDepTblCell" scope="col" style="width:36mm">Losses</th>           
        </tr>
      </thead>
      <tfoot></tfoot>
      <tbody>
        <xsl:for-each select="$TargetNode">
          <tr>
            <xsl:attribute name="class">
              <xsl:choose>
                 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
            <!--td class="styDepTblCell" style="text-align:center;"><xsl:value-of select="position()" /></td-->        
            <td class="styDepTblCell" scope="col" style="text-align:left">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="Desc" />
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" scope="col" style="text-align:right">
              	<xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="Amt" /></xsl:call-template>
			</td>
             <td class="styDepTblCell" scope="col" style="text-align:right">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="Gains" />
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" scope="col" style="text-align:right">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="Losses" />
              </xsl:call-template>
            </td>
          </tr>
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>
  
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>  
  </xsl:param>

  <!-- Main template -->
  <xsl:template match="/">

    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
           <title><xsl:value-of select="$depDocTitle" /></title>
         <!-- No Browser Caching -->
         <meta http-equiv="Pragma" content="no-cache" />
         <meta http-equiv="Cache-Control" content="no-cache" />
         <meta http-equiv="Expires" content="0" />
         <!-- No Proxy Caching -->
         <meta http-equiv="Cache-Control" content="private" />
         <!-- Define Character Set -->
         <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />        
         <meta name="Description" content="{$depDocTitle}" />
         <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js"></script>
        <xsl:call-template name="InitJS"></xsl:call-template>

        
        <style type="text/css">

        </style>
        <style type="text/css">
  <xsl:if test="not($Print) or $Print=''">
    <xsl:call-template name="AddOnStyle"></xsl:call-template>    
  </xsl:if>
</style>
      <xsl:call-template name="GlobalStylesDep"/>
</head>    
      <body class="styBodyClass">
      
        <xsl:call-template name="DocumentHeaderDependencyLandscape" />  
        <div class="styDepTitleLineLandscape">
          <span class="styDepTitle">
            <span style="width:254mm;"><xsl:value-of select="$depDocTitle" /></span>        
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftoverLandscape"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>
        <span style="height:5px;"></span>
        <xsl:call-template name="DependencyTemplate" >
          <xsl:with-param name="TargetNode" select="$DependencyData/Passive"/>
          <xsl:with-param name="ColName">Total Foreign Tax - Passive</xsl:with-param>
        </xsl:call-template>
        <br/>
        <xsl:call-template name="DependencyTemplate" >
          <xsl:with-param name="TargetNode" select="$DependencyData/ListedCategories"/>
          <xsl:with-param name="ColName">Total Foreign Tax - Listed Categories</xsl:with-param>
        </xsl:call-template>
        <br/>
        <xsl:call-template name="DependencyTemplate" >
          <xsl:with-param name="TargetNode" select="$DependencyData/GeneralLimitation"/>
          <xsl:with-param name="ColName">Total Foreign Tax - General Limitation</xsl:with-param>
        </xsl:call-template>
        <br/>    
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







