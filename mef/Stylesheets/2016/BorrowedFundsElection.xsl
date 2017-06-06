<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  
  <xsl:param name="DependencyData" select="$RtnDoc/BorrowedFundsElection"/>

  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName">
      <xsl:with-param name="TargetNode" select="$DependencyData"/>
    </xsl:call-template>  
  </xsl:param>  

  <xsl:template name="BorrowedFundsElectionTemp">
    <table id="BorrowedFundsElectionTbl" class="styDepTblLandscape" style="font-size: 8pt">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
          <th class="styDepTblCell" scope="col">Lender's Name</th>
          <th class="styDepTblCell" scope="col">Lender's Address</th>
          <th class="styDepTblCell" scope="col">Amount Borrowed</th>
          <th class="styDepTblCell" scope="col">Use of Borrowed Funds</th>
          <th class="styDepTblCell" scope="col">Election Statement</th>
        </tr>
      </thead>
      <xsl:for-each select="$DependencyData/BorrowedFundsGrp">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
            <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
            <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
          <td class="styDepTblCell" style="text-align:left;width:45mm">
            <xsl:choose> 
              <xsl:when test="BusinessName"> 
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
                </xsl:call-template><br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="PersonNm"/>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </td>
          <td class="styDepTblCell" style="text-align:left">
            <xsl:choose> 
              <xsl:when test="USAddress"> 
                <xsl:call-template name="PopulateUSAddressTemplate">
                  <xsl:with-param name="TargetNode" select="USAddress"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="PopulateForeignAddressTemplate">
                  <xsl:with-param name="TargetNode" select="ForeignAddress"/>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </td>          
          <td class="styDepTblCell" style="text-align:right;width:28mm">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="BorrowedAmt"/>
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="text-align:left;width:85mm">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="UseOfBorrowedFundsTxt"/>
            </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="text-align:left;width:53mm">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="ElectionStatementTxt"/>
            </xsl:call-template>
          </td>                 
        </tr>
      </xsl:for-each>
    </table>
  </xsl:template>

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
      <meta name="Author" content="Beju Ekperigin"/>
      <meta name="Description" content="{$depDocTitle}"/>
      <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
      <xsl:call-template name="InitJS"/>
      <style type="text/css">
        <xsl:if test="not($Print) or $Print=''">
          <xsl:call-template name="AddOnStyle"/>    
        </xsl:if>
      </style>
      <xsl:call-template name="GlobalStylesDep"/>
    </head>    
    <!-- NameDisplay - IRS990PF - Borrowed Funds Election -->
    <body class="styBodyClass">  
      <xsl:call-template name="DocumentHeaderDependencyLandscape"/> 
      <div class="styDepTitleLineLandscape">
        <span class="styDepTitle">
          <span style="padding-right:5mm;"><xsl:value-of select="$depDocTitle"/></span>
        </span>
      </div>
      <xsl:call-template name="PopulateDepCommonLeftoverLandscape">
        <xsl:with-param name="TargetNode" select="$DependencyData"/>
      </xsl:call-template>      
      <xsl:call-template name="BorrowedFundsElectionTemp"/>
    </body>
    </html>
  </xsl:template>
</xsl:stylesheet>