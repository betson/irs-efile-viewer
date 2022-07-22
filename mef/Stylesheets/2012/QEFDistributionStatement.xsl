<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>

  <xsl:param name="DependencyData" select="$RtnDoc/QEFDistributionStatement" />
  
  
  
  
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
            <span style="width:187mm;"><xsl:value-of select="$depDocTitle" /></span>        
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>
        <div class="styTopSectionLine" style="width:187mm;">        
          <div class=" styTopSectionLineLbl" style="float:left;clear:none;">Name:</div>
          <div style="float:left;clear:none;">            
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$DependencyData/Name/BusinessNameLine1"/></xsl:call-template>
            <xsl:if test="$DependencyData/Name/BusinessNameLine2 !=''">
              <br/><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$DependencyData/Name/BusinessNameLine2"/></xsl:call-template>
            </xsl:if>
          </div>
        </div>  
        
        <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:both;">Address:</div>
          <div style="float:left;clear:right;">
            <!--xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$DependencyData/Address/AddressLine1" /></xsl:call-template>
            <xsl:if test="$DependencyData/Address/AddressLine2 != ''">
              <br /><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$DependencyData/Address/AddressLine2" /></xsl:call-template>                          </xsl:if>
            <xsl:if test="$DependencyData/Address/City != ''"><br /><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$DependencyData/Address/City" /></xsl:call-template>, </xsl:if>
            <xsl:if test="$DependencyData/Address/State != ''"> <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$DependencyData/Address/State" /></xsl:call-template></xsl:if>
            <xsl:if test="$DependencyData/Address/ZIPCode != ''"><span style="width:4px;" /><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$DependencyData/Address/ZIPCode" /></xsl:call-template></xsl:if-->


	  <xsl:choose>
     	 <xsl:when test="$DependencyData/USAddress">
             <xsl:call-template name="PopulateUSAddressTemplate">
                     <xsl:with-param name="TargetNode" select="$DependencyData/USAddress" />
              </xsl:call-template> 
      	</xsl:when>
   		<xsl:otherwise>
      	<xsl:call-template name="PopulateForeignAddressTemplate">
             <xsl:with-param name="TargetNode" select="$DependencyData/ForeignAddress" />
      	</xsl:call-template> 
  		</xsl:otherwise>
	</xsl:choose>
          </div>
        </div>        

            <xsl:choose>
             <xsl:when test="$DependencyData/SocialSecurityNumber">
                <div class="styTopSectionLine" style="width:187mm;">
     		     <div class="styTopSectionLineLbl" style="float:left;clear:both;">Social Security Number:  </div>
      		 	<div style="float:left;clear:right;">
                <xsl:call-template name="PopulateSSN">
                <xsl:with-param name="TargetNode" select="$DependencyData/SocialSecurityNumber" />
                </xsl:call-template>
                	</div>
                </div>
            </xsl:when>
                
             <xsl:when test="$DependencyData/MissingEINReason">
                <div class="styTopSectionLine" style="width:187mm;">
     		     <div class="styTopSectionLineLbl" style="float:left;clear:both;">Missing EIN reason:	 </div>
            		<div style="float:left;clear:right;">               
                <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$DependencyData/MissingEINReason" />
                </xsl:call-template>
                   </div>
                </div>
             </xsl:when>

            <xsl:otherwise>

             <div class="styTopSectionLine" style="width:187mm;">
     		  <div class="styTopSectionLineLbl" style="float:left;clear:both;">Employer identification number:  </div>
           	  <div style="float:left;clear:right;">               
              <xsl:call-template name="PopulateEIN">
                <xsl:with-param name="TargetNode" select="$DependencyData/EmployerIdentificationNumber" />
                </xsl:call-template>
                </div>
     	   </div>
              </xsl:otherwise>
            </xsl:choose>
        
        <div class="styTopSectionLine" style="width:187mm;">        
          <div class="styTopSectionLineLbl" style="float:left;clear:both;">Amount Included in Income:</div>
          <div style="float:left;clear:right;">            
              <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$DependencyData/AmountIncludedInIncome"/></xsl:call-template>
          </div>
        </div>            
        <div class="styTopSectionLine" style="width:187mm;">        
          <div class="styTopSectionLineLbl" style="float:left;clear:both;">
            Tax Year in Which the Amount was Previously Included in Income:
          </div>
          <div style="float:left;clear:right;">            
            <br/><br /><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$DependencyData/TaxYearAmountIncludedInIncome"/></xsl:call-template>
          </div>
        </div>            
        <div class="styTopSectionLine" style="width:187mm;">        
          <div class="styTopSectionLineLbl" style="float:left;clear:both;text-align:right;">
            The Law Under Which the Amount was Previously Included in Income:
          </div>
          <div style="float:left;clear:right;">            
            <br/><br /><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$DependencyData/LawUnderWhichAmountWasIncluded"/></xsl:call-template>
          </div>
        </div>  
        <div class="styTopSectionLine" style="width:187mm;">        
          <div  class="styTopSectionLineLbl" style="float:left;clear:both;">
            Description of Transaction in Which the Shareholder Acquired the Stock of the PFIC from                     the Other US Person:
          </div>
          <div class="styExplanationLine">            
            <br/><br/><br /><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$DependencyData/DescriptionOfTransaction"/></xsl:call-template>
          </div>
        </div>            
        <div class="styTopSectionLine" style="width:187mm;">        
          <div class="styTopSectionLineLbl" style="float:left;clear:both;">
            The Law Under Which the Shareholder's Holding Period Includes the Holding Period of the                     Other US Person:
          </div>
          <div style="float:left;clear:right;">            
            <br/><br/><br /><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$DependencyData/ShareholdersHoldingPeriodLaw"/></xsl:call-template>
          </div>
        </div>        
        
                
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







