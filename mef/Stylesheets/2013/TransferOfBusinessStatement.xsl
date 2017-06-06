<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>

  <xsl:param name="DependencyData" select="$RtnDoc/TransferOfBusinessStatement" />
  <!-- Display Name  Final Payroll Info Statement  -->
  <!-- Main template -->
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>  
  </xsl:param>
  <!-- Main template -->
  <xsl:template match="/" >

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

        <xsl:call-template name="DocumentHeaderDependency" />  
        <div class="styDepTitleLine">

          <span class="styDepTitle">
            <span style="width:66mm;"><xsl:value-of select="$depDocTitle" /></span>        
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>
        <div class="styTopSectionLine" style="width:187mm;">        
          <div class=" styTopSectionLineLbl" style="float:left;clear:none;">Name:</div>
          <div style="float:left;clear:none;">
			<xsl:if test="$DependencyData/OwnerNm !=''">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$DependencyData/OwnerNm"/>
					</xsl:call-template><br/>
				</xsl:if>
				<xsl:if test="$DependencyData/BusinessName/BusinessNameLine1 !=''">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$DependencyData/BusinessName/BusinessNameLine1"/>
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="$DependencyData/BusinessName/BusinessNameLine2 !=''">
				    <br/>
				    <xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$DependencyData/BusinessName/BusinessNameLine2"/>
					</xsl:call-template>
				</xsl:if>
		   </div>
		</div>
		
		<div class="styTopSectionLine" style="width:187mm;">        
          <div class=" styTopSectionLineLbl" style="float:left;clear:none;">Business Type Code:</div>
          <div style="float:left;clear:none;">
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$DependencyData/BusinessTypeCd"/>
			</xsl:call-template><br/>
		  </div>
		</div>
		
		<div class="styTopSectionLine" style="width:187mm;">        
          <div class=" styTopSectionLineLbl" style="float:left;clear:none;">Business Change Type Code:</div>
          <div style="float:left;clear:none;">
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$DependencyData/BusinessChangeTypeCd"/>
			</xsl:call-template><br/>
		  </div>
		</div>
		
		<div class="styTopSectionLine" style="width:187mm;">        
          <div class=" styTopSectionLineLbl" style="float:left;clear:none;">Change Date:</div>
          <div style="float:left;clear:none;">
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$DependencyData/ChangeDt"/>
			</xsl:call-template><br/>
		  </div>
		</div>
		
		<div class="styTopSectionLine" style="width:187mm;">        
          <div class=" styTopSectionLineLbl" style="float:left;clear:none;">Person Name:</div>
          <div style="float:left;clear:none;">
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$DependencyData/PersonNm"/>
			</xsl:call-template><br/>
		  </div>
		</div>
       
        <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:both;">Address:</div>
          <div style="float:left;clear:right;">
            <xsl:if test="$DependencyData/USAddress">
                <xsl:call-template name="PopulateUSAddressTemplate">
                <xsl:with-param name="TargetNode" select="$DependencyData/USAddress"/>
                </xsl:call-template>
              </xsl:if>
              <xsl:if test="$DependencyData/ForeignAddress">
                <xsl:call-template name="PopulateForeignAddressTemplate">
                <xsl:with-param name="TargetNode" select="$DependencyData/ForeignAddress"/>
                </xsl:call-template>
              </xsl:if>
          </div>
        </div>         
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>