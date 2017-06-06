<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  
  <xsl:param name="DependencyData" select="$RtnDoc/PrinCommitteeDesgnAttachment" />
  
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName">
      <xsl:with-param name="TargetNode" select="$DependencyData" />
    </xsl:call-template>  
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

        <style type="text/css"></style>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="AddOnStyle"></xsl:call-template>    
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesDep"/>
      </head>    
     
      <body class="styBodyClass">
        <xsl:call-template name="DocumentHeaderDependency"  />  
        
        <div class="styDepTitleLine">
          <span class="styDepTitle">
            <span style="width:118mm;"><xsl:value-of select="$depDocTitle" /></span>        
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftover">
          <xsl:with-param name="TargetNode" select="$DependencyData"/>
        </xsl:call-template>
    
        <div class="styTopSectionLine" style="width:187mm;clear:both;">
          <div class="styDepGenericDiv"><span class="styTopSectionLineLbl">Candidate’s Name:</span></div>
          <div class="styDepGenericDiv">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/CandidateName" />
            </xsl:call-template>
          </div>
        </div>
        
        <div class="styTopSectionLine" style="width:187mm;clear:both;">
          <div class="styDepGenericDiv" style="clear:both;">
            <span class="styTopSectionLineLbl">Candidate’s Address:</span>
          </div>
          <div class="styDepGenericDiv" style="clear:right;">
            <xsl:choose>
              <xsl:when test="$DependencyData/CandidateAddressUS">
                <xsl:call-template name="PopulateUSAddressTemplate">
                  <xsl:with-param name="TargetNode" select="$DependencyData/CandidateAddressUS" />
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="PopulateForeignAddressTemplate">
                  <xsl:with-param name="TargetNode" select="$DependencyData/CandidateAddressForeign" />
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
              <xsl:with-param name="TargetNode" select="$DependencyData/CandidateIdentifyingNumber" />
            </xsl:call-template>
          </div>
        </div>
        
        <div class="styTopSectionLine" style="width:187mm;clear:both;">
          <div class="styDepGenericDiv" style="clear:both;">
            <span class="styTopSectionLineLbl">Party Affiliation:</span>
          </div>
          <div class="styDepGenericDiv" style="clear:right;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/PartyAffiliation" />
            </xsl:call-template>
          </div>
        </div>
        
        <div class="styTopSectionLine" style="width:187mm;clear:both;">
          <div class="styDepGenericDiv" style="clear:both;">
            <span class="styTopSectionLineLbl">Office Sought:</span>
          </div>
          <div class="styDepGenericDiv" style="clear:right;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/OfficeSought" />
            </xsl:call-template>
          </div>
        </div>
        
        <div class="styTopSectionLine" style="width:187mm;clear:both;">
          <div class="styDepGenericDiv" style="clear:both;">
            <span class="styTopSectionLineLbl">District:</span>
          </div>
          <div class="styDepGenericDiv" style="clear:right;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/District" />
            </xsl:call-template>
          </div>
        </div>
        
        <div class="styTopSectionLine" style="width:187mm;clear:both;">
          <div class="styDepGenericDiv" style="clear:both;">
            <span class="styTopSectionLineLbl">State:</span>
          </div>
          <div class="styDepGenericDiv" style="clear:right;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/State" />
            </xsl:call-template>
          </div>
        </div>
        
        <div class="styTopSectionLine" style="width:187mm;clear:both;">
          <div class="styDepGenericDiv" style="clear:both;">
            <span class="styTopSectionLineLbl">Name of Principal Campaign Committee:</span>
          </div>
          <div class="styDepGenericDiv" style="clear:right;">
            <br /><xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/NameOfPrinCampaignCommittee" />
            </xsl:call-template>
          </div>
        </div>
        
        <div class="styTopSectionLine" style="width:187mm;clear:both;">
          <div class="styDepGenericDiv" style="clear:both;">
            <span class="styTopSectionLineLbl">Committee’s Address:</span>
          </div>
          <div class="styDepGenericDiv" style="clear:right;">
            <xsl:choose>
              <xsl:when test="$DependencyData/CommitteeAddressUS">
                <xsl:call-template name="PopulateUSAddressTemplate">
                  <xsl:with-param name="TargetNode" select="$DependencyData/CommitteeAddressUS" />
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="PopulateForeignAddressTemplate">
                  <xsl:with-param name="TargetNode" select="$DependencyData/CommitteeAddressForeign" />
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
