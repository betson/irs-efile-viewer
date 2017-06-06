<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>

  <xsl:param name="DependencyData" select="$RtnDoc/IntPdOnSellerProvFinancingStmt" />
  <!--Display name is Interest Paid On Seller Provided Financing Statement  -->
  
<xsl:template name="RecipientGrpTmp"> 

		<table id="TaxableIncomeGrpTbl" class="styDepTbl">
			<thead class="styTableThead">
				<tr class="styDepTblHdr">
					<th class="styDepTblCell" scope="col" style="width:75mm;">Name</th>
					<th class="styDepTblCell" scope="col" style="width:75mm;">Address</th>
					<th class="styDepTblCell" scope="col" style="width:37mm;">SSN/EIN</th>
				</tr>
			</thead>
			<xsl:for-each select="$DependencyData/InterestRecipientGrp">
				<tr>
					<xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
					<td class="styDepTblCell" style="width:75mm;text-align:left;">
								<xsl:choose>
									<xsl:when test="NameAndAddress/PersonNm != ''">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="NameAndAddress/PersonNm"/>
										</xsl:call-template>
									</xsl:when>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="NameAndAddress/BusinessName/BusinessNameLine1Txt != ''">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="NameAndAddress/BusinessName/BusinessNameLine1Txt"/>
										</xsl:call-template>
									</xsl:when>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="NameAndAddress/BusinessName/BusinessNameLine2Txt != ''">
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="NameAndAddress/BusinessName/BusinessNameLine2Txt"/>
										</xsl:call-template>
									</xsl:when>
								</xsl:choose>
					</td>
					<td class="styDepTblCell" style="width: 75mm; text-align:left;">
								<xsl:if test="NameAndAddress/USAddress != ''">
									<xsl:call-template name="PopulateUSAddressTemplate">
										<xsl:with-param name="TargetNode" select="NameAndAddress/USAddress"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="NameAndAddress/ForeignAddress != ''">
									<xsl:call-template name="PopulateForeignAddressTemplate">
										<xsl:with-param name="TargetNode" select="NameAndAddress/ForeignAddress"/>
									</xsl:call-template>
								</xsl:if>
					</td>
					<td class="styDepTblCell" style="width: 37mm; text-align:center;">
								<xsl:choose>
									<xsl:when test="SSN != ''">
										<xsl:call-template name="PopulateSSN">
											<xsl:with-param name="TargetNode" select="SSN"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="EIN != ''">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="EIN"/>
										</xsl:call-template>
									</xsl:when>									
								</xsl:choose>
					</td>
				</tr>
			</xsl:for-each>
		</table>	
		        
	</xsl:template>
  
  
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>  
  </xsl:param>
  <!-- Main template -->
  <xsl:template match="/" >

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
      <body class="styBodyClass" style="width:187mm;">
  
        <xsl:call-template name="DocumentHeaderDependency"  />  
        <div class="styDepTitleLine">
          <span class="styDepTitle" style="width:142mm;">
            <span><xsl:value-of select="$depDocTitle" /></span>
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftover">
        	<xsl:with-param name="TargetNode" select="$DependencyData"/>
        </xsl:call-template>
        
	 <xsl:call-template name="RecipientGrpTmp"/>
	
        <br />      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







