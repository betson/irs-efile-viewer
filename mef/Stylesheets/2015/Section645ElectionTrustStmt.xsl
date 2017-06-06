<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>  
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:param name="FormDepsData" select="$RtnDoc/Section645ElectionTrustStmt"/>
  <!-- Form 1041- Section 645 Election Trust Statement -->
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName">
      <xsl:with-param name="TargetNode" select="$FormDepsData"/>
    </xsl:call-template>  
  </xsl:param>
  <!-- Main template -->
  <xsl:template match="/">
  
  <!--<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>-->
  
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
        <meta name="Author" content="Jessica Lee - jesslee@us.ibm.com"/>
        <meta name="Description" content="{$depDocTitle}"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
        
        <!--* {box-sizing:border-box;}
        input[type=checkbox] {box-sizing:content-box;}
        span {display:inline-block;}-->
        
			<xsl:if test="not($Print) or $Print=''">
				<xsl:call-template name="AddOnStyle"/>
			</xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesDep"/>
		</head>
		<body class="styBodyClass" style="width:187mm;">    
			<xsl:call-template name="DocumentHeaderDependency"/>
			<div class="styDepTitleLine">
				<span class="styDepTitle" style="width:105mm;">
					<xsl:value-of select="$depDocTitle"/>
				</span>
			</div>
			<xsl:call-template name="PopulateDepCommonLeftover">
				<xsl:with-param name="TargetNode" select="$FormDepsData"/>
			</xsl:call-template>
			<table class="styDepTbl" style="margin-top:4mm;">
				<thead class="styTableThead">        
					<tr class="styDepTblHdr">           
						<th class="styDepTblCell" scope="col" style="width:77mm;">Name of Electing Trust </th>
						<th class="styDepTblCell" scope="col" style="width:34mm;">TIN of Electing Trust </th>
						<th class="styDepTblCell" scope="col" style="width:76mm;">Name and Address of the Trustee of the Electing Trust </th>                
					</tr>
				</thead>  
				<tfoot/>
				<tbody>    
					<xsl:for-each select="$FormDepsData/ElectingTrustGrp">
						<tr>
							<xsl:attribute name="class">
								<xsl:choose>
									<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
									<xsl:otherwise>styDepTblRow2</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
							<td class="styDepTblCell" style="width:77mm;text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="TrustName/BusinessNameLine1Txt"/>
								</xsl:call-template>
								<xsl:if test="normalize-space(TrustName/BusinessNameLine2Txt)!=''"><br/>  
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="TrustName/BusinessNameLine2Txt"/>
									</xsl:call-template>    
								</xsl:if>                        
							</td>
							<td class="styDepTblCell"  style="width:34mm;text-align:center;">           
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="TrustEIN"/>
								</xsl:call-template>           
							</td>
							<td class="styDepTblCell" style="width:76mm;text-align:left;">
								<xsl:choose>
									<xsl:when test="TrusteeNameAndAddress/PersonNm">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="TrusteeNameAndAddress/PersonNm"/>
										</xsl:call-template><br/>
									</xsl:when>
									<xsl:otherwise>								
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="TrusteeNameAndAddress/BusinessName/BusinessNameLine1Txt"/>
										</xsl:call-template>
										<xsl:if test="normalize-space(TrusteeNameAndAddress/BusinessName/BusinessNameLine2Txt)!=''"><br/>  
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TrusteeNameAndAddress/BusinessName/BusinessNameLine2Txt"/>
											</xsl:call-template><br/>    
										</xsl:if>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>		
									<xsl:when test="TrusteeNameAndAddress/USAddress">                  
										<xsl:call-template name="PopulateUSAddressTemplate">
											<xsl:with-param name="TargetNode" select="TrusteeNameAndAddress/USAddress"/>
										</xsl:call-template>										
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateForeignAddressTemplate">
											<xsl:with-param name="TargetNode" select="TrusteeNameAndAddress/ForeignAddress"/>
										</xsl:call-template>										
									</xsl:otherwise>  
								</xsl:choose>	                                 
							</td>                    
						</tr>
					</xsl:for-each>
				</tbody>    
			</table>        
		</body>
    </html>
  </xsl:template>
</xsl:stylesheet>