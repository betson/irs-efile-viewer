<?xml version="1.0" encoding="UTF-8"?>
  <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:include href="CommonPathRef.xsl"/>
    <xsl:include href="AddHeader.xsl"/>
    <xsl:include href="AddOnTable.xsl"/>
    <xsl:include href="PopulateTemplate.xsl"/>
    <xsl:output method="html" indent="yes" />
    <xsl:strip-space elements="*" />
    <xsl:param name="DependencyData" select="$RtnDoc/InterestExpenseReconSchedule" />
    <!-- IRS1120FScheduleP/InterestExpenseReconSchedule --> 
    <xsl:param name="depDocTitle">
      <xsl:call-template name="PopulateDisplayName">
        <xsl:with-param name="TargetNode" select="$DependencyData" />
      </xsl:call-template>  
    </xsl:param>  
    <xsl:template name="InterestExpenseReconScheduleTemp">
      <table id="InterestExpenseReconSchedule2Tbl" class="styDepTbl">
        <thead class="styTableThead">
          <tr class="styDepTblHdr">
            <th class="styDepTblCell"  scope="col" style="width: 51mm;vertical-align:middle;">Identify the original line of the Sch K-1 (Form 1065) that the interest is reported on</th>
            <th class="styDepTblCell"  scope="col" style="width: 51mm;vertical-align:middle;">Identify the line (13 or 18 of the K-1) that you are reclassifying the interest income to</th>
            <th class="styDepTblCell"  scope="col" style="width: 34mm;vertical-align:middle;">Amount of interest expense being reclassified</th>
            <th class="styDepTblCell"  scope="col" style="width: 51mm;vertical-align:middle;">Line of Form 1120-F that the reclassified amount would have otherwise been reported</th>
          </tr>
        </thead>
        <xsl:for-each select="$DependencyData/InterestExpenseReconInfo">
          <tr>
            <xsl:attribute name="class">
              <xsl:choose>
                <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
            <td class="styDepTblCell" style="width: 51mm;text-align:left;" >
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="OriginalLineReported" />
              </xsl:call-template>
            </td>          
            <td class="styDepTblCell" style="width: 51mm;text-align:left;" >
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ReclassifiedLineNumber" />
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" style="width: 34mm;text-align:right;" >
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="InterestAmount" />
              </xsl:call-template>
            </td>          
            <td class="styDepTblCell" style="width: 51mm;text-align:left;" >
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="LineNumber1120F" />
              </xsl:call-template>
            </td>          
          </tr>
        </xsl:for-each>
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
        <meta name="Author" content="Venkata Boggavarapu:: boggav@us.ibm.com" />
        <meta name="Description" content= "{$depDocTitle}" />
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
        <xsl:call-template name="InitJS"></xsl:call-template>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="AddOnStyle"></xsl:call-template>    
          </xsl:if>
        </style>        
      <xsl:call-template name="GlobalStylesDep"/>
    </head>
      <body class="styBodyClass">      
      <xsl:call-template name="DocumentHeaderDependency"></xsl:call-template>    
        <div class="styDepTitleLine">
          <span class="styDepTitle">
            <span style="width:111mm;">
              <xsl:value-of select="$depDocTitle" />
            </span>
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftover">
          <xsl:with-param name="TargetNode" select="$DependencyData" />
        </xsl:call-template>
        <xsl:call-template name="InterestExpenseReconScheduleTemp" />
    </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
