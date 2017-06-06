<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>      
  <xsl:include href="AddOnTable.xsl"/>
  
  <xsl:param name="DependencyData" select="$RtnDoc/RelationshipSchedule" />
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>  
  </xsl:param>
    
  <xsl:template name="DependencyTemplate">
    <table id="RelationshipScheduleTbl" class="styDepTbl" style="margin-top:4mm; font-size:8pt; font-family:Arial">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
           <th class="styDepTblCell" scope="col">Person Name / Business Name</th>
           <th class="styDepTblCell" scope="col">Title or Role</th>         
           <th class="styDepTblCell" scope="col">Person Name 2 / Business Name 2</th>
           <th class="styDepTblCell" scope="col">Title or Role 2</th>         
           <th class="styDepTblCell" scope="col">Relationship</th>         
        </tr>
      </thead>  
      <tfoot></tfoot>
      <tbody>  
      <xsl:for-each select="$DependencyData/RelationshipInformation">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
          <td class="styDepTblCell" valign="top" align="left">
            <xsl:choose>
              <xsl:when test="PersonName and PersonName != '' ">
                <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="PersonName" /></xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1" /></xsl:call-template>
                <xsl:if test="BusinessName/BusinessNameLine1 and BusinessName/BusinessNameLine2 != '' ">
                  <br />
                  <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2" /></xsl:call-template>
                </xsl:if>
              </xsl:otherwise>
            </xsl:choose>
          </td>
          <td class="styDepTblCell" valign="top" align="left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="TitleOrRole" /></xsl:call-template>   
          </td>
          <td class="styDepTblCell" valign="top" align="left">
            <xsl:choose>
              <xsl:when test="PersonName2 and PersonName2 != '' ">
                <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="PersonName2" /></xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="BusinessName2/BusinessNameLine1" /></xsl:call-template>
                <xsl:if test="BusinessName/BusinessNameLine1 and BusinessName2/BusinessNameLine2 != '' ">
                  <br />
                  <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="BusinessName2/BusinessNameLine2" /></xsl:call-template>
                </xsl:if>
              </xsl:otherwise>
            </xsl:choose>          
          </td>          
          <td class="styDepTblCell" valign="top" align="left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="TitleOrRole2" /></xsl:call-template>   
          </td>
          <td class="styDepTblCell" valign="top" align="left">
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="Relationship" /></xsl:call-template>   
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
           <!--Other Income Statement-->
          <xsl:value-of select="$depDocTitle" />
        </title>
         <!-- No Browser Caching -->
         <meta http-equiv="Pragma" content="no-cache" />
         <meta http-equiv="Cache-Control" content="no-cache" />
         <meta http-equiv="Expires" content="0" />
         <!-- No Proxy Caching -->
         <meta http-equiv="Cache-Control" content="private" />
         <!-- Define Character Set -->
         <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />        
         <meta name="Description" content="{$depDocTitle}" />
        
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
          <div class="styDepTitle" style="width:72mm">
            <xsl:value-of select="$depDocTitle" />
          </div>
        </div>        
        
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>            
                        
        <xsl:call-template name="DependencyTemplate" />          
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







