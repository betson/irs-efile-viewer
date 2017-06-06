<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />

  <xsl:param name="DependencyData" select="$RtnDoc/SupplementalSupportSchedule" />
  
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>  
  </xsl:param>
  
  <!-- Template to display Itemized Other Income Schedule -->
  <xsl:template name="DependencyTemplate">
    <!-- Itemized Other Income Schedule Data -->
      <table id="SPSSTbl" class="styDepTblLandscape" style="font-size: 6pt">
        <thead class="styDepTableThead">
          <tr class="styDepTblHdr">
            <th class="styDepTblCell" scope="row">Year</th>  
            <th class="styDepTblCell" scope="row">Gifts, Grants and Contributions Received</th>
            <th class="styDepTblCell" scope="row">Membership Fees Received</th>
            <th class="styDepTblCell" scope="row">Gross Receipts From Admissions, Etc.</th>
            <th class="styDepTblCell" scope="row">Gross Investment Income And Post 1975UBI</th>
            <th class="styDepTblCell" scope="row">Net UBI Pre 1975</th>
            <th class="styDepTblCell" scope="row">Tax Revenues Levied For Organization's Benefit</th>
            <th class="styDepTblCell" scope="row">Value Of Services, Facilities Furnished By Government</th>
            <th class="styDepTblCell" scope="row">Other Income</th>
            <th class="styDepTblCell" scope="row">Total</th>
          </tr>
        </thead>
        <tfoot></tfoot>
        <tbody>
          <xsl:for-each select="$DependencyData/SupplementalSupport">
          <tr>
            <xsl:attribute name="class">
            <xsl:choose>
               <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
               <xsl:otherwise>styDepTblRow2</xsl:otherwise>
            </xsl:choose>
            </xsl:attribute>
            <td class="styDepTblCell" style="text-align:left">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="Year" />
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" style="text-align:left;">
              <span style="width: 23mm; text-align:right">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="GiftsGrantsContributionsRecd" />
                </xsl:call-template>
              </span>
            </td>
            <td class="styDepTblCell" style="text-align:left;">
              <span style="width: 23mm; text-align:right">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="MembershipFeesReceived" />
                </xsl:call-template>
              </span>
            </td>
            <td class="styDepTblCell" style="text-align:left;">
              <span style="width: 23mm; text-align:right">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="GrossReceiptsFromAdmissionsEtc" />
                </xsl:call-template>
              </span>
            </td>
            <td class="styDepTblCell" style="text-align:left;">
              <span style="width: 23mm; text-align:right">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="GrossInvstIncomeAndPost1975UBI" />
                </xsl:call-template>
              </span>
            </td>
            <td class="styDepTblCell" style="text-align:left;">
              <span style="width: 23mm; text-align:right">
                  <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="NetUBIPre1975" />
                </xsl:call-template>
              </span>
            </td>
            <td class="styDepTblCell" style="text-align:left;">
              <span style="width: 23mm; text-align:right">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="TaxRevenuesLeviedForOrgBenefit" />
                </xsl:call-template>
              </span>
            </td>
            <td class="styDepTblCell" style="text-align:left;">
              <span style="width: 23mm; text-align:right">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="ValueOfServicesEtcFurnByGovt" />
                </xsl:call-template>
              </span>
            </td>
            <td class="styDepTblCell" style="text-align:left;">
              <span style="width: 23mm; text-align:right">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="OtherIncome" />
                </xsl:call-template>
              </span>
            </td>
            <td class="styDepTblCell" style="text-align:left;">
              <span style="width: 23mm; text-align:right">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="Total" />
                </xsl:call-template>
              </span>
            </td>
          </tr>
          </xsl:for-each>
        </tbody>         
      </table>
  </xsl:template>
  
  
  <!-- Main template -->
  <xsl:template match="/">
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
         
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
        <xsl:call-template name="InitJS"></xsl:call-template>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <!--Generic CSS Styles are located in the template called below -->
            <xsl:call-template name="AddOnStyle"></xsl:call-template>
          </xsl:if>
        </style>
      <xsl:call-template name="GlobalStylesDep"/>
</head>
    
      <body class="styBodyClass">        
        <xsl:call-template name="DocumentHeaderDependencyLandscape"></xsl:call-template>
        <div class="styDepTitleLineLandscape">
          <span class="styDepTitle" style="width: 95mm">
            <xsl:value-of select="$depDocTitle" />
          </span>
        </div>
        
        <!--Adding template for common left over data-->
        <xsl:call-template name="PopulateDepCommonLeftoverLandscape"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>

        
        <!--Displaying Dependencies-->
        <xsl:call-template name="DependencyTemplate" />      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>