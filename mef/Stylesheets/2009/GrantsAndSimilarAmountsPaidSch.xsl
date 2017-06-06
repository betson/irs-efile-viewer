<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:param name="DependencyData" select="$RtnDoc/GrantsAndSimilarAmountsPaidSch"/>
  <xsl:template name="DependencyTemplate">
    <xsl:for-each select="$DependencyData/GrantsAndSimilarAmountsPaid">
      <table id="GSAPTbl" class="styDepTbl" style="font-size:8pt;">
        <tr class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="width:40%;text-align:right;">Item No.                
        </th>
          <td class="styDepTblCell" style="text-align:center;">
            <xsl:value-of select="position()"/>
          </td>
        </tr>
        <tr class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
          Class of Activity    
        </th>
          <td class="styDepTblCell" style="text-align:left;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="ClassOfActivity"/>
            </xsl:call-template>
          </td>
        </tr>
        <tr class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
          Donee's Name
        </th>
          <td class="styDepTblCell" style="text-align:left;font-size:6pt;font-family:verdana;">
            <xsl:choose>
              <xsl:when test="DoneesNameBusiness">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="DoneesNameBusiness/BusinessNameLine1"/>
                </xsl:call-template>
                <xsl:if test="DoneesNameBusiness/BusinessNameLine2">
                  <br/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="DoneesNameBusiness/BusinessNameLine2"/>
                  </xsl:call-template>
                </xsl:if>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="DoneesNamePerson"/>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </td>
        </tr>
        <tr class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">        
          Donee's Address
        </th>
          <td class="styDepTblCell" style="text-align:left;">
            <xsl:choose>
              <xsl:when test="DoneesAddressUS">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="DoneesAddressUS/AddressLine1"/>
                </xsl:call-template>
                <xsl:if test="DoneesAddressUS/AddressLine2">
                  <br/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="DoneesAddressUS/AddressLine2"/>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="DoneesAddressUS/City">
                  <br/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="DoneesAddressUS/City"/>
                  </xsl:call-template>,
              </xsl:if>
                <xsl:if test="DoneesAddressUS/State">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="DoneesAddressUS/State"/>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="DoneesAddressUS/ZIPCode">
                  <span style="width:6px;"/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="DoneesAddressUS/ZIPCode"/>
                  </xsl:call-template>
                </xsl:if>
              </xsl:when>
              <xsl:otherwise>
                
                              <xsl:call-template name="PopulateForeignAddressTemplate">
                                <xsl:with-param name="TargetNode" select="DoneesAddressForeign" />
                              </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </td>
        </tr>
        <tr class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
          Amount (FMV)      
        </th>
          <td class="styDepTblCell" style="text-align:left;">
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="AmountFmv"/>
              </xsl:call-template>
            </span>
          </td>
        </tr>
        <tr class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
          Purpose of Payment to Affiliate  
        </th>
          <td class="styDepTblCell" style="text-align:left;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="PurposeOfPaymentToAffiliate"/>
            </xsl:call-template>
          </td>
        </tr>
        <tr class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
          Relationship        
        </th>
          <td class="styDepTblCell" style="text-align:left;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="Relationship"/>
            </xsl:call-template>
          </td>
        </tr>
        <tr class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
          Description        
        </th>
          <td class="styDepTblCell" style="text-align:left;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="Description"/>
            </xsl:call-template>
          </td>
        </tr>
        <tr class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
          Book Value  
        </th>
          <td class="styDepTblCell" style="text-align:left;">
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="BookValue"/>
              </xsl:call-template>
            </span>
          </td>
        </tr>
        <tr class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
          How BV Determined        
        </th>
          <td class="styDepTblCell" style="text-align:left;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="HowBvDetermined"/>
            </xsl:call-template>
          </td>
        </tr>
        <tr class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
          How FMV Determined        
        </th>
          <td class="styDepTblCell" style="text-align:left;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="HowFmvDetermined"/>
            </xsl:call-template>
          </td>
        </tr>
        <tr class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
          Date of Gift        
        </th>
          <td class="styDepTblCell" style="text-align:left;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="DateOfGift"/>
            </xsl:call-template>
          </td>
        </tr>
      </table>
      <br/>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="GetClass">
    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
  </xsl:template>
  <!-- Main template -->
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName">
      <xsl:with-param name="TargetNode" select="$DependencyData"/>
    </xsl:call-template>
  </xsl:param>
  <!-- Main template -->
  <xsl:template match="/">
    <html>
      <head>
        <title>
          <xsl:value-of select="$depDocTitle"/>
        </title>
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
          <span class="styDepTitle">
            <span style="width:115mm;">
              <xsl:value-of select="$depDocTitle"/>
            </span>
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftover">
          <xsl:with-param name="TargetNode" select="$DependencyData"/>
        </xsl:call-template>
        <span style="height:5px;"/>
        <xsl:call-template name="DependencyTemplate">
        </xsl:call-template>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
