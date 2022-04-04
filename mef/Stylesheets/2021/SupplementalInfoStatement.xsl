<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="PopulateTemplate.xsl"/>
   <xsl:include href="AddHeader.xsl"/>
   <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:param name="DependencyData" select="$RtnDoc/SupplementalInfoStatement"/>
  <!-- 1120 Common - Supplemental Information Statement -->
  <xsl:template name="ShowDependencyData">
    <table id="DependencyDataTbl" class="styDepTblLandscape">
      <thead class="styTableThead">
      <tr class="styDepTblHdr">         
        <th class="styDepTblCell" scope="col" style="width:42mm;">Title</th>         
        <th class="styDepTblCell" scope="col" style="width:42mm;">Type</th>  
        <th class="styDepTblCell" scope="col" style="width:34mm;">Amount</th>  
        <th class="styDepTblCell" scope="col" style="width:42mm;">Description</th>  
        <th class="styDepTblCell" scope="col" style="width:41mm;">Statement</th>  
        <th class="styDepTblCell" scope="col" style="width:25mm;">Code</th>
        <th class="styDepTblCell" scope="col" style="width:30mm;">Ratio</th>                                                                               
      </tr>
      </thead>
      <tbody>
				<xsl:for-each select="$DependencyData/SupplementalInformationGrp">
					<tr>
						<xsl:attribute name="class">
							<xsl:choose>
								<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
								<xsl:otherwise>styDepTblRow2</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>            
						<td class="styDepTblCell" style="width:42mm;text-align:left;">         
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="TitleTxt"/>
							</xsl:call-template> 
						</td>       
						<td class="styDepTblCell" style="width:42mm;text-align:left;">         
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="SupplementalInfoTyp"/>
							</xsl:call-template> 
						</td>  
						<td class="styDepTblCell" style="width:34mm;text-align:right;">          
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="Amt"/>
							</xsl:call-template> 
						</td>  
						<td class="styDepTblCell" style="width:42mm;text-align:left;">         
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="Desc"/>
							</xsl:call-template> 
						</td>  
						<td class="styDepTblCell" style="width:41mm;text-align:left;">         
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="ExplanationTxt"/>
							</xsl:call-template> 
						</td>  
						<td class="styDepTblCell" style="width:25mm;text-align:center;">         
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="Cd"/>
							</xsl:call-template> 
						</td>  
						<td class="styDepTblCell" style="width:30mm;text-align:right">         
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="RatioRt"/>
							</xsl:call-template> 
						</td>                 
					</tr>
				</xsl:for-each>
      </tbody>
    </table>
  </xsl:template>
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
        <meta http-equiv="Content-SupplementalInfoTyp" content="text/html; charset=ISO-8859-1"/>
        <meta name="Author" content="Jason Iozzo"/>
        <meta name="ShortExplanationTxt" content="{$depDocTitle}"/>       
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
        <xsl:call-template name="DocumentHeaderDependencyLandscape"/>
        <div class="styDepTitleLineLandscape">
          <span class="styDepTitle" style="width:108mm;">
            <xsl:value-of select="$depDocTitle"/>        
          </span>
        </div>
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftoverLandscape"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>        
        <xsl:call-template name="ShowDependencyData"/>          
        <br/>                      
      </body>
       <tfoot/>
    </html>
  </xsl:template>
</xsl:stylesheet>