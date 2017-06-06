<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
  <xsl:strip-space elements="*"/>
    
  <xsl:include href="PopulateTemplate.xsl"/>  
  <xsl:include href="AddHeader.xsl"/>  
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>  
  
  <xsl:param name="DependencyData" select="$RtnDoc/AffiliateListing"/>
  
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>  
  </xsl:param>
    
  <!-- Template to display Itemized Other Income Schedule -->
  <xsl:template name="DependencyTemplate">
    <!-- Itemized Other Income Schedule Data -->
    <table id="AFLTbl" class="styDepTbl">
      <tr class="styDepTblHdr">
        <th class="styDepTblCell" scope="col" nowrap="nowrap">Name</th>
        <th class="styDepTblCell" scope="col" nowrap="nowrap">Address</th>
        <th class="styDepTblCell" scope="col" nowrap="nowrap">EIN</th>
        <th class="styDepTblCell" scope="col" nowrap="nowrap">Name control</th>                                  
      </tr>      
      <xsl:for-each select="$DependencyData/AffiliateListingGrp">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>        
          <td class="styDepTblCell" style="text-align:left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1"/></xsl:call-template> 
            <xsl:if test="normalize-space(BusinessName/BusinessNameLine2) != ''">
              <br/><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2"/></xsl:call-template> 
            </xsl:if>
          </td>          
          <td class="styDepTblCell" nowrap="nowrap" style="text-align:left">
            <xsl:choose>
              <xsl:when test="USAddress">
                <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="USAddress/AddressLine1"/></xsl:call-template> 
                <xsl:if test="normalize-space(USAddress/AddressLine2) != ''">
                  <br/><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="USAddress/AddressLine2"/></xsl:call-template> 
                </xsl:if>
                <xsl:if test="normalize-space(USAddress/City) != ''">
                  <br/><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="USAddress/City"/></xsl:call-template>, 
                </xsl:if>
                <xsl:if test="normalize-space(USAddress/State) != ''">
                  <br/><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="USAddress/State"/></xsl:call-template> 
                </xsl:if>
                <br/><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="USAddress/ZIPCode"/></xsl:call-template> 
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine1"/></xsl:call-template> 
                <xsl:if test="normalize-space(ForeignAddress/AddressLine2) != ''">
                  <br/><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine2"/></xsl:call-template> 
                </xsl:if>
                <xsl:if test="normalize-space(ForeignAddress/City) != ''">
                  <br/><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="ForeignAddress/City"/></xsl:call-template>,
                </xsl:if>
                <xsl:if test="normalize-space(ForeignAddress/ProvinceOrState)!=''">
                  <br/><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="ForeignAddress/ProvinceOrState"/></xsl:call-template>
                </xsl:if>
                <br/><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="ForeignAddress/PostalCode"/></xsl:call-template>
                <xsl:if test="normalize-space(ForeignAddress/Country)!=''">
                  <br/><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="ForeignAddress/Country"/></xsl:call-template>
                </xsl:if>
              </xsl:otherwise>
            </xsl:choose>    
          </td>            
          <td class="styDepTblCell" style="text-align:center">
            <div style="width: 23mm;">
              <xsl:call-template name="PopulateEIN">
                <xsl:with-param name="TargetNode" select="EIN"/>
              </xsl:call-template>             
            </div>
          </td>
          <td class="styDepTblCell" style="text-align:left">            
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="BusinessNameControlTxt"/></xsl:call-template>             
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
          <div class="styDepTitle" style="width: 55mm">
            <xsl:value-of select="$depDocTitle"/>            
          </div>
        </div>        
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>
        
        <br/>            
        <xsl:call-template name="DependencyTemplate"/>          
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>