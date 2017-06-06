<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>

  <xsl:param name="DependencyData" select="$RtnDoc/ToWhomGasolineSoldStatement" />
  
  <xsl:param name="depDocTitle" >
  <xsl:call-template name="PopulateDisplayName">
  <xsl:with-param name="TargetNode" select="$DependencyData" />
  </xsl:call-template>
  </xsl:param>
  
  <!-- Template to display Gasoline Sold -->
  <xsl:template name="ShowData">
    <!-- AviationKeroseneFuelSold -->
    <table id="TWGSbl" class="styDepTbl" >
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
           <th class="styDepTblCell" style="width:50mm;text-align:left;" scope="col">Name</th>
           <th class="styDepTblCell" style="width:35mm;text-align:right;padding-left:0mm;" scope="col">SSN/EIN</th>
           <th class="styDepTblCell" style="width:32mm;text-align:right;padding-left:7mm;" scope="col">Gallons Sold</th>
        </tr>
      </thead>
      <tfoot></tfoot>
      <tbody>
        <xsl:for-each select="$DependencyData/GasolineSoldStatement/GasolineSeller">
          <tr>
            <xsl:attribute name="class">
            <xsl:choose>
               <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
               <xsl:otherwise>styDepTblRow2</xsl:otherwise>
            </xsl:choose>
            </xsl:attribute>
            <!--td class="styDepTblCell" style="text-align:center;"><xsl:value-of select="position()" /></td-->        
            <td class="styDepTblCell" scope="col" style="text-align:left;padding-top:1mm;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="Name/BusinessNameLine1" />
              </xsl:call-template>
              <xsl:if test="Name/BusinessNameLine2">
                <br/>
                <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="Name/BusinessNameLine2" />
                </xsl:call-template>
              </xsl:if>
            </td>
            <td class="styDepTblCell" scope="col" style="text-align:center;padding-top:3mm;">
              <xsl:choose >
                <xsl:when test="SSN">
                  <xsl:call-template name="PopulateSSN">
                  <xsl:with-param name="TargetNode" select="SSN"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:when test="EIN">
                  <xsl:call-template name="PopulateEIN">
                  <xsl:with-param name="TargetNode" select="EIN"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="MissingEINReason"/>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </td>
            <td class="styDepTblCell" scope="col" style="text-align:right;padding-top:3mm;">
            <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode"   select="GallonsSold" />
            </xsl:call-template></td>
          </tr>
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>
  
  
  
  <!-- Main template -->
   
  <!-- Main template -->
  <xsl:template match="/" >
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
         <meta name="Description" content="{$depDocTitle}" />
         <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js"></script>
        <xsl:call-template name="InitJS"></xsl:call-template>
       
        <style type="text/css">
        <xsl:if test="not($Print) or $Print=''">
    <xsl:call-template name="AddOnStyle"></xsl:call-template>    
  </xsl:if>
</style>
      <xsl:call-template name="GlobalStylesDep"/>
</head>
    
      <body class="styBodyClass">

        <xsl:call-template name="DocumentHeaderDependency"  />  
        <div class="styDepTitleLine">
          <span class="styDepTitle">
            <span style="width:80mm;"><xsl:value-of select="$depDocTitle" /></span>          
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftover">
        <xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>
        <div style="height:6px;"></div>
        
        <!-- Transform Gasoline Sold Data -->
        <xsl:call-template name="ShowData" />
        
        <br />
      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
