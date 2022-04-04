<?xml version="1.0" encoding="UTF-8"?>
<!-- 06/24/2015 - Created new dependency file per UWR #153560 - Jeremy Nichols -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>

<xsl:output method="html" indent="yes" />
<xsl:strip-space elements="*" />

  <xsl:param name="DependencyData" select="$RtnDoc/PrivateSaleVehicleStatement" />
 
  <xsl:param name="depDocTitle">
  <xsl:call-template name="PopulateDisplayName">
        <xsl:with-param name="TargetNode" select="$DependencyData" />
  </xsl:call-template>  
  </xsl:param>
  
  <xsl:template name="PrivateSaleVehicleStatementTemp">
  
    <table id="GeneralDependencyTbl" class="styDepTbl" style="height:auto;width:187mm;">
      <tr class="styDepTblHdr">
         <th class="styDepTblCell" style="width:137mm">Name and Address</th>
         <th class="styDepTblCell" style="width:50mm;">VIN</th>
      </tr>
      <xsl:for-each select="$DependencyData/PrivateSaleVehicleInfo">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>          
          <td class="styDepTblCell" style="width:137mm;text-align:left">
			 <xsl:choose>
				 <xsl:when test="NameAndAddress/PersonNm">
					 <xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="NameAndAddress/PersonNm" />
					 </xsl:call-template>
				 </xsl:when>
				 <xsl:otherwise>
						<xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="NameAndAddress/BusinessName/BusinessNameLine1Txt" />
					 </xsl:call-template><br/>
					 <xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="NameAndAddress/BusinessName/BusinessNameLine2Txt" />
					 </xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
             <br />
             <xsl:choose>
				 <xsl:when test="NameAndAddress/USAddress">
					 <xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="NameAndAddress/USAddress/AddressLine1Txt" />
					 </xsl:call-template>
					 <br />
					 <xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="NameAndAddress/USAddress/AddressLine2Txt" />
					 </xsl:call-template>
					 <br />
					 <xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="NameAndAddress/USAddress/CityNm" />
					 </xsl:call-template>
					 <br />
					 <xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="NameAndAddress/USAddress/StateAbbreviationCd" />
					 </xsl:call-template>
					 <br />
					 <xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="NameAndAddress/USAddress/ZIPCd" />
					 </xsl:call-template>
				 </xsl:when>
				 <xsl:otherwise>
					 <xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="NameAndAddress/ForeignAddress/AddressLine1Txt" />
					 </xsl:call-template>
					 <br />
					 <xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="NameAndAddress/ForeignAddress/AddressLine2Txt" />
					 </xsl:call-template>
					 <br />
					 <xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="NameAndAddress/ForeignAddress/CityNm" />
					 </xsl:call-template>
					 <br />
					 <xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="NameAndAddress/ForeignAddress/ProvinceOrStateNm" />
					 </xsl:call-template>
					 <br />
					 <xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="NameAndAddress/ForeignAddress/CountryCd" />
					 </xsl:call-template>
					 <br />
					 <xsl:call-template name="PopulateText">
						  <xsl:with-param name="TargetNode" select="NameAndAddress/ForeignAddress/ForeignPostalCd" />
					 </xsl:call-template>
				 </xsl:otherwise>
			 </xsl:choose>
          </td>
          <td class="styDepTblCell" style="width:50mm;text-align:left">
			  <xsl:for-each select="VIN">
				 <xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="." />
				 </xsl:call-template><br/>
			  </xsl:for-each>
          </td>
        </tr>
      </xsl:for-each>
    </table>
  </xsl:template>
  
  <!-- Main template -->
  <xsl:template match="/">
    <html>
      <head>
         <title><xsl:value-of select="$depDocTitle" /></title>
         <!-- No Browser Caching -->
         <meta http-equiv="Pragma" content="no-cache" />
         <meta http-equiv="Cache-Control" content="no-cache" />
         <meta http-equiv="Expires" content="0" />
         <!-- No Proxy Caching -->
         <meta http-equiv="Cache-Control" content="private" />
         <!-- Define Character Set -->
         <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
         <meta name="Author" content="Jason Goltermann" />
         <meta name="Description" content= "{$depDocTitle}" />
         
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
        <xsl:call-template name="InitJS"></xsl:call-template>
        <style type="text/css">
  <xsl:if test="not($Print) or $Print=''">
    <xsl:call-template name="AddOnStyle"></xsl:call-template>    
  </xsl:if>
</style>        
      <xsl:call-template name="GlobalStylesDep"/>
</head>
     <body class="styBodyClass">
        <xsl:call-template name="DocumentHeaderDependency">
        </xsl:call-template>
          <div class="styDepTitleLine" style="width:187mm;">
            <span class="styDepTitle" style="width:187mm;">
              <span style="width:187mm;">
                <xsl:value-of select="$depDocTitle" />
              </span>
            </span>
          </div>
          <div class="styTopSectionLine" >
             <xsl:call-template name="SetFormLinkInline">
                 <xsl:with-param name="TargetNode" select="$DependencyData"/> 
             </xsl:call-template>
         </div>  
        <xsl:call-template name="PopulateDepCommonLeftover">
                <xsl:with-param name="TargetNode" select="$DependencyData" />
                               <xsl:with-param name="NoGap" select="'true'" />
        </xsl:call-template>
          <xsl:call-template name="PrivateSaleVehicleStatementTemp" />
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>