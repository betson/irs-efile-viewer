<?xml version="1.0" encoding="UTF-8"?>
<!-- This form by Doug Peterson 6-19-2006 --><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>

  <xsl:param name="DependencyData" select="$RtnDoc/SelfChargedInterestElection"/>
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
      <body class="styBodyClass">
  
        <xsl:call-template name="DocumentHeaderDependency"/>  
        <div class="styDepTitleLine">
          <span class="styDepTitle" style="width:120mm;">
            <span><xsl:value-of select="$depDocTitle"/></span>
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>
        <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="align:right;float:left;clear:none;">Address:</div>
          <div style="float:left;clear:none;width:118mm;">
         <xsl:if test="$RtnDoc/SelfChargedInterestElection/USAddress != ''">
        		
                    <xsl:call-template name="PopulateUSAddressTemplate"><xsl:with-param name="TargetNode" select="$RtnDoc/SelfChargedInterestElection/USAddress"/></xsl:call-template>
              </xsl:if>             
              
               <xsl:if test="$RtnDoc/SelfChargedInterestElection/ForeignAddress != ''">
                    <xsl:call-template name="PopulateForeignAddressTemplate"><xsl:with-param name="TargetNode" select="$RtnDoc/SelfChargedInterestElection/ForeignAddress"/></xsl:call-template>
              </xsl:if>
              </div>
        </div><br/>
        <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Name of partnership:</div>
          <div style="float:left;clear:none;width:118mm;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$RtnDoc/SelfChargedInterestElection/PartnershipName/BusinessNameLine1"/>
            </xsl:call-template><br/>
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$RtnDoc/SelfChargedInterestElection/PartnershipName/BusinessNameLine2"/>
            </xsl:call-template>
          </div>
        </div>
    
        <br/> 
         <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="align:right;float:left;clear:none;">EIN:</div>
          <div style="float:left;clear:none;width:118mm;">
            <xsl:call-template name="PopulateEIN">
              <xsl:with-param name="TargetNode" select="$RtnDoc/SelfChargedInterestElection/EIN"/>
            </xsl:call-template>
          </div>
        </div>
        <br/>
        <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Regulation section 1.469-7(g) declaration:</div>
          <div style="width:187mm;padding-top:2mm;float:left;clear:none;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$RtnDoc/SelfChargedInterestElection/RegulationSection14697gDclrTxt"/>
            </xsl:call-template>
          </div>
        </div>
        <br/> 
       
      <!--  <xsl:if test="USAddress!= ''">
                        
                          <xsl:if test="USAddress/AddressLine1 != ''">
                            <br/>
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="AddressInUS/AddressLine1"/>
                            </xsl:call-template>
                          </xsl:if>
                          <xsl:if test="USAddress/AddressLine2 != ''">
                            <br/>
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="AddressInUS/AddressLine2"/>
                            </xsl:call-template>
                          </xsl:if>
                          <xsl:if test="USAddress/City != ''">
                            <br/>
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="AddressInUS/City"/>
                            </xsl:call-template>
                          </xsl:if>
                          <xsl:if test="USAddress/State != ''">,
                <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="AddressInUS/State"/>
                            </xsl:call-template>
                          </xsl:if>
                          <xsl:if test="USAddress/ZIPCode != ''">
                            <span style="width:8px"/>
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="AddressInUS/ZIPCode"/>
                            </xsl:call-template>
                          </xsl:if>
                      </xsl:if>
                        <xsl:if test="ForeignAddress!= ''">
                            <xsl:if test="ForeignAddress/AddressLine1 != ''">
                              <br/>
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine1"/>
                              </xsl:call-template>
                            </xsl:if>
                            <xsl:if test="ForeignAddress/AddressLine2 != ''">
                              <br/>
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine2"/>
                              </xsl:call-template>
                            </xsl:if>
                            <xsl:if test="ForeignAddress/City != ''">
                              <br/>
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="ForeignAddress/City"/>
                              </xsl:call-template>
                            </xsl:if>
                            <xsl:if test="ForeignAddress/ProvinceOrState != ''">,<span style="width: 1mm"/>
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="ForeignAddress/ProvinceOrState"/>
                              </xsl:call-template>
                            </xsl:if>
                            <xsl:if test="ForeignAddress/PostalCode != ''">
                              <span style="width: 2mm"/>
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="ForeignAddress/PostalCode"/>
                              </xsl:call-template>
                            </xsl:if>
                            <xsl:if test="ForeignAddress/Country != ''">
                              <br/>
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="ForeignAddress/Country"/>
                              </xsl:call-template>
                            </xsl:if>
                        </xsl:if>-->
     
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>