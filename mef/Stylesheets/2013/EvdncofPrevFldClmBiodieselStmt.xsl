<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:param name="DependencyData" select="$RtnDoc/EvdncofPrevFldClmBiodieselStmt"/>
   <!--  8864 Form displays as - Evidence of a Previously Filed Claim for Biodiesel Sold or Used Statement  -->
      <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName">
      <xsl:with-param name="TargetNode" select="$DependencyData"/>
    </xsl:call-template>  
  </xsl:param>
  <!-- Main template -->
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
	<html>
      <head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <title>
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
        <meta name="Author" content="Chris Sinderson"/>
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
      <body class="styBodyClass" style="width:187mm;">
        <xsl:call-template name="DocumentHeaderDependency"/>    
        <div class="styDepTitleLine">
          <span class="styDepTitle" style="padding-right:2mm;">          
            <xsl:value-of select="$depDocTitle"/>  
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftover">
          <xsl:with-param name="TargetNode" select="$DependencyData"/>
        </xsl:call-template>
        <xsl:call-template name="DependencyTemplate"/>          
        <br/>                      
      </body>
    </html>
  </xsl:template>
  <!-- Template for the Table of Data -->
  <xsl:template name="DependencyTemplate">
    <table id="AOVSSTbl" class="styDepTbl">
      <thead class="styTableThead">
        <!-- Label the Column Headers -->
        <tr class="styDepTblHdr">
             <th class="styDepTblCell" scope="col">Certificate Identification Number</th>  
             <th class="styDepTblCell" scope="col">Total Gallons of Agri-Biodiesel</th>        
             <th class="styDepTblCell" scope="col">Total Gallons Claimed on Schedule 3 (Form 8849)</th>
             <th class="styDepTblCell" scope="col">Total Gallons Claimed on Schedule C (Form 720)</th>
             <th class="styDepTblCell" scope="col">Total Gallons Claimed on Form 4136</th>       
        </tr>
      </thead>
      <tfoot/>
      <tbody>    
        <xsl:for-each select="$DependencyData/BiodieselCertTyp">  
          <tr>
            <!-- Define background colors to the rows -->
            <xsl:attribute name="class">
              <xsl:choose>
                <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
            <!-- First Column -->
            <td class="styDepTblCell" style="text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="MaxSize" select="3"/>
                <xsl:with-param name="TargetNode" select="CertificateIdentificationNum"/>
              </xsl:call-template>
            </td>  
            <!-- Second Column -->
            <td class="styDepTblCell" style="text-align:left;width:33mm;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="TotalGallonsofAgriBiodieselQty"/>
              </xsl:call-template>
            </td>
            <!-- Third Column -->
            <td class="styDepTblCell" style="text-align:left;width:33mm;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="TotalGallonsClmSch3Frm8849Qty"/>
              </xsl:call-template>
            </td>
            <!-- Fourth Column -->
            <td class="styDepTblCell" style="text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="TotalGallonsClmSchCFrm720Qty"/>
              </xsl:call-template>
            </td>   
            <!-- Fifth Column -->
            <td class="styDepTblCell" style="text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="TotalGallonsClaimedForm4136Qty"/>
              </xsl:call-template>
            </td>   
          </tr>      
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>
</xsl:stylesheet>