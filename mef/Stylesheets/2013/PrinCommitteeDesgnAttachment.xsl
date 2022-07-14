<?xml version="1.0" encoding="UTF-8"?>
<!--UWR123023 IE11 Upgrade Fixes 5/22/15 by Robert L Jones-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  
  <xsl:param name="DependencyData" select="$RtnDoc/PrinCommitteeDesgnAttachment"/>
  
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

        <style type="text/css"/>
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
          <span class="styDepTitle">
            <xsl:value-of select="$depDocTitle"/>      
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftover">
          <xsl:with-param name="TargetNode" select="$DependencyData"/>
        </xsl:call-template>
    
        <div class="styTopSectionLine" style="width:187mm;clear:both;">
          <div class="styDepGenericDiv"><span class="styTopSectionLineLbl">Candidate’s Name:</span></div>
          <div class="styDepGenericDiv">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/CandidateNm"/>
            </xsl:call-template>
          </div>
        </div>
        
        <div class="styTopSectionLine" style="width:187mm;clear:both;">
          <div class="styDepGenericDiv" style="clear:both;">
            <span class="styTopSectionLineLbl">Candidate’s Address:</span>
          </div>
          <div class="styDepGenericDiv" style="clear:right;width:105mm;">
            <xsl:choose>
              <xsl:when test="$DependencyData/CandidateUSAddress">
                <xsl:call-template name="PopulateUSAddressTemplate">
                  <xsl:with-param name="TargetNode" select="$DependencyData/CandidateUSAddress"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="PopulateForeignAddressTemplate">
                  <xsl:with-param name="TargetNode" select="$DependencyData/CandidateForeignAddress"/>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
        
        <div class="styTopSectionLine" style="width:187mm;clear:both;">
          <div class="styDepGenericDiv" style="clear:both;">
            <span class="styTopSectionLineLbl">Candidate’s Identifying Number:</span>
          </div>
          <div class="styDepGenericDiv" style="clear:right;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/CandidateIdentifyingNum"/>
            </xsl:call-template>
          </div>
        </div>
        
        <div class="styTopSectionLine" style="width:187mm;clear:both;">
          <div class="styDepGenericDiv" style="clear:left;">
            <span class="styTopSectionLineLbl">Party Affiliation:</span>
          </div>
          <div class="styDepGenericDiv" style="clear:right;width:105mm;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/PartyAffiliationTxt"/>
            </xsl:call-template>
          </div>
        </div>
        
        <div class="styTopSectionLine" style="width:187mm;clear:both;">
          <div class="styDepGenericDiv" style="clear:both;">
            <span class="styTopSectionLineLbl">Office Sought:</span>
          </div>
          <div class="styDepGenericDiv" style="clear:right;width:105mm;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/OfficeSoughtDesc"/>
            </xsl:call-template>
          </div>
        </div>
        
        <div class="styTopSectionLine" style="width:187mm;clear:both;">
          <div class="styDepGenericDiv" style="clear:both;">
            <span class="styTopSectionLineLbl">District:</span>
          </div>
          <div class="styDepGenericDiv" style="clear:right;width:105mm;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/DistrictNameTxt"/>
            </xsl:call-template>
          </div>
        </div>
        
        <div class="styTopSectionLine" style="width:187mm;clear:both;">
          <div class="styDepGenericDiv" style="clear:both;">
            <span class="styTopSectionLineLbl">State:</span>
          </div>
          <div class="styDepGenericDiv" style="clear:right;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/StateAbbreviationCd"/>
            </xsl:call-template>
          </div>
        </div>
        
        <div class="styTopSectionLine" style="width:187mm;clear:both;">
          <div class="styDepGenericDiv" style="clear:both;">
            <span class="styTopSectionLineLbl">Name of Principal Campaign Committee:</span>
          </div>
          <div class="styDepGenericDiv" style="clear:right;width:105mm;">
            <br/><xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/PrinCampaignCommitteeNameTxt"/>
            </xsl:call-template>
          </div>
        </div>
        
        <div class="styTopSectionLine" style="width:187mm;clear:both;">
          <div class="styDepGenericDiv" style="clear:both;">
            <span class="styTopSectionLineLbl">Committee’s Address:</span>
          </div>
          <div class="styDepGenericDiv" style="clear:right;width:105mm;">
            <xsl:choose>
              <xsl:when test="$DependencyData/CommitteeUSAddress">
                <xsl:call-template name="PopulateUSAddressTemplate">
                  <xsl:with-param name="TargetNode" select="$DependencyData/CommitteeUSAddress"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="PopulateForeignAddressTemplate">
                  <xsl:with-param name="TargetNode" select="$DependencyData/CommitteeForeignAddress"/>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
        
        <br/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>