<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  
  <xsl:param name="DependencyData" select="$RtnDoc/ExpenditureResponsibilityStmt" />

  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName">
      <xsl:with-param name="TargetNode" select="$DependencyData" />
    </xsl:call-template>  
  </xsl:param>  

  <xsl:template name="ExpenditureResponsibilityStmtTemp">
    <table id="ExpenditureResponsibilityStmtTbl" class="styDepTblLandscape" style="font-size: 6pt">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
          <th class="styDepTblCell" scope="col">Grantee's Name</th>
          <th class="styDepTblCell" scope="col">Grantee's Address</th>
          <th class="styDepTblCell"  scope="col">Grant Date</th>
          <th class="styDepTblCell"  scope="col">Grant Amount</th>
          <th class="styDepTblCell"  scope="col">Grant Purpose</th>
          <th class="styDepTblCell"  scope="col">Amount Expended By Grantee</th>
          <th class="styDepTblCell"  scope="col">Any Diversion By Grantee?</th>
          <th class="styDepTblCell"  scope="col">Dates of Reports By Grantee</th>
          <th class="styDepTblCell"  scope="col">Date of Verification</th>
          <th class="styDepTblCell"  scope="col">Results of Verification</th>
        </tr>
      </thead>
      <xsl:for-each select="$DependencyData/ExpenditureResponsibility">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
            <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
            <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
          <td class="styDepTblCell" style="text-align:left;" >
            <xsl:choose> 
              <xsl:when test="BusinessName"> 
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1" />
                </xsl:call-template><br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2" />
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="PersonName" />
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </td>
          <td class="styDepTblCell" style="text-align:left;" >
            <xsl:choose> 
              <xsl:when test="USAddress"> 
                <xsl:call-template name="PopulateUSAddressTemplate">
                  <xsl:with-param name="TargetNode" select="USAddress" />
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="PopulateForeignAddressTemplate">
                  <xsl:with-param name="TargetNode" select="ForeignAddress" />
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </td>          
          <td class="styDepTblCell" style="text-align:center;width:15mm" >
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="GrantDate" />
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="text-align:right;" >
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="GrantAmount" />
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="text-align:left;" >
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="GrantPurpose" />
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="text-align:right;" >
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="AmountExpendedByGrantee" />
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="text-align:left;" >
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="AnyDiversionByGrantee" />
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="text-align:left;" >
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="DatesOfReportsByGrantee" />
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="text-align:center;width:15mm" >
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="DateOfVerification" />
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="text-align:left;" >
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="ResultsOfVerification" />
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
      <meta name="Author" content="Beju Ekperigin" />
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
      <xsl:call-template name="DocumentHeaderDependencyLandscape"></xsl:call-template> 
      <div class="styDepTitleLineLandscape">
        <span class="styDepTitle">
          <span style="width:103mm;"><xsl:value-of select="$depDocTitle" /></span>
        </span>
      </div>
      <xsl:call-template name="PopulateDepCommonLeftoverLandscape">
        <xsl:with-param name="TargetNode" select="$DependencyData" />
      </xsl:call-template>      
      <xsl:call-template name="ExpenditureResponsibilityStmtTemp" />
    </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
