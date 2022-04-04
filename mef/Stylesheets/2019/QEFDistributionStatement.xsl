<?xml version="1.0" encoding="UTF-8"?>
<!-- 06/15/2015 - Changes made for IE11 compatibility - Jeremy Nichols -->
<!-- 09/09/2015 - Changes made for defect 44274 - Jeremy Nichols -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>

  <xsl:param name="DependencyData" select="$RtnDoc/QEFDistributionStatement"/>

  <!-- Main template -->
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
      <body class="styBodyClass" style="width:187mm">

        <xsl:call-template name="DocumentHeaderDependency"/>
        
        <div class="styDepTitleLine">
          <div class="styDepTitle" style="padding:right;5mm;">
           <xsl:value-of select="$depDocTitle"/>
          </div>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>
        <div class="styTopSectionLine" style="width:187mm;">        
          <div class=" styTopSectionLineLbl" style="float:left;clear:none;">Name:</div>
          <div style="width:118mm;float:left;clear:none;">
			<xsl:if test="$DependencyData/BusinessName !=''">
				<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$DependencyData/BusinessName/BusinessNameLine1Txt"/></xsl:call-template>
				<xsl:if test="$DependencyData/BusinessName/BusinessNameLine2Txt !=''">
				  <br/><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$DependencyData/BusinessName/BusinessNameLine2Txt"/></xsl:call-template>
				</xsl:if>
			</xsl:if>
			<xsl:if test="$DependencyData/ShareholderPersonNm !=''">
				<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$DependencyData/ShareholderPersonNm"/></xsl:call-template>
			</xsl:if>
          </div>
        </div>  
        
        <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:both;">Address:</div>
          <div style="width:118mm;float:left;clear:right;">
			  <xsl:choose>
				 <xsl:when test="$DependencyData/USAddress">
					 <xsl:call-template name="PopulateUSAddressTemplate">
							 <xsl:with-param name="TargetNode" select="$DependencyData/USAddress"/>
					  </xsl:call-template> 
				</xsl:when>
				<xsl:otherwise>
				<xsl:call-template name="PopulateForeignAddressTemplate">
					 <xsl:with-param name="TargetNode" select="$DependencyData/ForeignAddress"/>
				</xsl:call-template> 
				</xsl:otherwise>
			</xsl:choose>
          </div>
        </div>        

            <xsl:choose>
             <xsl:when test="$DependencyData/SSN">
                <div class="styTopSectionLine" style="width:187mm;">
     		     <div class="styTopSectionLineLbl" style="float:left;clear:both;">Social Security Number:  </div>
      		 	<div style="float:left;clear:right;">
                <xsl:call-template name="PopulateSSN">
                <xsl:with-param name="TargetNode" select="$DependencyData/SSN"/>
                </xsl:call-template>
                	</div>
                </div>
            </xsl:when>
                
             <xsl:when test="$DependencyData/MissingEINReasonCd">
                <div class="styTopSectionLine" style="width:187mm;">
     		     <div class="styTopSectionLineLbl" style="float:left;clear:both;">Missing EIN reason:	 </div>
            		<div style="float:left;clear:right;">               
                <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$DependencyData/MissingEINReasonCd"/>
                </xsl:call-template>
                   </div>
                </div>
             </xsl:when>

            <xsl:otherwise>

             <div class="styTopSectionLine" style="width:187mm;">
     		  <div class="styTopSectionLineLbl" style="float:left;clear:both;">Employer identification number:  </div>
           	  <div style="float:left;clear:right;">               
              <xsl:call-template name="PopulateEIN">
                <xsl:with-param name="TargetNode" select="$DependencyData/EIN"/>
                </xsl:call-template>
                </div>
     	   </div>
              </xsl:otherwise>
            </xsl:choose>
        
        <div class="styTopSectionLine" style="width:187mm;">        
          <div class="styTopSectionLineLbl" style="float:left;clear:both;">Amount Included in Income:</div>
          <div style="float:left;clear:right;">            
              <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$DependencyData/IncludedAsIncomeAmt"/></xsl:call-template>
          </div>
        </div>            
        <div class="styTopSectionLine" style="width:187mm;">        
          <div class="styTopSectionLineLbl" style="float:left;clear:both;">
            Tax Year in Which the Amount was Previously Included in Income:
          </div>
          <div style="float:left;clear:right;">            
            <br/><br/><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$DependencyData/IncludedIncomeForTaxYr"/></xsl:call-template>
          </div>
        </div>            
        <div class="styTopSectionLine" style="width:187mm;">        
          <div class="styTopSectionLineLbl" style="float:left;clear:both;text-align:right;">
            The Law Under Which the Amount was Previously Included in Income:
          </div>
          <div style="width:118mm;float:left;clear:right;">            
            <br/><br/><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" 
            select="$DependencyData/LawForIncludedIncomeTxt"/></xsl:call-template>
          </div>
        </div>  
        <div class="styTopSectionLine" style="width:187mm;">        
          <div class="styTopSectionLineLbl" style="float:left;clear:both;">
            Description of Transaction in Which the Shareholder Acquired the Stock of the PFIC from                     the Other US Person:
          </div>
          <div style="width:118mm;float:left;clear:right;">            
            <br/><br/><br/><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" 
            select="$DependencyData/TransactionDesc"/></xsl:call-template>
          </div>
        </div>            
        <div class="styTopSectionLine" style="width:187mm">        
          <div class="styTopSectionLineLbl" style="float:left;clear:both;">
            The Law Under Which the Shareholder's Holding Period Includes the Holding Period of the                     Other US Person:
          </div>
          <div style="width:118mm;float:left;clear:right;">            
            <br/><br/><br/><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode"
            select="$DependencyData/LawForShareholdersHoldPrdTxt"/></xsl:call-template>
          </div>
        </div>        
        
                
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>