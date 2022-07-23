<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>

  <xsl:param name="DependencyData" select="$RtnDoc/PassThroughEntitySchedule"/>
  
      <xsl:template name="DependencyTemplate">
    <table id="PTESTbl" class="styDepTblLandscape" style="font-size:7pt;">
      <thead class="styDepTableThead">
        <tr class="styDepTblHdr">
           <!--th class="styDepTblCell" scope="col">Item No.</th-->
           <th class="styDepTblCell" scope="col">
                Shareholder Name
           </th>
           <th class="styDepTblCell" scope="col">
                Shareholder TIN
           </th>
           <th class="styDepTblCell" scope="col">Share of Credit</th>
           <th class="styDepTblCell" scope="col">Building Identification Number for Each Building</th>
        </tr>
      </thead>
      <tfoot/>
      <tbody>
        <xsl:for-each select="$DependencyData/PassThroughEntityGrp">
          <tr>
            <xsl:attribute name="class">
              <xsl:choose>
                 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
            <!--xsl:attribute name="rowspan">
              <xsl:value-of select="count(BuildingIdNumForEachBuilding)" />
            </xsl:attribute-->            
            <!--td class="styDepTblCell" style="text-align:center;">
              <xsl:attribute name="rowspan">
                <xsl:value-of select="count(BuildingIdNumForEachBuilding)" />
              </xsl:attribute>            
              <xsl:value-of select="position()" />
            </td-->        
            <td class="styDepTblCell" style="text-align:left;">
              <xsl:attribute name="rowspan">
                <xsl:value-of select="count(BIN)"/>
              </xsl:attribute>            
            <xsl:choose>
                <xsl:when test="ShareholderBusinessName">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="ShareholderBusinessName/BusinessNameLine1Txt"/>
                  </xsl:call-template>
                  <xsl:if test="ShareholderBusinessName/BusinessNameLine2Txt != ''">
                    <br/><xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="ShareholderBusinessName/BusinessNameLine2Txt"/>
                      </xsl:call-template>
                  </xsl:if>                  
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="ShareholderPersonNm"/>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </td>
            <td class="styDepTblCell" style="text-align:center;">
              <xsl:attribute name="rowspan">
                <xsl:value-of select="count(BIN)"/>
              </xsl:attribute>            
              <xsl:choose>
                <xsl:when test="ShareholderIdentificationNum/ShareholderSSN">
                  <xsl:call-template name="PopulateSSN">
                    <xsl:with-param name="TargetNode" select="ShareholderIdentificationNum/ShareholderSSN"/>
                  </xsl:call-template>  
                </xsl:when>
                
                <xsl:when test="ShareholderIdentificationNum/ShareholderEIN">
                  <xsl:call-template name="PopulateEIN">
                    <xsl:with-param name="TargetNode" select="ShareholderIdentificationNum/ShareholderEIN"/>
                  </xsl:call-template>  
                  </xsl:when>
                  
                <xsl:otherwise>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="ShareholderIdentificationNum/MissingEINReasonCd"/>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </td>
            <td class="styDepTblCell" style="text-align:right;" nowrap="nowrap">
              <xsl:attribute name="rowspan">
                <xsl:value-of select="count(BIN)"/>
              </xsl:attribute>            
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="ShareOfCreditAmt"/>
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" style="text-align:left;">
              <xsl:if test="count(BIN) &gt; 1">
                <xsl:attribute name="class">
                  styDepTblRow1
                </xsl:attribute>
              </xsl:if>
              <span style="width:3px;"/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="BIN[1]"/>
              </xsl:call-template>
            </td>
          </tr>
          <xsl:for-each select="BIN">
            <xsl:if test="position() &gt; 1">
              <tr>
            <xsl:attribute name="class">
              <xsl:choose>
                 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
              <!--xsl:attribute name="rowspan">
                <xsl:value-of select="count(BuildingIdNumForEachBuilding)" />
              </xsl:attribute-->
                <!--td class="styDepTblCell" style="text-align:left;">
                  <span class="styTableCellPad"></span>
                </td>
                <td class="styDepTblCell" style="text-align:left;">
                  <span class="styTableCellPad"></span>
                </td>
                <td class="styDepTblCell" style="text-align:left;">
                  <span class="styTableCellPad"></span>
                </td>
                <td class="styDepTblCell" style="text-align:left;">
                  <span class="styTableCellPad"></span>
                </td-->
                <td class="styDepTblCell" style="text-align:left;">
                  <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="current()"/></xsl:call-template>
                </td>
              </tr>
            </xsl:if>
          </xsl:for-each>
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>
  
  <xsl:template name="GetClass">
    <xsl:attribute name="class">
      <xsl:choose>
         <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
         <xsl:otherwise>styDepTblRow2</xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
  </xsl:template>
  
   
  
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
      <!-- NameDisplay - IRS8586 - Pass-through Entity Schedule -->
      <body class="styBodyClass">
        <xsl:call-template name="DocumentHeaderDependencyLandscape"/>
        <div class="styDepTitleLineLandscape">
          <span class="styDepTitle">
            <span style="padding-right:5mm;"><xsl:value-of select="$depDocTitle"/></span>    
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftoverLandscape"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>
        <span style="height:5px;"/>
        <!-- Transform Itemized Other Income Schedule -->
        <xsl:call-template name="DependencyTemplate"/>
        
        <br/>
      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>