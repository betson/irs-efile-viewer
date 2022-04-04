<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <!--Display Dependency Root Name from Schema -->
  <xsl:param name="CCSData" select="$RtnDoc/Sect199ClosingBooksElectStmt"/>
  <!-- HINTS Dependency Title - Section 199 Closing of Books Election Statement - 1120 Common-->  
  <xsl:template name="ShowPIS">
    <table id="PISTbl" class="styDepTblLandscape" style="text-align:center;">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">          
           <th class="styDepTblCell" scope="col" style="width:61mm;">Section 199 Begining Text </th>        
           <th class="styDepTblCell" scope="col" style="width:60mm;">Name of Corporation</th>  
           <th class="styDepTblCell" scope="col" style="width:25mm;">EIN </th>        
           <th class="styDepTblCell" scope="col" style="width:60mm;">Response Period Text </th>        
           <th class="styDepTblCell" scope="col" style="width:25mm;">Date From</th>
           <th class="styDepTblCell" scope="col" style="width:25mm;">Date To</th>  
        </tr>
      </thead>
        <tfoot/>
       <tbody>    
        <xsl:for-each select="$CCSData/Sect199ClosingBooksElectGrp">  
          <tr>
            <xsl:attribute name="class">
              <xsl:choose>
                 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>            
            <!--Column 1-->
            <td class="styDepTblCell" style="width:61mm;text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="Section199BeginingTxt"/>
              </xsl:call-template>
            </td>
            <!-- Column 2 -->
            <td class="styDepTblCell" style="width:60mm;text-align:left;">
              <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="CorporationNm"/>
            </xsl:call-template>
            <!--<br/>
            <xsl:call-template name="PopulateText">          
              <xsl:with-param name="TargetNode" select="$CCSData/Sect199ClosingBooksElect/CorporationName/BusinessNameLine2Txt" />
            </xsl:call-template>-->
            </td>
            <!--Column 3 -->
            <td class="styDepTblCell" style="width:25mm;text-align:center;">
              <!--<xsl:if test="EIN"> -->
                <xsl:call-template name="PopulateEIN">
                  <xsl:with-param name="TargetNode" select="EIN"/>
                </xsl:call-template>
           <!-- </xsl:if>
            <xsl:if test="MissingEINReason">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="MissingEINReason" />
                </xsl:call-template>
           </xsl:if>-->
            </td>
           <!--Column 4 --> 
            <td class="styDepTblCell" style="width:60mm;text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ResponsePeriodTxt"/>
              </xsl:call-template>
            </td>
           <!-- Column 5 -->
            <td class="styDepTblCell" style="width:25mm;text-align:center;">
                <xsl:call-template name="PopulateMonthDayYear">
                  <xsl:with-param name="TargetNode" select="EffectiveBeginDt"/>
                </xsl:call-template>
            </td>
            <!-- Column 6 -->
            <td class="styDepTblCell" style="width:25mm;text-align:center;">
                <xsl:call-template name="PopulateMonthDayYear">
                  <xsl:with-param name="TargetNode" select="EffectiveEndDt"/>
                </xsl:call-template>
            </td>
          </tr>      
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$CCSData"/></xsl:call-template>  
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
         <meta name="Author" content="Ravi Venigalla"/>
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
        <div class="styDepTitleLineLandscape ">
          <span class="styDepTitle" style="width:132mm">
            <xsl:value-of select="$depDocTitle"/>        
          </span>
        </div>
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftoverLandscape"><xsl:with-param name="TargetNode" select="$CCSData"/></xsl:call-template>        
        <xsl:call-template name="ShowPIS"/>          
        <br/>                      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>