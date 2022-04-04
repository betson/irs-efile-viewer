<?xml version="1.0" encoding="UTF-8"?>
  <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:include href="CommonPathRef.xsl"/>
    <xsl:include href="AddHeader.xsl"/>
    <xsl:include href="AddOnTable.xsl"/>
    <xsl:include href="PopulateTemplate.xsl"/>
    <xsl:output method="html" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:param name="DependencyData" select="$RtnDoc/QlfyCoreSecOrIncidlActySch"/>
    <!--  - Form 8902 displays as - Qualifying Core, Secondary or Incidental Activities Schedule - -->
    <xsl:param name="depDocTitle">
      <xsl:call-template name="PopulateDisplayName">
        <xsl:with-param name="TargetNode" select="$DependencyData"/>
      </xsl:call-template>  
    </xsl:param> 
    <xsl:template name="QlfyCoreSecOrIncidlActyTemp">
      <table id="QlfyCoreSecOrIncidlActyTbl" class="styDepTblLandscape">
        <thead class="styTableThead">
          <tr class="styDepTblHdr">
		    <th class="styDepTblCell" style="width: 42mm;" scope="col">CorporationName </th>
		    <th class="styDepTblCell" style="width: 38mm;" scope="col">Corporation EIN </th>
            <th class="styDepTblCell" style="width: 38mm;" scope="col">Corporate Gross Income </th>
            <th class="styDepTblCell" style="width: 38mm;" scope="col">Qualifying Secondary Activites Included in the 20% Limit</th>
            <th class="styDepTblCell" style="width: 38mm;" scope=" col">Qualifying Secondary ActivitiesExceeding the 20% Limit</th>                  
            <th class="styDepTblCell" style="width: 38mm;" scope="col">Qualifying Incidental Activities Included in the 0.1% Limit</th>
            <th class="styDepTblCell" style="width: 38mm;" scope="col">Qualifying Incidental Activities Exceeding the 0.1% Limit</th>
          </tr>
        </thead>
        <xsl:for-each select="$DependencyData/QlfyCoreSecOrIncidlActivity">
          <tr>
            <xsl:attribute name="class">
              <xsl:choose>
                <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
		    <!--<td class="styDepTblCell" style="text-align:center;" >
              <xsl:value-of select="position()" />
            </td> -->
            <td class="styDepTblCell" style="width: 42mm;text-align:left;">
              <xsl:call-template name="PopulateText">
			    <xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine1Txt"/>
		      </xsl:call-template>
              <br/>
		      <xsl:call-template name="PopulateText">
			    <xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine2Txt"/>
		      </xsl:call-template>		  
            </td>
            <td class="styDepTblCell" style="width: 38mm;text-align:center;">
              <xsl:choose>
                <xsl:when test="CorporationEIN">
                  <xsl:call-template name="PopulateEIN">
                    <xsl:with-param name="TargetNode" select="CorporationEIN"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </td>
            <td class="styDepTblCell" style="width: 38mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="CorporateGrossIncomeAmt"/>
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" style="width: 38mm; text-align:right">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="QlfySecActyIncld20PctLmtAmt"/>
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" style="width: 38mm; text-align:right">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="QualifyingSecActyEx20PctLmtAmt"/>
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" style="text-align:right; width: 38mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="QfyIncdtlActyIncldOnePctLmtAmt"/>
              </xsl:call-template>      
            </td>
            <td class="styDepTblCell" style="width: 38mm;text-align:right">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="QlfyIncdtlActyExOnePctLmtAmt"/>
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
          <meta name="Author" content="Ku Lee :: kutlee@us.ibm.com"/>
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
        <body class="styBodyClass" style="width:256mm;">
          <xsl:call-template name="DocumentHeaderDependencyLandscape"/>    
          <div class="styDepTitleLineLandscape">
            <span class="styDepTitle"  style="padding-right:2mm;">
              <xsl:value-of select="$depDocTitle"/>
            </span>        
          </div>       
          <xsl:call-template name="PopulateDepCommonLeftoverLandscape">
            <xsl:with-param name="TargetNode" select="$DependencyData"/>
          </xsl:call-template>
          <xsl:call-template name="QlfyCoreSecOrIncidlActyTemp"/>
        </body>
      </html>
    </xsl:template>
  </xsl:stylesheet>