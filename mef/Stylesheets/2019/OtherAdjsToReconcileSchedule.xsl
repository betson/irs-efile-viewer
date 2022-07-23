<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:include href="CommonPathRef.xsl"/>
    <xsl:include href="AddHeader.xsl"/>
    <xsl:include href="AddOnTable.xsl"/>
    <xsl:include href="PopulateTemplate.xsl"/>
    <xsl:output method="html" indent="yes"/>
    <xsl:strip-space elements="*"/> 
    <xsl:param name="DependencyData" select="$RtnDoc/OtherAdjsToReconcileSchedule"/>
    <xsl:param name="depDocTitle">
      <xsl:call-template name="PopulateDisplayName">
        <xsl:with-param name="TargetNode" select="$DependencyData"/>
      </xsl:call-template>  
    </xsl:param>
    <xsl:template name="OtherAdjustmentsToReconcileSchTable2">
      <!-- Updated 5/30/2012 LL-->
      <table class="styDepTbl" style="font-size: 7pt">
        <thead class="styTableThead">
          <tr class="styDepTblHdr">
            <th class="styDepTblCell" scope="col" style="text-align:center;width:57mm;">Name </th>
            <th class="styDepTblCell" scope="col" style="text-align:center;width:25mm;">EIN </th>
            <th class="styDepTblCell" scope="col" style="text-align:center;width:41mm;">Nature of Adjustment </th>
            <th class="styDepTblCell" scope="col" style="text-align:center;width:32mm;">Net income (loss) included in Part I before any adjustments on line 10 </th>
            <th class="styDepTblCell" scope="col" style="text-align:center;width:32mm;">Net income (loss) included on Part I, line 11</th>
          </tr>
          </thead>      
          <tbody>                   
            <xsl:for-each select="$DependencyData/OtherAdjsToReconcileInfo">     
			  <!-- set row background -->
              <tr>
                <xsl:attribute name="class">
                  <xsl:choose>
                    <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                    <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                  </xsl:choose>
                </xsl:attribute>
                <!-- Name -->
                <td class="styDepTblCell" style="width:57mm;text-align:left;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
                  </xsl:call-template>            
                  <xsl:if test="BusinessName/BusinessNameLine2Txt != ''">
                    <br/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
                    </xsl:call-template>
                  </xsl:if>
                </td>
                <!-- EIN -->
                <td class="styDepTblCell" style="width:25mm;text-align:center;">
                  <span style="width:21mm;text-align: top;text-align:center;">
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
                <!--NatureOfAdjustment -->         
                <td class="styDepTblCell" style="width:41mm;text-align:left;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="NatureOfAdjustmentDesc"/>
                  </xsl:call-template>
                </td> 
                <!-- NetIncomePart1BeforeAdj  -->         
                <td class="styDepTblCell" style="width:32mm;text-align:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="NetIncomeBeforeAdjustmentsAmt"/>
                  </xsl:call-template>
                </td> 
                <!-- NetIncomeIncludedPartIAmt  -->         
                <td class="styDepTblCell" style="width:32mm;text-align:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="NetIncomeIncludedAmt"/>
                  </xsl:call-template>
                </td> 
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
      </xsl:template>
      <!-- Main template -->
      <xsl:template match="/">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
          <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
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
            <xsl:call-template name="DocumentHeaderDependency"/>
              <div class="styDepTitleLine">
                <span class="styDepTitle">
                  <span style="width:98mm;">
                    <xsl:value-of select="$depDocTitle"/>
                  </span>
                </span>
              </div>
              <xsl:call-template name="PopulateDepCommonLeftover">
                <xsl:with-param name="TargetNode" select="$DependencyData"/>
              </xsl:call-template>               
              <xsl:call-template name="OtherAdjustmentsToReconcileSchTable2"/>  
          </body>
        </html>
      </xsl:template>
    </xsl:stylesheet>