<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>

  
  <xsl:param name="DependencyData" select="$RtnDoc/ProxyTaxExplanation" />
  
  
  
  
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
  
      
        <xsl:call-template name="DocumentHeaderDependency"  />  
        <div class="styDepTitleLine">
          <span class="styDepTitle">
            <span style="width:69mm;"><xsl:value-of select="$depDocTitle" /></span>        
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>
    
        <div class="styTopSectionLine">
          <div class="styDepGenericDiv"><span class="styTopSectionLineLbl">Nondeductible Dues:</span></div>
          <div class="styDepGenericDiv">
            <!-- Changed in accordance with defect # 2788 -->
            <!--xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/NondeductibleDues" />
            </xsl:call-template-->
            <xsl:call-template name="PopulateYesBoxText">
              <xsl:with-param name="TargetNode" select="$DependencyData/NondeductibleDues" />
            </xsl:call-template>
            <xsl:call-template name="PopulateNoBoxText">
              <xsl:with-param name="TargetNode" select="$DependencyData/NondeductibleDues" />
            </xsl:call-template>
          </div>
        </div>
        <div class="styTopSectionLine">
          <div class="styDepGenericDiv" style="clear:both;text-align:right;">
            <span class="styTopSectionLineLbl">In-House Lobbying Expenditures:</span>
          </div>
          <div class="styDepGenericDiv" style="clear:right;text-align:right;">
            <!--xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/InhouseLobbyingExpenditures" />
            </xsl:call-template-->
            <xsl:call-template name="PopulateYesBoxText">
              <xsl:with-param name="TargetNode" select="$DependencyData/InhouseLobbyingExpenditures" />
            </xsl:call-template>
            <xsl:call-template name="PopulateNoBoxText">
              <xsl:with-param name="TargetNode" select="$DependencyData/InhouseLobbyingExpenditures" />
            </xsl:call-template>
        </div>
        </div>
        <div class="styTopSectionLine">
          <div class="styDepGenericDiv" style="clear:both;text-align:right;">
            <span class="styTopSectionLineLbl">Dues and Assessments:</span>
          </div>
          <div class="styDepGenericDiv" style="clear:right;text-align:right;">
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$DependencyData/DuesAndAssessments" />
              </xsl:call-template>
            </span>
          </div>
        </div>
        <div class="styTopSectionLine">
          <div class="styDepGenericDiv" style="clear:both;text-align:right;">
            <span class="styTopSectionLineLbl">Sec. 162(e) Expenditures:</span>
          </div>
          <div class="styDepGenericDiv" style="clear:right;text-align:right;">
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$DependencyData/Sect162eExpenditures" />
              </xsl:call-template>
            </span>
          </div>
        </div>

        <div class="styTopSectionLine">
          <div class="styDepGenericDiv" style="clear:both;text-align:right;">
            <span class="styTopSectionLineLbl">Aggregate Nondeductible Amount:</span>
          </div>
          <div class="styDepGenericDiv" style="clear:right;text-align:right;">
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$DependencyData/AggregateNondeductibleAmount" />
              </xsl:call-template>
            </span>
          </div>
        </div>
        <div class="styTopSectionLine">
          <div class="styDepGenericDiv" style="clear:both;text-align:right;">
            <span class="styTopSectionLineLbl">Taxable Amount:</span>
          </div>
          <div class="styDepGenericDiv" style="clear:right;text-align:right;">
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$DependencyData/TaxableAmount" />
              </xsl:call-template>
            </span>
          </div>
        </div>        
        <div class="styTopSectionLine">
          <div class="styDepGenericDiv" style="clear:both;text-align:right;">
            <span class="styTopSectionLineLbl">Election 6033e:</span>
          </div>
          <div class="styDepGenericDiv" style="clear:right;">
            <!--xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/Election6033e" />
            </xsl:call-template-->
            <xsl:call-template name="PopulateYesBoxText">
              <xsl:with-param name="TargetNode" select="$DependencyData/Election6033e" />
            </xsl:call-template>
            <xsl:call-template name="PopulateNoBoxText">
              <xsl:with-param name="TargetNode" select="$DependencyData/Election6033e" />
            </xsl:call-template>
          </div>
        </div>
        <div class="styTopSectionLine">
          <div class="styDepGenericDiv" style="clear:both;text-align:right;">
            <span class="styTopSectionLineLbl">Dues Notice:</span>
          </div>
          <div class="styDepGenericDiv" style="clear:right;">
            <!--xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/DuesNotice" />
            </xsl:call-template-->
            <xsl:call-template name="PopulateYesBoxText">
              <xsl:with-param name="TargetNode" select="$DependencyData/DuesNotice" />
            </xsl:call-template>
            <xsl:call-template name="PopulateNoBoxText">
              <xsl:with-param name="TargetNode" select="$DependencyData/DuesNotice" />
            </xsl:call-template>

          </div>
        </div>
        
        
        
        <br/>
      </body>
    </html>
  </xsl:template>
  

</xsl:stylesheet>







