<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>

<xsl:output method="html" indent="yes" />
<xsl:strip-space elements="*" />

  <xsl:param name="DependencyData" select="$RtnDoc/QlfyCoreSecOrIncidlActySch" />

  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" />
    </xsl:call-template>  
  </xsl:param>
  
  <xsl:template name="QlfyCoreSecOrIncidlActyTemp">
    <table id="QlfyCoreSecOrIncidlActyTbl" class="styDepTbl">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
<!--          <th class="styTblCell" scope="col">Item No.</th>       -->
            <th class="styDepTblCell"  scope="col">Corporate Gross Income </th>
           <th class="styDepTblCell"  scope="col">Qualifying Secondary Activites Included in the 20% Limit</th>
           <th class="styDepTblCell"  scope="col">Qualifying Secondary Activities  Exceeding the 20% Limit</th>                  
           <th class="styDepTblCell" scope="col">Qualifying Incidental Activities Included in the 0.1% Limit</th>
           <th class="styDepTblCell" scope="col">Qualifying Incidental Activities Exceeding the 0.1% Limit</th>
        </tr>
      </thead>
      <xsl:for-each select="$DependencyData/QlfyCoreSecOrIncidlActy">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
<!--          <td class="styDepTblCell" style="text-align:center;" >
            <xsl:value-of select="position()" />
          </td> -->
        <td class="styDepTblCell" style="width: 38mm;text-align:right;" >
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="CorporateGrossIncome" />
            </xsl:call-template>
        </td>
        <td class="styDepTblCell" style="width: 38mm; text-align:right" >
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="QlfySecActyIncluded20PctLimit" />
          </xsl:call-template>
        </td>
        <td class="styDepTblCell" style="width: 38mm; text-align:right" >
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="QlfySecActyExceeding20PctLimit" />
          </xsl:call-template>
        </td>
        <td class="styDepTblCell" style="text-align:right; width: 38mm" >
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="QlfyIncdtlActyIncldHalfPctLmt" />
          </xsl:call-template>      
        </td>
        <td class="styDepTblCell" style="width: 38mm;text-align:right" >
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="QlfyIncdtlActyExcHalfPctLimit" />
            </xsl:call-template>
        </td>
        </tr>
      </xsl:for-each>
    </table>
  </xsl:template>  
  
  <!-- Main template -->
  <xsl:template match="/">
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
         <meta name="Author" content="Ku Lee :: kutlee@us.ibm.com" />
          <meta name="Description" content= "{$depDocTitle}" />
         
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
            <span class="styDepTitle">
              <span style="width:150mm;">
                <xsl:value-of select="$depDocTitle" />
              </span>
            </span>
          </div>        
          <xsl:call-template name="PopulateDepCommonLeftover">
          <xsl:with-param  name="TargetNode" select="$DependencyData" />
          </xsl:call-template>
          <xsl:call-template name="QlfyCoreSecOrIncidlActyTemp" />
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







