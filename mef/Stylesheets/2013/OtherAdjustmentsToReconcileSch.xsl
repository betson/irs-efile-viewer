<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">  
    <xsl:include href="CommonPathRef.xsl"/>
    <xsl:include href="AddHeader.xsl"/>
    <xsl:include href="AddOnTable.xsl"/>
    <xsl:include href="PopulateTemplate.xsl"/>
    <xsl:output method="html" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:param name="DependencyData" select="$RtnDoc/OtherAdjustmentsToReconcileSch"/>
    <xsl:param name="depDocTitle">
      <xsl:call-template name="PopulateDisplayName">
        <xsl:with-param name="TargetNode" select="$DependencyData"/>
      </xsl:call-template>  
    </xsl:param> 
    <xsl:template name="OtherAdjustmentsToReconcileSchTable2">
      <table id="OtherAdjustmentsToReconcileSchTable2" class="styDepTblLandscape" style="font-size: 7pt">
        <thead class="styTableThead">
          <tr class="styDepTblHdr">
            <th class="styDepTblCell" scope="col" style="width:74mm;text-align:center">Name </th>
            <th class="styDepTblCell" scope="col" style="width:17mm;ttext-align:center">EIN </th>
            <th class="styDepTblCell" scope="col" style="width:33mm;ttext-align:center">Net Income Part 1, Line 10 Amount </th>
            <th class="styDepTblCell" scope="col" style="width:33mm;text-align:center">Net Income Included on Part I, Line 11 Amount </th>
            <th class="styDepTblCell" scope="col" style="width:33mm;text-align:center">Adjustment Included on Line 10a </th>
            <th class="styDepTblCell" scope="col" style="width:33mm;text-align:center;">Adjustment Included on Line 10b </th>
           <th class="styDepTblCell" scope="col" style="width:33mm;text-align:center;">Adjustment Included on Line 10c </th>          
          </tr>
        </thead>
        <tfoot/>
        <tbody>
          <xsl:for-each select="$DependencyData/OtherAdjToReconcileInfo">
          <!-- set row background -->
            <tr>
              <xsl:attribute name="class">
                <xsl:choose>
                  <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                  <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                </xsl:choose>
              </xsl:attribute>
              <!-- Name -->
              <td class="styDepTblCell" style="width:74mm; text-align:left;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1"/>
                </xsl:call-template>            
                <xsl:if test="BusinessName/BusinessNameLine2 != ''">
                  <br/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2"/>
                  </xsl:call-template>
                </xsl:if>
              </td>
              <!-- EIN -->
              <td class="stydepTblCell" style="width: 17mm; text-align:center;">
                <span style="width:21mm;text-align:center;">            
                  <xsl:choose>
            		    <xsl:when test="normalize-space(EIN)">                    
                      <xsl:call-template name="PopulateEIN">
                        <xsl:with-param name="TargetNode" select="EIN"/>
                      </xsl:call-template>  
                      <span style="width: 2px"/>
                    </xsl:when>  
                    <xsl:otherwise> 
	            	      <xsl:call-template name="PopulateText">
		            	      <xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
		                  </xsl:call-template>    
		                  <span style="width: 2px"/>
	                  </xsl:otherwise>   
                  </xsl:choose>
                </span>
              </td>          
              <!-- Net Income Before Part 1, Line 10 Amount  -->         
              <td class="stydepTblCell" style="width:33mm; text-align:right;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="NetIncomeBeforeAdjustmentsAmt"/>
                </xsl:call-template>
              </td> 
              <!-- Net Income Included on Part I, Line 11 Amount  -->      
              <td class="stydepTblCell" style="width:33mm; text-align:right;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="IncomeLossPerIncomeStmtAmt"/>
                </xsl:call-template>
              </td>
              <!-- Adjustment Included Line10a  -->         
              <td class="stydepTblCell" style="width:33mm; text-align:right;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="NetAdjIntercompanyDivAmt"/>
                </xsl:call-template>
              </td> 
              <!-- Adjustment Included Line10a -->         
              <td class="stydepTblCell" style="width:33mm; text-align:right;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="NetAdjOthStryAcctReconcileAmt"/>
                </xsl:call-template>
              </td>         
              <!-- Adjustment Included Line10c -->         
              <td class="stydepTblCell" style="width:33mm; text-align:right;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="NetAdjOtherAdjToReconcileAmt"/>
                </xsl:call-template>
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
        <meta name="Author" content="Trin Xue"/>
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
      <body class="styBodyClass">
        <xsl:call-template name="DocumentHeaderDependencyLandscape"/>
        <div class="styDepTitleLineLandscape">
          <span class="styDepTitle">
            <span style="width:114mm;">
              <xsl:value-of select="$depDocTitle"/>
            </span>
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftoverLandscape">
          <xsl:with-param name="TargetNode" select="$DependencyData"/>
        </xsl:call-template>               
        <xsl:call-template name="OtherAdjustmentsToReconcileSchTable2"/>  
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>