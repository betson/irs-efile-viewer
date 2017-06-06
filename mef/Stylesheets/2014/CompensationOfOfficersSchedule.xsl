<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="PopulateTemplate.xsl"/>
   <xsl:include href="AddHeader.xsl"/>
   <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>  
  <xsl:param name="DepData" select="$RtnDoc/CompensationOfOfficersSchedule"/>  
  <!-- 1120 Common - Compensation of Officers Schedule -->
  <xsl:template name="ShowData">  
    <table id="COOSTbl" class="styDepTbl">    
      <thead class="styTableThead">
        <tr class="styDepTblHdr">           
          <th class="styDepTblCell" scope="col" style="width:90mm;">Name of Officer </th>        
          <th class="styDepTblCell" scope="col" style="width:30mm;">Social Security Number </th>  
          <th class="styDepTblCell" scope="col" style="width:30mm;">Percentage of Time Devoted to Business </th>
          <th class="styDepTblCell" scope="col" style="width:37mm;">Amount of Compensation </th>
        </tr>
      </thead>
      <tfoot/>        
       <tbody>    
        <xsl:for-each select="$DepData/CompensationOfOfficers">  
          <tr>
            <xsl:attribute name="class">
              <xsl:choose>
                 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>       
            <td class="styDepTblCell" style="text-align:left;"> 
              <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="OfficerNm"/>
              </xsl:call-template> 
            </td> 
            <td class="styDepTblCell" style="text-align:center;">
              <xsl:call-template name="PopulateSSN">
                <xsl:with-param name="TargetNode" select="SSN"/>
              </xsl:call-template>
            </td>
            <td class="styDepTblCell" style="text-align:right;">
              <xsl:call-template name="PopulatePercent">
                <xsl:with-param name="TargetNode" select="TimeDevotedToBusinessPct"/>
              </xsl:call-template>
            <td class="styDepTblCell" style="text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="CompensationAmt"/>
              </xsl:call-template>
            </td>
            </td>  
          </tr>      
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>    
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DepData"/></xsl:call-template>  
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
         <meta name="Author" content="Lisa Lane"/>
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
          <span class="styDepTitle" style="width:100mm">
            <xsl:value-of select="$depDocTitle"/>        
          </span>
        </div>
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftover">
					<xsl:with-param name="TargetNode" select="$DepData"/>
				</xsl:call-template>
        <xsl:call-template name="ShowData"/>          
        <br/>                      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>